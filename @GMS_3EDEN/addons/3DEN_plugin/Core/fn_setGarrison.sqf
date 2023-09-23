/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params["_object","_state"];
_object setVariable["Garrisoned",_state];
[format["Object Garrison State set to %1",_state], 0] call BIS_fnc_3DENNotification;

