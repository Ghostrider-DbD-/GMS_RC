# GMS_RC
GMS Public Release Candidate

Purpose:
GMS spawns missions dynamically and is derived from blckeagls mission system that I maintained for many years.

Why switch to GMS?
Over the years I added modules that were useful to me on our servers that made blckeagls complex for others. GMS is a stripped down rebuild of GMS. Every script has been improved for faster execution. Only scripts needed for dynaically spawning missions remain. As far as I know, the many bugs that plagued blckeagls were sorted and GMS is a stable and hardy mission system.

Dependencies:
GMS requires that you load GMSCore on server startup.
GMSCore is available here: https://github.com/Ghostrider-DbD-/GMSCore
GMSCore provides core functions needed for AI spawning, AI waypoint management and other basic functionalities.

How do you add Dynamic Missions?
This github upload includes the Eden Editor plugin originally written for blckeagls. To use it, simply ensure it is loaded when you start Arma. You can do this by downloading it to your documents\mods folder, adding it in the mods section of Arma3Launcher and starting Arma. Once this is done, lay out your mission in the Eden Editor, export the layed out mission using the commands in the plugin, and past the output into your favorite script editor. Save the mission script as a blue, red, green or orange mission in the appropriate folder and add the name of the file to the list of missions in GMS_MIssionlist.sqf. That's it, you are done!

What about Static missions or recurring missions at a location.
Just specify the coordinate(s) at which the mission should spawn. THe mission spawner will always spawn the mission at that exact location.

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



