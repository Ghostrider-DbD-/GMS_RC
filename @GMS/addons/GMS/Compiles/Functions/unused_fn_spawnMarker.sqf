/*
	GMS_fnc_spawnMarker 

	Note: kept for backwards compatability with older parts of GMS like the static and dynamic loot spawns and spawns of map addons.

	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

private["_GMS_fn_configureRoundMarker"];
_GMS_fn_configureRoundMarker = {
	params["_name","_pos","_color","_text","_size","_labelType","_mShape","_mBrush"];

	if ((_pos distance [0,0,0]) < 10) exitWith {};
	private _marker = createMarker [_name, _pos];
	_marker setMarkerColor _color;
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerBrush "Grid";
	_marker setMarkerSize _size; //
	if (count toArray(_text) > 0) then
	{
		switch (_labelType) do {
			case "arrow":
			{
				_name = _name + "label";
				private _textPos = [(_pos select 0) + (count toArray (_text) * 12), (_pos select 1) - (_size select 0), 0];
				private _arrowMarker = createMarker [_name, _textPos];
				_arrowMarker setMarkerShape "Icon";
				_arrowMarker setMarkerType "HD_Arrow";
				_arrowMarker setMarkerColor "ColorBlack";
				_arrowMarker setMarkerText _text;
				//_marker setMarkerDir 37;
				};
			case "center": 
			{
				_name = "label" + _name;
				private _labelMarker = createMarker [_name, _pos];
				_labelMarker setMarkerShape "Icon";
				_labelMarker setMarkerType "mil_dot";
				_labelMarker setMarkerColor "ColorBlack";
				_labelMarker setMarkerText _text;
				};
			};
	};
	if (isNil "_labelMarker") then {_labelMarker = ""};
	_marker
};

_GMS_fn_configureIconMarker = {

	params["_name","_pos",["_color","ColorBlack"],["_text",""],["_icon","mil_triangle"]];
	//_name = "label" + _name;
	private _marker = createMarker [_name, _pos];
	_marker setMarkerShape "Icon";
	_marker setMarkerType _icon;
	_marker setMarkerColor _color;
	_marker setMarkerText _text;	
	_marker
};

params["_mArray","_mBrush"];

private["_marker"];
_mArray params["_missionMarkerName","_markerPos","_markerLabel","_markerLabelType","_markerColor","_markerTypeInfo"];
_missionMarkerName = GMS_missionMarkerRootName + _missionMarkerName;
_markerTypeInfo params[["_mShape","mil_dot"],["_mSize",[0,0]],["_mBrush","GRID"]];

if (toUpper(_mShape) in ["ELLIPSE","RECTANGLE"]) then // not an Icon .... 
{	
	if (isNil "_mBrush") then {_mBrush = "GRID"};
	_marker = [_missionMarkerName,_markerPos,_markerColor,_markerLabel, _mSize,_markerLabelType,_mShape,_mBrush] call _GMS_fn_configureRoundMarker;
} else {  
	_marker = [_missionMarkerName,_markerPos, _markerColor,_markerLabel,_mShape] call _GMS_fn_configureIconMarker;
};
if (isNil "_marker") then {_marker = ""};

_marker
