
// RDS PHASE 3 - DEFEND

// during this phase the player needs to transport AT specialists into the AO (from med base) ...
// to support defence against armoured attackes - this is a single task
// consider doing 4 separate drops at locations chosen by the player

execVM "RDS\stateManager.sqf";
// PZ marker management 
SF_pickup = RGG_basePos; 
deleteMarkerlocal "SFPZ";
_PZMarker = createMarkerLocal ["SFPZ", SF_pickup];
_PZMarker setMarkerShapeLocal "ELLIPSE";
_PZMarker setMarkerColorLocal "ColorYELLOW";
_PZMarker setMarkerSizeLocal [80, 80];
_PZMarker setMarkerAlphaLocal 0.7;

waitUntil 
{
	(player distance SF_pickup) <= 1000;
};

_smoke = createVehicle ["G_40mm_smokeRed", getMarkerPos "SFPZ", [], 0, "none"];
["SMOKE OUT"] execVM "HUD\HUD_messages.sqf";
sleep 3;


// auto-boarding instructions 
waitUntil 
{
	(player distance SF_pickup) <= 250;
};
["LAND ON THE RED SMOKE"] execVM "HUD\HUD_landNow.sqf";


// create units
execVM "units\bluRFAT.sqf"; 
systemChat "create ..";
systemChat "..";
systemChat ".";


// then get close
waitUntil 
{
	(player distance SF_pickup) <= 80;
};


// then touch down
waitUntil { 
	((RGGATL3) < 3);
};
["TROOPERS ARE BOARDING NOW - DEPLOY AT MAIN OBJECTIVE"] execVM "HUD\HUD_messages.sqf";


// logic
PZAPPROACH = FALSE;


// units get in
_units = allUnits inAreaArray "SFPZ";
{
	_x assignAsCargo heli2;
	sleep 0.2;
} forEach _units;	
_units orderGetIn true;
sleep 1;


// LZ creation
SF_dropOff = [dest, 01, 02] call BIS_fnc_findSafePos; 
deleteMarkerlocal "SFLZ";
_PZMarker = createMarkerLocal ["SFLZ", dest];
_PZMarker setMarkerShapeLocal "ELLIPSE";
_PZMarker setMarkerColorLocal "ColorRED";
_PZMarker setMarkerSizeLocal [150, 150];
_PZMarker setMarkerAlphaLocal 0.7;
// make ^^^ flat!


// then
waitUntil 
{
	(player distance SF_pickup) <= 80;
};


// logic
sleep 1;
LZAPPROACH = true;


// units auto disembark  
waitUntil 
{
	(player distance SF_dropOff) <= 80;
};

_units = fullCrew vehicle player;
{
	_x orderGetIn false;
} forEach _units;	

{ unassignVehicle _x } forEach crew heli2;
			
["|--- LAND NOW ---|"] execVM "HUD\HUD_landNow.sqf";

waitUntil { 
	((RGGATL3) < 3);
};

sleep 2;

LZAPPROACH = false;
sleep 0.5;
PZAPPROACH = true;


["NOW AT SPECS ARE IN POSITION, PICK UP MORE TROOPS AS REQUIRED"] execVM "HUD\HUD_messages.sqf";

sleep 25;

DEFEND = false;
SUPPORT = true;
execVM "units\opfor_RF_Spawner.sqf";
sleep 01;
execVM "RDS\stateManager.sqf";
sleep 01;
execVM "RDS\P4_support.sqf";

sleep 20;

waitUntil 
{
	(RGG_objOpCount) <= 2;
};

["FIRST WAVE COMPLETE, PREPARE FOR SECOND WAVE"] execVM "HUD\HUD_messages.sqf";

sleep 25;

execVM "units\opfor_RF_Spawner.sqf";
sleep 5;
execVM "units\opfor_RF_Spawner.sqf";
sleep 20;

waitUntil 
{
	(RGG_objOpCount) <= 2;
};

["SECOND WAVE COMPLETE, PREPARE FOR THIRD WAVE"] execVM "HUD\HUD_messages.sqf";
sleep 25;

execVM "units\opfor_RF_Spawner.sqf";
sleep 5;
execVM "units\opfor_RF_Spawner.sqf";
sleep 5;
execVM "units\opfor_RF_Spawner.sqf";
sleep 20;

waitUntil 
{
	(RGG_objOpCount) <= 2;
};

["THIRD WAVE DESTROYED - WELL DONE - TIME TO EXTRACT"] execVM "HUD\HUD_messages.sqf";
sleep 25;
HINT "WELL DONE - MISSION COMPLETE NOW GTFO";

SUPPORT = false;
EXTRACT = true;
execVM "RDS\stateManager.sqf";
execVM "RDS\p5_extract.sqf";


