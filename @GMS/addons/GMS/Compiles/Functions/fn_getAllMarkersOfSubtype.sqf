/*
	GMS_fnc_getAllMarkersOfSubtype

	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

/*
	Useful if you know the rootname for markers for a mission system to add these to black lists or other lists
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
private _subtype = _this;
private _end = (count _subtype) - 1;
private _m = [];
{
	if ([_x,0,_end] call BIS_fnc_trimString isEqualTo _subtype) then {_m pushBack _x};
} forEach allMapMarkers;

_m

