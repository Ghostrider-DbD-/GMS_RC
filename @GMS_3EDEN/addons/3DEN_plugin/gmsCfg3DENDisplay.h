/*
	Setup classes that add toolbar menus and define them and the code that is executed by them. 
	Copyright 2023 by Ghostrider[GRG]
*/

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
					All menus for configuring a GMS mission are defined here 
				*/             

                class GMS_configure {
                    text = "GMS Settings";
                    toolTip = "Adjust Settings";
                    items[] = {
						"GMS_missions",
						"GMS_units"
						//"GMS_plugin"
                    };
                };


				class GMS_missions 
				{
					text = "Mission Settings";
					tooltip = "Adjust Mission Settings";
					items[] = {
						"GMS_static",
						"GMS_missionSpawnChance",
						"GMS_difficulty",
						"GMS_MissionCompletionMode",
						"GMS_crateSpawn",
						"GMS_lootSpawn"
					};
				};
				class GMS_missionSpawnChance 
				{
					text = "Spawn Chance";
					toolTip = "Set the chance the mission will spawn";
					items[] = {
						"GMS_spawnTwenty",
						"GMS_spawnFourty",
						"GMS_spawnSixty",
						"GMS_spawnEighty",
						"GMS_spawnHundred"
					};
				};
                class GMS_spawnTwenty 
				{
					text = "Spawn chance 20%";
					action = "[0.20] call gms3DEN_fnc_setSpawnChance;";
				};
                class GMS_spawnFourty
				{
					text = "Spawn chance 40%";
					action = "[0.40] call gms3DEN_fnc_setSpawnChance;";
				};	
				class GMS_spawnSixty 
				{
					text = "Spawn chance 60%";
					action = "[0.60] call gms3DEN_fnc_setSpawnChance;";
				};
				class GMS_spawnEighty
				{
					text = "Spawn chance 80%";
					action = "[0.80] call gms3DEN_fnc_setSpawnChance;";
				};
				class GMS_spawnHundred
				{
					text = "Spawn chance 100%";
					action = "[1.00] call gms3DEN_fnc_setSpawnChance;";
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
                    text = "Dynamic (Default)";
                    toolType = "Set mission to be spawned at random location";
                    action = "['Dynamic'] call gms3DEN_fnc_toggleStaticSpawns";
                };
                class GMS_setToStatic {
                    text = "Static";
                    toolTip = "Set mission to respawn at the same location each time";
                    action = "['Static'] call gms3DEN_fnc_toggleStaticSpawns";
                };	

				class GMS_plugin 
				{
					text = "Pluggin Settings";
					items[] = {
						"GMS_garrisonATL"
					};
				};

				class GMS_units 
				{
					text = "Adjust AI Settings"
					items[] = {
						"GMS_maxAI",
						"GMS_minAI"
					};
				};

				class GMS_maxAI 
				{
					text = "Max AI per Infantry Group";
					tooltip = "set the maximum AI per Infantry Group";
					items[] = {
						"GMS_maxThree",
						"GMS_maxFour",
						"GMS_maxFive",
						"GMS_maxSix",
						"GMS_maxEight",
						"GMS_maxNine"
					};
				};
				class GMS_maxThree 
				{
					text = "set max AI = 3";
					action = "[3] call gms3DEN_fnc_setMaxAI";					
				};
				class GMS_maxFour
				{
					text = "set max AI = 4";
					action = "[4] call gms3DEN_fnc_setMaxAI";					
				};
				class GMS_maxFive 
				{
					text = "set max AI = 5";
					action = "[5] call gms3DEN_fnc_setMaxAI";					
				};
				class GMS_maxSix
				{
					text = "set max AI = 6";
					action = "[6] call gms3DEN_fnc_setMaxAI";					
				};
				class GMS_maxSeven 
				{
					text = "set max AI = 7";
					action = "[7] call gms3DEN_fnc_setMaxAI";					
				};
				class GMS_maxEight
				{
					text = "set max AI = 8";
					action = "[8] call gms3DEN_fnc_setMaxAI";					
				};		
				class GMS_maxNine
				{
					text = "set max AI = 9";
					action = "[9] call gms3DEN_fnc_setMaxAI";					
				};	

				class GMS_minAI 
				{
					text = "Min AI per Infantry Group";
					tooltip = "Set the minimum AI per infantry group";
					items[] = {
						"GMS_minOne",
						"GMS_minTwo",
						"GMS_minThree",
						"GMS_minFour",
						"GMS_minFive",
						"GMS_minSix"
					};
				};
				class GMS_minOne 
				{
					text = "set min AI = 1";
					action = "[1] call gms3DEN_fnc_setMinAI";
				};
				class GMS_minTwo 
				{
					text = "set min AI = 2";
					action = "[2] call gms3DEN_fnc_setMinAI";
				};	
				class GMS_minThree 
				{
					text = "set min AI = 3";
					action = "[3] call gms3DEN_fnc_setMinAI";
				};								
				class GMS_minFour 
				{
					text = "set min AI = 4";
					action = "[4] call gms3DEN_fnc_setMinAI";
				};	
				class GMS_minFive
				{
					text = "set min AI = 5";
					action = "[5] call gms3DEN_fnc_setMinAI";
				};	
				class GMS_minSix
				{
					text = "set min AI = 6";
					action = "[6] call gms3DEN_fnc_setMinAI";
				};	

				class GMS_garrisonATL 
				{
					text = "Garrison-ATL Mode";
					items[] = {
						"GMS_garrisonATLoff",
						"GMS_garrisonATLon",
						"GMS_aboutGarrisonATL"			
					};
				};
				class GMS_garrisonATLoff 
				{
					text = "Off (default)";
					action = "[false] call gms3DEN_fnc_setGarrisonATL";
				};
				class GMS_garrisonATLon 
				{
					text = "On";
					action = "[true] call gms3DEN_fnc_setGarrisonATL";					
				};
				class GMS_aboutGarrisonATL
				{
					text = "Help";
					action = "call gms3DEN_fnc_garissonATLhelp";
				};				
				/***************************************
					The menu for exporting missions is defined here
				***************************************/

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

				/***************************************
					menus for those seeking support are here 
				***************************************/

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
                };
                class GMS_about {
					text = "3EDEN Plugin Version 1.0 for GMS by Ghostrider-GRG-";
					action = "call gms3EDEN_fnc_about";
                };

            };


		};
	};
};