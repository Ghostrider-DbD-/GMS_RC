/*
	This is a simple mission using precisely placed loot crates and infantry, static weapons and vehicle patrols.
	See the accompanying example mission in the exampleMission folder to get an idea how I laid this out.
	Note that I laid out the mission in EDEN editor, exported the mission using the exportAll function of M3EDEN editor. then copied, pasted and apporpriately edidet the specific categories of items to be spawned.
*/
/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

#include "GMS_privateVars.sqf";

_mission = "UMS mission example #2";  //  Included for additional documentation. Not intended to be spawned as a mission per se.
_missionCenter = [22584.9,15304.8,0];  // I pulled this from the position of the marker.
_difficulty = "red";  // Skill level of AI (blue, red, green etc)
diag_log format["[blckeagls UMS missions] STARTED initializing mission %1 position at %2 difficulty %3",_mission,_missionCenter,_difficulty];
_crateLoot = GMS_BoxLoot_Orange;  // You can use a customized _crateLoot configuration by defining an array here. It must follow the following format shown for a hypothetical loot array called _customLootArray
	/*
	_customLootArray = 
		// Loot is grouped as [weapons],[magazines],[items] in order to be able to use the correct function to load the item into the crate later on.
		// Each item consist of the following information ["ItemName",minNum, maxNum] where min is the smallest number added and min+max is the largest number added.
		
		[  
			[// Weapons	

				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]				
			],
			[//Magazines
				["10Rnd_93x64_DMR_05_Mag" ,1,5]				
			],			
			[  // Optics
				["optic_KHS_tan",1,3]
			],
			[// Materials and supplies				
				["Exile_Item_MetalScrews",3,10]
				//
			],
			[//Items
				["Exile_Item_MountainDupe",1,3]				
			],
			[ // Backpacks
				["B_OutdoorPack_tan",1,2]
			]
	];	
	*/

_lootCounts = GMS_lootCountsRed; // You can use a customized set of loot counts or one that is predefined but it must follow the following format:
								  // values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
								  //  GMS_lootCountsOrange = [[6,8],[24,32],[5,10],[25,35],16,1];   // Orange

_markerLabel = "";
//_markerType = ["ellipse",[200,200],"GRID"];
// An alternative would be:
_markerType = ["mil_triangle",[0,0]];  // You can replace mil_triangle with any other valid Arma 3 marker type https://community.bistudio.com/wiki/cfgMarkers
_markerColor = "ColorRed";  //  This can be any valid Arma Marker Color  
_markerMissionName = "Bad Fishermen Live Here";
_missionLandscapeMode = "precise"; // acceptable values are "random","precise"
									// In precise mode objects will be spawned at the relative positions specified.
									// In the random mode, objects will be randomly spawned within the mission area.
_missionLandscape = [  //  Paste appropriate lines from M3EDEN output here.
	//  ["Land_Cargo_HQ_V2_F",[22894.7,16766,3.19],[[0,1,0],[0,0,1]],[true,false]],
	["Land_Boat_05_wreck_F",[22571.5,15278.9,0],[[0,1,0],[0,0,1]],[true,false]]
]; // list of objects to spawn as landscape using output from M3EDEN editor.

_missionLootBoxes = [  //  Paste appropriate lines from M3EDEN editor output here, then add the appropriate lootArray
	// [["box_classname1",_customLootArray1,[px,py,pz],...,_customLootArray1],["box_classname2",,[px2,py2,pz2],...,_customLootArray2]
	//  where _customLootArray follows the same format as GMS_BoxLoot_Red and the other pre-defined arrays and
	//  where _customlootcountsarray1 also follows the same format as the predefined arrays like GMS_lootCountsRed
		//  ["Box_NATO_Ammo_F",[22893,16766.8,6.31652],[[0,1,0],[0,0,1]],[true,false], _crateLoot, _lootCounts],
	[selectRandom GMS_UMS_crates,[22584.9,15282.2,-1],[[0,1,0],[0,0,1]],[true,false], _crateLoot, _lootCounts]
];  // If this array is empty a single loot chest will be added at the center. If you add items loot chest(s) will be spawned in specific positions.



_missionLootVehicles = [  // Paste appropriate lines from the output of M3EDEN Editor here and add the loot crate type and loot counts at the end of each entry as shown in the example below.
						  // Many vehicles have less inventory capacity than crates so you may have to modify _lootcounts to avoid having stuff spawned all over the ground.
	["B_T_Boat_Transport_01_F",[22570.1,15235.3,-4.49949],0,_crateLoot, _lootCounts]
]; //  [ ["vehicleClassName", [px, py, pz] /* possition at which to spawn*/, _loot /* pointer to array of loot (see below)]; 
// When blank nothing is spawned.
// You can use the same format used for _missionLootBoxes to add vehicles with/without loot.

_noEmplacedWeapons = GMS_SpawnEmplaced_Red; // Modified as needed; can be a numberic value (e.g. 3) or range presented as [2,4]
//format: _noEmplacedWeapons  = [2,3]; // a range of values
// or _noEmplacedWeapons = 3; // a constant number of emplaced weps per misison
// Note that this value is ignored if you define static weapon positions and types in the array below.
_missionEmplacedWeapons = [
	// ["Weapon class name", position[xy,z], AI Difficulty [blue, red, green, orange], patrol radius [0 for static weapons], seconds to wait before respawning (set to 0 to disable respawns)]
	//["B_G_Mortar_01_F",[22867.3,16809.1,3.17968],"red",0,0],
	//["B_HMG_01_high_F",[22944.3,16820.5,3.14243],"green",0,0]
];
// example [ ["emplacedClassName",[px, py, pz] /* position to spawn weapon */, difficulty /* difficulty of AI manning weapon (blue, red etc)] ];
// can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
// If the number of possible locations exceeds the number of emplaced weapons specified above then only some of the locations in the array will have emplaced weapons spawned.
// If you leave this array blank then emplaced weapons will be spawned at random locations around the mission using the default list of emplace weapons.
								
_minNoAI = GMS_MinAI_Red;  //  Modify as needed
_maxNoAI = GMS_MaxAI_Red;	// Modify as needed.
_noAIGroups = GMS_AIGrps_Red;  // Modify as needed; note that these values are ignored of you specify AI patrols in the array below.
_aiGroupParameters = [
	// [ [px, py, pz] /* position*/, "difficulty", 4 /*Number to Spawn*/, 150 /*radius of patrol*/]

];
_aiScubaGroupParameters = [
	// [ [px, py, pz] /* position*/, "difficulty", 4 /*Number to Spawn*/, 150 /*radius of patrol*/, seconds to wait after all units killed before respawning the group (set to 0 to disable respawns)]

	[[22549,15288.9,0],"red",3, 75,900]
];
_noVehiclePatrols = GMS_SpawnVeh_Red; // Modified as needed; can be a numberic value (e.g. 3) or range presented as [2,4]; 
										//  Note that this value is ignored if you define vehicle patrols in the array below.
_vehiclePatrolParameters = [
	//["Vehicle Class Name",Position [22570.1,15235.3,-4.49949],AI Difficulty "red",4 (Units to spawn into vehicle), 75 (radius of patrol area),60 (seconds to wait after all units dead before respawning)],

	["B_T_Boat_Armed_01_minigun_F",[22578.6,15273.3,-0.0354593],"red",3, 75,0]	
]; 							//[ ["vehicleClassName",[px,py,pz] /* center of patrol area */, difficulty /* blue, red etc*/, patrol radius] ]
							// When this array is empty, vehicle patrols will be scattered randomely around the mission.
							// Allows you to define the location of the center of the patrol, vehicle type spawned, radius to patrol, and AI difficulty (blue, red, green etc).

_submarinePatrolParameters = [
	////["Vehicle Class Name",Position [22570.1,15235.3,-4.49949],AI Difficulty "red",4 (Units to spawn into vehicle), 75 (radius of patrol area),60 (seconds to wait after all units dead before respawning)],
	["B_SDV_01_F",[22607.9,15299.8,-1],"red",3, 75,0],
	["B_SDV_01_F",[22609.9,15297.8,-1],"red",3, 75,0]
];

_aircraftTypes = GMS_patrolHelisRed;  //  You can use one of the pre-defined lists in GMS_configs or your own custom array.
_noAirPatrols =	GMS_noPatrolHelisRed; // You can use one of the pre-defined values or a custom one. acceptable values are integers (1,2,3) or a range such as [2,4]; 
										//  Note: this value is ignored if you specify air patrols in the array below.
_airPatrols = [
	//["Vehicle Class Name",Position [22570.1,15235.3,-4.49949],AI Difficulty "red", 75 (radius of patrol area),60 (seconds to wait after all units dead before respawning)],
	["selectRandom _aircraftTypes",[22578.4,15273,50],"red",1000,0]  
];

//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = false;  // Set to false if you have vehicles patrolling nearby.

#include "\GMS\Missions\UMS\code\GMS_fnc_sm_initializeUMSStaticMission.sqf"; 

diag_log format["[blckeagls static missions] COMPLETED initializing misions %1 position at %2 difficulty %3",_mission,_missionCenter,_difficulty];
