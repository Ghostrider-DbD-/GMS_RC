/*
	calculate a reward player for AI Kills in crypto.
	Code fragment adapted from VEMF
	call as [_unit,_killer] call GMS_fnc_handlePlayerUpdates;
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

_fn_doUpdates = {
	params["_player","_unit"];
	private _lastkill = _player getVariable["GMS_lastkill",diag_tickTime];
	_player setVariable["GMS_lastkill",diag_tickTime];
	private _kills = (_player getVariable["GMS_kills",0]) + 1;
	if ((diag_tickTime - _lastkill) < 240) then
	{
		_player setVariable["GMS_kills",_kills];
	} else {
		_player setVariable["GMS_kills",0];
	};

	if (toLower(GMSCore_modtype) isEqualTo "epoch") then
	{
		#define maxReward 2500
		private _distanceBonus = floor((_unit distance _player)/100);
		private _killstreakBonus = 3 * (_player getVariable["GMS_kills",0]);
		private _reward = 25 + _distanceBonus + _killstreakBonus;
		[_player,_reward ] call GMSCore_fnc_giveTakeCrypto;
		[_player, 5] call GMSCore_fnc_setKarma;
		//if (isNil "GMS_fnc_killedMessages") then {diag_log format["blckeagls: GMS_fnc_killedMessages not defined"]};		
		if (GMS_useKillScoreMessage) then
		{
			[["showScore",[_reward,"",_kills],""],[_player]] call GMS_fnc_messageplayers;
			// params["_unit","_killer","_money","_respect","_killStreak"];
			//[_unit,_player,_reward,5] call GMS_fnc_killedMessages;
		};

		// SUggestion to update Epoch player stats from He-Man
		[_killer, "AIKills", 1, true] call EPOCH_server_updatePlayerStats;		
	};
	if (toLower(GMSCore_modtype) isEqualTo "exile") then
	{
		private _distanceBonus = floor((_unit distance _player)/100);
		private _killstreakBonus = 3 * (_player getVariable["GMS_kills",0]);
		private _respectGained = 25 + _distanceBonus + _killstreakBonus;
		private _score = _player getVariable ["ExileScore", 0];
		_score = _score + (_respectGained);
		_player setVariable ["ExileScore", _score];
		format["setAccountScore:%1:%2", _score,getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;
		private _newKillerFrags = _player getVariable ["ExileKills", 0];
		_newKillerFrags = _newKillerFrags + 1;
		_player setVariable ["ExileKills", _newKillerFrags];
		format["addAccountKill:%1", getPlayerUID _player] call ExileServer_system_database_query_fireAndForget;
		_player call ExileServer_object_player_sendStatsUpdate;
		if (GMS_useKillScoreMessage) then
		{
			[["showScore",[_respectGained,_distanceBonus,_kills]], [_player]] call GMS_fnc_messageplayers;
		};
	};
	if (toLower(GMSCore_modtype) isEqualTo "default") then 
	{
		private _newKillerFrags = _player getVariable ["ExileKills", 0];
		_newKillerFrags = _newKillerFrags + 1;
		_player setVariable ["ExileKills", _newKillerFrags,true];
		if (GMS_useKillScoreMessage) then
		{
			[["showScore",[_respectGained,_distanceBonus,_kills]], [_player]] call GMS_fnc_messageplayers;
		};
	};
	if (GMS_useKillMessages) then
	{
		private _weapon = currentWeapon _player;
		_killstreakMsg = format[" %1X KILLSTREAK",_kills];
		private["_message"];
		if (GMS_useKilledAIName) then
		{
			_message = format["[blck] %2: killed by %1 from %3m",name _player,name _unit,round(_unit distance _player)];
		}else{
			_message = format["[blck] %1 killed with %2 from %3 meters",name _player,getText(configFile >> "CfgWeapons" >> _weapon >> "DisplayName"), round(_unit distance _player)];
		};
		_message =_message + _killstreakMsg;
		[["aikilled",_message,"victory"],allPlayers] call GMS_fnc_messageplayers;
	};	
	
};

params["_unit","_killer"];
private _killerType = _killer call BIS_fnc_objectType; //     anObject call BIS_fnc_objectType 

if ((_killerType select 0 )isEqualTo "Vehicle") then 
{
	{
		_player = _killer;
		if (getPlayerUID(_x) isEqualTo getPlayerUID(_killer)) exitWith {
			[_x,_unit] call _fn_doUpdates;
		};

	}forEach (crew (vehicle _killer));
} else {
	[_killer,_unit] call _fn_doUpdates;
};

