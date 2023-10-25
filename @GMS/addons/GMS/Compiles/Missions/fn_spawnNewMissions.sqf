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
	if (GMS_debugLevel > 0) then {[format["_spawnNewMissions (18): GMS_maxSpawnedMissions of %1 Reached",GMS_maxSpawnedMissions]] call GMS_fnc_log};
};

for "_i" from 1 to (count GMS_missionData) do 
{	
	if (_i > (count GMS_missionData)) exitWith {};
	private _missionDescriptors = GMS_missionData deleteAt 0;	

	// _missionDescriptor is configures as follows:
	/*
		private _mission = [
			_key,				// We can search for this key or for _missionDescriptors if we need to delete this particular mission.
			_difficulty,
			_noMissions,  		// Max no missions of this category
			0,  				// Number active 
			_tMin, 				// Used to calculate waittime in the future
			_tMax, 				// as above
			_waitTime,  		// time at which a mission should be spawned
			_missionsData,  	// Array of data about individual missions that could be spawned. The data table for each mission is defined in _missionSpawner
			_isStatic,
			_missionFile
		];
	*/	
	
	_missionDescriptors params["_key","_difficulty","_maxMissions","_activeMissions","_tMin","_tMax","_waitTime","_missionsData","_isStatic","_missionFile"];
	
	// Just in case there are no missions to choose from for some reason.
	// But this could happen if all of the available missions had reached their maximal number of respawns.
	// Note that an element with an empty _missionsData array is not added back for future evaluation.
	if !(_missionsData isEqualTo []) then {
		/*
			_activeMissions = the number of active missions allowed of this type which can be, for example, blue missions or static missions. 
			_maxMissions = the maximum number of missions allowed of this type. 
			_waitTime = at what time can the next mission be spawned. 
		*/
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
			private _missionInitialized = [_key,_missionSelected,GMS_MissionsSpawned,_isStatic,_missionFile] call GMS_fnc_initializeMission;

			switch (_missionInitialized) do 
			{
				case -3: { 	// No safe spot found for the mission for whatever reason.
							// Try to respawn it in a while
					#define waitTime 6
					private _wt = diag_tickTime + _tmin + (random(_tMax - _tMin));			
					_missionDescriptors set[waitTime, _wt];
				};
				
				case -2: {
					// Handle the case in which a mission has been spawned _maxmissionRespawns 
					// Or a mission threw a FATAL ERROR
					[format["_spawnNewMission (82): count _missionsData before deletion = %1", count _missionsData]] call GMS_fnc_log;
					private _posn = _missionsData findIf {(_x select 0) isEqualTo _key};
					_missionsData deleteAt _posn;
					[format["_spawnNewMission (85): count _missionsData after deletion = %1", count _missionsData]] call GMS_fnc_log;
					#define missionsData 7
					_missionDescriptors set [missionsData, _missionsData];
				};
				
				case -1: {  // Fatal Error in Marker Configs or markers were not created for some reason.
							// Remove this mission from the list. 
					private _posn = _missionsData findIf {(_x select 0) isEqualTo _key};
					_missionsData deleteAt _posn;
					[format["Removed %1 from list of missions because of a FATAL ERROR", _missionFile],'warning'] call GMS_fnc_log;
					#define missionsData 7
					_missionDescriptors set [missionsData, _missionsData];						
				};
				
				case 0: {  //  The mission failed the test for chance it would be spawned.
					#define waitTime 6
					private _wt = diag_tickTime + _tmin + (random(_tMax - _tMin));			
					_missionDescriptors set[waitTime, _wt];
				};
				
				case 1: {  // The mission was initialized without any errors
					GMS_MissionsSpawned = GMS_MissionsSpawned + 1;			
					#define waitTime 6
					#define noActive 3
					private _wt = diag_tickTime + _tmin + (random(_tMax - _tMin));			
					_missionDescriptors set[waitTime, _wt];  
					_missionDescriptors set[noActive, _activeMissions + 1];
				};
				
				case 2: { // A special case for static missions that have never been spawned that did not pass the test for chance of a spawn. Here we set waitTime to 60 sec. 
					#define waitTime 6
					private _wt = diag_tickTime + 60;			
					_missionDescriptors set[waitTime, _wt];
				};
				
				case 3: {  	// Case of a static mission that was already spawned. 
							//  Nothing to do here at this time.
				};
			};
		};
		GMS_missionData pushBack _missionDescriptors;
	};
};


