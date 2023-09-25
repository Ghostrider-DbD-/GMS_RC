

_t1 = diag_tickTime;
_v1 = 0;
for "_i" from 1 to 100000 do 
{
 if (_v1 == 0) then {true}; 
}:
_m = format["elapsed time integer = %1",diag_tickTime - _t1];
systemChat _m;
diag_log _m;
_t1 = diag_tickTime;
_v1 = "thisspecialvar";
for "_i" from 1 to 100000 do 
{
    if (_v1 isEqualTo "thisspecialvar") then {};
};
_m = format["elapsed time string = %1",diag_tickTime - _t1];
systemChat _m;
diag_log _m;