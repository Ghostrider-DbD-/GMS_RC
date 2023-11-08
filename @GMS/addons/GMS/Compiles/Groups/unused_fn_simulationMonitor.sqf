/*
	GMS_fnc_simulationMonitor

	Managages simulation using blckeagls logic 	
	By Ghostrider-GRG-

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
//  TODO: Move Simulation Management to GMSCore
if (GMS_simulationManager isEqualTo GMS_simulationManagementOff) exitWith {};

if (GMS_simulationManager isEqualTo GMS_useDynamicSimulationManagement) exitWith 
{
	// wake groups up if needed.
	{
		private _group = _x;
		private _nearplayer = [getPosATL (leader _group),GMS_simulationEnabledDistance] call GMSCore_fnc_nearestPlayers;	
		if !(_nearPlayer isEqualTo []) then 
		{
			_group reveal [(_nearplayer select 0),(_group knowsAbout (_nearPlayer select 0)) + 0.001];  //  Force simulation on
		};
	} forEach GMS_monitoredMissionAIGroups;
};

if (GMS_simulationManager isEqualTo GMS_useGMS_SimulationManager) then
{
	{
		private _group = _x;
		private _nearplayer = [getPosATL (leader _group),GMS_simulationEnabledDistance] call GMSCore_fnc_nearestPlayers;	
		if !(_nearplayer isEqualTo []) then
		{
			if !(simulationEnabled (leader _group)) then
			{	
				{
					_x enableSimulationGlobal  true;
					_x reveal [(_nearplayer select 0),(_group knowsAbout (_nearPlayer select 0)) + 0.001];   //  Force simulation on
				}forEach units _group;

				// GMSCore sets enableDynamicSimulation = false and enableSimulationGlobal = true for vehicles.
				//(objectParent (leader _group)) enableSimulationGlobal true; // enable simulation for the groups vehicle if there is one
			};
		}else{
			if (simulationEnabled (leader _group)) then
			{	
				{_x enableSimulationGlobal false} forEach units _group;		
				(objectParent (leader _group)) enableSimulationGlobal true; // enable simulation for the groups vehicle if there is one						
			};
		};
	} forEach GMS_monitoredMissionAIGroups;
};


