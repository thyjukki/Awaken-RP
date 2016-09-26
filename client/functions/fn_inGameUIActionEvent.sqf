// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_inGameUIActionEvent.sqf
//	@file Author: AgentRev

params ["", "_unit", "", "_action", "","", "_showWindow", "","", "_menuOpen"];
private _handled = false;

if (_unit == player && (_showWindow || _menuOpen)) then
{
	switch (true) do
	{
		case (_handled): {};

		case (_action == "UseMagazine"): // placed explosive
		{
			_minDist = ["A3W_remoteBombStoreRadius", 100] call getPublicVar;
			if (_minDist <= 0) exitWith {};

			_nearbyMissions = allMapMarkers select {markerType _x == "Empty" && {[["Mission_","ForestMission_","LandConvoy_"], _x] call fn_startsWith && {player distance markerPos _x < _minDist}}};

			if !(_nearbyMissions isEqualTo []) exitWith
			{
				playSound "FD_CP_Not_Clear_F";
				[format ["You are not allowed to place explosives within %1m of a mission spawn.", _minDist], 5] call mf_notify_client;
				_handled = true;
			};
		};

		case (_action == "DisAssemble"):
		{
			playSound "FD_CP_Not_Clear_F";
			[format ['You are not allowed to disassemble weapons.\nUse the "%1" option instead.', ["STR_R3F_LOG_action_deplacer_objet", "Move"] call getPublicVar], 5] call mf_notify_client;
			_handled = true;
		};

		case (_action select [0,5] == "GetIn"): // Speed up get in vehicle animation since player unit appears idle for other players
		{
			0 spawn
			{
				scopeName "getInCheck";
				_time = time;

				waitUntil
				{
					if ((toLower animationState player) find "getin" != -1) exitWith
					{
						player setAnimSpeedCoef 2;
						true
					};

					if (time - _time >= 3) then
					{
						breakOut "getInCheck";
					};

					false
				};

				_time = diag_tickTime;

				waitUntil {(toLower animationState player) find "getin" == -1 || diag_tickTime - _time >= 1};

				player setAnimSpeedCoef 1;
			};
		};
	};
};

if (!_handled && !isNil "A3W_fnc_stickyCharges_actionEvent") then
{
	_handled = _this call A3W_fnc_stickyCharges_actionEvent;
};

_handled
