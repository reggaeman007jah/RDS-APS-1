
while {true} do {	

	// count everything - BATTLEAREA (dark grey main circle) ---------------------------------------------
	RGG_BZTotalUnits = allUnits inAreaArray "BattleArea";
	RGG_BZunitCount = count RGG_BZTotalUnits;

	// count units per side in BATTLEAREA ----------------------------------------------------------------
	RGG_BZopforCount = 0;
	RGG_BZbluforCount = 0;
	{
		switch ((side _x)) do
		{
			case EAST: {RGG_BZopforCount = RGG_BZopforCount + 1};
			case WEST: {RGG_BZbluforCount = RGG_BZbluforCount + 1};
		};
	} forEach RGG_BZTotalUnits;

	// count everything in OBJECTIVE (blue circle) -------------------------------------------------------
	RGG_objTotalUnits = allUnits inAreaArray "Objective";
	RGG_objBluUnits = count RGG_objTotalUnits;

	// count units per side in OBJECTIVE -----------------------------------------------------------------
	RGG_objOpCount = 0;
	RGG_objBluCount = 0;
	{
		switch ((side _x)) do
		{
			case EAST: {RGG_objOpCount = RGG_objOpCount + 1};
			case WEST: {RGG_objBluCount = RGG_objBluCount + 1};
		};
	} forEach RGG_objTotalUnits;

	sleep 2;
};


