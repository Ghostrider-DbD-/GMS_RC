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
private _missionListScouts = ["Scouts"];

private _pathHunters = "Hunters";
private _missionListHunters = ["Hunters"];

private _pathBlue = "Blue";
private _missionListBlue = [
		//"sniperBase",
		"survivalSupplies",  
		"Service_point"
	];

private _pathRed = "Red";
private _missionListRed = [
		"fuelDepot",
		"junkyardWilly",
		"TraderBoss", 
		"carThieves"
	];

private _pathGreen = "Green";
private _missionListGreen = [/*"default","default2",/*"medicalCamp","redCamp","resupplyCamp","banditVillage",*/
		"munitionsResearch",
		"fortification" 
	];

private _pathOrange = "Orange";
private _missionListOrange = [/*"default","default2","medicalCamp","redCamp","resupplyCamp","officeComplex",*/
		/*
		"CommandersComplex", // ***
		"generalsCamp",
		"colonel2",
		"operationShutdown",
		"operationTakeover",
		"dashq",  
		"tko_camp"  
		*/
		//"researchComplex"
		"survivalSupplies"
	];

private _pathStatics = "Statics";
private _missionListStatics = [
	/// The format for these is filename 
	/// Do NOT include the extension here.
	/// You will need to add the mission files to the statics folder. 
	//"spatzle",
	"saltflatsone"
];

private _pathUMS = "UMS\dynamicMissions";
private _missionListUMS = ["default"];

private _pathHeliCrashes = "HeliCrashes";
