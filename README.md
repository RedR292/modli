# modli
A MOD manager command line interface for LInux, modli, aims to be a simple and autonomous mod manager that's also easy to understand for anyone, even naive users.
*DISCLAIMER*
Do not use this code in a malicious way.

## Requirements
- Currently only compatible with Linux
- Used with Valve's Proton middleware (https://github.com/ValveSoftware/Proton)
- A basic understanding of game modding is recommended.

## Acknowledgement
All third party mods are created by their respective authors and any third party software used for modli is not affiliated with modli.

# Abstract
Most (graphical) mod managers tend to abstract and hide the technical process of installing open-source content, which is convenient but not developer-friendly. That is, it is not obvious what the MM is doing to actually install the mod. Also, MMs introduce the overhead of their own systems, which makes the game system more elaborate and externally reliant. Modli's goals are to make game modification transparent and simplistic without compromising technical involvement. It is a barebones mod manager that improves usability for non-developer or naive users and to act as a springboard into software development 

#Script Functions branch
To make script writing easier for users, a library for formatting, installing, checking, etc will be provided. These functions should provide complete functionality to the common operations such as installing mods, mod validation, installing multiple mods at once, handling outstanding install cases such as most script extenders, and more. 
