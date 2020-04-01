
waitUntil {
	((RGGATL3) < 1)
};

extractLocation = position player;
_extractMarker = createMarkerLocal ["extract", extractLocation];
_extractMarker setMarkerShapeLocal "ELLIPSE";
_extractMarker setMarkerColorLocal "ColorGreen";
_extractMarker setMarkerSizeLocal [50, 50];

		_units = fullCrew vehicle player;
		{
			_x orderGetIn false;
		} forEach _units;	

		{ unassignVehicle _x } forEach crew heli2;

GETOUT = true;

while {GETOUT} do {

	_extractMarker setMarkerAlphaLocal 0.8;
	sleep 2;
	_extractMarker setMarkerAlphaLocal 0.6;
	sleep 0.1;
	_extractMarker setMarkerAlphaLocal 0.4;
	sleep 0.1;
	_extractMarker setMarkerAlphaLocal 0.6;
	sleep 0.1;

	if ((RGGATL3) > 3) then {
		deleteMarkerLocal "extract";
		GETOUT = false;

		if ((RGG_BZbluforCount) > 1) then {
			execVM "rds\p5_extract.sqf";
		} else {
			hint "WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN WIN";
		};
		execVM "RDS\p5_extract.sqf";
	};

};






