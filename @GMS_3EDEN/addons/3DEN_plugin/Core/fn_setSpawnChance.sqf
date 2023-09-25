/*
	GMS 3EDEN Editor Plugin
	by Ghostrider-GRG-
	Copyright 2020
	
	sets a variable that specifies the chance that a mission will be spawned.
	this variable is read when the mission is exported and saved in _chanceMissionSpawned.
*/
params["_chance"];
GMS_chanceMissionSpawned = _chance;
diag_log format["_setSpawnChance: GMS_chanceMissionSpawned set to %1",GMS_chanceMissionSpawned];