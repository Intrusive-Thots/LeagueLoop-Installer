<div align="center">
  <img src="./assets/app_icon.png" width="120" height="120" alt="LeagueLoop Logo" />
  <h1>LeagueLoop</h1>
  <p><strong>The Zero-Injection League of Legends Companion for Queue, Draft, ARAM, and Session Automation.</strong></p>

  [![Version](https://img.shields.io/badge/version-2--09--261--0317-gold.svg?style=for-the-badge)](https://github.com/Intrusive-Thots/LeagueLoop-Installer)
  [![Platform](https://img.shields.io/badge/platform-Windows%2010%20%7C%2011-0078D6.svg?style=for-the-badge&logo=windows)](https://github.com/Intrusive-Thots/LeagueLoop-Installer)
  [![Anti--Cheat](https://img.shields.io/badge/Anti--Cheat-Safe%20(LCU%20Only)-success.svg?style=for-the-badge&logo=riotgames)](https://github.com/Intrusive-Thots/LeagueLoop-Installer#security--anti-cheat-compliance)
  [![License](https://img.shields.io/badge/license-MIT-emerald.svg?style=for-the-badge)](LICENSE)

  <br/><br/>

  <a href="https://github.com/Intrusive-Thots/LeagueLoop-Installer/raw/main/LeagueLoop_Installer.exe">
    <img src="https://img.shields.io/badge/%E2%AC%87%EF%B8%8F_DOWNLOAD_INSTALLER-v2--09--261--0317-2ea44f?style=for-the-badge&logo=windows&logoColor=white" height="40" alt="Download Installer" />
  </a>
</div>

---

> [!TIP]
> ### ⚡ One-Click Standalone Installer
> **[Download LeagueLoop_Installer.exe](https://github.com/Intrusive-Thots/LeagueLoop-Installer/raw/main/LeagueLoop_Installer.exe)** *(Version `2-09-261-0317` • ~44.8 MB)*  
> Includes pre-populated ARAM Mayhem meta picks, native Windows Taskbar presence, magnetic dock positioning, and automated LCU synchronization.

---

## Visual Showcase

<div align="center">
  <table>
    <tr>
      <td align="center" valign="top" width="25%">
        <strong>Live Companion Dock</strong><br/><br/>
        <img src="./assets/connected.png" height="420" alt="Live Companion Dock" /><br/><br/>
        <sub>Magnetic auto-docking, real-time queue states, and one-click controls.</sub>
      </td>
      <td align="center" valign="top" width="25%">
        <strong>Champ Select Assistant</strong><br/><br/>
        <img src="./assets/champ_select.png" height="420" alt="Champ Select Assistant" /><br/><br/>
        <sub>Role-specific priority hover/lock, auto-ban, and quick dodge.</sub>
      </td>
      <td align="center" valign="top" width="25%">
        <strong>Dynamic Queue Picker</strong><br/><br/>
        <img src="./assets/mode_picker.png" height="420" alt="Dynamic Queue Picker" /><br/><br/>
        <sub>Live game modes queried directly from the League Client runtime.</sub>
      </td>
      <td align="center" valign="top" width="25%">
        <strong>ARAM Priority Drawer</strong><br/><br/>
        <img src="./assets/aram_picker.png" height="420" alt="ARAM Priority Drawer" /><br/><br/>
        <sub>Instant bench sniper, pre-loaded meta list, & Auto-Add Played.</sub>
      </td>
    </tr>
  </table>
</div>

---

## What is LeagueLoop?

**LeagueLoop** is an open-source companion utility engineered to magnetically dock alongside the League of Legends client. It eliminates repetitive pre-game and post-game friction:
- Auto-accepting queue pops with customizable humanized delays
- Sniping your highest-priority champions off the ARAM bench in milliseconds
- Auto-locking your preferred picks and banning counterpicks per role
- Claiming all pending Season Pass, Event Hub, TFT, and Split rewards in one click
- Hot-swapping Riot accounts with zero password prompts and zero hCaptcha stalls

---

## Security & Anti-Cheat Compliance

LeagueLoop operates under a strict **Zero-Injection Architectural Invariant**. It behaves like an automated official client UI, never an in-game cheat.

| Vector | LeagueLoop Architecture | Invasive / Risky Tools |
| :--- | :--- | :--- |
| **API Protocol** | **Official LCU REST & WebSockets** (`127.0.0.1:{port}`) | Live Client Memory / Packet Sniffing |
| **Process Injection** | **Zero DLL injection**, zero memory manipulation | Injects DLLs into `League of Legends.exe` |
| **In-Game Scope** | **Completely inactive during live gameplay** | Overlays drawn on top of DirectX/Vulkan frames |
| **Vanguard Status** | **100% Anti-Cheat Safe** (Standard out-of-game LCU client) | Triggers Vanguard heuristic memory flags |
| **Credentials** | **Hardware-bound Windows DPAPI** (`CryptProtectData`) | Plaintext config files or remote servers |

---

## Feature Highlights

### 🎯 1. Matchmaking & Queue Management
* **Instant Auto-Accept**: Ready-check confirmation with humanized randomization to prevent automated bot profiling.
* **Dynamic Queue Discovery**: Fetches live queue IDs directly from the client—new and rotating game modes appear immediately without application updates.
* **Auto-Requeue**: Seamlessly re-enters matchmaking after lobby dodges, declined ready checks, or remakes.
* **Friend Auto-Join**: Automatically joins open party lobbies for players on your custom whitelist.

### ⚔️ 2. Champ Select & Draft Engine
* **Sub-Second ARAM Bench Sniper**: Continuously watches the team bench and swaps instantly whenever a higher-priority champion is rerolled or swapped by an ally.
* **Pre-Loaded Meta Profiles**: Fresh installations arrive pre-loaded with top-tier ARAM Mayhem champions (*Jinx, Caitlyn, Lux, Ezreal, Yasuo, Teemo, Aurelion Sol, Sett, Bel'Veth, Hecarim*).
* **Auto-Add Played Champions**: Seamless sub-setting inside the ARAM Priority drawer that automatically logs recently played champions to your priority order.
* **Per-Role Priority Matrix**: Independent priority cascades for `Top`, `Jungle`, `Mid`, `Bot`, and `Support`.
* **Teammate-Safe Auto-Ban**: Automatically bans from your ordered blacklist while strictly avoiding champions hovered by your teammates.
* **Emergency Quick Dodge**: Dedicated single-click client disconnect to safely dodge unwinnable lobbies.

### 🎁 3. Hextech & Season Pass Engine
* **Universal Milestone Claimer**: Single-click collection across Event Hub battle passes, TFT active passes, Progression Grants, and Ranked Season Split milestones.
* **Instant Key Forging**: Batch-converts loose key fragments into completed Hextech Keys.
* **Planned Loot Opening**: Rapidly unlocks champion capsules, masterwork chests, and event orbs with live reward logging.

### 🔑 4. Zero-Password Session Vault
* **Direct Session Hot-Swap**: Restores saved Riot Client session tokens (`RiotClientPrivateSettings.yaml` and cookie auth) directly to skip multi-factor and hCaptcha prompts.
* **Hardware-Encrypted Storage**: Master secrets are protected using Windows Data Protection API (DPAPI), locked uniquely to your local Windows user profile.
* **Multi-Account Overview**: Real-time tracking of Blue Essence, Riot Points, summoner level, and ranked tier across all stored accounts.

### ⚡ 5. Network & System Optimizer
* **MTU & Ping Stabilization**: Configures network interface to optimal MTU (`1428`) to eliminate cellular/fiber packet fragmentation, reduces bufferbloat, and lowers game latency.
* **Background Process Purger**: Gracefully closes background updaters and telemetry bloatware before starting matches.
* **Action & Screenshot Logger**: In-depth diagnostic logging with paired dual-screen captures for transparent troubleshooting.

---

## Quick Start (Under 2 Minutes)

1. **Download**: Grab [`LeagueLoop_Installer.exe`](https://github.com/Intrusive-Thots/LeagueLoop-Installer/raw/main/LeagueLoop_Installer.exe).
2. **Install**: Run the installer and create a Desktop shortcut (runs unelevated, no administrative rights required for regular operation).
3. **Launch**: Open League of Legends. LeagueLoop will automatically detect the client, hook to the local LCU socket, and magnetically dock to your client's right border.

---

## Frequently Asked Questions

<details>
<summary><strong>Can this get my League account banned?</strong></summary>
<br/>
No. LeagueLoop uses the exact same local LCU REST and WebSocket API that Riot's own client interface uses, as well as community tools like Blitz, Porofessor, and Mobalytics. It never hooks DirectX, injects code, or touches live game memory.
</details>

<details>
<summary><strong>Where are my settings and accounts stored?</strong></summary>
<br/>
All local configurations, champion priority lists, and encrypted account tokens reside securely in:
<code>%LOCALAPPDATA%\LeagueLoop\</code>
</details>

<details>
<summary><strong>How does the window docking work?</strong></summary>
<br/>
LeagueLoop monitors the Windows HWND coordinates of your League Client window and snaps directly to its right edge. When you move the client, LeagueLoop follows automatically. When the client is minimized or in a live match, LeagueLoop remains accessible from your Windows Taskbar or system tray.
</details>

---

## Disclaimer

LeagueLoop is a community-driven open-source utility and is not affiliated with, endorsed by, or sponsored by Riot Games, Inc. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc.

Distributed under the [MIT License](LICENSE).
