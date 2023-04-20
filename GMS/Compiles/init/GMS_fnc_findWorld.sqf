/*
	Determine the map name, set the map center and size, and return the map name.
	Trader coordinates were pulled from the config.cfg
	Inspired by the Vampire and DZMS
	Last Modified 9/3/16
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/


	Notes: 
	Setting GMS_maxSeaSearchDistance = 0; 
	Prevents these missions from being spawned.
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

diag_log format["[GMS] Loading Map-specific settings with worldName = %1",worldName];
switch (toLowerANSI worldName) do 
{// These may need some adjustment - including a test for shore or water should help as well to avoid missions spawning on water.
		case "altis":{GMS_mapCenter = [12000,10000,0]; GMS_mapRange = 25000; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = 20000;};
		case "stratis":{GMS_mapCenter = [3900,4500,0]; GMS_mapRange = 4500; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = 5000;}; 
		case "tanoa":{GMS_mapCenter = [9000,9000,0];  GMS_mapRange = 10000; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = 10000;};
		case "malden":{	GMS_mapCenter = [6000,7000,0];	GMS_mapRange = 6000; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = 5500;};		
		case "enoch":{GMS_mapCenter = [6500,6000,0];  GMS_mapRange = 5800; GMS_maxGradient = 0.20; GMS_maxSeaSearchDistance = 20000;};
		case "gm_weferlingen_summer":{GMS_mapCenter = [10000,10000,0];	GMS_mapRange = 10000; GMS_maxGradient = 0.20; GMS_maxSeaSearchDistance = 0};
		case "gm_weferlingen_winter":{GMS_mapCenter = [10000,10000,0];	GMS_mapRange = 10000; GMS_maxGradient = 0.20; GMS_maxSeaSearchDistance = 0;};
		case "chernarus":{GMS_mapCenter = [7100, 7750, 0]; GMS_mapRange = 5300; GMS_maxGradient = 0.20; GMS_maxSeaSearchDistance = 6000;};	
		case "namalsk":{GMS_mapCenter = [5700, 8700, 0]; GMS_mapRange = 10000; GMS_maxGradient = 0.20; GMS_maxSeaSearchDistance = 5000;};		
		case "chernarus_summer":{GMS_mapCenter = [7100, 7750, 0]; GMS_mapRange = 6000; GMS_maxGradient = 0.20; GMS_maxSeaSearchDistance = 6000;}; 
		case "chernarus_winter":{GMS_mapCenter = [7100, 7750, 0]; GMS_mapRange = 6000; GMS_maxGradient = 0.20; GMS_maxSeaSearchDistance = 6000;}; 
		case "cup_chernarus_a3":{GMS_mapCenter = [7100, 7750, 0]; GMS_mapRange = 6000; GMS_maxGradient = 0.20; GMS_maxSeaSearchDistance = 6000;};
		case "bornholm":{GMS_mapCenter = [11240, 11292, 0];GMS_mapRange = 14400; GMS_maxGradient = 0.20; GMS_maxSeaSearchDistance = GMS_mapRange;};
		case "esseker":{GMS_mapCenter = [6049.26,6239.63,0]; GMS_mapRange = 6000; GMS_maxGradient = 0.20; GMS_maxSeaSearchDistance = 0;};
		case "taviana":{GMS_mapCenter = [10370, 11510, 0];GMS_mapRange = 14400; GMS_maxGradient = 0.20; GMS_maxSeaSearchDistance = GMS_mapRange;};
		case "napf": {GMS_mapCenter = [10240,10240,0]; GMS_mapRange = 14000; GMS_maxGradient = 0.30; GMS_maxSeaSearchDistance = 12000;};  
		case "australia": {GMS_mapCenter = [20480,20480, 150];GMS_mapRange = 40960; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = GMS_mapRange;};
		case "panthera3":{GMS_mapCenter = [4400, 4400, 0];GMS_mapRange = 4400; GMS_maxGradient = 0.40;GMS_maxSeaSearchDistance = GMS_mapRange;};
		case "isladuala":{GMS_mapCenter = [4400, 4400, 0];GMS_mapRange = 4400; GMS_maxGradient = 0.40;GMS_maxSeaSearchDistance = GMS_mapRange;};
		case "sauerland":{GMS_mapCenter = [12800, 12800, 0];GMS_mapRange = 12800; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = 0;};
		case "trinity":{GMS_mapCenter = [6400, 6400, 0];GMS_mapRange = 6400; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = GMS_mapRange;};
		case "utes":{GMS_mapCenter = [3500, 3500, 0];GMS_mapRange = 3500; GMS_maxGradient = 0.20;};
		case "zargabad":{GMS_mapCenter = [4096, 4096, 0];GMS_mapRange = 4096; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = 0;};
		case "fallujah":{GMS_mapCenter = [3500, 3500, 0];GMS_mapRange = 3500; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = 0;};
		case "tavi":{GMS_mapCenter = [10370, 11510, 0];GMS_mapRange = 14090; GMS_maxGradient = 0.40; GMS_maxSeaSearchDistance = 12000;};
		case "lingor":{GMS_mapCenter = [4400, 4400, 0];GMS_mapRange = 4400; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = GMS_mapRange;};	
		case "takistan":{GMS_mapCenter = [5500, 6500, 0];GMS_mapRange = 5000; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = 0;};
		case "lythium":{GMS_mapCenter = [10000,10000,0];GMS_mapRange = 8500; GMS_maxGradient = 0.30; GMS_maxSeaSearchDistance = 0;};
		case "vt7": {GMS_mapCenter = [9000,9000,0]; GMS_mapRange = 9000; GMS_maxGradient = 0.20;};		
		case "rof_mok": {
			GMS_mapCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"); 
			GMS_mapRange = worldsize /2;
			GMS_maxGradient = 0.40;		
			GMS_maxSeaSearchDistance =  worldsize / 2;
			[format["worldName / center / worldsize / and range set for %1 / %2 / %3",worldName,GMS_mapCenter,worldSize,GMS_mapRange]] call GMS_fnc_log;
		};
		default {GMS_mapCenter = [6322,7801,0]; GMS_mapRange = 6000; GMS_maxGradient = 0.20;GMS_maxSeaSearchDistance = GMS_mapRange;};
};