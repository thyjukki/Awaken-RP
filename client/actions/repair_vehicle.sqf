// repair_vehicle.sqf

private ["_part","_cancel","_color","_string","_handle","_damage","_cmpt","_vehicle","_hitpoints","_damagePercent","_configVeh"];

_vehicle = _this select 0;

vehicle_getHitpoints = {
	private ["_cfgHitPoints", "_hps", "_funcGetHitPoints"];
	_cfgHitPoints = configFile >> "CfgVehicles" >> (typeOf _this) >> "HitPoints";
	_hps = [];

	_funcGetHitPoints = 
	{
		for "_i" from 0 to ((count _this) - 1) do 
		{
			private ["_hp"];
			_hp = configName (_this select _i);
			
			if (!(_hp in _hps)) then 
			{
				_hps set [count _hps, _hp];
			};
		};
	};

	//Explore inheritance structure fully
	while {(configName _cfgHitPoints) != ""} do 
	{
		_cfgHitPoints call _funcGetHitPoints;
		_cfgHitPoints = inheritsFrom _cfgHitPoints;
	};

	_hps
};

object_getHit = {
	_unit = _this select 0;
	_hp = _this select 1;

	_selection = getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "HitPoints" >> _hp >> "name");
	_strH = "hit_" + (_selection);
	_dam = _unit getVariable [_strH,0];

	_dam
};

_hitpoints = _vehicle call vehicle_getHitpoints;

{
	_damage = [_vehicle,_x] call object_getHit;

	_cmpt = toArray (_x);
	_cmpt set [0,20];
	_cmpt set [1,toArray ("-") select 0];
	_cmpt set [2,20];
	_cmpt = toString _cmpt;

	_configVeh = missionconfigFile >> "RepairParts" >> _x;
	_part = getText(_configVeh >> "part");
	if (!isnil ("_part")) then
	{
        if (_part in magazines player) then
        {
            // get every damaged part no matter how tiny damage is!
            _damagePercent = str(round(_damage * 100))+"% Damage";
            if (_damage > 0) then {
                if ((_damage >= 0) and (_damage <= 0.25)) then {_color = "color='#00ff00'";}; //green
                if ((_damage >= 0.26) and (_damage <= 0.50)) then {_color = "color='#ffff00'";}; //yellow
                if ((_damage >= 0.51) and (_damage <= 0.75)) then {_color = "color='#ff8800'";}; //orange
                if ((_damage >= 0.76) and (_damage <= 1)) then {_color = "color='#ff0000'";}; //red
                _cmpt = format["Repair %1 %2",_cmpt,_damagePercent];

                _string = format["<t %1>%2</t>",_color,_cmpt]; //Repair - Part
                _handle = [_vehicle, [_string, "\z\addons\dayz_code\actions\repair.sqf",[_vehicle,_part,_x], 0, false, true, "",""]]  call fn_addManagedAction;
                s_player_repairActions pushBack _handle;
            };
		};
	};


} forEach _hitpoints;

if(count _hitpoints > 0 ) then {
	//ArmA OA String
	_cancel = [_vehicle, [localize "Cancel", "\z\addons\dayz_code\actions\repair_cancel.sqf","repair", 0, true, false, "",""]] call fn_addManagedAction;
	s_player_repairActions pushBack _cancel;
};