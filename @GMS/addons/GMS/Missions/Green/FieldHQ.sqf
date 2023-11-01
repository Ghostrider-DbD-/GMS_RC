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

//diag_log "[GMS] Spawning Green Mission with template = default";
_crateLoot = GMS_BoxLoot_Green;
_lootCounts = GMS_lootCountsGreen;
_startMsg = "An enemy Forward Headquarters l was sighted in a nearby sector! Check the Green marker on your map for the location!";
_endMsg = "The Sector at the Green Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ellipse",[225,225],"GRID"];
_markerColor = "ColorGreen";
_markerMissionName = "Headquarters";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
	["Land_Medevac_HQ_V1_F",[-28.7168,-6.5918,2.38419e-007],0,[true,true]],
	["Land_Medevac_HQ_V1_F",[0.283203,19.4082,2.38419e-007],0,[true,true]],
	["Flag_AAF_F",[4,4,0],0,[false,false]],
	["Land_Cargo10_yellow_F",[3.2832,-16.5918,0],0,[false,false]],
	["Land_Cliff_stoneCluster_F",[-28.7168,6.4082,0],0,[false,false]],
	["Land_SharpStones_erosion",[-19.7168,-19.5918,0],0,[false,false]],
	["Land_W_sharpStones_erosion",[-13.7168,6.4082,0],0,[false,false]],
	["Land_BluntStones_erosion",[-5.7168,-12.5918,0],0,[false,false]],
	["Land_SharpRock_apart",[16.2832,24.4082,0],0,[false,false]],
	["Land_W_sharpRock_apart",[-21.7168,29.4082,0],0,[false,false]],
	["Land_BluntRock_apart",[-11.7168,-26.5918,-2.38419e-007],0,[false,false]],
	["Land_SharpRock_apart",[48.2832,-10.5918,0],0,[false,false]],
	["Land_SharpRock_apart",[-43.7168,6.4082,0],0,[false,false]],
	["Land_W_sharpRock_apart",[-38.7168,-20.5918,0],0,[false,false]],
	["Land_BluntRock_apart",[52.2832,16.4082,-2.38419e-007],0,[false,false]],
	["Land_SharpRock_apart",[27.2832,-34.5918,0],0,[false,false]],
	["Land_W_sharpRock_apart",[-45.7168,28.4082,0],0,[false,false]],
	["Land_StoneSharp_small",[-1.7168,44.4082,0],0,[false,false]],
	["Land_FieldToilet_F",[-13.7168,21.4082,0],0,[false,false]],
	["Land_Pallets_F",[10.2832,-4.5918,0],0,[false,false]],
	["Land_Pallets_F",[19.2832,6.4082,0],0,[false,false]],
	["Land_Pallets_stack_F",[10.2832,-13.5918,0],0,[false,false]],
	["Land_Cargo_House_V3_F",[24.2832,-1.5918,0],0,[true,true]],
	["Land_Cargo_House_V3_F",[24.2832,-17.5918,0],0,[true,true]],
	["Land_StoneSharp_small",[10.2988,-30.9434,0],0,[false,false]],
	["Land_Medevac_HQ_V1_F",[37.2832,6.4082,2.38419e-007],0,[true,true]]
]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Green;
_maxNoAI = GMS_MaxAI_Green;
_noAIGroups = GMS_AIGrps_Green;
_noVehiclePatrols = GMS_SpawnVeh_Green;
_noEmplacedWeapons = GMS_SpawnEmplaced_Green;
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;
//_chanceLoot = 1; //0.6; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [GMS_contructionLoot,GMS_contructionLoot,GMS_highPoweredLoot,GMS_supportLoot];
private _paralootCountsChoices = [[0,0,0,8,8,0],[0,0,0,8,8,0],[8,8,0,0,0,0],[0,0,0,0,12,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.
 
#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
