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
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf";

//diag_log "[GMS] Spawning Orange Mission with template = default";
_crateLoot = GMS_BoxLoot_Orange;
_lootCounts = [15,50,20,60,44,5]; 
_startMsg = "Operation Shutdown reported in a nearby sector ! Check the marker on your map for the location!";
_endMsg = "Operation Shutdown has been shutout: time to claim your loot!";

_markerMissionName = "Operation Shutdown";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here


_markerType = ["ellipse",[750,750],"SOLID"];
_markerColor = "ColorOrange";
_markerLabel = "";

_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_MilOffices_V1_F",[-25.8965,-17.3301,-0.00136375],90.0716,true,true,[["B_HMG_01_high_F",[-4.85742,3.48145,0.559855],100.573],["B_HMG_01_high_F",[0.591797,15.7725,0.643467],123.4],["B_GMG_01_high_F",[3.26953,-15.627,0.471853],360]],[]],
     ["Land_Cargo_Tower_V1_F",[19.8242,-40.0908,-0.00136375],352.947,true,true,[["I_Mortar_01_F",[3.14453,0.788086,18.0422],359.998],["I_HMG_01_high_F",[5.16797,-2.8291,18.2109],0.00196825],["I_GMG_01_high_F",[4.45508,4.51367,17.98],0.00289071],["I_HMG_01_high_F",[-5.30078,3.69629,17.6744],0.000505428],["I_HMG_01_high_F",[-3.58008,-5.88281,17.9417],0.00144037]],[]],
     ["Land_Cargo_Tower_V1_F",[17.0313,6.15039,-0.00136375],351.39,true,true,[["I_Mortar_01_F",[2.70508,2.4043,18.001],359.998],["I_HMG_01_high_F",[-4.55664,3.79785,17.9989],359.997],["I_GMG_01_high_F",[5.7832,-2.44629,17.8822],0.00181586],["I_HMG_01_high_F",[-3.38672,-6.18652,17.6068],359.996],["B_HMG_01_F",[-5.00391,-22.5283,0.0824738],359.923],["B_Mortar_01_F",[-16.3105,20.4473,0.0377121],359.999]],[]],
     ["Land_Unfinished_Building_01_F",[11.3477,24.6777,-0.00136375],169.294,true,true,[["B_HMG_01_high_F",[4.23438,-3.06641,3.56936],270.931]],[]]
];

_missionLandscape = [
     ["Land_ReservoirTank_V1_F",[-9.26367,-39.2754,-0.00136375],244.206,true,true],
     ["Land_HBarrier_Big_F",[-15.8281,-41.0605,-0.00157738],265.38,true,true],
     ["Land_HBarrier_Big_F",[-4.43164,-49.2871,-0.0026722],10.0179,true,true],
     ["Land_HBarrier_Big_F",[-12.2578,-46.6807,0.00488663],213.338,true,true],
     ["CamoNet_BLUFOR_F",[-6.46875,-28.1533,0.00206184],168.592,true,true],
     ["Land_HBarrierWall_corridor_F",[-16.7266,18.7031,-0.0011692],0,true,true],
     ["Land_HBarrier_Big_F",[-13.4531,24.8301,-0.00104141],266.695,true,true],
     ["Land_HBarrier_Big_F",[-4.40625,29.875,-0.00246048],173.065,true,true],
     ["Land_HBarrier_Big_F",[-13.0449,12.5234,-0.00254822],93.6756,true,true],
     ["Land_HBarrier_Big_F",[-15.6582,4.66699,-0.00362968],126.31,true,true],
     ["Land_HBarrierWall_corridor_F",[-11.1387,32.3838,-0.000656128],82.9818,true,true],
     ["Land_ReservoirTank_V1_F",[1.94922,-38.4463,-0.00136566],259.29,true,true],
     ["Land_HBarrier_Big_F",[11.8809,-49.3164,-0.00117302],0,true,true],
     ["Land_HBarrier_Big_F",[3.52539,-49.5029,-0.00395203],0,true,true],
     ["Land_HBarrier_Big_F",[19.9004,-48.7939,-0.00250816],355.002,true,true],
     ["Land_spp_Transformer_F",[24.9414,-6.0332,-0.00136185],349.747,true,true],
     ["Land_wpp_Turbine_V2_F",[24.9531,-11.9004,-0.00136185],51.29,true,true],
     ["Land_Cargo_House_V1_F",[14.5938,-7.68945,-0.00136566],77.5545,true,true],
     ["Land_Cargo_House_V1_F",[15.8164,-15.9072,-0.00136185],78.4109,true,true],
     ["RoadCone_L_F",[-2.56055,-4.59375,-0.00134468],0,true,true],
     ["Land_Research_HQ_F",[9.47266,-24.6211,-0.0160942],80.1824,true,true],
     ["Land_HBarrier_Big_F",[26.1367,20.8623,0.00174904],83.0022,true,true],
     ["Land_HBarrier_Big_F",[24.584,29.0156,-0.0016098],81.3427,true,true],
     ["Land_HBarrier_Big_F",[3.70117,31.0693,0.00167847],174.851,true,true],
     ["Land_HBarrier_Big_F",[20.5078,33.3701,-0.000528336],172.741,true,true],
     ["Land_HBarrier_Big_F",[12.1328,32.1318,0.00290108],173.105,true,true],
     ["Land_HBarrier_Big_F",[33.8301,-43.0059,0.00152016],302.399,true,true],
     ["Land_HBarrier_Big_F",[36.8027,-35.3555,-0.00325966],281.67,true,true],
     ["Land_HBarrier_Big_F",[28.002,-47.5791,0.00681686],353.003,true,true],
     ["Land_HBarrier_Big_F",[33.5449,-11.457,-0.000713348],76.6347,true,true],
     ["Land_HBarrier_Big_F",[31.373,-3.59375,0.000671387],77.9265,true,true],
     ["Land_HBarrier_Big_F",[37.2676,-27.3936,0.00816154],83.1633,true,true],
     ["Land_HBarrier_Big_F",[35.709,-19.5088,0.0026722],77.9577,true,true],
     ["Land_HBarrier_Big_F",[29.5215,4.58691,0.00392151],79.8717,true,true],
     ["Land_HBarrier_Big_F",[27.7344,12.5332,0.0039463],80.8132,true,true]
];

_missionLootBoxes = [

];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     [selectRandom GMS_AIPatrolVehiclesOrange,[-48.9414,-27.9336,-0.00839043],0.014744],
     [selectRandom GMS_AIPatrolVehiclesGreen,[-43.2539,15.6504,0.0234108],359.996]
     //[selectRandom GMS_light_AT_ARMA3,[-27.0313,26.8213,-0.022541],0.00204721],
     //[selectRandom GMS_tracked_AA_ARMA3,[-12.9023,47.8105,0.0262032],359.999],
     //[selectRandom GMS_tracked_APC_ARMA3,[-0.851563,-70.9072,-0.02915],0.0194982],
     //[selectRandom GMS_light_AT_ARMA3,[38.2285,-66.7969,0.00758934],0.0237408],
     //[selectRandom GMS_tracked_APC_ARMA3,[52.9941,22.5596,0.00379944],359.96] 
];
/*
_missionPatrolVehicles = [];
_countVeh = 0;
while {_countVeh < 4} do
{
     _v = _missionPatrolVehicleChoices deleteAt round(random(count _missionPatrolVehicleChoices));
     if (typeName _v isEqualTo "ARRAY") then
     {
          _missionPatrolVehicles pushBack _v;
          _countVeh = _countVeh + 1;
     };
};
*/
_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = [
     ["B_Mortar_01_F",[12.0469,-28.3496,3.16158],0.00667729],
     ["B_Mortar_01_F",[6.47852,-23.5,3.16113],0.003515]
];

_missionGroups = [
     /*
     [[-12.8398,-3.60938,0.195612],5,7,"Orange",30,45],
     [[-7.64844,-13.6992,0.00148582],5,7,"Orange",30,45],
     [[-10.002,-23.3262,0.0013752],5,7,"Orange",30,45],
     [[-5.22461,-21.748,0.00135231],5,7,"Orange",30,45],
     [[-10.4883,12.6191,0.00148392],5,7,"Orange",30,45],
     [[-11.6211,5.80371,0.00148773],5,7,"Orange",30,45],
     [[19.4023,-2.00293,0.00139618],5,7,"Orange",30,45],
     [[7.00977,-16.7656,0.00152206],5,7,"Orange",30,45],
     [[0.720703,-24.2539,0.00136185],5,7,"Orange",30,45],
     [[11.1895,-4.08594,0.00141716],5,7,"Orange",30,45],
     [[7.80273,20.1484,0.00143051],5,7,"Orange",30,45],
     [[10.6133,6.76855,0.00151634],5,7,"Orange",30,45],
     [[2.57227,24.1533,0.00146866],5,7,"Orange",30,45],
     [[6.16406,11.458,0.00152779],5,7,"Orange",30,45],
     [[3.69727,5.59766,0.00153351],5,7,"Orange",30,45],
     [[10.0039,17.5674,0.00144386],5,7,"Orange",30,45],
     [[2.69922,16.2793,0.00151825],5,7,"Orange",30,45],
     [[0.707031,20.6504,0.0015049],5,7,"Orange",30,45]
     */
];

_scubaGroupParameters = [
];


//////////
//   The lines below define additional variables you may wish to configure.


//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Orange;
_maxNoAI = GMS_MaxAI_Orange;
_noAIGroups = GMS_AIGrps_Orange;
_noVehiclePatrols = GMS_SpawnVeh_Orange;
_noEmplacedWeapons = GMS_SpawnEmplaced_Orange;
_minNoAI = GMS_MinAI_Orange;  // Setting this in the mission file overrides the defaults such as GMS_MinAI_Orange
_maxNoAI = GMS_MaxAI_Orange;  // Setting this in the mission file overrides the defaults 
_noAIGroups = GMS_AIGrps_Orange;  // Setting this in the mission file overrides the defaults 
_noVehiclePatrols = GMS_SpawnVeh_Orange;  // Setting this in the mission file overrides the defaults 
_noEmplacedWeapons = GMS_SpawnEmplaced_Orange;  // Setting this in the mission file overrides the defaults 
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;  // Setting this in the mission file overrides the defaults 

#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
