// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: defineServerRules.sqf
//	@file Author: AgentRev
//	@file Created: 13/07/2013 21:23

if (!hasInterface) exitWith {};

if !(player diarySubjectExists "rules") then
{
	waitUntil {player diarySubjectExists "credits"};
	player createDiarySubject ["rules", "Server Rules"];
	player createDiaryRecord ["rules", ["Rules",
"

<br/>
<font face='PuristaBold' size='22'>AwakenRP Rules in short, visit www.awakenrp.com for full rules</font> <br/>
<br/>
<font face='PuristaBold'>1.</font> You must roleplay! <br/>
<font face='PuristaBold'>2.</font> No Killing on Sight! <br/>
<font face='PuristaBold'>4.</font> Respect other players. <br/>
<font face='PuristaBold'>5.</font> Respect the administrators. <br/>
<font face='PuristaBold'>5.</font> Remember new life rule! <br/>
<font face='PuristaBold'>5.</font> Do not metagame! <br/>

"

]];
};
