/*
	for ghostridergaming
	By Ghostrider [GRG]
	Copyright 2016
	Last Modified 3-14-17
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"	

diag_log format ["Loading Exile-specific configs for Non-militarized servers: GMS_configs_exile.sqf"];
	
// list of locations that are protected against mission spawns

switch (toLower(worldName)) do
{
	case "altis": {
		GMS_locationBlackList append [
		//Add location as [[xpos,ypos,0],minimumDistance],
		// Note that there should not be a comma after the last item in this table
		[[10800,10641,0],1000]  // isthmus - missions that spawn here often are glitched.
		];
	};
	case "tanoa": {
		GMS_locationBlackList append [	];
	};
};
	
/*********************************************************************************

AI WEAPONS, UNIFORMS, VESTS AND GEAR

**********************************************************************************/
	
	GMS_blacklistSpawns = true;
	GMS_listConcreteMixerZones	= true;

	GMS_crateMoneyBlue = [100,250];
	GMS_crateMoneyRed = [175, 300];
	GMS_crateMoneyGreen = [300, 500];
	GMS_crateMoneyOrange = [500, 750];

	GMS_crateTypes = ["Box_FIA_Ammo_F","Box_FIA_Support_F","Box_FIA_Wps_F","I_SupplyCrate_F","Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F","IG_supplyCrate_F","Box_NATO_Wps_F","I_CargoNet_01_ammo_F","O_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F"];  // Default crate type.
			
	GMS_maximumItemPriceInAI_Loadouts = 1000;
	
	GMS_open_armed_vehicles = [
		//"nameNoGoodOpen",
		"Exile_Car_BTR40_MG_Green",
		"Exile_Car_HMMWV_M134_Green",
		"Exile_Car_HMMWV_M2_Green",
		"B_LSV_01_armed_F",
		"Exile_Car_Offroad_Armed_Guerilla01",		
		"B_G_Offroad_01_armed_F", 
		"O_G_Offroad_01_armed_F"		
	];
	
	GMS_lightlyArmed_ARMA3 = [
		//"nameNoGoodClosed",
		"B_MRAP_01_gmg_F", 
		"B_MRAP_01_hmg_F",
		"O_MRAP_02_gmg_F",  
		"O_MRAP_02_hmg_F",
		"I_MRAP_03_hmg_F", 
		"I_MRAP_03_gmg_F",
		"B_APC_Wheeled_01_cannon_F", 			
		"I_APC_Wheeled_03_cannon_F"	
	];

	GMS_light_AT_ARMA3 = [
		"O_G_Offroad_01_AT_F", 
		"B_G_Offroad_01_AT_F", 
		"O_T_LSV_02_AT_F", 
		"O_LSV_02_AT_F", 
		"B_T_LSV_01_AT_F", 
		"B_LSV_01_AT_F"
	];
	GMS_tracked_AA_ARMA3 = [
		"O_APC_Tracked_02_AA_F",
		"B_APC_Tracked_01_AA_F"	
	];
	GMS_tracked_APC_ARMA3 = [
		"B_APC_Tracked_01_rcws_F",
		//"B_APC_Tracked_01_CRV_F",
		"O_APC_Tracked_02_cannon_F", 
		"O_APC_Wheeled_02_rcws_F", 
		"I_APC_tracked_03_cannon_F"
	];

	GMS_Tanks_ARMA3 = [
		//"B_MBT_01_arty_F",
		//"B_MBT_01_mlrs_F",
		"B_MBT_01_TUSK_F",
		"O_MBT_02_cannon_F",
		//"O_MBT_02_arty_F",
		"I_MBT_03_cannon_F"
	];

	GMS_open_armed_CUP = [
		"CUP_I_Hilux_DSHKM_TK", 
		"CUP_I_Hilux_armored_DSHKM_TK", 	
		"CUP_I_Hilux_armored_igla_TK",	
		"CUP_O_Datsun_PK", 
		"CUP_B_HMMWV_M2_USMC", 
		"CUP_B_HMMWV_MK19_USMC",
		"CUP_B_LR_MG_CZ_W",
		"CUP_B_LR_MG_GB_W", 
		"CUP_B_LR_MG_GB_D", 
		"CUP_B_LR_Special_M2_GB_W", 
		"CUP_B_LR_Special_M2_GB_D", 
		"CUP_B_UAZ_MG_CDF",
		"CUP_O_UAZ_MG_CHDKZ"
	];

	GMS_closed_armed_CUP = [
		"CUP_BAF_Jackal2_L2A1_D", 
		"CUP_B_Mastiff_HMG_GB_D", 
		"CUP_B_Mastiff_HMG_GB_W"
	];

	GMS_APC_CUP = [
		"CUP_B_Mastiff_GMG_GB_D",  
		"CUP_B_Mastiff_HMG_GB_D",  
		"CUP_B_Ridgback_HMG_GB_D",  
		"CUP_B_Ridgback_GMG_GB_D",  
		"CUP_B_M1128_MGS_Desert",  
		"CUP_B_M1135_ATGMV_Desert_Slat",  
		"CUP_B_M1133_MEV_Desert_Slat",  
		"CUP_B_LAV25M240_desert_USMC",  
		"CUP_B_M1129_MC_MK19_Desert_Slat",  
		"CUP_B_LAV25_HQ_desert_USMC",  
		"CUP_B_BRDM2_ATGM_CDF",  
		"CUP_B_BTR60_CDF",  
		"CUP_B_M1130_CV_M2_Desert_Slat",  
		"CUP_B_M1126_ICV_MK19_Desert_Slat",  
		"CUP_O_BTR90_RU",  
		"CUP_O_GAZ_Vodnik_BPPU_RU",
		"CUP_B_M1126_ICV_M2_Desert",  
		"CUP_B_M1126_ICV_MK19_Desert",  
		"CUP_B_M1130_CV_M2_Desert",  
		"CUP_B_M1126_ICV_M2_Desert_Slat",  
		"CUP_B_M1133_MEV_Desert",  
		"CUP_O_GAZ_Vodnik_AGS_RU",  
		"CUP_O_GAZ_Vodnik_PK_RU"
	];

	GMS_Tanks_CUP = [
		"CUP_B_M2A3Bradley_USA_D",  
		//"CUP_B_M113_desert_USA",  
		//"CUP_B_M163_USA",  
		"CUP_B_M6LineBacker_USA_D",  
		"CUP_B_M1A1_DES_US_Army",  
		"CUP_B_M1A2_TUSK_MG_DES_US_Army",  
		//"CUP_B_AAV_USMC",  
		//"CUP_B_M270_DPICM_USA",  
		"CUP_B_ZSU23_CDF",  
		//"CUP_B_BMP2_CDF",  
		"CUP_B_T72_CDF",  
		//"CUP_I_T34_NAPA",  
		"CUP_B_Challenger2_NATO",  
		//"CUP_B_FV432_Bulldog_GB_D_RWS",  
		//"CUP_B_FV432_Bulldog_GB_D",  
		"CUP_B_FV510_GB_D_SLAT",  
		//"CUP_B_MCV80_GB_D_SLAT",  
		//"CUP_O_2S6_RU",  
		"CUP_O_BMP3_RU",  
		"CUP_O_T90_RU",  
		"CUP_O_T55_SLA"  //,  
		//"CUP_O_BMP1P_TKA",  
		//"CUP_B_M270_DPICM_USA",
		//"CUP_B_M2Bradley_USA_W",  
		//"CUP_B_FV510_GB_D",  
		//"CUP_B_MCV80_GB_D",  
		//"CUP_B_M7Bradley_USA_D",  
		//"CUP_O_2S6_RU",  
		//"CUP_O_BMP1_TKA""
	];

	
	GMS_AIPatrolVehicles = 
	[
	//"Exile_Car_Offroad_Armed_Guerilla01",
	//"Exile_Car_Offroad_Armed_Guerilla02",
	//"Exile_Car_BTR40_MG_Green",
	//"Exile_Car_BTR40_MG_Camo",
	//"Exile_Car_HMMWV_M134_Green",
	//"Exile_Car_HMMWV_M134_Desert",
	//"Exile_Car_HMMWV_M134_Desert",
	"Exile_Car_HMMWV_M2_Desert",
	"B_LSV_01_armed_F",
	//"_MRAP_02_gmg_ghex_F",
	//"O_MRAP_02_hmg_ghex_F",
	//"O_MRAP_03_gmg_ghex_F",
	//"O_MRAP_03_hmg_ghex_F",	
	"B_MBT_01_cannon_F",
	"B_MBT_01_cannon_F",	// Duplicate to increase chance that these will spawn relative to others
	//"B_MBT_01_mlrs_base_F",
	//"B_MBT_01_mlrs_F",
	"B_MBT_01_TUSK_F",
	"B_MBT_01_TUSK_F",// Duplicate to increase chance that these will spawn relative to others
	"B_APC_Tracked_01_AA_F",
	"B_APC_Tracked_01_AA_F",// Duplicate to increase chance that these will spawn relative to others
	"B_APC_Tracked_01_AA_F",// Duplicate to increase chance that these will spawn relative to others	
	//"B_APC_Tracked_01_CRV_F",
	"B_APC_Tracked_01_rcws_F"																						
	]; // Type of vehicle spawned to defend AI bases	

	
	GMS_AIPatrolVehicles = ["Exile_Car_Offroad_Armed_Guerilla01","Exile_Car_Offroad_Armed_Guerilla02","Exile_Car_BTR40_MG_Green","Exile_Car_BTR40_MG_Camo","Exile_Car_HMMWV_M134_Green","Exile_Car_HMMWV_M134_Desert",/*"Exile_Car_HMMWV_M134_Desert","Exile_Car_HMMWV_M2_Desert",*/"B_LSV_01_armed_F"]; // Type of vehicle spawned to defend AI bases	
	GMS_AIPatrolVehiclesBlue = GMS_open_armed_vehicles;
	GMS_AIPatrolVehiclesRed = GMS_lightlyArmed_ARMA3;
	GMS_AIPatrolVehiclesGreen = GMS_light_AT_ARMA3 + GMS_tracked_APC_ARMA3;
	GMS_AIPatrolVehiclesOrange = GMS_Tanks_ARMA3 + GMS_light_AT_ARMA3;

	// Use these if you wish to add CUP vehicles at missions from the lists above.
	//GMS_AIPatrolVehiclesBlue = GMS_AIPatrolVehiclesBlue + GMS_open_armed_CUP;
	//GMS_AIPatrolVehiclesRed = GMS_AIPatrolVehiclesRed + GMS_closed_armed_CUP;
	//GMS_AIPatrolVehiclesGreen = GMS_AIPatrolVehiclesGreen + GMS_APC_CUP;
	//GMS_AIPatrolVehiclesOrange = GMS_AIPatrolVehiclesOrange + GMS_Tanks_CUP;

	
	// Blacklisted itesm
	GMS_blacklistedOptics = ["optic_Nightstalker","optic_tws","optic_tws_mg"];
	
	// AI Weapons and Attachments
	GMS_bipods = ["bipod_01_F_blk","bipod_01_F_mtp","bipod_01_F_snd","bipod_02_F_blk","bipod_02_F_hex","bipod_02_F_tan","bipod_03_F_blk","bipod_03_F_oli"];

	GMS_Optics_Holo = ["optic_Hamr","optic_MRD","optic_Holosight","optic_Holosight_smg","optic_Aco","optic_ACO_grn","optic_ACO_grn_smg","optic_Aco_smg","optic_Yorris"];
	GMS_Optics_Reticule = ["optic_Arco","optic_MRCO"];
	GMS_Optics_Scopes = [
		"optic_AMS","optic_AMS_khk","optic_AMS_snd",
		"optic_DMS",
		"optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan",
		"optic_LRPS",
		"optic_Nightstalker",
		"optic_NVS",
		"optic_SOS",
		"optic_tws"
		//"optic_tws_mg",
		];
	GMS_Optics = GMS_Optics_Holo + GMS_Optics_Reticule + GMS_Optics_Scopes;		
	GMS_Optics_Apex = [
		//Apex
		"optic_Arco_blk_F",	"optic_Arco_ghex_F",
		"optic_DMS_ghex_F",
		"optic_Hamr_khk_F",
		"optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F",
		"optic_SOS_khk_F",
		"optic_LRPS_tna_F","optic_LRPS_ghex_F",
		"optic_Holosight_blk_F","optic_Holosight_khk_F","optic_Holosight_smg_blk_F"
		];	
	#ifdef useAPEX	
	GMS_Optics = GMS_Optics + GMS_Optics_Apex;
	#endif

	GMS_bipods = [
		"bipod_01_F_blk","bipod_01_F_mtp","bipod_01_F_snd","bipod_02_F_blk","bipod_02_F_hex","bipod_02_F_tan","bipod_03_F_blk","bipod_03_F_oli",
		//Apex
		"bipod_01_F_khk"
		];
	
	GMS_silencers = [
		"muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand","muzzle_snds_93mmg","muzzle_snds_93mmg_tan","muzzle_snds_acp","muzzle_snds_B",
		"muzzle_snds_H","muzzle_snds_H_MG","muzzle_snds_H_SW","muzzle_snds_L","muzzle_snds_M",
		//Apex			
		"muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_58_blk_F","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F",
		"muzzle_snds_58_wdm_F","muzzle_snds_65_TI_blk_F","muzzle_snds_65_TI_hex_F","muzzle_snds_65_TI_ghex_F","muzzle_snds_H_MG_blk_F","muzzle_snds_H_MG_khk_F"
		];		

	GMS_RifleSniper = [ 
		"srifle_EBR_F","srifle_GM6_F","srifle_LRR_F","srifle_DMR_01_F" 		
	];

	GMS_RifleAsault_556 = [
		"arifle_SDAR_F","arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_Mk20_F","arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F","arifle_SDAR_F"
		];
	
	GMS_RifleAsault_650 = [
		"arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F","arifle_MX_GL_F","arifle_MXM_F"
		];
	
	GMS_RifleAsault = [
		"arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F","arifle_MX_GL_F","arifle_MXM_F","arifle_SDAR_F",
		"arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_Mk20_F","arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F"
	];

	GMS_RifleLMG = [
		"LMG_Mk200_F","LMG_Zafir_F"
	];

	GMS_RifleOther = [
		"SMG_01_F","SMG_02_F"
	];

	GMS_Pistols = [
		"hgun_PDW2000_F","hgun_ACPC2_F","hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Pistol_Signal_F"
	];	
	GMS_Pistols_blue = GMS_Pistols;
	GMS_Pistols_red = GMS_Pistols;
	GMS_Pistols_green = GMS_Pistols;
	GMS_Pistols_orange = GMS_Pistols;
	
	GMS_DLC_MMG = [
				"MMG_01_hex_F","MMG_02_sand_F","MMG_01_tan_F","MMG_02_black_F","MMG_02_camo_F"
	];
	
	GMS_DLC_Sniper = [
		"srifle_DMR_02_camo_F","srifle_DMR_02_F","srifle_DMR_02_sniper_F","srifle_DMR_03_F","srifle_DMR_03_tan_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_F","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F"
	];
				
	//This defines the random weapon to spawn on the AI
	//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
	GMS_WeaponList_Orange = GMS_RifleSniper + GMS_RifleAsault_650 + GMS_RifleLMG + GMS_DLC_Sniper + GMS_DLC_MMG;
	GMS_WeaponList_Green = GMS_RifleSniper + GMS_RifleAsault_650 +GMS_RifleLMG + GMS_DLC_MMG;
	GMS_WeaponList_Blue = GMS_RifleOther + GMS_RifleAsault_556 + GMS_RifleAsault_650;
	GMS_WeaponList_Red = GMS_RifleAsault_556 + GMS_RifleSniper + GMS_RifleAsault_650 + GMS_RifleLMG;

	GMS_apexWeapons = ["arifle_AK12_F","arifle_AK12_GL_F","arifle_AKM_F","arifle_AKM_FL_F","arifle_AKS_F","arifle_ARX_blk_F","arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F",
						"arifle_CTAR_ghex_F","arifle_CTAR_GL_blk_F","arifle_CTARS_blk_F","arifle_CTARS_hex_F","arifle_CTARS_ghex_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F",
						"arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F","arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F","arifle_SPAR_03_blk_F",
						"arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","arifle_MX_khk_F","arifle_MX_GL_khk_F","arifle_MXC_khk_F","arifle_MXM_khk_F"];
	#ifdef useAPEX			
	GMS_WeaponList_Orange = GMS_WeaponList_Orange + GMS_apexWeapons;
	GMS_WeaponList_Green = GMS_WeaponList_Green + GMS_apexWeapons;	
	#endif
	
	GMS_backpacks = ["B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_oli","B_Carryall_khk","B_Carryall_cbr" ];  
		
	GMS_ApexBackpacks = [
		"B_Bergen_mcamo_F","B_Bergen_dgtl_F","B_Bergen_hex_F","B_Bergen_tna_F","B_AssaultPack_tna_F","B_Carryall_ghex_F",
		"B_FieldPack_ghex_F","B_ViperHarness_blk_F","B_ViperHarness_ghex_F","B_ViperHarness_hex_F","B_ViperHarness_khk_F",
		"B_ViperHarness_oli_F","B_ViperLightHarness_blk_F","B_ViperLightHarness_ghex_F","B_ViperLightHarness_hex_F","B_ViperLightHarness_khk_F","B_ViperLightHarness_oli_F"
		];	
	#ifdef useAPEX
	GMS_backpacks = GMS_ApexBackpacks + GMS_backpacks;
	#endif
	GMS_backpacks_blue = GMS_backpacks;
	GMS_backpacks_red = GMS_backpacks;
	GMS_backpacks_green = GMS_backpacks;
	GMS_backpacks_orange = GMS_backpacks;
	
	GMS_BanditHeadgear = ["H_Shemag_khk","H_Shemag_olive","H_Shemag_tan","H_ShemagOpen_khk"];
	//This defines the skin list, some skins are disabled by default to permit players to have high visibility uniforms distinct from those of the AI.
	GMS_headgear = [
		"H_Cap_blk",
		"H_Cap_blk_Raven",
		"H_Cap_blu",
		"H_Cap_brn_SPECOPS",
		"H_Cap_grn",
		"H_Cap_headphones",
		"H_Cap_khaki_specops_UK",
		"H_Cap_oli",
		"H_Cap_press",
		"H_Cap_red",
		"H_Cap_tan",
		"H_Cap_tan_specops_US",
		"H_Watchcap_blk",
		"H_Watchcap_camo",
		"H_Watchcap_khk",
		"H_Watchcap_sgg",
		"H_MilCap_blue",
		"H_MilCap_dgtl",
		"H_MilCap_mcamo",
		"H_MilCap_ocamo",
		"H_MilCap_oucamo",
		"H_MilCap_rucamo",
		"H_Bandanna_camo",
		"H_Bandanna_cbr",
		"H_Bandanna_gry",
		"H_Bandanna_khk",
		"H_Bandanna_khk_hs",
		"H_Bandanna_mcamo",
		"H_Bandanna_sgg",
		"H_Bandanna_surfer",
		"H_Booniehat_dgtl",
		"H_Booniehat_dirty",
		"H_Booniehat_grn",
		"H_Booniehat_indp",
		"H_Booniehat_khk",
		"H_Booniehat_khk_hs",
		"H_Booniehat_mcamo",
		"H_Booniehat_tan",
		"H_Hat_blue",
		"H_Hat_brown",
		"H_Hat_camo",
		"H_Hat_checker",
		"H_Hat_grey",
		"H_Hat_tan",
		"H_StrawHat",
		"H_StrawHat_dark",
		"H_Beret_02",
		"H_Beret_blk",
		"H_Beret_blk_POLICE",
		"H_Beret_brn_SF",
		"H_Beret_Colonel",
		"H_Beret_grn",
		"H_Beret_grn_SF",
		"H_Beret_ocamo",
		"H_Beret_red",
		"H_Shemag_khk",
		"H_Shemag_olive",
		"H_Shemag_olive_hs",
		"H_Shemag_tan",
		"H_ShemagOpen_khk",
		"H_ShemagOpen_tan",
		"H_TurbanO_blk",
		"H_CrewHelmetHeli_B",
		"H_CrewHelmetHeli_I",
		"H_CrewHelmetHeli_O",
		"H_HelmetCrew_I",
		"H_HelmetCrew_B",
		"H_HelmetCrew_O",
		"H_PilotHelmetHeli_B",
		"H_PilotHelmetHeli_I",
		"H_PilotHelmetHeli_O",
		//Apex

		"H_MilCap_tna_F",
		"H_MilCap_ghex_F",
		"H_Booniehat_tna_F",
		"H_Beret_gen_F",
		"H_MilCap_gen_F",
		"H_Cap_oli_Syndikat_F",
		"H_Cap_tan_Syndikat_F",
		"H_Cap_blk_Syndikat_F",
		"H_Cap_grn_Syndikat_F"		
	];
	GMS_helmets = [
		"H_HelmetB",
		"H_HelmetB_black",
		"H_HelmetB_camo",
		"H_HelmetB_desert",
		"H_HelmetB_grass",
		"H_HelmetB_light",
		"H_HelmetB_light_black",
		"H_HelmetB_light_desert",
		"H_HelmetB_light_grass",
		"H_HelmetB_light_sand",
		"H_HelmetB_light_snakeskin",
		"H_HelmetB_paint",
		"H_HelmetB_plain_blk",
		"H_HelmetB_sand",
		"H_HelmetB_snakeskin",
		"H_HelmetCrew_B",
		"H_HelmetCrew_I",
		"H_HelmetCrew_O",
		"H_HelmetIA",
		"H_HelmetIA_camo",
		"H_HelmetIA_net",
		"H_HelmetLeaderO_ocamo",
		"H_HelmetLeaderO_oucamo",
		"H_HelmetO_ocamo",
		"H_HelmetO_oucamo",
		"H_HelmetSpecB",
		"H_HelmetSpecB_blk",
		"H_HelmetSpecB_paint1",
		"H_HelmetSpecB_paint2",
		"H_HelmetSpecO_blk",
		"H_HelmetSpecO_ocamo",
		"H_CrewHelmetHeli_B",
		"H_CrewHelmetHeli_I",
		"H_CrewHelmetHeli_O",
		"H_HelmetCrew_I",
		"H_HelmetCrew_B",
		"H_HelmetCrew_O",
		"H_PilotHelmetHeli_B",
		"H_PilotHelmetHeli_I",
		"H_PilotHelmetHeli_O",
		"H_Helmet_Skate",
		"H_HelmetB_TI_tna_F",
		// Apex
		//"H_HelmetO_ViperSP_hex_F",
		//"H_HelmetO_ViperSP_ghex_F",
		"H_HelmetB_tna_F",
		"H_HelmetB_Enh_tna_F",
		"H_HelmetB_Light_tna_F",
		"H_HelmetSpecO_ghex_F",
		"H_HelmetLeaderO_ghex_F",
		"H_HelmetO_ghex_F",
		"H_HelmetCrew_O_ghex_F"			
	];
	GMS_headgearList = GMS_headgear + GMS_helmets;
	GMS_headgear_blue = GMS_headgearList;
	GMS_headgear_red = GMS_headgearList;
	GMS_headgear_green = GMS_headgearList;
	GMS_headgear_orange = GMS_headgearList;
	
	//This defines the skin list, some skins are disabled by default to permit players to have high visibility uniforms distinct from those of the AI.
	GMS_SkinList = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
		// I have commented out some high visibility uniforms that can be reserved for players or special missions.
		// for example, you could have a uniform list specified in a mission template.
		"U_AntigonaBody",
		"U_AttisBody",
		"U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam_worn","U_B_CombatUniform_sgg","U_B_CombatUniform_sgg_tshirt","U_B_CombatUniform_sgg_vest","U_B_CombatUniform_wdl","U_B_CombatUniform_wdl_tshirt","U_B_CombatUniform_wdl_vest",
		"U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3",	
		"U_B_GhillieSuit",
		"U_B_HeliPilotCoveralls","U_B_PilotCoveralls",
		"U_B_SpecopsUniform_sgg",
		"U_B_survival_uniform",
		"U_B_Wetsuit",
		//"U_BasicBody",
		"U_BG_Guerilla1_1","U_BG_Guerilla2_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_Guerilla3_2",
		"U_BG_leader",
		"U_C_Commoner_shorts","U_C_Commoner1_1","U_C_Commoner1_2","U_C_Commoner1_3","U_C_Commoner2_1","U_C_Commoner2_2","U_C_Commoner2_3",
		"U_C_Farmer","U_C_Fisherman","U_C_FishermanOveralls","U_C_HunterBody_brn","U_C_HunterBody_grn",
		//"U_C_Journalist",
		"U_C_Novak",
		//"U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour",
		"U_C_Poor_1","U_C_Poor_2","U_C_Poor_shorts_1","U_C_Poor_shorts_2","U_C_PriestBody","U_C_Scavenger_1","U_C_Scavenger_2",
		//"U_C_Scientist","U_C_ShirtSurfer_shorts","U_C_TeeSurfer_shorts_1","U_C_TeeSurfer_shorts_2",
		"U_C_WorkerCoveralls","U_C_WorkerOveralls","U_Competitor",
		"U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_I_CombatUniform_tshirt","U_I_G_resistanceLeader_F",
		"U_I_G_Story_Protagonist_F",
		"U_I_GhillieSuit",
		"U_I_HeliPilotCoveralls",
		"U_I_OfficerUniform",
		"U_I_pilotCoveralls",
		"U_I_Wetsuit",
		"U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2",
		"U_IG_leader",
		"U_IG_Menelaos",
		//"U_KerryBody",
		//"U_MillerBody",
		//"U_NikosAgedBody",
		//"U_NikosBody",
		"U_O_CombatUniform_ocamo","U_O_CombatUniform_oucamo",
		"U_O_GhillieSuit",
		"U_O_OfficerUniform_ocamo",
		"U_O_PilotCoveralls",
		"U_O_SpecopsUniform_blk",
		"U_O_SpecopsUniform_ocamo",
		"U_O_Wetsuit",
		"U_OG_Guerilla1_1","U_OG_Guerilla2_1","U_OG_Guerilla2_2","U_OG_Guerilla2_3","U_OG_Guerilla3_1","U_OG_Guerilla3_2","U_OG_leader",
		//"U_OI_Scientist",
		//"U_OrestesBody",
		"U_Rangemaster",
		// DLC
		"U_B_FullGhillie_ard","U_I_FullGhillie_ard","U_O_FullGhillie_ard","U_B_FullGhillie_sard","U_O_FullGhillie_sard","U_I_FullGhillie_sard","U_B_FullGhillie_lsh","U_O_FullGhillie_lsh","U_I_FullGhillie_lsh",
		//Apex
		"U_B_T_Soldier_F",
		"U_B_T_Soldier_AR_F",
		"U_B_T_Soldier_SL_F",
		//"U_B_T_Sniper_F",
		//"U_B_T_FullGhillie_tna_F",
		"U_B_CTRG_Soldier_F",
		"U_B_CTRG_Soldier_2_F",
		"U_B_CTRG_Soldier_3_F",
		"U_B_GEN_Soldier_F",
		"U_B_GEN_Commander_F",
		"U_O_T_Soldier_F",
		"U_O_T_Officer_F",
		//"U_O_T_Sniper_F",
		//"U_O_T_FullGhillie_tna_F",
		"U_O_V_Soldier_Viper_F",
		"U_O_V_Soldier_Viper_hex_F",
		"U_I_C_Soldier_Para_1_F",
		"U_I_C_Soldier_Para_2_F",
		"U_I_C_Soldier_Para_3_F",
		"U_I_C_Soldier_Para_4_F",
		"U_I_C_Soldier_Para_5_F",
		"U_I_C_Soldier_Bandit_1_F",
		"U_I_C_Soldier_Bandit_2_F",
		"U_I_C_Soldier_Bandit_3_F",
		"U_I_C_Soldier_Bandit_4_F",
		"U_I_C_Soldier_Bandit_5_F",
		"U_I_C_Soldier_Camo_F",
		"U_C_man_sport_1_F",
		"U_C_man_sport_2_F",
		"U_C_man_sport_3_F",
		"U_C_Man_casual_1_F",
		"U_C_Man_casual_2_F",
		"U_C_Man_casual_3_F",
		"U_C_Man_casual_4_F",
		"U_C_Man_casual_5_F",
		"U_C_Man_casual_6_F",
		"U_B_CTRG_Soldier_urb_1_F",
		"U_B_CTRG_Soldier_urb_2_F",
		"U_B_CTRG_Soldier_urb_3_F"
	];
	GMS_SkinList_blue = GMS_SkinList;
	GMS_SkinList_red = GMS_SkinList;
	GMS_SkinList_green = GMS_SkinList;
	GMS_SkinList_orange = GMS_SkinList;

	GMS_vests = [
		"V_Press_F",
		"V_Rangemaster_belt",
		"V_TacVest_blk",
		"V_TacVest_blk_POLICE",
		"V_TacVest_brn",
		"V_TacVest_camo",
		"V_TacVest_khk",
		"V_TacVest_oli",
		"V_TacVestCamo_khk",
		"V_TacVestIR_blk",
		"V_I_G_resistanceLeader_F",
		"V_BandollierB_blk",
		"V_BandollierB_cbr",
		"V_BandollierB_khk",
		"V_BandollierB_oli",
		"V_BandollierB_rgr",
		"V_Chestrig_blk",
		"V_Chestrig_khk",
		"V_Chestrig_oli",
		"V_Chestrig_rgr",
		"V_HarnessO_brn",
		"V_HarnessO_gry",
		"V_HarnessOGL_brn",
		"V_HarnessOGL_gry",
		"V_HarnessOSpec_brn",
		"V_HarnessOSpec_gry",
		"V_PlateCarrier1_blk",
		"V_PlateCarrier1_rgr",
		"V_PlateCarrier2_rgr",
		"V_PlateCarrier3_rgr",
		"V_PlateCarrierGL_blk",
		"V_PlateCarrierGL_mtp",
		"V_PlateCarrierGL_rgr",
		"V_PlateCarrierH_CTRG",
		"V_PlateCarrierIA1_dgtl",
		"V_PlateCarrierIA2_dgtl",
		"V_PlateCarrierIAGL_dgtl",
		"V_PlateCarrierIAGL_oli",
		"V_PlateCarrierL_CTRG",
		"V_PlateCarrierSpec_blk",
		"V_PlateCarrierSpec_mtp",
		#ifdef useAPEX
		//Apex
		"V_TacChestrig_grn_F",
		"V_TacChestrig_oli_F",
		"V_TacChestrig_cbr_F",
		"V_PlateCarrier1_tna_F",
		"V_PlateCarrier2_tna_F",
		"V_PlateCarrierSpec_tna_F",
		"V_PlateCarrierGL_tna_F",
		"V_HarnessO_ghex_F",
		"V_HarnessOGL_ghex_F",
		"V_BandollierB_ghex_F",
		"V_TacVest_gen_F",
		"V_PlateCarrier1_rgr_noflag_F",
		#endif
		"V_PlateCarrier2_rgr_noflag_F"
		];
	GMS_vests_blue = GMS_vests;
	GMS_vests_red = GMS_vests;
	GMS_vests_green = GMS_vests;
	GMS_vests_orange = GMS_vests;		

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
		GMS_UMS_submarines =
		[
			
			"Exile_Boat_SDV_CSAT",
			"Exile_Boat_SDV_Digital",
			"Exile_Boat_SDV_Grey"
		];
		
	GMS_UMS_crates =	["Exile_Container_SupplyBox"];

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
		
	//CraftingFood
	GMS_Meats=[
		
	];
	GMS_Drink = [
		"Exile_Item_PlasticBottleCoffee",
		"Exile_Item_PowerDrink",
		"Exile_Item_PlasticBottleFreshWater",
		"Exile_Item_Beer",
		"Exile_Item_EnergyDrink",
		"Exile_Item_MountainDupe"
	];
	GMS_Food = [
		"Exile_Item_EMRE",		
		"Exile_Item_GloriousKnakworst",
		"Exile_Item_Surstromming",
		"Exile_Item_SausageGravy",
		"Exile_Item_Catfood",
		"Exile_Item_ChristmasTinner",
		"Exile_Item_BBQSandwich",
		"Exile_Item_Dogfood",
		"Exile_Item_BeefParts",
		"Exile_Item_Cheathas",
		"Exile_Item_Noodles",
		"Exile_Item_SeedAstics",
		"Exile_Item_Raisins",
		"Exile_Item_Moobar",
		"Exile_Item_InstantCoffee"
	];

	private _foodDrink = GMS_meats + GMS_drink + GMS_food;
	private _buildingStuff = [
		["Exile_Item_Matches",1,2],["Exile_Item_CookingPot",1,2],["Exile_Item_Rope",1,2],["Exile_Item_DuctTape",1,8],["Exile_Item_ExtensionCord",1,8],["Exile_Item_FuelCanisterEmpty",1,2],
		["Exile_Item_JunkMetal",4,10],["Exile_Item_LightBulb",1,10],["Exile_Item_MetalBoard",4,10],["Exile_Item_MetalPole",4,10],["Exile_Item_CamoTentKit",1,3],["Exile_Item_MetalScrews",3,10],
		["Exile_Item_Sand",4,10],["Exile_Item_Cement",4,10],["Exile_Item_WaterCanisterDirtyWater",1,3],["Exile_Item_FuelCanisterFull",1,3]
	];
	private _toolsItems = [
			"Exile_Item_Matches","Exile_Item_CookingPot","Exile_Item_CanOpener","Exile_Item_Handsaw","Exile_Item_Pliers","Exile_Item_Grinder","Exile_Item_Foolbox","Exile_Item_Hammer",
			"Exile_Item_CordlessScrewdriver","Exile_Item_FireExtinguisher","Exile_Item_OilCanister","Exile_Item_Screwdriver","Exile_Item_Shovel","Exile_Item_Wrench","Exile_Item_CordlessScrewdriver",
			"Exile_Item_FireExtinguisher","Exile_Item_OilCanister","Exile_Item_Screwdriver","Exile_Item_DuctTape","Binocular","Rangefinder","ItemGPS"
	];
	private _launchers = [];

GMS_buildingMaterials = ["Exile_Item_ExtensionCord","Exile_Item_JunkMetal","Exile_Item_LightBulb","Exile_Item_MetalBoard",
		"Exile_Item_MetalPole","Exile_Item_MetalScrews","Exile_Item_Cement","Exile_Item_Sand","Exile_Item_MetalWire","Exile_Item_ExtensionCord","Exile_Item_JunkMetal"];	
GMS_tools = ["Exile_Item_Matches","Exile_Item_CookingPot","Exile_Melee_Axe","Exile_Melee_SledgeHammmer","Exile_Item_Handsaw","Exile_Item_Pliers","Exile_Item_CanOpener","Exile_Item_Shovel"];
GMS_loot = GMS_buildingMaterials + GMS_tools;
GMS_medicalItems = ["Exile_Item_InstaDoc","Exile_Item_Bandage","Exile_Item_Vishpirin"];
GMS_ConsumableItems = GMS_Meats + GMS_Drink + GMS_Food;
/*
			"Binocular",
			"Rangefinder",
			/*
			"Laserdesignator",
			"Laserdesignator_02",
			"Laserdesignator_03"
*/
GMS_binocs = ["Binocular","Rangefinder","Laserdesignator"];
GMS_NVG = ["NVGoggles","NVGoggles_INDEP","NVGoggles_OPFOR"];
GMS_throwableExplosives = ["HandGrenade","MiniGrenade"];
GMS_otherExplosives = ["1Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag"];
GMS_explosives = GMS_throwableExplosives + GMS_otherExplosives;
/***************************************************************************************
DEFAULT CONTENTS OF LOOT CRATES FOR EACH MISSION
Note however that these configurations can be used in any way you like or replaced with mission-specific customized loot arrays
for examples of how you can do this see \Major\Compositions.sqf
***************************************************************************************/			

	// values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
	GMS_lootCountsOrange = [[6,8],[24,32],[5,10],[25,35],16,1];   // Orange
	GMS_lootCountsGreen = [[4,8],[20,30],[5,9],[15,18],18,1]; // Green
	GMS_lootCountsRed = [[4,6],[12,18],4,[6,12],6,1];  // Red	
	GMS_lootCountsBlue = [4,12,3,6,6,1];   // Blue
	
	GMS_BoxLoot_Orange = 
		// Loot is grouped as [weapons],[magazines],[items] in order to be able to use the correct function to load the item into the crate later on.
		// Each item consist of the following information ["ItemName",minNum, maxNum] where min is the smallest number added and min+max is the largest number added.
		
	[  
			GMS_WeaponList_Orange,
			[] + _launchers,			
			GMS_Optics,
			_buildingStuff + _toolsItems,
			_foodDrink,
			GMS_backpacks_orange
	];		
		
	GMS_BoxLoot_Green = 
		[
			GMS_WeaponList_Green,
			[] + _launchers,			
			GMS_Optics,
			_buildingStuff + _toolsItems,
			_foodDrink,
			GMS_backpacks_green
		];
		
	GMS_BoxLoot_Blue = 
		[
			GMS_WeaponList_Blue,
			[],			
			GMS_Optics,
			_buildingStuff + _toolsItems,
			_foodDrink,
			GMS_backpacks_blue
		];
	
	GMS_BoxLoot_Red = 
		[	
			GMS_WeaponList_Red,
			[],			
			GMS_Optics,
			_buildingStuff + _toolsItems,
			_foodDrink,
			GMS_backpacks_red
		];


GMS_contructionLootExile = [  
		[// Weapons	
							
		],
		[//Magazines
						
		],			
		[  // Optics
			
		],
		[// Materials and supplies				
			
			//
			["Exile_Item_Matches",1,2],["Exile_Item_CookingPot",1,2],["Exile_Item_Rope",1,2],["Exile_Item_DuctTape",1,8],["Exile_Item_ExtensionCord",1,8],["Exile_Item_FuelCanisterEmpty",1,2],
			["Exile_Item_JunkMetal",4,10],["Exile_Item_LightBulb",1,10],["Exile_Item_MetalBoard",4,10],["Exile_Item_MetalPole",4,10],["Exile_Item_CamoTentKit",1,3],["Exile_Item_MetalScrews",3,10],
			["Exile_Item_Sand",4,10],["Exile_Item_Cement",4,10],["Exile_Item_WaterCanisterDirtyWater",1,3],["Exile_Item_FuelCanisterFull",1,3]
		],
		[//Items
			"Exile_Item_Matches","Exile_Item_CookingPot","Exile_Item_CanOpener","Exile_Item_Handsaw","Exile_Item_Pliers","Exile_Item_Grinder","Exile_Item_Foolbox","Exile_Item_Hammer",
			"Exile_Item_CordlessScrewdriver","Exile_Item_FireExtinguisher","Exile_Item_OilCanister","Exile_Item_Screwdriver","Exile_Item_Shovel","Exile_Item_Wrench","Exile_Item_CordlessScrewdriver",
			"Exile_Item_FireExtinguisher","Exile_Item_OilCanister","Exile_Item_Screwdriver","Exile_Item_DuctTape","Binocular","Rangefinder","ItemGPS","ItemMap","ItemCompass","ItemRadio","ItemWatch",
			"Exile_Item_XM8"
		],
		[ // Backpacks
			
		]
];
GMS_contructionLoot = GMS_contructionLootExile;
GMS_supportLootExile = [
		[// Weapons	

		],
		[//Magazines
						
		],			
		[  // Optics
			
		],
		[// Materials and supplies				
			
		],
		[//Items
			["Exile_Item_Matches",2,4],["Exile_Item_CookingPot",2,4],["Exile_Item_CanOpener",2,4],
			["Exile_Item_InstaDoc",1,2],["NVGoggles",1,2],["Rangefinder",1,2],["Exile_Item_Bandage",1,3],["Exile_Item_Vishpirin",1,3],  
			["Exile_Item_Catfood",1,3],["Exile_Item_Surstromming",1,3],["Exile_Item_BBQSandwich",1,3],["Exile_Item_ChristmasTinner",1,3],["Exile_Item_SausageGravy",1,3],["Exile_Item_GloriousKnakworst",1,3],
			["Exile_Item_BeefParts",1,3],["Exile_Item_Cheathas",1,3],["Exile_Item_Noodles",1,3],["Exile_Item_SeedAstics",1,3],["Exile_Item_Raisins",1,3],["Exile_Item_Moobar",1,3],["Exile_Item_InstantCoffee",1,3],["Exile_Item_EMRE",1,3],
			["Exile_Item_PlasticBottleCoffee",1,3],["Exile_Item_PowerDrink",1,3],["Exile_Item_PlasticBottleFreshWater",1,3],["Exile_Item_Beer",1,3],["Exile_Item_EnergyDrink",1,3],["Exile_Item_MountainDupe",1,3]						
		],
		[ // Backpacks
			
		]
];

GMS_supportLoot = GMS_supportLootExile;

GMS_highPoweredLoot = [ 
		[// Weapons	
			["MMG_01_hex_F","150Rnd_93x64_Mag"],
			["MMG_01_tan_F","150Rnd_93x64_Mag"],
			["MMG_02_black_F","150Rnd_93x64_Mag"],
			["MMG_02_camo_F","150Rnd_93x64_Mag"],
			["MMG_02_sand_F","150Rnd_93x64_Mag"],
			["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
			["srifle_DMR_02_F","10Rnd_338_Mag"],
			["srifle_DMR_02_sniper_F","10Rnd_338_Mag"],
			["srifle_DMR_03_F","10Rnd_338_Mag"],
			["srifle_DMR_03_tan_F","10Rnd_338_Mag"],
			["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
			["srifle_DMR_05_hex_F","10Rnd_338_Mag"],
			["srifle_DMR_05_tan_F","10Rnd_338_Mag"],
			["srifle_DMR_06_camo_F","10Rnd_338_Mag"],				
			["srifle_DMR_04_F","10Rnd_127x54_Mag"],
			["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag"],
			["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"] //,
			/*
			["launch_NLAW_F","NLAW_F"],
			["launch_RPG32_F","RPG7_F"],
			["launch_B_Titan_F","Titan_AT"],
			["launch_I_Titan_F","Titan_AT"],
			["launch_O_Titan_F","Titan_AP"],
			["launch_B_Titan_short_F","Titan_AA"],
			["launch_I_Titan_short_F","Titan_AA"],
			["launch_O_Titan_short_F","Titan_AA"],
			["launch_RPG7_F","RPG32_F"],
			["launch_O_Vorona_brown_F","vorona_HEAT"],
			["launch_O_Vorona_green_F","Vorona_HE"]		
			*/
		],
		[//Magazines
			/*
			["NLAW_F",1,3],
			["RPG32_F",1,3],
			["RPG32_HE_F",1,3],
			["Titan_AA",1,3],
			["Titan_AT",1,3],
			["Titan_AP",1,3],
			["RPG7_F",1,3],
			["vorona_HEAT",1,3],
			["Vorona_HE",1,3],
			*/
			//["10Rnd_338_Mag",1,5],
			["10Rnd_338_Mag",3,5],				
			//["10Rnd_127x54_Mag" ,1,5],
			["10Rnd_127x54_Mag",3,5],
			["10Rnd_93x64_DMR_05_Mag" ,3,5],
			//["10Rnd_93x64_DMR_05_Mag" ,1,5],
			["150Rnd_93x64_Mag",2,5],
			["130Rnd_338_Mag",3,5]
		],			
		[  // Optics
			
		],
		[// Materials and supplies				
			
		],
		[//Items
		],
		[ // Backpacks
			
		]
];
GMS_configs_loaded = true;
["Configurations for Exile Loaded"] call GMS_fnc_log;
