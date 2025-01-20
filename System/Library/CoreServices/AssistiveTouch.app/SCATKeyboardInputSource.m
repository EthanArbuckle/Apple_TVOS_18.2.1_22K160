@interface SCATKeyboardInputSource
- (BOOL)handledEvent:(id)a3;
- (BOOL)isKeyboardInputSource;
- (id)_actionIdentifierForKeyCode:(unsigned __int16)a3 withType:(id)a4;
- (id)_persistentSwitchIdentifierForKeyCode:(unsigned __int16)a3;
- (id)_switchDisplayNameForKeyCode:(unsigned __int16)a3;
- (id)switchSource;
- (int64_t)switchKeyForSwitch:(id)a3;
@end

@implementation SCATKeyboardInputSource

- (BOOL)isKeyboardInputSource
{
  return 1;
}

- (id)switchSource
{
  return SCATSwitchSourceKeyboard;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  return [a3 keyCode];
}

- (BOOL)handledEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 10 || objc_msgSend(v4, "type") == 11)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 keyInfo]);
    id v6 = [v5 keyDown];

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 keyInfo]);
    id v8 = [v7 keyCode];

    v9 = (void *)objc_claimAutoreleasedReturnValue( -[SCATKeyboardInputSource _actionIdentifierForKeyCode:withType:]( self,  "_actionIdentifierForKeyCode:withType:",  v8,  @"SwitchActionTypeNormal"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[SCATKeyboardInputSource _actionIdentifierForKeyCode:withType:]( self,  "_actionIdentifierForKeyCode:withType:",  v8,  @"SwitchActionTypeLongPress"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[SCATKeyboardInputSource _persistentSwitchIdentifierForKeyCode:]( self,  "_persistentSwitchIdentifierForKeyCode:",  v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATKeyboardInputSource _switchDisplayNameForKeyCode:](self, "_switchDisplayNameForKeyCode:", v8));
    -[SCATInputSource _handleAction:longPressAction:start:switchIdentifier:switchDisplayName:]( self,  "_handleAction:longPressAction:start:switchIdentifier:switchDisplayName:",  v9,  v10,  v6,  v11,  v12);

    BOOL v13 = 1;
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_actionIdentifierForKeyCode:(unsigned __int16)a3 withType:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v6]);
  }

  else
  {
    _AXLogWithFacility(0LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, 1, @"Could not lookup action for nil actions");
    v11 = 0LL;
  }

  return v11;
}

- (id)_persistentSwitchIdentifierForKeyCode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATHardwareInputSource persistentSwitchIdentifiers](self, "persistentSwitchIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

- (id)_switchDisplayNameForKeyCode:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATHardwareInputSource switchDisplayNames](self, "switchDisplayNames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

@end