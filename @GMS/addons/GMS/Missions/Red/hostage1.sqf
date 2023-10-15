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

_crateLoot = GMS_BoxLoot_Red;
_lootCounts = GMS_lootCountsRed;
_startMsg = "A local town official is being held hostage! Free him and earn a reward!";
_endMsg = "The official was freed! A reward has been sent by the local townsfolk";
_assetKilledMsg = "The Hostage Was Killed and Bandits Fled with All Loot: Mission Aborted";
_markerLabel = "";
_markerType = ["ellipse",[250,250],"SOLID"];
_markerColor = "ColorRed";
_markerMissionName = "Rescue Hostage";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
	["Flag_AAF_F",[-10.6914,-10.541,0],0,[true,false]],
	["Land_SM_01_shelter_wide_F",[-6.29883,9.57617,0],0,[true,false]],
	["Land_ContainerLine_01_F",[-5.54492,40.8184,0],0,[true,false]],
	["Land_ContainerLine_01_F",[-6.92578,-38.2188,0],0,[true,false]],
	["Land_ContainerLine_01_F",[-65.8438,-28.4023,0],90,[true,false]],
	["Land_ContainerLine_01_F",[-66.0664,21.3496,0],90,[true,false]],
	["Land_ContainerLine_01_F",[195.047,-23.9395,0],87.9345,[true,false]],
	["Land_ContainerLine_01_F",[42.6172,-23.9395,0],90.5197,[true,false]],
	["Land_ContainerLine_01_F",[42.8398,27.5977,0],270,[true,false]],
	//["B_G_Soldier_AR_F",[-6.74219,-78.625,-0.00143886],0,[true,false]],
	//["B_G_Soldier_AR_F",[-86.3281,-5.14453,-0.00143886],0,[true,false]],
	//["B_G_Soldier_AR_F",[61.4609,-1.92773,-0.00143838],0,[true,false]],
	//["B_G_Soldier_AR_F",[-43.3359,54.0898,-0.00143838],0,[true,false]],
	//["B_Soldier_F",[70.5156,-90.3867,-2.75806],0,[true,false]],
	//["B_Soldier_F",[70.5156,-90.3867,-2.75806],0,[true,false]],
	//["B_MRAP_01_hmg_F",[70.5156,-90.3867,4.76837e-007],0,[true,false]],
	//["B_Soldier_F",[-78.834,72.0566,-2.20595],0,[true,false]],
	//["B_MRAP_01_F",[-78.834,72.0566,4.76837e-007],0,[true,false]],
	["Campfire_burning_F",[-8.68555,-2.57813,0],0,[true,false]],
	["Land_ChairPlastic_F",[-2.36719,16.1875,0],0,[true,false]],
	["Land_ChairPlastic_F",[-2.99609,13.2813,0],0,[true,false]],
	["Land_ChairPlastic_F",[-2.84766,10.3398,0],0,[true,false]],
	["Land_ChairPlastic_F",[-3.06055,8.08203,0],0,[true,false]],
	["Land_ChairPlastic_F",[-2.70313,5.98047,0],0,[true,false]],
	["Land_Stone_4m_F",[-5.71484,21.2051,0],0,[true,false]],
	["Land_Stone_4m_F",[-1.30469,21.2266,0],0,[true,false]],
	["Land_Stone_4m_F",[-10.1836,21.166,0],0,[true,false]],
	["Land_Stone_4m_F",[3.01953,10.2051,0],90.8324,[true,false]],
	["Land_Stone_4m_F",[2.97656,5.79492,0],90.8324,[true,false]],
	["Land_Stone_4m_F",[3.04492,14.6738,0],90.8324,[true,false]],
	["Land_Stone_4m_F",[-6.16992,-0.855469,0],0,[true,false]],
	["Land_Stone_4m_F",[-1.75977,-0.833984,0],0,[true,false]],
	["Land_Stone_4m_F",[-10.6387,-0.894531,0],0,[true,false]],
	["Land_Stone_4m_F",[-15.4609,9.93164,0],90.8324,[true,false]],
	["Land_Stone_4m_F",[-15.5039,5.52148,0],90.8324,[true,false]],
	["Land_Stone_4m_F",[-15.4355,14.4004,0],90.8324,[true,false]]
	]; // list of objects to spawn as landscape; // list of objects to spawn as landscape
	
_hostageConfig = ["C_man_polo_6_F",
	[-7.08594,9.5957,-0.299652],
	126.345,[true,false],
	["AmovPercMstpSnonWnonDnon_Scared"],
	["H_Cap_red"], // array of headgear choices
	["U_NikosBody"] // array of uniform choices
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
	[[26.9961,-29.9551,-0.00143886],3,3,"Red",10,20],
	[[32.2461,33.0605,-0.00143886],3,3,"Red",10,20],
	[[-35.6035,32.1855,-0.00143886],3,3,"Red",10,20],
	[[-47.4219,-19.8906,-0.00143886],3,3,"Red",10,20]
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
_minNoAI = GMS_MinAI_Red;
_maxNoAI = GMS_MaxAI_Red;
_noAIGroups = GMS_AIGrps_Red;
_noVehiclePatrols = GMS_SpawnVeh_Red;
_noEmplacedWeapons = GMS_SpawnEmplaced_Red;

_spawnCratesTiming = "atMissionEndAir";
_endCondition = assetSecured;  // Options are allUnitsKilled, playerNear, allKilledOrPlayerNear, assetSecured

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
