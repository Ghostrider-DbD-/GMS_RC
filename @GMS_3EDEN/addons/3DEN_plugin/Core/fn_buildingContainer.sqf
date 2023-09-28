/*
	Returns the builing containing an object or objNull
	By Ghostrider-GRG-
	Copyright 2020 
*/
	params["_u",["_category","House"]];

	diag_log format["_fn_buildingContainer: typeOf _u = %1", typeOf _u];
	private _pos = getPosASL _u;
	private _building = objNull;
	//     lineIntersectsSurfaces [begPosASL, endPosASL, ignoreObj1, ignoreObj2, sortMode, maxResults, LOD1, LOD2, returnUnique]
	/*
	Wiki page: https://community.bistudio.com/wiki/lineIntersectsSurfaces
	
	Return Value
    Array of intersections in format [[intersectPosASL, surfaceNormal, intersectObj, parentObject, selectionNames, pathToBisurf], ...] where:

        intersectPosASL: PositionASL - the actual position where line intersects surface
        surfaceNormal: Vector - a normal to the intersected surface
        intersectObject: Object - the object the surface belongs to (could be proxy object) - objNull if terrain
        parentObject: Object - the object proxy object belongs to (not always the same as intersect object) - objNull if terrain
        Arma 3 logo black.png
        2.10
        selectionNames: Array of Strings - Names of the intersected selections (bones). Returns [] if there is no intersection with a selection.
        Arma 3 logo black.png
        2.10
        pathToBisurf: String - path to intersected surface properties (.bisurf) file. Returns "" if surface has no special properties. Terrain surface properties begin with #, and the surface properties are defined in CfgSurfaces. For example, if it returns #GdtVRsurface01, properties are defined in: configFile >> "CfgSurfaces" >> "GdtVRsurface01"
	*/
	private _surfacesAbove = lineInterSectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) + 100],_u,_u,true,10,"VIEW","FIRE",true];
	private _surfacesBelow = lineIntersectsSurfaces [_pos, [_pos select 0, _pos select 1, (_pos select 2) - 100],_u,_u,true,10,"VIEW","FIRE",true];
	diag_log format["fn_buildingContainer: _surfacesAbove = %1", _surfacesAbove];
	diag_log format["fn_buildingContainer: _surfacesBelow = %1", _surfacesBelow];	
	private _buildingAbove = if !(_surfacesAbove isEqualTo []) then {_surfacesAbove select 0 select 2} else {objNull}; 
	private _buildingBelow = if !(_surfacesBelow isEqualTo []) then {_surfacesBelow select 0 select 2} else {objNull};
	diag_log format["fn_buildingContainer: _buildingAbove = %1",_buildingAbove];
	diag_log format["fn_buildingContainer: _buildingBelow = %1",_buildingBelow];

	if (!(isNull _buildingAbove) && _buildingAbove isKindOf "Building") then {_building = _buildingAbove} else {if (!(isNull _buildingBelow) && _buildingBelow isKindOf "Building") then {_building = _buildingBelow}};
	diag_log format["fn_buldingContainer: _building = %1",_building];
	_building