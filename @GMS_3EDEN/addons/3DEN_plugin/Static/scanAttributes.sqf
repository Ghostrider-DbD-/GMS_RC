

all3DENEntities params ["_objects"];
{
	private _garrison = _x getVariable["gmsIsGarrison",false];
	_m = format["scanAttributes: object %1 | displayName %2 | _garrison %3",_x, getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"), _garrison];
	systemChat _m;
	diag_log _m;
} forEach _objects;