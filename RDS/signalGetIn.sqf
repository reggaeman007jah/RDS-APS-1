
sleep 5;
waitUntil {
	((RGGATL3) < 1)
};

extractLocation = position player;
_extractMarker = createMarkerLocal ["extract", extractLocation];
_extractMarker setMarkerShapeLocal "ELLIPSE";
_extractMarker setMarkerColorLocal "ColorBlue";
_extractMarker setMarkerSizeLocal [100, 100];

		_units = allUnits inAreaArray "extract";
		{
			_x assignAsCargo heli2;
			sleep 0.2;
		} forEach _units;	
		_units orderGetIn true;

GETIN = true;

while {GETIN} do {

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
		GETIN = false;
		execVM "RDS\signalGetOut.sqf";
	};

};

