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
// Need to debug for GMS
if (GMS_missionsRunning >= GMS_maxSpawnedMissions) exitWith 
{
	[format["_spawnNewMissions (18): GMS_maxSpawnedMissions of %1 Reached",GMS_maxSpawnedMissions]] call GMS_fnc_log;
};

{	
	private _missionDescriptors = _x;	
	_missionDescriptors params["_key","_difficulty","_maxMissions","_activeMissions","_tMin","_tMax","_waitTime","_missions"];
	
	if (_activeMissions < _maxMissions && {diag_tickTime > _waitTime && {GMS_missionsRunning < GMS_maxSpawnedMissions}}) then 
	{
		// time to reset timers and spawn something.
		private _missionSelected = selectRandom _missions;
		//[format["_spawnNewMissions (29): _key %1 | _difficulty %2 | _maxMissions %3 | _activeMissions %4 | _tMin %5 | _tMax %6 | _waitTime %7",_key,_difficulty,_maxMissions,_activeMissions,_tMin,_tMax,_waitTime]] call GMS_fnc_log;
		private _missionInitialized = [_key,_missionSelected,GMS_dynamicMissionsSpawned] call GMS_fnc_initializeMission;

		if (_missionInitialized == 1) then 
		{
			GMS_dynamicMissionsSpawned = GMS_dynamicMissionsSpawned + 1;			
			#define waitTime 6
			#define noActive 3
			private _wt = diag_tickTime + _tmin + (random(_tMax - _tMin));			
			_x set[waitTime, _wt];  // _x here is the _missionCategoryDescriptors being evaluated
			private _noActiveMissions = _x select noActive;
			_x set[noActive, _noActiveMissions + 1];
		};
		if (_missionInitialized == 2) then 
		{
			_missions deleteAt (_missions find _missionSelected);
		};
	};
} forEach GMS_missionData;
