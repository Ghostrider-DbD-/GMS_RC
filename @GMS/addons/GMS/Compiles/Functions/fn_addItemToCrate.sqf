/*
	[_item,_crate] call GMS_addItemToCrate;
	where
		_crate is a container such as ammo box or vehicle
		_item is a string or array.
		If _item is a string then add 1 of that item to the container.
		If _item is an array with 2 elements ["itemName",3] then assume that the first element is a string and is the name of the item, and the second is the number to add.
		if _item is an array with 3 elements ["itemName",2,6] assume that the first element is the item name (string), the second the min # to add and the third the max # to add.


	By Ghostrider [GRG]
	Copyright 2016	
	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
_this call GMSCore_fnc_addItem;
