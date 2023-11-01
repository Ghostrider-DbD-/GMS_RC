/*
	By Ghostrider [GRG]
    GMS_fnc_handleVehicleGetOut
    Processes an event that fires when a unit gets out of a vehicle

	Parameters 
		_veh: the vehicle from which a unit ejected or got out. 
	
	Returns
		None 
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#define veh _this select 0
if ((isServer) || {local (veh)}) then {[veh] call GMS_fnc_checkForEmptyVehicle};