// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: loadRepairMenu.sqf
//	@file Author: Jukki
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define repairMenu_option 50011
#define repairMenu_title 50012
disableSerialization;

private ["_start","_panelOptions","_repairSelect","_displayRepair"];

_start = createDialog "RepairMenu";

_vehicle = cursorObject;

awaken_repairVehicle = _vehicle;

_displayRepair = uiNamespace getVariable "RepairMenu";
_repairSelect = _displayRepair displayCtrl repairMenu_option;

_name = getText (configFile >> "CfgVehicles" >> typeOf(_vehicle) >> "displayName");

ctrlSetText [repairMenu_title, format ["Repair %1", _name]];


_hitdata = getAllHitPointsDamage _vehicle;

_hitpoints = [];

{
	_hitpoints pushback [_x, (_hitdata select 2) select _forEachIndex];
} forEach (_hitdata select 0);


lbClear _repairSelect;

{
	_point = _x select 0;
	_damage = _x select 1;

	// get every damaged part no matter how tiny damage is!
	_damagePercent = str(round(_damage * 100))+"% Damage";
	
	_configVeh = missionconfigFile >> "RepairParts" >> _point;
	_part = getText(_configVeh >> "part");

	diag_log format ["Part %1 %2 need %3 %4", _point, _damage, _part, (_part in magazines player)];
	if ((_damage > 0) && (_part in magazines player)) then
	{
		_cmpt = format["%1 %2",_point,_damagePercent];

		_repairSelect lbAdd _cmpt;
		_repairSelect lbSetData [(lbSize _repairSelect) -1,  _point];
	};


} forEach _hitpoints;

