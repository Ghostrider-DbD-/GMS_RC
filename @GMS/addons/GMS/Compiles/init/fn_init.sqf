/*
	by Ghostrider [GRG]
	Last Modified 3/14/17
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

///////////////////////////////////////////////
//  prevent the system from being started twice
//////////////////////////////////////////////
if !(isNil "GMS_missionSystemRunning") exitWith {"[GMS] Mission System already initialized"};
GMS_missionSystemRunning = true;

// Only run this on a dedicated server
if (hasInterface) exitWith 
{
	"[GMS] Mission system may only be run on a dedicate server or headless client";
};

[] spawn {
	waitUntil {!isNil "GMSCore_Initialized"}; 
	diag_log format["[GMS] Loading GMS at %1",diag_tickTime];
	diag_log format["[GMS] GMSCore_modtype = %1 | GMSCore_side %2 | GMSCore_unitType %3",GMSCore_modtype,GMSCore_side,GMSCore_unitType];

	// Just some housekeeping for ghost.
	private _loadingStartTime = diag_tickTime;

	// compile functions
	[] call compileFinal preprocessFileLineNumbers "\x\addons\GMS\Compiles\GMS_functions.sqf";
	diag_log format["[GMS] Loaded Functions at %1",diag_tickTime];
	
	// Load Configs
	[] call compile preprocessfilelinenumbers "\x\addons\GMS\Configs\GMS_configs.sqf";

	diag_log format["[GMS] Loaded Configs at %1",diag_tickTime];

	// Make sure all key variables are defined before proceding with loading with GMS
	waitUntil{!(isNil "GMS_configs_loaded")};

	// Load any user-defined specifications or overrides
	//  HINT: Use these for map-specific settings
	#include "\x\addons\GMS\Configs\GMS_custom_config.sqf";

	if (GMS_debugLevel > 0) then {[format["DEBUG ON: Custom Configurations Loaded at %1",diag_tickTime]] call GMS_fnc_log};
	if (GMS_debugLevel > 0) then {[format["GMS_debugLevel = %1",GMS_debugLevel]] call GMS_fnc_log};

	// Load vaariables used to store information for the mission system.
	[] call compileFinal preprocessFileLineNumbers "\x\addons\GMS\Compiles\GMS_variables.sqf";
	if (GMS_debugLevel > 0) then {[format["DEBUG ON: Variables loaded at %1",diag_tickTime]] call GMS_fnc_log};

	// find and set Mapcenter and size
	call compileFinal preprocessFileLineNumbers "\x\addons\GMS\Compiles\init\GMS_fnc_findWorld.sqf";
	if (GMS_debugLevel > 0) then {["DEBUG ON: Map-specific information defined"] call GMS_fnc_log};

	// set up the lists of available missions for each mission category
	#include "\x\addons\GMS\Missions\GMS_missionLists.sqf";
	if (GMS_debugLevel > 0) then {["DEBUG ON: Mission Lists Loaded Successfully"] call GMS_fnc_log};
	// TODO: merge in underwater / sea missions at some point 

	if (GMS_blacklistTraderCities) then
	{
		[] spawn compile preprocessfilelinenumbers "\x\addons\GMS\Compiles\Init\GMS_fnc_getTraderCites.sqf";
	};


	_fn_setupLocationType = {
		params[	"_locationType"];
		private _locations = nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), [_locationType], worldSize];	
		_locations	
	};

	if (isNil "GMS_crateMoveAllowed") then {GMS_crateMoveAllowed = true};

	private _villages = ["NameVillage"] call _fn_setupLocationType;
	private _cites = ["NameCity"] call _fn_setupLocationType;
	private _capitals = ["NameCityCapital"] call _fn_setupLocationType;
	private _marine = ["NameMarine"] call _fn_setupLocationType;
	private _other = ["NameLocal"] call _fn_setupLocationType;
	private _airport = ["Airport"] call _fn_setupLocationType;

	GMS_townLocations = _villages + _cites + _capitals + _marine + _other + _airport;

	//Start the mission timers
	if (GMS_enableOrangeMissions > 0) then
	{
		[_missionListOrange,_pathOrange,"OrangeMarker","orange",GMS_TMin_Orange,GMS_TMax_Orange,GMS_enableOrangeMissions] call GMS_fnc_addMissionToQue;
	};
	if (GMS_enableGreenMissions > 0) then
	{
		[_missionListGreen,_pathGreen,"GreenMarker","green",GMS_TMin_Green,GMS_TMax_Green,GMS_enableGreenMissions] call GMS_fnc_addMissionToQue;
	};
	if (GMS_enableRedMissions > 0) then
	{
		[_missionListRed,_pathRed,"RedMarker","red",GMS_TMin_Red,GMS_TMax_Red,GMS_enableRedMissions] call GMS_fnc_addMissionToQue;
	};
	if (GMS_enableBlueMissions > 0) then
	{
		[_missionListBlue,_pathBlue,"BlueMarker","blue",GMS_TMin_Blue,GMS_TMax_Blue,GMS_enableBlueMissions] call GMS_fnc_addMissionToQue;
	};
	if (GMS_numberUnderwaterDynamicMissions > 0) then 
	{
		if !(GMS_maxSeaSearchDistance == 0) then {
			[_missionListUMS,_pathUMS,"UMSMarker","Red",GMS_TMin_UMS,GMS_TMax_UMS,GMS_numberUnderwaterDynamicMissions] call GMS_fnc_addMissionToQue;
		};
	};

	if (GMS_enableScoutsMissions > 0) then
	{
		[_missionListScouts,_pathScouts,"ScoutsMarker","red",GMS_TMin_Scouts,GMS_TMax_Scouts,GMS_enableScoutsMissions] call GMS_fnc_addMissionToQue;
	};

	if (GMS_enableHunterMissions > 0) then
	{
		[_missionListHunters,_pathHunters,"HunterMarker","green",GMS_TMin_Hunter,GMS_TMax_Hunter,GMS_enableHunterMissions] call GMS_fnc_addMissionToQue;
	};

	// Running new version of Crash sites.
	if (GMS_maxCrashSites > 0) then
	{
		[] execVM "\x\addons\GMS\Missions\HeliCrashs\Crashes2.sqf";
	};

	if (GMS_enableStaticMissions > 0 && !(_missionLIstStatics isEqualTo [])) then // GMS_enableStaticMissions should be an integer between 1 and N
	{
		diag_log format["fn_init: _pathStatics = %1",_pathStatics];
		private _staticsToSpawn = [];
		private _isStatic = true;
		private _numberStatics = count _missionListStatics;
		{
			[format["_init (206): _missionListStatics %1 = %2",_forEachIndex, _x]] call GMS_fnc_log;
		} forEach  _missionListStatics;
		while {(count _staticsToSpawn) < (count _missionListStatics) && ((count _staticsToSpawn) < (GMS_enableStaticMissions))} do 
		{
			private _mission = selectRandom _missionListStatics;
			_staticsToSpawn pushBackUnique _mission; 
			[format["GMS_fnc_init (209): _mission = %1 | count _staticsToSpawn = %2",_mission, count _staticsToSpawn]] call GMS_fnc_log;
		};
		/*
			params[
				["_missionList",[]],
				["_path",""],
				["_marker",""],
				["_difficulty","Red"],
				["_tMin",60],
				["_tMax",120],
				["_noMissions",1],
				["_isStatic",false]];
		*/
		diag_log format["_init: count _staticsToSpawn = %1 | GMS_enableStaticMissions = %2:",count _staticsToSpawn,GMS_enableStaticMissions];
		[_staticsToSpawn,_pathStatics,"StaticsMarker","orange",GMS_TMin_Statics,GMS_TMax_Statics,GMS_enableStaticMissions,_isStatic] call GMS_fnc_addMissionToQue;
	};

	// Flag any class names with issues (invald classname or classname without pricing)
	{
		private _var = missionNameSpace getVariable[_x,[]];
		[format["validating classnames and pricing for %1 | count = %2 | _x = %3",_x,count _var, _var]] call GMS_fnc_log;
		_var = [_var,true] call GMSCore_fnc_checkClassnamesArray;
		_var = [_var,true] call GMSCore_fnc_checkClassNamePrices;
		//[format["GMS_init_server: Updated %1 | count = %2 | _x = %3",_x,count _var, _var]] call GMS_fnc_log;
	} forEach [
		"GMS_patrolHelisBlue",
		"GMS_patrolHelisRed",
		"GMS_patrolHelisGreen",
		"GMS_patrolHelisOrange",
		"GMS_AIPatrolVehiclesBlue",
		"GMS_AIPatrolVehiclesRed",
		"GMS_AIPatrolVehiclesGreen",
		"GMS_AIPatrolVehiclesOrange",
		"GMS_tools",
		"GMS_buildingMaterials",
		"GMS_NVG",
		"GMS_specialItems",
		"GMS_ConsumableItems",
		"GMS_vests_blue",
		"GMS_vests_red",
		"GMS_vests_green",
		"GMS_vests_orange",
		"GMS_SkinList_blue",
		"GMS_SkinList_red",
		"GMS_SkinList_green",
		"GMS_SkinList_orange",
		"GMS_headgear_blue",
		"GMS_headgear_red",
		"GMS_headgear_green",
		"GMS_headgear_orange",
		"GMS_backpacks_blue",
		"GMS_backpacks_red",
		"GMS_backpacks_green",
		"GMS_WeaponList_Blue",
		"GMS_WeaponList_Red",
		"GMS_WeaponList_Green",
		"GMS_WeaponList_Orange"
	];

	//  start the main thread for the mission system which monitors missions running and stuff to be cleaned up
	[] spawn GMS_fnc_mainThread;
	private _version = getText(configFile >> "GMSBuild" >> "Version");
	private _build = getText(configFile >> "GMSBuild" >> "Build");
	private _date = getText(configFile >> "GMSBuild" >> "Date");
	[format["Version %1 Build %2 Date %4 Loaded in %3 seconds",
		_version,
		_build,
		diag_tickTime - _loadingStartTime,
		_date]
	] call GMS_fnc_log;
};

