
params["_isGarrison"];
private _selectedObjects = get3DENSelected "object";
if (count _selecteObjects == 1) then {
	(_selectedObjects select 0) setVariable["gmsIsGarrison",_isGarrison];
} else {
		["Changes not applied: you can only configure one object at a time","ERROR"] call BIS_fnc_3DENShowMessage;
};