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
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf";

//diag_log "[GMS] Spawning Blue Mission with template = default";
_crateLoot = GMS_BoxLoot_Blue;
_lootCounts = GMS_lootCountsBlue;
_startMsg = "An enemy cache of supplies was sighted in a nearby sector! Check the Blue marker on your map for the location!";
_endMsg = "The supply cache is under survivor control!";

_markerMissionName = "Survival Supplies";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here
_markerType = ["ELLIPSE",[300,300],"GRID"];
_markerColor = "ColorBlue";
_markerLabel = "";


_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
];

_missionLandscape = [
     ["Land_Crane_F",[2.51807,-4.66016,-0.00143909],0,true,true],
     ["Land_Sink_F",[-3.77686,7.6582,-0.00135088],0,true,true],
     ["Land_Wreck_Truck_dropside_F",[-2.01465,-10.9937,-0.00143909],49.8078,true,true],
     ["Land_Wreck_Car2_F",[4.23486,-2.31738,-0.00143909],0,true,true],
     ["Campfire_burning_F",[8.26514,-6.04102,-0.00143909],0,true,true],
     ["Land_Timbers_F",[26.1719,2.8457,-0.00143909],0,true,true],
     ["Land_Timbers_F",[23.7666,2.78564,-0.00143909],0,true,true],
     ["Land_WoodPile_F",[10.9204,-6.24805,-0.00143909],0,true,true],
     ["Land_Wreck_Offroad_F",[18.9897,-2.52344,-0.00143909],129.737,true,true],
     ["Land_i_Barracks_V2_F",[6.89893,14.2139,-0.00143909],0,true,true]
];

_missionLootBoxes = [];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
];

_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = [
	#ifdef GMS_milServer
     ["I_Mortar_01_F",[4.10889,-12.8853,0.0354419],360],
     ["I_HMG_01_F",[15.5317,-3.51758,0.0759335],202.402],
     ["I_HMG_01_high_F",[9.75928,6.43506,-0.0135579],178.241]
	 #else
     [selectRandom GMS_staticWeapons,[4.10889,-12.8853,0.0354419],360],
     [selectRandom GMS_staticWeapons,[15.5317,-3.51758,0.0759335],202.402],
     [selectRandom GMS_staticWeapons,[9.75928,6.43506,-0.0135579],178.241]
	 #endif  
	 //  selectRandom GMS_staticWeapons
];

_missionGroups = [
   //  [[-3.30518,3.38721,0],3,6,"blue",30,45],
   //  [[2.85107,0.941895,0],3,6,"blue",30,45],
   //  [[13.2217,6.82227,0],3,6,"blue",30,45],
   //  [[8.5625,-3.65332,0],3,6,"blue",30,45]
];

_scubaGroupParameters = [
];

_minNoAI = GMS_MinAI_Blue;  // Setting this in the mission file overrides the defaults such as GMS_MinAI_Blue
_maxNoAI = GMS_MaxAI_Blue;  // Setting this in the mission file overrides the defaults 
_noAIGroups = GMS_AIGrps_Blue;  // Setting this in the mission file overrides the defaults 
_noVehiclePatrols = GMS_SpawnVeh_Blue;  // Setting this in the mission file overrides the defaults 
_noEmplacedWeapons = GMS_SpawnEmplaced_Blue;  // Setting this in the mission file overrides the defaults 
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;  // Setting this in the mission file overrides the defaults 

#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
