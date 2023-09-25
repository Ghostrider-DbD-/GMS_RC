/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
	sets a variable that specifies the maximum number of AI that will be spawned for each infantry group.
	this variable is read when the mission is exported and saved in the configuration for each mission Infantry Group.
*/

params["_maxAI"];
if (_maxAI < GMS_minAI) exitWith {
		private _m = format["Invalid selection - MinAI set to %1. Max AI must be greater than or equal to min AI",GMS_minAI];
		systemChat _m;
		diag_log _m;
		[_m, "ERROR"] call BIS_fnc_3DENShowMessage;
};
GMS_maxAI = _maxAI;
diag_log format["_setMaxAI: GMS_maxAI set to %1",GMS_maxAI];