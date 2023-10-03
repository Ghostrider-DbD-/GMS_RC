

params[
    ["_coords",[]],
    ["_garrisonedUnits",[]],
    ["_difficulty","Red"],
    ["_uniforms",[]],
    ["_headGear",[]],
    ["_vests",[]],
    ["_backpacks",[]],
    ["_weaponList",[]],
    ["_sideArms",[]]
];
/*
{
    diag_log format["_spawnGarrisonedUnits: _this %1 = %2",_forEachIndex, _x];
} forEach _this;
*/
if (_weaponList isEqualTo []) then {_weaponList = [_aiDifficultyLevel] call GMS_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_aiDifficultyLevel] call GMS_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_aiDifficultyLevel] call GMS_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_aiDifficultyLevel] call GMS_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_aiDifficultyLevel] call GMS_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_aiDifficultyLevel] call GMS_fnc_selectAIBackpacks};    
#define unitsToSpawn 1

/*
params[
	["_pos",[-1,-1,1]], 
	["_numbertospawn",0], 
	["_skillLevel","red"], 
	["_areaDimensions",[]], 
	["_uniforms",[]], 
	["_headGear",[]],
	["_vests",[]],
	["_backpacks",[]],
	["_weaponList",[]],
	["_sideArms",[]], 
	["_scuba",false]
];
*/

private _group = [[-1,-1,-1],count _garrisonedUnits,_difficulty,[],_uniforms,_headgear,_vests,_backpacks,_weaponList,_sidearms,false] call GMS_fnc_spawnGroup;
if (isNull _group) exitWith {["Null Group used in GMS_fnc_spawnGarrisonnedUnits","warning"] call GMS_fnc_log};
for "_i" from 0 to (count waypoints _group - 1) do
{
	deleteWaypoint [_group, 0];
};
private _units = units _group;
//diag_log format["GMS_fnc_spawnGarrisonedUnits: _coords %3 |  _group %1 | _units %2",_group,_units, _coords];
{
    private _unit = _units select _forEachIndex;
    private _location = _garrisonedUnits select _forEachIndex;
    _location params["_unitRelPos","_unitDir"];
    //diag_log format["GMS_fnc_spawnGarrisonedUnits: _unitRelPos %1 | _unitDir %2 | _location %3",_unitRelPos, _unitDir, _location];
    _unit setPosATL (_unitRelPos vectorAdd _coords);
    _unit setDir _unitDir;
    //_unit disableAI "PATH";
} forEach _garrisonedUnits;

  