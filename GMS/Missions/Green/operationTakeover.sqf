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

//diag_log "[GMS] Spawning  Mission with template = default";
_crateLoot = GMS_BoxLoot_Orange;
_lootCounts = GMS_lootCountsOrange;
_startMsg = "An enemy jail was sighted in a nearby sector! Check the Black marker on your map for the location!";
_endMsg = "The jail is under survivor control!";

_markerMissionName = "Rapid Response";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here


_markerType = ["ellipse",[0,0],"GRID"];
_markerColor = "ColorWEST";
_markerLabel = "";

_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Unfinished_Building_02_F",[-60.9961,12.3308,0],89.8576,true,true,[["B_HMG_01_high_F",[2.9436,-4.19751,0.24972],85.4192],["B_HMG_01_high_F",[4.25854,10.7007,-0.0121193],107.991]],[]],
     ["Land_WIP_F",[39.0039,24.064,0],270.203,true,true,[["B_HMG_01_high_F",[-16.3564,-6.18042,5.0093],214.563],["B_Mortar_01_F",[8.48633,-16.2366,12.3663],359.999],["B_Mortar_01_F",[-9.48535,-15.9546,12.3559],359.98],["B_HMG_01_high_F",[-31.4385,-6.68115,-0.0121188],176.778]],[]],
     ["Land_Cargo_Tower_V1_F",[21.0771,54.4438,0],271.07,true,true,[["B_HMG_01_high_F",[5.58252,-1.64209,17.7789],52.4853],["B_HMG_01_high_F",[3.34668,4.95532,17.8811],63.0363],["B_HMG_01_high_F",[-4.07227,4.9895,17.8769],321.495]],[]],
     ["Land_Cargo_Tower_V3_F",[54.2837,-17.9026,0],0,true,true,[["B_HMG_01_high_F",[-2.48486,-7.05713,-0.0121174],254.877],["B_HMG_01_high_F",[-2.81348,-5.27686,17.779],159.79],["B_HMG_01_high_F",[4.88477,-2.86523,17.8809],146.13],["B_HMG_01_high_F",[4.8916,4.13135,17.8771],70.1582],["B_HMG_01_high_F",[-18.8633,-21.7476,-0.0121198],315.734]],[]]
];

_missionLandscape = [
     ["Land_Mil_WallBig_4m_F",[-70.9556,-21.7397,0],90.5574,true,true],
     ["Land_Mil_WallBig_4m_F",[-65.5688,-31.2412,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-71.0183,-25.6069,0],90.3037,true,true],
     ["Land_Mil_WallBig_4m_F",[-61.7185,-31.2253,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-71.0566,-29.4609,0],90.9224,true,true],
     ["Land_Mil_WallBig_4m_F",[-69.4084,-31.2383,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.9043,-17.8816,0],91.1335,true,true],
     ["Land_Mil_WallBig_4m_F",[-57.8728,-31.2117,0],0,true,true],
     ["Land_Cargo_Tower_V1_F",[-65.7742,-23.8442,0],89.7627,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.8843,-6.35059,0],90.3716,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.8752,-2.46118,0],89.3976,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.8899,9.16797,0],88.7977,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.9011,13.021,0],91.0597,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.9148,5.2876,0],90.1169,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.8755,-10.2068,0],89.936,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.8945,-14.0322,0],90.6833,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.9084,1.42627,0],89.2839,true,true],
     ["Land_Cargo_House_V1_F",[-55.5381,-0.398438,0],180.346,true,true],
     ["Land_CncWall4_F",[-68.3481,-0.56958,0],179.602,true,true],
     ["Land_CncWall4_F",[-64.376,-0.486816,0],179.911,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.8362,16.8625,0],90.8206,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.7424,24.5647,0],90.2255,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.7883,36.0994,0],89.8502,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.7854,20.73,0],91.3237,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.7744,32.2678,0],89.8212,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.7876,39.9675,0],90.3499,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.7505,43.8293,0],89.9787,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.7439,28.4033,0],90.1038,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.738,47.6904,0],90.9879,true,true],
     ["Land_Tank_rust_F",[-57.4561,42.9893,0],0,true,true],
     ["Land_Unfinished_Building_02_F",[-61.1445,31.9102,0],89.4718,true,true],
     ["Land_Mil_WallBig_4m_F",[-69.0227,62.4194,0],178.343,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.6748,59.2129,0],89.4836,true,true],
     ["Land_Mil_WallBig_4m_F",[-65.1848,62.5364,0],179.252,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.6985,60.6089,0],89.3358,true,true],
     ["Land_Mil_WallBig_4m_F",[-61.3386,62.5498,0],180.355,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.7178,51.5427,0],89.9441,true,true],
     ["Land_Mil_WallBig_4m_F",[-57.4988,62.5688,0],179.26,true,true],
     ["Land_Mil_WallBig_4m_F",[-70.6902,55.3772,0],90.9313,true,true],
     ["Land_Cargo_Tower_V1_F",[-63.562,57.5813,0],180.174,true,true],
     ["Land_Mil_WallBig_4m_F",[-46.3152,-31.1899,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-34.7395,-31.1567,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-23.1311,-31.1777,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-38.6018,-31.1497,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-27.02,-31.1851,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-42.4546,-31.1765,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-50.1863,-31.1816,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-30.8767,-31.1548,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-54.0432,-31.2051,0],0,true,true],
     ["Land_BagFence_01_long_green_F",[-41.9392,-23.0669,7.51739],0,true,true],
     ["Land_BagFence_01_short_green_F",[-44.0996,-23.0972,7.51739],0,true,true],
     ["Land_BagFence_01_short_green_F",[-39.7847,-23.041,7.51739],0,true,true],
     ["Land_BagFence_01_round_green_F",[-45.835,-22.2988,7.51739],48.0621,true,true],
     ["Land_BagFence_01_round_green_F",[-38.0859,-22.3396,7.51739],316.485,true,true],
     ["Land_u_Barracks_V2_F",[-35.9812,-17.3149,0],0,true,true],
     ["Land_CncWall4_F",[-52.9299,-23.6628,0],92.1306,true,true],
     ["Land_CncWall4_F",[-37.1531,-28.6726,0],90.7022,true,true],
     ["Land_Wreck_Offroad_F",[-28.8862,4.91138,0],213.965,true,true],
     ["Land_Cargo_House_V1_F",[-48.7632,-0.523438,0],179.662,true,true],
     ["Land_Cargo_House_V1_F",[-42.2058,-0.445801,0],178.217,true,true],
     ["Land_Dome_Small_F",[-24.3013,15.6531,-4.76837e-007],272.316,true,true],
     ["Land_Wreck_Ural_F",[-34.2483,11.8752,0],261.493,true,true],
     ["Land_Wreck_Ural_F",[-42.3066,9.02588,0],68.7277,true,true],
     ["Land_u_Barracks_V2_F",[-26.3616,43.1875,0],181.425,true,true],
     ["Land_wpp_Turbine_V2_F",[-41.9377,58.8804,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-38.2644,62.7185,0],179.921,true,true],
     ["Land_Mil_WallBig_4m_F",[-34.4031,62.7485,0],179.553,true,true],
     ["Land_Mil_WallBig_4m_F",[-49.8066,62.6262,0],179.302,true,true],
     ["Land_Mil_WallBig_4m_F",[-42.0884,62.7102,0],179.366,true,true],
     ["Land_Mil_WallBig_4m_F",[-26.6929,62.771,0],180.541,true,true],
     ["Land_Mil_WallBig_4m_F",[-53.6548,62.6008,0],179.834,true,true],
     ["Land_Mil_WallBig_4m_F",[-45.9495,62.6567,0],179.484,true,true],
     ["Land_Mil_WallBig_4m_F",[-30.5383,62.7832,0],179.487,true,true],
     ["Land_Mil_WallBig_4m_F",[4.05518,-53.7595,0],325.345,true,true],
     ["Land_Mil_WallBig_4m_F",[-14.1846,-53.5205,0],43.3328,true,true],
     ["Land_Mil_WallBig_4m_F",[0.696289,-54.9407,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-16.9585,-50.8445,0],43.519,true,true],
     ["Land_Mil_WallBig_4m_F",[-7.01416,-54.9324,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-10.8765,-54.9028,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[7.22314,-51.5159,0],324.1,true,true],
     ["Land_Mil_WallBig_4m_F",[-19.793,-48.1777,0],43.4082,true,true],
     ["Land_CncWall1_F",[-3.23486,-54.9473,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-21.0298,-41.1824,0],90.7831,true,true],
     ["Land_Mil_WallBig_4m_F",[-20.9756,-37.2678,0],90.566,true,true],
     ["Land_Mil_WallBig_4m_F",[-20.9526,-33.3606,0],90.3304,true,true],
     ["Land_Mil_WallBig_4m_F",[-21.1201,-45.0388,0],91.9564,true,true],
     ["Land_BagFence_01_long_green_F",[-6.93506,-21.9814,7.51739],0,true,true],
     ["Land_BagFence_01_long_green_F",[-9.71191,-21.9512,7.51739],0,true,true],
     ["Land_BagFence_01_round_green_F",[-4.62354,-21.3438,7.51739],315.456,true,true],
     ["Land_BagFence_01_round_green_F",[-12.1323,-21.2937,7.51739],43.3613,true,true],
     ["Land_SM_01_shed_F",[-8.00439,-43.0354,0],0.0480932,true,true],
     ["Land_u_Barracks_V2_F",[-2.53125,-15.9839,0],358.616,true,true],
     ["Land_CncWall4_F",[-19.9722,-22.2917,0],270.546,true,true],
     ["Land_CncWall4_F",[-4.49756,-24.3555,0],269.182,true,true],
     ["Land_CncWall4_F",[-17.4209,-31.4302,0],270.307,true,true],
     ["Land_Wreck_Hunter_F",[-22.1006,5.98096,0],147.866,true,true],
     ["Land_Wreck_CarDismantled_F",[-17.1021,8.25,0],125.911,true,true],
     ["RoadCone_L_F",[-3,-3,0],0,true,true],
     ["Land_CncWall4_F",[-1.57422,8.20337,0],269.92,true,true],
     ["Land_CncWall4_F",[-1.62158,13.3389,0],269.085,true,true],
     ["Land_CncWall4_F",[-1.57666,3.0127,0],270.789,true,true],
     ["Land_Wreck_HMMWV_F",[-7.48926,10.5498,0],278.667,true,true],
     ["Land_CncWall4_F",[-1.84619,26.6411,0],269.816,true,true],
     ["Land_CncWall4_F",[-1.99854,47.2441,0],268.694,true,true],
     ["Land_CncWall4_F",[-1.81348,21.4751,0],269.753,true,true],
     ["Land_CncWall4_F",[-1.9209,31.772,0],268.648,true,true],
     ["Land_CncWall4_F",[-2.00781,42.0947,0],270.259,true,true],
     ["Land_CncWall4_F",[-2,36.9187,0],269.562,true,true],
     ["Land_wpp_Turbine_V2_F",[-17.4063,59.3362,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-9.24707,62.1733,0],183.051,true,true],
     ["Land_Mil_WallBig_4m_F",[1.22168,62.0315,0],181.136,true,true],
     ["Land_Mil_WallBig_4m_F",[8.86963,61.9207,0],181.636,true,true],
     ["Land_Mil_WallBig_4m_F",[-2.60645,62.0313,0],179.137,true,true],
     ["Land_Mil_WallBig_4m_F",[-22.8423,62.7271,0],180.559,true,true],
     ["Land_Mil_WallBig_4m_F",[5.0625,61.9785,0],179.812,true,true],
     ["Land_Mil_WallBig_4m_F",[-15.1294,62.6226,0],183.852,true,true],
     ["Land_Mil_WallBig_4m_F",[-11.2056,62.3108,0],184.569,true,true],
     ["Land_Mil_WallBig_4m_F",[-5.68408,62.0347,0],180.607,true,true],
     ["Land_Mil_WallBig_4m_F",[-18.9717,62.7554,0],179.347,true,true],
     ["Land_HBarrier_5_F",[7.67285,54.312,0],35.0142,true,true],
     ["Land_HBarrier_5_F",[4.51611,54.6199,0],214.908,true,true],
     ["Land_CncWall4_F",[-2.07764,52.4014,0],269.364,true,true],
     ["Land_CncWall4_F",[-2.06494,56.3867,0],271.356,true,true],
     ["Land_FuelStation_02_pump_F",[40.4248,-67.5818,0.285],0,true,true],
     ["Land_Mil_WallBig_4m_F",[9.86914,-48.7041,0],301.646,true,true],
     ["Land_CncBarrierMedium4_F",[21.7886,-66.9448,0],268.364,true,true],
     ["Land_CncBarrierMedium4_F",[11.6875,-53.3286,0],227.033,true,true],
     ["Land_CncBarrierMedium4_F",[17.8984,-56.0083,0],0,true,true],
     ["Land_CncBarrierMedium4_F",[21.5776,-59.6167,0],269.101,true,true],
     ["Land_FuelStation_02_workshop_F",[30.7529,-55.9856,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[32.4272,-46.6111,0],359.434,true,true],
     ["Land_Mil_WallBig_4m_F",[36.2969,-46.5876,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[40.1514,-46.5508,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[11.021,-45.1375,0],269.589,true,true],
     ["Land_HaulTruck_01_abandoned_F",[17.6182,-38.3813,0],0,true,true],
     ["Land_dp_smallFactory_F",[19.9829,-15.8096,0],269.426,true,true],
     ["Land_CncWall4_F",[27.7803,-46.7144,0],358.188,true,true],
     ["Land_CncWall4_F",[32.4053,-23.0171,0],0,true,true],
     ["Land_CncWall4_F",[25.542,-44.6201,0],89.4653,true,true],
     ["Land_CncWall4_F",[25.3423,-34.2324,0],89.3567,true,true],
     ["Land_CncWall4_F",[10.8198,-30.3127,0],270.031,true,true],
     ["Land_CncWall4_F",[29.7148,-26.8479,0],0,true,true],
     ["Land_CncWall4_F",[10.7749,-35.4851,0],270.559,true,true],
     ["Land_CncWall4_F",[10.7231,-40.6462,0],270.677,true,true],
     ["Land_CncWall4_F",[13.563,-27.0159,0],0,true,true],
     ["Land_CncWall4_F",[37.5566,-23.0508,0],359.942,true,true],
     ["Land_CncWall4_F",[25.4438,-39.4263,0],88.5215,true,true],
     ["Land_CncWall4_F",[26.46,-1.92505,0],269.97,true,true],
     ["Land_CncWall4_F",[37.2246,-1.31934,0],359.566,true,true],
     ["Land_MobileCrane_01_hook_F",[21.167,24.7126,0],180.212,true,true],
     ["Land_Mil_WallBig_4m_F",[39.6533,61.6123,0],180.102,true,true],
     ["Land_Mil_WallBig_4m_F",[31.9688,61.6941,0],180.867,true,true],
     ["Land_Mil_WallBig_4m_F",[20.4971,61.7854,0],180.422,true,true],
     ["Land_Mil_WallBig_4m_F",[35.8325,61.6057,0],179.854,true,true],
     ["Land_Mil_WallBig_4m_F",[16.605,61.8333,0],180.4,true,true],
     ["Land_Mil_WallBig_4m_F",[28.1401,61.7021,0],180.548,true,true],
     ["Land_Mil_WallBig_4m_F",[12.7109,61.8547,0],181.262,true,true],
     ["Land_Mil_WallBig_4m_F",[24.3027,61.7354,0],181.242,true,true],
     ["Land_FuelStation_02_pump_F",[44.1704,-67.6467,0.285001],0,true,true],
     ["Land_FuelStation_02_pump_F",[42.3804,-67.6313,0.285001],0,true,true],
     ["Land_FuelStation_02_roof_F",[42.3452,-67.5942,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[47.9233,-46.5945,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[59.481,-46.5894,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[51.7622,-46.5869,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[61.1812,-44.6775,0],270.727,true,true],
     ["Land_Mil_WallBig_4m_F",[44.0723,-46.5859,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[61.1621,-40.8149,0],267.43,true,true],
     ["Land_Mil_WallBig_4m_F",[55.6416,-46.6177,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[61.0664,-36.9656,0],269.062,true,true],
     ["Land_Mil_WallBig_4m_F",[60.9927,-33.115,0],267.987,true,true],
     ["Land_Mil_WallBig_4m_F",[60.7769,-25.3948,0],269.759,true,true],
     ["Land_Mil_WallBig_4m_F",[60.6992,-21.5288,0],268.547,true,true],
     ["Land_Mil_WallBig_4m_F",[60.8853,-29.2122,0],268.201,true,true],
     ["Land_Mil_WallBig_4m_F",[60.6138,-17.6204,0],268.68,true,true],
     ["Land_i_Stone_HouseSmall_V2_F",[45.2388,-33.073,0],156.696,true,true],
     ["Land_CncWall4_F",[58.2612,-23.0266,0],0,true,true],
     ["Land_CncWall4_F",[42.7173,-23.0313,0],0,true,true],
     ["Land_CncWall4_F",[47.8916,-23.0232,0],0,true,true],
     ["Land_CncWall4_F",[53.0898,-23.0032,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[60.4819,-2.16016,0],269.477,true,true],
     ["Land_Mil_WallBig_4m_F",[60.3911,13.2949,0],269.514,true,true],
     ["Land_Mil_WallBig_4m_F",[60.4702,1.68726,0],270.373,true,true],
     ["Land_Mil_WallBig_4m_F",[60.4058,9.42896,0],269.451,true,true],
     ["Land_Mil_WallBig_4m_F",[60.5366,-13.7136,0],268.997,true,true],
     ["Land_Mil_WallBig_4m_F",[60.4453,5.58374,0],268.733,true,true],
     ["Land_Mil_WallBig_4m_F",[60.479,-6.02173,0],271.015,true,true],
     ["Land_Mil_WallBig_4m_F",[60.4761,-9.86719,0],268.423,true,true],
     ["Land_CncWall4_F",[47.8989,-1.40283,0],0,true,true],
     ["Land_CncWall4_F",[58.0024,-1.28906,0],0,true,true],
     ["Land_CncWall4_F",[42.4209,-1.30054,0],0,true,true],
     ["Land_CncWall4_F",[52.8232,-1.30688,0],0,true,true],
     ["Land_Mil_WallBig_4m_F",[60.6245,40.3376,0],270.902,true,true],
     ["Land_Mil_WallBig_4m_F",[60.4922,24.9067,0],269.728,true,true],
     ["Land_Mil_WallBig_4m_F",[60.5732,36.5076,0],270.146,true,true],
     ["Land_Mil_WallBig_4m_F",[60.4526,21.064,0],269.827,true,true],
     ["Land_Mil_WallBig_4m_F",[60.5029,32.616,0],270.501,true,true],
     ["Land_Mil_WallBig_4m_F",[60.5151,28.7512,0],269.744,true,true],
     ["Land_Mil_WallBig_4m_F",[60.7461,44.1904,0],271.554,true,true],
     ["Land_Mil_WallBig_4m_F",[60.4058,17.1665,0],270.449,true,true],
     ["Land_Mil_WallBig_4m_F",[60.7476,48.0803,0],269.849,true,true],
     ["Land_Mil_WallBig_4m_F",[60.7168,51.9231,0],270.76,true,true],
     ["Land_Mil_WallBig_4m_F",[55.1094,61.3723,0],180.17,true,true],
     ["Land_Mil_WallBig_4m_F",[60.7646,59.6436,0],269.107,true,true],
     ["Land_Mil_WallBig_4m_F",[51.2363,61.3843,0],179.915,true,true],
     ["Land_Mil_WallBig_4m_F",[60.7749,55.7781,0],269.967,true,true],
     ["Land_Mil_WallBig_4m_F",[47.3745,61.4705,0],180.966,true,true],
     ["Land_Mil_WallBig_4m_F",[58.9883,61.3293,0],179.93,true,true],
     ["Land_Mil_WallBig_4m_F",[43.5361,61.5425,0],181.016,true,true]
];

_missionLootBoxes = [
     ["Box_FIA_Wps_F",[-24.9194,17.5498,-1.90735e-006],_crateLoot,_lootCounts,0.00131771],
     ["B_supplyCrate_F",[-27.5139,17.1206,0],_crateLoot,_lootCounts,360],
     ["Box_FIA_Support_F",[-19.1929,17.3916,1.43051e-006],_crateLoot,_lootCounts,359.999],
     ["Box_FIA_Ammo_F",[-21.9521,17.6284,-2.38419e-006],_crateLoot,_lootCounts,0.00126176]
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
     ["B_static_AA_F",[-44.8591,-21.6965,7.50483],0.2356],
     ["B_static_AT_F",[-38.8364,-22.3223,7.94878],95.0275],
     ["B_HMG_01_high_F",[-31.1875,6.95313,-0.0121174],38.4729],
     ["B_HMG_01_high_F",[-6.09619,-22.9727,-0.0121183],220.634],
     ["B_HMG_01_high_F",[-2.79541,-20.8943,-0.0121188],142.402],
     ["B_static_AA_F",[-5.25684,-20.9031,7.52122],0.0207681],
     ["B_static_AT_F",[-11.0635,-20.8711,7.52428],359.956],
     ["B_HMG_01_high_F",[-10.5552,43.4922,7.94442],114.274]
];

_missionGroups = [
     [[-51.2781,2.46313,0.00143909],3,6,"Orange",30,45],
     [[-11.7485,-30.1338,0.00143909],3,6,"Orange",30,45],
     [[-11.9927,0.826416,0.00143909],3,6,"Orange",30,45],
     [[-5.37646,13.8989,0.00143909],3,6,"Orange",30,45],
     [[0.439941,18.3259,0.00143909],3,6,"Orange",30,45],
     [[-6.35693,40.8398,0.00143909],3,6,"Orange",30,45],
     [[9.86279,-1.10864,0.00143909],3,6,"Orange",30,45],
     [[19.6943,15.1899,0.00143909],3,6,"Orange",30,45],
     [[10.9971,12.2664,0.00143909],3,6,"Orange",30,45],
     [[18.1143,45.5303,0.00143909],3,6,"Orange",30,45],
     [[19.3877,25.3489,0.00143909],3,6,"Orange",30,45],
     [[10.3965,54.8899,0.00143909],3,6,"Orange",30,45]
];

_scubaGroupParameters = [
];


//////////
//   The lines below define additional variables you may wish to configure.


//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Orange;
_maxNoAI = GMS_MaxAI_Orange;
_noAIGroups = GMS_AIGrps_Orange;
_noVehiclePatrols = GMS_SpawnVeh_Orange;
_noEmplacedWeapons = GMS_SpawnEmplaced_Orange;
_minNoAI = GMS_MinAI_Orange;  // Setting this in the mission file overrides the defaults such as GMS_MinAI_Orange
_maxNoAI = GMS_MaxAI_Orange;  // Setting this in the mission file overrides the defaults 
_noAIGroups = GMS_AIGrps_Orange;  // Setting this in the mission file overrides the defaults 
_noVehiclePatrols = GMS_SpawnVeh_Orange;  // Setting this in the mission file overrides the defaults 
_noEmplacedWeapons = GMS_SpawnEmplaced_Orange;  // Setting this in the mission file overrides the defaults 
//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;  // Setting this in the mission file overrides the defaults 
_uniforms = GMS_SkinList;  // Setting this in the mission file overrides the defaults 
_headgear = GMS_headgear;  // Setting this in the mission file overrides the defaults 
_vests = GMS_vests;
_backpacks = GMS_backpacks;
_sideArms = GMS_Pistols;
_chanceHeliPatrol = GMS_chanceHeliPatrolOrange;  // Setting this in the mission file overrides the defaults 
_noChoppers = GMS_noPatrolHelisOrange;
_missionHelis = GMS_patrolHelisOrange;

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
