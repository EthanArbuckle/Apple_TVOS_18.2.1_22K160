@interface SCATInterDeviceInputSource
- (NSDictionary)actionIdentifiersToRecipeMappingIndices;
- (NSDictionary)longPressActionIdentifiersToRecipeMappingIndices;
- (id)_resolveSwitchForSwitchEvent:(id)a3 deviceName:(id)a4;
- (id)inputDeviceHandledAction;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_getActionIdentifier:(id)a3 longPressActionIdentifier:(id)a4 forSwitchEvent:(id)a5;
- (void)handleReceivedSwitchEvent:(id)a3 deviceName:(id)a4;
- (void)setActionIdentifiersToRecipeMappingIndices:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setInputDeviceHandledAction:(id)a3;
- (void)setLongPressActionIdentifiersToRecipeMappingIndices:(id)a3;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATInterDeviceInputSource

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATInterDeviceInputSource;
  -[SCATInputSource setDelegate:queue:](&v4, "setDelegate:queue:", a3, a4);
}

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SCATInterDeviceInputSource;
  -[SCATInputSource updateWithSwitches:recipe:](&v16, "updateWithSwitches:recipe:", v6, v7);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000788A4;
    v12[3] = &unk_100123868;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    id v10 = v9;
    id v11 = v8;
    [v6 enumerateObjectsUsingBlock:v12];
    -[SCATInterDeviceInputSource setActionIdentifiersToRecipeMappingIndices:]( self,  "setActionIdentifiersToRecipeMappingIndices:",  v11);
    -[SCATInterDeviceInputSource setLongPressActionIdentifiersToRecipeMappingIndices:]( self,  "setLongPressActionIdentifiersToRecipeMappingIndices:",  v10);
  }

  else
  {
    -[SCATInterDeviceInputSource setActionIdentifiersToRecipeMappingIndices:]( self,  "setActionIdentifiersToRecipeMappingIndices:",  0LL);
    -[SCATInterDeviceInputSource setLongPressActionIdentifiersToRecipeMappingIndices:]( self,  "setLongPressActionIdentifiersToRecipeMappingIndices:",  0LL);
  }
}

- (void)_getActionIdentifier:(id)a3 longPressActionIdentifier:(id)a4 forSwitchEvent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 actions]);
  id v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v30;
    while (2)
    {
      id v15 = 0LL;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        int64_t v16 = -[SCATInputSource _identifierForInterDeviceAction:]( self,  "_identifierForInterDeviceAction:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)v15));
        if (v16)
        {
          uint64_t v17 = v16;
          goto LABEL_11;
        }

        id v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  uint64_t v17 = 103LL;
LABEL_11:

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "longPressActions", 0));
  id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    while (2)
    {
      v22 = 0LL;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        int64_t v23 = -[SCATInputSource _identifierForInterDeviceAction:]( self,  "_identifierForInterDeviceAction:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)v22));
        if (v23)
        {
          int64_t v24 = v23;
          goto LABEL_21;
        }

        v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  int64_t v24 = 0LL;
LABEL_21:

  if (v8) {
    [v8 setAction:v17];
  }
  if (v9) {
    [v9 setAction:v24];
  }
}

- (id)_resolveSwitchForSwitchEvent:(id)a3 deviceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assistiveTouchSwitches]);

  __int128 v31 = _NSConcreteStackBlock;
  uint64_t v32 = 3221225472LL;
  v33 = sub_100078F40;
  v34 = &unk_100123660;
  id v10 = v6;
  id v35 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectsPassingTest:&v31]);
  if ((unint64_t)[v11 count] >= 2)
  {
    __int128 v30 = v11;
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATInterDeviceInputSource.m",  117LL,  "-[SCATInterDeviceInputSource _resolveSwitchForSwitchEvent:deviceName:]",  @"Should never have stored multiple copies of the same switch. %@");
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject", v30));
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 remoteDeviceName]);
    if ([v14 isEqualToString:v7])
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
      int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 switchDisplayName]);
      unsigned __int8 v17 = [v15 isEqualToString:v16];

      if ((v17 & 1) != 0) {
        goto LABEL_17;
      }
    }

    else
    {
    }

    if (CFPreferencesGetAppBooleanValue(@"IDCLog", @"com.apple.Accessibility.SwitchControl", 0LL)) {
      NSLog(@"Had to update name of existing remote switch %@", v13);
    }
    v18 = (SCATActionItem *)[v9 mutableCopy];
    -[SCATActionItem removeObject:](v18, "removeObject:", v13);
    [v13 setRemoteDeviceName:v7];
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v10 switchDisplayName]);
    [v13 setName:v28];

    -[SCATActionItem addObject:](v18, "addObject:", v13);
    id v19 = (SCATActionItem *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    -[SCATActionItem setAssistiveTouchSwitches:](v19, "setAssistiveTouchSwitches:", v18);
  }

  else
  {
    if (CFPreferencesGetAppBooleanValue(@"IDCLog", @"com.apple.Accessibility.SwitchControl", 0LL)) {
      NSLog(@"Existing switches: %@", v9);
    }
    v18 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
    id v19 = objc_opt_new(&OBJC_CLASS___SCATActionItem);
    -[SCATInterDeviceInputSource _getActionIdentifier:longPressActionIdentifier:forSwitchEvent:]( self,  "_getActionIdentifier:longPressActionIdentifier:forSwitchEvent:",  v18,  v19,  v10);
    id v20 = -[SCATActionItem action](v18, "action");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v10 switchDisplayName]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  v20,  v21,  SCATSwitchSourceRemote,  SCATSwitchTypeOptional));

    objc_msgSend(v13, "setLongPressAction:", -[SCATActionItem action](v19, "action"));
    [v13 setRemoteDeviceName:v7];
    v22 = (void *)objc_claimAutoreleasedReturnValue([v10 switchIdentifier]);
    [v13 setRemoteSwitchIdentifier:v22];

    int64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceIdentifier]);
    [v13 setRemoteDeviceIdentifier:v23];

    id v24 = [v9 mutableCopy];
    [v24 addObject:v13];
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v25 setAssistiveTouchSwitches:v24];

    if (CFPreferencesGetAppBooleanValue(@"IDCLog", @"com.apple.Accessibility.SwitchControl", 0LL))
    {
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceIdentifier]);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v10 switchIdentifier]);
      NSLog( @"Created new remote switch for device identifier %@, switch identifier %@: %@",  v26,  v27,  v13,  v31,  v32,  v33,  v34);
    }
  }

LABEL_17:
  return v13;
}

- (void)handleReceivedSwitchEvent:(id)a3 deviceName:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v29 deviceIdentifier]);
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SCATInterDeviceInputSource _resolveSwitchForSwitchEvent:deviceName:]( self,  "_resolveSwitchForSwitchEvent:deviceName:",  v29,  v6));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SCATInterDeviceInputSource actionIdentifiersToRecipeMappingIndices]( self,  "actionIdentifiersToRecipeMappingIndices"));

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SCATInterDeviceInputSource actionIdentifiersToRecipeMappingIndices]( self,  "actionIdentifiersToRecipeMappingIndices"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]);

      if (v13)
      {
        id v14 = v13;
        id v15 = (void *)objc_claimAutoreleasedReturnValue( -[SCATInterDeviceInputSource longPressActionIdentifiersToRecipeMappingIndices]( self,  "longPressActionIdentifiersToRecipeMappingIndices"));
        int64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v16]);

        if (v17) {
          id v18 = v17;
        }
      }

      else
      {
        unsigned __int8 v17 = 0LL;
      }
    }

    else
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SCATActionItem fromSwitch:longPress:]( &OBJC_CLASS___SCATActionItem,  "fromSwitch:longPress:",  v9,  0LL));
      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue( +[SCATActionItem fromSwitch:longPress:]( &OBJC_CLASS___SCATActionItem,  "fromSwitch:longPress:",  v9,  1LL));
    }

    if ([v13 action])
    {
      BOOL v20 = 1LL;
    }

    else
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 shortcutIdentifier]);
      BOOL v20 = v21 != 0LL;
    }
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[SCATInterDeviceInputSource actionIdentifiersToRecipeMappingIndices]( self,  "actionIdentifiersToRecipeMappingIndices"));

    if (v19)
    {
      BOOL v20 = 0LL;
      unsigned __int8 v17 = 0LL;
      id v13 = 0LL;
    }

    else
    {
      if (CFPreferencesGetAppBooleanValue(@"IDCLog", @"com.apple.Accessibility.SwitchControl", 0LL)) {
        NSLog(@"No device identifier for the remote switch event, so we had to forward it without saving it.");
      }
      -[SCATInterDeviceInputSource _getActionIdentifier:longPressActionIdentifier:forSwitchEvent:]( self,  "_getActionIdentifier:longPressActionIdentifier:forSwitchEvent:",  0LL,  0LL,  v29);
      unsigned __int8 v17 = 0LL;
      id v13 = 0LL;
      BOOL v20 = 1LL;
    }
  }

  if (CFPreferencesGetAppBooleanValue(@"IDCLog", @"com.apple.Accessibility.SwitchControl", 0LL)) {
    NSLog(@"Should handle action: %i", v20);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
  unsigned int v23 = [v22 shouldForwardSwitchEventsForInputSource:self];

  if (v23) {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATInterDeviceInputSource.m",  198LL,  "-[SCATInterDeviceInputSource handleReceivedSwitchEvent:deviceName:]",  @"Should not be double-forwarding switches!");
  }
  if (v20)
  {
    id v24 = [v29 isDown];
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v29 switchIdentifier]);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v29 switchDisplayName]);
    -[SCATInputSource _handleAction:longPressAction:start:switchIdentifier:switchDisplayName:]( self,  "_handleAction:longPressAction:start:switchIdentifier:switchDisplayName:",  v13,  v17,  v24,  v25,  v26);
  }

  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInterDeviceInputSource inputDeviceHandledAction](self, "inputDeviceHandledAction"));

  if (v27)
  {
    __int128 v28 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[SCATInterDeviceInputSource inputDeviceHandledAction]( self,  "inputDeviceHandledAction"));
    v28[2](v28, v20);
  }
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource queue](self, "queue"));
  if (v10
    && (objc_opt_respondsToSelector(v9, "interDeviceInputSource:didReceiveActionWithIdentifier:start:ignoreInputHold:") & 1) != 0)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000793FC;
    v11[3] = &unk_100123840;
    id v12 = v9;
    id v13 = self;
    id v14 = v8;
    BOOL v15 = a4;
    BOOL v16 = a5;
    [v10 performAsynchronousWritingBlock:v11];
  }
}

- (id)inputDeviceHandledAction
{
  return self->_inputDeviceHandledAction;
}

- (void)setInputDeviceHandledAction:(id)a3
{
}

- (NSDictionary)actionIdentifiersToRecipeMappingIndices
{
  return self->_actionIdentifiersToRecipeMappingIndices;
}

- (void)setActionIdentifiersToRecipeMappingIndices:(id)a3
{
}

- (NSDictionary)longPressActionIdentifiersToRecipeMappingIndices
{
  return self->_longPressActionIdentifiersToRecipeMappingIndices;
}

- (void)setLongPressActionIdentifiersToRecipeMappingIndices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end