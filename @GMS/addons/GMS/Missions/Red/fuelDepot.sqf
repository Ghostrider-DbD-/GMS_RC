/*
Mission Compositions by Ghostrider [GRG] for ghostridergaming
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\GMS_privateVars.sqf";

//diag_log "[GMS] Spawning Red Mission with template = default";
_crateLoot = GMS_BoxLoot_Red;
_lootCounts = GMS_lootCountsRed;
_startMsg = "An enemy fuel depot  was sighted in a nearby sector! Check the Red marker on your map for the location!";
_endMsg = "The Sector at the Red Marker is under survivor control!";
_markerLabel = "";
_markerType = ["ellipse",[250,250],"SOLID"];
_markerColor = "ColorRed";
_markerMissionName = "Depot";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
	["Flag_AAF_F",[4,4,0],0,[false,false]],
	["Land_WaterTank_F",[16.334,1.15234,0],331.984,[false,false]],
	["Land_WaterBarrel_F",[7.45703,10.0078,0],0,[false,false]],
	["Land_FuelStation_Build_F",[13.5215,6.42578,0],241.006,[false,false]],
	["Land_fs_feed_F",[7.96484,3.57227,0],240.674,[true,false]],
	["Land_CinderBlocks_F",[21.541,8.54492,0],0,[false,false]],
	["Land_CinderBlocks_F",[19.9473,11.0273,0],0,[false,false]],
	["Land_CinderBlocks_F",[22.9277,6.02344,0],0,[false,false]],
	["Land_CinderBlocks_F",[24.2715,3.5918,0],0,[false,false]],
	["Land_Coil_F",[-0.964844,11.9844,0],0,[false,false]],
	["Land_Coil_F",[12.6621,20.2852,0],0,[false,false]],
	["Land_Crane_F",[4.0332,-8.58984,-4.76837e-007],0,[false,false]],
	["Land_FieldToilet_F",[19.291,4.62305,0],326.829,[false,false]],
	["Land_IronPipes_F",[-6.21875,7.61719,0],326.426,[false,false]],
	["Land_IronPipes_F",[-14.6699,5.20508,0],326.426,[false,false]],
	["Land_IronPipes_F",[-23.4688,0.197266,0],326.426,[false,false]],
	["Land_Pipes_large_F",[-24.1367,7.82227,0],314.529,[false,false]],
	["Land_Pipes_large_F",[-18.6367,12.6211,0],314.529,[false,false]],
	["Land_Pipes_large_F",[-13.6758,18.3789,0],314.529,[false,false]],
	["Land_CinderBlocks_01_F",[0.570313,6.49023,2.38419e-007],0,[false,false]],
	["Land_CinderBlocks_01_F",[3.63672,0.902344,2.38419e-007],0,[false,false]],
	["Land_CinderBlocks_01_F",[-2.59961,2.11719,2.38419e-007],0,[false,false]],
	["Land_CinderBlocks_01_F",[5.08398,-3.11719,2.38419e-007],0,[false,false]],
	["Land_CinderBlocks_F",[18.0488,13.832,0],0,[false,false]],		
	["Land_BagFence_Long_F",[30.0352,-6.17773,0],94.1174,[false,false]],
	["Land_BagFence_Long_F",[29.6074,-2.18164,0],256.414,[false,false]],
	["Land_BagFence_Long_F",[28.0918,1.85547,0],64.7377,[false,false]],
	["Land_BagFence_Long_F",[26.2598,5.32422,0],237.729,[false,false]],
	["Land_ScrapHeap_1_F",[22.0371,-11.125,0],0,[false,false]],
	["Land_ScrapHeap_1_F",[-2.50586,27.8926,0],0,[false,false]],
	["Land_i_Barracks_V1_F",[16.5938,-34.9785,0],324.783,[false,false]],
	["Land_BagBunker_Large_F",[4.6543,-6.67969,0],0,[false,false]],
	["Land_BagBunker_Large_F",[-14.3262,-45.0469,0],188.191,[false,false]],
	["Land_Cargo_HQ_V3_F",[-33.2969,-38.0293,0],223.946,[false,false]],
	["Land_Wall_IndCnc_4_D_F",[-33.293,11.6582,0],135.156,[false,false]],
	["Land_ConcreteWall_01_m_8m_F",[-41.6035,-15.7754,0],271.438,[false,false]],
	["Land_ConcreteWall_01_m_8m_F",[-41.9297,-26.2012,0],271.438,[false,false]],
	["Land_ConcreteWall_01_m_8m_F",[-41.6582,-25.8945,0],271.438,[false,false]],
	["Land_ConcreteWall_01_m_8m_F",[-40.9336,-5.78906,0],271.438,[false,false]],
	["Land_ConcreteWall_01_m_8m_F",[-38.4297,3.92773,0],115.41,[false,false]]
]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = [
	//["I_C_Van_01_transport_brown_F",[8.09375,13.6113,0.000131369],233.88,_crateLoot,_lootCounts,0],
	//["I_C_Van_01_transport_olive_F",[5.44531,17.5313,0.000131369],234.719,_crateLoot,_lootCounts,0],
	//["Exile_Car_Ural_Open_Blue",[20.4961,-1.33398,-2.38419e-007],61.0105,_crateLoot,_lootCounts,0]
]; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = []; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used
_minNoAI = GMS_MinAI_Red;
_maxNoAI = GMS_MaxAI_Red;
_noAIGroups = GMS_AIGrps_Red;
_noVehiclePatrols = GMS_SpawnVeh_Red;
_noEmplacedWeapons = GMS_SpawnEmplaced_Red;

#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf"; 
