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

//diag_log "[GMS] Spawning Orange Mission with template = default";
_crateLoot = GMS_BoxLoot_Orange;
_lootCounts = [15,50,20,60,44,5];  //  	GMS_lootCountsOrange = [8,32,8,30,16,1];
_startMsg = "A rogue Colonel is staging for an attack. Players must stop him. !";
_endMsg = "The rogue Colonel has been defeated!";
_markerLabel = "";
_markerType = ["ellipse",[225,225],"GRID"];
_markerColor = "ColorBlack";
_markerMissionName = " Colonel";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Patrol_V3_F",[-80.123,-79.1797,0.00650382],41.0018,true,true,[["I_HMG_01_high_F",[-0.265625,-1.86914,4.33092],200.657],["I_HMG_01_high_F",[-2.2168,0.0878906,4.33275],245.993],["B_HMG_01_high_F",[-2.79688,12.1953,-0.0121188],360]],[]],
     ["Land_Cargo_Patrol_V3_F",[-79.123,82.8203,0.00650382],136.862,true,true,[["I_HMG_01_high_F",[-2.17188,0.255859,4.3317],288.907],["I_HMG_01_high_F",[0.113281,2.24414,4.33242],0.00515014],["B_HMG_01_A_F",[9.94531,4.00781,0.0773745],359.997]],[]],
     ["Land_Cargo_HQ_V3_F",[-29.2402,-60.6777,0.00650382],0,true,true,[["B_GMG_01_A_F",[3.21875,0.00390625,3.23014],359.993],["B_HMG_01_A_F",[16.0078,10.1953,0.0773726],359.997]],[]],
     ["Land_Cargo_Tower_V3_F",[-4.12305,20.8203,0.0065043],0,true,true,[["B_HMG_01_A_F",[-3.17383,-5.20313,12.7981],64.3438],["B_HMG_01_high_F",[2.53125,3.69727,15.3515],0.0011765],["B_HMG_01_high_F",[-4.17969,-2.68555,15.3515],0.000256189],["B_T_Static_AA_F",[-3.1582,-5.75391,17.5147],15.2718],["B_T_Static_AA_F",[3.53125,3.41211,17.8956],0.00359767],["B_T_Static_AT_F",[4.65234,-2.37109,17.8982],359.987],["B_T_Static_AT_F",[-3.42578,4.68164,17.9467],0.0688143],["B_static_AA_F",[4.33008,-21.1309,0.00477314],0.00196657],["B_Mortar_01_F",[-21.1992,-21.166,0.0368805],360],["B_HMG_01_F",[-15.1777,30.7109,0.0773726],0.00624776]],[]],
     ["Land_Cargo_HQ_V3_F",[21.375,67.9941,0.00650382],0,true,true,[["B_GMG_01_high_F",[-0.0683594,-2.80469,3.11371],0.000898623],["B_GMG_01_F",[-5.77344,-9.79492,0.103469],359.997]],[]],
     ["Land_Cargo_Patrol_V3_F",[82.877,-78.1797,0.00650382],309.337,true,true,[["I_HMG_01_high_F",[2.16797,0.177734,4.33095],112.642],["I_HMG_01_high_F",[-0.078125,-2.33984,4.33268],155.598],["B_HMG_01_high_F",[-5.76172,-2.82813,-0.0121188],359.999]],[]],
     ["Land_Cargo_Patrol_V3_F",[81.877,83.8203,0.00650382],227.142,true,true,[["I_HMG_01_high_F",[0.175781,2.11133,4.33095],27.6518],["I_HMG_01_high_F",[2.22461,-0.253906,4.3326],72.8333],["B_HMG_01_high_F",[-9.48047,2.01953,-0.0121188],360]],[]]    
];
_missionLandscape = [
	["Flag_AAF_F",[5,5,0],0,[false,false]], 
    ["Land_HBarrierWall6_F",[-87.123,-60.1797,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,-76.1797,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-84.123,-86.1797,0.00650382],179.747,true,true],
     ["Land_HBarrierWall6_F",[-68.123,-86.1797,0.00650382],179.747,true,true],
     ["Land_HBarrierWall6_F",[-87.123,-84.1797,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-76.123,-86.1797,0.00650382],179.747,true,true],
     ["Land_HBarrierWall6_F",[-87.123,-68.1797,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,-52.1797,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,-36.1797,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,-44.1797,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,-4.17969,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,-28.1797,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,-20.1797,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,-12.1797,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,15.8203,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,7.82031,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,23.8203,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,55.8203,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,39.8203,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,47.8203,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,31.8203,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,63.8203,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-77.123,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[-85.123,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[-61.123,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[-87.123,71.8203,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-87.123,79.8203,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-69.123,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[-87.123,87.8203,0.00650382],270.187,true,true],
     ["Land_HBarrierWall6_F",[-52.123,-86.1797,0.00650382],179.747,true,true],
     ["Land_HBarrierWall6_F",[-44.123,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[-36.123,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[-60.123,-86.1797,0.00650382],179.747,true,true],
     ["Land_BluntRock_apart",[-47.123,-39.1797,0.00650406],0,true,true],
     ["ShootingPos_F",[-49.123,28.8203,0.00650382],270.296,true,true],
     ["ShootingPos_F",[-49.123,24.8203,0.00650382],270.296,true,true],
     ["ShootingPos_F",[-49.127,30.6289,0.00650406],270.296,true,true],
     ["ShootingPos_F",[-49.123,22.8203,0.00650382],270.296,true,true],
     ["ShootingPos_F",[-49.123,26.8203,0.00650382],270.296,true,true],
     ["Land_BluntRock_apart",[-49.123,1.82031,0.00650406],0,true,true],
     ["Land_BluntRock_apart",[-49.123,44.8203,0.00650406],0,true,true],
     ["Land_HBarrierWall6_F",[-45.123,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[-37.123,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[-53.123,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[-12.123,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[-20.123,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[-4.12305,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[-28.123,-86.1797,0.00650382],179.053,true,true],
     ["RoadCone_L_F",[-1.80664,1.30859,0.00650382],0,true,true],
     ["Land_Cargo_House_V3_F",[-27.123,-24.1797,0.00650382],0,true,true],
     ["Land_Cargo_House_V3_F",[-19.123,-24.1797,0.00650382],0,true,true],
     ["Land_Cargo_House_V3_F",[-19.123,-15.1797,0.00650382],180,true,true],
     ["Land_Cargo_House_V3_F",[-27.123,-15.1797,0.00650382],180,true,true],
     ["Land_Medevac_house_V1_F",[-29.123,25.8203,0.00650382],180,true,true],
     ["Land_Medevac_house_V1_F",[-22.123,25.8203,0.00650382],180,true,true],
     ["Land_Medevac_house_V1_F",[-29.123,16.8203,0.00650382],0,true,true],
     ["Land_Medevac_house_V1_F",[-22.123,16.8203,0.00650382],0,true,true],
     ["Land_BluntRock_apart",[-1.12305,43.8203,0.00650406],0,true,true],
     ["Land_Medevac_HQ_V1_F",[-26.4199,67.7988,0.00650358],0,true,true],
     ["Land_HBarrierWall6_F",[-29.123,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[-5.12305,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[-13.123,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[-21.123,90.8203,0.00650382],0,true,true],
     ["Land_Research_HQ_F",[23.9355,-61.9063,0.00650358],0,true,true],
     ["Land_HBarrierWall6_F",[15.877,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[23.877,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[7.87695,-86.1797,0.00650382],179.053,true,true],
     ["Land_BluntRock_apart",[-0.123047,-40.1797,0.00650406],0,true,true],
     ["Land_Research_house_V1_F",[22.877,-25.1797,0.00650382],0,true,true],
     ["Land_Research_house_V1_F",[15.877,-16.1797,0.00650382],180,true,true],
     ["Land_Research_house_V1_F",[15.877,-25.1797,0.00650382],0,true,true],
     ["Land_Research_house_V1_F",[22.877,-16.1797,0.00650382],180,true,true],
     ["Land_Cargo_House_V3_F",[16.877,16.8203,0.00650382],0,true,true],
     ["Land_Cargo_House_V3_F",[16.877,25.8203,0.00650382],180,true,true],
     ["Land_Cargo_House_V3_F",[24.877,25.8203,0.00650382],180,true,true],
     ["Land_Cargo_House_V3_F",[24.877,16.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[14.877,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[6.87695,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[22.877,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[39.877,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[55.877,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[47.877,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[31.877,-86.1797,0.00650382],179.053,true,true],
     ["Land_BluntRock_apart",[44.877,-40.1797,0.00650406],0,true,true],
     ["Land_BluntRock_apart",[45.877,1.82031,0.00650406],0,true,true],
     ["Land_BluntRock_apart",[43.877,41.8203,0.00650406],0,true,true],
     ["Land_HBarrierWall6_F",[54.877,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[38.877,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[46.877,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[30.877,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[87.877,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[79.877,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[63.877,-86.1797,0.00650382],179.053,true,true],
     ["Land_HBarrierWall6_F",[71.877,-86.1797,0.00650382],179.053,true,true],
     ["StorageBladder_01_fuel_sand_F",[63.877,0.820313,0.00650358],0,true,true],
     ["Land_HBarrierWall6_F",[88.877,16.8203,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[88.877,8.82031,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[88.877,24.8203,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[88.877,56.8203,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[88.877,40.8203,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[88.877,48.8203,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[88.877,32.8203,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[88.877,72.8203,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[70.877,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[88.877,80.8203,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[86.877,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[78.877,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[88.877,64.8203,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[88.877,88.8203,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[62.877,90.8203,0.00650382],0,true,true],
     ["Land_HBarrierWall6_F",[89.877,-59.1797,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[89.877,-75.1797,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[89.877,-67.1797,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[89.877,-83.1797,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[89.877,-43.1797,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[89.877,-35.1797,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[89.877,-51.1797,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[89.877,-3.17969,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[89.877,-19.1797,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[89.877,-11.1797,0.00650382],89.9661,true,true],
     ["Land_HBarrierWall6_F",[89.877,-27.1797,0.00650382],89.9661,true,true]
]; // list of objects to spawn as landscape
if (GMSCore_modtype isEqualTo "Exile") then 
{ 
	_missionLandscape = _missionLandscape + [
		["TargetBootcampHuman_F_Preview",[57.5684,-24.2852,0],271.664,[false,false]],
		["TargetBootcampHuman_F_Preview",[57.5684,-26.2852,0],271.664,[false,false]],
		["TargetBootcampHuman_F_Preview",[57.5684,-28.2852,0],271.664,[false,false]],
		["TargetBootcampHuman_F_Preview",[57.5684,-30.2852,0],271.664,[false,false]],
		["TargetBootcampHuman_F_Preview",[57.5684,-32.2852,0],271.664,[false,false]]
	];
};
_missionLootBoxes = [    
     [/*"Land_Bunker_F"*/ selectRandom GMS_crateTypes,[62.877,-20.1797,0.00650358],_crateLoot,_lootCounts,89.743],
     [/*"Land_Bunker_F"*/ selectRandom GMS_crateTypes,[63.877,22.8203,0.00650358],_crateLoot,_lootCounts,89.743]
];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.

_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.

_missionEmplacedWeapons = 
	[	
     #ifdef GMS_milServer  
     ["B_HMG_01_high_F",[-82.9199,-66.9844,-0.005615],360],
     ["B_HMG_01_A_F",[-69.1777,86.8281,0.0838783],359.997],
     ["B_GMG_01_F",[-54.8164,-9.12891,0.109973],359.995],
     ["B_HMG_01_high_F",[-52.1445,13.166,-0.00561595],0.00143266],
     ["B_HMG_01_A_F",[-13.2324,-50.4824,0.0838764],359.997],
     ["B_Mortar_01_F",[-25.3223,-0.345703,0.0433848],360],
     ["B_HMG_01_F",[-19.3008,51.5313,0.0838768],0.00624776],
     ["B_GMG_01_F",[13.5703,-52.0176,0.109974],359.996],
     ["B_static_AA_F",[0.207031,-0.310547,0.0112774],0.00196657],
     ["B_Radar_System_01_F",[0.96875,-21.998,-0.020952],2.25309e-006],
     ["B_GMG_01_F",[15.6016,58.1992,0.109973],359.997],
     ["B_T_Mortar_01_F",[29.9648,0.337891,0.0433924],0.000177332],
     ["B_GMG_01_A_F",[52.4199,-10.2988,0.109972],359.995],
     ["B_HMG_01_high_F",[77.1152,-81.0078,-0.005615],359.999],
     ["B_HMG_01_F",[66.9297,11.4141,0.0838761],359.991],
     ["B_HMG_01_high_F",[72.3965,85.8398,-0.005615],360]
	 #else 
     ["B_HMG_01_high_F",[-82.9199,-66.9844,-0.005615],360],
     ["B_HMG_01_A_F",[-69.1777,86.8281,0.0838783],359.997],
     ["B_GMG_01_F",[-54.8164,-9.12891,0.109973],359.995],
     ["B_HMG_01_high_F",[-52.1445,13.166,-0.00561595],0.00143266],
     ["B_HMG_01_A_F",[-13.2324,-50.4824,0.0838764],359.997],
     ["B_Mortar_01_F",[-25.3223,-0.345703,0.0433848],360],
     ["B_HMG_01_F",[-19.3008,51.5313,0.0838768],0.00624776],
     ["B_GMG_01_F",[13.5703,-52.0176,0.109974],359.996],	 
     ["B_GMG_01_F",[15.6016,58.1992,0.109973],359.997],
     ["B_T_Mortar_01_F",[29.9648,0.337891,0.0433924],0.000177332],
     ["B_GMG_01_A_F",[52.4199,-10.2988,0.109972],359.995],
     ["B_HMG_01_high_F",[77.1152,-81.0078,-0.005615],359.999],
     ["B_HMG_01_F",[66.9297,11.4141,0.0838761],359.991],
     ["B_HMG_01_high_F",[72.3965,85.8398,-0.005615],360]
	 #endif
	]; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used

_missionGroups = 
	[
	//_x params["_position","_minAI","_maxAI","_skillLevel","_minPatrolRadius","_maxPatrolRadius"];
	//[[-52.6523,15.8281,-0.00143838],2,3,"Orange",10,15],
	[[-48.6113,-38.877,-0.00143886],2,3,"Orange",10,15],
	//[[18.4492,-39.5684,-0.00143838],2,3,"Orange",10,15],
	[[42.6504,31.6621,-0.00143886],2,3,"Orange",10,15],
	//[[7.51563,46.4531,-0.001438864],2,3,"Orange",10,15],
	[[-8.99219,-11.623,-0.00143838],2,3,"Orange",10,15],
	//[[5.70898,46.9668,-0.00143886],2,3,"Orange",10,15],
	[[-48.9297,48.3809,-0.00143886],2,3,"Orange",10,15],
	//[[-63.0859,58.8594,-0.00143886],2,3,"Orange",10,15],
	[[15.0547,58.5723,-0.00143886],2,3,"Orange",10,15],
	//[[-8.16211,6.19727,-0.00143886],2,3,"Orange",10,15],
	[[-39.8711,6.19727,-0.00143886],2,3,"Orange",10,15],
	//[[-34.4902,-20.1328,-0.00143886],2,3,"Orange",10,15],
	[[-9.00977,-17.8652,-0.00143886],2,3,"Orange",10,15]
	]; // Can be used to define spawn positions of AI patrols



_missionPatrolVehicles = [
     [selectRandom GMS_AIPatrolVehiclesOrange,[-124.51,3.77344,-0.0159559],0.00168412],
     [selectRandom GMS_AIPatrolVehiclesOrange,[-109.133,115.871,-0.03388],315.002]
     //[selectRandom GMS_tracked_AA_ARMA3,[106.887,113.871,-0.028933],45.0024],
     //[selectRandom GMS_Tanks_ARMA3,[129.93,-141.285,-0.015038],0.0016877],
     //[selectRandom GMS_light_AT_ARMA3,[180.85,2.07617,-0.0159585],0.00167379],
     //[selectRandom GMS_tracked_APC_ARMA3,[-120.836,-109.834,0.00836205],360]	
	
	
];  // can be used to define the spawn positions of vehicle patrols

//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Orange;
_maxNoAI = GMS_MaxAI_Orange;
_noAIGroups = GMS_AIGrps_Orange;
_noVehiclePatrols = GMS_SpawnVeh_Orange;
_noEmplacedWeapons = GMS_SpawnEmplaced_Orange;
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;

_chanceHeliPatrol = GMS_chanceHeliPatrolBlue;  // Setting this in the mission file overrides the defaults 
_noChoppers = GMS_noPatrolHelisOrange;
_missionHelis = GMS_patrolHelisOrange;

//_chancePara = GMS_chanceParaOrange; // Setting this in the mission file overrides the defaults 
//_noPara = 5;  // Setting this in the mission file overrides the defaults 
//_paraTriggerDistance = 400; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
//_paraSkill = "orange";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.
//_chanceLoot = 0.7; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [GMS_contructionLoot,GMS_contructionLoot,GMS_highPoweredLoot,GMS_supportLoot];
private _paralootCountsChoices = [[0,0,0,25,25,0],[0,0,0,25,25,0],[20,30,0,0,0,0],[0,0,0,0,30,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.


//_endCondition = playerNear;  // Options are allUnitsKilled, playerNear, allKilledOrPlayerNear

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
