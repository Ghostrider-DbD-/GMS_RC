

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
_maxMissionRespawns = 0; // Chage this to either zero for no respawns or a positive number if you want to limit the number of times a mission spawns at the same location

_markerType = ["ELLIPSE",[150,150],"FDiagonal"];
_markerColor = "ColorWEST";

_markerLabel = "CaptainRoberts";
_markerMissionName = "CaptainRoberts";
_startMsg = "Captain Roberts Spotted near the salt flats";
_endMsg = "Captain Roberts was sent to Neptun's Locker";

_crateLoot = GMS_BoxLoot_Blue;
_lootCounts = GMS_lootCountsBlue;

_missionLandscape = [
     ["RoadCone_L_F",[-0.00390625,-0.0507813,0.00721931],0,[true,true]],
     ["Land_MedicalTent_01_aaf_generic_closed_F",[31.8184,17.293,0.0235133],0,[true,true]],
     ["Land_Research_HQ_F",[17.0625,-18.8281,-0.000879526],0,[true,true]],
     ["Land_BagBunker_Large_F",[-29.0078,-17.4941,0.0101435],0,[true,true]]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["B_MRAP_01_F",[-4.84375,-26.1211,0.000152588],0]
];

_submarinePatrolParameters = [

];

_airPatrols = [
     //["B_Heli_Light_01_dynamicLoadout_F",[50.4258,2.28125,0.000233173],0]
];

_missionEmplacedWeapons = [
     ["B_HMG_01_high_F",[21.4336,-16.1445,3.11827],0],
     ["B_HMG_01_high_F",[-30.9922,-18.9863,0.202087],0],
     ["B_HMG_01_high_F",[-34.4316,32.7754,-0.00714135],141.66],
     ["B_HMG_01_high_F",[-22.7617,40.4707,1.05355],166.401]
];



_missionGroups = [
   //  [[-33.5879,26.9922,0.00262976],3,6,"Blue"]
];

_missionGarrisonedGroups = [
    // [[-26.6816,45.0723,1.06332],0,"Blue",""],
	//[[21.418,-13.9297,1.14033],266.755,"Blue",""]
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
//_spawnCratesTiming = "atMissionEndGround";
//_loadCratesTiming = "atMissionCompletion";
//_endCondition = playerNear;
_minNoAI = 0;
_maxNoAI = 0;
_noAIGroups = 0;
_noVehiclePatrols = 1;
_noEmplacedWeapons = 1;
_submarinePatrols = 0; // Default number of submarine patrols at pirate missions
_scubaPatrols = 0; // Default number of scuba diver patrols at pirate missions

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";