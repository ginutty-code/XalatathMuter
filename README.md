# Xal'atath Muter

A small World of Warcraft addon that mutes Xal'atath's whisper voice lines (and any other sound file IDs you add) via the client's sound-file mute API.

## Install

**Option A — GitHub**

1. Download or clone this repo into your WoW `AddOns` folder:
   ```
   git clone https://github.com/ginutty-code/XalatathMuter.git
   ```
   It should end up at `Interface/AddOns/Xal'atathMuter/`.
2. Restart WoW or reload your UI (`/reload`).

**Option B — CurseForge**

Install via the CurseForge app or website.

## Usage

| Command | Effect |
|---|---|
| `/xm on` | Enable muting |
| `/xm off` | Disable muting |
| `/xm add <id>` | Add a sound file data ID to the mute list |
| `/xm remove <id>` | Remove a sound file data ID from the mute list |
| `/xm list` | List all managed sound file IDs |
| `/xm reset` | Reset the list to the built-in defaults |

Your on/off state and any custom additions/removals persist across sessions via `XalatathMuterDB`.

## Finding sound file IDs

Sound file data IDs can be looked up on [wago.tools](https://wago.tools/db2/SoundKitEntry) or similar community DB2 explorers. Another good source is [Wowhead's sound database](https://www.wowhead.com/sounds).
