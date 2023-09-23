

class ctrlMenuStrip;
class display3DEN
{
	class Controls
	{
		class MenuStrip: ctrlMenuStrip
		{
			class Items
			{
				// Additions to the menu strip to export missions and seek help 
				// ************************************************************
				items[] += {"GMS_configure","GMS_export","GMS_support"};

				/*
					The menu for exporting missions is defined here
				*/
                class GMS_export {
                    items[]= {
                        "GMS_exportDynamic"
                    };
                    text = "Export Mission";
                    toolTip = "Export GMS Missions";
                };
                class GMS_exportDynamic {
                    text = "Export Mission";
                    //toolTip = "Export Dynamic Mission";
					action = "call gms3DEN_fnc_exportDynamic";
					picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\save_ca.paa";
                };

				/*
					menus for those seeking support are here 
				*/
                class GMS_support {
                    items[] = {
                        "GMS_help",
                        "GMS_about"
                    };
                    text = "Plugin Support";
                };
                class GMS_help {
					text = "Help";
					action = "call gms3DEN_fnc_Help";
					//picture = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\save_ca.paa";
                };
                class GMS_about {
					text = "3EDEN Plugin Version 1.0 for GMS by Ghostrider-GRG-";
					action = "call blck3EDEN_fnc_about";
                };


				/*  
					All menus for configuring a GMS mission are defined here 
				*/             

                class GMS_configure {
                    items[] = {
					  "GMS_difficulty",
                      "GMS_crateSpawn",
                      "GMS_lootSpawn",
                      "GMS_location_Respawns",
                      "GMS_MissionCompletionMode"
					  //"GMS_editMissionSettings"
                    };
                    text = "Configure Mission";
                    toolTip = "Adjust Mission Settings";
                };

                class GMS_difficulty {
                    text = "Difficulty";
                    toolTip = "Set Mission Difficulty";
                    items[] = {
                        "GMS_difficultyBlue", 
                        "GMS_difficultyRed",  
                        "GMS_difficultyGreen",
                        "GMS_difficultyOrange"
                    };
                };
                class GMS_difficultyBlue 
				{
					text = "Set Mission Difficutly to EASY (Blue)";
					action = "['Blue'] call gms3DEN_fnc_setDifficulty;";
					value = GMS_blue;
				};
				class GMS_difficultyRed 
				{
					text = "Set Mission Difficulty to MEDIUM (Red)";
					action = "['Red'] call gms3DEN_fnc_setDifficulty;";
					value = GMS_red;
				};
				class GMS_difficultyGreen 
				{
					text = "Set Mission Difficult To HARD (Green)";
					action =  "['Green'] call gms3DEN_fnc_setDifficulty;";
					value = GMS_green;
				};
				class GMS_difficultyOrange 
				{
					text = "Set Mission Difficulty to Very HARD (Orange)";
					action =  "['Orange'] call gms3DEN_fnc_setDifficulty;";
					value = GMS_orange;
				};	

				class GMS_MissionCompletionMode 
				{
					text = "Set the Criterial for Mission Completion";
					items[] = {
						"GMS_playerNear",
						"GMS_allUnitsKilled",
						"GMS_allKilledOrPlayerNear",
						"GMS_assetSecured"
					};
				};
				class GMS_allUnitsKilled 
				{
					text = "All AI Dead";
					toolTip = "Mission is complete only when All AI are Dead";
					action = "['allUnitsKilled'] call gms3DEN_fnc_setCompletionMode;";
					value = allUnitsKilled;
				};
				class GMS_playerNear 
				{
					text = "Player near mission center";
					toolTip = "MIssion is Complete when a player reaches the mission center";
					action = "['playerNear'] call gms3DEN_fnc_setCompletionMode;";
					value = playerNear;
				};
				class GMS_allKilledOrPlayerNear 
				{
					text = "Units Dead / Player @ Center";
					toolTip = "Mission is Complete when all units are dead or a player reaches mission center";
					action = "['allKilledOrPlayerNear'] call gms3DEN_fnc_setCompletionMode;";
					value = allKilledOrPlayerNear;
				};
				class GMS_assetSecured 
				{
					text = "Asset Secured";
					toolTip = "Mission is Complete when the asset is secured";
					action = "[assetSecured] call gms3DEN_fnc_setCompletionMode;";
					value = allKilledOrPlayerNear;
				};				
				class GMS_location_Respawns
				{
					text = "Set Mission Spawns (static vs random)";
					//action = "edit3DENMissionAttributes 'setAsStaticMission'";
					items[] = {
						"GMS_dynamicMission",
						"GMS_staticMission"
					};
				};
				class GMS_dynamicMission 
				{
					text = "Configure as Dynamic Mission";
					action = "['dynamic'] call gms3DEN_fnc_setSpawnLocations";
				};
				class GMS_staticMission 
				{
					text = "Configure Static Mission";
					action = "['static'] call gms3DEN_fnc_setSpawnLocations";
				};
                class GMS_crateSpawn {
                    text = "Set When Crates Spawn";
                    toolTip = "Set when crates are spawned";
					items[] = {
						"GMS_atMissionSpawnGround",
						"GMS_atMissionSpawnAir",
						"GMS_atMissionEndGround",
						"GMS_atMissionEndAir"
					};                    
                };
                class GMS_atMissionSpawnGround 
				{
					text = "At Spawn Ground";
                    toolTip = "Crates are spawned on the ground at mission startup";
					action = "['atMissionSpawnGround'] call gms3DEN_fnc_spawnCratesTiming;";
				};
				class GMS_atMissionSpawnAir 
				{
					text = "At Spawn Air";
                    toolTip = "Crates are spawned in the air at mission startup";
					action = "['atMissionSpawnAir'] call gms3DEN_fnc_spawnCratesTiming;";
				};				
				class GMS_atMissionEndGround 
				{
					text = "At End Ground";
                    toolTip = "Crates are spawned on the ground at mission completion";
					action = "['atMissionEndGround'] call gms3DEN_fnc_spawnCratesTiming;";
				};	
				class GMS_atMissionEndAir 
				{
					text = "At End Air";
                    toodTip = "Crates are spawned in the air at mission completion";
					action = "['atMissionEndAir'] call gms3DEN_fnc_spawnCratesTiming;";
				};	

                class GMS_lootSpawn {
					text = "Set timing for loading crates";
					items[] = {
						"GMS_atMissionSpawn",
						"GMS_atMissionCompletion"
					};
                };
				class GMS_atMissionSpawn 
				{
                    text = "At Spawn";
					toolTip = "Load crates when the mission spawns";
					action = "['atMissionSpawn'] call gms3DEN_fnc_setLoadCratesTiming";
				};
				class GMS_atMissionCompletion 
				{
					text = "At Completion";
                    toolTip = "Load crates when the mission is complete";
					action = "['atMissionCompletion'] call gms3DEN_fnc_setLoadCratesTiming";
				};
                
                class GMS_static {
                    text = "Set if Mission is Static/Dynamic";
                    toolTip = "Toggle between static and random mission locations";
                    items[] = {
                        "GMS_setToDynamic",
                        "GMS_setToStatic"
                    };
                };
                class GMS_setToDynamic {
                    text = "Dynamic";
                    toolType = "Set mission to be spawned at random location";
                    action = "['dynamic'] call gms3DEN_fnc_toggleStaticSpawns";
                };
                class GMS_setToStatic {
                    text = "Static";
                    toolTip = "Set mission to respawn at the same location each time";
                    action = "['static'] call gms3DEN_fnc_toggleStaticSpawns";
                };			
            };
		};
	};
};