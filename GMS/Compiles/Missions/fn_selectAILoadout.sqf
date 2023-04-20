/*
	[
		_missionColor  // ["blue","red","green","orange"]
	] call GMS_fnc_selectAILoadout;
	
	returns:
	_lootarray
	by Ghostrider [GRG]
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_missionColor"];
private _weaponList = missionNamespace getVariable [format["GMS_WeaponList_%1",_missionColor],[]];
_weaponList	
