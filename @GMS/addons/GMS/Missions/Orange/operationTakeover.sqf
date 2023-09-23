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
_lootCounts = [15,50,20,60,44,5]; 
_startMsg = "Operation Takeover: An enemy jail was sighted in a nearby sector! Check the marker on your map for the location!";
_endMsg = "The jail is under survivor control!";

_markerMissionName = "Jail";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"

//////////
//   Past the output of the script here

_markerType =["ellipse",[250,250],"GRID"];
_markerColor = "ColorOrange";
_markerLabel = "";

_garrisonedBuildings_BuildingPosnSystem = [
];

_garrisonedBuilding_ATLsystem = [
     ["Land_Unfinished_Building_02_F",[-15.6624,-10.8792,-0.00143909],89.8576,true,true,[["B_HMG_01_high_F",[2.9436,-4.19751,0.249719],85.418],["B_HMG_01_high_F",[4.25854,10.7007,-0.0121183],107.99]],[]],
     ["Land_WIP_F",[84.3376,0.854004,-0.00143909],270.203,true,true,[["B_HMG_01_high_F",[-16.3564,-6.18042,5.0093],214.565],["B_Mortar_01_F",[8.48633,-16.2366,12.3663],359.991],["B_Mortar_01_F",[-9.48633,-15.9546,12.3559],359.988],["B_HMG_01_high_F",[-31.4385,-6.68115,-0.0121188],176.778]],[]],
     ["Land_Cargo_Tower_V1_F",[66.4109,31.2339,-0.00143909],271.07,true,true,[["B_HMG_01_high_F",[5.58789,-1.63867,17.7788],52.3841],["B_HMG_01_high_F",[3.34668,4.95532,17.8811],63.0442],["B_HMG_01_high_F",[-4.08008,4.99731,17.877],321.497]],[]],
     ["Land_Cargo_Tower_V3_F",[99.6174,-41.1125,-0.00143909],0,true,true,[["B_HMG_01_high_F",[-2.48486,-7.05713,-0.0121193],254.877],["B_HMG_01_high_F",[-2.81348,-5.27686,17.779],159.791],["B_HMG_01_high_F",[4.88477,-2.86499,17.8809],146.137],["B_HMG_01_high_F",[4.8916,4.13135,17.8771],70.1525],["B_HMG_01_high_F",[-18.8633,-21.7476,-0.0121183],315.734]],[]]
];

_missionLandscape = [
     ["Land_Mil_WallBig_4m_F",[-25.6218,-44.9497,-0.00143909],90.5574,true,true],
     ["Land_Mil_WallBig_4m_F",[-20.2351,-54.4512,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.6846,-48.8169,-0.00143909],90.3037,true,true],
     ["Land_Mil_WallBig_4m_F",[-16.3848,-54.4353,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.7229,-52.6709,-0.00143909],90.9224,true,true],
     ["Land_Mil_WallBig_4m_F",[-24.0747,-54.4482,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.5706,-41.0916,-0.00143909],91.1335,true,true],
     ["Land_Mil_WallBig_4m_F",[-12.5391,-54.4216,-0.00143909],0,true,true],
     ["Land_Cargo_Tower_V1_F",[-20.4404,-47.0542,-0.00143909],89.7627,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.5747,-21.7837,-0.00143909],89.2839,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.5562,-14.042,-0.00143909],88.7977,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.5674,-10.189,-0.00143909],91.0597,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.5811,-17.9224,-0.00143909],90.1169,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.5415,-25.6711,-0.00143909],89.3976,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.5608,-37.2422,-0.00143909],90.6833,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.5505,-29.5605,-0.00143909],90.3716,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.5417,-33.4167,-0.00143909],89.936,true,true],
     ["Land_Cargo_House_V1_F",[-10.2043,-23.6084,-0.00143909],180.346,true,true],
     ["Land_CncWall4_F",[-23.0144,-23.7795,-0.00143909],179.602,true,true],
     ["Land_CncWall4_F",[-19.0422,-23.6968,-0.00143909],179.911,true,true],
     ["Land_Unfinished_Building_02_F",[-15.8108,8.7002,-0.00143909],89.4718,true,true],
     ["Land_Tank_rust_F",[-12.1223,19.7793,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.4087,1.35474,-0.00143909],90.2255,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.4517,-2.47998,-0.00143909],91.3237,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.4546,12.8894,-0.00143909],89.8502,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.4043,24.4805,-0.00143909],90.9879,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.4102,5.19336,-0.00143909],90.1038,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.4407,9.05786,-0.00143909],89.8212,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.4539,16.7576,-0.00143909],90.3499,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.4167,20.6194,-0.00143909],89.9787,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.5024,-6.34741,-0.00143909],90.8206,true,true],
     ["Land_Mil_WallBig_4m_F",[-23.689,39.2095,-0.00143909],178.343,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.3411,36.0029,-0.00143909],89.4836,true,true],
     ["Land_Mil_WallBig_4m_F",[-19.8511,39.3264,-0.00143909],179.252,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.3647,37.3989,-0.00143909],89.3358,true,true],
     ["Land_Mil_WallBig_4m_F",[-16.0049,39.3398,-0.00143909],180.355,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.384,28.3328,-0.00143909],89.9441,true,true],
     ["Land_Mil_WallBig_4m_F",[-12.165,39.3589,-0.00143909],179.26,true,true],
     ["Land_Mil_WallBig_4m_F",[-25.3564,32.1672,-0.00143909],90.9313,true,true],
     ["Land_Cargo_Tower_V1_F",[-18.2283,34.3713,-0.00143909],180.174,true,true],
     ["Land_BagFence_01_short_green_F",[5.54907,-46.251,7.51595],0,true,true],
     ["Land_BagFence_01_short_green_F",[1.23413,-46.3071,7.51595],0,true,true],
     ["Land_u_Barracks_V2_F",[9.35254,-40.5249,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[10.5942,-54.3667,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[14.457,-54.3647,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[2.87915,-54.3865,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[18.3137,-54.395,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-4.85254,-54.3916,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-8.70947,-54.415,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[6.73193,-54.3596,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[22.2026,-54.3877,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[-0.981445,-54.3999,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[-7.59619,-46.8728,-0.00143909],92.1306,true,true],
     ["Land_CncWall4_F",[8.18066,-51.8826,-0.00143909],90.7022,true,true],
     ["Land_BagFence_01_long_green_F",[3.39453,-46.2769,7.51595],0,true,true],
     ["Land_BagFence_01_round_green_F",[-0.501221,-45.5088,7.51595],48.0621,true,true],
     ["Land_BagFence_01_round_green_F",[7.2478,-45.5496,7.51595],316.485,true,true],
     ["Land_Wreck_Offroad_F",[16.4475,-18.2986,-0.00143909],213.965,true,true],
     ["Land_Wreck_Ural_F",[3.0271,-14.1841,-0.00143909],68.7277,true,true],
     ["Land_Wreck_Ural_F",[11.0854,-11.3347,-0.00143909],261.493,true,true],
     ["Land_Cargo_House_V1_F",[-3.42944,-23.7334,-0.00143909],179.662,true,true],
     ["Land_Cargo_House_V1_F",[3.12793,-23.6558,-0.00143909],178.217,true,true],
     ["Land_Dome_Small_F",[21.0325,-7.55688,-0.00143957],272.316,true,true],
     ["Land_u_Barracks_V2_F",[18.9722,19.9775,-0.00143909],181.425,true,true],
     ["Land_wpp_Turbine_V2_F",[3.396,35.6704,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[7.06934,39.5085,-0.00143909],179.921,true,true],
     ["Land_Mil_WallBig_4m_F",[10.9307,39.5386,-0.00143909],179.553,true,true],
     ["Land_Mil_WallBig_4m_F",[-4.4729,39.4163,-0.00143909],179.302,true,true],
     ["Land_Mil_WallBig_4m_F",[3.24536,39.5002,-0.00143909],179.366,true,true],
     ["Land_Mil_WallBig_4m_F",[18.6409,39.561,-0.00143909],180.541,true,true],
     ["Land_Mil_WallBig_4m_F",[-8.32104,39.3909,-0.00143909],179.834,true,true],
     ["Land_Mil_WallBig_4m_F",[-0.615723,39.4468,-0.00143909],179.484,true,true],
     ["Land_Mil_WallBig_4m_F",[14.7954,39.5732,-0.00143909],179.487,true,true],
     ["Land_Mil_WallBig_4m_F",[49.3889,-76.9695,-0.00143909],325.345,true,true],
     ["Land_Mil_WallBig_4m_F",[31.1492,-76.7305,-0.00143909],43.3328,true,true],
     ["Land_Mil_WallBig_4m_F",[46.03,-78.1506,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[28.3752,-74.0544,-0.00143909],43.519,true,true],
     ["Land_Mil_WallBig_4m_F",[38.3196,-78.1423,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[34.4573,-78.1128,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[52.5569,-74.7258,-0.00143909],324.1,true,true],
     ["Land_Mil_WallBig_4m_F",[25.5408,-71.3877,-0.00143909],43.4082,true,true],
     ["Land_CncWall1_F",[42.0989,-78.1572,-0.00143909],0,true,true],
     ["Land_SM_01_shed_F",[37.3293,-66.2454,-0.00143909],0.0480932,true,true],
     ["Land_u_Barracks_V2_F",[42.8025,-39.1938,-0.00143909],358.616,true,true],
     ["Land_Mil_WallBig_4m_F",[24.2136,-68.2488,-0.00143909],91.9564,true,true],
     ["Land_Mil_WallBig_4m_F",[24.3582,-60.4778,-0.00143909],90.566,true,true],
     ["Land_Mil_WallBig_4m_F",[24.3811,-56.5706,-0.00143909],90.3304,true,true],
     ["Land_Mil_WallBig_4m_F",[24.304,-64.3923,-0.00143909],90.7831,true,true],
     ["Land_CncWall4_F",[25.3616,-45.5017,-0.00143909],270.546,true,true],
     ["Land_CncWall4_F",[27.9128,-54.6401,-0.00143909],270.307,true,true],
     ["Land_CncWall4_F",[40.8362,-47.5654,-0.00143909],269.182,true,true],
     ["Land_BagFence_01_long_green_F",[35.6218,-45.1611,7.51595],0,true,true],
     ["Land_BagFence_01_long_green_F",[38.3987,-45.1914,7.51595],0,true,true],
     ["Land_BagFence_01_round_green_F",[33.2014,-44.5037,7.51595],43.3613,true,true],
     ["Land_BagFence_01_round_green_F",[40.7102,-44.5537,7.51595],315.456,true,true],
     ["Land_Wreck_HMMWV_F",[37.8445,-12.6602,-0.00143909],278.667,true,true],
     ["Land_Wreck_Hunter_F",[23.2332,-17.229,-0.00143909],147.866,true,true],
     ["Land_Wreck_CarDismantled_F",[28.2317,-14.96,-0.00143909],125.911,true,true],
     ["Land_CncWall4_F",[43.7595,-15.0066,-0.00143909],269.92,true,true],
     ["Land_CncWall4_F",[43.7122,-9.87109,-0.00143909],269.085,true,true],
     ["Land_CncWall4_F",[43.7571,-20.1973,-0.00143909],270.789,true,true],
     ["Land_CncWall4_F",[43.4875,3.43115,-0.00143909],269.816,true,true],
     ["Land_CncWall4_F",[43.3259,18.8848,-0.00143909],270.259,true,true],
     ["Land_CncWall4_F",[43.4128,8.56201,-0.00143909],268.648,true,true],
     ["Land_CncWall4_F",[43.3352,24.0342,-0.00143909],268.694,true,true],
     ["Land_CncWall4_F",[43.5203,-1.73486,-0.00143909],269.753,true,true],
     ["Land_CncWall4_F",[43.3337,13.7087,-0.00143909],269.562,true,true],
     ["Land_wpp_Turbine_V2_F",[27.9275,36.1262,-0.00143909],0,true,true],
     ["Land_HBarrier_5_F",[53.0066,31.1021,-0.00143909],35.0142,true,true],
     ["Land_HBarrier_5_F",[49.8499,31.4099,-0.00143909],214.908,true,true],
     ["Land_Mil_WallBig_4m_F",[36.0867,38.9634,-0.00143909],183.051,true,true],
     ["Land_Mil_WallBig_4m_F",[42.7273,38.8213,-0.00143909],179.137,true,true],
     ["Land_Mil_WallBig_4m_F",[46.5554,38.8215,-0.00143909],181.136,true,true],
     ["Land_Mil_WallBig_4m_F",[50.3962,38.7686,-0.00143909],179.812,true,true],
     ["Land_Mil_WallBig_4m_F",[26.3621,39.5454,-0.00143909],179.347,true,true],
     ["Land_Mil_WallBig_4m_F",[34.1282,39.1008,-0.00143909],184.569,true,true],
     ["Land_Mil_WallBig_4m_F",[22.4915,39.5171,-0.00143909],180.559,true,true],
     ["Land_Mil_WallBig_4m_F",[39.6497,38.8247,-0.00143909],180.607,true,true],
     ["Land_Mil_WallBig_4m_F",[54.2034,38.7107,-0.00143909],181.636,true,true],
     ["Land_Mil_WallBig_4m_F",[30.2043,39.4126,-0.00143909],183.852,true,true],
     ["Land_CncWall4_F",[43.2561,29.1914,-0.00143909],269.364,true,true],
     ["Land_CncWall4_F",[43.2688,33.1768,-0.00143909],271.356,true,true],
     ["Land_FuelStation_02_workshop_F",[76.0867,-79.1956,-0.00143909],0,true,true],
     ["Land_FuelStation_02_pump_F",[85.7585,-90.7917,0.283561],0,true,true],
     ["Land_Mil_WallBig_4m_F",[55.2029,-71.9141,-0.00143909],301.646,true,true],
     ["Land_CncBarrierMedium4_F",[63.2322,-79.2183,-0.00143909],0,true,true],
     ["Land_CncBarrierMedium4_F",[67.1223,-90.1548,-0.00143909],268.364,true,true],
     ["Land_CncBarrierMedium4_F",[57.0212,-76.5386,-0.00143909],227.033,true,true],
     ["Land_CncBarrierMedium4_F",[66.9114,-82.8267,-0.00143909],269.101,true,true],
     ["Land_HaulTruck_01_abandoned_F",[62.9519,-61.5913,-0.00143909],0,true,true],
     ["Land_dp_smallFactory_F",[65.3167,-39.0195,-0.00143909],269.426,true,true],
     ["Land_Mil_WallBig_4m_F",[77.761,-69.821,-0.00143909],359.434,true,true],
     ["Land_Mil_WallBig_4m_F",[81.6306,-69.7976,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[85.4851,-69.7607,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[56.3547,-68.3474,-0.00143909],269.589,true,true],
     ["Land_CncWall4_F",[58.8967,-50.2258,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[73.114,-69.9243,-0.00143909],358.188,true,true],
     ["Land_CncWall4_F",[70.8757,-67.8301,-0.00143909],89.4653,true,true],
     ["Land_CncWall4_F",[82.8904,-46.2607,-0.00143909],359.942,true,true],
     ["Land_CncWall4_F",[70.676,-57.4424,-0.00143909],89.3567,true,true],
     ["Land_CncWall4_F",[56.1536,-53.5227,-0.00143909],270.031,true,true],
     ["Land_CncWall4_F",[75.0486,-50.0579,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[56.1086,-58.6951,-0.00143909],270.559,true,true],
     ["Land_CncWall4_F",[56.0569,-63.8562,-0.00143909],270.677,true,true],
     ["Land_CncWall4_F",[77.739,-46.2271,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[70.7776,-62.6362,-0.00143909],88.5215,true,true],
     ["Land_CncWall4_F",[71.7937,-25.135,-0.00143909],269.97,true,true],
     ["Land_CncWall4_F",[82.5583,-24.5293,-0.00143909],359.566,true,true],
     ["Land_MobileCrane_01_hook_F",[66.5007,1.50269,-0.00143909],180.212,true,true],
     ["Land_Mil_WallBig_4m_F",[84.9871,38.4023,-0.00143909],180.102,true,true],
     ["Land_Mil_WallBig_4m_F",[77.3025,38.4841,-0.00143909],180.867,true,true],
     ["Land_Mil_WallBig_4m_F",[65.8308,38.5754,-0.00143909],180.422,true,true],
     ["Land_Mil_WallBig_4m_F",[81.1663,38.3958,-0.00143909],179.854,true,true],
     ["Land_Mil_WallBig_4m_F",[61.9387,38.6233,-0.00143909],180.4,true,true],
     ["Land_Mil_WallBig_4m_F",[73.4739,38.4922,-0.00143909],180.548,true,true],
     ["Land_Mil_WallBig_4m_F",[58.0447,38.6448,-0.00143909],181.262,true,true],
     ["Land_Mil_WallBig_4m_F",[69.6365,38.5254,-0.00143909],181.242,true,true],
     ["Land_FuelStation_02_pump_F",[89.5042,-90.8567,0.283562],0,true,true],
     ["Land_FuelStation_02_pump_F",[87.7141,-90.8413,0.283562],0,true,true],
     ["Land_FuelStation_02_roof_F",[87.679,-90.8042,-0.00143909],0,true,true],
     ["Land_i_Stone_HouseSmall_V2_F",[90.5725,-56.283,-0.00143909],156.696,true,true],
     ["Land_Mil_WallBig_4m_F",[100.975,-69.8276,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[106.496,-64.0249,-0.00143909],267.43,true,true],
     ["Land_Mil_WallBig_4m_F",[104.815,-69.7993,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[106.515,-67.8875,-0.00143909],270.727,true,true],
     ["Land_Mil_WallBig_4m_F",[97.0959,-69.7969,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[93.2571,-69.8044,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[89.406,-69.7959,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[106.4,-60.1755,-0.00143909],269.062,true,true],
     ["Land_Mil_WallBig_4m_F",[106.326,-56.325,-0.00143909],267.987,true,true],
     ["Land_Mil_WallBig_4m_F",[106.219,-52.4221,-0.00143909],268.201,true,true],
     ["Land_Mil_WallBig_4m_F",[106.111,-48.6047,-0.00143909],269.759,true,true],
     ["Land_Mil_WallBig_4m_F",[106.033,-44.7388,-0.00143909],268.547,true,true],
     ["Land_Mil_WallBig_4m_F",[105.948,-40.8303,-0.00143909],268.68,true,true],
     ["Land_CncWall4_F",[98.4236,-46.2131,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[103.595,-46.2366,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[93.2253,-46.2332,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[88.051,-46.2412,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[105.816,-25.3701,-0.00143909],269.477,true,true],
     ["Land_Mil_WallBig_4m_F",[105.779,-17.6262,-0.00143909],268.733,true,true],
     ["Land_Mil_WallBig_4m_F",[105.804,-21.5227,-0.00143909],270.373,true,true],
     ["Land_Mil_WallBig_4m_F",[105.87,-36.9236,-0.00143909],268.997,true,true],
     ["Land_Mil_WallBig_4m_F",[105.725,-9.91504,-0.00143909],269.514,true,true],
     ["Land_Mil_WallBig_4m_F",[105.74,-13.781,-0.00143909],269.451,true,true],
     ["Land_Mil_WallBig_4m_F",[105.813,-29.2317,-0.00143909],271.015,true,true],
     ["Land_Mil_WallBig_4m_F",[105.81,-33.0771,-0.00143909],268.423,true,true],
     ["Land_CncWall4_F",[93.2327,-24.6128,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[87.7546,-24.5105,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[103.336,-24.499,-0.00143909],0,true,true],
     ["Land_CncWall4_F",[98.157,-24.5168,-0.00143909],0,true,true],
     ["Land_Mil_WallBig_4m_F",[105.958,17.1277,-0.00143909],270.902,true,true],
     ["Land_Mil_WallBig_4m_F",[105.826,1.69678,-0.00143909],269.728,true,true],
     ["Land_Mil_WallBig_4m_F",[105.907,13.2976,-0.00143909],270.146,true,true],
     ["Land_Mil_WallBig_4m_F",[105.786,-2.146,-0.00143909],269.827,true,true],
     ["Land_Mil_WallBig_4m_F",[105.837,9.40601,-0.00143909],270.501,true,true],
     ["Land_Mil_WallBig_4m_F",[105.849,5.54126,-0.00143909],269.744,true,true],
     ["Land_Mil_WallBig_4m_F",[106.08,20.9805,-0.00143909],271.554,true,true],
     ["Land_Mil_WallBig_4m_F",[105.74,-6.04346,-0.00143909],270.449,true,true],
     ["Land_Mil_WallBig_4m_F",[106.081,24.8704,-0.00143909],269.849,true,true],
     ["Land_Mil_WallBig_4m_F",[106.051,28.7131,-0.00143909],270.76,true,true],
     ["Land_Mil_WallBig_4m_F",[100.443,38.1624,-0.00143909],180.17,true,true],
     ["Land_Mil_WallBig_4m_F",[106.098,36.4336,-0.00143909],269.107,true,true],
     ["Land_Mil_WallBig_4m_F",[96.5701,38.1743,-0.00143909],179.915,true,true],
     ["Land_Mil_WallBig_4m_F",[106.109,32.5681,-0.00143909],269.967,true,true],
     ["Land_Mil_WallBig_4m_F",[92.7083,38.2605,-0.00143909],180.966,true,true],
     ["Land_Mil_WallBig_4m_F",[104.322,38.1194,-0.00143909],179.93,true,true],
     ["Land_Mil_WallBig_4m_F",[88.8699,38.3325,-0.00143909],181.016,true,true]
];

_missionLootBoxes = [
     //["Box_FIA_Wps_F",[20.4143,-5.66016,-0.00143909],_crateLoot,_lootCounts,0.000109423],
     //["B_supplyCrate_F",[17.8198,-6.08936,-0.00143909],_crateLoot,_lootCounts,360],
     ["Box_FIA_Ammo_F",[23.3816,-5.58154,-0.00143909],_crateLoot,_lootCounts,0.000104757],
     ["Box_FIA_Support_F",[26.1409,-5.81836,-0.00143909],_crateLoot,_lootCounts,360]
];

_missionLootVehicles = [
];

_missionPatrolVehicles = [
     [selectRandom GMS_AIPatrolVehiclesOrange,[-63.8125,-49.1621,-0.0237918],0.00168037],
     [selectRandom GMS_AIPatrolVehiclesGreen,[-40.9814,84.885,-0.0230246],0.0016978]
     //[selectRandom GMS_tracked_AA_ARMA3,[3.84229,-126.072,-0.0232677],0.00169533],
     //[selectRandom GMS_tracked_APC_ARMA3,[88.3411,-129.767,-0.0238881],0.00167844],
     //[selectRandom GMS_light_AT_ARMA3,[147.447,-71.3848,-0.0238895],0.00165085],
     //[selectRandom GMS_Tanks_ARMA3,[127.943,69.7148,-0.0238514],0.00166813]
];
_submarinePatrolParameters = [
];

_airPatrols = [
];

_missionEmplacedWeapons = [
     ["B_static_AA_F",[0.477783,-44.9006,7.50247],0.110129],
     ["B_static_AT_F",[4.42529,-44.637,1.08487],299.726],
     ["B_HMG_01_high_F",[14.1465,-16.2568,-0.0135579],38.4716],
     ["B_static_AA_F",[40.0945,-44.1187,7.52176],359.535],
     //["B_HMG_01_high_F",[39.2375,-46.1826,-0.0135565],220.639],
     ["B_HMG_01_high_F",[42.5383,-44.104,-0.0135584],142.408],
     //["B_static_AT_F",[34.2683,-44.0796,7.52284],359.944],
     ["B_HMG_01_high_F",[34.7786,20.2935,7.94141],114.285]
];
_missionGroups = [
     /*
     [[-51.2781,2.46313,0.00143909],5,7,"Orange",30,45],
     [[-11.7485,-30.1338,0.00143909],5,7,"Orange",30,45],
     [[-11.9927,0.826416,0.00143909],5,7,"Orange",30,45],
     [[-5.37646,13.8989,0.00143909],5,7,"Orange",30,45],
     [[0.439941,18.3259,0.00143909],5,7,"Orange",30,45],
     [[-6.35693,40.8398,0.00143909],5,7,"Orange",30,45],
     [[9.86279,-1.10864,0.00143909],5,7,"Orange",30,45],
     [[19.6943,15.1899,0.00143909],5,7,"Orange",30,45],
     [[10.9971,12.2664,0.00143909],5,7,"Orange",30,45],
     [[18.1143,45.5303,0.00143909],5,7,"Orange",30,45],
     [[19.3877,25.3489,0.00143909],5,7,"Orange",30,45],
     [[10.3965,54.8899,0.00143909],5,7,"Orange",30,45]
     */
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

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
