class Default;
class Title: Default
{
	class Controls 
	{
		class Title;
	};
};
class RscCheckBox;
class Checkbox;

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
	class Mission 
	{
		class gms3DENmissionSettings 
		{
			displayName = "Mission Settings";
			// display = "Display3DENEditAttributesPreview"; // Optional - display for attributes window. Must have the same structure and IDCs as the default Display3DENEditAttributes 
			class AttributeCategories 
			{
				class gms3DENCategory 
				{
					class Attributes 
					{
						class missionStartMessage  
						{
							property = "gmsMissionStartMessage";
						};
						class missionEndMessage 
						{
							property = "gmsMissionEndMessage";
						};
						class missionDifficulty 
						{
							property = "gmsMissionDifficulty";
						};
					};
				};
			};
		};
	};
	class Attributes 
	{

		class gms3DENCheckBoxGarrisonsControl: Title
		{
			onload = "call gms3DEN_fnc_onLoadGarrison;";
			onUnload = "diag_log 'onUnload for garrisons'";
			onCheckedChanged = "diag_log format['onCheckedChanged %1',_this];";
			attributeLoad = "(_this controlsGroupCtrl 100) ctrlSetText _value; [_this,_value] call gms3DEN_fnc_onAttributeLoadGarrison;";
			attributeSave = "[cbChecked (this controlsGroupCtrl 100)] call gms3DEN_fnc_onAttributeSaveGarrison;"; 
						
			class Controls: Controls 
			{
				class Title: Title {};
				class Value: CheckBox {};
			};

		};
		class gmsGarrisonColorControl: Title
		{
			onload = "call gms3DEN_fnc_onLoadGarrisonColor;";
			//onUnload = "diag_log 'onUnload for garrisons'";
			attributeLoad = "[_this,_value] call gms3DEN_fnc_onAttributeLoadGarrisonColor;";
			attributeSave = "[_this,_value] call gms3DEN_fnc_onAttributeSaveGarrisonColor;"; 
			class Controls: Controls 
			{
				class Title: Title {};
				class Value: CheckBox
				{ 
					idc = 101;
				};
			};
		};		
		class gms3DENCheckboxLootVehControl: Title 
		{
			onload = "call gms3DEN_fnc_onLoadLootVeh;";
			//onUnload = "diag_log 'onUnload for loot veh'";
			onAttributeLoad = "[_this,_value] call gms3DEN_fnc_onAttributeLoadLootVeh;";
			onAttributeSave = "[_this,_value] call gms3DEN_fnc_onAttributeSaveLootVeh;";
			class Controls: Controls 
			{
				class Title: Title {};
				class Value: CheckBox
				{ 
					idc = 102;
				};
			};
		};
		class gms3DENCLootVehicleColorControl: Title 
		{
			onload = "call gms3DEN_fnc_onLoadLootVehColor;";
			//onUnload = "diag_log 'onUnload for loot veh'";
			onAttributeLoad = "[_this,_value] call gms3DEN_fnc_onAttributeLoadLootVehColor;";
			onAttributeSave = "[_this,_value] call gms3DEN_fnc_onAttributeSaveLootVeh;";
			class Controls: Controls 
			{
				class Title: Title {};
				class Value: CheckBox
				{ 
					idc = 103;
				};
			};
		};		
	};

	class Object 
	{
		class AttributeCategories 
		{
			class gms3DENgarrisonedAttribute
			{
				displayName = "Garrisons";
				collapsed = 1;				
				class Attributes 
				{
					class GarrisonedAttribute 
					{
						displayName = "Garrison";
						tooltip = "Mark as part of a garrison";
						property = "gmsIsGarrison";
						control = "gms3DENCheckBoxGarrisonsControl";
						//condition = "";
						expression = "_this setVariable ['%s',_value];";							
						defaultValue = "false";
					};
					class GarrisonedColorAttribute 
					{
						displayName = "Color On";
						tooltip = "Check to color this garrisoned object"
						property = "gmsGarrisonColor";
						control = "gmsGarrisonColorControl";
						//condition = "";
						expression = "_this setVariable ['%s',_value];";							
						defaultValue = "false";						
					};
				};
			};
			class gms3DENlootVehicles 
			{
				displayName = "Loot Vehicle";
				collapsed = 1;
				class Attributes 
				{
					class lootVehicleAttribute 
					{
						displayName = "Loot Vehicle";
						tooltip = "Set box to checked for loot vehicles";
						property = "gmsIsLootVehicle";
						control = "gms3DENCheckboxLootVehControl";
						//condition = "";
						expression = "_this setVariable ['%s',_value];";	
						defaultValue = "false";	
					};
					class lootVehicleColorAttribute 
					{
						displayName = "Color On";
						tooltip = "Check box to color this loot vehicle";
						property = "gmsLootVehicleColor";
						control = "gms3DENCLootVehicleColorControl";
						//condition = "";
						expression = "_this setVariable ['%s',_value];";	
						defaultValue = "false";							
					};
				};
			};
		};			
	};
};