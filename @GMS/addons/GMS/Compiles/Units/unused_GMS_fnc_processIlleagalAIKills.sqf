/*
	by Ghostrider

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

private["_missionType","_wasRunover","_launcher","_legal"];
params["_unit","_killer"];
_legal = true;
if (vehicle _killer == _killer) exitWith {true};  

// Player not in vehicle, no further checks needed.
if (_killer == (driver (vehicle _killer))) then //  If the killer is also the driver then the killer must have run the AI over
{
	if(GMS_RunGear && {!((vehicle _killer) isKindOf "Air")}) then // assume aircraft are too fragile to kill AI by moving close to ground
	{   
		[_unit] call GMS_fnc_removeAllAIgear;
		if (GMS_VK_RunoverDamage) then 
		{//apply vehicle damage
			[vehicle _killer] call GMS_fnc_applyVehicleDamagePenalty;	
			[_killer] call GMS_fnc_msgIED;
		};		
		_legal = false;
	};
} else {
	if ( GMS_VK_GunnerDamage ) then
	{
		if ((typeOf (vehicle _killer)) in GMS_forbidenVehicles || {(currentWeapon _killer) in GMS_forbidenVehicleGuns}) then 
		{
			if (GMS_VK_Gear) then {[_unit] call GMS_fnc_removeAllAIgear;};
			[vehicle _killer] call GMS_fnc_applyVehicleDamagePenalty;
			[_killer] call GMS_fnc_msgIED;
			_legal = false;
		};
	};
};

_legal
