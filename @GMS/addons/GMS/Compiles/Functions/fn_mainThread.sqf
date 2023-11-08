/*
	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

private["_timer1sec","_timer5sec","_timer10Sec","_timer20sec","_timer5min","_timer5min"];
_timer2sec = diag_tickTime + 2;
_timer5sec = diag_tickTime + 5;
_timer10Sec = diag_tickTime + 10;
_timer20sec = diag_tickTime + 20;
_timer1min = diag_tickTime + 10;
_timer5min = diag_tickTime + 300;

while {true} do
{
	uiSleep 1;
	
	if (diag_tickTime > _timer2sec) then 
	{			
		if (GMS_showCountAliveAI) then
		{
			{
				_x call GMS_fnc_updateMarkerAliveCount;
			} forEach GMS_missionLabelMarkers;
		};
		_timer2sec = diag_tickTime + 2;
	};
	
	if (diag_tickTime > _timer5sec) then
	{
		_timer5sec = diag_tickTime + 5;

		// Moved simulation monitoring to GMSCore since both GMS and GMSAI require it.
		//[] call GMS_fnc_simulationMonitor;
		[] spawn GMS_fnc_monitorSpawnedMissions;
		[] call GMS_fnc_scanForPlayersNearVehicles;		
		[] call GMS_fnc_vehicleMonitor;		
		#ifdef GRGserver
		[] call GMS_fnc_broadcastServerFPS;
		#endif		
	};
	if (diag_tickTime > _timer10Sec) then 
	{
		_timer10Sec = diag_tickTime + 10;
		[] call GMS_fnc_spawnNewMissions;			
		[] spawn GMS_fnc_monitorInitializedMissions;
	};
	
	if ((diag_tickTime > _timer1min)) then
	{
		_timer1min = diag_tickTime + 60;	
		[] call GMS_fnc_restoreHiddenObjects;
		//[] call GMS_fnc_groupWaypointMonitor;
		[] call GMS_fnc_cleanupAliveAI;
	};
	if (diag_tickTime > _timer5min) then 
	{
		private _clientID = if (clientOwner == 2) then {"Dedicated Server"} else {"Headless Client"};
		[ 
			format["Timstamp %1 | Missions Running %2 | Vehicles %3 | Groups %4 | Missions Run %5 | Server FPS %6 | Server Uptime %7 Min | Running on %8",
				diag_tickTime,
				GMS_missionsRunning,
				count GMS_monitoredVehicles,
				count GMS_monitoredMissionAIGroups,
				GMS_missionsRun,
				diag_FPS,
				floor(diag_tickTime/60),
				_clientID
			]
		] call GMS_fnc_log;
		if (GMS_debugLevel > 0) then 
		{
			private _activeScripts = diag_activeScripts;
			[
				format["count diag_activeSQFScripts %1 | Threads [spawned %2, execVM %3]",
					count diag_activeSQFScripts,
					_activeScripts select 0,
					_activeScripts select 1
					//GMS_activeMonitorThreads	
				]
			] call GMS_fnc_log;
			{
				[format["file %1 | running %2",(_x select 1),(_x select 2)]] call GMS_fnc_log;
			} forEach diag_activeSQFScripts;
		};
		//[] call GMS_fnc_cleanEmptyGroups;  //  Moved to GMSCore 10/31/23
		[GMS_landVehiclePatrols] call GMSCore_fnc_removeNullEntries;
		[GMS_aircraftPatrols] call GMSCore_fnc_removeNullEntries;
		_timer5min = diag_tickTime + 300;
	};
};
