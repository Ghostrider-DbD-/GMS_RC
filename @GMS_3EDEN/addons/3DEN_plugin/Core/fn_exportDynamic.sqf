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
#define oddsOfGarrison 0.67
#define maxGarrisonUnits 4
GMS_objectAtMissionCenter = getText(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "objectAtMissionCenter");
GMS_minAI = getNumber(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "minAI");
GMS_maxAI = getNumber(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "maxAI");
GMS_minPatrolRadius = getNumber(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "minPatroRadius");
GMS_maxPatrolRadius = getNumber(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "maxPatrolRadius");
GMS_maxVehiclePatrolRadius = getNumber(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "maxVehiclePatrolRadius");
GMS_aircraftPatrolRadius = getNumber(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "aircraftPatrolRadius");
GMS_garisonMarkerObject = "Sign_Sphere100cm_F";
GMS_oddsOfGarison = getNumber(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "oddsOfGarison");
GMS_maxGarrisonStatics = getNumber(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "maxGarrisonStatics");
GMS_typesGarrisonStatics = getArray(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "typesGarrisonStatics");
GMS_lootVehicleVariableName = getText(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "lootVehicleVariableName");
GMS_buildingPosGarrisonVariableName = getText(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "buildingPosGarrisonVariableName");
GMS_buildingATLGarrisionVariableName = getText(configFile >> "CfgGMS3DEN" >> "CfgDefaults" >> "buildingATLGarrisionVariableName");

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
	diag_log format["Line 36: typeName GMS_difficulty = %1 | GMS_difficulty = %2",typeName GMS_difficulty, GMS_difficulty];
	if (GMS_difficulty in [1,2,3,4]) then 
	{
		GMS_difficulty = ["Blue","Red","Green","Orange"] select GMS_difficulty;
	};
	if (GMS_difficulty isEqualTo "") then {
		GMS_difficulty isEqualTo "Red";
	};
	diag_log format["Line 41: typeName GMS_difficulty = %1 | GMS_difficulty = %2",typeName GMS_difficulty, GMS_difficulty];
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
	diag_log format["CENTER defined by object %1 typeOf %2 located at %3",_obj,_objType,_objPos];
} else {
	diag_log format["<WARNING> No object marking the center of the mission was found: using an object defined in 'objectAtMissionCenter' is recommended",getText(configFile >> "CfgVehicles" >> objectAtMissionCenter >> "displayName")];
	diag_log format["Place such an object or a marker to ensure the mission is accurately stored and spawned"];
};

private["_m1","_markerPos","_markerType","_markerShape","_markerColor","_markerText","_markerBrush","_markerSize","_markerAlpha"];
/*
	pull info on the first marker found 
	If Mission_CENTER was not set above then try to set it based on the first marker identified.
*/

if (_markers isEqualTo []) then
{
	diag_log "No Marker Found, no Marker Definitions Will Be generated";
} else {
	private _m1 = _markers select 0;
	_markerPosition = 	(_m1 get3DENAttribute "Position") select 0;  // Returns expected value
	_markerText = 		(_m1 get3DENAttribute "Text") select 0;	 // Returns expected value 
	_markerColor = 		(_m1 get3DENAttribute "baseColor") select 0;   //Returns Null 	
	_markerShape = 		(_m1 get3DENAttribute "markerType") select 0;   // Returns [-1] if not a rectangular or elipsoid marker] 	
	_markerAlpha = 		_m1 get3DENAttribute "alpha";
	_markerType = 		(_m1 get3DENAttribute "itemClass") select 0;	 // Returns "" if not an icon type marker 	
	_markerBrush = 		(_m1 get3DENAttribute "brush") select 0;
	_markerSize =		(_m1 get3DENAttribute "size2") select 0;
	_markerRotation = 	(_m1 get3DENAttribute "rotation") select 0;

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

private _m = format["Line 152: Mission_CENTER = %1",Mission_CENTER];
systemChat _m;
diag_log _m;

diag_log format["Line 156: _objects = %1",_objects];
GMS_defaultMissionLocations = if (toLower(missionNameSpace getVariable["GMS_missionSpawnMode","dynamic"]) isEqualTo "StaticWeapon") then {Mission_Center} else {[]};
diag_log format["Line 161: GMS_defaultMissionLocations = %1",GMS_defaultMissionLocations];

// Pull the list of Turrets out of _objects 
GMS_staticWeapons = [];
GMS_turretsATL = [];
private _turrets = _objects select {_x isKindOf "StaticWeapon"};
{
		private _obj = _x;
		//private _isGarrison = _obj getVariable["gmsIsGarrison",false];
		private _isGarrison = _obj call gms3DEN_fnc_isInside; 
		diag_log format["_exportDynamic (188): for StaticWeapon _obj %` _isGarrison = %2",_obj,_isGarrison];
		if (_isGarrison) then {
			GMS_turretsATL pushBack _obj;
		} else {
			GMS_staticWeapons pushBack format['     ["%1",%2,%3]',typeOf _obj,(getPosATL _obj) vectorDiff Mission_CENTER,getDir _obj];
		};
} forEach _turrets;

diag_log format["Line 181: count GMS_staticWeapons = %1 | count GMS_turretsATL = %2",count GMS_staticWeapons, count GMS_turretsATL];
diag_log format["Line 182: count _groups = %1",count _groups];
GMS_units = [];
GMS_unitsATL = [];
{
	private _group = _x;
	private _units = units _group; 
	{
		private _unit = _x; 
		if (vehicle _unit isEqualTo _unit) then 
		{
			//private _isGarrisoned = _unit  getVariable["gmsIsGarrison",false];
			private _isGarrisoned = _unit call gms3DEN_fnc_isInside;
			if (_isGarrisoned) then {
				GMS_unitsATL pushBack _unit;
			} else {
				GMS_units pushBack _unit;
			};
		};
	} forEach _units;
	//GMS_units pushBack (units _x);
} forEach _groups;
diag_log format["Line 198: count GMS_units = %1 | count GMS_unitsATL = %2",count GMS_units, count GMS_unitsATL];

private _props = _objects select {!(_x isKindOf "ReammoBox_F") && (_x isKindOf "FloatingStructure_F" || _x isKindOf "Items_base_F" || _x isKindOf "Thing" || _x isKindOf "Static")};
diag_log format["Line 201: count _props = %1",count _props];
GMS_garrisonedBuildings = [];
GMS_objectsToSpawn = [];
GMS_missionSimpleObjects = [];
// Get list of garrisoned buildings based on their attributes 
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
		private _isGarrison = _obj getVariable["gmsIsGarrison",false];
		diag_log format["_exportDynamic(207): for Object %1 typeOf %3 _isGarrison = %2",_obj,_isGarrison,getText(configFile >> "CfgVehicles" >> typeOf _obj >> "displayName")];
		private _turrets = [];
		private _units = [];
		{
			private _building = [_x] call gms3DEN_fnc_buildingContainer;
			diag_log format["Line 225: _obj = %1 | _building = %2", _obj,_building];
			if (_obj isEqualTo _building) then {
				private _unit = _x;
				private _pos = getPosATL _unit;
				private _center = getPosATL _building;
				private _offset = _pos vectorDiff _center;
				private _dir = getDir _unit;
				_units pushBack [_offset,_dir];
			};
		} forEach GMS_unitsATL;
		diag_log format["Line 234: for building %1 located at %2 _units = %3",_building,getPos _building,_units];
		{
			private _building = [_x] call gms3DEN_fnc_buildingContainer;
			diag_log format["Line 225: _obj = %1 | _building = %2", _obj,_building];			
			if (_obj isEqualTo _building) then {
				private _tur = _x;
				private _pos = getPosATL _tur;
				private _dir = getDir _tur;
				private _center = getPosATL _building;
				private _offset = _center vectorDiff _pos;
				_turrets pushBack [format['%1',typeOf _tur],_offset,_dir];
			};
		} forEach GMS_turretsATL;
		diag_log format["Line 246: for building %1 located at %2 _turrets = %3",_building, getPos _building,_turrets];

		if ((_turrets isEqualTo []) && (_units isEqualTo [])) then
		{
			/*
				Treat this like an ordinary building 
			*/
			GMS_objectsToSpawn pushBack format['     ["%1",%2,%3]',typeOf _obj,(getPosATL _obj) vectorDiff Mission_CENTER,getDir _obj];
		} else {
			/*
				Treat this like a garrisoned building  
			*/
			private _building = _obj;
			private _allowDamage = (_building get3DENAttribute "allowDamage") select 0;
			private _enableSimulation = (_building get3DENAttribute "enableSimulation") select 0;	
			diag_log format["Line 249: _building %1 | damage %2 | simulation %3",_allowDamage,_enableSimulation];
			_buildingGarrisonATL = [
				format["%1", 
				typeOf _building], 
				getPosATL _building, 
				getDir _building,
				_allowDamage,
				_enableSimulation,
				_turrets,
				_units
			];
			GMS_garrisonedBuildings pushBack _buildingGarrisonATL;
			diag_log format["Line 274: count ", count GMS_garrisonedBuildings,  [_buildingGarrisonATL,_configuredStatics,_configuredUnits]];
		};
	};
} forEach _props;

private _vehicles = _objects select {_x isKindOf "Car" || _x isKindOf "Tank" || _x isKindOf "Ship"};
GMS_missionPatrolVehicles = [];
GMS_lootVehicles = [];
GMS_subPatrols = [];
{
		private _obj = _x;
		private _isLoot = _obj getVariable["gmsIsLootVehicle",false];
		diag_log format["_exportDynamic (227): for LandVehicle %1 _isLoot = %2",_obj,_isLoot];
		if (_isLoot) then 
		{
			GMS_lootVehicles pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _obj,(getPosATL _obj) vectorDiff CENTER, '_crateLoot','_lootCounts',getDir _obj];
		} else {
			if (_obj isKindOf "SDV_01_base_F") then {
				GMS_subPatrols pushBack format['     ["%1",%2,%3]',typeOf _x,(getPosATL _x) vectorDiff Mission_CENTER,getDir _x];
			} else {
				GMS_missionPatrolVehicles pushBack format['     ["%1",%2,%3]',typeOf _obj,(getPosATL _obj) vectorDiff Mission_CENTER,getDir _obj];	
			};
		};
} forEach _vehicles;

private _aircraft = _objects select {_x isKindOf "Air"};
// Run through objects and format any for output
GMS_airPatrols = [];
{
	private _obj = _x;
	GMS_airPatrols pushBack format['     ["%1",%2,%3]',typeOf _obj,(getPosATL _obj) vectorDiff Mission_CENTER,getDir _obj];			
} forEach _aircraft;

diag_log format["Line 254: GMS_difficulty = %1 | GMS_minAI = %2 | GMS_maxAI = %3", GMS_difficulty, GMS_minAI, GMS_maxAI];
// Run through groups and sort them based on whether they still have units and if they are/are not in a building. 
GMS_infantryGroups = [];
GMS_scubaGroups = [];
{
	private _unit = _x;
	private _isInVehicle = if (vehicle _unit isEqualTo _unit) then {false} else {true};
	private _isSurfaceWater = surfaceIsWater (position _unit);
	diag_log format["Line 261: _unit = %1 | _isInVehicle = %2 | _isSurfaceWater = %3",_unit, _isInVehicle, _isSurfaceWater];
	if !(_isInVehicle) then {
		if (_isSurfaceWater) then {
			GMS_scubaGroups pushBack format['     [%1,%2,%3,"%4"]',(getPosATL _unit) vectorDiff Mission_CENTER,GMS_minAI,GMS_maxAI,GMS_difficulty];
		} else {
			GMS_infantryGroups pushBack format['     [%1,%2,%3,"%4"]',(getPosATL _unit) vectorDiff Mission_CENTER,GMS_minAI,GMS_maxAI,GMS_difficulty];
		};
	};
} forEach GMS_units;

diag_log format["_exportDynamic (288): count _objects = %1",count _objects]; // are there any objects left to process ?

private _lootBoxes = _objects select {_x isKindOf "ReammoBox_F"};
// Run through objects and put any Ammo Crates in a separate array 
GMS_lootContainers = [];
{
	private _obj = _x;
	GMS_lootContainers pushBack format['     ["%1",%2,%3,%4,%5]',typeOf _obj,(getPosATL _obj) vectorDiff Mission_CENTER, '_crateLoot','_lootCounts',getDir _obj];
} forEach _lootBoxes;

diag_log format["_exportDynamic (303): count _objects = %1",count _objects]; // did we capture them all?

diag_log format["exportDynamic Line 489: all data organized, formating text output"];
private _lines = [];
private _lineBreak = toString [10];

_lines pushBack "/*";
_lines pushBack "	Dynamic Mission Generated";
_lines pushBack "	Using 3DEN Plugin for GMS by Ghostrider";
_lines pushBack format["	%1",['dynamic'] call gms3DEN_fnc_versionInfo];
_lines pushBack "	By Ghostrider-GRG-";
_lines pushBack "*/";
_lines pushBack "";

//GMS_missionLocations
switch (GMS_missionLocations) do 
{
	case 'random': {GMS_defaultMissionLocations = []};
	case 'fixed': {GMS_defaultMissionLocations = [Mission_CENTER]};
};
_lines pushBack '#include "\GMS\Compiles\Init\GMS_defines.hpp"';
_lines pushBack '#include "\GMS\Missions\GMS_privateVars.sqf" ';
_lines pushBack "";
_lines pushBack format["_defaultMissionLocations = %1;",GMS_defaultMissionLocations];
_lines pushBack format["_maxMissionRespawns = -1; // Chage this to either zero for no respawns or a positive number if you want to limit the number of times a mission spawns at the same location"];

if (_markerType isEqualTo "") then 
{
	_markerType = ["rectangle","elipse"] select _markerShape;
};
_lines pushBack format["_markerType = %1",format['["%1",%2,"%3"];',_markerType,_markerSize,_markerBrush]];
_lines pushBack format['_markerColor = "%1";',_markerColor];

_lines pushBack format['_startMsg = "%1";',GMS_dynamicStartMessage];
_lines pushBack format['_endMsg = "%1";',GMS_dynamicEndMessage];
_lines pushBack format['_markerMissionName = "%1";',_markerText];
_lines pushBack format['_crateLoot = GMS_BoxLoot_%1;',GMS_difficulty];
_lines pushBack format['_lootCounts = GMS_lootCounts%1;',GMS_difficulty];
_lines pushBack "";
_lines pushBack "_garrisonedBuilding_ATLsystem = [";
_lines pushBack (GMS_garrisonedBuildings joinString (format[",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
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
_lines pushBack "_submarinePatrolParameters = [";
_lines pushback (GMS_subPatrols joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_airPatrols = [";
_lines pushback (GMS_airPatrols joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionEmplacedWeapons = [";
_lines pushback (GMS_staticWeapons joinString (format [",%1", _lineBreak]));
_lines pushBack "];";
_lines pushBack "";
_lines pushBack "_missionGroups = [";
_lines pushback (GMS_infantryGroups joinString (format [",%1", _lineBreak]));
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
_lines pushBack "	Use the parameters below to customize your mission - see the template or blck_configs.sqf for details about each them";
_lines pushBack "*/";
_lines pushBack format["_chanceHeliPatrol = GMS_chanceHeliPatrol%1;",GMS_difficulty];  
_lines pushBack format["_noChoppers = GMS_noPatrolHelis%1;",GMS_difficulty];
_lines pushBack format["_missionHelis = GMS_patrolHelis%1;",GMS_difficulty];
_lines pushBack format["_chancePara = GMS_chancePara%1;",GMS_difficulty]; 
_lines pushBack format["_noPara = GMS_noPara%1;",GMS_difficulty];  
_lines pushBack format["_paraTriggerDistance = 400;"]; 				
//_lines pushBack format["_paraSkill = '%1';",0.7];  
_lines pushBack format["_chanceLoot = 0.0;"]; 
_lines pushBack format["_paraLoot = GMS_BoxLoot_%1;",GMS_difficulty];
_lines pushBack format["_paraLootCounts = GMS_lootCounts%1;",GMS_difficulty];  
_lines pushBack format['_missionLandscapeMode = "precise";'];
_linse pushBack "_useMines = GMS_useMines;";  
_lines pushBack "_uniforms = GMS_SkinList;";  
_lines pushBack "_headgear = GMS_headgear;";  
_lines pushBack "_vests = GMS_vests;";
_lines pushBack "_backpacks = GMS_backpacks;";
_lines pushBack "_sideArms = GMS_Pistols;";
_lines pushBack format['_spawnCratesTiming = "%1";',GMS_spawnCratesTiming];
_lines pushBack format['_loadCratesTiming = "%1";',GMS_loadCratesTiming];
diag_log format["Line 520: typeName GMS_missionEndCondition =  %1 | GMS_missionEndCondition =  = %2",typeName GMS_missionEndCondition,GMS_missionEndCondition];
_lines pushBack format['_endCondition = %1;',	GMS_missionEndCondition];
_lines pushBack format["_minNoAI = GMS_MinAI_%1;",GMS_difficulty];
_lines pushBack format["_maxNoAI = GMS_MaxAI_%1;",GMS_difficulty];
_lines pushBack format["_noAIGroups = GMS_AIGrps_%1;",GMS_difficulty];
_lines pushBack format["_noVehiclePatrols = GMS_SpawnVeh_%1;",GMS_difficulty];
_lines pushBack format["_noEmplacedWeapons = GMS_SpawnEmplaced_%1;",GMS_difficulty];
_lines pushBack "_submarinePatrols = 0; // Default number of submarine patrols at pirate missions";
_lines pushBack "_scubaPatrols = 0; // Default number of scuba diver patrols at pirate missions";
_lines pushBack "";

_lines pushBack '#include "\GMS\Compiles\Missions\GMS_fnc_missionSpawner.sqf";';

diag_log ["dynamic"] call blck3EDEN_fnc_versionInfo;
uiNameSpace setVariable ["Display3DENCopy_data", ["dynamicMission.sqf", _lines joinString _lineBreak]];
(findDisplay 313) createdisplay "Display3DENCopy";

private _m = format["exportDynamic.sqf: reached line 367"];
systemChat _m;
diag_log _m;
_m = "Exported Mission copied to clipboard";
systemChat _m;
diag_log _m;