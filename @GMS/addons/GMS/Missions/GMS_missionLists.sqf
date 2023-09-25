/*

	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

private["_pathBlue","_missionListBlue","_pathRed","_missionListRed","_pathGreen","_missionListGreen","_pathOrange","_missionListOrange"];
private _pathScouts = "Scouts";
private _missionListScouts = ["Scouts"];  // OK Build 224

private _pathHunters = "Hunters";
private _missionListHunters = ["Hunters"];  // OK Build 224

private _pathBlue = "Blue";
private _missionListBlue = [
		//"hostage1",  // OK
		//"captive1",  // OK
		"sniperBase",  // Spawns OK does not clear 249
		"survivalSupplies",  // Spawns OK Debug = 4 Build 246
		//"derbunker", // OK, an interesting mission, better as a red / green though
		//"forgotten_HQ",  //  ok BUT TOO TOUGH FOR BLUE OR RED
		//"garrison",  //  OK but do not use.
		//"IDAP",  //  OK but too difficult for a blue mission	
		"Service_point",  // OK build 224
		//"Toxin",  //  OK but too difficult for a blue mission
		"default"  //  Spawns OK Debug = 4 Build 246
		//"ForgottenHQ"
	];

private _pathRed = "Red";
private _missionListRed = [
		//"default",  //  OK Build 224
		//"medicalCamp",
		//"hostage1",
		//"captive1",
		"fuelDepot",  // Spawns OK Debug = 4 Build 246
		"junkyardWilly",  // Spawns OK Debug = 4 Build 246
		"TraderBoss",  // OK build 224
		"carThieves",   // Spawns OK Debug = 4 Build 246
		"Ammunition_depot",  //  Spawns OK Debug = 4 Build 246
		//"Camp_Moreell",
		//"charlston",
		//"dashq",
		//"derbunker",  // OK, better suited for green or orange mission
		//"factory",  //  Does not clear
		//"forgotten_HQ",
		//"garrison",
		"IDAP",  // Spawns OK But not sure where the crate spawns. 
		//"lager",
		//"Operations_Command",
		"Outpost",  //  Spawns OK Debug = 4 Build 246
		"Service_Point" //Spawns OK Debug = 4 Build 246
		//"tko_camp",  
		//"Toxin" //  Spawns OK Debug = 4 Build 246
	];

private _pathGreen = "Green";
private _missionListGreen = [/*"default","default2",/*"medicalCamp","redCamp","resupplyCamp","banditVillage",*/
		"FieldCamp",  //  Spawns OK Build 246 Debug == 4
		"FieldHQ",  // Spawns OK Build 246 Debug == 4
		//"weaponsResearch",  // OK build 224
		//"munitionsResearch"  // Spawns OK Build 246 Debug == 4
		//"colonelsBase",  //  OK Build 224
		"factory",  //  Spawns with some walls above ground level for unclear reasons.
		"fortification",  //  Spawns OK Debug = 4 Build 246
		//"banditVillage",  //  OK but do not use.
		"Camp_Moreell",  // Spawns OK Build 246 Debug == 4
		//"charlston",  //  Spawns OK but crate glitched under a building
		//"derbunker",  //  OK
		//"forgotten_HQ",  // OK, but can't complete
		"lager"  //  Spawns OK but crate glitched under a building
		//"Operations_Command",  //  OK  bEST SUITED FOR GREEN/ORANGE // Nees R3F or crate spawned by parachute at mission start
		//"Outpost",  // OK
		//"tko_camp"  // OK
		//"factory"
	];

private _pathOrange = "Orange";
private _missionListOrange = [/*"default","default2","medicalCamp","redCamp","resupplyCamp","officeComplex",*/
		"CommandersComplex",  //   Spawns OK Debug = 4 Build 246
		"generalsCamp",  // Spawns OK Debug = 4 Build 246
		//"colonel2",  // Spawns OK Debug = 4 Build 246
		//"stronghold",  //   Spawns OK Debug = 4 Build 246  but too big for the Exile.Altis server as of Build 253
		"operationShutdown",  //  Spawns OK Debug = 4 Build 246
		"operationTakeover",  //  Spawns OK Debug = 4 Build 246
		"dashq",  // OK Build 252
		"derbunker", // Spawns OK Build 252
		//"Ammunition_depot"  // OK Build 252; need to update vics, only  12 AI for some reason
		//"Camp_Moreell"  // OK Build 252 with crate drop from 50 meters
		//"Operations_Command"  // OK Build 252
		"tko_camp"  // // OK Build 252
		/////  UNUSED FOR ONE REASON OR ANOTHER
		//"Outpost"  // dOES NOT COMPLETE, ODD LOOT CHEST PLACEMENT	
		/*,"temple"*/
	];

private _pathStatics = "Statics";
private _missionListStatics = [
	/// The format for these is filename 
	/// Do NOT include the extension here.
	/// You will need to add the mission files to the statics folder. 
	"saltflatsone"

];

private _pathUMS = "UMS\dynamicMissions";
private _missionListUMS = ["default"];

private _pathHeliCrashes = "HeliCrashes";
