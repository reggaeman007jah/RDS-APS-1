
// RDS PHASE 4 - SUPPORT

// MISSION STATES -------------------------------------------------------------------------------

DEPLOY = true;
LZAPPROACH = false;
sleep 1;

// PZ marker management 
SF_pickup = [dest, 900, 900] call BIS_fnc_findSafePos; 
deleteMarkerlocal "SFPZ";
_PZMarker = createMarkerLocal ["SFPZ", SF_pickup];
_PZMarker setMarkerShapeLocal "ELLIPSE";
_PZMarker setMarkerColorLocal "ColorYELLOW";
_PZMarker setMarkerSizeLocal [80, 80];
_PZMarker setMarkerAlphaLocal 0.7;
// make ^^^ flat!

// trigger to create PZ smoke and create units 
waitUntil 
{
	(player distance SF_pickup) <= 750;
};
_smoke = createVehicle ["G_40mm_smokeGreen", getMarkerPos "SFPZ", [], 0, "none"];
["SMOKE OUT"] execVM "HUD\HUD_messages.sqf";
sleep 3;


// auto-boarding instructions 
waitUntil 
{
	(player distance SF_pickup) <= 250;
};
["LAND ON THE GREEN SMOKE"] execVM "HUD\HUD_landNow.sqf";


// create units
execVM "units\bluRFAT.sqf"; 
// to do .. inform this with number of units to create... [1]


// then get close
waitUntil 
{
	(player distance SF_pickup) <= 80;
};


// then touch down
waitUntil { 
	((RGGATL3) < 3);
};
["TROOPERS ARE BOARDING NOW"] execVM "HUD\HUD_messages.sqf";


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
_PZMarker = createMarkerLocal ["SFLZ", SF_dropOff];
_PZMarker setMarkerShapeLocal "ELLIPSE";
_PZMarker setMarkerColorLocal "ColorRED";
_PZMarker setMarkerSizeLocal [800, 800];
_PZMarker setMarkerAlphaLocal 0.7;
// make ^^^ flat!


// then
waitUntil 
{
	(player distance SF_pickup) <= 800;
};


// logic
sleep 1;
LZAPPROACH = true;


// units auto disembark  
waitUntil 
{
	(player distance SF_dropOff) <= 800;
};

_units = fullCrew vehicle player;
{
	_x orderGetIn false;
} forEach _units;	

{ unassignVehicle _x } forEach crew heli2;
			
["|--- LAND NOW ---|"] execVM "HUD\HUD_landNow.sqf";

waitUntil { 
	((RGGATL3) < 1);
};

sleep 20;

	_units = allUnits inAreaArray "Battlearea";
	{
		_Dir = random 360;
		_Dist = selectRandom [50, 55]; 
		_defend360 = dest getPos [_Dist,_Dir]; 
		_x setUnitPos "AUTO";
		_x doMove _defend360;
	} forEach _units;


sleep 2;

LZAPPROACH = false;
sleep 0.5;
PZAPPROACH = true;


// TO DO REPEAT UNLESS EXTRACT == true

if (!EXTRACT) then {
	execVM "rds\p4_support.sqf";
} else {
	systemChat "SUPPORT UNAVAILABLE";
};



/*
// what next
if ((RGG_BZbluforCount) > 17) then {
	ATTACK = true;
	execVM "rds\p2_attack.sqf";
} else {
	execVM "rds\p1_deploy.sqf";
};




