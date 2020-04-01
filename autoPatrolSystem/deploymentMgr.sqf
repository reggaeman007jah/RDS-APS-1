
// Simple PZ/LZ Script - the management system for creating blufor reinforcement units


// 20sept 
// this change tried to implement a limit on how many RF you can have created for you
// up to now this has been unlimited and can be a useful game-model, however, a new idea is
// to have a bit more of a tactical approach, with successful drops recognised... will it be
// hard to find the balance here, as pilots will try to be as safe as poss... maybe a good thing..? 

/*
OK THIS IS A BAD IDEA i THINK, BUT I LEAVE IN FOR NOW, IN CASE MY ALT IDEA IS WORSE
if (BLURF) then {

execVM "bluRFAT.sqf";

};

waitUntil { 
	((BLURF) = false);
};
*/

//20sept
// I moved this ... it was at the end before
//["NEW FIRETEAM READY FOR DEPLOYMENT"] execVM "HUD\HUD_messages.sqf";
// as the above will be shown every time this script is run, I have moved this to init, as we only want this run once, on startup



// debug ---------------------------------------------------------------------------------------------
//systemChat "deploymentMgr is now processing a new task...";
//20sept removed above line
sleep 1;
//hint "pickup troops from PZ Yellow";
// 18SEPT TODO ^^^ RSCTEXT

// MISSION STATES ------------------------------------------------------------------------------------
LZAPPROACH = false;
sleep 1;
//PZAPPROACH = true;
//["debug pz approach = true"] execVM "HUD\HUD_missionState.sqf";

//18SEPT TODO CHECK WHY PZAPPROACH DOES NOT TRIGGER HUD


// configs -------------------------------------------------------------------------------------------
// this sets how far away from the core your blufr RF units are spawned for pickup 

// PZ marker management ----------------------------------------------------------------------------
// here, if we have units attacking the obj, then topups are further away, and 2 per pickup not 4
if (BLURF) then {

	SF_pickup = [dest, 1200, 1200] call BIS_fnc_findSafePos; 
	deleteMarkerlocal "SFPZ";
	_PZMarker = createMarkerLocal ["SFPZ", SF_pickup];
	_PZMarker setMarkerShapeLocal "ELLIPSE";
	_PZMarker setMarkerColorLocal "ColorYELLOW";
	_PZMarker setMarkerSizeLocal [80, 80];
	_PZMarker setMarkerAlphaLocal 0.7;

} else {

	SF_pickup = [dest, 900, 900] call BIS_fnc_findSafePos; 
	deleteMarkerlocal "SFPZ";
	_PZMarker = createMarkerLocal ["SFPZ", SF_pickup];
	_PZMarker setMarkerShapeLocal "ELLIPSE";
	_PZMarker setMarkerColorLocal "ColorYELLOW";
	_PZMarker setMarkerSizeLocal [80, 80];
	_PZMarker setMarkerAlphaLocal 0.7;
	// make ^^^ flat!
};
// 22sept adding condition BLURF to know if I can switch to AT RF
// 24sept .. need more mission states inc medevac

// trigger to create PZ smoke and create units -----------------------------------------------------
waitUntil 
{
	(player distance SF_pickup) <= 750;
};

_smoke = createVehicle ["G_40mm_smokeRed", getMarkerPos "SFPZ", [], 0, "none"];
["SMOKE OUT"] execVM "HUD\HUD_messages.sqf";
sleep 3;

if (BLURF) then {

execVM "units\bluRFAT.sqf"; // triggers AT reinforcements on next pickup

} else {

execVM "units\bluforTanoa.sqf"; // triggers usual firetem rifleman classes

};


// auto-boarding instructions -------------------------------------------------------------------------
waitUntil 
{
	(player distance SF_pickup) <= 250;
};
["LAND ON THE RED SMOKE"] execVM "HUD\HUD_landNow.sqf";
	
waitUntil 
{
	(player distance SF_pickup) <= 80;
};

//["V V V --- LAND NOW --- V V V"] execVM "HUD\HUD_landNow.sqf";

waitUntil { 
	((RGGATL3) < 3);
};
["TROOPERS ARE BOARDING NOW"] execVM "HUD\HUD_messages.sqf";

PZAPPROACH = FALSE;

_units = allUnits inAreaArray "SFPZ";
{
	_x assignAsCargo heli2;
	//sleep 1.5;
	sleep 0.2;
} forEach _units;	
_units orderGetIn true;
sleep 1;
//18SEPT TODO CHECK HOW TO COUNT PASSENGERS - THIS COULD BE STATE TRIGGER

// 20sept 
// explore creating a new LZ for each fireteam, using a marker, then
// remove all LZs when they are ready to attack objective

// 24sept changing sleep time above from 1.5 to 0.25, to see if the response is better, but also
// checking seats don't get badly allocated

// LZ marker management ----------------------------------------------------------------------------

// 24sept the BLURF works well. But, having a value of 50 means that you can only drop off at the core
// and if core is not taken this is suicide. Experiment with changing value form 50 to 250.
// then exp chaning the value to OBJECTIVE ... allowing you to deploy AT behind any armoured column.
// idea, maybe BLURF means - get a team close in there, but maybe there is also a different state when
// OPFOR RF is coming in ... then you could position your AT behnind them, or on their flanks and get them
// to move towards them..?
// for now, the 250m rule mena syou need to use terrain to get close.
// make sur ethis is in the HUD instruction panel

if (BLURF) then {

SF_dropOff = dest; 
deleteMarkerlocal "SFLZ";
_PZMarker = createMarkerLocal ["SFLZ", SF_dropOff];
_PZMarker setMarkerShapeLocal "ELLIPSE";
_PZMarker setMarkerColorLocal "ColorRED";
// _PZMarker setMarkerSizeLocal [80, 80]; // prev
_PZMarker setMarkerSizeLocal [800, 800];
// _PZMarker setMarkerAlphaLocal 0.7; // prev
_PZMarker setMarkerAlphaLocal 0.3;
// 28sept this ^^ means when BLURF, you can drop off anywhere in BZ

/* this works, but bigger red area is not working with two armoured vics, so insteqad have drop anywhere rule
//SF_dropOff = [dest, 50, 50] call BIS_fnc_findSafePos; // prev
SF_dropOff = [dest, 250, 250] call BIS_fnc_findSafePos; 
deleteMarkerlocal "SFLZ";
_PZMarker = createMarkerLocal ["SFLZ", SF_dropOff];
_PZMarker setMarkerShapeLocal "ELLIPSE";
_PZMarker setMarkerColorLocal "ColorRED";
// _PZMarker setMarkerSizeLocal [80, 80]; // prev
_PZMarker setMarkerSizeLocal [200, 200];
// _PZMarker setMarkerAlphaLocal 0.7; // prev
_PZMarker setMarkerAlphaLocal 0.3;
*/

} else {

SF_dropOff = [dest, 650, 650] call BIS_fnc_findSafePos; 
deleteMarkerlocal "SFLZ";
_PZMarker = createMarkerLocal ["SFLZ", SF_dropOff];
_PZMarker setMarkerShapeLocal "ELLIPSE";
_PZMarker setMarkerColorLocal "ColorRED";
_PZMarker setMarkerSizeLocal [80, 80];
_PZMarker setMarkerAlphaLocal 0.7;
// make ^^^ flat!
// end of 20sept change
};




waitUntil 
{
	(player distance SF_pickup) <= 80;
};




PZAPPROACH = false; // 24sept, this seems to be a repeat .. see above .. delete one of these!!
sleep 1;
LZAPPROACH = true;
//["debug lz approach = true"] execVM "HUD\HUD_missionState.sqf";
// 20sept I removed the above line

// we need a trigger here to check that units are boarded, and PZ mission is successful ---------------

// serVar here?
// pickUp = false;
// dropOff = true;

// ----------------------------------------------------------------------------------------------------


// auto-disembark instructions -------------------------------------------------------------------------

if (BLURF) then {

	waitUntil 
	{
		(player distance SF_dropOff) <= 800; // what..??? 28sept
	};

} else {

	waitUntil 
	{
		(player distance SF_dropOff) <= 80;
	};
// 20sept change
// the above used to be DEST 350, I changed to SF_dropOff 30;
};

_units = fullCrew vehicle player;
{
	_x orderGetIn false;
} forEach _units;	

{ unassignVehicle _x } forEach crew heli2;
			

// marker management -----------------------------------------------------------------------------------
//hint "get your troops on the ground ASAP";
["|--- LAND NOW ---|"] execVM "HUD\HUD_landNow.sqf";
// 20sept idea .. while player is within LZdropOff, show red backed black text simply "LAND"'.
// seriously ... DO THIS
// maybe if you dont do this, units still get out and move in, but you get no points...
// if you do comply, then you get points for each squaddie who is on ground and alive when you leave 

//21 sept

waitUntil { 
	((RGGATL3) < 3);
};
execVM "autoPatrolSystem\attackCheck.sqf"; // checks what units should do - hold position or move in

sleep 2;
// waituntil player is close to ground level and moving slow, then:
//execVM "autoPatrolSystem\movementManager.sqf";
//sleep 5;
// 21 sept
// 28sept changed above sleep from 5 to 2, to see if that makes the new PZ mission appear quicker.


// we need a trigger here to check that units are on ground, and LZ mission is successful ---------------

// serVar here?
// pickUp = true;
// dropOff = false;

// ----------------------------------------------------------------------------------------------------


// next, have an alt-related trigger -------------------------------------------------------------------
//hint "new PZ being created... check map";


sleep 5;
LZAPPROACH = false;
sleep 0.5;
PZAPPROACH = true;
//["debug pz approach = true"] execVM "HUD\HUD_missionState.sqf";
// 20sept removed above comment

sleep 3;
execVM "autoPatrolSystem\deploymentMgr.sqf";


















/*
below this point works - above is exp on whether we can remove get/setVar

// 111 = is NOT busy ... 999 IS busy
systemChat "deploymentMgr is processing new task...";
_objective1 = createMarkerLocal ["Objective", dest];
_objective1 setMarkerShapeLocal "ELLIPSE";
_objective1 setMarkerColorLocal "ColorBlue";
_objective1 setMarkerSizeLocal [150, 150];
_objective1 setMarkerAlphaLocal 0.5;


RGG_check = player getVariable "isBusy"; 

if ((RGG_check) == 111) then 
{
	systemChat (format ["debug --- Current Mission State = %1", RGG_check]);
	sleep 1;

	// debug
	hint "go and pickup troops";

	// PZ marker management
	SF_pickup = [dest, 400, 450] call BIS_fnc_findSafePos; 
	deleteMarkerlocal "SFPZ";
	_PZMarker = createMarkerLocal ["SFPZ", SF_pickup];
	_PZMarker setMarkerShapeLocal "ELLIPSE";
	_PZMarker setMarkerColorLocal "ColorYELLOW";
	_PZMarker setMarkerSizeLocal [80, 80];
	_PZMarker setMarkerAlphaLocal 0.7;

	// trigger to create PZ smoke and create units
	waitUntil 
	{
		(player distance SF_pickup) <= 700;
	};

	_smoke = createVehicle ["G_40mm_smokeBlue", getMarkerPos "SFPZ", [], 0, "none"];
	sleep 3;
	//_units = 6; 
	//player sideChat format ["%1 SF Units on Blue Smoke",_units];

	// trigger to create units 
	//waitUntil 
	//{
	//	(player distance SF_pickup) <= 600;
	//};

	// unit creation
	for "_i" from 1 to 6 do 
	{
		bluGroup = createGroup west;
		_unit = bluGroup createUnit ["b_soldier_m_f", getMarkerPos "SFPZ", [], 0.1, "none"]; 
		_randomDir = selectRandom [270, 290, 01, 30, 90];
		_endPoint = SF_pickup getPos [10, _randomDir];
		_unit doMove _endPoint;
		systemChat "UNIT CREATED";
		sleep 1;
	};

	// trigger for auto-boarding
	waitUntil 
	{
		(player distance SF_pickup) <= 150;
	};

	// some time to allow landing before units move to heli	
	hint "you are within 150m of PZ, land now";
	
	// auto-boarding instructions
	_units = allUnits inAreaArray "SFPZ";
	{
		_x assignAsCargo heli2;
		sleep 1;
	} forEach _units;	
	_units orderGetIn true;

	player setVariable ["isBusy", 999]; // now needs an LZ task
	sleep 10;
	//execVM "autoPatrolSystem\deploymentMgr.sqf";

};  



//if ((RGG_check) == 999) then 
//{
	//systemChat (format ["debug --- CheckSF // Current Mission State = %1", RGG_check]);
	//sleep 1;

	

		// auto-alighting instructions
		waitUntil 
		{
			(player distance dest) <= 150;
		};

		_units = fullCrew vehicle player;
		//_units orderGetIn false;
			{
				_x orderGetIn false;
				//unassignVehicle _x;
			} forEach _units;	

			{ unassignVehicle _x } forEach crew heli2;
			
//{unassignVehicle _x} forEach units previous_group_of_heli;

		// marker management
		hint "get your troops on the ground ASAP";
		sleep 10;
		hint "new PZ being created... check map";
		sleep 5;
		player setVariable ["isBusy", 111]; // now able to take new tasks
		execVM "autoPatrolSystem\deploymentMgr.sqf";

	
//};









