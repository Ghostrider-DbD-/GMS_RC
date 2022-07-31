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
// GMS_fnc_vehiclePlayerSensingLogic.sqf
// No params
private["_searchRadius","_detectionOdds"];
{
	_searchRadius = _x getVariable["GMS_vehicleSearchRadius",800];
	_detectionOdds = _x getVariable["GMS_vehiclePlayerDetectionOdds",0.5];
	[_x,_searchRadius,_detectionOdds] call GMS_fnc_revealNearbyPlayers;
}forEach GMS_monitoredVehicles;