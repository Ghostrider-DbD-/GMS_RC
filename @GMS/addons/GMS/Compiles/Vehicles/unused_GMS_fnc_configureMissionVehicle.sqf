
/*
	By Ghostrider [GRG]
	
	GMS_fnc_configureMissionVehicle 

	Parameters:
		_veh - The vehicle to handle 

	Returns 
		-veh
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

params["_veh"];

if (GMSCore_modtype isEqualTo "Epoch") then
{
	// Adds compatability with Halv's black market traders
	if (GMS_allowSalesAtBlackMktTraders) then {_veh setVariable["HSHALFPRICE",1,true]};
};
if (GMSCore_modtype isEqualTo "Exile")	then 
{
	// Adds compatability with claim vehicle scripts
	if (GMS_allowClaimVehicle) then 
	{
		_veh setVariable ["ExileIsPersistent", false];
	};
};

_veh
