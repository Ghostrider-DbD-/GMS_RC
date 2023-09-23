/*
  by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_coords","_leaderConfigs"];
private["_leader","_building"];
_leader = [_coords, _leaderConfigs] call GMS_fnc_spawnCharacter;
_leader remoteExec["GMS_fnc_initLeader", -2, true];
_leader setVariable["assetType",2,true];
_leader setVariable["endAnimation",["Acts_CivilShocked_1"],true];
_building = [_leader,_coords,_leaderConfigs select 7] call GMS_fnc_placeCharacterInBuilding;
[_leader,_building]



