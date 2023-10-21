/*
	GMS_fnc_spawnSimpleObjects

	by Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_center","_objects","_relative"];
private _spawnedObjects = [];
{
	_x params["_className","_relPos","_dir"];
	private _objPos = _center vectorAdd _relPos;		
	private _obj = createSimpleObject [_className,ATLToASL _objPos];
	[_obj, _dir] call GMSCore_fnc_setDirUp;
	_spawnedObjects pushBack _obj;
} forEach _objects;
_spawnedObjects