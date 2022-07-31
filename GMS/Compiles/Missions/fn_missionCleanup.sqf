/*
	schedules deletion of all remaining alive AI and mission objects.

	By Ghostrider-GRG-
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

params["_coords","_mines","_objects","_hiddenObjects","_GMS_AllMissionAI","_markerName","_cleanupAliveAITimer","_cleanupCompositionTimer",["_isScubaMission",false]];

[_mines] call GMS_fnc_clearMines;
[_objects, (diag_tickTime + _cleanupCompositionTimer)] call GMSCore_fnc_addToDeletionCue;	
GMS_hiddenTerrainObjects pushBack[_hiddenObjects,(diag_tickTime + _cleanupCompositionTimer)];
[_GMS_AllMissionAI, (diag_tickTime + _cleanupAliveAITimer)] call GMSCore_fnc_addToDeletionCue;
GMS_missionsRunning = GMS_missionsRunning - 1;
GMS_ActiveMissionCoords = GMS_ActiveMissionCoords - [ _coords];	
if !(_isScubaMission) then
{
	GMS_recentMissionCoords pushback [_coords,diag_tickTime]; 
	[_markerName,"inactive",[0,0,0]] call GMS_fnc_updateMissionQue;	
};
if (_isScubaMission) then
{
	GMS_priorDynamicUMS_Missions pushback [_coords,diag_tickTime]; 
	GMS_UMS_ActiveDynamicMissions = GMS_UMS_ActiveDynamicMissions - [_coords];
	GMS_dynamicUMS_MissionsRuning = GMS_dynamicUMS_MissionsRuning - 1;		
};