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

#define missionData 4
#define noActive 2
#define waitTime 5
#define missionTimeout 1

//[format["_monitorSpawnedMissions (20): count GMS_initializedMissionsList =%1 | GMS_initializedMissionsList = %2",count GMS_initializedMissionsList,GMS_initializedMissionsList]] call GMS_fnc_log;
private _missionsList = GMS_initializedMissionsList;
for "_i" from 1 to (count _missionsList) do 
{
	if (_i > count _missionsList) exitWith {};
	// Select a mission category (blue, red, green , etd)
	private _el = _missionsList deleteAt 0;
	_el params [
		"_key",
		"_missionTimeoutAt",			// 1  // server time at which the mission times out.
		"_triggered",					// 2  // integer - specifies if mission was triggered by a player or scripting such as debug setting
		"_missionData",					// 4  //  variable containing information specific to this instance of the mission such as location and objects
		"_missionConfigs",			// 5  // Variables regarding the configuration of the dynamic mission
		"_spawnPara",
		"_isStatic"
	];
	#define triggered 2
	#define spawnPara 5
	#define delayTime 1
	if (_triggered == 1) then 
	{
		_missionData params [
			"_coords",
			"_mines",
			"_objects",
			"_hiddenObjects",
			"_crates",
			"_missionInfantry",
			"_assetSpawned",
			"_aiVehicles",
			"_lootVehicles",
			"_markers"
		];	

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
			"_isSpawned"
		];	

		private _missionComplete = -1;
		private ["_secureAsset","_endIfPlayerNear","_endIfAIKilled"];
		//[format["_monitorSpawnedMissions: (67): _endCondition = %1 | _missionMarkerName = %2",_endCondition, _markerConfigs select 1]] call GMS_fnc_log;
		switch (_endCondition) do
		{
			case playerNear: {_secureAsset = false; _endIfPlayerNear = true;_endIfAIKilled = false;};
			case allUnitsKilled: {_secureAsset = false; _endIfPlayerNear = false;_endIfAIKilled = true;};
			case allKilledOrPlayerNear: {_secureAsset = false; _endIfPlayerNear = true;_endIfAIKilled = true;};
			case assetSecured: {_secureAsset = true; _endIfPlayerNear = false; _endIfAIKilled = false;};
			default {_secureAsset = false; _endIfPlayerNear = true;_endIfAIKilled = true;};
		};

		try {
			//[format["_monitorSpawnedMissions: (88): _spawnPara = %3 | count _missionInfantry = %1 | _crates = %2",count _missionInfantry, _crates,_spawnPara]] call GMS_fnc_log;
			if (GMS_debugLevel >= 5) throw 1;
			if (GMS_debugLevel >= 4) throw 4;
			private _playerIsNearCrates = [_crates,20,true] call GMS_fnc_playerInRangeArray;
			private _playerIsNearCenter = [_coords,20,true] call GMS_fnc_playerInRange;
			private _playerIsNear = if (_playerIsNearCrates || {_playerIsNearCenter}) then {true} else {false};
			GMS_playerIsNear = _playerIsnear;

			private _minNoAliveForCompletion = (count _missionInfantry) - (round(GMS_killPercentage * (count _missionInfantry)));			
			private _aiKilled = if (({alive _x} count _missionInfantry) <= _minNoAliveForCompletion)  then {true} else {false}; // mission complete
			GMS_aiKilled = _aiKilled; 

			if (_endIfPlayerNear && {_playerIsNear}) then {throw 1}; // mission complete
			if (_endIfAIKilled && {_aiKilled}) then {throw 1};			
			if (_spawnPara isEqualType -1) then 
			{
				#define chancePara 0;
				private _chancePara = _paraConfigs select chancePara;
				_spawnPara = if (random(1) < _chancePara ) then {true} else {false};
				_el set[spawnPara, _spawnPara];
			};
			if (_spawnPara) then
			{
				#define paraTriggerDistance 1
				if ([_coords,_paraConfigs select paraTriggerDistance,true] call GMS_fnc_playerInRange) then
				{
					_spawnPara = false; // The player gets one try to spawn these.
					_el set[spawnPara,_spawnPara];
					_paraConfigs params[
						"_chancePara",													 
						"_paraTriggerDistance",
						"_noPara",						
						"_paraSkill",
						"_chanceLoot", 
						"_paraLoot", 
						"_paraLootCounts"
					];						
					_aiConfigs params [
						"_uniforms", 
						"_headgear", 
						"_vests", 
						"_backpacks", 
						"_weaponList",
						"_sideArms"	
					];	
					//params["_pos","_numAI","_skilllevel",["_uniforms",[]],["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weapons",[]],["_sideArms",[]],["_isScuba",false]];
					private _paraGroup = [_coords,_noPara,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms,_isScubaMission] call GMS_fnc_spawnParaUnits;
					//[format["_monitorSpawneMissions: _noPara = %1 | _chancePara = %2 | _paraGroup = %3",_noPara,_chancePara,_paraGroup]] call GMS_fnc_log;
					if !(isNull _paraGroup) then 
					{
						_missionInfantry append (units _paraGroup);
						if (random(1) < _chanceLoot) then
						{
							private _extraCrates = [_coords,[[selectRandom GMS_crateTypes,[0,0,0],_paraLoot,_paraLootCounts]], "atMissionSpawn","atMissionSpawnAir", "start", _difficulty] call GMS_fnc_spawnMissionCrates;
							if (GMS_cleanUpLootChests) then
							{
								_objects append _extraCrates;
							};		
						};	
						_missionData = [_coords,_mines,_objects,_hiddenObjects,_crates,_missionInfantry,_assetSpawned,_aiVehicles,_lootVehicles,_markers];
						_el set[missionData, _missionData];							
						//diag_log format["_monitorSpawnedMissions (134): para spawned at %1",diag_tickTime];
					};
				};
			};

			if (_secureAsset) then
			{		
				if !(alive _assetSpawned) then 
				{
					throw 3;
				} else {
					
					if (({alive _x} count _missionInfantry) <= (_minNoAliveForCompletion + 1)) then
					{
						if ((_assetSpawned getVariable["GMS_unguarded",0]) isEqualTo 0) then 
						{
							_assetSpawned setVariable["GMS_unguarded",1,true];
						};
						
						if ((_assetSpawned getVariable["GMS_AIState",0]) isEqualTo 1) then 
						{
							_assetSpawned allowdamage false;
							[_assetSpawned] remoteExec["GMS_fnc_clearAllActions",-2, true];
							throw 1;								
						};
					};
				};
			};

			private _moved = false;
			if (!(_crates isEqualTo []) && {GMS_crateMoveAllowed}) then 
			{
				{
					if ( _x distance (_x getVariable ["crateSpawnPos", (getPos _x)]) > max_distance_crate_moved_uncompleted_mission) throw 2;
				} forEach _crates;
			};

			// If there were no throws then lets add the mission parameters back to the list of active missions and check on the mission in a bit.
			_missionsList pushBack _el;			
		}

		catch // catch all conditions that cause the mission to end.
		{
			/*
			_markerConfigs params [
				"_markerLabel",
				"_markerMissionName"  //  A trunkated list of variables is parsed as we do not need all of them
			];
			*/
			#define markerMissionName 1 
			private _markerMissionName = _markerConfigs select markerMissionName;
			
			_missionLootConfigs params [
				"_spawnCratesTiming", 
				"_loadCratesTiming",		
				"_crateLoot", 
				"_lootCounts",
				"_missionLootBoxes",
				"_missionLootVehicles"
			];

			_missionMessages params [
				"_assetKilledMsg",	
				"_endMsg"
			];
			
			switch (_exception) do 
			{
				case 1: {  // Normal Mission End
					//diag_log format["_monitorSpawnedMissions: (200): _markerMissionName %1: Normal mission end",_markerMissionName];
	
					if ((_spawnCratesTiming) in ["atMissionEndGround","atMissionEndAir"]) then
					{
						if !(_missionLootBoxes isEqualTo []) then
						{
							_crates = [_coords,_missionLootBoxes,_loadCratesTiming,(_missionLootConfigs select spawnCratesTiming), "end", _difficulty] call GMS_fnc_spawnMissionCrates;
						}
						else
						{
							_crates = [_coords,[[selectRandom GMS_crateTypes,[0,0,0],_crateLoot,_lootCounts]], _loadCratesTiming,(_missionLootConfigs select spawnCratesTiming), "end", _difficulty] call GMS_fnc_spawnMissionCrates;
						};
						
						if (GMS_cleanUpLootChests) then
						{
							_objects append _crates;
						};
						private _crateMoney = missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty]);	
						//[format["_monitorSpawnedMissions: (218) _crateMoney = %1",_crateMoney]] call GMS_fnc_log;																		
						{
							[_x, _crateMoney] call GMSCore_fnc_setMoney;
						} forEach _crates;				
					};	

					if (_loadCratesTiming isEqualTo "atMissionCompletion") then
					{
						private _crateMoney = missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty]);
						//[format["_monitorSpawnedMissions: (227) _crateMoney = %1",_crateMoney]] call GMS_fnc_log;									
						{
							[_x] call GMS_fnc_loadMissionCrate;											
							[_x, _crateMoney] call GMSCore_fnc_setMoney;									
						} forEach _crates;
						//diag_log format["_monitorSpawnedMissions: (232): Loot and Money LOADED _loadCrates Timing = %1 | _crates = %2",_loadCratesTiming,_crates];									
						{
							[_x] call GMS_fnc_loadMissionCrate;											
							//[_x, missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty])] call GMS_fnc_setMoney;										
						} forEach _lootVehicles;		
						//diag_log format["_monitorSpawnedMissions: (237): Loot LOADED _loadCrates Timing = %1",_loadCratesTiming];	
					};

					_aiVehicles append _lootVehicles;  //  So these are deleted if no player enters the driver's seat.
					if (_secureAsset) then
					{
						if (_assetSpawned getVariable["assetType",0] isEqualTo 1) then
						{
							_assetSpawned setVariable["GMSAnimations",[""],true];
							[_assetSpawned,""] remoteExec["switchMove",-2];;
							uiSleep 0.1;
							_assetSpawned enableAI "ALL";
							private _newPos = (getPos _assetSpawned) getPos [1000, random(360)];
							(group _assetSpawned) setCurrentWaypoint [group _assetSpawned, 0];
							[group _assetSpawned,0] setWaypointPosition [_newPos,0];
							[group _assetSpawned,0] setWaypointType "MOVE";
						};

						if (_assetSpawned getVariable["assetType",0] isEqualTo 2) then
						{
							[_assetSpawned,""] remoteExec["switchMove",-2];
							_assetSpawned setVariable["GMSAnimations",_assetSpawned getVariable["endAnimation",["AidlPercMstpSnonWnonDnon_AI"]],true];
							[_assetSpawned,selectRandom(_assetSpawned getVariable["endAnimation",["AidlPercMstpSnonWnonDnon_AI"]])] remoteExec["switchMove",-2];
						};
					};
					//diag_log format["_monitorSpawnedMissions: (262):_crates = %1",_crates];
					/*
						["_key",-1],
						["_missionData",[]],
						["_endMsg",,""],
						["_markerData",[]],
						["_missionLootConfigs",[]],
						["_isScuba",false],
						["_endCode",-1]
					*/
					//[format["_monitorSpawnedMissions (case 1): _markerConfigs %1 | _endMsg %2",_markerConfigs,_endMsg]] call GMS_fnc_log;
					[_key, _missionData, _endMsg, _markerConfigs, _missionLootConfigs,_isscubamission, 1] call GMS_fnc_endMission;
					_missionConfigs set [isSpawned,false];
					//[format["_monitorSpawnedMissions (265): _markerMissionName %1: end of case 1 for mission completion",_markerMissionName]] call GMS_fnc_log;
				};

				case 2: { // Abort, crate moved.
					_endMsg = "Crate Removed from Mission Site Before Mission Completion: Mission Aborted";
					/*
						["_key",-1],
						["_missionData",[]],
						["_endMsg",,""],
						["_markerData",[]],
						["_missionLootConfigs",[]],
						["_isScuba",false],
						["_endCode",-1]
					*/			
					//[format["_monitorSpawnedMissions (case 2): _markerConfigs %1 | _endMsg %2",_markerConfigs,_endMsg]] call GMS_fnc_log;							
					[_key, _missionData, _endMsg, _markerConfigs, _missionLootConfigs, _isscubamission, 2] call GMS_fnc_endMission;	
					_missionConfigs set [isSpawned,false];												
				};

				case 3: {  // Abort, key asset killed			
					/*
						["_key",-1],
						["_missionData",[]],
						["_endMsg",,""],
						["_markerData",[]],
						["_missionLootConfigs",[]],
						["_isScuba",false],
						["_endCode",-1]
					*/		
					//[format["_monitorSpawnedMissions (case 3): _markerConfigs %1 | _assetKilledMsg %2",_markerConfigs,_assetKilledMsg]] call GMS_fnc_log;						
					[_key, _missionData, _assetKilledMsg, _markerConfigs, _missionLootConfigs,_isscubamission, 3] call GMS_fnc_endMission;	
					_missionConfigs set [isSpawned,false];											
				};

				case 4: {
					// Used for testing purposes only 
					//[format["Programed mission abort, debug level >= 4"]] call GMS_fnc_log;
					/*
						["_key",-1],
						["_missionData",[]],
						["_endMsg",,""],
						["_markerData",[]],
						["_missionLootConfigs",[]],
						["_isScuba",false],
						["_endCode",-1]
					*/
					//diag_log format["_monitorSpawnedMissions: (286): _crates = %1 | _mines = %2",_crates,_mines];					
					[_key, _missionData, "DEBUG SETTING >= 4", _markerConfigs, _missionLootConfigs, _isscubamission, 4] call GMS_fnc_endMission;
					_missionConfigs set [isSpawned,false];																
				};
				
				case 5: {  // SIMULATED Normal Mission End
					//diag_log format["_monitorSpawnedMissions: (291): _markerMissionName %1: Normal mission end",_markerMissionName];
	
					if ((_spawnCratesTiming) in ["atMissionEndGround","atMissionEndAir"]) then
					{
							if !(_missionLootBoxes isEqualTo []) then
							{
								_crates = [_coords,_missionLootBoxes,_loadCratesTiming,(_missionLootConfigs select spawnCratesTiming), "end", _difficulty] call GMS_fnc_spawnMissionCrates;
							}
							else
							{
								_crates = [_coords,[[selectRandom GMS_crateTypes,[0,0,0],_crateLoot,_lootCounts]], _loadCratesTiming,(_missionLootConfigs select spawnCratesTiming), "end", _difficulty] call GMS_fnc_spawnMissionCrates;
							};
							
							if (GMS_cleanUpLootChests) then
							{
								_objects append _crates;
							};
							private _crateMoney = missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty]);	
							//[format["_monitorSpawnedMissions: (312) _crateMoney = %1",_crateMoney]] call GMS_fnc_log;																		
							{
								[_x, _crateMoney] call GMSCore_fnc_setMoney;
							} forEach _crates;				
					};	

					if (_loadCratesTiming isEqualTo "atMissionCompletion") then
					{
							private _crateMoney = missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty]);
							//[format["_monitorSpawnedMissions: (323) _crateMoney = %1",_crateMoney]] call GMS_fnc_log;									
							{
								[_x] call GMS_fnc_loadMissionCrate;											
								[_x, _crateMoney] call GMSCore_fnc_setMoney;									
							} forEach _crates;
							//diag_log format["_monitorSpawnedMissions: (329): Loot and Money LOADED _loadCrates Timing = %1 | _crates = %2",_loadCratesTiming,_crates];									
							{
								[_x] call GMS_fnc_loadMissionCrate;											
								//[_x, missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty])] call GMS_fnc_setMoney;										
							} forEach _lootVehicles;		
							//diag_log format["_monitorSpawnedMissions: (592): Loot LOADED _loadCrates Timing = %1",_loadCratesTiming];																	
					};

					_aiVehicles append _lootVehicles;  //  So these are deleted if no player enters the driver's seat.
					if (_secureAsset && {(alive _assetSpawned)}) then
					{
						if (_assetSpawned getVariable["assetType",0] isEqualTo 1) then
						{
							_assetSpawned setVariable["GMSAnimations",[""],true];
							[_assetSpawned,""] remoteExec["switchMove",-2];;
							uiSleep 0.1;
							_assetSpawned enableAI "ALL";
							private _newPos = (getPos _assetSpawned) getPos [1000, random(360)];
							(group _assetSpawned) setCurrentWaypoint [group _assetSpawned, 0];
							[group _assetSpawned,0] setWaypointPosition [_newPos,0];
							[group _assetSpawned,0] setWaypointType "MOVE";
						};

						if (_assetSpawned getVariable["assetType",0] isEqualTo 2) then
						{
							[_assetSpawned,""] remoteExec["switchMove",-2];
							_assetSpawned setVariable["GMSAnimations",_assetSpawned getVariable["endAnimation",["AidlPercMstpSnonWnonDnon_AI"]],true];
							[_assetSpawned,selectRandom(_assetSpawned getVariable["endAnimation",["AidlPercMstpSnonWnonDnon_AI"]])] remoteExec["switchMove",-2];
						};
					};
					//diag_log format["_monitorSpawnedMissions: (360):_crates = %1",_crates];

					[_key, _missionData, _endMsg, _markerConfigs, _missionLootConfigs,_isscubamission, 5] call GMS_fnc_endMission;
					_missionConfigs set [isSpawned,false];					
					//[format["_monitorSpawnedMissions (363): _markerMissionName %1: end of case 1 for mission completion",_markerMissionName]] call GMS_fnc_log;
				};				
			};
		};
	} else {
		_missionsList pushBack _el;
	};
};

GMS_monitoring = false;
//GMS_activeMonitorThreads = GMS_activeMonitorThreads - 1;