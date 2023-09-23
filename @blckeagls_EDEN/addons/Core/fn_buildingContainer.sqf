/*
	Returns the builing containing an object or objNull
	By Ghostrider-GRG-
	Copyright 2020 
*/
// TODO: Needs testing
params["_u",["_category","Building"]];

private _pos = getPosASL _u;
private _above =  AGLToASL [_pos select 0, _pos select 1, (_pos select 2) + 100];
private _below = AGLtoASL [_pos, [_pos select 0, _pos select 1, (_pos select 2) - 10]];
private _objAbove = lineIntersectsObjs [_pos, _above, _u];
private _objBelow = lineIntersectsObjs [_pos, _below, _u];
private _containers = [];
private _container = objNull;
private _distance = 1000;
if !(_objAbove isEqualTo []) then 
{
	_containers = _objAbove;
} else {
	if !(_objBelow isEqualTo []) then 
	{
		_containers = _objBelow;
	};
};
if !(_containers isEqualTo []) then 
{
	while {!(_containers isEqualTo [])} do 
	{
		private _obj = _containers deleteAt 0;
		private _dis = _obj distance _pos;
		if (_dis < _distance) then {
			_distance = _dis;
			_container = _obj;
		};
	};
};
if !(isNull _container) then 
{
	private _buildingPos = [_container] call BIS_fnc_buildingPositions;
	if (_buildingPos isEqualTo []) then {diag_log format["<gmd3DEN> WARNING: a unit or turret was place in a building  of classname %1 that can not be entered", typeOf _container]};
};
_container
