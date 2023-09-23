
params["_colorOn"];

_object setVariable["gmsGarrisonColor",_colorOn];
private _isGarrison = _object getVariable["gmsIsGarrison",false];
if (_colorOn && _isGarison) then {
{_object setObjectTexture [_x,gms3DENGarrisonTexture]} forEach (count (getObjectTextures _object));
} else {
{_object setObjectTexture [_x,""]} forEach (count (getObjectTextures _object));
};