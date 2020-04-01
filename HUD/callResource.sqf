
disableSerialization;

//1 cutRsc ["iFire", "PLAIN"];
//10 cutRsc ["SPEEDINKMHKNOTTS", "PLAIN"];
//20 cutRsc ["SPEEDINKMHKNOTTSVALUE", "PLAIN"];
//30 cutRsc ["SPEEDINKMH", "PLAIN"];
//40 cutRsc ["SPEEDINKMHVALUE", "PLAIN"];
//100 cutRsc ["LABELHUDBACK", "PLAIN"];
//200 cutRsc ["GoALogo", "PLAIN"];
//300 cutRsc ["iFire", "PLAIN"];
//420 cutRsc ["REVERSEAZIMUTH", "PLAIN"];
//600 cutRsc ["PZDISTANCE", "PLAIN"];
//620 cutRsc ["LZDISTANCE", "PLAIN"];
//700 cutRsc ["ALLUNITS", "PLAIN"];

// speed
50 cutRsc ["SPEEDINKNOTTS", "PLAIN"]; // words
60 cutRsc ["SPEEDINKNOTTSVALUE", "PLAIN"]; // numbers

// height
80 cutRsc ["ALTX2", "PLAIN"]; // words
90 cutRsc ["ALTX2VALUE", "PLAIN"]; // numbers
91 cutRsc ["ASLX2VALUE", "PLAIN"]; // numbers

// heading
400 cutRsc ["AZIMUTH", "PLAIN"]; // words
410 cutRsc ["AZIMUTHVALUE", "PLAIN"]; // numbers
430 cutRsc ["REVERSEAZIMUTHVALUE", "PLAIN"]; // numbers

// PZ heading
500 cutRsc ["PZAZIMUTH", "PLAIN"]; // words
510 cutRsc ["PZAZIMUTHVALUE", "PLAIN"]; // numbers

// LZ heading
520 cutRsc ["LZAZIMUTH", "PLAIN"]; // words
530 cutRsc ["LZAZIMUTHVALUE", "PLAIN"]; // numbers

// PZ distance
610 cutRsc ["PZDISTANCEVALUE", "PLAIN"]; // numbers

// LZ distance
630 cutRsc ["LZDISTANCEVALUE", "PLAIN"]; // numbers

// debug
710 cutRsc ["OBJUNITS", "PLAIN"];

// warning
1000 cutRsc ["PZ_SLOW", "PLAIN"];

// universal destination (toggles between PZ and LZ dynamically - used for VHI visual heading indicator)
//18SEPT TODO MAKE THIS WORK
1100 cutRsc ["UNIDEST", "PLAIN"];

// mission data 
1200 cutRsc ["MISSIONDATA", "PLAIN"];
//18SEPT TODO INVESTIGATE HOW TO MAKE TEXT APPEAR HERE AT DIFF STAGES OF MISSION

// script loading instruction -------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "SPEEDINKNOTTS")};

missionData = "testing testing";


// HUD function ----------------------------------------------------------------------------------------

[] spawn {

	while {true} do 
	{
		// HUD CALCS -------------------------------------------------------------------------------------------
		
		// SPEED 
			// _RGGSspeed = KMPH value
			_RGGSspeed = round speed player;
			// _RGGKnotts2 = Knotts value
			_RGGKnotts = speed player * 0.539957;
			_RGGKnotts2 = round _RGGKnotts;
			
		// HEIGHT 
			// _RGGASL3 = ASL value
			_RGGASL1 = (getPosASL player) select 2;
			_RGGASL2 = _RGGASL1 - 6.19;
			_RGGASL3 = round _RGGASL2;
			// _RGGATL3 = ATL value
			_RGGATL1 = (getPosATL player) select 2;
			_RGGATL2 = _RGGATL1 - 1.19;
			_RGGATL3 = round _RGGATL2;
			
		// HEADING 
			// _heliAz = heli heading
			_heliAzFull = getDir player;
			_heliAz = round _heliAzFull;

		// OPP HEADING 
			// revAZ = this is to determine opposite heading to assist with u-turns
			if ((_heliAz >=0) && (_heliAz <179)) then
			{
				revAZ = _heliAZ + 180;
			} else
			{
				revAZ = _heliAZ - 180;
			};

		// PZ OBJ 
			// _pzHeading = heading towards next PZ
			// if PZ = True then do this, else show nothing
			_pz = getMarkerPos "SFPZ";
			_pzHeadingFull = player getDir _pz;
			_pzHeading = round _pzHeadingFull;

		// LZ OBJ 
			// _lzHeading = heading towards main LZ objective (to deploy troops)
			_lz = getMarkerPos "BattleArea";
			_lzHeadingFull = player getDir _lz;
			_lzHeading = round _lzHeadingFull;

		// DISTANCE to OBJ	
			// _pzDist = distance to pickup zone
			_pzDistFull = player distance _pz;
			_pzDist = round _pzDistFull;
			// _lzDist = distance to main LZ perimiter (edge of large zone currently)
			_lzDistFull = player distance _lz;
			_lzDist = round _lzDistFull;
			_lzDistEdge = _lzDist - 500;

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

		// DIRECTION INDICATOR
			// this will indicate if the pilot should turn right of left to point to PZ OBJ ad show as an arrow
			// basic version will indicate left or right depending on offset
			// if dead on, both will display (+- 1 tolerence)
/*
	_uniHeading (either pz or lz)
	use _pzDist to start with
	_heliAZ = current heading

	if you have a match on the exact match of two headings, you will hardly see a match
	so create a range within which a match can hook
	if _pzDist = 90 degrees, then you'd want 3 degrees variance
*/
	if ((_heliAZ) > (_pzDist +2)) 	then {hint "box Left"};
	if ((_heliAZ) < (_pzDist -2)) 	then {hint "box Right"};
	if ((_heliAZ) == (_pzDist +1)) 	then {hint "box Center"};
	if ((_heliAZ) == (_pzDist -1)) 	then {hint "box Center"};
	if ((_heliAZ) == (_pzDist))		then {hint "box Center"};




		// VSI CALC
			// TBC

		// MISSION DATA
			// INSTEAD OF HINT OS SYSCHAT 
			
			_missionData = missionData;


		// HUD DISPLAYS ----------------------------------------------------------------------------------------------------------------------

		
		// SPEED DISPLAY (WORDS) OF KNOTTS ONLY
		_displayKNOTTS = uiNameSpace getVariable "SPEEDINKNOTTS";
		_setText = _displayKNOTTS displayCtrl 1030;
		_setText ctrlSetStructuredText (parseText format ["VEL"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.3];
		
		
		// SPEED DISPLAY (NUMBERS) OF KNOTTS ONLY
		_displayKNOTTSVALUE = uiNameSpace getVariable "SPEEDINKNOTTSVALUE";
		_setText = _displayKNOTTSVALUE displayCtrl 1031;
		_setText ctrlSetStructuredText (parseText format ["%1", _RGGKnotts2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.3];			
		

		// HEIGHT DISPLAY (WORDS) 
		_displayALTX2 = uiNameSpace getVariable "ALTX2";
		_setText = _displayALTX2 displayCtrl 1100;
		//_setText ctrlSetStructuredText (parseText format ["ATL:<br />ASL:"]);
		_setText ctrlSetStructuredText (parseText format ["ATL"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];	
		

		// HEIGHT DISPLAY (NUMBERS) OF ATL
		_displayALTX2VALUE = uiNameSpace getVariable "ALTX2VALUE";
		_setText = _displayALTX2VALUE displayCtrl 1101;
		_setText ctrlSetStructuredText (parseText format ["%1", _RGGATL3]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// HEIGHT DISPLAY (NUMBERS) OF ASL 
		_displayALTX2VALUE = uiNameSpace getVariable "ASLX2VALUE";
		_setText = _displayALTX2VALUE displayCtrl 1102;
		_setText ctrlSetStructuredText (parseText format ["%1", _RGGASL3]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];	


		// HEADING DISPLAY OF HELI (WORDS)
		_displayAZIMUTH = uiNameSpace getVariable "AZIMUTH";
		_setText = _displayAZIMUTH displayCtrl 2000;
		_setText ctrlSetStructuredText (parseText format ["HD"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];	


		// HEADING DISPLAY OF HELI (NUMBERS) 
		_displayAZIMUTHVALUE = uiNameSpace getVariable "AZIMUTHVALUE";
		_setText = _displayAZIMUTHVALUE displayCtrl 2100;
		_setText ctrlSetStructuredText (parseText format ["%1",_heliAz]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// REVERSE HEADING DISPLAY OF HELI (NUMBERS) 
		_displayAZIMUTHVALUE = uiNameSpace getVariable "REVERSEAZIMUTHVALUE";
		_setText = _displayAZIMUTHVALUE displayCtrl 2300;
		_setText ctrlSetStructuredText (parseText format ["%1", revAZ]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// HEADING DISPLAY OF PZ OBJECTIVE (WORDS)
		_displayPZAZIMUTH = uiNameSpace getVariable "PZAZIMUTH";
		_setText = _displayPZAZIMUTH displayCtrl 3000;
		_setText ctrlSetStructuredText (parseText format ["PICK UP ZONE"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// HEADING DISPALY OF PZ OBJECTIVE (NUMBERS)
		_displayPZAZIMUTHVALUE = uiNameSpace getVariable "PZAZIMUTHVALUE";
		_setText = _displayPZAZIMUTHVALUE displayCtrl 3100;
		_setText ctrlSetStructuredText (parseText format ["%1",_pzHeading]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// HEADING DISPLAY OF LZ OBJECTIVE (WORDS)
		_displayLZAZIMUTH = uiNameSpace getVariable "LZAZIMUTH";
		_setText = _displayLZAZIMUTH displayCtrl 3200;
		_setText ctrlSetStructuredText (parseText format ["MAIN OBJECTIVE"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// HEADING DISPALY OF LZ OBJECTIVE (NUMBERS)
		_displayLZAZIMUTHVALUE = uiNameSpace getVariable "LZAZIMUTHVALUE";
		_setText = _displayLZAZIMUTHVALUE displayCtrl 3300;
		_setText ctrlSetStructuredText (parseText format ["%1",_lzHeading]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// DISTANCE DISPLAY TO PZ OBJECTIVE (NUMBERS)
		_displayPZDISTANCEVALUE = uiNameSpace getVariable "PZDISTANCEVALUE";
		_setText = _displayPZDISTANCEVALUE displayCtrl 4100;
		_setText ctrlSetStructuredText (parseText format ["DIST %1",_pzDist]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// DISTANCE DISPLAY TO LZ OBJECTIVE (NUMBERS)
		_displayLZDISTANCEVALUE = uiNameSpace getVariable "LZDISTANCEVALUE";
		_setText = _displayLZDISTANCEVALUE displayCtrl 4300;
		_setText ctrlSetStructuredText (parseText format ["%1",_lzDistEdge]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// TOTAL UNIT COUNT IN OBJECTIVE AREA (NUMBERS AND WORDS)
		_displayOBJUNITS = uiNameSpace getVariable "OBJUNITS";
		_setText = _displayOBJUNITS displayCtrl 7100;
		_setText ctrlSetStructuredText (parseText format ["ALL UNITS IN OBJ  <br />TOTAL %1  <br />BLUFOR IN OBJ %2  <br />OPFOR IN OBJ %3  <br />..<br />TOTAL IN GAME %4  <br />TOTAL BLUFOR %5  <br />TOTAL OPFOR %6",_allUnitsObj, _allBluUnitsObj, _allOpUnitsObj, _allUnitsBZ, _allBluUnitsObj, _allOpUnitsObj]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// PZ_SLOW - dynamic distance alert on approach to PZ
		if (PZAPPROACH) then 
		{
			if ((_pzDist) <700) then 
			{
				_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
				_setText = _displayOBJUNITS displayCtrl 10000;
				_setText ctrlSetStructuredText (parseText format ["DIST<br />%1", _pzDist]);
				_setText ctrlSetBackgroundColor [0,0,0,0.5];
			};
			if ((_pzDist) <100) then 
			{
				_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
				_setText = _displayOBJUNITS displayCtrl 10000;
				_setText ctrlSetStructuredText (parseText format [""]);
				_setText ctrlSetBackgroundColor [0,0,0,0];
			};		
		};

		if (!PZAPPROACH) then 
		{
			_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
			_setText = _displayOBJUNITS displayCtrl 10000;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0];
		};


// 17SEPT CHECK CAN I CHANGE XY IN HERE? OR COLOUR?

		// UNIDEST test -- show/toggle PZ and LZ dest in one place
		if (PZAPPROACH) then 
		{
			_displayUNIDEST = uiNameSpace getVariable "UNIDEST";
			_setText = _displayUNIDEST displayCtrl 11000;
			_setText ctrlSetStructuredText (parseText format ["DIST<br />%1", _pzDist]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};

		if (!PZAPPROACH) then 
		{
			_displayOBJUNITS = uiNameSpace getVariable "UNIDEST";
			_setText = _displayOBJUNITS displayCtrl 11000;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0];
		};

		if (LZAPPROACH) then 
		{
			_displayUNIDEST = uiNameSpace getVariable "UNIDEST";
			_setText = _displayUNIDEST displayCtrl 11000;
			_setText ctrlSetStructuredText (parseText format ["DIST<br />%1", _lzDistEdge]);
			_setText ctrlSetBackgroundColor [0,0,0,0.5];
		};

		if (!LZAPPROACH) then 
		{
			_displayOBJUNITS = uiNameSpace getVariable "UNIDEST";
			_setText = _displayOBJUNITS displayCtrl 11000;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0];
		};

// THIS ^^ MIGHT WORK, BUT I STILL SHOULD HAVE ONE VAR FOR THIS, AND CHANGE THE VALUE SOMEWHERE ELSE 
// THIS IS DOUBLEWORK

		// MISSION DATA (WORDS)
		_displayOBJUNITS = uiNameSpace getVariable "MISSIONDATA";
		_setText = _displayOBJUNITS displayCtrl 21000;
		_setText ctrlSetStructuredText (parseText format ["%1",_missionData]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];














/*
		// dynamic speed alert on approach to PZ
		if (PZAPPROACH) then 
		{
			if ((_pzDist) <700) then 
			{
				if ((_RGGKnotts2) >60) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
					_setText = _displayOBJUNITS displayCtrl 10000;
					_setText ctrlSetStructuredText (parseText format ["TOO HOT target 60<br />%1", _RGGKnotts2]);
					_setText ctrlSetBackgroundColor [0,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
					_setText = _displayOBJUNITS displayCtrl 10000;
					_setText ctrlSetStructuredText (parseText format ["OK<br />%1", _RGGKnotts2]);
					_setText ctrlSetBackgroundColor [0,0,0,0.5];
				};
			};
			
			if ((_pzDist) <300) then 
			{
				if ((_RGGKnotts2) >50) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
					_setText = _displayOBJUNITS displayCtrl 10000;
					_setText ctrlSetStructuredText (parseText format ["TOO HOT - REDUCE SPEED TO BELOW 60<br />%1", _RGGKnotts2]);
					_setText ctrlSetBackgroundColor [0,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
					_setText = _displayOBJUNITS displayCtrl 10000;
					_setText ctrlSetStructuredText (parseText format ["OK<br />%1", _RGGKnotts2]);
					_setText ctrlSetBackgroundColor [0,0,0,0.5];
				};
			};
			
		};

		if (!PZAPPROACH) then 
		{
			_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
			_setText = _displayOBJUNITS displayCtrl 10000;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0];
		};
*/
/*
		// dynamic speed alert on approach to LZ
		if (LZAPPROACH) then 
		{
			if ((_lzDistEdge) <700) then 
			{
				if ((_RGGKnotts2) >60) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
					_setText = _displayOBJUNITS displayCtrl 10000;
					_setText ctrlSetStructuredText (parseText format ["TOO HOT - REDUCE SPEED TO BELOW 60<br />%1", _RGGKnotts2]);
					_setText ctrlSetBackgroundColor [0,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
					_setText = _displayOBJUNITS displayCtrl 10000;
					_setText ctrlSetStructuredText (parseText format ["OK<br />%1", _RGGKnotts2]);
					_setText ctrlSetBackgroundColor [0,0,0,0.5];
				};
			};

			if ((_lzDistEdge) <300) then 
			{
				if ((_RGGKnotts2) >30) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
					_setText = _displayOBJUNITS displayCtrl 10000;
					_setText ctrlSetStructuredText (parseText format ["TOO HOT - REDUCE SPEED TO BELOW 60<br />%1", _RGGKnotts2]);
					_setText ctrlSetBackgroundColor [0,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
					_setText = _displayOBJUNITS displayCtrl 10000;
					_setText ctrlSetStructuredText (parseText format ["OK<br />%1", _RGGKnotts2]);
					_setText ctrlSetBackgroundColor [0,0,0,0.5];
				};
			};
		};

		if (!LZAPPROACH) then 
		{
			_displayOBJUNITS = uiNameSpace getVariable "PZ_SLOW";
			_setText = _displayOBJUNITS displayCtrl 10000;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0];
		};

*/




		sleep 0.1;			
	};
};
				
				

			
/*
//sleep 5;
//	1 cutRsc ["default","PLAIN"];
// where did I see that video showing pictures being shown, not dialogs? This can be used to define a nice HUD outline.
// CREATE A SWITCH TO ENABLE USER TO SELECT BG COLOURS, TO REPLACE THE CTRLSETBGCOL ...
//use switch here, so any of the three speed choices always show in the same place
*/



/*
//shows a range of test values
_display = uiNameSpace getVariable "H8erHUD";
	_setText = _display displayCtrl 1001;
	_setText ctrlSetStructuredText (parseText format ["KMPH: %1 <br />Knotts: %2<br />ASL: %3<br />ATL: %4",_RGGSspeed,_RGGKnotts2,_RGGASL3,_RGGATL3]);
	_setText ctrlSetBackgroundColor [0,1,1,0.5];

*/




// UNUSED CODE - MAY BE USEFUL..?


		// HUD DISPLAY ?
		//_displayIMAGE = uiNameSpace getVariable "GoALogo";
		//_setText = _displayIMAGE displayCtrl 9999;


		// iFire DISPLAY ?
		//_displayIMAGE = uiNameSpace getVariable "iFire";
		

		// SPEED DISPLAY ?
		//_displayLABELHUDBACK = uiNameSpace getVariable "LABELHUDBACK";
		//_setText = _displayLABELHUDBACK displayCtrl 900;
		//_setText ctrlSetBackgroundColor [0,0,0,0.5];	
	
/*
		// SPEED DISPLAY (WORDS) OF __BOTH__ ASL AND ATL
		_displayKMHKNOTTS = uiNameSpace getVariable "SPEEDINKMHKNOTTS";
		_setText = _displayKMHKNOTTS displayCtrl 1010;
		_setText ctrlSetStructuredText (parseText format ["KMPH:<br />Knotts:"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];	
	

		// SPEED DISPLAY (NUMBERS) OF __BOTH__ ASL AND ATL
		_displayKMHKNOTTSVALUE = uiNameSpace getVariable "SPEEDINKMHKNOTTSVALUE";
		_setText = _displayKMHKNOTTSVALUE displayCtrl 1011;
		_setText ctrlSetStructuredText (parseText format ["%1<br />%2",_RGGSspeed,_RGGKnotts2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
*/

		// ?		
		//_displayIMAGE = uiNameSpace getVariable "GoALogo";
		//	_setText = _displayIMAGE displayCtrl 9999;
		//		//_setText ctrlSetStructuredText (parseText format ["KMPH:"]);
		//		//_setText ctrlSetBackgroundColor [0,0,0,0.4];			
			
				
				
		/*	
		// SPEED DISPLAY (WORDS) OF KPH ONLY
		_displayKMH = uiNameSpace getVariable "SPEEDINKMH";
		_setText = _displayKMH displayCtrl 1020;
		_setText ctrlSetStructuredText (parseText format ["KMPH:"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.4];
		*/


		/*
		// SPEED DISPLAY (NUMBERS) OF KPH ONLY
		_displayKMHVALUE = uiNameSpace getVariable "SPEEDINKMHVALUE";
		_setText = _displayKMHVALUE displayCtrl 1021;
		_setText ctrlSetStructuredText (parseText format ["%1",_RGGSspeed]);
		_setText ctrlSetBackgroundColor [0,0,0,0.4];
		*/


/*
		// REVERSE HEADING DISPLAY OF HELI (WORDS)
		_displayAZIMUTH = uiNameSpace getVariable "REVERSEAZIMUTH";
		_setText = _displayAZIMUTH displayCtrl 2200;
		_setText ctrlSetStructuredText (parseText format ["REVERSE HEADING"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];	
*/


/*
		// DISTANCE DISPLAY TO PZ OBJECTIVE (WORDS)
		_displayPZDISTANCE = uiNameSpace getVariable "PZDISTANCE";
		_setText = _displayPZDISTANCE displayCtrl 4000;
		_setText ctrlSetStructuredText (parseText format ["DISTANCE TO PZ"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
*/


/*		// DISTANCE DISPLAY TO LZ OBJECTIVE (WORDS)
		_displayLZDISTANCE = uiNameSpace getVariable "LZDISTANCE";
		_setText = _displayLZDISTANCE displayCtrl 4200;
		_setText ctrlSetStructuredText (parseText format ["DISTANCE TO LZ EDGE"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
*/


/*
		// TOTAL UNIT COUNT IN GAME (NUMBERS AND WORDS)
		_displayALLUNITS = uiNameSpace getVariable "ALLUNITS";
		_setText = _displayALLUNITS displayCtrl 7000;
		_setText ctrlSetStructuredText (parseText format ["ALL UNITS IN GAME<br />TOTAL %1<br /> BLUFOR %2<br /> OPFOR %3",_allUnitsBZ, _allBluforBZ, _allOpforBZ]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];
*/