

/*
	Dynamic Mission Generated
	Using 3DEN Plugin for GMS by Ghostrider
	GMS 3DEN Plugin Version 1.61 : Build 28 : Build Date 11/02/23
	By Ghostrider-GRG-
*/

/*
	Do not touch the code below 
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf" 
_defaultMissionLocations = [];

/*
 	Edit these to suite you specific mission
*/
_difficulty = "Orange";
/*	Specify the chance this mission is spawned [0 .. 1.0]	*/
_chanceMissionSpawned = 1;
/*	 Set number of times a mission respawns or use -1 for inifinite respawns 	*/
_maxMissionRespawns = -1;
/* 	Add your Start, End and Timeout Messages Here  */
_startMsg = "The enemy have constructed a supplies depot";
_endMsg = "Patriots have captured the supply depot";
_timeoutMsg = "The enemy have packed up the supply depot";
_showmarker = true;
_markerType = ["ELLIPSE",[50,50],"Solid"];
_markerColor = "ColorBlue";


_markerMissionName = "Depot";
/*
	Use the parameters below to customize your mission - see the template or GMS_configs.sqf for details about each them
*/
/*
	The following variables MUST be defined in each mission even if you just set them to 0
*/
_minNoAI = 3;
_maxNoAI = 6;
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
     ["Land_i_Barracks_V2_F",[-3.25244,19.0156,-5],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Crane_F",[-7.6333,0.141602,-5],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Timbers_F",[16.0205,7.64746,-5],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Timbers_F",[13.6152,7.5874,-5],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_WorkStand_F",[-4.3042,11.0698,-5],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Pipes_large_F",[3.02051,8.88867,-5],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Pipes_large_F",[3.17383,7.23828,-5],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Wreck_Car2_F",[-5.9165,2.48438,-5],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Wreck_Offroad_F",[8.83838,2.27832,-5],[[0.76899,-0.63926,0],[0,0,1]],[true,true]],
     ["Land_Wreck_Truck_dropside_F",[-12.166,-6.19189,-5],[[0.763884,0.645353,0],[0,0,1]],[true,true]],
     ["Campfire_burning_F",[-1.88623,-1.23926,-5],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Sink_F",[-13.9282,12.46,-4.99991],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_TentDome_F",[-1.76514,-4.91357,-5],[[0.99992,-0.012675,0],[0,0,1]],[true,true]],
     ["Land_TentDome_F",[-6.19385,-3.10303,-5],[[-0.00483114,-0.999988,0],[0,0,1]],[true,true]],
     ["Land_WoodPile_F",[0.769043,-1.44629,-5],[[0,1,0],[0,0,1]],[true,true]],
     ["B_supplyCrate_F",[-2.84326,3.521,-5],[[0,1,0],[0,0,1]],[true,true]],
     ["Box_NATO_Uniforms_F",[-0.958008,3.77051,-5],[[0,1,0],[0,0,1]],[true,true]]
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
     ["I_HMG_01_high_F", [-0.39209,11.2368,-5], [[0.0306669,-0.99953,0],[0,0,1]], "Orange"],
     ["I_Mortar_01_F", [-6.04248,-8.0835,-5], [[0,1,0],[0,0,1]], "Orange"],
     ["I_HMG_01_F", [5.39941,1.31885,-5], [[-0.381477,-0.924378,0],[0,0,1]], "Orange"]
];

_missionGroups = [
     [[-13.4565,8.18896,-4.99856],3,6,"Orange"],
     [[-1.58887,1.14844,-4.99856],3,6,"Orange"],
     [[0.597168,-5.36914,-4.99856],3,6,"Orange"],
     [[3.07031,11.624,-4.99856],3,6,"Orange"]
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