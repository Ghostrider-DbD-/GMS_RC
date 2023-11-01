
uiSleep 5;
diag_log format["<<  ----  START TEST Crate Loading ---- >>"];
_coords = [12000,12000,0];
//_loot = GMS_supportLoot; //[causes problems] GMS_highPoweredLoot;  // [causes problems] GMS_contructionLoot ; //GMS_BoxLoot_Orange;
_loot = GMS_BoxLoot_Orange;
_lootCounts = [100,100,100,100,100,100];
_aiDifficultyLevel = "Orange";
for "_i" from 1 to 100 do
{
	diag_log format["testCrateLoading: pass %1",_i];
	_crateType = selectRandom GMS_crateTypes;
	_crate = [_coords,_crateType] call GMS_fnc_spawnCrate;
	[_crate,_loot,_lootCounts] call GMS_fnc_fillBoxes;
	//uiSleep 0.1;
	diag_log format["testCrateLoading:  crate inventory = %1",getItemCargo _crate];
};

