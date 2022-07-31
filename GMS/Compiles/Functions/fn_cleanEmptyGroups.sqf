/*
   call as [] call GMS_fnc_cleanEmptyGroups;
   Deletes any empty groups and thereby prevents errors resulting from createGroup returning nullGroup.

	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

private _grp = allGroups;
for "_i" from 1 to (count _grp) do
{
	private _g = _grp deleteAt 0;
	if ((count units _g) isEqualTo 0) then {deleteGroup _g};
};

