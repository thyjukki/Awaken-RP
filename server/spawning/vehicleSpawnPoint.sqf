///Jukki, set a spawnpoint from a vehicle on map
private ["_pos", "_dir", "_vehicle", "_type", "_id"];

_vehicle = _this select 0;
_type = _this select 1;
_id = _this select 2;


if (isNil "Awaken_VehiclePoints") then { Awaken_VehiclePoints = [] };


_pos = getPos _vehicle;
_dir = getDir _vehicle;


_spawntype = [];

if (_id > 0) then 
{
    _spawntype = [_pos, _dir, _type, [typeOf _vehicle, _id]];
}
else
{
    _spawntype = [_pos, _dir, _type, []];
};

deleteVehicle _vehicle;

Awaken_VehiclePoints pushback _spawntype; 
