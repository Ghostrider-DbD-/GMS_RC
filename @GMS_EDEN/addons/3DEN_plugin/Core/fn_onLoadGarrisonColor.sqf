

params ["_displayOrControl", ["_config", configNull]];
private _selectedObjects = get3DENSelected "object";
diag_log format["onLoadGarrisonColor: _selectedObjects = %1",_selectedObjects];

private "_colorOn";
if (count _selectedObjects == 1) then {
	private _object =  (_selectedObjects select 0);
	 _colorOn = _object getVariable["gmsGarrisonColor",false];
	 _displayOrControl cbSetChecked _colorOn;
	 diag_log format["_colorOn = %1 | _obj = %2",_colorOn,_object];
} else {
	_displayOrControl cbSetChecked false;
		["You can configure Garrison Status for only ONE vehicle at a time","ERROR"] call BIS_fnc_3DENShowMessage;
};