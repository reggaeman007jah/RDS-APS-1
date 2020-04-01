
// create a team of 4 custom tanoa troopers 

for "_i" from 1 to 5 do 
{
	bluGroup = createGroup west;
	_unit = bluGroup createUnit ["b_soldier_m_f", getMarkerPos "SFPZ", [], 0.1, "none"]; 

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit forceAddUniform "U_B_T_Soldier_AR_F";
	_unit addItemToUniform "FirstAidKit";
	_unit addItemToUniform "Chemlight_green";
	for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Red";};
	_unit addVest "V_PlateCarrier1_tna_F";
	for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellGreen";
	_unit addItemToVest "Chemlight_green";
	for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	for "_i" from 1 to 5 do {_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";};
	_unit addBackpack "B_Carryall_oli_BTAmmo_F";
	for "_i" from 1 to 4 do {_unit addItemToBackpack "FirstAidKit";};
	_unit addItemToBackpack "100Rnd_65x39_caseless_mag";
	_unit addItemToBackpack "NLAW_F";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "MiniGrenade";};
	for "_i" from 1 to 15 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
	_unit addItemToBackpack "3Rnd_HE_Grenade_shell";
	for "_i" from 1 to 2 do {_unit addItemToBackpack "10Rnd_338_Mag";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "20Rnd_762x51_Mag";};
	_unit addHeadgear "H_Cap_khaki_specops_UK";
	_unit addGoggles "rhs_googles_yellow";

	_unit addWeapon "SMA_MK18TAN_GL_SM";
	_unit addPrimaryWeaponItem "acc_pointer_IR";
	_unit addPrimaryWeaponItem "optic_Arco";
	_unit addWeapon "hgun_P07_khk_F";
	_unit addWeapon "Binocular";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";
	_unit linkItem "ItemGPS";

	_unit setFace "WhiteHead_10";
	_unit setSpeaker "male02eng";

	//systemChat "RF UNIT CREATED";
	sleep 1;

	_unit setUnitPos "MIDDLE";
	_randomDir = selectRandom [270, 290, 01, 30, 90];
	_endPoint = SF_pickup getPos [10, _randomDir];
	_unit doMove _endPoint;
	_unit setBehaviour "COMBAT";
};

/*
NO FUCKING AMMO??
for "_i" from 1 to 2 do // custom heavy gunners
{
	bluGroup = createGroup west;
	_unit = bluGroup createUnit ["b_soldier_m_f", getMarkerPos "SFPZ", [], 0.1, "none"]; 

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit forceAddUniform "U_B_T_Soldier_AR_F";
	_unit addItemToUniform "FirstAidKit";
	_unit addItemToUniform "Chemlight_green";
	for "_i" from 1 to 3 do {_unit addItemToUniform "HandGrenade";};
	_unit addVest "V_PlateCarrier1_tna_F";
	for "_i" from 1 to 5 do {_unit addItemToVest "FirstAidKit";};
	for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
	for "_i" from 1 to 5 do {_unit addItemToVest "HandGrenade";};
	_unit addItemToVest "SmokeShell";
	_unit addItemToVest "SmokeShellGreen";
	_unit addItemToVest "Chemlight_green";
	for "_i" from 1 to 5 do {_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";};
	_unit addBackpack "B_Carryall_oli_BTAmmo_F";
	for "_i" from 1 to 6 do {_unit addItemToBackpack "SMA_150Rnd_762_M80A1_Tracer";};
	_unit addHeadgear "H_Cap_khaki_specops_UK";
	_unit addGoggles "rhs_googles_yellow";

	_unit addWeapon "sma_minimi_mk3_762tsb_des";
	_unit addPrimaryWeaponItem "SMA_ELCAN_SPECTER";
	_unit addWeapon "hgun_P07_khk_F";

	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemRadio";

	_unit setFace "WhiteHead_10";
	_unit setSpeaker "male02eng";

	systemChat "HG UNIT CREATED";
	sleep 1;

	_unit setUnitPos "MIDDLE";
	_randomDir = selectRandom [270, 290, 01, 30, 90];
	_endPoint = SF_pickup getPos [10, _randomDir];
	_unit doMove _endPoint;
	_unit setBehaviour "COMBAT";
};

