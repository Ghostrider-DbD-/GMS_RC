/*
	GMS_fnc_spawnMissionVehiclePatrols
	by Ghostrider [GRG]
	returns [] if no groups could be created
	returns [_AI_Vehicles,_missionAI] otherwise;
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

params[
	["_coords",[]],
	["_skillAI","Red"],
	["_missionPatrolVehicles",[]],
	["_uniforms",[]], 
	["_headGear",[]],
	["_vests",[]],
	["_backpacks",[]],
	["_weaponList",[]],
	["_sideArms",[]], 
	["_isScubaGroup",false],
	["_crewCount",4]
];

private["_spawnPos"];
private _vehicles = [];
private _missionAI = [];
private _patrolsThisMission = +_missionPatrolVehicles;
//diag_log format["_coords = %3 | _spawnMissionVehiclePatrols(35): count _patrolsThisMission = %1 | _patrolsThisMission = %2",count _patrolsThisMission, _patrolsThisMission, _coords];
//{
//	diag_log format["_spawnMissionPatrolVehicles(37): vehicle definition = %1",_x];
//} forEach _patrolsThisMission;
#define configureWaypoints false
{
	//diag_log format["_spawnMissionVehiclePatrols(41): _x = %1",_x];
	_x params[["_vehName",""],["_pos",[]],["_dir",0]];
	//diag_log format["_spawnMissionVehiclePatrols(43):  _vehName = %1 | _pos = %2 | _dir = %3 | isClass _vehName = %4",_vehName,_pos,_dir, isClass(configFile >> "CfgVehicles" >> _vehName)];
	_pos = _coords vectorAdd _pos;  // else {_pos = (_coords vectorAdd _pos) findEmptyPosition[0,50,_vehName]};
	//diag_log format["_spawnMissionVehiclePatrols(45): _pos updated to %1",_pos];
	if (isClass(configFile >> "CfgVehicles" >> _vehName)) then {
		if !(_pos isEqualTo []) then {
				
			#define vehiclePatrolAreaDimensions [100,100]
			private _maxCrewConfigs = [_vehName,true] call BIS_fnc_crewCount;
			private _maxCrewBlck = missionNamespace getVariable[format["GMS_vehCrew_%1",_skillAI],3];
			private _crewCount = _maxCrewBlck min _maxCrewConfigs;
			//#define offMap [-1,-1,1]
			private _vehGroup = [_pos,_crewCount,_skillAI,vehiclePatrolAreaDimensions,_uniforms, _headGear,_vests,_backpacks,_weaponList,_sideArms,_isScubaGroup,GMS_waypointTimeoutVehicle,"Vehicle"] call GMS_fnc_spawnGroup;
			
			_missionAI append (units _vehGroup);
			GMS_monitoredMissionAIGroups pushBack _vehGroup;
				
			#define height 0
			#define dir 0
			#define maxDamage 0.5
			#define removeFuel 0.2
			#define vehHitCode [GMS_fnc_vehicleHit] 
			#define vehKilledCode [GMS_fnc_vehicleKilled]
			private _damage = 0.5;
			private _releaseToPlayers = GMS_allowClaimVehicle;

			/*
				params[
					["_className",""], // Clasname of vehicle to be spawned
					["_spawnPos",[0,0,0]],  //  selfevident
					["_dir",0],  //  selfevident
					["_height",0],		
					["_disable",0],  // damage value set to this value if less than this value when all crew are dead
					["_removeFuel",0.2],  // fuel set to this value when all crew dead
					["_releaseToPlayers",true],
					["_deleteTimer",300],
					["_vehHitCode",[]],
					["_vehKilledCode",[]]
				];														
			*/
			private _vehicle = [_vehName,_pos,dir,height,maxDamage,removeFuel,_releaseToPlayers,GMS_vehicleDeleteTimer,vehHitCode,vehKilledCode] call GMSCore_fnc_spawnPatrolVehicle;
			[_vehicle,_vehGroup] call GMSCore_fnc_loadVehicleCrew;
			_vehGroup setVariable["GMS_group",true];
			[_vehicle,GMS_forbidenWeapons,GMS_forbidenMagazines] call GMSCore_fnc_disableVehicleWeapons;
			[_vehicle,GMS_disabledSensors] call GMSCore_fnc_disableVehicleSensors;
			if (GMS_disableInfrared) then {_vehicle disableTIEquipment true};
			_vehicles pushback _vehicle;
			/*  //  From GMSAI 
					private _movetoPos = [[[getMarkerPos _patrolArea,markerSize _patrolArea]],[]] call BIS_fnc_randomPos;
					(driver _vehicle) moveTo _movetoPos;
					[
						_group,
						_blacklisted,
						_patrolArea,
						_timeout,
						GMSAI_chanceToGarisonBuilding,
						"vehicle",
						_markerDelete
					] call GMSCore_fnc_initializeWaypointsAreaPatrol;
			*/
			[_vehGroup] call GMSCore_fnc_updateWaypointConfigs; // apply any settings related to hunting or searching based on vehicle type
			private _movetoPos = [[[_pos, vehiclePatrolAreaDimensions]],[]/* add condition that the spawn is not near a trader*/] call BIS_fnc_randomPos;
			(driver _vehicle) moveTo _movetoPos;
			(driver _vehicle) call GMSCore_fnc_nextWaypointAreaPatrol;				
			/*
			[
				_crewCount,
				[],
				[_pos, vehiclePatrolAreaDimensions],
				180,
				0,
				"vehicle",
				true
			]  call GMSCore_fnc_initializeWaypointsAreaPatrol;
			*/
			GMS_landVehiclePatrols pushBack _vehicle;
			if (GMS_debugLevel > 0) then {[format["_spawnMissionVehiclePatrols: _vehName %1 spawned with driver %2 and crew %3",_vehName,driver _vehicle, _vehGroup]] call GMS_fnc_log};
		};
	} else {
		[format["GMS_fnc_spawnMissionVehiclePatrols: Invalid classname %1 used in __missionPatrolVehicles", _vehName],"warning"] call GMS_fnc_log;
	};
} forEach _patrolsThisMission;
GMS_landVehiclePatrols append _vehicles;
GMS_monitoredVehicles append _vehicles;
//[format["GMS_fnc_spawnMissionVehiclePatrols:  count _missionAI = %1 | count _vehicles = %2", count _missionAI, count _vehicles]] call GMS_fnc_log;
[_vehicles, _missionAI];

