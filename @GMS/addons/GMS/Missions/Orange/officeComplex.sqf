/*
	Mission Template by Ghostrider [GRG]
	Mission Compositions by Bill prepared for ghostridergaming
	Copyright 2016
	Last modified 3/20/17
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf";

//diag_log "[GMS] Spawning Green Mission with template = default";
_crateLoot = GMS_BoxLoot_Orange;
_lootCounts = GMS_lootCountsOrange;
_startMsg = "The enemy have occupied an office complex in a nearby sector! Check the Black marker on your map for the location!";
_endMsg = "The Sector at the Pink Marker is under survivor control!";

_markerType = ["ellipse",[225,225],"GRID"];
_markerColor = "ColorPink";
_markerMissionName = "Office Complex";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here


_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Offices_01_V1_F",[47119.1,35868.7,4.76837e-007],269.862,true,true,[["O_HMG_01_high_F",[1.91211,10.3887,0.915],96.7764],["O_HMG_01_F",[-6.00781,11.4434,0.915001],186.886],["O_Mortar_01_F",[-0.0390625,-2.37891,17.852],208.222],["O_HMG_01_high_F",[-7.19141,11.9668,17.8518],308.501],["O_GMG_01_high_F",[-7.29492,-15.7617,17.8518],232.577],["O_Radar_System_02_F",[27.1289,15.6582,-2.38419e-007],0]],[]],
     ["Land_Offices_01_V1_F",[47126.1,35910.6,4.76837e-007],0,true,true,[["O_HMG_01_high_F",[10.4004,-2.66406,0.914999],181.335],["O_HMG_01_F",[11.4473,5.94141,0.915],272.565],["O_static_AA_F",[-2.10938,0.380859,17.6633],308.394],["O_HMG_01_high_F",[11.7383,7.01758,17.8518],58.5428],["O_GMG_01_high_F",[-15.666,7.14453,17.8518],322.918]],[]],
     ["Land_Offices_01_V1_F",[47161.2,35860.4,4.76837e-007],179.838,true,true,[["O_HMG_01_high_F",[-10.3906,2.07813,0.915],0],["O_HMG_01_F",[-11.4414,-5.97852,0.915001],90.6397],["O_static_AA_F",[3.31055,0.535156,17.8518],130.28],["O_HMG_01_high_F",[-11.709,-6.99219,17.8518],230.558],["O_GMG_01_high_F",[15.8945,-7.25195,17.8518],144.952]],[]],
     ["Land_Offices_01_V1_F",[47171.3,35902.4,4.76837e-007],89.712,true,true,[["O_HMG_01_high_F",[-2.4082,-10.3828,0.915],272.89],["O_HMG_01_F",[6.36328,-11.4355,0.915001],0],["O_Mortar_01_F",[-0.0273438,2.89258,17.8518],30.2156],["O_HMG_01_high_F",[7.41211,-11.8789,17.8518],151.994],["O_GMG_01_high_F",[7.23828,15.8262,17.8518],53.1106]],[]]
];

_missionLandscape = [
     ["Land_SandbagBarricade_01_hole_F",[47124.4,35890.2,0],85.991,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47102.9,35890.1,0],271.072,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47106.1,35896.8,0],130.91,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47107.1,35884.1,0],35.5083,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47145.7,35848,0],316.085,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47132.8,35847.6,0],39.0453,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47138.8,35844.5,0],0,true,true],
     ["Land_SandbagBarricade_01_hole_F",[47139.1,35864.5,0],0,true,true],
     ["Land_SandbagBarricade_01_hole_F",[47147.1,35895.6,0],0,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47149.3,35924.9,0],0,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47141.7,35922.3,0],320.811,true,true],
     ["Land_SandbagBarricade_01_hole_F",[47155.4,35879.7,0],269.802,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47182.4,35874,0],314.213,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47183.6,35887.4,0],237.111,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47157.3,35923.2,0],207.1,true,true],
     ["Land_HBarrier_01_line_5_green_F",[47186.2,35880.4,0],89.2182,true,true]
];

_missionlootvehicles = [];

_missionLootBoxes = [
];

#ifdef GMS_milServer
private _CUP_Tanks = [
     "CUP_O_T90_RU",
     "CUP_B_M1A1_DES_US_Army",
     "CUP_B_M1A2_TUSK_MG_DES_US_Army",
     "CUP_B_Leopard2A6_GER",
     "CUP_B_Challenger2_NATO"
];
#endif
_missionPatrolVehicles = [
     ["O_T_LSV_02_armed_F",[47086.9,35887,0],205.251],
     ["O_T_LSV_02_AT_F",[47207.8,35877.4,0],0],
     ["O_T_APC_Tracked_02_AA_ghex_F",[47094.1,35924.2,2.38419e-007],297.601],
     [selectRandom GMS_Tanks_ARMA3,[47099.8,35845.4,0],227.158],
     [selectRandom GMS_Tanks_ARMA3,[47184.5,35932.1,0],29.7763],
     ["O_T_APC_Tracked_02_AA_ghex_F",[47194.1,35850.3,2.38419e-007],109.403]
];

_submarinePatrolParameters = [
];

_airPatrols = [
     ["O_Heli_Attack_02_dynamicLoadout_F",[47048.6,35934.3,186.215],0],
     ["O_Heli_Light_02_dynamicLoadout_F",[47209,35907.2,121.794],221.059]
];

_missionEmplacedWeapons = [
     ["O_GMG_01_high_F",[47111.8,35852.9,17.8518],232.577],
     ["O_HMG_01_high_F",[47111.9,35880.7,17.8518],308.501],
     ["O_Mortar_01_F",[47119.1,35866.3,17.852],208.222],
     ["O_HMG_01_F",[47113.1,35880.1,0.915001],186.886],
     ["O_HMG_01_high_F",[47121,35879.1,0.915001],96.7764],
     ["O_static_AA_F",[47124,35910.9,17.6633],308.394],
     ["O_GMG_01_high_F",[47110.4,35917.7,17.8518],322.918],
     ["O_HMG_01_high_F",[47149.5,35853.4,17.8518],230.558],
     ["O_HMG_01_F",[47149.8,35854.4,0.915002],90.6397],
     ["O_HMG_01_high_F",[47150.8,35862.4,0.915],0],
     ["O_HMG_01_high_F",[47136.5,35907.9,0.915],181.335],
     ["O_Radar_System_02_F",[47146.2,35884.4,2.38419e-007],0],
     ["O_HMG_01_high_F",[47137.8,35917.6,17.8518],58.5428],
     ["O_HMG_01_F",[47137.5,35916.5,0.915],272.565],
     ["O_GMG_01_high_F",[47177.1,35853.1,17.8518],144.952],
     ["O_static_AA_F",[47164.5,35860.9,17.8518],130.28],
     ["O_HMG_01_high_F",[47178.7,35890.5,17.8518],151.994],
     ["O_Mortar_01_F",[47171.3,35905.3,17.8518],30.2156],
     ["O_HMG_01_F",[47177.7,35890.9,0.915001],0],
     ["O_HMG_01_high_F",[47168.9,35892,0.915],272.89],
     ["O_GMG_01_high_F",[47178.5,35918.2,17.8518],53.1106]
];

_missionGroups = [
     [[44613.6,37206.4,4577.72],3,6,"Red",30,45],
     [[47114.9,35887.8,0.00143886],3,6,"Red",30,45],
     [[47137.3,35857.1,0.00143886],3,6,"Red",30,45],
     [[47142,35867.3,0.00143886],3,6,"Red",30,45],
     [[47129.4,35894.9,0.00143886],3,6,"Red",30,45],
     [[47154.4,35899.7,0.00143886],3,6,"Red",30,45],
     [[47145.3,35913.5,0.00143886],3,6,"Red",30,45],
     [[47173.1,35881.2,0.00143886],3,6,"Red",30,45],
     [[47162,35877.3,0.00143886],3,6,"Red",30,45]
];

_scubaGroupParameters = [
];


//////////
//   The lines below define additional variables you may wish to configure.


//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Green;
_maxNoAI = GMS_MaxAI_Green;
_noAIGroups = GMS_AIGrps_Green;
_noVehiclePatrols = GMS_SpawnVeh_Green;
_noEmplacedWeapons = GMS_SpawnEmplaced_Green;
_minNoAI = GMS_MinAI_Blue;  // Setting this in the mission file overrides the defaults such as GMS_MinAI_Blue
_maxNoAI = GMS_MaxAI_Blue;  // Setting this in the mission file overrides the defaults 
_noAIGroups = GMS_AIGrps_Blue;  // Setting this in the mission file overrides the defaults 
_noVehiclePatrols = GMS_SpawnVeh_Blue;  // Setting this in the mission file overrides the defaults 
_noEmplacedWeapons = GMS_SpawnEmplaced_Blue;  // Setting this in the mission file overrides the defaults 
//  Change _useMines to true/false below to enable mission-specific settings.

_chanceHeliPatrol = GMS_chanceHeliPatrolBlue;  // Setting this in the mission file overrides the defaults 
_noChoppers = GMS_noPatrolHelisBlue;
_missionHelis = GMS_patrolHelisBlue;

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
