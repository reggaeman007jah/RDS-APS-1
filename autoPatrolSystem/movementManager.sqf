
// used to prevent blufor units from just standing around, or going in the wrong direction...
// this could be done better .. can Core be built into Objective?
// note - this is called when..?
// create temp LZ marker?
// BASEd ON THE mission state BOOL, CAN WE TAKE POS AND MAKE MARKER?
// 28sept I believe this is only triggered when player lands in an LZ.


// manage movement in the Objective Marker -----------------------------------------------------------------
_units = allUnits inAreaArray "Objective";
_injuredUnits = allUnits inAreaArray "Core";


sleep 5;
// add a forEach loop here iF this all works ok..
{
	switch ((side _x)) do
	{
		case EAST: 	{};
		case WEST: 	{
						_Dir = random 360;
						_Dist = selectRandom [50, 55]; 
						_defend360 = dest getPos [_Dist,_Dir]; 
						_x doMove _defend360;
					};
	};
} forEach _units;

// disembarking heli sometimes does not capture this ^^, so instruction is repeated once -------------------
// again, do this better!!!
//28sept ... er, where is the second version of the moveIn command?

sleep 1;

//26sept
/*
_checkInjured = allUnits inAreaArray "Core";
{
	_inj = getDammage _x
	//_medEvacPos = getMarkerPos "core";
	if ((_inj) >= 0.7) then {
		_Dir = random 360;
		_Dist = 10; 
		_medEvacPos = dest getPos [_Dist,_Dir]; 
		_x doMove _medEvacPos;
		systemChat "+1 MEDEVAC";
} forEach _checkInjured;
*/
// 28sept ^^ this takes all units already sent to core, and moves them into position
// it ignores non-injured units
// corrected _inj value from 8 to 0.7 !!
// moved this all into medevac.sqf

//28sept - movementManager.sqf should really be attackOrders.sqf

// 26sept not sure this works, so blocking out for now
/*
{
	switch ((side _x)) do
	{
		case EAST: 	{};
		case WEST: 	{
						_inj = getDammage _x;
						_dest = getMarkerPos "core";
						if ((_inj) >= 8) then {
							_x doMove _dest;
							systemChat "injured unit moving to core";
						} else {
						// 24sept ok below
						_Dir = random 360;
						_Dist = 50; 
						_defend360 = dest getPos [_Dist,_Dir]; 
						_x doMove _defend360;
						};
					};
	};
} forEach _units;
*/

// no instruction for opfor currently, as they are instructed by the Battlearea instruction below


// remind enemy to attack the core -------------------------------------------------------------------------
_opUnits = allUnits inAreaArray "Battlearea";
{
	switch ((side _x)) do
	{
		case EAST: 	{
						_Dir = random 360;
						_Dist = selectRandom [50, 55]; 
						_defend360 = dest getPos [_Dist,_Dir]; 
						_x doMove _defend360;
						//18SEPT NOTES - ADDED BETTER MOVE ORDERS ^^
					};
		case WEST: 	{};
	};
} forEach _opUnits;

RGG_INJ = _injuredUnits;

//26sept
/*
checkInjured = allUnits inAreaArray "BattleArea";

{
	_inj = getDammage _x;
	if ((_inj) >= 0.2) then 
	{_x doMove Dest};
} forEach checkInjured;
// 28sept moved ^^ to medevac


