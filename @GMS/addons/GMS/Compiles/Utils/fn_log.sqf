/*
	GMS_fnc_log

	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

params[["_message","Unknown Message"],["_code",""]];

switch (toLowerANSI _code) do 
{
	case "error": {_message = format["[GMS]  <ERROR>  %1",_message]};
	case "warning": {_message = format["[GMS] <WARNING>  %1",_message]};
	default {_message = format["[GMS] %1",_message]};
};
diag_log _message;