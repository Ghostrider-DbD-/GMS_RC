/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params["_u"];

private _pos = getPosASL _u;
private _above =  AGLToASL [_pos select 0, _pos select 1, (_pos select 2) + 100];
private _below = AGLtoASL [_pos select 0, _pos select 1, (_pos select 2) - 10];
private _objAbove = lineIntersects [_pos, _above, _u,_u];
private _objBelow = lineIntersects [_pos, _below, _u,_u];
private _isInside = if (_objAbove || _objBelow) then {true} else {false};

_isInside

