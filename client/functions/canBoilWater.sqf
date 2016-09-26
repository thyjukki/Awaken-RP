// canBoilWater.sqf

_emptycan = 
[
	"rb_frantaempty",
	"rb_spiritempty",
	"rb_redgullempty",
	"rb_tacticalbaconempty",
	"rb_bakedbeansempty"
];

_boilwater = 
[
	"rb_canteen_salt",
	"rb_canteen_dirty",
	"rb_bottlesalt",
	"rb_bottledirty"
];

_hasBoilWater = {if (_x in magazines player) exitWith {true};} forEach _boilwater;
if (isNil '_hasBoilWater') then {_hasBoilWater = false;};

_hasBoilWater && (inflamed cursortarget) && ((player distance cursortarget) < 3)