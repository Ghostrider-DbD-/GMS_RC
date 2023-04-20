/*
	GMS_fnc_spawnParaUnits 

	Author: Ghostrider [GRG]
	Inspiration: blckeagls / A3EAI / VEMF / IgiLoad / SDROP
	License: Attribution-NonCommercial-ShareAlike 4.0 International

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
	--------------------------
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
//  Acomodate case where para are spawned over water.
params["_pos","_numAI","_skilllevel",["_uniforms",[]],["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weapons",[]],["_sideArms",[]],["_isScuba",false]];
if (_numAI < 1) exitWith {grpNull};
#define offMap [0,0,0]
#define patrolAreadDimensions [50,50]
private _paraGroup = [offMap,_numAI,_skilllevel,patrolAreadDimensions,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScuba] call GMS_fnc_spawnGroup;
if !(isNull _paraGroup) then 
{
	[_paraGroup,_pos] call GMSCore_fnc_dropParatroops;
	GMS_monitoredMissionAIGroups pushback _paraGroup;
};
[format["GMS_fnc_spawnParaUnits: _paragroup = %1",_paraGroup]] call GMS_fnc_log;
_paraGroup
