/*
	GMS_fnc_spawnMissionHelis
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"
params[
	["_coords",[0,0,0]],
	["_missionHelis",[]],
	["_difficulty","Red"],
	["_uniforms",[]],
	["_headgear",[]],
	["_vests",[]],
	["_backpacks",[]],
	["_weaponList",[]],
	["_sideArms",[]]
];
private _helis = [];
private _units = [];
//diag_log format["_spawnMissionHelis (19): GMS_monitoringInitPass = %3 | count _missionHelis = %1 | _missionHelis = %2",count _missionHelis,_missionHelis, GMS_monitoringInitPass];
{
	_x params["_heli","_relPos","_direction"];
	private _noCrew = [_heli,false] call BIS_fnc_crewCount;
	private _spawnPos = _coords vectorDiff _relPos;	
	#define patrolArea [1000,1000]
	private _crewGroup = [_spawnPos,_noCrew,_difficulty,patrolArea,_uniforms,_headGear,_vests,_backpacks,_weaponList, _sideArms] call GMS_fnc_spawnGroup;
	_crewGroup setVariable["GMS_group",true];
	_units append (units _crewGroup);
	//diag_log format["_spawnMissionHelis(27): _noCrew = %1 | _crewGroup = %2| _heil = %3 | _relPos = %4",_noCrew, _crewGroup, _heli, _relPos];
	#define heliDir 0 
	#define heliHeight 100 
	#define heliRemoveFuel 0.2 	
	#define heliDamage 0.5
	#define vehHitCode [GMS_fnc_vehicleHit] 
	#define vehKilledCode [GMS_fnc_vehicleKilled]								
	private _releaseToPlayers = GMS_allowClaimVehicle;
	// GMSCore_fnc_spawnPatrolAircraft returns the vehicle object spawned (_aircraft)
	/*
		params[
			["_className",""],
			["_group",grpNull],		
			["_pos",[0,0,0]],
			["_dir",0],
			["_height",0],	
			["_disable",0],  // damage value set to this value if less than this value when all crew are dead
			["_removeFuel",0.2],  // uel set to this value when all crew dead
			["_releaseToPlayers",true],
			["_deleteTimer",300],
			["_vehHitCode",[]],
			["_vehKilledCode",[]]
		];	
	*/
	private _aircraft = [_heli,_crewGroup,_spawnPos,_direction,heliHeight,heliDamage,heliRemoveFuel,_releaseToPlayers,GMS_vehicleDeleteTimer,vehHitCode,vehKilledCode] call GMSCore_fnc_spawnPatrolAircraft;
	_helis pushBack _aircraft;
} forEach _missionHelis;
diag_log format["_spawnMissionHelis: GMS_spawnHelisPass = %1 | GMS_monitorTriggered = %2",GMS_spawnHelisPass, GMS_monitorTriggered];
diag_log format["_spawnMissionHelis: GMS_playerIsNear = %1 | GMS_aiKilled = %2", GMS_playerIsNear, GMS_aiKilled];
GMS_spawnHelisPass = GMS_spawnHelisPass + 1;
[_helis,_units]