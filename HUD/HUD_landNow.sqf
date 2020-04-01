
disableSerialization;

// HUD_updates
// Dynamic mssion messages

// MISSION INTEL 
1400 cutRsc ["LANDMESSAGE", "PLAIN"];

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "LANDMESSAGE")};


// HUD function ---------------------------------------------------------------------------------

_HUDmessage = (_this select 0); // dynamic message


// MISSION MESSAGE (WORDS)
// WHILE PLAYER IS IN LZ SHOW THIS?
// FOR NOW, JUST A ONCE TRIGGER ONLY MESSAGE .. 
// IN FUTURE MAKE THIS RELATIVE TO WHETHER IN OR OUT OF PZ/LZ ZONE

// MISSION MESSAGE (WORDS)

	for "_i" from 1 to 6 do 
	{						
		_displayOBJUNITS = uiNameSpace getVariable "LANDMESSAGE";
		_setText = _displayOBJUNITS displayCtrl 999950;
		_setText ctrlSetStructuredText (parseText format ["%1", _HUDmessage]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];

		sleep 1;

		_displayOBJUNITS = uiNameSpace getVariable "LANDMESSAGE";
		_setText = _displayOBJUNITS displayCtrl 999950;
		_setText ctrlSetStructuredText (parseText format [""]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];

		sleep 1;
	}; 

// MISSION MESSAGE (EMPTY)
_displayOBJUNITS = uiNameSpace getVariable "LANDMESSAGE";
_setText = _displayOBJUNITS displayCtrl 999950;
_setText ctrlSetStructuredText (parseText format [""]);
_setText ctrlSetBackgroundColor [0,0,0,0];








