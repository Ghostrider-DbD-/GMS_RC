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
private _noChoppers = missionNamespace getVariable [format["GMS_noPatrolHelis%1",_aiDifficultyLevel],0];
_noChoppers