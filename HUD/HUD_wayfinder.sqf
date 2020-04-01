
disableSerialization;

// ----- HUD_wayfinder

// Dynamic flight data relative to your mission

// PZ heading
300 cutRsc ["PZAZIMUTH", "PLAIN"]; // words
310 cutRsc ["PZAZIMUTHVALUE", "PLAIN"]; // numbers

// LZ heading
320 cutRsc ["LZAZIMUTH", "PLAIN"]; // words
330 cutRsc ["LZAZIMUTHVALUE", "PLAIN"]; // numbers

// PZ distance
340 cutRsc ["PZDISTANCEVALUE", "PLAIN"]; // numbers

// LZ distance
350 cutRsc ["LZDISTANCEVALUE", "PLAIN"]; // numbers

// UNIDIST auto-toggle between PZ and LZ heading based on bool state
360 cutRsc ["UNIDISTPZ", "PLAIN"]; // numbers
361 cutRsc ["UNIDISTLZ", "PLAIN"]; // numbers

// 10GRID dynamic 10 digit grid location for current destination
370 cutRsc ["PZ10GRID", "PLAIN"]; // numbers
371 cutRsc ["LZ10GRID", "PLAIN"]; // numbers


// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "PZAZIMUTH")};


// HUD function ---------------------------------------------------------------------------------

[] spawn {

	while {true} do 
	{
		// ----- HUD CALCS 

		// PZ OBJ 
		// _pzHeading = heading towards next PZ
		// if PZ = True then do this, else show nothing
		_pz = getMarkerPos "SFPZ";
		_pzHeadingFull = player getDir _pz;
		_pzHeading = round _pzHeadingFull;

		// LZ OBJ 
		//_lzHeading = heading towards main LZ objective (to deploy troops)
		_lz = getMarkerPos "SFLZ";
		_lzHeadingFull = player getDir _lz;
		_lzHeading = round _lzHeadingFull;

		// DISTANCE to OBJ	
		// _pzDist = distance to pickup zone
		_pzDistFull = player distance _pz;
		_pzDist = round _pzDistFull;
		// REFACTOR BY REPLACING ALL LOCALS WITH GLOBAL, BUT FOR NOW...
		pzDist = _pzDist;
		// _lzDist = distance to main LZ perimiter (edge of large zone currently)
		_lzDistFull = player distance _lz;
		_lzDist = round _lzDistFull;
		_lzDistEdge = _lzDist - 40;
		// REFACTOR BY REPLACING ALL LOCALS WITH GLOBAL, BUT FOR NOW...
		lzDist = _lzDist;


		// ----- HUD DISPLAYS 
	
		// HEADING DISPLAY OF PZ OBJECTIVE (WORDS)
		_displayPZAZIMUTH = uiNameSpace getVariable "PZAZIMUTH";
		_setText = _displayPZAZIMUTH displayCtrl 999300;
		_setText ctrlSetStructuredText (parseText format ["PICK UP ZONE"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// HEADING DISPALY OF PZ OBJECTIVE (NUMBERS)
		_displayPZAZIMUTHVALUE = uiNameSpace getVariable "PZAZIMUTHVALUE";
		_setText = _displayPZAZIMUTHVALUE displayCtrl 999310;
		_setText ctrlSetStructuredText (parseText format ["%1",_pzHeading]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// HEADING DISPLAY OF LZ OBJECTIVE (WORDS)
		_displayLZAZIMUTH = uiNameSpace getVariable "LZAZIMUTH";
		_setText = _displayLZAZIMUTH displayCtrl 999320;
		_setText ctrlSetStructuredText (parseText format ["MAIN OBJECTIVE"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// HEADING DISPALY OF LZ OBJECTIVE (NUMBERS)
		_displayLZAZIMUTHVALUE = uiNameSpace getVariable "LZAZIMUTHVALUE";
		_setText = _displayLZAZIMUTHVALUE displayCtrl 999330;
		_setText ctrlSetStructuredText (parseText format ["%1",_lzHeading]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// DISTANCE DISPLAY TO PZ OBJECTIVE (NUMBERS)
		_displayPZDISTANCEVALUE = uiNameSpace getVariable "PZDISTANCEVALUE";
		_setText = _displayPZDISTANCEVALUE displayCtrl 999340;
		_setText ctrlSetStructuredText (parseText format ["%1",_pzDist]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// DISTANCE DISPLAY TO LZ OBJECTIVE (NUMBERS)
		_displayLZDISTANCEVALUE = uiNameSpace getVariable "LZDISTANCEVALUE";
		_setText = _displayLZDISTANCEVALUE displayCtrl 999350;
		_setText ctrlSetStructuredText (parseText format ["%1",_lzDistEdge]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// UNIDEST ----- show/toggle PZ and LZ info in display

		if (PZAPPROACH) then // DISTANCE TO PZ
		{
			_displayUNIDEST = uiNameSpace getVariable "UNIDISTPZ";
			_setText = _displayUNIDEST displayCtrl 999360;
			_setText ctrlSetStructuredText (parseText format ["DST<br />%1", _pzDist]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};

		if (PZAPPROACH) then // PZ 10 DIGIT LOCATION
		{
			_displayUNIDEST = uiNameSpace getVariable "PZ10GRID";
			_setText = _displayUNIDEST displayCtrl 999370;
			_setText ctrlSetStructuredText (parseText format ["PZ %1", _pz]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};

		if (!PZAPPROACH) then // REMOVE DISTANCE TO PZ 
		{
			_displayOBJUNITS = uiNameSpace getVariable "UNIDISTPZ";
			_setText = _displayOBJUNITS displayCtrl 999360;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0];
		};

		if (!PZAPPROACH) then // REMOVE 10 DIGIT PZ LOCATION
		{
			_displayUNIDEST = uiNameSpace getVariable "PZ10GRID";
			_setText = _displayUNIDEST displayCtrl 999370;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};

		if (LZAPPROACH) then // LZ 10 DIGIT LOCATION
		{
			_displayUNIDEST = uiNameSpace getVariable "UNIDISTLZ";
			_setText = _displayUNIDEST displayCtrl 999361;
			_setText ctrlSetStructuredText (parseText format ["DST<br />%1", _lzDistEdge]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};

		if (LZAPPROACH) then // LZ 10 DIGIT LOCATION
		{
			_displayUNIDEST = uiNameSpace getVariable "LZ10GRID";
			_setText = _displayUNIDEST displayCtrl 999371;
			_setText ctrlSetStructuredText (parseText format ["LZ %1", _pz]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};

		if (!LZAPPROACH) then // REMOVE DISTANCE TO LZ 
		{
			_displayOBJUNITS = uiNameSpace getVariable "UNIDISTLZ";
			_setText = _displayOBJUNITS displayCtrl 999361;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0];
		};
			
		if (!LZAPPROACH) then // REMOVE 10 DIGIT LZ LOCATION
		{
			_displayUNIDEST = uiNameSpace getVariable "LZ10GRID";
			_setText = _displayUNIDEST displayCtrl 999371;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};

		sleep 0.5;
	};
};


