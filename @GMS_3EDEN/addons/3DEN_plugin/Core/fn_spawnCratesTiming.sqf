/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
#include "gms3DEN_defines.hpp"
params["_timing"];
GMS_spawnCratesTiming = _timing;
private _m= format["Loot Chest Spawn Timing updated to %1",GMS_spawnCratesTiming];
systemChat _m;
diag_log _m;