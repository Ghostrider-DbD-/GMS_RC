

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
_startMsg = "An Enemy Mobile Repair Base was Spotted";
_endMsg = "Patriots Captured the Mobile Repair Base";
_timeoutMsg = "The Mobile Repair Base was Moved";
_markerType = ["ELLIPSE",[150,150],"GRID"];
_markerColor = "ColorGreen";


_markerMissionName = "Repair";
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
     ["RoadCone_F",[0,-0.00012207,0],[[0,1,0],[0,0,1]],[true,true]],
     ["SatelliteAntenna_01_Small_Mounted_Sand_F",[-4.17383,-13.4924,0.967989],[[-8.74228e-008,-1,0],[0,0,1]],[false,false]],
     ["PowerCable_01_Roll_F",[6.1665,4.86768,0],[[-0.111662,0.993746,0],[0,0,1]],[false,false]],
     ["PowerCable_01_CurveLong_F",[6.23193,7.87097,0],[[0.306936,-0.95173,0],[0,0,1]],[false,false]],
     ["Land_WaterTank_03_F",[6.58154,0.189209,0],[[0,1,0],[0,0,1]],[false,false]],
     ["PressureHose_01_CurveShort_F",[-7.11719,-6.68701,0],[[0,1,0],[0,0,1]],[false,false]],
     ["PressureHose_01_Roll_F",[-7.04541,-6.38599,0],[[-1,1.19249e-008,0],[0,0,1]],[false,false]],
     ["PressureHose_01_Roll_F",[-6.90527,-6.29211,0],[[0.500002,0.866024,0],[0,0,1]],[false,false]],
     ["PressureHose_01_Step_F",[-5.86035,-4.71497,0],[[1,-4.37114e-008,0],[0,0,1]],[false,false]],
     ["PressureHose_01_CurveShort_F",[-7.1167,-5.46082,0],[[-1.51793e-006,-1,0],[0,0,1]],[false,false]],
     ["PressureHose_01_CurveShort_F",[-8.90918,-7.52954,0],[[-0.707107,0.707107,0],[0,0,1]],[false,false]],
     ["PressureHose_01_CurveShort_F",[-7.97559,-8.23877,0],[[-0.707107,-0.707107,0],[0,0,1]],[false,false]],
     ["PressureHose_01_CurveShort_F",[-6.18115,-7.76135,0],[[0.707107,0.707107,0],[0,0,1]],[false,false]],
     ["PressureHose_01_CurveShort_F",[-4.79834,-7.41284,0],[[-0.707107,-0.707107,0],[0,0,1]],[false,false]],
     ["PressureHose_01_CurveShort_F",[-8.19873,-6.59875,0],[[0.707107,0.707107,0],[0,0,1]],[false,false]],
     ["PressureHose_01_StraightLong_F",[-3.7373,-1.36377,0],[[-0.5,-0.866025,0],[0,0,1]],[false,false]],
     ["PressureHose_01_CurveShort_F",[-6.50635,-5.1748,0],[[0.258819,-0.965926,0],[0,0,1]],[false,false]],
     ["Land_SignM_WarningMilitaryVehicles_english_F",[-2.91553,7.83508,0],[[-8.74228e-008,-1,0],[0,0,1]],[false,false]],
     ["Land_SignM_WarningMilitaryVehicles_english_F",[4.06738,7.84119,0],[[-8.74228e-008,-1,0],[0,0,1]],[false,false]],
     ["Land_Sign_WarningUnexplodedAmmo_F",[-2.07568,-5.03625,0],[[-8.74228e-008,-1,0],[0,0,1]],[false,false]],
     ["Land_Sign_WarningUnexplodedAmmo_F",[3.28369,-5.03625,0],[[-8.74228e-008,-1,0],[0,0,1]],[false,false]]
];

_simpleObjects = [
     ["DeconShower_02_F",[0.626465,6.93408,0],[[0,1,0],[0,0,1]]],
     ["DeconShower_02_F",[0.626465,-5.19287,0],[[0,1,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[-4.50781,-10.5598,-4.76837e-007],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[-1.4707,-10.5598,-4.76837e-007],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[-2.9248,-10.5598,-4.76837e-007],[[0,1,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[-2.19531,-10.5598,-4.76837e-007],[[0,1,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[3.73438,-10.5598,-4.76837e-007],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[6.04639,-10.5598,-4.76837e-007],[[0,1,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[3.00928,-10.5598,-4.76837e-007],[[0,1,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[4.46338,-10.5598,-4.76837e-007],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[6.04541,-10.5598,-4.76837e-007],[[0,1,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[-3.40137,-7.83191,-4.76837e-007],[[-1,1.19249e-008,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[4.64648,-7.83191,-4.76837e-007],[[-1,1.19249e-008,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[3.95117,-7.83191,-4.76837e-007],[[-1,1.19249e-008,0],[0,0,1]]],
     ["Land_PortableDesk_01_sand_F",[-2.70654,-7.83191,-4.76837e-007],[[-1,1.19249e-008,0],[0,0,1]]],
     ["Land_PortableCabinet_01_7drawers_sand_F",[-5.22949,-10.6586,0.886934],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_PortableCabinet_01_7drawers_sand_F",[-3.72363,-10.6769,0.886934],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_PortableCabinet_01_7drawers_sand_F",[-2.21484,-10.7296,0.896172],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_PortableCabinet_01_7drawers_sand_F",[-0.701172,-10.6559,0.886934],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_PortableCabinet_01_7drawers_sand_F",[2.2793,-10.3535,0],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_PortableCabinet_01_7drawers_sand_F",[2.28613,-10.714,0.886934],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_PortableCabinet_01_7drawers_sand_F",[6.01514,-10.7104,0.896172],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_BoreSighter_01_F",[-3.22656,-7.77576,0.896172],[[0.258819,-0.965926,0],[0,0,1]]],
     ["Land_TankRoadWheels_01_single_F",[-3.47266,-8.6615,0],[[0,1,0],[0,0,1]]],
     ["Land_TankSprocketWheels_01_single_F",[3.54395,-8.57898,4.76837e-007],[[0,1,0],[0,0,1]]],
     ["Land_TankTracks_01_short_F",[4.26563,-7.85278,0.896171],[[-0.258819,-0.965926,0],[0,0,1]]],
     ["Land_TorqueWrench_01_F",[-2.9873,-8.69043,0.886935],[[0,1,0],[0,0,1]]],
     ["Land_DrillAku_F",[-3.84961,-10.4668,0.886934],[[1,-1.62921e-007,0],[0,0,1]]],
     ["Land_FireExtinguisher_F",[-2.50977,-8.6803,0],[[-1,1.19249e-008,0],[0,0,1]]],
     ["Land_File_F",[-3.3916,-7.26685,0.886934],[[-0.707107,0.707107,0],[0,0,1]]],
     ["Land_PlasticBucket_01_closed_F",[-2.61768,-7.04041,0],[[-0.965926,0.258819,0],[0,0,1]]],
     ["Land_Grinder_F",[4.5415,-8.75476,0.886934],[[0.866025,-0.5,0],[0,0,1]]],
     ["Land_Hammer_F",[4.73047,-7.43787,0.886935],[[0,1,0],[0,0,1]]],
     ["Land_Crowbar_01_F",[4.2583,-7.0448,0.886934],[[-0.866025,-0.5,0],[0,0,1]]],
     ["Land_Screwdriver_V1_F",[3.80127,-8.91675,0.886934],[[-0.965926,0.258819,0],[0,0,1]]],
     ["Land_WeldingTrolley_01_F",[-5.3584,-0.522827,0],[[-1,1.19249e-008,0],[0,0,1]]],
     ["Land_ToolTrolley_02_F",[4.80225,-3.47546,0],[[0.5,0.866025,0],[0,0,1]]],
     ["Land_CarBattery_02_F",[5.38477,-10.3888,0.886935],[[-1,1.19249e-008,0],[0,0,1]]],
     ["Land_CarBattery_01_F",[-2.73242,-6.53577,-4.76837e-007],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_CarBattery_02_F",[6.78125,-10.495,0.886935],[[-1,1.19249e-008,0],[0,0,1]]],
     ["Land_FMradio_F",[-0.93457,-10.3088,0.886934],[[0.258819,0.965926,0],[0,0,1]]],
     ["Land_Laptop_unfolded_F",[-2.62256,-7.03479,0.886935],[[1,-4.37114e-008,0],[0,0,1]]],
     ["Land_Portable_generator_F",[-5.22656,-2.0708,-4.76837e-007],[[1,-4.37114e-008,0],[0,0,1]]],
     ["Land_BatteryPack_01_closed_sand_F",[-0.633301,-10.571,0],[[-1,1.19249e-008,0],[0,0,1]]],
     ["Land_SolarPanel_04_sand_F",[-2.18848,-11.1208,-4.76837e-007],[[0,1,0],[0,0,1]]],
     ["Land_SolarPanel_04_sand_F",[3.73828,-11.1169,-4.76837e-007],[[0,1,0],[0,0,1]]],
     ["Land_Tablet_02_sand_F",[5.08838,-10.3809,0.886934],[[0.258819,0.965926,0],[0,0,1]]],
     ["Land_BatteryPack_01_closed_sand_F",[5.80127,11.9526,0],[[-0.306936,0.95173,0],[0,0,1]]],
     ["Land_MultiScreenComputer_01_closed_sand_F",[3.7334,-10.5238,0.896171],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_PortableGenerator_01_sand_F",[6.54736,11.5392,0],[[-0.951728,-0.306942,0],[0,0,1]]],
     ["Brush_01_yellow_F",[4.7373,-6.70679,0.886935],[[0.965926,0.258819,0],[0,0,1]]],
     ["HazmatBag_01_roll_F",[3.85889,-6.77466,0],[[0,1,0],[0,0,1]]],
     ["HazmatBag_01_roll_F",[4.09473,-6.77112,0],[[0,1,0],[0,0,1]]],
     ["HazmatBag_01_roll_F",[3.98047,-6.93933,0],[[0,1,0],[0,0,1]]],
     ["Broom_01_grey_F",[6.64209,-0.700195,0],[[0,1,0],[0,0,1]]],
     ["UGV_02_Wheel_F",[-3.36035,-7.59277,4.76837e-007],[[0,1,0],[0,0,1]]],
     ["Land_PressureWasher_01_F",[4.17871,5.78723,0],[[0,1,0],[0,0,1]]],
     ["Land_PressureWasher_01_F",[-2.88086,-4.10168,0],[[-8.74228e-008,-1,0],[0,0,1]]],
     ["Land_RotorCoversBag_01_F",[-4.06299,-7.82214,0],[[0,1,0],[0,0,1]]],
     ["WaterPump_01_sand_F",[-7.11621,-2.922,0],[[0,1,0],[0,0,1]]],
     ["UGV_02_Tracks_F",[-2.87988,-7.86633,0.896171],[[0,1,0],[0,0,1]]],
     ["Land_Brick_01_F",[-5.62646,-4.23608,0],[[-0.258819,0.965926,0],[0,0,1]]],
     ["Land_Brick_01_F",[-5.47949,-4.20227,0],[[-0.258819,0.965926,0],[0,0,1]]],
     ["Land_Brick_01_F",[-5.57129,-4.21631,0],[[0.866025,-0.5,0],[0,0,1]]],
     ["Land_Brick_01_F",[-2.63965,0.52417,0],[[-0.258819,0.965926,0],[0,0,1]]],
     ["Land_Brick_01_F",[-2.49268,0.557983,0],[[-0.258819,0.965926,0],[0,0,1]]],
     ["Land_Brick_01_F",[-2.58447,0.543945,0],[[0.866025,-0.5,0],[0,0,1]]],
     ["Land_Brick_01_F",[-7.47998,-6.45251,0],[[0,1,0],[0,0,1]]],
     ["ArrowDesk_L_F",[-1.88867,6.89722,0],[[-1,1.19249e-008,0],[0,0,1]]],
     ["ArrowDesk_L_F",[3.45459,6.89722,0],[[-1,1.19249e-008,0],[0,0,1]]],
     ["ArrowDesk_R_F",[3.11963,6.89722,0],[[1,-4.37114e-008,0],[0,0,1]]],
     ["Land_DieselGroundPowerUnit_01_F",[-4.38525,-12.59,0],[[1,-4.37114e-008,0],[0,0,1]]]
];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     ["I_G_Offroad_01_armed_F",[-32.0503,1.37219,-0.000406742],0],
     ["I_G_Offroad_01_armed_F",[35.7681,1.74414,-0.000406742],0]
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
     ["I_G_HMG_02_high_F", [8.88281,-13.2314,-4.76837e-007], [[0,1,0],[0,0,1]], "Green"],
     ["I_G_HMG_02_high_F", [-9.98584,-13.2853,0], [[0,1,0],[0,0,1]], "Green"],
     ["I_G_HMG_02_high_F", [8.75732,10.5476,0], [[0,1,0],[0,0,1]], "Green"],
     ["I_G_HMG_02_high_F", [-7.63281,10.265,0], [[0,1,0],[0,0,1]], "Green"]
];

_missionGroups = [
     [[-0.672363,-15.3906,0.00143909],3,6,"Green"],
     [[-13.9609,1.84863,0.00143909],3,6,"Green"],
     [[0.471191,12.5741,0.00143909],3,6,"Green"],
     [[13.6943,1.68701,0.00143909],3,6,"Green"],
     [[0.551758,-2.33972,0.00143909],3,6,"Green"],
     [[0.282227,3.52222,0.00143909],3,6,"Green"],
     [[0.692383,-8.04785,0.00143909],3,6,"Green"],
     [[-5.33398,3.20313,0.00143909],3,6,"Green"]
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