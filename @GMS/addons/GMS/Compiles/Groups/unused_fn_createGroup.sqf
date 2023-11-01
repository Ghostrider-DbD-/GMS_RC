/*
	[] call GMS_fnc_createGroup

	Notes: Kept for backwards compatability with the static mission system if this is kept and not updated.

	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
params[["_side",GMSCore_side],["_deleteWhenEmpty",true]];
// for information about the _deleteWhenEmpty parameter see: https://community.bistudio.com/wiki/createGroup

private _groupSpawned = createGroup [_side, true]; 
if (isNull _groupSpawned) exitWith{"ERROR:-> Null Group created by GMS_fnc_spawnGroup";};
if (GMS_simulationManager == GMS_useDynamicSimulationManagement) then 
{
	_groupSpawned enableDynamicSimulation true;
};
_groupSpawned setcombatmode "RED";
_groupSpawned setBehaviour "COMBAT";
_groupSpawned allowfleeing 0;
_groupSpawned setspeedmode "FULL";
_groupSpawned setFormation GMS_groupFormation; 
_groupSpawned setVariable ["GMS_group",1];
_groupSpawned