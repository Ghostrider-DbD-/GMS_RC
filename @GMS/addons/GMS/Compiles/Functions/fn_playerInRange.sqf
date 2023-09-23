//////////////////////////////////////////////////////
// Test whether one object (e.g., a player) is within a certain range of any of an array of other objects
/*
	GMS_fnc_playerInRange

	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"
params[["_coords",[0,0,0]],["_range",0],["_onFootOnly",false]];
private ["_result","_players"];

private "_players";

if (_onFootOnly) then 
{
	_players = allPlayers select {(vehicle _x) isEqualTo _x && {_x distance _coords < _range}};	
} else {
	_players = allPlayers select {(_x distance _coords) < _range};
};

private _result = if (_players isEqualTo []) then {false} else {true};

_result
