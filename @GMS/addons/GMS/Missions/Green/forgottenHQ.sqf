

/*
	Dynamic Mission Generated
	Using 3DEN Plugin for GMS by Ghostrider
	GMS 3DEN Plugin Version 1.42 : Build 24 : Build Date 10/19/23
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
_difficulty = "Green";
/*	Specify the chance this mission is spawned [0 .. 1.0]	*/
_chanceMissionSpawned = 1;
/*	 Set number of times a mission respawns or use -1 for inifinite respawns 	*/
_maxMissionRespawns = -1;
/* 	Add your Start, End and Timeout Messages Here  */
_startMsg = "Supply Lines were Cut off to an Enemy Base";
_endMsg = "Patriots Captured the Abandoned Base";
_timeoutMsg = "Troups were Rescued from the Abandoned Base";
_markerType = ["ELLIPSE",[150,150],"GRID"];
_markerColor = "ColorGreen";


_markerMissionName = "Forgotten-HQ";
/*
	Use the parameters below to customize your mission - see the template or GMS_configs.sqf for details about each them
*/
/*
	The following variables MUST be defined in each mission even if you just set them to 0
*/
_minNoAI = 3;
_maxNoAI = 6;
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
     ["Land_New_WiredFence_10m_F",[-18.3555,-32.1956,0],[[1,-4.37114e-008,0],[0,0,1]],[true,true]],
     ["Land_New_WiredFence_10m_F",[-13.6484,-37.1428,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_New_WiredFence_10m_F",[-3.90039,-37.0354,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Razorwire_F",[-10.4453,-39.644,0],[[0,1,0],[0,0,1]],[false,false]],
     ["Land_CncWall4_F",[-14.4285,-24.2715,0],[[1,-4.37114e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-12.1785,-26.5215,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-7.67847,-25.7715,0],[[-0.5,0.866025,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-14.1785,-21.0215,0],[[0.965926,-0.258819,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-8.92847,-26.2715,0],[[-0.258819,0.965926,0],[0,0,1]],[true,true]],
     ["Land_New_WiredFence_10m_Dam_F",[-18.4004,-22.2854,0.0498819],[[1,-4.37114e-008,0],[0,0,1]],[true,true]],
     ["Land_New_WiredFence_10m_F",[-18.4004,-12.2854,0],[[1,-4.37114e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-27.4004,-1.7854,0],[[1,-4.37114e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-27.4004,3.4646,0],[[1,-4.37114e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-27.428,8.65454,0],[[1,-4.37114e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-14.0264,-17.7117,0],[[1,-4.37114e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-18.9004,-6.7854,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-24.2754,-6.7854,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-13.5254,-6.7854,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-5.90039,-1.4104,0],[[-1,1.19249e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-5.90039,3.8396,0],[[-1,1.19249e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-14.0264,-12.4617,0],[[1,-4.37114e-008,0],[0,0,1]],[true,true]],
     ["Land_CncShelter_F",[-9.78467,-6.80688,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-13.7764,-9.21167,0],[[0.965926,-0.258819,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-13.2764,-7.96167,0],[[0.866025,-0.5,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-8.02539,-6.1604,0],[[-0.258819,0.965926,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-27.1504,-6.2854,0],[[0.866025,0.5,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-27.4004,-5.0354,0],[[1,-4.37114e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-7.02539,-5.5354,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-6.27539,-4.5354,0],[[-0.866025,0.5,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-25.178,10.9045,0],[[-8.74228e-008,-1,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-14.678,10.9045,0],[[-8.74228e-008,-1,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-19.928,10.9045,0],[[-8.74228e-008,-1,0],[0,0,1]],[true,true]],
     ["Land_Mil_WiredFence_Gate_F",[-2.16187,-25.425,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_New_WiredFence_10m_F",[25.8872,-32.26,0],[[-1,1.19249e-008,0],[0,0,1]],[true,true]],
     ["Land_New_WiredFence_10m_F",[16.0996,-36.7854,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Razorwire_F",[19.8977,-39.5229,0],[[0,1,0],[0,0,1]],[false,false]],
     ["Land_CncWall4_F",[10.1804,-23.9321,0],[[-1,1.19249e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[7.80151,-26.3557,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_LampShabby_F",[-6.52686,-25.8889,0],[[0.992881,-0.119112,0],[0,0,1]],[true,true]],
     ["Land_New_WiredFence_5m_F",[23.6377,-36.76,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[4.55151,-26.1057,0],[[0.258819,0.965926,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[3.31421,-25.5764,0],[[0.5,0.866025,0],[0,0,1]],[true,true]],
     ["Land_New_WiredFence_10m_F",[25.8496,-12.5354,0],[[-1,1.19249e-008,0],[0,0,1]],[true,true]],
     ["Land_New_WiredFence_10m_F",[25.8872,-22.51,0],[[-1,1.19249e-008,0],[0,0,1]],[true,true]],
     ["Land_New_WiredFence_10m_F",[25.8496,-2.5354,0],[[-1,1.19249e-008,0],[0,0,1]],[true,true]],
     ["Land_LampShabby_F",[19.5425,4.09277,0],[[-0.707107,0.707107,0],[0,0,1]],[true,true]],
     ["Land_New_WiredFence_5m_F",[23.8496,2.2146,0],[[-8.74228e-008,-1,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[7.97778,25.4158,0],[[-0.00486834,-0.999988,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[13.2278,25.3901,0],[[-0.00486834,-0.999988,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[18.4778,25.3647,0],[[-0.00486834,-0.999988,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[2.93652,16.9402,0],[[0.999988,-0.00486817,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[2.96265,22.3152,0],[[0.999988,-0.00486817,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[2.9104,11.5654,0],[[0.999988,-0.00486817,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[12.3108,2.56152,0],[[0.00486801,0.999988,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[17.5608,2.53589,0],[[0.00486801,0.999988,0],[0,0,1]],[true,true]],
     ["Land_CncShelter_F",[2.32324,7.75513,0],[[0.999988,-0.00486817,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[20.2866,2.97827,0],[[-0.858951,0.512058,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[3.15112,4.8584,0],[[0.970859,0.239653,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[3.47681,25.1877,0],[[0.495778,-0.868449,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[4.72803,25.4316,0],[[-0.00486834,-0.999988,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[20.5847,4.11572,0],[[-0.999902,0.0139795,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[3.51563,3.93213,0],[[0.860015,0.510269,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[4.24536,3.01343,0],[[0.698643,0.71547,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[20.7168,23.1038,0],[[-0.999988,0.0048685,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[20.6658,12.604,0],[[-0.999988,0.0048685,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[20.6912,17.8538,0],[[-0.999988,0.0048685,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[20.5862,7.38672,0],[[-0.999988,0.0048685,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[7.13916,2.61255,0],[[0.00486801,0.999988,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[3.03174,5.96509,0],[[0.999929,0.0118984,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[-9.45532,10.9089,0],[[-8.74228e-008,-1,0],[0,0,1]],[true,true]],
     ["Land_CncShelter_F",[0.789795,7.76099,0],[[0.999988,-0.00486817,0],[0,0,1]],[true,true]],
     ["Land_CncShelter_F",[-0.743408,7.76733,0],[[0.999988,-0.00486817,0],[0,0,1]],[true,true]],
     ["Land_CncShelter_F",[-2.27686,7.77319,0],[[0.999988,-0.00486817,0],[0,0,1]],[true,true]],
     ["Land_CncShelter_F",[-3.8125,7.80005,0],[[0.999988,-0.00486817,0],[0,0,1]],[true,true]],
     ["Land_CncShelter_F",[-5.34595,7.80591,0],[[0.999988,-0.00486817,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-6.49219,10.5552,0],[[-0.624922,-0.780687,0],[0,0,1]],[true,true]],
     ["Land_CncWall1_F",[-5.91309,9.65894,0],[[-0.964977,-0.262334,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[10.1643,-18.6609,0],[[-1,1.19249e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[10.1365,-13.4321,0],[[-1,1.19249e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[10.1299,-8.19946,0],[[-1,1.19249e-008,0],[0,0,1]],[true,true]],
     ["Land_CncWall4_F",[10.0952,-2.94043,0],[[-1,1.19249e-008,0],[0,0,1]],[true,true]],
     ["Land_CncShelter_F",[9.8562,0.904053,0],[[0.999988,-0.00486817,0],[0,0,1]],[true,true]],
     ["Land_Cargo_Patrol_V2_F",[6.46533,-25.4761,4.76837e-007],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Cargo_Patrol_V2_F",[-11.0146,-25.5461,4.76837e-007],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Cargo_Tower_V2_F",[-11.9417,-15.0161,0],[[-8.74228e-008,-1,0],[0,0,1]],[true,true]],
     ["Land_Cargo_HQ_V2_F",[-15.6506,2.46484,4.76837e-007],[[-8.74228e-008,-1,0],[0,0,1]],[true,true]],
     ["Land_Cargo_HQ_V2_F",[12.1704,13.645,4.76837e-007],[[-0.999988,0.00486945,0],[0,0,1]],[true,true]],
     ["Land_LampShabby_F",[2.23706,-25.3005,0],[[-0.998989,-0.0449544,0],[0,0,1]],[true,true]],
     ["Land_LampShabby_F",[-7.0752,-4.9104,0],[[-0.827212,0.56189,0],[0,0,1]],[true,true]],
     ["Land_Mil_WiredFence_Gate_F",[6.04468,-37.2148,0],[[0,1,0],[0,0,1]],[false,false]],
     ["RoadCone_L_F",[0,0,0],[[0,1,0],[0,0,1]],[true,true]],
     ["Land_Wreck_Heli_Attack_02_F",[18.4558,-12.8799,0],[[0,1,0],[0,0,1]],[false,false]],
     ["Land_HelipadSquare_F",[19.0627,-13.9656,0],[[0,1,0],[0,0,1]],[true,true]]
];

_simpleObjects = [
     ["Land_GarbageContainer_open_F",[0.382813,5.26196,0],[[-0.601341,-0.798993,0],[0,0,1]]],
     ["Land_GarbageBarrel_01_english_F",[5.41968,4.60913,0],[[0,1,0],[0,0,1]]],
     ["Land_GarbageBarrel_02_F",[-4.41113,4.93213,0],[[0,1,0],[0,0,1]]]
];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["O_G_Offroad_01_armed_F",[-5.87256,-56.0386,-0.000406742],85.3793],
     ["O_G_Offroad_01_armed_F",[38.0215,-8.37378,-0.000406742],0]
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
     ["O_static_AA_F", [-14.0261,6.37183,3.12652], [[0,1,0],[0,0,1]], "Green"],
     ["O_static_AT_F", [16.2478,11.7761,3.12649], [[0,1,0],[0,0,1]], "Green"],
     ["O_G_HMG_02_high_F", [11.3267,19.4883,3.12651], [[0,1,0],[0,0,1]], "Green"],
     ["O_G_HMG_02_high_F", [-20.4929,-0.878662,3.12651], [[0,1,0],[0,0,1]], "Green"],
     ["O_G_HMG_02_high_F", [-16.4905,-14.2576,17.8895], [[0,1,0],[0,0,1]], "Green"],
     ["O_G_HMG_02_high_F", [-8.28198,-11.6777,17.8895], [[0,1,0],[0,0,1]], "Green"],
     ["O_G_HMG_02_high_F", [-9.94043,-26.7229,4.34404], [[-0.0560696,-0.998427,0],[0,0,1]], "Green"],
     ["O_G_HMG_02_high_F", [4.97485,-26.5686,4.34404], [[-0.0560696,-0.998427,0],[0,0,1]], "Green"]
];

_missionGroups = [
     [[17.8589,-26.3235,0.00143909],3,6,"Green"],
     [[-4.46997,-15.7871,0.00143909],3,6,"Green"],
     [[-17.113,2.33203,3.12796],3,6,"Green"],
     [[12.0044,13.1301,3.12796],3,6,"Green"],
     [[3.88916,-13.1367,0.00143909],3,6,"Green"],
     [[-5.04761,-30.8381,0.00143909],3,6,"Green"]
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