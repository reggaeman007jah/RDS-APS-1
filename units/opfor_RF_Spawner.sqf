
// call single point attack

["ENEMY REINFORCEMENTS ARE INBOUND"] execVM "HUD\HUD_messages.sqf";
_opCount = east countSide allUnits; // WHAT DOES THIS DO???
_rndOp1 = selectRandom [10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]; // force size
_randomBehaviour = selectRandom ["STEALTH", "COMBAT", "AWARE"]; // behaviour
//_pos = [dest, 400, 500] call BIS_fnc_findSafePos; // single point spawn 400-500m away from Dest (OLD)
_pos = [dest, 600, 700] call BIS_fnc_findSafePos; // single point spawn 600-700m away from Dest

//["ENEMY REINFORCEMENTS ARE INBOUND"] execVM "HUD\HUD_messages.sqf";


for "_i" from 1 to _rndOp1 do 
{						
	sleep 1;
	_grp = createGroup east;
	_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];			
	_randomDir = selectRandom [0, 45, 90, 135, 180, 225, 270, 315]; // units spawn from 8 main compass points
	_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
	sleep 1;
	_moveTo = dest getPos [5,_randomDir]; // 5m = they will try to overrun the patrol position!! 
	_unit doMove _moveTo;
	_unit setUnitPos "AUTO";
	_unit setBehaviour _randomBehaviour;
}; 

_pos = [dest, 0, 200] call BIS_fnc_findSafePos;
_vUnit = createVehicle ["O_G_Offroad_01_armed_F", _pos, [], 30, "none"]; 
createVehicleCrew _vUnit;

//_vUnit1 = createVehicle ["O_APC_Wheeled_02_rcws_F", _pos, [], 30, "none"]; 
//createVehicleCrew _vUnit1;

//sleep 5;
//_vUnit2 = createVehicle ["O_APC_Wheeled_02_rcws_F", _pos, [], 30, "none"]; 
//createVehicleCrew _vUnit2;
/*

// 24sept ... i want to exp with this as a single point attack all the time, i.e. to build up 1, 2, 3 all ...
// to do this, I am moving to comment-storage all code to manage the randomisation, and am replacing with one
// single instruction to apply on attack point every time this is run. perhaps we can let the player decide
// the level of opfor RF 1 2 3 all..?
// anyway all below this point works and is older randomisation code........V V V

// this spawns opfor reinforcements, and is called when initial opfor defenders are wiped out

// debug ---------------------------------------------------------------------------------------------------
// systemChat "debug --- new attack wave incoming --- debug";
// make this mission intel!! - done

// useful classes:
// O_G_Offroad_01_armed_F
// O_APC_Wheeled_02_rcws_F

// global state manager ------------------------------------------------------------------------------------
// OPFOR_RF = true;


// percentage manager --------------------------------------------------------------------------------------
_outcome = random 99; 
// i.e. 
// chance of 360 attack - 15%
// chance of pincer attack - 15%
// chance of three point attack - 30%
// chance of single column attack - 40%


// opfor attack generator ----------------------------------------------------------------------------------

if ((_outcome) <= 14) then // attack from random directions
{
	//systemChat "debug --- call 360 attack";
	["ENEMY IS ATTACKING FROM ALL DIRECTIONS"] execVM "HUD\HUD_messages.sqf";

	_opCount = east countSide allUnits; // WHAT DOES THIS DO???
	_rndOp1 = selectRandom [10, 20, 30]; // force size
	_randomBehaviour = selectRandom ["STEALTH", "COMBAT", "AWARE"]; // behaviour

	for "_i" from 1 to _rndOp1 do 
	{						
		sleep 1;
		_grp = createGroup east;
		_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];			
		_randomDir = selectRandom [0, 45, 90, 135, 180, 225, 270, 315]; // units spawn from 8 main compass points
		_pos = [dest, 200, 300] call BIS_fnc_findSafePos; // spawns 200-300m away from Dest in any direction
		_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
		sleep 1;
		_moveTo = dest getPos [5,_randomDir]; // 5m = they will try to overrun the patrol position!! 
		_unit doMove _moveTo;
		_unit setUnitPos "AUTO";
		_unit setBehaviour _randomBehaviour;
	}; 

	_pos = [dest, 200, 300] call BIS_fnc_findSafePos;
	_vUnit = createVehicle ["O_APC_Wheeled_02_rcws_F", _pos, [], 30, "none"]; 
	createVehicleCrew _vUnit;
} 
else
{
	if ((_outcome) <= 29) then // two point attack
	{
		//systemChat "debug --- two point attack"; 
		["ENEMY IS ATTACKING FROM TWO DIRECTIONS"] execVM "HUD\HUD_messages.sqf";

		_opCount = east countSide allUnits; // WHAT DOES THIS DO???
		_rndOp1 = selectRandom [10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]; // force size
		_randomBehaviour = selectRandom ["STEALTH", "COMBAT", "AWARE"]; // behaviour
			
		_pos1 = [dest, 400, 500] call BIS_fnc_findSafePos; // single point spawn 400-500m away from Dest
		_pos2 = [dest, 400, 500] call BIS_fnc_findSafePos; // single point spawn 400-500m away from Dest

		for "_i" from 1 to _rndOp1 do 
		{						
			sleep 1;
			_grp = createGroup east;
			_pos = selectrandom [_pos1, _pos2];
			_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];			
			_randomDir = selectRandom [0, 45, 90, 135, 180, 225, 270, 315]; // units spawn from 8 main compass points
			_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
			sleep 1;
			_moveTo = dest getPos [5,_randomDir]; // 5m = they will try to overrun the patrol position!! 
			_unit doMove _moveTo;
			_unit setUnitPos "AUTO";
			_unit setBehaviour _randomBehaviour;
		}; 

			_pos = selectrandom [_pos1, _pos2];
			_vUnit = createVehicle ["O_APC_Wheeled_02_rcws_F", _pos, [], 30, "none"]; 
			createVehicleCrew _vUnit;
	}
	else 
	{
		if ((_outcome) <= 59) then // three point attack
		{
			//systemChat "debug --- three point attack"; 
			["ENEMY IS ATTACKING FROM THREE DIRECTIONS"] execVM "HUD\HUD_messages.sqf";
			_opCount = east countSide allUnits; // WHAT DOES THIS DO???
			_rndOp1 = selectRandom [10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]; // force size
			_randomBehaviour = selectRandom ["STEALTH", "COMBAT", "AWARE"]; // behaviour
			
			_pos1 = [dest, 400, 500] call BIS_fnc_findSafePos; // single point spawn 400-500m away from Dest
			_pos2 = [dest, 400, 500] call BIS_fnc_findSafePos; // single point spawn 400-500m away from Dest
			_pos3 = [dest, 400, 500] call BIS_fnc_findSafePos; // single point spawn 400-500m away from Dest

			for "_i" from 1 to _rndOp1 do 
			{						
				sleep 1;
				_grp = createGroup east;
				_pos = selectrandom [_pos1, _pos2, _pos3];
				_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];			
				_randomDir = selectRandom [0, 45, 90, 135, 180, 225, 270, 315]; // units spawn from 8 main compass points
				_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
				sleep 1;
				_moveTo = dest getPos [5,_randomDir]; // 5m = they will try to overrun the patrol position!! 
				_unit doMove _moveTo;
				_unit setUnitPos "AUTO";
				_unit setBehaviour _randomBehaviour;
			}; 

			_pos = selectrandom [_pos1, _pos2, _pos3];
			_vUnit = createVehicle ["O_APC_Wheeled_02_rcws_F", _pos, [], 30, "none"]; 
			createVehicleCrew _vUnit;
		}
		else
		{
			// call single point attack
			//systemChat "debug --- single point attack"; 
			["ENEMY IS ATTACKING FROM ONE MAIN DIRECTION"] execVM "HUD\HUD_messages.sqf";
			_opCount = east countSide allUnits; // WHAT DOES THIS DO???
			_rndOp1 = selectRandom [10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]; // force size
			_randomBehaviour = selectRandom ["STEALTH", "COMBAT", "AWARE"]; // behaviour
			_pos = [dest, 400, 500] call BIS_fnc_findSafePos; // single point spawn 400-500m away from Dest

			for "_i" from 1 to _rndOp1 do 
			{						
				sleep 1;
				_grp = createGroup east;
				_rndtype = selectRandom ["o_g_soldier_ar_f", "o_g_soldier_gl_f", "o_g_sharpshooter_f", "o_soldieru_lat_f"];			
				_randomDir = selectRandom [0, 45, 90, 135, 180, 225, 270, 315]; // units spawn from 8 main compass points
				_unit = _grp createUnit [_rndtype, _pos, [], 1, "none"]; 
				sleep 1;
				_moveTo = dest getPos [5,_randomDir]; // 5m = they will try to overrun the patrol position!! 
				_unit doMove _moveTo;
				_unit setUnitPos "AUTO";
				_unit setBehaviour _randomBehaviour;
			}; 

			_vUnit = createVehicle ["O_APC_Wheeled_02_rcws_F", _pos, [], 30, "none"]; 
			createVehicleCrew _vUnit;
		}
	}
};