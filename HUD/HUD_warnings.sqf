
disableSerialization;

// NEEDS LOTS OF WORK/TESTING TO FIND RIGHT BALANCE!
// CONSIDER MAKING THIS CONFIGERABLE BY PLAYER IN DIALOG

// ----- HUD_warnings
// Dynamic flight alerts based on prox vs speed relative to your obj
// CONSIDER - always have a key indicator, 1.5km 1km 900 800 ... 200 150 100 50 etc, but also have BG colour to refect ideal speed..

// key triggers:

/*
warnings only if too fast 
trigger		text	action
>=1000m		1000+	black bg white text always
<=1000		1000	black bg white text always
<=900m		900		black bg white text // if speed >= 100 then black bg red text
<=800m		800		black bg white text // if speed >= 90 then black bg red text
<=700m		700		black bg white text // if speed >= 80 then black bg red text
<=600m		600		black bg white text // if speed >= 70 then black bg red text
<=500m		500		black bg white text // if speed >= 60 then black bg red text
<=400m		400		black bg white text // if speed >= 45 then black bg red text
<=300m		300		black bg white text // if speed >= 35 then black bg red text
<=200m		200		black bg white text // if speed >= 20 then black bg red text
<=100m		100		black bg white text // if speed >= 15 then black bg red text
<=50m 		land	black bg white text // if speed >= 8 then black bg red text	
*/


// ----- SPEED ALERT

// NOTE - THIS IS SPECIFIC TO THE PZ, SO MAKE SURE YOU ID WHAT THE MISSION STATE IS FIRST

// PZ SPEED WARNING
1200 cutRsc ["PZSPEEDWARNING", "PLAIN"];
1300 cutRsc ["LZSPEEDWARNING", "PLAIN"];

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "PZSPEEDWARNING")};


// HUD function ---------------------------------------------------------------------------------

// dynamic speed alert on approach to PZ

[] spawn {

	while {true} do 
	{
		if (PZAPPROACH) then 
		{
			if ((pzDist) <700) then 
			{
				if ((knotts) >60) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["TARGET 60<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [1,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["OK<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [0,1,0,0.5];
				};
			};
			
			if ((pzDist) <300) then 
			{
				if ((knotts) >40) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["TARGET 40<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [1,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["OK<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [0,1,0,0.5];
				};
			};
		};

		if (!PZAPPROACH) then 
		{
			_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
			_setText = _displayOBJUNITS displayCtrl 9991200;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0];
		};

		if (LZAPPROACH) then 
		{
			if ((lzDist) <700) then  
			{
				if ((knotts) >60) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "LZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991300;
					_setText ctrlSetStructuredText (parseText format ["TARGET 60<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [1,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "LZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991300;
					_setText ctrlSetStructuredText (parseText format ["OK<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [0,1,0,0.5];
				};
			};
			
			if ((lzDist) <300) then 
			{
				if ((knotts) >40) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "LZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991300;
					_setText ctrlSetStructuredText (parseText format ["TARGET 40<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [1,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "LZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991300;
					_setText ctrlSetStructuredText (parseText format ["OK<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [0,1,0,0.5];
				};
			};
		};
	
		if (!LZAPPROACH) then 
		{
			_displayOBJUNITS = uiNameSpace getVariable "LZSPEEDWARNING";
			_setText = _displayOBJUNITS displayCtrl 9991300;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0];
		};

		sleep 0.5;
	};
};


