/*
	GMS_fnc_spawnMissionHelis
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"
params[
	["_coords",[0,0,0]],
	["_noChoppers",0],
	["_missionHelis",[]],
	["_difficulty","Red"],
	["_uniforms",[]],
	["_headgear",[]],
	["_vests",[]],
	["_backpacks",[]],
	["_weaponList",[]],
	["_sideArms",[]]
];
private _helis = [];
private _units = [];
for "_i" from 0 to (_noChoppers) do
{
	private _spawnPos = _coords getPos[30,random(359)];
	private _heli = selectRandom _missionHelis;
	private _noCrew = [_heli,false] call BIS_fnc_crewCount;
	#define patrolArea [1000,1000]
	private _crewGroup = [_spawnPos,_noCrew,_difficulty,patrolArea,_uniforms,_headGear,_vests,_backpacks,_weaponList, _sideArms] call GMS_fnc_spawnGroup;
	_crewGroup setVariable["GMS_group",true];
	_units append (units _crewGroup);
	
	#define heliDir 0 
	#define heliHeight 100 
	#define heliRemoveFuel 0.2 	
	#define heliDamage 0.5
	#define vehHitCode [GMS_fnc_vehicleHit] 
	#define vehKilledCode [GMS_fnc_vehicleKilled]								
	private _releaseToPlayers = GMS_allowClaimVehicle;
	// the function returns the vehicle object spawned (_aircraft)
	/*
		params[
			["_className",""],
			["_group",grpNull],		
			["_pos",[0,0,0]],
			["_dir",0],
			["_height",0],	
			["_disable",0],  // damage value set to this value if less than this value when all crew are dead
			["_removeFuel",0.2],  // uel set to this value when all crew dead
			["_releaseToPlayers",true],
			["_deleteTimer",300],
			["_vehHitCode",[]],
			["_vehKilledCode",[]]
		];	
	*/

	private _aircraft = [_heli,_crewGroup,_spawnPos,heliDir,heliHeight,heliDamage,heliRemoveFuel,_releaseToPlayers,GMS_vehicleDeleteTimer,vehHitCode,vehKilledCode] call GMSCore_fnc_spawnPatrolAircraft;
	_helis pushBack _aircraft;
};

[_helis,_units]