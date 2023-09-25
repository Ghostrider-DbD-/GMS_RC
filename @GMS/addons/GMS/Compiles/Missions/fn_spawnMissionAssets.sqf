/*
	GMS_fnc_spawnMissionAssets 
	Copyright 2023 Ghostrider[GRG]
*/

params[
	"_missionData",		// Defined below
	"_missionConfigs",	// Defined below
	"_spawnPara"
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
_markerConfigs params[
	"_markerName",  //  The unique text identifier for the marker
	"_markerMissionName"
];

private["_temp"];
if (GMS_SmokeAtMissions select 0) then  // spawn a fire and smoke near the crate
{
	_temp = [_coords,GMS_SmokeAtMissions select 1] call GMS_fnc_smokeAtCrates;
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

// TODO: 05/08/22 -> redo code to handle this
if !(_garrisonedBuilding_ATLsystem isEqualTo []) then  // Note that there is no error checking here for nulGroups
{
	_temp = [_coords, _garrisonedBuilding_ATLsystem, _difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_garrisonBuilding_ATLsystem;
	_temp params["_unitsSpawned","_staticsSpawned","_buildingsSpawned"];
	_objects append _buildingsSpawned;
	GMS_monitoredVehicles append _staticsSpawned;
	_missionInfantry append _unitsSpawned;
	uiSleep delayTime;				
};	


if !(_garrisonedBuildings_BuildingPosnSystem isEqualTo []) then
{
	_temp = [_coords, _garrisonedBuildings_BuildingPosnSystem, _difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_garrisonBuilding_RelPosSystem;
	_objects append (_temp select 1);
	GMS_monitoredVehicles append (_temp select 2);
	_missionInfantry append (units (_temp select 0));					
	uiSleep delayTime;
};

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
private _numberEmplacedWeaponsThisMission = [_noEmplacedWeapons] call GMSCore_fnc_getNumberFromRange;
if (GMS_useStatic &&  {!(_missionEmplacedWeapons isEqualTo [])} ) then
{
	_temp = [_coords,_missionEmplacedWeapons,_userelativepos,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_spawnEmplacedWeaponArray;
	_temp params["_statics","_units"];
	_objects append _statics;
	_missionInfantry append _units;			
	[format["_monitorInitializedMissions (288): spawned emplaced weapons for _iconMarker %1 at %2 | with count _missionInfantry = %3 | with _statics = %4",_iconMarker,diag_tickTime,count _missionInfantry, _statics]];															
	uisleep delayTime;				
} else {
	private _wepPositions = [_coords,_noEmplacedWeapons,35,50] call GMS_fnc_findPositionsAlongARadius;
	private _emplacedWeaponsRandom = [];
	{
		_static = selectRandom GMS_staticWeapons;
		_emplacedWeaponsRandom pushback [_static,_x];
	} forEach _wepPositions;
	_useRelativePos = false;
	_temp = [_coords,_emplacedWeaponsRandom,_userelativepos,_difficulty,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_spawnEmplacedWeaponArray;
	_temp params["_statics","_units"];
	_objects append _statics;
	_missionInfantry append _units;			
	[format["_monitorInitializedMissions (233788): spawned emplaced weapons for _iconMarker %1 at %2 | with count _missionInfantry = %3 | with _statics = %4",_iconMarker,diag_tickTime,count _missionInfantry, _statics]];															
	uisleep delayTime;										
};

if !(_missionLootVehicles isEqualTo []) then 
{
	_lootVehicles = [_coords,_missionLootVehicles,_spawnCratesTiming] call GMS_fnc_spawnMissionLootVehicles;				
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
private _noPatrols = [_noVehiclePatrols] call GMSCore_fnc_getNumberFromRange;
if (GMS_useVehiclePatrols && {!(_missionPatrolVehicles isEqualTo [])}) then
{
	_temp = [_coords,_difficulty,_missionPatrolVehicles,_userelativepos,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms,false,_vehicleCrewCount] call GMS_fnc_spawnMissionVehiclePatrols;
	_temp params["_vehs","_units"]; 
	_aiVehicles append _vehs;
	_missionInfantry append _units;
	uiSleep delayTime;				
} else {
	if (GMS_useVehiclePatrols && {(_noPatrols > 0)}) then
	{
		_useRelativePos = false;
		private _spawnLocations = [_coords,_noVehiclePatrols,60,100] call GMS_fnc_findPositionsAlongARadius;
		private _vicsToSpawn = [];
		{
			private _veh = [_difficulty] call GMS_fnc_selectPatrolVehicle;
			[format["GMS_fnc_spawnMissionVehiclePatrols: _veh %1 = %2",_forEachIndex,_veh]] call GMS_fnc_log;
			_vicsToSpawn pushBack [_veh, _x];
		}forEach _spawnLocations;					
		_temp = [_coords,_difficulty,_vicsToSpawn,_userelativepos,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms,false,_vehicleCrewCount] call GMS_fnc_spawnMissionVehiclePatrols;
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
private _noChoppers = [_noChoppers] call GMSCore_fnc_getNumberFromRange;
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
	if ((_noChoppers > 0) && {random(1) < _chanceHeliPatrol}) then
	{
		private _spawnLocations = [_coords,_noChoppers,100,120] call GMS_fnc_findPositionsAlongARadius;					
		private _helisToSpawn = []; 
		private _availableHelis = [_difficulty] call GMS_fnc_selectMissionHelis;
		for "_i" from 1 to _noChoppers do 
		{
			private _heli = selectRandom _availableHelis; 
			_helisToSpawn pushBack[_heli,_x,0];
		};
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
		_crates = [_coords,[[selectRandom GMS_crateTypes,[1,1,0],_crateLoot,_lootCounts]], _loadCratesTiming, _spawnCratesTiming, "start", _difficulty] call GMS_fnc_spawnMissionCrates;
	}
	else
	{
		_crates = [_coords,_missionLootBoxes,_loadCratesTiming, _spawnCratesTiming, "start", _difficulty] call GMS_fnc_spawnMissionCrates;												
	};

	if (GMS_cleanUpLootChests) then
	{
		_objects append _crates;
	};
	if (_loadCratesTiming isEqualTo "atMissionSpawn") then 
	{
		private _crateMoney = missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty]);
		{
			[_x,missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty])] call GMS_fnc_setMoney;
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

{
	_x setVariable["crateSpawnPos", (getPos _x)];
};		
#define indexMines 1 
#define indexCrates 4
_missionData set[indexMines, _mines]; 
_missionData set[indexCrates, _crates];
