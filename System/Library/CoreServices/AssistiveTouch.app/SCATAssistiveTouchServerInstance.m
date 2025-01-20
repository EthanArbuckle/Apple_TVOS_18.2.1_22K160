@interface SCATAssistiveTouchServerInstance
+ (id)serverInstance;
- (AXEventProcessor)eventProcessor;
- (BSInvalidatable)virtualMouseClient;
- (SCATAssistiveTouchServerInstance)init;
- (id)_initServer;
- (id)closeMenu:(id)a3;
- (id)getMenuItemPosition:(id)a3;
- (id)getNubbitPosition:(id)a3;
- (id)home:(id)a3;
- (id)isMenuOpen:(id)a3;
- (id)menuAction:(id)a3;
- (id)menuItems:(id)a3;
- (id)openMenu:(id)a3;
- (id)setNubbitPosition:(id)a3;
- (id)tapMenuItem:(id)a3;
- (void)dealloc;
- (void)setEventProcessor:(id)a3;
- (void)setVirtualMouseClient:(id)a3;
@end

@implementation SCATAssistiveTouchServerInstance

- (SCATAssistiveTouchServerInstance)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATAssistiveTouchServerInstance;
  return -[SCATAssistiveTouchServerInstance init](&v3, "init");
}

+ (id)serverInstance
{
  if (qword_1001576D8 != -1) {
    dispatch_once(&qword_1001576D8, &stru_100123950);
  }
  return (id)qword_1001576D0;
}

- (id)_initServer
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SCATAssistiveTouchServerInstance;
  v2 = -[SCATAssistiveTouchServerInstance init](&v14, "init");
  if (v2)
  {
    objc_super v3 = objc_alloc(&OBJC_CLASS___AXIPCServer);
    v4 = -[AXIPCServer initWithServiceName:perPidService:]( v3,  "initWithServiceName:perPidService:",  AXAssistiveTouchServerServiceName,  0LL);
    server = v2->_server;
    v2->_server = v4;

    v6 = v2->_server;
    id v13 = 0LL;
    -[AXIPCServer startServerWithError:](v6, "startServerWithError:", &v13);
    id v7 = v13;
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "home:",  6002LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "getNubbitPosition:",  6023LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "setNubbitPosition:",  6024LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "openMenu:",  6020LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "closeMenu:",  6021LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "isMenuOpen:",  6022LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "menuItems:",  6025LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "tapMenuItem:",  6026LL,  @"com.apple.accessibility.api",  0LL);
    -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "menuAction:",  6027LL,  @"com.apple.accessibility.api",  0LL);
    id v8 = -[AXIPCServer setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:]( v2->_server,  "setHandlerWithTarget:selector:forKey:possibleRequiredEntitlements:",  v2,  "getMenuItemPosition:",  6033LL,  @"com.apple.accessibility.api",  0LL);
    if (v7)
    {
      uint64_t v9 = ASTLogCommon(v8);
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000AEA18((uint64_t)v7, v10);
      }
    }

    v11 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATAssistiveTouchServerInstance;
  -[SCATAssistiveTouchServerInstance dealloc](&v3, "dealloc");
}

- (id)home:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance", a3));
  [v3 activateHomeButton];

  return [[AXIPCMessage alloc] initWithKey:6002 payload:&off_10012FCC0];
}

- (id)getNubbitPosition:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainDisplayManager]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rocker]);
  [v5 center];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  id v10 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  v16 = @"result";
  v15[0] = v7;
  v15[1] = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v15,  "{CGPoint=dd}"));
  v17 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  id v13 = [v10 initWithKey:6023 payload:v12];

  return v13;
}

- (id)setNubbitPosition:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"action"]);
  [v4 CGPointValue];
  double v6 = v5;
  double v8 = v7;

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mainDisplayManager]);

  objc_msgSend(v10, "moveNubbitToPoint:", v6, v8);
  id v11 = [[AXIPCMessage alloc] initWithKey:6024 payload:&off_10012FCE8];

  return v11;
}

- (id)openMenu:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainDisplayManager]);

  [v4 showMenu:1];
  id v5 = [[AXIPCMessage alloc] initWithKey:6020 payload:&__NSDictionary0__struct];

  return v5;
}

- (id)closeMenu:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainDisplayManager]);

  [v4 showMenu:0];
  id v5 = [[AXIPCMessage alloc] initWithKey:6021 payload:&__NSDictionary0__struct];

  return v5;
}

- (id)isMenuOpen:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainDisplayManager]);

  id v5 = [v4 isMenuVisible];
  id v6 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  id v11 = @"result";
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
  v12 = v7;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  id v9 = [v6 initWithKey:6022 payload:v8];

  return v9;
}

- (id)menuItems:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainDisplayManager]);

  v21 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rocker]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentlyVisibleRockerItems]);

  double v7 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
        objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v12 type]);
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@#%@",  v13,  v14));

        if (-[NSMutableString length](v7, "length")) {
          -[NSMutableString appendString:](v7, "appendString:", @"|");
        }
        -[NSMutableString appendString:](v7, "appendString:", v15);
      }

      id v9 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }

    while (v9);
  }

  id v16 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  v27 = @"result";
  id v17 = -[NSMutableString copy](v7, "copy");
  id v28 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  id v19 = [v16 initWithKey:6025 payload:v18];

  return v19;
}

- (id)tapMenuItem:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"action"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainDisplayManager]);

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 rocker]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentlyVisibleRockerItems]);

  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  id v19 = sub_100059CE8;
  v20 = &unk_100123978;
  id v21 = v4;
  id v9 = v4;
  id v10 = [v8 indexOfObjectPassingTest:&v17];
  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v10, v17, v18, v19, v20, v21));
    [v11 performPress:1];
    [v11 performPress:0];
  }

  id v12 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  v22 = @"result";
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  v10 != (id)0x7FFFFFFFFFFFFFFFLL));
  __int128 v23 = v13;
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
  id v15 = [v12 initWithKey:6026 payload:v14];

  return v15;
}

- (id)menuAction:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"action"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainDisplayManager]);

  [v6 activateAssistiveTouchAction:v4 fromButtonPress:0];
  id v7 = [[AXIPCMessage alloc] initWithKey:6027 payload:&off_10012FD10];

  return v7;
}

- (id)getMenuItemPosition:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"action"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mainDisplayManager]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 rocker]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentlyVisibleRockerItems]);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10005A060;
  v29[3] = &unk_100123978;
  id v30 = v5;
  id v10 = v5;
  id v11 = [v9 indexOfObjectPassingTest:v29];
  double v12 = -1.0;
  double v13 = -1.0;
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v11]);
    [v14 center];
    double v16 = v15;
    double v18 = v17;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v7 rocker]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v7 window]);
    objc_msgSend(v19, "convertPoint:toView:", v20, v16, v18);
    double v12 = v21;
    double v13 = v22;
  }

  id v23 = objc_alloc(&OBJC_CLASS___AXIPCMessage);
  v31 = @"result";
  *(double *)id v28 = v12;
  *(double *)&v28[1] = v13;
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSValue valueWithBytes:objCType:]( &OBJC_CLASS___NSValue,  "valueWithBytes:objCType:",  v28,  "{CGPoint=dd}"));
  v32 = v24;
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
  id v26 = [v23 initWithKey:6033 payload:v25];

  return v26;
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (BSInvalidatable)virtualMouseClient
{
  return self->_virtualMouseClient;
}

- (void)setVirtualMouseClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end