
class CfgFunctions
{
	class gms3DEN
	{
		class Export
		{
			file = "3DEN_plugin\Export";

			//class exportStatic {};
		};

		class Core 
		{
			file = "3DEN_plugin\Core";

			class about {};
			class buildingContainer {};
			class configureGarrisonATL {};
			class display {};			
			class displayGarrisonMarkers {};
			class displayLootMarkers {};
			class exportDynamic {};		
			class garrisonApplyChanges {};	
			class initialize {};
			class initializeAttributes {};
			class isInfantryUnit {};
			class isInVehicle {};
			class isInside {};
			class onAttributeLoadGarrison {};
			class onAttributeLoadGarrisonColor {};
			class onAttributeLoadLootVeh {};
			class onAttributeLoadLootVehColor {};
			class onAttributeSaveGarrison {};
			class onAttributeSaveGarrisonColor {};
			class onAttributeSaveLootVeh {};	
			class onDrag {};
			class onLoadGarrison {};
			class onLoadGarrisonColor {};
			class onLoadLootVeh {};			
			class onLoadLootVehColor {};
			class onRegistered {};
			class onUnregister {};
			class removeMarker {};
			class setDifficulty {};
			class setCompletionMode {}
			class setGarrison {};
			class setLoadCratesTiming {};			
			class setLootVehColor {};
			class setMaxAI {}; 
			class setMinAI {};
			class setSpawnChance {};
			class setSpawnLocations {};
			class spawnCratesTiming {};
            class versionInfo {};
		};
	};
};