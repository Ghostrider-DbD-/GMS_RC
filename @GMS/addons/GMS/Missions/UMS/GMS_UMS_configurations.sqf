/*
	by Ghostrider [GRG]

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"

GMS_UMS_uniforms = 
[
	"U_I_Wetsuit",
	"U_O_Wetsuit",
	"U_B_Wetsuit"
];

GMS_UMS_headgear = 
[
	"G_Diving",
	"G_B_Diving",
	"G_O_Diving",
	"G_I_Diving"
];

GMS_UMS_vests = 
[
	"V_RebreatherB",
	"V_RebreatherIA",
	"V_RebreatherIR"
];

GMS_UMS_weapons = 
[
	"arifle_SDAR_F"
];

if ((tolower GMSCore_modtype) isEqualTo "exile") then
{
	GMS_UMS_submarines =
	[
		
		"Exile_Boat_SDV_CSAT",
		"Exile_Boat_SDV_Digital",
		"Exile_Boat_SDV_Grey"
	];
	
	GMS_UMS_crates =	["Exile_Container_SupplyBox"];
};
if ((tolower GMSCore_modtype) isEqualTo "epoch") then
{
	GMS_UMS_submarines = ["B_SDV_01_EPOCH"];
	GMS_UMS_crates = GMS_crateTypes;
	//GMS_UMS_crates = ["container_epoch"];	
};
if ((toLower GMSCore_modtype) isEqualTo "default") then 
{
	GMS_UMS_submarines =
	[
		
		"Exile_Boat_SDV_CSAT",
		"Exile_Boat_SDV_Digital",
		"Exile_Boat_SDV_Grey"
	];
	
	GMS_UMS_crates = GMS_crateTypes;

};

GMS_UMS_unarmedSurfaceVessels = 
[
	"B_Boat_Transport_01_F",
	"I_Boat_Transport_01_F"
];
GMS_UMS_armedSurfaceVessels =
[
	"B_Boat_Armed_01_minigun_F",
	"I_Boat_Armed_01_minigun_F"	
];
GMS_UMS_surfaceVessels = GMS_UMS_unarmedSurfaceVessels + GMS_UMS_armedSurfaceVessels;
GMS_UMS_shipWrecks =
[
	"Land_Boat_06_wreck_F",
	"Land_Boat_05_wreck_F",
	"Land_Boat_04_wreck_F",
	"Land_Boat_02_abandoned_F",
	"Land_Boat_01_abandoned_red_F",
	"Land_Boat_01_abandoned_blue_F"
];
