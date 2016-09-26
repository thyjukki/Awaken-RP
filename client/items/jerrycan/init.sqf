// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//@file Version: 1.0
//@file Name: init.sqf
//@file Author: MercyfulFate
//@file Created: 21/7/2013 16:00
//@file Description: Initialize Jerrycans
//@file Argument: The path of the directory holding this file.

#define build(file) format["%1\%2", _path, file] call mf_compile;

private ["_path","_refill", "_refuel", "_iconJerry", "_iconSyphon"];
_path = _this;

iconJerry = "client\icons\jerrycan.paa";
iconSyphon = "client\icons\syphonhose.paa";

mf_jerrycan_pumps = ["Land_FuelStation_Feed_F", "Land_MetalBarrel_F", "Land_fs_feed_F", "Land_Tank_rust_F","Land_Ind_TankSmall2","Land_Ind_TankSmall2_EP1","Land_Fuel_tank_stairs","Land_Fuel_tank_big"];

mf_jerrycan_vehicles = ["LandVehicle", "Air", "Ship"];


mf_jerrycan_can_refill = [_path, "can_refill.sqf"] call mf_compile;
mf_jerrycan_can_refuel = [_path, "can_refuel.sqf"] call mf_compile;
mf_jerrycan_can_syphon = [_path, "can_syphon.sqf"] call mf_compile;