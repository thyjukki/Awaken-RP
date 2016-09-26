// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: boilWater.sqf
//	@file Author: Jukki
//	@file Description: Boiling water

#define DURATION 10
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"

#define FORMAT2(STR1,STR2) format ["%1 %2", STR1, STR2]
#define ERR_FAILED "Boiling water failed!"
#define ERR_IN_VEHICLE "You can't do that in a vehicle."
#define ERR_CANCELLED "Boiling water cancelled!"

private _checks =
{
	params ["_progress", "_vehicle"];
	private _failed = true;
	private _text = "";

	switch (true) do
	{
		case (!alive player): {}; // player is dead, no need for a notification
		case (vehicle player != player): { _text = FORMAT2(ERR_FAILED, ERR_IN_VEHICLE) };
		case (doCancelAction): { _text = ERR_CANCELLED; doCancelAction = false };
		default
		{
			_text = format ["Boiling water %1%2 complete", round(100 * _progress), "%"];
			_failed = false;
		};
	};

	[_failed, _text]
};

private _success = [DURATION, ANIMATION, _checks, []] call a3w_actions_start;

if (_success) then
{
	_qty = 0;
	_qty = _qty  + ({_x == "rb_canteen_salt"} count magazines player);
	_qty = _qty + ({_x == "rb_canteen_dirty"} count magazines player);
	_qty = _qty + ({_x == "rb_bottlesalt"} count magazines player);
	_qty = _qty + ({_x == "rb_bottledirty"} count magazines player);
	for "_x" from 1 to _qty do {
		if ("rb_canteen_salt" in magazines player) then {
			player removeItem "rb_canteen_salt";
			player addItem "rb_canteen";
		};
        if ("rb_canteen_dirty" in magazines player) then {
            player removeItem "rb_canteen_dirty";
			player addItem "rb_canteen";
        };
        if ("rb_bottlesalt" in magazines player) then {
            player removeItem "rb_bottlesalt";
			player addItem "rb_bottleclean";
        };
		if ("rb_bottledirty" in magazines player) then {
			player removeItem "rb_bottledirty";
			player addItem "rb_bottleclean";
		};	

	};


	["Boiled water!", 5] call mf_notify_client;
};

_success
