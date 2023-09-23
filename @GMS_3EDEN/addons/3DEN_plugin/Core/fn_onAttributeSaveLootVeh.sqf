

params["_control"];
private _isLootVeh = ctrlChecked _control;
private _selectedObjects = get3DENSelected "object";
diag_log format["onAttributeSaveLootVeh: _control %1 | _isGarrison %2 | _selectedObjects %3",_control,_isLootVeh,_selectedObjects];
if (count _selecteObjects == 1) then {
	private _object = _selectedObjects select 0;
	_object setVariable["gmsIsLootVehicle",_isLootVeh];
} else {
		["Changes not applied: you can only configure one object at a time","ERROR"] call BIS_fnc_3DENShowMessage;
};
