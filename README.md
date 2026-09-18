# LeagueLoop Installer

<div align="center">
  <p><strong>Standalone one-click installer for LeagueLoop — the zero-injection League of Legends companion for queue, draft, loot, and session automation.</strong></p>
</div>

---

## Download

Download the latest standalone setup executable:
- [**LeagueLoop_Installer.exe**](./LeagueLoop_Installer.exe) (Version `2-09-256-0545`)

---

## What is LeagueLoop?

**LeagueLoop** is an open-source desktop companion that docks magnetically to the League of Legends client. It eliminates the repetitive friction of getting into games: accepting queues, hovering and locking priority champions, swapping on the ARAM bench, claiming season passes, optimizing network latency, and switching accounts instantly.

### Zero-Injection Safety Invariant
LeagueLoop operates with a strict, non-negotiable architectural boundary:
- **Client-only communication**: Interacts exclusively with Riot's official Local Client API (LCU) via local HTTPS REST (`https://127.0.0.1:{port}`) and WebSocket (`wss://`) event subscriptions derived from client lockfiles.
- **Zero game memory tampering**: Never attaches debuggers, reads game memory, hooks DirectX/Vulkan, injects DLLs, or accesses the live match process (`port 2999`).
- **Out-of-game scope**: All automation strictly halts when the game starts and resumes when the match ends.

---

## Core Capabilities

### 1. Queue & Matchmaking Automation
- **Auto-Accept Ready Checks**: Instantly accepts queue pops with configurable humanization delays to prevent bot profiling.
- **Dynamic Queue Picker**: Reads available, active, and rotating game modes live from the LCU instead of using outdated static lists.
- **Auto-Requeue**: Automatically restarts queue matchmaking after a lobby dodge, declined check, or remake.
- **Auto-Join Friends**: Automatically enters open friend lobbies based on an approved whitelist.

### 2. Champ Select & Draft Assistant
- **Tier-Ranked Priority Picker**: Selects champions based on custom priority lists with per-role overrides (`Top`, `Jungle`, `Mid`, `Bot`, `Support`).
- **Smart Hover & Lock**: Automatically hovers your preferred pick and locks it in; cascades to backup choices if your pick is banned or taken.
- **Intelligent Auto-Ban**: Automatically bans from your ordered blacklist while respecting teammate hovers to prevent grief-banning.
- **ARAM Automation**: Scans the team bench to automatically swap to higher-priority champions the moment teammates drop them, plus auto-reroll.
- **Arena & Randomizer**: Supports Arena synergy pairs and automatically equips random owned skins upon lock-in.

### 3. Season Pass & Loot Engine
- **Season Pass Claimer**: Automatically claims unlocked milestone rewards from Event Hub season passes, Progression Grants, TFT passes, and Ranked Split tracks.
- **Automated Hextech Crafting**: Converts key fragments into completed keys with one click.
- **Planned Loot Opening**: Bulk opens champion capsules, chests, orbs, and masterwork chests with real-time loot logging.

### 4. Account Switcher & Session Vault
- **Zero-Password Session Swapping**: Restores saved Riot Client sessions (`RiotGamesPrivateSettings.yaml`, `RiotClientPrivateSettings.yaml`, and `Cookies/` SSID tokens) directly to bypass modern hCaptcha challenges.
- **Hardware-Tied DPAPI Security**: Stored passwords and credentials are encrypted using Windows Data Protection API (`CryptProtectData`) tied to your Windows user profile.
- **Direct Client Launcher**: Interfaces directly with Riot Client's internal REST API (`/product-launcher/v1/products/league_of_legends/patchlines/live`) to launch the League Client on demand.
- **Wallet & Identity Tracker**: Tracks Blue Essence, RP, level, and Riot ID across multiple accounts.

### 5. System Optimization & Diagnostic Tools
- **Ping & Latency Optimizer**: Tunes MTU to 1428, applies Cloudflare DNS, and enables TCPNoDelay / registry network optimizations for lower game latency.
- **Safe Process Purger**: Closes background telemetry, updaters, and idle Windows bloatware (e.g. smartscreen, PhoneExperienceHost) before entering games.
- **Diagnostic Debug Tracker**: Action logger with paired dual screenshots (Companion UI + League Client) for real-time verification and debugging.
- **Mobile Companion Bridge**: Built-in local HTTP API on port `8337` to accept queue pops and manage champion select remotely from your phone.

---

## Companion UI & Magnetic Docking

- **Magnetic Window Docking**: Automatically locks to the League Client window, moves with it, resizes proportionally, and hides when the client is minimized.
- **Compact "Orb" Mode**: One-click toggle into a minimal floating widget to conserve screen real estate.
- **Custom Modern Theme**: CustomTkinter dark visual language styled with League-inspired hextech gold accents.

---

## Installer Details

- **Standalone Executable**: Built with Inno Setup and PyInstaller — bundles all Python runtimes, dynamic libraries, and assets.
- **Zero Prerequisites**: Runs directly on Windows 10 and 11 without requiring separate Python or git installations.
- **Clean Upgrade Protocol**: Automatically terminates orphaned processes and purges stale runtime log locks during upgrades.

---

## Legal & Disclaimer

LeagueLoop is an unofficial community project. It is not endorsed by, affiliated with, or sponsored by Riot Games, Inc. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc.
Automating client interactions carries inherent risk under Riot's Terms of Service. This software is provided for personal use under the MIT License.

