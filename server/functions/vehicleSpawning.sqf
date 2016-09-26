// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 2
//	@file Name: vehicleSpawning.sqf
//	@file Author: [GoT] JoSchaap, AgentRev
//  new one, no longer requires Spawn_ markers but uses the town's radius in config.sqf to pick the ammount of vehicles

if (!isServer) exitWith {};

private ["_createRandomVehicle", "_carPerMeters", "_startTime", "_pos", "_dir", "_unique"];

_createRandomVehicle =
{
	private ["_pos", "_minrad", "_maxrad", "_counter", "_vehicleType", "_mindist"];
	_pos = _this select 0;
	_dir = _this select 1;
	_type = _this select 2;
	_unique = _this select 3;
	
	
	_vehicleType = "";
	_id = 0;
	if ((count _unique) > 0) then 
	{
		_vehicleType = _unique select 0;
		_id = _unique select 1;
	}
	else
	{
		_vehicleType =
		([
			civilianVehicles,
			lightMilitaryVehicles,
			mediumMilitaryVehicles,
			trucksVehicles,
			A3W_smallVehicles,
			waterVehicles
		] select _type) call fn_selectRandomNested;
	};

	if (count (nearestObjects [_pos, ["Car","Tank"],4]) == 0) then
	{
		Awaken_TotalVehicles = Awaken_TotalVehicles + 1;
		[_pos, _dir, _vehicleType/*, _id*/] call vehicleCreation;
	};

};

_totalCars = ["A3W_vehicleQuantity", 3] call getPublicVar;

//add vehicle counter 
if (isNil "Awaken_TotalVehicles") then { Awaken_TotalVehicles = 0 };

waitUntil {!(isNil "Awaken_VehiclePoints")};

_startTime = diag_tickTime;


{
	if (Awaken_TotalVehicles < _totalCars) then
	{
		_x call _createRandomVehicle;

		diag_log format["WASTELAND DEBUG - spawned %1 Vehicles out of: %2",Awaken_TotalVehicles,_totalCars];
	};
} forEach Awaken_VehiclePoints call BIS_fnc_arrayShuffle;

diag_log format["WASTELAND - Vehicle spawning completed - %1 vehicles in total in %2s", Awaken_TotalVehicles, diag_tickTime - _startTime];
