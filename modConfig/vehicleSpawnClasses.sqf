// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleSpawnClasses.sqf
//	@file Author: AgentRev

A3W_smallVehicles =
[
	"C_Quadbike_01_F",
	"CUP_B_M1030",
	["B_Quadbike_01_F", "O_Quadbike_01_F", "I_Quadbike_01_F", "I_G_Quadbike_01_F"]
];

//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_SUV_01_F",
	"C_Offroad_01_F",
	"CUP_C_Skoda_Blue_CIV",
	"CUP_C_Skoda_Green_CIV",
	"CUP_C_Skoda_Red_CIV",
	"CUP_C_Skoda_White_CIV",
	"CUP_C_Datsun",
	"CUP_C_Datsun_4seat",
	"CUP_C_Datsun_Covered",
	"CUP_C_Datsun_Plain",
	"CUP_C_Datsun_Tubeframe",
	"CUP_C_Golf4_black_Civ",
	"CUP_C_Golf4_blue_Civ",
	"CUP_C_Golf4_camo_Civ",
	"CUP_C_Golf4_camodigital_Civ",
	"CUP_C_Golf4_camodark_Civ",
	"CUP_C_Golf4_green_Civ",
	"CUP_C_Golf4_kitty_Civ",
	"CUP_C_Golf4_crowe_Civ",
	"CUP_C_Golf4_red_Civ",
	"CUP_C_Golf4_reptile_Civ",
	"CUP_C_Golf4_whiteblood_Civ",
	"CUP_C_Golf4_yellow_Civ",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_01_F",
	"C_Offroad_01_repair_F",
	"CUP_C_Octavia_CIV",
	"C_SUV_01_F",
	"B_GEN_Offroad_01_gen_F",
	["C_Van_01_box_F", "C_Van_01_transport_F"]
];

trucksVehicles =
[
	"C_Van_01_fuel_F",
	"C_Van_01_transport_F",
	"C_Van_01_box_F",
	"CUP_C_Ural_Civ_01",
	"CUP_C_Ural_Open_Civ_01",
	"CUP_C_Ural_Civ_03",
	"CUP_C_Ural_Open_Civ_03",
	"CUP_C_Ural_Civ_02",
	"CUP_C_Ural_Open_Civ_02",
	"C_Truck_02_fuel_F",
	"C_Truck_02_transport_F",
	"C_Truck_02_covered_F",
	"CUP_C_V3S_Open_TKC",
	"CUP_C_V3S_Covered_TKC",
	"CUP_O_Ural_RU",
	"CUP_B_MTVR_USMC",
	"CUP_O_Ural_Open_RU"
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	"CUP_C_SUV_CIV",
	"CUP_C_LR_Transport_CTK",
	"CUP_C_UAZ_Unarmed_TK_CIV",
	"CUP_C_UAZ_Open_TK_CIV",
	"CUP_O_UAZ_Unarmed_RU",
	"B_LSV_01_unarmed_F",
	"CUP_B_HMMWV_Transport_USA",
	"CUP_B_UAZ_Unarmed_CDF",
	"CUP_B_UAZ_Open_CDF",
	"CUP_B_LR_Transport_GB_W",
	"CUP_O_LR_Transport_TKA",
	"CUP_O_UAZ_Unarmed_TKA",
	"CUP_I_UAZ_Unarmed_UN"
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
	"CUP_C_SUV_TK",
	"CUP_O_Datsun_PK",
	"CUP_O_UAZ_MG_RU",
	"B_LSV_01_armed_F",
	"I_G_Offroad_01_armed_F",
	"CUP_I_Datsun_PK",
	"CUP_I_Datsun_PK_TK_Random",
	"CUP_O_UAZ_MG_TKA"
];

//Water Vehicles - Random Spawns
waterVehicles =
[
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_F",
	["C_Boat_Civil_01_police_F", "C_Boat_Civil_01_rescue_F"],
	["B_Boat_Armed_01_minigun_F", "O_Boat_Armed_01_hmg_F", "I_Boat_Armed_01_minigun_F"]
];

//Object List - Random Spawns.
staticWeaponsList =
[
	"B_Mortar_01_F",
	"O_Mortar_01_F",
	"I_Mortar_01_F",
	"I_G_Mortar_01_F"
];

//Object List - Random Helis.
staticHeliList =
[
	"C_Heli_Light_01_civil_F",
	"B_Heli_Light_01_F",
	"O_Heli_Light_02_unarmed_F",
	"I_Heli_light_03_unarmed_F"
	// don't put cargo helicopters here, it doesn't make sense to find them in towns; they spawn in the CivHeli mission
];

//Object List - Random Planes.
staticPlaneList =
[
	//["B_Plane_CAS_01_F", "O_Plane_CAS_02_F"],
	"I_Plane_Fighter_03_CAS_F"
];

A3W_planeSpawnOdds = 0.25; // 0.0 to 1.0

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	["SMG_01_F" /*Vermin*/, "SMG_02_F" /*Sting*/, "hgun_PDW2000_F"],
	["arifle_TRG20_F", "arifle_TRG21_F", "arifle_TRG21_GL_F"],
	["arifle_Mk20C_F", "arifle_Mk20_F", "arifle_Mk20_GL_F"],
	["arifle_Katiba_F", "arifle_Katiba_C_F", "arifle_Katiba_GL_F"],
	["arifle_MXC_F", "arifle_MX_F", "arifle_MX_GL_F", "arifle_MXM_F"],
	["srifle_EBR_F", "srifle_DMR_01_F"],
	["arifle_MX_SW_F", "LMG_Mk200_F", "LMG_Zafir_F"]
];

vehicleAddition =
[
	"muzzle_snds_L", // 9mm
	"muzzle_snds_M", // 5.56mm
	"muzzle_snds_H", // 6.5mm
	"muzzle_snds_H_MG", // 6.5mm LMG
	"muzzle_snds_B", // 7.62mm
	"muzzle_snds_acp", // .45 ACP
	"optic_Arco",
	"optic_SOS",
	"optic_Hamr",
	"optic_Aco",
	"optic_ACO_grn",
	"optic_aco_smg",
	"optic_Holosight",
	"optic_Holosight_smg",
	"acc_flashlight",
	"acc_pointer_IR",
	"Medikit",
	"Medikit",
	"FirstAidKit",
	"ToolKit"
];

vehicleAddition2 =
[
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_yellow",
	"Chemlight_red"
];
