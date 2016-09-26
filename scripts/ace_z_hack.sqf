ace_medical_selections = ["body"];


ace_medical_fnc_handleDamage =
{
	//diag_log format ["ace_medical_fnc_handleDamage %1", _this];
	_target = _this select 0;
	_selection = _this select 1;
	_dam = _this select 2;
	_source = _this select 3;
	_bullet = _this select 4;
	_damage = [_target, "body", damage player + 0.01, _source, _bullet] call unitHandleDamage;

	//diag_log format ["ace_medical_fnc_handleDamage damage is %1", _damage];
	_target setDamage _damage;
} call mf_compile;
