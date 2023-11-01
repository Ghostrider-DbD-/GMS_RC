/*
	GMS_fnc_restoreHiddenObjects

	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"


for "_i" from 1 to (count GMS_hiddenTerrainObjects) do 
{
	if (_i > (count GMS_hiddenTerrainObjects)) exitWith {};
	private _el = GMS_hiddenTerrainObjects deleteAt 0;
	_el params["_obj","_timeout"];
	if (diag_tickTime > _timeOut) then 
	{
		{_x hideObjectGlobal false} forEach _obj;
	} else {
		GMS_hiddenTerrainObjects pushBack _el;
	};
};