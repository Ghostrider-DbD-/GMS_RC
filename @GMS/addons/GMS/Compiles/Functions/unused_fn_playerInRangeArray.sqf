//////////////////////////////////////////////////////
// Test whether one object (e.g., a player) is within a certain range of any of an array of other objects
/*
	GMS_fnc_playerInRangeArray

	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

params["_locations","_dist",["_onFootOnly",true],["_onGroundOnly",true]];
private _nearLocations = _locations select {[_x,_dist,_onFootOnly,_onGroundOnly] call GMS_fnc_playerInRange};
private _return = if (_nearLocations isEqualTo []) then {false} else {true};
_return

