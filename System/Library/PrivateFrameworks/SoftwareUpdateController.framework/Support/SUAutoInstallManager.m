@interface SUAutoInstallManager
- (BOOL)_createForecastStartEndWindow;
- (SUAutoInstallManager)initWithConfig:(id)a3;
- (id)withinAllowedWindowCompletion;
- (void)_cancelWaitInstallAllowed:(int64_t)a3;
- (void)_loadAndSchedulePreviousForecastStartEndWindow;
- (void)_notifyNoLongerWaitingInstallWindow:(id)a3;
- (void)_scheduleStartAndEndInstallWindow:(id)a3 withEndTime:(id)a4 withWindowName:(id)a5;
- (void)_setPersistedStartTime:(id)a3 endTime:(id)a4;
- (void)_startWaitingForInstallAllowed;
- (void)awaitInstallAllowed:(id)a3;
- (void)cancelWaitInstallAllowed:(int64_t)a3;
- (void)modifyConfig:(id)a3;
- (void)noteAutoInstallOperationDidExpire;
- (void)noteAutoInstallOperationWantsToBegin;
- (void)setWithinAllowedWindowCompletion:(id)a3;
@end

@implementation SUAutoInstallManager

- (SUAutoInstallManager)initWithConfig:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SUAutoInstallManager;
  v5 = -[SUAutoInstallManager init](&v20, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___SUAutoInstallForecast);
    forecast = v5->_forecast;
    v5->_forecast = v6;

    v8 = -[SUBackgroundTaskAgent initWithAutoInstallManager:]( objc_alloc(&OBJC_CLASS___SUBackgroundTaskAgent),  "initWithAutoInstallManager:",  v5);
    backgroundTaskAgent = v5->_backgroundTaskAgent;
    v5->_backgroundTaskAgent = v8;

    v10 = (SUControllerConfig *)[v4 copy];
    autoConfig = v5->_autoConfig;
    v5->_autoConfig = v10;

    v5->_autoInstallState = 1LL;
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.sucontrollerd.SUControllerAutoInstallManager.state", 0LL);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.sucontrollerd.SUControllerAutoInstallManager.callback", 0LL);
    callbackQueue = v5->_callbackQueue;
    v5->_callbackQueue = (OS_dispatch_queue *)v14;

    id withinAllowedWindowCompletion = v5->_withinAllowedWindowCompletion;
    v5->_id withinAllowedWindowCompletion = 0LL;

    v17 = -[SUCorePersistedState initWithDispatchQueue:withPersistencePath:forPolicyVersion:]( objc_alloc(&OBJC_CLASS___SUCorePersistedState),  "initWithDispatchQueue:withPersistencePath:forPolicyVersion:",  v5->_stateQueue,  @"/var/mobile/Library/SoftwareUpdate/SUControllerAutoInstall.state",  @"1.0");
    corePersisted = v5->_corePersisted;
    v5->_corePersisted = v17;

    -[SUBackgroundTaskAgent cancelAutoInstallExpirationTask]( v5->_backgroundTaskAgent,  "cancelAutoInstallExpirationTask");
    -[SUAutoInstallManager _loadAndSchedulePreviousForecastStartEndWindow]( v5,  "_loadAndSchedulePreviousForecastStartEndWindow");
  }

  return v5;
}

- (void)modifyConfig:(id)a3
{
  id v4 = a3;
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100031EFC;
  v7[3] = &unk_100065250;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

- (void)awaitInstallAllowed:(id)a3
{
  id v4 = a3;
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100032078;
  v7[3] = &unk_100065138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

- (void)_setPersistedStartTime:(id)a3 endTime:(id)a4
{
  if (self->_corePersisted)
  {
    v10 = (__CFString *)a4;
    id v6 = (__CFString *)a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    id v8 = @"nil";
    if (v6) {
      v9 = v6;
    }
    else {
      v9 = @"nil";
    }
    if (v10) {
      id v8 = v10;
    }
    [v7 logAtLevel:1, "-[SUAutoInstallManager _setPersistedStartTime:endTime:]", @"Storing persistent auto install startTime: %@, endTime: %@", v9, v8 label format];

    -[SUCorePersistedState persistDate:forKey:shouldPersist:]( self->_corePersisted,  "persistDate:forKey:shouldPersist:",  v6,  @"ScheduledAutoInstallStart",  1LL);
    -[SUCorePersistedState persistDate:forKey:shouldPersist:]( self->_corePersisted,  "persistDate:forKey:shouldPersist:",  v10,  @"ScheduledAutoInstallEnd",  1LL);
  }

- (void)_loadAndSchedulePreviousForecastStartEndWindow
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032348;
  block[3] = &unk_1000652F0;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)_scheduleStartAndEndInstallWindow:(id)a3 withEndTime:(id)a4 withWindowName:(id)a5
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[SUAutoInstallManager _setPersistedStartTime:endTime:](self, "_setPersistedStartTime:endTime:", v11, v10);
  -[SUBackgroundTaskAgent scheduleAutoInstallStartInstallTaskWithDate:windowName:indicatingUpdate:]( self->_backgroundTaskAgent,  "scheduleAutoInstallStartInstallTaskWithDate:windowName:indicatingUpdate:",  v11,  v9,  -[SUControllerConfig hideIndicationMayReboot](self->_autoConfig, "hideIndicationMayReboot") ^ 1);

  -[SUBackgroundTaskAgent scheduleAutoInstallExpirationTaskWithDate:windowName:]( self->_backgroundTaskAgent,  "scheduleAutoInstallExpirationTaskWithDate:windowName:",  v10,  v9);
  self->_autoInstallState = 2LL;
}

- (void)_startWaitingForInstallAllowed
{
  if (!-[SUControllerConfig useSpecifiedInstallWindow](self->_autoConfig, "useSpecifiedInstallWindow"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    objc_msgSend( v6,  "logAtLevel:label:format:",  1,  "-[SUAutoInstallManager _startWaitingForInstallAllowed]",  @"Using default auto install window of %ld:00 - %ld:00",  2,  6);

    forecast = self->_forecast;
    uint64_t v8 = 2LL;
    int64_t v9 = 0LL;
    uint64_t v10 = 6LL;
    int64_t v11 = 0LL;
LABEL_6:
    -[SUAutoInstallForecast computeStartEndDate:beginAtMinute:endAtHour:endAtMinute:]( forecast,  "computeStartEndDate:beginAtMinute:endAtHour:endAtMinute:",  v8,  v9,  v10,  v11);
    goto LABEL_7;
  }

  unsigned int v3 = -[SUControllerConfig installWindowAsDeltas](self->_autoConfig, "installWindowAsDeltas");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  v5 = v4;
  if (!v3)
  {
    [v4 logAtLevel:1 label:"-[SUAutoInstallManager _startWaitingForInstallAllowed]" format:@"Using specified auto install window from config"];

    dispatch_queue_t v12 = self->_forecast;
    int64_t v13 = -[SUControllerConfig autoInstallWindowBeginHour](self->_autoConfig, "autoInstallWindowBeginHour");
    int64_t v14 = -[SUControllerConfig autoInstallWindowBeginMinute](self->_autoConfig, "autoInstallWindowBeginMinute");
    int64_t v15 = -[SUControllerConfig autoInstallWindowEndHour](self->_autoConfig, "autoInstallWindowEndHour");
    int64_t v11 = -[SUControllerConfig autoInstallWindowEndMinute](self->_autoConfig, "autoInstallWindowEndMinute");
    forecast = v12;
    uint64_t v8 = v13;
    int64_t v9 = v14;
    uint64_t v10 = v15;
    goto LABEL_6;
  }

  [v4 logAtLevel:1 label:"-[SUAutoInstallManager _startWaitingForInstallAllowed]" format:@"Using window delta from config"];

  -[SUAutoInstallForecast computeStartEndDelta:beginAtMinute:endAtHour:endAtMinute:]( self->_forecast,  "computeStartEndDelta:beginAtMinute:endAtHour:endAtMinute:",  -[SUControllerConfig autoInstallWindowBeginHour](self->_autoConfig, "autoInstallWindowBeginHour"),  -[SUControllerConfig autoInstallWindowBeginMinute](self->_autoConfig, "autoInstallWindowBeginMinute"),  -[SUControllerConfig autoInstallWindowEndHour](self->_autoConfig, "autoInstallWindowEndHour"),  -[SUControllerConfig autoInstallWindowEndMinute](self->_autoConfig, "autoInstallWindowEndMinute"));
LABEL_7:
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suStartDate](self->_forecast, "suStartDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suEndDate](self->_forecast, "suEndDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallForecast suWindowName](self->_forecast, "suWindowName"));
  -[SUAutoInstallManager _scheduleStartAndEndInstallWindow:withEndTime:withWindowName:]( self,  "_scheduleStartAndEndInstallWindow:withEndTime:withWindowName:",  v18,  v16,  v17);
}

- (void)cancelWaitInstallAllowed:(int64_t)a3
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100032888;
  v4[3] = &unk_100065960;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(stateQueue, v4);
}

- (void)_cancelWaitInstallAllowed:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  [v5 logAtLevel:1 label:"-[SUAutoInstallManager _cancelWaitInstallAllowed:]" format:@"cancel wait to be within the auto-install allowed window"];

  int64_t autoInstallState = self->_autoInstallState;
  if (autoInstallState != 1)
  {
    if (autoInstallState == 3)
    {
      self->_int64_t autoInstallState = 1LL;
    }

    else
    {
      if (autoInstallState == 2)
      {
        -[SUAutoInstallManager _setPersistedStartTime:endTime:](self, "_setPersistedStartTime:endTime:", 0LL, 0LL);
        -[SUBackgroundTaskAgent cancelAutoInstallStartInstallTask]( self->_backgroundTaskAgent,  "cancelAutoInstallStartInstallTask");
        -[SUBackgroundTaskAgent cancelAutoInstallExpirationTask]( self->_backgroundTaskAgent,  "cancelAutoInstallExpirationTask");
        self->_int64_t autoInstallState = 1LL;
        id v11 = sub_1000382D8( @"SUControllerError",  a3,  0LL,  @"Wait for auto-install window was canceled",  v7,  v8,  v9,  v10,  v12);
        id v13 = (id)objc_claimAutoreleasedReturnValue(v11);
        -[SUAutoInstallManager _notifyNoLongerWaitingInstallWindow:](self, "_notifyNoLongerWaitingInstallWindow:", v13);
      }

      else
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
        objc_msgSend( v13,  "logAtLevel:label:format:",  0,  "-[SUAutoInstallManager _cancelWaitInstallAllowed:]",  @"wait to be within the auto-install window from unknown state: %d",  self->_autoInstallState);
      }
    }
  }

- (void)_notifyNoLongerWaitingInstallWindow:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallManager withinAllowedWindowCompletion](self, "withinAllowedWindowCompletion"));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
  id v7 = v6;
  if (v5)
  {
    [v6 logAtLevel:1 label:"-[SUAutoInstallManager _notifyNoLongerWaitingInstallWindow:]" format:@"no longer waiting for install indication"];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUAutoInstallManager withinAllowedWindowCompletion](self, "withinAllowedWindowCompletion"));
    -[SUAutoInstallManager setWithinAllowedWindowCompletion:](self, "setWithinAllowedWindowCompletion:", 0LL);
    callbackQueue = (dispatch_queue_s *)self->_callbackQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100032AD8;
    v10[3] = &unk_1000649F0;
    id v12 = v8;
    id v11 = v4;
    id v7 = v8;
    dispatch_async(callbackQueue, v10);
  }

  else
  {
    [v6 logAtLevel:0 label:"-[SUAutoInstallManager _notifyNoLongerWaitingInstallWindow:]" format:@"no longer waiting for install indication when no completeion"];
  }
}

- (void)noteAutoInstallOperationWantsToBegin
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032B40;
  block[3] = &unk_1000652F0;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)noteAutoInstallOperationDidExpire
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032C14;
  block[3] = &unk_1000652F0;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (BOOL)_createForecastStartEndWindow
{
  id v3 = objc_alloc_init(&OBJC_CLASS____CDSleepForAutoSu);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getUnlockAndSoftwareUpdateTimes]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kCDSleepAutoSuSuStartKey]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kCDSleepAutoSuSuEndKey]);
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 laterDate:v7]);

      if (v8 == v6)
      {
        -[SUAutoInstallForecast provideSUStartEndDates:endingAt:]( self->_forecast,  "provideSUStartEndDates:endingAt:",  v5,  v6);
        BOOL v12 = 1;
        goto LABEL_9;
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      uint64_t v10 = v9;
      id v11 = @"SU end date has already passed";
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
      uint64_t v10 = v9;
      id v11 = @"Duet failed to return kCDSleepAutoSuSuEndKey";
    }

    [v9 logAtLevel:0 label:"-[SUAutoInstallManager _createForecastStartEndWindow]" format:v11];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerLogger sharedLogger](&OBJC_CLASS___SUControllerLogger, "sharedLogger"));
    [v6 logAtLevel:0 label:"-[SUAutoInstallManager _createForecastStartEndWindow]" format:@"Duet failed to return kCDSleepAutoSuSuStartKey"];
  }

  BOOL v12 = 0;
LABEL_9:

  return v12;
}

- (id)withinAllowedWindowCompletion
{
  return self->_withinAllowedWindowCompletion;
}

- (void)setWithinAllowedWindowCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end