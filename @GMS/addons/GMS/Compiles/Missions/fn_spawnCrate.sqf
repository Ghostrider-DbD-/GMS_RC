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

params["_coords",["_crateType","Box_NATO_Wps_F"],["_crateDir",0]];

//private _cratePos = _coords findEmptyPosition[15,25,_crateType];
private _crate = [_crateType,_coords,_crateDir] call GMSCore_fnc_spawnCrate;
[_crate] call GMSCore_fnc_emptyObjectInventory;
_crate setVariable ["LAST_CHECK", 100000];
_crate allowDamage false;
_crate enableRopeAttach false;
_crate;
