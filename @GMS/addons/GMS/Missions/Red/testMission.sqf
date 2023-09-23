

/*
	Dynamic Mission Generated
	Using 3DEN Plugin for blckeagls
	dynamicMission.sqf generated:: blckeagls 3DEN Plugin Version 0 : Build 7 : Build Date 09/21/20
	By Ghostrider-GRG-
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf";

_defaultMissionLocations = [];
_markerType = ["round",[50,50],"GRID"];
_markerColor = "red";
_startMsg = "TODO: Change approiately";
_endMsg = "TODO: Change Appropriately";
_markerMissionName = "TODO: Update appropriately";
_crateLoot = GMS_BoxLoot_Blue;
_lootCounts = GMS_lootCountsBlue;

_garrisonedBuildings_BuildingPosnSystem = [

];

_garrisonedBuilding_ATLsystem = [
     ["Land_Medevac_HQ_V1_F",[-12.832,-6.40967,0],179.487,false,true,[["O_static_AA_F",[3.1626,3.46338,3.12652],0],["O_static_AT_F",[-6.3916,-3.32617,3.12652],0]],[[[-0.849609,0.173828,3.12796],0]]]
];

_missionLandscape = [
     ["Land_DeconTent_01_yellow_F",[-14.6782,8.51831,0],125.109,false,false],
     ["DeconShower_02_F",[8.0249,-14.4717,0],0,false,true],
     ["HazmatBag_01_F",[-7.54785,8.11841,0],0,false,false],
     ["Land_MultiScreenComputer_01_olive_F",[-10.5688,3.57373,0.886935],202.361,true,true],
     ["Land_MultiScreenComputer_01_black_F",[-10.231,2.22559,0.886935],261.232,true,true],
     ["Land_PortableLight_02_quad_black_F",[-6.97998,9.46533,0],343.406,false,true],
     ["Land_Razorwire_F",[-0.925293,-14.6257,0],0,false,false],
     ["Land_Razorwire_F",[-9.43408,-14.6787,0],0,false,false],
     ["Land_Razorwire_F",[-17.8281,-14.6936,0],0,false,false],
     ["Land_Razorwire_F",[14.2949,-11.6028,0],269.575,false,false],
     ["Land_Razorwire_F",[14.2549,-3.34668,0],269.575,false,false],
     ["Land_Razorwire_F",[14.1929,5.09033,0],269.575,false,false],
     ["Land_Razorwire_F",[14.1377,13.4653,0],269.575,false,false],
     ["Land_Razorwire_F",[-22.9863,-11.5537,0],269.575,false,false],
     ["Land_Razorwire_F",[-23.0264,-3.29761,0],269.575,false,false],
     ["Land_Razorwire_F",[-23.0884,5.13843,0],269.575,false,false],
     ["Land_Razorwire_F",[-23.1431,13.5134,0],269.575,false,false],
     ["Land_Razorwire_F",[-1.58301,16.9043,0],0,false,false],
     ["Land_Razorwire_F",[-10.0933,16.8503,0],0,false,false],
     ["Land_Razorwire_F",[-18.4863,16.8354,0],0,false,false],
     ["DeconShower_02_F",[7.93799,16.9402,0],0,true,true],
     ["Land_Cargo_House_V1_F",[1.0708,-19.4346,0],269.909,true,true],
     ["Land_Cargo_House_V1_F",[0.973633,21.8057,0],269.909,true,true],
     ["RoadCone_L_F",[0,0,0],0,true,true]
];

_simpleObjects = [
     ["DeconShower_01_F",[-4.47119,6.31543,0.00600004],31.5],
     ["Land_SolarPanel_04_black_F",[-5.67969,-9.79028,0],250.507],
     ["Land_SatelliteAntenna_01_F",[-6.91016,-1.52856,0],61.162],
     ["Land_PortableWeatherStation_01_olive_F",[-19.8584,2.68286,0],0],
     ["Land_Cargo20_EMP_F",[-4.875,13.9023,0],0.349],
     ["Land_DeskChair_01_olive_F",[-9.58643,2.39331,0],0],
     ["Land_PortableDesk_01_olive_F",[-10.4292,2.88818,0],257.75],
     ["Land_PortableCabinet_01_medical_F",[-7.76074,-0.27417,0],175.846],
     ["Land_Cargo20_EMP_F",[-8.625,-21.1777,0],203.819],
     ["Land_DeskChair_01_olive_F",[-10.1123,4.42334,0],315.776]
];

_missionLootVehicles = [

];

_missionPatrolVehicles = [
     [selectRandom GMS_AIPatrolVehicles,[-7.33154,41.9883,-0.000406742],89.3026,75,75],
     [selectRandom GMS_AIPatrolVehicles,[-3.20459,-46.0554,-0.000406742],270.637,75,75]
];

_submarinePatrolParameters = [

];

_airPatrols = [

];

_missionEmplacedWeapons = [
     ["O_GMG_01_high_F",[14.8335,-17.9829,0],0],
     ["O_GMG_01_high_F",[14.249,20.4355,0],0]
];

_missionGroups = [
     [[10.0596,-6.36841,0.00143909],3,6,"Blue",30,45],
     [[-13.6816,-6.23584,3.12796],3,6,"Blue",30,45],
     [[-8.26025,5.02686,0.00143909],3,6,"Blue",30,45],
     [[3.58105,5.66821,0.00143909],3,6,"Blue",30,45]
];

_scubaGroupParameters = [

];

_missionLootBoxes = [

];

/*
	Use the parameters below to customize your mission - see the template or GMS_configs.sqf for details about each them
*/
_chanceHeliPatrol = GMS_chanceHeliPatrolBlue;
_noChoppers = GMS_noPatrolHelisBlue;
_missionHelis = GMS_patrolHelisBlue;
//_chancePara = GMS_chanceParaBlue;
//_noPara = GMS_noParaBlue;
//_paraTriggerDistance = 400;
//_paraSkill = 'Blue';
//_chanceLoot = 0.0;
//_paraLoot = GMS_BoxLoot_Blue;
//_paraLootCounts = GMS_lootCountsBlue;
_missionLandscapeMode = "precise";
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;
_vests = GMS_vests;
_backpacks = GMS_backpacks;
_sideArms = GMS_Pistols;
_spawnCratesTiming = "atMissionSpawnGround";
_loadCratesTiming = "atMissionSpawn";
_endCondition = allKilledOrPlayerNear;
_minNoAI = GMS_MinAI_Blue;
_maxNoAI = GMS_MaxAI_Blue;
_noAIGroups = GMS_AIGrps_Blue;
_noVehiclePatrols = GMS_SpawnVeh_Blue;
_noEmplacedWeapons = GMS_SpawnEmplaced_Blue;
_minNoAI = GMS_MinAI_Blue;
_maxNoAI = GMS_MaxAI_Blue;
_noAIGroups = GMS_AIGrps_Blue;
_noVehiclePatrols = GMS_SpawnVeh_Blue;
_noEmplacedWeapons = GMS_SpawnEmplaced_Blue;

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";