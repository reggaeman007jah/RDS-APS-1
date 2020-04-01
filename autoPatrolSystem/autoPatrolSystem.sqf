
// ---------------------------------------------------------------------------------------------------------
// RAPID DEPLOYMENT SIMULATOR (RDS)
// Version 1.0
// Primary Objective - ferry units into an AO, by helicopter, then support them as they hold the position
// Secondary Objective - become a better pilot
// I hope you enjoy..
// Cheers
// Reggs
// ---------------------------------------------------------------------------------------------------------



// REMOVE WILDLIFE -----------------------------------------------------------------------------------------

// because frames, and also messes with my UAV debug script
enableEnvironment [false, true];



// MARKERS AND LOCATIONS -------------------------------------------------------------------------------------------------

// system to generate initial location, and patrol objective location 
start = position player;
_startPosition = position player;
// to do: confirm why both ^^ are needed
// (FUTURE REF: this can be used to find map centre) _startPosition = [worldSize / 2, worldsize / 2, 0];

_patrolDestination = [start, 700, 700] call BIS_fnc_findSafePos; 
RGG_basePos = [start, 1800, 1800] call BIS_fnc_findSafePos; 

dest = _patrolDestination;


// BASE - acts as blufor base area, can be used for RF/RE-UP tasks 
// currently unused // 24sept now used 1600m from start
sleep 5;
deleteMarkerlocal "base";
_base = createMarkerLocal ["base", RGG_basePos];
_base setMarkerShapeLocal "ELLIPSE";
_base setMarkerColorLocal "ColorGreen";
_base setMarkerSizeLocal [50, 50];
_base setMarkerAlphaLocal 0.9;
sleep 2;
// 02oct made base smaller, from 150 to 50

// AO - main dark grey circle within which all mission calcs take place
deleteMarkerlocal "BattleArea"; 
_battleArea = createMarkerLocal ["BattleArea", _patrolDestination];
_battleArea setMarkerShapeLocal "ELLIPSE";
_battleArea setMarkerColorLocal "ColorBlack";
_battleArea setMarkerSizeLocal [2250, 2250];
_battleArea setMarkerAlphaLocal 0.5;
sleep 2;

// OBJ - main blue patrol objective within which most battles are fought  
deleteMarkerlocal "Objective";
_objective = createMarkerLocal ["Objective", _patrolDestination];
_objective setMarkerShapeLocal "ELLIPSE";
_objective setMarkerColorLocal "ColorBlue";
_objective setMarkerSizeLocal [800, 800];
_objective setMarkerAlphaLocal 0.9;
sleep 2;

// OBJ - centre (core) objective that can be used for exfil/medevac
deleteMarkerlocal "Core";
_objective = createMarkerLocal ["Core", _patrolDestination];
_objective setMarkerShapeLocal "ELLIPSE";
_objective setMarkerColorLocal "ColorBlue";
_objective setMarkerSizeLocal [10, 10];
//_objective setMarkerAlphaLocal 1;
sleep 2;



// function to generate initial opfor defenders and triggers when to generate opfor RF----------------------
_patrolObj = {
	// initial opfor defenders
	_rndOp1 = selectRandom [20, 30];
	[_rndOp1] execVM "units\opforAltis.sqf";
}; [] spawn _patrolObj;

sleep 10;

systemChat "attackWaves initilised .............!";

execVM "autoPatrolSystem\attackWaves.sqf";


/* unlock below this line if what you try is shit.. if RF works, then delete the below
	// opfor RF system ------------------------------------------------------------------------------------------------------------------------------
	while {true} do 
	{
		sleep 20; // performance helper at the beginning prevents RF from triggering at beginning of mission
		if ((RGG_objOpCount) <=2) then // uses separate global counter
		{
			execVM "units\opfor_RF_Spawner.sqf";
			["WARNING - OPFOR REINFORCEMENTS INBOUND"] execVM "HUD\HUD_messages.sqf";
			sleep 1;
			["MISSION STATUS: DEFEND OBJECTIVE"] execVM "HUD\HUD_missionState.sqf";
			// start defend counter here, and show in dialog!
		}; 
	};
}; [] spawn _patrolObj;

// 02oct the way opRF is created is too basic, and has no limiter. It needs a better design so that there is
// a viable mission end.
// what can you do with a full tank of gas? 
// can you slow down gas consumption?
// ok idea, so if RGG_objOpCount <= 2 then DEFEND = true 
// if DEFEND = true then 










// DO THIS !!! AD TIMER DIALOG WHEN MISSION STATE = DEFEND!