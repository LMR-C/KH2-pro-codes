# Pro codes For KH2FM

## Overview
This mods aims to recreate the pro codes feature from KH3. As certain codes are not reproductible in KH2 this mod can be seen as an adaptation.
The mod make the game really hard and I don't really know if it is possible to beat. I let super players give us the answer !
The mod has not been fully tested so you may encounters some bugs. You can report me those on [Discord](https://discord.gg/eXX8pM8pj9)
You'll find next to this the codes list and some quality of life features.

## Compatibility
Pro codes works on both PC (Epic/Steam) and PCSX2-EX and are fully compatible with the KH2 randomnizer ! Just place the 3 parts of the mod above your seed (don't forget to place forms levels on vanilla or junk during seed creation)
I didn't test it with other mods but it should be compatible with any mod that don't modify the memory addresses in the game's memory.

## Installation
To be able to toggle every pro code this mod come in 3 parts. Open your openKH mod manager and go to ``>Mods > Install a new mod``
and type : ``LMR-C/KH2-pro-codes`` and press ``Install``. Repeat this step with ``LMR-C/KH2-pro-codes-no-rc`` and ``LMR-C/KH2-pro-codes-no-mickey``. Then activate the mods and you're ready to go.  
**For PCSX2-EX:** For the mod to work, in the emulator go to ``>Config > Plugin/BIOS selector`` and in the ``folders``section, uncheck "use default setting" for the scripts, then click on browse, and browse to your openKH ``/mod/kh2/script`` folder. As an exemple : ``D:\openkh\mod\kh2\scripts``. Aslo in PCSX2-EX check thoses two settings:
- ``>System > Enable Cheats``
- ``>System > Enable Lua Engine``

If you skip this step, all mods relying on lua script will not work.

## Pro codes list
- **Default status** : Your whole teams's stats are returned to their initial default status, regardless of level
- **Hp slip** : During battle, your whole team's HP automatically decrease over time until it reaches dangerous levels
- **Zero defense**: Your whole team's defense is set to 0. However, defense boost from equipment are still applied
- **MP slip** : During battle, your whole team's MP automatically decrease over time, and MP recharge is doubled
- **No battle items**: during battle, your whole team cannot use items
- **No summon** : You cannot use summon
- **No form** : you cannot use forms
- **No cure** : your whole team cannot use cure magic
- **No team attacks** : You cannot use limits
- **Ability limit** : A maximum limit of 30 is placed on abilities you can install on sora
- **No mickey** : Mickey no more come to your rescue
- **No reaction command** : most of reaction commands do not appear

## How to toggle pro codes ?
You can enabled/disable most of pro codes in game with input combination. Once you performed one a log is printed in the console to notify you the state of the code.
Please hold buttons for 1 second to make it work correctly
To see the console:
- **PC** : Press ``F2``
- **PCSX2-EX** : (if the console doesn't show up) ``Misc > Show Console``
The input combinations are different because the PS2 an PC version manage the inputs differently

### Button combinations

| Pro code | PS2 combination | PC combination (based on PS controllers) |
|:---|:---:|---:|
| Default status | L3 + ✕ | R3 + ✕|
| Hp slip | L3 + △| R3 + △ |
| Zero defense | L3 + ◯ | R3 + ◯ |
| MP slip | L3 + ▢ | R3 + ▢ |
| No battle items | L3 + R1 | R3 + R1 |
| No summon | L3 + L2 | R3 + L2 |
| No form | L3 + L1 | R3 + L1 |
| No cure | L3 + R2 | R3 + R2 |
| No team attacks | L3 + R3 + △ | L2 + R2 + R3 + ✕ |
| Ability limit | L3 + R3 + ◯ | L2 + R2 + R3 + ▢ |
| No mickey | Disable the mod and rebuild and run the game | Disable the mod and rebuild and run the game but in future version the code could be: L2 + R2 + R3 + △ |
| No reaction command | Disable the mod and rebuild and run the game and when you're in game press: L3 + R3 + ▢ | Disable the mod and rebuild and run the game and when you're in game press: L2 + R2 + R3 + ◯ |

## Quality of life
You can see how many abilities you enabled for sora, because if you play with ability limit you need to stay below 30.  
- **Ability equiped** : 
    - **PC :**  ``R2 + L2 + R3 + R1`` (displayed in the console, press ``F2`` to show it) 
    - **PS2 :** ``R3 + L1`` (displayed in the console, ``Misc > Show Console`` to show it)



## Troubleshootings
The mod has not been tested that much but you should not encounters too much problems. Nevertheless if you see a bug please report it [here](https://discord.gg/eXX8pM8pj9)

### Known issues
- **Ability limit** : You can enable as much ability as you want but once you get out of the menu the mod will disable any ability after the 30th enabled (in the game memory order) so keep an eye on your number of equiped abilities with ``R3 + L1``
- **No cure** : For randomnizer : no cure toggling works as intended only for the first save file. It won't works if you reboot the game and load a save. And if you changed of savefile during a playthrought you'll get back only the cure you earn in the first one.
- **no reaction command** : seem to not work with HT armored knight and HB hook bat while playing with randomnizer
