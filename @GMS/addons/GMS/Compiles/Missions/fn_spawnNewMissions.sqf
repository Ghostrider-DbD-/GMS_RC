/*
	GMS_fnc_spawnPendingMissions 

	Purpose: 
		For each mission for which data was precompiled test if the current time is greater than the time at which a mission of that 'color' should be spawned. 
		If so, that mission is initialized and added to the cue of available missions.
	
	By Ghostrider [GRG]
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
// TODO: Need to debug for GMS 
if (GMS_missionsRunning >= GMS_maxSpawnedMissions) exitWith 
{
	[format["_spawnNewMissions (18): GMS_maxSpawnedMissions of %1 Reached",GMS_maxSpawnedMissions]] call GMS_fnc_log;
};
//[format["_spawnNewMissions (18): time = %1 GMS_debugLevel = %2",diag_tickTime,GMS_debugLevel]] call GMS_fnc_log;
{	
	private _missionDescriptors = _x;	
	// _missionDescriptor is configures as follows:
	/*
		private _mission = [
			_key,
			_difficulty,
			_noMissions,  // Max no missions of this category
			0,  // Number active 
			_tMin, // Used to calculate waittime in the future
			_tMax, // as above
			_waitTime,  // time at which a mission should be spawned
			_missionsData,  // Array of data about individual missions that could be spawned. The data table for each mission is defined in _missionSpawner
			_isStatic
		];
		*/	
	_missionDescriptors params["_key","_difficulty","_maxMissions","_activeMissions","_tMin","_tMax","_waitTime","_missionsData","_isStatic"];
	
	//{/
		//diag_log format["_spawnNewMission: _this %1 = %2",_forEachIndex, _x];
	//} forEach _missionDescriptors;

	//diag_log format["_spawnNewMission: _missionsData = %1",_missionsData];

	if (_missionsData isEqualTo []) exitWith {-1};
	if (_activeMissions < _maxMissions && {diag_tickTime > _waitTime && {GMS_missionsRunning < GMS_maxSpawnedMissions}}) then 
	{
		// time to reset timers and spawn something.
		private _missionSelected = selectRandom _missionsData;
		// _missionSelected is configured as:
		/*
			params [
				_aiDifficultyLevel,			// index 0
				_markerConfigs,				// index 1
				_endCondition,				// index 2
				_isscubamission,			// index 3
				_missionLootConfigs,		// index 4
				_aiConfigs,					// index 5 
				_missionMessages,			// index 6
				_paraConfigs,				// index 8 
				_defaultMissionLocations,	// index 9 
				_maxMissionRespawns,		// index 10 
				_timesSpawned,				// index 11
				_chanceMissionSpawned,		// index 12
				_isSpawned,					// index 13
				_spawnedAt					// index 14
			];
		*/
		//{
		//	diag_log format["_spawnNewMission:_missionSelected:  _this %1 = %2",_forEachIndex,_x];
		//} forEach _missionSelected;

		/*
			params[  //  for GMS_fnc_initialiZeMission are
				"_key",  			// This key can be used to seach the list of available mission types to update that list when a mission is completed or times out
				"_missionConfigs",  // Selfevident but this is an array with all configs for the mission 
				"_missionCount",		// The number of missions run thus far which is used to unsure each marker has a unique name 
				"_isStatic"
			];
		*/
		//diag_log format["_spawnNewMissions: _missionSelected = %1",_missionSelected];
		private _missionInitialized = [_key,_missionSelected,GMS_dynamicMissionsSpawned,_isStatic] call GMS_fnc_initializeMission;

		if (_missionInitialized == 1) then {    // This is a dynamic mission s see if we can spawn another instance of this categore (blue, red, green, orange)
			GMS_dynamicMissionsSpawned = GMS_dynamicMissionsSpawned + 1;			
			#define waitTime 6
			#define noActive 3
			private _wt = diag_tickTime + _tmin + (random(_tMax - _tMin));			
			_missionDescriptors set[waitTime, _wt];  
			_missionDescriptors set[noActive, _activeMissions + 1];
		} else {
			if (_missionInitialized == -1) then // failed the test about chance of spawning 
			{
				#define waitTime 6
				private _wt = diag_tickTime + _tmin + (random(_tMax - _tMin));			
				_missionDescriptors set[waitTime, _wt];  
			};
		};	
	};
} forEach GMS_missionData;

private _exitcode = 1;
_exitCode;
