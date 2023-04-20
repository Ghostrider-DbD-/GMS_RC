/*
	AI Mission for Epoch Mod for Arma 3
	For the Mission System originally coded by blckeagls
	By Ghostrider
	Functions and global variables used by the mission system.
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

if (GMS_debugLevel > 0) then {diag_log "[GMS] loading variables"};

GMS_minFPS = 12; 

// radius within whih missions are triggered. The trigger causes the crate and AI to spawn.
GMS_TriggerDistance = 1500;

////////////////////////////////////////////////
//  Do Not Touch Anything Below This Line
///////////////////////////////////////////////

GMS_townLocations = []; //nearestLocations [GMS_mapCenter, ["NameCity","NameCityCapital"], 30000];
GMS_ActiveMissionCoords = [];
GMS_recentMissionCoords = [];
GMS_monitoredVehicles = [];
GMS_livemissionai = [];
GMS_monitoredMissionAIGroups = [];  //  Used to track groups in active missions for whatever purpose
GMS_hiddenTerrainObjects = [];
GMS_missionsRunning = 0;
GMS_missionsRun = 0;
GMS_missionMarkerRootName = "GMS_marker";
DMS_missionMarkerRootName = "DMS_MissionMarker";
GMS_missionLabelMarkers = [];
GMS_mainThreadUpdateInterval = 60;
GMS_monitoring = false;
GMS_revealMode = "detailed"; //""basic" /*group or vehicle level reveals*/,detailed /*unit by unit reveals*/";
GMS_dynamicMissionsSpawned = 0;
GMS_missionData = [];
GMS_initializedMissionsList = [];
GMS_landVehiclePatrols = [];
GMS_aircraftPatrols = [];
GMS_blackListedLocations = []; // [ [marker, time]]
GMS_validEndStates = [allUnitsKilled, playerNear, allKilledOrPlayerNear,assetSecured];
GMS_validLootSpawnTimings = ["atMissionSpawnGround","atMissionSpawnAir","atMissionEndGround","atMissionEndAir"];
GMS_validLootLoadTimings = ["atMissionCompletion", "atMissionSpawn"];
GMS_skillsIndex_Blue = 0;
GMS_skillsIndex_Red = 1;
GMS_skillsIndex_Green = 2;
GMS_skillsIndex_Orange = 3;

if (GMS_debugLevel > 0) then {diag_log "[GMS] Variables Loaded"};

