// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat, modded by AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args: markerPos [, vehicleType]

if (!isServer) exitWith {};

params ["_pos", "_dir", ["_vehicleType","",[""]], ["_respawnSettings",nil,[[]]]];
private ["_vehicle", "_hitPoint"];

//Car Initialization
_vehicle = createVehicle [_vehicleType, _pos, [], 0, "None"];

_vehicle setPosATL [_pos select 0, _pos select 1, 1.5];
_vehicle setDir _dir;
_vehicle setVelocity [0,0,0.01];

_vehicle setDamage (random 0.5); // setDamage must always be called before vehicleSetup

// Reset wheel damage
{
	if (toLower _x find "wheel" != -1) then
	{
		_vehicle setHitPointDamage [_x, 0];
	};
} forEach (getAllHitPointsDamage _vehicle param [0,[]]);

[_vehicle] call vehicleSetup;

if (!isNil "_respawnSettings") then
{
	[_respawnSettings, "Vehicle", _vehicle] call fn_setToPairs;
	_vehicle setVariable ["vehicleRespawn_settingsArray", _respawnSettings];
};

//Set Vehicle Attributes
_vehicle setFuel (0.2 + random 0.1);

// Reset armed Offroad to 1 mag
if (_vehicleType isKindOf "Offroad_01_armed_base_F") then
{
	_vehicle removeMagazinesTurret ["100Rnd_127x99_mag_Tracer_Yellow", [0]];
	_vehicle addMagazineTurret ["100Rnd_127x99_mag_Tracer_Yellow", [0]];
	reload _vehicle;
};

//if (_type > 1) then { _vehicle setVehicleAmmo (random 1.0) };

[_vehicle] call randomWeapons;

(netId _vehicle)  call fn_manualVehicleSave;
