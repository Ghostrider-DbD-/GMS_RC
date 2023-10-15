/*
	Dynamic Mission Generated
	Using 3DEN Plugin for GMS by Ghostrider
	GMS 3DEN Plugin Version 1.23 : Build 20 : Build Date 10/10/23
	By Ghostrider-GRG-
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf" 

_markerType = ["ELLIPSE",[150,150],"FDiagonal"];
_markerColor = "ColorWEST";
_difficulty = "Red";
_chanceMissionSpawned = 1;
_defaultMissionLocations = [[22585.9,18524.3,4.286]];
_maxMissionRespawns = 0;
_startMsg = "A Mafia Crew is having a cookout";
_endMsg = "Patriots have captured loot at the cookout";
_markerLabel = "Cookout";
_markerText = "Cookout";
_markerMissionName = "Cookout";
_crateLoot = GMS_BoxLoot_Red;
_lootCounts = GMS_lootCountsRed;

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
     ["Box_FIA_Ammo_F",[-36.9746,37.0586,-3.08965],0,[true,true]],
     ["Land_BagBunker_Small_F",[-49.2559,4.30664,-4.2723],0,[true,true]],
     ["Land_FirewoodPile_01_F",[-43.0508,-22.2949,-4.29626],0,[true,true]],
     ["FirePlace_burning_F",[-66.8066,6.61523,-4.28595],0,[true,true]],
     ["Campfire_burning_F",[-56.1074,21.0078,-4.2859],0,[true,true]]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["B_MRAP_01_hmg_F",[-21.0039,0.46875,-4.27978],0]
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
     ["B_HMG_01_high_F", [-70.2969,-12.3281,-4.27773], 0, "Red"],
     ["B_HMG_01_high_F", [-82.4277,75.2559,-4.28369], 135.823, "Red"],
     ["B_HMG_01_high_F", [-48.9922,4.32813,-4.27425], 0, "Red"]
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
	Use the parameters below to customize your mission - see the template or GMS_configs.sqf for details about each them
*/
_chanceHeliPatrol = 0;
_noChoppers = 0;
_missionHelis = GMS_patrolHelisRed;
_chancePara = 0;
_noPara = 0;
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
_minNoAI = GMS_MinAI_Red;
_maxNoAI = GMS_MaxAI_Red;
_noAIGroups = 0;
_noVehiclePatrols = GMS_SpawnVeh_Red;
_noEmplacedWeapons = GMS_SpawnEmplaced_Red;
_submarinePatrols = 0;
_scubaPatrols = 0;

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";