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

_crateLoot = GMS_BoxLoot_Green;  // Set to a loot table appropriate to mission difficulty. A custom loot table can also be used.
_lootCounts = GMS_lootCountsGreen;     // Set to a loot counts list appropriate to mission difficulty or a custom array.
_startMsg = "An enemy research center was sighted in a nearby sector! Check the Green marker on your map for the location!";
_endMsg = "The Sector at the Green Marker is under survivor control!";
_markerMissionName = "Development";


_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Paste the output of the script here
_markerType = ["mil_box",[0,0]];  //  Modify as needed
_markerColor = "Default";  // Modify as needed
_markerLabel = "";

_garrisonedBuildings_BuildingPosnSystem = [  //  Units / statics positioned using the built in Arma building position system
     
     ["Land_i_House_Big_02_V2_F",[-76.2197,64.5181,0],0,true,false,0.67,3,[],4],
     ["Land_Unfinished_Building_01_F",[-65.1536,-71.8145,0],0,true,false,0.67,3,[],4]
];

_garrisonedBuilding_ATLsystem = [  // Units / statics positioned using relative position with respect to the spawn position of the building as the reference point.
     ["Land_i_Shop_01_V2_F",[87.1704,-65.3169,0],0,true,false,[["B_HMG_01_high_F",[-2.15186,2.76953,0.303085],0]],[]],
     ["Land_i_House_Big_01_V3_F",[101.868,63.7637,0],0,true,false,[["B_HMG_01_high_F",[-3.44702,-2.7793,0.41],0],["B_HMG_01_high_F",[2.81006,-5.2124,3.92],0]],[]]
	 
];

_missionLandscape = [  // Self explanatory; all positions are relative to mission center. 
     ["Sign_Sphere100cm_F",[-77.7651,66.4019,0.259255],0,true,true],
     ["Sign_Sphere100cm_F",[-62.7002,-68.5952,0.185],0,true,true],
     ["Land_Chapel_V2_F",[-19.5349,-23.1558,0],0,true,true],
     ["Land_CarService_F",[-19.4431,7.30078,0],0,true,true],
     ["Land_Church_01_V1_F",[13.1187,-24.9375,0],0,true,true],
     ["Land_GH_House_2_F",[17.7576,14.8853,0],0,true,true]
];

_missionLootBoxes = [  // Self explanatory; all positions are relative to mission center. 
                         // Note that you can specifiy any loot table or list of loot counts here.
     ["Box_NATO_Wps_F",[-12.8772,-14.7461,0],_crateLoot,_lootCounts,0],
     ["Box_FIA_Ammo_F",[-11.5447,4.01025,0],_crateLoot,_lootCounts,0],
     ["IG_supplyCrate_F",[7.43652,-15.4175,0],_crateLoot,_lootCounts,0],
     ["Box_FIA_Support_F",[9.36304,4.36914,0],_crateLoot,_lootCounts,0]
];

_missionPatrolVehicles = [  // Self explanatory; all positions are relative to mission center. 
                              // Note that defining anything here overrides the defaults for number and type of vehicles.
                              // You can select a random vehicle from the defaults with selectRandom GMS_AIPatrolVehicles or the difficulty specific variants such as GMS_AIPatrolVehiclesBlue
     ["B_LSV_01_armed_F",[-50.4993,-5.56201,0],0],
     ["B_MRAP_01_hmg_F",[-4.58496,-51.4932,-4.76837e-007],0],
     ["B_MRAP_01_hmg_F",[-1.01758,31.3022,-4.76837e-007],0],
     ["B_LSV_01_armed_F",[38.8872,-7.23975,0],0]
];

_submarinePatrolParameters = [  // Self explanatory; all positions are relative to mission center. 
];

_airPatrols = [  // Self explanatory; all positions are relative to mission center. 
                    // Note that defining anything here overrides the defaults for both number of aircraft and types of aircraft.
                    // you can specify a randomly selected aircraft from the defaults the a mission difficulty with selectRandom GMS_patrolHelisBlue/Red/Green/Orange
];

_missionEmplacedWeapons = [  // Self explanatory; all positions are relative to mission center and are set and mission spawn using setPosATL
                              // Listing static weapons here overides the default settings for numbers of statics and weapon types.
                              // Note that you can select from the defaults using selectRandom GMS_staticWeapons;
     ["B_T_HMG_01_F",[-24.9949,-6.60889,0],0],
     ["B_T_HMG_01_F",[-2.10034,17.6167,0],0],
     ["B_T_HMG_01_F",[-1.02319,-24.769,0],0],
     ["B_T_HMG_01_F",[19.394,-7.26514,0],0]
];

_missionGroups = [  // The coordinates are the center position for each groups patrol area relative to mission center.
                    // parameters are [_coords,minAI,maxAI,difficulty,min range from center for patrol, max range from center for patrol]
                    // Listing groups here overrides the setting for minAI, maxAI and noGroups
     [[-6.98657,-17.4019,0.00143862],3,6,"Red",30,45],
     [[-12.3303,1.17432,0.00143909],3,6,"Red",30,45],
     [[16.0247,0.0390625,0.00143909],3,6,"Red",30,45],
     [[8.53687,13.0479,0.00143909],3,6,"Red",30,45],
     [[79.074,6.02344,0.00143909],3,6,"Red",30,45]
];

_scubaGroupParameters = [  // These groups remain under water in scuba gear. Settings are otherwise as listed in _missionGroups
];

_crateLoot = GMS_BoxLoot_Red;  				     // can be individualized for a particular mission by defining a loot array.
_lootCounts = GMS_lootCountsRed;  				//  can be individualized for a particular mission by defining an array with the counts of each loot type.
_minNoAI = GMS_MinAI_Red;  					     // can be any value 0..N
_maxNoAI = GMS_MaxAI_Red;						// can be any value 1..N
_noAIGroups = GMS_AIGrps_Red;					// can be any value 0..N (note that 0 here prevents any groups from being spawned)
_noVehiclePatrols = GMS_SpawnVeh_Red;			     // can be any value  0..N
_noEmplacedWeapons = GMS_SpawnEmplaced_Red;	// can be any value

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
