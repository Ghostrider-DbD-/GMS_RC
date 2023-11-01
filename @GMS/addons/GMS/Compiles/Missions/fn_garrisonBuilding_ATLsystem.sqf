
/*
	By Ghostrider-GRG-
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
params["_center",
        "_garrisonedBuilding_ATLsystem",
        ["_aiDifficultyLevel","Red"],
        ["_uniforms",[]],
        ["_headGear",[]],
        ["_vests",[]],
        ["_backpacks",[]],
        ["_weaponList",[]],
        ["_sideArms",[]]
];
//[format["_garrisonBuilding_ATLsystem: _this = %1",_this]] call GMS_fnc_log;
private["_group","_buildingsSpawned","_staticsSpawned","_g","_building","_return"];
_buildingsSpawned = [];
_staticsSpawned = [];   
_unitsSpawned = [];
{
        _g = _x;        
        _x params["_bldClassName","_bldRelPos","_bldDir","_s","_d","_statics","_men"];
        private _unitsToSpwan = (count _statics) + (count _men);
        /*
            params[
                ["_pos",[0,0,0]], 
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
        #define areaDimensions []  // an empty array forces the spawnGroup function to skip setup of any waypoint
        private _group = [[0,0,0],_unitsToSpwan,_aiDifficultyLevel,[],_uniforms,_headgear,_vests,_backpacks,_weaponList,_sidearms,false] call GMS_fnc_spawnGroup;
        
        for "_i" from 0 to (count waypoints _group - 1) do
        {
            deleteWaypoint [_group, 0];
        };        
        
        _unitsSpawned append (units _group);
        private _units = units _group;
        _building = createVehicle[_bldClassName,[0,0,0],[],0,"CAN_COLLIDE"];
        _building setPosATL (_bldRelPos vectorAdd _center);
        _building setDir _bldDir;
        _buildingsSpawned pushBack _building;
        //_staticsSpawned = [_building,_group,_statics,_men,_aiDifficultyLevel,_uniforms,_headGear,_vests,_backpacks,"none",_weaponList,_sideArms] call GMS_fnc_spawnGarrisonInsideBuilding_ATL;
        {
            _x params["_staticClassName","_staticRelPos","_staticDir"];
            #define height 0
            #define removeFuel 0
            #define vehHitCode [] 
            #define vehKilledCode []
            private _damage = if (GMS_killEmptyStaticWeapons) then {1} else {0};
            private _releaseToPlayers = if (GMS_killEmptyStaticWeapons) then {false} else {true};
            private _wep = [_staticClassName,[0,0,0],_staticDir,height,_damage,removeFuel,_releaseToPlayers,GMS_vehicleDeleteTimer,vehHitCode,vehKilledCode] call GMSCore_fnc_spawnPatrolVehicle; 
            _staticsSpawned pushBack _wep;
            _wep setVariable["GMS_vehType","emplaced"];
            _staticsSpawned pushBack _wep;
            _wep setPosATL (_staticRelPos vectorAdd getPosATL _building);
            _wep setDir _staticDir;
            _unit = _units deleteAt 0;
            _unit moveInGunner _wep; 
        }forEach _statics;
        {
            _u = _x;
            _u params["_unitRelPos","_unitDir"];
            _unit = _units deleteAt 0;
            _unit setPosATL (_unitRelPos vectorAdd (getPosATL _building));
            _unit setDir _unitDir;
            //_unit disableAI "PATH";
        }forEach _men;        
}forEach _garrisonedBuilding_ATLsystem;
[format["_garrisonBuilding_ATLSystem: _unitsspawned %1 | _staticsSpawned %2 | BuildingsSpawned %3",count _unitsSpawned,count _staticsSpawned,count _buildingsSpawned]] call GMS_fnc_log;
[_unitsSpawned,_staticsSpawned,_buildingsSpawned]
