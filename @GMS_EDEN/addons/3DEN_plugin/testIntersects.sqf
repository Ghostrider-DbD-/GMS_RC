private _obj = cursorObject; 
private _pos = getPosATL _obj;
private _startPos = _pos;
private _endPos =  [_pos select 0, _pos select 1, (_pos select 2) + 100];
private _objIntersect  = lineIntersectsObjs  [_startPos, _endPos,_obj,_obj,true];
private _count = count _ojbIntersect;
systemChat format["count = %1",_count];
if !(_count isEqualTo 0) then 
{
	private _firstObj = _objIntersect select 0;
	private _lastObj = _objIntersect select ((count _objIntersect) - 1);
	_m = format["first Obj = %1 | last Obj = %2 | cursorObj = %3",_firstObj,_lastObj, _obj];
	systemChat _m;
	diag_log _m;
};