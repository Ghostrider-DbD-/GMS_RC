/*
	GMS_fnc_initializeMission 

	Perform all functions necessary to initialize a mission.
	A marker is created and mission info is added to GMS_initializedMissionsList
	 
	[_mrkr,_difficulty,_m] call GMS_fnc_initializeMission;

	Returns one of the following values:
	 0 - this is a static mission that has been spawned and has not been completed 
	 1 - the mission was successfully initialized at _coords != [0,0,0]
	 2 - the mission has been run the maximum allowed times. 
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"

private ["_coords","_coordArray","_return"];
params[
	"_key",  			// This key can be used to seach the list of available mission types to update that list when a mission is completed or times out
	"_missionConfigs",  // Selfevident but this is an array with all configs for the mission 
	"_missionCount",		// The number of missions run thus far which is used to unsure each marker has a unique name 
	"_isStatic"
];

// _missionConfigs is configured as:
/*
	params [
		_aiDifficultyLevel,			// index 0
		_markerConfigs,				// index 1
		_endCondition,				// index 2
		_isscubamission,			// index 3
		_missionLootConfigs,		// index 4
		_aiConfigs,					// index 5 
		_missionMessages,			// index 6
		_paraConfigs,				// index 7
		_defaultMissionLocations,	// index 8 
		_maxMissionRespawns,		// index 9 
		_timesSpawned,				// index 10
		_chanceMissionSpawned,		// index 11
		_isSpawned,					// index 12
		_spawnedAt					// index 13
	];
*/

 _missionConfigs params [
	"_difficulty",			// index 0
	"_markerConfigs",		// index 1
	"_endCondition",		// index 2
	"_isscubamission",		// index 3
	"_missionLootConfigs",	// index 4
	"_aiConfigs",			// index 5
	"_missionMessages",		// index 6
	"_paraConfigs",			// index 7
	"_defaultMissionLocations",
	"_maxMissionRespawns",	// index 9
	"_timesSpawned",		// index 10 
	"_chanceMissionSpawned", // index 11
	"_isSpawned",			// index 12
	"_spawnedAt"			// index 13
 ];

// do not initialize if the odds of spawning are not favorable.
if (random(1) > _chanceMissionSpawned) exitWith {
	diag_log format["_initializeMission (27): returning value of -1"];
	-1
};
// If the mission has already been spawned the max number of times, pass back a code indicating that.
if (!(_maxMissionRespawns == -1) && (_timesSpawned > _maxMissionRespawns)) exitWith {
	diag_log format["_initializeMission (32): returning value of -2"];
	-2
};
// If the mission has not been spawned, but is a static mission and could be spawned if it met the test for chance of a spawn, pass back a code indicating that.
if (random(1) > _chanceMissionSpawned && (_isStatic) && (_timesSpawned == 0)) exitWith {
	diag_log format["_initializeMission (37): returning value of 2"];
	2
};
// If the mission is a static mission and it has been spawned but not cleared then pass back a code indicating that
if (_isStatic && _isSpawned) exitWith {
	diag_log format["_initializeMission (42): returning value of 3"];
	3
};

#define timesSpawnedIndex 11

_markerConfigs params[
	"_markerName",  //  The unique text identifier for the marker
	"_markerMissionName", // Name used for setMarkerText - does not need to be unique
	"_markerType", 
	"_markerColor", 
	"_markerSize",
	"_markerBrush",
	"_showMarkers"
];

//[format["_initializeMission (39): _markerName %1 | _key %2 | _missionCount %3 | _maxMissionRespawns %4 | _timesSpawned %5",_markerName,_key,_missionCount,_maxMissionRespawns,_timesSpawned]] call GMS_fnc_log;

private _initialized = 0;
/*

*/
_coordsArray = [];
if !(_defaultMissionLocations isEqualTo []) then 
{
	_coords = selectRandom _defaultMissionLocations;
} else {
	if (_isScubaMission) then 
	{
		_coords = [] call GMS_fnc_findShoreLocation;
	} else {
		_coords =  [] call GMS_fnc_findSafePosn;
		_coords = [_coords select 0, _coords select 1, 0];
	};
};

_missionConfigs set[timesSpawnedIndex, _timesSpawned + 1];
_missionConfigs set[isSpawned, true];
_missionConfigs set[spawnedAt, diag_tickTime];

if (_coords isEqualTo [] || {_coords isEqualTo [0,0,0]}) exitWith 
{
	[format["No Safe Mission Spawn Position Found to spawn Mission %1",_markerMissionName],'warning'] call GMS_fnc_log;
	// _initialized should be == 0 here
	_initialized
};

GMS_ActiveMissionCoords pushback _coords; 
GMS_missionsRunning = GMS_missionsRunning + 1;
//[format["_initializeMission (118): _coords = %1 | GMS_missionsRunning = %2",_coords,GMS_missionsRunning]] call GMS_fnc_log;

private _markers = [];

/*
	Handle map markers 
*/

private "_markerPos";
if (GMS_labelMapMarkers select 0) then
{
	_markerPos = _coords;
};
if !(GMS_preciseMapMarkers) then
{
	_markerPos = [_coords,75] call GMS_fnc_randomPosition;
};

/*
{
		diag_log format["_initializeMission (95) %1 = %2",_x,_markerConfigs select _forEachIndex];
} forEach [	
		"_markerType", 
		"_markerColor", 
		"_markerSize",
		"_markerBrush"
];
*/

private _markerError = false;
if !(toLowerANSI (_markerType) in ["ellipse","rectangle"] || {isClass(configFile >> "CfgMarkers" >> _markerType)} ) then 
{
	[format["_markerType set to 'ELLIPSE': Illegal marker type %1 used for mission %2 of difficulty %3",_markerType,_markerMissionName,_difficulty],"warning"] call GMS_fnc_log;
	_markerType = "ELLIPSE";
	_markerSize = [200,200];
	_markerBrush = "GRID";
	_markerError = true;
};

if !(isClass(configFile >> "CfgMarkerColors" >> _markerColor)) then 
{
	[format["_markerColor set to 'default': Illegal color %1 used for mission %2 of difficulty %3",_markerColor,_markerMissionName,_difficulty],"warning"] call GMS_fnc_log;
	_markerColor = "DEFAULT";
	_markerError = true;
};

// _markers holds the two markers generated for the mission. 
// The first can be "" if the marker type used is an icon such as a triangle. 
// The second is always an icon which may have a label.
private _markers = [  
	format["%1:%2",_markerName,_missionCount],
	_markerPos,
	_markerMissionName,
	_markerColor,
	_markerType,
	_markerSize,
	_markerBrush,
	_showMarkers
] call GMS_fnc_createMissionMarkers;

//if (GMS_debugLevel >= 0) then {[format["_initializeMission (130): _marker = %1 | _markerMissionName = %2 | _difficulty = %3",_markers,_markerMissionName,_difficulty]] call GMS_fnc_log};

/*
	Send a message to players.
*/
_missionMessages params [
	"_assetKilledMsg",	
	"_endMsg",
	"_timeoutMsg",	
	"_startMsg"
];

[["start",_startMsg,_markerMissionName]] call GMS_fnc_messageplayers;

#define missionTimeoutAt (diag_tickTime + GMS_MissionTimeout)
#define triggered 0
#define objects []
#define hiddenObjects []
#define mines []
#define crates  []
#define missionVehicles []
#define missionAI []
#define lootVehicles []
#define assetSpawned objNull

private _missionData = [
	_coords,		// index 0
	mines, 			// index 1
	objects, 		// index 2
	hiddenObjects, 	// index 3
	crates, 		// index 4
	missionAI, 		// index 5
	assetSpawned,   /// Used for missions for which a hostage or target is spawned.
	missionVehicles, // index 7
	lootVehicles,	// index 8
	_markers		// index 9
];

#define spawnPara -1
GMS_initializedMissionsList pushBack [_key, missionTimeoutAt, triggered, _missionData, _missionConfigs, spawnPara,_isStatic];

// Repair any damage done by prior activities.
{_x setDamage 0} forEach ( nearestObjects [_coords, ["Building"], 500]); 

//[format["_initializeMission (163): count GMS_initializedMissionsList = %1",count GMS_initializedMissionsList]] call GMS_fnc_log;
_initialized = 1;
_initialized