
/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
*/

params[
	"_building", //  An object to be evaluated as a possible location of a garrison
	"_turrets",  //  A list of turrets known to be inside something 
	"_groups"];  //  A list of groups that are known to be inside something 

diag_log format["configureGarrisonATL Line 10: _this = %1",_this];
diag_log format["configureGarrisonATL Line 11: _building = %1",_building];
diag_log format["configureGarrisonATL Line 12: _center = %1",_center];
diag_log format["configureGarrisonATL Line 13: _turrets = %1",_turrets];
diag_log format["configureGarrisonATL Line 14: count _groups = %1 | _groups = %2",count _groups, _groups];

private _pos = _building get3DENAttribute "position";

private _count = 0;
private _staticsText = [];
private _unitsText = [];
private _buildingGarrisonATL = [];
private _configuredStatics = [];
private _configuredUnits = [];
private _lineBreak = toString [10];

for "_i" from 1 to (count _turrets) do 
{
	if (_turrets isEqualTo []) exitWith {};
	private _tur = _turrets deleteAt 0;
	//_configuredStatics pushBackUnique _tur;
	private _pos = getPosATL _tur;
	private _dir = getDir _tur;
	private _center = getPosATL _container;
	private _offset = _center vectorDiff _pos;
	diag_log format["fn_configureGarisonATL  Line 39: getPosATL _tur = %1 | getPosATL _container = %2",_pos,_center];
	_staticsText pushBack [format['%1',typeOf _tur],_offset,_dir];
	diag_log format["fn_configureGarisonATL  Line 41: updated _staticsText to %1",_staticsText];
};
_staticsText joinString _lineBreak;

for "_i" from 1 to (count _groups) do 
{
	if (_groups isEqualTo []) exitWith {};
	private _grp = _groups deleteAt 0;
	private _inside = false;
	// assume there is a group of 1 and that the leader of the group is in the position to be guarded 
	private _unit = leader _group;
	//_configuredUnits pushBackUnique _unit;
	private _pos = getPosATL _unit;
	private _center = getPosATL _container;
	private _offset = _pos vectorDiff _center;
	private _dir = getDir _unit;
	_unitsText pushBack [_offset,_dir];
	diag_log format["configureGarrisonATL Line 50: added unit %1 to garison for building %2",_unit,_container];
	diag_log format["configureGarrisonATL Line 53: updated _unitsText to %1",_unitsText];		
};	
_unitsText joinString _lineBreak;

if !((_staticsText isEqualTo []) && (_unitsText isEqualTo [])) then
{
	private _allowDamage = (_building get3DENAttribute "allowDamage") select 0;
	private _enableSimulation = (_building get3DENAttribute "enableSimulation") select 0;	
	diag_log format["configureGarrisonATL: _building %1 | damage %2 | simulation %3",_allowDamage,_enableSimulation];
	_buildingGarrisonATL = [
		format["%1", 
		typeOf _building], 
		(getPosATL _building) vectorDiff _center, 
		getDir _building,
		_allowDamage,
		_enableSimulation,
		_staticsText,
		_unitsText
	];
};

private "_return";
if (_buildingGarrisonATL isEqualTo []) then 
{
	_return = [];
} else {
	_return = [_buildingGarrisonATL,_configuredStatics,_configuredUnits];
};
_return
