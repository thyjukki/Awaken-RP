// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: refillWater.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Drink, and replenish your thrist
//@file Argument: The amount of thirst to replenish

#define ERR_CANCELLED "Filling bottle Cancelled";
#define ANIMATION "AinvPknlMstpSnonWnonDnon_healed_1"
private ["_checks", "_hasFailed"];

_item = _this select 0;

_name = getText(configFile >> "cfgMagazines" >> _item >> "displayName");

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
			_text = format["Filling %1 %2%3 Complete", _name, round(100*_progress), "%"];
		};
	};
	[_failed, _text];
};

_success = [5, ANIMATION, _hasFailed, []] call a3w_actions_start;
if (_success) then {
	[format["You filled your %1", _name], 5] call mf_notify_client;

	player removeItem _item;

	if (_item == "rb_bottle") then
	{
		player addItem "rb_bottledirty";
	};
	if (_item == "rb_canteen_empty") then
	{
		player addItem "rb_canteen";
	};

	hint "";
};

_success
