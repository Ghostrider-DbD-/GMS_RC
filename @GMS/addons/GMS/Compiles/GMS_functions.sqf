/*
	AI Mission for Epoch Mod for Arma 3
	By Ghostrider
	Functions used by the mission system.
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

private _functions = [
	// General functions
	//["GMS_fnc_FindSafePosn","\x\addons\GMS\Compiles\Functions\GMS_fnc_findSafePosn_4.sqf"],

	// Player-related functions
	//["GMS_fnc_handlePlayerUpdates","\x\addons\GMS\Compiles\Units\GMS_fnc_handlePlayerUpdates.sqf"],

	// Mission-related functions
	//["GMS_fnc_garrisonBuilding_RelPosSystem","\x\addons\GMS\Compiles\Missions\GMS_fnc_garrisonBuilding_relPosSystem.sqf"],
	//["GMS_fnc_spawnGarrisonInsideBuilding_ATL","\x\addons\GMS\Compiles\Missions\GMS_fnc_spawnGarrisonInsideBuilding_ATL.sqf"],
	//["GMS_fnc_spawnGarrisonInsideBuilding_relPos","\x\addons\GMS\Compiles\Missions\GMS_fnc_spawnGarrisonInsideBuilding_relPos.sqf"],
	["GMS_fnc_addDyanamicUMS_Mission","\x\addons\GMS\Compiles\Missions\GMS_fnc_addDynamicUMS_Mission.sqf"], 
	
	// Functions specific to vehicles, whether wheeled, aircraft or static
	//["GMS_fnc_configureMissionVehicle","\x\addons\GMS\Compiles\Vehicles\GMS_fnc_configureMissionVehicle.sqf"],
	["GMS_fnc_applyVehicleDamagePenalty","\x\addons\GMS\Compiles\Vehicles\GMS_fnc_applyVehicleDamagePenalty.sqf"],		
	//["GMS_fnc_handleVehicleGetOut","\x\addons\GMS\Compiles\Vehicles\GMS_fnc_handleVehicleGetOut.sqf"],	

	// functions to support Units
	["GMS_fnc_spawnHostage","\x\addons\GMS\Compiles\Units\GMS_fnc_spawnHostage.sqf"],
	["GMS_fnc_spawnLeader","\x\addons\GMS\Compiles\Units\GMS_fnc_spawnLeader.sqf"],
	["GMS_fnc_spawnCharacter","\x\addons\GMS\Compiles\Units\GMS_fnc_spawnCharacter.sqf"],
	["GMS_fnc_placeCharacterInBuilding","\x\addons\GMS\Compiles\Units\GMS_fnc_placeCharacterInBuilding.sqf"]	
];

{
	_x params ["_name","_path"];
	missionnamespace setvariable [_name,compileFinal  preprocessFileLineNumbers _path];
} foreach  _functions;




