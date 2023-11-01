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
_defaultMissionLocations = [[14211,21219.6,3.05176e-005]];

/*
 	Edit these to suite you specific mission
*/
_difficulty = "Green";
/*	Specify the chance this mission is spawned [0 .. 1.0]	*/
_chanceMissionSpawned = 1;
/*	 Set number of times a mission respawns or use -1 for inifinite respawns 	*/
_maxMissionRespawns = 0;
/* 	Add your Start, End and Timeout Messages Here  */
_startMsg = "Enemy forces have taken over Frini Outpost (GREEN)";
_endMsg = "Frini outpost has been reclaimed by patriots!";
_timeoutMsg = "Enemy forces have fled the Frini Outpost with the town loot.";
_markerType = ["ELLIPSE",[300,300],"CROSS"];
_markerColor = "ColorWhite";


_markerMissionName = "Frini Outpost";
/*
	Use the parameters below to customize your mission - see the template or GMS_configs.sqf for details about each them
*/
/*
	The following variables MUST be defined in each mission even if you just set them to 0
*/
_minNoAI = GMS_MinAI_Green;
_maxNoAI = GMS_MaxAI_Green;
_noAIGroups = GMS_AIGrps_Green;
_noVehiclePatrols = GMS_SpawnVeh_Green;
_noEmplacedWeapons = GMS_SpawnEmplaced_Green;
/*
	It is recommended to used specific settings for the variables below. Defaults were set based on difficulty or standard settings.
	Or just set numerical values to 0 to disable a feature
*/
_chanceHeliPatrol = GMS_chanceHeliPatrolGreen;
_noChoppers = GMS_noPatrolHelisGreen;
_missionHelis = GMS_patrolHelisGreen;
_chancePara = GMS_chanceParaGreen;
_noPara = GMS_noParaGreen;
_paraTriggerDistance = 400;
_paraSkill = 0.7;
_chanceLoot = 0.0;
_paraLoot = GMS_BoxLoot_Green;
_paraLootCounts = GMS_lootCountsGreen;
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

_crateLoot = GMS_BoxLoot_Green;
_lootCounts = GMS_lootCountsGreen;
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
     ["RoadCone_F",[0.00195313,0,0],0,[true,true]]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["B_APC_Wheeled_01_cannon_F",[-45.9648,-16.9082,0.0239182],0]
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
     ["B_HMG_01_high_F", [-13.7734,28.2031,4.0956], 0, "Green"],
     ["B_HMG_01_high_F", [19.3428,42.7188,0.00157166], 0, "Green"],
     ["B_HMG_01_high_F", [-38.2256,16.4375,0.000556946], 0, "Green"],
     ["B_HMG_01_high_F", [15.334,-4.47852,18.1402], 0, "Green"],
     ["B_GMG_01_high_F", [11.0645,-11.1348,18.1368], 0, "Green"],
     ["B_G_Mortar_01_F", [-17.6455,-26.2051,3.16071], 0, "Green"],
     ["B_G_Mortar_01_F", [-19.2656,-21.5527,2.98189], 0, "Green"],
     ["B_HMG_01_high_F", [-87.0938,59.8027,0.0101089], 0, "Green"],
     ["B_HMG_01_high_F", [-103.017,37.5527,0.015686], 0, "Green"],
     ["B_HMG_01_high_F", [18.917,-12.248,16.4111], 0, "Green"],
     ["CUP_B_D30_AT_CDF", [-54.2988,0.767578,6.10352e-005], 0, "Green"],
     ["B_HMG_01_high_F", [36.3916,0.0332031,0.0716705], 0, "Green"],
     ["B_HMG_01_high_F", [29.084,-16.2012,0.0292206], 0, "Green"],
     ["B_HMG_01_high_F", [-15.415,-38.8555,0.0102463], 0, "Green"],
     ["B_GMG_01_high_F", [7.09082,-30.8184,0.0953827], 0, "Green"]
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