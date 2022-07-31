/*
	removes empty or null groups from GMS_monitoredMissionAIGroups
   By Ghostrider [GRG]
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

for "_i" from 0 to ((count GMS_monitoredMissionAIGroups) - 1) do
{
	if (_i >= (count GMS_monitoredMissionAIGroups)) exitWith {};
	_grp = GMS_monitoredMissionAIGroups deleteat 0;
	if ({alive _x} count units _grp > 0) then 
	{
		GMS_monitoredMissionAIGroups pushBack _grp;
	} else {
		if !(isNull _grp) then {deleteGroup _grp};
	};
};

