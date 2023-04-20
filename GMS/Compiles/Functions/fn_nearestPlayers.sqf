
/*
	GMS_fnc_nearestPlayers
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params[["_coords",[]],"_range"];
/*
{
	diag_log format["_fnc_nearestPlayers: %1 = %2",_x, _this select _forEachIndex];
}forEach ["_coords", "_range"];
*/
if (_coords isEqualTo []) then 
{
	_coords = [0,0,0];
	//diag_log format["[GMS] No value passed to GMS_fnc_nearestPlayers for _coords - default of [0,0,0] used"];
};

private _players = allPlayers select {(_x distance _coords) < _range};
//diag_log format["_fnc_nearestPlayers: _coords %1 | _range %2 | _return = %3",_coords,_range,_players];
_players
