
/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

	private _u = _this select 0;
	private _isInside = [_u] call gms3DEN_fnc_isInside;
	private _isInVehicle = [_u] call gms3DEN_fnc_isInVehicle;
	private _isInfantry = if (_isInside || _isInVehicle) then {false} else {true};
	
	_isInfantry