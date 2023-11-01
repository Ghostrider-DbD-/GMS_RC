/*
	GMS_fnc_updateMarkerAliveCount
	
	Purpose: 
		update the life AI count shown with mission markers 
	
	Params: 
		_marker - the marker to update 
		_rootText - the markerText used before adding alive AI counts 
		_missionAI - an array of units for that mission 

	Retuns: 
		None 
		
	by Ghostrider [GRG] 
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
params["_marker","_rootText","_missionAI"];

_marker setMarkerText format["%1 / %2 AI Alive",_rootText,{alive _x} count _missionAI];
