@interface SCATSwitchControlServerInstance
+ (id)serverInstance;
- (AXEventProcessor)eventProcessor;
- (BOOL)_handleRemoteSCATAction:(int64_t)a3;
- (id)_automationSwitches;
- (id)_initServer;
- (id)clearSpokenPhrases:(id)a3;
- (id)currentFocusedElement:(id)a3;
- (id)headTrackingPoint:(id)a3;
- (id)isAutoScanEnabled:(id)a3;
- (id)isDwellEnabled:(id)a3;
- (id)isManualScanEnabled:(id)a3;
- (id)isScannerActive:(id)a3;
- (id)isScannerPaused:(id)a3;
- (id)lastSpokenPhrases:(id)a3;
- (id)switchControlActionTriggered:(id)a3;
- (id)switchControlAutomationCommandTriggered:(id)a3;
- (void)_removeAutomationSwitches;
- (void)_setupAutomationSwitches;
- (void)dealloc;
- (void)setEventProcessor:(id)a3;
@end

@implementation SCATSwitchControlServerInstance

+ (id)serverInstance
{
  if (qword_1001575B8 != -1) {
    dispatch_once(&qword_1001575B8, &stru_100121CF0);
  }
  return (id)qword_1001575B0;
}

- (id)_initServer
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SCATSwitchControlServerInstance;
  v2 = -[SCATSwitchControlServerInstance init](&v16, "init");
  p_isa = (id *)&v2->super.isa;
  if (v2)
  {
    v2->_switchesLoadedForAutomation = 0;
    id v4 = +[SCATSwitchControlWorkspace sharedWorkspace](&OBJC_CLASS___SCATSwitchControlWorkspace, "sharedWorkspace");
    v5 = objc_alloc(&OBJC_CLASS___AXIPCServer);
    v6 = -[AXIPCServer initWithServiceName:perPidService:]( v5,  "initWithServiceName:perPidService:",  AXSwitchControlServerServiceName,  0LL);
    id v7 = p_isa[1];
    p_isa[1] = v6;

    id v8 = p_isa[1];
    id v15 = 0LL;
    [v8 startServerWithError:&v15];
    id v9 = v15;
    objc_msgSend( p_isa[1],  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  p_isa,  "switchControlActionTriggered:",  6500,  @"com.apple.accessibility.api",  0);
    objc_msgSend( p_isa[1],  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  p_isa,  "switchControlAutomationCommandTriggered:",  6509,  @"com.apple.accessibility.api",  0);
    objc_msgSend( p_isa[1],  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  p_isa,  "currentFocusedElement:",  6501,  @"com.apple.accessibility.api",  0);
    objc_msgSend( p_isa[1],  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  p_isa,  "isScannerActive:",  6507,  @"com.apple.accessibility.api",  0);
    objc_msgSend( p_isa[1],  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  p_isa,  "isScannerPaused:",  6508,  @"com.apple.accessibility.api",  0);
    objc_msgSend( p_isa[1],  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  p_isa,  "isAutoScanEnabled:",  6504,  @"com.apple.accessibility.api",  0);
    objc_msgSend( p_isa[1],  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  p_isa,  "isManualScanEnabled:",  6505,  @"com.apple.accessibility.api",  0);
    objc_msgSend( p_isa[1],  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  p_isa,  "isDwellEnabled:",  6506,  @"com.apple.accessibility.api",  0);
    objc_msgSend( p_isa[1],  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  p_isa,  "headTrackingPoint:",  6510,  @"com.apple.accessibility.api",  0);
    objc_msgSend( p_isa[1],  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  p_isa,  "lastSpokenPhrases:",  6503,  @"com.apple.accessibility.api",  0);
    id v10 = objc_msgSend( p_isa[1],  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  p_isa,  "clearSpokenPhrases:",  6511,  @"com.apple.accessibility.api",  0);
    if (v9)
    {
      uint64_t v11 = ASTLogCommon(v10);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000AEA18((uint64_t)v9, v12);
      }
    }

    v13 = p_isa;
  }

  return p_isa;
}

- (void)dealloc
{
  if (self->_switchesLoadedForAutomation) {
    -[SCATSwitchControlServerInstance _removeAutomationSwitches](self, "_removeAutomationSwitches");
  }
  -[AXIPCServer removeAllHandlersForTarget:](self->_server, "removeAllHandlersForTarget:", self);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATSwitchControlServerInstance;
  -[SCATSwitchControlServerInstance dealloc](&v3, "dealloc");
}

- (id)_automationSwitches
{
  uint64_t v2 = SCATSwitchSourceAutomation;
  uint64_t v3 = SCATSwitchTypeOptional;
  v24 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  100LL,  @"AX Activate",  SCATSwitchSourceAutomation,  SCATSwitchTypeOptional));
  v25[0] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  101LL,  @"AX Menu",  v2,  v3));
  v25[1] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  102LL,  @"AX Run",  v2,  v3));
  v25[2] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  103LL,  @"AX Select",  v2,  v3));
  v25[3] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  104LL,  @"AX Step Next",  v2,  v3));
  v25[4] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  105LL,  @"AX Step Previous",  v2,  v3));
  v25[5] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  106LL,  @"AX Stop",  v2,  v3));
  v25[6] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  107LL,  @"AX Siri Shortcuts",  v2,  v3));
  v25[7] = v17;
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  200LL,  @"AX App Switcher",  v2,  v3));
  v25[8] = v16;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  201LL,  @"AX Home",  v2,  v3));
  v25[9] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  202LL,  @"AX Notification Center",  v2,  v3));
  v25[10] = v14;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  203LL,  @"AX Siri",  v2,  v3));
  v25[11] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  204LL,  @"AX Volume Down",  v2,  v3));
  v25[12] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  205LL,  @"AX Volume Up",  v2,  v3));
  v25[13] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  206LL,  @"AX Force Touch",  v2,  v3));
  v25[14] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  207LL,  @"AX Dictation",  v2,  v3));
  v25[15] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  208LL,  @"AX Triple Click",  v2,  v3));
  v25[16] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  209LL,  @"AX Control Center",  v2,  v3));
  v25[17] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  210LL,  @"AX Escape",  v2,  v3));
  v25[18] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 19LL));

  return v12;
}

- (void)_setupAutomationSwitches
{
  if (!self->_switchesLoadedForAutomation)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSwitchControlServerInstance _automationSwitches](self, "_automationSwitches"));
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
          [v8 setAccessibilityEventUsagePage:5];
          objc_msgSend(v8, "setAccessibilityEventUsage:", objc_msgSend(v8, "action"));
          SCATAddOrUpdateSwitchToSettings(v8);
        }

        id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }

      while (v5);
    }

    self->_switchesLoadedForAutomation = 1;
  }

- (void)_removeAutomationSwitches
{
  if (self->_switchesLoadedForAutomation)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATSwitchControlServerInstance _automationSwitches](self, "_automationSwitches"));
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          SCATRemoveSwitchFromSettings(*(void *)(*((void *)&v8 + 1) + 8LL * (void)i));
        }

        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }

      while (v5);
    }

    self->_switchesLoadedForAutomation = 0;
  }

- (BOOL)_handleRemoteSCATAction:(int64_t)a3
{
  if (self->_switchesLoadedForAutomation)
  {
    self = (SCATSwitchControlServerInstance *)_AXSAutomationEnabled();
    if (!(_DWORD)self)
    {
      uint64_t v17 = ASTLogCommon(self);
      __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000AEABC(v9, v18, v19, v20, v21, v22, v23, v24);
      }
      goto LABEL_10;
    }

    uint64_t v4 = 5LL;
    if (a3)
    {
LABEL_4:
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation accessibilityEventRepresentationWithSender:usagePage:usage:]( &OBJC_CLASS___AXEventRepresentation,  "accessibilityEventRepresentationWithSender:usagePage:usage:",  2LL,  v4,  a3));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
      [v6 sendHIDSystemEvent:v5 senderID:0x8000000817319375];

      return 1;
    }
  }

  else
  {
    uint64_t v4 = 6LL;
    if (a3) {
      goto LABEL_4;
    }
  }

  uint64_t v8 = ASTLogCommon(self);
  __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000AEA8C(v9, v10, v11, v12, v13, v14, v15, v16);
  }
LABEL_10:

  return 0;
}

- (id)switchControlActionTriggered:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"action"]);
  signed int v6 = [v5 intValue];

  if (v6) {
    BOOL v7 = -[SCATSwitchControlServerInstance _handleRemoteSCATAction:](self, "_handleRemoteSCATAction:", v6);
  }
  else {
    BOOL v7 = 0LL;
  }
  id v8 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  uint64_t v13 = @"result";
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  uint64_t v14 = v9;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  id v11 = [v8 initWithKey:6500 payload:v10];

  return v11;
}

- (id)switchControlAutomationCommandTriggered:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"command"]);
  id v6 = [v5 integerValue];

  if (v6 == (id)1)
  {
    -[SCATSwitchControlServerInstance _removeAutomationSwitches](self, "_removeAutomationSwitches");
    goto LABEL_5;
  }

  if (!v6)
  {
    -[SCATSwitchControlServerInstance _setupAutomationSwitches](self, "_setupAutomationSwitches");
LABEL_5:
    uint64_t v8 = 1LL;
    goto LABEL_9;
  }

  uint64_t v9 = ASTLogCommon(v7);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000AEAEC(v10, v11, v12, v13, v14, v15, v16, v17);
  }

  uint64_t v8 = 0LL;
LABEL_9:
  id v18 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  uint64_t v23 = @"result";
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  uint64_t v24 = v19;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
  id v21 = [v18 initWithKey:6509 payload:v20];

  return v21;
}

- (id)currentFocusedElement:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SCATSwitchControlWorkspace sharedWorkspace]( &OBJC_CLASS___SCATSwitchControlWorkspace,  "sharedWorkspace",  a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentElement]);

  if (v4
    && ([v4 scatIsAXElement] & 1) != 0
    && (id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uiElement]),
        id v6 = [v5 axElement],
        v5,
        v6))
  {
    Data = (void *)_AXUIElementCreateData(v6);
    id v8 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
    uint64_t v12 = @"result";
    uint64_t v13 = Data;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v10 = [v8 initWithKey:6501 payload:v9];
  }

  else
  {
    id v10 = [[AXIPCMessage alloc] initWithKey:6501 payload:0];
  }

  return v10;
}

- (id)isScannerActive:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SCATSwitchControlWorkspace sharedWorkspace]( &OBJC_CLASS___SCATSwitchControlWorkspace,  "sharedWorkspace",  a3));
  id v4 = [v3 isScannerActive];

  id v5 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v10 = @"result";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  uint64_t v11 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v8 = [v5 initWithKey:6507 payload:v7];

  return v8;
}

- (id)isScannerPaused:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SCATSwitchControlWorkspace sharedWorkspace]( &OBJC_CLASS___SCATSwitchControlWorkspace,  "sharedWorkspace",  a3));
  id v4 = [v3 isScannerPaused];

  id v5 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v10 = @"result";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  uint64_t v11 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v8 = [v5 initWithKey:6508 payload:v7];

  return v8;
}

- (id)isAutoScanEnabled:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SCATSwitchControlWorkspace sharedWorkspace]( &OBJC_CLASS___SCATSwitchControlWorkspace,  "sharedWorkspace",  a3));
  BOOL v4 = [v3 scannerType] == 0;

  id v5 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v10 = @"result";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  uint64_t v11 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v8 = [v5 initWithKey:6504 payload:v7];

  return v8;
}

- (id)isManualScanEnabled:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SCATSwitchControlWorkspace sharedWorkspace]( &OBJC_CLASS___SCATSwitchControlWorkspace,  "sharedWorkspace",  a3));
  BOOL v4 = [v3 scannerType] == 1;

  id v5 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v10 = @"result";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  uint64_t v11 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v8 = [v5 initWithKey:6505 payload:v7];

  return v8;
}

- (id)isDwellEnabled:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SCATSwitchControlWorkspace sharedWorkspace]( &OBJC_CLASS___SCATSwitchControlWorkspace,  "sharedWorkspace",  a3));
  BOOL v4 = [v3 scannerType] == 2;

  id v5 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v10 = @"result";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  uint64_t v11 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v8 = [v5 initWithKey:6506 payload:v7];

  return v8;
}

- (id)headTrackingPoint:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SCATSwitchControlWorkspace sharedWorkspace]( &OBJC_CLASS___SCATSwitchControlWorkspace,  "sharedWorkspace",  a3));
  [v3 headTrackingPoint];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](&OBJC_CLASS___NSValue, "valueWithPoint:"));

  id v5 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  uint64_t v9 = @"result";
  id v10 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  id v7 = [v5 initWithKey:6510 payload:v6];

  return v7;
}

- (id)lastSpokenPhrases:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recentSpeechOutputStrings]);

  id v5 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v6 = v5;
  if (v4)
  {
    uint64_t v12 = @"result";
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 recentSpeechOutputStrings]);
    id v8 = [v7 copy];
    id v13 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    id v10 = [v6 initWithKey:6503 payload:v9];
  }

  else
  {
    id v10 = [v5 initWithKey:6503 payload:0];
  }

  return v10;
}

- (id)clearSpokenPhrases:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager", a3));
  [v3 clearRecentSpeech];
  id v4 = [[AXIPCMessage alloc] initWithKey:6503 payload:0];

  return v4;
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end