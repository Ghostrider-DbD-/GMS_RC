/*
	GMS_fnc_initializeMission 

	Perform all functions necessary to initialize a mission.

*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"

private ["_coords","_coordArray","_return"];
params[
	"_key",  			// This key can be used to seach the list of available mission types to update that list when a mission is completed or times out
	"_missionConfigs",  // Selfevident but this is an array with all configs for the mission 
	"_missionCount",		// The number of missions run thus far which is used to unsure each marker has a unique name 
	"_isStatic",
	"_missionFile"
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

#define timesSpawnedIndex 11
private _initialized = 0;

private _markers = [];
/*
private _markerConfigs = [
	_markerLabel,
	_markerMissionName, // Name used for setMarkerText and also for the root name for all markers	
	_markerShape, 
	_markerColor, 
	_markerSize,
	_markerBrush,
	_showMarker
];
*/
_markerConfigs params [
	["_markerLabel","NoLabelGiven"],  //  Text used to label the marker		
	["_markerMissionName","NoNameGiven"],  // the name used when creating the marker. Must be unique.
	["_markerShape","NoTypeGiven"],	// Use either the name of the icon or "ELLIPSE" or "RECTANGLE" where non-icon markers are used
	["_markerColor","NoColorGiven"],
	["_markerSize",[0,0]],
	["_markerBrush","NoBrushGiven"],
	["_showMarkers",true]
];

try {
	if (GMS_debugLevel > 0) then {[format["_initializeMission (82): _timesSpawned %1 | _maxMissionRespawns %2",_timesSpawned,_maxMissionRespawns]] call GMS_fnc_log};
	if (_timesSpawned >= _maxMissionRespawns && !(_maxMissionRespawns == -1)) throw -2;

	// If the mission is a static mission and it has been spawned but not cleared then pass back a code indicating that
	if (_isStatic && _isSpawned) throw 3; // We do not want to respawn this static mission till it has been cleared.
	
	// If the mission has not been spawned, but is a static mission and could be spawned if it met the test for chance of a spawn, pass back a code indicating that.
	if (random(1) > _chanceMissionSpawned && (_isStatic) && (_timesSpawned == 0)) throw 2;

	// do not initialize if the odds of spawning are not favorable.
	if (random(1) > _chanceMissionSpawned) throw 0;

	/*
	private _labels = ["_markerLabel","_markerMissionName","_markerShape","_markerColor","_markerSize","_markerBrush","_showMarkers"];
	{
		[format["_initializeMission (95): _markerConfigs  index %1 | name %2 = %3",_forEachIndex, _labels select _forEachIndex, _x]] call GMS_fnc_log;
	} forEach _markerConfigs;
	*/
	// [format["initializeMission (100): _markerShape = %1",_markerShape]] call GMS_fnc_log;
	if (_markerMissionName isEqualTo "NoNameGiven") throw -1; // This is a FATAL ERROR 
	
	if !(toLowerANSI (_markerShape) in ["ellipse","rectangle"] || {isClass(configFile >> "CfgMarkers" >> _markerShape)} ) then 
	{
		[format["_markerShape set to 'ELLIPSE': Illegal marker type %1 used for _missionFile %2",_markerShape,_missionFile,_difficulty],"warning"] call GMS_fnc_log;
		_markerShape = GMS_defaultMarkerType;
		_markerSize = GMS_defaultMarkerSize;
		_markerBrush = GMS_defaultMarkerBrush;
	};

	if !(isClass(configFile >> "CfgMarkerColors" >> _markerColor)) then 
	{
		[format["_markerColor set to 'default': Illegal color %1 used for mission %2 of difficulty %3",_markerColor,_missionFile,_difficulty],"warning"] call GMS_fnc_log;
		_markerColor = "NoColorGiven";
	};	

	if (_markerLabel isEqualTo "NoLabelGiven") then {
		[format["No Marker Text (_markerLabel) defined for mission %1",_missionFile],'warning'] call GMS_fnc_log; 
		// Probably not a fatal error but it will look funny on the server 
	};
	if (_markerColor isEqualTo "NoColorGiven") then {
		[format["No Marker Color (_markerColor) defined for mission %1 SO GMS_defaultMarkerColor used instead",_missionFile],'warning'] call GMS_fnc_log; 
		// Probably not FATAL but will apply a Default Color anyhow
		_markerColor = GMS_defaultMarkerColor;
	};
	if (_markerShape isEqualTo "NoTypeGiven") then {
		[format["No Marker Type (triangle, mil_dot) or Shape ('Elipse', 'Rectangle') defined for mission %1 SO default setting GMS_defaultMarkerType used",_missionFile],'warning'] call GMS_fnc_log; 
		// Apply a default setting here
		_markerShape = GMS_defaultMarkerType;
	};
	if !(_markerSize isEqualTypeArray [0,0]) then {
		[format["_markerSize = %1 BUT must be given as an array of [xsize, ysize] SO defaults of GMS_defaultMarkerSize were used for mission file %1",_markerSize,_missionFile],'warning'] call GMS_fnc_log;
		_markerSize = GMS_defaultMarkerSize;
		// Just alert the server scripter of the problem and apply a default.
	};

	if (toUpper(_markerShape) in ["ELLIPSE","RECTANGLE"] && (_markerBrush isEqualTo "NoBrushGiven" || !(isClass(configFile >> "CfgMarkerBrushes" >> _markerBrush)))) then {
		[format["_markerBrush not defined for shaped marker in mission %1 SO default of GMS_defaultMarkerBrush used"],'warning'] call GMS_fnc_log;
		_markerBrush = GMS_defaultMarkerBrush;
	};

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

	if (_coords isEqualTo [] || {_coords isEqualTo [0,0,0]}) throw -2; 

	if (GMS_debugLevel > 0) then {[format["Initializing mission: _coords = %1 | _markerMissionName %2 | _missionFile = %3",_coords,_markerMissionName,_missionFile]] call GMS_fnc_log};

	GMS_ActiveMissionCoords pushback _coords; 
	GMS_missionsRunning = GMS_missionsRunning + 1;

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

	// _markers holds the two markers generated for the mission. 
	// The first can be "" if the marker type used is an icon such as a triangle. 
	// The second is always an icon which may have a label.
	_markers = [  
		format["%1:%2",_markerMissionName,_missionCount],
		_markerPos,
		_markerMissionName,
		_markerColor,
		_markerShape,
		_markerSize,
		_markerBrush,
		_showMarkers,
		_missionFile
	] call GMS_fnc_createMissionMarkers;

	if (_markers isEqualTo []) throw -1;  // Something happened when creating markers so alert the server scripter.
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
	GMS_initializedMissionsList pushBack [_key, missionTimeoutAt, triggered, _missionData, _missionConfigs, spawnPara,_isStatic,_missionFile];

	// Repair any damage done by prior activities.
	{_x setDamage 0} forEach ( nearestObjects [_coords, ["Building"], 500]); 	
	throw 1;  //  Normal script termination
}

catch {
	switch (_exception) do {
			
		case -3: {
			[format["No Safe Mission Spawn Position Found to spawn Mission %1",_missionFile],'warning'] call GMS_fnc_log;
			_initialized = -3;
		};	

		case -2: { // The mission was spawned the maximum number of times.
			[format["Mission %1 has been spawn the maximum allowable number of times",_missionFile]] call GMS_fnc_log;
			_initialized = -2;
		};

		case -1: {  // A fatal error in marker configs was found or GMS_fnc_createMissionMarkers did not create any for some reason.
			_initialized = -1;
		};

		case 0: {  //  The mission failed the test for chance it would be spawned.
			_initialized = 0;
		};

		case 1: { // The marker was configured in a legal way and a safe position was found to spawn it. 
			_initialized = 1;
		};
		case 2: {  //  This static mission failed the test for chance that it would be spawned.
			_initialized = 2;
		};
		case 3: {  // Case of a static mission that has already been spawned.
			_initialized = 3;
		};
	};
};

_initialized