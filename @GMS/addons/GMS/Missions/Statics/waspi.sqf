/*
	Static Mission Generated
	Using 3DEN Plugin for GMS by Ghostrider
	GMS 3DEN Plugin Version 1.4 : Build 22 : Build Date 10/16/23
	By Ghostrider-GRG-
*/

/*
	Do not touch the code below 
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf" 
_defaultMissionLocations = [[5135.2,3446.3,-16.9856]];

/*
 	Edit these to suite you specific mission
*/
_difficulty = "Orange";
/*	Specify the chance this mission is spawned [0 .. 1.0]	*/
_chanceMissionSpawned = 1;
/*	 Set number of times a mission respawns or use -1 for inifinite respawns 	*/
_maxMissionRespawns = 0;
/* 	Add your Start, End and Timeout Messages Here  */
_startMsg = "THIS WILL NEVER WORK";
_endMsg = "NO FUCKING WAY";
_timeoutMsg = "TIMEOUT THE SHIP";
_markerType = ["ELLIPSE",[500,500],"SOLID"];
_markerColor = "ColorPink";


_markerMissionName = "WET DOWN THERE";
/*
	Use the parameters below to customize your mission - see the template or GMS_configs.sqf for details about each them
*/
/*
	The following variables MUST be defined in each mission even if you just set them to 0
*/
_minNoAI = GMS_MinAI_Orange;
_maxNoAI = GMS_MaxAI_Orange;
_noAIGroups = GMS_AIGrps_Orange;
_noVehiclePatrols = GMS_SpawnVeh_Orange;
_noEmplacedWeapons = GMS_SpawnEmplaced_Orange;
/*
	It is recommended to used specific settings for the variables below. Defaults were set based on difficulty or standard settings.
	Or just set numerical values to 0 to disable a feature
*/
_chanceHeliPatrol = GMS_chanceHeliPatrolOrange;
_noChoppers = GMS_noPatrolHelisOrange;
_missionHelis = GMS_patrolHelisOrange;
_chancePara = GMS_chanceParaOrange;
_noPara = GMS_noParaOrange;
_paraTriggerDistance = 400;
_paraSkill = 0.7;
_chanceLoot = 0.0;
_paraLoot = GMS_BoxLoot_Orange;
_paraLootCounts = GMS_lootCountsOrange;
_missionLandscapeMode = "precise";
_useMines = GMS_useMines;
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;
_vests = GMS_vests;
_backpacks = GMS_backpacks;
_sideArms = GMS_Pistols;
_spawnCratesTiming = "atMissionSpawnGround";
_loadCratesTiming = "atMissionSpawn";
_endCondition = allUnitsKilled;
_submarinePatrols = 0;
_scubaPatrols = 0;

_crateLoot = GMS_BoxLoot_Orange;
_lootCounts = GMS_lootCountsOrange;
/*
	Do not touch the code below except to comment out rows containing objects you do not wish to have spawned
*/

/*
     Depricated Variable Included for Backwards Compatibility with Existing Missions
*/
_garrisonedBuilding_ATLsystem = [

];
/*
     Depricated Variable Included for Backwards Compatibility with Existing Missions
*/
_garrisonedBuildings_BuildingPosnSystem = [

];
_missionLandscape = [
     ["CUP_B_LHD_WASP_USMC_Empty",[1.25586,-0.912354,202.956],306.311,[true,true]],
     ["RoadCone_F",[-37.853,31.032,210.918],0,[true,true]]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [

];

_missionUGVs = [

];
_submarinePatrolParameters = [

];

_airPatrols = [

];

_missionUAVs = [

];
_missionEmplacedWeapons = [
     ["B_static_AA_F", [35.2236,-39.5327,219.941], 0, "Orange"],
     ["B_static_AA_F", [92.9888,-85.1814,220.028], 0, "Orange"],
     ["B_static_AA_F", [-96.6421,55.0532,219.941], 0, "Orange"],
     ["B_static_AA_F", [6.95947,-13.176,234.162], 0, "Orange"],
     ["B_HMG_01_high_F", [-30.6777,17.6013,226.057], 0, "Orange"],
     ["B_HMG_01_high_F", [3.03223,-11.6563,237.446], 0, "Orange"],
     ["B_HMG_01_high_F", [28.7549,-31.9424,223.407], 0, "Orange"],
     ["B_HMG_01_high_F", [-6.23047,-0.866699,228.707], 0, "Orange"],
     ["B_HMG_01_high_F", [-82.7363,77.1328,219.941], 0, "Orange"],
     ["B_HMG_01_high_F", [-17.0273,6.03613,228.707], 0, "Orange"],
     ["B_HMG_01_high_F", [-67.9951,60.3662,210.918], 0, "Orange"],
     ["B_HMG_01_high_F", [18.1196,1.04688,213.076], 0, "Orange"],
     ["B_HMG_01_high_F", [47.2959,-41.4451,205.324], 0, "Orange"],
     ["B_HMG_01_high_F", [-33.6914,19.2522,205.29], 0, "Orange"]
];

_missionGroups = [

];

_missionGarrisonedGroups = [

];

_scubaGroupParameters = [

];

_missionLootBoxes = [

];

/*
	Do not touch the code below 
*/
#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";