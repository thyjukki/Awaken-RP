// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: drink.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Drink, and replenish your thrist
//@file Argument: The amount of thirst to replenish

#define ERR_CANCELLED "Drinking Cancelled";
#define ANIMATION "AinvPknlMstpSnonWnonDnon_healed_1"
private ["_checks", "_hasFailed"];

_item = _this select 0;

 _amount = getNumber( configFile >> "cfgMagazines" >> _item >> "value");
_giveConf = (configFile >> "cfgMagazines" >> _item >> "give");
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
			_text = format["Drinking %1 %2%3 Complete", _name, round(100*_progress), "%"];
		};
	};
	[_failed, _text];
};

_success = [2.5, ANIMATION, _hasFailed, []] call a3w_actions_start;
if (_success) then {
	thirstLevel = (thirstLevel + _amount) min 100;
	["Your thirst has eased", 5] call mf_notify_client;

	player removeItem _item;
	_dam = damage  player;
	_dam = 0.0 max (_dam - 0.05);

	player setDamage _dam;

	if (isText(_giveConf)) then
	{
		_give = getText(_giveConf);
		player addItem _give;
	};

	hint "";
};

_success
