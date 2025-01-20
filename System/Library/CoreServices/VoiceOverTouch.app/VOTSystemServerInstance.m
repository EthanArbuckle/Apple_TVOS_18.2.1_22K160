@interface VOTSystemServerInstance
+ (id)serverInstance;
- (id)_initServer;
- (id)currentCursorFrame:(id)a3;
- (id)currentRotorName:(id)a3;
- (id)isBluetoothBrailleDisplayConnected:(id)a3;
- (id)isBrailleInputUIShowing:(id)a3;
- (id)isBrailleScreenInputInScreenAwayMode:(id)a3;
- (id)isHandwritingInputUIShowing:(id)a3;
- (id)isScreenCurtainEnabled:(id)a3;
- (id)lastScreenChange:(id)a3;
- (id)lastSoundsPlayed:(id)a3;
- (id)lastSpokenContents:(id)a3;
- (id)lastSpokenPhrases:(id)a3;
- (id)tutorialRecognizedGesture:(id)a3;
- (id)voiceOverCommandTriggered:(id)a3;
- (id)voiceOverCurrentFocusedElement:(id)a3;
- (id)voiceOverEventCommandTriggered:(id)a3;
- (id)voiceOverGestureTriggered:(id)a3;
- (void)_modifyRotorItems:(id)a3 shouldEnable:(BOOL)a4;
- (void)_updateRotorsForElementWithErrorMessage:(id *)a3;
- (void)dealloc;
- (void)handleAutomationTestingCommand:(id)a3 completion:(id)a4;
- (void)voiceOverTutorialEventCommandTriggered:(id)a3;
@end

@implementation VOTSystemServerInstance

+ (id)serverInstance
{
  if (qword_1001AD070 != -1) {
    dispatch_once(&qword_1001AD070, &stru_10017A108);
  }
  return (id)qword_1001AD068;
}

- (id)_initServer
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___VOTSystemServerInstance;
  v2 = -[VOTSystemServerInstance init](&v11, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___AXIPCServer);
    v4 = -[AXIPCServer initWithServiceName:perPidService:]( v3,  "initWithServiceName:perPidService:",  AXVoiceOverServerServiceName,  0LL);
    server = v2->_server;
    v2->_server = v4;

    v6 = v2->_server;
    id v10 = 0LL;
    -[AXIPCServer startServerWithError:](v6, "startServerWithError:", &v10);
    id v7 = v10;
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "voiceOverCommandTriggered:",  7000LL,  @"com.apple.accessibility.BackBoard",  @"com.apple.accessibility.api",  @"com.apple.accessibility.AccessibilityUIServer",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "voiceOverGestureTriggered:",  7010LL,  @"com.apple.accessibility.BackBoard",  @"com.apple.accessibility.api",  @"com.apple.accessibility.AccessibilityUIServer",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "voiceOverEventCommandTriggered:",  7013LL,  @"com.apple.accessibility.BackBoard",  @"com.apple.accessibility.api",  @"com.apple.accessibility.AccessibilityUIServer",  @"com.apple.AXUIViewService",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "voiceOverCurrentFocusedElement:",  7001LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "lastSpokenPhrases:",  7002LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "lastSpokenContents:",  7008LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "lastSoundsPlayed:",  7005LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "currentRotorName:",  7003LL,  @"com.apple.accessibility.api",  @"com.apple.AXUIViewService",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "lastScreenChange:",  7004LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "isBrailleInputUIShowing:",  7006LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "isHandwritingInputUIShowing:",  7009LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "isScreenCurtainEnabled:",  7012LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "isBluetoothBrailleDisplayConnected:",  7011LL,  @"com.apple.accessibility.SpringBoard",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:async:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:async:forKey:possibleRequiredEntitlements:",  v2,  "handleAutomationTestingCommand:completion:",  1LL,  7007LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "tutorialRecognizedGesture:",  7014LL,  @"com.apple.accessibility.api",  @"com.apple.AXUIViewService",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "isBrailleScreenInputInScreenAwayMode:",  7015LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "currentCursorFrame:",  7016LL,  @"com.apple.accessibility.api",  0LL);
    if (v7) {
      NSLog(@"error: %@", v7);
    }
    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTSystemServerInstance;
  -[VOTSystemServerInstance dealloc](&v3, "dealloc");
}

- (id)lastScreenChange:(id)a3
{
  id v3 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  v8 = @"result";
  v4 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace lastScreenChangeTime]);
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  id v6 = [v3 initWithKey:7004 payload:v5];

  return v6;
}

- (id)lastSoundsPlayed:(id)a3
{
  id v3 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  v8 = @"result";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputManager previousSoundsPlayed](&OBJC_CLASS___VOTOutputManager, "previousSoundsPlayed"));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  id v6 = [v3 initWithKey:7005 payload:v5];

  return v6;
}

- (id)lastSpokenPhrases:(id)a3
{
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[VOTOutputRequest previousRequests](&OBJC_CLASS___VOTOutputRequest, "previousRequests"));
  id v3 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        v8 = (void *)objc_claimAutoreleasedReturnValue([v6 outputActions]);
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v23;
          do
          {
            for (j = 0LL; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)j);
              v14 = (void *)objc_claimAutoreleasedReturnValue([v13 string]);
              if ([v14 length] && !objc_msgSend(v13, "component"))
              {
                if ([v7 length]) {
                  [v7 appendString:@" "];
                }
                [v7 appendString:v14];
              }
            }

            id v10 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
          }

          while (v10);
        }

        [v21 axSafelyAddObject:v7];
      }

      id v4 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    }

    while (v4);
  }

  id v15 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  v30 = @"result";
  v31 = v21;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
  id v17 = [v15 initWithKey:7002 payload:v16];

  return v17;
}

- (id)lastSpokenContents:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VOTOutputRequest previousRequests](&OBJC_CLASS___VOTOutputRequest, "previousRequests", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v8) dictionaryRepresentation]);
        [v3 addObject:v9];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v6);
  }

  id v10 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  v18 = @"result";
  v19 = v3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  id v12 = [v10 initWithKey:7008 payload:v11];

  return v12;
}

- (id)currentRotorName:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)VOTSharedWorkspace, "currentElement", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace elementManager]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 elementRotor]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentRotorElement]);
  unsigned __int8 v8 = [v4 isEqual:v7];

  if ((v8 & 1) == 0) {
    -[VOTSystemServerInstance _updateRotorsForElementWithErrorMessage:]( self,  "_updateRotorsForElementWithErrorMessage:",  0LL);
  }
  id v9 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  __int128 v14 = @"result";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([(id)VOTSharedWorkspace currentElementRotorString]);
  __int128 v15 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
  id v12 = [v9 initWithKey:7001 payload:v11];

  return v12;
}

- (id)voiceOverCurrentFocusedElement:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)VOTSharedWorkspace, "currentElement", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uiElement]);
  id v5 = [v4 axElement];

  if (v5)
  {
    Data = (void *)_AXUIElementCreateData(v5);
    id v7 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
    uint64_t v11 = @"result";
    id v12 = Data;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    id v9 = [v7 initWithKey:7001 payload:v8];
  }

  else
  {
    id v9 = [[AXIPCMessage alloc] initWithKey:7001 payload:0];
  }

  return v9;
}

- (id)voiceOverGestureTriggered:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"gesture"]);

  *(void *)&double v6 = objc_opt_class(&OBJC_CLASS___VOSGesture, v5).n128_u64[0];
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v7,  v4,  0LL,  v6));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userCommandManager]);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[VOSCommandResolver resolverForCurrentHost]( &OBJC_CLASS___VOSCommandResolver,  "resolverForCurrentHost"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 eventForTouchGesture:v8 resolver:v11]);

    [(id)VOTSharedWorkspace dispatchCommand:v12];
  }

  id v13 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  v18 = @"result";
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8 != 0LL));
  v19 = v14;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  id v16 = [v13 initWithKey:7010 payload:v15];

  return v16;
}

- (void)voiceOverTutorialEventCommandTriggered:(id)a3
{
  id v24 = a3;
  if ([v24 isEqualToString:@"VO.Tutorial.Activate"])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 elementManager]);
    uint64_t v5 = v4;
    uint64_t v6 = 1LL;
LABEL_5:
    [v4 setTutorialListeningForGestureNotifications:v6];
    goto LABEL_6;
  }

  if ([v24 isEqualToString:@"VO.Tutorial.Deactivate"])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 elementManager]);
    uint64_t v5 = v4;
    uint64_t v6 = 0LL;
    goto LABEL_5;
  }

  unsigned int v7 = [v24 isEqualToString:@"VO.Tutorial.Reset"];
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 elementManager]);
  id v10 = v9;
  if (v7)
  {
    [v9 setTutorialActiveRestrictionType:0];

    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 elementManager]);
    [v5 setTutorialRestrictedCommands:0];
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 tutorialRestrictedCommands]);

    if (!v11)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 elementManager]);
      __int128 v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      [v13 setTutorialRestrictedCommands:v14];
    }

    if ([v24 containsString:@"VO.Tutorial.Deny"])
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "substringFromIndex:", objc_msgSend(@"VO.Tutorial.Deny", "length")));
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 elementManager]);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 tutorialRestrictedCommands]);
      [v17 addObject:v3];

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v5 elementManager]);
      v19 = v18;
      uint64_t v20 = 1LL;
    }

    else
    {
      if (![v24 containsString:@"VO.Tutorial.Allow"])
      {
        id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 elementManager]);
        [v5 setTutorialPage:v24];
        goto LABEL_6;
      }

      id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "substringFromIndex:", objc_msgSend(@"VO.Tutorial.Allow", "length")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 elementManager]);
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 tutorialRestrictedCommands]);
      [v23 addObject:v3];

      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v5 elementManager]);
      v19 = v18;
      uint64_t v20 = 2LL;
    }

    [v18 setTutorialActiveRestrictionType:v20];
  }

- (id)voiceOverEventCommandTriggered:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"eventCommand"]);

  if ([v5 containsString:@"VO.Tutorial"])
  {
    -[VOTSystemServerInstance voiceOverTutorialEventCommandTriggered:]( self,  "voiceOverTutorialEventCommandTriggered:",  v5);
    id v6 = [[AXIPCMessage alloc] initWithKey:7013 payload:&off_100189040];
  }

  else
  {
    id v7 = [v5 length];
    if (v7)
    {
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent systemServerEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "systemServerEventWithCommand:info:",  v5,  0LL));
      [(id)VOTSharedWorkspace dispatchCommand:v8];
    }

    id v9 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
    id v13 = @"result";
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7 != 0LL));
    __int128 v14 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v6 = [v9 initWithKey:7013 payload:v11];
  }

  return v6;
}

- (id)voiceOverCommandTriggered:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 payload]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"command"]);
  uint64_t v6 = (int)[v5 intValue];

  id v7 = [objc_allocWithZone(AXIndexMap) init];
  _AXLogWithFacility(3LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, 1, @"Got command %d");
  uint64_t v8 = 0LL;
  id v9 = 0LL;
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  id v12 = 0LL;
  switch(v6)
  {
    case 1LL:
    case 49LL:
      id v13 = (id *)&kVOTEventCommandToggleMute;
      goto LABEL_70;
    case 2LL:
      id v13 = (id *)&kVOTEventCommandToggleScreenCurtain;
      goto LABEL_70;
    case 3LL:
      id v13 = (id *)&kVOTEventCommandScrollUpPage;
      goto LABEL_70;
    case 4LL:
      id v13 = (id *)&kVOTEventCommandScrollDownPage;
      goto LABEL_70;
    case 5LL:
      id v13 = (id *)&kVOTEventCommandScrollLeftPage;
      goto LABEL_70;
    case 6LL:
      id v13 = (id *)&kVOTEventCommandScrollRightPage;
      goto LABEL_70;
    case 7LL:
      id v13 = (id *)&kVOTEventCommandOutputElementSummary;
      goto LABEL_70;
    case 8LL:
      id v13 = (id *)&kVOTEventCommandPreviousElement;
      goto LABEL_70;
    case 9LL:
      id v13 = (id *)&kVOTEventCommandNextElement;
      goto LABEL_70;
    case 10LL:
      id v13 = (id *)&kVOTEventCommandFirstElement;
      goto LABEL_70;
    case 11LL:
      id v13 = (id *)&kVOTEventCommandLastElement;
      goto LABEL_70;
    case 12LL:
      id v13 = (id *)&kVOTEventCommandMoveToStatusBar;
      goto LABEL_70;
    case 13LL:
      id v13 = (id *)&kVOTEventCommandEscape;
      goto LABEL_70;
    case 14LL:
      id v13 = (id *)&kVOTEventCommandSearchRotorRight;
      goto LABEL_70;
    case 15LL:
      id v13 = (id *)&kVOTEventCommandSearchRotorLeft;
      goto LABEL_70;
    case 16LL:
      id v13 = (id *)&kVOTEventCommandSearchRotorUp;
      goto LABEL_70;
    case 17LL:
      id v13 = (id *)&kVOTEventCommandSearchRotorDown;
      goto LABEL_70;
    case 18LL:
      id v13 = (id *)&kVOTEventCommandItemChooser;
      goto LABEL_70;
    case 19LL:
      id v13 = (id *)&kVOTEventCommandSimpleTap;
      goto LABEL_70;
    case 20LL:
      id v13 = (id *)&kVOTEventCommandPauseSpeaking;
      goto LABEL_70;
    case 21LL:
      id v13 = (id *)&kVOTEventCommandToggleCrownNaviation;
      goto LABEL_70;
    case 22LL:
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[VOTKeyboardManager keyboardManager](&OBJC_CLASS___VOTKeyboardManager, "keyboardManager"));
      unsigned int v15 = [v14 isQuickNavOn];

      if (!v15) {
        goto LABEL_51;
      }
      goto LABEL_26;
    case 23LL:
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[VOTKeyboardManager keyboardManager](&OBJC_CLASS___VOTKeyboardManager, "keyboardManager"));
      unsigned __int8 v17 = [v16 isQuickNavOn];

      if ((v17 & 1) != 0) {
        goto LABEL_51;
      }
LABEL_26:
      id v13 = (id *)&kVOTEventCommandToggleQuickNav;
      goto LABEL_70;
    case 24LL:
      v18 = (void *)objc_claimAutoreleasedReturnValue([v3 payload]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"argument"]);

      if ([v19 count] != (id)2) {
        goto LABEL_34;
      }
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:0]);
      [v20 pointValue];
      double x = v21;
      double y = v22;

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:1]);
      __int128 v23 = (id *)&kVOTEventCommandTouchDown;
      goto LABEL_33;
    case 25LL:
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v3 payload]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"argument"]);

      if ([v19 count] != (id)2) {
        goto LABEL_34;
      }
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:0]);
      [v25 pointValue];
      double x = v26;
      double y = v27;

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:1]);
      __int128 v23 = (id *)&kVOTEventCommandTouchMove;
      goto LABEL_33;
    case 26LL:
      __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v3 payload]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"argument"]);

      if ([v19 count] == (id)1)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:0]);
        __int128 v23 = (id *)&kVOTEventCommandTouchUp;
LABEL_33:
        id v12 = *v23;

LABEL_38:
        id v30 = [objc_allocWithZone(AXIndexMap) init];
        [v30 setObject:v9 forIndex:114];
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[VOTEvent systemServerEventWithCommand:info:]( &OBJC_CLASS___VOTEvent,  "systemServerEventWithCommand:info:",  v12,  v30));
        objc_msgSend(v31, "setTouchPoint:", x, y);
        [(id)VOTSharedWorkspace dispatchCommand:v31];

        goto LABEL_72;
      }

- (void)_updateRotorsForElementWithErrorMessage:(id *)a3
{
  dispatch_time_t v4 = dispatch_time(0LL, 2000000000LL);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 elementManager]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000E1B64;
  v10[3] = &unk_100176D38;
  dispatch_semaphore_t v11 = v5;
  uint64_t v8 = v5;
  [v7 updateRotorForCurrentElement:1 completion:v10];

  uint64_t v9 = dispatch_semaphore_wait(v8, v4);
  if (a3 && v9) {
    *a3 = @"ElementManager timeout occurred";
  }
}

- (void)handleAutomationTestingCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v50[0] = 0LL;
  v50[1] = v50;
  v50[2] = 0x2020000000LL;
  char v51 = 0;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000E1E90;
  v47[3] = &unk_10017A130;
  id v49 = v50;
  id v7 = a4;
  id v48 = v7;
  uint64_t v8 = objc_retainBlock(v47);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_1000E1F28;
  v44[3] = &unk_10017A158;
  id v46 = v50;
  id v9 = v7;
  id v45 = v9;
  id v10 = objc_retainBlock(v44);
  dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"timeout"]);
  [v12 doubleValue];
  double v14 = v13;

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"command"]);
  id v17 = [v16 integerValue];
  v31 = v9;
  v18 = v8;

  v19 = (void *)objc_claimAutoreleasedReturnValue([v6 payload]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"userInfo"]);

  dispatch_time_t v21 = dispatch_time(0LL, (uint64_t)(v14 * 1000000000.0));
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = sub_1000E200C;
  v42 = sub_1000E201C;
  id v43 = 0LL;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  id v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E2024;
  block[3] = &unk_10017A180;
  id v37 = v17;
  id v25 = v20;
  id v36 = &v38;
  id v33 = v25;
  v34 = self;
  double v26 = v22;
  v35 = v26;
  dispatch_async(v24, block);

  if (dispatch_semaphore_wait(v26, v21))
  {
    double v27 = @"Timeout occurred";
    __int128 v28 = v10;
    __int128 v29 = v10;
  }

  else
  {
    uint64_t v30 = v39[5];
    __int128 v28 = v10;
    if (v30) {
      __int128 v29 = v10;
    }
    else {
      __int128 v29 = v18;
    }
    if (v30) {
      double v27 = (const __CFString *)v39[5];
    }
    else {
      double v27 = (const __CFString *)&__NSDictionary0__struct;
    }
  }

  ((void (*)(void *, const __CFString *))v29[2])(v29, v27);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v50, 8);
}

- (id)isBrailleInputUIShowing:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace", a3));
  id v4 = [v3 brailleInputActive];

  id v5 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v10 = @"result";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  dispatch_semaphore_t v11 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v8 = [v5 initWithKey:7006 payload:v7];

  return v8;
}

- (id)isHandwritingInputUIShowing:(id)a3
{
  id v3 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v8 = @"result";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  id v9 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  id v6 = [v3 initWithKey:7009 payload:v5];

  return v6;
}

- (id)isScreenCurtainEnabled:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace", a3));
  id v4 = [v3 screenCurtainEnabled];

  id v5 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v10 = @"result";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  dispatch_semaphore_t v11 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v8 = [v5 initWithKey:7012 payload:v7];

  return v8;
}

- (id)isBluetoothBrailleDisplayConnected:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTBrailleManager manager](&OBJC_CLASS___VOTBrailleManager, "manager", a3));
  id v4 = [v3 bluetoothBrailleDisplayConnected];

  id v5 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v10 = @"result";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  dispatch_semaphore_t v11 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v8 = [v5 initWithKey:7011 payload:v7];

  return v8;
}

- (id)tutorialRecognizedGesture:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 elementManager]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tutorialRecognizedGesture]);

  id v10 = v5;
  dispatch_semaphore_t v11 = @"result";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  id v12 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));

  id v8 = [[AXIPCMessage alloc] initWithKey:7014 payload:v7];
  return v8;
}

- (id)isBrailleScreenInputInScreenAwayMode:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTWorkspace sharedWorkspace](&OBJC_CLASS___VOTWorkspace, "sharedWorkspace", a3));
  BOOL v4 = [v3 brailleInputTypingMode] == 0;

  id v5 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v10 = @"result";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  dispatch_semaphore_t v11 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  id v8 = [v5 initWithKey:7015 payload:v7];

  return v8;
}

- (id)currentCursorFrame:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTDisplayManager displayManager](&OBJC_CLASS___VOTDisplayManager, "displayManager", a3));
  [v3 currentCursorFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  id v12 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  v18 = @"result";
  v20.origin.double x = v5;
  v20.origin.double y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  double v13 = NSStringFromCGRect(v20);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v19 = v14;
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  id v16 = [v12 initWithKey:7016 payload:v15];

  return v16;
}

- (void).cxx_destruct
{
}

- (void)_modifyRotorItems:(id)a3 shouldEnable:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 voiceOverRotorItems]);

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v14 = [v13 mutableCopy];
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"RotorItem"]);
        if (([v5 containsObject:v15] & 1) != 0
          || [v5 containsObject:@"all"])
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
          [v14 setObject:v16 forKeyedSubscript:@"Enabled"];
        }

        [v6 addObject:v14];
      }

      id v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v10);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v17 setVoiceOverRotorItems:v6];
}

@end