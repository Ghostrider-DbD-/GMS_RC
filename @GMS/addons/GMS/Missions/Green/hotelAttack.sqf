/*
	Mission Template by Ghostrider [GRG]
	Mission Compositions by Bill prepaGreen for ghostridergaming
	Copyright 2016
	Last modified 3/20/17
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf";
_crateLoot = GMS_BoxLoot_Green;
_lootCounts = GMS_lootCountsGreen;
_startMsg = "A hotel complex is under attack in a nearby sector! Check the marker on your map for the location!";
_endMsg = "The hotel is under survivor control!";

_markerMissionName = "Hotel";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_markerType = ["ELLIPSE",[150,150],"GRID"];
_markerColor = "ColorGreen";
_markerLabel = "";
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Medevac_HQ_V1_F",[-16.6167,-29.1909,-0.00143862],88.3428,true,true,[["B_static_AT_F",[1.92334,-3.27051,3.13248],359.978],["B_HMG_01_high_F",[2.85205,3.021,3.1134],0.00635188],["B_HMG_01_high_F",[-3.04346,14.7256,-0.0121188],359.999]],[]],
     ["Land_Medevac_HQ_V1_F",[-28.3364,4.83105,-0.00143862],179.265,true,true,[["B_static_AT_F",[2.46729,2.63037,3.13029],0.00302021],["B_static_AA_F",[-4.58252,-5.3125,3.09565],359.913],["B_HMG_01_high_F",[8.06445,5.71777,-0.0121174],0.000288916]],[]],
     ["Land_Medevac_HQ_V1_F",[-28.5654,-13.8145,-0.00143862],180.522,true,true,[["B_static_AA_F",[0.84375,0.514648,3.13029],0.00155312]],[]],
     ["Land_Offices_01_V1_F",[21.9434,8.91309,-0.00143862],89.7745,true,true,[["B_HMG_01_high_F",[-0.734863,-10.6768,0.904902],270.432],["B_HMG_01_high_F",[-23.2124,-0.51416,-0.0121188],359.998],["B_HMG_01_high_F",[-6.39355,-11.7041,17.8387],268.028]],[]],
     ["Land_Medevac_HQ_V1_F",[-6.55811,18.0376,-0.00143862],270.427,true,true,[["B_static_AA_F",[-1.88379,-1.97852,3.13029],0.00153846],["B_HMG_01_high_F",[3.25391,-1.45215,3.1134],360],["B_HMG_01_high_F",[-3.7041,5.09375,3.11697],359.998]],[]]
];

_missionLandscape = [
     ["Land_Medevac_house_V1_F",[-18.3271,19.3198,-0.00143862],0,true,true],
     ["Land_MedicalTent_01_digital_closed_F",[15.2534,-23.0718,-0.00143862],91.0785,true,true],
     ["Land_Medevac_house_V1_F",[-4.98486,-31.6157,-0.00143862],179.987,true,true],
     ["Land_Medevac_house_V1_F",[3.31152,-31.9941,-0.00143862],180.296,true,true],
     ["Land_PhoneBooth_02_F",[13.0166,4.56494,-0.00143862],88.942,true,true],
     ["Land_TreeBin_F",[10.8608,6.75049,-0.00143862],0,true,true],
     ["Land_MedicalTent_01_digital_closed_F",[15.7261,-12.5034,-0.00143862],89.6654,true,true],
     ["Land_dp_transformer_F",[16.1001,18.46,18.5181],0.287473,true,true]
];

_missionLootBoxes = [
     ["B_supplyCrate_F",[-11.3999,-6.08643,-0.00144053],_crateLoot,_lootCounts,0.00167282],
     ["Box_NATO_Equip_F",[-10.7598,-8.19092,-0.00143862],_crateLoot,_lootCounts,360]
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
];

_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = [

	 #ifdef GMS_milServer
     ["B_HMG_01_high_F",[-20.272,10.5488,-0.013556],0.000288916],
     ["B_HMG_01_high_F",[-19.6602,-14.4653,-0.0135574],359.999],
     ["B_HMG_01_high_F",[-1.26904,8.39893,-0.0135574],359.998],	 
     ["B_Radar_System_01_F",[-5.94189,-6.08398,-0.0288944],265.977]
	 #else
     [selectRandom GMS_staticWeapons,[-20.272,10.5488,-0.013556],0.000288916],
     [selectRandom GMS_staticWeapons,[-19.6602,-14.4653,-0.0135574],359.999],
     [selectRandom GMS_staticWeapons,[-1.26904,8.39893,-0.0135574],359.998],	 
     [selectRandom GMS_staticWeapons,[-5.94189,-6.08398,-0.0288944],265.977]
	 #endif
];

_missionGroups = [
     //[[-20.4487,-1.36377,4.76837e-007],3,6,"Green",30,45],
     //[[5.51904,-2.09229,4.76837e-007],3,6,"Green",30,45],
     //[[-8.24609,-10.6689,4.76837e-007],3,6,"Green",30,45]
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
_useMines = GMS_useMines;  // Setting this in the mission file overrides the defaults 

#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
