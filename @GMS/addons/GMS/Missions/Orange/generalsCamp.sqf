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
_lootCounts = [15,50,20,60,44,5]; ;
_startMsg = "An enemy General was sighted in a nearby sector! Check the Orange marker on your map for the location!";
_endMsg = "The Sector at the Orange Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ellipse",[350,350],"SOLID"];
_markerColor = "ColorOrange";
_markerMissionName = "General";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_HQ_V3_F",[-19.5625,12.75,-0.00143886],0,true,true,
	 	[
            #ifdef GMS_milServer
			["B_static_AT_F",[-2.19141,2.61328,3.12619],0],
			["B_static_AA_F",[18.8105,0.414063,4.76837e-007],0],  
            #else
			["B_HMG_01_high_F",[-2.19141,2.61328,3.12619],0],
			["B_HMG_01_high_F",[18.8105,0.414063,4.76837e-007],0],
            #endif          
			["B_G_Mortar_01_F",[4.44531,-1.23633,3.12661],0],
			["B_T_GMG_01_F",[10.5313,8.77148,4.76837e-007],0]

		],[]
	]
];
_missionLandscape = [
    ["Land_Cargo_House_V3_F",[-22.584,-5.57813,-0.00143886],274.124,true,true],
     ["CamoNet_INDP_big_F",[-24.7871,-6.60547,-0.00143862],274.124,true,true],
     ["Land_StoneWall_01_s_10m_F",[-18.334,-29.9805,-0.00143886],205.753,true,true],
     ["Land_HBarrierWall6_F",[-25.7559,-24.4082,1.16748],236.075,true,true],
     ["Land_HBarrierWall6_F",[-8.11523,-33.877,-0.00143886],192.539,true,true],
     ["Land_HBarrier_5_F",[-15.0684,-23.7363,-0.00143886],37.9792,true,true],
     ["Land_Cargo_House_V3_F",[10.4727,-31.4297,-0.00143886],0,true,true],
     ["CamoNet_INDP_big_F",[9.28906,-29.3066,-0.00143862],0,true,true],
     ["Flag_AAF_F",[1.36328,-9.5918,-0.00143886],0,true,true],
     ["Land_HBarrier_5_F",[-0.244141,23.9629,-0.00143886],136.596,true,true],
     ["Land_StoneWall_01_s_10m_F",[-17.1445,22.707,-0.00143886],126.293,true,true],
     ["RoadCone_L_F",[0.914063,-0.908203,-0.00143838],0,true,true],
     ["Land_StoneWall_01_s_10m_F",[-5.76367,33.9297,-0.00143886],149.724,true,true],
     ["Land_HBarrierWall6_F",[3.26758,32.4668,-0.00143886],343.996,true,true],
     ["Land_HBarrierWall6_F",[-7.77734,27.0352,1.1692],330.052,true,true],
     ["Land_HBarrier_5_F",[25.5332,-18.2188,-0.00143886],136.596,true,true],
     ["Land_StoneWall_01_s_10m_F",[30.209,-21.5527,0.788476],316.253,true,true],
     ["Land_HBarrierWall6_F",[38.3105,-17.6387,-0.00143886],145.55,true,true],
     ["Land_HBarrierWall6_F",[25.752,-28.7578,-0.00143886],145.21,true,true],
     ["Land_HBarrier_5_F",[31.0332,16.5156,-0.00143886],37.9792,true,true],
     ["Land_Cargo_House_V3_F",[36.7344,-2.48047,-0.00143886],0,true,true],
     ["CamoNet_INDP_big_F",[36.8828,-1.53125,-0.00143862],0,true,true],
     ["Land_StoneWall_01_s_10m_F",[34.7969,22.2148,-0.00143886],39.3743,true,true],
     ["Land_BagBunker_Tower_F",[13.6211,-1.86523,-0.00143886],0,true,true],
     ["Land_HBarrierWall6_F",[41.2773,14.2363,-0.00143886],46.4321,true,true],
     ["Land_HBarrierWall6_F",[27.1191,25.123,-0.00143886],43.3727,true,true],
     ["Land_StoneWall_01_s_10m_F",[21.6309,31.3789,-0.00143886],0,true,true],
     ["Land_BagBunker_Tower_F",[13.6699,28.5684,-0.00143886],0,true,true]
]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.

_missionLootVehicles = [
];

_missionPatrolVehicles = [
    #ifdef GMS_milServer
     [selectRandom GMS_AIPatrolVehiclesOrange,[-53.3984,-32.1953,-0.0238545],0.00168023],
     [selectRandom GMS_AIPatrolVehiclesGreen,[-41.373,21.6543,-0.023375],0.00167416]
     //[selectRandom GMS_tracked_AA_ARMA3,[3.89844,48.4082,-0.0219693],0.00167182],
     //[selectRandom GMS_Tanks_ARMA3,[12.877,-54.4258,-0.0238872],0.00167124],
     //[selectRandom GMS_light_AT_ARMA3,[55.5371,-12.541,-0.0210321],0.00167126],
     //[selectRandom GMS_tracked_APC_ARMA3,[50.2324,21.9902,-0.0222204],0.00167786]
];

_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = [
     ["B_T_Static_AT_F",[-17.7773,-27.4141,0.00333524],359.999],
     ["B_static_AA_F",[-0.751953,13.1641,0.00333142],0.000330652],
     ["B_static_AA_F",[9.62305,-17.4297,0.00333142],0.000328912],    
     ["B_Radar_System_01_F",[11.6035,13.4375,-0.0288956],1.31836e-005],   
     ["B_T_Static_AT_F",[-4.125,30.8418,0.00333095],0.00263487],
     ["B_T_Static_AT_F",[28.8594,-20.3203,0.00333095],0.0122616],  
     ["B_static_AT_F",[38.6895,12.291,0.00333142],0.00263745],
     ["B_T_Static_AT_F",[33.5723,20.9922,0.00333142],0.00263668],	 
];
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Orange;
_maxNoAI = GMS_MaxAI_Orange;
_noAIGroups = GMS_AIGrps_Orange;
_noVehiclePatrols = GMS_SpawnVeh_Orange;
_noEmplacedWeapons = GMS_SpawnEmplaced_Orange;
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;

private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [GMS_contructionLoot,GMS_contructionLoot,GMS_highPoweredLoot,GMS_supportLoot];
private _paralootCountsChoices = [[0,0,0,25,25,0],[0,0,0,25,25,0],[20,30,0,0,0,0],[0,0,0,0,30,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
