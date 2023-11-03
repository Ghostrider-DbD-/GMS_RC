/*
	GMS_fnc_spawnMissionCrates
	
	By Ghostrider [GRG]
	Copyright 2018
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

_fnc_dropMissionCrates = {
	private ["_crates","_marker","_markers","_location","_airborneCrates","_curPosCrate"];
	params["_crates","_missionFile"];
 
	_markers = [];
	
	{
		[(getPos _x), _x, true, 20] call GMS_fnc_paraDropObject;
	} forEach _crates;
	
	_airborneCrates = _crates;
	while {count _airborneCrates > 0} do
	{
		uiSleep 1;
		{
			if ((getPos _x) select 2 < 5) then 
			{
				_airborneCrates = _airborneCrates - [_x];
				_chute = _x getVariable["chute",objNull];
				detach _x;
				deleteVehicle _chute;
				_location = getPos _x;
				
				/*
					params[
						["_markerName","NoNameGiven"],  // the name used when creating the marker. Must be unique.
						["_markerPos",[0,0]],
						["_markerLabel","NoLabelGiven"],  //  Text used to label the marker
						["_markerColor","NoColorGiven"],
						["_markerType","NoTypeGiven"],	// Use either the name of the icon or "ELLIPSE" or "RECTANGLE" where non-icon markers are used
						["_markerSize",[0,0]],
						["_markerBrush","NoBrushGiven"],
						["_showMarkers",true],
						["_missionFile","NoFilenameProvided"]
					];
				*/
				_marker = [
					format["crateMarker%1",random(round(1000000))],
					_location,
					"",
					"ColorBlack",
					"mil_dot",
					[0,0],
					"",
					true,
					_missionFile
				] call GMS_fnc_createMissionMarkers;
				
				[_marker,diag_tickTime + 300] call GMSCore_fnc_addToDeletionCue;

				_curPosCrate = getPos _x;
				_x setPos [_curPosCrate select 0, _curPosCrate select 1, 0.3];
			};
		} forEach _crates;
	};
};

params[ ["_coords", [0,0,0]], ["_cratesToSpawn",[]], ["_loadCrateTiming","atMissionSpawn"],["_spawnCrateTiming","atMissionSpawn"],["_missionState","start"], ["_difficulty","red"], ["_missionFile",""] ];


private _params = ["_coords","_cratesToSpawn","_loadCrateTiming","_spawnCrateTiming","_missionState","_difficulty"];

if ((count _coords) == 2) then // assume only X and Y offsets are provided
{
	_coords pushback 0;; // calculate the world coordinates
};
private _cratesSpawned = [];

{
	_x params["_crateType","_crateOffset","_lootArray","_lootCounts",["_crateDir",0]];
	
	private _pos = _coords vectorAdd _crateOffset;
	private _crate = [_pos,_crateType] call GMS_fnc_spawnCrate;
	[_crate, _crateDir] call GMSCore_fnc_setDirUp;
	_crate setVariable["lootArray",_lootArray];
	_crate setVariable["lootCounts",_lootCounts];
	_crate setVariable["difficulty",_difficulty];
	if (_loadCrateTiming isEqualTo "atMissionSpawn" || {_missionState isEqualTo "end"}) then
	{
		[_crate] call GMS_fnc_loadMissionCrate;
	};
	_cratesSpawned pushback _crate;
}forEach _cratesToSpawn;

if (_spawnCrateTiming in ["atMissionEndAir","atMissionSpawnAir"]) then 
{
	[_cratesSpawned,_missionFile] spawn _fnc_dropMissionCrates;
} else {
	{
		_x setVariable["crateSpawnPos", (getPos _x)];
	} forEach _crates;	
};

_cratesSpawned
