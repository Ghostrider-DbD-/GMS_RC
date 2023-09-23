diag_log format["<<  ----  START  %1  ----  >>",diag_tickTime];

all3DENEntities params ["_objects","_groups","_triggers","_systems","_waypoints","_markers","_layers","_comments"];
private["_m1","_markerPos","_markerType","_markerShape","_markerColor","_markerText","_markerBrush","_markerSize","_markerAlpha"];
if (_markers isEqualTo []) then
{
	diag_log "No Marker Found, no Marker Definitions Will Be generated";
} else {
	private _m1 = _markers select 0;
	diag_log format["_m1 = %1",_m1];
	_markerPosition = 	_m1 get3DENAttribute "Position";  // Returns expected value
	_markerText = 		_m1 get3DENAttribute "Text";	 // Returns expected value 
	_markerColor = 		_m1 get3DENAttribute "baseColor";   //Returns Null 	
	_markerShape = 		(_m1 get3DENAttribute "markerType") select 0;   // Returns [-1] if not a rectangular or elipsoid marker] 	
	_markerAlpha = 		_m1 get3DENAttribute "alpha";
	_markerType = 		(_m1 get3DENAttribute "itemClass") select 0;	 // Returns "" if not an icon type marker 	
	_markerBrush = 		_m1 get3DENAttribute "brush";
	_markerSize =		_m1 get3DENAttribute "size2";
	_markerRotation = 	_m1 get3DENAttribute "rotation";
	diag_log format["typeName _markerType = %1 | markerType = %2 | typeName _markerShape = %3 | markerShape = %4", typeName _markerType, _markerType, typeName _markerShape, _markerShape];
	diag_log format["typeName _markerPosition = %1 | _markerPosition = %2 | typeName _markerRotation = %3 | _markerRotation = %4",typeName _markerPosition,_markerPosition,typeName _markerRotation,_markerRotation];
};

	/*
	if (_markerShape == -1) then 
	{
		// The marker is an icon 

	} else {
		_markerSize = _m1 get3DENAttribute "size2";     // Returns Null 
		_markerBrush = _m1 get3DENAttribute " 	brush";
	};

	/*
_lines pushBack format["_markerPosition = %1",_markerPosition];
_lines pushBack format["_markerText = %1",_markerText];
_lines pushBack format["_markerColor = %1",_markerColor];
_lines pushBack format["_markerType = %1", _markerType];
_lines pushBack format["_markerShape = %1",_markerShape];
_lines pushBack format["_markerAlpha = %1",_markerAlpha];
_lines pushBack format["_markerBrush = %1",_markerBrush];
_lines pushBack format["_markerSize = %1",_markerSize];
_lines pushBack format["_markerRotation = %1",_markerRotation];
*/
	*/