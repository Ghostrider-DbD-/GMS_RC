/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/
#include "gms3DEN_defines.hpp"
params["_mode"];
switch (_mode) do 
{
	GMS_missionLocations = "random";
	GMS_missionLocations= "fixed";
};
private _m = format["Mission Locations updated to %1",_mode];
systemChat _m;
diag_log _m;