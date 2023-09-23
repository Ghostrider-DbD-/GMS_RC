/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
#include "gms3DEN_defines.hpp"
params["_mode"];
missionNameSpace setVariable["GMS_missionEndCondition",_mode];
private _m = format["Mission End State updated to %1",GMS_missionEndCondition];
systemChat _m;
diag_log _m;