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

//diag_log "[GMS] Spawning Blue Mission with template = default";

private["_missionEnabled"];

_crateLoot = GMS_BoxLoot_Blue;  
			/*
			You can use a customized loot array if you like. The format is as follows. note that for each category you can give a number or a range.
		_crateLoot = [
			[// Weapons
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"]		
			],
			[//Magazines
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],	
			[  // Optics
				["optic_KHS_tan",1,3]
			],
			[// Materials and supplies				
				["Exile_Item_CamoTentKit",1,6]
			],
			[//Items
				["Exile_Item_MountainDupe",1,3]	
			],
			[ // Backpacks
				["B_OutdoorPack_tan",1,2]
			]
		];			
		*/
			
_lootCounts = GMS_lootCountsBlue;
			/*
			You can use a customized array here if you like; note that you can give a value or a range.
				// values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
		GMS_lootCountsOrange = [
			[6,8],  //  Weapons
			[24,32], // Magazines
			[5,10], // Optics
			[25,35], //  materials(cinder etc)
			16,  //  items (food etc)
			1  //  backpacks
		];   // Orange
		*/
_startMsg = "A group of Bandits was sighted in a nearby sector! Check the Blue marker on your map for the location!";
_endMsg = "The Sector at the Blue Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[175,175],"GRID"];
//_markerType = ["RECTANGLE", [350,350],"GRID"Full"];
			// The mission system supports circular or square mission markers as well as typical Arma icon-style (triangle, dot, flag etc) markers.
			// to have an icon define the map marker as follows:
			// ["mil_triangle",[0,0]];
			// Just replace the icon name with the one you want to spawn.
_markerColor = "ColorBlue";
_markerMissionName = "Bandit Patrol";
_missionLandscapeMode = "random"; // acceptable values are "none","random","precise"
					//  _missionLandscape
					//  Note that the format for the _missionLandscape is different for the two modes.
					// In random, the objects are randomly arrayed around the mission center.
					// In precise, the objects are spawned as closely as possible to the x,y,z offset from mission center specified.
					//  See default2.sqf for an example of the use of precise base objects.
/*					
private _addedLandscape = ["Land_FoodSacks_01_cargo_brown_F","Land_FoodSacks_01_large_brown_F","Land_FoodSack_01_full_brown_F","Land_PaperBox_01_open_boxes_F",
						"Land_CampingTable_white_F","Land_WoodenPlanks_01_messy_pine_F","Land_CinderBlocks_01_F","Land_WoodenCrate_01_F","Land_WoodenCrate_01_stack_x5_F",
						"Land_BarrelTrash_grey_F","Land_WoodenTable_large_F","Land_BagFence_Short_F","Land_WoodPile_F"]
*/

_missionLandscape = [/*"Flag_AAF_F",*/"Land_TentDome_F","Land_TentDome_F","Land_TentDome_F","Land_TentDome_F","Land_FieldToilet_F","Campfire_burning_F"]; // list of objects to spawn as landscape
for "_i" from 1 to 8 do 
{
	_missionLandscape pushBack selectRandom [
		"Land_FoodSacks_01_cargo_brown_F","Land_FoodSacks_01_large_brown_F","Land_FoodSack_01_full_brown_F","Land_PaperBox_01_open_boxes_F",
		"Land_CampingTable_white_F","Land_WoodenPlanks_01_messy_pine_F","Land_CinderBlocks_01_F","Land_WoodenCrate_01_F","Land_WoodenCrate_01_stack_x5_F",
		"Land_BarrelTrash_grey_F","Land_WoodenTable_large_F","Land_BagFence_Short_F","Land_WoodPile_F"
	];
};
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
					// when empty, a single loot container will be spawned at the center of the mission.
					// Use this to specify exact spots to spawn crates; see default2.seq for an example.
//_missionGroups = [];  // Not required.
					  // When present and empty the mission spawner evaluates the minAI, maxAI, noAIGroups settings	
					  // When present with values these override the defaults.
					  // See default2.sqf for an example of the use of this variable.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
					
					// when the array is empty this parameter is ignored.
					// You can have vehicles serve as loot containiners by defining them here.
					// see default2.sqf for an example
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
					// When the array is empty emplaced (static) weapons will be spawned randomly based on the setings in the configs that specify the number, AI difficulty and type of static weapons.
					// you can specify the location relative to mission center, type of weapon etc.
					// this information overides the defaults that that mission difficulty.
					// See default2.sqf for an example of how one uses this.
_minNoAI = GMS_MinAI_Blue;  // Setting this in the mission file overrides the defaults such as GMS_MinAI_Blue
_maxNoAI = GMS_MaxAI_Blue;  // Setting this in the mission file overrides the defaults 
_noAIGroups = GMS_AIGrps_Blue;  // Setting this in the mission file overrides the defaults 
_noVehiclePatrols = GMS_SpawnVeh_Blue;  // Setting this in the mission file overrides the defaults 
_noEmplacedWeapons = GMS_SpawnEmplaced_Blue;  // Setting this in the mission file overrides the defaults 
//  Change _useMines to true/false below to enable mission-specific settings.

/*
_useMines = GMS_useMines;  // Setting this in the mission file overrides the defaults 
_uniforms = GMS_SkinList;  // Setting this in the mission file overrides the defaults 
_headgear = GMS_headgear;  // Setting this in the mission file overrides the defaults 
_vests = GMS_vests;
_backpacks = GMS_backpacks;

_sideArms = GMS_Pistols;
_chanceHeliPatrol = GMS_chanceHeliPatrolBlue;  // Setting this in the mission file overrides the defaults 
_noChoppers = GMS_noPatrolHelisBlue;
_missionHelis = GMS_patrolHelisBlue;

_chancePara = GMS_chanceParaBlue; // Setting this in the mission file overrides the defaults 
_noPara = GMS_noParaBlue;  // Setting this in the mission file overrides the defaults 
_paraTriggerDistance = 400; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
_paraSkill = "red";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.
_chanceLoot = 0.0; 
_paraLoot = GMS_BoxLoot_Blue;
_paraLootCounts = GMS_lootCountsRed;  // Throw in something more exotic than found at a normal blue mission.

_spawnCratesTiming = GMS_spawnCratesTiming; // Choices: "atMissionSpawnGround","atMissionEndGround","atMissionEndAir". 
						 // Crates spawned in the air will be spawned at mission center or the position(s) defined in the mission file and dropped under a parachute.
						 //  This sets the default value but can be overridden by defining  _spawnCrateTiming in the file defining a particular mission.
_loadCratesTiming = GMS_loadCratesTiming; // valid choices are "atMissionCompletion" and "atMissionSpawn"; 
						// Pertains only to crates spawned at mission spawn.
						// This sets the default but can be overridden for specific missions by defining _loadCratesTiming
						
						// Examples:
						// To spawn crates at mission start loaded with gear set GMS_spawnCratesTiming = "atMissionSpawnGround" && GMS_loadCratesTiming = "atMissionSpawn"
						// To spawn crates at mission start but load gear only after the mission is completed set GMS_spawnCratesTiming = "atMissionSpawnGround" && GMS_loadCratesTiming = "atMissionCompletion"
						// To spawn crates on the ground at mission completion set GMS_spawnCratesTiming = "atMissionEndGround" // Note that a loaded crate will be spawned.
						// To spawn crates in the air and drop them by chutes set GMS_spawnCratesTiming = "atMissionEndAir" // Note that a loaded crate will be spawned.
_endCondition = GMS_missionEndCondition;  // Options are allUnitsKilled, playerNear, allKilledOrPlayerNear
									// Setting this in the mission file overrides the defaults 
////_timeOut = -1;
*/
#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
