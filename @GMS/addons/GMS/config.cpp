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
	 Version = "7.162";
	 Build = "267"; 
	 Date = "10-1-2023";
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
			file = "\GMS\Compiles\Init";
			class init {
				postInit = 1;
			};
		};
		
		class functions {
			file = "\GMS\Compiles\Functions";
			class broadcastServerFPS {};	
			class cleanEmptyGroups {};	
			class countAliveAI {};
			class createMissionMarkers {};
			class deleteMarker {};
			class findPositionsAlongARadius {};
			class findRandomLocationWithinCircle {};
			class findShoreLocation {};
			class findWaterDepth {};
			class getAllBlckeaglsMarkers {};
			class getAllDMSMarkers {};
			class getAllMarkersOfSubtype {};
			class getIndexFromDifficulty {};
			class loadLootItemsFromArray {};
			class mainThread {};	
			class markerSetAliveAICount {};	
			class messagePlayers {};	
			class missionCompleteMarker {};
			class msgIED {};
			class nearestPlayers {};
			//class playerInRange {};
			//class playerInRangeArray {};
			class restoreHiddenObjects {};
			class setDirUp {};
			class spawnMarker {};
			class updateMarkerAliveCount {};
		};
		class groups {
			file = "\GMS\Compiles\Groups";
			class checkGroupWaypointStatus {};
			class cleanEmptyGroups {};
			class createGroup {};  // Kept for backwards compatability with static missions if these are kept and not updated.			
			class emplacedWeaponWaypoint {};  // Not sure this is needed - can we do the same thing directly in another script?			
			class findNearestInfantryGroup {};
			class groupWaypointMonitor {};
			class setNextWaypoint {};
			class setupWaypoints {};
			class simulationMonitor {};
			class spawnGroup {};
		};
		class missions {
			file = "\GMS\Compiles\Missions";
			class addMIssionToQue {};
			//class crateMoved {};
			class endMission {};
			class fillBoxes {};
			class garrisonBuilding_ATLsystem {};
			//class garrisonBuilding_relPosSystem {};
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
			//class signalEnd {};
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
			file = "\GMS\Compiles\Units";
			class cleanupAliveAI {};
			class deleteAI {};
			class removeAllAIgear {};
			class spawnParaUnits {};
			class spawnUnit {};
			class unitHit {};
			class unitKilled {};
		};
		class Utils {
			file = "\GMS\Compiles\Utils";
			class log {};
		};
		class vehicles {
			file = "\GMS\Compiles\Vehicles";	
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

