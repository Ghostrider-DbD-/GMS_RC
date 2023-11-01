/*
	Static Mission Generated
	Using 3DEN Plugin for GMS by Ghostrider
	GMS 3DEN Plugin Version 1.42 : Build 24 : Build Date 10/19/23
	By Ghostrider-GRG-
*/

/*
	Do not touch the code below 
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf" 

/*
 	Edit these to suite you specific mission
*/
_difficulty = "Green";
/*	Specify the chance this mission is spawned [0 .. 1.0]	*/
_chanceMissionSpawned = 1;
/*	 Set number of times a mission respawns or use -1 for inifinite respawns 	*/
_maxMissionRespawns = -1;
/* 	Add your Start, End and Timeout Messages Here  */
_startMsg = "Enemy fortification has been spotted and marked on the map (GREEN)";
_endMsg = "Enemy fortification has been cleared of enemy forces and looted!";
_timeoutMsg = "Enemy fortifcation is advancing to a new position.";
_markerType = ["ELLIPSE",[500,500],"SOLID"];
_markerColor = "ColorGreen";


_markerMissionName = "Fortification Situation";
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
_chanceLoot = 0.99;
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
_endCondition = allKilledOrPlayerNear;
_submarinePatrols = 0;
_scubaPatrols = 0;

_crateLoot = GMS_BoxLoot_Green;
_lootCounts = [12,30,20,40,40,5]; 
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
     //["RoadCone_F",[0.000244141,0,0],0,[true,true]],
     ["Land_New_WiredFence_10m_F",[-17.3971,-12.207,0],90,[true,true]],
     ["Land_New_WiredFence_10m_F",[-12.6901,-17.1543,0],0,[true,true]],
     ["Land_New_WiredFence_10m_F",[-2.94202,-17.0488,0],0,[true,true]],
     ["Land_CncWall4_F",[-16.442,-12.7988,0],90,[true,true]],
     ["Land_CncWall4_F",[-14.192,-15.0488,0],0,[true,true]],
     ["Land_CncWall1_F",[-9.69202,-14.2988,0],330,[true,true]],
     ["Land_CncWall1_F",[-16.192,-9.54883,0],105,[true,true]],
     ["Land_CncWall1_F",[-12.3523,-4.53271,0],75,[true,true]],
     ["Land_CncWall1_F",[-10.942,-14.7988,0],345,[true,true]],
     ["Land_BagFence_Round_F",[-3.07043,-18.8027,0],120,[true,true]],
     ["Land_BagFence_Round_F",[-2.81995,-22.5527,0],45,[true,true]],
     ["Land_PortableLight_double_F",[-10.6539,-4.46484,0],270,[true,true]],
     ["Land_BagFence_Long_F",[0.805054,-21.8027,0],90,[true,true]],
     ["Land_BagFence_Long_F",[-0.569458,-23.3027,0],180,[true,true]],
     ["Land_BagFence_Short_F",[-3.44543,-20.6777,0],270,[true,true]],
     ["Land_BagFence_End_F",[1.16248,-20.2988,0],330,[true,true]],
     ["Land_BagFence_End_F",[-1.69397,-17.9277,0],0,[true,true]],
     ["Land_New_WiredFence_10m_Dam_F",[-17.442,-2.29883,0.0166931],90,[true,true]],
     ["Land_New_WiredFence_10m_F",[-27.442,17.4512,0],90,[true,true]],
     ["Land_New_WiredFence_10m_F",[-27.442,27.4512,0],90,[true,true]],
     ["Land_New_WiredFence_10m_F",[-22.942,12.9512,0],0,[true,true]],
     ["Land_New_WiredFence_10m_F",[-17.442,7.70117,0],90,[true,true]],
     ["Land_CncWall4_F",[-26.442,18.2012,0],90,[true,true]],
     ["Land_CncWall4_F",[-26.442,23.4512,0],90,[true,true]],
     ["Land_CncWall4_F",[-26.442,28.7012,0],90,[true,true]],
     ["Land_CncWall4_F",[-13.192,-0.298828,0],90,[true,true]],
     ["Land_CncWall4_F",[-17.942,13.2012,0],0,[true,true]],
     ["Land_CncWall4_F",[-23.317,13.2012,0],0,[true,true]],
     ["Land_CncWall4_F",[-12.567,13.2012,0],0,[true,true]],
     ["Land_CncWall4_F",[-4.94202,18.5762,0],270,[true,true]],
     ["Land_CncWall4_F",[-4.94202,23.8262,0],270,[true,true]],
     ["Land_CncWall4_F",[-13.192,4.95117,0],90,[true,true]],
     ["Land_CncShelter_F",[-8.82629,13.1797,0],0,[true,true]],
     ["Land_CncWall1_F",[-5.19202,26.9512,0],240,[true,true]],
     ["Land_CncWall1_F",[-12.8688,-3.29199,0],60,[true,true]],
     ["Land_CncWall1_F",[-7.06702,13.8262,0],345,[true,true]],
     ["Land_CncWall1_F",[-26.192,13.7012,0],60,[true,true]],
     ["Land_CncWall1_F",[-26.442,14.9512,0],90,[true,true]],
     ["Land_CncWall1_F",[-6.06702,27.8262,0],210,[true,true]],
     ["Land_CncWall1_F",[-6.06702,14.4512,0],315,[true,true]],
     ["Land_BagFence_Round_F",[0.667358,5.98389,0],45,[true,true]],
     ["Land_BagFence_Long_F",[-5.06946,-1.92773,0],270,[true,true]],
     ["Land_BagFence_Long_F",[-4.94495,5.57227,0],90,[true,true]],
     ["Land_BagFence_Long_F",[-6.44543,-3.30273,0],180,[true,true]],
     ["Land_BagFence_Long_F",[-6.32043,4.19727,0],180,[true,true]],
     ["Land_BagFence_Long_F",[-6.44006,-0.248047,0],180,[true,true]],
     ["Land_BagFence_Long_F",[-6.32043,6.94531,0],180,[true,true]],
     ["Land_BagFence_Short_F",[0.0428467,7.98193,0],90,[true,true]],
     ["Land_CncWall1_F",[-5.31702,15.4512,0],300,[true,true]],
     ["Land_New_WiredFence_10m_F",[-2.69202,31.9512,0],180,[true,true]],
     ["Land_New_WiredFence_10m_F",[-22.692,31.9512,0],180,[true,true]],
     ["Land_New_WiredFence_10m_F",[-12.692,31.9512,0],180,[true,true]],
     ["Land_CncWall4_F",[-24.192,30.9512,0],180,[true,true]],
     ["Land_CncWall4_F",[-13.692,30.9512,0],180,[true,true]],
     ["Land_CncWall4_F",[-18.942,30.9512,0],180,[true,true]],
     ["Land_CncWall4_F",[-8.94202,29.5762,0],210,[true,true]],
     ["Land_BarGate_F",[7.05798,-19.5488,0],0,[true,true]],
     ["Land_Mil_WiredFence_Gate_F",[7.05798,-17.291,0],0,[true,true]],
     ["Land_New_WiredFence_10m_F",[26.8456,-12.2734,0],270,[true,true]],
     ["Land_New_WiredFence_10m_F",[17.058,-16.7988,0],0,[true,true]],
     ["Land_CncWall4_F",[26.308,-14.0488,0],270,[true,true]],
     ["Land_CncWall4_F",[24.058,-16.2988,0],0,[true,true]],
     ["Land_LampShabby_F",[11.8925,-17.8911,0],210,[true,true]],
     ["Land_New_WiredFence_5m_F",[24.5961,-16.7734,0],0,[true,true]],
     ["Land_CncWall1_F",[20.808,-16.0488,0],15,[true,true]],
     ["Land_CncWall1_F",[19.5707,-15.5176,0],30,[true,true]],
     ["Land_CncWall1_F",[26.058,-10.7988,0],255,[true,true]],
     ["Land_BagFence_Round_F",[17.2993,-23.501,0],315,[true,true]],
     ["Land_BagFence_Round_F",[15.1729,-23.501,0],45,[true,true]],
     ["Land_BagFence_Long_F",[18.0488,-21.376,0],90,[true,true]],
     ["Land_CncBarrier_F",[2.30554,-13.3027,0],270,[true,true]],
     ["Land_BagFence_Short_F",[14.5483,-21.626,0],90,[true,true]],
     ["Land_BagFence_Corner_F",[17.6738,-20.001,0],0,[true,true]],
     ["Land_BagFence_End_F",[14.2983,-20.501,0],240,[true,true]],
     ["Land_BagFence_End_F",[16.7993,-19.501,0],210,[true,true]],
     ["Land_CncBarrier_F",[12.0555,-13.1777,0],270,[true,true]],
     ["Land_New_WiredFence_10m_Dam_F",[2.05798,27.4512,0.0166931],270,[true,true]],
     ["Land_New_WiredFence_10m_Dam_F",[7.30798,22.3262,0.0166273],180,[true,true]],
     ["Land_New_WiredFence_10m_F",[26.808,7.45117,0],270,[true,true]],
     ["Land_New_WiredFence_10m_F",[26.8456,-2.52344,0],270,[true,true]],
     ["Land_New_WiredFence_10m_F",[17.308,22.2012,0],180,[true,true]],
     ["Land_New_WiredFence_10m_F",[26.808,17.4512,0],270,[true,true]],
     ["Land_LampShabby_F",[22.7451,1.04785,0],326.67,[true,true]],
     ["Land_New_WiredFence_5m_F",[24.808,22.2012,0],180,[true,true]],
     ["Land_BagFence_Long_F",[3.16785,5.35889,0],0,[true,true]],
     ["Land_Cargo_HQ_V1_F",[-14.6925,22.4512,4.76837e-007],180,[true,true]],
     ["Land_Cargo_Tower_V1_F",[-11.1075,2.39648,0],180,[true,true]],
     ["Land_Cargo_Patrol_V1_F",[-13.1925,-13.7988,4.76837e-007],0,[true,true]],
     ["Land_Cargo_Patrol_V1_F",[23.8075,-13.7988,4.76837e-007],0,[true,true]],
     ["Land_Cargo_HQ_V1_F",[16.0769,9.9126,4.76837e-007],271.492,[true,true]],
     ["Land_Mil_WallBig_4m_F",[1.5575,16.2012,0],0,[true,true]],
     ["Land_Mil_WallBig_4m_F",[3.47852,17.8452,0],270,[true,true]],
     ["Land_Mil_WallBig_4m_F",[5.73242,20.0171,0],0,[true,true]],
     ["Land_Mil_WallBig_4m_F",[9.66919,20.0229,0],0,[true,true]],
     ["Land_Mil_WallBig_4m_F",[13.6675,20.0327,0],0,[true,true]],
     ["Land_Mil_WallBig_4m_F",[17.6042,20.0386,0],0,[true,true]],
     ["Land_Mil_WallBig_4m_F",[21.4601,20.0503,0],0,[true,true]],
     ["Land_Mil_WallBig_4m_F",[23.7844,17.8921,0],90,[true,true]],
     ["Land_Mil_WallBig_4m_F",[23.7772,13.9048,0],90,[true,true]],
     ["Land_Mil_WallBig_4m_F",[23.7764,9.96191,0],90,[true,true]],
     ["Land_Mil_WallBig_4m_F",[23.7692,5.97461,0],90,[true,true]],
     ["Land_Mil_WallBig_4m_F",[23.7717,1.99707,0],90,[true,true]],
     ["Land_Mil_WallBig_4m_F",[21.4475,0.118164,0],180,[true,true]],
     ["Land_Mil_WallBig_4m_F",[0.0574951,10.9512,0],270,[true,true]],
     ["Land_Mil_WallBig_4m_F",[2.37622,8.80615,0],180,[true,true]],
     ["Land_Mil_WallBig_4m_F",[10.274,1.41064,0],180,[true,true]],
     ["Land_Mil_WallBig_4m_F",[14.2386,1.41455,0],180,[true,true]],
     ["Land_Mil_WallBig_4m_F",[7.93433,3.55908,0],270,[true,true]],
     ["Land_LampShabby_F",[2.20422,-17.9136,0],149.832,[true,true]],
     ["Land_BagFence_Round_F",[-22.4745,-11.0161,0],45.9826,[true,true]],
     ["Land_BagFence_Round_F",[-22.438,-8.89014,0],135.983,[true,true]],
     ["Land_BagFence_Long_F",[-20.3627,-11.8018,0],180.983,[true,true]],
     ["Land_BagFence_Short_F",[-20.5526,-8.29785,0],180.983,[true,true]],
     ["Land_BagFence_Corner_F",[-18.9814,-11.4507,0],90.9826,[true,true]],
     ["Land_BagFence_End_F",[-19.4235,-8.06689,0],330.983,[true,true]],
     ["Land_BagFence_End_F",[-18.4666,-10.585,0],300.983,[true,true]],
     ["Land_CncWall4_F",[-13.187,10.1655,0],90,[true,true]]
];

_simpleObjects = [

];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["B_G_Offroad_01_armed_F",[3.73694,41.4546,-0.000406742],90.3104],
     ["B_G_Offroad_01_armed_F",[9.8562,-30.7666,-0.000406742],268.527]
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
     ["B_HMG_01_high_F", [-7.93469,7.31006,17.7919], 0, "Green"],
     ["B_HMG_01_high_F", [-15.8958,3.33203,17.8895], 270.571, "Green"],
     ["B_HMG_01_high_F", [1.64697,7.00488,0], 225.182, "Green"],
     ["B_HMG_01_high_F", [-12.038,-14.6909,4.34404], 180.765, "Green"],
     ["B_HMG_01_high_F", [-21.3744,-9.83594,0], 270.389, "Green"],
     ["B_HMG_01_high_F", [-1.46167,-21.6738,0], 181.165, "Green"],
     ["B_HMG_01_high_F", [15.9822,-22.2935,0], 181.165, "Green"],
     ["B_HMG_01_high_F", [25.0822,-14.6479,4.34404], 170.747, "Green"],
     ["B_HMG_01_high_F", [-20.999,23.5669,3.12652], 169.972, "Green"],
     ["B_static_AA_F", [15.3031,14.8389,3.12652], 0, "Green"],
     ["B_static_AA_F", [-7.74854,3.9292,17.8895], 119.493, "Green"]
];

_missionGroups = [
     [[17.535,9.26514,3.12796],2,3,"Green"],
     [[-13.558,24.0972,3.12796],2,3,"Green"],
     [[3.74072,13.2544,0.00143909],2,3,"Green"],
     [[-3.54211,-13.5405,0.00143909],2,3,"Green"],
     [[22.109,-4.81934,0.00143909],2,3,"Green"],
     [[-12.3046,24.1689,0.603113],2,3,"Green"],
     [[-6.83374,21.272,0.00143909],2,3,"Green"],
     [[4.87683,-6.9248,0.00143909],2,3,"Green"],
     [[-1.02954,26.0737,0.00143909],2,3,"Green"],
     [[-9.27332,9.60596,0.00143909],2,3,"Green"]
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