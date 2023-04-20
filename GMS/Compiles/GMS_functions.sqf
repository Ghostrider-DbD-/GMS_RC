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
#include "\GMS\Compiles\Init\GMS_defines.hpp"

private _functions = [
	// General functions
	["GMS_fnc_FindSafePosn","\GMS\Compiles\Functions\GMS_fnc_findSafePosn_4.sqf"],

	// Player-related functions
	["GMS_fnc_handlePlayerUpdates","\GMS\Compiles\Units\GMS_fnc_handlePlayerUpdates.sqf"],

	// Mission-related functions
	["GMS_fnc_garrisonBuilding_RelPosSystem","\GMS\Compiles\Missions\GMS_fnc_garrisonBuilding_relPosSystem.sqf"],
	["GMS_fnc_spawnGarrisonInsideBuilding_ATL","\GMS\Compiles\Missions\GMS_fnc_spawnGarrisonInsideBuilding_ATL.sqf"],
	["GMS_fnc_spawnGarrisonInsideBuilding_relPos","\GMS\Compiles\Missions\GMS_fnc_spawnGarrisonInsideBuilding_relPos.sqf"],
	["GMS_fnc_addDyanamicUMS_Mission","\GMS\Compiles\Missions\GMS_fnc_addDynamicUMS_Mission.sqf"], 
	
	// Functions specific to vehicles, whether wheeled, aircraft or static
	["GMS_fnc_configureMissionVehicle","\GMS\Compiles\Vehicles\GMS_fnc_configureMissionVehicle.sqf"],
	["GMS_fnc_applyVehicleDamagePenalty","\GMS\Compiles\Vehicles\GMS_fnc_applyVehicleDamagePenalty.sqf"],		
	["GMS_fnc_handleVehicleGetOut","\GMS\Compiles\Vehicles\GMS_fnc_handleVehicleGetOut.sqf"],	

	// functions to support Units
	["GMS_fnc_spawnHostage","\GMS\Compiles\Units\GMS_fnc_spawnHostage.sqf"],
	["GMS_fnc_spawnLeader","\GMS\Compiles\Units\GMS_fnc_spawnLeader.sqf"],
	["GMS_fnc_spawnCharacter","\GMS\Compiles\Units\GMS_fnc_spawnCharacter.sqf"],
	["GMS_fnc_placeCharacterInBuilding","\GMS\Compiles\Units\GMS_fnc_placeCharacterInBuilding.sqf"]	
];

{
	_x params ["_name","_path"];
	missionnamespace setvariable [_name,compileFinal  preprocessFileLineNumbers _path];
} foreach  _functions;




