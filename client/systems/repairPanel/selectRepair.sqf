// selectRepair.sqf

disableSerialization;

_control = (_this select 0) select 0;
_index = (_this select 0) select 1;

diag_log format ["selectRepair.sqf %1", _this];

_hit = _control lbData _index;

_configVeh = missionconfigFile >> "RepairParts" >> _hit;
_part = getText(_configVeh >> "part");

closeDialog 0;

[awaken_repairVehicle, _hit, _part] call mf_repair;