
sleep 1;

// INITIAL BOOLS
PZAPPROACH = true;
LZAPPROACH = false;

// INITIAL MISSION STATES:
DEPLOY = true;
ATTACK = false;
DEFEND = false;
SUPPORT = false;
EXTRACT = false;

// INITIAL MESSAGES
execVM "HUD\welcome.sqf";
["NEW FIRETEAM READY FOR DEPLOYMENT"] execVM "HUD\HUD_messages.sqf";
sleep 0.5;

execVM "RDS\stateManager.sqf";
systemChat "stateManager";

// MARKERS
execVM "RDS\markerSystem.sqf";
systemChat "initialising markerSystem";
sleep 0.5; // prev. APS

// PHASE 1 INITIALISE
execVM "RDS\p1_deploy.sqf";
systemChat "initialising p1_deploy";
sleep .05; // prev RDS 

// DEBUG UAV TRACKER - REPLACE WITH SOMETHING BETTER
execVM "UAV\uav.sqf";
systemChat "initialising uav";

// COUNTER SYSTEM
execVM "RDS\counter.sqf";
systemChat "initialising counter";
sleep 0.5;

// HUD EXECS 
execVM "HUD\HUD_avionics.sqf";
systemChat "avoinics ok";
sleep 0.5;
execVM "HUD\HUD_wayfinder.sqf";
systemChat "wayfinder ok";
sleep 0.5;
execVM "HUD\HUD_intel.sqf";
systemChat "intel ok";
sleep 0.5;
execVM "HUD\HUD_warnings.sqf";
systemChat "warnings ok";
sleep 0.5;
execVM "HUD\HUD_medevac.sqf";
systemChat "medevac ok";
sleep 0.5;
execVM "HUD\HUD_missionTime.sqf";
systemChat "time ok";
sleep 0.5;
//execVM "HUD\HUD_fuel.sqf"; TO DO !!


// REMOVE WILDLIFE 
enableEnvironment [false, true];


// GEN OPFOR DEFENDERS
_patrolObj = {
	_rndOp1 = selectRandom [25, 30];
	[_rndOp1] execVM "units\opforInitialDefenders.sqf";
}; [] spawn _patrolObj;


// CREATE MED-BASE ASSETS
execVM "units\bluforMedBaseAssets.sqf";
systemChat "initialising bluforMedBaseAssets";
sleep .05;
// TO DO -- MAKE ^^ ISFLAT !














// older stuff .. may be needed ...
/*



// ---------------------------- ambient combat
execVM "autoPatrolSystem\autoPatrolSystem.sqf";
systemChat "initialising autoPatrolSystem.sqf";
sleep 0.5;

// ---------------------------- LZ/PZ mission manager
execVM "autoPatrolSystem\deploymentMgr.sqf";
systemChat "initialising deploymentMgr.sqf";


sleep .05;
// ---------------------------- medevac system
//execVM "autoPatrolSystem\medEvac.sqf";
//systemChat "initialising medevac.sqf";


// ---------------------------- evac system [incomplete] ---------------------------------
// execVM "autoPatrolSystem\medEvac.sqf";
//player addAction ["medEvac", "autoPatrolSystem\medEvac.sqf"];
//player addAction ["MOVE INJURED TO MEDEVAC POINT", "autoPatrolSystem\getReady.sqf"];
//player addAction ["INJURED GET ONBOARD NOW", "autoPatrolSystem\getIn.sqf"];
//systemChat "initialising medEvac.sqf";
//sleep .05;




