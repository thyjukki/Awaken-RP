// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_setVehicleLoadout.sqf
//	@file Author: AgentRev

params [["_veh",objNull,[objNull,""]], ["_brandNew",false,[false]], ["_redoWeapons",false,[false]], ["_resupply",false,[false]]];

if (_veh isEqualType "") then {	_veh = objectFromNetId _veh };

if (!alive _veh) exitWith {};
if (!local _veh) exitWith
{
	if !(_this isEqualType []) then { _this = [_this] };

	_this remoteExec ["A3W_fnc_setVehicleLoadout", _veh];
};

private _class = typeOf _veh;
private ["_mags", "_weapons", "_customCode"];



if (isNil "_mags" && isNil "_weapons" && isNil "_customCode") exitWith {};

private "_oldWeapons";

if (isServer && (_redoWeapons || !isNil "_weapons")) then
{
	_oldWeapons = _veh call fn_removeTurretWeapons;
};

if (_brandNew && !isNil "_mags") then
{
	{ _veh removeMagazineTurret (_x select [0,2]) } forEach magazinesAllTurrets _veh;
	{ _veh addMagazineTurret _x } forEach _mags;
};

if (isServer && !isNil "_oldWeapons") then
{
	[_veh, if (_redoWeapons || isNil "_weapons") then [{_oldWeapons},{_weapons}]] call fn_addTurretWeapons;
};

if ((_brandNew || _resupply) && !isNil "_customCode") then
{
	call _customCode;
};
