
#include "\x\addons\GMS\Compiles\Init\GMS_defines.hpp"
params["_difficulty"];

private _return = 0;  //  Assign blue = 0;
switch(toLowerANSI(_difficulty)) do 
{
	case "red": {_return = 1};
	case "green": {_return = 2};
	case "orange": {_return = 3};
};
_return