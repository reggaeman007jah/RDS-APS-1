
/*
02oct this script should become a 'state manager' for the game.
We already have a good HUD system that can display any state we pass to it.
As of today, the only messages are:
	["MISSION STATUS: DEPLOYMENT ... MOVE GROUND UNITS TO KEY LOCATIONS"] execVM "HUD\HUD_missionState.sqf";
	["MISSION STATUS: DEPLOY GROUND UNITS IN KEY LOCATIONS"] execVM "HUD\HUD_missionState.sqf";
	["MISSION STATUS: ATTACK OBJECTIVE"] execVM "HUD\HUD_missionState.sqf";
I am adding this:
	["MISSION STATUS: DEFEND OBJECTIVE"] execVM "HUD\HUD_missionState.sqf";
this is to be run if opfor is reinforcing... so to do this I am going to see if I can just overwrite the ATTACK
message with an update in autoPatrolSystem (this also needs renamning!)


Current mission states:
LZApproach
PZApproach
These states are key to the mission, and inform when new units are ready for pickup (and where they are), and
also informs where they should be deployed
?

Current bool states:

if ((RGG_BZbluforCount) <= 16) then {

	BLURF = false;

	["TROOPERS WILL HOLD POSITION HERE"] execVM "HUD\HUD_messages.sqf"; // hold position
	sleep 0.1;
	["MISSION STATUS: DEPLOY GROUND UNITS IN KEY LOCATIONS"] execVM "HUD\HUD_missionState.sqf";

} else {

	BLURF = true;
	["UNITS MOVING IN TO ATTACK"] execVM "HUD\HUD_messages.sqf";
	sleep 0.1;
	["MISSION STATUS: ATTACK OBJECTIVE"] execVM "HUD\HUD_missionState.sqf";


*/


// basic system to check balance of ground assets to prevent overkill of blufor spawns

// compare blu and opfor troops to manage whether to deploy more troops,
// if no, are any injured?
// if no, then what? deploy ammo?


// DEPLOYMENT MGR
// if numbers are good, then script, else hint, no more for you right now buddy
// 21sept - done

// 20sept
// this script is based on the rule that you shouldn't have more than 16 blu units in battle..
// BLURF = false; means do not trigger a new fireteam for pickup
// here, every second, we check blu troops in BZ
// 21sept if this works, then the 16 value below can be changed to make it more difficult?
// also, am realising that an LZ near a building is not a bad thing!

if ((RGG_BZbluforCount) <= 16) then {

	BLURF = false;

	["TROOPERS WILL HOLD POSITION HERE"] execVM "HUD\HUD_messages.sqf"; 
	sleep 0.1;
	["MISSION STATUS: DEPLOY GROUND UNITS IN KEY LOCATIONS"] execVM "HUD\HUD_missionState.sqf";

} else {

	BLURF = true;
	["UNITS MOVING IN TO ATTACK"] execVM "HUD\HUD_messages.sqf";
	sleep 0.1;
	if (DEFEND = false) then {
		["MISSION STATUS: ATTACK OBJECTIVE"] execVM "HUD\HUD_missionState.sqf";
	} else {
		["MISSION STATUS: DEFEND OBJECTIVE"] execVM "HUD\HUD_missionState.sqf";
	};

};

// NOTE - ^^^ left the above, which freezes state ... never moves to ATTACK!!!

sleep 10;

if (BLURF) then {
execVM "autoPatrolSystem\movementManager.sqf";
//systemChat "movementManager initiated";
};



// I am inserting this into count.sqf first, instead of having another true script
// end of 20sept change

// 24SEPT BLURF IS TOO BLUNT, I NEED A MORE REFINED SET OF MISSION STATES...
/*
DEPLOYMENT
..
I ALREADY DID THIS LIST ..?


*/




