
/*
	GMS_fnc_findNearestInfantryGroup
	
	by Ghostrider
	 
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
params["_pos"];
private["_units"];

if (GMSCore_modtype isEqualTo "Epoch") then {_units = (nearestObjects[_pos,["I_Soldier_EPOCH"], 1000]) select {vehicle _x isEqualTo _x}};
if !(toLowerANSI(GMSCore_modtype) isEqualTo "epoch") then {_units = (nearestObjects[_pos ,["i_g_soldier_unarmed_f"], 1000]) select {vehicle _x isEqualTo _x}};
private _nearestGroup = group(_units select 0);
_nearestGroup
