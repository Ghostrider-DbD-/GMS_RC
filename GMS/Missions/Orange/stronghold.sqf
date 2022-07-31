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
//diag_log "[GMS] Spawning Orange Mission with template = default";
_crateLoot = GMS_BoxLoot_Orange;
_lootCounts = [15,50,20,60,44,5]; 
_startMsg = "The enemy is building a new stronghold in a nearby sector! Check the Orange marker on your map for the location!";
_endMsg = "The Sector at the Orange Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ellipse",[250,250],"GRID"];
_markerColor = "ColorOrange";
_markerMissionName = "Stronghold";

_garrisonedBuildings_BuildingPosnSystem = [
    // ["Land_Unfinished_Building_02_F",[-28.137,-48.6494,0],0,true,true,0.67,3,[],4],
     //["Land_i_Shop_02_V2_F",[22.688,35.2515,0],0,true,true,0.67,3,[],4]
	
	//["Land_Cargo_HQ_V3_F",[-27.8406,0.277832,-4.76837e-007],0,true,true,0.67,3,[],4],
	//["Land_Cargo_HQ_V3_F",[1.40454,31.6079,-4.76837e-007],0,true,true,0.67,3,[],4],
	//["Land_Cargo_HQ_V3_F",[33.1689,-0.558105,-4.76837e-007],0,true,true,0.67,3,[],4],
	//["Land_Cargo_Tower_V3_F",[0.176514,-0.358887,-1.2105],0,true,true,0.67,3,[],4],	
	//["Land_Cargo_HQ_V3_F",[1.03589,-33.1763,-4.76837e-007],0,true,true,0.67,3,[],4]	
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_HQ_V3_F",[-37.3086,-12.8696,4.76837e-007],0,true,true,
	 	[
		 	#ifdef GMS_milServer
			 ["B_static_AT_F",[-1.71509,1.4873,3.12675],0],
			#endif
			["B_HMG_01_high_F",[2.66113,2.0166,3.12652],0],
			["B_HMG_01_A_F",[-13.3926,0.108887,-4.76837e-007],0]
		],[]],
     ["Land_Cargo_HQ_V3_F",[-5.54419,-45.0356,4.76837e-007],0,true,true,
	 	[
			["B_HMG_01_high_F",[3.21777,-0.104004,3.12652],0],
			["B_HMG_01_A_F",[-1.41528,-15.2954,-4.76837e-007],0],
			#ifdef GMS_milServer
			["B_Radar_System_01_F",[0.416748,17.1714,-4.76837e-007],0],
			["B_T_Static_AA_F",[11.8047,12.9712,-4.76837e-007],0],
			#endif
			["B_T_Mortar_01_F",[-14.7686,12.3579,-4.76837e-007],0]
		 ],[]],
     ["Land_Cargo_Tower_V3_F",[-1.83765,-3.36035,0],0,true,true,
	 	[
			["B_HMG_01_high_F",[-2.81006,2.229,8.58897],0],
			#ifdef GMS_milServer
			["B_static_AA_F",[-13.0447,12.3276,0],0],
			#endif
			["B_HMG_01_high_F",[4.09497,3.12305,17.8895],0],
			["B_T_Mortar_01_F",[18.2783,10.4458,0],0]
		 ],[]],
     ["Land_Cargo_HQ_V3_F",[-5.17554,19.7485,4.76837e-007],0,true,true,
	 	[
			["B_HMG_01_high_F",[-0.204346,0.493164,3.12652],0],
			["B_GMG_01_F",[2.15771,17.373,-4.76837e-007],0]
		],[]],
     ["Land_Cargo_HQ_V3_F",[23.7009,-13.7056,4.76837e-007],0,true,true,
	 	[
			 ["B_HMG_01_high_F",[-0.497314,-2.94531,3.12652],0],
			 #ifdef GMS_milServer
			 ["B_T_Static_AT_F",[5.53101,2.83936,3.1267],0],
			 #endif
			 ["B_HMG_01_F",[17.8198,0.767578,-4.76837e-007],0]
		],[]]
];

_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
     ["Land_Addon_02_ruins_F",[-64.209,-12.1621,0],184.217,true,true],
     ["Land_HBarrier_5_F",[-39.2524,-40.6089,0],244.965,true,true],
     ["Land_HBarrier_5_F",[-31.7334,-48.7769,0],209.272,true,true],
     ["Land_HBarrier_5_F",[-26.9553,-51.3354,0],209.272,true,true],
     ["Land_HBarrier_5_F",[-41.386,-36.4707,0],244.965,true,true],
     ["Land_HBarrier_5_F",[-22.6301,-53.6025,0],209.272,true,true],
     ["Land_HBarrier_5_F",[-43.7583,-31.4077,0],244.965,true,true],
     ["Land_Addon_02_ruins_F",[-43.6665,-55.3164,0],307.664,true,true],
     ["Land_HBarrier_5_F",[-45.866,-5.80811,0],297.369,true,true],
     ["Land_HBarrier_5_F",[-45.9487,-27.043,0],244.965,true,true],
     ["Land_HBarrier_5_F",[-48.3364,-22.1772,0],244.965,true,true],
     ["Land_HBarrier_5_F",[-43.8884,-1.59229,0],297.369,true,true],
     ["Land_HBarrier_5_F",[-24.8247,22.6909,0],333.062,true,true],
     ["Land_HBarrier_5_F",[-41.3245,3.37646,0],297.369,true,true],
     ["Land_HBarrier_5_F",[-36.8042,12.6348,0],297.369,true,true],
     ["Land_HBarrier_5_F",[-28.8904,20.4214,0],333.062,true,true],
     ["Land_HBarrier_5_F",[-39.2024,7.7749,0],297.369,true,true],
     ["Land_Addon_02_ruins_F",[-44.2246,32.7935,0],231.256,true,true],
     ["Land_Addon_02_ruins_F",[-1.76978,-73.6221,0],78.2878,true,true],
     ["Land_HBarrier_5_F",[7.1582,-56.229,0],152.755,true,true],
     ["Land_HBarrier_5_F",[-13.6016,-58.4463,0],209.272,true,true],
     ["Land_HBarrier_5_F",[-17.749,-56.3296,0],209.272,true,true],
     ["Land_HBarrier_5_F",[2.38843,-58.8027,0],152.755,true,true],
     ["RoadCone_L_F",[-3,-3,0],0,true,true],
     ["Land_HBarrier_5_F",[-10.7703,30.1123,0],333.062,true,true],
     ["Land_HBarrier_5_F",[-19.8433,25.23,0],333.062,true,true],
     ["Land_HBarrier_5_F",[-15.554,27.5645,0],333.062,true,true],
     ["Land_HBarrier_5_F",[7.39819,30.313,0],28.3223,true,true],
     ["Land_Addon_02_ruins_F",[-4.67432,45.1021,0],78.2878,true,true],
     ["Land_HBarrier_5_F",[30.082,-37.1455,0],117.061,true,true],
     ["Land_HBarrier_5_F",[16.4028,-51.3062,0],152.755,true,true],
     ["Land_HBarrier_5_F",[11.4351,-53.8721,0],152.755,true,true],
     ["Land_HBarrier_5_F",[20.4561,-49.0146,0],152.755,true,true],
     ["Land_HBarrier_5_F",[32.1804,-32.7358,0],117.061,true,true],
     ["Land_HBarrier_5_F",[27.71,-42.0186,0],117.061,true,true],
     ["Land_Addon_02_ruins_F",[38.1423,-60.2046,0],224.576,true,true],
     ["Land_HBarrier_5_F",[38.4685,1.19434,0],64.016,true,true],
     ["Land_HBarrier_5_F",[40.9368,-3.63086,0],64.016,true,true],
     ["Land_HBarrier_5_F",[34.7178,-27.7534,0],117.061,true,true],
     ["Land_HBarrier_5_F",[36.6726,-23.5273,0],117.061,true,true],
     ["Land_HBarrier_5_F",[20.8679,23.4243,0],28.3223,true,true],
     ["Land_HBarrier_5_F",[25.6877,20.9453,0],28.3223,true,true],
     ["Land_HBarrier_5_F",[31.5483,14.6479,0],64.016,true,true],
     ["Land_HBarrier_5_F",[36.2058,5.52197,0],64.016,true,true],
     ["Land_HBarrier_5_F",[16.5059,25.6191,0],28.3223,true,true],
     ["Land_HBarrier_5_F",[11.5803,28.2656,0],28.3223,true,true],
     ["Land_HBarrier_5_F",[33.75,10.5449,0],64.016,true,true],
     ["Land_Addon_02_ruins_F",[34.0081,26.3223,0],133.368,true,true],
     ["Land_HelipadCircle_F",[16.9146,49.8833,0],0,true,true],
     ["Banner_01_F",[11.9451,45.4272,0],0,true,true],
     ["Land_Addon_02_ruins_F",[55.3616,-22.4351,0],189.292,true,true]
]; // list of objects to spawn as landscape

_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = [
     #ifdef GMS_milServer
     ["B_Radar_System_01_F",[-5.12744,-27.8643,0],0],
     ["B_static_AA_F",[-14.8823,8.96729,0],0],
     ["B_HMG_01_A_F",[-50.7012,-12.7607,0],0],
     ["B_T_Static_AA_F",[6.2605,-32.0645,0],0],
     #endif     
     ["B_GMG_01_A_F",[-33.8472,17.8364,0],0],
     ["B_T_Mortar_01_F",[-20.3127,-32.6777,0],0],
     ["B_HMG_01_A_F",[-6.95947,-60.3311,0],0],
     ["B_GMG_01_F",[-3.01782,37.1216,0],0],
     ["B_GMG_01_A_F",[24.8743,-45.9937,0],0],
     ["B_HMG_01_F",[41.5208,-12.938,0],0],
     ["B_T_Mortar_01_F",[16.4407,7.08545,0],0]
]; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Orange;
_maxNoAI = GMS_MaxAI_Orange;
_noAIGroups = GMS_AIGrps_Orange;
_noVehiclePatrols = GMS_SpawnVeh_Orange;
_noEmplacedWeapons = GMS_SpawnEmplaced_Orange;
 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [GMS_contructionLoot,GMS_contructionLoot,GMS_highPoweredLoot,GMS_supportLoot];
private _paralootCountsChoices = [[0,0,0,25,25,0],[0,0,0,25,25,0],[20,30,0,0,0,0],[0,0,0,0,30,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
