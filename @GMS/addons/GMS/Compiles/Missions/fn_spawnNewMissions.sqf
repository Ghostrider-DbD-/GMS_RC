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

{	
	private _missionDescriptors = _x;	
	_missionDescriptors params["_key","_difficulty","_maxMissions","_activeMissions","_tMin","_tMax","_waitTime","_missions","_isStatic"];
	
	if (_activeMissions < _maxMissions && {diag_tickTime > _waitTime && {GMS_missionsRunning < GMS_maxSpawnedMissions}}) then 
	{
		// time to reset timers and spawn something.
		private _missionSelected = selectRandom _missions;
		/*
			params[
				"_key",  			// This key can be used to seach the list of available mission types to update that list when a mission is completed or times out
				"_missionConfigs",  // Selfevident but this is an array with all configs for the mission 
				"_missionCount",		// The number of missions run thus far which is used to unsure each marker has a unique name 
				"_isStatic"				// true if this is a static mission
			];
		*/

		private _missionInitialized = [_key,_missionSelected,GMS_dynamicMissionsSpawned,_isStatic] call GMS_fnc_initializeMission;

		switch (_missionInitialized) do 
		{
			case 1: {    // This is a dynamic mission s see if we can spawn another instance of this categore (blue, red, green, orange)
				GMS_dynamicMissionsSpawned = GMS_dynamicMissionsSpawned + 1;			
				#define waitTime 6
				#define noActive 3
				private _wt = diag_tickTime + _tmin + (random(_tMax - _tMin));			
				_x set[waitTime, _wt];  // _x here is the _missionCategoryDescriptors being evaluated
				private _noActiveMissions = _x select noActive;
				_x set[noActive, _noActiveMissions + 1];
			};
		case 2: {_missions deleteAt (_missions find _missionSelected)}; // the mission was spawned the maxiumum number of times.
		case 3: {}; // this is a static mission that was spawned and not completed		
		};
	};
} forEach GMS_missionData;
