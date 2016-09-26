// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: canPushPlaneBack.sqf
//	@file Author: AgentRev

private ["_isDriver", "_veh"];
_isDriver = false;
_veh = objNull;

switch (_this select 0) do
{
	case 0:
	{
		_veh = vehicle player;

		if (driver _veh == player) then
		{
			_isDriver = true;
		};
	};
};

(
	_veh != player &&
	_isDriver &&
	isEngineOn _veh &&
	{isTouchingGround _veh} &&
	{_veh isKindOf "Plane"} &&
	{vectorMagnitude velocity _veh <= 10} &&
	{_veh call getFwdVelocity < 0.1}
)
