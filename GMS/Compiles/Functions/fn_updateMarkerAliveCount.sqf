/*
	GMS_fnc_updateMarkerAliveCount
	
	by Ghostrider [GRG] 
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
params["_marker","_rootText","_missionAI"];

private _txtPrior = markerText _marker;
_marker setMarkerText format["%1 / %2 AI Alive",_rootText,{alive _x} count _missionAI];
