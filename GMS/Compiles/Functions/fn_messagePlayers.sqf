//This script sends Message Information to allplayers
/*
	GMS_fnc_messagePlayers

	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
if !(isServer) exitWith {};
params["_msg",["_players",allplayers]];
//[format["_messagePlayers - _msg = %1",_msg]] call GMS_fnc_log;
{
	if (isPlayer _x) then {_msg remoteExec["GMS_fnc_handleMessage",(owner _x)]};
} forEach _players;



