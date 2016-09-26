// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: refill.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Refill an empty jerrycan
//@file Argument: [player, player, _actionid, []] the standard "called by an action" values

#define DURATION 5
#define ANIMATION "AinvPknlMstpSlayWrflDnon_medic"
#define ERR_IN_VEHICLE "Filling Jerrycan Failed! You can't do that while in a vehicle"
#define ERR_CANCELLED "Filling Jerrycan Cancelled!"

private ["_container", "_error"];
_container = cursorTarget;

_error = [_container] call mf_jerrycan_can_refill;
if (_error != "") exitWith {[_error, 5] call mf_notify_client; false;};

private ["_duration", "_anim", "_args", "_checks", "_success"];
_args = [_container]; // arguments to pass in to _check.
_checks = {
	private ["_progress","_container","_failed", "_text"];
	_progress = _this select 0;
	_container = _this select 1;
	_text = "";
	_failed = true;
	switch (true) do {
		case (!alive player): {}; // player is dead, no need for a notification
		case (vehicle player != player): {_text = ERR_IN_VEHICLE};
		case (doCancelAction): {_text = ERR_CANCELLED; doCancelAction = false;};
		default {
			_text = format["Refilling Jerrycan %1%2 Complete", round(100 * _progress), "%"];
			_failed = false;
		};
	};
	[_failed, _text];
};
_success = [DURATION, ANIMATION, _checks, [_container]] call a3w_actions_start;
if (_success) then {
    player removeItem "rb_Fuelcan_empty";
	player addItem "rb_Fuelcan";
	["Refilling Jerrycan Completed!", 5] call mf_notify_client;
};
false;
