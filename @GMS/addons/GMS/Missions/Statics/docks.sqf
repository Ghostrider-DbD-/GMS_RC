

/*
	Static Mission Generated
	Using 3DEN Plugin for GMS by Ghostrider
	GMS 3DEN Plugin Version 1.3 : Build 21 : Build Date 10/15/23
	By Ghostrider-GRG-
*/

/*
	Do not touch the code below 
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf" 
_defaultMissionLocations = [[14281.8,13029.3,0.00057888]];

/*
 	Edit these to suite you specific mission
*/
_difficulty = "Red";
/*	Specify the chance this mission is spawned [0 .. 1.0]	*/
_chanceMissionSpawned = 1;
/*	 Set number of times a mission respawns or use -1 for inifinite respawns 	*/
_maxMissionRespawns = 0;
/* 	Add your Start, End and Timeout Messages Here  */
_startMsg = "The enemy has fortified a port";
_endMsg = "Patriots recaptured the port";
_timeoutMsg = "The enemy unloaded all ships and vacated the port";
_markerType = ["ELLIPSE",[1,1],"CROSS"];
_markerColor = "ColorWhite";


_markerMissionName = "Docksucker!";
/*
	Use the parameters below to customize your mission - see the template or GMS_configs.sqf for details about each them
*/
/*
	The following variables MUST be defined in each mission even if you just set them to 0
*/
_minNoAI = GMS_MinAI_Red;
_maxNoAI = GMS_MaxAI_Red;
_noAIGroups = GMS_AIGrps_Red;
_noVehiclePatrols = GMS_SpawnVeh_Red;
_noEmplacedWeapons = GMS_SpawnEmplaced_Red;
/*
	It is recommended to used specific settings for the variables below. Defaults were set based on difficulty or standard settings.
	Or just set numerical values to 0 to disable a feature
*/
_chanceHeliPatrol = GMS_chanceHeliPatrolRed;
_noChoppers = GMS_noPatrolHelisRed;
_missionHelis = GMS_patrolHelisRed;
_chancePara = GMS_chanceParaRed;
_noPara = GMS_noParaRed;
_paraTriggerDistance = 400;
_paraSkill = 0.7;
_chanceLoot = 0.0;
_paraLoot = GMS_BoxLoot_Red;
_paraLootCounts = GMS_lootCountsRed;
_missionLandscapeMode = "precise";
_useMines = GMS_useMines;
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;
_vests = GMS_vests;
_backpacks = GMS_backpacks;
_sideArms = GMS_Pistols;
_spawnCratesTiming = "atMissionSpawnGround";
_loadCratesTiming = "atMissionSpawn";
_endCondition = allKilledOrPlayerNear;
_submarinePatrols = 0;
_scubaPatrols = 0;

_crateLoot = GMS_BoxLoot_Red;
_lootCounts = GMS_lootCountsRed;
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
     ["RoadCone_F",[-0.0107422,-0.00683594,0],0,[true,true]]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["B_Boat_Armed_01_minigun_F",[-27.0371,70.3418,3.65429],0],
     ["B_Boat_Armed_01_minigun_F",[106.854,-46.3994,2.91438],0]
];

_missionUGVs = [
     ["B_UGV_01_rcws_F",[-78.833,-89.6396,0.0650592],0]
];
_submarinePatrolParameters = [

];

_airPatrols = [

];

_missionUAVs = [

];
_missionEmplacedWeapons = [
     ["B_HMG_01_high_F", [8.2666,4.63867,15.3795], 0, "Red"],
     ["B_HMG_01_high_F", [-50.0205,-8.50488,0.00232649], 0, "Red"],
     ["B_HMG_01_high_F", [9.56543,-3.70313,12.7615], 0, "Red"],
     ["B_HMG_01_high_F", [-13.3789,-24.5078,0.000472069], 0, "Red"],
     ["B_HMG_01_high_F", [45.5146,-16.7578,4.43587], 0, "Red"],
     ["B_HMG_01_high_F", [25.2979,38.3828,4.35313], 0, "Red"],
     ["B_static_AT_F", [10.3994,-2.16406,17.8934], 0, "Red"],
     ["B_GMG_01_high_F", [10.751,4.97559,17.898], 0, "Red"],
     ["B_HMG_01_high_F", [17.4473,3.43848,17.8802], 0, "Red"],
     ["B_G_Mortar_01_F", [58.248,18.4736,3.12156], 0, "Red"],
     ["B_G_Mortar_01_F", [52.5967,13.6035,3.17074], 0, "Red"],
     ["B_HMG_01_high_F", [62.1934,30.0947,0.00117254], 0, "Red"],
     ["B_GMG_01_high_F", [-43.5801,32.0244,0.011904], 0, "Red"],
     ["B_HMG_01_high_F", [-14.4463,33.8447,0.00309944], 0, "Red"],
     ["B_GMG_01_high_F", [-12.6348,9.95117,0.000782967], 0, "Red"],
     ["B_HMG_01_high_F", [32.2891,54.2012,2.69219], 0, "Red"]
];

_missionGroups = [
     [[10.2744,-3.1748,17.8625],3,6,"Red"]
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