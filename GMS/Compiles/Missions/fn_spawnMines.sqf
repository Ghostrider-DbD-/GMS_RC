// Spawns mines in a region centered around a specific position and returns an array with the spawned mines for later use, i.e. deletion
/*
	GMS_fnc_spawnMines
	
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_pos"];

#define noMines 50
#define mineTypes = ["ATMine","SLAMDirectionalMine"];
private _minesPlaced = [];
#define minDis 50
#define maxDis 150
_closest = 5;
_dir = 0;
_incr = 360/ (noMines/2);
for "_i" from 1 to noMines/2 do
{
	for "_j" from 1 to 2 do
	{
		private _radius = maxDis - floor(random(maxDis - minDis));
		private _xpos = (_pos select 0) + sin (_dir) * _radius;
		private _ypos = (_pos select 1) + cos (_dir) * _radius;	
		private _posMine = [_xpos,_ypos,0];
		private _mine = createMine ["ATMine", _posMine, [], 0];
		if (GMSCore_modtype isEqualTo "Epoch") then {_mine setVariable ["LAST_CHECK", (diag_tickTime + 14400)]};
		_mine setPos _posMine;
		_minesPlaced pushBack _mine;
	};
	_dir = _dir + _incr;
};
_minesPlaced
