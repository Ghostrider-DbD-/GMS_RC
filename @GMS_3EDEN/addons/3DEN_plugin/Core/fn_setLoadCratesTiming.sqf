/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
#include "gms3DEN_defines.hpp"
params["_timing"];
missionNamespace setVariable["GMS_loadCratesTiming", _timing];
private _m =  format["Mission Load Crates Timing set to %1",GMS_loadCratesTiming];
systemChat _m;
diag_log _m;