/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

 class GMSBuild {
	 Version = "7.23";
	 Build = "279"; 
	 Date = "11-06-2023";
 };

class CfgPatches {
	class GMS {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"GMSCore"};
	};
};

class CfgFunctions {
	class GMS {
		class startup {
			file = "\x\addons\GMS\Compiles\Init";
			class init {
				postInit = 1;
			};
		};
		
		class functions {
			file = "\x\addons\GMS\Compiles\Functions";
			class broadcastServerFPS {};	
			class createMissionMarkers {};
			class deleteMarker {};
			class findPositionsAlongARadius {};
			class findRandomLocationWithinCircle {};
			class findSafePosn {}; // There are a few different versions of this. This one seemed to work the best in my testing. The others were retained for documentation.
			class findShoreLocation {};
			class findWaterDepth {};
			class getAllBlckeaglsMarkers {};
			class getAllDMSMarkers {};
			class getAllMarkersOfSubtype {};
			class getIndexFromDifficulty {};
			class mainThread {};	
			class markerSetAliveAICount {};	
			class messagePlayers {};	
			class missionCompleteMarker {};
			class msgIED {};
			class restoreHiddenObjects {};
			class updateMarkerAliveCount {};
		};
		class groups {
			file = "\x\addons\GMS\Compiles\Groups";
			class findNearestInfantryGroup {};
			// Moved all code dealing with simulation managment to GMSCore
			//class simulationMonitor {};
			class spawnGroup {};
		};
		class missions {
			file = "\x\addons\GMS\Compiles\Missions";
			class addMIssionToQue {};
				class endMission {};
			class fillBoxes {};
			class garrisonBuilding_ATLsystem {};
			class loadLootItemsFromArray {};
			class initializeMission {};
			class loadMissionCrate {};
			class missionCleanup {};
			class monitorInitializedMissions {};
			class monitorSpawnedMissions {};
			class paraDropObject {};
			class selectAIBackpacks {};
			class selectAILoadout {};
			class selectAISidearms {};
			class selectAIUniforms {};
			class selectAIHeadgear {};
			class selectAIVests {};
			class selectChanceHeliPatrol {};
			class selecctChanceParatroops {};			
			class selectMissionHelis {};			
			class selectNumberAirPatrols {};
			class selectNumberParatroops {};
			class selectVehicleCrewCount {};
			class spawnSmokingObject {};			
			class spawnCrate {};
			class spawnCompositionObjects {};			
			class spawnEmplacedWeaponArray {};
			class spawnGarrisonedUnits {};
			class spawnMissionAssets {};
			class spawnMines {};
			class spawnMissionAI {};
			class spawnMissionCrates {};
			class spawnMissionHelis {};
			class spawnMissionLootVehicles {};
			class spawnMissionVehiclePatrols {};
			class spawnNewMissions {};
			class spawnRandomLandscape {};
			class spawnScubaGroup {};
			class spawnSimpleObjects {};
			class spawnSDVPatrol {};
			class spawnSurfacePatrol {};
		};
		class units {
			file = "\x\addons\GMS\Compiles\Units";
			class cleanupAliveAI {};
			class deleteAI {};
			class removeAllAIgear {};
			class spawnParaUnits {};
			class spawnUnit {};
			class unitHit {};
			class unitKilled {};
		};
		class Utils {
			file = "\x\addons\GMS\Compiles\Utils";
			class log {};
		};
		class vehicles {
			file = "\x\addons\GMS\Compiles\Vehicles";	
			class alertVehicles {};
			class deleteAIVehicle {};
			class checkForEmptyVehicle {};	
			class handleEmptyVehicle {};
			class loadVehicleCrew {};
			class protectVehicle {};
			class releaseVehicleToPlayers {};
			class revealNearbyPlayers {};
			class scanForPlayersNearVehicles {};
			class selectPatrolVehicle {};
			class spawnMissionHeli {};
			class spawnVehicle {};
			class spawnVehiclePatrol {};
			class vehicleHit {};
			class vehicleKilled {};
			class vehicleMonitor {};
		};
	};
};

