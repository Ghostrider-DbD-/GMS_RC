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
_defaultMissionLocations = [[27040.2,21486.4,-0.0183029]];

/*
 	Edit these to suite you specific mission
*/
_difficulty = "Green";
/*	Specify the chance this mission is spawned [0 .. 1.0]	*/
_chanceMissionSpawned = 1;
/*	 Set number of times a mission respawns or use -1 for inifinite respawns 	*/
_maxMissionRespawns = 0;
/* 	Add your Start, End and Timeout Messages Here  */
_startMsg = "Enemy forces are scavenging a solar plant (GREEN)";
_endMsg = "Patriots have stopped the scavengers at the NE Solar farm";
_timeoutMsg = "Enemy forces stripped the solar tower of supplies.";
_markerType = ["ELLIPSE",[300,300],"CROSS"];
_markerColor = "ColorWhite";


_markerMissionName = "Solar Scavengers";
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
     ["RoadCone_F",[-14.2715,11.9082,0.0185509],0,[true,true]]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["B_APC_Wheeled_01_cannon_F",[50.8926,81.0098,0.0183334],0],
     ["O_LSV_02_armed_F",[-51.8027,-61.2598,0.0186977],0]
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
     ["B_HMG_01_high_F", [0.253906,0.275391,9.44691], 0, "Green"],
     ["B_GMG_01_high_F", [0.525391,-0.388672,48.2155], 0, "Green"],
     ["B_HMG_01_high_F", [10.9922,36.3711,10.1367], 0, "Green"],
     ["B_HMG_01_high_F", [2.26953,27.8398,10.1442], 0, "Green"],
     ["B_HMG_01_high_F", [-8.92383,-28.877,10.1442], 0, "Green"],
     ["B_HMG_01_high_F", [-19.5879,-38.791,10.1377], 0, "Green"],
     ["B_HMG_01_high_F", [59.623,56.7949,0.0184479], 0, "Green"],
     ["B_HMG_01_high_F", [-38.459,-4.69141,0.0228081], 0, "Green"],
     ["B_HMG_01_high_F", [43.8867,10.6445,0.0191059], 0, "Green"],
     ["B_HMG_01_high_F", [62.9434,43.918,0.0183983], 0, "Green"],
     ["B_GMG_01_high_F", [17.793,25.5586,6.40942], 0, "Green"],
     ["B_G_Mortar_01_F", [16.0469,18.4434,6.64611], 0, "Green"],
     ["B_HMG_01_high_F", [-16.1953,-52.373,0.0191727], 0, "Green"],
     ["B_HMG_01_high_F", [61.6445,13.3672,0.018692], 0, "Green"],
     ["B_GMG_01_high_F", [-2.67383,3.60938,2.21635], 0, "Green"]
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