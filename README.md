# modli
A mod manager command line interface, ModLI, aims to be a simple and autonomous mod manager that's also easy to understand for anyone, even naive users.
*DISCLAIMER*
Do not use this code in a malicious way.

## Requirements
- Built on Ubuntu 24.04 LTS
- Mods must be saved in 7z archives and kept as simple as possible. E.x: Fallout 4 mods (almost) all have a single Data folder
- Script extenders are to be configured at a game level. That is, with every chosen game.
- Mods and stage files are stored in the game directory at $GAMEPATH/Mods and $GAMEPATH/mods.stage respectively

## Definitions
- GAMEPATH: Where the game is stored
- GAME: App id of selected game.
- FILE|MOD: Optional mod that can be passed
- ENGINE: The actual mod manager that can be specified for each game or system.
- MODPATH: $GAMEPATH/Mods

## Usage
modli [OPTIONS][GAME][FILE]
Options:
- -l -- List all the mods stored in $MODPATH
- -c MOD -- checks if $mod is installed to $GAMEPATH/mods.stage. If no $MOD is specified, then list all installed mods
- -i MOD -- installs $mod to $GAMEPATH/mods.stage
- -u MOD -- removes mod files from game and removes $mod from $GAMEPATH/mods.stage
- -I -- 'launches' the stage file which copies over all the files according to the engine.
- -R -- Removes the stage file from the game according to the engine
