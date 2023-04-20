/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_pos","_crate",["_crateVisualMarker",true],["_dropHeight", 150]];
private _chute = createVehicle ["I_Parachute_02_F", _pos, [], 0, "FLY"];
[_chute] call GMS_fnc_protectVehicle;
_crate setVariable["chute",_chute];
_chute setPos [getPos _chute select 0, getPos _chute select 1, _dropHeight];
_crate setPos (getPos _chute);
_crate attachTo [_chute, [0,0,0]];	
if (_crateVisualMarker) then {[_crate,150] spawn GMS_fnc_visibleMarker};
_chute

