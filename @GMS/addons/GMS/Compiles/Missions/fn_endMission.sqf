/*
	schedules deletion of all remaining alive AI and mission objects.
	Updates the mission que.
	Updates mission markers.
	By Ghostrider-GRG-
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

///////////////////////////////////////////////////////////////////////
//  MAIN FUNCTION STARTS HERE
//////////////////////////////////////////////////////////////////////

params[
	["_key",-1],
	["_missionData",[]],
	["_endMsg",""],
	["_markerData",[]],
	["_missionLootConfigs",[]],
	["_isScuba",false],
	["_endCode",-1],
	["_isStatic",false]
];
//[format["_endMission: _endCode %1 | _markerData %2 | _endMsg %3",_endCode, _markerData, _endMsg]] call GMS_fnc_log;
_missionData params [
	"_coords",
	"_mines",
	"_objects",
	"_hiddenObjects",
	"_crates",
	"_missionAI",
	"_assetSpawned",
	"_aiVehicles",
	"_lootVehicles",
	"_markers"
];	

_markerData params [
	"_markerName",
	"_markerMissionName"
];

/*
_missionLootConfigs params [
	"_spawnCratesTiming", 
	"_loadCratesTiming",		
	"_crateLoot", 
	"_lootCounts"
	// Ignore the remaining entries in the configuration
];
*/

{[_x] call GMS_fnc_deleteMarker} forEach (_markers);

{
	private _el = _x;
	if ((_el select 0) == _key) exitWith 
	{
		#define noActive 3
		private _activeMissions = _el select noActive;
		_el set[noActive, _activeMissions - 1];
	};
} forEach GMS_missionData;

switch (_endCode) do 
{
	case -1: {
			//[format["_endMission (93): _exception -1 | _mines %1 | _crates %2 | count _objects %3 | count _missionAI %4 ",_mines,_crates,count _objects, count _missionAI]] call GMS_fnc_log;
			if !(_endMsg isEqualTo "") then {
				[["end",_endMsg,"News Update"]] call GMS_fnc_messageplayers;
			};
			GMS_hiddenTerrainObjects pushBack[_hiddenObjects,(diag_tickTime)];			
			[_mines, 0] call GMSCore_fnc_deleteObjectsMethod;	
			[_crates, 0] call GMSCore_fnc_deleteObjectsMethod;
			[_objects, 0] call GMSCore_fnc_deleteObjectsMethod;				
			[_missionAI, 0] call GMSCore_fnc_deleteObjectsMethod;				
			[_aiVehicles, 0] call GMSCore_fnc_deleteObjectsMethod;
			[_lootVehicles, 0] call GMSCore_fnc_deleteObjectsMethod;
	};
	case 1: {  // Normal End
			[format["_endMission (102): _exception 1 (normal ending) | _mines %1 | _crates %2 | count _objects %3 | count _missionAI %4 ",_mines,_crates,count _objects, count _missionAI]] call GMS_fnc_log;
			if (GMS_useSignalEnd) then
			{
				//[_crates select 0,150, GMS_smokeShellAtCrates] call GMSCore_fnc_visibleMarker;
				{
					_x enableRopeAttach true;
					[_x, 150, GMS_smokeShellAtCrates] call GMSCore_fnc_visibleMarker;
				}forEach _crates;
			};
			
			[["end",_endMsg,_markerMissionName]] call GMS_fnc_messageplayers;

			[_coords, _markerName] call GMS_fnc_missionCompleteMarker;

			{
				//private ["_v","_posnVeh"];
				//_posnVeh = GMS_monitoredVehicles find _x;  // returns -1 if the vehicle is not in the array else returns 0-(count GMS_monitoredVehicles -1)
				//if (_posnVeh >= 0) then
				//{
				//	(GMS_monitoredVehicles select _posnVeh) setVariable ["missionCompleted", diag_tickTime];
				//} else {
					_x setVariable ["missionCompleted", diag_tickTime];
					GMS_monitoredVehicles pushBackUnique _x;
				//};
			} forEach _aiVehicles;
			[_mines, 0] call GMSCore_fnc_deleteObjectsMethod;
			[_objects, (diag_tickTime + GMS_cleanupCompositionTimer)] call GMSCore_fnc_addToDeletionCue;	
			GMS_hiddenTerrainObjects pushBack[_hiddenObjects,(diag_tickTime + GMS_cleanupCompositionTimer)];
			[_missionAI, (diag_tickTime + GMS_AliveAICleanUpTimer)] call GMSCore_fnc_addToDeletionCue;
			if (_isStatic) then {
				[_crates, diag_tickTime + GMS_cleanupCompositionTimer] call GMSCore_fnc_addToDeletionCue;
			};
			[format["Mission Completed | _coords %1 : _markerClass %2 :  _markerMissionName %3",_coords,_markerName,_markerName]] call GMS_fnc_log;			
	};
	case 2: {  // Aborted for moving a crate 
			#define illegalCrateMoveMsg "Crate moved before mission completed"
			[["warming",illegalCrateMoveMsg,_markerName]] call GMS_fnc_messageplayers;
			GMS_hiddenTerrainObjects pushBack[_hiddenObjects,(diag_tickTime)];
			[_mines, 0] call GMSCore_fnc_deleteObjectsMethod;	
			[_crates, 0] call GMSCore_fnc_deleteObjectsMethod;
			[_objects, 0] call GMSCore_fnc_deleteObjectsMethod;				
			[_missionAI, 0] call GMSCore_fnc_deleteObjectsMethod;				
			[_aiVehicles, 0] call GMSCore_fnc_deleteObjectsMethod;
			[_lootVehicles, 0] call GMSCore_fnc_deleteObjectsMethod;
			[format["Mission Aborted <CRATE MOVED> | _coords %1 : _markerClass %2 :  _markerMissionName %3",_coords,_markerName,_markerName]] call GMS_fnc_log;
	};
	case 3: {  // Mision aborted for killing an asset
			[["warning",_endMsg,_markerName]] call GMS_fnc_messageplayers;
			GMS_hiddenTerrainObjects pushBack[_hiddenObjects,(diag_tickTime)];
			[_mines, 0] call GMSCore_fnc_deleteObjectsMethod;	
			[_crates, 0] call GMSCore_fnc_deleteObjectsMethod;
			[_objects, 0] call GMSCore_fnc_deleteObjectsMethod;				
			[_missionAI, 0] call GMSCore_fnc_deleteObjectsMethod;				
			[_aiVehicles, 0] call GMSCore_fnc_deleteObjectsMethod;
			[_lootVehicles, 0] call GMSCore_fnc_deleteObjectsMethod;
			[format["Mission Aborted <ASSET KILLED> | _coords %1 : _markerClass %2 :  _markerMissionName %3",_coords,_markerName,_markerName]] call GMS_fnc_log;
	};
	case 4: {
			//[format["_endMission (153): _exception 4 | count _mines %1 | count _crates %2 | count _objects %3 | count _missionAI %4 ",_mines,_crates,count _objects, count _missionAI]] call GMS_fnc_log;
			GMS_hiddenTerrainObjects pushBack[_hiddenObjects,(diag_tickTime)];
			if (GMS_useSignalEnd) then
			{
				//[(_crates select 0),150, GMS_smokeShellAtCrates] call GMSCore_fnc_visibleMarker;
				{
					_x enableRopeAttach true;
					[_x, 150, GMS_smokeShellAtCrates] call GMSCore_fnc_visibleMarker;					
				}forEach _crates;
			};
			
			[["end",_endMsg,_markerMissionName]] call GMS_fnc_messageplayers;

			[_coords, _markerName] spawn GMS_fnc_missionCompleteMarker;

			{
				private ["_v","_posnVeh"];
				_posnVeh = GMS_monitoredVehicles find _x;  // returns -1 if the vehicle is not in the array else returns 0-(count GMS_monitoredVehicles -1)
				if (_posnVeh >= 0) then
				{
					(GMS_monitoredVehicles select _posnVeh) setVariable ["missionCompleted", diag_tickTime];
				} else {
					_x setVariable ["missionCompleted", diag_tickTime];
					GMS_monitoredVehicles pushback _x;
				};
			} forEach _aiVehicles;			
			[_mines, 0] call GMSCore_fnc_deleteObjectsMethod;	
			[_crates, 1200] call GMSCore_fnc_deleteObjectsMethod;
			[_objects, 0] call GMSCore_fnc_deleteObjectsMethod;				
			[_missionAI, 0] call GMSCore_fnc_deleteObjectsMethod;				
			[_aiVehicles, 0] call GMSCore_fnc_deleteObjectsMethod;
			[_lootVehicles, 0] call GMSCore_fnc_deleteObjectsMethod;			
	};	

	case 5: {
			//[format["_endMission (190): _exception 5 | count _mines %1 | count _crates %2 | count _objects %3 | count _missionAI %4 ",_mines,_crates,count _objects, count _missionAI]] call GMS_fnc_log;
			GMS_hiddenTerrainObjects pushBack[_hiddenObjects,(diag_tickTime)];
			if (GMS_useSignalEnd) then
			{
				//[_crates select 0,150, GMS_smokeShellAtCrates] call GMSCore_fnc_visibleMarker;
				{
					_x enableRopeAttach true;
					[_x, 150, GMS_smokeShellAtCrates] call GMSCore_fnc_visibleMarker;
				}forEach _crates;
			};
			
			[["end",_endMsg,_markerMissionName]] call GMS_fnc_messageplayers;

			[_coords, _markerName] spawn GMS_fnc_missionCompleteMarker;

			{
				private ["_v","_posnVeh"];
				_posnVeh = GMS_monitoredVehicles find _x;  // returns -1 if the vehicle is not in the array else returns 0-(count GMS_monitoredVehicles -1)
				if (_posnVeh >= 0) then
				{
					(GMS_monitoredVehicles select _posnVeh) setVariable ["missionCompleted", diag_tickTime];
				} else {
					_x setVariable ["missionCompleted", diag_tickTime];
					GMS_monitoredVehicles pushback _x;
				};
			} forEach _aiVehicles;			
			[_mines, 0] call GMSCore_fnc_deleteObjectsMethod;	
			[_crates, 120] call GMSCore_fnc_deleteObjectsMethod;
			[_objects, 0] call GMSCore_fnc_deleteObjectsMethod;				
			[_missionAI, 0] call GMSCore_fnc_deleteObjectsMethod;				
			[_aiVehicles, 0] call GMSCore_fnc_deleteObjectsMethod;
			[_lootVehicles, 0] call GMSCore_fnc_deleteObjectsMethod;			
	};	
};

GMS_missionsRunning = GMS_missionsRunning - 1;
GMS_ActiveMissionCoords = GMS_ActiveMissionCoords - [ _coords];	
if !(_isScuba) then
{
	GMS_recentMissionCoords pushback [_coords,diag_tickTime]; 
};
if (_isScuba) then
{
	GMS_priorDynamicUMS_Missions pushback [_coords,diag_tickTime]; 
	GMS_UMS_ActiveDynamicMissions = GMS_UMS_ActiveDynamicMissions - [_coords];
	GMS_dynamicUMS_MissionsRuning = GMS_dynamicUMS_MissionsRuning - 1;		
};

GMS_missionsRun = GMS_missionsRun + 1;