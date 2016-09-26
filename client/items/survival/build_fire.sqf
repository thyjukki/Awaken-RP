// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: build_fire.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Drink, and replenish your thrist
//@file Argument: The amount of thirst to replenish

#define ERR_CANCELLED "Building fire Cancelled";
#define ANIMATION "AinvPknlMstpSnonWnonDnon_healed_1"
private ["_checks", "_hasFailed"];


if (!("rb_WoodPile" in magazines player)) exitWith {
	["You need pile of wood to start fire", 5] call mf_notify_client;
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
			_text = format["Building Fire %1%2 Complete", round(100*_progress), "%"];
		};
	};
	[_failed, _text];
};

_success = [5, ANIMATION, _hasFailed, []] call a3w_actions_start;
if (_success) then {
	player removeItem "rb_WoodPile";
    _fireplace = createVehicle ["Land_FirePlace_F",[(getpos player select 0),(getpos player select 1),(getpos player select 2) ], [], 0, "can_collide"];
    _fireplace setpos  (player modelToWorld [0,1,0]);
	["You have built a fireplace", 5] call mf_notify_client;
	hint "";
};

_success
