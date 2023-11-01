/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

	/*
		changing any of these variables may break the mission system
	*/
	GMS_locationBlackList = [];  // Do not touch ...
	GMS_debugLevel = 3;  //  should be set to 0 ... 

	[format["Loading configurations for Non-militarized servers"]] call GMS_fnc_log;
	/*
		**************************************
		Configurations begin here
		**************************************
	*/

	GMS_simulationManager = GMS_useBlckeaglsSimulationManager; 
	GMS_hideRocksAndPlants = true; //  When true, any rocks, trees or bushes under enterable buildings will be 'hidden'

	/*
		GMS_simulationManagementOff  - no simulation management occurs
		GMS_useBlckeaglsSimulationManager - simulation is enabled/disabled by periodic checks for nearby players; a 'wake' function is included when a units simulation is turned on
		GMS_useDynamicSimulationManagement 2 - arma dynamic simulation is used
	*/
	
	/**************************************************************
	
	BLACKLIST LOCATIONS
	
	**************************************************************/
	// if true then missions will not spawn within 1000 m of spawn points for Altis, Bornholm, Cherno, Esseker or stratis. 
	GMS_blacklistTraderCities = true;  // Set this = true if you would like the mission system to automatically search for the locations of the Epoch/Exile trader cities. Note that these are added to the list of blacklisted locations for Epoch for the most common maps.
	
	/***********************************************************
	
	GENERAL MISSION SYSTEM CONFIGURATION
	
	***********************************************************/
	
///////////////////////////////
//  Kill message configurations

// This is the radius within which nearby players will receive any messages regaring AI Kills by other players 
// the location of the killer is the center of this area
GMSAI_killMessagingRadius = 3000; 	

GMS_killMessageToAllPlayers = [
	/*
		These settings are used by GMSCore to determine what kinds of messages to use to notify players of a kill.
		SystemChat can be broadcast to all players.
		Comment out all options to disable this function (faster)
	*/

	//"toast",  // Exile only 
	//"epochMsg", // Epoch only 
	//"hint",
	//"cutText",
	//"dynamic",  // A display with information about rewards formated in a list on the left side of the screen
				  // Not recommended
	//"systemChat"
]; 
GMS_killMessageTypesKiller = [
	/*
		These settings are used by GMSCore to determine what kinds of messages to use to notify players of a kill.
		SystemChat can be broadcast to all players.
		The other notifications will only be viewed by the player reponsible for the kill.
	*/

	//"toast",  // Exile only 
	//"epochMsg", // Epoch only 
	//"hint",
	//"cutText",
	"dynamic"  // A display with information about rewards formated in a list on the left side of the screen
	//"systemChat"
];
	GMS_useIEDMessages = true;  // Displayes a message when a player vehicle detonates and IED (such as would happen if a player killed AI with a forbidden weapon).

GMS_rewards = [[0,0],[0,0],[0,0],[0,0]];

switch (GMSCore_modType) do 
{
	case "Epoch": {
		// expressed as crypto min, crypto max
		GMS_rewardsNotifications = ["dynamicText"];
		
		// expressed as [][crypto min, tabs max],[respect min,respect max]]
		GMS_rewardsBlue = [[5,10],[8,12]];
		GMS_rewardsRed = [[8,14],12,15];
		GMS_rewardsGreen = [[10,18],[15,20]];
		GMS_rewardsOrange = [[12,20],20,25];

		// Amount of tabs added to each mission crate
		GMS_crateMoneyBlue = [100,250];
		GMS_crateMoneyRed = [175, 300];
		GMS_crateMoneyGreen = [300, 500];
		GMS_crateMoneyOrange = [500, 750];

		GMS_distanceBonus = 3; // per 100 M, max = 5 * this value;
		GMS_killsBonus = 3; // from 2X up, max 6* this value
		GMS_killstreakTimeout = 60; // 300; // 5 min
		GMS_distantIncrementForCalculatingBonus = 100;
	};
	case "Exile": {
		// expressed as [][tabs min, tabs max],[respect min,respect max]]
		// Tabs will be added to bodies of killed AI. Respect will be awarded to players for each kill.		
		GMS_rewardsBlue = [[5,10],[8,12]];
		GMS_rewardsRed = [[8,14],[12,15]];
		GMS_rewardsGreen = [[10,18],[15,20]];
		GMS_rewardsOrange = [[12,20],[20,25]];

		// Amount of tabs added to each mission crate
		GMS_crateMoneyBlue = [3000,5000];
		GMS_crateMoneyRed = [5000, 7000];
		GMS_crateMoneyGreen = [10000, 15000];
		GMS_crateMoneyOrange = [15000, 20000];

		GMS_rewardsNotifications = ["dynamicText"];

		GMS_respectBonusForKillstreaks = 3; 
		GMS_moneyGainedForKillstreaks = 3; // per kill of the current killstreak 

		GMS_killstreakTimeout = 300; // 5 min
		GMS_distantIncrementForCalculatingBonus = 100;
	};
	case "default": {
		GMS_rewardsNotifications = ["dynamicText"];
		GMS_killstreakTimeout = 300; // 5 min
	};
};
	///////////////////////////////
	// MISSION MARKER CONFIGURATION
	// GMS_labelMapMarkers: Determines if when the mission composition provides text labels, map markers with have a text label indicating the mission type
	//When set to true,"arrow", text will be to the right of an arrow below the mission marker. 
	// When set to true,"dot", ext will be to the right of a black dot at the center the mission marker. 
	GMS_labelMapMarkers = [true,"center"];  
	GMS_preciseMapMarkers = true;  // Map markers are/are not centered at the loot crate
	GMS_showCountAliveAI = true;

// radius within whih missions are triggered. The trigger causes the crate and AI to spawn.
	GMS_TriggerDistance = 2000;
	
	//Minimum distance between missions
	GMS_MinDistanceFromMission = 1200;
	GMS_minDistanceToBases = 150;
	GMS_minDistanceToPlayer = 1800;
	GMS_minDistanceFromTowns = 200;
	GMS_minDistanceFromDMS = 800;  // minimum distance for a GMS mission from any nearby DMS missions. set to -1 to disable this check.	
	
	///////////////////////////////
	// Mission Smoke and Signals
	///////////////////////////////
	
	// global loot crate options
	// Options to spawn a smoking wreck near the crate.  When the first parameter is true, a wreck or junk pile will be spawned. 
	// It's position can be either "center" or "random".  smoking wreck will be spawned at a random location between 15 and 50 m from the mission.
	GMS_SmokeAtMissions = [false,"random"];  // set to [false,"anything here"] to disable this function altogether. 
	GMS_useSignalEnd = true; // When true a smoke grenade/chemlight will appear at the loot crate for 2 min after mission completion.
	GMS_missionEndCondition = allUnitsKilled; //allKilledOrPlayerNear;  // Options are allUnitsKilled, playerNear, allKilledOrPlayerNear

	 // Added 10/01/23 for those who want some control over the color.
	GMS_smokeShellAtCrates =  ["SmokeShellOrange","SmokeShellBlue","SmokeShellPurple","SmokeShellRed","SmokeShellGreen","SmokeShellYellow"];
	
	///////////////////////////////
	// General Mission Completion and Loot Settings
	///////////////////////////////	
	GMS_killPercentage = 0.999999;  // The mission will complete if this fraction of the total AI spawned has been killed.
								// This facilitates mission completion when one or two AI are spawned into objects.	
	GMS_crateMovedAllowed = false; // when true the mission is aborted if a player moves the crate   			
							// resulting in loss of loot. 					
	GMS_spawnCratesTiming = "atMissionSpawnGround"; // Choices: "atMissionSpawnGround","atMissionSpawnAir","atMissionEndGround","atMissionEndAir".
							 // Crates spawned in the air will be spawned at mission center or the position(s) defined in the mission file and dropped under a parachute.
							 //  This sets the default value but can be overridden by defining  _spawnCrateTiming in the file defining a particular mission.
	GMS_loadCratesTiming = "atMissionSpawn"; //""atMissionSpawn"; // valid choices are "atMissionCompletion" and "atMissionSpawn"; 
							// Pertains only to crates spawned at mission spawn.
							// This sets the default but can be overridden for specific missions by defining _loadCratesTiming
							
							// Examples:
							// To spawn crates at mission start loaded with gear set GMS_spawnCratesTiming = "atMissionSpawnGround" && GMS_loadCratesTiming = "atMissionSpawn"
							// To spawn crates at mission start but load gear only after the mission is completed set GMS_spawnCratesTiming = "atMissionSpawnGround" && GMS_loadCratesTiming = "atMissionCompletion"
							// To spawn crates on the ground at mission completion set GMS_spawnCratesTiming = "atMissionEndGround" // Note that a loaded crate will be spawned.
							// To spawn crates in the air and drop them by chutes set GMS_spawnCratesTiming = "atMissionEndAir" // Note that a loaded crate will be spawned.
	GMS_allowClaimVehicle = false; // Set this to true if you wish to allow players to claim vehicles using one of the claim vehicle scripts floating around.

	///////////////////////////////
	// PLAYER PENALTIES
	///////////////////////////////	

	GMS_RunGear = false;	// When set to true, AI that have been run over will ve stripped of gear, and the vehicle will be given GMS_RunGearDamage of damage.
	GMS_RunGearDamage = 0.2; // Damage applied to player vehicle for each AI run over
	GMS_VK_Gear = true; // When set to true, AI that have been killed by a player in a vehicle in the list of forbidden vehicles or using a forbiden gun will be stripped of gear and the vehicle will be given GMS_RunGearDamage of damage
	GMS_VK_RunoverDamage = false; // when the AI was run over GMS_RunGearDamage of damage will be applied to the killer's vehicle.
	GMS_VK_GunnerDamage = false; // when the AI was killed by a gunner on a vehicle that is is in the list of forbidden vehicles, GMS_RunGearDamage of damage will be applied to the killer's vehicle each time an AI is killed with a vehicle's gun.

	/* these are weapons, magazines, sensors to be disabled when a vehicle is spawned */
	GMS_forbidenWeapons = [
		/*
		Examples:
		"HMG_127","HMG_127_APC","HMG_M2","HMG_NSVT","GMG_40mm","autocannon_40mm_CTWS","autocannon_30mm_CTWS","autocannon_35mm","LMG_coax","autocannon_30mm","HMG_127_LSV_01"
		*/
	];
	GMS_forbidenMagazines = [
		/*
		Examples
		"24Rnd_missiles","200Rnd_40mm_G_belt"
		*/
	];
	GMS_disableInfrared = false; 
	GMS_disabledSensors = [
		/*
		Current Arma Sensor (Arma 2.06)
		"IRSensorComponent",
		NVSensorComponent",
		"LaserSensorComponent",
		"ActiveRadarSensorComponent",
		"VisualSensorComponent",
		"ManSensorComponnet",
		"DataLinkSensorComponent"
		*/
	];	

	///////////////////////////////
	// MISC MISSION PARAMETERS
	///////////////////////////////
	GMS_useKilledAIName = true; // When false, the name of the killer (player), weapon and distance are displayed; otherwise the name of the player, distance and name of AI unit killed are shown.
	GMS_useMines = false;   // when true mines are spawned around the mission area. these are cleaned up when a player reaches the crate. Turn this off if you have vehicle patrols.
	GMS_cleanupCompositionTimer = 60*30;  // Mission objects will be deleted after the mission is completed after a deley set by this timer.
	GMS_cleanUpLootChests = false; // when true, loot crates will be deleted together with other mission objects.
	GMS_MissionTimeout = 75*75;  // 60 min - missions will timeout and respawn in another location. This prevents missions in impossible locations from persisting.

	///////////////////////////////
	// Paratroop Settings
	// AI paratrooper reinforcement paramters
	// The behavior of these can be linked to some degree to the spawning of patrolling helis.
	// For example, if you always want a helicopter to spawn paratroops set the value 1.
	// Recommended that you disable paratroops if using muliple aircraft/vehicle patrols
	GMS_chanceParaBlue = 0; // [0 - 1] set to 0 to deactivate and 1 to always have paratroops spawn over the center of the mission. This value can be a range as well [0.1,0.3]
	GMS_noParaBlue = 3; //  [1-N]
	
	GMS_chanceParaRed = 0;
	GMS_noParaRed = 3;
	
	GMS_chanceParaGreen = 0.5;
	GMS_noParaGreen = 4;
	
	GMS_chanceParaOrange = 0.95;
	GMS_noParaOrange = 4;
	
	// Supplemental Loot Parameters.
	
	///////////////////////////////
	//  Heli Patrol Heli Types	
	// Armed Helis
	//////////////////////////////

	_GMS_littleBirds = ["B_Heli_Light_01_armed_F"];  //  AH-9 Pawnee  (WEST)
	_GMS_armed_hellcats = ["I_Heli_light_03_F"];
	_GMS_armed_orcas = ["O_Heli_Light_02_F","O_Heli_Light_02_v2_F"];
	_GMS_armed_ghosthawks = ["B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"];
	_GMS_armed_hurons = ["B_Heli_Transport_03_F","B_Heli_Transport_03_black_F"];
	_GMS_armed_attackHelis = ["CUP_B_UH1Y_GUNSHIP_USMC"];
	_GMS_armed_heavyAttackHelis = ["O_Heli_Attack_02_F","CUP_B_UH1Y_GUNSHIP_USMC"];
	_GMS_fighters = [
		"O_Plane_CAS_02_F",  // /ti-199 Neophron (CAS)
		"I_Plane_Fighter_03_AA_F",  //  A-143 Buzzard (AA)
		"I_Plane_Fighter_04_F",  //   	A-149 Gryphon
		"B_Plane_CAS_01_F",  // 	A-164 Wipeout (CAS)
		"B_Plane_Fighter_01_F"  //	F/A-181 Black Wasp II
		];
	
	GMS_blacklisted_heli_ammo = ["24Rnd_missiles","24Rnd_PG_missiles","12Rnd_PG_missiles","2Rnd_LG_scalpel","6Rnd_LG_scalpel","8Rnd_LG_scalpel","M_Scalpel_AT ","14Rnd_80mm_rockets","38Rnd_80mm_rockets"];
	GMS_blacklisted_heli_weapons = ["missiles_SCALPEL","missiles_titan","rockets_Skyfire","missiles_DAGR","missiles_DAR"];
	//_cup_helis = ["uh1h_armed_EPOCH","uh1h_armed_plus_EPOCH"];
	_cup_Helis_missiles = ["CUP_B_412_dynamicLoadout_HIL","CUP_B_AW159_RN_Blackcat","CUP_B_AW159_RN_Blackcat"];
	_cup_attack_helis = [];
	///////////////////////////////
	//  Heli Patrol Settings
	///////////////////////////////

	GMS_chanceHeliPatrolBlue = 0.1;  //[0 - 1]  Set to 0 to deactivate and 1 to always have a heli spawn over the mission center and patrol the mission area. 
									//  The chance of paratroops dropping from the heli is defined by GMS_chancePara(Blue|Red|Green|Orange) above.
									// Recommend setting the change = 1 if you wish to spawn multiple helis at a mission.
	GMS_patrolHelisBlue = _GMS_littleBirds;
	GMS_noPatrolHelisBlue = 1;
	
	GMS_chanceHeliPatrolRed = 0.30; // 0.4;
	GMS_patrolHelisRed = _GMS_littleBirds;
	GMS_noPatrolHelisRed = 1;
	
	GMS_chanceHeliPatrolGreen = 0.75;
	GMS_patrolHelisGreen = _GMS_armed_hellcats + _GMS_armed_ghosthawks;  // _GMS_armed_orcas + _GMS_armed_ghosthawks;  //_GMS_littleBirds;
	GMS_noPatrolHelisGreen = 2;
	
	GMS_chanceHeliPatrolOrange = 0.99;
	GMS_patrolHelisOrange = _GMS_armed_heavyAttackHelis + _GMS_armed_attackHelis;  //_GMS_littleBirds;
	GMS_noPatrolHelisOrange = 2;

	///////////////////////////////
	//  Mission Drone Settings
	///////////////////////////////
	GMS_numberUGVs = 0; 
	GMS_UGVtypes = [  // 
		// Stompers
		"O_UGV_01_rcws_F",5 // east - Use for Exile  
		//"B_UGV_01_rcws_F",5 // west 
		//"I_UGV_01_rcws_F",5 // GUER
	];

	GMS_numberUAVs = 0; 
	GMSAI_UAVTypes = [  //  note that faction may matter here.
		// East 
		"O_UAV_01_F",2,  // Darter equivalent, unarmed
		//"O_UAV_02_F",2, // Ababil with Scalpel Missels
		"O_UAV_02_CAS_F",2  // Ababil with Bombx
		//"O_UAV_01_F",2
		// West - see CfgVehicles WEST online or in the editor
		// Independent/GUER
		//"I_UAV_01_F",1
	];

	////////////////////
	// Enable / Disable Missions
	////////////////////
	
	// Maximum number of missions shown on the map at any one time.
	GMS_maxSpawnedMissions = 10;
		
	//Set to -1 to disable. Values of 2 or more force the mission spawner to spawn copies of that mission - this feature is not recommended because you may run out of available groups.
	GMS_enableOrangeMissions = 1;  
	GMS_enableGreenMissions = 2;
	GMS_enableRedMissions = 2;
	GMS_enableBlueMissions = 2;
	GMS_numberUnderwaterDynamicMissions = 0;  // Values from -1 (no UMS) to N (N Underwater missions will be spawned; static UMS units and subs will be spawned.	
	GMS_enableStaticMissions = -1;

	#ifdef GRGserver
	GMS_enableHunterMissions = 1;
	GMS_enableScoutsMissions = 2;
	GMS_maxcrashsites = -1;
	#endif

	////////////////////
	// MISSION TIMERS
	////////////////////
	
	// Reduce to 1 sec for immediate spawns, or longer if you wish to space the missions out	
	GMS_TMin_Orange = 180; //1;
	GMS_TMin_Green = 150; //2;
	GMS_TMin_Blue = 120; //3;
	GMS_TMin_Red = 110; //4;
	GMS_TMin_UMS = 105; //5;	
	GMS_TMin_Statics = 60 * 35;  // minimum time for RESPAWN of static missions

	#ifdef GRGserver
	GMS_TMin_Hunter = 100; //6;
	GMS_TMin_Scouts = 95; //7;
	GMS_TMin_Crashes = 90; //8;
	#endif
	
	//Maximum Spawn time between missions in seconds
	GMS_TMax_Orange =200; //9;
	GMS_TMax_Green = 180; //10;
	GMS_TMax_Blue = 160; //11;
	GMS_TMax_Red = 150; //12;
	GMS_TMax_UMS = 13;
	GMS_TMax_Statics = GMS_TMin_Statics + 60; // Maximum time for RESAPWN of static missions
											  // Be sure the minimum is > than the time at which objects from the previous instance of a static mission are deleted 
											  // That is set in GMS_cleanupCompositionTimer
	#ifdef GRGserver
	GMS_TMax_Hunter = 140; //14;
	GMS_TMax_Scouts = 130; //15;
	GMS_TMax_Crashes = 100; //16;
	#endif
	
	// 
	///////////////////////////////
	// AI VEHICLE PATROL PARAMETERS
	///////////////////////////////	

	GMS_useVehiclePatrols = true; // When true vehicles will be spawned at missions and will patrol the mission area.
	GMS_killEmptyAIVehicles = false; // when true, the AI vehicle will be extensively damaged once all AI have gotten outor been killed.
    GMS_vehicleDeleteTimer = 120*60;
	////////////////////
	// Mission Vehicle Settings
	////////////////////	
	//Defines how many AI Vehicles to spawn. Set this to -1 to disable spawning of static weapons or vehicles. To discourage players runniing with with vehicles, spawn more B_GMG_01_high
	GMS_SpawnVeh_Orange = [1,2]; // Number of static weapons at Orange Missions
	GMS_SpawnVeh_Green = [1,2]; // Number of static weapons at Green Missions
	GMS_SpawnVeh_Blue = 1;  // Number of static weapons at Blue Missions
	GMS_SpawnVeh_Red = 1;  // Number of static weapons at Red Missions

	GMS_vehCrew_blue = 3;
	GMS_vehCrew_red = 3;
	GMS_vehCrew_green = 3;
	GMS_vehCrew_orange = 3;

	///////////////////////////////
	// AI STATIC WEAPON PARAMETERS	
	///////////////////////////////
	
	GMS_useStatic = true;  // When true, AI will man static weapons spawned 20-30 meters from the mission center. These are very effective against most vehicles
	GMS_killEmptyStaticWeapons = true;  // When true, static weapons will have damage set to 1 when the AI manning them is killed.
	GMS_staticWeapons = ["B_HMG_01_high_F","B_GMG_01_high_F"/*,"O_static_AT_F"*/];  // [0.50 cal, grenade launcher, AT Launcher]

	////////////////////
	// Mission Static Weapon Settings
	////////////////////
	
	// Defines how many static weapons to spawn. Set this to -1 to disable spawning 
	GMS_SpawnEmplaced_Orange = [3]; // Number of static weapons at Orange Missions
	GMS_SpawnEmplaced_Green = [2]; // Number of static weapons at Green Missions
	GMS_SpawnEmplaced_Blue = 1;  // Number of static weapons at Blue Missions
	GMS_SpawnEmplaced_Red = 1;  // Number of static weapons at Red Missions	



	/****************************************************************
	
	GENERAL AI SETTINGS
	
	****************************************************************/
	// When true, AI loadouts will be set from the class names in CfgPricing rather than the settings in the mod-specific configuration files
	GMS_useConfigsGeneratedLoadouts = false;
	GMS_logBlacklistedItems = true;
	//GMS_maximumitempriceinai_loadouts = 1000;
	// lists of black-listed items to be excluded from dynamic loadouts

	/* 
		A list of dlcs will be dumped during server start up.
		You can comment out those you dont want to exclude 
		or identify and add others from the list generated when the dynamicConfigs script is run 
	*/

	GMS_blackListedMods = [
		// Uncomment to exclude items/weapons/uniforms/vest/headgear from being included.
		// Add DLC names you wish to exluded as appropriate
		// DLC names will be added to your server.RPT
		//"Kart",
		//"TANK",
		//"ORANGE",
		//"Heli",
		//"Contact",
		//"Enoch",
		//"Orange",
		//"Jets",
		//"Mark",
		//"Expansion"
	];
		GMS_blacklistedVests = [
			//"V_Press_F"
		];

		GMS_blacklistedUniforms = [
			"U_I_Protagonist_VR",
			"U_C_Protagonist_VR",			
			"U_O_Protagonist_VR",
			"U_B_Protagonist_VR",
			"Exile_Uniform_BambiOverall",
			"Exile_Uniform_ExileCustoms"
		];

		GMS_blacklistedBackpacks = [
			//"B_ViperLightHarness_blk_F"
			"I_UAV_01_backpack_F",
			"C_IDAP_UAV_06_backpack_F",
			"C_IDAP_UAV_06_antimine_backpack_F",
			"B_UAV_06_medical_backpack_F",
			"TK_RPG_Backpack_Epoch"
		];

		GMS_blacklistedHeadgear = [
			"H_HelmotO_ViperSP_ghex_F",
			"H_HelmetO_VierSP_hex"
		];

		GMS_blacklistedPrimaryWeapons = [
			//"srifle_LRR_tna_F"
			"nl_auto_xbow",
			"pvcrifle_01_F",
			"ChainSaw",
			"Hatchet",
			"MultiGun",
			"MeleeSledge",
			"MeleeSword",
			"Power_Sword",
			"MeleeRod",
			"CrudeHatchet",
			"MeleeMaul",
			"WoodClub",
			"Plunger",
			"sr25_epoch"		
		];

		GMS_blacklistedSecondaryWeapons = [
			"hgun_Pistol_heav_02_F",
			"hgun_Pistol_tranq_01",
			"nl_auto_xbow",
			"pvcrifle_01_F",
			"ChainSaw",
			"Hatchet",
			"MultiGun",
			"MeleeSledge",
			"MeleeSword",
			"Power_Sword",
			"MeleeRod",
			"CrudeHatchet",
			"MeleeMaul",
			"WoodClub",
			"Plunger"
		];

		GMS_blacklistedLaunchersAndSwingWeapons = [

		];

		GMS_blacklistedOptics = [
			//"optic_tws"
		];

		GMS_blacklistedAttachments = [

		];

		GMS_blacklistedItems = [

		];	
	/////////////////////////////////////////////
	
	GMS_groupBehavior = "SAFE";  // https://community.bistudio.com/wiki/ArmA:_AI_Combat_Modes
	GMS_combatMode = "RED"; // Change this to "YELLOW" if the AI wander too far from missions for your tastes.
	GMS_groupFormation = "WEDGE"; // Possibilities include "WEDGE","VEE","FILE","DIAMOND"

	GMS_useSmokeWhenHealing = true;  // when true, injured AI will toss a smoke when they attempt to heal.
	GMS_addAIMoney = false;

	GMS_useNVG = true; // When true, AI will be spawned with NVG if is dark
						// No longer used.
	GMS_removeNVG = false; // When true, NVG will be removed from AI when they are killed.
	GMS_useLaunchers = true;  // When true, some AI will be spawned with RPGs; they do not however fire on vehicles for some reason so I recommend this be set to false for now
	//GMS_launcherTypes = ["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F"];
	GMS_launcherTypes = ["launch_RPG32_F"];  //["CUP_launch_RPG7V"];  //
	GMS_launchersPerGroup = 1;  // Defines the number of AI per group spawned with a launcher
	GMS_launcherCleanup = false;// When true, launchers and launcher ammo are removed from dead AI.

	/*
	// This is now handled by GMSCore

	//  These values are applied to AI groups on foot only.
	GMS_minimumPatrolRadius = 36;  // AI will patrol within a area of approximately min-max meters. note that because of the way waypoints are completed they may more more or less than this distance.
	GMS_maximumPatrolRadius = 66;  // These values should be at least 30 to be sure some movement occurs.
	*/

	// Used by GMSCore to decide when a group is stuck etc.
	GMS_waypointTimeoutInfantry = 300; 
	GMS_waypointTimeoutVehicle = 300;
	GMS_waypointTimeoutAir = 300;

	//This defines how long after an AI dies that it's body disappears.
	GMS_bodyCleanUpTimer = 60*45; // time in seconds after which dead AI bodies are deleted
	// Each time an AI is killed, the location of the killer will be revealed to all AI within this range of the killed AI, set to -1 to disable
	// values are ordered as follows [blue, red, green, orange];
	GMS_AliveAICleanUpTimer = 60*15;  // Time after mission completion at which any remaining live AI are deleted.

	// How precisely player locations will be revealed to AI after an AI kill
	// values are ordered as follows [blue, red, green, orange];	
	GMS_AIAlertDistance = [350,600,1200,1500];  //  Radius within which AI will be notified of enemy activity. Depricated as a group-sed system is used now. The group is informed of the enemy location when a group member is hit or killed.
	// How precisely player locations will be revealed to AI after an AI kill
	// values are ordered as follows [blue, red, green, orange];
	GMS_AIIntelligence = [0.38, 0.58, 0.78, 0.98];  
	
	GMS_baseSkill = 1.0;  // The overal skill of the AI - range 0.1 to 1.0.
	
	/***************************************************************
	
	MISSION TYPE SPECIFIC AI SETTINGS
	
	**************************************************************/
	//This defines the skill, minimum/Maximum number of AI and how many AI groups are spawned for each mission type
	// Orange Missions
	GMS_MinAI_Orange = 17;
	GMS_MaxAI_Orange = 22;
	GMS_AIGrps_Orange = 5;
	GMS_SkillsOrange = [
		[0.20],  // aiming accuracy
		[0.75,0.85],  //  aiming speed 
		[0.25],  //  aiming shake 
		1.0,  //  spot distance 
		0.95,  //  spot time 
		1.00,  // courage 
		1.00,  //  reload speed 
		1.00,  //  commanding 
		1.00  //  general 
	];
	
	// Green Missions
	GMS_MinAI_Green = 13;
	GMS_MaxAI_Green = 18;
	GMS_AIGrps_Green = 4;
	GMS_SkillsGreen = [
		[0.18],  //  aiming accuracy 
		[0.65,0.75],  //  aiming speed 
		[0.18], //  aiming shake
		0.92,  //  spot distance 
		0.88,  // spot time 
		0.9,  //  courage 
		0.9,  //  reload speed 
		0.9,  //  comanding 
		0.85  //  general
	];
	
	// Red Missions
	GMS_MinAI_Red = 10;
	GMS_MaxAI_Red = 13;
	GMS_AIGrps_Red = 3;
	GMS_SkillsRed = [
		[0.14],  //  aiming accuracy 
		0.6,  //  aiming speed 
		[0.14],  //  aiming shake 
		0.7,  //  spot distance 
		0.6,  // spot time 
		0.80,  // courage 
		0.70,  // reoload speed 
		0.8,  // comanding 
		0.70  //  general 
	];
	
	// Blue Missions
	GMS_MinAI_Blue = 6;	
	GMS_MaxAI_Blue = 10;
	GMS_AIGrps_Blue = 2;
	GMS_SkillsBlue = [
		[0.08],  // aiming accuracy 
		0.5,  		// aiming speed 
		[0.08],  // aiming shake 
		0.6,  // spot distance 
		0.6,  // spot time 
		0.60,  // courage 
		0.60,  // reoload speed 
		0.7,  // comanding 
		0.60  // general
	];
		
	// Add some money to AI; 
	GMS_maxMoneyOrange = 35;
	GMS_maxMoneyGreen = 30;
	GMS_maxMoneyRed = 25;
	GMS_maxMoneyBlue = 20;	

	// Define the chance of attachments and gear
	GMS_chancePrimary = 1.0;
	GMS_chanceOpticsPrimary = 0.5;
	GMS_chanceMuzzlePrimary = 0.3;
	GMS_chancePointerPrimary = 0.25;
	GMS_chanceUnderbarrelPrimary = 0.25;
	GMS_chanceSecondary = 0.5;
	GMS_chanceOpticsSecondary = 0.4;
	GMS_chancePointerSecondary = 0.4;
	GMS_chanceMuzzleSecondary = 0.4; 
	GMS_chanceThowable = 0.5;
	GMS_chanceHeadgear = 0.75;
	GMS_chanceUniform = 1.0;
	GMS_chanceBackpack = 0.6;  // Chance AI will be spawned with a backpack
	GMS_chanceVest = 0.6;
	GMS_chanceBinoc = 0.75;

	private _configToLoad = format["\x\addons\GMS\Configs\GMS_configs_%1.sqf",tolower(GMSCore_modtype)];
	//diag_log format["[GMS] _configToLoad = %1",_configToLoad];
	[] call compileFinal preprocessFileLineNumbers _configToLoad;

	if (GMS_useConfigsGeneratedLoadouts) then 
	{
		["Dynamic Configs Enabled"] call GMS_fnc_log;
		execVM "\GMS\Configs\GMS_dynamicConfigs.sqf";
	};
	GMS_configsLoaded = true;
	//diag_log format["<--- GMS_configs loaded at %1 --->",diag_tickTime];
