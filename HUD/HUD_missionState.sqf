
// DISPLAYS MISSION STATE INFO 

// MISSION STATE
910 cutRsc ["MISSIONSTATE", "PLAIN"];

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "MISSIONSTATE")};

// HUD CONTENT ----------------------------------------------------------------------------------
_missionState = (_this select 0); // dynamic message

// MISSION MESSAGE (WORDS)
_displayOBJUNITS = uiNameSpace getVariable "MISSIONSTATE";
_setText = _displayOBJUNITS displayCtrl 999910;
_setText ctrlSetStructuredText (parseText format ["%1", _missionState]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

