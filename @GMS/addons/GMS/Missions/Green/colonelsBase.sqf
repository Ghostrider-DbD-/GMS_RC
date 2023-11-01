

/*
	This is a simple mission using precisely placed loot crates and infantry, static weapons and vehicle patrols.
	See the accompanying example mission in the exampleMission folder to get an idea how I laid this out.
	Note that I exported the mission using the exportAll function of M3EDEN editor.
*/

#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf";

_crateLoot = GMS_BoxLoot_Green;
_lootCounts = GMS_lootCountsGreen;
_startMsg = "An enemy colone's base was sighted in a nearby sector! Check the Green marker on your map for the location!";
_endMsg = "The Sector at the Green Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ellipse",[225,225],"GRID"];
_markerColor = "ColorGreen";
_markerMissionName = "New Base";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

/****************************************************

	PLACE THE DATA DEFININING THE BUILDINGS, VEHICLES ETC. PULLED FROM YOUR MISSION BELOW
	
*****************************************************/
	
	
_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Cargo_HQ_V3_F",[-34.8301,-3.16113,4.76837e-007],0,true,true,[["B_HMG_01_high_F",[2.66113,2.0166,3.12652],0]],[]],
     ["Land_Cargo_HQ_V3_F",[-3.06567,-35.3271,4.76837e-007],0,true,true,[["B_HMG_01_high_F",[3.21777,-0.104004,3.12652],0]],[]],
     ["Land_Cargo_Tower_V3_F",[-1.83765,-3.36035,0],0,true,true,[["B_HMG_01_high_F",[-2.81006,2.229,8.58897],0],["B_HMG_01_high_F",[4.09497,3.12305,17.8895],0]],[]],
     ["Land_Cargo_HQ_V3_F",[-2.69702,29.457,4.76837e-007],0,true,true,[["B_HMG_01_high_F",[-0.204346,0.493164,3.12652],0]],[]],
     ["Land_Cargo_HQ_V3_F",[26.1794,-3.99707,4.76837e-007],0,true,true,[["B_HMG_01_high_F",[-0.497314,-2.94531,3.12652],0]],[]]
];

_missionLandscape = [
     ["Land_Addon_02_ruins_F",[-39.2378,-48.939,0],288.487,true,true],
     ["Land_HBarrier_5_F",[-36.7739,-30.9004,0],244.965,true,true],
     ["Land_HBarrier_5_F",[-29.2549,-39.0684,0],209.272,true,true],
     ["Land_HBarrier_5_F",[-24.4768,-41.627,0],209.272,true,true],
     ["Land_HBarrier_5_F",[-20.1516,-43.894,0],209.272,true,true],
     ["Land_HBarrier_5_F",[-38.9075,-26.7622,0],244.965,true,true],
     ["Land_HBarrier_5_F",[-41.2798,-21.6992,0],244.965,true,true],
     ["Land_HBarrier_5_F",[-43.3875,3.90039,0],297.369,true,true],
     ["Land_HBarrier_5_F",[-43.4702,-17.3345,0],244.965,true,true],
     ["Land_HBarrier_5_F",[-45.8579,-12.4688,0],244.965,true,true],
     ["Land_HBarrier_5_F",[-41.4099,8.11621,0],297.369,true,true],
     ["Land_Addon_02_ruins_F",[-42.2859,41.0259,0],262.77,true,true],
     ["Land_HBarrier_5_F",[-36.7239,17.4834,0],297.369,true,true],
     ["Land_HBarrier_5_F",[-22.3462,32.3994,0],333.062,true,true],
     ["Land_HBarrier_5_F",[-34.3257,22.3433,0],297.369,true,true],
     ["Land_HBarrier_5_F",[-38.8459,13.085,0],297.369,true,true],
     ["Land_HBarrier_5_F",[-26.4119,30.1299,0],333.062,true,true],
     ["Land_HBarrier_5_F",[9.63672,-46.5205,0],152.755,true,true],
     ["Land_HBarrier_5_F",[-11.123,-48.7378,0],209.272,true,true],
     ["Land_HBarrier_5_F",[-15.2705,-46.6211,0],209.272,true,true],
     ["Land_HBarrier_5_F",[4.86694,-49.0942,0],152.755,true,true],
     ["Land_HBarrier_5_F",[-8.29175,39.8208,0],333.062,true,true],
     ["Land_HBarrier_5_F",[-17.3647,34.9385,0],333.062,true,true],
     ["Land_HBarrier_5_F",[-13.0754,37.2729,0],333.062,true,true],
     ["Land_HBarrier_5_F",[9.87671,40.0215,0],28.3223,true,true],
     ["Land_HBarrier_5_F",[18.8813,-41.5977,0],152.755,true,true],
     ["Land_HBarrier_5_F",[32.5605,-27.437,0],117.061,true,true],
     ["Land_HBarrier_5_F",[13.9136,-44.1636,0],152.755,true,true],
     ["Land_HBarrier_5_F",[22.9346,-39.3062,0],152.755,true,true],
     ["Land_HBarrier_5_F",[34.6589,-23.0273,0],117.061,true,true],
     ["Land_HBarrier_5_F",[30.1885,-32.3101,0],117.061,true,true],
     ["Land_HBarrier_5_F",[40.947,10.9028,0],64.016,true,true],
     ["Land_HBarrier_5_F",[43.4153,6.07764,0],64.016,true,true],
     ["Land_HBarrier_5_F",[37.1963,-18.0449,0],117.061,true,true],
     ["Land_HBarrier_5_F",[39.1511,-13.8188,0],117.061,true,true],
     ["Land_Addon_02_ruins_F",[36.4866,36.0308,0],237.428,true,true],
     ["Land_HBarrier_5_F",[28.1663,30.6538,0],28.3223,true,true],
     ["Land_HBarrier_5_F",[34.0269,24.3564,0],64.016,true,true],
     ["Land_HBarrier_5_F",[38.6843,15.2305,0],64.016,true,true],
     ["Land_HBarrier_5_F",[23.3464,33.1328,0],28.3223,true,true],
     ["Land_HBarrier_5_F",[36.2285,20.2534,0],64.016,true,true],
     ["Land_HBarrier_5_F",[14.0588,37.9741,0],28.3223,true,true],
     ["Land_HBarrier_5_F",[18.9844,35.3276,0],28.3223,true,true],
     ["Banner_01_F",[14.4236,55.1357,0],0,true,true],
     ["Land_HelipadCircle_F",[19.3931,59.5918,0],0,true,true],
     ["Land_Addon_02_ruins_F",[48.969,-42.8984,0],355.857,true,true]
];

_missionLootBoxes = [
    selectRandom [
     ["Box_FIA_Support_F",[2.73096,-31.7026,3.12652],_crateLoot,_lootCounts,0],
     ["Box_FIA_Support_F",[30.136,-3.40479,0.601674],_crateLoot,_lootCounts,0]
    ]
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
];

_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = [
     ["B_HMG_01_high_F",[-32.1689,-1.14453,3.12652],0],
     ["B_HMG_01_high_F",[0.1521,-35.4312,3.12652],0],
     ["B_HMG_01_high_F",[-4.64771,-1.13135,8.58897],0],
     ["B_HMG_01_high_F",[2.25732,-0.237305,17.8895],0],
     ["B_HMG_01_high_F",[-2.90137,29.9502,3.12652],0],
     ["B_HMG_01_high_F",[25.6821,-6.94238,3.12652],0]
];

_missionGroups = [
];

_scubaGroupParameters = [
];

_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Green;
_maxNoAI = GMS_MaxAI_Green;
_noAIGroups = GMS_AIGrps_Green;
_noVehiclePatrols = GMS_SpawnVeh_Green;
_noEmplacedWeapons = GMS_SpawnEmplaced_Green;
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;

_chanceHeliPatrol = GMS_chanceHeliPatrolBlue;  // Setting this in the mission file overrides the defaults 
_noChoppers = GMS_noPatrolHelisOrange;
_missionHelis = GMS_patrolHelisOrange;

//_chancePara = GMS_chanceParaGreen; // Setting this in the mission file overrides the defaults 
//_noPara = 5;  // Setting this in the mission file overrides the defaults 
//_paraTriggerDistance = 400; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
//_paraSkill = "orange";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.

private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [GMS_contructionLoot,GMS_contructionLoot,GMS_highPoweredLoot,GMS_supportLoot];
private _paralootCountsChoices = [[0,0,0,10,10,0],[0,0,0,10,10,0],[10,10,0,0,0,0],[0,0,0,0,15,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.
							  
			
/*			
_missionLandscapeMode = "precise"; // acceptable values are "random","precise"
									// In precise mode objects will be spawned at the relative positions specified.
									// In the random mode, objects will be randomly spawned within the mission area.

_aircraftTypes = GMS_patrolHelisRed;  //  You can use one of the pre-defined lists in GMS_configs or your own custom array.
_noAirPatrols =	GMS_noPatrolHelisRed; // You can use one of the pre-defined values or a custom one. acceptable values are integers (1,2,3) or a range such as [2,4]; 
										//  Note: this value is ignored if you specify air patrols in the array below.
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines  = GMS_useMines;  // Set to false if you have vehicles patrolling nearby.
_uniforms  = GMS_SkinList;  // You can replace this list with a custom list of uniforms if you like.
_headgear  = GMS_headgear;  // You can replace this list with a custom list of headgear.
_vests     = GMS_vests;     // You can replace this list with a custom list of vests.
_backpacks = GMS_backpacks; // You can replace this list with a custom list of backpacks.
_weapons   = GMS_WeaponList_Orange; // You can replace this list with a customized list of weapons, or another predifined list from GMS_configs_epoch or GMS_configs_exile as appropriate.
_sideArms  = GMS_pistols;    // You can replace this list with a custom list of sidearms.
*/


//********************************************************
// Do not modify anything below this line.
//********************************************************
#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 

//diag_log format["[blckeagls static missions] COMPLETED initializing mission %1 position at %2 difficulty %3",_mission,_missionCenter,_difficulty];