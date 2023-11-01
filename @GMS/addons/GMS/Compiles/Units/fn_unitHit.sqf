/*
	By Ghostrider [GRG]

	Handles the case where a unit is hit.

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
if !(local (_this select 0)) exitWith {};
params ["_unit", "_source", "_damage", "_instigator"];
//[format["GMS_fnc_unitHit: _unit = %1 | _source %2 | vehicle _source %3 | _instigator %4",_unit,_source, vehicle _source, _instigator]] call GMS_fnc_log;
if !(isPlayer _instigator) exitWith {};
[_unit,_instigator] call GMS_fnc_alertVehicles;