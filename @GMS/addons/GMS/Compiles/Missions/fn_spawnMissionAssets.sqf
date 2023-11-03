/*
	GMS_fnc_spawnMissionAssets 
	Copyright 2023 Ghostrider[GRG]
*/

params[
	"_missionData",		// Defined below
	"_missionConfigs",	// Defined below
	"_missionFile"
];

#define triggered 2
#define missionCoords _missionData select 0 
#define delayTime 1
#define noActive 2	
#define waitTime 5
#define missionData 6

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
	"_missionLootVehicles",
	"_cleanupLootContainers"
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
	"_missionGarrisonedGroups",
	"_scubaPatrols",  //  Added Build 227
	"_scubaGroupParameters",		
	"_hostageConfig",
	"_enemyLeaderConfig",
	"_chanceHeliPatrol", 
	"_noChoppers", 
	"_missionHelis"
];
_markerConfigs params[
	"_markerName",  //  The unique text identifier for the marker
	"_markerMissionName"
];

private["_temp"];
private _countUnits = 0;
private _unitsAdded = 0;
if (GMS_SmokeAtMissions select 0) then  // spawn a fire and smoke near the crate
{
	/*
		params[["_pos",[0,0,0]],
			["_mode","random"],
			["_maxDist",12],
			["_wrecks",_wrecksAvailable],
			["_addFire",false]];
	*/
	_temp = [_coords,GMS_SmokeAtMissions select 1, GMS_wrecksAtMissions] call GMS_fnc_spawnSmokingObject;
	_objects append _temp;
	uiSleep delayTime;					
};

if (_useMines) then
{
	_temp = [_coords] call GMS_fnc_spawnMines;	
	_mines = _temp;							
	uiSleep delayTime;							
};			

if (_missionLandscapeMode isEqualTo "random") then
{
	_temp = [_coords,_missionLandscape, 3, 15, 2] call GMS_fnc_spawnRandomLandscape;
} else {
	_temp = [_coords, _missionLandscape] call GMS_fnc_spawnCompositionObjects;
};
_temp params["_obj","_hiddenObj"];
_objects append _obj;
_hiddenObjects append _hiddenObj;
uiSleep delayTime;	

_temp = [_coords,_simpleObjects,true] call GMS_fnc_spawnSimpleObjects;
_objects append _temp;

if (!(_missionGroups isEqualTo []) || _noAIGroups > 0) then // The idea is that defining groups in _missionGroups overrides the _noAIGroups setting
{
	_ai = [_coords, _minNoAI,_maxNoAI,_noAIGroups,_missionGroups,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms,_isScubaMission] call GMS_fnc_spawnMissionAI;
	_missionInfantry append _ai;
	uiSleep delayTime;
};
 
_countUnits = count _missionInfantry;
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


/*  
	No longer needed as of Build 270
	Kept for backwards compatibility with existing missions. 
*/
if !(_garrisonedBuilding_ATLsystem isEqualTo []) then  // Note that there is no error checking here for nulGroups
{
	_temp = [_coords, _garrisonedBuilding_ATLsystem, _difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_garrisonBuilding_ATLsystem;
	_temp params["_unitsSpawned","_staticsSpawned","_buildingsSpawned"];
	_objects append _buildingsSpawned;
	GMS_monitoredVehicles append _staticsSpawned;
	_missionInfantry append _unitsSpawned;
	_unitsAdded = count _unitsSpawned;
	uiSleep delayTime;	
	//diag_log format["_fnc_spawnMissionAssets (after GMS_fnc_garrisonBuilding_ATLsystem): _unitsAdded = %1",_unitsAdded];
};	

/*
if !(_garrisonedBuildings_BuildingPosnSystem isEqualTo []) then
{
	
	_temp = [_coords, _garrisonedBuildings_BuildingPosnSystem, _difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_garrisonBuilding_RelPosSystem;
	_objects append (_temp select 1);
	GMS_monitoredVehicles append (_temp select 2);
	_missionInfantry append (units (_temp select 0));					
	uiSleep delayTime;
};
*/
/*  GMS_fnc_garrisonBuilding_RelPosSystem
	params["_coords",
		["_missionEmplacedWeapons",[]],
		["_useRelativePos",true],
		["_aiDifficultyLevel","red"],
		["_uniforms",[]], 
		["_headGear",[]],
		["_vests",[]],
		["_backpacks",[]],
		["_weaponList",[]],
		["_sideArms",[]]];
*/			
private _userelativepos = true;
 
if (GMS_useStatic && !(_missionEmplacedWeapons isEqualTo [])) then
{
	_temp = [_coords,_missionEmplacedWeapons,_userelativepos,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_spawnEmplacedWeaponArray;
	_temp params["_statics","_units"];
	_objects append _statics;
	_missionInfantry append _units;			
	uisleep delayTime;				
} else {
	
	// GMSCore_fnc_getNumberFromRange returns -1 if there was an issue.
	if (([_noEmplacedWeapons] call GMSCore_fnc_getNumberFromRange) > 0) then {
		private _wepPositions = [_coords,_noEmplacedWeapons,35,50] call GMS_fnc_findPositionsAlongARadius;
		private _emplacedWeaponsRandom = [];
		{
			_static = selectRandom GMS_staticWeapons;
			_emplacedWeaponsRandom pushBack [_static,_x,0];
		} forEach _wepPositions;
		_temp = [_coords,_emplacedWeaponsRandom,_userelativepos,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_spawnEmplacedWeaponArray;
		_temp params["_statics","_units"];
		_objects append _statics;
		_missionInfantry append _units;																
		uisleep delayTime;
	};						
};
diag_log format["_spawnMissionAssets(241): _missionLootVehicles = %1",_missionLootVehicles];
if !(_missionLootVehicles isEqualTo []) then 
{
	_lootVehicles = [_coords,_missionLootVehicles,_spawnCratesTiming,_missionFile] call GMS_fnc_spawnMissionLootVehicles;				
	uiSleep delayTime;
};

/*  GMS_fnc_spawnMissionVehiclePatrols
	params[
		["_coords",[]],
		["_skillAI","Red"],
		["_missionPatrolVehicles",[]],
		["_useRelativePos",true],
		["_uniforms",[]], 
		["_headGear",[]],
		["_vests",[]],
		["_backpacks",[]],
		["_weaponList",[]],
		["_sideArms",[]], 
		["_isScubaGroup",false],
		["_crewCount",4]
	];
*/
diag_log format["_spawnMissionAssets (264): __missionPatrolVehicles = %1",_missionPatrolVehicles];
if (GMS_useVehiclePatrols && {!(_missionPatrolVehicles isEqualTo [])}) then
{
	_temp = [_coords,_difficulty,_missionPatrolVehicles,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms,false,_vehicleCrewCount] call GMS_fnc_spawnMissionVehiclePatrols;
	_temp params["_vehs","_units"]; 
	_aiVehicles append _vehs;
	_missionInfantry append _units;
	uiSleep delayTime;				
} else {
	// GMSCore_fnc_getNumberFromRange returns -1 if there was an issue.	
	private _noPatrols = [_noVehiclePatrols] call GMSCore_fnc_getNumberFromRange;	
	if (GMS_useVehiclePatrols && {(_noPatrols > 0)}) then
	{
		private _spawnLocations = [_coords,_noVehiclePatrols,60,100] call GMS_fnc_findPositionsAlongARadius;	
		private _vicsToSpawn = [];
		{
			private _veh = [_difficulty] call GMS_fnc_selectPatrolVehicle;
			_vicsToSpawn pushBack [_veh, _x vectorDiff _coords];
		}forEach _spawnLocations;	
		#define useRelativePos true				
		_temp = [_coords,_difficulty,_vicsToSpawn, _uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms,false,_vehicleCrewCount] call GMS_fnc_spawnMissionVehiclePatrols;
		_temp params["_vehs","_units"]; 
		_aiVehicles append _vehs;
		_missionInfantry append _units;
		uiSleep delayTime;				
	};	
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
};		

/*  GMS_fnc_spawnMissionHelis
	params[
		["_coords",[0,0,0]],
		["_missionHelis",[]],
		["_difficulty","Red"],
		["_uniforms",[]],
		["_headgear",[]],
		["_vests",[]],
		["_backpacks",[]],
		["_weaponList",[]],
		["_sideArms",[]]
	];			
*/

if !(_airPatrols isEqualTo [] && {random(1) < _chanceHeliPatrol}) then // Spawn any choppers defined in the array  
{
	_temp = [_coords, _airPatrols,_difficulty,_uniforms,_headgear,_vests,_backpacks,_weaponList,_sidearms] call GMS_fnc_spawnMissionHelis;
	_temp params["_helisSpawned","_unitsSpawned"];
	GMS_monitoredVehicles append _helisSpawned;
	GMS_aircraftPatrols append _helisSpawned; // Used to find nearest heli ... 
	_aiVehicles append _helisSpawned;
	_missionInfantry append _unitsSpawned;				
	uisleep delayTime;						
} else {
	// GMSCore_fnc_getNumberFromRange returns -1 if there was an issue.		
	private _noPatrols = [_noVehiclePatrols] call GMSCore_fnc_getNumberFromRange;	
	if ((_noChoppers > 0) && {random(1) < _chanceHeliPatrol}) then
	{
		//  GMS_fnc_findPositionsAlongARadius:  params["_center","_num","_minDistance","_maxDistance"];
		private _spawnLocations = [_coords,_noChoppers,100,120] call GMS_fnc_findPositionsAlongARadius;		
		private _helisToSpawn = []; 
		private _availableHelis = [_difficulty] call GMS_fnc_selectMissionHelis;
		{
			private _heli = selectRandom _availableHelis; 
			_helisToSpawn pushBack[_heli, _x vectorDiff _coords, random(359)];
		} forEach _spawnLocations;
		_temp = [_coords,_helisToSpawn,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList, _sideArms] call GMS_fnc_spawnMissionHelis;
		_temp params["_helisSpawned","_unitsSpawned"];
		GMS_monitoredVehicles append _helisSpawned;
		GMS_aircraftPatrols append _helisSpawned; // Used to find nearest heli ... 
		_aiVehicles append _helisSpawned;
		_missionInfantry append _unitsSpawned;			
		uisleep delayTime;				
	};				
};

if (_spawnCratesTiming in ["atMissionSpawnGround","atMissionSpawnAir"]) then
{
	if (_missionLootBoxes isEqualTo []) then
	{
		_crates = [_coords,[[selectRandom GMS_crateTypes,[1,1,0],_crateLoot,_lootCounts]], _loadCratesTiming, _spawnCratesTiming, "start", _difficulty, _missionFile] call GMS_fnc_spawnMissionCrates;
	}
	else
	{
		_crates = [_coords,_missionLootBoxes,_loadCratesTiming, _spawnCratesTiming, "start", _difficulty, _missionFile] call GMS_fnc_spawnMissionCrates;												
	};

	if (_cleanupLootContainers) then
	{
		_objects append _crates;
	};
	if (_loadCratesTiming isEqualTo "atMissionSpawn") then 
	{
		private _crateMoney =(missionNamespace getVariable[format["GMS_crateMoney%1",_difficulty],GMS_rewardsOrange]);
		{
			[_x,_difficulty,_crateMoney] call GMSCore_fnc_setMoney;
		} forEach _crates;
	};
	uiSleep  1;
};

if (GMS_showCountAliveAI) then
{
	GMS_missionLabelMarkers pushBack [
		_markers select 1,  //  The icon marker used for adding text to markers 
		_markerConfigs select 1,  // The name of the mission shown to players on markers and in allerts
		_missionInfantry  //  The array of units tied to the mission used in this case to keep a count of units still alive that is shown on the map
	];
};

/*
_missionData params [
	"_coords",				// index 0 
	"_mines",				// index 1 
	"_objects",				// index 2 
	"_hiddenObjects",		// index 3 
	"_crates",				// index 4 
	"_missionInfantry",		// index 5 
	"_assetSpawned",		// index 6 
	"_aiVehicles",			// index 7 
	"_lootVehicles",		// index 8 
	"_markers"				// index 9
];
*/
#define indexMines 1 
#define indexCrates 4
_missionData set[indexMines, _mines]; 
_missionData set[indexCrates, _crates];

