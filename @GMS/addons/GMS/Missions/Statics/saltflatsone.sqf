

/*
	Dynamic Mission Generated
	Using 3DEN Plugin for GMS by Ghostrider
	GMS 3DEN Plugin Version 1.1 : Build 16 : Build Date 09/23/23
	By Ghostrider-GRG-
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf" 

_defaultMissionLocations = [[22815.9,17109.1,-2.7895e-005]];
_maxMissionRespawns = -1; // Chage this to either zero for no respawns or a positive number if you want to limit the number of times a mission spawns at the same location
_markerLabel = "";
_markerType = ["ELLIPSE",[150,150],"GRID"];
_markerColor = "";
_markerMissionName = "TODO: Set this to an appropriate name";
_startMsg = "TODO: Change approiately";
_endMsg = "TODO: Change Appropriately";
_markerMissionName = "";
_crateLoot = GMS_BoxLoot_Blue;
_lootCounts = GMS_lootCountsBlue;

_garrisonedBuilding_ATLsystem = [

];

/*
	Dynamic Mission Generated
	Using 3DEN Plugin for GMS by Ghostrider
	GMS 3DEN Plugin Version 1.1 : Build 16 : Build Date 09/23/23
	By Ghostrider-GRG-
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf" 

_difficulty = "Blue";
_chanceMissionSpawned = 1;
_defaultMissionLocations = [[22815.9,17109.1,-2.7895e-005]];
_maxMissionRespawns = -1; // Chage this to either zero for no respawns or a positive number if you want to limit the number of times a mission spawns at the same location
_markerLabel = "";
_markerType = ["ELLIPSE",[50,50],"FDiagonal"];
_markerColor = "ColorWEST";
_markerMissionName = "TODO: Set this to an appropriate name";
_startMsg = "TODO: Change approiately";
_endMsg = "TODO: Change Appropriately";
_markerMissionName = "";
_crateLoot = GMS_BoxLoot_Blue;
_lootCounts = GMS_lootCountsBlue;

/*
	Dynamic Mission Generated
	Using 3DEN Plugin for GMS by Ghostrider
	GMS 3DEN Plugin Version 1.1 : Build 16 : Build Date 09/23/23
	By Ghostrider-GRG-
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf" 

_difficulty = "Blue";
_chanceMissionSpawned = 1;
_defaultMissionLocations = [[22815.9,17109.1,-2.7895e-005]];
_maxMissionRespawns = -1; // Chage this to either zero for no respawns or a positive number if you want to limit the number of times a mission spawns at the same location
_markerLabel = "any";
_markerType = ["ELLIPSE",[50,50],"FDiagonal"];
_markerColor = "ColorWEST";
_markerMissionName = "TODO: Set this to an appropriate name";
_startMsg = "TODO: Change approiately";
_endMsg = "TODO: Change Appropriately";
_markerMissionName = "";
_crateLoot = GMS_BoxLoot_Blue;
_lootCounts = GMS_lootCountsBlue;

_garrisonedBuilding_ATLsystem = [

];

_missionLandscape = [
     ["RoadCone_L_F",[-0.00390625,-0.0507813,0.00721931],0,[true,true]],
     ["Land_MedicalTent_01_aaf_generic_closed_F",[31.8184,17.293,0.0235131],0,[true,true]],
     ["Land_Research_HQ_F",[17.0625,-18.8281,-0.000879765],0,[true,true]],
     ["Land_BagBunker_Large_F",[-28.8945,-16.3652,0.0173037],0,[true,true]]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["B_MRAP_01_F",[-4.84375,-26.1211,0.000152349],0]
];

_submarinePatrolParameters = [

];

_airPatrols = [
     ["B_Heli_Light_01_dynamicLoadout_F",[50.4258,2.28125,0.000232935],0]
];

_missionEmplacedWeapons = [
     ["B_HMG_01_F",[-4.19727,-1.55469,0.01511],0]
];

_missionGroups = [

];

_scubaGroupParameters = [

];

_missionLootBoxes = [

];

/*
	Use the parameters below to customize your mission - see the template or blck_configs.sqf for details about each them
*/
_chanceHeliPatrol = 0;
_noChoppers = 1;
_missionHelis = GMS_patrolHelisBlue;
_chancePara = GMS_chanceParaBlue;
_noPara = 0;
_paraTriggerDistance = 400;
_chanceLoot = 0.0;
_paraLoot = GMS_BoxLoot_Blue;
_paraLootCounts = GMS_lootCountsBlue;
_missionLandscapeMode = "precise";
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;
_vests = GMS_vests;
_backpacks = GMS_backpacks;
_sideArms = GMS_Pistols;
_spawnCratesTiming = "atMissionEndGround";
_loadCratesTiming = "atMissionCompletion";
_endCondition = playerNear;
_minNoAI = 0;
_maxNoAI = 0;
_noAIGroups = 0;
_noVehiclePatrols = 1;
_noEmplacedWeapons = 1;
_submarinePatrols = 0; // Default number of submarine patrols at pirate missions
_scubaPatrols = 0; // Default number of scuba diver patrols at pirate missions

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";