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

//diag_log "[GMS] Spawning Red Mission with template = default";
_crateLoot = GMS_BoxLoot_Red;
_lootCounts = GMS_lootCountsRed;
_startMsg = "An Ammunition Factory was sighted in a nearby sector! Check the Red marker on your map for the location!";
_endMsg = "The Factory at the Red Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[300,300],"GRID"];
_markerColor = "ColorRed";
_markerMissionName = "Factory";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_Tower_V3_F",[-18.6987,-51.7905,-0.0014348],91.6296,true,true,[["B_HMG_01_high_F",[3.31396,2.89209,8.57585],359.999],["B_HMG_01_high_F",[13.0347,0.8479,-0.0121226],360],["B_HMG_01_high_F",[-9.4834,13.5967,-0.0121226],0.00158913],["B_HMG_01_high_F",[-0.601074,3.90967,17.8764],359.999],["B_HMG_01_high_F",[-0.877441,-4.83179,17.8764],359.999],["B_HMG_01_high_F",[-9.77783,29.3799,-0.0121226],360]],[]],
     ["Land_Cargo_Patrol_V3_F",[-27.1675,-15.407,-0.00143814],91.6296,true,true,[["B_HMG_01_high_F",[-1.15381,1.24658,4.33092],275.276]],[]],
     ["Land_Cargo_Patrol_V3_F",[-10.7632,4.77441,-0.00143814],181.63,true,true,[["B_HMG_01_high_F",[-1.32959,1.03662,4.33092],359.999]],[]],
     ["Land_Cargo_Patrol_V3_F",[12.9375,3.5835,-0.00143814],181.63,true,true,[["B_HMG_01_high_F",[1.57861,1.04736,4.33093],357.402],["B_HMG_01_high_F",[8.41357,-9.20557,-0.0121202],0.0033673]],[]]
];



_missionLandscape = [
     //["babe_helper",[-4335.99,-3525.64,-0.00143862],0,true,true],
     //["Sign_Arrow_Green_F",[-4333.49,-3526.14,-0.00143862],0,true,true],
     //["Sign_Arrow_F",[-4333.49,-3526.14,-0.00143862],0,true,true],
     //["Sign_Arrow_Yellow_F",[-4333.49,-3526.14,-0.00143862],0,true,true],
     ["Land_HBarrier_Big_F",[0,0,0],181.63,true,true],
     ["Land_HBarrier_Big_F",[13.4092,-3.25757,0],271.63,true,true],
     ["Land_HBarrier_Big_F",[8.375,-0.113037,0],181.63,true,true],
     ["Land_Cargo_Patrol_V3_F",[1.41602,-4.66895,4.76837e-007],181.63,true,true],
     ["Land_HBarrier_Big_F",[13.4199,-11.7607,0],271.63,true,true],
     ["Land_HBarrier_Big_F",[18.5933,-23.1626,0],181.63,true,true],
     ["Land_HBarrier_Big_F",[13.436,-19.8896,0],271.63,true,true],
     ["Land_HBarrier_Big_F",[21.832,-28.0088,0],271.63,true,true],
     ["Land_BagFence_Round_F",[26.2334,-38.7039,0],316.63,true,true],
     ["Land_BagFence_Round_F",[26.3379,-36.5427,0],226.63,true,true],
     ["Land_BagFence_Long_F",[23.7163,-39.2576,0],181.63,true,true],
     ["CamoNet_OPFOR_F",[10.2559,-17.4697,0],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-3.3916,-4.90503,0],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-30.9849,1.00684,0],181.63,true,true],
     ["Land_HBarrier_Big_F",[-17.564,-2.00073,0],271.63,true,true],
     ["Land_HBarrier_Big_F",[-22.731,1.02173,0],181.63,true,true],
     ["Land_Cargo_Patrol_V3_F",[-22.2847,-3.47803,4.76837e-007],181.63,true,true],
     ["CamoNet_OPFOR_big_F",[-34.8179,-6.18286,0],1.62962,true,true],
     ["Land_HBarrier_Big_F",[-20.0698,-63.729,0],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-33.6689,-66.9641,0],181.63,true,true],
     ["Land_HBarrier_Big_F",[-25.1631,-66.959,0],181.63,true,true],
     ["Land_BagFence_Long_F",[-17.6025,-60.449,0],181.63,true,true],
     ["Land_Cargo_Tower_V3_F",[-30.2202,-60.043,3.8147e-006],91.6296,true,true],
     ["Land_BagFence_Round_F",[-15.085,-59.8953,0],316.63,true,true],
     ["Land_HBarrier_Big_F",[-39.3599,1.11987,0],181.63,true,true],
     ["Land_HBarrier_Big_F",[-42.751,-3.7854,0],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-42.8638,-12.1604,0],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-37.8037,-27.686,0],181.63,true,true],
     ["Land_HBarrier_Big_F",[-42.8486,-20.4146,0],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-42.9619,-28.7896,0],91.6296,true,true],
     ["Land_Cargo_Patrol_V3_F",[-38.689,-23.6594,4.76837e-007],91.6296,true,true],
     ["CamoNet_OPFOR_F",[-37.1313,-30.3784,0],1.62962,true,true],
     ["Land_HBarrier_Big_F",[-36.8999,-61.8621,0],91.6296,true,true],
     ["Land_HBarrier_Big_F",[-36.792,-53.6099,0],91.6296,true,true],
     ["Land_BagFence_Corner_F",[-37.04,-49.1382,0],1.62962,true,true],
     ["Land_BagFence_Corner_F",[-40.8984,-48.5288,0],181.63,true,true],
     ["Land_BagFence_Long_F",[-39.0317,-48.8325,0],181.63,true,true],
     ["Land_BagFence_Long_F",[-39.1577,-44.4534,0],1.62962,true,true],
     ["Land_BagFence_Long_F",[-41.2227,-46.7695,0],91.6296,true,true],
     ["Land_BagFence_Corner_F",[-40.916,-44.7759,0],271.63,true,true],
     ["Land_HBarrier_Big_F",[0.214844,-63.1599,0],181.63,true,true],
     ["Land_HBarrier_Big_F",[8.46875,-63.145,0],181.63,true,true],
     ["Land_HBarrier_Big_F",[-8.16016,-63.0469,0],181.63,true,true],
     ["Land_HBarrier_Big_F",[21.3247,-43.1565,0],271.63,true,true],
     ["Land_HBarrier_Big_F",[21.3354,-51.6597,0],271.63,true,true],
     ["Land_HBarrier_Big_F",[21.3516,-59.7886,0],271.63,true,true],
     ["Land_HBarrier_Big_F",[16.6245,-63.0515,0],181.63,true,true],
     ["Land_Dome_Small_F",[0.337891,-44.8254,-4.76837e-007],0.223401,true,true],
     ["Land_dp_smallTank_F",[18.314,-70.0537,0],0,true,true],
     ["Land_dp_smallTank_F",[9.81934,-69.9482,0],0,true,true]
];

_missionLootBoxes = [
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     [selectRandom GMS_AIPatrolVehicles,[-53.8027,-29.7834,0.00867844],0.00103655],
     [selectRandom GMS_AIPatrolVehicles,[51.0596,-25.7876,0.00815535],0.00104356]
];

_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = []; //



//////////
//   The lines below define additional variables you may wish to configure.


//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Red;
_maxNoAI = GMS_MaxAI_Red;
_noAIGroups = GMS_AIGrps_Red;
_noVehiclePatrols = GMS_SpawnVeh_Red;
_noEmplacedWeapons = GMS_SpawnEmplaced_Red;

private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [GMS_contructionLoot,GMS_contructionLoot,GMS_highPoweredLoot,GMS_supportLoot];
private _paralootCountsChoices = [[0,0,0,10,10,0],[0,0,0,10,10,0],[10,10,0,0,0,0],[0,0,0,0,15,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.

#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";  
