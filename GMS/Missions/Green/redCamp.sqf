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
	
//diag_log "[GMS] Spawning Green Mission with template = redCamp";
_crateLoot = GMS_BoxLoot_Green;
_lootCounts = GMS_lootCountsGreen;
_startMsg = "A temporary enemy camp has been spotted. Check the Green marker on your map for its location";
_endMsg = "The temporary Bandit Green camp at the Green Marker is under player control";
_markerLabel = "";
_markerType = ["ellipse",[225,225],"GRID"];
_markerColor = "ColorGreen";
_markerMissionName = "Bandit Camp";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
		["Land_CampingChair_V1_F",[1.32227,2.07813,8.2016e-005],108.293,[false,true]], 
		["Land_CampingChair_V1_F",[-2.01465,2.91992,3.05176e-005],236.049,[false,true]], 
		["FirePlace_burning_F",[0.0302734,4.26563,2.47955e-005],359.997,[false,true]], 
		["Land_CampingChair_V1_F",[2.47168,4.21484,0.000102997],108.293,[false,true]], 
		["Land_CampingChair_V1_F",[-1.86816,5.07422,3.05176e-005],319.489,[false,true]], 
		["Land_CampingChair_V1_F",[0.915039,6.20898,1.71661e-005],51.7207,[false,true]], 
		["Land_Sleeping_bag_brown_F",[8.27441,0.609375,0.00414658],98.0314,[false,true]], 
		["Land_Sleeping_bag_brown_F",[8.27344,2.76758,0.00447083],91.7928,[false,true]], 
		["Land_Sleeping_bag_brown_F",[7.9082,4.95898,-0.00173759],85.1176,[false,true]], 
		["Land_Garbage_square3_F",[-4.95508,8.24023,0.00018692],60.0024,[false,true]], 
		["Land_Camping_Light_F",[8.92773,3.80273,-0.000205994],344.236,[false,true]], 
		["Land_Sleeping_bag_brown_F",[7.32129,7.55859,-0.0051899],60.1216,[false,true]], 
		["Land_TentDome_F",[-9.75488,3.13477,0.00125313],146.574,[false,true]], 
		["Land_WoodPile_F",[-0.322266,9.97266,-0.000553131],35.0017,[false,true]], 
		["Land_Razorwire_F",[-0.0185547,-9.84961,0.0752335],1.7831,[false,true]], 
		["Land_CampingChair_V1_folded_F",[3.8584,9.59375,0],60,[false,true]], 
		["Land_TentDome_F",[-8.76855,7.85156,-0.00471497],207.522,[false,true]], 
		["Land_BagFence_Round_F",[8.99707,-8.01367,-0.00951576],326.002,[false,true]], 
		["Land_BagFence_Round_F",[-10.8164,-6.33594,-0.0038681],59.9991,[false,true]], 
		["Land_TentDome_F",[-7.12207,11.8398,-0.00328445],231.101,[false,true]], 
		["Land_CampingTable_small_F",[-4.62598,13.2754,7.62939e-005],344.243,[false,true]], 
		["Land_Camping_Light_F",[-4.5957,13.332,0.687943],344.243,[false,true]], 
		["Land_Razorwire_F",[15.5459,0.605469,0.145557],102.505,[false,true]], 
		["Land_BagFence_Round_F",[7.16211,13.8516,0.000429153],221.639,[false,true]], 
		["Land_Razorwire_F",[15.9678,8.35938,0.0635166],85.7459,[false,true]], 
		["Land_Razorwire_F",[-19.1553,-1.61328,-0.0238552],70.0997,[false,true]], 
		["Land_Razorwire_F",[-12.3906,-15.4492,0.0128002],19.2641,[false,true]], 
		["Land_Razorwire_F",[-19.4629,5.67969,0.0492821],102.505,[false,true]], 
		["Land_BagFence_Round_F",[-11.2891,17.6777,-0.00759888],128.563,[false,true]], 
		["Land_Razorwire_F",[15.2949,-14.3027,0.0502853],139.224,[false,true]], 
		["Land_Razorwire_F",[15.2852,16.2656,-0.0208111],85.1363,[false,true]], 
		["Land_Razorwire_F",[4.80273,21.8223,-0.0563145],49.2133,[false,true]], 
		["Land_Razorwire_F",[-17.7891,13.4863,-0.0646877],102.5,[false,true]], 
		["Land_Razorwire_F",[-14.7109,20.2871,0.0674477],306.189,[false,true]], 
		["Land_BagFence_Round_F",[25.3975,-6.08008,0.00466537],272.26,[false,true]], 
		["Land_Wreck_Truck_F",[26.6289,12.2441,0.00333214],344.243,[false,true]], 
		["Land_GarbageBags_F",[-24.9463,17.3066,0.000968933],60.0003,[false,true]], 
		["Land_BagFence_Round_F",[11.167,28.832,-0.00405121],178.394,[false,true]], 
		["Land_BagFence_Round_F",[-6.36914,30.6953,-0.000207901],178.378,[false,true]], 
		["Land_Wreck_Hunter_F",[21.0391,25.9707,0.0118179],325.412,[false,true]], 
		["Land_Camping_Light_F",[-33.7852,10.0371,0.000759125],344.235,[false,true]], 
		["Land_BagFence_Round_F",[-34.3232,10.1035,0.00181007],60.0012,[false,true]]
		]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Green;
_maxNoAI = GMS_MaxAI_Green;
_noAIGroups = GMS_AIGrps_Green;
_noVehiclePatrols = GMS_SpawnVeh_Green;
_noEmplacedWeapons = GMS_SpawnEmplaced_Green;
//_uniforms = GMS_SkinList;
//_headgear = GMS_headgear;

//_chancePara = GMS_chanceParaGreen; // Setting this in the mission file overrides the defaults 
//_noPara = 5;  // Setting this in the mission file overrides the defaults 
//_paraTriggerDistance = 400; // Distance from mission at which a player triggers these reinforcements and any supplemental loot. 						
 						// To have paras spawn at the time the mission spawns with/without accompanying loot set this to 0.
//_paraSkill = "orange";  // Choose any skill you like; bump up skill or add AI to justify more valuable loot.
//_chanceLoot = 0.7; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [GMS_contructionLoot,GMS_contructionLoot,GMS_highPoweredLoot,GMS_supportLoot];
private _paralootCountsChoices = [[0,0,0,10,10,0],[0,0,0,10,10,0],[10,10,0,0,0,0],[0,0,0,0,15,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.
 
#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 


