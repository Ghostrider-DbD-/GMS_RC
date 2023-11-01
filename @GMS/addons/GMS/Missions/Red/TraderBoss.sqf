/*
Mission Compositions by Ghostrider [GRG] for ghostridergaming
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf";

//diag_log "[GMS] Spawning Red Mission with template = default";
_crateLoot = GMS_BoxLoot_Red;
_lootCounts = GMS_lootCountsRed;
_startMsg = "A Hostile Merchant was sighted in a nearby sector! Check the Red marker on your map for the location!";
_endMsg = "The Sector at the Red Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[300,300],"SOLID"];
_markerColor = "ColorRed";
_markerMissionName = "Merchant";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
	["Flag_AAF_F",[4,4,0],0,[false,false]],
	["Land_CargoBox_V1_F",[6.20117,5.71289,0],0,[false,false]],
	["Land_CargoBox_V1_F",[17.7207,-2.66406,0],0,[false,false]],
	["Land_Cargo40_white_F",[0.720703,-19.6641,0],202.528,[false,false]],
	["Land_Cargo20_blue_F",[-12.2793,-15.6641,0],29.7373,[false,false]],
	["FlexibleTank_01_forest_F",[0.720703,3.33594,0],0,[false,false]],
	["Land_PlasticCase_01_large_F",[-6.2793,1.33594,0],0,[false,false]],
	["Land_Bench_04_F",[3.7207,-3.66406,0],0,[false,false]],
	["Land_Metal_wooden_rack_F",[9.7207,0.335938,0],0,[false,false]],
	["Land_StallWater_F",[-12.2793,-5.66406,0],0,[false,false]],
	["Land_Sacks_heap_F",[-5.2793,-12.6641,0],0,[false,false]],
	["Land_Sacks_goods_F",[-12.623,4.42578,0],0,[false,false]],
	["Land_Sack_F",[-15.2793,-0.664063,0],0,[false,false]],
	["Land_CratesWooden_F",[3.7207,-10.6641,0],0,[false,false]],
	["Land_CratesWooden_F",[10.7207,-7.66406,0],0,[false,false]],
	["Land_CratesShabby_F",[-3.2793,10.3359,0],0,[false,false]],
	["Land_Cages_F",[5.7207,15.3359,0],0,[false,false]],
	["Land_Slum_House03_F",[-23.2793,-8.66406,0],0,[true,true]],
	["Land_Slum_House01_F",[-11.2793,15.3359,0],0,[true,true]],
	["Land_cargo_house_slum_F",[13.7207,9.33594,0],0,[true,true]],
	["Land_Chapel_Small_V2_F",[21.7207,-14.6641,0],0,[true,true]],
	["Land_GuardHouse_01_F",[6.7207,25.3359,0],0,[true,true]],
	["Land_u_House_Small_01_V1_F",[35.7207,2.33594,0],0,[true,true]],
	["Land_u_House_Small_02_V1_F",[-28.2793,12.3359,0],0,[true,true]]
]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
_minNoAI = GMS_MinAI_Red;
_maxNoAI = GMS_MaxAI_Red;
_noAIGroups = GMS_AIGrps_Red;
_noVehiclePatrols = GMS_SpawnVeh_Red;
_noEmplacedWeapons = GMS_SpawnEmplaced_Red;

#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
