<div align="center">
  <img src="app.png" alt="LeagueLoop" width="96"/>
  <h1>LeagueLoop</h1>
  <p><strong>The Ultimate Automation Companion for League of Legends</strong></p>

  <br/>

  <a href="LeagueLoop_Installer.exe"><strong>⬇ Download LeagueLoop_Installer.exe</strong></a>

  <br/><br/>

  <img src="https://img.shields.io/badge/platform-Windows%2010%2F11-blue?style=flat-square" alt="Platform"/>
  <img src="https://img.shields.io/badge/engine-LCU%20API-green?style=flat-square" alt="Engine"/>
  <img src="https://img.shields.io/badge/license-Riot%20Policy-orange?style=flat-square" alt="License"/>

</div>

---

## Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center"><img src="screenshots/lobby_idle.png" alt="Lobby — Idle" width="220"/><br/><sub>Lobby — Idle</sub></td>
      <td align="center"><img src="screenshots/connected.png" alt="Connected" width="220"/><br/><sub>Connected &amp; Ready</sub></td>
    </tr>
    <tr>
      <td align="center"><img src="screenshots/champ_select.png" alt="Champ Select" width="220"/><br/><sub>Champ Select — Live Drafting</sub></td>
      <td align="center"><img src="screenshots/mode_picker.png" alt="Mode Picker" width="220"/><br/><sub>Queue Mode Selector</sub></td>
    </tr>
  </table>
</div>

---

## Quick Start

1. Download **`LeagueLoop_Installer.exe`** from this repository.
2. Run the installer — it will place LeagueLoop into `C:\Program Files\LeagueLoop`.
3. Launch **LeagueLoop** and it will dock to your League Client automatically.
4. *(Optional)* Customize hotkeys and toggles from the built-in Settings panel.

---

## What Does LeagueLoop Do?

LeagueLoop is an autonomous overlay companion that talks directly to the League Client (LCU API) in real-time. It automates every repetitive lobby workflow — from accepting queue pops to locking champions — so you never have to.

### 🎮 Automation Engine

| Feature | Description |
|---------|-------------|
| **Auto-Accept** | Instantly accepts ready checks with configurable human-like delay randomization. |
| **Priority Sniper** | ARAM mode — automatically swaps bench champions to lock your top picks from a drag-and-drop priority list. |
| **Draft Assistant** | Ranked/Draft — auto-hovers your preferred pick and ban per assigned role. Includes a teammate respect algorithm that avoids banning hovered champions. |
| **Arena Synergy Picker** | Arena mode — reads your teammate's pick/intent and auto-selects your configured synergy partner. Supports unlimited champion pairs with per-pair toggles, auto-ban, auto-lock, and a "Bravery" random mode. |
| **Auto-Honor** | Algorithmically honors friends or top-performers at end-of-game via LCU APIs. |
| **Dodge Requeue** | Detects teammate dodges and automatically restarts matchmaking. |
| **Auto-Skin Equip** | Randomly selects an owned skin for your champion each game. |
| **Auto-Runes** | Equips recommended rune pages for your champion and role. |
| **Blacklist Dodging** | Instantly dodges lobbies containing players on your personal blacklist. |
| **Chat Warden** | Monitors champ select chat for toxicity keywords and alerts you with a toast notification. |

### 🖥️ Overlay UI

| Feature | Description |
|---------|-------------|
| **Dynamic Friend List** | Live-synced friends with glowing online indicators, profile icons, and one-click Auto-Join lobby injection. |
| **Mass Invite** | Send lobby invites to your entire friend priority list with one button. |
| **Custom Status** | Set a persistent custom status message on your League profile directly from LeagueLoop. |
| **Queue Mode Picker** | Switch between Quickplay, Draft, Ranked Solo/Duo, Ranked Flex, ARAM, Arena, and more without touching the League Client. |
| **Compact Orb Mode** | Shrinks LeagueLoop into a glowing, draggable mini-orb that floats above your game via Win32 OS-level window hooks. Toggle with `Ctrl+Shift+M`. |
| **System Tray** | Minimizes to the system tray with quick-access context menu. |

### ⚡ Architecture

- **Event-Driven** — Real-time WebSocket subscriptions to the LCU for zero-latency state tracking. No polling lag, no missed queue pops.
- **Thread-Safe** — Background automation engine runs on a dedicated thread with killswitch protection (auto-pauses after 5 consecutive errors in 10 seconds).
- **Self-Healing** — Automatically reconnects to the League Client if the connection drops mid-session.
- **Game Process Tracking** — Independently monitors `League of Legends.exe` to maintain accurate phase awareness even when the LCU API is temporarily unavailable.
- **Discord Rich Presence** — Shows your current game phase and queue mode in Discord.

### ⌨️ Hotkeys

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+L` | Launch Riot Client |
| `Ctrl+Shift+A` | Toggle Automation On/Off |
| `Ctrl+Shift+F` | Find Match (Start Queue) |
| `Ctrl+Shift+M` | Toggle Compact Orb Mode |

All hotkeys are fully rebindable from the Settings panel.

---

## Requirements

- Windows 10 / 11
- League of Legends installed (Riot Client)

---



---

## Disclaimer

> LeagueLoop was created under Riot Games' policy using assets owned by Riot Games. Riot Games does not endorse or sponsor this project. The creator is **NOT** liable for any account suspensions, system issues, or penalties incurred while using this software. Using LCU automation is done entirely at your own risk.

---

<div align="center">
  <sub>Made by Malcolm</sub>
</div>
