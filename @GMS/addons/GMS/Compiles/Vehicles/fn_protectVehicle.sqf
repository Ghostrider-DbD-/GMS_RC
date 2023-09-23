/*
	By Ghostrider-GRG 
	Copywrithe 2022
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_veh"];

if (GMSCore_modtype isEqualTo "Epoch") then
{
	_veh call EPOCH_server_setVToken;
};



