private ["_uniforms", "_headgear", "_facewear"];


_uniforms = [
	"TRYK_U_B_OD_OD_CombatUniform",
	"TRYK_U_B_OD_OD_R_CombatUniform",
	"TRYK_U_B_TANTAN_CombatUniform",
	"TRYK_U_B_TANTAN_R_CombatUniform",
	"TRYK_U_B_BLKBLK_CombatUniform",
	"TRYK_U_B_BLKBLK_R_CombatUniform",
	"TRYK_U_B_GRYOCP_CombatUniform",
	"TRYK_U_B_GRYOCP_R_CombatUniformTshirt",
	"TRYK_U_B_TANOCP_CombatUniform",
	"TRYK_U_B_TANOCP_R_CombatUniformTshirt",
	"TRYK_U_B_BLKOCP_CombatUniform",
	"TRYK_U_B_BLKOCP_R_CombatUniformTshirt",
	"TRYK_U_B_BLKTAN_CombatUniform",
	"TRYK_U_B_BLKTANR_CombatUniformTshirt",
	"TRYK_U_B_ODTAN_CombatUniform",
	"TRYK_U_B_ODTANR_CombatUniformTshirt",
	"TRYK_U_B_GRTAN_CombatUniform",
	"TRYK_U_B_GRTANR_CombatUniformTshirt",
	"TRYK_U_B_wood_CombatUniform",
	"TRYK_U_B_woodR_CombatUniformTshirt",
	"TRYK_U_B_wood3c_CombatUniform",
	"TRYK_U_B_wood3c_CombatUniformTshirt",
	"TRYK_U_B_MARPAT_WOOD_CombatUniform",
	"TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt",
	"TRYK_U_B_WOOD_MARPAT_CombatUniform",
	"TRYK_U_B_WOOD_MARPAT_CombatUniformTshirt",
	"TRYK_U_B_woodtan_CombatUniform",
	"TRYK_U_B_woodtanR_CombatUniformTshirt",
	"TRYK_U_B_JSDF_CombatUniform",
	"TRYK_U_B_JSDF_CombatUniformTshirt",
	"TRYK_U_B_3CD_Delta_BDU",
	"TRYK_U_B_3CD_Delta_BDUTshirt",
	"TRYK_U_B_3CD_Ranger_BDU",
	"TRYK_U_B_3CD_Ranger_BDUTshirt",
	"TRYK_U_B_3CD_BLK_BDUTshirt",
	"TRYK_U_B_3CD_BLK_BDUTshirt2",
	"TRYK_U_B_ACU",
	"TRYK_U_B_ACUTshirt",
	"TRYK_U_B_MARPAT_Wood",
	"TRYK_U_B_MARPAT_Wood_Tshirt",
	"TRYK_U_B_MARPAT_Desert",
	"TRYK_U_B_MARPAT_Desert_Tshirt",
	"TRYK_U_B_MARPAT_Desert2",
	"TRYK_U_B_MARPAT_Desert2_Tshirt",
	"TRYK_U_B_3c",
	"TRYK_U_B_3cr",
	"TRYK_U_B_Sage_Tshirt",
	"TRYK_U_B_BLK3CD",
	"TRYK_U_B_BLK3CD_Tshirt",
	"TRYK_U_B_BLK",
	"TRYK_U_B_BLK_Tshirt",
	"TRYK_U_B_BLKTAN",
	"TRYK_U_B_BLKTAN_Tshirt",
	"TRYK_U_B_ODTAN",
	"TRYK_U_B_ODTAN_Tshirt",
	"TRYK_U_B_BLK_OD",
	"TRYK_U_B_BLK_OD_Tshirt",
	"TRYK_U_B_C01_Tsirt",
	"TRYK_U_B_C02_Tsirt",
	"TRYK_U_B_OD_BLK",
	"TRYK_U_B_OD_BLK_2",
	"TRYK_U_B_BLK_TAN_1",
	"TRYK_U_B_BLK_TAN_2",
	"U_BasicBody",
	"U_B_CombatUniform_mcam",
	"U_B_CombatUniform_mcam_tshirt",
	"U_B_CombatUniform_mcam_vest",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_stripped",
	"U_C_Poloshirt_tricolour",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_redwhite",
	"U_C_Commoner1_1",
	"U_C_Commoner1_2",
	"U_C_Commoner1_3",
	"U_Rangemaster",
	"U_NikosBody",
	"U_OrestesBody",
	"U_B_CombatUniform_mcam_worn",
	"U_B_CombatUniform_wdl",
	"U_B_CombatUniform_wdl_tshirt",
	"U_B_CombatUniform_wdl_vest",
	"U_B_CombatUniform_sgg",
	"U_B_CombatUniform_sgg_tshirt",
	"U_B_CombatUniform_sgg_vest",
	"U_B_SpecopsUniform_sgg",
	"U_O_SpecopsUniform_blk",
	"U_O_OfficerUniform_ocamo",
	"U_I_CombatUniform",
	"U_I_CombatUniform_tshirt",
	"U_I_CombatUniform_shortsleeve",
	"U_I_OfficerUniform",
	"U_Competitor",
	"U_MillerBody",
	"U_KerryBody",
	"U_AttisBody",
	"U_AntigonaBody",
	"U_IG_Menelaos",
	"U_C_Novak",
	"U_OI_Scientist",
	"U_IG_Guerilla1_1",
	"U_IG_Guerilla2_1",
	"U_IG_Guerilla2_2",
	"U_IG_Guerilla2_3",
	"U_IG_Guerilla3_1",
	"U_IG_Guerilla3_2",
	"U_IG_leader",
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_1",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"U_BG_Guerilla3_2",
	"U_BG_leader",
	"U_OG_Guerilla1_1",
	"U_OG_Guerilla2_1",
	"U_OG_Guerilla2_2",
	"U_OG_Guerilla2_3",
	"U_OG_Guerilla3_1",
	"U_OG_Guerilla3_2",
	"U_OG_leader",
	"U_C_Poor_1",
	"U_C_Poor_2",
	"U_C_Scavenger_1",
	"U_C_Scavenger_2",
	"U_C_Farmer",
	"U_C_Fisherman",
	"U_C_WorkerOveralls",
	"U_C_FishermanOveralls",
	"U_C_WorkerCoveralls",
	"U_C_HunterBody_grn",
	"U_C_HunterBody_brn",
	"U_C_Commoner2_1",
	"U_C_Commoner2_2",
	"U_C_Commoner2_3",
	"U_C_PriestBody",
	"U_C_Poor_shorts_1",
	"U_C_Poor_shorts_2",
	"U_C_Commoner_shorts",
	"U_C_ShirtSurfer_shorts",
	"U_C_TeeSurfer_shorts_1",
	"U_C_TeeSurfer_shorts_2",
	"U_B_CTRG_1",
	"U_B_CTRG_2",
	"U_B_CTRG_3",
	"U_B_survival_uniform",
	"U_I_G_Story_Protagonist_F",
	"U_I_G_resistanceLeader_F",
	"U_C_Journalist",
	"U_C_Scientist",
	"U_NikosAgedBody",
	"U_IG_Guerrilla_6_1",
	"U_BG_Guerrilla_6_1",
	"U_OG_Guerrilla_6_1",
	"U_B_Soldier_VR",
	"U_O_Soldier_VR",
	"U_I_Soldier_VR",
	"U_C_Soldier_VR",
	"U_C_Driver_1",
	"U_C_Driver_2",
	"U_C_Driver_3",
	"U_C_Driver_4",
	"U_Marshal",
	"U_C_Driver_1_black",
	"U_C_Driver_1_blue",
	"U_C_Driver_1_green",
	"U_C_Driver_1_red",
	"U_C_Driver_1_white",
	"U_C_Driver_1_yellow",
	"U_C_Driver_1_orange",
	"CUP_U_C_Pilot_01",
	"CUP_U_C_Citizen_01",
	"CUP_U_C_Citizen_02",
	"CUP_U_C_Citizen_03",
	"CUP_U_C_Citizen_04",
	"CUP_U_C_Worker_01",
	"CUP_U_C_Worker_02",
	"CUP_U_C_Worker_03",
	"CUP_U_C_Worker_04",
	"CUP_U_C_Profiteer_01",
	"CUP_U_C_Profiteer_02",
	"CUP_U_C_Profiteer_03",
	"CUP_U_C_Profiteer_04",
	"CUP_U_C_Woodlander_01",
	"CUP_U_C_Woodlander_02",
	"CUP_U_C_Woodlander_03",
	"CUP_U_C_Woodlander_04",
	"CUP_U_C_Villager_01",
	"CUP_U_C_Villager_02",
	"CUP_U_C_Villager_03",
	"CUP_U_C_Villager_04",
	"CUP_U_C_Priest_01",
	"CUP_U_C_Policeman_01",
	"CUP_U_C_Suit_01",
	"CUP_U_C_Suit_02",
	"CUP_U_C_Labcoat_01",
	"CUP_U_C_Labcoat_02",
	"CUP_U_C_Labcoat_03",
	"CUP_U_C_Rocker_01",
	"CUP_U_C_Rocker_02",
	"CUP_U_C_Rocker_03",
	"CUP_U_C_Rocker_04",
	"CUP_U_C_Mechanic_01",
	"CUP_U_C_Mechanic_02",
	"CUP_U_C_Mechanic_03",
	"CUP_U_C_Fireman_01",
	"CUP_U_C_Rescuer_01",
	"CUP_U_B_CZ_WDL_TShirt",
	"CUP_U_B_BAF_DDPM_S1_RolledUp",
	"CUP_U_B_BAF_DDPM_S2_UnRolled",
	"CUP_U_B_BAF_DDPM_Tshirt",
	"CUP_U_B_BAF_DPM_S1_RolledUp",
	"CUP_U_B_BAF_DPM_S2_UnRolled",
	"CUP_U_B_BAF_DPM_Tshirt",
	"CUP_U_B_BAF_MTP_S1_RolledUp",
	"CUP_U_B_BAF_MTP_S2_UnRolled",
	"CUP_U_B_BAF_MTP_Tshirt",
	"CUP_U_B_BAF_MTP_S3_RolledUp",
	"CUP_U_B_BAF_MTP_S4_UnRolled",
	"CUP_U_B_BAF_MTP_S5_UnRolled",
	"CUP_U_B_BAF_MTP_S6_UnRolled",
	"CUP_U_O_CHDKZ_Bardak",
	"CUP_U_O_CHDKZ_Commander",
	"CUP_U_O_CHDKZ_Lopotev",
	"CUP_U_O_CHDKZ_Kam_01",
	"CUP_U_O_CHDKZ_Kam_02",
	"CUP_U_O_CHDKZ_Kam_03",
	"CUP_U_O_CHDKZ_Kam_04",
	"CUP_U_O_CHDKZ_Kam_05",
	"CUP_U_O_CHDKZ_Kam_06",
	"CUP_U_O_CHDKZ_Kam_07",
	"CUP_U_O_CHDKZ_Kam_08",
	"CUP_U_O_Pilot_01",
	"CUP_U_O_Worker_02",
	"CUP_U_O_Woodlander_01",
	"CUP_U_O_Woodlander_02",
	"CUP_U_O_Woodlander_03",
	"CUP_U_O_Villager_03",
	"CUP_U_O_Villager_04",
	"CUP_U_B_GER_Tropentarn_1",
	"CUP_U_B_GER_Tropentarn_2",
	"CUP_U_B_GER_Flecktarn_1",
	"CUP_U_B_GER_Flecktarn_2",
	"CUP_U_I_GUE_Flecktarn",
	"CUP_U_I_GUE_Flecktarn2",
	"CUP_U_I_GUE_Woodland1",
	"CUP_U_I_GUE_Flecktarn3",
	"CUP_U_I_Ghillie_Top",
	"CUP_U_I_Pilot_01",
	"CUP_U_I_Leader_01",
	"CUP_U_I_Worker_02",
	"CUP_U_I_Woodlander_01",
	"CUP_U_I_Woodlander_02",
	"CUP_U_I_Woodlander_03",
	"CUP_U_I_Villager_03",
	"CUP_U_I_Villager_04",
	"CUP_U_I_GUE_Anorak_01",
	"CUP_U_I_GUE_Anorak_02",
	"CUP_U_I_GUE_Anorak_03",
	"CUP_U_I_RACS_Desert_1",
	"CUP_U_I_RACS_Desert_2",
	"CUP_U_I_RACS_PilotOverall",
	"CUP_U_I_RACS_Urban_1",
	"CUP_U_I_RACS_Urban_2",
	"CUP_U_I_RACS_WDL_1",
	"CUP_U_I_RACS_WDL_2",
	"CUP_U_I_RACS_mech_1",
	"CUP_U_I_RACS_mech_2",
	"CUP_U_O_RUS_Flora_1",
	"CUP_U_O_RUS_EMR_1",
	"CUP_U_O_RUS_Flora_2",
	"CUP_U_O_RUS_EMR_2",
	"CUP_U_O_RUS_Flora_1_VDV",
	"CUP_U_O_RUS_EMR_1_VDV",
	"CUP_U_O_RUS_Flora_2_VDV",
	"CUP_U_O_RUS_EMR_2_VDV",
	"CUP_U_O_RUS_Commander",
	"CUP_U_O_RUS_Gorka_Partizan",
	"CUP_U_O_RUS_Gorka_Partizan_A",
	"CUP_U_O_RUS_Gorka_Green",
	"CUP_U_O_RUS_Ghillie",
	"CUP_U_O_SLA_Officer",
	"CUP_U_O_SLA_MixedCamo",
	"CUP_U_O_SLA_Green",
	"CUP_U_O_SLA_Urban",
	"CUP_U_O_SLA_Desert",
	"CUP_U_O_Partisan_TTsKO",
	"CUP_U_O_Partisan_TTsKO_Mixed",
	"CUP_U_O_Partisan_VSR_Mixed1",
	"CUP_U_O_Partisan_VSR_Mixed2",
	"CUP_U_O_SLA_Overalls_Pilot",
	"CUP_U_O_SLA_Overalls_Tank",
	"CUP_U_O_SLA_Officer_Suit",
	"CUP_U_O_TK_Officer",
	"CUP_U_O_TK_MixedCamo",
	"CUP_U_O_TK_Green",
	"CUP_O_TKI_Khet_Partug_01",
	"CUP_O_TKI_Khet_Partug_02",
	"CUP_O_TKI_Khet_Partug_03",
	"CUP_O_TKI_Khet_Partug_04",
	"CUP_O_TKI_Khet_Partug_05",
	"CUP_O_TKI_Khet_Partug_06",
	"CUP_O_TKI_Khet_Partug_07",
	"CUP_O_TKI_Khet_Partug_08",
	"CUP_O_TKI_Khet_Jeans_01",
	"CUP_O_TKI_Khet_Jeans_02",
	"CUP_O_TKI_Khet_Jeans_03",
	"CUP_O_TKI_Khet_Jeans_04",
	"CUP_I_TKG_Khet_Partug_01",
	"CUP_I_TKG_Khet_Partug_02",
	"CUP_I_TKG_Khet_Partug_03",
	"CUP_I_TKG_Khet_Partug_04",
	"CUP_I_TKG_Khet_Partug_05",
	"CUP_I_TKG_Khet_Partug_06",
	"CUP_I_TKG_Khet_Partug_07",
	"CUP_I_TKG_Khet_Partug_08",
	"CUP_I_TKG_Khet_Jeans_01",
	"CUP_I_TKG_Khet_Jeans_02",
	"CUP_I_TKG_Khet_Jeans_03",
	"CUP_I_TKG_Khet_Jeans_04",
	"CUP_U_B_USA06_Officer_m81",
	"CUP_U_B_USArmy_Base",
	"CUP_U_B_USArmy_TwoKnee",
	"CUP_U_B_USArmy_UBACS",
	"CUP_U_B_USArmy_Soft",
	"CUP_U_B_USArmy_PilotOverall",
	"CUP_U_B_USMC_Officer",
	"CUP_U_B_USMC_MARPAT_WDL_Sleeves",
	"CUP_U_B_USMC_MARPAT_WDL_RolledUp",
	"CUP_U_B_USMC_MARPAT_WDL_Kneepad",
	"CUP_U_B_USMC_MARPAT_WDL_TwoKneepads",
	"CUP_U_B_USMC_PilotOverall",
	"CUP_U_B_USMC_MARPAT_WDL_RollUpKneepad",
	"CUP_U_B_FR_SpecOps",
	"CUP_U_B_FR_Scout",
	"CUP_U_B_FR_Officer",
	"CUP_U_B_FR_Corpsman",
	"CUP_U_B_FR_DirAction",
	"CUP_U_B_FR_DirAction2",
	"CUP_U_B_FR_Light",
	"CUP_U_B_FR_Scout1",
	"CUP_U_B_FR_Scout2",
	"CUP_U_B_FR_Scout3",
	"CUP_B_USMC_Navy_Blue",
	"CUP_B_USMC_Navy_Brown",
	"CUP_B_USMC_Navy_Green",
	"CUP_B_USMC_Navy_Red",
	"CUP_B_USMC_Navy_Violet",
	"CUP_B_USMC_Navy_White",
	"CUP_B_USMC_Navy_Yellow",
	"U_VirtualMan_F",
	"TRYK_HRP_UCP",
	"TRYK_HRP_USMC",
	"TRYK_HRP_khk",
	"TRYK_U_B_wh_tan_Rollup_CombatUniform",
	"TRYK_U_B_wh_OD_Rollup_CombatUniform",
	"TRYK_U_B_wh_blk_Rollup_CombatUniform",
	"TRYK_U_B_BLK_tan_Rollup_CombatUniform",
	"TRYK_U_B_BLK_OD_Rollup_CombatUniform",
	"TRYK_U_B_NATO_UCP_GRY_CombatUniform",
	"TRYK_U_B_NATO_UCP_GRY_R_CombatUniform",
	"TRYK_U_B_NATO_UCP_CombatUniform",
	"TRYK_U_B_NATO_UCP_R_CombatUniform",
	"TRYK_U_B_NATO_OCP_c_BLK_CombatUniform",
	"TRYK_U_B_NATO_OCP_BLK_c_R_CombatUniform",
	"TRYK_U_B_NATO_OCP_BLK_CombatUniform",
	"TRYK_U_B_NATO_OCP_BLK_R_CombatUniform",
	"TRYK_U_B_NATO_OCPD_CombatUniform",
	"TRYK_U_B_NATO_OCPD_R_CombatUniform",
	"TRYK_U_B_NATO_OCP_CombatUniform",
	"TRYK_U_B_NATO_OCP_R_CombatUniform",
	"TRYK_U_B_AOR1_Rollup_CombatUniform",
	"TRYK_U_B_AOR2_Rollup_CombatUniform",
	"TRYK_U_B_MTP_CombatUniform",
	"TRYK_U_B_MTP_R_CombatUniform",
	"TRYK_U_B_MTP_BLK_CombatUniform",
	"TRYK_U_B_MTP_BLK_R_CombatUniform",
	"TRYK_U_B_Woodland",
	"TRYK_U_B_Woodland_Tshirt",
	"TRYK_U_B_WDL_GRY_CombatUniform",
	"TRYK_U_B_WDL_GRY_R_CombatUniform",
	"TRYK_U_B_ARO1_GR_CombatUniform",
	"TRYK_U_B_ARO1_GR_R_CombatUniform",
	"TRYK_U_B_ARO1_GRY_CombatUniform",
	"TRYK_U_B_ARO1_GRY_R_CombatUniform",
	"TRYK_U_B_ARO1_CombatUniform",
	"TRYK_U_B_ARO1R_CombatUniform",
	"TRYK_U_B_ARO1_BLK_CombatUniform",
	"TRYK_U_B_ARO1_BLK_R_CombatUniform",
	"TRYK_U_B_ARO1_CBR_CombatUniform",
	"TRYK_U_B_ARO1_CBR_R_CombatUniform",
	"TRYK_U_B_ARO2_CombatUniform",
	"TRYK_U_B_ARO2R_CombatUniform",
	"TRYK_U_B_AOR2_BLK_CombatUniform",
	"TRYK_U_B_AOR2_BLK_R_CombatUniform",
	"TRYK_U_B_AOR2_OD_CombatUniform",
	"TRYK_U_B_AOR2_OD_R_CombatUniform",
	"TRYK_U_B_AOR2_GRY_CombatUniform",
	"TRYK_U_B_AOR2_GRY_R_CombatUniform",
	"TRYK_U_B_Snow_CombatUniform",
	"TRYK_U_B_Snowt",
	"TRYK_U_B_Denim_T_WH",
	"TRYK_U_B_Denim_T_BK",
	"TRYK_U_B_BLK_T_WH",
	"TRYK_U_B_BLK_T_BK",
	"TRYK_U_B_RED_T_BR",
	"TRYK_U_B_Denim_T_BG_WH",
	"TRYK_U_B_Denim_T_BG_BK",
	"TRYK_U_B_BLK_T_BG_WH",
	"TRYK_U_B_BLK_T_BG_BK",
	"TRYK_U_B_RED_T_BG_BR",
	"TRYK_U_B_fleece",
	"TRYK_U_B_fleece_UCP",
	"TRYK_U_B_UCP_PCUs",
	"TRYK_U_B_GRY_PCUs",
	"TRYK_U_B_Wood_PCUs",
	"TRYK_U_B_PCUs",
	"TRYK_U_B_UCP_PCUs_R",
	"TRYK_U_B_GRY_PCUs_R",
	"TRYK_U_B_Wood_PCUs_R",
	"TRYK_U_B_PCUs_R",
	"TRYK_U_B_PCUGs",
	"TRYK_U_B_PCUODs",
	"TRYK_U_B_PCUGs_gry",
	"TRYK_U_B_PCUGs_BLK",
	"TRYK_U_B_PCUGs_OD",
	"TRYK_U_B_PCUGs_gry_R",
	"TRYK_U_B_PCUGs_BLK_R",
	"TRYK_U_B_PCUGs_OD_R",
	"TRYK_U_Bts_GRYGRY_PCUs",
	"TRYK_U_Bts_UCP_PCUs",
	"TRYK_U_Bts_Wood_PCUs",
	"TRYK_U_Bts_PCUs",
	"TRYK_U_pad_j",
	"TRYK_U_pad_j_blk",
	"TRYK_U_pad_hood_Cl",
	"TRYK_U_pad_hood_Cl_blk",
	"TRYK_U_pad_hood_tan",
	"TRYK_U_pad_hood_Blk",
	"TRYK_U_pad_hood_CSATBlk",
	"TRYK_U_pad_hood_Blod",
	"TRYK_U_pad_hood_odBK",
	"TRYK_U_pad_hood_BKT2",
	"TRYK_hoodie_Blk",
	"TRYK_hoodie_FR",
	"TRYK_hoodie_Wood",
	"TRYK_hoodie_3c",
	"TRYK_T_camo_tan",
	"TRYK_T_camo_3c",
	"TRYK_T_camo_Wood",
	"TRYK_T_camo_wood_marpat",
	"TRYK_T_camo_Desert_marpat",
	"TRYK_T_camo_3c_BG",
	"TRYK_T_camo_Wood_BG",
	"TRYK_T_camo_wood_marpat_BG",
	"TRYK_T_camo_desert_marpat_BG",
	"TRYK_T_PAD",
	"TRYK_T_OD_PAD",
	"TRYK_T_TAN_PAD",
	"TRYK_T_BLK_PAD",
	"TRYK_T_T2_PAD",
	"TRYK_T_CSAT_PAD",
	"TRYK_U_nohoodPcu_gry",
	"TRYK_U_hood_nc",
	"TRYK_U_hood_mc",
	"TRYK_U_denim_hood_blk",
	"TRYK_U_denim_hood_mc",
	"TRYK_U_denim_hood_3c",
	"TRYK_U_denim_hood_nc",
	"TRYK_U_denim_jersey_blu",
	"TRYK_U_denim_jersey_blk",
	"TRYK_shirts_PAD",
	"TRYK_shirts_OD_PAD",
	"TRYK_shirts_TAN_PAD",
	"TRYK_shirts_BLK_PAD",
	"TRYK_shirts_PAD_BK",
	"TRYK_shirts_OD_PAD_BK",
	"TRYK_shirts_TAN_PAD_BK",
	"TRYK_shirts_BLK_PAD_BK",
	"TRYK_shirts_PAD_BLW",
	"TRYK_shirts_OD_PAD_BLW",
	"TRYK_shirts_TAN_PAD_BLW",
	"TRYK_shirts_BLK_PAD_BLW",
	"TRYK_shirts_PAD_YEL",
	"TRYK_shirts_OD_PAD_YEL",
	"TRYK_shirts_TAN_PAD_YEL",
	"TRYK_shirts_BLK_PAD_YEL",
	"TRYK_shirts_PAD_RED2",
	"TRYK_shirts_OD_PAD_RED2",
	"TRYK_shirts_TAN_PAD_RED2",
	"TRYK_shirts_BLK_PAD_RED2",
	"TRYK_shirts_PAD_BLU3",
	"TRYK_shirts_OD_PAD_BLU3",
	"TRYK_shirts_TAN_PAD_BLU3",
	"TRYK_shirts_BLK_PAD_BLU3",
	"TRYK_shirts_DENIM_R",
	"TRYK_shirts_DENIM_BL",
	"TRYK_shirts_DENIM_BK",
	"TRYK_shirts_DENIM_WH",
	"TRYK_shirts_DENIM_BWH",
	"TRYK_shirts_DENIM_RED2",
	"TRYK_shirts_DENIM_WHB",
	"TRYK_shirts_DENIM_ylb",
	"TRYK_shirts_DENIM_od",
	"TRYK_shirts_DENIM_R_Sleeve",
	"TRYK_shirts_DENIM_BL_Sleeve",
	"TRYK_shirts_DENIM_BK_Sleeve",
	"TRYK_shirts_DENIM_WH_Sleeve",
	"TRYK_shirts_DENIM_BWH_Sleeve",
	"TRYK_shirts_DENIM_RED2_Sleeve",
	"TRYK_shirts_DENIM_WHB_Sleeve",
	"TRYK_shirts_DENIM_ylb_Sleeve",
	"TRYK_shirts_DENIM_od_Sleeve",
	"TRYK_shirts_PAD_BL",
	"TRYK_shirts_OD_PAD_BL",
	"TRYK_shirts_TAN_PAD_BL",
	"TRYK_shirts_BLK_PAD_BL",
	"TRYK_U_taki_wh",
	"TRYK_U_taki_COY",
	"TRYK_U_taki_BL",
	"TRYK_U_taki_BLK",
	"TRYK_U_Bts_PCUGs",
	"TRYK_U_Bts_PCUODs",
	"TRYK_U_taki_G_WH",
	"TRYK_U_taki_G_COY",
	"TRYK_U_taki_G_BL",
	"TRYK_U_taki_G_BLK",
	"TRYK_U_B_PCUHs",
	"TRYK_U_B_PCUGHs",
	"TRYK_U_B_PCUODHs",
	"TRYK_B_USMC_R",
	"TRYK_B_USMC_R_ROLL",
	"TRYK_ZARATAKI",
	"TRYK_ZARATAKI2",
	"TRYK_ZARATAKI3",
	"TRYK_B_TRYK_UCP_T",
	"TRYK_B_TRYK_3C_T",
	"TRYK_B_TRYK_MTP_T",
	"TRYK_B_TRYK_OCP_T",
	"TRYK_B_TRYK_OCP_D_T",
	"TRYK_DMARPAT_T",
	"TRYK_C_AOR2_T",
	"TRYK_U_B_Sage_T",
	"TRYK_U_B_Wood_T",
	"TRYK_U_B_BLTAN_T",
	"TRYK_U_B_BLOD_T",
	"TRYK_OVERALL_flesh",
	"TRYK_OVERALL_nok_flesh",
	"TRYK_OVERALL_SAGE_BLKboots",
	"TRYK_OVERALL_SAGE_BLKboots_nk_blk",
	"TRYK_OVERALL_SAGE_BLKboots_nk",
	"TRYK_OVERALL_SAGE_BLKboots_nk_blk2",
	"TRYK_OVERALL_SAGE",
	"TRYK_SUITS_BLK_F",
	"TRYK_SUITS_BR_F",
	"TRYK_U_B_PCUHsW",
	"TRYK_U_B_PCUHsW2",
	"TRYK_U_B_PCUHsW3",
	"TRYK_U_B_PCUHsW3nh",
	"TRYK_U_B_PCUHsW4",
	"TRYK_U_B_PCUHsW5",
	"TRYK_U_B_PCUHsW6",
	"U_B_T_Soldier_F",
	"U_B_T_Soldier_AR_F",
	"U_B_T_Soldier_SL_F",
	"U_B_CTRG_Soldier_F",
	"U_B_CTRG_Soldier_2_F",
	"U_B_CTRG_Soldier_3_F",
	"U_B_GEN_Soldier_F",
	"U_B_GEN_Commander_F",
	"U_O_T_Officer_F",
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
	"U_B_CTRG_Soldier_urb_3_F",
	"U_LIB_BasicBody",
	"U_LIB_GER_Soldier_camo",
	"U_LIB_GER_Pionier",
	"U_LIB_GER_LW_pilot",
	"U_LIB_GER_Officer_camo",
	"U_LIB_GER_Funker",
	"U_LIB_GER_Schutze",
	"U_LIB_GER_Art_schutze",
	"U_LIB_GER_Oberschutze",
	"U_LIB_GER_Gefreiter",
	"U_LIB_GER_Unterofficer",
	"U_LIB_GER_Art_unterofficer",
	"U_LIB_GER_Recruit",
	"U_LIB_GER_Medic",
	"U_LIB_GER_Leutnant",
	"U_LIB_GER_Art_leutnant",
	"U_LIB_GER_Oberleutnant",
	"U_LIB_GER_Hauptmann",
	"U_LIB_GER_Oberst",
	"U_LIB_GER_Scharfschutze",
	"U_LIB_GER_MG_schutze",
	"U_LIB_SOV_Strelok",
	"U_LIB_SOV_Strelokart",
	"U_LIB_SOV_Tank_private_field",
	"U_LIB_SOV_Starshina",
	"U_LIB_SOV_Efreitor",
	"U_LIB_SOV_Sergeant",
	"U_LIB_SOV_Sergeant_inset_pocket",
	"U_LIB_SOV_Stsergeant",
	"U_LIB_SOV_Leutenant",
	"U_LIB_SOV_Pilot",
	"U_LIB_SOV_Leutenant_inset_pocket",
	"U_LIB_SOV_Artleutenant",
	"U_LIB_SOV_Stleutenant",
	"U_LIB_SOV_Kapitan",
	"U_LIB_SOV_Razvedchik_am",
	"U_LIB_SOV_Razvedchik_lis",
	"U_LIB_SOV_Razvedchik_mix",
	"U_LIB_SOV_Sniper",
	"U_LIB_SOV_Tank_ryadovoi",
	"U_LIB_SOV_Tank_sergeant",
	"U_LIB_SOV_Tank_leutenant",
	"U_LIB_SOV_Tank_kapitan",
	"U_LIB_US_Private",
	"U_LIB_US_Private_1st",
	"U_LIB_US_Corp",
	"U_LIB_US_Sergant",
	"U_LIB_US_Snipe",
	"U_LIB_US_Eng",
	"U_LIB_US_Med",
	"U_LIB_US_Off",
	"U_LIB_US_Cap",
	"U_LIB_GER_Tank_crew_private",
	"U_LIB_GER_Tank_crew_unterofficer",
	"U_LIB_GER_Tank_crew_leutnant",
	"U_LIB_GER_Spg_crew_private",
	"U_LIB_GER_Spg_crew_unterofficer",
	"U_LIB_GER_Spg_crew_leutnant",
	"U_LIB_GER_LW_pilot_w",
	"U_LIB_WP_Soldier_camo_1_w",
	"U_LIB_WP_Soldier_camo_2_w",
	"U_LIB_WP_Soldier_camo_3_w",
	"U_LIB_SOV_Strelokart_w",
	"U_LIB_SOV_Tank_private_field_w",
	"U_LIB_SOV_Sergeant_inset_pocket_w",
	"U_LIB_SOV_Pilot_w",
	"U_LIB_SOV_Leutenant_inset_pocket_w",
	"U_LIB_SOV_Tank_ryadovoi_w",
	"U_LIB_SOV_Tank_sergeant_w",
	"U_LIB_SOV_Tank_leutenant_w",
	"U_LIB_SOV_Tank_kapitan_w",
	"U_LIB_US_Private_w",
	"U_LIB_US_Private_1st_w",
	"U_LIB_US_Corp_w",
	"U_LIB_US_Sergant_w",
	"U_LIB_US_Snipe_w",
	"U_LIB_US_Eng_w",
	"U_LIB_US_Med_w",
	"U_LIB_US_Off_w",
	"U_LIB_US_Cap_w",
	"U_LIB_GER_Tank_crew_private_w",
	"U_LIB_GER_Tank_crew_unterofficer_w",
	"U_LIB_GER_Tank_crew_leutnant_w",
	"U_LIB_GER_Spg_crew_private_w",
	"U_LIB_GER_Spg_crew_unterofficer_w",
	"U_LIB_GER_Spg_crew_leutnant_w"
];

_headgear = [
	"TRYK_ESS_CAP",
	"TRYK_ESS_CAP_OD",
	"TRYK_ESS_CAP_tan",
	"TRYK_R_CAP_BLK",
	"TRYK_R_CAP_TAN",
	"TRYK_R_CAP_OD_US",
	"TRYK_r_cap_tan_Glasses",
	"TRYK_r_cap_blk_Glasses",
	"TRYK_r_cap_od_Glasses",
	"TRYK_H_headsetcap_Glasses",
	"TRYK_H_headsetcap_blk_Glasses",
	"TRYK_H_headsetcap_od_Glasses",
	"TRYK_Kio_Balaclava",
	"HelmetBase",
	"H_HelmetB_paint",
	"H_Booniehat_khk",
	"H_Booniehat_oli",
	"H_Booniehat_indp",
	"H_Booniehat_mcamo",
	"H_Booniehat_grn",
	"H_Booniehat_tan",
	"H_Booniehat_dirty",
	"H_Booniehat_dgtl",
	"H_Booniehat_khk_hs",
	"H_HelmetB_plain_mcamo",
	"H_HelmetB_plain_blk",
	"H_HelmetIA_net",
	"H_HelmetIA_camo",
	"H_Helmet_Kerry",
	"H_Cap_red",
	"H_Cap_blu",
	"H_Cap_oli",
	"H_Cap_headphones",
	"H_Cap_tan",
	"H_Cap_blk",
	"H_Cap_blk_CMMG",
	"H_Cap_brn_SPECOPS",
	"H_Cap_tan_specops_US",
	"H_Cap_khaki_specops_UK",
	"H_Cap_grn",
	"H_Cap_grn_BI",
	"H_Cap_blk_Raven",
	"H_Cap_blk_ION",
	"H_Cap_oli_hs",
	"H_Cap_press",
	"H_Cap_usblack",
	"H_Cap_surfer",
	"H_Cap_police",
	"H_MilCap_ocamo",
	"H_MilCap_mcamo",
	"H_MilCap_oucamo",
	"H_MilCap_rucamo",
	"H_MilCap_gry",
	"H_MilCap_dgtl",
	"H_MilCap_blue",
	"H_BandMask_blk",
	"H_BandMask_khk",
	"H_BandMask_reaper",
	"H_BandMask_demon",
	"H_Bandanna_surfer",
	"H_Bandanna_khk",
	"H_Bandanna_khk_hs",
	"H_Bandanna_cbr",
	"H_Bandanna_sgg",
	"H_Bandanna_sand",
	"H_Bandanna_surfer_blk",
	"H_Bandanna_surfer_grn",
	"H_Bandanna_gry",
	"H_Bandanna_blu",
	"H_Bandanna_camo",
	"H_Bandanna_mcamo",
	"H_Shemag_khk",
	"H_Shemag_tan",
	"H_Shemag_olive",
	"H_Shemag_olive_hs",
	"H_ShemagOpen_khk",
	"H_ShemagOpen_tan",
	"H_Beret_blk_POLICE",
	"H_Beret_red",
	"H_Beret_grn",
	"H_Beret_grn_SF",
	"H_Beret_brn_SF",
	"H_Beret_ocamo",
	"H_Beret_02",
	"H_Beret_Colonel",
	"H_Watchcap_blk",
	"H_Watchcap_cbr",
	"H_Watchcap_khk",
	"H_Watchcap_camo",
	"H_Watchcap_sgg",
	"H_TurbanO_blk",
	"H_StrawHat",
	"H_StrawHat_dark",
	"H_Hat_blue",
	"H_Hat_brown",
	"H_Hat_camo",
	"H_Hat_grey",
	"H_Hat_checker",
	"H_Hat_tan",
	"H_Cap_marshal",
	"CUP_H_C_MAGA_01",
	"CUP_H_C_TrackIR_01",
	"CUP_H_C_Ushanka_01",
	"CUP_H_C_Ushanka_02",
	"CUP_H_C_Ushanka_03",
	"CUP_H_C_Ushanka_04",
	"CUP_H_C_Beanie_01",
	"CUP_H_C_Beanie_02",
	"CUP_H_C_Beanie_03",
	"CUP_H_C_Beanie_04",
	"CUP_H_C_Beret_01",
	"CUP_H_C_Beret_02",
	"CUP_H_C_Beret_03",
	"CUP_H_C_Beret_04",
	"CUP_H_C_Policecap_01",
	"CUP_H_C_Fireman_Helmet_01",
	"CUP_H_BAF_Officer_Beret",
	"CUP_H_BAF_Officer_Beret_PRR_U",
	"CUP_H_BAF_Officer_Beret_PRR_O",
	"CUP_H_ChDKZ_Beret",
	"CUP_H_ChDKZ_Beanie",
	"CUP_H_ChDKZ_Cap",
	"CUP_H_Ger_Boonie_desert",
	"CUP_H_Ger_Boonie_Flecktarn",
	"CUP_H_NAPA_Fedora",
	"CUP_H_PMC_PRR_Headset",
	"CUP_H_PMC_EP_Headset",
	"CUP_H_PMC_Cap_Grey",
	"CUP_H_PMC_Cap_Tan",
	"CUP_H_PMC_Cap_Burberry",
	"CUP_H_PMC_Cap_Back_Grey",
	"CUP_H_PMC_Cap_Back_Tan",
	"CUP_H_PMC_Cap_Back_Burberry",
	"CUP_H_PMC_Cap_PRR_Grey",
	"CUP_H_PMC_Cap_PRR_Tan",
	"CUP_H_PMC_Cap_PRR_Burberry",
	"CUP_H_PMC_Cap_Back_PRR_Grey",
	"CUP_H_PMC_Cap_Back_PRR_Tan",
	"CUP_H_PMC_Cap_Back_PRR_Burberry",
	"CUP_H_PMC_Cap_EP_Grey",
	"CUP_H_PMC_Cap_EP_Tan",
	"CUP_H_PMC_Cap_EP_Burberry",
	"CUP_H_PMC_Cap_Back_EP_Grey",
	"CUP_H_PMC_Cap_Back_EP_Tan",
	"CUP_H_PMC_Cap_Back_EP_Burberry",
	"CUP_H_RACS_Beret_Blue",
	"CUP_H_RUS_Bandana_HS",
	"CUP_H_RUS_Beret_VDV",
	"CUP_H_RUS_Beret_Spetsnaz",
	"CUP_H_SLA_Boonie",
	"CUP_H_SLA_Beret",
	"CUP_H_SLA_BeanieGreen",
	"CUP_H_SLA_BeretRed",
	"CUP_H_TK_Lungee",
	"CUP_H_TK_Beret",
	"CUP_H_TKI_SkullCap_01",
	"CUP_H_TKI_SkullCap_02",
	"CUP_H_TKI_SkullCap_03",
	"CUP_H_TKI_SkullCap_04",
	"CUP_H_TKI_SkullCap_05",
	"CUP_H_TKI_SkullCap_06",
	"CUP_H_TKI_Lungee_01",
	"CUP_H_TKI_Lungee_02",
	"CUP_H_TKI_Lungee_03",
	"CUP_H_TKI_Lungee_04",
	"CUP_H_TKI_Lungee_05",
	"CUP_H_TKI_Lungee_06",
	"CUP_H_TKI_Lungee_Open_01",
	"CUP_H_TKI_Lungee_Open_02",
	"CUP_H_TKI_Lungee_Open_03",
	"CUP_H_TKI_Lungee_Open_04",
	"CUP_H_TKI_Lungee_Open_05",
	"CUP_H_TKI_Lungee_Open_06",
	"CUP_H_TKI_Pakol_1_01",
	"CUP_H_TKI_Pakol_1_02",
	"CUP_H_TKI_Pakol_1_03",
	"CUP_H_TKI_Pakol_1_04",
	"CUP_H_TKI_Pakol_1_05",
	"CUP_H_TKI_Pakol_1_06",
	"CUP_H_TKI_Pakol_2_01",
	"CUP_H_TKI_Pakol_2_02",
	"CUP_H_TKI_Pakol_2_03",
	"CUP_H_TKI_Pakol_2_04",
	"CUP_H_TKI_Pakol_2_05",
	"CUP_H_TKI_Pakol_2_06",
	"CUP_H_USArmy_Boonie",
	"CUP_H_USMC_Officer_Cap",
	"CUP_H_FR_Cap_Headset_Green",
	"CUP_H_FR_Cap_Officer_Headset",
	"CUP_H_FR_BandanaGreen",
	"CUP_H_FR_BandanaWdl",
	"CUP_H_FR_BoonieMARPAT",
	"CUP_H_FR_BoonieWDL",
	"CUP_H_FR_BeanieGreen",
	"CUP_H_FR_Headset",
	"CUP_H_FR_Bandana_Headset",
	"CUP_H_FR_Headband_Headset",
	"CUP_H_FR_PRR_BoonieWDL",
	"H_MilCap_tna_F",
	"H_MilCap_ghex_F",
	"H_Booniehat_tna_F",
	"H_Beret_gen_F",
	"H_MilCap_gen_F",
	"H_Cap_oli_Syndikat_F",
	"H_Cap_tan_Syndikat_F",
	"H_Cap_blk_Syndikat_F",
	"H_Cap_grn_Syndikat_F",
	"H_LIB_HelmetB",
	"H_LIB_GER_OfficerCap",
	"H_LIB_GER_Cap",
	"H_LIB_WP_Cap",
	"H_LIB_SOV_RA_PrivateCap",
	"H_LIB_SOV_RA_OfficerCap",
	"H_LIB_GER_TankOfficerCap",
	"H_LIB_GER_TankPrivateCap",
	"H_LIB_GER_SPGPrivateCap",
	"H_LIB_GER_OfficerCap_w",
	"H_LIB_GER_Cap_w",
	"H_LIB_GER_LW_PilotHelmet_w",
	"H_LIB_WP_Helmet_w",
	"H_LIB_WP_Helmet_camo_w",
	"H_LIB_WP_Helmet_med_w",
	"H_LIB_WP_Cap_w",
	"H_LIB_SOV_RA_PrivateCap_w",
	"H_LIB_SOV_RA_OfficerCap_w",
	"H_LIB_SOV_TankHelmet_w",
	"H_LIB_SOV_PilotHelmet_w",
	"H_LIB_US_Helmet_w",
	"H_LIB_US_Helmet_Net_w",
	"H_LIB_US_Helmet_Med_w",
	"H_LIB_US_Helmet_Cap_w",
	"H_LIB_US_Helmet_First_lieutenant_w",
	"H_LIB_US_Helmet_Second_lieutenant_w",
	"H_LIB_GER_TankOfficerCap_w",
	"H_LIB_GER_TankPrivateCap_w",
	"H_LIB_GER_SPGPrivateCap_w"
];

_facewear = [
	"TRYK_US_ESS_Glasses",
	"TRYK_US_ESS_Glasses_WH",
	"TRYK_US_ESS_Glasses_BLK",
	"TRYK_US_ESS_Glasses_TAN",
	"TRYK_US_ESS_Glasses_TAN_BLK",
	"TRYK_SPGEAR_Glasses",
	"TRYK_headset_Glasses",
	"TRYK_SpsetG_Glasses",
	"TRYK_Spset_PHC1_Glasses",
	"TRYK_Spset_PHC2_Glasses",
	"TRYK_kio_balaclava_WH",
	"TRYK_kio_balaclava_BLK",
	"TRYK_kio_balaclavas",
	"TRYK_kio_balaclava_BLK_ear",
	"TRYK_kio_balaclava_ear",
	"TRYK_kio_balaclava_ESS",
	"TRYK_headset2_glasses",
	"TRYK_Shemagh",
	"TRYK_Shemagh_mesh",
	"TRYK_Shemagh_G",
	"TRYK_Shemagh_WH",
	"TRYK_Shemagh_shade",
	"TRYK_Shemagh_shade_G",
	"TRYK_Shemagh_shade_WH",
	"TRYK_Shemagh_shade_MH",
	"TRYK_Shemagh_ESS",
	"TRYK_Shemagh_ESS_G",
	"TRYK_Shemagh_ESS_WH",
	"TRYK_Shemagh_EAR_TAN",
	"TRYK_Shemagh_EAR_G",
	"TRYK_Shemagh_EAR_WH",
	"TRYK_TAC_EARMUFF_Gs",
	"TRYK_TAC_SET_bn",
	"TRYK_NOMIC_TAC_EARMUFF_Gs",
	"TRYK_TAC_EARMUFF_SHADE_Gs",
	"TRYK_TAC_SET_TAN",
	"TRYK_TAC_SET_OD",
	"TRYK_TAC_SET_WH",
	"TRYK_TAC_SET_MESH",
	"TRYK_TAC_SET_TAN_2",
	"TRYK_TAC_SET_OD_2",
	"TRYK_TAC_SET_WH_2",
	"TRYK_TAC_SET_MESH_2",
	"TRYK_bandana_g",
	"G_Spectacles",
	"G_Spectacles_Tinted",
	"G_Combat",
	"G_Lowprofile",
	"G_Shades_Black",
	"G_Shades_Green",
	"G_Shades_Red",
	"G_Squares",
	"G_Squares_Tinted",
	"G_Sport_BlackWhite",
	"G_Sport_Blackyellow",
	"G_Sport_Greenblack",
	"G_Sport_Checkered",
	"G_Sport_Red",
	"G_Tactical_Black",
	"G_Aviator",
	"G_Lady_Mirror",
	"G_Lady_Dark",
	"G_Lady_Red",
	"G_Lady_Blue",
	"G_Balaclava_blk",
	"G_Balaclava_oli",
	"G_Balaclava_combat",
	"G_Balaclava_lowprofile",
	"G_Bandanna_blk",
	"G_Bandanna_oli",
	"G_Bandanna_khk",
	"G_Bandanna_tan",
	"G_Bandanna_beast",
	"G_Bandanna_shades",
	"G_Bandanna_sport",
	"G_Bandanna_aviator",
	"G_Shades_Blue",
	"G_Sport_Blackred",
	"G_Tactical_Clear",
	"CUP_TK_NeckScarf",
	"CUP_FR_NeckScarf",
	"CUP_FR_NeckScarf2",
	"TRYK_Beard",
	"TRYK_Beard_BW",
	"TRYK_Beard_BK",
	"TRYK_Beard_Gr",
	"TRYK_Beard2",
	"TRYK_Beard_BW2",
	"TRYK_Beard_BK2",
	"TRYK_Beard_Gr2",
	"TRYK_Beard3",
	"TRYK_Beard_BW3",
	"TRYK_Beard_BK3",
	"TRYK_Beard_Gr3",
	"TRYK_Beard4",
	"TRYK_Beard_BW4",
	"TRYK_Beard_BK4",
	"TRYK_Beard_Gr4",
	"TRYK_shoulder_armor_BK",
	"TRYK_shoulder_armor_OD",
	"TRYK_shoulder_armor_CY",
	"G_Balaclava_TI_blk_F",
	"G_Balaclava_TI_tna_F",
	"G_Balaclava_TI_G_blk_F",
	"G_Balaclava_TI_G_tna_F",
	"G_Combat_Goggles_tna_F"
];


[missionNameSpace,_uniforms+_headgear+_facewear,true] call BIS_fnc_addVirtualItemCargo;	


