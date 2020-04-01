
// spawner script for 1st wave opfor defenders 

_rndOp1 = (_this select 0); // passed random number of enemy

for "_i" from 1 to _rndOp1 do 
{
	_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];
	_grp = createGroup east;
	_pos = [dest, 0, 200] call BIS_fnc_findSafePos;
	_unit = _grp createUnit [_rndtype, _pos, [], 30, "none"]; 
	_unit setUnitPos "AUTO";
	_unit setBehaviour "COMBAT";
	_randomDir = selectRandom [01, 90, 180, 270];
	_randomDist = selectRandom [25, 35, 45, 55];
	_endPoint = dest getPos [_randomDist, _randomDir];
	_unit doMove _endPoint;
	sleep 1;									
};


_pos = [dest, 0, 200] call BIS_fnc_findSafePos;
_vUnit = createVehicle ["O_G_Offroad_01_armed_F", _pos, [], 30, "none"]; 
createVehicleCrew _vUnit;


