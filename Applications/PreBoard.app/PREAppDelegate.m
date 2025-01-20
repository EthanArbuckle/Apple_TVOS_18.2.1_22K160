@interface PREAppDelegate
+ (id)sharedAppDelegate;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BSInvalidatable)dispatchingRulesAssertion;
- (BSInvalidatable)focusDeferral;
- (PREStackViewController)stackViewController;
- (UIRootWindowScenePresentationBinder)rootWindowScenePresentationBinder;
- (UIViewController)mainViewController;
- (UIWindow)window;
- (void)_clearBootCount;
- (void)_createInitialAppScene:(CGRect)a3;
- (void)_menuHomeButtonTriplePressUp:(id)a3;
- (void)_setMainViewController:(id)a3;
- (void)_setMainViewController:(id)a3 animated:(BOOL)a4;
- (void)_setupButtonRecognition;
- (void)_startReceivingEventsWithWindow:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)clearFailedBootCountAndRestart;
- (void)failedBootCountObliterate;
- (void)failedBootCountRestore;
- (void)setDispatchingRulesAssertion:(id)a3;
- (void)setMainViewController:(id)a3;
- (void)setRootWindowScenePresentationBinder:(id)a3;
- (void)setStackViewController:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation PREAppDelegate

+ (id)sharedAppDelegate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);

  return v3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "---- Alternate system app starting up ----",  buf,  2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBDisplayManager sharedInstance](&OBJC_CLASS___FBDisplayManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainConfiguration]);

  v7 = -[PRERootSceneWindow initWithDisplayConfiguration:]( objc_alloc(&OBJC_CLASS___PRERootSceneWindow),  "initWithDisplayConfiguration:",  v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v8 _referenceBounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 identity]);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RootWindow-%@-%p",  v17,  self));

  v19 = -[UIRootWindowScenePresentationBinder initWithIdentifier:priority:appearanceStyle:rootWindow:]( objc_alloc(&OBJC_CLASS___UIRootWindowScenePresentationBinder),  "initWithIdentifier:priority:appearanceStyle:rootWindow:",  v18,  0LL,  0LL,  v7);
  rootWindowScenePresentationBinder = self->_rootWindowScenePresentationBinder;
  self->_rootWindowScenePresentationBinder = v19;

  -[PREAppDelegate _createInitialAppScene:](self, "_createInitialAppScene:", v10, v12, v14, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  [v21 setOrientation:1];

  BKSHIDServicesLockOrientation(1LL, 0LL);
  v22 = -[KBSecureWindow initWithFrame:](objc_alloc(&OBJC_CLASS___KBSecureWindow), "initWithFrame:", v10, v12, v14, v16);
  window = self->_window;
  self->_window = &v22->super;

  v24 = self->_window;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](&OBJC_CLASS___UIColor, "darkGrayColor"));
  -[UIWindow setBackgroundColor:](v24, "setBackgroundColor:", v25);

  -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
  v26 = -[PREStackViewController initWithNibName:bundle:]( objc_alloc(&OBJC_CLASS___PREStackViewController),  "initWithNibName:bundle:",  0LL,  0LL);
  stackViewController = self->_stackViewController;
  self->_stackViewController = v26;

  v28 = objc_alloc_init(&OBJC_CLASS___PRELogoViewController);
  -[PREAppDelegate _setMainViewController:](self, "_setMainViewController:", v28);
  -[UIWindow setRootViewController:](self->_window, "setRootViewController:", self->_stackViewController);
  -[PREAppDelegate _setupButtonRecognition](self, "_setupButtonRecognition");
  -[PREAppDelegate _startReceivingEventsWithWindow:](self, "_startReceivingEventsWithWindow:", self->_window);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000315C;
  block[3] = &unk_10000C508;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);

  return 1;
}

- (void)applicationWillTerminate:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "---- Alternate system app terminating ----",  v3,  2u);
  }

- (void)clearFailedBootCountAndRestart
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Restart requested during Recovery Mode.",  v5,  2u);
  }

  -[PREAppDelegate _clearBootCount](self, "_clearBootCount");
  +[PBSRecoveryModeReporter reportAction:]( &OBJC_CLASS___PBSRecoveryModeReporter,  "reportAction:",  PBSRecoveryModeActionRestart);
  id v3 = [[FBSShutdownOptions alloc] initWithReason:@"Restart requested during Recovery Mode"];
  [v3 setSource:1];
  [v3 setRebootType:1];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSystemService sharedInstance](&OBJC_CLASS___FBSystemService, "sharedInstance"));
  [v4 shutdownUsingOptions:v3];
}

- (void)failedBootCountObliterate
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Reset All Settings requested during Recovery Mode.",  buf,  2u);
  }

  +[PBSRecoveryModeReporter reportAction:]( &OBJC_CLASS___PBSRecoveryModeReporter,  "reportAction:",  PBSRecoveryModeActionResetAllSettings);
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSRecoveryModeReporter pathsToPreserveAcrossObliteration]( &OBJC_CLASS___PBSRecoveryModeReporter,  "pathsToPreserveAcrossObliteration"));
  uint64_t v3 = kObliterateDataPartition;
  uint64_t v4 = kObliterationTypeKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v3,  v4,  v5,  kDisplayProgressBarKey,  v2,  kObliterationExclusionPathsKey,  0LL));

  int v7 = Mobile_Obliterate(v6);
  if (v7)
  {
    int v8 = v7;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000067BC(v8);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Failed boot count obliteration succeeded, restart should happen shortly...",  v9,  2u);
  }
}

- (void)failedBootCountRestore
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Restore requested during Recovery Mode.",  buf,  2u);
  }

  -[PREAppDelegate _clearBootCount](self, "_clearBootCount");
  if (MSURebootToNerd( +[PBSRecoveryModeReporter reportAction:]( &OBJC_CLASS___PBSRecoveryModeReporter,  "reportAction:",  PBSRecoveryModeActionRestore)))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Triggered NeRD",  v5,  2u);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006838();
    }
    id v3 = [[FBSShutdownOptions alloc] initWithReason:@"Restart because BootToNeRD failed."];
    [v3 setSource:1];
    [v3 setRebootType:1];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSystemService sharedInstance](&OBJC_CLASS___FBSystemService, "sharedInstance"));
    [v4 shutdownUsingOptions:v3];
  }

- (void)_createInitialAppScene:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[FBSMutableSceneDefinition definition](&OBJC_CLASS___FBSMutableSceneDefinition, "definition"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity identityForIdentifier:]( &OBJC_CLASS___FBSSceneIdentity,  "identityForIdentifier:",  v9));
  [v18 setIdentity:v10];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSceneClientIdentity localIdentity](&OBJC_CLASS___FBSSceneClientIdentity, "localIdentity"));
  [v18 setClientIdentity:v11];

  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIApplicationSceneSpecification specification]( &OBJC_CLASS___UIApplicationSceneSpecification,  "specification"));
  [v18 setSpecification:v12];

  double v13 = (void *)objc_claimAutoreleasedReturnValue([v18 specification]);
  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[FBSMutableSceneParameters parametersForSpecification:]( &OBJC_CLASS___FBSMutableSceneParameters,  "parametersForSpecification:",  v13));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000037CC;
  v21[3] = &unk_10000C668;
  *(CGFloat *)&v21[4] = x;
  *(CGFloat *)&v21[5] = y;
  *(CGFloat *)&v21[6] = width;
  *(CGFloat *)&v21[7] = height;
  [v14 updateSettingsWithBlock:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000388C;
  v19[3] = &unk_10000C690;
  id v20 = v14;
  id v15 = v14;
  [v15 updateClientSettingsWithBlock:v19];
  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 createSceneWithDefinition:v18 initialParameters:v15]);

  -[UIRootWindowScenePresentationBinder addScene:](self->_rootWindowScenePresentationBinder, "addScene:", v17);
}

- (void)_setupButtonRecognition
{
  id v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuHomeButtonTriplePressUp:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_10000CE40);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v3, "setNumberOfTapsRequired:", 3LL);
  -[UIWindow addGestureRecognizer:](self->_window, "addGestureRecognizer:", v3);
}

- (void)_startReceivingEventsWithWindow:(id)a3
{
  focusDeferral = self->_focusDeferral;
  id v5 = a3;
  -[BSInvalidatable invalidate](focusDeferral, "invalidate");
  v6 = +[BKSMutableHIDEventDeferringTarget new](&OBJC_CLASS___BKSMutableHIDEventDeferringTarget, "new");
  id v7 = [v5 _contextId];

  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:]( &OBJC_CLASS___BKSHIDEventDeferringToken,  "tokenForIdentifierOfCAContext:",  v7));
  -[BKSMutableHIDEventDeferringTarget setToken:](v6, "setToken:", v8);

  double v9 = +[BKSMutableHIDEventDeferringPredicate new](&OBJC_CLASS___BKSMutableHIDEventDeferringPredicate, "new");
  double v10 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDeferringEnvironment systemEnvironment]( &OBJC_CLASS___BKSHIDEventDeferringEnvironment,  "systemEnvironment"));
  -[BKSMutableHIDEventDeferringPredicate setEnvironment:](v9, "setEnvironment:", v10);

  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDeliveryManager sharedInstance]( &OBJC_CLASS___BKSHIDEventDeliveryManager,  "sharedInstance"));
  double v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( [v11 deferEventsMatchingPredicate:v9 toTarget:v6 withReason:@"PreBoard-StartDeferring"]);
  double v13 = self->_focusDeferral;
  self->_focusDeferral = v12;

  double v14 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDispatchingTarget systemTarget]( &OBJC_CLASS___BKSHIDEventDispatchingTarget,  "systemTarget"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDescriptor descriptorWithEventType:]( &OBJC_CLASS___BKSHIDEventDescriptor,  "descriptorWithEventType:",  0LL));
  double v16 = +[BKSMutableHIDEventDiscreteDispatchingPredicate new]( &OBJC_CLASS___BKSMutableHIDEventDiscreteDispatchingPredicate,  "new");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v15));
  -[BKSMutableHIDEventDiscreteDispatchingPredicate setDescriptors:](v16, "setDescriptors:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[BKSHIDEventSenderDescriptor wildcard](&OBJC_CLASS___BKSHIDEventSenderDescriptor, "wildcard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v18));
  -[BKSMutableHIDEventDiscreteDispatchingPredicate setSenderDescriptors:](v16, "setSenderDescriptors:", v19);

  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:]( &OBJC_CLASS___BKSHIDEventDiscreteDispatchingRule,  "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:",  v16,  v14));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PREAppDelegate dispatchingRulesAssertion](self, "dispatchingRulesAssertion"));
  [v21 invalidate];

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDeliveryManager sharedInstance]( &OBJC_CLASS___BKSHIDEventDeliveryManager,  "sharedInstance"));
  v25 = v20;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v22 dispatchDiscreteEventsForReason:@"Preboard-EnableRouting" withRules:v23]);
  -[PREAppDelegate setDispatchingRulesAssertion:](self, "setDispatchingRulesAssertion:", v24);
}

- (void)_setMainViewController:(id)a3
{
  stackViewController = self->_stackViewController;
  id v7 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PREStackViewController topViewController](stackViewController, "topViewController"));
  BOOL v6 = v5 != 0LL;

  -[PREAppDelegate _setMainViewController:animated:](self, "_setMainViewController:animated:", v7, v6);
}

- (void)_setMainViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (UIViewController *)a3;
  p_mainViewController = &self->_mainViewController;
  if (self->_mainViewController != v7)
  {
    objc_storeStrong((id *)&self->_mainViewController, a3);
    stackViewController = self->_stackViewController;
    double v11 = *p_mainViewController;
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    -[PREStackViewController setViewControllers:animated:](stackViewController, "setViewControllers:animated:", v10, v4);
  }
}

- (void)_menuHomeButtonTriplePressUp:(id)a3
{
  if ([a3 state] == (id)3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "PLAYPAUSE button triple press up. Hello AX",  v6,  2u);
    }

    int v3 = _AXSVoiceOverTouchEnabled();
    BOOL v4 = v3 == 0;
    _AXSVoiceOverTouchSetEnabled(v4);
    uint64_t v5 = _AXSVoiceOverTouchSetUIEnabled(v4);
  }

- (void)_clearBootCount
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:off_100011EB0]);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:off_100011EB8]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v7 fileExistsAtPath:v6])
  {
    id v12 = 0LL;
    unsigned __int8 v8 = [v7 removeItemAtPath:v6 error:&v12];
    id v9 = v12;
    if ((v8 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Boot count file cleared.",  buf,  2u);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10000687C((uint64_t)v9);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Boot count file not present - already cleared.",  v10,  2u);
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (UIViewController)mainViewController
{
  return self->_mainViewController;
}

- (void)setMainViewController:(id)a3
{
}

- (PREStackViewController)stackViewController
{
  return self->_stackViewController;
}

- (void)setStackViewController:(id)a3
{
}

- (UIRootWindowScenePresentationBinder)rootWindowScenePresentationBinder
{
  return self->_rootWindowScenePresentationBinder;
}

- (void)setRootWindowScenePresentationBinder:(id)a3
{
}

- (BSInvalidatable)dispatchingRulesAssertion
{
  return self->_dispatchingRulesAssertion;
}

- (void)setDispatchingRulesAssertion:(id)a3
{
}

- (BSInvalidatable)focusDeferral
{
  return self->_focusDeferral;
}

- (void).cxx_destruct
{
}

@end