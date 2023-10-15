/*
	Dynamic Mission Generated
	Using 3DEN Plugin for GMS by Ghostrider
	GMS 3DEN Plugin Version 1.02 : Build 15 : Build Date 09/22/23
	By Ghostrider-GRG-
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf" 

_defaultMissionLocations = [[6209.47,16240.4,43]];
_maxMissionRespawns = -1; // Chage this to either zero for no respawns or a positive number if you want to limit the number of times a mission spawns at the same location
_markerType = ["ELLIPSE",[500,500],"GRID"];
_markerColor = "ColorOrange";
_startMsg = "The factory at KORE has been taken over by vegan extremists!";
_endMsg = "KORE has been purged of the vegans. Meat is murder, and murder tastes good! ";
_markerMissionName = "HardKORE";
_crateLoot = GMS_BoxLoot_Orange;
_lootCounts = GMS_lootCountsOrange;

_garrisonedBuilding_ATLsystem = [

];

_missionLandscape = [
     ["CUP_Mine",[-29.585,-47.8447,-43],180],
     ["CUP_Mine",[98.6934,-44.418,-43],180],
     ["CUP_Mine",[-23.2051,-33.4355,-43],180],
     ["CUP_Mine",[-38.8677,67.835,-43],180],
     ["CUP_Mine",[-161.637,-34.4082,-43],180],
     ["CUP_Mine",[126.093,-14.7598,-43],180]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["B_APC_Wheeled_01_cannon_F",[34.3306,31.8359,-43],0],
     ["I_MRAP_03_gmg_F",[-188.152,-43.3232,-42.9996],0]
];

_submarinePatrolParameters = [

];

_airPatrols = [

];

_missionEmplacedWeapons = [
     ["B_HMG_01_high_F",[178.972,-22.6367,-36.3701],0],
     ["B_HMG_01_high_F",[154.664,-23.791,-36.2045],0],
     ["B_HMG_01_high_F",[79.4756,-42.7334,-43],0],
     ["B_HMG_01_high_F",[-117.813,-41.0293,-36.2259],0],
     ["B_HMG_01_high_F",[-94.3589,-39.8701,-36.1218],0],
     ["B_HMG_01_high_F",[-16.1646,-13.6289,-43],0],
     ["B_HMG_01_high_F",[-88.7983,-10.3594,-43],0],
     ["B_GMG_01_high_F",[78.6528,36.1807,-33.9581],0],
     ["B_GMG_01_high_F",[63.771,-15.667,-43],0],
     ["B_GMG_01_high_F",[-80.2832,44.7324,-24.4945],0],
     ["B_GMG_01_high_F",[0.78418,47.7158,-33.9483],0],
     ["B_GMG_01_high_F",[87.375,-22.0439,-43],0]
];

_missionGroups = [

];

_scubaGroupParameters = [

];

_missionLootBoxes = [
     ["I_CargoNet_01_ammo_F",[-49.105,-34.1846,-42.746],_crateLoot,_lootCounts,0],
     ["I_CargoNet_01_ammo_F",[-64.1182,61.8008,-42.9995],_crateLoot,_lootCounts,0]
];

/*
	Use the parameters below to customize your mission - see the template or blck_configs.sqf for details about each them
*/
_chanceHeliPatrol = GMS_chanceHeliPatrolOrange;
_noChoppers = GMS_noPatrolHelisOrange;
_missionHelis = GMS_patrolHelisOrange;
_chancePara = GMS_chanceParaOrange;
_noPara = GMS_noParaOrange;
_paraTriggerDistance = 400;
_chanceLoot = 0.0;
_paraLoot = GMS_BoxLoot_Orange;
_paraLootCounts = GMS_lootCountsOrange;
_missionLandscapeMode = "precise";
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;
_vests = GMS_vests;
_backpacks = GMS_backpacks;
_sideArms = GMS_Pistols;
_spawnCratesTiming = "atMissionSpawnGround";
_loadCratesTiming = "atMissionCompletion";
_endCondition = allUnitsKilled;
_minNoAI = GMS_MinAI_Orange;
_maxNoAI = GMS_MaxAI_Orange;
_noAIGroups = GMS_AIGrps_Orange;
_noVehiclePatrols = GMS_SpawnVeh_Orange;
_noEmplacedWeapons = GMS_SpawnEmplaced_Orange;
_submarinePatrols = 0; // Default number of submarine patrols at pirate missions
_scubaPatrols = 0; // Default number of scuba diver patrols at pirate missions

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";