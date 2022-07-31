/*
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

GMS_headgearList = [];
GMS_SkinList = [];
GMS_vests = [];
GMS_backpacks = [];
GMS_Pistols = [];
GMS_primaryWeapons = [];
//GMS_throwable = [];

_allWeaponRoots = ["Pistol","Rifle","Launcher"];
_allWeaponTypes = ["AssaultRifle","MachineGun","SniperRifle","Shotgun","Rifle","Pistol","SubmachineGun","Handgun","MissileLauncher","RocketLauncher","Throw","GrenadeCore"];
_addedBaseNames = [];
_allBannedWeapons = [];
_wpnAR = []; //Assault Rifles
_wpnARG = []; //Assault Rifles with GL
_wpnLMG = []; //Light Machine Guns
_wpnSMG = []; //Sub Machine Guns
_wpnDMR = []; //Designated Marksman Rifles
_wpnLauncher = [];
_wpnSniper = []; //Sniper rifles
_wpnHandGun = []; //HandGuns/Pistols
_wpnShotGun = []; //Shotguns
_wpnThrow = []; // throwables
_wpnUnknown = []; //Misc
_wpnUnderbarrel = [];
_wpnMagazines = [];
_wpnOptics = [];
_wpnPointers = [];
_wpnMuzzles = [];
_allBannedWearables = [];
_uniforms = [];
_headgear = []; 
_glasses = []; 
_masks = []; 
_backpacks = []; 
_vests = [];
_goggles = []; 
_NVG = []; 
_misc = [];
_baseClasses = [];	

_classnameList = [];
diag_log format["GMSCore_modtype = %1",GMSCore_modtype];
if (toLower(GMSCore_modtype) isEqualTo "epoch") then
{
	_classnameList = (missionConfigFile >> "CfgPricing" ) call BIS_fnc_getCfgSubClasses;
};
if (toLower(GMSCore_modtype) isEqualTo "exile") then
{
	_classnameList = (missionConfigFile >> "CfgExileArsenal" ) call BIS_fnc_getCfgSubClasses;
};
private _dlcList = [];
private _ffaa = [];
private _lago = [];
private _cupw = []; 
diag_log format["_fnc_dynamicConfigsConfigurator: count _classnameList = %1",count _classnameList];
{
	private _configName = "";
	switch (true) do
	{
		case isClass(configFile >> "CfgMagazines" >> _x): 	{ _configName = "CfgMagazines"; };
		case isClass(configFile >> "CfgVehicles" >> _x): 	{ _configName = "CfgVehicles"; };
		case isClass(configFile >> "CfgAmmo" >> _x): 		{ _configName = "CfgAmmo"; };
		case isClass(configFile >> "CfgGlasses" >> _x): 	{ _configName = "CfgGlasses"; };
		default 									     	{ _configName = "CfgWeapons"; };
	};

	private _dlc = getText(configFile >> _configName >> _x >> "DLC");

	/*
		// Example of code you can use to: a) list the DLCs used; b) generate a list of items from a given DLC;
		// See also the second code block that writes the information to the logs begining on line 161

	_dlcList pushBackUnique _dlc;

	if (_dlc isEqualTo "LAGO") then {_lago pushBackUnique _x};
	if (_dlc isEqualTo "FFAA" || _dlc isEqualTo "FFAAMOD") then {_ffaa pushBackUnique _x};
	if (_dlc isEqualTo "CUP_Weapons") then {_cupw pushBackUnique _x};
	*/

	if !(_dlc in GMS_blackListedMods) then 
	{
		private _temp = [_x] call bis_fnc_itemType;
		_itemCategory = _temp select 0;
		_itemType = _temp select 1;
		_price = GMS_maximumItemPriceInAI_Loadouts;
		if (toLower(GMSCore_modtype) isEqualTo "epoch") then
		{
			_price = getNumber(missionConfigFile >> "CfgPricing" >> _x >> "price");
		};
		if (toLower(GMSCore_modtype)  isEqualTo "exile") then
		{
			_price = getNumber(missionConfigFile >> "CfgExileArsenal" >> _x >> "price");
		};
		if (_price < GMS_maximumItemPriceInAI_Loadouts && !(["base",_x] call BIS_fnc_inString)) then
		{
			if (_itemCategory isEqualTo "Weapon") then
			{
				switch (_itemType) do
				{
					case "AssaultRifle": {if !(_x in GMS_blacklistedSecondaryWeapons) then {_wpnAR pushBack _x} else {if (GMS_logBlacklistedItems) then {diag_log format["Assualt Rifle %1 Excluded: blacklisted Item",_x]}}};
					case "MachineGun": {if !(_x in GMS_blacklistedSecondaryWeapons) then {_wpnLMG pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Machine Gun %1 Excluded: blacklisted Item",_x]}}};
					case "SubmachineGun": {if !(_x in GMS_blacklistedSecondaryWeapons) then {_wpnSMG pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Submachinegun %1 Excluded: blacklisted Item",_x]}}};
					case "Shotgun": {if !(_x in GMS_blacklistedSecondaryWeapons) then {_wpnShotGun pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Shotgun %1 Excluded: blacklisted Item",_x]}}};
					case "Rifle": {if !(_x in GMS_blacklistedSecondaryWeapons) then {_wpnAR pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Rifle %1 Excluded: blacklisted Item",_x]}}};
					case "SniperRifle": {if !(_x in GMS_blacklistedSecondaryWeapons) then {_wpnSniper pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Sniper Rifle %1 Excluded: blacklisted Item",_x]}}};
					case "Handgun": {if !(_x in GMS_blacklistedSecondaryWeapons) then {_wpnHandGun pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Handgun %1 Excluded: blacklisted Item",_x]}}};
					case "Launcher": {if !(_x in GMS_blacklistedLaunchersAndSwingWeapons) then {_wpnLauncher pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Launcher %1 Excluded: blacklisted Item",_x]}}};
					case "RocketLauncher": {if !(_x in GMS_blacklistedLaunchersAndSwingWeapons) then {_wpnLauncher pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Rocket Launcer %1 Excluded: blacklisted Item",_x]}}};
					case "Throw": {if !(_x in GMS_blacklistedItems) then {_wpnThrow pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Throw %1 Excluded: blacklisted Item",_x]}}};
				};
			};
			
			if (_itemCategory isEqualTo "Item") then
			{
				switch (_itemType) do
				{
					case "AccessoryMuzzle": {if !(_x in GMS_blacklistedAttachments) then {_wpnMuzzles pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Muzzle %1 Excluded: blacklisted Item",_x]}}};
					case "AccessoryPointer": {if !(_x in GMS_blacklistedAttachments) then {_wpnPointers pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Pointer %1 Excluded: blacklisted Item",_x]}}};
					case "AccessorySights": {if !(_x in GMS_blacklistedOptics) then {_wpnOptics pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Optic %1 Excluded: blacklisted Item",_x]}}};
					case "AccessoryBipod": {if !(_x in GMS_blacklistedAttachments) then {_wpnUnderbarrel pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Bipod %1 Excluded: blacklisted Item",_x]}}};
					case "Binocular": {if !(_x in GMS_blacklistedItems) then {_misc pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Binocular/Rangefinder/Binocular %1 Excluded: blacklisted Item",_x]}}};
					case "Compass": {if !(_x in GMS_blacklistedItems) then {_misc pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Compass %1 Excluded: blacklisted Item",_x]}}};
					case "GPS": {if !(_x in GMS_blacklistedItems) then {_misc pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["GPS %1 Excluded: blacklisted Item",_x]}}};
					case "NVGoggles": {if !(_x in GMS_blacklistedItems) then {_NVG pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["NVG %1 Excluded: blacklisted Item",_x]}}};		
				};
			};
			
			
			if (_itemCategory isEqualTo "Equipment") then
			{
				switch (_itemType) do
				{
					case "Glasses": {if !(_x in GMS_blacklistedItems) then {_glasses pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Glasses %1 Excluded: blacklisted Item",_x]}}};
					case "Headgear": {if !(_x in GMS_blacklistedHeadgear) then {_headgear pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Headgear %1 Excluded: blacklisted Item",_x]}}};
					case "Vest": {if !(_x in GMS_blacklistedVests) then {_vests pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Vest %1 Excluded: blacklisted Item",_x]}}};
					case "Uniform": {if !(_x in GMS_blacklistedUniforms) then {_uniforms pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Uniform %1 Excluded: blacklisted Item",_x]}}};
					case "Backpack": {if !(_x in GMS_blacklistedBackpacks) then {_backpacks pushBack _x}else {if (GMS_logBlacklistedItems) then {diag_log format["Backpack %1 Excluded: blacklisted Item",_x]}}};
				};
			};
		} else {
			//if (["base",_x] call BIS_fnc_inString) then {diag_log format["_dynamicConfigs: excluding class %1",_x]};
		};
	};
} forEach _classnameList;
private _allWep =  _wpnAR + _wpnLMG + _wpnSMG + _wpnShotGun + _wpnSniper + _wpnHandGun;

/*
	// Example of code you can use to: a) list DLCs; b) list items from specific DLCs 
{
	diag_log format["_dlcList %1 = %2",_forEachIndex,_x];
} forEach _dlcList;

{
	diag_log format["_ffaa %1 = %2",_forEachIndex,_x];
}forEach _ffaa;
{
	diag_log format["_lago %1 = %2",_forEachIndex,_x];
} forEach _lago;
{
	diag_log format["_cupw %1 = %2",_forEachIndex,_x];
} forEach _cupw; 
*/

GMS_primaryWeapons = _wpnAR + _wpnLMG + _wpnSMG + _wpnShotGun + _wpnSniper;
GMS_WeaponList_Blue = GMS_primaryWeapons;
GMS_WeaponList_Red = GMS_primaryWeapons;
GMS_WeaponList_Green = GMS_primaryWeapons;
GMS_WeaponList_Orange = GMS_primaryWeapons;

/*
	//here is an example for checking that weapons in the FFAA mod were added to the list of primary weapons

private _absentWep = [];
{
	if !(_x in _allWep) then {diag_log format["_absentWep %1 = %2",_forEachIndex,_x];};
} forEach _ffaa + _lago + _cupw;
*/

GMS_pistols = _wpnHandGun;
GMS_Pistols_blue = GMS_Pistols;
GMS_Pistols_red = GMS_Pistols;
GMS_Pistols_green = GMS_Pistols;
GMS_Pistols_orange = GMS_Pistols;

GMS_headgearList = _headgear;
GMS_headgear_blue = GMS_headgearList;
GMS_headgear_red = GMS_headgearList;
GMS_headgear_green = GMS_headgearList;
GMS_headgear_orange = GMS_headgearList;
	
GMS_SkinList = _uniforms;
GMS_SkinList_blue = GMS_SkinList;
GMS_SkinList_red = GMS_SkinList;
GMS_SkinList_green = GMS_SkinList;
GMS_SkinList_orange = GMS_SkinList;

GMS_vests = _vests;
GMS_vests_blue = GMS_vests;
GMS_vests_red = GMS_vests;
GMS_vests_green = GMS_vests;
GMS_vests_orange = GMS_vests;

GMS_backpacks = _backpacks;
GMS_backpacks_blue = GMS_backpacks;
GMS_backpacks_red = GMS_backpacks;
GMS_backpacks_green = GMS_backpacks;
GMS_backpacks_orange = GMS_backpacks;
	
GMS_explosives = 	_wpnThrow;

diag_log format["Compilation of dynamic AI Loadouts complete at %1",diag_tickTime];
