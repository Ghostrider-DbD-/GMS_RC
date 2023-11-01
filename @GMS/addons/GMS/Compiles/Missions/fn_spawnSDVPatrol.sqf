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

params["_SDV","_pos","_difficulty","_numberAI","_patrolRadius","_respawnTime"];
#define SDVpatrolAreadDimensions [50,50]
//  params[["_pos",[0,0,0]], ["_numbertospawn",0], ["_skillLevel","red"], ["_configureWaypoints",true], ["_uniforms",[]], ["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weaponList",[]],["_sideArms",[]], ["_scuba",false]];
private _backpacks = [];
private _sidearms = [];
private _group = [_pos,_numberAI,_difficulty,SDVpatrolAreadDimensions,GMS_UMS_uniforms,GMS_UMS_headgear,GMS_UMS_vests, _backpacks,GMS_UMS_weapons,_sidearms,true] call GMS_fnc_spawnGroup;
private _vehicle = [[_pos select 0, _pos select 1,0],[_pos select 0, _pos select 1,0],_vehType,_patrolRadius - 2,_patrolRadius,_group] call GMS_fnc_spawnVehiclePatrol;
private _diveDepth = 0.5 * ([_pos] call GMS_fnc_findWaterDepth);
(driver _vehicle) swiminDepth (_diveDepth select 2);

_group
