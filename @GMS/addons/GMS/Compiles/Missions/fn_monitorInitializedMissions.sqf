/*
	GMS_fnc_monitorInitializedMissions
	By Ghostrider-GRG-
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

//if (GMS_monitoring) exitWith {diag_log format["_monitorInitializedMissions: execution terminated for GMS_monitoring = true at %1",diag_tickTime]};
GMS_monitoring = true;
GMS_monitoringInitPass = GMS_monitoringInitPass + 1;
//[format["_monitorInitializedMissions (17): GMS_initializedMissionsList = %1", GMS_initializedMissionsList]] call GMS_fnc_log;

private _missionsList = GMS_initializedMissionsList;
for "_i" from 1 to (count _missionsList) do 
{

	if (_i > (count _missionsList)) exitWith {};
	
	// Select a mission category (blue, red, green , etd)
	/*
		GMS_initializedMissionsList pushBack [_key, missionTimeoutAt, triggered, _missionData, _missionConfigs, _isStatic];
	*/
	private _el = _missionsList deleteAt 0;
	_el params [
		"_key",
		"_missionTimeoutAt",			// 1  // server time at which the mission times out.
		"_triggered",					// 2  // integer - specifies if mission was triggered by a player or scripting such as debug setting
		"_missionData",					// 4  //  variable containing information specific to this instance of the mission such as location and objects
		"_missionConfigs",				// 5  // Variables regarding the configuration of the  mission
		"_spawnPara",					// 6  // Needed so you only spawn paratroops once.
		"_isStatic",					// 7 // A flag as to whether the mission is a static or dynamically spawned mission.
		"_missionFile"
	];

	#define triggered 2
	private _missionCoords = (_missionData select 0); 
	#define delayTime 1

	if !(_triggered == 0) then {
		_missionsList pushBack _el;
	} else {

		try {
			if (!(_missionCoords isEqualTypeArray [0,0,0]) || _missionCoords isEqualTo [0,0,0]) throw -3; 
			private _playerInRange = if ({(_x distance2d _missionCoords) < GMS_TriggerDistance /*&& ((vehicle _x == _x) || (getPosATL _x) select 2 < 5)*/} count allPlayers > 0) then {true} else {false};			
			switch (true) do 
			{
				case ((_missionTimeoutAt > 0) && {diag_tickTime > _missionTimeoutAt && !(_isStatic)}): {
					if (GMS_debugLevel > 0) then {diag_log format["_monitorInitializedMissions (37) Mission Timeout Criteria Met at %1 for mission %2",diag_tickTime,_missionFile]};
					throw -1;
				};
				case (_playerInRange): {
					if (GMS_debugLevel > 0) then {diag_log format["_monitorInitializedMissions (52) Player in range criteria met at %1 for _missionFile %2",diag_tickTime,_missionFile]};
					throw 0;
				};
				case (GMS_debugLevel >= 3): {
					[format["_monitorInitializedMissions (54): mission triggered for GMS_debugLevel = %1 for _missionFile %2",GMS_debugLevel,_missionFile]] call GMS_fnc_log;
					throw 0;
				};  //  simulate the mission being tripped by a player
				default {
					//[format["_monitorInitializedMissions (77): throw -2 | mission not triggered or timed out at %1",diag_tickTime]] call GMS_fnc_log;					
					throw -2;
				};
			};
		}
		
		catch {
			//[format["_monitorInitializeMissions (69): diag_tickTime %1 | _missionTimeoutAt %2 | _exception %3",diag_tickTime,_missionTimeoutAt,_exception]] call GMS_fnc_log;

			switch (_exception) do {
				case -3: {
					[format["Unable to initialize Mission in _monitorInitializedMissions because an illeagal value was passed for _missionCoords of %1 for _missionFile %2",_missionCoords,_missionFile],'warning'] call GMS_fnc_log;
				};
				// Nothing needs to be done
				case -2 : {
					_missionsList pushBack _el;
				}; 

				// Handle Timeout
				case -1:
				{
					// _missionConfigs is configured as:
					/*
						private _table = [
							_aiDifficultyLevel,		// index 0
							_markerConfigs,			// index 1
							_endCondition,			// index 2
							_isscubamission,		// index 3
							_missionLootConfigs,	// index 4
							_aiConfigs,				// index 5
							_missionMessages,		// index 6
							_paraConfigs,			// index 7
							_defaultMissionLocations, 
							_maxMissionRespawns,	// index 9 
							_timesSpawned,			// index 10 
							_chanceMissionSpawned,	// index 11
							_isSpawned,				// index 12
							_spawnedAt				// index 13
						];
					*/
				_missionConfigs params[
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
					"_chanceMissionSpawned",
					"_isSpawned",
					"_spawnedAt"
				];	

				_missionMessages params [
					"_assetKilledMsg",	
					"_endMsg",
					"_timeoutMsg"
				];
								
					//[format["_fnc_monitorInitializedMissions (71): mission timed out: _endMsg %1 | el %2",_endMsg,_el]] call GMS_fnc_log;
					
					/*
						["_key",-1],
						["_missionData",[]],
						["_endMsg",,""],
						["_markerData",[]],
						["_missionLootConfigs",[]],
						["_isScuba",false],
						["_endCode",-1]
					*/		
					_missionConfigs set[isSpawned,false];
					[_key, _missionData, _timeoutMsg, _missionData,_missionLootConfigs,_isscubamission,-1] call GMS_fnc_endMission;
				}; 			
			
				//  Handle mission waiting to be triggerd and player is within the range to trigger		
				case 0: 
				{
					[_missionData,_missionConfigs,_missionFile] call GMS_fnc_spawnMissionAssets;

					// _el is structured as: 
					/* 
						_el params [
						"_key",
						"_missionTimeoutAt",			// 1  // server time at which the mission times out.
						"_triggered",					// 2  // integer - specifies if mission was triggered by a player or scripting such as debug setting
						"_missionData",					// 4  //  variable containing information specific to this instance of the mission such as location and objects
						"_missionConfigs",				// 5  // Variables regarding the configuration of the dynamic mission
						"_isStatic"						// 7 // A flag as to whether the mission is a static or dynamically spawned mission.
					];
					*/
					_el set[triggered,1];

					// _missionConfigs is configured as:
					/*
						private _table = [
							_aiDifficultyLevel,		// index 0
							_markerConfigs,			// index 1
							_endCondition,			// index 2
							_isscubamission,		// index 3
							_missionLootConfigs,	// index 4
							_aiConfigs,				// index 5
							_missionMessages,		// index 6
							_paraConfigs,			// index 7
							_defaultMissionLocations, 
							_maxMissionRespawns,	// index 9 
							_timesSpawned,			// index 10 
							_chanceMissionSpawned,	// index 11
							_isSpawned,				// index 12
							_spawnedAt				// index 13
						];
					*/	

					//_missionConfigs set[isSpawned, true];
					_missionConfigs set[spawnedAt, diag_tickTime];
					_missionsList pushBack _el;
				};
			};
		};
	};
};
GMS_monitoring = false;
