

{
 _m = format["object = %1",_x];
 systemChat _m; 
 diag_log _m; 
} forEach nearestTerrainObjects [player, [], 50];

_u = player;
diag_log format["fn_isInside: _u = %1",_u];
all3DENEntities params ["_objects"];

private _pos = getPosASL _u;
private _above =  AGLToASL [_pos select 0, _pos select 1, (_pos select 2) + 100];
private _below = AGLtoASL [_pos select 0, _pos select 1, (_pos select 2) - 10];
private _objAbove = lineIntersects [_pos, _above, _u,_u];
private _objBelow = lineIntersects [_pos, _below, _u,_u];
private _isInside = if (_objAbove || _objBelow) then {true} else {false};
_m = format["fn_isInside: _u = %4 | _objAbove = %1 | _objBelow = %2 | _isInside %3",_objAbove,_objBelow,_isInside,_u];
systemchat _m;
diag_log _m;