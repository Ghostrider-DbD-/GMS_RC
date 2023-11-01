// Sets up waypoints for a specified group.
/*
	GMS_fnc_setupWaypoints

	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
private["_dir","_arc","_noWp","_newpos","_wpradius","_wp"];
params["_pos","_minDis","_maxDis","_group",["_mode","random"],["_wpPatrolMode","SAFE"],["_soldierType","null"],["_patrolRadius",30],["_wpTimeout",[5.0,7.5,10]]];
_wp = [_group, 0];
if !(_soldierType isEqualTo "emplaced") then
{
	_arc = 360/5;
	_group setcombatmode "RED";
	_group setBehaviour "SAFE";
	_group setVariable["patrolCenter",_pos,true];  				//  Center of the area to be patroleld.
	_group setVariable["minDis",_minDis,true];  				//  minimum distance between waypoints
	_group setVariable["maxDis",_maxDis,true];  				// maximum distance between waypoints
	_group setVariable["timeStamp",diag_tickTime];				// used to check that waypoints are being completed
	_group setVariable["wpRadius",0];							// Always set to 0 to force groups to move a bit
	_group setVariable["patrolRadius",_patrolRadius,true];		// radius of the area to be patrolled
	_group setVariable["wpMode",_mode,true];					//  The default mode used when the waypoint becomes active  https://community.bistudio.com/wiki/AI_Behaviour
	_group setVariable["wpPatrolMode",_wpPatrolMode];   		//  Not used; the idea is to allow two algorythms: randomly select waypoints so groups move back and forth along the perimiter of the patrool area or sequenctioal, hoping along the perimeter
	_group setVariable["wpTimeout",_wpTimeout,true];				//  Here to alow you to have the game engine pause before advancing to the next waypoing. a timout of 10-20 sec is recommended for infantry and land vehicles, and 1 sec for aircraft
	_group setVariable["wpDir",0,true];							//  Used to note the degrees along the circumference of the patrol area at which the last waypoint was positioned.
	_group setVariable["wpArc",_arc,true];						// Increment in degrees to be used when advancing the position of the patrol to the next position along the patrol perimeter
	_group setVariable["soldierType",_soldierType];				// infantry, vehicle, air or emplaced. Note that there is no need to have more than one waypoint for emplaced units.
	_dir = 0;

	_dis = (_minDis) + random( (_maxDis) - (_minDis) );
	_newPos = _pos getPos[_dis,_dir];
	_wp setWPPos [_newPos select 0, _newPos select 1];
	_wp setWaypointCompletionRadius 0;  //(_group getVariable["wpRadius",30]); 
	_wp setWaypointType "MOVE";
	_wp setWaypointName "move";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointTimeout _wpTimeout;
	_group setCurrentWaypoint _wp;
	#ifdef GMS_debugMode
	_wp setWaypointStatements ["true","this call GMS_fnc_setNextWaypoint; diag_log format['====Updating timestamp for group %1 and changing its WP to a Move Waypoint',group this];"];
	#else
	_wp setWaypointStatements ["true","this call GMS_fnc_setNextWaypoint;"];	
	#endif
	#ifdef GMS_debugMode
	if (GMS_debugLevel >= 3) then
	{
		_marker = createMarker [format["GroupMarker%1",_group],_newPos];
		_group setVariable["wpMarker",_marker,true];
		_marker setMarkerColor "ColorBlue";
		_marker setMarkerText format["%1 %2",(_group getVariable["soldierType","null"]),_group];
		_marker setMarkerType "mil_triangle";
		//diag_log format["_fnc_setupWaypoints: configuring weapoints for group %2 mobile patrol with _soldierType = %1",_solderType,_group];
		diag_log format["_fnc_setupWaypoints: soldier type for mobile _group %1 set to %2",_group, (_group getVariable["soldierType","null"])];
		diag_log format["_fnc_setupWaypoints: all variables for the group have been set for group %1",_group];		
		diag_log format["_fnc_setupWaypoints:: -- >> wpMode %1 _dir %2 _dis %3",_group getVariable["wpMode","random"], _dir, _dis];
		diag_log format["_fnc_setupWaypoints:: -- >> group to update is %1 and new position is %2",_group, _newPos];		
		diag_log format["_fnc_setupWaypoints:: -- >> Waypoint statements for group %1 have been configured as %2",_group, waypointStatements _wp];
		diag_log format["_fnc_setupWaypoints:: -- >> Waypoint marker for group %1 have been configured as %2 with text set to %3",_group, _group getVariable "wpMarker", markerText (_group getVariable "wpMarker")];
	};
	#endif
} else {
	_wp setWaypointType "SENTRY";
	_wp setWPPos (getPos leader _group);
	_wp setWaypointCompletionRadius 100;
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointCombatMode "RED";
	_wp setWaypointTimeout [1,1.1,1.2];
	//_wp setWaypointTimeout [0.1,0.1100,0.1200];	
	_group setCurrentWaypoint _wp;	
	_group setVariable["soldierType",_soldierType,true];
	#ifdef GMS_debugMode
	_wp setWaypointStatements ["true","this call GMS_fnc_emplacedWeaponWaypoint; diag_log format['====Updating timestamp for group %1 and changing its WP to an emplaced weapon Waypoint',group this];"];
	if (GMS_debugLevel > 2) then {diag_log format["_fnc_setupWaypoints: configuring weapoints for group %2 for emplaced weapon with _soldierType = %1",_soldierType,_group];};
	#else
	_wp setWaypointStatements ["true","this call GMS_fnc_emplacedWeaponWaypoint;"];
	#endif	
};
