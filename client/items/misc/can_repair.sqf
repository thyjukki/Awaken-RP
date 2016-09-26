// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: can_repair.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Check if you can repair the nearest vehicle
//@file Argument: [_vehicle] the vehicle to test
//@file Argument: [] automatically find the nearest vehicle

#define ERR_NO_VEHICLE "You are not close enough to a vehicle that needs repairing"
#define ERR_IN_VEHICLE "You can't do this while in a vehicle."
#define ERR_FULL_HEALTH "The vehicle is already fully repaired"
#define ERR_DESTROYED "The vehicle is too damaged to repair"

private ["_vehicle", "_hitPoints", "_error"];
_vehicle = _this select 0;

_isVehicle = _vehicle isKindOf "AllVehicles";
_isMan = _vehicle isKindOf "Man";

_error = "";
switch (true) do {
	case (!_isVehicle || _isMan): {_error = ERR_NO_VEHICLE};
	case (vehicle player != player):{_error = ERR_IN_VEHICLE};
	case (player distance _vehicle >  4): {_error = ERR_NO_VEHICLE};
	case (!alive _vehicle): {_error = ERR_DESTROYED};
};

_error == ""
