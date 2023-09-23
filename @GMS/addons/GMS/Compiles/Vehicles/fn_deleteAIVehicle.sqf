/*
 	GMS_fnc_deleteAIVehicle 

  	by Ghostrider
	Copyright 2022 
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_veh"];
GMS_monitoredVehicles deleteAt (GMS_monitoredVehicles find _veh);			
deleteVehicle _veh;
