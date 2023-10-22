# GMS_RC
GMS Public Release Candidate

Purpose:
GMS spawns missions either statically (same place each time) or dynamically.
GMS is derived from blckeagl's mission system that I maintained for many years.
GMS now comes with a 3DEN plugin that allows you to quickly and easily export your missions as .sqf files that you can add to GMS. 

Why switch to GMS?
Over the years I added modules that were useful to me on our servers that made blckeagls complex for others. 
All of these modules have been moved to other addons that are also available on my github. 
GMS now uses a library of optimzed function to spawn mission assets and control asset behaviors.
This is all handled by GMSCore.
GMS organizes handles spawning of missions, mission completion, and configs for AI gear and behavior such as Skill but uses GMSCore to actually manipulate AI. 
Somes scripts from blackeagls were retained in some form but every script has been improved for faster execution. 
All but a few scripts are now compiled in CfgFunctions which should speed execution slightly.
Only scripts needed for dynaically spawning missions remain.


Dependencies:
GMS requires that you load GMSCore on server startup.
GMSCore is available here: https://github.com/Ghostrider-DbD-/GMSCore
GMSCore provides core functions needed for AI spawning, AI waypoint management and other basic functionalities.

How do you add Dynamic Missions?
This github upload includes an Eden Editor plugin. 
The plugin includes a help menu with how-go guides for laying out and exporting missions. 
The plugin is improved over that for blackeagls in that you now specify any vehicles or loot containers as loot objects by setting Attributes in 3DEN. 
To use it, simply ensure it is loaded when you start Arma. You can do this by downloading it to your documents\mods folder, adding it in the mods section of Arma3Launcher and starting Arma. 

What about Static missions or recurring missions at a location.
Just select 'Static' in the mission configurations menu for the plugin. 

Are there any other modules in the GMS series?
Yes- the following modules are available:

GMSAI: provides location-based spawnning of infantry, vehicle, UGV, UAV and air patrols. Spawn points may be either Arma3 map locations or user-defined locations. Support is included for player rewards (crypto, tabs, respect, karma). Vehicles can optionally be claimed.
We have been running this on two severs for about 6 months and I feel it is bug free at present. 
https://github.com/Ghostrider-DbD-/GMSAI

timeacceleration: This is essentially the time acceleartion module from blackeagls repackaged as a stand-alone module. You can set time acceleration for day, night and dusk separately.
https://github.com/Ghostrider-DbD-/-timeManagement

mapaddons: this replaces the mapaddons module of blackeagles. Simply export any map addons you have laid out in the Eden editor and add the resulting file to the appropriate location in the folder structure of mapaddons then add the file name to the list of files called for the mod/map.
https://github.com/Ghostrider-DbD-/mapAddons

Support: I'll do my best to continue to support these modules. 
I monitor epochmod discord 
https://discord.com/channels/133057507928047616/297429261227130881

and our ghostridergaming discord
https://discord.com/channels/330496695982882827/642575445757394954



