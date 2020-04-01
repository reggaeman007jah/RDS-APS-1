
while {true} do {

	_damageTrigger = 0.4; // change this value to set what constitutes an evac-worthy injury level

	// move injured units from front line to inner core (DEST)
	_readyInjured = allUnits inAreaArray "BattleArea";
	{
		_inj = getDammage _x;
		if ((_inj) >= _damageTrigger) then {
			_Dir = random 360;
			_Dist = 3; 
			_medEvacPos = dest getPos [_Dist, _Dir]; 
			_x doMove _medEvacPos
		};
	} forEach _readyInjured;
	
	sleep 5;
};
