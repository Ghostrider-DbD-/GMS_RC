/*
 
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf";

//diag_log "[GMS] Spawning Hunters Mission";

_crateLoot = GMS_BoxLoot_Green;
_lootCounts = [3,6,3,4,10,1];
_startMsg = "A group of Bandit Hunters was sighted in a nearby sector! Check the Red Triangular marker on your map for the location!";
_endMsg = "The Hunter Camp is under Survivor Control!";
_markerLabel = "Hunters";
_markerType = ["mil_triangle",[0,0]];
_markerColor = "ColorRed";
_markerMissionName = "Hunters";
_missionLandscapeMode = "random"; // acceptable values are "none","random","precise"
_missionLandscape = ["Land_Cargo_Patrol_V1_F","Land_WoodPile_F","Land_BagFence_Short_F","Land_BagFence_Short_F","Land_BagFence_Short_F","Land_TentA_F","Land_HBarrier_3_F","Land_HBarrier_3_F","Land_HBarrier_3_F","Land_HBarrier_3_F","Land_HBarrier_3_F","Land_HBarrier_3_F","Land_Wreck_Truck_F","Land_Wreck_Hunter_F"]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used

//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_useMines = true;
_minNoAI = 9;
_maxNoAI = 12;
_noAIGroups = 3;
_noVehiclePatrols = -1;
_noEmplacedWeapons = -1;
_uniforms = ["U_OG_leader","U_O_PilotCoveralls","U_O_CombatUniform_ocamo","U_OG_leader","U_O_PilotCoveralls","U_O_CombatUniform_ocamo","U_OG_leader","U_O_PilotCoveralls","U_O_CombatUniform_ocamo","U_O_FullGhillie_lsh","U_O_FullGhillie_sard","U_O_FullGhillie_ard"];


if (GMSCore_modtype isEqualTo "Epoch") then
{
	_headGear = ["H_39_EPOCH","H_40_EPOCH","H_41_EPOCH","H_43_EPOCH","H_44_EPOCH","H_45_EPOCH","H_46_EPOCH"];
	//_uniforms = _uniforms + GMS_femaleUniformsEpoch;	
};
if (GMSCore_modtype isEqualTo "Exile") then
{
	_headGear = ["H_Booniehat_dgtl","H_Booniehat_dirty","H_Booniehat_grn","H_Booniehat_indp","H_Booniehat_khk","H_Booniehat_khk_hs","H_Booniehat_mcamo","H_Booniehat_tan"];
};

_chancePara =  0;
_noPara = 0;
_chanceHeli = 0;
_noChoppers = 0;
/*
	"_spawnCratesTiming", 
	"_loadCratesTiming", 
	"_endCondition",
*/
_endCondition = allKilledOrPlayerNear;  // Options are allUnitsKilled, playerNear, allKilledOrPlayerNear

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
