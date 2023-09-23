/*
	Mission Template by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf";

//diag_log "[GMS] Spawning Blue Mission with template = default2";

_crateLoot = GMS_BoxLoot_Blue;
_lootCounts = GMS_lootCountsBlue;
_startMsg = "A local town mayor is being held hostage! Free him and earn a reward!";
_endMsg = "The Mayor Was Rescued!";
_assetKilledMsg = "The Hostage Was Killed and Bandits Fled with All Loot: Mission Aborted";
_markerLabel = "";
_markerType = ["ellipse",[175,175],"GRID"];
_markerColor = "ColorBlue";
_markerMissionName = "Rescue Hostage";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
	//["Flag_AAF_F",[0.269531,-29.8301,0],0,[true,false]],
	["Campfire_burning_F",[-2.75391,-13.043,0],0,[true,false]],
	["Land_Stone_8m_F",[-17.252,-5.42969,0],268.936,[true,false]],
	["Land_Stone_8m_F",[-17.4609,2.93945,0],268.936,[true,false]],
	["Land_Stone_8m_F",[-17.6191,11.1426,0],268.936,[true,false]],
	["Land_Stone_8m_F",[16.082,-3.7168,0],270,[true,false]],
	["Land_Stone_8m_F",[16.0742,4.58789,0],270,[true,false]],
	["Land_Stone_8m_F",[16.1035,12.8438,0],270,[true,false]],
	["Land_Stone_8m_F",[7.83203,17.8164,0],0,[true,false]],
	["Land_Stone_8m_F",[-0.505859,18.0039,0],0,[true,false]],
	["Land_Stone_8m_F",[-8.85742,18.0273,0],0,[true,false]],
	["Land_Stone_8m_F",[7.94727,-32.7383,0],0,[true,false]],
	["Land_Stone_8m_F",[-0.318359,-32.7246,0],0,[true,false]],
	["Land_Stone_8m_F",[-8.54492,-32.6836,0],0,[true,false]],
	["Land_HBarrierWall6_F",[-54.6641,42.75,0],91.2122,[true,false]],
	["Land_HBarrierWall6_F",[-54.7383,25.9102,0],91.2122,[true,false]],
	["Land_HBarrierWall6_F",[-54.6934,34.375,0],91.2122,[true,false]],
	["Land_HBarrierWall6_F",[-54.5156,5.78711,0],91.2122,[true,false]],
	["Land_HBarrierWall6_F",[-54.6035,17.4902,0],91.2122,[true,false]],
	["Land_HBarrierWall6_F",[-54.2441,-11.2656,0],91.2122,[true,false]],
	["Land_HBarrierWall6_F",[-54.4961,-2.67383,0],91.2122,[true,false]],
	["Land_HBarrierWall6_F",[-53.9336,-23.9395,0],91.2122,[true,false]],
	["Land_HBarrierWall6_F",[-53.6113,-32.1563,0],91.2122,[true,false]],
	["Land_HBarrierWall6_F",[52.082,29.7891,0],90.6291,[true,false]],
	["Land_HBarrierWall6_F",[52.043,38.252,0],90.6291,[true,false]],
	["Land_HBarrierWall6_F",[52.5098,9.66602,0],90.6291,[true,false]],
	["Land_HBarrierWall6_F",[52.3008,21.3691,0],90.6291,[true,false]],
	["Land_HBarrierWall6_F",[52.9551,-7.38086,0],90.6291,[true,false]],
	["Land_HBarrierWall6_F",[52.6152,1.20703,0],90.6291,[true,false]],
	["Land_HBarrierWall6_F",[53.3945,-20.0508,0],90.6291,[true,false]],
	["Land_HBarrierWall6_F",[53.8008,-28.2637,0],90.6291,[true,false]],
	["Land_HBarrierWall6_F",[51.9824,46.627,0],90.6291,[true,false]],
	["Land_HBarrierWall6_F",[42.873,59.8809,0],180.956,[true,false]],
	["Land_HBarrierWall6_F",[26.0313,59.8809,0],180.956,[true,false]],
	["Land_HBarrierWall6_F",[34.4961,59.873,0],180.956,[true,false]],
	["Land_HBarrierWall6_F",[5.9082,59.5664,0],180.956,[true,false]],
	["Land_HBarrierWall6_F",[17.6133,59.707,0],180.956,[true,false]],
	["Land_HBarrierWall6_F",[-11.1406,59.2188,0],180.956,[true,false]],
	["Land_HBarrierWall6_F",[-2.55078,59.5098,0],180.956,[true,false]],
	["Land_HBarrierWall6_F",[-23.8125,58.8516,0],180.956,[true,false]],
	["Land_HBarrierWall6_F",[-32.0293,58.4922,0],180.956,[true,false]],
	["Land_HBarrierWall6_F",[-40.3965,58.4121,0],180.956,[true,false]],
	["Land_HBarrierWall6_F",[-48.8535,58.2324,0],180.956,[true,false]],
	["Land_HBarrierWall6_F",[-44.877,-44.8379,0],1.36283,[true,false]],
	["Land_HBarrierWall6_F",[-28.0371,-44.957,0],1.36283,[true,false]],
	["Land_HBarrierWall6_F",[-36.502,-44.8906,0],1.36283,[true,false]],
	["Land_HBarrierWall6_F",[-7.91016,-44.7871,0],1.36283,[true,false]],
	["Land_HBarrierWall6_F",[-19.6152,-44.8438,0],1.36283,[true,false]],
	["Land_HBarrierWall6_F",[9.13867,-44.5605,0],1.36283,[true,false]],
	["Land_HBarrierWall6_F",[0.548828,-44.791,0],1.36283,[true,false]],
	["Land_HBarrierWall6_F",[21.8145,-44.2832,0],1.36283,[true,false]],
	["Land_HBarrierWall6_F",[30.0332,-43.9824,0],1.36283,[true,false]],
	["Land_HBarrierWall6_F",[38.3047,-43.8945,0],1.36283,[true,false]],
	["Land_HBarrierWall6_F",[46.7598,-43.6582,0],1.36283,[true,false]],
	["Land_Stone_8m_F",[15.791,-29.4043,0],270,[true,false]],
	["Land_Stone_8m_F",[15.7383,-21.0332,0],270,[true,false]],
	["Land_Stone_8m_F",[15.7324,-12.8281,0],270,[true,false]],
	["Land_Stone_8m_F",[-17.2559,-28.6465,0],270,[true,false]],
	["Land_Stone_8m_F",[-17.3086,-20.2754,0],270,[true,false]],
	["Land_Stone_8m_F",[-17.3145,-12.0703,0],270,[true,false]]
	]; // list of objects to spawn as landscape; // list of objects to spawn as landscape
	
_buildings = [
	"Land_i_House_Big_01_V1_F",
	"Land_i_House_Big_01_V3_F",
	"Land_i_House_Big_02_V1_F",
	"Land_i_House_Big_02_V3_F",
	"Land_i_Shop_02_V1_F",
	"Land_i_Shop_02_V3_F"
];
_hostageConfig = ["C_man_polo_6_F",
	[-7.08594,9.5957,
	-0.299652],
	126.345,
	[true,false],
	["AmovPercMstpSnonWnonDnon_Scared"],
	["H_Cap_red"], // array of headgear choices
	["U_NikosBody"], // array of uniform choices
	[selectRandom _buildings,[-0.279297,-15.9199,0],0,[true,false]]
	];  //  Sitting Animation
		// Use the animation view to see other choices: http://killzonekid.com/arma-3-animation-viewer-jumping-animation/
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
	["B_G_Soldier_AR_F",[26.9961,-29.9551,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[32.2461,33.0605,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[-35.6035,32.1855,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[-47.4219,-19.8906,-0.00143886],0,[true,false]]	
	*/
_missionGroups = 
	[
	//_x params["_position","_minAI","_maxAI","_skillLevel","_minPatrolRadius","_maxPatrolRadius"];
	//[[26.9961,-29.9551,-0.00143886],3,3,"Blue",10,20],
	//[[32.2461,33.0605,-0.00143886],3,3,"Blue",10,20],
	//[[-35.6035,32.1855,-0.00143886],3,3,"Blue",10,20],
	//[[-47.4219,-19.8906,-0.00143886],1,1,"Blue",10,20]
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

//_noPara = GMS_noParaBlue;  
_chanceHeliPatrol = 0;
_spawnCratesTiming = "atMissionEndAir";
_endCondition = assetSecured;  // Options are allUnitsKilled, playerNear, allKilledOrPlayerNear, assetSecured
//_timeOut = -1;
#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
