/*
	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

params["_aiDifficulty"];
private _choices = missionNameSpace getVariable [format["GMS_AIPatrolVehicles%1",_aiDifficulty],GMS_AIPatrolVehicles];
private _vehicle = selectRandom _choices;
//diag_log format["GMS_fnc_selectPatrolVehicle returning %1 | _choices = %2",_vehicle,_choices];
_vehicle



