/*
	GMS_fnc_handleEmptyVehicle 
	
	By Ghostrider [GRG]
	Copywright 2022 
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
params["_veh"];

if (isServer) then 
{
	if ({alive _x} count (crew _veh) == 0 || {crew(_veh) isEqualTo []}) then
	{	
		if (_veh getVariable["GRG_vehType","none"] isEqualTo "emplaced") then
		{
			if (GMS_killEmptyStaticWeapons) then
			{
				_veh setDamage 1;
				_veh setVariable["GMS_deleteAtTime",diag_tickTime + 60,true];
			}else {
				[_veh] call GMS_fnc_releaseVehicleToPlayers;  //Call this from _processAIKill
				_veh setVariable["GMS_deleteAtTime",diag_tickTime + GMS_vehicleDeleteTimer,true];
			};			
		} else {
			if (GMS_killEmptyAIVehicles) then
			{
				_veh setDamage 0.7;
				_veh setFuel 0;
				_veh setVariable["GMS_deleteAtTime",diag_tickTime + 60];
			} else {
				_veh setVariable["GMS_deleteAtTime",diag_tickTime + GMS_vehicleDeleteTimer,true];	
				[_veh] call GMS_fnc_releaseVehicleToPlayers;
			};
		};
	};	
};
 


