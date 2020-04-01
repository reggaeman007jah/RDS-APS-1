
/*
this script manages inflow of enemy while blufor team holds the objective

called on initial build of opfor defenders
waits until numbers are low
two messages on trigger, warnnig and mission state 
triggers count down timer
creates enemy spawner script
waits and then reloads this script i.e. perma-loop

*/


waitUntil 
{
	(RGG_objOpCount) <= 2;
};

DEFEND = true;

execVM "units\opfor_RF_Spawner.sqf";
["WARNING - OPFOR REINFORCEMENTS INBOUND"] execVM "HUD\HUD_messages.sqf";
sleep 1;
["MISSION STATUS: DEFEND OBJECTIVE"] execVM "HUD\HUD_missionState.sqf";
sleep 1;
//execVM "HUD\HUD_missionCountdown.sqf";
//sleep 1;
//execVM "units\opfor_RF_Spawner.sqf";
sleep 20;
execVM "autoPatrolSystem\attackWaves.sqf";



// do I need the below? 03oct.
/*
_opforRF = {
	
	while {true} do 
	{
		if ((RGG_objOpCount) <=2) then 
		{
			execVM "units\opfor_RF_Spawner.sqf";
			["WARNING - OPFOR REINFORCEMENTS INBOUND"] execVM "HUD\HUD_messages.sqf";
			sleep 1;
			["MISSION STATUS: DEFEND OBJECTIVE"] execVM "HUD\HUD_missionState.sqf";
		}; 
	};
}; [] spawn _opforRF;
