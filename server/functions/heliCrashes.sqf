//Animated Helicrashs for DayZ 1.7.6.1
//Version 0.2
//Release Date: 05. April 2013
//Author: Grafzahl
//Thread-URL: http://opendayz.net/threads/animated-helicrashs-0-1-release.9084/
// heliCrashes.sqf

private["_useStatic","_crashDamage","_lootRadius","_preWaypointPos","_endTime","_startTime","_safetyPoint","_heliStart","_deadBody","_exploRange","_heliModel","_lootPos","_list","_craters","_dummy","_wp2","_wp3","_landingzone","_aigroup","_wp","_helipilot","_crash","_crashwreck","_smokerand","_staticcoords","_pos","_dir","_crashPosition","_num","_config","_itemChance","_weights","_index","_iArray","_crashModel","_lootTable","_guaranteedLoot","_randomizedLoot","_frequency","_variance","_spawnChance","_spawnMarker","_spawnRadius","_spawnFire","_permanentFire","_crashName"];

//_crashModel	= _this select 0;
//_lootTable	= _this select 1;
_guaranteedLoot = 3; //Number of the guaranteed Loot-Piles at the Crashside
_randomizedLoot = 4; //Number of the random Loot-Piles at the Crashside 3+(1,2,3 or 4)
_frequency	= 3000; //Fixed-Time (in seconds) between each start of a new Chopper
_variance	= 500; //Random time (in seconds) added between each start of a new Chopper
_spawnChance	= 1; //Spawnchance of the Heli (1 will spawn all possible Choppers, 0.5 only 50% of them)
_spawnMarker	= 'center'; //Center-Marker for the Random-Crashpoints, for Chernarus this is a point near Stary
_spawnRadius	= 400; //Radius in Meters from the marker in which the Choppers can crash and get waypoints
_spawnFire	= false; //Should the spawned crashsite burn (at night) & have smoke?
_fadeFire	= false; //Should the flames & smoke fade after a while?
_useStatic = false; //Use the Static-Crashpoint-Function? If true, you have to add Coordinates into server_spawnCrashSite.sqf
_crashDamage = 1; //Amount of Damage the Heli has to get while in-air to explode before the POC. (0.0001 = Insta-Explode when any damage//bullethit, 1 = Only Explode when completly damaged)


diag_log(format["CRASHSPAWNER: Starting spawn logic for animated helicrashs - written by Grafzahl [SC:%1||PW:%2||CD:%3]", str(_useStatic), _crashDamage]);

while {true} do {
	private["_timeAdjust","_timeToSpawn","_spawnRoll","_crash","_hasAdjustment","_newHeight","_adjustedPos"];
	// Allows the variance to act as +/- from the spawn frequency timer
	_timeAdjust = round(random(_variance * 2) - _variance);
	_timeToSpawn = time + _frequency + _timeAdjust;

	//Random Heli-Type
	_heliModel = ["CUP_B_UH60M_Unarmed_US", "CUP_O_Mi8_VIV_RU"] call BIS_fnc_selectRandom;

	//A Backup Waypoint, if not Chernarus, set some Coordinates far up in the north (behind all possible Crashsites)
	_safetyPoint = [7492.6675, 15263.042];

	//Settings for the Standard UH1H_DZ
	_crashModel = "BlackhawkWreck";
	_lootTable = 7;
	_exploRange = 195;
	_lootRadius = 0.35;

    _spawnPoints = [
        "Heli_1",
        "Heli_2",
        "Heli_3",
        "Heli_4",
        "Heli_5",
        "Heli_6",
        "Heli_7",
        "Heli_8",
        "Heli_9",
        "Heli_10"
    ];

    _crashePoints = [
        "Crash_1",
        "Crash_2",
        "Crash_3",
        "Crash_4",
        "Crash_5",
        "Crash_6",
        "Crash_7",
        "Crash_8",
        "Crash_9",
        "Crash_10",
        "Crash_11",
        "Crash_12",
        "Crash_13",
        "Crash_14",
        "Crash_15",
        "Crash_16",
        "Crash_17",
        "Crash_18",
        "Crash_19",
        "Crash_20",
        "Crash_21",
        "Crash_22"
    ];

    _smokeOffset = [-1.31348, -3.35742, 0.537615];
    _startMarker = _spawnPoints call BIS_fnc_selectRandom;
    _crashMarker = _crashePoints call BIS_fnc_selectRandom;

	//Adjust Wreck and Range of Explosion if its a Mi17_DZ
	if(_heliModel == "CUP_O_Mi8_VIV_RU") then {
        _smokeOffset = [-0.454102, -5.14404, 0.599365];
		_lootTable = 8;
		_crashModel = "Mi8Wreck";
		_exploRange = 285;
		_lootRadius = 0.3;
	};

	_crashName	= getText (configFile >> "CfgVehicles" >> _heliModel >> "displayName");

	diag_log(format["CRASHSPAWNER: %1%2 chance to start a crashing %3 with loot table '%4' at %5", round(_spawnChance * 100), '%', _crashName, _lootTable, _timeToSpawn]);

	// Apprehensive about using one giant long sleep here given server time variances over the life of the server daemon
	while {time < _timeToSpawn} do {
		sleep 5;
	};

	_spawnRoll = random 1;

	// Percentage roll
	if (_spawnRoll <= _spawnChance) then {


		_crashPosition = [getMarkerPos _crashMarker,0,200,10,0,2000,0] call BIS_fnc_findSafePos;

		diag_log(format["CRASHSPAWNER: %1 started flying from %2 to %3 NOW!(TIME:%4||LT:%5)", _crashName,  str(_startMarker), str(_crashPosition), round(time), _lootTable]);

		//Spawn the AI-Heli flying in the air
		_startTime = time;
		_crashwreck = createVehicle [_heliModel,[getMarkerPos _startMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos, [], 0, "FLY"];

		_crashwreck engineOn true;
		_crashwreck flyInHeight 120;
		_crashwreck forceSpeed 140;
		_crashwreck setspeedmode "LIMITED";

		//Create an Invisibile Landingpad at the Crashside-Coordinates
		_landingzone = createVehicle ["HeliHEmpty", [_crashPosition select 0, _crashPosition select 1,0], [], 0, "CAN_COLLIDE"];

		_aigroup = creategroup civilian;
		_helipilot = _aigroup createUnit ["B_Survivor_F",getPos _crashwreck,[],0,"FORM"];
		_helipilot moveindriver _crashwreck;
		_helipilot assignAsDriver _crashwreck;

		sleep 0.5;

		_wp2 = _aigroup addWaypoint [position _landingzone, 0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointBehaviour "CARELESS";

		//Even when the Heli flys to high, it will burn when reaching its Waypoint
		_wp2 setWaypointStatements ["true", "_crashwreck setdamage 1;"];

		//Adding a last Waypoint up in the North, so the Heli doesnt Hover at WP1 (OR2)
		//and would also come back to WP1 if somehow it doesnt explode.
		_wp3 = _aigroup addWaypoint [_safetyPoint, 0];
		_wp3 setWaypointType "CYCLE";
		_wp3 setWaypointBehaviour "CARELESS";

		//Get some more Speed when close to the Crashpoint and go on even if Heli died or hit the ground
		waituntil
        {
            (_crashwreck distance _crashPosition) <= 1000 || not alive _crashwreck || (getPosATL _crashwreck select 2) < 5 || (damage _crashwreck) >= _crashDamage
        };
			_crashwreck flyInHeight 95;
			_crashwreck forceSpeed 160;
			_crashwreck setspeedmode "NORMAL";

		//BOOOOOOM!
		waituntil {(_crashwreck distance _crashPosition) <= _exploRange || not alive _crashwreck || (getPosATL _crashwreck select 2) < 5 || (damage _crashwreck) >= _crashDamage};
			//Taking out the Tailrotor would be more realistic, but makes the POC not controllable

 
        _crashwreck setdamage 1;
        _crashwreck setfuel 0;

        diag_log(format["CRASHSPAWNER: %1 just exploded at %2!, ", _crashName, str(getPosATL _crashwreck)]);


        //Giving the crashed Heli some time to find its "Parkingposition"
        sleep 13;
        //She cant survive this :(
        _helipilot setdamage 1;

		//Get position of the helis wreck, but make sure its on the ground;
		_pos = [getpos _crashwreck select 0, getpos _crashwreck select 1,0];

		//saving the direction of the wreck(not used right now)
		_dir = getdir _crashwreck; 

		//Send Public Variable so every client can delete the craters around the new Wreck (musst be added in init.sqf)
		heliCrash = _pos;
		//publicVariable "heliCrash";
		
		//Clean Up the Crashsite
		deletevehicle _crashwreck;
		deletevehicle _helipilot;
		deletevehicle _landingzone;

		//Animation is done, lets create the actual Crashside
		_crash = createVehicle [_crashModel, _pos, [], 0, "CAN_COLLIDE"];
		_crash setVariable["Sarge",1];


		//If you want all Grass around the crashsite to be cutted: Uncomment the next Line (Noobmode)
		_crashcleaner = createVehicle ["ClutterCutter_EP1", _pos, [], 0, "CAN_COLLIDE"];

		//Setting the Direction would add realism, but it sucks because of the bugged model when not on plane ground.
		//If you want it anyways, just uncomment the next line
		//_crash setDir _dir;

		_crash setVariable ["ObjectID",1,true];


        sleep 0.5;
		_smokePos = _crash modelToWorld _smokeOffset;
        _wreckSmoke = "test_EmptyObjectForSmoke" createVehicle _smokePos;
        
        _wreckSmokePosition = _crash modelToWorld _smokeOffset;
        _wreckSmoke setPosATL _wreckSmokePosition;
		//Creating the Lootpiles outside of the _crashModel
        for "_x" from ((round(random _randomizedLoot)) + _guaranteedLoot) to 1 step -1  do {
            //create loot

            _lootpos = [];
            for [{_y = 0}, {_y < 10 && ((count _lootpos) == 0)}, {_y = _y + 1}] do {
                _angle = random 360;
                _radius = 0.9 + random 0.6;
                _lootPos = [_pos, ((random 2) + (sizeOf(_crashModel) * _lootRadius)), random 360] call BIS_fnc_relPos;
            };

            if ((count _lootpos) >= 2) then {
                _lootpos set [2,0];
                _item = [_lootTable, _lootpos, 0] call fn_spawnLoot;
                _item setVariable ["permaLoot",true];
                
                /*switch true do {
                    case (dayz_spawnCrashSite_clutterCutter == 1): { // shift loot upward to 5cm
                        _lootpos set [2,0.05];
                        _item setPosATL _lootpos;
                    };
                    case (dayz_spawnCrashSite_clutterCutter == 2): { // cutterclutter
                        _clutter = createVehicle ["ClutterCutter_small_2_EP1", _lootpos, [], 0, "CAN_COLLIDE"];
                        _clutter setPos _lootpos;
                    };
                    case (dayz_spawnCrashSite_clutterCutter == 3): { // shift loot upward to 5cm
                        createVehicle ["Sign_sphere100cm_EP1", [_lootpos select 0, _lootpos select 1, 0.30], [], 0, "CAN_COLLIDE"];
                    };
                    };*/
                    
                diag_log(format["CRASHSPAWNER: Loot spawn at '%1 - %3' with loot table '%2'", _crashName, str(_lootTable),_lootpos]);
                sleep 0.001;
            };
        }; // loot loop
        
		//Adding 5 dead soldiers around the wreck, poor guys
		/*for "_x" from 1 to 5 do {
			_lootPos = [_pos, ((random 4)+3), random 360] call BIS_fnc_relPos;
			_deadBody = createVehicle[["Body1","Body2"] call BIS_fnc_selectRandom,_lootPos,[], 0, "CAN_COLLIDE"];
			_deadBody setDir (random 360);
		};*/
		_endTime = time - _startTime;
		diag_log(format["CRASHSPAWNER: Crash completed! Wreck at: %2 - Runtime: %1 Seconds || Distance from calculated POC: %3 meters", round(_endTime), str(getPos _crash), round(_crashPosition distance _crash)]); 
	};
};