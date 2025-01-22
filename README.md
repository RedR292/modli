# modli
A mod manager command line interface, ModLI, aims to be a simple and autonomous mod manager that's also easy to understand for anyone, even naive users.
*DISCLAIMER*
Do not use this code in a malicious way.

## Requirements
- Currently only compatible with Linux (built on Ubuntu 24.04 LTS)
- A basic understanding of game modding is recommended.

## Acknowledgement
All third party mods are created by their respective authors, and any third party software used for modli, is not affiliated with modli.

## Abstract
Most (graphical) mod managers tend to abstract and hide the technical process of installing open-source content, which is convenient but is not developer-friendly. That is, it is not obvious what the MM is doing to actually install the mod. Also, MMs introduce the overhead of their own systems, which makes the game system more elaborate and externally reliant. Modli's goals are to make game modification transparent and simplistic without sacrificing simplicity. It is a barebones mod manager that improves usability for non-developer or naive users. 

### Implementation
Modli keeps each managed game's mods and report in $root/Games/$GAME/Mods and $root/Games/$GAME/config. A stage file is added to each managed game, so mods can be added and removed to the stage file before being launched into the game itself. At the most basic level, modli similarly handles mods to the standard for modifying Bethesda games, such as TES or the Fallout series: the contents of each mod are stored in a root "Data" folder and a load order is provided (modli load order under development). I chose to base my schema on Bethesda games because of their simplistic nature and the relatively easy process of modding them; each game's specific mod manager can perform additional operations based on the needs of each game.

### Script Extenders
Some games require a special mod called a Script Extender to be able to run almost any mod, and will not allow any mods to be added to it's stage file before the script extender is set. Script Extenders can only be set once and can only be removed by removing the stage through modli. The user must provide the Script Extender at script installation time as modli does not store script extenders.
