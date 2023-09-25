

class cfg3DEN 
{
	class EventHandlers 
	{
		class gms3DEN 
		{
			OnMissionLoad = "diag_log format['Mission loaded at %1',diag_tickTime]; call gms3DEN_fnc_initialize";
			OnMissionNew  = "diag_log format['New Mission Created at %1',diag_tickTime]; call gms3DEN_fnc_initialize";
			//onHistoryChange = "call gms3DEN_fnc_updateObjects";
		};
	};
	
	class Attributes 
	{
		class Default;
		class Title: Default 
		{
			class Controls 
			{
				class Title;
			};
		};
		class CheckBox: default{
			class Controls 
			{
				class Title;
				class Value;
			};
		};
	};
	class Object
	{
		class AttributeCatories 
		{
			class gmsAttributes 
			{
				displayName = "GMS Settings";
				collapsed = 1; 
				class Attributes 
				{
					class lootVehicle 
					{
						displayName = "Loot Vehicle";
						toolTip = "Set as Loot Vehicle";
						property = "gmsLootVehicle";
						control = "CheckBox";
						defaultValue = "false";
						condition = "objectVehicle";
					};
				};
			};
		};
	};
};