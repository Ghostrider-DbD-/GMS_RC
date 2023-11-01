
/*
	Dynamic Mission Generated
	Using 3DEN Plugin for blckeagls
	dynamicMission.sqf generated:: blckeagls 3DEN Plugin Version 0 : Build 0 : Build Date 
	By Ghostrider-GRG-
*/

#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf" 


_startMsg = "An abandoned enemy encampment was located";
_endMsg = "The enemy encampnent has been cleared";
_markerMissionName = "ForgottenHQ";

_defaultMissionLocations = [];
_maxMissionRespawns = -1; // Chage this to a positive number if you want to limit the number of times a mission spawns at the same location
_markerType = ["ELLIPSE",[250,250],"SOLID"];
_markerColor = "COLORRED";
_crateLoot = GMS_BoxLoot_;
_lootCounts = GMS_lootCounts;

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Patrol_V2_F",[24.8208,6.71948,4.76837e-007],0,true,true,[["O_G_HMG_02_high_F",[1.49048,1.09253,-4.34404],183.214]],[[[-1.49048,-1.09253,6.02379],183.214]]],
     ["Land_Cargo_Patrol_V2_F",[7.34082,6.64941,4.76837e-007],0,true,true,[["O_G_HMG_02_high_F",[-1.07422,1.17676,-4.34404],183.214]],[[[1.07422,-1.17676,6.02379],183.214]]],
     ["Land_Cargo_Tower_V2_F",[6.41382,17.1794,0],180,true,true,[["O_G_HMG_02_high_F",[4.54883,-0.758545,-17.8895],0],["O_G_HMG_02_high_F",[-3.65967,-3.33838,-17.8895],0]],[[[3.65967,3.33838,19.5692],0]]],
     ["Land_Cargo_HQ_V2_F",[2.70483,34.6604,4.76837e-007],180,true,true,[["O_G_HMG_02_high_F",[4.84229,3.34351,-3.12651],0],["O_static_AA_F",[-1.62451,-3.90698,-3.12651],0]],[[[-1.4624,-0.132813,3.12796],0],[[-4.84229,-3.34351,4.80625],0]]],
     ["Land_Cargo_HQ_V2_F",[30.5259,45.8406,4.76837e-007],270.279,true,true,[["O_G_HMG_02_high_F",[0.84375,-5.84326,-3.12651],0],["O_static_AT_F",[-4.07739,1.8689,-3.12649],0]],[[[-0.166016,-0.514893,3.12796],0],[[-0.84375,5.84326,4.80626],0]]]
];

_missionLandscape = [
     ["Land_New_WiredFence_10m_F",[0,0,0],90,true,true],
     ["Land_New_WiredFence_10m_F",[4.70703,-4.94727,0],0,true,true],
     ["Land_New_WiredFence_10m_F",[14.4551,-4.83984,0],0,true,true],
     ["Land_Razorwire_F",[7.91016,-7.44849,0],0,false,false],
     ["Land_CncWall4_F",[3.927,7.92407,0],90,true,true],
     ["Land_CncWall4_F",[6.177,5.67407,0],0,true,true],
     ["Land_CncWall1_F",[10.677,6.42407,0],330,true,true],
     ["Land_CncWall1_F",[4.177,11.1741,0],105,true,true],
     ["Land_CncWall1_F",[9.427,5.92407,0],345,true,true],
     ["Land_New_WiredFence_10m_Dam_F",[-0.0449219,9.91016,0.0498819],90,true,true],
     ["Land_New_WiredFence_10m_F",[-0.0449219,19.9102,0],90,true,true],
     ["Land_CncWall4_F",[-9.04492,30.4102,0],90,true,true],
     ["Land_CncWall4_F",[-9.04492,35.6602,0],90,true,true],
     ["Land_CncWall4_F",[-9.07251,40.8501,0],90,true,true],
     ["Land_CncWall4_F",[4.3291,14.4839,0],90,true,true],
     ["Land_CncWall4_F",[-0.544922,25.4102,0],0,true,true],
     ["Land_CncWall4_F",[-5.91992,25.4102,0],0,true,true],
     ["Land_CncWall4_F",[4.83008,25.4102,0],0,true,true],
     ["Land_CncWall4_F",[12.4551,30.7852,0],270,true,true],
     ["Land_CncWall4_F",[12.4551,36.0352,0],270,true,true],
     ["Land_CncWall4_F",[4.3291,19.7339,0],90,true,true],
     ["Land_CncShelter_F",[8.5708,25.3887,0],0,true,true],
     ["Land_CncWall1_F",[4.5791,22.9839,0],105,true,true],
     ["Land_CncWall1_F",[5.0791,24.2339,0],120,true,true],
     ["Land_CncWall1_F",[10.3301,26.0352,0],345,true,true],
     ["Land_CncWall1_F",[-8.79492,25.9102,0],60,true,true],
     ["Land_CncWall1_F",[-9.04492,27.1602,0],90,true,true],
     ["Land_CncWall1_F",[11.3301,26.6602,0],315,true,true],
     ["Land_CncWall1_F",[12.0801,27.6602,0],300,true,true],
     ["Land_CncWall4_F",[-6.82251,43.1001,0],180,true,true],
     ["Land_CncWall4_F",[3.67749,43.1001,0],180,true,true],
     ["Land_CncWall4_F",[-1.57251,43.1001,0],180,true,true],
     ["Land_Mil_WiredFence_Gate_F",[16.1936,6.77051,0],0,true,true],
     ["Land_New_WiredFence_10m_F",[44.2427,-0.0644531,0],270,true,true],
     ["Land_New_WiredFence_10m_F",[34.4551,-4.58984,0],0,true,true],
     ["Land_Razorwire_F",[38.2532,-7.32739,0],0,false,false],
     ["Land_CncWall4_F",[28.5359,8.26343,0],270,true,true],
     ["Land_CncWall4_F",[26.157,5.83984,0],0,true,true],
     ["Land_LampShabby_F",[11.8286,6.30664,0],96.8408,true,true],
     ["Land_New_WiredFence_5m_F",[41.9932,-4.56445,0],0,true,true],
     ["Land_CncWall1_F",[22.907,6.08984,0],15,true,true],
     ["Land_CncWall1_F",[21.6697,6.61914,0],30,true,true],
     ["Land_New_WiredFence_10m_F",[44.2051,19.6602,0],270,true,true],
     ["Land_New_WiredFence_10m_F",[44.2427,9.68555,0],270,true,true],
     ["Land_New_WiredFence_10m_F",[44.2051,29.6602,0],270,true,true],
     ["Land_LampShabby_F",[37.8979,36.2883,0],315,true,true],
     ["Land_New_WiredFence_5m_F",[42.2051,34.4102,0],180,true,true],
     ["Land_CncWall4_F",[26.3333,57.6113,0],180.279,true,true],
     ["Land_CncWall4_F",[31.5833,57.5857,0],180.279,true,true],
     ["Land_CncWall4_F",[36.8333,57.5603,0],180.279,true,true],
     ["Land_CncWall4_F",[21.292,49.1357,0],90.2789,true,true],
     ["Land_CncWall4_F",[21.3181,54.5107,0],90.2789,true,true],
     ["Land_CncWall4_F",[21.2659,43.761,0],90.2789,true,true],
     ["Land_CncWall4_F",[30.6663,34.7571,0],0.278918,true,true],
     ["Land_CncWall4_F",[35.9163,34.7314,0],0.278918,true,true],
     ["Land_CncShelter_F",[20.6787,39.9507,0],90.2789,true,true],
     ["Land_CncWall1_F",[38.6421,35.1738,0],300.801,true,true],
     ["Land_CncWall1_F",[21.5066,37.054,0],76.1339,true,true],
     ["Land_CncWall1_F",[21.8323,57.3833,0],150.279,true,true],
     ["Land_CncWall1_F",[23.0835,57.6272,0],180.279,true,true],
     ["Land_CncWall1_F",[38.9402,36.3113,0],270.801,true,true],
     ["Land_CncWall1_F",[21.8711,36.1277,0],59.3183,true,true],
     ["Land_CncWall1_F",[22.6008,35.209,0],44.3183,true,true],
     ["Land_CncWall4_F",[39.0723,55.2993,0],270.279,true,true],
     ["Land_CncWall4_F",[39.0212,44.7996,0],270.279,true,true],
     ["Land_CncWall4_F",[39.0466,50.0493,0],270.279,true,true],
     ["Land_CncWall4_F",[38.9417,39.5823,0],270.279,true,true],
     ["Land_CncWall4_F",[25.4946,34.8081,0],0.278918,true,true],
     ["Land_CncWall1_F",[21.3872,38.1606,0],89.3183,true,true],
     ["Land_CncWall4_F",[8.90015,43.1045,0],180,true,true],
     ["Land_CncShelter_F",[19.1453,39.9565,0],90.2789,true,true],
     ["Land_CncShelter_F",[17.6121,39.9629,0],90.2789,true,true],
     ["Land_CncShelter_F",[16.0786,39.9688,0],90.2789,true,true],
     ["Land_CncShelter_F",[14.543,39.9956,0],90.2789,true,true],
     ["Land_CncShelter_F",[13.0095,40.0015,0],90.2789,true,true],
     ["Land_CncWall1_F",[11.8633,42.7507,0],218.676,true,true],
     ["Land_CncWall1_F",[12.4424,41.8545,0],254.791,true,true],
     ["Land_CncWall4_F",[28.5198,13.5347,0],270,true,true],
     ["Land_CncWall4_F",[28.4919,18.7634,0],270,true,true],
     ["Land_CncWall4_F",[28.4854,23.9961,0],270,true,true],
     ["Land_CncWall4_F",[28.4507,29.2551,0],270,true,true],
     ["Land_CncShelter_F",[28.2117,33.0996,0],90.2789,true,true],
     ["Land_LampShabby_F",[20.5925,6.89502,0],267.423,true,true],
     ["Land_LampShabby_F",[11.2803,27.2852,0],304.187,true,true],
     ["Land_Mil_WiredFence_Gate_F",[24.4001,-5.01929,0],0,false,false],
     ["RoadCone_L_F",[18.3555,32.1956,0],0,true,true],
     ["Land_Wreck_Heli_Attack_02_F",[36.8113,19.3157,0],0,false,false],
     ["Land_HelipadSquare_F",[37.4182,18.23,0],0,true,true]
];

_simpleObjects = [
     ["Land_GarbageContainer_open_F",[18.7383,37.4575,0],216.966],
     ["Land_GarbageBarrel_01_english_F",[23.7751,36.8047,0],0],
     ["Land_GarbageBarrel_02_F",[13.9443,37.1277,0],0]
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     ["O_G_Offroad_01_armed_F",[12.4829,-23.843,-0.000406742],85.3793,,],
     ["O_G_Offroad_01_armed_F",[56.377,23.8218,-0.000406742],0,,]
];

_submarinePatrolParameters = [

];

_airPatrols = [

];

_missionEmplacedWeapons = [

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
_chanceHeliPatrol = GMS_chanceHeliPatrol;
_noChoppers = GMS_noPatrolHelis;
_missionHelis = GMS_patrolHelis;
_chancePara = GMS_chancePara;
_noPara = GMS_noPara;
_paraTriggerDistance = 400;
_chanceLoot = 0.0;
_paraLoot = GMS_BoxLoot_;
_paraLootCounts = GMS_lootCounts;
_missionLandscapeMode = "precise";
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;
_vests = GMS_vests;
_backpacks = GMS_backpacks;
_sideArms = GMS_Pistols;
_spawnCratesTiming = "atMissionStartGround";
_loadCratesTiming = "atMissionStart";
_endCondition = "allUnitsKilled";
_minNoAI = GMS_MinAI_;
_maxNoAI = GMS_MaxAI_;
_noAIGroups = GMS_AIGrps_;
_noVehiclePatrols = GMS_SpawnVeh_;
_noEmplacedWeapons = GMS_SpawnEmplaced_;
_submarinePatrols = 0; // Default number of submarine patrols at pirate missions
_scubaPatrols = 0; // Default number of scuba diver patrols at pirate missions

#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";