// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: loadAccount.sqf
//	@file Author: Torndeco, AgentRev

if (!isServer) exitWith {};

params ["_UID", "_player"];
private ["_result", "_data", "_location", "_dataTemp", "_ghostingTimer", "_secs", "_columns", "_pvar", "_pvarG"];

private _environment = ["A3W_extDB_Mapname", "chernarus"] call getPublicVar;
private _mapID = call A3W_extDB_MapID;


private _query = ["checkPlayerSave", _UID, _mapID];
_result = ([_query, 2] call extDB_Database_async) param [0,false];

if (!_result) then
{
	_data = [["PlayerSaveValid", false]];

	// prevent constraint fail on first save
	private _sqlValues = [[["Name", name _player]], [0,1], false] call extDB_pairsToSQL;
	[["insertOrUpdatePlayerInfo", _UID, _sqlValues select 0, _sqlValues select 1]] call extDB_Database_async;
}
else
{
	// The order of these values is EXTREMELY IMPORTANT!
	_data =
	[
		"Damage",
		"HitPoints",

		"LoadedMagazines",

		"PrimaryWeapon",
		"SecondaryWeapon",
		"HandgunWeapon",

		"PrimaryWeaponItems",
		"SecondaryWeaponItems",
		"HandgunItems",

		"AssignedItems",

		"CurrentWeapon",

		"Uniform",
		"Vest",
		"Backpack",
		"Goggles",
		"Headgear",

		"UniformWeapons",
		"UniformItems",
		"UniformMagazines",

		"VestWeapons",
		"VestItems",
		"VestMagazines",

		"BackpackWeapons",
		"BackpackItems",
		"BackpackMagazines",

		"Hunger",
		"Thirst"
	];

	_location = ["Stance", "Position", "Direction"];

	_query = ["getPlayerSave", _UID, _mapID];
	_query pushBack (_data joinString ",");
	_result = [_query, 2] call extDB_Database_async;

	{ _data set [_forEachIndex, [_data select _forEachIndex, _x]] } forEach _result;

	_dataTemp = _data;
	_data = [["PlayerSaveValid", true]];

	_ghostingTimer = ["A3W_extDB_GhostingTimer", 5*60] call getPublicVar;

	if (_ghostingTimer > 0) then
	{
		_query = ["getTimeSinceServerSwitch", _UID, _mapID];
		_query pushBack call A3W_extDB_ServerID;
		_result = [_query, 2] call extDB_Database_async;

		if (count _result > 0) then
		{
			_secs = _result select 0;

			if (_secs < _ghostingTimer) then
			{
				_data pushBack ["GhostingTimer", _ghostingTimer - _secs];
			};
		};
	};

	_data append _dataTemp;
};

private _bounty = 0;
private _bountyKills = [];

_data append
[
	["Bounty", _bounty],
	["BountyKills", _bountyKills]
];

// before returning player data, restore global player stats if applicable
if (["A3W_playerStatsGlobal"] call isConfigOn) then
{
	_columns = ["playerKills", "aiKills", "teamKills", "deathCount", "reviveCount", "captureCount"];
	_result = [["getPlayerStats", _UID, _columns joinString ","], 2] call extDB_Database_async;

	{
		_pvar = format ["A3W_playerScore_%1_%2", _columns select _forEachIndex, _UID];
		_pvarG = _pvar + "_global";
		missionNamespace setVariable [_pvarG, _x - (missionNamespace getVariable [_pvar, 0])];
		publicVariable _pvarG;
	} forEach _result;
};

_data
