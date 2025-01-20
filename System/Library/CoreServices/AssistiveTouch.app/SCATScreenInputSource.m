@interface SCATScreenInputSource
- (BOOL)handledEvent:(id)a3;
- (NSString)switchDisplayName;
- (id)_actionIdentifierWithType:(id)a3;
- (unint64_t)priority;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_startHandlingEvents;
- (void)_stopHandlingEvents;
- (void)dealloc;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setSwitchDisplayName:(id)a3;
- (void)startRunning;
- (void)stopRunning;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATScreenInputSource

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource queue](self, "queue"));
  if (v10
    && (objc_opt_respondsToSelector(v9, "screenInputSource:didReceiveActionWithIdentifier:start:ignoreInputHold:") & 1) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000524EC;
    v12[3] = &unk_100123840;
    id v13 = v9;
    v14 = self;
    id v11 = v8;
    id v15 = v11;
    BOOL v16 = a4;
    BOOL v17 = a5;
    [v10 performAsynchronousWritingBlock:v12];
    HNDTestingSetLastFiredAction(v11);
  }
}

- (id)_actionIdentifierWithType:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);
  }

  else
  {
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Could not lookup action with nil actions");
    v7 = 0LL;
  }

  return v7;
}

- (BOOL)handledEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 type];
  if (v5 == 3001)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
    unsigned int v7 = [v6 eventType];

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 handInfo]);
    unsigned int v9 = [v8 eventType];

    if (v9 > 0xA || (int v10 = 1, ((1 << v9) & 0x640) == 0))
    {
      if (v7 != 1)
      {
        _AXSAutomationEnabled();
        goto LABEL_10;
      }

      int v10 = 0;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SCATScreenInputSource _actionIdentifierWithType:]( self,  "_actionIdentifierWithType:",  @"SwitchActionTypeNormal"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[SCATScreenInputSource _actionIdentifierWithType:]( self,  "_actionIdentifierWithType:",  @"SwitchActionTypeLongPress"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATScreenInputSource switchDisplayName](self, "switchDisplayName"));
    -[SCATInputSource _handleAction:longPressAction:start:switchIdentifier:switchDisplayName:]( self,  "_handleAction:longPressAction:start:switchIdentifier:switchDisplayName:",  v11,  v12,  v7 == 1,  @"FullScreen",  v13);

    int v14 = _AXSAutomationEnabled();
    if (v10 && v14) {
      UIAccessibilityPostNotification(0xFA2u, &off_10012FBF8);
    }
  }

- (unint64_t)priority
{
  return 1000LL;
}

- (void)_startHandlingEvents
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  [v3 addEventHandler:self];
}

- (void)_stopHandlingEvents
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  [v3 removeEventHandler:self];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATScreenInputSource;
  -[SCATScreenInputSource dealloc](&v3, "dealloc");
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATScreenInputSource;
  -[SCATInputSource setDelegate:queue:](&v4, "setDelegate:queue:", a3, a4);
}

- (void)startRunning
{
  if (!-[SCATInputSource isRunning](self, "isRunning"))
  {
    -[SCATScreenInputSource _startHandlingEvents](self, "_startHandlingEvents");
    -[SCATInputSource setRunning:](self, "setRunning:", 1LL);
  }

- (void)stopRunning
{
  if (-[SCATInputSource isRunning](self, "isRunning"))
  {
    -[SCATScreenInputSource _stopHandlingEvents](self, "_stopHandlingEvents");
    -[SCATInputSource setRunning:](self, "setRunning:", 0LL);
  }

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SCATScreenInputSource;
  id v7 = a3;
  -[SCATInputSource updateWithSwitches:recipe:](&v14, "updateWithSwitches:recipe:", v7, v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005299C;
  v10[3] = &unk_100123868;
  id v11 = v6;
  v12 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
  id v13 = self;
  id v8 = v12;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v10];

  -[SCATInputSource setActions:](self, "setActions:", v8);
}

- (NSString)switchDisplayName
{
  return self->_switchDisplayName;
}

- (void)setSwitchDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end