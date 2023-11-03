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

#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

params["_pos","_crate",["_crateVisualMarker",true],["_dropHeight", 50]];
private _chute = createVehicle ["I_Parachute_02_F", _pos, [], 0, "FLY"];
[_chute] call GMS_fnc_protectVehicle;
_crate setVariable["chute",_chute];
_chute setPos [getPos _chute select 0, getPos _chute select 1, _dropHeight];
_crate setPos (getPos _chute);
_crate attachTo [_chute, [0,0,0]];	

/*
GMSCore_fnc_visibleMarker 
private _defaultSmokeShells = selectRandom ["SmokeShellOrange","SmokeShellBlue","SmokeShellPurple","SmokeShellRed","SmokeShellGreen","SmokeShellYellow"];
private ["_start","_maxHeight","_smokeShell","_light","_lightSource"];
params[["_crate",objNull],["_time",60],["_smokeShell", selectRandom "_defaultSmokeShells"]]; 
*/
if (_crateVisualMarker) then {[_crate,150, GMS_smokeShellAtCrates] call GMSCore_fnc_visibleMarker};
_chute

