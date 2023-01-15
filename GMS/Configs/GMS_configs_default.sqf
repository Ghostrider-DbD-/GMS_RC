/*
	By Ghostrider [GRG]
	Copyright 2016
	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/	
*/

#include "\GMS\Compiles\Init\GMS_defines.hpp"

////////////
// default settings
////////////	

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
	
	GMS_crateMoneyBlue = [100,250];
	GMS_crateMoneyRed = [175, 300];
	GMS_crateMoneyGreen = [300, 500];
	GMS_crateMoneyOrange = [500, 750];

	GMS_crateTypes = ["Box_FIA_Ammo_F","Box_FIA_Support_F","Box_FIA_Wps_F","I_SupplyCrate_F","Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F","IG_supplyCrate_F","Box_NATO_Wps_F","I_CargoNet_01_ammo_F","O_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F"];  // Default crate type.
	
	GMS_allowSalesAtBlackMktTraders = true; // Allow vehicles to be sold at Halvjes black market traders.
	
	GMS_maximumItemPriceInAI_Loadouts = 100;
	
	GMS_lightlyArmed_ARMA3 = [
		"B_G_Offroad_01_armed_F", 
		"O_G_Offroad_01_armed_F",
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
		"B_APC_Tracked_01_CRV_F",
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
	
	GMS_AIPatrolVehicles = ["B_LSV_01_armed_F","I_C_Offroad_02_LMG_F","B_T_LSV_01_armed_black_F","B_T_LSV_01_armed_olive_F","B_T_LSV_01_armed_sand_F"]; // Type of vehicle spawned to defend AI bases	
	GMS_AIPatrolVehiclesBlue = GMS_AIPatrolVehicles;
	GMS_AIPatrolVehiclesRed = GMS_AIPatrolVehicles;
	GMS_AIPatrolVehiclesGreen = GMS_AIPatrolVehicles;
	GMS_AIPatrolVehiclesOrange = GMS_AIPatrolVehicles;
	
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
	GMS_Optics = GMS_Optics_Holo + GMS_Optics_Reticule + GMS_Optics_Scopes;

	GMS_Optics = GMS_Optics + GMS_Optics_Apex;

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
	
	GMS_RifleAssault = GMS_RifleAsault_556 + GMS_RifleAsault_650;

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
	GMS_apexWeapons = ["arifle_AK12_F","arifle_AK12_GL_F","arifle_AKM_F","arifle_AKM_FL_F","arifle_AKS_F","arifle_ARX_blk_F","arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F",
						"arifle_CTAR_ghex_F","arifle_CTAR_GL_blk_F","arifle_CTARS_blk_F","arifle_CTARS_hex_F","arifle_CTARS_ghex_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F",
						"arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F","arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F","arifle_SPAR_03_blk_F",
						"arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","arifle_MX_khk_F","arifle_MX_GL_khk_F","arifle_MXC_khk_F","arifle_MXM_khk_F"];
						
	//This defines the random weapon to spawn on the AI
	//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
	GMS_WeaponList_Orange = GMS_RifleSniper + GMS_RifleAsault_650 + GMS_RifleLMG + GMS_DLC_Sniper + GMS_DLC_MMG;
	GMS_WeaponList_Green = GMS_RifleSniper + 	GMS_RifleAsault_650 +GMS_RifleLMG + GMS_DLC_MMG + GMS_apexWeapons;
	GMS_WeaponList_Blue = GMS_RifleOther + GMS_RifleAsault_556 +GMS_RifleAsault_650;
	GMS_WeaponList_Red = GMS_RifleAsault_556 + GMS_RifleSniper + 	GMS_RifleAsault_650 + GMS_RifleLMG;
	
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
		GMS_backpacks = GMS_backpacks + GMS_ApexBackpacks;
	#endif

	private _backpacks = GMS_backpacks; 

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
	GMS_SkinList_Male = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
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
		GMS_SkinList = GMS_SkinList_Male;
		GMS_SkinList_blue = GMS_SkinList;
		GMS_SkinList_red = GMS_SkinList;
		GMS_SkinList_green = GMS_SkinList;
		GMS_SkinList_orange = GMS_SkinList;
		
		GMS_vests = [
				// DLC Vests
				"V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierIAGL_oli"
			];
		GMS_vests_blue = GMS_vests;
		GMS_vests_red = GMS_vests;
		GMS_vests_green = GMS_vests;
		GMS_vests_orange = GMS_vests;
		
			//CraftingFood
        GMS_Meats=[
        ];
        GMS_Drink = [
        ];
        GMS_Food = [
        ];
        GMS_ConsumableItems = GMS_Meats + GMS_Drink + GMS_Food;
		GMS_throwableExplosives = ["HandGrenade","MiniGrenade"];
		GMS_otherExplosives = ["1Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag"];
		GMS_explosives = GMS_throwableExplosives + GMS_otherExplosives;
		GMS_medicalItems = ["FAK"];
		GMS_specialItems = GMS_throwableExplosives + GMS_medicalItems;	
		GMS_binocs = ["Binocular","Rangefinder","Laserdesignator"];	
		GMS_NVG = ["NVG"];
        GMS_buildingMaterials = [];
		GMS_loot = [];
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
				
				"B_SDV_01_F"
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


/***************************************************************************************
DEFAULT CONTENTS OF LOOT CRATES FOR EACH MISSION
Note however that these configurations can be used in any way you like or replaced with mission-specific customized loot arrays
for examples of how you can do this see \Major\Compositions.sqf
***************************************************************************************/			

	// values are: number of things from the weapons, magazines, optics, materials(cinder etc), items (food etc) and backpacks arrays to add, respectively.
	GMS_lootCountsOrange = [8,32,8,30,16,1];   // Orange
	GMS_lootCountsGreen = [7,24,6,16,18,1]; // Green
	GMS_lootCountsRed = [5,16,4,10,6,1];  // Red	
	GMS_lootCountsBlue = [4,12,3,6,6,1];   // Blue
	
	GMS_BoxLoot_Orange = 
		// Loot is grouped as [weapons],[magazines],[items] in order to be able to use the correct function to load the item into the crate later on.
		// Each item consist of the following information ["ItemName",minNum, maxNum] where min is the smallest number added and min+max is the largest number added.
		
	[  
			GMS_WeaponList_Orange,
			[] + GMS_launcherTypes,			
			GMS_Optics,
			[],
			[],
			GMS_backpacks_orange
	];		
		
	GMS_BoxLoot_Green = 
		[
			GMS_WeaponList_Green,
			[] + GMS_launcherTypes,			
			GMS_Optics,
			[],
			[],
			GMS_backpacks_green
		];
		
	GMS_BoxLoot_Blue = 
		[
			GMS_WeaponList_Blue,
			[],			
			GMS_Optics,
			[],
			[],
			GMS_backpacks_blue
		];
	
	GMS_BoxLoot_Red = 
		[	
			GMS_WeaponList_Red,
			[],			
			GMS_Optics,
			[],
			[],
			GMS_backpacks_red
		];

GMS_contructionLoot = GMS_BoxLoot_Orange;
GMS_highPoweredLoot = GMS_BoxLoot_Orange;
GMS_supportLoot = GMS_BoxLoot_Orange;
GMS_configs_loaded = true;
["[GMS] Default Configurations Loaded"] call GMS_fnc_log;

