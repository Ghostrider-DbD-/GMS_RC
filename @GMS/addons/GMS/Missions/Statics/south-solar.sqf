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
_defaultMissionLocations = [[8241.99,10900,3.8147e-005]];

/*
 	Edit these to suite you specific mission
*/
_difficulty = "Green";
/*	Specify the chance this mission is spawned [0 .. 1.0]	*/
_chanceMissionSpawned = 1;
/*	 Set number of times a mission respawns or use -1 for inifinite respawns 	*/
_maxMissionRespawns = 0;
/* 	Add your Start, End and Timeout Messages Here  */
_startMsg = "Enemy forces have taken over a South Solar (GREEN)";
_endMsg = "South Solar has been cleared of enemy forces.";
_timeoutMsg = "TODO: Change Appropriately";
_markerType = ["ELLIPSE",[300,300],"CROSS"];
_markerColor = "ColorWhite";


_markerMissionName = "South Solar";
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
     ["RoadCone_F",[0,-0.00292969,0],0,[true,true]]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["B_APC_Wheeled_01_cannon_F",[24.0342,-64.9043,2.86102e-006],0]
];

_missionUGVs = [
     ["B_UGV_01_rcws_F",[17.4463,119.713,0.0119839],0]
];
_submarinePatrolParameters = [

];

_airPatrols = [

];

_missionUAVs = [

];
_missionEmplacedWeapons = [
     ["B_HMG_01_high_F", [-40.252,18.2266,9.37998], 0, "Green"],
     ["B_GMG_01_high_F", [-43.9521,17.4072,48.1718], 0, "Green"],
     ["B_HMG_01_high_F", [-108.689,37.6309,0.000258446], 0, "Green"],
     ["B_HMG_01_high_F", [48.3135,-34.3789,0.00708294], 0, "Green"],
     ["B_HMG_01_high_F", [10.7529,10.1934,0.164198], 0, "Green"],
     ["B_HMG_01_high_F", [-40.377,-5.60254,0.557361], 0, "Green"],
     ["B_HMG_01_high_F", [-40.7842,-6.12402,4.31257], 0, "Green"],
     ["B_HMG_01_high_F", [-39.5293,17.2139,48.1722], 0, "Green"],
     ["B_GMG_01_high_F", [-3.02148,60.625,-3.8147e-005], 0, "Green"],
     ["B_GMG_01_high_F", [-40.2783,-11.5625,1.33514e-005], 0, "Green"],
     ["B_HMG_01_high_F", [-70.9517,-1.65918,0.0030899], 0, "Green"],
     ["B_GMG_01_high_F", [-33.8672,-2.02539,0.552592], 0, "Green"],
     ["B_GMG_01_high_F", [2.17676,-28.6592,3.19333], 0, "Green"],
     ["B_HMG_01_high_F", [9.31055,-28.5869,3.19099], 0, "Green"],
     ["B_HMG_01_high_F", [-15.2803,-66.9023,0.00127697], 0, "Green"]
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