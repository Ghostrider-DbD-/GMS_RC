/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params[["_mode",""]];

private _header = format
	["GMS 3DEN Plugin Version %1 : Build %2 : Build Date %3",
	getNumber(configFile >> "CfgGMS3DENVersion" >> "version"),
	getNumber(configFile >> "CfgGMS3DENVersion" >> "build"),
	getText(configFile >> "CfgGMS3DENVersion" >> "date"),
	_mode
];

_header

