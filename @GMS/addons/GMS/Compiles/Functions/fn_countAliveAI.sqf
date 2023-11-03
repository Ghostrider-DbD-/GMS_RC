/*
	By Ghostrider [GRG]
	Copyright 2016

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

params ["_AIList",["_returnMode",0]];
private["_alive","_total","_return"];

_total = count _AIList;
_alive = {alive _x} count _AIList;
switch (_returnMode) do
{
	case 0:{_return = (_alive / _total)};
	case 1:{_return  = [_alive,_total]};
};

_return


