// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: clientCompile.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, MercyfulFate, AgentRev
//	@file Args:

mf_notify_client = "client\functions\notifyClient.sqf" call mf_compile;
mf_util_playUntil = "client\functions\playUntil.sqf" call mf_compile;

// Event handlers
getInVehicle = "client\clientEvents\getInVehicle.sqf" call mf_compile;
getOutVehicle = "client\clientEvents\getOutVehicle.sqf" call mf_compile;
onRespawn = "client\clientEvents\onRespawn.sqf" call mf_compile;
onKilled = "client\clientEvents\onKilled.sqf" call mf_compile;
onKeyPress = "client\clientEvents\onKeyPress.sqf" call mf_compile;
onKeyRelease = "client\clientEvents\onKeyRelease.sqf" call mf_compile;

// Functions
A3W_fnc_copilotTakeControl = "client\functions\copilotTakeControl.sqf" call mf_compile;
A3W_fnc_inGameUIActionEvent = "client\functions\fn_inGameUIActionEvent.sqf" call mf_compile;
A3W_fnc_forceOpenParachute = "client\functions\fn_forceOpenParachute.sqf" call mf_compile;
A3W_fnc_openParachute = "client\functions\fn_openParachute.sqf" call mf_compile;
A3W_fnc_titleTextMessage = "client\functions\titleTextMessage.sqf" call mf_compile;
addWeaponInventory = "client\functions\addWeaponInventory.sqf" call mf_compile;
canForceSaveStaticWeapon = "client\functions\canForceSaveStaticWeapon.sqf" call mf_compile;
canForceSaveVehicle = "client\functions\canForceSaveVehicle.sqf" call mf_compile;
canBoilWater = "client\functions\canBoilWater.sqf" call mf_compile;
canRefillWater = "client\functions\canRefillWater.sqf" call mf_compile;
canPushPlaneBack = "client\functions\canPushPlaneBack.sqf" call mf_compile;
canPushVehicleOnFoot = "client\functions\canPushVehicleOnFoot.sqf" call mf_compile;
canPushWatercraft = "client\functions\canPushWatercraft.sqf" call mf_compile;
findHackedVehicles = "client\systems\adminPanel\findHackedVehicles.sqf" call mf_compile;
fn_addManagedAction = "client\functions\fn_addManagedAction.sqf" call mf_compile;
fn_ctrlOverlapCheck = "client\functions\fn_ctrlOverlapCheck.sqf" call mf_compile;
fn_disableCollision = "client\functions\fn_disableCollision.sqf" call mf_compile;
fn_emergencyEject = "client\functions\fn_emergencyEject.sqf" call mf_compile;
fn_encodeText = "client\functions\fn_encodeText.sqf" call mf_compile;
fn_fitsInventory = "client\functions\fn_fitsInventory.sqf" call mf_compile;
fn_forceSaveObject = "client\functions\fn_forceSaveObject.sqf" call mf_compile;
fn_forceSaveVehicle = "client\functions\fn_forceSaveVehicle.sqf" call mf_compile;
fn_formatTimer = "client\functions\fn_formatTimer.sqf" call mf_compile;
fn_getItemArmor = "client\functions\fn_getItemArmor.sqf" call mf_compile;
fn_removeAllManagedActions = "client\functions\fn_removeAllManagedActions.sqf" call mf_compile;
fn_removeManagedAction = "client\functions\fn_removeManagedAction.sqf" call mf_compile;
fn_voiceChatControl = "client\functions\fn_voiceChatControl.sqf" call mf_compile;
getDefaultClothing = "client\functions\getDefaultClothing.sqf" call mf_compile;
getFullMove = "client\functions\getFullMove.sqf" call mf_compile;
getMoveParams = "client\functions\getMoveParams.sqf" call mf_compile;
getPushPlaneAction = "client\functions\getPushPlaneAction.sqf" call mf_compile;
groupNotify = "client\functions\groupNotify.sqf" call mf_compile;
isAdmin = "client\systems\adminPanel\isAdmin.sqf" call mf_compile;
isAssignableBinocular = "client\functions\isAssignableBinocular.sqf" call mf_compile;
isPVarTarget = "client\functions\isPVarTarget.sqf" call mf_compile;
isWeaponType = "client\functions\isWeaponType.sqf" call mf_compile;
parseMove = "client\functions\parseMove.sqf" call mf_compile;
serverMessage = "client\functions\serverMessage.sqf" call mf_compile;
uniformConverter = "client\functions\uniformConverter.sqf" call mf_compile;
unitHandleDamage = "client\functions\unitHandleDamage.sqf" call mf_compile;
vehicleSideCfg = "client\functions\vehicleSideCfg.sqf" call mf_compile;

// Player details and actions
playerSpawn = "client\functions\playerSpawn.sqf" call mf_compile;
playerSetup = "client\functions\playerSetup.sqf" call mf_compile;
playerSetupStart = "client\functions\playerSetupStart.sqf" call mf_compile;
playerSetupGear = "client\functions\playerSetupGear.sqf" call mf_compile;
playerSetupEnd = "client\functions\playerSetupEnd.sqf" call mf_compile;
spawnAction = "client\functions\spawnAction.sqf" call mf_compile;
spawnInTown = "client\functions\spawnInTown.sqf" call mf_compile;
spawnRandom = "client\functions\spawnRandom.sqf" call mf_compile;

// Sync client with server time
timeSync = "client\functions\clientTimeSync.sqf" call mf_compile;


if (isNil "A3W_fnc_MP") then { A3W_fnc_MP = compile preprocessFileLineNumbers "\A3\functions_f\MP\fn_MP.sqf" };
if (isNil "A3W_fnc_MPexec") then { A3W_fnc_MPexec = compile preprocessFileLineNumbers "\A3\functions_f\MP\fn_MPexec.sqf" };

player groupChat "AwakenRP - Client Loading";
sleep 1;
playerCompiledScripts = true;
