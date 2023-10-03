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

// defines for mission initialization and monitoring 
#define missionNotspawned 0 // Mission marker spawned but nothing else is 
#define missionInitialized 1  // All mission material is spawned and mission is active 
#define missionLandscapeSpawned 1 
#define missionSmokeSpawned 1 
#define missionLootCratesSpawned 1 
#define missionEmplacedSpawned 1 
#define missionVehiclePatrolsSpawned 1 
#define missionInfantrySpawned 1 
#define missionAircraftPatrolsSpawned 1 
#define missionActive 0 
#define missionComplete 1 


//#define GMS_debugMode
#define GRGserver
//#define GMS_addCarParts
#define GMS_triggerLoopCompleteTime 40*60
#define max_distance_crate_moved_uncompleted_mission 120
#define onFoot 1
#define inVehicle 2

// Defines for difficulty
#define GMS_blue 1
#define GMS_red 2 
#define GMS_green 3 
#define GMS_orange 4 

// Defines for mission characteristics 
#define playerNear 0 
#define allUnitsKilled 1 
#define allKilledOrPlayerNear 2 
#define assetSecured 3 
#define atMissionSpawnGround 0 
#define atMissionSpawnAir 1 
#define atMissionEndGround 2 
#define atMissionEndAir 3 

// Defines for mission spawning functions 
// Array structure defined in \Complies\Missions\GMS_missionSpawner.sqf
#define isSpawned 12
#define spawnedAt 13

//  defines for static group spawners
#define staticPatrolTriggerRange 2000
#define groupParameters 0
#define patrolGroup 1
#define groupSpawned 2
#define timesSpawned 3
#define respawnAt 4
#define GMS_playerDetectionRangeAir 800
#define GMS_playerDetectionRangeGroundVehicle 400
#define GMS_vehiclePlayerDetectionOdds 0.6
#define GMS_playerDetectionRangeSubs 100
#define GMS_playerDetectionRangeSurfaceVehicle 150
#define GMS_simulationEnabledDistance 2500
#define GMS_simulationManagementOff 0
#define GMS_useBlckeaglsSimulationManager 1
#define GMS_useDynamicSimulationManagement 2
#define GMS_simulationManagementOff 0
#define GMS_useBlckeaglsSimulationManagement 1
#define GMS_useDynamicSimulationManagement 2

#define GMS_maxPatrolRadiusHelisBlue 300
#define GMS_maxPatrolRadiusHelisRed 400
#define GMS_maxPatrolRadiusHelisGreen 500
#define GMS_maxPatrolRadiusHelisOrange 650

#define GMS_turnBackRadiusInfantry 800
#define GMS_turnBackRadiusVehicles 1000
#define GMS_turnBackRadiusHelis 1000
#define GMS_turnBackRadiusJets 1500
