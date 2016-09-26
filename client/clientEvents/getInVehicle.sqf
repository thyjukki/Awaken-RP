// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: getInVehicle.sqf
//	@file Author: AgentRev

scopeName "getInVehicle";
private "_veh";
_veh = _this select 0;

player setAnimSpeedCoef 1;

if (isNil {_veh getVariable "A3W_hitPointSelections"}) then
{
	{
		_veh setVariable ["A3W_hitPoint_" + getText (_x >> "name"), configName _x, true];
	} forEach ((typeOf _veh) call getHitPoints);

	_veh setVariable ["A3W_hitPointSelections", true, true];
};

if (isNil {_veh getVariable "A3W_handleDamageEH"}) then
{
	_veh setVariable ["A3W_handleDamageEH", _veh addEventHandler ["HandleDamage", vehicleHandleDamage]];
};

if (isNil {_veh getVariable "A3W_dammagedEH"}) then
{
	_veh setVariable ["A3W_dammagedEH", _veh addEventHandler ["Dammaged", vehicleDammagedEvent]];
};

if (isNil {_veh getVariable "A3W_engineEH"}) then
{
	_veh setVariable ["A3W_engineEH", _veh addEventHandler ["Engine", vehicleEngineEvent]];
};

player setVariable ["lastVehicleRidden", netId _veh];

// FAR injured unit vehicle loading
[_veh] call FAR_Drag_Load_Vehicle;
