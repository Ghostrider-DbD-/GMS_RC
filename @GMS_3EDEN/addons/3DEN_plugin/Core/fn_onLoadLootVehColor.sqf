

params ["_displayOrControl", ["_config", configNull]];
private _selectedObjects = get3DENSelected "object";

if (count _objects == 1) then 
{
	_displayOrControl cbSetChecked ((_objects select 0) getVariable["gmsLootVehicleColor",false]);
} else {
	_displayOrControl cbSetChecked false;
	["You can configure Loot Vehicle Status for only ONE vehicle at a time","ERROR"] call BIS_fnc_3DENShowMessage;
};