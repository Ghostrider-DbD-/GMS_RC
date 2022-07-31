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

//GMS_activeMonitorThreads = GMS_activeMonitorThreads + 1;
GMS_monitoring = true;

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
		"_spawnPara"
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
				//diag_log format["_monitorInitializedMissions (41) Player in range criteria met at %1",diag_tickTime];
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
		case -2 : {
			_missionsList pushBack _el;
		}; 
		// Handle Timeout
		case -1:
		{
			
			_missionConfigs params[
				"_difficulty",
				"_markerConfigs",
				"_endCondition",	
				"_isscubamission",	
				"_missionLootConfigs",
				"_aiConfigs",
				"_missionMessages",	
				"_paraConfigs"
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
			[_key, _missionData, "", _missionData,_missionLootConfigs,_isscubamission,-1] call GMS_fnc_endMission;
		}; 			
		
		//  Handle mission waiting to be triggerd and player is within the range to trigger		
		case 0: 
		{
			//waitUntil {!_spawningMission};
			//_spawningMission = true;  //  to prevent the script from trying to spawn multiple missions at the same time.

			#define noActive 2	
			#define waitTime 5
			#define missionData 6

			/*
				_missionData = [
					_coords,
					_mines,
					_objects,
					_hiddenObjects,
					_crates, 
					_missionInfantry,
					_assetSpawned,
					_aiVehicles,
					_lootVehicles,
					_markers];
			*/
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
				"_defaultMissionLocations"
			];	
			_markers params[
				"_shapedMarker",
				"_iconMarker"
			];		
			_missionMessages params [
				"_assetKilledMsg",	
				"_endMsg",
				"_startMsg"
			];		
			_missionLootConfigs params [
				"_spawnCratesTiming", 
				"_loadCratesTiming",		
				"_crateLoot", 
				"_lootCounts",
				"_missionLootBoxes",
				"_missionLootVehicles"
			];		
			_aiConfigs params [
				"_uniforms", 
				"_headgear", 
				"_vests", 
				"_backpacks", 
				"_weaponList",
				"_sideArms", 	
				"_missionLandscapeMode", 	
				"_garrisonedBuildings_BuildingPosnSystem", 
				"_garrisonedBuilding_ATLsystem",
				"_missionLandscape",
				"_simpleObjects",
				"_missionPatrolVehicles",
				"_submarinePatrols",  //  Added Build 227
				"_submarinePatrolParameters",
				"_airPatrols",
				"_noVehiclePatrols", 
				"_vehicleCrewCount",
				"_missionEmplacedWeapons",
				"_noEmplacedWeapons", 
				"_useMines", 
				"_minNoAI", 
				"_maxNoAI", 
				"_noAIGroups", 		
				"_missionGroups",
				"_scubaPatrols",  //  Added Build 227
				"_scubaGroupParameters",		
				"_hostageConfig",
				"_enemyLeaderConfig",
				"_chanceHeliPatrol", 
				"_noChoppers", 
				"_missionHelis"
			];
		

			_el set[triggered,1];
			private["_temp"];
			if (GMS_SmokeAtMissions select 0) then  // spawn a fire and smoke near the crate
			{
				_temp = [_coords,GMS_SmokeAtMissions select 1] call GMS_fnc_smokeAtCrates;
				_objects append _temp;
				//[format["_monitorInitializedMissions (181): added Smoke objects, _iconMarker %3 | count _objects = %1 | _objects = %2",count _objects, _objects,_iconMarker]] call GMS_fnc_log;
				uiSleep delayTime;					
			};
		
			if (_useMines) then
			{
				_temp = [_coords] call GMS_fnc_spawnMines;	
				_mines = _temp;
				//[format["_monitorInitializedMissions (189): spawned mines for mission _iconMarker %3 | located at %1 | mines = %2",_coords,_mines,_iconMarker]] call GMS_fnc_log;								
				uiSleep delayTime;							
			};			

			if (_missionLandscapeMode isEqualTo "random") then
			{
				_temp = [_coords,_missionLandscape, 3, 15, 2] call GMS_fnc_spawnRandomLandscape;
				//[format["_monitorInitializedMissions (196): spawned randomly place objects for _iconMarker %3 | at %1 | list of objects = %2",_coords,_temp select 0,_iconMarker]] call GMS_fnc_log;
			} else {
				_temp = [_coords, _missionLandscape] call GMS_fnc_spawnCompositionObjects;
				//[format["_monitorInitializedMissions (199): precisly positioned objects for _iconMarker %3 | at %1 | list of objects = %2",_coords,_temp select 0,_iconMarker]] call GMS_fnc_log;
			};
			_temp params["_obj","_hiddenObj"];
			_objects append _obj;
			_hiddenObjects append _hiddenObj;
			//[format["_monitorInitializedMissions (204): added landscape objects for _iconMarker %1 | count _objects = %2 | _objects = %3",_iconMarker,count _objects, _objects]] call GMS_fnc_log;
			uiSleep delayTime;	

			_temp = [_coords,_simpleObjects,true] call GMS_fnc_spawnSimpleObjects;
			_objects append _temp;
			//[format["_monitorInitializedMissions (209): added simple objects for _iconMarker %1 | count _objects = %2 | _objects = %3",_iconMarker,count _objects, _objects]] call GMS_fnc_log;

			_ai = [_coords, _minNoAI,_maxNoAI,_noAIGroups,_missionGroups,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms,_isScubaMission] call GMS_fnc_spawnMissionAI;
			_missionInfantry append _ai;
			//[format["_monitorInitializedMissions (213): spawned mission AI for _iconMarker %1 at %2 | with count _missionInfantry = %3 | with _missionInfantry = %4",_iconMarker,diag_tickTime,count _missionInfantry, _missionInfantry]] call GMS_fnc_log;
			uiSleep delayTime;

			if (!(_scubaGroupParameters isEqualTo []) || {_scubaPatrols > 0}) then 
			{
				_ai = [_coords, _minNoAI,_maxNoAI,_scubaPatrols,_scubaGroupParameters,_difficulty,GMS_UMS_uniforms,GMS_UMS_headgear,GMS_UMS_vests,_backpacks,GMS_UMS_weapons,_sideArms,true] call GMS_fnc_spawnMissionAI;
				_missionInfantry append _ai;
				uiSleep delayTime;
			};

			// TODO: 05/08/22 -> redo code to handle this
			if !(_hostageConfig isEqualTo []) then
			{
				_temp = [_coords,_hostageConfig] call GMS_fnc_spawnHostage;
				_assetSpawned = _temp select 0;
				_objects pushBack (_temp select 1);  //  The building in which the asset was spawned.
				uiSleep delayTime;
			};

			// TODO: 05/08/22 -> redo code to handle this
			if !(_enemyLeaderConfig isEqualTo []) then
			{
				_temp = [_coords,_enemyLeaderConfig] call GMS_fnc_spawnLeader;
				if (_temp isEqualTo grpNull) then {throw 1} else 
				{
					_assetSpawned = _temp select 0;
					_objects pushBack (_temp select 1);	//  The building in which the asset was spawned.
					_missionInfantry pushBack _assetSpawned;
				};
				uiSleep delayTime;
			};

			private _noChoppers = [_noChoppers] call GMSCore_fnc_getNumberFromRange;
			//[format["_monitorInitializeMissions(246): _iconMarker %1 | _noChoppers = %2",_iconMarker,_noChoppers]] call GMS_fnc_log;
			if ((_noChoppers > 0) && {random(1) < _chanceHeliPatrol}) then
			{
				_temp = [_coords,_noChoppers,_missionHelis,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList, _sideArms] call GMS_fnc_spawnMissionHelis;
				_temp params["_helisSpawned","_unitsSpawned"];
				//[format["_monitorInitializeMissions (251): _iconMarker %1 | _helisSpawned = %2",_iconMarker,_helisSpawned]] call GMS_fnc_log;

				GMS_monitoredVehicles append _helisSpawned;
				GMS_aircraftPatrols append _helisSpawned; // Used to find nearest heli ... 
				_aiVehicles append _helisSpawned;
				_missionInfantry append _unitsSpawned;				
				uisleep delayTime;				
			};	

			// TODO: 05/08/22 -> redo code to handle this
			if !(_garrisonedBuilding_ATLsystem isEqualTo []) then  // Note that there is no error checking here for nulGroups
			{
				_temp = [_coords, _garrisonedBuilding_ATLsystem, _difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_garrisonBuilding_ATLsystem;
				_temp params["_unitsSpawned","_staticsSpawned","_buildingsSpawned"];
				_objects append _buildingsSpawned;
				//[format["_monitorInitializedMissions (264): added ATL Garrisons, _iconMarker %1 | count _objects = %2 | _objects = %3",_iconMarker,count _objects, _objects]] call GMS_fnc_log;
				GMS_monitoredVehicles append _staticsSpawned;
				_missionInfantry append _unitsSpawned;
				uiSleep delayTime;				
			};	

			// TODO: 05/08/22 -> redo code to handle this
			if !(_garrisonedBuildings_BuildingPosnSystem isEqualTo []) then
			{
				_temp = [_coords, _garrisonedBuildings_BuildingPosnSystem, _difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_garrisonBuilding_RelPosSystem;
				_objects append (_temp select 1);
				GMS_monitoredVehicles append (_temp select 2);
				_missionInfantry append (units (_temp select 0));					
				uiSleep delayTime;
			};

			private _userelativepos = true;
			private _emplacedWeaponsThisMission = [_noEmplacedWeapons] call GMSCore_fnc_getNumberFromRange;
			if (GMS_useStatic && {((_emplacedWeaponsThisMission > 0) || {!(_missionEmplacedWeapons isEqualTo [])} )} ) then
			{
				_temp = [_coords,_missionEmplacedWeapons,_userelativepos,_emplacedWeaponsThisMission,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_spawnEmplacedWeaponArray;
				_temp params["_statics","_units"];
				_objects append _statics;
				_missionInfantry append _units;			
				//[format["_monitorInitializedMissions (288): spawned emplaced weapons for _iconMarker %1 at %2 | with count _missionInfantry = %3 | with _statics = %4",_iconMarker,diag_tickTime,count _missionInfantry, _statics]];															
				uisleep delayTime;				
			};


			if !(_missionLootVehicles isEqualTo []) then 
			{
				_lootVehicles = [_coords,_missionLootVehicles,_spawnCratesTiming] call GMS_fnc_spawnMissionLootVehicles;				
				uiSleep delayTime;
			};

			private _noPatrols = [_noVehiclePatrols] call GMSCore_fnc_getNumberFromRange;
			//[format["_monitorInitializedMissions (300): _iconMarker %1 | _noPatrols (vehicle) = %2",_iconMarker,_noPatrols]] call GMS_fnc_log;
			if (GMS_useVehiclePatrols && {( (_noPatrols > 0) || {!(_missionPatrolVehicles isEqualTo [])} )} ) then
			{
				_temp = [_coords,_noPatrols,_difficulty,_missionPatrolVehicles,_userelativepos,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms,false,_vehicleCrewCount] call GMS_fnc_spawnMissionVehiclePatrols;
				_temp params["_vehs","_units"]; 

				_aiVehicles append _vehs;
				_missionInfantry append _units;
				//[format["_monitorInitializedMissions (307): spawned vehicle patrols for _shapedMarker %1 at %2 | with count _missionInfantry = %3 | with _vehs = %4 | _missionInfantry = %5",_shapedMarker,diag_tickTime,count _missionInfantry, _vehs, _missionInfantry]] call GMS_fnc_log;
				uiSleep delayTime;				
			};	

			if (GMS_useVehiclePatrols && {((_submarinePatrols > 0) || {!(_submarinePatrolParameters isEqualTo [])} )} ) then
			{
				_temp = [_coords,_noPatrols,_difficulty,_submarinePatrolParameters,_userelativepos,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms,_isScubaMission,_vehicleCrewCount] call GMS_fnc_spawnMissionVehiclePatrols;
				_temp params["_vehs","_units"]; 
				GMS_monitoredVehicles append _vehs;
				GMS_landVehiclePatrols append _vehs;
				_aiVehicles append _vehs;
				_missionInfantry append _units;
				uiSleep  delayTime;
				//[format["_monitorInitializedMissions: spawned sub patrols %1",_coords]] call GMS_fnc_log;
			};		
	
			if (_spawnCratesTiming in ["atMissionSpawnGround","atMissionSpawnAir"]) then
			{
				if (_missionLootBoxes isEqualTo []) then
				{
					_crates = [_coords,[[selectRandom GMS_crateTypes,[1,1,0],_crateLoot,_lootCounts]], _loadCratesTiming, _spawnCratesTiming, "start", _difficulty] call GMS_fnc_spawnMissionCrates;
					//[format["_monitorInitializedMissions (326): _shapedMarker %1 | standard locations for crates at %2 | _crates = %3",_shapedMarker,_coords,_crates]] call GMS_fnc_log;
				}
				else
				{
					_crates = [_coords,_missionLootBoxes,_loadCratesTiming, _spawnCratesTiming, "start", _difficulty] call GMS_fnc_spawnMissionCrates;	
					//[format["_monitorInitializedMissions (331): _iconMarker %1 | predefined locations for crates at %2 | _crates = %3",_iconMarker,_coords,_crates]] call GMS_fnc_log;												
				};
				//diag_log format["monitorInitializedMission (333): _spawnCrates Timing = %1 / crates spawned = %2",_spawnCratesTiming,_crates];
				if (GMS_cleanUpLootChests) then
				{
					_objects append _crates;
				};
				if (_loadCratesTiming isEqualTo "atMissionSpawn") then 
				{
					private _crateMoney = missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty]);
					//[format["_monitorInitializedMissions (341) _crateMoney = %1",_crateMoney]] call GMS_fnc_log;
					{
						[_x,missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty])] call GMS_fnc_setMoney;
					} forEach _crates;
					//diag_log format["monitorInitializedMission (345): _iconMarker %1 | Loot LOADED _loadCrates Timing = %2",_iconMarker,_loadCratesTiming];
				} else {
					//diag_log format["monitorInitializedMission (347): _iconMarker %1 | NO Loot LOADED _loadCrates Timing = %2",_iconMarker,_loadCratesTiming];
				};
			};
			//[format["_monitorInitializedMissions (351): added crates, count _crates = %1 | _crates = %2",count _crates, _crates]] call GMS_fnc_log;
			uiSleep  1;
		//	[format["_monitorInitializedMissions (353): _markers selet 1 = %1 | _iconMarker = %2",_markers select 1, _iconMarker]] call GMS_fnc_log;
			if (GMS_showCountAliveAI) then
			{
				GMS_missionLabelMarkers pushBack [
					_markers select 1,  //  The icon marker used for adding text to markers 
					_markerConfigs select 1,  // The name of the mission shown to players on markers and in allerts
					_missionInfantry  //  The array of units tied to the mission used in this case to keep a count of units still alive that is shown on the map
				];
			};
			
			{
				_x setVariable["crateSpawnPos", (getPos _x)];
			} forEach _crates;			
			//[format["_monitorInitializedMissions (361): _shapedMarker %1 | _mines = %3",_shapedMarker,_coords,_mines]] call GMS_fnc_log;
			//[format["_monitorInitializedMissions (362): _shapedMarker %1 | _crates = %3",_shapedMarker,_coords,_crates]] call GMS_fnc_log;			
			#define indexMines 1 
			#define indexCrates 4
			_missionData set[indexMines, _mines]; 
			_missionData set[indexCrates, _crates];
			//_missionData = [_coords,_mines,_objects,_hiddenObjects,_crates,_missionInfantry,_assetSpawned,_aiVehicles,_lootVehicles,_markers];

			//_el set[missionData, _missionData];

			// Everything spawned withouth serious errors so lets keep the mission active for future monitoring
			//_spawningMission = false;
			_missionsList pushBack _el;	
			_el params [
				"_key",
				"_missionTimeoutAt",			// 1  // server time at which the mission times out.
				"_triggered",					// 2  // integer - specifies if mission was triggered by a player or scripting such as debug setting
				"_missionData",					// 4  //  variable containing information specific to this instance of the mission such as location and objects
				"_missionConfigs"			// 5  // Variables regarding the configuration of the dynamic mission
			];
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
			//[format["_monitorInitializedMissions (393): _shapedMarker %1 | _coords %2 | count _mines %3 | count _objects %4 | _crates %5",_shapedMarker,_coords,count _mines,count _objects,_crates]] call GMS_fnc_log;
		};
	};
	//diag_log format["_monitorInitializedMissions (396) End of Code Block | GMS_initializedMissionsList = %1",GMS_initializedMissionsList];
};
GMS_monitoring = false;
//GMS_activeMonitorThreads = GMS_activeMonitorThreads - 1;