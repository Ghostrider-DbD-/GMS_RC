/*
Mission Compositions prepared for ghostridergaming by Ghostrider [GRG]
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf";
diag_log "[GMS] Spawning Orange Mission with template = commandersComplex";
_crateLoot = GMS_BoxLoot_Orange;
_lootCounts = [15,50,20,60,44,5];  //  	GMS_lootCountsOrange = [8,32,8,30,16,1];
_startMsg = "An enemy Commander was sighted in a nearby sector! Check the Orange marker on your map for the location!";
_endMsg = "The Sector at the Orange Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ellipse",[350,350],"SOLID"];
_markerColor = "ColorOrange";
_markerMissionName = "Commander";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     #ifdef GMS_milServer       
     ["Land_Cargo_HQ_V3_F",[8.32422,-11.2773,-0.00143886],0,true,true,[["B_static_AA_F",[-3.21094,2.91797,3.13029],359.986],["B_static_AT_F",[3.09961,3.7168,3.67582],320.819],["B_static_AT_F",[-2.95117,-5.06445,3.13029],0.00396196],["B_static_AA_F",[6.08203,2.0957,3.13441],359.809],["B_static_AA_F",[-12.6777,-1.39648,0.00477552],0.00115225],["B_T_HMG_01_F",[-5.99609,-11.9609,0.077373],359.996],["B_static_AA_F",[1.77344,13.498,0.00477648],359.997],["B_static_AT_F",[15.0996,-8.0293,0.00477219],0.000537688],["B_T_HMG_01_F",[15.2148,8.1875,0.077373],359.997],["B_HMG_01_A_F",[-18.8223,-10.2754,0.0773745],359.997]],[]]
     #endif
];

_missionLandscape = [
     ["Land_BagBunker_Small_F",[-27.3281,-18.457,-0.299264],86.0005,true,true],
     ["CamoNet_INDP_Curator_F",[-28.3281,-18.457,-0.299264],257.035,true,true],
     ["Land_HBarrier_5_F",[-11.3281,-28.457,-0.299264],0,true,true],
     ["Land_HBarrier_5_F",[-19.3281,-26.457,-0.299264],222.822,true,true],
     ["Land_HBarrier_5_F",[-2.32813,-28.457,-0.299264],0,true,true],
     ["RoadCone_L_F",[-4.37305,-1.61523,-0.299264],0,true,true],
     ["Land_HBarrier_5_F",[-23.3281,5.54297,-0.299264],268.921,true,true],
     ["Land_HBarrier_5_F",[-23.3281,-1.45703,-0.299264],268.921,true,true],
     ["Land_HBarrier_5_F",[-23.3281,-8.45703,-0.299264],268.921,true,true],
     ["Land_HBarrier_5_F",[-18.3281,11.543,-0.299264],148.179,true,true],
     ["Flag_AAF_F",[-12.3281,1.54297,-0.299264],0,true,true],
     ["Land_HBarrier_5_F",[3.67188,17.543,-0.299264],0,true,true],
     ["Land_HBarrier_5_F",[-2.32813,17.543,-0.299264],0,true,true],
     ["Land_BagBunker_Small_F",[-10.3281,15.543,-0.299264],0,true,true],
     ["CamoNet_INDP_Curator_F",[-10.3281,15.543,-0.299264],336.06,true,true],
     ["Land_HBarrier_5_F",[14.6719,-23.457,-0.299264],134.913,true,true],
     ["Land_HBarrier_5_F",[20.6719,-18.457,-0.299264],133.549,true,true],
     ["Land_BagBunker_Small_F",[5.67188,-30.457,-0.299264],0,true,true],
     ["CamoNet_INDP_Curator_F",[5.67188,-32.457,-0.299264],169.022,true,true],
     ["Land_HBarrier_5_F",[19.6719,6.54297,-0.299264],269.417,true,true],
     ["Land_HBarrier_5_F",[20.6719,-12.457,-0.299264],269.417,true,true],
     ["Land_HBarrier_5_F",[20.6719,-6.45703,-0.299264],269.417,true,true],
     ["Land_BagBunker_Small_F",[23.6719,0.542969,-0.299264],265.618,true,true],
     ["CamoNet_INDP_Curator_F",[26.6719,0.542969,-0.299264],80.5745,true,true],
     ["Land_HBarrier_5_F",[10.6719,17.543,-0.299264],0,true,true],
     ["Land_HBarrier_5_F",[15.6719,14.543,-0.299264],45.2335,true,true]
]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = [

     ["B_HMG_01_A_F",[-16.1504,-23.7324,-0.221891],0.00624952],
     ["B_T_HMG_01_F",[-3.32422,-25.418,-0.221891],359.997],
     ["B_T_HMG_01_F",[-21.3145,5.49609,-0.22189],359.997],
     ["B_static_AT_F",[-22.0508,8.89063,-0.294489],0.00423371],
     ["B_static_AA_F",[4.44531,0.0410156,-0.294488],359.997],
     ["B_static_AA_F",[-10.0059,-14.8535,-0.294491],359.999],
     //["B_Radar_System_01_F",[-5.32813,7.54297,-0.326719],360],
     ["B_static_AT_F",[17.7715,-21.4863,-0.294491],359.991],
     ["B_T_HMG_01_F",[17.8867,-5.26953,-0.22189],359.997],
     ["B_HMG_01_A_F",[10.0625,13.8516,-0.221892],359.996],
     ["B_static_AT_F",[19.0977,10.4746,-0.294489],359.998],
     ["B_T_GMG_01_F",[17.6973,4.7832,-0.195796],359.997]
];

_missionPatrolVehicles = [
     [selectRandom GMS_AIPatrolVehiclesOrange,[-47.8262,-23.5137,-0.321316],0.0016802],
     [selectRandom GMS_AIPatrolVehiclesGreen,[-30.4395,13.2695,-0.321565],0.00168791]
     //[selectRandom GMS_tracked_APC_ARMA3,[-14.084,-61.1504,-0.321593],0.0016711],
     //[selectRandom GMS_Tanks_ARMA3,[-8.88086,27.3223,-0.312962],0.000197464],
     //[selectRandom GMS_light_AT_ARMA3,[29.0449,-42.6465,-0.319407],0.00168023],
     //[selectRandom GMS_tracked_APC_ARMA3,[25.6289,19.6641,-0.313045],0.000197989]   
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
