@interface NDSpringBoardApplication
+ (id)requestDelayQueue;
- (BOOL)backgroundUpdatesEnabled;
- (BOOL)canBeSuspended;
- (BOOL)hasBackgroundTaskCompletion;
- (BOOL)hasForegroundBackgroundStates;
- (BOOL)isForeground;
- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4;
- (BOOL)shouldElevateDiscretionaryPriority;
- (BOOL)supportsWakes;
- (BOOL)usesContainerManagerForAVAsset;
- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5;
- (NDSpringBoardApplication)initWithIdentifier:(id)a3;
- (id)containerURL;
- (void)_onqueue_resetRequestDelay;
- (void)addObserver:(id)a3;
- (void)applicationBackgroundUpdatesTurnedOff:(id)a3;
- (void)applicationBackgroundUpdatesTurnedOn:(id)a3;
- (void)applicationEnteredForeground:(id)a3;
- (void)applicationNoLongerInForeground:(id)a3;
- (void)applicationWasQuitFromAppSwitcher:(id)a3;
- (void)applicationWasSuspended:(id)a3 pid:(int)a4;
- (void)disableTransitionalDiscretionaryPeriodTimer;
- (void)removeObserver:(id)a3;
- (void)setupDelayTimer;
- (void)setupTransitionalDiscretionaryPeriodTimer;
- (void)startTransitionalDiscretionaryPeriodTimer;
@end

@implementation NDSpringBoardApplication

- (NDSpringBoardApplication)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  v5 = -[NDApplication initWithIdentifier:](&v13, "initWithIdentifier:", v4);
  if (v5)
  {
    id v6 = [[LSApplicationExtensionRecord alloc] initWithBundleIdentifier:v5->super._bundleIdentifier error:0];
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 containingBundleRecord]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);

      if (v9)
      {
        uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NDApplication springboardApplicationWithBundleIdentifier:]( &OBJC_CLASS___NDApplication,  "springboardApplicationWithBundleIdentifier:",  v9));
        containingApplication = v5->_containingApplication;
        v5->_containingApplication = (NDSpringBoardApplication *)v10;
      }
    }
  }

  return v5;
}

- (id)containerURL
{
  id v2 = [[LSApplicationRecord alloc] initWithBundleIdentifier:self->super._bundleIdentifier allowPlaceholder:0 error:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataContainerURL]);

  return v3;
}

- (BOOL)usesContainerManagerForAVAsset
{
  return 1;
}

- (BOOL)supportsWakes
{
  return 1;
}

- (void)setupDelayTimer
{
  if (!self->_delayTimer)
  {
    v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[NDSpringBoardApplication requestDelayQueue]( &OBJC_CLASS___NDSpringBoardApplication,  "requestDelayQueue"));
    id v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v3);
    delayTimer = self->_delayTimer;
    self->_delayTimer = v4;

    id v6 = self->_delayTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100032CC0;
    handler[3] = &unk_100079BE0;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v6, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_delayTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)self->_delayTimer);
  }

- (void)_onqueue_resetRequestDelay
{
  v3 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->super._bundleIdentifier;
    int v6 = 138412290;
    v7 = bundleIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Resetting request delay for %@",  (uint8_t *)&v6,  0xCu);
  }

  -[NDApplication setCurrentRequestDelay:](self, "setCurrentRequestDelay:", 0.0);
  delayTimer = self->_delayTimer;
  if (delayTimer) {
    dispatch_source_set_timer((dispatch_source_t)delayTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }
}

- (BOOL)wakeForSessionIdentifier:(id)a3 withSessionUUID:(id)a4 wakeRequirement:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[NDSpringBoardApplication requestDelayQueue]( &OBJC_CLASS___NDSpringBoardApplication,  "requestDelayQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032B48;
  block[3] = &unk_100079BE0;
  block[4] = self;
  dispatch_async(v9, block);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
  LOBYTE(self) = [v10 wakeUpApp:self->super._bundleIdentifier forSession:v7 withSessionUUID:v8];

  return (char)self;
}

- (BOOL)shouldElevateDiscretionaryPriority
{
  return 0;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 1;
}

- (BOOL)isForeground
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
  LOBYTE(self) = [v3 applicationIsForeground:self->super._bundleIdentifier];

  return (char)self;
}

- (BOOL)canBeSuspended
{
  return 1;
}

- (BOOL)isHandlingBackgroundURLSessionWithIdentifier:(id)a3 withSessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
  LOBYTE(self) = [v8 application:self->super._bundleIdentifier isHandlingBackgroundSessionWithIdentifier:v6 withSessionUUID:v7];

  return (char)self;
}

- (BOOL)hasBackgroundTaskCompletion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
  LOBYTE(self) = [v3 applicationHasBackgroundTaskCompletion:self->super._bundleIdentifier];

  return (char)self;
}

- (BOOL)backgroundUpdatesEnabled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
  LOBYTE(self) = [v3 applicationBackgroundUpdatesEnabled:self->super._bundleIdentifier];

  return (char)self;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[NSMutableArray count](v5->super._observers, "count"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
    [v6 startMonitoringBundleID:v5->super._bundleIdentifier];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
    [v7 addObserver:v5 forApplication:v5->super._bundleIdentifier];

    if (!-[NDSpringBoardApplication isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:]( v5,  "isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:",  0LL,  0LL))
    {
      id v8 = (os_log_s *)qword_100083990;
      if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
      {
        bundleIdentifier = v5->super._bundleIdentifier;
        *(_DWORD *)buf = 138412290;
        v14 = bundleIdentifier;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Resetting request delay and clearing pending wake requests for %@ since the first observer is being added",  buf,  0xCu);
      }

      uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[NDSpringBoardApplication requestDelayQueue]( &OBJC_CLASS___NDSpringBoardApplication,  "requestDelayQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100032B14;
      block[3] = &unk_100079BE0;
      block[4] = v5;
      dispatch_async(v10, block);
    }
  }

  v11.receiver = v5;
  v11.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication addObserver:](&v11, "addObserver:", v4);
  objc_sync_exit(v5);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v10.receiver = v5;
  v10.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication removeObserver:](&v10, "removeObserver:", v4);
  if (!-[NSMutableArray count](v5->super._observers, "count"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
    [v6 removeObserver:v5 forApplication:v5->super._bundleIdentifier];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](&OBJC_CLASS___NDSpringBoard, "sharedSpringBoard"));
    [v7 stopMonitoringBundleID:v5->super._bundleIdentifier];

    transitionalDiscretionaryStateTimer = (dispatch_source_s *)v5->_transitionalDiscretionaryStateTimer;
    if (transitionalDiscretionaryStateTimer)
    {
      dispatch_source_cancel(transitionalDiscretionaryStateTimer);
      v9 = v5->_transitionalDiscretionaryStateTimer;
      v5->_transitionalDiscretionaryStateTimer = 0LL;
    }
  }

  objc_sync_exit(v5);
}

- (void)setupTransitionalDiscretionaryPeriodTimer
{
  if (!self->_transitionalDiscretionaryStateTimer)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v4);
    transitionalDiscretionaryStateTimer = self->_transitionalDiscretionaryStateTimer;
    self->_transitionalDiscretionaryStateTimer = v5;

    dispatch_source_set_timer( (dispatch_source_t)self->_transitionalDiscretionaryStateTimer,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0x3B9ACA00uLL);
    id v7 = self->_transitionalDiscretionaryStateTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100032A2C;
    handler[3] = &unk_100079BE0;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
    dispatch_resume((dispatch_object_t)self->_transitionalDiscretionaryStateTimer);
  }

- (void)disableTransitionalDiscretionaryPeriodTimer
{
  transitionalDiscretionaryStateTimer = self->_transitionalDiscretionaryStateTimer;
  if (transitionalDiscretionaryStateTimer) {
    dispatch_source_set_timer( (dispatch_source_t)transitionalDiscretionaryStateTimer,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0x3B9ACA00uLL);
  }
  -[NDApplication setIsInTransitionalDiscretionaryPeriod:](self, "setIsInTransitionalDiscretionaryPeriod:", 0LL);
}

- (void)startTransitionalDiscretionaryPeriodTimer
{
  transitionalDiscretionaryStateTimer = self->_transitionalDiscretionaryStateTimer;
  dispatch_time_t v4 = dispatch_time(0LL, 64800000000000LL);
  dispatch_source_set_timer( (dispatch_source_t)transitionalDiscretionaryStateTimer,  v4,  0xFFFFFFFFFFFFFFFFLL,  0x3B9ACA00uLL);
}

- (void)applicationWasQuitFromAppSwitcher:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:]( &v3,  "invokeSelectorForAllObservers:",  "applicationWasQuitFromAppSwitcher:");
}

- (void)applicationBackgroundUpdatesTurnedOff:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:]( &v3,  "invokeSelectorForAllObservers:",  "backgroundUpdatesDisabledForApplication:");
}

- (void)applicationBackgroundUpdatesTurnedOn:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:]( &v3,  "invokeSelectorForAllObservers:",  "backgroundUpdatesEnabledForApplication:");
}

- (void)applicationWasSuspended:(id)a3 pid:(int)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:pid:]( &v4,  "invokeSelectorForAllObservers:pid:",  "applicationWasSuspended:pid:",  *(void *)&a4);
}

- (void)applicationEnteredForeground:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)qword_100083990;
  if (os_log_type_enabled((os_log_t)qword_100083990, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Resetting request delay and clearing pending wake requests for %@ since it came into the foreground",  buf,  0xCu);
  }

  id v6 = self;
  objc_sync_enter(v6);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[NDSpringBoardApplication requestDelayQueue]( &OBJC_CLASS___NDSpringBoardApplication,  "requestDelayQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000329F8;
  block[3] = &unk_100079BE0;
  block[4] = v6;
  dispatch_async(v7, block);

  v9.receiver = v6;
  v9.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:]( &v9,  "invokeSelectorForAllObservers:",  "applicationEnteredForeground:");
  objc_sync_exit(v6);

  id v8 = v6;
  objc_sync_enter(v8);
  -[NDSpringBoardApplication disableTransitionalDiscretionaryPeriodTimer]( v8,  "disableTransitionalDiscretionaryPeriodTimer");
  objc_sync_exit(v8);
}

- (void)applicationNoLongerInForeground:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NDSpringBoardApplication;
  -[NDApplication invokeSelectorForAllObservers:]( &v5,  "invokeSelectorForAllObservers:",  "applicationNoLongerInForeground:");
  id v4 = self;
  objc_sync_enter(v4);
  -[NDSpringBoardApplication startTransitionalDiscretionaryPeriodTimer](v4, "startTransitionalDiscretionaryPeriodTimer");
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
}

+ (id)requestDelayQueue
{
  if (qword_100083968 != -1) {
    dispatch_once(&qword_100083968, &stru_100079508);
  }
  return (id)qword_100083960;
}

@end