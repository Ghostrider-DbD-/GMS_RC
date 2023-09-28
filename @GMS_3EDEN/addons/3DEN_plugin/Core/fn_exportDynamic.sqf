/*
	GMS 3DEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
*/
#include "gms3DEN_defines.hpp"
private _m = "Staring exportDynamic.sqf";
systemChat _m;
diag_log _m;
Mission_CENTER = [0,0,0];
GMS_objectAtMissionCenter = getText(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "objectAtMissionCenter");
if (isNil "GMS_minAI") then {GMS_minAI = getNumber(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "minAI")};
if (isNil "GMS_maxAI") then {GMS_maxAI = getNumber(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "maxAI")};


/*
	Set Default Values Where not Defined using Menu Commands
*/
if (isNil "GMS_missionLocations") then 
{
	GMS_missionLocations = "random";
};
if (isNil "GMS_difficulty") then 
{
	GMS_difficulty = "Red";
} else {
	if (GMS_difficulty in [1,2,3,4]) then 
	{
		GMS_difficulty = ["Blue","Red","Green","Orange"] select GMS_difficulty;
	};
	if (GMS_difficulty isEqualTo "") then {
		GMS_difficulty isEqualTo "Red";
	};
};
if (isNil "GMS_dynamicStartMessage") then 
{
	GMS_dynamicStartMessage = "TODO: Change approiately";
};
if (isNil "GMS_dynamicEndMessage") then 
{
	GMS_dynamicEndMessage = "TODO: Change Appropriately";
};
if (isNil "GMS_dynamicCrateLoot") then 
{
	GMS_dynamicCrateLoot = format["_crateLoot = blck_BoxLoot_%1;",GMS_difficulty];
};
if (isNil "GMS_dynamicCrateLootCounts") then {
	GMS_dynamicCrateLootCounts = format["_lootCounts = bGMS_lootCounts%1;",GMS_difficulty];
};
if (isNil "GMS_dynamicmarkerMissionNamet") then 
{
	GMS_dynamicmarkerMissionName = "TODO: Update appropriately";
};
if (isNil "GMS_spawnCratesTiming") then 
{
	GMS_spawnCratesTiming = "atMissionStartGround";
}; 
if (isNil "GMS_loadCratesTiming") then 
{
	 GMS_loadCratesTiming = "atMissionStart";
};
if (isNil "GMS_missionEndCondition") then 
{
	GMS_missionEndCondition = "allUnitsKilled";
};
if (isNil "gms_chancemissionspawned") then 
{
	gms_chancemissionspawned = 1.0;
};
switch (GMS_missionEndCondition) do 
{
	case "GMS_playerNear": {GMS_missionEndCondition = playerNear};
	case "GMS_allUnitsKilled": {GMS_missionEndCondition = allUnitsKilled};
	case "GMS_allKilledOrPlayerNear": {GMS_missionEndCondition = allKilledOrPlayerNear};
	case "GMS_assetSecured": {GMS_missionEndCondition = assetSecured};
};

/*
	Look for an object defined in Cfggms3DEN \ configs \ that marks the center of the mission 
	and set the coords of the center if such an object is found 
*/
all3DENEntities params ["_objects","_groups","_triggers","_systems","_waypoints","_markers","_layers","_comments"];

//  Relax what is an object at mission center somehow?  
// Maybe using inheritsFrom?
diag_log format["exportDynamic line 90: GMS_objectAtMissionCenter = %1",GMS_objectAtMissionCenter];
private _centerMarkerObject = objNull;
{
	diag_log format["exportDynamic: evaluating objects for one that is to set mission center where the object is of typeOf %1", typeOf _x];
	if ((typeOf _x) isEqualTo GMS_objectAtMissionCenter) exitwith 
	{
		_centerMarkerObject = _x; 
		diag_log format["exportDynamic Line 97: _x = %1 | _centerMarkerObject = %2", _x, _centerMarkerObject];
	};
} forEach _objects;

diag_log format["Line 100: _centerMarkerObject = %1 | GMS_objectAtMissionCenter = %2",_centerMarkerObject, GMS_objectAtMissionCenter];

if !(isNull _centerMarkerObject) then 
{
	private _objPos = (_centerMarkerObject get3DENAttribute "position") select 0;
	private _objType = typeOf _centerMarkerObject;
	Mission_CENTER = _objPos;
	diag_log format["CENTER defined by object %1 typeOf %2 located at %3",_centerMarkerObject,_objType,_objPos];
} else {
	diag_log format["<WARNING> No object marking the center of the mission was found: using an object defined in 'objectAtMissionCenter' is recommended",getText(configFile >> "CfgVehicles" >> objectAtMissionCenter >> "displayName")];
	diag_log format["Place such an object or a marker to ensure the mission is accurately stored and spawned"];
};

private["_m1","_markerPos","_markerType","_markerShape","_markerColor","_markerText","_markerBrush","_markerSize","_markerAlpha","_markerLabel"];
/*
	pull info on the first marker found 
	If Mission_CENTER was not set above then try to set it based on the first marker identified.
*/
private 	_markerLabel = "";
private _centerSet = false;
if !(_markers isEqualTo []) then
{
	private _m1 = _markers select 0;
	_markerPosition = 	(_m1 get3DENAttribute "Position") select 0;  // Returns expected value
	_markerText = 		(_m1 get3DENAttribute "Text") select 0;	 // Returns expected value 
	_markerColor = 		(_m1 get3DENAttribute "baseColor") select 0;   //Returns Null 	
	_markerShape = 		((_m1 get3DENAttribute "markerType") select 0);   // Returns [-1] if not a rectangular or elipsoid marker] 	
	_markerAlpha = 		_m1 get3DENAttribute "alpha";
	_markerType = 		(_m1 get3DENAttribute "itemClass") select 0;	 // Returns "" if not an icon type marker 	
	_markerBrush = 		(_m1 get3DENAttribute "brush") select 0;
	_markerSize =		(_m1 get3DENAttribute "size2") select 0;
	_markerRotation = 	(_m1 get3DENAttribute "rotation") select 0;
	diag_log format["Line 140: _markerShape = %1 | _markerType = %2 _m1 get3DENAttribute markerType = %3",_markerShape,_markerType, _m1 get3DENAttribute "markerType"];
	switch (_markerShape) do 
	{
		case -1: {};
		case 0:{_markerType = "RECTANGLE"};
		case 1: {_markerType = "ELLIPSE"};
	};
	/*
		use the coordinates of that marker as mission center of no object demarkating the center is found 
	*/
	if (Mission_CENTER isEqualTo [0,0,0]) then {
		Mission_CENTER = _markerPosition;
		diag_log format["Position of marker %1 used for position of CENTER = %2",_m,Mission_CENTER];
	};
	if (count _markers > 1) then 
	{
		diag_log format["<WARNING> More than one marker was found; only the first marker was processed"];
	};
};

if (Mission_CENTER isEqualTo [0,0,0]) then {
	Mission_CENTER = position (_objects select 0);
	diag_log format["<WARNING> Mission Center set to the position of the first object"];
};

if (_markers isEqualTo []) then 
{
	_markerPosition = Mission_CENTER;
	_markerText = "";
	_markerColor = "";
	_markerShape = "ELLIPSE";
	_markerAlpha = 1.0;
	_markerType = _markerShape;
	_markerBrush = "GRID";
	_markerSize = [150,150];
	_markerRotation = 0;
};

private _markerMissionName = "TODO: Set this to an appropriate name";
private _m = format["Line 152: Mission_CENTER = %1",Mission_CENTER];


private _props = _objects select {!(_x isKindOf "ReammoBox_F") && (_x isKindOf "FloatingStructure_F" || _x isKindOf "Items_base_F" || _x isKindOf "Thing" || _x isKindOf "Static")};
GMS_staticWeapons = [];
GMS_objectsToSpawn = [];
GMS_missionSimpleObjects = [];
GMS_garrisonedBuildings = [];
GMS_unitsATL = [];
GMS_scubaGroups = [];
GMS_infantryGroups = [];
GMS_missionPatrolVehicles = [];
GMS_lootVehicles = [];
GMS_subPatrols = [];
GMS_ugvs = [];
GMS_uavs = [];

/*  Turrets First */ 
private _allTurrets = _objects select {_x isKindOf "StaticWeapon"};
{
	GMS_staticWeapons pushBack format["     %1, %2, %3, %4",typeOf _x, (getPosATL _x) vectorDiff Mission_CENTER, getDir _x, GMS_difficulty];
} forEach _allTurrets;

private _vehicles = _objects select {_x isKindOf "Car" || _x isKindOf "Tank" || _x isKindOf "Ship"};
{
	private _obj = _x;
	private _vehicleClass = getText(configFile >> "CfgVehicles" >> typeOf _obj >> "vehicleclass");	
	private _isLoot = _obj getVariable["gmsIsLootVehicle",false];
	if (_isLoot) then 
	{
		GMS_lootVehicles pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _obj,(getPosATL _obj) vectorDiff CENTER, '_crateLoot','_lootCounts',getDir _obj];
	} else {
		if (_obj isKindOf "SDV_01_base_F") then {
			GMS_subPatrols pushBack format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff Mission_CENTER,getDir _x];
		} else {
			if (_vehicleClass isEqualTo "Autonomous") then 
			{
				GMS_ugvs pushBack format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff Mission_CENTER,getDir _x];
			} else {
				GMS_missionPatrolVehicles pushBack format['     ["%1",%2,%3]',typeOf _obj,(getPosATL _obj) vectorDiff Mission_CENTER,getDir _obj];	
			};
		};
	};
} forEach _vehicles;

private _aircraft = _objects select {_x isKindOf "Air"};
// Run through objects and format any for output
GMS_airPatrols = [];
{
	//_objects = _objects deleteAt (_objects find _x);		
	private _obj = _x;
	private _vehicleClass = getText(configFile >> "CfgVehicles" >> typeOf _obj >> "vehicleclass");	
	if (_vehicleClass isEqualTo "Autonomous") then {
		GMS_uavs pushBack format['     ["%1",%2,%3]',typeOf _obj,(getPosATL _obj) vectorDiff Mission_CENTER,getDir _obj];
	} else {
		GMS_airPatrols pushBack format['     ["%1",%2,%3]',typeOf _obj,(getPosATL _obj) vectorDiff Mission_CENTER,getDir _obj];
	};
} forEach _aircraft;	

private _lootBoxes = _objects select {_x isKindOf "ReammoBox_F"};
// Run through objects and put any Ammo Crates in a separate array 
GMS_lootContainers = [];
{
	//_objects = _objects deleteAt (_objects find _x);
	private _obj = _x;
	GMS_lootContainers pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _obj,(getPosATL _obj) vectorDiff Mission_CENTER, '_crateLoot','_lootCounts',getDir _obj];
} forEach _lootBoxes;	

private _props = _objects select {(_x isKindOf "FloatingStructure_F" || _x isKindOf "Items_base_F" || _x isKindOf "Thing" || _x isKindOf "Static")};
{
	private _obj = _x;
	if (_obj get3DENAttribute "objectIsSimple" select 0) then {
		diag_log format["Line 209: adding simpleObject displayName %1",getText(configFile >> "CfgVehicles" >> typeOf _obj >> "displayName")];
		GMS_missionSimpleObjects pushBack format['     ["%1",%2,%3]',
			(_obj get3DENAttribute "ItemClass") select 0,
			((_obj get3DENAttribute "position") select 0) vectorDiff Mission_CENTER,
			((_obj get3DENAttribute "rotation") select 0) select 2
		];	
	} else {
		private _allowDamage = (_obj get3DENAttribute "allowDamage") select 0;
		private _enableSimulation = (_obj get3DENAttribute "enableSimulation") select 0;
		GMS_objectsToSpawn pushBack format['     ["%1",%2,%3,[%4,%5]]',
			typeOf _obj,
			(getPosATL _obj) vectorDiff Mission_CENTER,
			getDir _obj,
			_allowDamage,  
			_enableSimulation
		];
	};
} forEach _props;

private _men = [];
private _menInside = [];
{
	private _group = _x;
	private _units = units _group;		
	{
		private _unit = _x; 
		private _onFoot = if (vehicle _unit isEqualTo _unit) then {true} else {false};
		private _isGarrisoned = _unit call gms3DEN_fnc_isInside;
		private _isSurfaceWater = surfaceIsWater (getPosATL _unit);
		if (_onFoot) then 
		{
			if (_isGarrisoned) then 
			{
				GMS_unitsATL pushBack format['     [%1,%2,%3,"%4"]',(getPosATL _unit) vectorDiff Mission_CENTER, getDir _unit, GMS_difficulty];
			} else {
				if (_isSurfaceWater) then {
					GMS_scubaGroups pushBack format['     [%1,%2,%3,"%4"]',(getPosATL _unit) vectorDiff Mission_CENTER,GMS_minAI,GMS_maxAI,GMS_difficulty];
				} else {
					GMS_infantryGroups pushBack format['     [%1,%2,%3,"%4"]',(getPosATL _unit) vectorDiff Mission_CENTER,GMS_minAI,GMS_maxAI,GMS_difficulty];
				};
			};
		};
	} forEach _units;
} forEach _groups;

private _lines = [];
private _lineBreak = toString [10];

_lines pushBack "/*";
_lines pushBack format["	%1 Mission Generated",GMS_missionSpawnMode];
_lines pushBack "	Using 3DEN Plugin for GMS by Ghostrider";
_lines pushBack format["	%1",['dynamic'] call gms3DEN_fnc_versionInfo];
_lines pushBack "	By Ghostrider-GRG-";
_lines pushBack "*/";
_lines pushBack "";

GMS_defaultMissionLocations = [];
if (GMS_missionSpawnMode isEqualTo "Static") then {GMS_defaultMissionLocations = Mission_CENTER};

_lines pushBack '#include "\GMS\Compiles\Init\GMS_defines.hpp"';
_lines pushBack '#include "\GMS\Missions\GMS_privateVars.sqf" ';
_lines pushBack "";
_lines pushBack format['_difficulty = "%1";',GMS_difficulty];
_lines pushBack format["_chanceMissionSpawned = %1;",GMS_chanceMissionSpawned];
_lines pushBack format["_defaultMissionLocations = %1;",GMS_defaultMissionLocations];
_lines pushBack "_maxMissionRespawns = -1;";
_lines pushBack format['_startMsg = "%1";',GMS_dynamicStartMessage];
_lines pushBack format['_endMsg = "%1";',GMS_dynamicEndMessage];

_lines pushBack format['_markerLabel = "%1";',_markerLabel];
_lines pushBack format['_markerColor = "%1";',_markerColor];
_lines pushBack format['_markerText = "%1";',_markerText];
_lines pushBack format['_markerMissionName = "%1";',_markerMissionName];

_lines pushBack format['_crateLoot = GMS_BoxLoot_%1;',GMS_difficulty];
_lines pushBack format['_lootCounts = GMS_lootCounts%1;',GMS_difficulty];
_lines pushBack "";
_lines pushBack "/*";
_lines pushBack "     Depricated Variable Included for Backwards Compatibility with Existing Missions";
_lines pushBack "*/";
_lines pushBack "_garrisonedBuilding_ATLsystem = [";
_lines pushBack "";
_lines pushBack "];";
_lines pushBack "/*";
_lines pushBack "     Depricated Variable Included for Backwards Compatibility with Existing Missions";
_lines pushBack "*/";
_lines pushBack "_garrisonedBuildings_BuildingPosnSystem = [";
_lines pushBack "";
_lines pushBack "];";
_lines pushBack "_missionLandscape = [";
_lines pushback (GMS_objectsToSpawn joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_simpleObjects = [";
_lines pushback (GMS_missionSimpleObjects joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionLootVehicles = [";
_lines pushBack (GMS_lootVehicles joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack  "_missionPatrolVehicles = [";
_lines pushback (GMS_missionPatrolVehicles joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionUGVs = [";
_lines pushBack (GMS_ugvs joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "_submarinePatrolParameters = [";
_lines pushback (GMS_subPatrols joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_airPatrols = [";
_lines pushback (GMS_airPatrols joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionUAVs = [";
_lines pushBack (GMS_uavs joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "_missionEmplacedWeapons = [";
_lines pushback (GMS_staticWeapons joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionGroups = [";
_lines pushback (GMS_infantryGroups joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionGarrisonedGroups = [";
_lines pushBack (GMS_unitsATL joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_scubaGroupParameters = [";
_lines pushback (GMS_scubaGroups joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionLootBoxes = [";
_lines pushback (GMS_lootContainers joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "/*";
_lines pushBack "	Use the parameters below to customize your mission - see the template or GMS_configs.sqf for details about each them";
_lines pushBack "*/";
_lines pushBack format["_chanceHeliPatrol = GMS_chanceHeliPatrol%1;",GMS_difficulty];  
_lines pushBack format["_noChoppers = GMS_noPatrolHelis%1;",GMS_difficulty];
_lines pushBack format["_missionHelis = GMS_patrolHelis%1;",GMS_difficulty];
_lines pushBack format["_chancePara = GMS_chancePara%1;",GMS_difficulty]; 
_lines pushBack format["_noPara = GMS_noPara%1;",GMS_difficulty];  
_lines pushBack format["_paraTriggerDistance = 400;"]; 				
_lines pushBack format["_paraSkill = %1;",0.7];  
_lines pushBack format["_chanceLoot = 0.0;"]; 
_lines pushBack format["_paraLoot = GMS_BoxLoot_%1;",GMS_difficulty];
_lines pushBack format["_paraLootCounts = GMS_lootCounts%1;",GMS_difficulty];  
_lines pushBack format['_missionLandscapeMode = "precise";'];
_lines pushBack "_useMines = GMS_useMines;";  
_lines pushBack "_uniforms = GMS_SkinList;";  
_lines pushBack "_headgear = GMS_headgear;";  
_lines pushBack "_vests = GMS_vests;";
_lines pushBack "_backpacks = GMS_backpacks;";
_lines pushBack "_sideArms = GMS_Pistols;";
_lines pushBack format['_spawnCratesTiming = "%1;"',GMS_spawnCratesTiming];
_lines pushBack format['_loadCratesTiming = "%1;"',GMS_loadCratesTiming];
_lines pushBack format['_endCondition = %1;',	GMS_missionEndCondition];
_lines pushBack format["_minNoAI = GMS_MinAI_%1;",GMS_difficulty];
_lines pushBack format["_maxNoAI = GMS_MaxAI_%1;",GMS_difficulty];
_lines pushBack format["_noAIGroups = GMS_AIGrps_%1;",GMS_difficulty];
_lines pushBack format["_noVehiclePatrols = GMS_SpawnVeh_%1;",GMS_difficulty];
_lines pushBack format["_noEmplacedWeapons = GMS_SpawnEmplaced_%1;",GMS_difficulty];
_lines pushBack "_submarinePatrols = 0;";
_lines pushBack "_scubaPatrols = 0;";
_lines pushBack "";
_lines pushBack '#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";';

uiNameSpace setVariable ["Display3DENCopy_data", ["dynamicMission.sqf", _lines joinString _lineBreak]];
(findDisplay 313) createdisplay "Display3DENCopy";

_m = "Exported Mission copied to clipboard";
systemChat _m;
diag_log _m;
