# Build LeagueLoop_Installer.exe from the pinned LeagueLoop.DEV checkout.
# Requires Windows, Python 3.11, and the dependencies in deps/requirements.txt.
# Usage (from the installer repo root, after the app checkout exists at .\app):
#   py -3.11 -m pip install -r deps/requirements.txt
#   powershell -ExecutionPolicy Bypass -File scripts/build-installer.ps1

$ErrorActionPreference = "Stop"
if (Get-Variable -Name PSNativeCommandUseErrorActionPreference -ErrorAction SilentlyContinue) {
    $PSNativeCommandUseErrorActionPreference = $false
}

$Root = Resolve-Path (Join-Path $PSScriptRoot "..")
$PinPath = Join-Path $Root "app-source.env"
$AppDir = Join-Path $Root "app"

function Read-Pin {
    param([string]$Path)
    $pin = @{}
    foreach ($line in Get-Content -Path $Path) {
        if ($line -match '^\s*#' -or $line -match '^\s*$') { continue }
        $parts = $line -split '=', 2
        if ($parts.Count -ne 2) { throw "Invalid pin line: $line" }
        $pin[$parts[0].Trim()] = $parts[1].Trim()
    }
    foreach ($key in @("APP_REPOSITORY", "APP_REF", "APP_VERSION", "PYTHON_VERSION", "INNO_SETUP_VERSION")) {
        if (-not $pin.ContainsKey($key) -or [string]::IsNullOrWhiteSpace($pin[$key])) {
            throw "Missing $key in $Path"
        }
    }
    return $pin
}

function Get-NormalizedHash {
    param([string]$Path)
    $text = [System.IO.File]::ReadAllText($Path)
    $text = $text -replace "`r`n", "`n" -replace "`r", "`n"
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($text)
    $sha = [System.Security.Cryptography.SHA256]::Create()
    try {
        return ([System.BitConverter]::ToString($sha.ComputeHash($bytes))).Replace("-", "").ToLower()
    } finally {
        $sha.Dispose()
    }
}

function Install-InnoSetup {
    param([string]$Version)
    $installer = Join-Path $env:TEMP "innosetup-$Version.exe"
    $tag = "is-" + ($Version -replace '\.', '_')
    $url = "https://github.com/jrsoftware/issrc/releases/download/$tag/innosetup-$Version.exe"
    Write-Host "Downloading Inno Setup $Version"
    Invoke-WebRequest -Uri $url -OutFile $installer
    $dest = "C:\InnoSetup"
    $proc = Start-Process -FilePath $installer -ArgumentList @(
        "/VERYSILENT",
        "/SUPPRESSMSGBOXES",
        "/NORESTART",
        "/SP-",
        "/DIR=$dest"
    ) -Wait -PassThru
    if ($proc.ExitCode -ne 0) {
        throw "Inno Setup installer exited with code $($proc.ExitCode)"
    }
    $candidates = @(
        (Join-Path $dest "ISCC.exe"),
        "${env:ProgramFiles(x86)}\Inno Setup 6\ISCC.exe",
        "${env:ProgramFiles}\Inno Setup 6\ISCC.exe"
    )
    foreach ($candidate in $candidates) {
        if (Test-Path $candidate) { return $candidate }
    }
    throw "ISCC.exe was not found after installing Inno Setup $Version"
}

function Find-Iscc {
    param([string]$Version)
    $existing = @(
        "C:\InnoSetup\ISCC.exe",
        "${env:ProgramFiles(x86)}\Inno Setup 6\ISCC.exe",
        "${env:ProgramFiles}\Inno Setup 6\ISCC.exe"
    )
    foreach ($candidate in $existing) {
        if (Test-Path $candidate) { return $candidate }
    }
    $cmd = Get-Command ISCC.exe -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    return Install-InnoSetup -Version $Version
}

$pin = Read-Pin -Path $PinPath
$versionFile = Join-Path $AppDir "src\core\version.py"
if (-not (Test-Path $versionFile)) {
    throw "App checkout is missing at $AppDir. Clone $($pin.APP_REPOSITORY) @ $($pin.APP_REF) into app/ before building."
}

$versionLine = Select-String -Path $versionFile -Pattern '__version__\s*=' | Select-Object -First 1
if (-not $versionLine -or $versionLine.Line -notmatch [regex]::Escape($pin.APP_VERSION)) {
    throw "src/core/version.py does not match pinned APP_VERSION $($pin.APP_VERSION). Found: $($versionLine.Line)"
}

$vendoredReq = Join-Path $Root "deps\requirements.txt"
$appReq = Join-Path $AppDir "config\requirements.txt"
if ((Get-NormalizedHash $vendoredReq) -ne (Get-NormalizedHash $appReq)) {
    throw "deps/requirements.txt does not match $AppDir\config\requirements.txt. Refresh the vendored dependency list from the pinned app commit."
}

$vendoredIss = Join-Path $Root "installer\LeagueLoop.iss"
$appIss = Join-Path $AppDir "installer.iss"
if ((Get-NormalizedHash $vendoredIss) -ne (Get-NormalizedHash $appIss)) {
    throw "installer/LeagueLoop.iss does not match $AppDir\installer.iss. Refresh the vendored Inno Setup script from the pinned app commit."
}

if ($vendoredIss -ne $appIss) {
    Copy-Item -Path $vendoredIss -Destination $appIss -Force
}

Write-Host "Building LeagueLoop $($pin.APP_VERSION) from $($pin.APP_REPOSITORY)@$($pin.APP_REF)"

Push-Location $AppDir
try {
    if (Test-Path "build") { Remove-Item -Recurse -Force "build" }
    if (Test-Path "dist\LeagueLoop") { Remove-Item -Recurse -Force "dist\LeagueLoop" }
    if (Test-Path "dist\LeagueLoop_Installer.exe") { Remove-Item -Force "dist\LeagueLoop_Installer.exe" }

    & python -m PyInstaller --clean -y LeagueLoop.spec
    if ($LASTEXITCODE -ne 0) { throw "PyInstaller exited with code $LASTEXITCODE" }
    if (-not (Test-Path "dist\LeagueLoop\LeagueLoop.exe")) {
        throw "PyInstaller did not produce dist\LeagueLoop\LeagueLoop.exe"
    }

    $iscc = Find-Iscc -Version $pin.INNO_SETUP_VERSION
    Write-Host "Using Inno Setup compiler: $iscc"
    & $iscc "installer.iss"
    if ($LASTEXITCODE -ne 0) { throw "ISCC exited with code $LASTEXITCODE" }
} finally {
    Pop-Location
}

$installer = Join-Path $AppDir "dist\LeagueLoop_Installer.exe"
if (-not (Test-Path $installer)) {
    throw "Installer was not created at $installer"
}

$bytes = [System.IO.File]::ReadAllBytes($installer)
if ($bytes.Length -lt 2 -or $bytes[0] -ne 0x4D -or $bytes[1] -ne 0x5A) {
    throw "Installer is not a Windows PE executable"
}
$unicode = [System.Text.Encoding]::Unicode.GetString($bytes)
if ($unicode -notlike "*$($pin.APP_VERSION)*") {
    throw "Installer does not embed app version $($pin.APP_VERSION)"
}

$hash = (Get-FileHash -Path $installer -Algorithm SHA256).Hash.ToLower()
$sizeMb = [math]::Round((Get-Item $installer).Length / 1MB, 2)
Write-Host "Installer: $installer"
Write-Host "Size MB: $sizeMb"
Write-Host "SHA256: $hash"
