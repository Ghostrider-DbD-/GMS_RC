/*
	GMS_fnc_spawnMissionAI
	by Ghostrider [GRG]

	returns an array of the units spawned
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
#define configureWaypoints true

params["_coords",["_minNoAI",3],["_maxNoAI",6],["_noAIGroups",0],["_missionGroups",[]],["_aiDifficultyLevel","red"],["_uniforms",[]],["_headGear",GMS_BanditHeadgear],["_vests",[]],["_backpacks",[]],["_weapons",[]],["_sideArms",[]],["_isScubaGroup",false]];
[format["GMS_fnc_spawnMissionAI: _this = %1",_this]] call GMS_fnc_log;
private _unitsToSpawn = 0;
private _unitsPerGroup = 0;
private _ResidualUnits = 0;
private _adjusttedGroupSize = 0;
private ["_min","_max","_unitsToSpawn","_unitsPerGroup"];

private _allAI = [];
private _abort = false;
private _groups = [];
#define patrolAreadDimensions [60,60]
if !(_missionGroups isEqualTo []) then
{ 	
	{
		//[format["GMS_fnc_spawnMissionAI: evaluating _missionGroups element %1",_x]] call GMS_fnc_log;
		_x params["_position","_minAI","_maxAI","_skillLevel"];
		private _min = [_minAI] call GMSCore_fnc_getIntegerFromRange;
		private _max = [_maxAI] call GMSCore_fnc_getIntegerFromRange;
		//[format["GMS_fnc_spawnMissionAI: params returned _minAI %1 | _maxAI %2 _position %3 | _skillLevel %4",_minAI,_maxAI,_position,_skillLevel]] call GMS_fnc_log;
		_unitsToSpawn = round(_min + round(random(_max - _min)));
		private _groupPos = _coords vectorAdd _position;
		private _newGroup = [_groupPos,_unitsToSpawn,_aiDifficultyLevel,patrolAreadDimensions,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call GMS_fnc_spawnGroup;
		/*
		[
			_group,
			GMSAI_BlacklistedLocations,
			_patrolMarker,
			waypointTimeoutInfantryPatrols,
			GMSAI_chanceToGarisonBuilding,
			"infantry",
			_deletemarker
		] call GMSCore_fnc_initializeWaypointsAreaPatrol;
		*/
		private _movetoPos = [[[_groupPos, patrolAreadDimensions]],[]/* add condition that the spawn is not near a trader*/] call BIS_fnc_randomPos;
		(leader _newGroup) moveTo _movetoPos;
		(leader _newGroup) call GMSCore_fnc_nextWaypointAreaPatrol;		
		/*
		[
			_newGroup, 
			[_groupPos, [50,50]],
			300,
			0.33,
			"infantry",
			true
		] call GMSCore_fnc_initializeWaypointsAreaPatrol;
		*/
		_groups pushBack _newGroup;		
		GMS_monitoredMissionAIGroups pushback _newGroup;
		_allAI append (units _newGroup);
		//[format["GMS_fnc_spawnMissionAI: _group %1 with %2 units added | _min %3 | _max %4 | _unitsToSpawn %5",_newGroup, count (units _newGroup),_min,_max,_unitsToSpawn]]call GMS_fnc_log;				
	}forEach _missionGroups;
} else {
	if (_noAIGroups > 0) then
	{
		private _min = [_minNoAI] call GMSCore_fnc_getIntegerFromRange;
		private _max = [_maxNoAI] call GMSCore_fnc_getIntegerFromRange;
		_unitsToSpawn = round(_min + round(random(_max - _min)));
		_unitsPerGroup = floor(_unitsToSpawn/_noAIGroups);
		private _area = [_coords,[200,200]];
		private _groupPosns = [_coords,_noAIGroups,30,50] call GMS_fnc_findPositionsAlongARadius;
		{
			_newGroup = [_x,_unitsPerGroup,_aiDifficultyLevel,patrolAreadDimensions,_uniforms,_headGear,_vests,_backpacks,_weapons,_sideArms,_isScubaGroup] call GMS_fnc_spawnGroup;
			_groups pushBack _newGroup;
			GMS_monitoredMissionAIGroups pushback _newGroup;
			_allAI append (units _newGroup);
			//[format["GMS_fnc_spawnMissionAI: _group %1 with %2 units added",_newGroup, count (units _newGroup)]]	call GMS_fnc_log;
		} forEach _groupPosns;
	};
};
//[format["GMS_fnc_spawnMissionAI: _groups = %1 | _allAI = %2",_groups,_allAI]] call GMS_fnc_log;
_allAI

