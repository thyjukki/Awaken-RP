// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	Lootspawner spawn script
//	Author: Na_Palm (BIS forums)
//  Note by AgentRev: This script is a very good example of bad coding. If you are learning how to code, do NOT do it that way.
//-------------------------------------------------------------------------------------
//local to Server Var. "BuildingLoot" array of [state, time], placed on buildings that can spawn loot
//												state: 0-not assigned, 1-has loot, 2-currently in use/blockaded
//												time : timestamp of last spawn
//
//local to Server Var. "Lootready" time, placed on generated lootobject, needed for removing old loot
//									time: timestamp of spawn, object is ready for use by player and loot deleter
//-------------------------------------------------------------------------------------
private["_begintime","_BaP_list","_spInterval","_chpSpot","_genZadjust","_BaPname","_lootClass","_buildPosViable_list","_buildPosZadj_list","_lBuildVar","_timeStamp","_posviablecount","_spwnPos","_lootspawned","_randChance","_lootholder","_selecteditem","_loot","_chfullf","_idx_sBlist","_chperSpot","_tmpPos"];

//BaP - Buildings around Player
_BaP_list = _this select 0;
_spInterval = _this select 1;
_genZadjust = _this select 2;
_chpSpot = _this select 3;

_begintime = diag_tickTime;
{
	if (!(_x getVariable ["Awaken_noloot", false]) && isNil {_x getVariable "baseSaving_hoursAlive"}) then
	{
	_BaPname = "";
	_lootClass = 0;
	_buildPosViable_list = [];
	_buildPosZadj_list = [];
	_lBuildVar = (_x getVariable ["BuildingLoot", [0, 0]]);
	diag_log format["-- LOOTSPAWNER DEBUG BaP _lBuildVar: v%1v v%2v --", _lBuildVar ,_x];

	if ((_lBuildVar select 0) < 2) then {
		_timeStamp = _lBuildVar select 1;
		if ((_timeStamp == 0) || {serverTime - _timeStamp > _spInterval}) then {
			//flag immediately as in use
			_x setVariable ["BuildingLoot", [2, _timeStamp], true];
			//get building class
			_BaPname = typeOf _x;
			//here an other _x
			{
				//if junction found, get lists and -> exit forEach
				if (_BaPname == _x) exitWith {
					_lootClass = _x call getBuildingLootType;
					//get viable positions Idx
					_buildPosViable_list pushBack (_x call getBuildingLootPositions);
				};
				sleep 0.001;
			}forEach Buildingstoloot_list;
			//diag_log format["-- LOOTSPAWNER DEBUG BaP: v%1v%2v :: v%3v --", _BaPname, _lootClass, _buildPosViable_list];
			//get spawn position, here the former _x
			if (count _buildPosViable_list > 0) then
			{
				for "_poscount" from 0 to (count (_buildPosViable_list select 0) - 1) do
				{
					//consider chance per Slot
					if ((floor random 100) < _chpSpot) then {
						_iPos = (_buildPosViable_list select 0) select _poscount;
						_spwnPos = _x modelToWorld (_iPos select 1);
						_spwnPos = [_spwnPos select 0, _spwnPos select 1, (_spwnPos select 2) + 0.1];
						//check if position has old loot
						if ((count (nearestObjects [_spwnPos, LSusedclass_list, 0.5])) == 0) then {
							sleep 0.001;

							_pointType = _iPos select 0;
							_lootTypeList = [];
							_magsToGive = 0;
							switch (_pointType) do
							{
								//biggest point, all items
								case 0:
								{
									_lootTypeList = [
										[1, 50], //rifles
										[2, 60], //pistols
										[3, 100], //magazines
										[4, 60], //items
										[5, 40]  //backpacks
									];
									_magsToGive = floor(random(5));
								};
								//medium point, items and pistols
								case 1:
								{
									_lootTypeList = [
										[2, 1.4], //pistols
										[3, 1.5], //magazines
										[4, 2] //items
									];
									_magsToGive = floor(random(3));
								};
								//smalles point, only items
								case 2:
								{
									_lootTypeList = [
										[3, 1], //magazines
										[4, 2] //items
									];
									_magsToGive = floor(random(2));
								};
							};
							//check what type of loot to spawn, get chance for loot every time, so all combos in spawnClassChance_list are viable
							_lootType = _lootTypeList call fn_selectRandomWeightedPairs;

							if (isNil "_lootType") exitWith {};

							_lootholder = objNull;

							_lootholder = createVehicle ["GroundWeaponHolder", _spwnPos, [], 0, "CAN_COLLIDE"];

							switch (_lootType) do
							{
								//special for weapons
								case 1:
								{
									_loot = ((lootWeapon_list select _lootClass) select 1) call fn_selectRandomWeightedPairs;
									// always spawn 1-3 magazines to use the weapon with, otherwise nobody will take it
									_mags = getArray (configFile >> "CfgWeapons" >> _loot >> "magazines");
									if (count _mags > 0) then
									{
										_lootholder addMagazineCargoGlobal [_mags select 0, 1 + floor random 3];
									};
									_lootholder addWeaponCargoGlobal [_loot, 1];
								};
								//Pistols
								case 2:
								{
									_loot = ((lootWeaponPistol_list select _lootClass) select 1) call fn_selectRandomWeightedPairs;
									// always spawn 1-3 magazines to use the weapon with, otherwise nobody will take it
									_mags = getArray (configFile >> "CfgWeapons" >> _loot >> "magazines");
									if (count _mags > 0) then
									{
										_lootholder addItemCargoGlobal [_mags select 0, 1 + floor random 3];
									};
									_lootholder addWeaponCargoGlobal [_loot, 1];
								};
								//special for magazines: spawn 1-5
								case 3:
								{
									_randChance = 1 + _magsToGive;
									for "_rm" from 1 to _randChance do {
										_loot = ((lootMagazine_list select _lootClass) select 1) call fn_selectRandomWeightedPairs;
										_lootholder addItemCargoGlobal [_loot, 1];
									};
								};
								//special for item/cloth/vests
								case 4:
								{
									_loot = ((lootItem_list select _lootClass) select 1) call fn_selectRandomWeightedPairs;
									_lootholder addItemCargoGlobal [_loot, 1];
								};
								//special for backpacks
								case 5:
								{
									_loot = ((lootBackpack_list select _lootClass) select 1) call fn_selectRandomWeightedPairs;

									_lootholder addBackpackCargoGlobal [_loot, 1];
								};
							};

							if (!isNull _lootholder) then
							{

								_lootholder setdir (random 360);

								//1 category loot only per place so -> exit For
								//no lootpiling
								_lootholder setVariable ["Lootready", diag_tickTime];
							};
						};
					};
				};
			};
			//release building with new timestamp
			_x setVariable ["BuildingLoot", [1, serverTime], true];
		};
	};
	sleep 0.001;
	};
}forEach _BaP_list;
//diag_log format["-- LOOTSPAWNER DEBUG BaP: %1 buildings ready, needed %2s, EXIT now --", (count _BaP_list), (diag_tickTime - _begintime)];
