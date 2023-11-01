///////////////////////////////////////////////////////
/// Test whether one object (e.g., a player) is within a certain range of any of an array of other objects
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

#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
params[["_coords",[0,0,0]],["_range",0],["_onFootOnly",true],["_onGroundOnly",true]];
private "_players";
if (_onGroundOnly) then {
	_players = allPlayers select {(((getPosATL _x) select 2) < 1)};
} else {
	_players = allPlayers;
};
if (_onFootOnly) then 
{
	// 9/27/23  Be sure any players detected are on the ground.
	private _players = _players select{((vehicle _x) isEqualTo _x) && ((_x distance _coords) < _range)};
} else {
	_players = _players select {(_x distance _coords) < _range};
};

private _result = if (_players isEqualTo []) then {false} else {true};
diag_log format["_playerInRange: _onGroundOnly = %3 |_result = %1 | _players = %2",_result,_players,_onGroundOnly];
_result
 