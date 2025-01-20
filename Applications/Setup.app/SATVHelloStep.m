@interface SATVHelloStep
+ (NSString)stableIdentifier;
+ (void)initialize;
- (BOOL)_isResumingTouchlessSetup;
- (BOOL)hasAttemptedSilentActivation;
- (BOOL)isTeslaEnrolled;
- (NSMutableDictionary)metricsPayload;
- (NSTimer)TFDEPPollTimer;
- (NSTimer)touchlessSetupTimer;
- (SATVHelloStep)init;
- (SATVHelloViewController)helloViewController;
- (TVSKStepDelegate)stepDelegate;
- (TVSKUserInputConfiguration)userInputConfiguration;
- (id)_helloViewController;
- (id)executeStepForContext:(id)a3;
- (void)TFDEPPollTimerFired:(id)a3;
- (void)_attemptSilentActivationIfPossible;
- (void)_autoAdvanceIfNeeded;
- (void)_autoAdvanceNow;
- (void)_beginTouchlessSetupWithInvocation:(id)a3 afterDelay:(double)a4;
- (void)_completeStepWithSuccess:(BOOL)a3 finishSetup:(BOOL)a4;
- (void)_invalidateAllTimers;
- (void)_invalidateTouchlessTimer;
- (void)_logRemoteData;
- (void)_retrieveCloudConfigurationDetails;
- (void)_setupTouchlessTimerAfterDelay:(double)a3 invocation:(id)a4;
- (void)_showHelloViewController:(id)a3;
- (void)_startTFDEPPolling;
- (void)_stopTFDEPPolling;
- (void)didPerformTapToSetupWithDeviceInfo:(id)a3;
- (void)setHasAttemptedSilentActivation:(BOOL)a3;
- (void)setHelloViewController:(id)a3;
- (void)setMetricsPayload:(id)a3;
- (void)setStepDelegate:(id)a3;
- (void)setTFDEPPollTimer:(id)a3;
- (void)setTouchlessSetupTimer:(id)a3;
- (void)setUserInputConfiguration:(id)a3;
@end

@implementation SATVHelloStep

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVHelloStep, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVHelloStep");
    v3 = (void *)qword_1001099B8;
    qword_1001099B8 = (uint64_t)v2;
  }

- (SATVHelloStep)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SATVHelloStep;
  os_log_t v2 = -[SATVHelloStep init](&v18, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    metricsPayload = v2->_metricsPayload;
    v2->_metricsPayload = v3;

    objc_initWeak(&location, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    uint64_t v7 = kATVInternetAvailabilityChanged;
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    v14 = sub_1000550CC;
    v15 = &unk_1000C97B8;
    objc_copyWeak(&v16, &location);
    id v8 = [v5 addObserverForName:v7 object:0 queue:v6 usingBlock:&v12];

    lockdown_enable_wireless_pairing(1LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKCloudConfigUtility sharedUtility]( &OBJC_CLASS___TVSKCloudConfigUtility,  "sharedUtility",  v12,  v13,  v14,  v15));
    [v9 preflightReturnToService];

    -[SATVHelloStep _startTFDEPPolling](v2, "_startTFDEPPolling");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_1000550F8,  @"AutoAdvance",  0LL,  CFNotificationSuspensionBehaviorCoalesce);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v2;
}

+ (NSString)stableIdentifier
{
  return (NSString *)@"SATVHelloStep";
}

- (id)executeStepForContext:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 setupSession]);
  v5 = (TVSKUserInputConfiguration *)objc_claimAutoreleasedReturnValue([v4 userInputConfiguration]);
  userInputConfiguration = self->_userInputConfiguration;
  self->_userInputConfiguration = v5;

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[SATVHelloStep _helloViewController](self, "_helloViewController"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[SATVHelloStep methodSignatureForSelector:]( self,  "methodSignatureForSelector:",  "_showHelloViewController:"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  v7));
  [v8 setTarget:self];
  [v8 setSelector:"_showHelloViewController:"];
  [v8 setArgument:&v13 atIndex:2];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloStep metricsPayload](self, "metricsPayload"));
  [v9 removeAllObjects];
  if (-[SATVHelloStep _isResumingTouchlessSetup](self, "_isResumingTouchlessSetup"))
  {
    [v9 setObject:&__kCFBooleanTrue forKey:TVSKMetricsPayloadKeyStepSuffixResumingTouchlessSetup];
    v10 = (os_log_s *)qword_1001099B8;
    if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resuming touchless set up..", v12, 2u);
    }

    -[SATVHelloStep _beginTouchlessSetupWithInvocation:afterDelay:]( self,  "_beginTouchlessSetupWithInvocation:afterDelay:",  v8,  0.0);
  }

  else
  {
    -[SATVHelloStep _attemptSilentActivationIfPossible](self, "_attemptSilentActivationIfPossible");
    [v8 invoke];
  }

  return 0LL;
}

- (void)didPerformTapToSetupWithDeviceInfo:(id)a3
{
}

- (void)_attemptSilentActivationIfPossible
{
  v3 = (void *)qword_1001099B8;
  if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = +[TVSNetworkUtilities internetAvailable]( &OBJC_CLASS___TVSNetworkUtilities,  "internetAvailable");
    __int16 v13 = 1024;
    unsigned int v14 = -[SATVHelloStep hasAttemptedSilentActivation](self, "hasAttemptedSilentActivation");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Determining if we should attempt a silent activation for possible touchless setup. internetAvailable=%{BOOL}d, has AttemptedSilentActivation=%{BOOL}d",  (uint8_t *)&buf,  0xEu);
  }

  if (+[TVSNetworkUtilities internetAvailable](&OBJC_CLASS___TVSNetworkUtilities, "internetAvailable")
    && !-[SATVHelloStep hasAttemptedSilentActivation](self, "hasAttemptedSilentActivation"))
  {
    v6 = (os_log_s *)qword_1001099B8;
    if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Attempting silent activation....",  (uint8_t *)&buf,  2u);
    }

    objc_initWeak(&buf, self);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SATVActivationManager sharedInstance](&OBJC_CLASS___SATVActivationManager, "sharedInstance"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100055510;
    v10[3] = &unk_1000CA198;
    objc_copyWeak(&v11, &buf);
    [v7 requestSilentActivationWithCompletionHandler:v10];

    -[SATVHelloStep setHasAttemptedSilentActivation:](self, "setHasAttemptedSilentActivation:", 1LL);
    id v8 = (os_log_s *)qword_1001099B8;
    if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Start silent activation for possible touchless setup",  v9,  2u);
    }

    objc_destroyWeak(&v11);
    objc_destroyWeak(&buf);
  }

  else
  {
    v5 = (os_log_s *)qword_1001099B8;
    if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Silent activation will not be attempted",  (uint8_t *)&buf,  2u);
    }
  }

- (void)_retrieveCloudConfigurationDetails
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005580C;
  v10[3] = &unk_1000CAC40;
  id v4 = v3;
  id v11 = v4;
  objc_copyWeak(&v12, &location);
  v5 = objc_retainBlock(v10);
  if ([v4 isDoingReturnToService])
  {
    -[SATVHelloStep _invalidateAllTimers](self, "_invalidateAllTimers");
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100055960;
    v6[3] = &unk_1000CAC68;
    objc_copyWeak(&v9, &location);
    id v7 = v4;
    id v8 = v5;
    [v7 startReturnToServiceIfNeededCompletionBlock:v6];

    objc_destroyWeak(&v9);
  }

  else
  {
    ((void (*)(void *, void))v5[2])(v5, 0LL);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_startTFDEPPolling
{
  if (!self->_TFDEPPollTimer)
  {
    v3 = (os_log_s *)qword_1001099B8;
    if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TFDEP: starting poll timer", v6, 2u);
    }

    id v4 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "TFDEPPollTimerFired:",  0LL,  1LL,  1.0));
    TFDEPPollTimer = self->_TFDEPPollTimer;
    self->_TFDEPPollTimer = v4;
  }

- (void)_stopTFDEPPolling
{
  if (self->_TFDEPPollTimer)
  {
    v3 = (os_log_s *)qword_1001099B8;
    if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TFDEP: stopping poll timer", v5, 2u);
    }

    -[NSTimer invalidate](self->_TFDEPPollTimer, "invalidate");
    TFDEPPollTimer = self->_TFDEPPollTimer;
    self->_TFDEPPollTimer = 0LL;
  }

- (BOOL)isTeslaEnrolled
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 cloudConfigurationDetails]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMCCCConfigurationSourceKey]);
  BOOL v5 = [v4 intValue] == 1;

  return v5;
}

- (void)TFDEPPollTimerFired:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection", a3));
  if (-[SATVHelloStep isTeslaEnrolled](self, "isTeslaEnrolled"))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 installedMDMProfileIdentifier]);

    if (v5)
    {
      v6 = (os_log_s *)qword_1001099B8;
      if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "TFDEP: We are undergoing tap free setup!",  v7,  2u);
      }

      -[SATVHelloStep _invalidateAllTimers](self, "_invalidateAllTimers");
      [v4 cloudConfigurationUIDidCompleteWasApplied:1];
      -[SATVHelloStep _completeStepWithSuccess:finishSetup:](self, "_completeStepWithSuccess:finishSetup:", 1LL, 0LL);
    }
  }
}

- (BOOL)_isResumingTouchlessSetup
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 cloudConfigurationDetails]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[BYPreferencesController buddyPreferences](&OBJC_CLASS___BYPreferencesController, "buddyPreferences"));
  unsigned __int8 v5 = [v4 BOOLForKey:@"TVIsTouchless"];

  if (v3) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_beginTouchlessSetupWithInvocation:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)qword_1001099B8;
  if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    double v11 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Begin touchless setup after %.1f second delay",  (uint8_t *)&v10,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[BYPreferencesController buddyPreferences](&OBJC_CLASS___BYPreferencesController, "buddyPreferences"));
  [v8 setObject:&__kCFBooleanTrue forKey:@"TVIsTouchless"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[BYPreferencesController buddyPreferences](&OBJC_CLASS___BYPreferencesController, "buddyPreferences"));
  [v9 persist];

  -[SATVHelloStep _setupTouchlessTimerAfterDelay:invocation:]( self,  "_setupTouchlessTimerAfterDelay:invocation:",  v6,  a4);
}

- (void)_setupTouchlessTimerAfterDelay:(double)a3 invocation:(id)a4
{
  id v6 = a4;
  -[SATVHelloStep _invalidateTouchlessTimer](self, "_invalidateTouchlessTimer");
  id v7 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:invocation:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:invocation:repeats:",  v6,  0LL,  a3));

  touchlessSetupTimer = self->_touchlessSetupTimer;
  self->_touchlessSetupTimer = v7;

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v9 addTimer:self->_touchlessSetupTimer forMode:NSRunLoopCommonModes];
}

- (void)_invalidateTouchlessTimer
{
  touchlessSetupTimer = self->_touchlessSetupTimer;
  self->_touchlessSetupTimer = 0LL;
}

- (void)_invalidateAllTimers
{
}

- (id)_helloViewController
{
  helloViewController = self->_helloViewController;
  if (!helloViewController)
  {
    id v4 = -[SATVHelloViewController initWithUserInputConfiguration:]( objc_alloc(&OBJC_CLASS___SATVHelloViewController),  "initWithUserInputConfiguration:",  self->_userInputConfiguration);
    unsigned __int8 v5 = self->_helloViewController;
    self->_helloViewController = v4;

    objc_initWeak(&location, self);
    id v6 = self->_helloViewController;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100056054;
    v8[3] = &unk_1000C93A0;
    objc_copyWeak(&v9, &location);
    -[SATVHelloViewController setCompleteHandler:](v6, "setCompleteHandler:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    helloViewController = self->_helloViewController;
  }

  return helloViewController;
}

- (void)_showHelloViewController:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVHelloStep stepDelegate](self, "stepDelegate"));
  [v5 step:self displayViewController:v4];
}

- (void)_autoAdvanceIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BYPreferencesController buddyPreferences](&OBJC_CLASS___BYPreferencesController, "buddyPreferences"));
  unsigned __int8 v4 = [v3 BOOLForKey:@"ForceDEPAutoAdvance"];

  if ((v4 & 1) != 0
    || (id v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility")),
        unsigned int v6 = [v5 shouldAutoAdvance],
        v5,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloStep metricsPayload](self, "metricsPayload"));
    [v7 setObject:&__kCFBooleanTrue forKey:TVSKMetricsPayloadKeyStepSuffixStartingTouchlessSetup];

    id v8 = (os_log_s *)qword_1001099B8;
    if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Auto advancing after receving cloud config details...",  buf,  2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloStep _helloViewController](self, "_helloViewController"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 methodSignatureForSelector:"autoAdvance"]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  v10));
    [v11 setTarget:v9];
    [v11 setSelector:"autoAdvance"];
    -[SATVHelloStep _beginTouchlessSetupWithInvocation:afterDelay:]( self,  "_beginTouchlessSetupWithInvocation:afterDelay:",  v11,  30.0);
  }

  else
  {
    id v12 = (os_log_s *)qword_1001099B8;
    if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Got a cloud config but auto advance is not specified.",  v13,  2u);
    }
  }

- (void)_completeStepWithSuccess:(BOOL)a3 finishSetup:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult resultWithSuccess:](&OBJC_CLASS___TVSKBasicStepResult, "resultWithSuccess:"));
  if (v5 && v4) {
    [v9 setFlowOptions:1];
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloStep metricsPayload](self, "metricsPayload"));
  [v9 setMetricsPayload:v7];

  -[SATVHelloStep _logRemoteData](self, "_logRemoteData");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHelloStep stepDelegate](self, "stepDelegate"));
  [v8 step:self didCompleteWithResult:v9];
}

- (void)_autoAdvanceNow
{
}

- (void)_logRemoteData
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[TVSBluetoothRemoteUtilities connectedBluetoothRemote]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "connectedBluetoothRemote"));
  if ([v2 isConnected])
  {
    unsigned int v3 = [v2 isConnected];
    BOOL v4 = @":fail:";
    if (v3) {
      BOOL v4 = @":pass:";
    }
    BOOL v5 = v4;
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v2 name]);
    id v7 = +[TVSBluetoothRemoteUtilities batteryLevelForRemoteName:]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "batteryLevelForRemoteName:",  v6);

    uint64_t v8 = TVSBluetoothRemoteTypeLogString([v2 remoteType]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v20[0] = v9;
    v21[0] = @":green:";
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v2 name]);
    double v11 = (void *)v10;
    id v12 = @"<none>";
    if (v10) {
      id v12 = (const __CFString *)v10;
    }
    v20[1] = v12;
    v20[2] = @"Connected";
    v21[1] = @":speechbubble:";
    v21[2] = v5;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld%%", v7));
    v20[3] = v13;
    v21[3] = @":battery:";
    unsigned int v14 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  4LL));
  }

  else
  {
    unsigned int v14 = &off_1000D11A8;
  }

  v15 = -[SATVLogBuilder initWithContext:name:]( objc_alloc(&OBJC_CLASS___SATVLogBuilder),  "initWithContext:name:",  @"TVSetup",  @"Remote");
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder logger](v15, "logger"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder jsonForDictionary:](v15, "jsonForDictionary:", v14));
    *(_DWORD *)id buf = 138412290;
    v19 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (TVSKStepDelegate)stepDelegate
{
  return (TVSKStepDelegate *)objc_loadWeakRetained((id *)&self->stepDelegate);
}

- (void)setStepDelegate:(id)a3
{
}

- (NSMutableDictionary)metricsPayload
{
  return self->_metricsPayload;
}

- (void)setMetricsPayload:(id)a3
{
}

- (NSTimer)touchlessSetupTimer
{
  return self->_touchlessSetupTimer;
}

- (void)setTouchlessSetupTimer:(id)a3
{
}

- (NSTimer)TFDEPPollTimer
{
  return self->_TFDEPPollTimer;
}

- (void)setTFDEPPollTimer:(id)a3
{
}

- (BOOL)hasAttemptedSilentActivation
{
  return self->_hasAttemptedSilentActivation;
}

- (void)setHasAttemptedSilentActivation:(BOOL)a3
{
  self->_hasAttemptedSilentActivation = a3;
}

- (TVSKUserInputConfiguration)userInputConfiguration
{
  return self->_userInputConfiguration;
}

- (void)setUserInputConfiguration:(id)a3
{
}

- (SATVHelloViewController)helloViewController
{
  return self->_helloViewController;
}

- (void)setHelloViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end