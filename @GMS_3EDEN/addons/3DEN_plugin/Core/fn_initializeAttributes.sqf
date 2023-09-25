/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

GMS_difficulty = getText(configFile >> "CfgGMS3DEN"  >> "CfgDefaults" >> "defaultMissionDifficulty");
diag_log format["configs returned defaultMissionDifficulty = %1",GMS_difficulty];
GMS_chanceMissionSpawned = 1.0; 
diag_log format["GMS_chanceMissionSpawned set to default setting of 100%"];
GMS_lootcrateSpawnTiming = getText(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "defaultLootcrateSpawnTiming");
diag_log format["configs returned defaultLootcrateSpawnTiming = %1",GMS_lootcrateSpawnTiming];
GMS_lootcrateLoadTiming = getText(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "defaultLootcrateLoadTiming");
diag_log format["configs returned defaultLootcrateLoadTiming = %1",GMS_lootcrateLoadTiming];
GMS_missionEndState = getText(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "defaultMissionEndState");
diag_log format["configs returned defaultMissionEndState = %1",GMS_missionEndState];
GMS_startMessage = "TODO: Add a start message";
GMS_endMessage = "TODO: Add an end message";
GMS_missionLocations = "random";
gms3DENGarrisonTexture =  getText(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "colorGarrisonObject");
diag_log format["configs returned %1 as the color for garrisoned objects",gms3DENGarrisonTexture];
gms3DENlootVehicleTexture = getText(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "colorLootObject");
diag_log format["configs returned %1 as the color for loot objects such as vehicles",gms3DENlootVehicleTexture];
diag_log format["Mission Attributes Initialized for GMS at time %1",diag_tickTime];