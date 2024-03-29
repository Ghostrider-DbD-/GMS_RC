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
_markerType = ["ELLIPSE",[300,300],"GRID"];
_markerColor = "ColorBlue";
_markerMissionName = "inhaftierung";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
     //["babe_helper",[-3327.46,-2809.42,-0.00143909],0,true,true],
     //["Sign_Arrow_Green_F",[-3324.96,-2809.92,-0.00143909],0,true,true],
     //["Sign_Arrow_F",[-3324.96,-2809.92,-0.00143909],0,true,true],
     //["Sign_Arrow_Yellow_F",[-3324.96,-2809.92,-0.00143909],0,true,true],
     ["Land_HBarrier_Big_F",[-2.76221,-30.3596,-0.00143909],0,true,true],
     ["Land_HBarrier_1_F",[-9.74463,-27.0081,-0.00143909],180,true,true],
     ["Land_BagFence_Long_F",[-9.74268,-29.0042,-0.00143909],270,true,true],
     ["Land_BagFence_Long_F",[-8.36182,-30.3743,-0.00143909],180,true,true],
     ["CamoNet_OPFOR_open_F",[-0.361816,-1.01782,-0.00143909],180,true,true],
     ["Land_HBarrier_3_F",[-15.3853,-13.9866,-0.00143909],315,true,true],
     ["Land_HBarrier_Big_F",[-3.61768,-5.26782,-0.00143909],180,true,true],
     ["Land_HBarrier_Big_F",[-5.46533,3.40405,-0.00143909],0,true,true],
     ["Land_HBarrier_Big_F",[-18.5767,-14.5354,-0.00143909],45,true,true],
     ["Land_HBarrier_Big_F",[-12.4985,-20.3987,-0.00143909],45,true,true],
     ["Land_HBarrier_1_F",[-22.9692,-2.77563,-0.00143909],270,true,true],
     ["Land_HBarrier_1_F",[-23.3423,0.478271,-0.00143909],15,true,true],
     ["Land_BagFence_Long_F",[-24.5767,-9.90649,-0.00143909],315,true,true],
     ["Land_BagFence_Long_F",[-22.8071,-8.13794,-0.00143909],315,true,true],
     ["Land_BagFence_Long_F",[-18.7427,-12.3811,-0.00143909],315,true,true],
     ["Land_BagFence_Long_F",[-23.2368,2.26245,-0.00143909],90,true,true],
     ["Land_BagFence_Long_F",[-21.8657,6.25952,-0.00143909],0,true,true],
     ["Land_BagFence_Long_F",[-22.3657,-13.8772,-0.00143909],135,true,true],
     ["Land_BagFence_Long_F",[-9.74268,-25.1174,-0.00143909],90,true,true],
     ["Land_BagFence_Long_F",[-18.5649,-8.3147,-0.00143909],45,true,true],
     ["Land_BagFence_Long_F",[-23.2368,4.88843,-0.00143909],90,true,true],
     ["Land_BagFence_Long_F",[-25.2192,0.111084,-0.00143909],0,true,true],
     ["Land_BagFence_Long_F",[-25.2192,-2.76587,-0.00143909],0,true,true],
     ["Land_BagFence_Long_F",[-26.5884,-1.39282,-0.00143909],270,true,true],
     ["Land_BagFence_Long_F",[-24.3989,-13.9709,-0.00143909],225,true,true],
     ["Land_BagFence_Round_F",[-17.5747,-10.4006,-0.00143909],270,true,true],
     ["Land_BagFence_Round_F",[-25.5493,-11.9026,-0.00143909],90,true,true],
     ["Land_BagFence_Round_F",[-20.7212,-7.07642,-0.00143909],180,true,true],
     ["Land_BagFence_End_F",[-9.7583,-23.3167,-0.00143909],270,true,true],
     ["Land_Cargo_Patrol_V3_F",[-10.9263,-16.053,-0.00143862],45,true,true],
     ["Land_Cargo_House_V3_F",[-3.09424,-20.7424,-0.00143909],180,true,true],
     ["CamoNet_OPFOR_open_F",[-0.225098,8.17163,-0.00143909],0,true,true],
     ["Land_HBarrier_3_F",[-1.85596,17.1208,-0.00143909],180,true,true],
     ["Land_HBarrier_3_F",[-2.70752,19.4275,-0.00143909],90,true,true],
     ["Land_HBarrier_Big_F",[-19.6177,9.36694,-0.00143909],270,true,true],
     ["Land_HBarrier_Big_F",[-19.6646,17.5466,-0.00143909],90,true,true],
     ["Land_HBarrier_1_F",[-4.93994,9.58374,-0.00143909],270,true,true],
     ["Land_HBarrier_1_F",[-16.4673,27.1775,-0.00143909],285,true,true],
     ["Land_HBarrier_1_F",[-2.68408,25.3513,-0.00143909],120,true,true],
     ["Land_BagFence_Long_F",[-2.30908,23.7244,-0.00143909],270,true,true],
     ["Land_BagFence_Long_F",[-19.7173,23.0505,-0.00143909],270,true,true],
     ["Land_BagFence_Long_F",[-19.7153,25.9265,-0.00143909],270,true,true],
     ["Land_BagFence_Long_F",[-18.3462,27.4314,-0.00143909],0,true,true],
     ["Land_Cargo_Patrol_V3_F",[-15.4087,10.7146,-0.00143862],90,true,true],
     ["Land_HBarrier_5_F",[-15.7407,14.7517,-0.00143909],0,true,true],
     ["Land_HBarrier_5_F",[-6.33838,7.41382,-0.00143909],270,true,true],
     ["Land_HBarrier_Big_F",[4.87646,-28.4124,-0.00143909],330,true,true],
     ["Land_HBarrier_3_F",[10.5171,0.540771,-0.00143909],0,true,true],
     ["Land_HBarrier_3_F",[11.3687,-7.17212,-0.00143909],270,true,true],
     ["Land_HBarrier_Big_F",[23.0171,-13.6155,-0.00143909],285,true,true],
     ["Land_HBarrier_Big_F",[3.04834,3.62964,-0.00143909],1.36604e-005,true,true],
     ["Land_HBarrier_Big_F",[11.8745,-23.9084,-0.00143909],330,true,true],
     ["Land_HBarrier_Big_F",[7.90967,0.343506,-0.00143909],90,true,true],
     ["Land_HBarrier_Big_F",[24.978,-5.36938,-0.00143909],285,true,true],
     ["Land_HBarrier_Big_F",[11.2808,-4.62427,-0.00143909],180,true,true],
     ["Land_HBarrier_Big_F",[25.9077,2.68921,-0.00143909],270,true,true],
     ["Land_HBarrier_1_F",[4.35498,-2.41431,-0.00143909],90,true,true],
     ["Land_HBarrier_1_F",[21.0073,-21.7493,-0.00143909],30,true,true],
     ["Land_BagFence_Long_F",[19.1304,-21.6174,-0.00143909],0,true,true],
     ["Land_BagFence_Long_F",[16.5073,-21.6174,-0.00143909],0,true,true],
     ["Land_BagFence_Long_F",[7.89795,6.07788,-0.00143909],270,true,true],
     ["Land_Loudspeakers_F",[21.2026,-15.3088,-0.00143909],196,true,true],
     ["Land_HBarrier_5_F",[17.7847,6.20483,-0.00143909],270,true,true],
     ["Land_HBarrier_5_F",[11.3823,-11.5022,-0.00143909],270,true,true],
     ["Land_HBarrier_5_F",[5.75146,-0.244385,-0.00143909],90,true,true],
     ["Land_Cargo_House_V3_F",[5.49561,-9.99927,-0.00143909],90,true,true],
     ["Land_Cargo_House_V3_F",[5.03076,-17.6174,-0.00143909],150,true,true],
     ["CamoNet_OPFOR_open_F",[22.6538,9.88257,-0.00143909],270,true,true],
     ["Land_HBarrier_3_F",[18.7593,9.75757,-0.00143909],0,true,true],
     ["Land_HBarrier_Big_F",[9.20264,21.2849,-0.00143909],180,true,true],
     ["Land_HBarrier_Big_F",[15.9546,18.7849,-0.00143909],225,true,true],
     ["Land_HBarrier_Big_F",[22.4077,16.1892,-0.00143909],0,true,true],
     ["Land_HBarrier_Big_F",[0.70459,21.283,-0.00143909],180,true,true],
     ["Land_HBarrier_Big_F",[25.7827,11.0642,-0.00143909],90,true,true],
     ["Land_BagFence_Long_F",[4.57764,19.0466,-0.00143909],270,true,true],
     ["Land_BagFence_Long_F",[4.57764,16.1716,-0.00143909],270,true,true],
     ["Land_BagFence_Long_F",[11.3843,19.2634,-0.00143909],90,true,true],
     ["Land_BagFence_End_F",[4.57764,14.4216,-0.00143909],90,true,true],
     ["Land_BagFence_End_F",[7.68896,7.77515,-0.00143909],240,true,true],
     ["Land_BagFence_End_F",[11.3843,17.5134,-0.00143909],90,true,true]
	]; // list of objects to spawn as landscape; // list of objects to spawn as landscape
	
_buildings = [
	//"Land_Cargo_HQ_V4_F",
	//"Land_Cargo_HQ_V1_F",
	//"Land_Cargo_HQ_V2_F",
	//"Land_Cargo_HQ_V3_F",
	//"Land_Cargo_Tower_V1_F",
	//"Land_Cargo_Tower_V2_F",
	//"Land_Cargo_Tower_V3_F",
	"Land_Cargo_Patrol_V3_F",
	"Land_Cargo_House_V3_F"
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
_missionPatrolVehicles = [
     //["B_LSV_01_armed_F",[-41.377,-5.40894,-0.0238895],0.00171121],
     ["B_LSV_01_armed_F",[39.5627,-5.26709,-0.0237107],0.00169144]
	]; //  Parameters are "vehiclel type", offset relative to mission center, loot array, items to load from each category of the loot array.
	//  ["B_HMG_01_high_F"/*,"B_GMG_01_high_F","O_static_AT_F"*/];

	/*
	["B_G_Soldier_AR_F",[-19.5156,25.2598,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[-27.7676,-24.5508,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[32.4883,-23.4609,-0.00143886],0,[true,false]],
	["B_G_Soldier_AR_F",[36.6914,12.1836,-0.00143886],0,[true,false]]	
	*/

	
_missionEmplacedWeapons = []; //
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
//_chanceHeliPatrol = 0;
//_spawnCratesTiming = "atMissionEndAir";
//_endCondition = assetSecured;  // Options are allUnitsKilled, playerNear, allKilledOrPlayerNear, assetSecured

#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
