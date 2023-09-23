/*
	GMS_fnc_spawnUnit
	Original Code by blckeagls
	Modified by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

private ["_i","_weap","_unit","_skillLevel","_aiSkills","_launcherRound","_index","_ammoChoices","_optics","_pointers","_muzzles","_underbarrel","_legalOptics"];

params["_pos","_aiGroup",["_skillLevel","red"],["_uniforms", []],["_headGear",[]],["_vests",[]],["_backpacks",[]],["_launcher","none"],["_weaponList",[]],["_sideArms",[]],["_scuba",false],["_garrison",false]];

if (_weaponList isEqualTo []) then {_weaponList = [_skillLevel] call GMS_fnc_selectAILoadout;[format["Weaponlist for unit set to %1",_weaponList],"warning"] call GMS_fnc_log;};
if (_sideArms  isEqualTo [])  then {_sideArms = [_skillLevel] call GMS_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_skillLevel] call GMS_fnc_selectAIUniforms;[format["Uniforms for unit set to %1",_uniforms],"warning"] call GMS_fnc_log;};
if (_headGear  isEqualTo [])  then {_headGear = [_skillLevel] call GMS_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_skillLevel] call GMS_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_skillLevel] call GMS_fnc_selectAIBackpacks};

if (isNull _aiGroup) exitWith {["NULL-GROUP Provided to _fnc_spawnUnit"] call GMS_fnc_log};

_unit = ObjNull;
GMSCore_unitType createUnit [_pos, _aiGroup, "_unit = this", GMS_baseSkill, "COLONEL"];

//private _tempPos = _pos findEmptyPosition [0.1, 3, typeOf _unit];

//if !(_tempPos isEqualTo []) then {_unit setPos _tempPos};

[_unit] call GMS_fnc_removeGear;
if (_scuba) then
{
	_unit swiminDepth (([_pos] call GMS_fnc_findWaterDepth) / 2);
};

//Sets AI Tactics
_unit enableAI "ALL";
if(_garrison) then
{
	_unit disableAI "PATH";
};
_unit allowDammage true;
_unit setBehaviour "COMBAT";
_unit setunitpos "AUTO";

if !(_uniforms isEqualTo []) then {_unit forceAddUniform (selectRandom _uniforms)};
if !(_headGear isEqualTo []) then {_unit addHeadgear (selectRandom _headGear)};
if !(_vests  isEqualTo []) then {_unit addVest (selectRandom _vests)};
if !(_weaponList isEqualTo []) then {
	_weap = selectRandom _weaponList; 
	_unit addWeaponGlobal  _weap; 
	_ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
	_unit addMagazines[selectRandom _ammochoices,3];
	if (random 1 < GMS_chanceMuzzle) then {_unit addPrimaryWeaponItem (selectRandom ([_weap, 101] call BIS_fnc_compatibleItems))};  // muzzles
	if (random 1 < GMS_chanceOptics) then {_unit addPrimaryWeaponItem (selectRandom ([_weap, 201] call BIS_fnc_compatibleItems))};  // optics
	if (random 1 < GMS_chancePointer) then {_unit addPrimaryWeaponItem (selectRandom ([_weap, 301] call BIS_fnc_compatibleItems))};  // pointers
	if (random 1 < GMS_chanceUnderbarrel) then {_unit addPrimaryWeaponItem (selectRandom ([_weap, 302] call BIS_fnc_compatibleItems))};  // underbarrel
	if ((count(getArray (configFile >> "cfgWeapons" >> _weap >> "muzzles"))) > 1) then 
	{
		_unit addMagazine "1Rnd_HE_Grenade_shell";
	};
};
if !(_sideArms  isEqualTo []) then
{
	_weap = selectRandom _sideArms;
	_ammoChoices = getArray (configFile >> "CfgWeapons" >> _weap >> "magazines");
	_unit addMagazines [selectRandom _ammoChoices, 2];
	_unit addWeaponGlobal  _weap; 	
};
if !(GMS_ConsumableItems isEqualTo []) then 
{
	for "_i" from 1 to (1+floor(random(4))) do 
	{
		_unit addItem (selectRandom GMS_ConsumableItems);
	};
};
if !(GMS_specialItems isEqualTo []) then 
{
	// Add  First Aid or Grenade 50% of the time
	if (round(random 10) <= 5) then 
	{
		_unit addItem selectRandom GMS_specialItems;
	};
};

if !(_backpacks isEqualTo []) then 
{
	if (random (1) < GMS_chanceBackpack) then
	{ 		
		_unit addBackpack selectRandom _backpacks;
	} else {
		// Only add  rounds for the specified launcher if a backpack was equiped ?
		if !(_Launcher isEqualTo "none") then 
		{		
			_unit addBackpack (selectRandom GMS_backpacks);
			_unit addWeaponGlobal _launcher;
			_unit setVariable["Launcher",[_launcher,[]]];			
			private _mags = getArray (configFile >> "CfgWeapons" >> _Launcher >> "magazines");
			private _rnds = [];
			for "_i" from 1 to 3 do 
			{
				private _mag = selectRandom _mags;
				_unit addItemToBackpack _mag;
				_rnds pushBack _mag;
			};
			_unit setVariable["Launcher",[_launcher,_rnds]];
		};	
	};
};

if(sunOrMoon < 0.2 && {GMS_useNVG})then
{
	_unit addWeapon selectRandom GMS_NVG;
	_unit setVariable ["hasNVG", true];
}
else
{
	_unit setVariable ["hasNVG", false];
};

_unit addWeapon selectRandomWeighted["",4,"Binocular",3,"Rangefinder",1];

_unit


