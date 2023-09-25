/*
	By Ghostrider [GRG]
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_coords",["_missionEmplacedWeapons",[]],["_useRelativePos",true],["_aiDifficultyLevel","red"],["_uniforms",[]], ["_headGear",[]],["_vests",[]],["_backpacks",[]],["_weaponList",[]],["_sideArms",[]]];
if (_uniforms isEqualTo []) 		then {_uniforms = [_aiDifficultyLevel] call GMS_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])		then {_headGear = [_aiDifficultyLevel] call GMS_fnc_selectAIHeadgear};
if (_vests isEqualTo []) 			then {_vests = [_aiDifficultyLevel] call GMS_fnc_selectAIVests};
if (_backpacks  isEqualTo []) 		then {_backpacks = [_aiDifficultyLevel] call GMS_fnc_selectAIBackpacks};
if (_weaponList  isEqualTo []) 	then {_weaponList = [_aiDifficultyLevel] call GMS_fnc_selectAILoadout};
if (_sideArms isEqualTo []) 		then {[_aiDifficultyLevel] call GMS_fnc_selectAISidearms};

private["_emplacedWeps","_emplacedAI","_wep","_units","_gunner","_abort","_pos","_mode"];
_emplacedWeps = [];
_emplacedAI = [];
_units = [];
_abort = false;
_pos = [];

private _emplacedWepData = +_missionEmplacedWeapons;  //  So we dont overwrite this for the next instance of the mission
//diag_log format["_spawnEmplacedWeaponArray(31): _useRelativePos = %1",_useRelativePos];
//diag_log format["_spawnEmplacedWeaponArray(32): count _emplacedWepData = %1 | _emplacedWepData = %2",count _emplacedWepData,_emplacedWepData];

{
	_x params [["_static",""],["_pos",[0,0,0]],["_dir",0]];
	if (_useRelativePos) then 
	{
		_pos = _coords vectorAdd _pos;
	};

	#define configureWaypoints false
	#define numberAI 1
	#define areaDimensions []  // an empty array forces the spawnGroup function to skip setup of any waypoint
	private _empGroup = [_pos,numberAI,_aiDifficultyLevel,areaDimensions,_uniforms,_headGear,_vests,_backpacks,_weaponList,_sideArms] call GMS_fnc_spawnGroup;
	_empGroup setcombatmode "RED";
	_empGroup setBehaviour "COMBAT";
	_empGroup setVariable ["soldierType","emplaced"];

	// TODO: recode to use GMS_fnc to create vehicle
	//private _wep = [_static,_pos] call GMS_fnc_spawnVehicle;
	/*
		["_className",""], // Clasname of vehicle to be spawned
		["_spawnPos",[0,0,0]],  //  selfevident
		["_dir",0],  //  selfevident
		["_height",0],		
		["_disable",0],  // damage value set to this value if less than this value when all crew are dead
		["_removeFuel",0.2],  // fuel set to this value when all crew dead
		["_releaseToPlayers",true],
		["_deleteTimer",300],
		["_vehHitCode",[]],
		["_vehKilledCode",[]]
	*/
	//_wep setVariable["GRG_vehType","emplaced"];	
	//_wep setPosATL _pos;
	//_wep setdir _dir;

	// TODO: recode to use GMS_fnc to handle this if needed	
	//[_wep,2] call GMS_fnc_configureMissionVehicle;	
	#define height 0
	#define removeFuel 0
	#define vehHitCode [] 
	#define vehKilledCode []
	private _damage = if (GMS_killEmptyStaticWeapons) then {1} else {0};
	private _releaseToPlayers = if (GMS_killEmptyStaticWeapons) then {false} else {true};
	private _wep = [_static,_pos,_dir,height,_damage,removeFuel,_releaseToPlayers,GMS_vehicleDeleteTimer,vehHitCode,vehKilledCode] call GMSCore_fnc_spawnPatrolVehicle;
    _wep setVariable["GMS_vehType","emplaced"];	
	_emplacedWeps pushback _wep;
	[_wep,_empGroup] call GMSCore_fnc_loadVehicleCrew;
	//diag_log format["_spawnEmplacedWeaponArray(91): _wep = %1 | getPos _wep = %2 | _static = %3",_wep, getPosATL _wep, _static];
	//_gunner setVariable["GRG_vehType","emplaced"];	
	_emplacedAI append _units;		
} forEach _emplacedWepData;

GMS_monitoredVehicles append _emplacedWeps;

[_emplacedWeps,_emplacedAI]

