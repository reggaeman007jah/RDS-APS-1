
disableSerialization;

// HUD_MEDEVAC

// MISSION INTEL 
911 cutRsc ["MEDEVAC", "PLAIN"];

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "MEDEVAC")};

// INJURED COUNTS
[] spawn {

	while {true} do 
	{
		// count everything - CORE (main blue centre circle) ------------------------------------
		RGG_injuredUnits = allUnits inAreaArray "Core";
		RGG_injuredCount = count RGG_injuredUnits;

		// TOTAL INJURED UNIT COUNT IN CORE (NUMBERS AND WORDS)
		_displayINJUNITS = uiNameSpace getVariable "MEDEVAC";
		_setText = _displayINJUNITS displayCtrl 999911;
		_setText ctrlSetStructuredText (parseText format ["MEDEVAC: %1<br />",RGG_injuredCount]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];

		sleep 5;
	};

};
