
// MARKERS AND LOCATIONS 

// system to generate initial location, and patrol objective location 
start = position player;
//_startPosition = position player;
// to do: confirm why both ^^ are needed
// 08 OCT - I HAVE REMOVED _STARTPOSITION ^^ IS BROKEN?

_patrolDestination = [start, 700, 700] call BIS_fnc_findSafePos; 
dest = _patrolDestination;
RGG_basePos = [dest, 2500, 2500] call BIS_fnc_findSafePos; 

// MED BASE - acts as blufor base area, can be used for RF/RE-UP tasks 
sleep 1;
deleteMarkerlocal "base";
_base = createMarkerLocal ["base", RGG_basePos];
_base setMarkerShapeLocal "ELLIPSE";
_base setMarkerColorLocal "ColorGreen";
_base setMarkerSizeLocal [50, 50];
_base setMarkerAlphaLocal 0.9;
sleep 1;

// AO - main dark grey circle within which all mission calcs take place
deleteMarkerlocal "BattleArea"; 
_battleArea = createMarkerLocal ["BattleArea", _patrolDestination];
_battleArea setMarkerShapeLocal "ELLIPSE";
_battleArea setMarkerColorLocal "ColorBlack";
_battleArea setMarkerSizeLocal [2250, 2250];
_battleArea setMarkerAlphaLocal 0.5;
sleep 1;

// OBJ - main blue patrol objective within which most battles are fought  
deleteMarkerlocal "Objective";
_objective = createMarkerLocal ["Objective", _patrolDestination];
_objective setMarkerShapeLocal "ELLIPSE";
_objective setMarkerColorLocal "ColorBlue";
_objective setMarkerSizeLocal [800, 800];
_objective setMarkerAlphaLocal 0.9;
sleep 1;

// OBJ - centre (core) objective that can be used for exfil/medevac
deleteMarkerlocal "Core";
_objective = createMarkerLocal ["Core", _patrolDestination];
_objective setMarkerShapeLocal "ELLIPSE";
_objective setMarkerColorLocal "ColorBlue";
_objective setMarkerSizeLocal [20, 20];
//_objective setMarkerAlphaLocal 1;
sleep 1;
