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
params ["_vehicle", "_source", "_damage", "_instigator"];
//[format["GMS_fnc_vehicletHit: _vehicle = %1 | typeOf _vehicle %2 | _instigator %32",_vehicle,typeOf _vehicle, _instigator]] call GMS_fnc_log;
if !(isPlayer _instigator) exitWith {};
[_unit,_instigator] call GMS_fnc_alertVehicles;