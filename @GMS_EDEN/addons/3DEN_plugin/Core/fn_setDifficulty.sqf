/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
#include "gms3DEN_defines.hpp"
params["_difficulty"];
GMS_difficulty = _difficulty;
private _m = format["Mission Difficulty updated to %1",GMS_difficulty];
systemChat _m;
diag_log _m;

