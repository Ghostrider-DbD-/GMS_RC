

class CfgGMS3DEN 
{
	class CfgDefaults
	{
		objectAtMissionCenter = "RoadCone_L_F";
		minAI = 3;
		maxAI = 6;
		minPatroRadius = 30;
		maxPatrolRadius = 45;
		maxVehiclePatrolRadius = 75;
		aircraftPatrolRadius = 1000;
		oddsOfGarison = 0.67;
		maxGarrisonStatics = 3;
		typesGarrisonStatics = [];
		defaultMissionDifficulty = "Blue";
		defaultLootcrateSpawnTiming = "atMissionSpawnGround";
		defaultLootcrateLoadTiming = "atMissionSpawn";
		defaultMissionEndState = "allKilledOrPlayerNear";

		// Enter the string shown here under Atributes\Variable Name
		// to demarcate this vehicle as a loot vehicle
		lootVehicleVariableName = "lootVehicle";

		// Enter the string shown here under Atributes\Variable Name
		// To indicate that a garrison should be placed at standard Arma
		// building positions
		buildingPosGarrisonVariableName = "pos";

		// Enter the string shown here under Atributes\Variable Name
		// To indicate that a garrison should be placed using setPosATL
		// relative to the spawn position of the building
		buildingATLGarrisionVariableName = "atl";

		aiRespawnTime = 600;  // respawn time for infantry 
		vehicleRespawnTime = 900; // respawn time for vehicle patrols
		aircraftRespawnTime = 1200;	// respawn time for aircraft patrols

		// colors used to highlight garrison objects and loot objects 
		colorGarrisonObject = "#(argb,8,8,3)color(0,1,0,1)";  // Lime 
		colorLootObject = "#(argb,8,8,3)color(1,0,1,1)"; // Fucshia
	};

	/****************************************
		DO NOT TOUCH ANYTHING BELOW THIS LINE 
	*****************************************/
};



