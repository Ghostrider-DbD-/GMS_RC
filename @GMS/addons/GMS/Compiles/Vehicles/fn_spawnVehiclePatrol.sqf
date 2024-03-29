/*
	GMS_fnc_spawnVehiclePatrol

	By Ghostrider [GRG]
	Copyright 2016
	
	spawns a vehicle of _vehType and mans it with units in _group.
	returns _veh, the vehicle spawned.
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

params["_center","_pos",["_vehType","I_G_Offroad_01_armed_F"],["_minDis",40],["_maxDis",60],["_group",grpNull],["_setWaypoints",true],["_crewCount",4],["_patrolRadius",150],["_waypointTimeout",[5,7.5,10]]];

if (_group isEqualTo grpNull) exitWith 
 {
	diag_log format["_fnc_spawnVehiclePatrol(30): <ERROR> Function can not accept a null group"];
};

private _veh = objNull;

_veh = [_vehType,_pos] call GMS_fnc_spawnVehicle;

_veh setVariable["GMS_vehicleSearchRadius",GMS_playerDetectionRangeGroundVehicle];
_veh setVariable["GMS_vehiclePlayerDetectionOdds",GMS_vehiclePlayerDetectionOdds];
private _maxCrew = [_crewCount] call GMSS_fnc_getNumberFromRange;
[_veh,_group,_maxCrew] call GMS_fnc_loadVehicleCrew;

[_veh,2] call GMS_fnc_configureMissionVehicle;
// TODO: Use GMS_fnc waypoint initiation
if (_setWaypoints) then
{
	[_center,_minDis,_maxDis,_group,"perimeter","SAD","vehicle",_patrolRadius,_waypointTimeout] spawn GMS_fnc_setupWaypoints;
};

_veh


