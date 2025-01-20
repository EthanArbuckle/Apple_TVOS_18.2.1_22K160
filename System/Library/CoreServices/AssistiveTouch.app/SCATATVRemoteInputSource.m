@interface SCATATVRemoteInputSource
- (BOOL)handledEvent:(id)a3;
- (BOOL)isATVRemoteInputSource;
- (id)actionIdentifierForButtonNumber:(int64_t)a3 withType:(id)a4;
- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3;
- (id)switchDisplayNameForButtonNumber:(int64_t)a3;
- (id)switchSource;
- (int64_t)switchKeyForSwitch:(id)a3;
@end

@implementation SCATATVRemoteInputSource

- (BOOL)isATVRemoteInputSource
{
  return 1;
}

- (id)switchSource
{
  return SCATSwitchSourceATVRemote;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  return (int64_t)[a3 buttonNumber];
}

- (id)actionIdentifierForButtonNumber:(int64_t)a3 withType:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
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

- (id)persistentSwitchIdentifierForButtonNumber:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATHardwareInputSource persistentSwitchIdentifiers](self, "persistentSwitchIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

- (id)switchDisplayNameForButtonNumber:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATHardwareInputSource switchDisplayNames](self, "switchDisplayNames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  return v6;
}

- (BOOL)handledEvent:(id)a3
{
  id v5 = a3;
  id v6 = [v5 creatorHIDEvent];
  if (!v6)
  {
    _AXLogWithFacility(1LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, 1, @"No HID event found. suspicious");
    goto LABEL_18;
  }

  id v7 = v6;
  unint64_t v8 = IOHIDEventGetSenderID(v6) + 0x7FFFFFF7E8CE6C8ELL;
  if (v8 > 3 || v8 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v5 accessibilityData]);
    unsigned __int8 v10 = [v3 wasPostedByAccessibility];
  }

  else
  {
    unsigned __int8 v10 = 1;
  }

  if (v8 > 3 || v8 == 2)
  {

    if ((v10 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_18:
    BOOL v18 = 0;
    goto LABEL_19;
  }

  if ((v10 & 1) != 0) {
    goto LABEL_18;
  }
LABEL_16:
  id v12 = [v5 isDownEvent];
  uint64_t IntegerValue = IOHIDEventGetIntegerValue(v7, 196609LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[SCATATVRemoteInputSource actionIdentifierForButtonNumber:withType:]( self,  "actionIdentifierForButtonNumber:withType:",  IntegerValue,  @"SwitchActionTypeNormal"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[SCATATVRemoteInputSource actionIdentifierForButtonNumber:withType:]( self,  "actionIdentifierForButtonNumber:withType:",  IntegerValue,  @"SwitchActionTypeLongPress"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[SCATATVRemoteInputSource persistentSwitchIdentifierForButtonNumber:]( self,  "persistentSwitchIdentifierForButtonNumber:",  IntegerValue));
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[SCATATVRemoteInputSource switchDisplayNameForButtonNumber:]( self,  "switchDisplayNameForButtonNumber:",  IntegerValue));
  -[SCATInputSource _handleAction:longPressAction:start:switchIdentifier:switchDisplayName:]( self,  "_handleAction:longPressAction:start:switchIdentifier:switchDisplayName:",  v14,  v15,  v12,  v16,  v17);

  BOOL v18 = 1;
LABEL_19:

  return v18;
}

@end