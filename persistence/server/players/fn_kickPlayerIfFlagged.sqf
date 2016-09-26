// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_kickPlayerIfFlagged.sqf
//	@file Author: AgentRev

params ["_id", "_uid", "_name", "_jip", "_owner"];

private _flag = _uid call fn_getPlayerFlag;
//private _whitelisted = _uid call fn_getWhitelist;

diag_log ("fn_kickPlayerIfFlagged " + str _whitelisted);
/*if (!isNil "_whitelisted" && {!(count _whitelisted > 0)}) then
{
	{ true call compile preprocessFile "client\functions\quit.sqf" } remoteExecCall ["call", _owner];

	diag_log format ["WHITELISTING: %1 (%2) was kicked due to not having been whitelised", _name, _uid];
};*/

if (!isNil "_flag" && {count _flag > 1}) then
{
	{ false call compile preprocessFile "client\functions\quit.sqf" } remoteExecCall ["call", _owner];

	_oldName = _flag select 0;
	_hackType = _flag select 1;

	diag_log format ["ANTI-HACK: %1 (%2) was kicked due to having been flagged for [%3] in the past", _name, _uid, _hackType];
};
