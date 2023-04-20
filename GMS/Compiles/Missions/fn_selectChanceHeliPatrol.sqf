/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_aiDifficultyLevel"];
private _chanceHeliPatrol = missionNamespace getVariable[format["GMS_chanceHeliPatrol%1",_aiDifficultyLevel],[]];
_chanceHeliPatrol