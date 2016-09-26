// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: saveAccount.sqf
//	@file Author: AgentRev

params ["_UID", "_info", "_data"];
private "_sqlValues";

if (count _info > 0) then
{
	_sqlValues = [_info, [0,1], false] call extDB_pairsToSQL;
	[["insertOrUpdatePlayerInfo", _UID, _sqlValues select 0, _sqlValues select 1]] call extDB_Database_async;
};

if (count _data > 0) then
{
	_sqlValues = [_data, [0,1]] call extDB_pairsToSQL;
	[["insertOrUpdatePlayerSave", _UID, call A3W_extDB_MapID, call A3W_extDB_ServerID, _sqlValues select 0, _sqlValues select 1]] call extDB_Database_async;
};
