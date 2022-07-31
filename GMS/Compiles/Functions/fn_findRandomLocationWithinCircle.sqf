/*
    GMS_fnc_findRandomLocationWithinCircle 
    
    Params["_center","_min","_max"];
    _center = center of the circle 
    _min = minimum distance from center of the position 
    _max = radius of the circle
    private _pos
    Return: _pos, the position generated 
*/
#include "\GMS\Compiles\Init\GMS_defines.hpp"
params["_center","_min","_max"];
private _vector = random(359);
private _radius = _min + (_min + random(_max - _min));
private _pos = _center getPos[_radius,_vector];
_pos