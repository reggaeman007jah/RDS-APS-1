






			_units = allUnits inAreaArray "CORE";
			{
				_x assignAsCargo heli2;
				sleep 0.25;
			} forEach _units;	

			_units orderGetIn true;


			waitUntil 
		{
			(player distance RGG_basePos) <= 180;
		};

		// pop smoke at 80m from med-base
		_smoke = createVehicle ["G_40mm_smokeGREEN", getMarkerPos "BASE", [], 0, "none"];

		_units = fullCrew vehicle player;
		{
			_x orderGetIn false;
		} forEach _units;	

		{ unassignVehicle _x } forEach crew heli2;
