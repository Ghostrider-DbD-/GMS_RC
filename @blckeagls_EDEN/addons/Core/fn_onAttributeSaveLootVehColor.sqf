
params["_colorOn"];

_object setVariable["gmsGarrisonColor",_colorOn];
private _isLootVeh = _object getVariable["gmsIsLootVehicle",false];
if (_colorOn && _isLootVeh) then {
	{_object setObjectTexture [_x,gms3DENGarrisonTexture]} forEach (count (getObjectTextures _object));
} else {
	{_object setObjectTexture [_x,""]} forEach (count (getObjectTextures _object));
};