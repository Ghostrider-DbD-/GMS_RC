

/*
	Dynamic Mission Generated
	Using 3DEN Plugin for blckeagls
	dynamicMission.sqf generated:: blckeagls 3DEN Plugin Version 0 : Build 2 : Build Date 08/15/20
	By Ghostrider-GRG-
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf";

_defaultMissionLocations = [];
_markerType = ["mil_box",[1,1],"<null>"];
_markerColor = "ColorRed";
_startMsg = "TODO: Change approiately";
_endMsg = "TODO: Change Appropriately";
_markerMissionName = "Stay Away";
_crateLoot = GMS_BoxLoot_Blue;
_lootCounts = GMS_lootCountsBlue;

_garrisonedBuildings_BuildingPosnSystem = [
	//      ["Land_Unfinished_Building_02_F",[-28.137,-48.6494,0],0,true,true,0.67,3,[],4],
     ["Land_Unfinished_Building_02_F",[16.998,57.9648,-33.866],0,true,true,0.67,3,[],4]
];

_garrisonedBuilding_ATLsystem = [
["Land_Unfinished_Building_01_F",[0,0,0],0,true,true,[["B_HMG_01_high_F",[-2.19922,0.837891,3.61188],0],["B_static_AA_F",[-2.34766,3.85352,6.80866],0]],[[[0.96875,-1.99023,0.27216],0],[[-3.74219,0.279297,0.136929],0]]],
["Land_Unfinished_Building_01_F",[0,0,0],0,true,true,[["B_HMG_01_F",[-1.87305,5.36523,3.86831],0]],[[[-2.46289,-1.18555,3.68233],0],[[-1.72656,3.4668,6.88683],0]]]
];

_missionLandscape = [
     ["Land_u_Shed_Ind_F",[-29.123,-8.11914,-33.866],0,true,true],
     ["Land_Shed_08_brown_F",[-15.1465,25.9961,-33.871],0,true,true],
     ["Land_Shed_02_F",[26.5762,78.6641,-33.8547],0,true,true],
     ["Land_Wreck_AFV_Wheeled_01_F",[-5.21289,-20.9434,-33.8297],0,true,true],
     ["Sign_Sphere25cm_Geometry_F",[17.791,58.1797,-30.1429],0,true,true],
     ["Sign_Sphere10cm_F",[18.6504,21.3418,-33.8661],0,true,true],
     ["Sign_Sphere100cm_Geometry_F",[16.2227,56.002,-30.1063],0,true,true],
     ["Sign_Sphere100cm_F",[15.4902,57.0449,-30.1112],0,true,true]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["B_Truck_01_mover_F",[24.084,13.5703,-33.8635],0,75,75],
     ["B_MRAP_01_hmg_F",[3.02539,16.2363,-33.8629],0,75,75],
     ["B_T_Boat_Transport_01_F",[18.582,44.1055,-33.8654],0,75,75]
];

_submarinePatrolParameters = [

];

_airPatrols = [
     ["B_Heli_Light_01_dynamicLoadout_F",[-6.61523,8.89844,-33.864],0,1000,1000]
];

_missionEmplacedWeapons = [
     ["B_GMG_01_F",[-5.16211,-5.00586,-33.8644],0]
];

_missionGroups = [
     [[30.0605,46.2383,-33.8646],3,6,"Blue",30,45],
     [[5.66602,-8.33398,-33.8665],3,6,"Blue",30,45],
     [[47.1426,43.5,-26.9792],3,6,"Blue",30,45],
     [[46.4063,38.8477,-30.1837],3,6,"Blue",30,45],
     [[19.9512,-4.41797,-29.7975],3,6,"Blue",30,45],
     [[29.0625,-0.0332031,-33.6711],3,6,"Blue",30,45],
     [[33.7734,-2.30273,-33.5358],3,6,"Blue",30,45]
];

_scubaGroupParameters = [

];

_missionLootBoxes = [
     ["Box_IND_Wps_F",[10.7441,1.8418,-33.8658],_crateLoot,_lootCounts,0],
     ["Box_AAF_Equip_F",[13.2188,7.31445,-33.8656],_crateLoot,_lootCounts,0],
     ["Box_IND_AmmoOrd_F",[14.9844,13.168,-33.8657],_crateLoot,_lootCounts,0],
     ["Box_IND_WpsLaunch_F",[10.1504,-2.12109,-33.8658],_crateLoot,_lootCounts,0]
];

/*
	Use the parameters below to customize your mission - see the template or GMS_configs.sqf for details about each them
*/
_chanceHeliPatrol = GMS_chanceHeliPatrolBlue;
_noChoppers = GMS_noPatrolHelisBlue;
_missionHelis = GMS_patrolHelisBlue;
_chancePara = GMS_chanceParaBlue;
_noPara = GMS_noParaBlue;
_paraTriggerDistance = 400;
_paraSkill = 'Blue';
_chanceLoot = 0.0;
_paraLoot = GMS_BoxLoot_Blue;
_paraLootCounts = GMS_lootCountsBlue;
_missionLandscapeMode = "precise";
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;
_vests = GMS_vests;
_backpacks = GMS_backpacks;
_sideArms = GMS_Pistols;
_spawnCratesTiming = "atMissionSpawnGround";
_loadCratesTiming = "atMissionSpawn";
_endCondition = allKilledOrPlayerNear;
_minNoAI = GMS_MinAI_Blue;
_maxNoAI = GMS_MaxAI_Blue;
_noAIGroups = GMS_AIGrps_Blue;
_noVehiclePatrols = GMS_SpawnVeh_Blue;
_noEmplacedWeapons = GMS_SpawnEmplaced_Blue;
_minNoAI = GMS_MinAI_Blue;
_maxNoAI = GMS_MaxAI_Blue;
_noAIGroups = GMS_AIGrps_Blue;
_noVehiclePatrols = GMS_SpawnVeh_Blue;
_noEmplacedWeapons = GMS_SpawnEmplaced_Blue;

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";