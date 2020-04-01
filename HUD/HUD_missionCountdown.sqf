
disableSerialization;

// HUD_MISSIONCOUNTER

// MISSION INTEL 
123 cutRsc ["COUNTER", "PLAIN"];

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "COUNTER")};

// MISSION COUNT DOWN SYSTEM

[] spawn {

	while {DEFEND} do 
	{
		// counter ------------------------------------------------------------------------------
		RGG_missionTime = 

		// TOTAL INJURED UNIT COUNT IN CORE (NUMBERS AND WORDS)
		_displayCOUNTER = uiNameSpace getVariable "COUNTER";
		_setText = _displayCOUNTER displayCtrl 999321;
		_setText ctrlSetStructuredText (parseText format ["MISSION TIME: %1<br />",RGG_missionTime]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];

		sleep 5;
	};
};
