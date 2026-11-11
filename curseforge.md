# Xal'atath Muter

A tiny addon that mutes a curated list of annoying or repetitive Xal'atath sound file IDs the moment you log in.

## Features

- Automatically mutes chosen default Xal'atath sound IDs
- Lets you add or remove any sound file ID
- Toggle muting on/off at any time
- Lightweight - no UI, no performance impact
- Persists your custom list between sessions

## Slash Commands

Use /xm to control the addon:

- /xm on - Enable muting
- /xm off - Disable muting
- /xm add <id> - Add a sound file ID to mute
- /xm remove <id> - Remove an ID from the mute list
- /xm list - Print all managed sound IDs
- /xm reset - Restore the default muted list

## Saved Variables

The addon stores your muted IDs in:
XalatathMuterDB.sounds

## Changelog

### 1.0.4

- Updated supported interface versions to 12.0.5 and 12.0.7
