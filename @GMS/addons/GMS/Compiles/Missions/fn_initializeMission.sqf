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

 _missionConfigs params [
	"_difficulty",
	"_markerConfigs",
	"_endCondition",	
	"_isscubamission",	
	"_missionLootConfigs",
	"_aiConfigs",
	"_missionMessages",	
	"_paraConfigs",	
	"_defaultMissionLocations",
	"_maxMissionRespawns",
	"_timesSpawned",
	"_isSpawned"
];

_markerConfigs params[
	"_markerName",  //  The unique text identifier for the marker
	"_markerMissionName", // Name used for setMarkerText - does not need to be unique
	"_markerType", 
	"_markerColor", 
	"_markerSize",
	"_markerBrush"
];

[format["_initializeMission (39): _markerName %1 | _key %2 | _missionCount %3 | _maxMissionRespawns %4 | _timesSpawned %5",_markerName,_key,_missionCount,_maxMissionRespawns,_timesSpawned]] call GMS_fnc_log;

// If the mission is a static mission and it has been spawned but not cleared then pass back a code indicating that
if (_isStatic &&_isSpawned) exitWith {private _initialized = 3; _initialized};

private _initialized = 0;
/*

*/
_coordsArray = [];
if !(_defaultMissionLocations isEqualTo []) then 
{
	if (_timesSpawned < _maxMissionRespawns || {_maxMissionRespawns == -1}) then 
	{
		_coords = selectRandom _defaultMissionLocations;
		#define timesSpawnedIndex 10
		_missionConfigs set[timesSpawnedIndex, _timesSpawned + 1];
	} else {
		_initialized = 2;
	};
} else {
	if (_isScubaMission) then 
	{
		_coords = [] call GMS_fnc_findShoreLocation;
	} else {
		_coords =  [] call GMS_fnc_findSafePosn;
		_coords = [_coords select 0, _coords select 1, 0];
	};
};

if (_initialized == 2) exitWith {_initialized};
if (_coords isEqualTo [] || {_coords isEqualTo [0,0,0]}) exitWith 
{
	[format["No Safe Mission Spawn Position Found to spawn Mission %1",_markerMissionName],'warning'] call GMS_fnc_log;
	// _initialized should be == 0 here
	_initialized
};

GMS_ActiveMissionCoords pushback _coords; 
GMS_missionsRunning = GMS_missionsRunning + 1;
//[format["_initializeMission (70): _coords = %1 | GMS_missionsRunning = %2",_coords,GMS_missionsRunning]] call GMS_fnc_log;

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
if (GMS_debugLevel >=30) then 
{
	{
		diag_log format["_initializeMission (95) %1 = %2",_x,_markerConfigs select _forEachIndex];
	} forEach [	
		"_markerType", 
		"_markerColor", 
		"_markerSize",
		"_markerBrush"
	];
};
*/

private _markerError = false;
if !(toLowerANSI (_markerType) in ["ellipse","rectangle"] || {isClass(configFile >> "CfgMarkers" >> _markerType)} ) then 
{
	//[format["_markerType set to 'ELLIPSE': Illegal marker type %1 used for mission %2 of difficulty %3",_markerType,_markerMissionName,_difficulty],"warning"] call GMS_fnc_log;
	_markerType = "ELLIPSE";
	_markerSize = [200,200];
	_markerBrush = "GRID";
	_markerError = true;
};

if !(isClass(configFile >> "CfgMarkerColors" >> _markerColor)) then 
{
	//[format["_markerColor set to 'default': Illegal color %1 used for mission %2 of difficulty %3",_markerColor,_markerMissionName,_difficulty],"warning"] call GMS_fnc_log;
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
	_markerBrush] call GMS_fnc_createMissionMarkers;

if (GMS_debugLevel >= 3) then {[format["_initializeMission (130): _marker = %1 | _markerMissionName = %2 | _difficulty = %3",_markers,_markerMissionName,_difficulty]] call GMS_fnc_log};

/*
	Send a message to players.
*/
 private _startMsg = _missionMessages select 2;
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
	_coords,
	mines, 
	objects, 
	hiddenObjects, 
	crates, 
	missionAI, 
	assetSpawned,   /// Used for missions for which a hostage or target is spawned.
	missionVehicles, 
	lootVehicles,
	_markers
];
private _spawnPara = -1;
GMS_initializedMissionsList pushBack [_key, missionTimeoutAt, triggered, _missionData, _missionConfigs, _spawnPara,_isSpawned,_isStatic];
//[format["_initializeMission (163): count GMS_initializedMissionsList = %1",count GMS_initializedMissionsList]] call GMS_fnc_log;
_initialized = 1;
_initialized