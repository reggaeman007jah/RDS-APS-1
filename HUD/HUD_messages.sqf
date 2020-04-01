
disableSerialization;

// HUD_updates
// Dynamic mssion messages

// MISSION INTEL 
900 cutRsc ["MISSIONMESSAGE", "PLAIN"];

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "MISSIONMESSAGE")};


// HUD function ---------------------------------------------------------------------------------

_HUDmessage = (_this select 0); // dynamic message


// MISSION MESSAGE (WORDS)


// MISSION MESSAGE (WORDS)
// TO DO - MAKE A X4 FORLOOP

_displayOBJUNITS = uiNameSpace getVariable "MISSIONMESSAGE";
_setText = _displayOBJUNITS displayCtrl 999900;
_setText ctrlSetStructuredText (parseText format ["%1", _HUDmessage]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 1;

_displayOBJUNITS = uiNameSpace getVariable "MISSIONMESSAGE";
_setText = _displayOBJUNITS displayCtrl 999900;
_setText ctrlSetStructuredText (parseText format [""]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 1;

_displayOBJUNITS = uiNameSpace getVariable "MISSIONMESSAGE";
_setText = _displayOBJUNITS displayCtrl 999900;
_setText ctrlSetStructuredText (parseText format ["%1", _HUDmessage]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 1;

_displayOBJUNITS = uiNameSpace getVariable "MISSIONMESSAGE";
_setText = _displayOBJUNITS displayCtrl 999900;
_setText ctrlSetStructuredText (parseText format [""]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 1;

_displayOBJUNITS = uiNameSpace getVariable "MISSIONMESSAGE";
_setText = _displayOBJUNITS displayCtrl 999900;
_setText ctrlSetStructuredText (parseText format ["%1", _HUDmessage]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 1;

_displayOBJUNITS = uiNameSpace getVariable "MISSIONMESSAGE";
_setText = _displayOBJUNITS displayCtrl 999900;
_setText ctrlSetStructuredText (parseText format [""]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];

sleep 1;

_displayOBJUNITS = uiNameSpace getVariable "MISSIONMESSAGE";
_setText = _displayOBJUNITS displayCtrl 999900;
_setText ctrlSetStructuredText (parseText format ["%1", _HUDmessage]);
_setText ctrlSetBackgroundColor [0,0,0,0.5];
sleep 16;

// MISSION MESSAGE (EMPTY)
_displayOBJUNITS = uiNameSpace getVariable "MISSIONMESSAGE";
_setText = _displayOBJUNITS displayCtrl 999900;
_setText ctrlSetStructuredText (parseText format [""]);
_setText ctrlSetBackgroundColor [0,0,0,0];







