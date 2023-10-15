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
	
//diag_log "[GMS] Spawning Green Mission with template = medicalCamp";

_crateLoot = GMS_BoxLoot_Green;
_lootCounts = GMS_lootCountsGreen;
_startMsg = "A Bandit Forward Command Post has been spotted. Check the Green marker on your map for its location";
_endMsg = "The Bandit Command Post camp at the Green Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ellipse",[350,350],"SOLID"];
_markerColor = "ColorGreen";
_markerMissionName = "Command Post";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
		["Flag_AAF_F",[4,-4,0],0,[false,false]], 
		["Land_dp_transformer_F",[1.698242,-10.4668,-0.00763702],271.32,[true,true]], 
		["Land_Wreck_BRDM2_F",[1.37012,13.498,0.00109863],184.487,[true,true]], 
		["Land_BagBunker_Small_F",[18.4512,-3.66406,0.00780487],305.003,[true,true]], 
		["Land_Cargo_HQ_V1_F",[-20.1367,11.7539,0],90.8565,[true,false]], 
		["Land_BagBunker_Small_F",[-22.707,-3.75586,-0.0130234],44.9901,[true,true]], 
		["Land_Cargo_House_V1_F",[24.3584,7.45313,0.00111389],91.6329,[true,true]],  
		["StorageBladder_01_fuel_forest_F",[1.29492,29.3184,0.000999451],179.65,[false,false]], 
		["Land_GarbageBags_F",[-9.45996,31.252,0.02005],184.595,[false,false]], 
		["Land_GarbageBags_F",[-13.0459,32.668,-0.0283051],184.595,[false,false]], 
		["Land_GarbageBags_F",[-11.5957,33.125,-0.598007],184.595,[false,false]], 
		["Land_GarbageBags_F",[-8.98145,34.5801,-0.00514221],184.592,[false,false]], 
		["Land_Addon_02_V1_ruins_F",[24.8369,24.6582,-0.00820923],90.9637,[false,false]], 
		["Land_GarbageBags_F",[-10.9443,35.0449,0.577057],184.592,[false,false]], 
		["Land_Cargo20_military_green_F",[14.6533,32.9004,0.000480652],90.0989,[false,false]], 
		["Land_BagBunker_Small_F",[-23.0186,28.6738,-0.0271301],120.012,[false,false]], 
		["Land_BagBunker_Small_F",[37.1504,34.5742,0.0146866],255,[false,false]]
		]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;_minNoAI = GMS_MinAI_Green;
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_maxNoAI = GMS_MaxAI_Green;
_noAIGroups = GMS_AIGrps_Green;
_noVehiclePatrols = GMS_SpawnVeh_Green;
_noEmplacedWeapons = GMS_SpawnEmplaced_Green;
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;
//_chancePara = GMS_chanceParaGreen;
//_chanceLoot = 1; //0.6; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [GMS_contructionLoot,GMS_contructionLoot,GMS_highPoweredLoot,GMS_supportLoot];
private _paralootCountsChoices = [[0,0,0,8,8,0],[0,0,0,8,8,0],[8,8,0,0,0,0],[0,0,0,0,12,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.
 
#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 

