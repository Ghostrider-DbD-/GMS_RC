/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
	sets a variable that specifies the minimum number of AI that will be spawned for each infantry group.
	this variable is read when the mission is exported and saved in the configuration for each missionInfantryGroup.
*/

params["_minAI"];
if (_minAI > GMS_maxAI) exitWith {
		private _m = format["Invalid selection - MaxAI set to %1. Min AI must be less than or equal to max AI",GMS_maxAI];
		systemChat _m;
		diag_log _m;
		 [_m, "ERROR"] call BIS_fnc_3DENShowMessage;
};
GMS_minAI = _minAI;
diag_log format["_setMinAI: GMS_minAI set to %1",GMS_minAI];