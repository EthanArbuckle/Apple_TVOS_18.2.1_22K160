@interface SCATGamepadInputSource
- (BOOL)handledEvent:(id)a3;
- (BOOL)isGamepadInputSource;
- (id)_actionIdentifierForKeyCode:(unsigned __int16)a3 withType:(id)a4;
- (id)_persistentSwitchIdentifierForKeyCode:(unsigned __int16)a3;
- (id)_switchDisplayNameForKeyCode:(unsigned __int16)a3;
- (id)switchSource;
- (int64_t)switchKeyForSwitch:(id)a3;
@end

@implementation SCATGamepadInputSource

- (BOOL)isGamepadInputSource
{
  return 1;
}

- (id)switchSource
{
  return SCATSwitchSourceGamepad;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  return [a3 keyCode];
}

- (BOOL)handledEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 creatorHIDEvent];
  if (v4)
  {
    id v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 gameControllerInfo]);
    if (([v7 isJoystickPressed] & 1) != 0
      || ([v7 isDirectionPadPressed] & 1) != 0
      || ([v7 isFaceButtonPressed] & 1) != 0
      || ([v7 isShoulderButtonPressed] & 1) != 0)
    {
      uint64_t v8 = 1LL;
    }

    else
    {
      uint64_t v8 = (uint64_t)[v7 isKeyboardTypeButtonPressed];
    }

    id v9 = +[AXGameControllerEvent axGameControllerKeyCodeForEvent:]( &OBJC_CLASS___AXGameControllerEvent,  "axGameControllerKeyCodeForEvent:",  v6);
    BOOL v10 = (_DWORD)v9 != 0;
    if ((_DWORD)v9)
    {
      id v11 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGamepadInputSource _actionIdentifierForKeyCode:withType:]( self,  "_actionIdentifierForKeyCode:withType:",  v9,  @"SwitchActionTypeNormal"));
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGamepadInputSource _actionIdentifierForKeyCode:withType:]( self,  "_actionIdentifierForKeyCode:withType:",  v11,  @"SwitchActionTypeLongPress"));
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGamepadInputSource _persistentSwitchIdentifierForKeyCode:]( self,  "_persistentSwitchIdentifierForKeyCode:",  v11));
      v15 = (void *)objc_claimAutoreleasedReturnValue( -[SCATGamepadInputSource _switchDisplayNameForKeyCode:]( self,  "_switchDisplayNameForKeyCode:",  v11));
      -[SCATInputSource _handleAction:longPressAction:start:switchIdentifier:switchDisplayName:]( self,  "_handleAction:longPressAction:start:switchIdentifier:switchDisplayName:",  v12,  v13,  v8,  v14,  v15);
    }
  }

  else
  {
    _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"No HID event found for Game Controller. suspicious");
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_actionIdentifierForKeyCode:(unsigned __int16)a3 withType:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v4));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v6]);
  }

  else
  {
    _AXLogWithFacility(0LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, 1, @"Could not lookup action for nil actions");
    id v11 = 0LL;
  }

  return v11;
}

- (id)_persistentSwitchIdentifierForKeyCode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATHardwareInputSource persistentSwitchIdentifiers](self, "persistentSwitchIdentifiers"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

- (id)_switchDisplayNameForKeyCode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATHardwareInputSource switchDisplayNames](self, "switchDisplayNames"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

@end