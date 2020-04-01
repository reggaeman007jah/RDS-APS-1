
disableSerialization;

// HUD_INTEL
// Dynamic mssion data

// MISSION INTEL 
500 cutRsc ["MISSIONDATA", "PLAIN"];
510 cutRsc ["BLUDATA", "PLAIN"];
520 cutRsc ["OPDATA", "PLAIN"];


// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "MISSIONDATA")};


// HUD function ---------------------------------------------------------------------------------

[] spawn {

	while {true} do 
	{
		// HUD CALCS ----------------------------------------------------------------------------

		// UNIT COUNTS
			// total count in game 
			_allUnitsBZ = RGG_BZunitCount;
			// total blufor in game
			_allBluforBZ = RGG_BZbluforCount;
			// total opfor in game
			_allOpforBZ = RGG_BZopforCount;
			// total count in objective zone
			_allUnitsObj = RGG_objBluUnits;
			// total count in objective zone 
			_allBluUnitsObj = RGG_objBluCount;
			// total count in objective zone
			_allOpUnitsObj = RGG_objOpCount;


		// HUD DISPLAYS -------------------------------------------------------------------------

		// TOTAL UNIT COUNT IN OBJECTIVE AREA (NUMBERS AND WORDS)
		_displayOBJUNITS = uiNameSpace getVariable "MISSIONDATA";
		_setText = _displayOBJUNITS displayCtrl 999500;
		_setText ctrlSetStructuredText (parseText format ["ALL UNITS IN OBJ  <br />TOTAL %1  <br />BLUFOR IN OBJ %2  <br />OPFOR IN OBJ %3  <br />..<br />TOTAL IN GAME %4  <br />TOTAL BLUFOR %5  <br />TOTAL OPFOR %6",_allUnitsObj, _allBluUnitsObj, _allOpUnitsObj, _allUnitsBZ, _allBluUnitsObj, _allOpUnitsObj]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// TOTAL BLUFOR UNIT COUNT IN GAME (NUMBERS AND WORDS)
		_displayOBJUNITS = uiNameSpace getVariable "BLUDATA";
		_setText = _displayOBJUNITS displayCtrl 999510;
		_setText ctrlSetStructuredText (parseText format ["BLUFOR ASSETS<br /> TOTAL UNITS IN COMBAT ZONE %1<br />  TOTAL UNITS IN MAIN AO %2<br />", _allBluUnitsObj, _allBluforBZ]); 
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// TOTAL OPFOR UNIT COUNT IN GAME (NUMBERS AND WORDS)
		_displayOBJUNITS = uiNameSpace getVariable "OPDATA";
		_setText = _displayOBJUNITS displayCtrl 999520;
		_setText ctrlSetStructuredText (parseText format ["OPFOR ASSETS<br /> TOTAL UNITS IN COMBAT ZONE%1<br />  TOTAL UNITS IN MAIN AO %2<br />", _allOpUnitsObj, _allOpforBZ]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];

		sleep 1;
	};
};
