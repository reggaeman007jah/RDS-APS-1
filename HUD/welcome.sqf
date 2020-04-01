
disableSerialization;

// ----- welcome messages
10000 cutRsc ["WELCOME", "PLAIN"]; 

// loading instruction -------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "WELCOME")};

// WELCOME MESSAGES 
_words = uiNameSpace getVariable "WELCOME";
_setText = _words displayCtrl 999999;
_setText ctrlSetStructuredText (parseText format ["WELCOME TO RDS - RAPID DEPLOYMENT SIMULATOR"]);
_setText ctrlSetBackgroundColor [0,0,0,0.3];
sleep 5;
_words = uiNameSpace getVariable "WELCOME";
_setText = _words displayCtrl 999999;
_setText ctrlSetStructuredText (parseText format ["YOUR TASKS ARE AS FOLLOWS."]);
_setText ctrlSetBackgroundColor [0,0,0,0.3];
sleep 1;
_words = uiNameSpace getVariable "WELCOME";
_setText = _words displayCtrl 999999;
_setText ctrlSetStructuredText (parseText format ["YOUR TASKS ARE AS FOLLOWS.."]);
_setText ctrlSetBackgroundColor [0,0,0,0.3];
sleep 1;
_words = uiNameSpace getVariable "WELCOME";
_setText = _words displayCtrl 999999;
_setText ctrlSetStructuredText (parseText format ["YOUR TASKS ARE AS FOLLOWS..."]);
_setText ctrlSetBackgroundColor [0,0,0,0.3];
sleep 2;
_words = uiNameSpace getVariable "WELCOME";
_setText = _words displayCtrl 999999;
_setText ctrlSetStructuredText (parseText format ["PHASE 1 - DEPLOYMENT - INSERT FIRE TEAMS ON THE GROUND AROUND THE OBJECTIVE"]);
_setText ctrlSetBackgroundColor [0,0,0,0.3];
sleep 4;
_words = uiNameSpace getVariable "WELCOME";
_setText = _words displayCtrl 999999;
_setText ctrlSetStructuredText (parseText format ["PHASE 2 - ATTACK - REINFORCE THESE TEAMS AS THEY ATTACK THE OBJECTIVE"]);
_setText ctrlSetBackgroundColor [0,0,0,0.3];
sleep 4;
_words = uiNameSpace getVariable "WELCOME";
_setText = _words displayCtrl 999999;
_setText ctrlSetStructuredText (parseText format ["PHASE 3 - DEFEND - ASSIST WITH REPELLING ANY OPFOR REPRISALS"]);
_setText ctrlSetBackgroundColor [0,0,0,0.3];
sleep 4;
_words = uiNameSpace getVariable "WELCOME";
_setText = _words displayCtrl 999999;
_setText ctrlSetStructuredText (parseText format ["PHASE 4 - EXTRACT - REDPLOY REMAINING UNITS TO THE NEAREST FOB"]);
_setText ctrlSetBackgroundColor [0,0,0,0.3];
sleep 4;
_words = uiNameSpace getVariable "WELCOME";
_setText = _words displayCtrl 999999;
_setText ctrlSetStructuredText (parseText format ["GOOD LUCK"]);
_setText ctrlSetBackgroundColor [0,0,0,0.3];
sleep 4;
_words = uiNameSpace getVariable "WELCOME";
_setText = _words displayCtrl 999999;
_setText ctrlSetStructuredText (parseText format [""]);
_setText ctrlSetBackgroundColor [0,0,0,0];

// INV FADEOUTS INSTEAD OF COLDCUT