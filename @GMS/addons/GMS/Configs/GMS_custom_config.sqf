	
/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	Last Modified 3-14-17
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

["[GMS]  Loading Custom Configurations 11/14//20"] call GMS_fnc_log;

switch (toLower (worldName)) do
{
	case "altis":
	{
		/*
		GMS_cleanupCompositionTimer = 30;
		GMS_AliveAICleanUpTimer = 30;
		GMS_vehicleDeleteTimer = 30;
		GMS_maxSpawnedMissions = 15;

		GMS_TMin_Blue = 7;
		GMS_TMin_Red = 10;
		GMS_TMin_Green = 13;	
		GMS_TMin_Orange = 16;	
		GMS_TMin_Hunter = 20;
		GMS_TMin_Scouts = 20;
		GMS_TMin_Crashes = 5;
		GMS_TMin_UMS = 20;
		//Maximum Spawn time between missions in seconds
		GMS_TMax_Blue = 12;
		GMS_TMax_Red = 15;
		GMS_TMax_Green = 17;
		GMS_TMax_Orange = 21;
		GMS_TMax_Hunter = 22;
		GMS_TMax_Scouts = 22;
		GMS_TMax_Crashes = 15;
		GMS_TMax_UMS = 25;	
		*/	
	};
	case"tanoa": 
	{
		GMS_maxCrashSites = 2;
	};
	case"namalsk": 
	{
		private ["_arr","_sunrise","_sunset","_time"];
		_arr = date call BIS_fnc_sunriseSunsetTime;
		_sunrise = _arr select 0;
		_sunset = _arr select 1;
		_daylight = _sunset - _sunrise;
		_nightTime = abs(24 - _daylight);
		_time = dayTime;
		_serverUpTime = 8;
		GMS_enableOrangeMissions = 0;  
		GMS_enableGreenMissions = 1;
		GMS_enableRedMissions = 0;
		GMS_enableBlueMissions = 0;
		GMS_enableHunterMissions = 0;
		GMS_enableScoutsMissions = 0;
		GMS_maxCrashSites = -1;  // recommended settings: 3 for Altis, 2 for Tanoa, 1 for smaller maps. Set to -1 to disable
		
		GMS_timeAcceleration = true; // When true, time acceleration will be periodically updated based on amount of daylight at that time according to the values below.
		GMS_timeAccelerationDay = 1.5;  // Daytime time accelearation
		GMS_timeAccelerationDusk = 6; // Dawn/dusk time accelearation
		GMS_timeAccelerationNight = (12);  // Nighttim time acceleration	

		GMS_MinDistanceFromMission = 500;
		GMS_minDistanceToBases = 300;
		GMS_minDistanceToPlayer = 300;
		GMS_minDistanceFromTowns = 100;		
	};
	case "esseker": 
	{
		GMS_numberUnderwaterDynamicMissions = -1;		
	};
	case "panthera3":
	{
		GMS_maxCrashSites = 2;
	
	};
	case "malden":
	{

		GMS_enableOrangeMissions = 1;  
		GMS_enableGreenMissions = 1;
		GMS_enableRedMissions = 1;
		GMS_enableBlueMissions = 1;
		GMS_numberUnderwaterDynamicMissions = 3;	
		GMS_enableHunterMissions = 1;
		GMS_enableScoutsMissions = 1;
		GMS_maxCrashSites = 3; 		
	};	
	case "lythium": 
	{
		GMS_enableOrangeMissions = 1;  
		GMS_enableGreenMissions = 1;
		GMS_enableRedMissions = 1;
		GMS_enableBlueMissions = 1;
		GMS_enableHunterMissions = 1;
		GMS_enableScoutsMissions = 1;
		GMS_maxCrashSites = 3;	
		GMS_numberUnderwaterDynamicMissions = -1;	
	};
	case "enoch":
	{
		GMS_timeAcceleration = true; // When true, time acceleration will be periodically updated based on amount of daylight at that time according to the values below.
		GMS_timeAccelerationDay = 5.7;  // Daytime time accelearation
		GMS_timeAccelerationDusk = 7; // Dawn/dusk time accelearation
		GMS_timeAccelerationNight = 8;  // Nighttim time acceleration	
		GMS_enableOrangeMissions = 1;  
		GMS_enableGreenMissions = 1;
		GMS_enableRedMissions = 1;
		GMS_enableBlueMissions = 1;
		GMS_enableHunterMissions = 1;
		GMS_enableScoutsMissions = 1;
		GMS_maxCrashSites = 0;	
		GMS_numberUnderwaterDynamicMissions = 1;	
	};
};

["[GMS]  End of map-specific block of Custom Configurations 11/14/20"] call GMS_fnc_log;

GMS_customConfigsLoaded = 1;

uiSleep 5;

if (GMS_debugLevel > 0) then {
	
	//GMS_MinDistanceFromMission = 1000;
    //GMS_minDistanceToBases = 100;
    //GMS_minDistanceToPlayer = 1000;
    //GMS_minDistanceFromTowns = 100;
	//GMS_preciseMapMarkers = true;
	//GMS_MissionTimeout = 120;
	GMS_cleanupCompositionTimer = 30;
	GMS_AliveAICleanUpTimer = 30;
	GMS_bodyCleanUpTimer = 30;
	GMS_vehicleDeleteTimer = 30;
	//GMS_maxSpawnedMissions = 15;
	//GMS_mainThreadUpdateInterval = 10;
	GMS_launchersPerGroup = 1;

	GMS_enableOrangeMissions = 1;  
	GMS_enableGreenMissions = 1; // 10-02-2023 Tested with mission list= "FieldCamp", "FieldHQ", "factory", "fortification", "Camp_Moreell", "lager"
	GMS_enableRedMissions = 1;   // 10-2-2023 Tested with mission list= "fuelDepot", "junkyardWilly", "TraderBoss", "carThieves", "Ammunition_depot", "IDAP", "Outpost", "Service_Point"
	GMS_enableBlueMissions = 1;  // 10-2-2023 Tested with mission list= "sniperBase", "survivalSupplies", "Service_point", and "default"
	GMS_numberUnderwaterDynamicMissions = 0;	
	GMS_enableHunterMissions = 1;
	GMS_enableScoutsMissions = 1;
	GMS_enableStaticMissions = 5;
	GMS_maxCrashSites = 0; 

	GMS_noPatrolHelisBlue = 0;
	GMS_noPatrolHelisRed = 1;
	GMS_noPatrolHelisGreen = 1;
	GMS_noPatrolHelisOrange = 1;

	GMS_chanceParaBlue = 0; // [0 - 1] set to 0 to deactivate and 1 to always have paratroops spawn over the center of the mission. This value can be a range as well [0.1,0.3]
	GMS_noParaBlue = 0; //  [1-N]	

	GMS_SpawnVeh_Orange = 2; // Number of static weapons at Orange Missions
	GMS_SpawnVeh_Green = 2; // Number of static weapons at Green Missions
	GMS_SpawnVeh_Blue = 1;  // Number of static weapons at Blue Missions
	GMS_SpawnVeh_Red = 0;  // Number of static weapons at Red Missions

	GMS_SpawnEmplaced_Orange = 2; // Number of static weapons at Orange Missions
	GMS_SpawnEmplaced_Green = 2; // Number of static weapons at Green Missions
	GMS_SpawnEmplaced_Blue = 1;  // Number of static weapons at Blue Missions
	GMS_SpawnEmplaced_Red = 1;  // Number of static weapons at Red Missions	

	GMS_MinAI_Orange = 20;
	GMS_MaxAI_Orange = 25;
	GMS_AIGrps_Orange = 5;

	GMS_MinAI_Green = 16;
	GMS_MaxAI_Green = 21;
	GMS_AIGrps_Green = 3;

	GMS_MinAI_Red = 12;
	GMS_MaxAI_Red = 15;
	GMS_AIGrps_Red = 3;

	GMS_MinAI_Blue = 3;	
	GMS_MaxAI_Blue = 6;
	GMS_AIGrps_Blue = 2;

	GMS_TMin_Blue = 7;
	GMS_TMin_Red = 10;
	GMS_TMin_Green = 13;	
	GMS_TMin_Orange = 16;	
	GMS_TMin_Hunter = 60;
	GMS_TMin_Scouts = 45;
	GMS_TMin_Crashes = 5;
	GMS_TMin_UMS = 20;
	GMS_TMin_Statics = 400;  // minimum time for RESPAWN of static missions
	//Maximum Spawn time between missions in seconds
	GMS_TMax_Blue = 12;
	GMS_TMax_Red = 15;
	GMS_TMax_Green = 17;
	GMS_TMax_Orange = 21;
	GMS_TMax_Hunter = 120;
	GMS_TMax_Scouts = 20;
	GMS_TMax_Crashes = 15;
	GMS_TMax_UMS = 25;
	GMS_TMax_Statics = GMS_TMin_Statics + 10; // Maximum time for RESAPWN of static missions
											  // Be sure the minimum is > than the time at which objects from the previous instance of a static mission are deleted 
											  // That is set in GMS_cleanupCompositionTimer
/*
	// Reduce to 1 sec for immediate spawns, or longer if you wish to space the missions out	
	GMS_TMin_Orange = 480;
	GMS_TMin_Green = 420;
	GMS_TMin_Blue = 300;
	GMS_TMin_Red = 360;
	GMS_TMin_UMS = 300;	
	GMS_TMin_Statics = 60 * 35;  // minimum time for RESPAWN of static missions

	#ifdef GRGserver
	GMS_TMin_Hunter = 340;
	GMS_TMin_Scouts = 300;
	GMS_TMin_Crashes = 300;
	#endif
	
	//Maximum Spawn time between missions in seconds
	GMS_TMax_Orange = 560;
	GMS_TMax_Green = 500;
	GMS_TMax_Blue = 360;
	GMS_TMax_Red = 420;
	GMS_TMax_UMS = 400;
	GMS_TMax_Statics = GMS_TMin_Statics + 60; // Maximum time for RESAPWN of static missions
											  // Be sure the minimum is > than the time at which objects from the previous instance of a static mission are deleted 
											  // That is set in GMS_cleanupCompositionTimer

	#ifdef GRGserver
	GMS_TMax_Hunter = 400;
	GMS_TMax_Scouts = 360;
	GMS_TMax_Crashes = 360;
	#endif
*/
	["Custom Configs <DEBUG LEVEL > 0> Custom mission timers loaded"] call GMS_fnc_log;
};