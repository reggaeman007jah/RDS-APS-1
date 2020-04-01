
// HUD_MISSIONTIME

// MISSION INTEL 
123 cutRsc ["MISSIONTIME", "PLAIN"];

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "MISSIONTIME")};

// CLOCK
[] spawn {

	while {TRUE} do 
	{
		// counters -----------------------------------------------------------------------------
		_getTime = date;
		_hour = _getTime select 3;
		_min = _getTime select 4;

		// misison time (NUMBERS AND WORDS) -----------------------------------------------------
		_displayCOUNTER = uiNameSpace getVariable "MISSIONTIME";
		_setText = _displayCOUNTER displayCtrl 999123;
		_setText ctrlSetStructuredText (parseText format ["MISSION TIME: %1:%2",_hour, _min]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];

		sleep 1;
	};
};

// TO DO - ADD ZEROS AT RELEVANT TIMES 