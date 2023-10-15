/*

	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

//diag_log format["GMS_fnc_missionCompleteMarker:: _this = %1",_this];
private _location = _this select 0;
private _name = str(random(1000000)) + "MarkerCleared";
_m = createMarker [_name, _location];
_m setMarkerColor "ColorBlack";
_m setMarkerType "n_hq";
_m setMarkerText "Mission Cleared";

[_m, diag_tickTime + 360] call GMSCore_fnc_addToDeletionCue;

