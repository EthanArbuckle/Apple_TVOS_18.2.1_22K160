@interface AXTouchAccommodationsUIServer
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
+ (id)sharedInstance;
- (AXDispatchTimer)usageConfirmationTimeoutTimer;
- (AXTouchAccommodationsEventProcessor)eventProcessor;
- (AXTouchAccommodationsUIServer)init;
- (AXTouchAccommodationsViewController)viewController;
- (CGPoint)pointWithRespectToSceneReferenceSpace:(CGPoint)a3;
- (NSString)holdDurationTripleClickHelpAlertIdentifier;
- (NSString)touchAccommodationsAlertIdentifier;
- (UIViewController)preventBackgroundViewController;
- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4;
- (id)_getPointsArrayFromPathInfoArray:(id)a3;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)_addTouchAccommodationsSceneController:(BOOL)a3;
- (void)_disableTouchAccommodations;
- (void)_enableTouchAccommodations;
- (void)_handleUsageConfirmation;
- (void)_hideContentViewController;
- (void)_showBannerWithText:(id)a3 andSubtitleText:(id)a4;
- (void)_showContentViewController;
- (void)_suspendOrResumeTouchAccommodationsAsNeeded;
- (void)_zoomToggledShowController;
- (void)dealloc;
- (void)didStopTimersInEventProcessor:(id)a3;
- (void)eventProcessor:(id)a3 didResetTouchAccommodationsProgressAtPathInfos:(id)a4;
- (void)eventProcessor:(id)a3 didUpdateTouchAccommodationsAtPathInfos:(id)a4;
- (void)panickedHoldDurationInEventProcessor:(id)a3;
- (void)setEventProcessor:(id)a3;
- (void)setHoldDurationTripleClickHelpAlertIdentifier:(id)a3;
- (void)setPreventBackgroundViewController:(id)a3;
- (void)setTouchAccommodationsAlertIdentifier:(id)a3;
- (void)setUsageConfirmationTimeoutTimer:(id)a3;
- (void)setViewController:(id)a3;
- (void)willStartTimersInEventProcessor:(id)a3;
@end

@implementation AXTouchAccommodationsUIServer

+ (id)sharedInstance
{
  if (qword_116F8 != -1) {
    dispatch_once(&qword_116F8, &stru_C380);
  }
  return (id)qword_116F0;
}

- (AXTouchAccommodationsUIServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AXTouchAccommodationsUIServer;
  v2 = -[AXTouchAccommodationsUIServer init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___AXTouchAccommodationsEventProcessor);
    -[AXTouchAccommodationsEventProcessor setDelegate:](v3, "setDelegate:", v2);
    -[AXTouchAccommodationsUIServer setEventProcessor:](v2, "setEventProcessor:", v3);
    v4 = objc_alloc_init(&OBJC_CLASS___AXTouchAccommodationsViewController);
    -[AXTouchAccommodationsUIServer setViewController:](v2, "setViewController:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:v2 selector:"_suspendOrResumeTouchAccommodationsAsNeeded" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:v2 selector:"_zoomToggledShowController" name:kAXSZoomTouchEnabledNotification object:0];
  }

  return v2;
}

- (void)_suspendOrResumeTouchAccommodationsAsNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v4 = [v3 touchAccommodationsEnabled];

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_158C;
    v5[3] = &unk_C3A8;
    v5[4] = self;
    AXPerformBlockOnMainThreadAfterDelay(v5, 0.25);
  }

- (void)_zoomToggledShowController
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v4 = [v3 touchAccommodationsEnabled];

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_16F8;
    v5[3] = &unk_C3A8;
    v5[4] = self;
    AXPerformBlockAsynchronouslyOnMainThread(v5);
  }

- (void)_showBannerWithText:(id)a3 andSubtitleText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( [v9 showAlertWithText:v7 subtitleText:v6 iconImage:0 type:2 priority:30 duration:self forService:AXUIAlertDisplayTimeDefaultForBanners]);

  -[AXTouchAccommodationsUIServer setTouchAccommodationsAlertIdentifier:]( self,  "setTouchAccommodationsAlertIdentifier:",  v8);
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsUIServer eventProcessor](self, "eventProcessor"));
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AXTouchAccommodationsUIServer;
  -[AXTouchAccommodationsUIServer dealloc](&v4, "dealloc");
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  id v8 = -[AXTouchAccommodationsUIServer setTouchAccommodationsAlertIdentifier:]( self,  "setTouchAccommodationsAlertIdentifier:",  0LL,  a4,  a5,  a6);
  switch(a4)
  {
    case 1uLL:
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      if ([v9 touchAccommodationsAreConfigured])
      {
        uint64_t v10 = AXLocStringKeyForHomeButtonAndExclusiveModel(1LL, @"TOGGLE-USING-TRIPLE-CLICK");
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        id v12 = sub_15F4(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      }

      else if ([v9 touchAccommodationsEnabled])
      {
        id v30 = sub_15F4(@"TOUCH-ACCOMMODATIONS-UNCONFIGURED");
        v13 = (void *)objc_claimAutoreleasedReturnValue(v30);
      }

      else
      {
        v13 = 0LL;
      }

      v39 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      id v40 = sub_15F4(@"TOUCH-ACCOMMODATIONS-DISABLED");
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue( [v39 showAlertWithText:v41 subtitleText:v13 iconImage:0 type:2 priority:30 duration:self forService:AXUIAlertDisplayTimeDefaultForBanners]);
      -[AXTouchAccommodationsUIServer setTouchAccommodationsAlertIdentifier:]( self,  "setTouchAccommodationsAlertIdentifier:",  v42);

      if (!self->showZoomControllerEnabled) {
        AXPerformBlockOnMainThread(&stru_C3E8);
      }
      -[AXTouchAccommodationsUIServer _disableTouchAccommodations](self, "_disableTouchAccommodations");
      goto LABEL_25;
    case 2uLL:
      if (_AXSVoiceOverTouchEnabled(v8))
      {
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472LL;
        v45[2] = sub_1CC8;
        v45[3] = &unk_C3A8;
        v45[4] = self;
        AXPerformBlockOnMainThreadAfterDelay(v45, 0.25);
      }

      else
      {
        uint64_t v31 = AXLocStringKeyForHomeButtonAndExclusiveModel(1LL, @"TOGGLE-USING-TRIPLE-CLICK");
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        id v33 = sub_15F4(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        id v35 = sub_15F4(@"TOUCH-ACCOMMODATIONS-ENABLED");
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        -[AXTouchAccommodationsUIServer _showBannerWithText:andSubtitleText:]( self,  "_showBannerWithText:andSubtitleText:",  v36,  v34);

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        self->showZoomControllerEnabled = [v37 zoomShouldShowSlug];

        if (!self->showZoomControllerEnabled)
        {
          uint64_t v38 = AXPerformBlockOnMainThread(&stru_C3C8);
          if (_UIAccessibilityZoomTouchEnabled(v38))
          {
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472LL;
            v44[2] = sub_1D4C;
            v44[3] = &unk_C3A8;
            v44[4] = self;
            AXPerformBlockOnMainThreadAfterDelay(v44, AXUIAlertDisplayTimeDefaultForBanners);
          }
        }
      }

      -[AXTouchAccommodationsUIServer _enableTouchAccommodations](self, "_enableTouchAccommodations");
      break;
    case 3uLL:
      if (!_AXSVoiceOverTouchEnabled(v8))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsUIServer holdDurationTripleClickHelpAlertIdentifier]( self,  "holdDurationTripleClickHelpAlertIdentifier"));

        if (v14) {
          _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AccessibilityFrameworks/TouchAccommodationsUIServer/AXTouchAccommodationsUIServer.m",  212LL,  "-[AXTouchAccommodationsUIServer processMessage:withIdentifier:fromClientWithIdentifier:error:]",  @"We were asked to show the Hold Duration triple click help alert without dismissing an earlier alert.");
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsUIServer holdDurationTripleClickHelpAlertIdentifier]( self,  "holdDurationTripleClickHelpAlertIdentifier"));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
          v17 = (void *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsUIServer holdDurationTripleClickHelpAlertIdentifier]( self,  "holdDurationTripleClickHelpAlertIdentifier"));
          [v16 hideAlertWithIdentifier:v17 forService:self];
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        [v18 touchAccommodationsHoldDuration];
        double v20 = v19;

        id v21 = sub_15F4(@"HOLD_DURATION_TRIPLE_CLICK_HELP_FORMAT");
        id v9 = (void *)objc_claimAutoreleasedReturnValue(v21);
        id v22 = sub_15F4(@"HOLD_DURATION_TRIPLE_CLICK_HELP_FORMAT_SUBTITLE");
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        float v24 = v20;
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v23,  v24));

        v25 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
        v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 showAlertWithText:v9 subtitleText:v13 iconImage:0 type:2 priority:30 duration:self forService:AXUIAlertDisplayTimeForever]);
        -[AXTouchAccommodationsUIServer setHoldDurationTripleClickHelpAlertIdentifier:]( self,  "setHoldDurationTripleClickHelpAlertIdentifier:",  v26);

LABEL_25:
      }

      break;
    case 4uLL:
      v27 = (void *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsUIServer holdDurationTripleClickHelpAlertIdentifier]( self,  "holdDurationTripleClickHelpAlertIdentifier"));

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
        v29 = (void *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsUIServer holdDurationTripleClickHelpAlertIdentifier]( self,  "holdDurationTripleClickHelpAlertIdentifier"));
        [v28 hideAlertWithIdentifier:v29 forService:self];

        -[AXTouchAccommodationsUIServer setHoldDurationTripleClickHelpAlertIdentifier:]( self,  "setHoldDurationTripleClickHelpAlertIdentifier:",  0LL);
      }

      break;
    default:
      return 0LL;
  }

  return 0LL;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  return @"com.apple.accessibility.BackBoard";
}

- (void)_enableTouchAccommodations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsUIServer eventProcessor](self, "eventProcessor"));
  [v3 beginHandlingHIDEventsForReason:@"Touch Accommodations wants them"];

  -[AXTouchAccommodationsUIServer _handleUsageConfirmation](self, "_handleUsageConfirmation");
  -[AXTouchAccommodationsUIServer _sendTouchAccommodationsEnabledTipSignal:]( self,  "_sendTouchAccommodationsEnabledTipSignal:",  1LL);
  -[AXTouchAccommodationsUIServer _addTouchAccommodationsSceneController:]( self,  "_addTouchAccommodationsSceneController:",  1LL);
}

- (void)_disableTouchAccommodations
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsUIServer eventProcessor](self, "eventProcessor"));
  [v3 endHandlingHIDEventsForReason:@"Touch Accommodations wants them"];

  -[AXTouchAccommodationsUIServer _sendTouchAccommodationsEnabledTipSignal:]( self,  "_sendTouchAccommodationsEnabledTipSignal:",  0LL);
  -[AXTouchAccommodationsUIServer _addTouchAccommodationsSceneController:]( self,  "_addTouchAccommodationsSceneController:",  0LL);
}

- (void)_addTouchAccommodationsSceneController:(BOOL)a3
{
  if (a3) {
    -[AXTouchAccommodationsUIServer _showContentViewController](self, "_showContentViewController");
  }
  else {
    -[AXTouchAccommodationsUIServer _hideContentViewController](self, "_hideContentViewController");
  }
}

- (void)_showContentViewController
{
  v3 = (UIViewController *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsUIServer preventBackgroundViewController]( self,  "preventBackgroundViewController"));
  if (!v3)
  {
    v5 = objc_opt_new(&OBJC_CLASS___UIViewController);
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    [v4 addContentViewController:v5 withUserInteractionEnabled:0 forService:self context:0 completion:&stru_C428];

    -[AXTouchAccommodationsUIServer setPreventBackgroundViewController:]( self,  "setPreventBackgroundViewController:",  v5);
    v3 = v5;
  }
}

- (void)_hideContentViewController
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsUIServer preventBackgroundViewController](self, "preventBackgroundViewController"));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXUIDisplayManager sharedDisplayManager](&OBJC_CLASS___AXUIDisplayManager, "sharedDisplayManager"));
    [v3 removeContentViewController:v4 withUserInteractionEnabled:0 forService:self context:0 completion:&stru_C448];

    -[AXTouchAccommodationsUIServer setPreventBackgroundViewController:]( self,  "setPreventBackgroundViewController:",  0LL);
  }
}

- (void)_handleUsageConfirmation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v2 touchAccommodationsUsageConfirmed];
}

- (void)willStartTimersInEventProcessor:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_211C;
  v3[3] = &unk_C3A8;
  v3[4] = self;
  AXPerformBlockAsynchronouslyOnMainThread(v3);
}

- (void)didStopTimersInEventProcessor:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_21E8;
  v3[3] = &unk_C3A8;
  v3[4] = self;
  AXPerformBlockAsynchronouslyOnMainThread(v3);
}

- (CGPoint)pointWithRespectToSceneReferenceSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsUIServer viewController](self, "viewController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 window]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsUIServer viewController](self, "viewController"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 window]);
    objc_msgSend(v11, "_convertPointFromSceneReferenceSpace:", AXDenormalizePoint(1, x, y));
    double v13 = v12;
    double v15 = v14;
  }

  else
  {
    double v13 = AXDenormalizePoint(1LL, x, y);
    double v15 = v16;
  }

  double v17 = v13;
  double v18 = v15;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (id)_getPointsArrayFromPathInfoArray:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "pathLocation", (void)v13);
        -[AXTouchAccommodationsUIServer pointWithRespectToSceneReferenceSpace:]( self,  "pointWithRespectToSceneReferenceSpace:");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](&OBJC_CLASS___NSValue, "valueWithCGPoint:"));
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v5;
}

- (void)eventProcessor:(id)a3 didUpdateTouchAccommodationsAtPathInfos:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_2524;
  v5[3] = &unk_C470;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  AXPerformBlockAsynchronouslyOnMainThread(v5);
}

- (void)eventProcessor:(id)a3 didResetTouchAccommodationsProgressAtPathInfos:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_25F0;
  v5[3] = &unk_C470;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  AXPerformBlockAsynchronouslyOnMainThread(v5);
}

- (void)panickedHoldDurationInEventProcessor:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_2698;
  v3[3] = &unk_C3A8;
  v3[4] = self;
  AXPerformBlockAsynchronouslyOnMainThread(v3);
}

- (double)desiredWindowLevelForContentViewController:(id)a3 userInteractionEnabled:(BOOL)a4
{
  double result = UIWindowLevelNormal;
  if (self->_viewController == a3) {
    return 10000019.0;
  }
  return result;
}

- (NSString)holdDurationTripleClickHelpAlertIdentifier
{
  return self->_holdDurationTripleClickHelpAlertIdentifier;
}

- (void)setHoldDurationTripleClickHelpAlertIdentifier:(id)a3
{
}

- (NSString)touchAccommodationsAlertIdentifier
{
  return self->_touchAccommodationsAlertIdentifier;
}

- (void)setTouchAccommodationsAlertIdentifier:(id)a3
{
}

- (AXTouchAccommodationsEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (AXDispatchTimer)usageConfirmationTimeoutTimer
{
  return self->_usageConfirmationTimeoutTimer;
}

- (void)setUsageConfirmationTimeoutTimer:(id)a3
{
}

- (AXTouchAccommodationsViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (UIViewController)preventBackgroundViewController
{
  return self->_preventBackgroundViewController;
}

- (void)setPreventBackgroundViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end