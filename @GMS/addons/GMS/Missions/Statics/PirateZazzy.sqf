

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
_defaultMissionLocations = [[22815.9,17109.1,0.00296235]];

/*
 	Edit these to suite you specific mission
*/
_difficulty = "Blue";
/*	Specify the chance this mission is spawned [0 .. 1.0]	*/
_chanceMissionSpawned = 1;
/*	 Set number of times a mission respawns or use -1 for inifinite respawns 	*/
_maxMissionRespawns = -1;
/* 	Add your Start, End and Timeout Messages Here  */
_startMsg = "TODO: Change approiately";
_endMsg = "TODO: Change Appropriately";
_timeoutMsg = "TODO: Change Appropriately";
_markerType = ["mil_triangle",[1,1],"Solid"];
_markerColor = "Default";


_markerMissionName = "";
/*
	Use the parameters below to customize your mission - see the template or GMS_configs.sqf for details about each them
*/
/*
	The following variables MUST be defined in each mission even if you just set them to 0
*/
_minNoAI = GMS_MinAI_Blue;
_maxNoAI = GMS_MaxAI_Blue;
_noAIGroups = GMS_AIGrps_Blue;
_noVehiclePatrols = GMS_SpawnVeh_Blue;
_noEmplacedWeapons = GMS_SpawnEmplaced_Blue;
/*
	It is recommended to used specific settings for the variables below. Defaults were set based on difficulty or standard settings.
	Or just set numerical values to 0 to disable a feature
*/
_chanceHeliPatrol = GMS_chanceHeliPatrolBlue;
_noChoppers = GMS_noPatrolHelisBlue;
_missionHelis = GMS_patrolHelisBlue;
_chancePara = GMS_chanceParaBlue;
_noPara = GMS_noParaBlue;
_paraTriggerDistance = 400;
_paraSkill = 0.7;
_chanceLoot = 0.0;
_paraLoot = GMS_BoxLoot_Blue;
_paraLootCounts = GMS_lootCountsBlue;
_missionLandscapeMode = "precise";
_useMines = GMS_useMines;
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;
_vests = GMS_vests;
_backpacks = GMS_backpacks;
_sideArms = GMS_Pistols;
_spawnCratesTiming = "atMissionSpawnGround";
_loadCratesTiming = "atMissionStart";
_endCondition = allUnitsKilled;
_submarinePatrols = 0;
_scubaPatrols = 0;

_crateLoot = GMS_BoxLoot_Blue;
_lootCounts = GMS_lootCountsBlue;
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
     ["RoadCone_L_F",[0,0,0.00394535],0,[true,true]],
     ["Land_MedicalTent_01_aaf_generic_closed_F",[31.8223,17.3438,0.0205228],0,[true,true]],
     ["Land_Research_HQ_F",[17.3906,-17.5,-0.00296235],0,[true,true]],
     ["Land_BagBunker_Large_F",[-29.0039,-17.4434,0.00715303],0,[true,true]],
     ["Land_Pallet_MilBoxes_F",[30.7109,-1.49609,-0.00132132],0,[true,true]]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["B_MRAP_01_F",[-4.83984,-26.0703,-0.0028379],0]
];

_missionUGVs = [

];
_submarinePatrolParameters = [

];

_airPatrols = [
     ["B_Heli_Light_01_dynamicLoadout_F",[50.4297,2.33203,-0.00275731],0]
];

_missionUAVs = [

];
_missionEmplacedWeapons = [
     ["B_HMG_01_high_F", [21.4336,-16.1445,3.11827], 0, "Blue"],
     ["B_HMG_01_high_F", [-30.9922,-18.9863,0.202087], 0, "Blue"],
     ["B_HMG_01_high_F", [-34.4316,32.7754,-0.00714135], 141.66, "Blue"],
     ["B_HMG_01_high_F", [-22.7617,40.4707,1.05355], 166.401, "Blue"]
];

_missionGroups = [
     [[-26.6816,45.0723,1.06332],3,6,"Blue"],
     [[72.0215,103.072,-0.004668],3,6,"Blue"],
     [[5.58398,-4.625,-0.00425434],3,6,"Blue"]
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