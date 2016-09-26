// canRefillWater.sqf

fnc_inString =
{
	private ["_found","_hayArr"];

	scopeName "main";
	_needle = _this select 0;
	_haystack = _this select 1;
	_haystackArr = toArray _haystack;
	_haystackLen = count _haystackArr;
	_needleLen = count (toArray _needle);
	_found = false;
	if (_needleLen <= _haystackLen) then {
		_hayArr = [];
		for "_i" from 0 to (_needleLen - 1) do {
			_hayArr set [count _hayArr, _haystackArr select _i];
		};
		for "_i" from _needleLen to _haystackLen do {
			if (toString _hayArr != _needle) then {
				_hayArr set [_needleLen, _haystackArr select _i];
				_hayArr set [0, "x"];
				_hayArr = _hayArr - ["x"];
			} else {
				_found = true;
				breakTo "main";
			};
		};
	};
	_found

};

_emptyBottle = 
[
	"rb_bottle",
	"rb_canteen_empty"
];

_hasBottle = false;
{
	if (_x in (magazines player)) exitWith
	{
		diag_log "No bottle in inventory sob";
		_hasBottle = true;
	};
} forEach _emptyBottle;

if (!_hasBottle) exitWith {false};

_playerPos = getPosATL player;
_canFill = count nearestObjects [_playerPos, ["Land_pumpa","Land_water_tank"], 4] > 0;
_isPond = false;
_isWell = false;


if (!_canFill) then {
	_objectsWell = nearestObjects [_playerPos, [], 4];
	{
		//Check for Well
		_isWell = ["_well",str(_x),false] call fnc_inString;
		if (_isWell) then { _canFill = true };
	} forEach _objectsWell;
};

if (!_canFill) then {
	_objectsPond = nearestObjects [_playerPos, [], 50];
	{
		//Check for pond
		_isPond = ["pond",str(_x),false] call fnc_inString;
		
		//Check for Dead Bodies
		_bodiesNear = ["dead",str(_x),false] call fnc_inString;
		if (!_bodiesNear) then {
			_bodiesNear = ["massgrave",str(_x),false] call fnc_inString;
		};
		if (_bodiesNear) then {
			_isInfected = true; 
		};
		if (_isPond) then {
			_pondPos = (_x worldToModel _playerPos) select 2;
			if (_pondPos < 0) then {
				_canFill = true;
			};
		};
	} forEach _objectsPond;
};


if (!_canFill) then {
	_canFill = surfaceIsWater position player;
};

_canFill 