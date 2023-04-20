
#include "\GMS\Compiles\Init\GMS_defines.hpp"
params["_difficulty"];
//diag_log format["getIndexFromDifficult: _dificulty = %1 | typeName _difficulty = %2",_difficulty, typeName _difficulty];
private _return = 0;
switch(toLowerANSI(_difficulty)) do 
{
	case "red": {_return = 1};
	case "green": {_return = 2};
	case "orange": {_return = 3};
};
_return