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
#include "\GMS\Compiles\Init\GMS_defines.hpp"

//if (GMS_monitoring) exitWith {diag_log format["_monitorInitializedMissions: execution terminated for GMS_monitoring = true at %1",diag_tickTime]};
GMS_monitoring = true;
GMS_monitoringInitPass = GMS_monitoringInitPass + 1;
//[format["_monitorInitializedMissions (17): GMS_initializedMissionsList = %1", GMS_initializedMissionsList]] call GMS_fnc_log;

private _missionsList = GMS_initializedMissionsList;
for "_i" from 1 to (count _missionsList) do 
{

	if (_i > (count _missionsList)) exitWith {};
	
	// Select a mission category (blue, red, green , etd)
	private _el = _missionsList deleteAt 0;
	_el params [
		"_key",
		"_missionTimeoutAt",			// 1  // server time at which the mission times out.
		"_triggered",					// 2  // integer - specifies if mission was triggered by a player or scripting such as debug setting
		"_missionData",					// 4  //  variable containing information specific to this instance of the mission such as location and objects
		"_missionConfigs",			// 5  // Variables regarding the configuration of the dynamic mission
		"_spawnPara",
		"_spawned",
		"_isStatic"
	];

	#define triggered 2
	#define missionCoords _missionData select 0 
	#define delayTime 1
	
	private _monitorAction = -2;


	if (_triggered == 0) then 
	{
		if ((_missionTimeoutAt > 0) && {diag_tickTime > _missionTimeoutAt}) then 
		{
			_monitorAction = -1;
			//diag_log format["_monitorInitializedMissions (37) Mission Timeout Criteria Met at %1",diag_tickTime];
		} else {
			private _playerInRange = [missionCoords, GMS_TriggerDistance, false, true] call GMS_fnc_playerInRange;			
			if (_playerInRange) then {
				//diag_log format["_monitorInitializedMissions (52) Player in range criteria met at %1 for _key %2",diag_tickTime,_key];
				//diag_log format["_monitorInitializedMissions(53) GMS_monitoring = %1 | GMS_monitoringInitPass = %2",GMS_monitoring,GMS_monitoringInitPass];
				//diag_log format["_monitorInitializedMissions(54) count of entries for _el = %1", {_x isEqualTo _el} count _missionsList];
				_monitorAction = 0;
			} else {
				if (GMS_debugLevel >= 3) then 
				{
					_monitorAction = 0;
					[format["_monitorInitializedMissions (54): mission triggered for GMS_debugLeve = %1",GMS_debugLevel]] call GMS_fnc_log;
				};  //  simulate the mission being tripped by a player
			};
		};
	};
	
	//diag_log format["_monitorInitializedMissions: time %1 | _monitorAction %2 | _missionParameters %3",diag_tickTime,_monitorAction,_missionParameters];

	switch (_monitorAction) do 
	{
		// Nothing needs to be done
		case -2 : {
			_missionsList pushBack _el;
		}; 

		// Handle Timeout
		case -1:
		{
			/*
				// List the full list of variables in _missionConfigs to aide in coding 

				 _missionConfigs params [
				"_difficulty",  //  index = 0
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
				"_isSpawned"  //  index = 11
			];
			*/

			_missionConfigs params[
				"_difficulty",
				"_markerConfigs",
				"_endCondition",	
				"_isscubamission",	
				"_missionLootConfigs",
				"_aiConfigs",
				"_missionMessages"
			];

			_missionMessages params [
				"_assetKilledMsg",	
				"_endMsg"
			];
						
			[format["_fnc_monitorInitializedMissions (71): mission timed out: _endMsg %1 | el %2",_endMsg,_el]] call GMS_fnc_log;
			
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
			[_key, _missionData, "", _missionData,_missionLootConfigs,_isscubamission,-1] call GMS_fnc_endMission;
			_missionsList pushBack _el;
		}; 			
		
		//  Handle mission waiting to be triggerd and player is within the range to trigger		
		case 0: 
		{
			[_missionData,_missionConfigs,_spawnPara] spawn GMS_fnc_spawnMissionAssets;
			_el set[triggered,1];
			_missionConfigs set[isSpawned,true];	
			GMS_monitorTriggered = _el select triggered;					
			_missionsList pushBack _el;
		};
	};
	//diag_log format["_monitorInitializedMissions (396) End of Code Block | GMS_initializedMissionsList = %1",GMS_initializedMissionsList];
};
GMS_monitoring = false;
//GMS_activeMonitorThreads = GMS_activeMonitorThreads - 1;