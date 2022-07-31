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

//diag_log "[GMS] Spawning Green Mission with template = default";
_crateLoot = GMS_BoxLoot_Green;
_lootCounts = GMS_lootCountsGreen;
_startMsg = "An enemy garrison!";
_endMsg = "The garrison is under survivor control!";
_markerLabel = "";
_markerType = ["ELLIPSE",[200,200],"GRID"];
_markerColor = "ColorBlue";
_markerMissionName = "Garrison";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"




_garrisonedBuildings_BuildingPosnSystem = [
     ["Land_Unfinished_Building_02_F",[-28.137,-48.6494,-0.00268841],0,true,true,0.67,3,[],4],
     ["Land_i_Shop_02_V2_F",[22.688,35.2515,-0.00268841],0,true,true,0.67,3,[],4]
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Unfinished_Building_02_F",[-28.3966,34.8145,-0.00268841],0,true,true,[["B_HMG_01_high_F",[-5.76953,1.16504,7.21168],360]],[]],
     ["Land_Unfinished_Building_02_F",[20.1816,-44.2554,-0.00268841],0,true,true,[],[[[4.68567,3.59082,0.257384],0],[[-5.20032,5.66797,3.96986],0]]]
];

_missionLandscape = [
     ["Land_i_House_Big_02_V3_F",[-64.5577,-100.259,-0.00268841],0,true,true],
     ["Land_u_House_Big_01_V1_F",[-65.2944,63.9878,-0.00268841],0,true,true],
     //["Sign_Sphere100cm_F",[-25.4528,-44.6294,0.614402],0,true,true],
     //["Sign_Arrow_Direction_Green_F",[24.8673,-40.6646,0.254696],0,true,true],
     //["Sign_Arrow_Direction_Green_F",[14.9813,-38.5874,3.96717],0,true,true],
     //["Sign_Arrow_F",[10.937,-14.8413,1.03384],0,true,true],
     //["Sign_Sphere100cm_F",[18.4126,35.3154,0.499284],0,true,true],
     ["Land_i_House_Big_02_V1_F",[53.7161,-101.875,-0.00268841],0,true,true],
     ["Land_i_House_Big_02_V2_F",[52.6943,66.0278,-0.00268841],0,true,true],
	      //["Box_IND_AmmoOrd_F",[-25.7473,-46.3496,3.72631],359.995,true,true],
     ["CargoNet_01_barrels_F",[-31.2815,14.4961,-0.00268984],359.995,true,true],
     ["CargoNet_01_barrels_F",[-2.56213,-16.4194,-0.00268888],359.999,true,true],
     ["CargoNet_01_barrels_F",[3.29309,-24.7749,-0.00268984],359.995,true,true],
     ["CargoNet_01_barrels_F",[18.3497,-0.543945,-0.00268888],360,true,true]
];

_missionLootBoxes = [

];

_missionLootVehicles = [
     //["B_G_Van_01_transport_F",[10.937,-14.8413,1.03384],_crateLoot,_lootCounts,0]
];

_missionPatrolVehicles = [
     //["B_LSV_01_armed_F",[-1.72729,-70.439,-0.0251398],0.00168032],
     //["B_LSV_01_armed_F",[-3.96387,50.4224,-0.0167227],0.000187991]
     //["B_G_Van_01_transport_F",[11.2661,-13.9561,0.0110526],359.998]
];

_submarinePatrolParameters = [
];

_airPatrols = [
     ["B_Heli_Light_01_dynamicLoadout_F",[-52.1934,-2.21631,0.00351906],0.0012961]
];

_missionEmplacedWeapons = [
     ["B_HMG_01_high_F",[-34.1661,35.9795,7.20899],360],
     ["B_GMG_01_high_F",[43.4441,-24.4961,-0.0144982],360]
];

_missionGroups = [
     //[[-31.2625,5.21875,-0.00124931],3,6,"Red",30,45],
     //[[-46.3765,18.731,-0.00124931],3,6,"Red",30,45],
     //[[-21.8778,18.8506,-0.00124931],3,6,"Red",30,45],
     //[[-3.32458,-42.5176,-0.00124931],3,6,"Red",30,45],
     //[[-2.06714,36.3027,-0.00124931],3,6,"Red",30,45],
     //[[29.3705,-18.0239,-0.00124931],3,6,"Red",30,45]
];

_scubaGroupParameters = [
];
//  Change _useMines to true/false below to enable mission-specific settings.
_minNoAI = GMS_MinAI_Green;
_maxNoAI = GMS_MaxAI_Green;
_noAIGroups = GMS_AIGrps_Green;
_noVehiclePatrols = GMS_SpawnVeh_Green;
_noEmplacedWeapons = GMS_SpawnEmplaced_Green;
_minNoAI = GMS_MinAI_Blue;  // Setting this in the mission file overrides the defaults such as GMS_MinAI_Blue
_maxNoAI = GMS_MaxAI_Blue;  // Setting this in the mission file overrides the defaults 
_noAIGroups = GMS_AIGrps_Blue;  // Setting this in the mission file overrides the defaults 
_noVehiclePatrols = GMS_SpawnVeh_Blue;  // Setting this in the mission file overrides the defaults 
_noEmplacedWeapons = GMS_SpawnEmplaced_Blue;  // Setting this in the mission file overrides the defaults 

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
