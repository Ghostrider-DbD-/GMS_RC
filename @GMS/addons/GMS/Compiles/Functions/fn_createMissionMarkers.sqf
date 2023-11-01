/*
	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

private "_markers";
 params[
	["_markerName","NoNameGiven"],  // the name used when creating the marker. Must be unique.
	["_markerPos",[0,0]],
	["_markerLabel","NoLabelGiven"],  //  Text used to label the marker
	["_markerColor","NoColorGiven"],
	["_markerType","NoTypeGiven"],	// Use either the name of the icon or "ELLIPSE" or "RECTANGLE" where non-icon markers are used
	["_markerSize",[0,0]],
	["_markerBrush","NoBrushGiven"],
	["_showMarkers",true],
	["_missionFile","NoFilenameProvided"]
 ];

if (GMS_debugLevel > 3) then 
{
	private _pList =[
		"_markerName",  // the name used when creating the marker. Must be unique.
		"_markerPos",
		"_markerLabel",
		"_markerColor",
		"_markerType",	// Use either the name of the icon or "ELLIPSE" or "RECTANGLE" where non-icon markers are used
		"_markerSize",
		"_markerBrush"
	];
	for "_i" from 0 to ((count _this) - 1) do
	{
		diag_log format["_fnc_createMarker: _missionFile %1 | parameter %2 = %3",_missionFile,_pList select _i,_this select _i];
	}; 
};

private _markerError = false;
if !(toLowerANSI (_markerType) in ["ellipse","rectangle"] || {isClass(configFile >> "CfgMarkers" >> _markerType)} ) then 
{
	[format["_markerType set to 'ELLIPSE': Illegal marker type %1 used for mission %2 of difficulty %3",_markerType,_markerMissionName,_difficulty],"warning"] call GMS_fnc_log;
	_markerType = "ELLIPSE";
	_markerSize = [200,200];
	_markerBrush = "GRID";
	_markerError = true;
};

if !(isClass(configFile >> "CfgMarkerColors" >> _markerColor)) then 
{
	[format["_markerColor set to 'default': Illegal color %1 used for mission %2 of difficulty %3",_markerColor,_markerMissionName,_difficulty],"warning"] call GMS_fnc_log;
	_markerColor = "DEFAULT";
	_markerError = true;
};

private _markers = [];;
if (_showMarkers) then {
	if (toUpper(_markerType) in ["ELLIPSE","RECTANGLE"]) then // not an Icon .... 
	{
		private _m = createMarker [GMS_missionMarkerRootName + _markerName,_markerPos];
		If (_showMarkers) then {
			_m setMarkerShape _markerType;
			_m setMarkerColor _markerColor;
			_m setMarkerBrush _markerBrush;
			_m setMarkerSize _markerSize;
		};

		private _m2 = createMarker [GMS_missionMarkerRootName + _markerName + "label", _markerPos];
		if (_showMarkers) then {
			_m2 setMarkerType "loc_destroy";
			_m2 setMarkerColor "ColorWhite";
			_m2 setMarkerText _markerLabel;	
		};
		_markers = [_m,_m2];	
	} else {
		private _m = "";
		private _m2 = createMarker [GMS_missionMarkerRootName + _markerName + "label", _markerPos];
		if (_showMarkers) then {
			_m2 setMarkerType _markerType;
			_m2 setMarkerColor _markerColor;
			_m2 setMarkerText _markerLabel;
		};
		_markers = [_m,_m2];

	};
} else {
	_markers = ["",""];
};
_markers