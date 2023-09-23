/*
	GMS_fnc_setDirUp

	By Ghostrider [GRG]
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
params["_object","_dir"];
switch (typeName _dir) do 
{
	case "SCALAR": {_object setDir _dir};
	case "ARRAY": {_object setVectorDirAndUp _dir};
};