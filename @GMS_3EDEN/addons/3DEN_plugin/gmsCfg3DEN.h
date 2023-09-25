/*
	
*/

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
		class CheckBox; 
		class gms3DENCheckboxLootVehControl: CheckBox 
		{
			/*
				Use on: Display, Control
				Fired on: Fires when UI container is created, but no action is taken. The onLoad event for display fires after the onLoad events for all controls it contains are fired.
				Returns: Display or control, for controls it also returns the control's config (since
				Arma 3 logo black.png
				1.56
				).

				params ["_displayOrControl", ["_config", configNull]];			
			*/
			
			onload = "\
				params ['_displayOrControl', ['_config', configNull]];\
				diag_log format['_displayControl = %1 | _config = %2',_displayControl,_config];\
				[] call gms3DEN_fnc_onLoadLootVeh;\
				";
			//onUnload = "diag_log 'onUnload for loot veh'";
			AttributeLoad = "\
				_checked = switch (true) do {\
					case (_value isequaltype 0): {([false,true] select (_value max 0 min 1))};\
					case (_value isequaltype ''): {([false,true] select ((parsenumber _value) max 0 min 1))};\
					default {_value};\
				};\
				(_this controlsGroupCtrl 100) cbsetchecked _checked;\
				diag_log format['onAttributeLoad:lootVehControl: _checked = %1',_checked];\
				";
			AttributeSave = "\
				cbchecked (_this controlsGroupCtrl 100);\
				diag_log format['onattributesave:lootVehControl: _checked = %1',cbchecked (_this controlsGroupCtrl 100)];\
				";
		};
		class gms3DENCLootVehicleColorControl: CheckBox 
		{
			onload = "\
				params ['_displayOrControl', ['_config', configNull]];\
				diag_log format['_displayControl = %1 | _config = %2',_displayControl,_config];\
				[] call gms3DEN_fnc_onLoadLootVehColor;\
			";
			//onUnload = "diag_log 'onUnload for loot veh'";
			AttributeLoad = "\
					_checked = switch (true) do {\
						case (_value isequaltype 0): {([false,true] select (_value max 0 min 1))};\
						case (_value isequaltype ''): {([false,true] select ((parsenumber _value) max 0 min 1))};\
						default {_value};\
				};\
				(_this controlsGroupCtrl 100) cbsetchecked _checked;\
				diag_log format['onAttributeLoad:lootVehControlColor: _checked = %1',_checked];\
				";
			AttributeSave = "\
				cbchecked (_this controlsGroupCtrl 100);\
				diag_log format['onattributesave:lootVehColorControl: _checked = %1',cbchecked (_this controlsGroupCtrl 100)];\
				[cbchecked (_this controlsGroupCtrl 100)] call gms3DEN_fnc_setLootVehColor;\
			";
		};		
	};
	class Object 
	{
		class AttributeCategories 
		{
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
						condition = "objectVehicle ";
						expression = "_this setVariable ['%s',_value];";	
						defaultValue = "false";	
					};
					class lootVehicleColorAttribute 
					{
						displayName = "Color On";
						tooltip = "Check box to color this loot vehicle";
						property = "gmsLootVehicleColor";
						control = "gms3DENCLootVehicleColorControl";
						condition = "objectVehicle ";
						expression = "_this setVariable ['%s',_value];";	
						defaultValue = "false";							
					};
				};
			};
		};			
	};	
};