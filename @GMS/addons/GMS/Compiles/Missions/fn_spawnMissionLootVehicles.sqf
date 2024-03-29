/*
	GMS_fnc_spawnMissionLootVehicles 
	
	by Ghostridere-GRG-
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

params["_coords","_missionLootVehicles",["_loadCrateTiming","atMissionSpawn"],["_lock",0],["_missionFile",""]];
if (count _coords isEqualTo 2) then {_coords pushBack 0};
private _vehs = [];
{
	_x params[["_vehType",""],["_vehOffset",[]],["_dir",0],["_lootArray",[]],["_lootCounts",[]]];
	try {
		if !(isClass(configFile >> "CfgVehicles" >> _vehType)) throw -3;
		if (_vehOffset isEqualTo []) throw -2; 
		if (_lootArray isEqualTo []) throw -1;
		if (_lootCounts isEqualTo []) throw -4;
		throw 1;
	}

	catch {
		switch(_exception) do 
		{
			case -4: {
				[format["_lootCounts not specified in %1 in %2",_x,_missionFile],'warning'] call GMS_fnc_log;
			};
			case -3: {
				[format["_lootArray not specified in %1 in %2",_x,_missionFile],'warning'] call GMS_fnc_log;
			};
			case -2: {
				[format["_vehOffset not specified in %1 in %2",_x,_missionFile],'warning'] call GMS_fnc_log;
			};
			case -1: {
				[format["_vehType %1 in %2 of %3 is not a valid class",_vehType,_x,_missionFile],'warning'] call GMS_fnc_log;
			};
			case 1: {
				_veh = [_vehType, _coords vectorAdd _vehOffset] call GMS_fnc_spawnVehicle;
				[_veh, _dir] call GMSCore_fnc_setDirUp;
				_veh lock _lock;
				if (_loadCrateTiming isEqualTo "atMissionSpawnGround") then
				{
					[_veh,_lootArray,_lootCounts] call GMS_fnc_fillBoxes;
					_veh setVariable["lootLoaded",true];
					private _crateMoney = missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty]);
					[format["GMS_fnc_spawnMissionLootVehicles (29) _crateMoney = %1",_crateMoney]] call GMS_fnc_log;		
					//[_veh,missionNamespace getVariable (format["GMS_crateMoney%1",_difficulty])] call GMS_fnc_setMoney;
				} else {
					_veh setVariable["lootArray",_lootArray];
					_veh setVariable["lootCounts",_lootCounts];
					_veh setVariable["lootLoaded",false];		
				};
				_vehs pushback _veh;
			};
		};
	};

}forEach _missionLootVehicles;
_vehs
