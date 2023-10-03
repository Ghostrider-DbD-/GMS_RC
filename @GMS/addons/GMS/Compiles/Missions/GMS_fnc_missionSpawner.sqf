/*
	Dynamic Mission Spawner (over-ground missions)
	By Ghostrider GRG
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"
#define delayTime 1
private ["_abort","_crates","_aiGroup","_objects","_groupPatrolRadius","_missionLandscape","_mines","_GMS_AllMissionAI","_assetKilledMsg","_enemyLeaderConfig",
		"_AI_Vehicles","_timeOut","_aiDifficultyLevel","_missionPatrolVehicles","_missionGroups","_loadCratesTiming","_spawnCratesTiming","_assetSpawned","_hostageConfig",
		"_chanceHeliPatrol","_noPara","_chanceLoot","_heliCrew","_loadCratesTiming","_useMines","_GMS_AllMissionAI","_delayTime","_groupPatrolRadius","_simpleObjects",
		"_wait","_missionStartTime","_playerInRange","_missionTimedOut","_temp","_patrolVehicles","_vehToSpawn","_noChoppers","_chancePara","_paraSkill","_marker","_vehicleCrewCount",
		"_defaultMissionLocations","_garrisonedbuildings_buildingposnsystem","_garrisonedBuilding_ATLsystem", "_isScubaMission","_markerlabel","_missionLootBoxes","_airpatrols",
		"_submarinePatrols","_scubaPatrols","_maxMissionRespawns",
		// New private variables 09-01-23 thruough 09-27-23
		"_missionUGVs",
		"_missionUAVs",
		"_missionGarrisonedGroups",
		"_chanceMissionSpawned",
		"_rewardVehicles "];
		
params["_markerName",["_aiDifficultyLevel","Red"]];
if (isNil "_markerLabel") then {_markerLabel = _markerMissionName};
if (isNil "_assetKilledMsg")			 then {_assetKilledMsg = ""};
if (isNil "_markerColor") 				then {_markerColor = "ColorBlack"};
if (isNil "_markerType") 				then {_markerType = ["mil_box",[]]};
if (isNil "_markerSize") 				then {_markerSize = []};
if (isNil "_endCondition") 				then {_endCondition = GMS_missionEndCondition};  // Options are allUnitsKilled, playerNear, allKilledOrPlayerNear};
if (isNil "_spawnCratesTiming")	 		then {_spawnCratesTiming = GMS_spawnCratesTiming}; // Choices: "atMissionSpawnGround","atMissionSpawnAir","atMissionEndGround","atMissionEndAir". 
if (isNil "_loadCratesTiming") 			then {_loadCratesTiming = GMS_loadCratesTiming}; // valid choices are "atMissionCompletion" and "atMissionSpawn"; 
if (isNil "_missionPatrolVehicles") 	then {_missionPatrolVehicles = []};
if (isNil "_missionGroups") 			then {_missionGroups = []};
if (isNil "_missionGarrisonedGroups")   then {_missionGarrisonedGroups = []};
if (isNil "_hostageConfig") 			then {_hostageConfig = []};
if (isNil "_enemyLeaderConfig") 		then {_enemyLeaderConfig = []};
if (isNil "_useMines") 					then {_useMines = GMS_useMines;};
if (isNil "_weaponList") 				then {_weaponList = [_aiDifficultyLevel] call GMS_fnc_selectAILoadout};
if (isNil "_sideArms") 					then {_sideArms = [_aiDifficultyLevel] call GMS_fnc_selectAISidearms};
if (isNil "_uniforms") 					then {_uniforms = [_aiDifficultyLevel] call GMS_fnc_selectAIUniforms};
if (isNil "_headGear") 					then {_headGear = [_aiDifficultyLevel] call GMS_fnc_selectAIHeadgear};
if (isNil "_vests") 					then {_vests = [_aiDifficultyLevel] call GMS_fnc_selectAIVests};
if (isNil "_backpacks") 				then {_backpacks = [_aiDifficultyLevel] call GMS_fnc_selectAIBackpacks};
if (isNil "_chanceHeliPatrol") 			then {_chanceHeliPatrol = [_aiDifficultyLevel] call GMS_fnc_selectChanceHeliPatrol};
if (isNil "_noChoppers") 				then {_noChoppers = [_aiDifficultyLevel] call GMS_fnc_selectNumberAirPatrols};
if (isNil "_chancePara") 				then {_chancePara = [_aiDifficultyLevel] call GMS_fnc_selecctChanceParatroops};
if (isNil "_missionHelis") 				then {_missionHelis = [_aiDifficultyLevel] call GMS_fnc_selectMissionHelis};
if (isNil "_noPara") 					then {_noPara = [_aiDifficultyLevel] call GMS_fnc_selectNumberParatroops};
if (isNil "_paraSkill")					then {_paraSkill = _aiDifficultyLevel};
if (isNil "_chanceLoot") 				then {_chanceLoot = 1.0}; //0.5}; 
if (isNil "_paraTriggerDistance") 		then {_paraTriggerDistance = 400;};
if (isNil "_paraLoot") 					then {_paraLoot = GMS_BoxLoot_Green};  //  Add diffiiculty based settings
if (isNil "_paraLootCounts") 			then {_paraLootCounts = GMS_lootCountsRed}; // Add difficulty based settings
if (isNil "_missionLootVehicles") 		then {_missionLootVehicles = []};
if (isNil "_garrisonedBuilding_ATLsystem") then {_garrisonedBuilding_ATLsystem = []};
if (isNil "_garrisonedBuildings_BuildingPosnSystem") then {_garrisonedBuildings_BuildingPosnSystem = []};
if (isNil "_vehicleCrewCount") then {_vehicleCrewCount = [_aiDifficultyLevel] call GMS_fnc_selectVehicleCrewCount};
if (isNil "_airpatrols") then {_airpatrols = []};
if (isNil "_missionUGVs") then {_missionUGVs = []};
if (isNil "_missionUAVs") then {_missionUAVs = []};
if (isNil "_submarinePatrols") then {_submarinePatrols = 0};
if (isNil "_submarinePatrolParameters") then {_submarinePatrolParameters = []};
if (isNil "_scubaPatrols") then {_scubaPatrols = 0};
if (isNil "_scubagroupparameters") then {_scubagroupparameters = []};
if (isNil "_markerMissionName") then {
	diag_log format["_fnc_missionSpawner: _markerMissionName not defined, using default value"];
	_markerMissionName = "Default Mission Name";
};
if (isNil "_noLootCrates") then {_noLootCrates = 1};
if (isNil "_lootCrates") then {_lootCrates = GMS_crateTypes};
if (isNil "_lootCratePositions") then {_lootCratePositions = []};
if (isNil "_isScubaMission") then {_isScubaMission = false};
if (isNil "_missionLootBoxes") then {_missionLootBoxes = []};

// New in Sept 2023 - reward vehicles are spawned after a mission is cleared.
if (isNil "_rewardVehicles") then {_rewardVehicles = []};

if (isNil "_defaultMissionLocations") then {_defaultMissionLocations = []};
if (isNil "_chanceMissionSpawned") then {_chanceMissionSpawned = 1.0};
if (isNil "_maxMissionRespawns") then {_maxMissionRespawns = -1};
if (isNil "_simpleObjects") then {_simpleObjects = []};
if (isNil "_missionemplacedweapons") then {_missionemplacedweapons = []};
// Allow for and capture any custom difficult setting in the mission
if !(isNil "_difficulty") then {_aiDifficultyLevel = _difficulty}; 

_markerType params["_markerType",["_markersize",[250,250]],["_markerBrush","GRID"]];
private _paraSkill = _aiDifficultyLevel;


if !(_spawnCratesTiming in GMS_validLootSpawnTimings) then 
{
	[format['Invalid crate spawn timing %1 found in mission %2 :: default value atMissionSpawnGround used',_spawnCratesTiming,_markerMissionName],"<WARNING>"] call GMS_fnc_log;
	_spawnCratesTiming = atMissionSpawnGround;
};
if !(_loadCratesTiming in GMS_validLootLoadTimings) then 
{
	[format['Invalid crate loading timing %1 found in mission %2 :: default atMissionSpawn value used',_loadCratesTiming,_markerMissionName],"<WARNING>"] call GMS_fnc_log;
	_loadCratesTiming = atMissionSpawn;
};
if !(_endCondition in GMS_validEndStates) then 
{
	[format['Invalid mission end condition %1 found in mission %2 :: default value allKilledOrPlayerNear; used',_endCondition,_markerMissionName],"<WARNING>"] call GMS_fnc_log;
	_endCondition = allKilledOrPlayerNear;
};
//diag_log format["_missionSpawner: _markerName %1 | _markerMissionName %2 | _markerColor %3",_markerName,_markerMissionName,_markerColor];
private _markerConfigs = [
	_markerLabel,
	_markerMissionName, // Name used for setMarkerText and also for the root name for all markers	
	_markerType, 
	_markerColor, 
	_markerSize,
	_markerBrush
];

private _paraConfigs = [
	_chancePara,
	_paraTriggerDistance,	
	_noPara, 
	_paraSkill,
	_chanceLoot, 
	_paraLoot, 
	_paraLootCounts
],

private _missionLootConfigs = [
	_spawnCratesTiming, 
	_loadCratesTiming,		
	_crateLoot, 
	_lootCounts,
	_missionLootBoxes,
	_missionLootVehicles	
];

private _aiConfigs = [
	_uniforms, 
	_headgear, 
	_vests, 
	_backpacks, 
	_weaponList,
	_sideArms, 	
	_missionLandscapeMode, 	
	_garrisonedBuildings_BuildingPosnSystem, 
	_garrisonedBuilding_ATLsystem,
	_missionLandscape,
	_simpleObjects,
	_missionPatrolVehicles,
	_submarinePatrols,  //  Added Build 227
	_submarinePatrolParameters,
	_airPatrols,
	_noVehiclePatrols, 
	_vehicleCrewCount,
	_missionEmplacedWeapons,
	_noEmplacedWeapons, 
	_useMines, 
	_minNoAI, 
	_maxNoAI, 
	_noAIGroups, 		
	_missionGroups,
	_missionGarrisonedGroups,
	_scubaPatrols,  //  Added Build 227
	_scubaGroupParameters,		
	_hostageConfig,
	_enemyLeaderConfig,
	_chanceHeliPatrol, 
	_noChoppers, 
	_missionHelis	
];

private _missionMessages = [
	_assetKilledMsg,	
	_endMsg,
	_startMsg	
];

private _timesSpawned = 0;
private _isSpawned = false;
private _spawnedAt = -1;

// This table structure is directly accessed using indexes defined in Compiles\Init\GMS_defines.hpp
private _table = [
	_aiDifficultyLevel,		// index 0
	_markerConfigs,			// index 1
	_endCondition,			// index 2
	_isscubamission,		// index 3
	_missionLootConfigs,	// index 4
	_aiConfigs,				// index 5
	_missionMessages,		// index 6
	_paraConfigs,			// index 7
	_defaultMissionLocations, 
	_maxMissionRespawns,	// index 9 
	_timesSpawned,			// index 10 
	_chanceMissionSpawned,	// index 11
	_isSpawned,				// index 12
	_spawnedAt				// index 13
];
//[format["_missionSpawner (182): _defaultMissionLocations %1 | _maxMissionRespawns %2 | _timesSpawned %3",_defaultMissionLocations,_maxMissionRespawns,_timesSpawned]] call GMS_fnc_log;
_table
