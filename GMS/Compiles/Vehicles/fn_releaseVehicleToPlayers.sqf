
/*
	By Ghostrider-GRG-
	And Ignatz-HeMan
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_veh"];
if (local _veh) then
{
	_veh lock 1;
}
else
{
	[_veh, 1] remoteExecCall ["lock", _veh];
};

{
	_veh removealleventhandlers _x;
} forEach ["Local","GetIn","GetOut","fired","hit","hitpart","reloaded","dammaged","HandleDamage"];
{
	_veh removeAllMPEventHandlers _x;
} forEach ["MPHit","MPKilled"];
if ((damage _veh) > 0.6) then {_veh setDamage 0.6};  //  So they don't blow up when a player tries to get in.
