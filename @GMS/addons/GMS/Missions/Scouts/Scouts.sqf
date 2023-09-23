/*
 
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf";

//diag_log "[GMS] Spawning Scout Mission";
 
_crateLoot = GMS_BoxLoot_Red;
_lootCounts = [3,5,2,3,6,1];
_startMsg = "A group of Bandit Scouts was sighted in a nearby sector! Check the Red triangular marker on your map for the location!";
_endMsg = "The Scout Camp is under Survivor Control!";
_markerLabel = "Scouts";
//_markerType = ["mil_triangle",[0,0]];
_markerType = ["mil_triangle",[0,0]];
_markerColor = "ColorRed";
_markerMissionName = "Scouts";
_missionLandscapeMode = "random"; // acceptable values are "none","random","precise"
_missionLandscape = ["Land_CratesWooden_F","Land_Mound01_8m_F", "Land_Mound01_8m_F","Land_Mound01_8m_F", "Land_Mound01_8m_F","Land_Mound01_8m_F", "Land_Mound01_8m_F","Land_CratesPlastic_F","Land_Sacks_goods_F","FirePlace_burning_F","Land_CratesShabby_F","Land_HBarrier_3_F","Land_HBarrier_3_F","Land_HBarrier_3_F","Land_HBarrier_3_F","Land_Sacks_heap_F","Land_Sacks_heap_F","Land_TentA_F","Land_TentA_F","Land_TentA_F"];; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
//  Change _useMines to true/false below to enable mission-specific settings.
_missionGroups = [
     [[-5,-5,0],3,3,"Red",30,45],
     [[-5,5,0],3,3,"Red",30,45],
     [[5,5,0],3,3,"Red",30,45]
];

//_useMines = GMS_useMines;
_useMines = true;
_minNoAI = 6;
_maxNoAI = 9;
_noAIGroups = 3;
_noVehiclePatrols = -1;
_noEmplacedWeapons = -1;

_uniforms = ["U_OG_Guerilla1_1","U_OG_Guerilla2_1","U_OG_Guerilla2_2","U_OG_Guerilla2_3","U_OG_Guerilla3_1","U_OG_Guerilla3_2"];

if (GMSCore_modtype isEqualTo "Epoch") then
{
	_headGear = ["H_92_EPOCH","H_91_EPOCH","H_90_EPOCH","H_89_EPOCH","H_88_EPOCH","H_87_EPOCH","H_86_EPOCH"];
	_uniforms = _uniforms + GMS_femaleUniformsEpoch;
};
if (GMSCore_modtype isEqualTo "Exile") then
{
	_headGear = ["H_Cap_blk","H_Cap_blk_Raven","H_Cap_blu","H_Cap_brn_SPECOPS","H_Cap_grn","H_Cap_headphones","H_Cap_khaki_specops_UK","H_Cap_oli","H_Cap_press","H_Cap_red","H_Cap_tan","H_Cap_tan_specops_US"];
};

_chancePara =  0;
_noPara = 0;
_chanceHeli = 0;
_noChoppers = 0;
_endCondition = allKilledOrPlayerNear;  // Options are allUnitsKilled, playerNear, allKilledOrPlayerNear

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
