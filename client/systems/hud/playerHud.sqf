// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: playerHud.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, [KoS] Bewilderbeest
//	@file Created: 11/09/2012 04:23
//	@file Args:

#define hud_food_border_idc 3600
#define hud_blood_border_idc 3601
#define hud_thirst_border_idc 3602
#define hud_food_inside_idc 3603
#define hud_blood_inside_idc 3604
#define hud_thirst_inside_idc 3605

scriptName "playerHud";

disableSerialization;
private ["_blood", "_food", "_thirst", "_bloodLvl", "_thirstLvl", "_foodLvl", "_activityIconOrigPos", "_activityTextboxOrigPos", "_dispUnitInfo", "_topLeftBox", "_topLeftBoxPos"];


_survivalSystem = ["A3W_survivalSystem"] call isConfigOn;
_unlimitedStamina = ["A3W_unlimitedStamina"] call isConfigOn;

private ["_mapCtrls", "_mapCtrl"];
_ui = displayNull;

while {true} do
{
	sleep 0.1;

	if (isNull _ui) then
	{
		1000 cutRsc ["WastelandHud","PLAIN"];
		_ui = uiNamespace getVariable ["WastelandHud", displayNull];
	};


	_flash = {
	if (ctrlShown _this) then {
			_this ctrlShow false;
		} else {
			_this ctrlShow true;
		};
	};
	
	//Calculate Health 0 - 100
	_blood = ((1 - damage player)) max 0;
	_food = ceil (hungerLevel max 0) / 100.0;
	_thirst = ceil (thirstLevel max 0) / 100.0;

	_bloodLvl = 6 min (0 max (round(6.0*(_blood))));
	_thirstLvl = 4 min (0 max (round(4.0*(_thirst))));
	_foodLvl = 4 min (0 max (round(4.0*(_food))));

	//hint format ["Blood: %1 (%2), Hunger: %3 (%4), Thirst: %5 (%6)", _blood, _bloodLvl, _food, _foodLvl, _thirst, _thirstLvl];
	//Controls
	_hudFoodBorder = _ui displayCtrl hud_food_border_idc;
	_hudFoodInside = _ui displayCtrl hud_food_inside_idc;
	_hudBloodBorder = _ui displayCtrl hud_blood_border_idc;
	_hudBloodInside = _ui displayCtrl hud_blood_inside_idc;
	_hudThirstBorder = _ui displayCtrl hud_thirst_border_idc;
	_hudThirstInside = _ui displayCtrl hud_thirst_inside_idc;

	_hudFoodBorder ctrlSetTextColor [1,1,1,1];
	_hudBloodBorder ctrlSetTextColor [1,1,1,1];
	_hudThirstBorder ctrlSetTextColor [1,1,1,1];

	GUI_R = 0.38; // 0.7 .38
	GUI_G = 0.63; // -0.63
	GUI_B = 0.26; // -0.26

	_hudBloodInside ctrlSetTextColor [(GUI_R + (0.3 * (1-_blood))),(GUI_G * _blood),(GUI_B * _blood), 1];
	_hudFoodInside ctrlSetTextColor [(GUI_R + (0.3 * (1-_food))),(GUI_G * _food),(GUI_B * _food), 1];
	_hudThirstInside ctrlSetTextColor [(GUI_R + (0.3 * (1-_thirst))),(GUI_G * _thirst),(GUI_B * _thirst), 1];

	// Icons in bottom right
	_bloodborderText = "client\icons\status\status_blood_border_CA.paa";
	_hudBloodBorder ctrlSetText _bloodborderText;

	if (_foodLvl < 0) then { _foodLvl = 0 };
	_foodInnerText = "client\icons\status\status_food_inside_" + str(_foodLvl) + "_ca.paa";

	if (_bloodLvl < 0) then { _bloodLvl = 0 };
	_bloodInnerText = "client\icons\status\status_blood_inside_" + str(_bloodLvl) + "_ca.paa";

	if (_thirstLvl < 0) then { _thirstLvl = 0 };
	_thirstInnerText = "client\icons\status\status_thirst_inside_" + str(_thirstLvl) + "_ca.paa";

	_hudFoodInside ctrlSetText _foodInnerText;
	_hudBloodInside ctrlSetText _bloodInnerText;
	_hudThirstInside ctrlSetText _thirstInnerText;


	//  Flashing
	if (_blood < 0.2) then {
		_hudBloodInside call _flash;
	} else {
		if (!ctrlShown _hudBloodInside) then {
			_hudBloodInside ctrlShow true;
		};
	};

	if (_thirst < 0.2) then {
		_hudThirstInside call _flash;
	} else {
		if (!ctrlShown _hudThirstInside) then {
			_hudThirstInside ctrlShow true;
		};
	};

	if (_food < 0.2) then {
		_hudFoodInside call _flash;
	} else {
		if (!ctrlShown _hudFoodInside) then {
			_hudFoodInside ctrlShow true;
		};
	};


	// Remove unrealistic blur effects
	if (!isNil "BIS_fnc_feedback_damageBlur" && {ppEffectCommitted BIS_fnc_feedback_damageBlur}) then { ppEffectDestroy BIS_fnc_feedback_damageBlur };
	if (!isNil "BIS_fnc_feedback_fatigueBlur" && {ppEffectCommitted BIS_fnc_feedback_fatigueBlur}) then { ppEffectDestroy BIS_fnc_feedback_fatigueBlur };

	// Voice monitoring
	[false] call fn_voiceChatControl;


	// Improve revealing and aimlocking of targetted vehicles
	{
		if (!isNull _x) then
		{
			if ((group player) knowsAbout _x < 4) then
			{
				(group player) reveal [_x, 4];
			};
		};
	} forEach [cursorTarget, cursorObject];

	if (isNil "A3W_missingMarkersNotice" && visibleMap) then
	{
		_cbMarkerColors = findDisplay 12 displayCtrl 1090;

		if (!isNull _cbMarkerColors && !ctrlEnabled _cbMarkerColors) then
		{
			[parseText (
			[
				"It appears you are affected by the missing markers bug from the apex and dev branches. In order to solve the problem temporarily, try the following:<br/>",
				" 1. Go back to main menu",
				" 2. Open the editor on Tanoa",
				" 3. Press ""Play Scenario"" in the bottom right",
				" 4. Once loaded, leave the editor and join back the server<br/>",
				"If that doesn't work, try again. If it still doesn't work, restart your game and keep trying again.<br/>",
				"Bohemia are investigating the bug."
			]
			joinString "<br/>"),"Notice"] spawn BIS_fnc_guiMessage;

			A3W_missingMarkersNotice = true;
		};
	};

	enableEnvironment true;
	uiSleep 1;
};
