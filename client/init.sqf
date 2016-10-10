// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.1
//@file Name: init.sqf
//@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev, [KoS] Bewilderbeest
//@file Created: 20/11/2012 05:19
//@file Description: The client init.

if (isDedicated) exitWith {};

if (!isServer) then
{
	waitUntil {!isNil "A3W_network_compileFuncs"};
};

waitUntil {!isNil "A3W_serverSetupComplete"};

[] execVM "client\functions\bannedNames.sqf";



showPlayerIcons = true;
mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
pvar_PlayerTeamKiller = [];
doCancelAction = false;

//Initialization Variables
playerCompiledScripts = false;
playerSetupComplete = false;

waitUntil {!isNull player && time > 0};

removeAllWeapons player;
player switchMove "";

// initialize actions and inventory
"client\actions" call mf_init;
"client\items" call mf_init;

//Call client compile list.
call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";

//Stop people being civ's.
if !(playerSide in [BLUFOR,OPFOR,INDEPENDENT]) exitWith
{
	endMission "LOSER";
};

//Setup player events.
if (!isNil "client_initEH") then { player removeEventHandler ["Respawn", client_initEH] };
player addEventHandler ["Respawn", { _this spawn onRespawn }];
player addEventHandler ["Killed", onKilled];

call compile preprocessFileLineNumbers "addons\far_revive\FAR_revive_init.sqf";

A3W_scriptThreads pushBack execVM "client\functions\evalManagedActions.sqf";

pvar_playerRespawn = [player, objNull];
publicVariableServer "pvar_playerRespawn";

//Player setup
player call playerSetupStart;


// Player saving - load data
if (["A3W_playerSaving"] call isConfigOn) then
{
	call compile preprocessFileLineNumbers "persistence\client\players\setupPlayerDB.sqf";

	call fn_requestPlayerData;

	waitUntil {!isNil "playerData_loaded"};

	A3W_scriptThreads pushBack ([] spawn
	{
		scriptName "savePlayerLoop";

		// Save player every 60s
		while {true} do
		{
			sleep 60;
			call fn_savePlayerData;
		};
	});
};

if (isNil "playerData_alive") then
{
	player call playerSetupGear;
};

player call playerSetupEnd;


// Load custom keys from profile
call compile preprocessFileLineNumbers "client\clientEvents\customKeys.sqf";

//Setup Key Handler
waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", onKeyPress];
(findDisplay 46) displayAddEventHandler ["KeyUp", onKeyRelease];

_mouseButtonToKey = "params ['_disp','_btn']; ([_disp, _btn + 65536 + ([0,128] select (_btn isEqualTo 1))] + (_this select [4,999])) call "; // actionKeys mouse bitflag + RMB fix

(findDisplay 46) displayAddEventHandler ["MouseButtonDown", _mouseButtonToKey + "onKeyPress"];
(findDisplay 46) displayAddEventHandler ["MouseButtonUp", _mouseButtonToKey + "onKeyRelease"];

call compile preprocessFileLineNumbers "client\functions\setupClientPVars.sqf";

//client Executes
A3W_scriptThreads pushBack execVM "client\systems\hud\playerHud.sqf";

if (["A3W_survivalSystem"] call isConfigOn) then
{
	execVM "client\functions\initSurvival.sqf";
};

A3W_clientSetupComplete = compileFinal "true";

[] spawn playerSpawn;

A3W_scriptThreads pushBack execVM "addons\fpsFix\vehicleManager.sqf";
A3W_scriptThreads pushBack execVM "addons\Lootspawner\LSclientScan.sqf";
[] execVM "addons\camera\functions.sqf";

inGameUISetEventHandler ["Action", "_this call A3W_fnc_inGameUIActionEvent"];

{ [_x] call fn_remotePlayerSetup } forEach allPlayers;


[] spawn {

	while {true} do
	{
		private ["_sName", "_cName", "_isEnabled", "_name"];
		_isEnabled = call TFAR_fnc_isTeamSpeakPluginEnabled;
		_cName = call TFAR_fnc_getTeamSpeakChannelName;
		_chanelname = ["A3W_TFRChanelName", "TaskForceRadio"] call getPublicVar;
		_sName = call TFAR_fnc_getTeamSpeakServerName;
		_servername = ["A3W_TFRServerName", "[ARP] Arma 3 DayZ Roleplaying [www.AwakenRP.com]"] call getPublicVar;

		if (!_isEnabled) then
		{
			_result = ["You either do not have TFR teamspeak plugin or it's disabled! TFR is required for the server! Without it other players can not interact with you! Read more at www.awakenrp.com", "TFR DISABLED", true, true] call BIS_fnc_guiMessage; // Arma 3
		}
		else
		{

			if (_sName != _servername) then
			{
				_result = ["You are not in Awaken RP teamspeak! TFR is required for the server! Without it other players can not interact with you! Read more at www.awakenrp.com", "TFR WRONG SERVER", true, true] call BIS_fnc_guiMessage; // Arma 3
			}
			else
			{

				if (_cName != _chanelname) then
				{
					_result = ["You are not in TaskForceRadio channel! You must reconnect to the server! TFR is required for the server! Without it other players can not interact with you! Read more at www.awakenrp.com", "TFR WRONG CHANEL", true, true] call BIS_fnc_guiMessage; // Arma 3
				}
			};
			
		};

		//hint format ["%1, %2, %3", _sName, _cName, _isEnabled];

		uiSleep 180;
	};
};
