/*
	GMS_fnc_findPositionsAlongARadius
	
	Generates an array of equidistant positions along the circle of diameter _radius
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

private["_locs","_startDir","_currentDir","_Arc","_dist","_newpos"];
params["_center","_num","_minDistance","_maxDistance"];

_locs = [];
_startDir = round(random(360));
_currentDir = _startDir;
_Arc = 360/_num;

for "_i" from 1 to _num do
{
	_currentDir = _currentDir + _Arc;
	_dist = round(_minDistance + (random(_maxDistance - _minDistance)));
	_newpos = _center getPos [_dist, _currentDir];
	_locs pushback _newpos;
};

_locs



