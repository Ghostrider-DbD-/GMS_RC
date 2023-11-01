/*
	Mission Template by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf";

//diag_log "[GMS] Spawning Blue Mission with template = default2";

_crateLoot = GMS_BoxLoot_Blue;
_lootCounts = GMS_lootCountsBlue;
_startMsg = "A local Mafia Don has been spotted! Capture him and earn a reward!";
_endMsg = "The Maria Don was captured and the area is under survivor control!";
_assetKilledMsg = "Enemy Leader Killed and Bandits Fled with All Loot: Mission Aborted";
_markerLabel = "";
_markerType = ["ELLIPSE",[200,200],"SOLID"];
_markerColor = "ColorBlue";
_markerMissionName = "Capture Don";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
	["Flag_AAF_F",[-1.44531,-21.2148,0],0,[true,false]],
	["Land_BagBunker_Small_F",[33.8457,18.2461,0],51.9209,[true,false]],
	["Land_BagBunker_Small_F",[-30.4336,22.9043,0],321.242,[true,false]],
	["Land_BagBunker_Small_F",[-35.3164,-29.9648,0],237.265,[true,false]],
	["Land_BagBunker_Small_F",[37.4551,-29.8672,0],128.253,[true,false]],
	["Land_BagBunker_Large_F",[-30.4082,-6.65039,0],180,[true,false]],
	["Land_BagBunker_Large_F",[-2.81836,19.4668,0],0,[true,false]],
	["Land_BagBunker_Large_F",[-2.14063,-18.4355,0],0,[true,false]],
	["Land_BagBunker_Large_F",[26.1328,-10.252,0],0,[true,false]],
	["Land_HBarrier_Big_F",[-19.707,30.0078,0],0,[true,false]],
	["Land_HBarrier_Big_F",[-11.0742,30.209,0],0,[true,false]],
	["Land_HBarrier_Big_F",[18.541,31.125,0],0,[true,false]],
	["Land_HBarrier_Big_F",[0.0703125,30.6699,0],0,[true,false]],
	["Land_HBarrier_Big_F",[8.79102,31.0273,0],0,[true,false]],
	["Land_HBarrier_Big_F",[-19.0938,-36.0176,0],0,[true,false]],
	["Land_HBarrier_Big_F",[-10.4609,-35.8164,0],0,[true,false]],
	["Land_HBarrier_Big_F",[19.1543,-34.9004,0],0,[true,false]],
	["Land_HBarrier_Big_F",[0.683594,-35.3555,0],0,[true,false]],
	["Land_HBarrier_Big_F",[9.4043,-34.998,0],0,[true,false]],
	["Land_HBarrier_Big_F",[-47.6211,19.666,0],91.713,[true,false]],
	["Land_HBarrier_Big_F",[-47.6777,11.0313,0],91.713,[true,false]],
	["Land_HBarrier_Big_F",[-47.6465,-18.5977,0],91.713,[true,false]],
	["Land_HBarrier_Big_F",[-47.5508,-0.123047,0],91.713,[true,false]],
	["Land_HBarrier_Big_F",[-47.4531,-8.84961,0],91.713,[true,false]],
	["Land_HBarrier_Big_F",[47.5098,-22.1211,0],270.496,[true,false]],
	["Land_HBarrier_Big_F",[47.3848,-13.4863,0],270.496,[true,false]],
	["Land_HBarrier_Big_F",[46.7246,16.1348,0],270.496,[true,false]],
	["Land_HBarrier_Big_F",[47.0195,-2.33789,0],270.496,[true,false]],
	["Land_HBarrier_Big_F",[46.7363,6.38477,0],270.496,[true,false]],
	["Land_ChairPlastic_F",[-6.06445,10.7129,0],185.284,[true,false]],
	["Land_CampingChair_V2_F",[0.222656,8.24219,0],0,[true,false]],
	["Campfire_burning_F",[0.591797,9.47266,0],0,[true,false]],
	["Land_HBarrier_3_F",[-10.3887,10.209,0],88.6077,[true,false]],
	["Land_HBarrier_3_F",[8.12109,10.4063,0],88.6077,[true,false]],
	["Land_HBarrier_3_F",[8.17383,13.5781,0],88.6077,[true,false]],
	["Land_HBarrier_3_F",[8.11914,16.957,0.0400085],88.6077,[true,false]]
	]; // list of objects to spawn as landscape; // list of objects to spawn as landscape
	
_buildings = [
	"Land_Cargo_HQ_V4_F",
	"Land_Cargo_HQ_V1_F",
	"Land_Cargo_HQ_V2_F",
	"Land_Cargo_HQ_V3_F",
	"Land_Cargo_Tower_V1_F",
	"Land_Cargo_Tower_V2_F",
	"Land_Cargo_Tower_V3_F",
	"Land_Cargo_Tower_V4_Fv",
	"Land_BagBunker_01_large_green_F"
];
_enemyLeaderConfig = 
	["I_G_resistanceLeader_F",								//  select 0
	[-7.83789,13.1465,-0.00143886],							//  select 1
	126.345,												// select 2
	[true,false],											// select 3
	["Acts_B_briefings"], // Use the animation viewer to see other choices: http://killzonekid.com/arma-3-animation-viewer-jumping-animation/
	["H_Beret_Colonel"], // array of headgear choices
	["U_OrestesBody"], // array of uniform choices
	[selectRandom _buildings,[-3.79102,2.56055,0],0,[true,false]]
	];  
_enemyLeaderConfig set[
	1, selectRandom [[-7.83789,13.1465,-0.00143886]]
	];
	// This allows us to place the antagonist to be arrested in one of several random locations.
_missionLootBoxes = [
		//["Box_NATO_Wps_F",[3,-3,0],_crateLoot,[4,10,2,5,5,1]],  // Standard loot crate with standard loadout
		//["Land_PaperBox_C_EPOCH",[-4,-3,0],_crateLoot,[0,0,0,10,10,3]],  	// No Weapons, Magazines, or optics; 10 each construction supplies and food/drink items, 3 backpacks
		//["Land_CargoBox_V1_F",[3,4,0],_crateLoot,[0,10,2,5,5,1]]
		];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.

		// GMS_lootCountsBlue= [4,12,3,6,6,1];
_missionLootVehicles = [
	//["I_G_Offroad_01_armed_F",[-8,8,0],_crateLoot,[0,10,2,5,5,1]],
	//["I_G_Offroad_01_armed_F",[8,17,0],_crateLoot,[0,10,2,5,5,1]]
	]; //  Parameters are "vehiclel type", offset relative to mission center, loot array, items to load from each category of the loot array.
	//  ["B_HMG_01_high_F"/*,"B_GMG_01_high_F","O_static_AT_F"*/];

	/*
	["B_G_Soldier_AR_F",[-19.5156,25.2598,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[-27.7676,-24.5508,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[32.4883,-23.4609,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[36.6914,12.1836,-0.00143886],0,[true,false]]	
	*/
_missionGroups = 
	[
	//_x params["_position","_minAI","_maxAI","_skillLevel","_minPatrolRadius","_maxPatrolRadius"];
	[[-19.5156,25.2598,-0.00143886],3,3,"Blue",10,20],
	[[-27.7676,-24.5508,-0.00143886],3,3,"Blue",10,20],
	[[32.4883,-23.4609,-0.00143886],3,3,"Blue",10,20],
	[[36.6914,12.1836,-0.00143886],3,3,"Blue",10,20]
	]; // Can be used to define spawn positions of AI patrols
	
_missionEmplacedWeapons = [
	//["B_HMG_01_high_F",[-10,-15,0]],
	//["B_GMG_01_high_F",[10,12,0]],
	//["O_static_AT_F",[-10,10,0]]
	]; // can be used to define the type and precise placement of static weapons [["wep",[1,2,3]] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used

_missionPatrolVehicles = [
	//["B_MRAP_01_hmg_F",[27.8945,100.275,0],0,[true,false]],
	//["B_MRAP_01_hmg_F",[-84.7793,72.2617,9.53674e-007],0,[true,false]],
	//["B_MRAP_01_gmg_F",[-87.8457,-109.947,7.15256e-007],0,[true,false]]
];	
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Blue;
_maxNoAI = GMS_MaxAI_Blue;
_noAIGroups = GMS_AIGrps_Blue;
_noVehiclePatrols = GMS_SpawnVeh_Blue;
_noEmplacedWeapons = GMS_SpawnEmplaced_Blue;
//_uniforms = GMS_SkinList;
//_headgear = GMS_headgear;
//_chancePara = GMS_chanceParaBlue; 
//_noPara = GMS_noParaBlue;  
_chanceHeliPatrol = 0;
_spawnCratesTiming = "atMissionEndAir";
_endCondition = assetSecured;  // Options are allUnitsKilled, playerNear, allKilledOrPlayerNear, assetSecured
 
#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
