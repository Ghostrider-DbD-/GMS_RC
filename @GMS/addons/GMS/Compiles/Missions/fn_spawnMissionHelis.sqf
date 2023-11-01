/*
	GMS_fnc_spawnMissionHelis
*/

#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
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
	[format["_spawnMissionHelis: _heli = %1 | _relPos = %2 | _direction =  %3 | isClass",_heli,_relPos,_direction, isClass(configFile >> "CfgVehicles" >> _heli)]] call GMS_fnc_log;
	if (isClass(configFile >> "CfgVehicles" >> _heli)) then {
		private _noCrew = [_heli,false] call BIS_fnc_crewCount;
		private _spawnPos = _coords vectorAdd _relPos;	
		#define patrolArea [500,500]
		/* parameters for call GMS_fnc_spawnGroup;
			params[
				["_pos",[-1,-1,1]], 
				["_numbertospawn",0], 
				["_skillLevel","red"], 
				["_areaDimensions",[]], 
				["_uniforms",[]], 
				["_headGear",[]],
				["_vests",[]],
				["_backpacks",[]],
				["_weaponList",[]],
				["_sideArms",[]], 
				["_scuba",false]
			];
		*/
		#define isScuba false
		private _crewGroup = [_spawnPos,_noCrew,_difficulty,patrolArea,_uniforms,_headGear,_vests,_backpacks,_weaponList, _sideArms,isScuba,GMS_waypointTimeoutAir,"Air"] call GMS_fnc_spawnGroup;
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
		[_crewGroup] call GMSCore_fnc_updateWaypointConfigs; // apply any settings related to hunting or searching based on vehicle type
		private _movetoPos = [[[_spawnPos, patrolArea]],[]/* add condition that the spawn is not near a trader*/] call BIS_fnc_randomPos;
		(driver _aircraft) moveTo _movetoPos;
		(driver _aircraft) call GMSCore_fnc_nextWaypointAreaPatrol;		
		/*
		[
			_crewGroup,
			[],
			[_spawnPos, patrolArea],
			300,
			0,
			"air",
			true
		] call GMSCore_fnc_initializeWaypointsAreaPatrol;
		*/
		_helis pushBack _aircraft;
		//if (GMS_debugLevel > 0) then {[format["_spawnMissionHelis: _heli %1 spawned with pilot %2 and crew %2",typeOf _aircraft, currentPilot _aircraft, _crewGroup]] call GMS_fnc_log};
	} else {
		[format["GMS_fnc_spawnMissionHelis:   Invalid classname %1 used in _airPatrols", _heli],"warning"] call GMS_fnc_log;
	};

} forEach _missionHelis;
//[format["GMS_fnc_spawnMissionHelis:  count _units = %1 | count _helis = %2", count _units, count _helis]] call GMS_fnc_log;
GMS_spawnHelisPass = GMS_spawnHelisPass + 1;
[_helis,_units]