/*
	GMS_fnc_loadLootItemsFromArray
	

	call as:
	
	[_item,_crate] call GMS_fnc_loadLootFromItemsArray;
	
	where
		_crate is a container such as ammo box or vehicle
		_loadout is an array containing either 2 or 3 elements. The first array is always an array of items to add. Items can be formated as ["item1","item1"], as [["item1",3],["item2",2]] or as [["item1",2,4],["item2",3,5]].
		See GMSCore_fnc_addItemToCrate for information about the acceptable formates for the items "item1" ... "itemN".
		
		The second and optional third element in the array specify the number of times the script will randomly select an item from the array of items and load it into the crate.
		For example:
		case 1: [["item1",...,"itemN"],6]; The script will randomly select from the array of item names 6 times and call the loot loader each time.
		case 2: [["item1",...,"itemN"],6, 9]; As above except that an item will be selected a minimum of 6 and maximum of 9 times.
	

	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/

#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"


	params["_loadout","_crate",["_addAmmo",0]];
	if ((_loadout select 0) isEqualTo []) exitWith {};
	{
		private["_tries","_q","_item"];
		_tries = 0;
		_q = _x select 1; // this can be a number or array.
		_tries = [_q] call GMSCore_fnc_getNumberFromRange;
		for "_i" from 1 to _tries do
		{
			_item = selectRandom (_x select 0);
			[_item,_crate,_addAmmo] call GMSCore_fnc_addItem;		
		};
	}forEach _loadout;
