// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: vehicleTags.sqf
//	@file Author: Battleguns, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

_uid = getPlayerUID player;
if (_uid call isAdmin) then
{
	if (isNil "adminVehicleMarkers") then { adminVehicleMarkers = false };

	if (!adminVehicleMarkers) then
	{
		adminVehicleMarkers = true;
		hint "Vehicle Markers ON";
		["vehiclemarkers", "enabled"] call notifyAdminMenu;
	}
	else
	{
		adminVehicleMarkers = false;
		hint "Vehicle Markers OFF";
		["vehiclemarkers", "disabled"] call notifyAdminMenu;
	};

	_uCounter = 0;
	while {adminVehicleMarkers} do
	{
		{
			private ["_marker", "_iconColor", "_ID"];
			_marker = _x getVariable["A3W_VehicleTag_Marker", ""];

			if (_marker == "") then
			{
				
				_ID = _x getVariable ["A3W_vehicleID", format ["UNKNOWN:%1", _uCounter]];
				_uCounter = _uCounter + 1;
				_marker = format ["ID:%1", _ID];
				_marker = createMarkerLocal [_marker,position _x];
				_marker setMarkerColorLocal "ColorBlue";
				_marker setMarkerShapeLocal "ICON";
				_marker setMarkerTypeLocal "hd_dot";

				_x setVariable ["A3W_VehicleTag_Marker", _marker, false];
			};
			
			_marker setMarkerPosLocal (position _x);
			_name = getText (configFile >> "cfgVehicles" >> typeOf _x >> "displayname");
			_marker setMarkerTextLocal format ["%1 - %2 (%3m)", _marker, _name, round (_x distance player)];
		} forEach vehicles;

		sleep 0.5;
	};

	{
		_marker = _x getVariable["A3W_VehicleTag_Marker", ""];

		if (_marker != "") then
		{
			deleteMarkerLocal _marker;

			_x setVariable ["A3W_VehicleTag_Marker","", false];
		};

	} forEach vehicles;
};
