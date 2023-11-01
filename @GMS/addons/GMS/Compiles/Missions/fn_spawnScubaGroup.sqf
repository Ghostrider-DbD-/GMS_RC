/*
	by Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#define configureWaypoints true
#define isScubaGroup true
#define UMS_backpacks [] 
#define UMS_sidearms [] 
#define scubaPatrolAreaDimensions [25,25]
params["_group","_pos",["_skillLevel","red"],["_numUnits",6],["_patrolRadius",15]];
// private _group = [_pos,_numberAI,_difficulty,configureWaypoints,GMS_UMS_uniforms,GMS_UMS_headgear,GMS_UMS_vests,[],GMS_UMS_weapons,_sideArms,true] call GMS_fnc_spawnGroup;

private _group = [_pos,_numUnits,_skillLevel, scubaPatrolAreaDimensions, GMS_UMS_uniforms, GMS_UMS_headgear, GMS_UMS_vests, [], GMS_UMS_weapons, [], isScubaGroup,GMS_waypointTimeoutInfantry] call GMS_fnc_spawnGroup;



