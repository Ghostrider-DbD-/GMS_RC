
diag_log format["[GMS] LOADING GMS_Client.sqf at %1",diag_tickTime];
#include "GMS_clientFunctions.sqf";
#include "GMS_clientSettings.sqf";

{
	diag_log format["[GMS_Client] %1 = %2",_x, missionNamespace getVariable[_x,-1]];
} forEach [
	"GMS_useHint",
	"GMS_useSystemChat",
	"GMS_useTitleText",
	"GMS_useDynamic",
	"GMS_useToast",
	"GMS_aiKilluseSystemChat",
	"GMS_aiKilluseDynamic",
	"GMS_aiKilluseTitleText"
];
diag_log format["[GMS] DONE LOADING GMS_Client.sqf at %1",diag_tickTime];