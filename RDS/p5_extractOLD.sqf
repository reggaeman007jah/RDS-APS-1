

//SF_pickup = RGG_basePos; 

// trigger to create PZ smoke and create units 
waitUntil 
{
	(player distance dest) <= 750;
};
_smoke = createVehicle ["G_40mm_smokeRed", dest, [], 0, "none"];
["EXTRACT ON RED SMOKE"] execVM "HUD\HUD_messages.sqf";
sleep 3;




waitUntil { 
	((RGGATL3) < 1);
};

// PZ marker management 
extractLocation = position player;

_extractMarker = createMarkerLocal ["extract", extractLocation];
_extractMarker setMarkerShapeLocal "ELLIPSE";
_extractMarker setMarkerColorLocal "ColorRed";
_extractMarker setMarkerSizeLocal [50, 50];
_extractMarker setMarkerAlphaLocal 0.7;
// make ^^^ flat?

// auto-boarding message 
["UNITS BOARDING"] execVM "HUD\HUD_landNow.sqf";

// units get in
_units = allUnits inAreaArray "SFPZ";
{
	_x assignAsCargo heli2;
	sleep 0.2;
} forEach _units;	
_units orderGetIn true;
sleep 1;

waitUntil { 
	((RGGATL3) > 10);
};

deleteMarkerlocal "extract";




// units auto disembark  
waitUntil 
{
	(player distance RGG_basePos) <= 80;
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


// what next...?
if ((RGG_BZbluforCount) > 1) then {
	execVM "rds\p5_extract.sqf";
} else {
	hint "WIN WIN WIN";
};























// RDS PHASE 5 - EXTRACT

// to do !!!

//numberofgroups = floor RGG_objBluCount / 5;

/*
//while {EXTRACT} do {

	_exfil = RGG_objBluUnits;
	_exfilGroups = exfil / 5; // round up??
	hint "groups to exfil:";
	sleep 5;
	hint str _exfilGroups; 

	_units = allUnits inAreaArray "Battlearea";
	{
		_Dir = random 360;
		_Dist = 20; 
		_defend360 = dest getPos [_Dist,_Dir]; 
		_x setUnitPos "MIDDLE";
		_x doMove _defend360;
	} forEach _units;





//	sleep 1;
//};


/*
count all blufor units
group them into groups of 5
count groups of 5
create PZs == number of groups
move units to PZ locations, as per their group
from PZ point, create lines.
ie have a nice neat system

alt
create just one PZ, but still use sub locations for group move orders

or, when land, loop from 1 to 5 units in LZ area.. easier..

