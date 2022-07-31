/*
	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_mArray","_count"];

_mArray params["_missionType","_markerPos","_markerLabel","_markerLabelType","_markerColor","_markerType"];
_textPos = [(_pos select 0) + (count toArray (_text) * 12), (_pos select 1) + (_size select 0), 0];
_MainMarker = createMarker ["ai_count" + _name, _textPos];
_MainMarker setMarkerShape "Icon";
_MainMarker setMarkerType "HD_Arrow";
_MainMarker setMarkerColor "ColorBlack";
_MainMarker setMarkerText format["% Alive",_count];

//_MainMarker setMarkerDir 37;