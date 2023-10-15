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
_crateLoot = GMS_BoxLoot_Orange;
_lootCounts = GMS_lootCountsOrange;
_startMsg = "A weapons research facility has been located. Strike authorized!!";
_endMsg = "The weapons research facility has been neutralized.";
_markerLabel = "";
_markerType = ["ellipse",[350,350],"SOLID"];
_markerColor = "ColorWhite";
_markerMissionName = "Research Center";
_missionLandscapeMode = "precise"; // acceptable values are "none","random","precise"
_missionLandscape = [
		["Land_TentHangar_V1_F",[0.0742188,75.9746,0],0,[false,false]],
		["Land_Dome_Big_F",[-1.35742,-8.57422,-7.15256e-006],0,[true,false]],
		["Land_TentHangar_V1_F",[-0.0664063,59.8516,0],180.836,[false,false]],
		["Land_TentHangar_V1_F",[-0.248047,42.0469,0],180.836,[false,false]],
		["Land_TentHangar_V1_F",[-0.462891,24.5547,-7.62939e-006],180.836,[false,false]],
		["Land_PaperBox_closed_F",[-8.71875,78.1113,-7.62939e-006],0,[false,false]],
		["Land_PaperBox_closed_F",[-9.14844,43.7402,0],0,[false,false]],
		["Land_PaperBox_closed_F",[8.96875,60.4375,0],0,[false,false]],
		["CargoNet_01_box_F",[-8.39844,64.4258,-7.62939e-006],0,[false,false]],
		["Land_Mil_ConcreteWall_F",[-7.74609,33.7598,0],0,[false,false]],
		["Land_Mil_ConcreteWall_F",[6.89453,33.5098,0],0,[false,false]],
		["Land_Mil_ConcreteWall_F",[-7.77734,51.2422,0],0,[false,false]],
		["Land_Mil_ConcreteWall_F",[7.5293,51.125,0],0,[false,false]],
		["Land_Mil_ConcreteWall_F",[7.80469,69.0371,0],0,[false,false]],
		["Land_Mil_ConcreteWall_F",[-7.76563,69.2305,0],0,[false,false]],
		["Land_Mil_ConcreteWall_F",[7.87695,85.3516,0],0,[false,false]],
		["Land_Mil_ConcreteWall_F",[-7.86328,85.3496,0],0,[false,false]],
		["CargoNet_01_box_F",[9.13477,78.3125,0],0,[false,false]],
		["CargoNet_01_box_F",[8.79297,42.9746,0],0,[false,false]],
		["Land_BagBunker_Small_F",[6.47266,23.8809,0],0,[false,false]],
		["Land_BagBunker_Small_F",[-8.06641,23.8867,0],0,[false,false]],
		["Land_BarGate_01_open_F",[-0.945313,26.3809,-7.62939e-006],0,[true,false]],
		["Land_TentHangar_V1_F",[-85.9727,-8.83008,0],269.718,[false,false]],
		["Land_TentHangar_V1_F",[-69.8477,-8.89063,0],90.5538,[false,false]],
		["Land_TentHangar_V1_F",[-52.043,-8.98438,0],90.5538,[false,false]],
		["Land_TentHangar_V1_F",[-34.5488,-9.11328,0],90.5538,[false,false]],
		["Land_PaperBox_closed_F",[-88.0645,-17.6348,0],269.718,[false,false]],
		["Land_PaperBox_closed_F",[-53.6914,-17.8945,-7.62939e-006],269.718,[false,false]],
		["Land_PaperBox_closed_F",[-70.4785,0.140625,0],269.718,[false,false]],
		["CargoNet_01_box_F",[-74.3809,-17.2441,0],269.718,[false,false]],
		["Land_Mil_ConcreteWall_F",[-43.7188,-16.4434,0],269.718,[false,false]],
		["Land_Mil_ConcreteWall_F",[-43.541,-1.80078,0],269.718,[false,false]],
		["Land_Mil_ConcreteWall_F",[-61.1992,-16.5586,0],269.718,[false,false]],
		["Land_Mil_ConcreteWall_F",[-61.1582,-1.25195,0],269.718,[false,false]],
		["Land_Mil_ConcreteWall_F",[-79.0723,-1.06445,0],269.718,[false,false]],
		["Land_Mil_ConcreteWall_F",[-79.1895,-16.6367,0],269.718,[false,false]],
		["Land_Mil_ConcreteWall_F",[-95.3867,-1.07422,0],269.718,[false,false]],
		["Land_Mil_ConcreteWall_F",[-95.3066,-16.8145,0],269.718,[false,false]],
		["CargoNet_01_box_F",[-88.3535,0.21875,0],269.718,[false,false]],
		["CargoNet_01_box_F",[-53.0156,0.0507813,-7.62939e-006],269.718,[false,false]],
		["Land_BagBunker_Small_F",[-33.9102,-2.17578,0],269.718,[false,false]],
		["Land_BagBunker_Small_F",[-33.8438,-16.7148,0],269.718,[false,false]],
		["Land_BarGate_01_open_F",[-36.373,-9.60742,-7.62939e-006],269.718,[true,false]],
		["Land_TentHangar_V1_F",[-60.4355,51.2891,0],315,[false,false]],
		["Land_TentHangar_V1_F",[-49.1348,39.7891,0],135.836,[false,false]],
		["Land_TentHangar_V1_F",[-36.6738,27.0703,0],135.836,[false,false]],
		["Land_TentHangar_V1_F",[-24.457,14.5508,0],135.836,[false,false]],
		["Land_PaperBox_closed_F",[-68.1641,46.582,0],315,[false,false]],
		["Land_PaperBox_closed_F",[-44.1641,21.9746,0],315,[false,false]],
		["Land_PaperBox_closed_F",[-43.1602,46.5918,0],315,[false,false]],
		["CargoNet_01_box_F",[-58.2617,37.1328,0],315,[false,false]],
		["Land_Mil_ConcreteWall_F",[-36.1152,15.9102,0],315,[false,false]],
		["Land_Mil_ConcreteWall_F",[-25.5859,26.0859,-7.62939e-006],315,[false,false]],
		["Land_Mil_ConcreteWall_F",[-48.5,28.25,0],315,[false,false]],
		["Land_Mil_ConcreteWall_F",[-37.5938,38.9902,0],315,[false,false]],
		["Land_Mil_ConcreteWall_F",[-50.0645,51.8496,-7.62939e-006],315,[false,false]],
		["Land_Mil_ConcreteWall_F",[-61.2109,40.9766,0],315,[false,false]],
		["Land_Mil_ConcreteWall_F",[-61.5488,63.4375,0],315,[false,false]],
		["Land_Mil_ConcreteWall_F",[-72.6777,52.3066,0],315,[false,false]],
		["Land_BagBunker_Small_F",[-19.0762,18.9785,0],315,[false,false]],
		["Land_BagBunker_Small_F",[-29.3613,8.70117,0],315,[false,false]],
		["Land_BarGate_01_open_F",[-26.0879,15.5,0],315,[true,false]],
		["Land_TentHangar_V1_F",[-1.01172,-91.8984,0],180,[false,false]],
		["Land_TentHangar_V1_F",[-0.871094,-75.7754,0],0.835817,[false,false]],
		["Land_TentHangar_V1_F",[-0.6875,-57.9688,0],0.835817,[false,false]],
		["Land_TentHangar_V1_F",[-0.474609,-40.4785,0],0.835817,[false,false]],
		["Land_PaperBox_closed_F",[7.78125,-94.0332,0],180,[false,false]],
		["Land_PaperBox_closed_F",[8.21094,-59.6621,0],180,[false,false]],
		["Land_PaperBox_closed_F",[-9.90625,-76.3613,0],180,[false,false]],
		["CargoNet_01_box_F",[7.46094,-80.3496,0],180,[false,false]],
		["Land_Mil_ConcreteWall_F",[6.80859,-49.6836,0],180,[false,false]],
		["Land_Mil_ConcreteWall_F",[-7.83203,-49.4336,0],180,[false,false]],
		["Land_Mil_ConcreteWall_F",[6.83984,-67.166,0],180,[false,false]],
		["Land_Mil_ConcreteWall_F",[-8.4668,-67.0469,0],180,[false,false]],
		["Land_Mil_ConcreteWall_F",[-8.74219,-84.9609,0],180,[false,false]],
		["Land_Mil_ConcreteWall_F",[6.82813,-85.1543,0],180,[false,false]],
		["Land_Mil_ConcreteWall_F",[-8.81445,-101.273,0],180,[false,false]],
		["Land_Mil_ConcreteWall_F",[6.92578,-101.271,0],180,[false,false]],
		["CargoNet_01_box_F",[-10.0723,-94.2344,0],180,[false,false]],
		["CargoNet_01_box_F",[-9.73047,-58.8984,0],180,[false,false]],
		["Land_BagBunker_Small_F",[-7.41016,-39.8027,-7.62939e-006],180,[false,false]],
		["Land_BagBunker_Small_F",[7.12891,-39.8105,-7.62939e-006],180,[false,false]],
		["Land_BarGate_01_open_F",[0.0078125,-42.3047,0],180,[false,false]],
		["Land_TentHangar_V1_F",[-61.5098,-68.0996,0],225,[false,false]],
		["Land_TentHangar_V1_F",[-50.0098,-56.7988,0],45.8358,[false,false]],
		["Land_TentHangar_V1_F",[-37.291,-44.3379,0],45.8358,[false,false]],
		["Land_TentHangar_V1_F",[-24.7715,-32.1211,0],45.8358,[false,false]],
		["Land_PaperBox_closed_F",[-56.8027,-75.8281,0],225,[false,false]],
		["Land_PaperBox_closed_F",[-32.1953,-51.8281,0],225,[false,false]],
		["Land_PaperBox_closed_F",[-56.8125,-50.8242,0],225,[false,false]],
		["CargoNet_01_box_F",[-47.3535,-65.9258,0],225,[false,false]],
		["Land_Mil_ConcreteWall_F",[-26.1289,-43.7793,0],225,[false,false]],
		["Land_Mil_ConcreteWall_F",[-36.3047,-33.25,-7.62939e-006],225,[false,false]],
		["Land_Mil_ConcreteWall_F",[-38.4688,-56.1641,0],225,[false,false]],
		["Land_Mil_ConcreteWall_F",[-49.2109,-45.2578,0],225,[false,false]],
		["Land_Mil_ConcreteWall_F",[-62.0703,-57.7285,0],225,[false,false]],
		["Land_Mil_ConcreteWall_F",[-51.1973,-68.875,0],225,[false,false]],
		["Land_Mil_ConcreteWall_F",[-73.6582,-69.2129,0],225,[false,false]],
		["Land_Mil_ConcreteWall_F",[-62.5273,-80.3418,0],225,[false,false]],
		["CargoNet_01_box_F",[-69.5703,-63.3457,0],225,[false,false]],
		["CargoNet_01_box_F",[-44.3398,-38.5996,-7.62939e-006],225,[false,false]],
		["Land_BagBunker_Small_F",[-29.1992,-26.7402,0],225,[false,false]],
		["Land_BagBunker_Small_F",[-18.9219,-37.0254,0],225,[false,false]],
		["Land_BarGate_01_open_F",[-25.7207,-33.7539,0],225,[true,false]],
		["Land_TentHangar_V1_F",[84.623,-9.68555,0],90,[false,false]],
		["Land_TentHangar_V1_F",[68.5,-9.54492,0],270.836,[false,false]],
		["Land_TentHangar_V1_F",[50.6953,-9.36328,0],270.836,[false,false]],
		["Land_TentHangar_V1_F",[33.2031,-9.14844,0],270.836,[false,false]],
		["Land_PaperBox_closed_F",[86.7598,-0.892578,0],90,[false,false]],
		["Land_PaperBox_closed_F",[52.3887,-0.462891,0],90,[false,false]],
		["Land_PaperBox_closed_F",[69.0859,-18.5801,0],90,[false,false]],
		["CargoNet_01_box_F",[73.0742,-1.21289,0],90,[false,false]],
		["Land_Mil_ConcreteWall_F",[42.4082,-1.86523,0],90,[false,false]],
		["Land_Mil_ConcreteWall_F",[42.1582,-16.5059,0],90,[false,false]],
		["Land_Mil_ConcreteWall_F",[59.8906,-1.83398,0],90,[false,false]],
		["Land_Mil_ConcreteWall_F",[59.7734,-17.1406,0],90,[false,false]],
		["Land_Mil_ConcreteWall_F",[77.6855,-17.416,0],90,[false,false]],
		["Land_Mil_ConcreteWall_F",[77.8789,-1.8457,0],90,[false,false]],
		["Land_Mil_ConcreteWall_F",[94,-17.4883,0],90,[false,false]],
		["Land_Mil_ConcreteWall_F",[93.998,-1.74805,0],90,[false,false]],
		["CargoNet_01_box_F",[86.9609,-18.7461,0],90,[false,false]],
		["CargoNet_01_box_F",[51.623,-18.4043,0],90,[false,false]],
		["Land_BagBunker_Small_F",[32.5293,-16.084,0],90,[false,false]],
		["Land_BagBunker_Small_F",[32.5352,-1.54492,0],90,[false,false]],
		["Land_BarGate_01_open_F",[35.0293,-8.66602,0],90,[true,false]],
		["Land_TentHangar_V1_F",[47.9863,39.2109,0],225.836,[false,false]],
		["Land_TentHangar_V1_F",[35.2676,26.75,0],225.836,[false,false]],
		["Land_TentHangar_V1_F",[22.748,14.5332,0],225.836,[false,false]],
		["Land_PaperBox_closed_F",[54.7793,58.2402,0],45,[false,false]],
		["Land_PaperBox_closed_F",[30.1719,34.2402,0],45,[false,false]],
		["Land_PaperBox_closed_F",[54.7891,33.2363,0],45,[false,false]],
		["CargoNet_01_box_F",[45.3301,48.3379,0],45,[false,false]],
		["Land_Mil_ConcreteWall_F",[24.1074,26.1914,0],45,[false,false]],
		["Land_Mil_ConcreteWall_F",[34.2832,15.6621,0],45,[false,false]],
		["Land_Mil_ConcreteWall_F",[36.4473,38.5762,0],45,[false,false]],
		["Land_Mil_ConcreteWall_F",[47.1875,27.6699,0],45,[false,false]],
		["Land_Mil_ConcreteWall_F",[60.0469,40.1406,0],45,[false,false]],
		["Land_Mil_ConcreteWall_F",[49.1738,51.2871,0],45,[false,false]],
		["Land_Mil_ConcreteWall_F",[71.6348,51.625,0],45,[false,false]],
		["Land_Mil_ConcreteWall_F",[60.5039,62.7539,0],45,[false,false]],
		["Land_BagBunker_Small_F",[27.1758,9.15234,0],45,[false,false]],
		["Land_BagBunker_Small_F",[16.8984,19.4375,0],45,[false,false]],
		["Land_BarGate_01_open_F",[23.6973,16.1641,0],45,[true,false]],
		["Land_TentHangar_V1_F",[59.8828,-69.1582,0],135,[false,false]],
		["Land_TentHangar_V1_F",[48.582,-57.6582,0],315.836,[false,false]],
		["Land_TentHangar_V1_F",[36.1211,-44.9395,0],315.836,[false,false]],
		["Land_TentHangar_V1_F",[23.9043,-32.4199,-7.62939e-006],315.836,[false,false]],
		["Land_PaperBox_closed_F",[67.6113,-64.4512,0],135,[false,false]],
		["Land_PaperBox_closed_F",[43.6113,-39.8438,0],135,[false,false]],
		["Land_PaperBox_closed_F",[42.6074,-64.4609,0],135,[false,false]],
		["CargoNet_01_box_F",[57.709,-55.002,0],135,[false,false]],
		["Land_Mil_ConcreteWall_F",[35.5625,-33.7773,0],135,[false,false]],
		["Land_Mil_ConcreteWall_F",[25.0332,-43.9531,-7.62939e-006],135,[false,false]],
		["Land_Mil_ConcreteWall_F",[47.9473,-46.1172,0],135,[false,false]],
		["Land_Mil_ConcreteWall_F",[37.041,-56.8594,0],135,[false,false]],
		["Land_Mil_ConcreteWall_F",[49.5117,-69.7188,0],135,[false,false]],
		["Land_Mil_ConcreteWall_F",[60.6582,-58.8457,0],135,[false,false]],
		["Land_Mil_ConcreteWall_F",[60.9961,-81.3066,0],135,[false,false]],
		["Land_Mil_ConcreteWall_F",[72.125,-70.1758,0],135,[false,false]],
		["CargoNet_01_box_F",[55.1289,-77.2188,0],135,[false,false]],
		["CargoNet_01_box_F",[30.3828,-51.9883,0],135,[false,false]],
		["Land_BagBunker_Small_F",[18.5234,-36.8477,-7.62939e-006],135,[false,false]],
		["Land_BagBunker_Small_F",[28.8086,-26.5703,0],135,[false,false]],
		["Land_BarGate_01_open_F",[25.5371,-33.3691,-7.62939e-006],135,[false,false]],
		["Land_Research_house_V1_F",[14.6934,-20.2344,0],305.744,[false,false]],
		["Land_Research_house_V1_F",[17.6934,-13.2344,0],279.063,[false,false]],
		["Land_Research_house_V1_F",[8.69336,-25.2344,0],331.05,[false,false]],
		["Land_Pallets_stack_F",[-16.6465,5.51758,0],128.201,[false,false]],
		["Land_Pallets_stack_F",[-14.2695,3.6875,0],128.201,[false,false]],
		["Land_Pallets_stack_F",[-11.8926,1.85742,0],128.201,[false,false]],
		["Land_Missle_Trolley_02_F",[-14.8145,7.89453,-7.62939e-006],37.6118,[false,false]],
		["Land_Missle_Trolley_02_F",[-13.2305,6.67383,-7.62939e-006],37.6118,[false,false]],
		["Land_Missle_Trolley_02_F",[-11.6465,5.45313,0],37.6118,[false,false]],
		["Land_Missle_Trolley_02_F",[-10.0625,4.23242,0],37.6118,[false,false]],
		["Land_Bomb_Trolley_01_F",[-18.4766,3.14258,-7.62939e-006],37.6118,[false,false]],
		["Land_Bomb_Trolley_01_F",[-16.8926,1.92188,0],37.6118,[false,false]],
		["Land_Bomb_Trolley_01_F",[-15.3086,0.701172,0],37.6118,[false,false]],
		["Land_Bomb_Trolley_01_F",[-13.7246,-0.519531,0],37.6118,[false,false]],
		["Land_Limestone_01_apart_F",[-79.373,26.5801,0],0,[false,false]],
		["Land_Limestone_01_apart_F",[-30.4473,72.3594,-7.62939e-006],0,[false,false]],
		["Land_Limestone_01_apart_F",[31.6953,72.8027,0],0,[false,false]],
		["Land_Limestone_01_apart_F",[81.9727,26.3945,0],0,[false,false]],
		["Land_Limestone_01_apart_F",[81.6934,-42.2344,0],0,[false,false]],
		["Land_Limestone_01_apart_F",[28.2871,-90.7949,0],0,[false,false]],
		["Land_Limestone_01_apart_F",[-42.0684,-90.1152,0],0,[false,false]],
		["Land_Limestone_01_apart_F",[-86.3066,-40.2344,0],0,[false,false]],
		["Land_Research_house_V1_F",[8.69336,6.76563,0],210,[true,false]],
		["Land_Research_house_V1_F",[17.6934,-5.23438,0],256.382,[true,false]],
		["Land_Research_house_V1_F",[14.6934,1.76563,0],229.931,[true,false]],
		["Land_Pallets_stack_F",[-20.3066,0.765625,0],128.201,[false,false]],
		["Land_Pallets_stack_F",[-17.9316,-1.06445,-7.62939e-006],128.201,[false,false]],
		["Land_Pallets_stack_F",[-15.5547,-2.89648,0],128.201,[false,false]],
		["Land_Pallets_stack_F",[-12.6465,10.5176,0],128.201,[false,false]],
		["Land_Pallets_stack_F",[-10.2695,8.6875,0],128.201,[false,false]],
		["Land_Pallets_stack_F",[-7.89258,6.85742,-7.62939e-006],128.201,[false,false]],
		["Land_Pallets_stack_F",[-15.3223,-23.4551,0],42.837,[false,false]],
		["Land_Pallets_stack_F",[-13.3066,-21.2344,0],42.837,[false,false]],
		["Land_Pallets_stack_F",[-11.291,-19.0137,0],42.837,[false,false]],
		["Land_Missle_Trolley_02_F",[-17.5449,-21.4375,0],312.248,[false,false]],
		["Land_Missle_Trolley_02_F",[-16.1992,-19.957,0],312.248,[false,false]],
		["Land_Missle_Trolley_02_F",[-14.8535,-18.4766,-7.62939e-006],312.248,[false,false]],
		["Land_Missle_Trolley_02_F",[-13.5098,-16.9961,-7.62939e-006],312.248,[false,false]],
		["Land_Bomb_Trolley_01_F",[-13.1035,-25.4727,0],312.248,[false,false]],
		["Land_Bomb_Trolley_01_F",[-11.7598,-23.9922,0],312.248,[false,false]],
		["Land_Bomb_Trolley_01_F",[-10.4141,-22.5117,-7.62939e-006],312.248,[false,false]],
		["Land_Bomb_Trolley_01_F",[-9.06836,-21.0313,0],312.248,[false,false]],
		["Land_Pallets_stack_F",[-10.8828,-27.4883,0],42.837,[false,false]],
		["Land_Pallets_stack_F",[-8.86719,-25.2695,0],42.837,[false,false]],
		["Land_Pallets_stack_F",[-6.84766,-23.0469,0],42.837,[false,false]],
		["Land_Pallets_stack_F",[-19.9824,-19.0645,0],42.837,[false,false]],
		["Land_Pallets_stack_F",[-17.9668,-16.8438,0],42.837,[false,false]],
		["Land_Pallets_stack_F",[-15.9512,-14.6211,0],42.837,[false,false]]
]; // list of objects to spawn as landscape
_missionLootBoxes = [];  //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionLootVehicles = []; //  Parameters are "Box Item Code", array defining the loot to be spawned, and position.
_missionEmplacedWeapons = 
	[	
     ["I_HMG_01_high_F",[-81.582,-85.3574,4.34404],200.653],
     ["I_HMG_01_high_F",[-83.5313,-83.3965,4.34404],245.993],
     ["I_HMG_01_high_F",[-80.2012,80.7539,4.34404],0],
     ["I_HMG_01_high_F",[-82.4883,78.7695,4.34404],288.905],
     ["B_GMG_01_A_F",[-27.2188,-65.0156,3.12658],0],
      ["B_GMG_01_high_F",[20.1133,60.8809,3.12651],0],
     ["I_HMG_01_high_F",[83.8516,-82.3105,4.34404],112.633],
     ["I_HMG_01_high_F",[81.6035,-84.8262,4.34404],155.597],
     ["I_HMG_01_high_F",[80.8594,81.623,4.34404],27.6525],
     ["I_HMG_01_high_F",[82.9082,79.2539,4.34404],72.8313]
	]; // can be used to define the precise placement of static weapons [[1,2,3] /*loc 1*/, [2,3,4] /*loc 2*/]; if blank random locations will be used

_missionGroups = 
	[
	//_x params["_position","_minAI","_maxAI","_skillLevel","_minPatrolRadius","_maxPatrolRadius"];
	[[-98.9121,-35.9824,-1.20243],5,7,"Green",5,12],
	[[-99.2305,-33.0215,-0.941586],5,7,"Green",5,12],
	[[42.5605,-42.4043,-0.00143886],5,7,"Green",5,12],
	[[-4.61133,-1.5918,-0.001438863],5,7,"Green",5,12],
	[[41.3438,41.8477,-0.00143886],5,7,"Green",5,12],
	[[59.5547,-0.470703,-0.00143886],5,7,"Green",5,12],
	[[-43.4141,-42.166,-0.00143886],5,7,"Green",5,12],
	[[-0.455078,-58.2168,-0.00143886],5,7,"Green",5,12],
	[[-43.1605,121.8047,-0.00143886],5,7,"Green",5,12],
	[[-60.9473,-0.652344,-0.00143886],5,7,"Green",5,12],	
	[[-0.529297,59.5645,-0.00143886],5,7,"Green",5,12]
	]; // Can be used to define spawn positions of AI patrols

_missionPatrolVehicles = [
	[selectRandom GMS_AIPatrolVehiclesGreen,[92.6699,40.4102,0.000393867],0,[true,false]],
	[selectRandom GMS_AIPatrolVehiclesGreen,[92.6133,40.377,0.000393867],0,[true,false]],
	[selectRandom GMS_AIPatrolVehiclesGreen,[-99.3867,-35.623,0.000393867],0,[true,false]]
	//[selectRandom GMS_AIPatrolVehiclesGreen,[-87.8457,-109.947,7.15256e-007],0,[true,false]]
];  // can be used to define the spawn positions of vehicle patrols

//  Change _useMines to true/false below to enable mission-specific settings.
_useMines = GMS_useMines;
_minNoAI = GMS_MinAI_Green;
_maxNoAI = GMS_MaxAI_Green;
_noAIGroups = GMS_AIGrps_Green;
_noVehiclePatrols = GMS_SpawnVeh_Green;
_noEmplacedWeapons = GMS_SpawnEmplaced_Green;
_uniforms = GMS_SkinList;
_headgear = GMS_headgear;

/*
Need to spawn crates INSIDE the dome
*/
//_chancePara = GMS_chanceParaGreen;
_spawnCratesTiming = "atMissionSpawnGround"; // Choices: "atMissionSpawnGround","atMissionEndGround","atMissionEndAir". 
//_loadCratesTiming = "atMissionSpawn"; // valid choices are "atMissionCompletion" and "atMissionSpawn"; 
//_chanceLoot = 0.6; 
private _lootIndex = selectRandom[1,2,3,4];
private _paralootChoices = [GMS_contructionLoot,GMS_contructionLoot,GMS_highPoweredLoot,GMS_supportLoot];
private _paralootCountsChoices = [[0,0,0,8,8,0],[0,0,0,8,8,0],[8,8,0,0,0,0],[0,0,0,0,12,0]];
_paraLoot = _paralootChoices select _lootIndex;
_paraLootCounts = _paralootCountsChoices select _lootIndex;  // Throw in something more exotic than found at a normal blue mission.
 
#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";
