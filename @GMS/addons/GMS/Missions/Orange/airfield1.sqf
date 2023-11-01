/*
	Dynamic Mission Generated
	Using 3DEN Plugin for GMS by Ghostrider
	GMS 3DEN Plugin Version 1.02 : Build 15 : Build Date 09/22/23
	By Ghostrider-GRG-
*/

#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\x\addons\GMS\Missions\GMS_privateVars.sqf" 

_defaultMissionLocations = [[9217.65,21604.4,15.9466]];
_maxMissionRespawns = -1; // Chage this to either zero for no respawns or a positive number if you want to limit the number of times a mission spawns at the same location
_markerType = ["mil_warning",[1,1],"Solid"];
_markerColor = "Default";
_startMsg = "AIRFIELD TEST MISSION, PLEASE AVOID";
_endMsg = "HOLY SHIT, DID THIS MISSION ACTUALLY CLEAR?";
_markerMissionName = "AIRFIELD (BETA)";
_crateLoot = GMS_BoxLoot_Orange;
_lootCounts = GMS_lootCountsOrange;

_garrisonedBuilding_ATLsystem = [
["Land_MilOffices_V1_F",[9195.41,21626,9.53674e-007],146.426,true,true,[["B_HMG_01_high_F",[-14.3076,-6.03516,-0.477989],0],["B_HMG_01_high_F",[10.6221,9.39844,-0.398628],0]],[]],
["Land_Cargo_Tower_V1_No1_F",[9257.06,21603.1,0],55.7402,true,true,[],[[[1.9707,4.1543,18.0282],0.361212]]],
["Land_Hangar_F",[9121.28,21553.4,0],53.6746,true,true,[["B_HMG_01_high_F",[-8.20508,-19.2891,-0.24754],0]],[]],
["Land_ControlTower_01_F",[9031.44,21431,0],91.4892,true,true,[["B_HMG_01_high_F",[2.10938,-0.507813,-6.22271],0]],[]],
["Land_Cargo_Patrol_V1_F",[9176.65,21543.5,0],0,true,true,[["B_HMG_01_high_F",[-0.417969,0.617188,-4.33346],0]],[]],
["Land_Cargo_Patrol_V1_F",[9118.59,21602,-9.53674e-007],57.1431,true,true,[["B_HMG_01_high_F",[1.08008,0.486328,-4.35415],0]],[]],
["Land_Cargo_Patrol_V1_F",[9118.32,21420.6,0],321.011,true,true,[["B_HMG_01_high_F",[-1.03516,0.75,-4.29249],0]],[]],
["Land_Cargo_Patrol_V1_F",[9022.51,21345.1,0],321.011,true,true,[["B_HMG_01_high_F",[-0.81543,0.513672,-4.32106],0]],[]]
];

_missionLandscape = [
     ["Land_HelipadCivil_F",[-35.4277,45.3242,-15.9466],0],
     ["Land_Cargo_Tower_V1_No2_F",[-78.9141,32.9395,-15.9466],234.329],
     ["Land_Cargo_Tower_V1_No3_F",[-242.806,-168.309,-15.9466],183.72],
     ["Land_BarGate_F",[-3.44922,76.0781,-15.9466],56.2432],
     ["Land_BarGate_F",[-9.46191,85.3574,-15.9466],237.836],
     ["Land_Radar_F",[-50.6992,97.9297,-15.9466],304.919],
     ["Land_HBarrierWall6_F",[67.543,-49.709,-15.971],142.078],
     ["Land_HBarrierWall6_F",[74.375,-44.5352,-15.9522],142.083],
     ["Land_HBarrierWall6_F",[53.9424,-60.2656,-15.9759],142.073],
     ["Land_HBarrierWall6_F",[60.7754,-55.0938,-15.9698],142.083],
     ["Land_HBarrierWall6_F",[67.3809,-141.922,-15.8495],142.444],
     ["Land_HBarrierWall6_F",[74.252,-136.801,-15.8143],142.446],
     ["Land_HBarrierWall6_F",[53.7031,-152.377,-15.8076],142.402],
     ["Land_HBarrierWall6_F",[60.5742,-147.256,-15.83],142.43],
     ["Land_HBarrierWall6_F",[40.3008,-70.7168,-15.9632],142.079],
     ["Land_HBarrierWall6_F",[47.1338,-65.5449,-15.9586],142.084],
     ["Land_HBarrierWall6_F",[26.7021,-81.2734,-15.9499],142.084],
     ["Land_HBarrierWall6_F",[33.5352,-76.1016,-15.953],142.083],
     ["Land_BarGate_F",[18.9326,-88.416,-15.9466],143.336],
     ["Land_HBarrierWall6_F",[2.43262,-98.3633,-15.9466],142.084],
     ["Land_HBarrierWall6_F",[9.26465,-93.1895,-15.946],142.086],
     ["Land_HBarrierWall6_F",[-11.168,-108.92,-15.9449],142.085],
     ["Land_HBarrierWall6_F",[-4.33496,-103.748,-15.9458],142.084],
     ["Land_HBarrierWall6_F",[-24.8096,-119.371,-15.8988],142.084],
     ["Land_HBarrierWall6_F",[-17.9766,-114.199,-15.9603],142.108],
     ["Land_HBarrierWall6_F",[-38.4082,-129.928,-15.9258],142.072],
     ["Land_HBarrierWall6_F",[-31.5752,-124.756,-15.9206],142.069],
     ["Land_BarGate_F",[-46.3564,-137.58,-15.9466],330.089],
     ["Land_HBarrierWall6_F",[-63.416,-147.289,-15.9555],142.09],
     ["Land_HBarrierWall6_F",[-56.584,-142.115,-15.9339],142.08],
     ["Land_HBarrierWall6_F",[-77.0166,-157.846,-15.8824],142.095],
     ["Land_HBarrierWall6_F",[-70.1836,-152.674,-15.9299],142.067],
     ["Land_HBarrierWall6_F",[-90.6582,-168.297,-15.9316],142.076],
     ["Land_HBarrierWall6_F",[-83.8252,-163.125,-15.9278],142.084],
     ["Land_HBarrierWall6_F",[-104.257,-178.854,-15.8952],142.087],
     ["Land_HBarrierWall6_F",[-97.4238,-173.682,-15.8977],142.078],
     ["Land_BarGate_F",[-111.57,-187.59,-15.9466],147.346],
     ["Land_HBarrierWall6_F",[-130.445,-196.588,-15.9307],142.083],
     ["Land_HBarrierWall6_F",[-123.613,-191.414,-15.9292],142.085],
     ["Land_HBarrierWall6_F",[-144.046,-207.145,-15.9383],142.081],
     ["Land_HBarrierWall6_F",[-137.213,-201.973,-15.9344],142.08],
     ["Land_HBarrierWall6_F",[-157.688,-217.596,-15.9342],142.078],
     ["Land_HBarrierWall6_F",[-150.854,-212.424,-15.9396],142.082],
     ["Land_HBarrierWall6_F",[-171.286,-228.152,-15.9354],142.077],
     ["Land_HBarrierWall6_F",[-164.453,-222.98,-15.8755],142.077],
     ["Land_TentHangar_V1_F",[-214.581,-268.938,-15.9466],168.066],
     ["Land_i_Barracks_V1_F",[-38.7393,-35.5625,-15.9466],145.047],
     ["Land_LampAirport_F",[-171.29,-165.273,-15.9366],0],
     ["Land_LampAirport_F",[-119.504,-125.146,-15.9366],0],
     ["Land_LampAirport_F",[-68.2031,-86.6934,-15.9466],0],
     ["Land_LampAirport_F",[-11.9023,-45.9238,-15.9466],0],
     ["Land_ReservoirTank_Airport_F",[56.6035,98.8535,-15.9466],109.472],
     ["Land_LightHouse_F",[391.881,1502.16,-17.3482],0],
     ["Land_CncBarrier_F",[54.0166,-7.92383,-15.9462],145.272],
     ["Land_CncBarrier_F",[51.585,-8.46094,-15.9462],189.278],
     ["Land_CncBarrier_F",[49.541,-7.12305,-15.9461],237.292],
     ["Land_CncBarrier_F",[67.4307,1.12305,-15.9462],145.118],
     ["Land_CncBarrier_F",[68.7695,3.16406,-15.9461],102.779],
     ["Land_CncBarrier_F",[68.2549,5.5918,-15.9459],54.7703],
     ["RoadBarrier_F",[68.0361,-1.53906,-15.9464],148.436],
     ["RoadBarrier_F",[56.8809,-9.01563,-15.9465],141.247],
     ["Land_CncBarrier_F",[44.5996,-9.04883,-15.9466],140.643],
     ["Land_CncBarrier_F",[15.7754,-32.2188,-15.9467],140.645],
     ["Land_CncBarrier_F",[8.21289,-38.1367,-15.9466],140.648],
     ["Land_CncBarrier_F",[-88.5771,-20.8711,-15.9466],58.007],
     ["Land_CncBarrier_F",[-18.165,123.66,-15.9467],326.021],
     ["Land_CncBarrier_F",[-15.7295,124.164,-15.9466],10.0225],
     ["Land_CncBarrier_F",[-13.7031,122.799,-15.9465],58.0339],
     ["Land_CncBarrier_F",[-31.7021,114.793,-15.9466],325.881],
     ["Land_CncBarrier_F",[-33.0684,112.771,-15.9467],283.544],
     ["Land_CncBarrier_F",[-32.5859,110.336,-15.9465],235.526],
     ["RoadBarrier_F",[-30.7734,117.662,-15.9465],329.2],
     ["RoadBarrier_F",[-21.2881,123.998,-15.9465],322.012],
     ["Land_NetFence_03_m_9m_F",[10.3115,-32.1133,-15.9466],144.022],
     ["Land_NetFence_03_m_9m_F",[17.6992,-26.709,-15.9466],144.022],
     ["Land_NetFence_03_m_9m_F",[-4.51172,-42.918,-15.9466],144.022],
     ["Land_NetFence_03_m_9m_F",[2.87598,-37.5137,-15.9466],144.022],
     ["Land_NetFence_03_m_9m_F",[53.0117,17.168,-15.9466],236.995],
     ["Land_NetFence_03_m_9m_F",[58.0254,9.50977,-15.9466],236.995],
     ["Land_NetFence_03_m_9m_F",[42.9902,32.5313,-15.9466],236.995],
     ["Land_NetFence_03_m_9m_F",[48.0039,24.873,-15.9466],236.995],
     ["Land_NetFence_03_m_9m_F",[-38.0811,-67.4707,-15.9466],145.026],
     ["Land_NetFence_03_m_9m_F",[-30.5996,-62.1973,-15.9466],145.026],
     ["Land_NetFence_03_m_9m_F",[-53.0918,-78.0137,-15.9466],145.026],
     ["Land_NetFence_03_m_9m_F",[-45.6104,-72.7402,-15.9466],145.026],
     ["Land_NetFence_03_m_9m_F",[-86.2881,-102.797,-15.9466],145.026],
     ["Land_NetFence_03_m_9m_F",[-78.8066,-97.5234,-15.9466],145.026],
     ["Land_NetFence_03_m_9m_F",[-101.299,-113.34,-15.9466],145.026],
     ["Land_NetFence_03_m_9m_F",[-93.8174,-108.066,-15.9466],145.026],
     ["Land_BagBunker_Small_F",[15.7109,-20.8203,-15.9431],276.614],
     ["Land_BagBunker_Small_F",[-28.3018,111.766,-15.9385],144.989],
     ["Land_BagBunker_Small_F",[63.999,4.12305,-15.9254],325.782],
     ["Land_HelipadSquare_F",[-56.3691,-10.6875,-15.9466],0],
     ["Land_Cargo_Patrol_V1_F",[31.7275,-87.457,-15.9466],321.011],
     ["Land_LampStreet_02_triple_F",[-36.1943,71.7148,-15.9466],0],
     ["Land_LampStreet_02_triple_F",[-61.4805,-42.9961,-15.9389],0],
     ["Land_LampStreet_02_triple_F",[-113.948,-82.7559,-15.9466],0],
     ["Land_LampStreet_02_triple_F",[-182.649,-161.93,-15.9466],0],
     ["Land_LampStreet_02_triple_F",[-247.627,-188.701,-15.9389],0],
     ["Land_LampStreet_02_triple_F",[-48.5938,-158.41,-15.9466],0],
     ["Land_LampStreet_02_triple_F",[65.4502,8.92969,-15.9466],0],
     ["Land_LampStreet_02_triple_F",[42.5186,104.504,-15.9466],0],
     ["Land_LampStreet_02_triple_F",[-28.2256,101.377,-15.9466],0],
     ["Land_LampStreet_02_triple_F",[-102.318,20.6973,-15.9466],0],
     ["Land_ConnectorTent_01_CSAT_greenhex_cross_F",[-22.041,-19.7246,-15.9462],0],
     ["Land_PowerGenerator_F",[-20.168,-30.0977,-15.9466],0],
     ["StorageBladder_01_fuel_forest_F",[-3.08887,-30.1914,-15.9466],0],
     ["Land_Cargo40_red_F",[29.4561,86.627,-15.9464],0],
     ["Land_Cargo40_red_F",[35.2715,79.2773,-15.9523],0],
     ["Land_Cargo20_light_green_F",[-24.6709,-47.2246,-15.8013],108.162],
     ["Land_ConnectorTent_01_NATO_cross_F",[7.37109,17.7012,-15.9447],0],
     ["Land_Medevac_HQ_V1_F",[1.38086,-16.6777,-15.9466],0],
     ["Land_BarGate_F",[28.2178,-21.8438,-15.9466],143.336],
     ["Land_BarGate_F",[36.9307,-15.2461,-15.9466],323.05],
     ["Land_BarGate_F",[-93.7383,-13.5098,-15.9466],56.2432],
     ["Land_LampStreet_02_triple_F",[-198.423,-87.8945,-15.9389],0],
     ["Land_Radar_01_kitchen_F",[54.458,42.8008,-15.9466],325.773],
     ["Land_TTowerBig_2_F",[-76.4287,85.6797,-15.9466],0],
     ["Land_HighVoltageTower_large_F",[-142.697,-0.542969,-15.9466],299.52],
     ["Land_MedicalTent_01_white_generic_open_F",[73.9189,56.4648,-15.9464],0],
     ["Land_MedicalTent_01_white_generic_open_F",[64.9502,74.7988,-15.9461],0],
     ["Land_LampStreet_02_triple_F",[-233.382,-270.305,-15.9466],0],
     ["Land_LampStreet_02_triple_F",[-128.998,-208.654,-15.9466],0],
     ["Land_LampStreet_02_triple_F",[4.05469,25.5781,-15.9466],0],
     ["Land_MedicalTent_01_white_generic_open_F",[19.6807,9.19336,-15.9454],0]
];

_simpleObjects = [

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
     ["B_HMG_01_high_F",[41.6621,-3.98828,1.87899],0],
     ["B_HMG_01_high_F",[34.5332,-0.964844,1.94235],0],
     ["B_HMG_01_high_F",[51.8623,-6.62695,-15.9464],0],
     ["B_HMG_01_high_F",[-0.0888672,-15.5977,-12.7783],0],
     ["B_HMG_01_high_F",[-239.226,-165.797,1.82505],0],
     ["B_HMG_01_high_F",[-246.742,-170.133,2.01812],0],
     ["B_HMG_01_high_F",[-74.6289,31.8516,1.91046],0],
     ["B_HMG_01_high_F",[-81.7568,35.7188,2.01215],0],
     ["B_HMG_01_high_F",[-15.9463,122.668,-15.9463],0],
     ["B_HMG_01_high_F",[-52.332,64.6484,-15.9466],0],
     ["B_HMG_01_high_F",[-85.0215,13.1699,-15.944],0],
     ["B_HMG_01_high_F",[-46.6201,-31.8047,-15.936],0],
     ["B_HMG_01_high_F",[-127.544,-119.559,-15.9448],0],
     ["B_HMG_01_high_F",[-182.793,-168.289,-15.9454],0],
     ["B_HMG_01_high_F",[85.2148,-44.4063,-15.9464],0],
     ["B_HMG_01_high_F",[-3.4834,62.8535,-15.9457],0],
     ["B_HMG_01_high_F",[32.1162,83.0059,-15.9456],0],
     ["B_GMG_01_high_F",[74.3135,-41.4199,-15.9463],0],
     ["B_GMG_01_high_F",[-103.939,-90.2402,-15.9449],0],
     ["B_GMG_01_high_F",[-169.229,-232.922,-15.9424],0],
     ["B_GMG_01_high_F",[-69.1426,-56.4395,-15.9374],0],
     ["B_GMG_01_high_F",[-8.97754,53.5059,-15.9465],0],
     ["B_GMG_01_high_F",[-85.0967,42.8828,-15.9466],0],
     ["B_GMG_01_high_F",[-67.873,-166.027,-15.9458],0],
     ["B_GMG_01_high_F",[-98.0527,8.63672,-15.9442],0],
     ["B_GMG_01_high_F",[5.6875,-15.502,-12.8099],0],
     ["B_GMG_01_high_F",[19.2002,19.9141,-15.9427],0],
     ["B_GMG_01_high_F",[13.5283,-98.6074,-15.9421],0],
     ["B_G_Mortar_01_F",[41.626,3.90039,2.15599],0],
     ["B_G_Mortar_01_F",[-239.661,-173.162,1.76869],0],
     ["B_G_Mortar_01_F",[52.5947,45.7852,-12.0937],0],
     ["B_G_Mortar_01_F",[-81.1621,28.666,1.88787],0],
     ["B_G_Mortar_01_F",[52.9961,86.4648,-15.9462],0],
     ["B_static_AA_F",[-63.709,56.3359,-11.3802],0],
     ["B_static_AA_F",[64.5615,62.1504,-15.9465],0],
     ["B_T_Static_AA_F",[-31.9541,-56.2324,-15.9465],0],
     ["B_T_Static_AA_F",[-129.015,-7.91016,-15.9322],0]
];

_missionGroups = [

];

_scubaGroupParameters = [

];

_missionLootBoxes = [
     ["I_CargoNet_01_ammo_F",[-67.7549,47.2188,-15.688],_crateLoot,_lootCounts,0],
     ["I_CargoNet_01_ammo_F",[-64.6338,42.7539,-15.671],_crateLoot,_lootCounts,0]
];

/*
	Use the parameters below to customize your mission - see the template or blck_configs.sqf for details about each them
*/
_chanceHeliPatrol = GMS_chanceHeliPatrolOrange;
_noChoppers = GMS_noPatrolHelisOrange;
_missionHelis = GMS_patrolHelisOrange;
_chancePara = GMS_chanceParaOrange;
_noPara = GMS_noParaOrange;
_paraTriggerDistance = 400;
_chanceLoot = 0.0;
_paraLoot = GMS_BoxLoot_Orange;
_paraLootCounts = GMS_lootCountsOrange;
_missionLandscapeMode = "precise";
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;
_vests = GMS_vests;
_backpacks = GMS_backpacks;
_sideArms = GMS_Pistols;
_spawnCratesTiming = "atMissionSpawnGround";
_loadCratesTiming = "atMissionCompletion";
_endCondition = allUnitsKilled;
_minNoAI = GMS_MinAI_Orange;
_maxNoAI = GMS_MaxAI_Orange;
_noAIGroups = GMS_AIGrps_Orange;
_noVehiclePatrols = GMS_SpawnVeh_Orange;
_noEmplacedWeapons = GMS_SpawnEmplaced_Orange;
_submarinePatrols = 0; // Default number of submarine patrols at pirate missions
_scubaPatrols = 0; // Default number of scuba diver patrols at pirate missions

#include "\x\addons\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";