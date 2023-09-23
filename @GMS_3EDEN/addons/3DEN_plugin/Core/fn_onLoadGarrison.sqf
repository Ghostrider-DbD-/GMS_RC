/*


params ["_displayOrControl", ["_config", configNull]];
ⓘ
The order of initialisation is as follows:

    Topmost config class (control class)
    Last config class
    Display

This means that during the onLoad event of the upper controls the lower controls do not exist!

*/

params ["_displayOrControl", ["_config", configNull]];
private _selectedObjects = get3DENSelected "object";
diag_log format["onLoadGarrison: _selectedObjects = %1",_selectedObjects];

private "_isGarrison";
if (count _selectedObjects == 1) then {
	private _object =  (_selectedObjects select 0);
	 _isGarrison = _object getVariable["gmsIsGarrison",true];
	 _displayOrControl cbSetChecked _isGarrison;
	 diag_log format["_isGarrisson = %1 | _obj = %2",_isGarrison,_object];
} else {
	_displayOrControl cbSetChecked false;
		["You can configure Garrison Status for only ONE vehicle at a time","ERROR"] call BIS_fnc_3DENShowMessage;
};




