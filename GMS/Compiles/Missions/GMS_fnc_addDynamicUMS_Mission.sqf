/*
	by Ghostrider [GRG]
	Copyright 2016
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
//params["_pos"];
private["_UMS_mission","_waitTime","_mission","_pos"];

if (count GMS_dynamicUMS_MissionList == 0) exitWith
{
	GMS_numberUnderwaterDynamicMissions = -1;
	diag_log "No Dynamic UMS Missions Listed <spawning disabled>";
};
_UMS_mission = selectRandom GMS_dynamicUMS_MissionList;
_waitTime = (GMS_TMin_UMS) + random(GMS_TMax_UMS - GMS_TMin_UMS);
_mission = format["%1%2","Mafia Pirates",floor(random(1000000))];
_pos = call GMS_fnc_findShoreLocation;
#ifdef GMS_debugMode
if (GMS_debugLevel >= 2) then {diag_log format["_fnc_addDynamicUMS_Mission: GMS_dynamicUMS_MissionsRuning = %1 | GMS_missionsRunning = %2 | GMS_UMS_ActiveDynamicMissions = %3",GMS_dynamicUMS_MissionsRuning,GMS_missionsRunning,GMS_UMS_ActiveDynamicMissions]};;
#endif
GMS_UMS_ActiveDynamicMissions pushBack _pos;
GMS_missionsRunning = GMS_missionsRunning + 1;
GMS_dynamicUMS_MissionsRuning = GMS_dynamicUMS_MissionsRuning + 1;
//diag_log format["[GMS] UMS Spawner:-> waiting for %1",_waitTime];
uiSleep _waitTime;
//diag_log format["[GMS] UMS Spawner:-> spawning mission %1",_UMS_mission];
[_pos,_mission] call compileFinal preprocessFileLineNumbers format["q\addons\GMS\Missions\UMS\dynamicMissions\%1",_UMS_mission];
