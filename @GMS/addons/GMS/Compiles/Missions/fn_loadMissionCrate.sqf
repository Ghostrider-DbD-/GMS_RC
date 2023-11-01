/*
	By Ghostrider-GRG-
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
private _crate = _this select 0;
private _lootCounts = _crate getVariable "lootCounts";
private _lootarray = _crate getVariable "lootArray";
[_crate,_lootArray,_lootCounts] call GMS_fnc_fillBoxes;
_crate setVariable["lootLoaded",true];



	
