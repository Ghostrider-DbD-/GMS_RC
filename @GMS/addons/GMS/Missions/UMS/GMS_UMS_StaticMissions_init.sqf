/*
	by Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

//static mission descriptor for code: [position,level, numAI or [min,maxAI],patrolRadius, respawn, group[groupNull],spawnedAt[0],respawn[0]]
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
#include "\GMS\Missions\UMS\GMS_UMS_StaticMissions_Lists.sqf";

{
	diag_log format["[GMS] GMS__UMS_StaticMissions_init.sqf <Evaluating Mission = %1>",_x];
	diag_log format["[GMS] GMS__UMS_StaticMissions_init.sqf <worldName = %1 | _mod = %2>",toLower worldName,(toLower GMSCore_modtype)];	
	if ((toLower worldName) isEqualTo toLower(_x select 1)) then
	{
		if ((toLower GMSCore_modtype) isEqualTo (toLower(_x select 0))) then
		{
			call compilefinal preprocessFileLineNumbers format["\GMS\Missions\UMS\staticMissions\%1",(_x select 2)];
		};
	};
}forEach _staticMissions;