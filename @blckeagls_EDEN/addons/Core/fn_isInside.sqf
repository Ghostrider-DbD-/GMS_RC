/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params["_u"];
diag_log format["fn_isInside: _u = %1",_u];

private _pos = getPosASL _u;
private _above =  AGLToASL [_pos select 0, _pos select 1, (_pos select 2) + 100];
private _below = AGLtoASL [_pos select 0, _pos select 1, (_pos select 2) - 10];
private _objAbove = lineIntersects [_pos, _above, _u];
private _objBelow = lineIntersects [_pos, _below, _u];
diag_log format["fn_isInside: _objAbove = %1 | _objBelow = %2",_objAbove,_objBelow];
private _isInside = if (_objAbove || _objBelow) then {true} else {false};
_isInside
