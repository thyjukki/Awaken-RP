// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Description: The server init.
//	@file Args:

// All the "hasInterface" and "isServer" checks are to allow this file to be executed on a headless client to offload object saving

if (!isServer && hasInterface) exitWith {};

externalConfigFolder = "\AwakenRP_settings";

if (isServer) then
{
	vChecksum = compileFinal str call A3W_fnc_generateKey;

	// Corpse deletion on disconnect if player alive and player saving on + inventory save
	addMissionEventHandler ["HandleDisconnect",
	{
		params ["_unit", "_id", "_uid", "_name"];

		if (isNil "A3W_serverSetupComplete") exitWith
		{
			deleteVehicle _unit;
			false
		};

		diag_log format ["HandleDisconnect - %1 - alive: %2 - local: %3 - isPlayer: %4 - group: %5", [_name, _uid], alive _unit, local _unit, isPlayer _unit, group _unit];

		_veh = objectParent _unit;

		if (alive _unit) then
		{
			if (_unit call A3W_fnc_isUnconscious) then
			{
				[_uid, "deathCount", 1] call fn_addScore;
				_unit setVariable ["A3W_handleDisconnect_name", _name];
				_unit setVariable ["A3W_deathCause_local", ["bleedout"]];
				[_unit, objNull, objNull, true] call A3W_fnc_registerKillScore; // killer retrieved via FAR_killerPrimeSuspectData
			}
			else
			{
				if (["A3W_playerSaving"] call isConfigOn) then
				{
					if (!(_unit getVariable ["playerSpawning", true]) && getText (configFile >> "CfgVehicles" >> typeOf _unit >> "simulation") != "headlessclient") then
					{
						[_uid, [], [_unit, false] call fn_getPlayerData] spawn fn_saveAccount;
					};

					deleteVehicle _unit;
				};
			};
		}
		else
		{
			if (!isNull _veh) then
			{
				_unit spawn fn_ejectCorpse;
			};
		};

		false
	}];

	//Execute Server Side Scripts.
	//[] execVM "server\admins.sqf";
};

[] execVM "server\functions\serverVars.sqf";

if (isServer) then
{
	_serverCompileHandle = [] spawn compile preprocessFileLineNumbers "server\functions\serverCompile.sqf"; // scriptDone stays stuck on false when using execVM on Linux

	[] execVM "server\functions\broadcaster.sqf";
	[] execVM "server\functions\relations.sqf";
	[] execVM (externalConfigFolder + "\init.sqf");

	waitUntil {scriptDone _serverCompileHandle};

	// Broadcast server rules
	if (loadFile (externalConfigFolder + "\serverRules.sqf") != "") then
	{
		[[call compile preprocessFileLineNumbers (externalConfigFolder + "\serverRules.sqf")], "client\functions\defineServerRules.sqf"] remoteExecCall ["execVM", [-2,0] select hasInterface, true];
	};
};

diag_log "WASTELAND SERVER - Server Compile Finished";

// load default config
call compile preprocessFileLineNumbers "server\default_config.sqf";

if (isServer) then
{
	// compileFinal & broadcast client config variables
	{
		missionNamespace setVariable [_x, compileFinal str (missionNamespace getVariable _x)];
		publicVariable _x;
	}
	forEach
	[
		"A3W_playerSaving",
		"A3W_combatAbortDelay",
		"A3W_unlimitedStamina",
		"A3W_bleedingTime",
		"A3W_teamPlayersMap",
		"A3W_disableGlobalVoice",
		"A3W_vehicleSaving",
		"A3W_staticWeaponSaving",
		"A3W_townSpawnCooldown",
		"A3W_survivalSystem",
		"A3W_extDB_GhostingAdmins",
		"A3W_extDB_SaveUnlockedObjects",
		"A3W_hcPrefix",
		"A3W_hcObjCaching",
		"A3W_hcObjCachingID",
		"A3W_hcObjCleanup",
		"A3W_hcObjCleanupID",
		"A3W_hcObjSaving",
		"A3W_hcObjSavingID",
		"A3W_vehicleLocking",
		"A3W_disableBuiltInThermal",
		"A3W_customDeathMessages",
		"A3W_headshotNoRevive"
	];

	addMissionEventHandler ["PlayerConnected", fn_onPlayerConnected];
	addMissionEventHandler ["PlayerDisconnected", fn_onPlayerDisconnected];

	// Temp fix for https://forums.bistudio.com/topic/190773-mission-event-handlers-playerconnected-and-playerdisconnected-do-not-work/
	["A3W_missionEH_fix", "onPlayerConnected", {}] call BIS_fnc_addStackedEventHandler;
	["A3W_missionEH_fix", "onPlayerDisconnected", {}] call BIS_fnc_addStackedEventHandler;
	["A3W_missionEH_fix", "onPlayerConnected"] call BIS_fnc_removeStackedEventHandler;
	["A3W_missionEH_fix", "onPlayerDisconnected"] call BIS_fnc_removeStackedEventHandler;
};

_playerSavingOn = ["A3W_playerSaving"] call isConfigOn;
_baseSavingOn = ["A3W_baseSaving"] call isConfigOn;
_boxSavingOn = ["A3W_boxSaving"] call isConfigOn;
_staticWeaponSavingOn = ["A3W_staticWeaponSaving"] call isConfigOn;
_timeSavingOn = ["A3W_timeSaving"] call isConfigOn;
_weatherSavingOn = ["A3W_weatherSaving"] call isConfigOn;
_mineSavingOn = ["A3W_mineSaving"] call isConfigOn;

_objectSavingOn = (_baseSavingOn || _boxSavingOn || _staticWeaponSavingOn);
_vehicleSavingOn = ["A3W_vehicleSaving"] call isConfigOn;
_hcObjSavingOn = ["A3W_hcObjSaving"] call isConfigOn;

if (_hcObjSavingOn) then
{
	A3W_hcObjSaving_unitName = format ["%1%2", ["A3W_hcPrefix", "A3W_HC"] call getPublicVar, ["A3W_hcObjSavingID", 2] call getPublicVar];

	if (!isServer && {vehicleVarName player == A3W_hcObjSaving_unitName}) then
	{
		diag_log "AwakenRP HEADLESS - Object saving enabled";
		A3W_hcObjSaving_isClient = compileFinal "true";

		if (_timeSavingOn || _weatherSavingOn) then
		{
			"currentDate" addPublicVariableEventHandler ("client\functions\clientTimeSync.sqf" call mf_compile);
			drn_DynamicWeather_MainThread = [] execVM "addons\scripts\DynamicWeatherEffects.sqf";
		};
	};
};

_setupPlayerDB = scriptNull;

#define MIN_EXTDB_VERSION 49

// Do we need any persistence?
if (_playerSavingOn || _objectSavingOn || _vehicleSavingOn || _mineSavingOn || _timeSavingOn || _weatherSavingOn) then
{
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	_savingMethod = ["A3W_savingMethod", "profile"] call getPublicVar;
	if (_savingMethod == "extDB2") then { _savingMethod = "extDB" };

	// extDB
	if (_savingMethod == "extDB") then
	{
		_version = "extDB2" callExtension "9:VERSION";

		if (parseNumber _version >= MIN_EXTDB_VERSION) then
		{
			A3W_savingMethodName = compileFinal "'extDB'";
			A3W_savingMethodDir = compileFinal "'extDB'";
			A3W_extDB_ConfigName = compileFinal str (["A3W_extDB_ConfigName", "A3W"] call getPublicVar);
			A3W_extDB_IniName = compileFinal str (["A3W_extDB_IniName", "a3wasteland"] call getPublicVar);
			A3W_extDB_RconName = compileFinal str (["A3W_extDB_RconName", "A3W"] call getPublicVar);

			diag_log format ["[INFO] extDB2 v%1 extension loaded", _version];
		}
		else
		{
			if (_version != "") then
			{
				diag_log format "[INFO] ███ extDB2 startup cancelled!";
				diag_log format ["[INFO] ███ A3W requires extDB2 v%1 or later: v%2 detected", MIN_EXTDB_VERSION, _result];
			}
			else
			{
				diag_log "[INFO] ███ extDB2 NOT FOUND! Make sure extDB2.dll (Windows) or extDB2.so (Linux) and extdb-conf.ini are in the same directory as arma3server, and that you are using the -filePatching parameter";
			};

			_savingMethod = "profile"; // fallback
		};
	};

	if (_savingMethod == "iniDBI") then { _savingMethod = "iniDB" };

	// iniDB
	if (_savingMethod == "iniDB") then
	{
		_verIniDB = "iniDB" callExtension "version";

		if (_verIniDB != "") then
		{
			A3W_savingMethodName = compileFinal (if (parseNumber _verIniDB > 1) then { "'iniDBI'" } else { "'iniDB'" });
			A3W_savingMethodDir = compileFinal "'default'";
			diag_log format ["[INFO] ### A3W running with %1 v%2", call A3W_savingMethodName, _verIniDB];
		}
		else
		{
			diag_log "[INFO] ███ iniDB NOT FOUND! Make sure iniDB.dll is in the same directory as arma3server.exe, and that you are using the -filePatching parameter";
			_savingMethod = "profile"; // fallback
		};
	};

	if (_savingMethod == "profileNamespace") then { _savingMethod = "profile" };

	// profileNamespace
	if (_savingMethod == "profile") then
	{
		A3W_savingMethodName = compileFinal "'profileNamespace'";
		A3W_savingMethodDir = compileFinal "'default'";
		diag_log format ["[INFO] ### Saving method = %1", call A3W_savingMethodName];
	};

	if (isServer) then
	{
		A3W_savingMethod = compileFinal str _savingMethod;
		publicVariable "A3W_savingMethod";
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	call compile preProcessFileLineNumbers format ["persistence\server\setup\%1\init.sqf", call A3W_savingMethodDir];

	if (isServer && _playerSavingOn) then
	{
		_setupPlayerDB = [] spawn compile preprocessFileLineNumbers "persistence\server\players\setupPlayerDB.sqf"; // scriptDone stays stuck on false when using execVM on Linux

		// profileNamespace doesn't save antihack logs
		if (_savingMethod != "profile") then
		{
			_setupPlayerDB spawn
			{
				waitUntil {scriptDone _this};

				addMissionEventHandler ["PlayerConnected", { _this spawn fn_kickPlayerIfFlagged }];

				// force check for non-JIP players
				{ waitUntil {!isNull player}; [player, didJIP] remoteExecCall ["A3W_fnc_checkPlayerFlag", 2] } remoteExec ["call", -2];
			};
		};
	};

	[_playerSavingOn, _objectSavingOn, _vehicleSavingOn, _mineSavingOn, _timeSavingOn, _weatherSavingOn, _hcObjSavingOn] spawn
	{
		params ["_playerSavingOn", "_objectSavingOn", "_vehicleSavingOn", "_mineSavingOn", "_timeSavingOn", "_weatherSavingOn", "_hcObjSavingOn"];

		_oSave = (_objectSavingOn || _vehicleSavingOn || _mineSavingOn || _timeSavingOn || {_playerSavingOn && call A3W_savingMethod == "profile"});

		if (_oSave) then
		{
			call compile preprocessFileLineNumbers "persistence\server\world\precompile.sqf";
		};

		if (isServer) then
		{
			A3W_objectIDs = [];
			A3W_vehicleIDs = [];
			A3W_mineIDs = [];

			if (_objectSavingOn) then
			{
				call compile preprocessFileLineNumbers "persistence\server\world\oLoad.sqf";
			};

			if (_vehicleSavingOn) then
			{
				call compile preprocessFileLineNumbers "persistence\server\world\vLoad.sqf";
			};

			if (_mineSavingOn) then
			{
				call compile preprocessFileLineNumbers "persistence\server\world\mLoad.sqf";
			};
		};

		if (_oSave) then
		{
			if (isServer && _hcObjSavingOn) then
			{
				call compile preprocessFileLineNumbers "persistence\server\world\oSaveSetup.sqf";

				_hcUnit = objNull;
				_firstRun = true;

				_key = call A3W_fnc_generateKey;
				A3W_hcObjSaving_serverKey = compileFinal str _key;
				A3W_hcObjSaving_serverReady = compileFinal "true";
				A3W_hcObjSaving_mergeIDs = compileFinal "true";

				"pvar_hcObjSaving_setVariable" addPublicVariableEventHandler compileFinal ("_val = _this select 1; if (_val select 0 == '" + _key + "') then { (_val select 1) setVariable (_val select 2) }");
				"pvar_hcObjSaving_setTickTime" addPublicVariableEventHandler compileFinal ("_val = _this select 1; if (_val select 0 == '" + _key + "') then { (_val select 1) setVariable [_val select 2, diag_tickTime] }");
				"pvar_hcObjSaving_deleteVehicle" addPublicVariableEventHandler compileFinal ("_val = _this select 1; if (_val select 0 == '" + _key + "') then { deleteVehicle (_val select 1) }");

				while {true} do
				{
					waitUntil {sleep 1; _hcUnit = missionNamespace getVariable [A3W_hcObjSaving_unitName, objNull]; !isNull _hcUnit}; // wait until HC connects

					_pvarList = if (_firstRun) then { [] } else { ["A3W_hcObjSaving_mergeIDs"] };
					_pvarList append
					[
						"A3W_objectIDs",
						"A3W_vehicleIDs",
						"A3W_mineIDs",
						"A3W_hcObjSaving_serverKey",
						"A3W_hcObjSaving_serverReady"
					];

					{ (owner _hcUnit) publicVariableClient _x } forEach _pvarList;

					A3W_hcObjSaving_unit = _hcUnit;

					_firstRun = false;

					waitUntil {sleep 5; isNull _hcUnit}; // in case HC crashes, resend vars on reconnect
				};
			}
			else
			{
				_isHC = (_hcObjSavingOn && {vehicleVarName player == A3W_hcObjSaving_unitName});

				if ((!_hcObjSavingOn && isServer) || _isHC) then
				{
					if (_isHC) then
					{
						"A3W_hcObjSaving_setTickTime" addPublicVariableEventHandler { _val = _this select 1; (_val select 0) setVariable [_val select 1, diag_tickTime] };
						"A3W_hcObjSaving_trackObjID" addPublicVariableEventHandler { A3W_objectIDs pushBackUnique (_this select 1) };
						"A3W_hcObjSaving_trackVehID" addPublicVariableEventHandler { A3W_vehicleIDs pushBackUnique (_this select 1) };
						"A3W_hcObjSaving_trackMineID" addPublicVariableEventHandler { A3W_mineIDs pushBackUnique (_this select 1) };
					};

					[_objectSavingOn, _vehicleSavingOn, _mineSavingOn] execVM "persistence\server\world\oSave.sqf";
					//waitUntil {!isNil "A3W_oSaveReady"};
				};
			};
		};
	};

	if (isServer) then
	{
		{
			diag_log format ["[INFO] A3W %1 = %2", _x select 0, if (_x select 1) then { "ON" } else { "OFF" }];
		}
		forEach
		[
			["playerSaving", _playerSavingOn],
			["baseSaving", _baseSavingOn],
			["vehicleSaving", _vehicleSavingOn],
			["boxSaving", _boxSavingOn],
			["staticWeaponSaving", _staticWeaponSavingOn],
			["timeSaving", _timeSavingOn],
			["weatherSaving", _weatherSavingOn],
			["hcObjSaving", _hcObjSavingOn]
		];
	};
};

if (!isServer) exitWith {}; // Headless client stops here

if (isNil "A3W_savingMethod") then
{
	A3W_savingMethod = compileFinal "'none'";
	publicVariable "A3W_savingMethod";
};


[_setupPlayerDB] spawn
{
	waitUntil {sleep 0.1; {scriptDone _x} count _this == count _this};
	A3W_serverSetupComplete = compileFinal "true";
	publicVariable "A3W_serverSetupComplete";
};

if (!isNil "A3W_startHour" || !isNil "A3W_moonLight") then
{
	private ["_monthDay", "_startHour"];
	_monthDay = if (["A3W_moonLight"] call isConfigOn) then { 9 } else { 24 };
	_startHour = ["A3W_startHour", date select 2] call getPublicVar;
	setDate [2035, 6, _monthDay, _startHour, 0];
};

if (_timeSavingOn || _weatherSavingOn) then
{
	execVM "persistence\server\world\tLoad.sqf";
};

execVM "addons\Lootspawner\Lootspawner.sqf";

[] execVM "server\functions\serverTimeSync.sqf";

waitUntil {!isNil "A3W_oSaveReady"};
if (["A3W_serverSpawning"] call isConfigOn) then
{
	diag_log "WASTELAND SERVER - Initializing Server Spawning";

	if (["A3W_heliSpawning"] call isConfigOn) then
	{
		call compile preprocessFileLineNumbers "server\functions\staticHeliSpawning.sqf";
	};

	if (["A3W_vehicleSpawning"] call isConfigOn) then
	{
		call compile preprocessFileLineNumbers "server\functions\vehicleSpawning.sqf";
	};

	if (["A3W_planeSpawning"] call isConfigOn) then
	{
		call compile preprocessFileLineNumbers "server\functions\planeSpawning.sqf";
	};

	if (["A3W_boatSpawning"] call isConfigOn) then
	{
		call compile preprocessFileLineNumbers "server\functions\boatSpawning.sqf";
	};

	if (["A3W_baseBuilding"] call isConfigOn || ["A3W_essentialsSpawning"] call isConfigOn) then
	{
		call compile preprocessFileLineNumbers "server\functions\objectsSpawning.sqf";
	};

	if (["A3W_boxSpawning"] call isConfigOn) then
	{
		call compile preprocessFileLineNumbers "server\functions\boxSpawning.sqf";
	};
};

A3W_serverSpawningComplete = compileFinal "true";
publicVariable "A3W_serverSpawningComplete";

/*if !(["A3W_hcObjCleanup"] call isConfigOn) then
{
	// Start clean-up loop
	execVM "server\WastelandServClean.sqf";
};*/

execVM "server\functions\heliCrashes.sqf";