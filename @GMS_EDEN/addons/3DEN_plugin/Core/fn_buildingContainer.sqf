/*
	Returns the builing containing an object or objNull
	By Ghostrider-GRG-
	Copyright 2020 
*/
params["_u",["_category","House"]];
private _pos = getPosASL _u;
private _building = objNull;
private _surfacesAbove = lineInterSectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) + 100],_u,_u,true,10];
private _surfacesBelow = lineIntersectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) - 100],_u,_u,true,10];
{
	if ((_x select 2) isKindOf _category && !(_x isEqualTo _u)) exitWith {_building = (_x select 2)};
} forEach _surfacesAbove + _surfacesbelow;
diag_log format["_buildingContainer: _u = %1| _buildig = %2",_u,_building];
_building
