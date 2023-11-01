/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

params["_aiDifficultyLevel"];  //[["_aiDifficultyLevel",selectRandom["Red","Green"]]];

private _sideArms = missionNamespace getVariable[format["GMS_Pistols_%1",_aiDifficultyLevel],[]];
_sideArms