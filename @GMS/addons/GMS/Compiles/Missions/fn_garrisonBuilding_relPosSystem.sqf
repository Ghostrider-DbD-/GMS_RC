
/*
	By Ghostrider-GRG-
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
if (true) exitwith {["the Garrisoned Building Relative Position System is No Longer Supported in GMS","warning"] call GMS_fnc_core;}
params["_center",
        "_garrisonedBuilding_relPosSystem",
        ["_aiDifficultyLevel","Red"],
        ["_uniforms",[]],
        ["_headGear",[]],
        ["_vests",[]],
        ["_backpacks",[]],
        ["_weaponList",[]],
        ["_sideArms",[]]
    ];

{
    diag_log format["_fnc_garrisonBuilding_relPosSystem: _this %1 = %2",_forEachIndex,_this select _forEachIndex];
}forEach _this;

if (_weaponList isEqualTo []) then {_weaponList = [_aiDifficultyLevel] call GMS_fnc_selectAILoadout};
if (_sideArms  isEqualTo [])  then {_sideArms = [_aiDifficultyLevel] call GMS_fnc_selectAISidearms};
if (_uniforms  isEqualTo [])  then {_uniforms = [_aiDifficultyLevel] call GMS_fnc_selectAIUniforms};
if (_headGear  isEqualTo [])  then {_headGear = [_aiDifficultyLevel] call GMS_fnc_selectAIHeadgear};
if (_vests  isEqualTo [])     then {_vests = [_aiDifficultyLevel] call GMS_fnc_selectAIVests};
if (_backpacks  isEqualTo []) then {_backpacks = [_aiDifficultyLevel] call GMS_fnc_selectAIBackpacks};
private["_group","_buildingsSpawned","_staticsSpawned","_g","_building","_return"];
_buildingsSpawned = [];
_staticsSpawned = [];
_groupsSpawned = [];
_unitsSpawned = [];
_group = [GMSCore_side,true] call GMS_fnc_createGroup;
if !(isNull _group) then 
{
    {
        //       ["Land_Unfinished_Building_02_F",[-21.8763,-45.978,-0.00213432],0,true,true,0.67,3,[],4],
        _x params["_bldClassName","_bldRelPos","_bldDir","_allowDamage","_enableSimulation","_probabilityOfGarrision","_noStatics","_typesStatics","_noUnits"];
        if (_typesStatics isEqualTo []) then {_typesStatics = GMS_staticWeapons};
        _building = createVehicle[_bldClassName,[0,0,0],[],0,"CAN_COLLIDE"];
        _buildingsSpawned pushBack _building;
        _building setPosATL (_bldRelPos vectorAdd _center);
        private _positions = [_building] call BIS_fnc_buildingPositions;
        /*  GMS_fnc_spawnGroup 
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
                ["_scuba",false]
            ];
        */
        private _bldgGroup = [
            _center, 
            (count _positions),
            _aiDifficultyLevelm
            [],
            _uniforms,
            _headgear,
            _vests,
            _backpacks,
            _weaponList,
            _sideArms,
            _scuba
        ] call GMS_fnc_spawnGroup;

        #define height 0
        #define removeFuel 0
        #define vehHitCode [] 
        #define vehKilledCode []
        private _damage = if (GMS_killEmptyStaticWeapons) then {1} else {0};
        private _releaseToPlayers = if (GMS_killEmptyStaticWeapons) then {false} else {true};
        private _availUnits = units _bldgGroup; 

        for "_i" from 1 to (_noStatics) do 
        {
            if (count _unitsSpawned > (count _positions)) exitWith {};
            if (_availUnits isEqualTo []) exitWith {};
            //  private _wep = [_static,_pos,_dir,height,_damage,removeFuel,_releaseToPlayers,GMS_vehicleDeleteTimer,vehHitCode,vehKilledCode] call GMSCore_fnc_spawnPatrolVehicle;
            private _spawnPos = _positions deleteAt (round(random((count _positions)-1)));
            private _static = [
                (selectRandom _typesStatics),
                (_spawnPos vectorAdd (getPosATL _building)),
                (random (359),),
                height,
                damage,
                removeFuel, 
                _releaseToPlayers,
                GMS_vehicleDeleteTimer,
                vehHitCode,
                vehKilledCode
            ] call GMSCore_fnc_spawnPatrolVehicle;
            _staticsSpawned pushBack _static;
            private _unit = _availUnits deleteAt 0;
            //[_static,_empGroup] call GMSCore_fnc_loadVehicleCrew;
            _unit moveInGunner _static;
        };
        for "_i" from 1 to _noUnits do 
        {
            if (count _unitsSpawned > (count _positions)) exitWith {};
            if (_availUnits isEqualTo []) exitWith {};
            private _unit = _availUnits deleteAt 0;  
            private _spawnPos = _positions deleteAt (round(random((count _positions)-1)));
            _unit setPosATL (_spawnPos vectorAdd (getPosATL _building));
        };
        private _wp = [_bldgGroup,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointCompletionRadius 0;
		_wp waypointAttachObject _building;
		//_wp setWaypointHousePosition _foreachindex;
		//_wp setWaypointTimeout [15, 20, 30];
        _wp setWaypointStatements["true",""];      
    } forEach _garrisonedBuilding_relPosSystem;
};
_return = [_group,_buildingsSpawned,_staticsSpawned];
_return

