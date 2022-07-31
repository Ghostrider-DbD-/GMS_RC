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
if !(local (_this select 0)) exitWith {};
params ["_unit", "_killer", "_instigator"];
if !(isPlayer _instigator) exitWith {};
[_unit,_instigator] call GMS_fnc_alertVehicles;