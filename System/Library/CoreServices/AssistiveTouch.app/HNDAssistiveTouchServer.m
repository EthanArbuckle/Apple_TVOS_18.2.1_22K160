@interface HNDAssistiveTouchServer
+ (id)sharedInstance;
- (AXIPCServer)server;
- (HNDAssistiveTouchServer)init;
- (SCATCursorManager)cursorManager;
- (id)_dictionaryElements;
- (id)_dictionaryElementsHandler:(id)a3;
- (id)_highlightDictionaryElementsHandler:(id)a3;
- (id)_homeHandler:(id)a3;
- (id)_lockHandler:(id)a3;
- (id)_longPressDictionaryElementHandler:(id)a3;
- (id)_pressDictionaryElementHandler:(id)a3;
- (id)_screenshotHandler:(id)a3;
- (id)_scrollDictionaryElementDownHandler:(id)a3;
- (id)_scrollDictionaryElementLeftHandler:(id)a3;
- (id)_scrollDictionaryElementRightHandler:(id)a3;
- (id)_scrollDictionaryElementToBottomHandler:(id)a3;
- (id)_scrollDictionaryElementToTopHandler:(id)a3;
- (id)_scrollDictionaryElementUpHandler:(id)a3;
- (id)_setDictionaryElementValueHandler:(id)a3;
- (id)_toggleMuteHandler:(id)a3;
- (id)_tripleHomeHandler:(id)a3;
- (id)_zoomInDictionaryElementHandler:(id)a3;
- (id)_zoomOutDictionaryElementHandler:(id)a3;
- (id)scatBackCursorUIContext;
- (id)scatBackCursorUIContextForDisplayID:(unsigned int)a3;
- (id)scatFrontCursorUIContext;
- (id)scatFrontCursorUIContextForDisplayID:(unsigned int)a3;
- (id)scatUIContext;
- (id)scatUIContextForDisplayID:(unsigned int)a3;
- (void)_enableHiddenNubbitMode:(BOOL)a3;
- (void)_enableServer:(BOOL)a3;
- (void)_highlightDictionaryElementsWithIndexes:(id)a3;
- (void)_home;
- (void)_lock;
- (void)_longPressDictionaryElementWithIndex:(unint64_t)a3;
- (void)_performAction:(int)a3 withIndex:(unint64_t)a4;
- (void)_pressDictionaryElementWithIndex:(unint64_t)a3;
- (void)_screenshot;
- (void)_scrollDictionaryElementWithIndex:(unint64_t)a3 direction:(int64_t)a4;
- (void)_scrollDictionaryElementWithIndex:(unint64_t)a3 position:(int64_t)a4;
- (void)_setDictionaryElementValueWithIndex:(unint64_t)a3 value:(id)a4;
- (void)_toggleMute;
- (void)_tripleHome;
- (void)_zoomDictionaryElementWithIndex:(unint64_t)a3 direction:(int64_t)a4;
- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5;
- (void)dealloc;
- (void)setCursorManager:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation HNDAssistiveTouchServer

- (id)_dictionaryElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  [v2 refreshElements];
  double v3 = CACurrentMediaTime();
  while ((([v2 isFetchingElements] & 1) != 0
        || [v2 willFetchElements])
       && CACurrentMediaTime() - v3 < 5.0)
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.25);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 elements]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005E428;
  v7[3] = &unk_1001239D0;
  v5 =  -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v4 count]);
  v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

- (void)_enableHiddenNubbitMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  [v5 updateAllSettings];
  -[HNDAssistiveTouchServer _enableServer:](self, "_enableServer:", v3);
}

- (void)_highlightDictionaryElementsWithIndexes:(id)a3
{
  id v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAssistiveTouchServer cursorManager](self, "cursorManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 elements]);
  if (v6 && [v10 count])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    id v8 = [v7 unsignedIntegerValue];

    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v8]);
    [v4 updateMainCursorWithElement:v9];
  }

  else
  {
    [v4 updateMainCursorWithElement:0];
  }
}

- (void)_home
{
  if ((sub_10002ADF4() & 1) == 0)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v2 activateHomeButton];
  }

- (void)_lock
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 activateLockButton];
}

- (void)_longPressDictionaryElementWithIndex:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v8 elements]);
  id v5 = v4;
  if (v4 && (unint64_t)[v4 count] > a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a3]);
    [v6 longPress];
  }

  else
  {
    char v7 = 1;
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v7,  @"AssistiveTouch could not long press element at unknown index: %lu");
  }
}

- (void)_performAction:(int)a3 withIndex:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v12 elements]);
  char v7 = v6;
  if (v6 && (unint64_t)[v6 count] > a4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:a4]);
  }

  else
  {
    id v9 = sub_10005EA08(0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  id v10 = v8;
  if (([v8 performAction:v5] & 1) == 0)
  {
    char v11 = 1;
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v11,  @"AssistiveTouch could not perform specified action on element at index: %lu");
  }
}

- (void)_pressDictionaryElementWithIndex:(unint64_t)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v8 elements]);
  uint64_t v5 = v4;
  if (v4 && (unint64_t)[v4 count] > a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a3]);
    [v6 press];
  }

  else
  {
    char v7 = 1;
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v7,  @"AssistiveTouch could not press element at unknown index: %lu");
  }
}

- (void)_screenshot
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 takeScreenshot];
}

- (void)_scrollDictionaryElementWithIndex:(unint64_t)a3 direction:(int64_t)a4
{
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v13 elements]);
  char v7 = v6;
  if (v6 && (unint64_t)[v6 count] > a3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:a3]);
  }

  else
  {
    id v9 = sub_10005EA08(kAXScrollableTrait);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  id v10 = v8;
  switch(a4)
  {
    case 0LL:
      uint64_t v11 = 2006LL;
      goto LABEL_11;
    case 1LL:
      uint64_t v11 = 2008LL;
      goto LABEL_11;
    case 2LL:
      uint64_t v11 = 2009LL;
      goto LABEL_11;
    case 3LL:
      uint64_t v11 = 2007LL;
LABEL_11:
      [v8 performAction:v11];
      break;
    default:
      char v12 = 1;
      _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v12,  @"AssistiveTouch could not scroll in unknown direction: %ld");
      break;
  }
}

- (void)_scrollDictionaryElementWithIndex:(unint64_t)a3 position:(int64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v6 currentApplication]);

  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 elements]);
  id v9 = v8;
  if (v8 && (unint64_t)[v8 count] > a3)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:a3]);
  }

  else
  {
    id v11 = sub_10005EA08(kAXScrollableTrait);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v11);
  }

  char v12 = (void *)v10;
  [v13 setAutoscrollTarget:v10];
  if (a4 == 1)
  {
    [v13 scrollToTop];
  }

  else if (a4)
  {
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"AssistiveTouch could not scroll to unknown page position: %ld");
  }

  else
  {
    [v13 scrollToBottom];
  }
}

- (void)_setDictionaryElementValueWithIndex:(unint64_t)a3 value:(id)a4
{
  id v5 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v12 elements]);
  char v7 = v6;
  if (v6 && (unint64_t)[v6 count] > a3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:a3]);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXElement systemWideElement](&OBJC_CLASS___AXElement, "systemWideElement"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 currentApplication]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 firstResponder]);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 uiElement]);
  [v11 setAXAttribute:2006 withString:v5];
}

- (void)_toggleMute
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 toggleMute];
}

- (void)_tripleHome
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
  [v2 activateTripleClick];
}

- (void)_zoomDictionaryElementWithIndex:(unint64_t)a3 direction:(int64_t)a4
{
  id v12 = (id)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v12 elements]);
  char v7 = v6;
  if (v6 && (unint64_t)[v6 count] > a3)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:a3]);
  }

  else
  {
    id v9 = sub_10005EA08(0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  uint64_t v10 = v8;
  if (a4 == 1)
  {
    uint64_t v11 = 2002LL;
  }

  else
  {
    if (a4)
    {
      _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"AssistiveTouch could not zoom in unknown direction: %ld");
      goto LABEL_11;
    }

    uint64_t v11 = 2001LL;
  }

  [v8 performAction:v11 withValue:0];
LABEL_11:
}

- (void)accessibilityManager:(id)a3 didReceiveEvent:(int64_t)a4 data:(id)a5
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[HNDAssistiveTouchServer cursorManager](self, "cursorManager", a3, a4, a5));
  [v5 updateMainCursorWithElement:0];
}

- (id)scatUIContext
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainDisplayManager]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scannerContentView]);

  return v4;
}

- (id)scatBackCursorUIContext
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainDisplayManager]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scannerBackCursorView]);

  return v4;
}

- (id)scatFrontCursorUIContext
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mainDisplayManager]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scannerFrontCursorView]);

  return v4;
}

- (id)scatUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 displayManagerForDisplayId:v3]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scannerContentView]);

  return v6;
}

- (id)scatFrontCursorUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 displayManagerForDisplayId:v3]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scannerFrontCursorView]);

  return v6;
}

- (id)scatBackCursorUIContextForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 displayManagerForDisplayId:v3]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scannerBackCursorView]);

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  [v3 removeObserver:self];

  -[HNDAssistiveTouchServer _enableHiddenNubbitMode:](self, "_enableHiddenNubbitMode:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HNDAssistiveTouchServer;
  -[HNDAssistiveTouchServer dealloc](&v4, "dealloc");
}

- (HNDAssistiveTouchServer)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___HNDAssistiveTouchServer;
  id v2 = -[HNDAssistiveTouchServer init](&v15, "init");
  if (v2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    -[HNDAssistiveTouchServer _enableHiddenNubbitMode:]( v2,  "_enableHiddenNubbitMode:",  [v3 assistiveTouchInternalOnlyHiddenNubbitModeEnabled]);
    objc_initWeak(&location, v2);
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    uint64_t v11 = sub_10005F4D4;
    id v12 = &unk_100121EE8;
    objc_copyWeak(&v13, &location);
    [v4 registerUpdateBlock:&v9 forRetrieveSelector:"assistiveTouchInternalOnlyHiddenNubbitModeEnabled" withListener:v2];

    objc_destroyWeak(&v13);
    id v5 = objc_alloc(&OBJC_CLASS___SCATCursorManager);
    v6 = -[SCATCursorManager initWithDisplaySource:](v5, "initWithDisplaySource:", v2, v9, v10, v11, v12);
    -[HNDAssistiveTouchServer setCursorManager:](v2, "setCursorManager:", v6);
    char v7 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
    [v7 addObserver:v2];

    objc_destroyWeak(&location);
  }

  return v2;
}

+ (id)sharedInstance
{
  if (qword_1001576E8 != -1) {
    dispatch_once(&qword_1001576E8, &stru_1001239F0);
  }
  return (id)qword_1001576E0;
}

- (void)_enableServer:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (AXIPCServer *)objc_claimAutoreleasedReturnValue(-[HNDAssistiveTouchServer server](self, "server"));
  v6 = v5;
  if (v3)
  {
    if (!v5)
    {
      char v7 = objc_alloc(&OBJC_CLASS___AXIPCServer);
      v6 = -[AXIPCServer initWithServiceName:perPidService:]( v7,  "initWithServiceName:perPidService:",  AXAssistiveTouchServerServiceName,  0LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_dictionaryElementsHandler:",  6000LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_highlightDictionaryElementsHandler:",  6001LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_homeHandler:",  6002LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_lockHandler:",  6003LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_longPressDictionaryElementHandler:",  6004LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_pressDictionaryElementHandler:",  6005LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_screenshotHandler:",  6006LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_scrollDictionaryElementDownHandler:",  6007LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_scrollDictionaryElementLeftHandler:",  6008LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_scrollDictionaryElementRightHandler:",  6009LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_scrollDictionaryElementToBottomHandler:",  6010LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_scrollDictionaryElementToTopHandler:",  6011LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_scrollDictionaryElementUpHandler:",  6012LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_setDictionaryElementValueHandler:",  6013LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_toggleMuteHandler:",  6014LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_tripleHomeHandler:",  6015LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_zoomInDictionaryElementHandler:",  6016LL);
      -[AXIPCServer setHandlerWithTarget:selector:forKey:]( v6,  "setHandlerWithTarget:selector:forKey:",  self,  "_zoomOutDictionaryElementHandler:",  6017LL);
      -[HNDAssistiveTouchServer setServer:](self, "setServer:", v6);
    }

    if ((-[AXIPCServer isRunning](v6, "isRunning") & 1) == 0)
    {
      id v14 = 0LL;
      unsigned __int8 v8 = -[AXIPCServer startServerWithError:](v6, "startServerWithError:", &v14);
      id v9 = v14;
      if ((v8 & 1) != 0) {
        _AXLogWithFacility( 2LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Started AssistiveTouch message server");
      }
      else {
        _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"AssistiveTouch could not start its message server: %@");
      }
    }

    id v12 = +[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager");
    goto LABEL_17;
  }

  if (-[AXIPCServer isRunning](v5, "isRunning"))
  {
    id v13 = 0LL;
    unsigned __int8 v10 = -[AXIPCServer stopServerWithError:](v6, "stopServerWithError:", &v13);
    id v11 = v13;
    if ((v10 & 1) != 0) {
      _AXLogWithFacility(2LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, 1, @"Stopped AssistiveTouch message server");
    }
    else {
      _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"AssistiveTouch could not stop its message server: %@");
    }
  }

  if (v6)
  {
    -[AXIPCServer removeAllHandlersForTarget:](v6, "removeAllHandlersForTarget:", self);
    -[HNDAssistiveTouchServer setServer:](self, "setServer:", 0LL);
LABEL_17:
  }

- (id)_dictionaryElementsHandler:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDAssistiveTouchServer _dictionaryElements](self, "_dictionaryElements", a3));
  uint64_t v7 = AXAssistiveTouchPayloadKeyDictionaryElements;
  unsigned __int8 v8 = v3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  id v5 = [[AXIPCMessage alloc] initWithKey:6000 payload:v4];

  return v5;
}

- (id)_highlightDictionaryElementsHandler:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndexes]);

  -[HNDAssistiveTouchServer _highlightDictionaryElementsWithIndexes:]( self,  "_highlightDictionaryElementsWithIndexes:",  v5);
  return 0LL;
}

- (id)_homeHandler:(id)a3
{
  return 0LL;
}

- (id)_lockHandler:(id)a3
{
  return 0LL;
}

- (id)_longPressDictionaryElementHandler:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex]);
  id v6 = [v5 unsignedIntegerValue];

  -[HNDAssistiveTouchServer _longPressDictionaryElementWithIndex:](self, "_longPressDictionaryElementWithIndex:", v6);
  return 0LL;
}

- (id)_pressDictionaryElementHandler:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex]);
  id v6 = [v5 unsignedIntegerValue];

  -[HNDAssistiveTouchServer _pressDictionaryElementWithIndex:](self, "_pressDictionaryElementWithIndex:", v6);
  return 0LL;
}

- (id)_screenshotHandler:(id)a3
{
  return 0LL;
}

- (id)_scrollDictionaryElementDownHandler:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex]);
  id v6 = [v5 unsignedIntegerValue];

  -[HNDAssistiveTouchServer _scrollDictionaryElementWithIndex:direction:]( self,  "_scrollDictionaryElementWithIndex:direction:",  v6,  0LL);
  return 0LL;
}

- (id)_scrollDictionaryElementLeftHandler:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex]);
  id v6 = [v5 unsignedIntegerValue];

  -[HNDAssistiveTouchServer _scrollDictionaryElementWithIndex:direction:]( self,  "_scrollDictionaryElementWithIndex:direction:",  v6,  1LL);
  return 0LL;
}

- (id)_scrollDictionaryElementRightHandler:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex]);
  id v6 = [v5 unsignedIntegerValue];

  -[HNDAssistiveTouchServer _scrollDictionaryElementWithIndex:direction:]( self,  "_scrollDictionaryElementWithIndex:direction:",  v6,  2LL);
  return 0LL;
}

- (id)_scrollDictionaryElementToBottomHandler:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex]);
  id v6 = [v5 unsignedIntegerValue];

  -[HNDAssistiveTouchServer _scrollDictionaryElementWithIndex:position:]( self,  "_scrollDictionaryElementWithIndex:position:",  v6,  0LL);
  return 0LL;
}

- (id)_scrollDictionaryElementToTopHandler:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex]);
  id v6 = [v5 unsignedIntegerValue];

  -[HNDAssistiveTouchServer _scrollDictionaryElementWithIndex:position:]( self,  "_scrollDictionaryElementWithIndex:position:",  v6,  1LL);
  return 0LL;
}

- (id)_scrollDictionaryElementUpHandler:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex]);
  id v6 = [v5 unsignedIntegerValue];

  -[HNDAssistiveTouchServer _scrollDictionaryElementWithIndex:direction:]( self,  "_scrollDictionaryElementWithIndex:direction:",  v6,  3LL);
  return 0LL;
}

- (id)_setDictionaryElementValueHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex]);
  id v7 = [v6 unsignedIntegerValue];

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 payload]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementValue]);

  -[HNDAssistiveTouchServer _setDictionaryElementValueWithIndex:value:]( self,  "_setDictionaryElementValueWithIndex:value:",  v7,  v9);
  return 0LL;
}

- (id)_toggleMuteHandler:(id)a3
{
  return 0LL;
}

- (id)_tripleHomeHandler:(id)a3
{
  return 0LL;
}

- (id)_zoomInDictionaryElementHandler:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex]);
  id v6 = [v5 unsignedIntegerValue];

  -[HNDAssistiveTouchServer _zoomDictionaryElementWithIndex:direction:]( self,  "_zoomDictionaryElementWithIndex:direction:",  v6,  0LL);
  return 0LL;
}

- (id)_zoomOutDictionaryElementHandler:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payload]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:AXAssistiveTouchPayloadKeyDictionaryElementIndex]);
  id v6 = [v5 unsignedIntegerValue];

  -[HNDAssistiveTouchServer _zoomDictionaryElementWithIndex:direction:]( self,  "_zoomDictionaryElementWithIndex:direction:",  v6,  1LL);
  return 0LL;
}

- (SCATCursorManager)cursorManager
{
  return self->_cursorManager;
}

- (void)setCursorManager:(id)a3
{
}

- (AXIPCServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end