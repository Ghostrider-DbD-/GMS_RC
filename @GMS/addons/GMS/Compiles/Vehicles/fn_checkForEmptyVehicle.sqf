/*
	GMS_fnc_checkForEmptyVehicle 

	By Ghostrider [GRG]
	Copyright 2016
	
	Parameters:
		_veh - the vehicle to check. 

	Returns:
		None
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
params["_veh"];
if (crew(_veh) isEqualTo [] || {({alive _x} count (crew _veh) isEqualTo 0)}) then 
{
	[_veh] call GMS_fnc_handleEmptyVehicle;
};