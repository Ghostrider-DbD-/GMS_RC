/*
	GMS_fnc_addMissionToQue
	
	Adds the basic list of parameters that define a mission such as the marker name, mission list, mission path, AI difficulty, and timer settings, to the arrays that the main thread inspects.
	
	By Ghostrider-GRG-
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
params["_missionList","_path","_marker","_difficulty","_tMin","_tMax",["_noMissions",1]];
if (GMS_debugLevel >= 3) then 
{
	{
		diag_log format["_addMissionToQue: _this %1 = %2",_forEachIndex, _this select _forEachIndex];
	} forEach _this;
};
private _waitTime = diag_tickTime + (_tMin) + random((_tMax) - (_tMin));
private _missionsData = []; // Parameters definine each of the missions for this difficulty are stored as arrays here.
{
	private _missionFile = format["\GMS\Missions\%1\%2.sqf",_path,_x];
	private _missionCode = compileFinal preprocessFileLinenumbers _missionFile;//return all of the values that define how the mission is spawned as an array of values
	if !(isNil "_missionCode") then 
	{
		private _data = [_marker,_difficulty] call _missionCode;
		if !(isNil "_data") then 
		{
			_missionsData pushBack _data;
		};
	} else {
		diag_log format["bad path\mission combination %1",_missionFile];
	};
} forEach _missionList;

private _key = round(random(10000));
private _missions = [
	_key,
	_difficulty,
	_noMissions,  // Max no missions of this category
	0,  // Number active 
	_tMin, // Used to calculate waittime in the future
	_tMax, // as above
	_waitTime,  // time at which a mission should be spawned
	_missionsData  // Array of data about individual missions that could be spawned. The data table for each mission is defined in _missionSpawner
];

GMS_missionData pushBack _missions;




