
params["_control"];
private _isColorOn = ctrlChecked _control;
private _selectedObjects = get3DENSelected "object";
diag_log format["onAttributeSaveGarrisonColor: _control %1 | _isGarrison %2 | _selectedObjects %3",_control,_isColorOn,_selectedObjects];
if (count _selecteObjects == 1) then {
	private _object = _selectedObjects select 0;
	private _isGarrison = _object getVariable["gmsIsGarrison",false];
	_object setVariable["gmsGarrisonColor",_isColorOn];
	if (_isColor && _isGarrison) then {
		{_object setObjectTexture [_x,gms3DENGarrisonTexture]} forEach (count (getObjectTextures _object));
	} else {
		{_object setObjectTexture [_x,""]} forEach (count (getObjectTextures _object));
	};
};