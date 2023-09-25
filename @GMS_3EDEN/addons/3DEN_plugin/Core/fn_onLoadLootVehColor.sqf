

params ["_displayOrControl", ["_config", configNull]];
private _selectedObjects = get3DENSelected "object";

if !(count _objects > 1) then {
	["You can configure Loot Vehicle Status for only ONE vehicle at a time","ERROR"] call BIS_fnc_3DENShowMessage;
};