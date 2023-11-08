

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
_startMsg = "The enemy has built a research complex - capture it and learn their technology";
_endMsg = "Patriouts Captured the Enemy Tech";
_timeoutMsg = "The Research Complex was packed by the enemy";
_showMarker = true;
_markerType = ["ELLIPSE",[150,150],"GRID"];
_markerColor = "ColorYellow";


_markerMissionName = "Complex";
/*
	Use the parameters below to customize your mission - see the template or GMS_configs.sqf for details about each them
*/
/*
	The following variables MUST be defined in each mission even if you just set them to 0
*/
_minNoAI = 2;
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
_endCondition = allKilledOrPlayerNear;
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
     ["Land_TentHangar_V1_F",[0,0,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Dome_Big_F",[1.43164,84.5488,7.15256e-006],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[0.140625,16.123,0],[[-0.0145872,-0.999894,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[0.322266,33.9277,0],[[-0.0145872,-0.999894,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[0.537109,51.4199,7.62939e-006],[[-0.0145872,-0.999894,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[8.79297,-2.13672,7.62939e-006],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[9.22266,32.2344,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-8.89453,15.5371,0],[[0,1,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[8.47266,11.5488,7.62939e-006],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[7.82031,42.2148,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-6.82031,42.4648,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[7.85156,24.7324,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-7.45508,24.8496,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-7.73047,6.9375,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[7.83984,6.74414,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-7.80273,-9.37695,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[7.9375,-9.375,0],[[0,1,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-9.06055,-2.33789,0],[[0,1,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-8.71875,33,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[-6.39844,52.0938,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[8.14063,52.0879,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_BarGate_01_open_F",[1.01953,49.5938,7.62939e-006],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[86.0469,84.8047,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[69.9219,84.8652,0],[[0.999953,-0.00966479,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[52.1172,84.959,0],[[0.999953,-0.00966479,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[34.623,85.0879,0],[[0.999953,-0.00966479,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[88.1387,93.6094,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[53.7656,93.8691,7.62939e-006],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[70.5527,75.834,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[74.4551,93.2188,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[43.793,92.418,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[43.6152,77.7754,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[61.2734,92.5332,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[61.2324,77.2266,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[79.1465,77.0391,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[79.2637,92.6113,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[95.4609,77.0488,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[95.3809,92.7891,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[88.4277,75.7559,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[53.0898,75.9238,7.62939e-006],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[33.9844,78.1504,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[33.918,92.6895,0],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_BarGate_01_open_F",[36.4473,85.582,7.62939e-006],[[-0.999988,-0.00492284,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[60.5098,24.6855,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[49.209,36.1855,0],[[0.696717,-0.717346,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[36.748,48.9043,0],[[0.696717,-0.717346,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[24.5313,61.4238,0],[[0.696717,-0.717346,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[68.2383,29.3926,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[44.2383,54,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[43.2344,29.3828,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[58.3359,38.8418,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[36.1895,60.0645,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[25.6602,49.8887,7.62939e-006],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[48.5742,47.7246,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[37.668,36.9844,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[50.1387,24.125,7.62939e-006],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[61.2852,34.998,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[61.623,12.5371,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[72.752,23.668,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[55.7559,16.625,7.62939e-006],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[31.0098,41.8555,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[19.1504,56.9961,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[29.4355,67.2734,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_BarGate_01_open_F",[26.1621,60.4746,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[1.08594,167.873,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[0.945313,151.75,0],[[0.0145872,0.999894,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[0.761719,133.943,0],[[0.0145872,0.999894,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[0.548828,116.453,0],[[0.0145872,0.999894,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-7.70703,170.008,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-8.13672,135.637,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[9.98047,152.336,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-7.38672,156.324,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-6.73438,125.658,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[7.90625,125.408,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-6.76563,143.141,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[8.54102,143.021,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[8.81641,160.936,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-6.75391,161.129,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[8.88867,177.248,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-6.85156,177.246,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[10.1465,170.209,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[9.80469,134.873,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[7.48438,115.777,7.62939e-006],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[-7.05469,115.785,7.62939e-006],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_BarGate_01_open_F",[0.0664063,118.279,0],[[-3.25841e-007,-1,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[61.584,144.074,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[50.084,132.773,0],[[0.717346,0.696717,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[37.3652,120.313,0],[[0.717346,0.696717,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[24.8457,108.096,0],[[0.717346,0.696717,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[56.877,151.803,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[32.2695,127.803,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[56.8867,126.799,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[47.4277,141.9,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[26.2031,119.754,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[36.3789,109.225,7.62939e-006],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[38.543,132.139,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[49.2852,121.232,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[62.1445,133.703,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[51.2715,144.85,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[73.7324,145.188,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[62.6016,156.316,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[69.6445,139.32,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[44.4141,114.574,7.62939e-006],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[29.2734,102.715,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[18.9961,113,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_BarGate_01_open_F",[25.7949,109.729,0],[[-0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-84.5488,85.6602,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-68.4258,85.5195,0],[[-0.999894,0.0145874,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-50.6211,85.3379,0],[[-0.999894,0.0145874,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-33.1289,85.123,0],[[-0.999894,0.0145874,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-86.6855,76.8672,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-52.3145,76.4375,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-69.0117,94.5547,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-73,77.1875,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-42.334,77.8398,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-42.084,92.4805,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-59.8164,77.8086,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-59.6992,93.1152,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-77.6113,93.3906,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-77.8047,77.8203,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-93.9258,93.4629,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-93.9238,77.7227,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-86.8867,94.7207,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-51.5488,94.3789,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[-32.4551,92.0586,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[-32.4609,77.5195,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_BarGate_01_open_F",[-34.9551,84.6406,0],[[1,-1.62921e-007,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-59.4121,25.4629,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-47.9121,36.7637,0],[[-0.717346,-0.696717,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-35.1934,49.2246,0],[[-0.717346,-0.696717,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-22.6738,61.4414,0],[[-0.717346,-0.696717,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-54.7051,17.7344,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-30.0977,41.7344,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-54.7148,42.7383,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-45.2559,27.6367,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-24.0332,49.7832,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-34.209,60.3125,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-36.373,37.3984,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-47.1133,48.3047,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-59.9727,35.834,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-49.0996,24.6875,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-71.5605,24.3496,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-60.4297,13.2207,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-67.4727,30.2168,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-42.2422,54.9629,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[-27.1016,66.8223,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[-16.8242,56.5371,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_BarGate_01_open_F",[-23.623,59.8105,0],[[0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-59.8086,145.133,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-48.5078,133.633,0],[[-0.696717,0.717346,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-36.0469,120.914,0],[[-0.696717,0.717346,0],[0,0,1]],[true,true]],
     ["Land_TentHangar_V1_F",[-23.8301,108.395,7.62939e-006],[[-0.696717,0.717346,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-67.5371,140.426,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-43.5371,115.818,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_PaperBox_closed_F",[-42.5332,140.436,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-57.6348,130.977,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-35.4883,109.752,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-24.959,119.928,7.62939e-006],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-47.873,122.092,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-36.9668,132.834,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-49.4375,145.693,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-60.584,134.82,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-60.9219,157.281,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Mil_ConcreteWall_F",[-72.0508,146.15,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-55.0547,153.193,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["CargoNet_01_box_F",[-30.3086,127.963,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[-18.4492,112.822,7.62939e-006],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_BagBunker_Small_F",[-28.7344,102.545,0],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_BarGate_01_open_F",[-25.4629,109.344,7.62939e-006],[[0.707107,-0.707107,0],[0,0,1]],[true,true]],
     ["Land_Research_house_V1_F",[-14.6191,96.209,0],[[-0.811639,0.584159,0],[0,0,1]],[true,true]],
     ["Land_Research_house_V1_F",[-17.6191,89.209,0],[[-0.987517,0.157514,0],[0,0,1]],[true,true]],
     ["Land_Research_house_V1_F",[-8.61914,101.209,0],[[-0.48405,0.87504,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[16.7207,70.457,0],[[0.78585,-0.618418,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[14.3438,72.2871,0],[[0.78585,-0.618418,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[11.9668,74.1172,0],[[0.78585,-0.618418,0],[0,0,1]],[true,true]],
     ["Land_Missle_Trolley_02_F",[14.8887,68.0801,7.62939e-006],[[0.610308,0.792164,0],[0,0,1]],[true,true]],
     ["Land_Missle_Trolley_02_F",[13.3047,69.3008,7.62939e-006],[[0.610308,0.792164,0],[0,0,1]],[true,true]],
     ["Land_Missle_Trolley_02_F",[11.7207,70.5215,0],[[0.610308,0.792164,0],[0,0,1]],[true,true]],
     ["Land_Missle_Trolley_02_F",[10.1367,71.7422,0],[[0.610308,0.792164,0],[0,0,1]],[true,true]],
     ["Land_Bomb_Trolley_01_F",[18.5508,72.832,7.62939e-006],[[0.610308,0.792164,0],[0,0,1]],[true,true]],
     ["Land_Bomb_Trolley_01_F",[16.9668,74.0527,0],[[0.610308,0.792164,0],[0,0,1]],[true,true]],
     ["Land_Bomb_Trolley_01_F",[15.3828,75.2734,0],[[0.610308,0.792164,0],[0,0,1]],[true,true]],
     ["Land_Bomb_Trolley_01_F",[13.7988,76.4941,0],[[0.610308,0.792164,0],[0,0,1]],[true,true]],
     ["Land_Limestone_01_apart_F",[79.4473,49.3945,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Limestone_01_apart_F",[30.5215,3.61523,7.62939e-006],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Limestone_01_apart_F",[-31.6211,3.17188,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Limestone_01_apart_F",[-81.8984,49.5801,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Limestone_01_apart_F",[-81.6191,118.209,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Limestone_01_apart_F",[-28.2129,166.77,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Limestone_01_apart_F",[42.1426,166.09,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Limestone_01_apart_F",[86.3809,116.209,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Research_house_V1_F",[-8.61914,69.209,0],[[-0.500001,-0.866025,0],[0,0,1]],[true,true]],
     ["Land_Research_house_V1_F",[-17.6191,81.209,0],[[-0.971886,-0.235452,0],[0,0,1]],[true,true]],
     ["Land_Research_house_V1_F",[-14.6191,74.209,0],[[-0.765269,-0.643711,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[20.3809,75.209,0],[[0.78585,-0.618418,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[18.0059,77.0391,7.62939e-006],[[0.78585,-0.618418,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[15.6289,78.8711,0],[[0.78585,-0.618418,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[12.7207,65.457,0],[[0.78585,-0.618418,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[10.3438,67.2871,0],[[0.78585,-0.618418,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[7.9668,69.1172,7.62939e-006],[[0.78585,-0.618418,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[15.3965,99.4297,0],[[0.679915,0.73329,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[13.3809,97.209,0],[[0.679915,0.73329,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[11.3652,94.9883,0],[[0.679915,0.73329,0],[0,0,1]],[true,true]],
     ["Land_Missle_Trolley_02_F",[17.6191,97.4121,0],[[-0.74024,0.672343,0],[0,0,1]],[true,true]],
     ["Land_Missle_Trolley_02_F",[16.2734,95.9316,0],[[-0.74024,0.672343,0],[0,0,1]],[true,true]],
     ["Land_Missle_Trolley_02_F",[14.9277,94.4512,7.62939e-006],[[-0.74024,0.672343,0],[0,0,1]],[true,true]],
     ["Land_Missle_Trolley_02_F",[13.584,92.9707,7.62939e-006],[[-0.74024,0.672343,0],[0,0,1]],[true,true]],
     ["Land_Bomb_Trolley_01_F",[13.1777,101.447,0],[[-0.74024,0.672343,0],[0,0,1]],[true,true]],
     ["Land_Bomb_Trolley_01_F",[11.834,99.9668,0],[[-0.74024,0.672343,0],[0,0,1]],[true,true]],
     ["Land_Bomb_Trolley_01_F",[10.4883,98.4863,7.62939e-006],[[-0.74024,0.672343,0],[0,0,1]],[true,true]],
     ["Land_Bomb_Trolley_01_F",[9.14258,97.0059,0],[[-0.74024,0.672343,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[10.957,103.463,0],[[0.679915,0.73329,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[8.94141,101.244,0],[[0.679915,0.73329,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[6.92188,99.0215,0],[[0.679915,0.73329,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[20.0566,95.0391,0],[[0.679915,0.73329,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[18.041,92.8184,0],[[0.679915,0.73329,0],[0,0,1]],[true,true]],
     ["Land_Pallets_stack_F",[16.0254,90.5957,0],[[0.679915,0.73329,0],[0,0,1]],[true,true]],
     ["Flag_AAF_F",[1.52539,84.9141,0],[[0,1,0],[0,0,1]],[true,true]]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["I_G_Offroad_01_armed_F",[-92.6191,44.25,-0.0695648],0],
     ["I_G_Offroad_01_armed_F",[99.3809,120.25,-0.0695648],0],
     ["B_MRAP_01_hmg_F",[-44.4746,-64.0879,-9.53674e-007],0],
     ["B_MRAP_01_hmg_F",[51.166,-37.9531,-9.53674e-007],0],
     ["B_MRAP_01_hmg_F",[113.33,37.5078,-9.53674e-007],0],
     ["B_MRAP_01_hmg_F",[106.877,155.121,-9.53674e-007],0],
     ["B_MRAP_01_hmg_F",[12.3516,206.08,-9.53674e-007],0],
     ["B_MRAP_01_hmg_F",[-73.5566,194.221,-9.53674e-007],0],
     ["B_MRAP_01_hmg_F",[-112.656,99.1992,-9.53674e-007],0]
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
     ["I_HMG_01_high_F", [-6.44727,51.6113,0], [[-0.00664572,-0.999978,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [7.9375,51.6426,0], [[-0.0580576,-0.998313,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [34.4668,78.1035,0], [[0.999999,-0.00172297,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [34.3652,92.4883,0], [[0.998587,-0.0531425,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [19.457,56.6211,0], [[0.702392,-0.71179,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [29.6055,66.8145,0], [[0.664861,-0.746967,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [7.5332,116.262,0], [[0.00664575,0.999978,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [-6.85156,116.229,0], [[0.0580577,0.998313,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [29.6484,103.021,0], [[0.71179,0.702392,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [19.4551,113.17,0], [[0.746967,0.664861,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [-32.9375,92.1074,0], [[-0.999978,0.00664612,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [-32.9063,77.7227,0], [[-0.998313,0.0580576,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [-27.4766,66.5156,0], [[-0.71179,-0.702392,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [-17.2832,56.3672,0], [[-0.746967,-0.664861,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [-18.7559,113.197,0], [[-0.702392,0.71179,0],[0,0,1]], "Orange"],
     ["I_HMG_01_high_F", [-28.9043,103.004,0], [[-0.664861,0.746967,0],[0,0,1]], "Orange"],
     ["B_Mortar_01_F", [-20.7266,142.725,4.76837e-007], [[0,1,0],[0,0,1]], "Orange"],
     ["B_Mortar_01_F", [60.8867,107.719,4.76837e-007], [[0,1,0],[0,0,1]], "Orange"],
     ["B_Mortar_01_F", [20.9961,30.9063,4.76837e-007], [[0,1,0],[0,0,1]], "Orange"],
     ["B_Mortar_01_F", [-57.6504,60.9199,4.76837e-007], [[0,1,0],[0,0,1]], "Orange"],
     ["B_static_AA_F", [27.4121,144.021,4.76837e-007], [[0,1,0],[0,0,1]], "Orange"],
     ["B_static_AA_F", [63.7617,62.998,4.76837e-007], [[0,1,0],[0,0,1]], "Orange"],
     ["B_static_AA_F", [-23.459,29.918,4.76837e-007], [[0,1,0],[0,0,1]], "Orange"],
     ["B_static_AA_F", [-55.627,109.328,0], [[0,1,0],[0,0,1]], "Orange"],
     ["B_static_AT_F", [-18.6582,0.21875,4.76837e-007], [[0,1,0],[0,0,1]], "Orange"],
     ["B_static_AT_F", [-82.4805,106.301,4.76837e-007], [[0,1,0],[0,0,1]], "Orange"],
     ["B_static_AT_F", [24.5254,159.914,0], [[0,1,0],[0,0,1]], "Orange"],
     ["B_static_AT_F", [65.3027,43.4902,0], [[0,1,0],[0,0,1]], "Orange"]
];

_missionGroups = [
     [[0.580078,25.0957,0.00144649],2,6,"Orange"],
     [[60.998,85.3125,0.00143886],2,6,"Orange"],
     [[43.2109,42.8555,0.00143886],2,6,"Orange"],
     [[0.505859,142.877,0.00143886],2,6,"Orange"],
     [[43.4648,126.826,0.00143886],2,6,"Orange"],
     [[-59.5039,85.1309,0.00143886],2,6,"Orange"],
     [[-41.293,42.8125,0.00143886],2,6,"Orange"],
     [[-42.5098,127.064,0.00143886],2,6,"Orange"],
     [[-1.61914,84.2598,0.00144649],2,6,"Orange"]
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