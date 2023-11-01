/*
  Delete alive AI.
  by Ghostrider
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

for "_i" from 1 to (count GMS_liveMissionAI) do {
	if ((_i) <= count GMS_liveMissionAI) then {
		_units = GMS_liveMissionAI deleteAt 0;
		_units params ["_missionCenter","_unitsarr","_timer"];

		if (diag_tickTime > _timer) then 
		{
			private _nearplayer = [_missionCenter,800] call GMSCore_fnc_nearestPlayers;
			if (_nearPlayer isEqualTo []) then 
			{
				{
					private _unit = _x;
					if ((alive _unit) && {!(isNull objectParent _unit)}) then {
						[objectParent _unit] call GMS_fnc_deleteAIvehicle;
					};
					[_unit] call GMS_fnc_deleteAI;
				} forEach _unitsarr;
			} else { 
				GMS_liveMissionAI pushback _units;
			};
		} else {
			GMS_liveMissionAI pushback _units;
		};
	};
};
