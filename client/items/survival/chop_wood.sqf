// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: chop_wood.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00

#define ERR_CANCELLED "Chopping Wood Cancelled";
#define ANIMATION "AinvPknlMstpSnonWnonDnon_healed_1"
private ["_checks", "_hasFailed"];

// allowed trees list move this later
_trees = ["cl_leaf2","ind_timbers.p3d","t_larix3s.p3d","t_pyrus2s.p3d","str_briza_kriva.p3d","dd_borovice.p3d","les_singlestrom_b.p3d","les_singlestrom.p3d","smrk_velky.p3d","smrk_siroky.p3d","smrk_maly.p3d","les_buk.p3d","str krovisko vysoke.p3d","str_fikovnik_ker.p3d","str_fikovnik.p3d","str vrba.p3d","hrusen2.p3d","str dub jiny.p3d","str lipa.p3d","str briza.p3d","p_akat02s.p3d","jablon.p3d","p_buk.p3d","str_topol.p3d","str_topol2.p3d","p_osika.p3d","t_picea3f.p3d","t_picea2s.p3d","t_picea1s.p3d","t_fagus2w.p3d","t_fagus2s.p3d","t_fagus2f.p3d","t_betula1f.p3d","t_betula2f.p3d","t_betula2s.p3d","t_betula2w.p3d","t_alnus2s.p3d","t_acer2s.p3d","t_populus3s.p3d","t_quercus2f.p3d","t_sorbus2s.p3d","t_malus1s.p3d","t_salix2s.p3d","t_picea1s_w.p3d","t_picea2s_w.p3d","t_ficusb2s_ep1.p3d","t_populusb2s_ep1.p3d","t_populusf2s_ep1.p3d","t_amygdalusc2s_ep1.p3d","t_ficusb2s_ep1.p3d","t_pistacial2s_ep1.p3d","t_pinuse2s_ep1.p3d","t_pinuss3s_ep1.p3d","t_prunuss2s_ep1.p3d","t_pinusn2s.p3d","t_pinusn1s.p3d","t_pinuss2f.p3d","t_poplar2f_dead_pmc.p3d","misc_torzotree_pmc.p3d","misc_burnspruce_pmc.p3d","brg_cocunutpalm8.p3d","brg_umbrella_acacia01b.p3d","brg_jungle_tree_canopy_1.p3d","brg_jungle_tree_canopy_2.p3d","brg_cocunutpalm4.p3d","brg_cocunutpalm3.p3d","palm_01.p3d","palm_02.p3d","palm_03.p3d","palm_04.p3d","palm_09.p3d","palm_10.p3d","brg_cocunutpalm2.p3d","brg_jungle_tree_antiaris.p3d","brg_cocunutpalm1.p3d",

			// A2 trees
			"dd_borovice02.p3d",
			
			
			
			// Custom Arma3 Trees
			"t_BroussonetiaP1s_F.p3d",
			"t_FicusB1s_F.p3d",
			"t_FicusB2s_F.p3d",
			"t_FraxinusAV2s_F.p3d",
			"t_OleaE1s_F.p3d",
			"t_OleaE2s_F.p3d",
			"t_PhoenixC1s_F.p3d",
			"t_PhoenixC3s_F.p3d",
			"t_PinusP3s_F.p3d",
			"t_PinusS1s_F.p3d",
			"t_PinusS2s_b_F.p3d",
			"t_PinusS2s_F.p3d",
			"t_poplar2f_dead_F.p3d",
			"t_PopulusN3s_F.p3d",
			"t_QuercusIR2s_F.p3d",
			// Custom Esseker Trees 
		
			//(Large)
			"cwr2_a2_t_quercus3s.p3d",
			"mb_EnglishElm.p3d",
			"mb_t_ulmus_forest.p3d",
			"mb_t_ulmus_forestIvy.p3d",
			"mb_t_ulmus_large.p3d",
			"mb_t_ulmus_large_w.p3d",
			"mb_t_ulmus_largeIvy.p3d",
			"t_fagus2f.p3d",
			"t_fagus2f_summer.p3d",
			"t_FraxinusAV2s_F.p3d",
			"t_QuercusIR2s_F.p3d",
			// (Medium)
			"cwr_robinia1.p3d",
			"cwr2_a2_t_alnus2s.p3d",
			"cwr2_a2_t_betula2f.p3d",
			"cwr2_a2_t_fraxinus2s.p3d",
			"cwr2_a2_t_sorbus2s.p3d",
			"Elm_small_vertNormalsProjOut.p3d",
			"javor_posed.p3d",
			"les_dub_jiny.p3d",
			"mb_t_ulmus_small.p3d",
			"mb_t_ulmus_small_w.p3d",
			"mb_t_ulmus_smallIvy.p3d",

			"t_betula2s.p3d",
			"t_carpinus2s.p3d",
			"t_fagus2s.p3d",
			"t_FicusB2s_EP1.p3d",
			"t_pyrus2s.p3d",
			"t_quercus2f.p3d",
			// (Pine)
			"cwr_aleppopine.p3d",
			"cwr_seapine.p3d",

			"str_pinie.p3d",
			"t_PinusE2s_EP1.p3d",
			"t_pinusN1s.p3d",
			"t_pinusN2s.p3d",
			"t_PinusS1s_F.p3d",
			"t_pinusS2f.p3d",
			"t_PinusS2s_b_F.p3d",
			"t_PinusS2s_F.p3d",
			"t_PinusS3s_EP1.p3d",
			// (Populus)
			"str_topol.p3d",
			"str_topol2.p3d",
			"t_populus3s.p3d",
			"t_PopulusB2s_EP1.p3d",
			"t_PopulusF2s_EP1.p3d",
			"t_PopulusN3s_F.p3d",
			// (Small)
			"cwr_alder.p3d",
			"cwr2_a2_t_fagus2w.p3d",
			"hrusen2.p3d",
			"jablon.p3d",
			
			"str_briza_kriva.p3d",
			"str_briza_rovna.p3d",
			"t_AmygdalusC2s_EP1.p3d",
			"t_FicusB1s_F.p3d",
			"t_malus1s.p3d",
			"t_PistaciaL2s_EP1.p3d",
			"t_PrunusS2s_EP1.p3d",
			// (Spruce)
			"cwr_silverspruce_p.p3d",
			"cwr_silverspruce2.p3d",
			"cwr2_a2_t_larix3s.p3d",

			//Unknown
			"cwr2_a2_b_craet1.p3d",

			"les_singlestrom.p3d",
			"les_singlestrom_b.p3d",
			"Smrk_maly.p3d",
			"Smrk_siroky.p3d",
			"Smrk_velky.p3d",
			"t_JuniperusC2s_EP1.p3d",
			"t_picea1s.p3d",
			"t_picea2s.p3d",
			"t_picea3f.p3d",
			"str briza.p3d",
			"str habr.p3d",
			"str javor.p3d",
			"str krovisko vysoke.p3d",
			"str osika.p3d",
			"str buk.p3d",
			"str dub.p3d",
			"str kastan.p3d",
			"str lipa.p3d",
			"str jalovec.p3d",
			"str jalovec.p3d",
			"str vrba"
];
_findNearestTree = objNull;

{
	_objInfo = toArray(str(_x));
	_lenInfo = count _objInfo - 1;
	_objName = [];
	_i = 0;
	// determine where the object name starts
	{
		if (58 == _objInfo select _i) exitWith {};
		_i = _i + 1;
	} forEach _objInfo;
	_i = _i + 2; // skip the ": " part
	
	for "_k" from _i to _lenInfo do {
		_objName = _objName + [_objInfo select _k];
	};
	_objName = toLower(toString(_objName));

	diag_log _objName;
	// Exit since we found a tree
	if (_objName in _trees) exitWith { _findNearestTree = _x; };
} foreach nearestObjects [getPosATL player, [], 8];

diag_log str _findNearestTree;

if (isNull _findNearestTree) exitWith {
	["You need to be close to a tree to chop wood", 5] call mf_notify_client;
	hint "";
    false
};

_hasFailed = {
	private ["_progress","_failed", "_text"];
	_progress = _this select 0;
	_text = "";
	_failed = true;
	switch (true) do {
		case (!alive player) : {}; // player is dead, not need for a error message
		case (doCancelAction): {doCancelAction = false; _text = ERR_CANCELLED;};
		default {
			_failed = false;
			_text = format["Chopping wood %1%2 Complete", round(100*_progress), "%"];
		};
	};
	[_failed, _text];
};

_success = [5, ANIMATION, _hasFailed, []] call a3w_actions_start;
if (_success) then {
	_holder = createVehicle ["groundweaponholder",position player, [], 0, "can_Collide"];    
	_holder additemcargoglobal ["rb_woodpile",1];
	["You choped some wood", 5] call mf_notify_client;
	hint "";
};

_success
