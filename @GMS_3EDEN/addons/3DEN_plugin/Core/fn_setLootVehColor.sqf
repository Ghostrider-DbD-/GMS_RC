
params["_checked"];
private _selectedObjects = get3DENSelected "object";
diag_log format["onAttributeSaveLootVehColor: _control %1 | _isGarrison %2 | _selectedObjects %3",_control,_isColorOn,_selectedObjects];
if (count _selecteObjects == 1) then {
	private _object = _selectedObjects select 0;
	private _isLootVeh = _object getVariable["gmsIsLootVehicle",false];
	_object setVariable["gmsLootVehicleColor",_isColorOn];
	if (_checked && _isLootVeh) then {
		{_object setObjectTexture [_x,gms3DENlootVehicleTexture]} forEach (count (getObjectTextures _object));
	} else {
		{_object setObjectTexture [_x,""]} forEach (count (getObjectTextures _object));
	};
};

