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
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params[
	"_coords",
	"_noVehiclePatrols",
	"_skillAI",
	"_missionPatrolVehicles"
	,["_useRelativePos",true],
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
private _abort = false;
private _patrolsThisMission = +_missionPatrolVehicles;
//diag_log format["_spawnMissionVehiclePatrols(30): _noVehiclePatrols = %1 | _patrolsThisMission = %2",_noVehiclePatrols,_patrolsThisMission];
if (_patrolsThisMission isEqualTo []) then
{
	_useRelativePos = false;
	private _spawnLocations = [_coords,_noVehiclePatrols,60,100] call GMS_fnc_findPositionsAlongARadius;
	//diag_log format["_spawnMissionVehiclePatrols (35): _spawnLocations = %1",_spawnLocations];
	{

		private _veh = [_skillAI] call GMS_fnc_selectPatrolVehicle;
		[format["GMS_fnc_spawnMissionVehiclePatrols: _veh %1 = %2",_forEachIndex,_veh]] call GMS_fnc_log;
		_patrolsThisMission pushBack [_veh, _x];
		//diag_log format["_spawnMissionVehiclePatrols(36): _v = %1 | _patrolsThisMission = %2",_v,_patrolsThisMission];
	}forEach _spawnLocations;
};
//diag_log format["_spawnMissionVehiclePatrols(42): _patrolsThisMission = %1",_patrolsThisMission];
#define configureWaypoints false
{
	_x params["_vehName","_pos"];
	if (_useRelativePos) then {_pos = _coords vectorAdd _pos};
	_pos = _pos findEmptyPosition[0,50,_vehName];	
	#define vehiclePatrolAreaDimensions [500,500]
	private _maxCrewConfigs = [_vehName,true] call BIS_fnc_crewCount;
	private _maxCrewBlck = missionNamespace getVariable[format["GMS_vehCrew_%1",_skillAI],3];
	private _crewCount = _maxCrewBlck min _maxCrewConfigs;
	#define offMap [-1,-1,1]
	private _vehGroup = [offMap,_crewCount,_skillAI,vehiclePatrolAreaDimensions,_uniforms, _headGear,_vests,_backpacks,_weaponList,_sideArms,_isScubaGroup] call GMS_fnc_spawnGroup;
	
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

	private _vehicle = [_vehName,_pos,dir,height,maxDamage,removeFuel,_releaseToPlayers,GMS_vehicleDeleteTimer,vehHitCode,vehKilledCode] call GMSCore_fnc_spawnPatrolVehicle;
	[_vehicle,_vehGroup] call GMSCore_fnc_loadVehicleCrew;
	_vehGroup setVariable["GMS_group",true];
	[_vehicle,GMS_forbidenWeapons,GMS_forbidenMagazines] call GMSCore_fnc_disableVehicleWeapons;
	[_vehicle,GMS_disabledSensors] call GMSCore_fnc_disableVehicleSensors;
	if (GMS_disableInfrared) then {_vehicle disableTIEquipment true};
	_vehicles pushback _vehicle;
	GMS_landVehiclePatrols pushBack _vehicle;
} forEach _patrolsThisMission;
GMS_landVehiclePatrols append _vehicles;
GMS_monitoredVehicles append _vehicles;
[_vehicles, _missionAI, _abort];

