
/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

	private _group = _this select 0;
	private _units = units _group; 
	private _isInfantry = true; 
	{
		private _isInside = [_u] call gms3DEN_fnc_isInside;
		_isInfantry = if ((_u isKindOf "Man") && (vehicle _u) isEqualTo _u && !(_isInside)) then {true} else {false};
		if !(_isInfantry) exitWith {};
	} forEach _units;
	_isInfantry