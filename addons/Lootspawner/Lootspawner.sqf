// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	Lootspawner setup and control script
//	Author: Na_Palm (BIS forums)
//	credit to: Ed! (404Forums) and [GoT] JoSchaap (GoT2DayZ.nl) for initial script
//-------------------------------------------------------------------------------------
if (!isServer) exitwith {};
private["_buildingname","_chperSpot","_class","_dbgloopTime","_dbgloopTimeplU","_dbgTime","_dbgTurns","_dbgTurnsplU","_endloop","_genZadjust","_hndl","_item","_nearLootdist","_pos","_posAdjustZ","_posAdjustZlist","_poscount","_posIdxlist","_posnew","_posOrg","_posViable","_randomweapontestint","_spawnradius","_spInterval","_testpos","_tmpBuild","_tmpPoslist","_z"];
//-------------------------------------------------------------------------------------
//Switch
swDebugLS = false;                  //Debug messages on/off
swSpZadjust = false;                //needed for ArmA 2 and older Maps/Buildings -> true

//-------------------------------------------------------------------------------------
//Variables
//local
#define LOOT_SPAWN_INTERVAL 15*60   //Time (in sec.) to pass before an building spawns new loot (must also change in LSclientScan.sqf)
#define LOOT_Z_ADJUST -0.1          //High adjustment thats generally added to every spawnpoint

//"spawnClassChance_list" array of [%weapon, %magazine, %ICV, %backpack, %object]
//                                  %weapon     : chance weight to spawn a weapon on spot
//                                  %magazine   : chance weight to spawn magazines on spot
//                                  %ICV        : chance weight to spawn item/cloth/vests on spot
//                                  %backpack   : chance weight to spawn a backpack on spot
//                                  %object     : chance weight to spawn an world object on spot
//-------------- A VALUE OF '0' RESULTS IN NO LOOT FOR THIS CLASS AND TYPE ----------------
spawnClassChance_list =
[
	[1.0, 1.5, 2.0, 0.25, 5.0], // civil
	[1.5, 2.0, 1.5, 0.5, 1.5],  // military
	[0.5, 1.0, 3.0, 0.25, 5.0], // industrial
	[1.0, 1.5, 3.0, 0, 0]       // research
];

//"exclcontainer_list" single array of container classnames to NOT to delete if filled
exclcontainer_list = ["ReammoBox_F"];

//-------------------------------------------------------------------------------------
//DONT change these, will be filled in MAIN -------------------------------------------
Buildingpositions_list = [];
LSusedclass_list = ["GroundWeaponHolder"];
//DONT change these, will be filled in MAIN -------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
fn_getBuildingstospawnLoot = {
	#include "fn_LSgetBuildingstospawnLoot.sqf"
} call mf_compile;

fn_spawnLoot = {
	#include "fn_spawnLoot.sqf"
} call mf_compile;

LSdeleter = {
	#include "LSdeleter.sqf"
} call mf_compile;

//Buildings that can spawn loot go in this list
#include "LSlootBuildings.sqf"
//Loot goes in these lists
#include "LSlootLists.sqf"


//-------------------------------------------------------------------------------------
//function only runs once on beginning of mission, not really needs a compile
//fill Buildingpositions_list with [_buildingname, [_posIdxlist], [_posAdjustZlist]]
getBuildingLootPositions =
{
	private ["_positions", "_building"];
	_positions = [];
	_building = _this;

	if (isNull (missionconfigFile >> "CfgBuildingPos" >> _building)) exitWith {_positions};

	_positions = getArray (missionconfigFile >> "CfgBuildingPos" >> _building >> "positions");

	_positions
};
getBuildingLootType =
{
	private ["_type", "_building"];
	_building = _this;

	if (isNull (missionconfigFile >> "CfgBuildingPos" >> _building)) exitWith {-1};

	_type = getNumber (missionconfigFile >> "CfgBuildingPos" >> _building >> "table");

	_type
};



//-------------------------------------------------------------------------------------
// MAIN
//-------------------------------------------------------------------------------------
diag_log format["-- LOOTSPAWNER initialise ------------------------"];
if ((count Buildingstoloot_list) == 0) then {
	diag_log format["--!!ERROR!! LOOTSPAWNER Buildingstoloot_list in lootBuildings.sqf MUST have one entry at least !!ERROR!!--"];
	diag_log format["-- LOOTSPAWNER disabled --"];
} else {

	_dbgTime = diag_tickTime;

	diag_log format["-- LOOTSPAWNER LSusedclass_list ready, d: %1s", (diag_tickTime - _dbgTime)];

	//run loot deleter continously
	LOOT_SPAWN_INTERVAL spawn LSdeleter;
	diag_log format["-- LOOTSPAWNER LSDer started..."];

	if (swDebugLS) then {
		dbgTime = diag_tickTime;
		dbgTurns = 0;
		dbgTurnsplU = 0;
		dbgloopTime = 0;
		dbgloopTimeplU  = 0;
	};

	"pvar_spawnLootBuildings" addPublicVariableEventHandler
	{
		_buildings = [];

		{
			_building = objectFromNetId _x;

			if (!isNull _building) then
			{
				_buildings pushBack _building;
			};
		} forEach (_this select 1);

		if (count _buildings > 0) then
		{
			[_buildings, LOOT_SPAWN_INTERVAL, LOOT_Z_ADJUST, ["A3W_buildingLootChances", 25] call getPublicVar] spawn fn_getBuildingstospawnLoot;
		};
	};
};
