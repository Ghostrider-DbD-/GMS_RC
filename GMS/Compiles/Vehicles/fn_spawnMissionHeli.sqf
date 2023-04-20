/*

	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
private["_chopperType","_patrolHeli","_launcherType","_unitPilot","_unitCrew","_mags","_turret","_return","_abort","_supplyHeli","_minDist","_maxDist"];
[format["GMS_fnc_spawnMissionHeli: _this = %1",_this]] call GMS_fnc_log;
params["_coords","_skillAI","_helis",["_uniforms",[]], ["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weaponList",[]],["_sideArms",[]],["_Launcher","none"],["_crewCount",4]];

#define heliPatrolAreaDimensions [800,800]
private _grpPilot = [_coords,_crewCount,_skillAI,heliPatrolAreaDimensions,_uniforms,_headgear,_vests,_backpacks,_weaponList,_sideArms,false] call GMS_fnc_spawnGroup;
_abort = if (isNull _grpPilot) then{true} else {false};
if !(isNull _grpPilot)  then
{

	_grpPilot setBehaviour "SAFE";
	_grpPilot setCombatMode "RED";
	_grpPilot setSpeedMode "NORMAL";
	_grpPilot allowFleeing 0;
	_grpPilot setVariable["patrolCenter",_coords];
	_grpPilot setVariable["minDis",_minDist];
	_grpPilot setVariable["maxDis",_maxDist];
	_grpPilot setVariable["timeStamp",diag_tickTime];
	_grpPilot setVariable["arc",0];
	_grpPilot setVariable["wpRadius",0];
	_grpPilot setVariable["wpMode","SAD"];

	#define aircraftPatrolRadius 800
	#define aircraftWaypointTimeout [1,1.5,2]

	//[_coords,_minDist,_maxDist,_grpPilot,"random","SAD","aircraft",aircraftPatrolRadius,aircraftWaypointTimeout] call GMS_fnc_setupWaypoints;

	GMS_monitoredMissionAIGroups pushBack _grpPilot;

	//create helicopter and spawn it
	if ((_helis) isEqualType []) then 
	{
		_chopperType = selectRandom _helis
	} else {
		_chopperType = _helis
	};

	_patrolHeli = [_chopperType,_coords,"FLY"] call GMS_fnc_spawnVehicle;
	[_patrolHeli,2] call GMS_fnc_configureMissionVehicle;
	_patrolHeli setVariable["GMS_vehicleSearchRadius",GMS_playerDetectionRangeAir];
	_patrolHeli setVariable["GMS_vehiclePlayerDetectionOdds",GMS_vehiclePlayerDetectionOdds];
	_patrolHeli setFuel 1;
	_patrolHeli engineOn true;
	_patrolHeli flyInHeight 100;
	[_patrolHeli,_grpPilot,_crewCount] call GMS_fnc_loadVehicleCrew;
	GMS_aircraftPatrols pushBack _patrolHeli;
};
[format["GMS_fnc_spawnMissionHeli: _patrolHeli = %1 | _grpPilot = %2",_patrolHeli,_grpPilot]] call GMS_fnc_log;
[_patrolHeli,_grpPilot,_abort];

