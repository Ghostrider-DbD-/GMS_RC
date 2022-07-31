
/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
// TODO: not sure we need this - can we do the same thing in another script
private["_group","_wp"];
_group = group _this;
_group setVariable["timeStamp",diag_tickTime];
_wp = [_group, 0];
_group setCurrentWaypoint _wp;

