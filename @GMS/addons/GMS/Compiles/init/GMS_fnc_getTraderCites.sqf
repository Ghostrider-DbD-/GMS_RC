/*
	By Ghostrider [GRG]
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"

if ((toLowerANSI GMSCore_modtype) isEqualTo "epoch") then
{
	_blckListPrior = GMS_locationBlackList;
	private _config = configFile >> "CfgEpoch";
	private _configWorld = _config >> worldname;
	private _telePos = getArray(configFile >> "CfgEpoch" >> worldName >> "telePos" );
	{
		GMS_locationBlackList pushback [_x select 3, 1000];
	} foreach _telePos;
};

if ((tolower GMSCore_modtype) isEqualTo "exile") then
{
	private _traderCites = allMapMarkers;
	{
			if (getMarkerType _x isEqualTo "loc_meet" && GMS_blacklistTraderCities) then {
				GMS_locationBlackList pushback [(getMarkerPos _x),1500];
			};
				
			if ((getMarkerType _x isEqualTo "respawn_para") && GMS_blacklistSpawns) then {
				GMS_locationBlackList pushback [(getMarkerPos _x),1000];			
			};
			//  
			if (getMarkerType _x isEqualTo "ExileConcreteMixerZone" && GMS_listConcreteMixerZones) then {
				GMS_locationBlackList pushback [(getMarkerPos _x),1000];		
			};	
	}forEach _traderCites;
};
