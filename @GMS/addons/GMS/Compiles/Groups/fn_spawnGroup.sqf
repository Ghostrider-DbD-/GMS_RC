/*
	GMS_fnc_spawnGroup
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
	
params[
	["_pos",[-1,-1,1]], 
	["_numbertospawn",0], 
	["_skillLevel","red"], 
	["_areaDimensions",[]], 
	["_uniforms",[]], 
	["_headGear",[]],
	["_vests",[]],
	["_backpacks",[]],
	["_weaponList",[]],
	["_sideArms",[]], 
	["_scuba",false],
	["_timeOut",300],
	["_waypointclass","Soldier"]
];
/*
{
	diag_log format["_fn_spawnGroup: _this %1 = %2",_forEachIndex, _this select _forEachIndex];
} forEach _this;
*/
if (_weaponList isEqualTo []) then {_weaponList = [_skillLevel] call GMS_fnc_selectAILoadout};
if (_sideArms isEqualTo [])  then {_sideArms = [_skillLevel] call GMS_fnc_selectAISidearms};
if (_uniforms isEqualTo [])  then {_uniforms = [_skillLevel] call GMS_fnc_selectAIUniforms};
if (_headGear isEqualTo [])  then {_headGear = [_skillLevel] call GMS_fnc_selectAIHeadgear};
if (_vests isEqualTo [])     then {_vests = [_skillLevel] call GMS_fnc_selectAIVests};
if (_backpacks isEqualTo []) then {_backpacks = [_skillLevel] call GMS_fnc_selectAIBackpacks};

private _difficultyIndex = [_skillLevel] call GMS_fnc_getIndexFromDifficulty;

private _group = [
	_pos,
	_numberToSpawn,
	GMSCore_side,
	GMS_baseSkill,
	(GMS_AIAlertDistance select _difficultyIndex),
	(GMS_AIIntelligence select _difficultyIndex),
	GMS_bodyCleanUpTimer,
	-1, // max reloads 
	GMS_launcherCleanup,
	GMS_removeNVG,
	0.4, // min damage to heal,
	1, // max heals 
	"SmokeShellRed",
	[GMS_fnc_unitHit],  // AI Hit Code 
	[GMS_fnc_unitKilled],
	0.33, // chance garrison 
	false // isDrone Crew
] call GMSCore_fnc_spawnInfantryGroup;
//[format["GMS_fnc_spawnGroup: _pos = %2 | _group = %1",_group,_pos]] call GMS_fnc_log;
_group setVariable["GMS_difficulty",_skillLevel];

[_group] call GMSCore_fnc_setupGroupBehavior;
private _skills = missionNamespace getVariable[format["GMS_Skills%1",_skillLevel],GMS_SkillsRed];
[_group,_skills] call GMSCore_fnc_setupGroupSkills;

private _gear = [
	[
		_weaponList,
		GMS_chancePrimary,
		GMS_chanceOpticsPrimary,
		GMS_chanceMuzzlePrimary,
		GMS_chancePointerPrimary,
		GMS_blacklistedPrimaryWeapons
	], // Just adding together all the subclasses of primary weaponss
	[
		_sideArms, 
		GMS_chanceSecondary, 
		GMS_chanceOpticsSecondary, 
		GMS_chanceMuzzleSecondary, 
		GMS_chancePointerSecondary,
		GMS_blacklistedSecondaryWeapons
	],
	[GMS_explosives, GMS_chanceThowable],
	[_headGear, GMS_chanceHeadgear],
	[_uniforms, GMS_chanceUniform],
	[_vests, GMS_chanceVest],
	[_backpacks, GMS_chanceBackpack],
	[GMS_launcherTypes, 1.0],  // this is determined elsewhere for GMSAI
	[GMS_NVG, 1.0],  // this is determined elsewhere for GMSAI
	[GMS_binocs,GMS_chanceBinoc],
	[GMS_ConsumableItems, 1.0],
	[GMS_medicalItems, 1.0],
	[GMS_loot, 1.0]
];
[_group,_gear,GMS_launchersPerGroup,GMS_useNVG] call GMSCore_fnc_setupGroupGear;
private _money = (missionNamespace getVariable[format["GMS_rewards%1",_skillLevel],GMS_rewardsOrange]) select 0;
//diag_log format["GMS_fnc_spawnGroup: _money = %1 | _group = %2",_money,_group];
[_group,_difficulty,_money] call GMSCore_fnc_setupGroupMoney;

/*
params[
	["_group",grpNull],  // group for which to configure / initialize waypoints
	["_blackListed",[]],  // areas to avoid within the patrol region
	["_patrolAreaMarker",""],  // a marker or array defining the patrol area center, size and shape
	["_timeout",300],
	["_garrisonChance",0],  // chance that an infantry group will garison an building of type house - ignored for vehicles.
	["_type",GMS_infrantryPatrol],  // "infantry","vehicle","air","submersible", "staticweapon"
	["_deletemarker",false]
];  
*/

if !(_areaDimensions isEqualTo []) then {[_group,[],[_pos,_areaDimensions],_timeout,0,_waypointClass,true] call GMSCore_fnc_initializeWaypointsAreaPatrol};

_group selectLeader ((units _group) select 0);
//[format["GMS_fnc_spawnGroup: _group = %1",_group]] call GMS_fnc_log;
_group

