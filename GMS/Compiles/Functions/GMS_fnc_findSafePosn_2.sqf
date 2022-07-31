private _safepos = [getMarkerPos "center",0,14000,0,0,0.5,0];
private _validspot = false;
private "_position";
_fnc_nearWater = {
	_result 	= false;
	_position 	= _this select 0;
	_radius		= _this select 1;

	for "_i" from 0 to 359 step 45 do {
		//_checkposition = [(_position select 0) + (sin(_i)*_radius), (_position select 1) + (cos(_i)*_radius)];
		//_checkposition2 = [(_position select 0) + (sin(_i)*_radius/2), (_position select 1) + (cos(_i)*_radius/2)];
		_checkPosition = _position getPos[_radius, _i];
		if (surfaceIsWater _checkposition) exitWith {
			_result = true; 
		};
	};
	_result
};

while{!_validspot} do {
	//uiSleep 1;
	_validspot = true;
	_position = _safepos call BIS_fnc_findSafePos;
	if (count _position > 2) then {
		_validspot = false;
	};
	if(_validspot) then {
		if ([_position,500] call _fnc_nearWater) then {
			_validspot = false;
		};
	};
	if(_validspot) then {
		_isflat = _position isFlatEmpty [20,0,0.5,100,0,false];
		if (_isflat isequalto []) then {
			_validspot = false;
		};
	};
	if(_validspot) then {
		{
			if (_position distance _x < 1500) exitwith {
				_validspot = false; 
			};
		} foreach (missionnamespace getvariable ["GMS_ActiveMissionCoords",[]]);
	};

	// Check for near Bases
	if(_validspot) then {
		if (GMSCore_modtype isEqualTo "Epoch") then {
			{
				if (_position distance _x < 1000) exitwith {
					_validspot = false; 
				};
			} foreach (missionnamespace getvariable ["Epoch_PlotPoles",[]]);
		}
		else {
			if (GMSCore_modtype isEqualTo "Exile") then {
				{
					if (_position distance _x < GMS_minDistanceToBases) exitwith {
						_validspot = false; 
					};				
				} foreach (nearestObjects [GMS_mapCenter, ["Exile_Construction_Flag_Static"], GMS_mapRange + 25000]);
			};
		};
	};

// Check for near Players
	if(_validspot) then {
		{
			if (_position distance _x < GMS_minDistanceToPlayer) exitwith {
				_validspot = false;
			};
		} foreach allplayers;
	};

	// Check for near locations 
	if (_validspot) then {
		{
			if (_position distance (_x select 0) < (_x select 1)) exitWith {
				_validspot = false;
			};
		} forEach GMS_locationBlackList;
	};

	// Check for DMS missions 
	if (GMS_minDistanceFromDMS > 0 && {_validspot}) then 
	{
		{
			if (_position distance _x < GMS_minDistanceFromDMS) exitWith {
				_validspot = false;
			};
		} forEach ([] call GMS_fnc_getAllDMSMarkers);
	};	
};
_position set [2, 0];
_position


