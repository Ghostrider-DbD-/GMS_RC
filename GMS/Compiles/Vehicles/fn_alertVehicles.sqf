/*
	GMS_fnc_alertVehicles 
	By Ghostrider-GRG 
	Copyright 2022 
	
	Parameters:
		_unit: the object that was attacked or killed 
		_instigator: the object that pulled the trigger 

	Returns 
		None
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
params["_unit","_instigator"];
private _lastAlert = (group _unit) getVariable["GMS_lastAlert",0];
if (diag_tickTime < (_lastAlert + 5)) exitWith {};  //  so this function is not totally spammed
(group _unit) setVariable["GMS_lastAlert",diag_tickTime];
private _difficulty = (group _unit) getVariable["GMS_difficulty","Red"];
private _index = [_difficulty] call GMS_fnc_getIndexFromDifficulty;
private _nearAir = GMS_aircraftPatrols select {_x distance _unit < 1500};
private _nearLand = GMS_landVehiclePatrols select {_x distance _unit < 800};
private _intelligence = GMS_AIIntelligence select ([_difficulty] call GMS_fnc_getIndexFromDifficulty);
{
	private _grp = group(driver _x);
	private _knowsAbout = _grp knowsAbout _instigator;
	_grp reveal[_instigator,_intelligence];
	[(leader _grp),_instigator] call GMSCore_fnc_setHunt;
	[(leader _grp), _instigator] call GMSCore_fnc_nextWaypointAreaPatrol;
} forEach (_nearAir + _nearLand);