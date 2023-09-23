/*
	Handle AI Deaths
	By Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_unit","_killer","_instigator"];
if (isNull _killer || {isNull _instigator}) exitWith {};
//[format["GMS_fnc_unitKilled: _unit = %1 | _killer = %2 | vehicle killer = %3", _unit, _killer, typeOf (vehicle _killer)]] call GMS_fnc_log;
private _role = assignedVehicleRole _instigator;
//[format["GMS_fnc_unitKilled: _role killer = %1", _role]] call GMS_fnc_log;
private _cf = 1;
private _wep = currentWeapon _instigator;
private _creditKill = true;
private _isRunover = false;
if !(_role isEqualTo []) then // _instigator was in a vehicle of some sort
{
	//[format["GMS_fnc_unitKilled: vehRole killer = %1", _role select 0]] call GMS_fnc_log;
	switch (_role select 0) do 
	{
		case "driver": 
		{
			/*
				GMS_runoverProtection = true;
				GMS_runoverRespectPenalty = 25;
				GMS_runoverMoneyPenalty = 0;
			*/
			if (GMS_runoverProtection) then 
			{
				_cf = 0;
				_creditKill = false;			
				_isRunover = true;
				[_unit] call GMSCore_fnc_unitRemoveAllGear;	
				{
					deleteVehicle _x;
				} forEach nearestObject[_unit,["WeaponHolderSimulated","groundWeaponHolder"],2];
			};
			//[["GMS_fnc_unitKilled: unit %1 run over by %2 with %3",_unit,_instigator,vehicle _instigator]] call GMS_fnc_log;
		};
		case "turret":
		{
			_cf = 0.3;
			_wep = (vehicle _instigator) currentWeaponTurret (_role select 1);
			if (_wep in GMS_forbidenWeapons) then 
			{
				_cf = 0;
				_creditKill = false;
				[_unit] call GMSCore_fnc_unitRemoveAllGear;	
				{
					deleteVehicle _x;
				} forEach nearestObject[_unit,["WeaponHolderSimulated","groundWeaponHolder"],2];
			};
			//[format["GMS_fnc_unitKilled: _unit %1 | killed from vehicle %2 | by %3 | using %4",_unit, vehicle _instigator,name _instigator,_wep]] call GMS_fnc_log;
		};
		case "cargo": {};
	};
};
//[format["GMS_fnc_unitKilled: _unit %1 | _killer %2 | _instigator %3 | vehicle _killer %4",_unit,_killer,_instigator,vehicle _killer]] call GMS_fnc_log;
//diag_log format["GMS_fnc_unitKilled: _unit %1 | _killer %2 | | weapon = %3 | doing all that stuff now", _unit,_killer, currentWeapon _killer];
private _difficulty = (group _unit) getVariable["GMS_difficulty","Red"];
private _index = [_difficulty] call GMS_fnc_getIndexFromDifficulty;
private _rewards = GMS_rewards select _index;
private _distance = _unit distance _killer;
_baseReward = round([_rewards select 0] call GMSCore_fnc_getNumberFromRange);
_baseExperience = round([_rewards select 0] call GMSCore_fnc_getNumberFromRange);
private _reward = 0;
private _experience = 0;
private _killstreak = 0;
[_unit,_instigator] call GMS_fnc_alertVehicles;
if !(vehicle _unit isEqualTo _unit) then 
{
	if (GMS_killEmptyStaticWeapons) then 
	{
		private _isEmplaced = (group _unit) getVariable ["soldierType",""];
		if (isEmplaced || {(vehicle _unit isKindOf "StaticWeapon")}) then 
		{
			(vehicle _unit) setDamage 2.0;
		};
	};
};
if (_isRunover) then 
{
	_reward = GMS_runoverMoneyPenalty; 
	_experience = GMS_runoverRespectPenalty;
} else {
	private _distanceBonus = round(_distance / 100) max 5;
	_killstreak = _instigator getVariable["GMS_killStreak",0];
	_lastUpdated = _instigator getVariable["GMS_lastKill",-30000];
	if (diag_tickTime < _lastUpdated + 300) then 
	{
		_killStreak = _killStreak + 1;
	} else {
		_killStreak = 1;
	};
	_instigator setvariable["GMS_killStreak",_killStreak];
	_instigator setVariable["GMS_lastKill",diag_tickTime];	
	private _killsBonus = _killstreak max 10;		
	_reward = round((_baseReward + _killsBonus) * _cf);  //  Crypto in Epoch, Tabs in Exile
	_experience = round((_baseExperience + _distanceBonus) * _cf); // Karma in Epoch, Respect in Exile
};

switch (GMSCore_modtype) do {
	case "Epoch": {
		[_instigator, _reward] call GMSCore_fnc_giveTakeCrypto;
		[_instigator,_experience,false] call GMSCore_fnc_setKarma;
	};
	case "Exile": {
		[_instigator, _reward] call GMSCore_fnc_giveTakeTabs;
		[_instigator, _experience] call GMSCore_fnc_giveTakeRespect;
	};
};
//diag_log format["GMS_fnc_unitKilled: _mod %3 | _reward %1 | _experience %2",_reward,_experience,GMSCore_modtype];

if (_creditKill) then 
{
	[_instigator,1] call GMSCore_fnc_updatePlayerKills;
	private _msg = format[
		"%1 killed %2 with %3 at %4 meters %5X KILLSTREAK",
		name _instigator, 
		name _unit, 
		getText(configFile >> "CfgWeapons" >> currentWeapon _instigator >> "displayName"), 
		_unit distance _instigator,
		_killstreak
	];
	
	[_instigator, _reward, _experience, name _unit, _unit distance _instigator, getText(configFile >> "CfgWeapons" >> currentWeapon _instigator >> "displayName"), _killstreak, GMS_killMessageToAllPlayers,GMS_killMessageTypesKiller,GMS_killMessagingRadius] remoteExec ["GMSCore_fnc_killedMessages",allPlayers];	
};

