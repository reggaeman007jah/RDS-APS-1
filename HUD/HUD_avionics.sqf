
disableSerialization;

// HUD_avionics
// Basic HUD elements: speed in knotts, height in ATL and ASL, heading and opp heading 

// speed
100 cutRsc ["SPEEDINKNOTTS", "PLAIN"]; // words
110 cutRsc ["SPEEDINKNOTTSVALUE", "PLAIN"]; // numbers

// height
120 cutRsc ["ALT", "PLAIN"]; // words
130 cutRsc ["ATLVALUE", "PLAIN"]; // numbers
140 cutRsc ["ASLVALUE", "PLAIN"]; // numbers

// heading
150 cutRsc ["AZIMUTH", "PLAIN"]; // words
160 cutRsc ["AZIMUTHVALUE", "PLAIN"]; // numbers
170 cutRsc ["REVERSEAZIMUTHVALUE", "PLAIN"]; // numbers

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "SPEEDINKNOTTS")};


// HUD function ---------------------------------------------------------------------------------

[] spawn {

	while {true} do 
	{
		// HUD CALCS ----------------------------------------------------------------------------
		
		// SPEED 
			// _RGGSspeed = KMPH value
			_RGGSspeed = round speed player;
			// _RGGKnotts2 = Knotts value
			_RGGKnotts = speed player * 0.539957;
			_RGGKnotts2 = round _RGGKnotts;
			// as with before, i need this global, so for now ...
			knotts = _RGGKnotts2;
			
		// HEIGHT 
			// _RGGASL3 = ASL value
			_RGGASL1 = (getPosASL player) select 2;
			_RGGASL2 = _RGGASL1 - 6.19;
			_RGGASL3 = round _RGGASL2;
			// _RGGATL3 = ATL value
			_RGGATL1 = (getPosATL player) select 2;
			_RGGATL2 = _RGGATL1 - 1.19;
			RGGATL3 = round _RGGATL2;
			
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

		// VSI CALC
			// TBC



		// HUD DISPLAYS -------------------------------------------------------------------------

		
		// SPEED DISPLAY (WORDS) OF KNOTTS 
		_displayKNOTTS = uiNameSpace getVariable "SPEEDINKNOTTS";
		_setText = _displayKNOTTS displayCtrl 999100;
		_setText ctrlSetStructuredText (parseText format ["VEL"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.3];
		
		
		// SPEED DISPLAY (NUMBERS) OF KNOTTS 
		_displayKNOTTSVALUE = uiNameSpace getVariable "SPEEDINKNOTTSVALUE";
		_setText = _displayKNOTTSVALUE displayCtrl 999110;
		_setText ctrlSetStructuredText (parseText format ["%1", _RGGKnotts2]);
		_setText ctrlSetBackgroundColor [0,0,0,0.3];			
		

		// HEIGHT DISPLAY (WORDS) 
		_displayALTX2 = uiNameSpace getVariable "ALT";
		_setText = _displayALTX2 displayCtrl 999120;
		//_setText ctrlSetStructuredText (parseText format ["ATL:<br />ASL:"]);
		_setText ctrlSetStructuredText (parseText format ["ATL"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];	
		

		// HEIGHT DISPLAY (NUMBERS) OF ATL
		_displayALTX2VALUE = uiNameSpace getVariable "ATLVALUE";
		_setText = _displayALTX2VALUE displayCtrl 999130;
		_setText ctrlSetStructuredText (parseText format ["%1", RGGATL3]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// HEIGHT DISPLAY (NUMBERS) OF ASL 
		_displayALTX2VALUE = uiNameSpace getVariable "ASLVALUE";
		_setText = _displayALTX2VALUE displayCtrl 999140;
		_setText ctrlSetStructuredText (parseText format ["%1", _RGGASL3]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];	


		// HEADING DISPLAY OF HELI (WORDS)
		_displayAZIMUTH = uiNameSpace getVariable "AZIMUTH";
		_setText = _displayAZIMUTH displayCtrl 999150;
		_setText ctrlSetStructuredText (parseText format ["HD"]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];	


		// HEADING DISPLAY OF HELI (NUMBERS) 
		_displayAZIMUTHVALUE = uiNameSpace getVariable "AZIMUTHVALUE";
		_setText = _displayAZIMUTHVALUE displayCtrl 999160;
		_setText ctrlSetStructuredText (parseText format ["%1",_heliAz]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// REVERSE HEADING DISPLAY OF HELI (NUMBERS) 
		_displayAZIMUTHVALUE = uiNameSpace getVariable "REVERSEAZIMUTHVALUE";
		_setText = _displayAZIMUTHVALUE displayCtrl 999170;
		_setText ctrlSetStructuredText (parseText format ["%1", revAZ]);
		_setText ctrlSetBackgroundColor [0,0,0,0.5];


		// VSI CALC

		sleep 0.1;			
	};
};
				
				
