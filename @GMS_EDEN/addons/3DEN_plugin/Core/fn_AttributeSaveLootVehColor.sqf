

	 _object setVariable["gmsGarrisonColor",_colorOn];
	 if (_colorOn) then {
		{_object setObjectTexture [_x,gms3DENlootVehicleTexture]} forEach (count (getObjectTextures _object));
	 };