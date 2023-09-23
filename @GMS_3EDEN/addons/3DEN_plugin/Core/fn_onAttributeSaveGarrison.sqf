
params["_isGarrison"];
private _isGarrison;
private _selectedObjects = get3DENSelected "object";
diag_log format["onAttributeSaveGarrison: _isGarrison %1 | _selectedObjects %2",_isGarrison,_selectedObjects];
if (count _selecteObjects == 1) then {
	private _object = _selectedObjects select 0;
	private _isGarrison = _object getVariable["gmsIsGarrison",false];
	_object setVariable["gmsIsGarrison",_isGarrison];
};