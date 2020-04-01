
// RDS PHASE 2 - ATTACK

// MISSION STATES ------------------------------------------------------------------------------------
DEPLOY = false;
LZAPPROACH = false;
execVM "RDS\stateManager.sqf";

if (ATTACK) then {

	sleep 30;

	_units = allUnits inAreaArray "Battlearea";
	{
		_Dir = random 360;
		_Dist = selectRandom [50, 55]; 
		_defend360 = dest getPos [_Dist,_Dir]; 
		_x setUnitPos "AUTO";
		_x doMove _defend360;
	} forEach _units;

	if ((RGG_BZopforCount) < 3) then {
		ATTACK = false;
		sleep 0.1;
		DEFEND = true;
	};

};

if (DEFEND) then {
	execVM "rds\p3_defend.sqf";
} else {
	execVM "rds\p2_attack.sqf";
};

