// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.1
//	@file Name: serverCompile.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

if (!isServer) exitWith {};

diag_log "WASTELAND SERVER - Initializing Server Compile";

//Function Compiles
_path = "server\functions";
A3W_fnc_checkHackedVehicles = [_path, "checkHackedVehicles.sqf"] call mf_compile;
A3W_fnc_deleteEmptyGroup = [_path, "fn_deleteEmptyGroup.sqf"] call mf_compile;
A3W_fnc_registerKillScore = [_path, "fn_registerKillScore.sqf"] call mf_compile;
A3W_fnc_requestTickTime = [_path, "fn_requestTickTime.sqf"] call mf_compile;
A3W_fnc_setItemCleanup = [_path, "fn_setItemCleanup.sqf"] call mf_compile;
A3W_fnc_updateSpawnTimestamp = [_path, "fn_updateSpawnTimestamp.sqf"] call mf_compile;
addMilCap = [_path, "addMilCap.sqf"] call mf_compile;
basePartSetup = [_path, "basePartSetup.sqf"] call mf_compile;
cleanVehicleWreck = [_path, "cleanVehicleWreck.sqf"] call mf_compile;
defendArea = [_path, "defendArea.sqf"] call mf_compile;
findClientPlayer = [_path, "findClientPlayer.sqf"] call mf_compile;
fn_onPlayerConnected = [_path, "fn_onPlayerConnected.sqf"] call mf_compile;
fn_onPlayerDisconnected = [_path, "fn_onPlayerDisconnected.sqf"] call mf_compile;
fn_publicVariableAll = [_path, "fn_publicVariableAll.sqf"] call mf_compile;
fn_refillBox = [_path, "fn_refillbox.sqf"] call mf_compile;
fn_refillTruck = [_path, "fn_refilltruck.sqf"] call mf_compile;
fn_replaceMagazines = [_path, "fn_replaceMagazines.sqf"] call mf_compile;
fn_replaceWeapons = [_path, "fn_replaceWeapons.sqf"] call mf_compile;
fn_updatePlayerScore = [_path, "fn_updatePlayerScore.sqf"] call mf_compile;
hintBroadcast = [_path, "hintBroadcast.sqf"] call mf_compile;
parachuteLiftedVehicle = [_path, "parachuteLiftedVehicle.sqf"] call mf_compile;
playerRespawnServer = [_path, "playerRespawnServer.sqf"] call mf_compile;
processGroupInvite = [_path, "processGroupInvite.sqf"] call mf_compile;
processItems = [_path, "processItems.sqf"] call mf_compile;
refillPrimaryAmmo = [_path, "refillPrimaryAmmo.sqf"] call mf_compile;
respawnEventServer = [_path, "respawnEventServer.sqf"] call mf_compile;
teamKillUnlock = [_path, "teamKillUnlock.sqf"] call mf_compile;
teamSwitchLock = [_path, "teamSwitchLock.sqf"] call mf_compile;
teamSwitchUnlock = [_path, "teamSwitchUnlock.sqf"] call mf_compile;
vehicleRepair = [_path, "vehicleRepair.sqf"] call mf_compile;
vehicleSetup = [_path, "vehicleSetup.sqf"] call mf_compile;
waitUntilBagTaken = [_path, "waitUntilBagTaken.sqf"] call mf_compile;

//Player Management
server_playerDied = [_path, "serverPlayerDied.sqf"] call mf_compile;
A3W_fnc_serverPlayerDied = server_playerDied;

//Spawning Compiles
_path = "server\spawning";
addVehicleRespawn = [_path, "addVehicleRespawn.sqf"] call mf_compile;
boatCreation = [_path, "boatCreation.sqf"] call mf_compile;
objectCreation = [_path, "objectCreation.sqf"] call mf_compile;
planeCreation = [_path, "planeCreation.sqf"] call mf_compile;
randomWeapons = [_path, "randomWeapon.sqf"] call mf_compile;
// staticGunCreation = [_path, "staticGunCreation.sqf"] call mf_compile;
staticHeliCreation = [_path, "staticHeliCreation.sqf"] call mf_compile;
vehicleCreation = [_path, "vehicleCreation.sqf"] call mf_compile;
