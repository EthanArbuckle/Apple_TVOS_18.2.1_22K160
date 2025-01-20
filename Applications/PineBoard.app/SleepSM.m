@interface SleepSM
- (AWAttentionEvent)attentionalEvent;
- (BOOL)_canBeInOnStateAutomatically;
- (BOOL)_canEnterOffStateAutomatically;
- (SleepSM)init;
- (void)_cancelAutomaticOnStateChangeConfirmation;
- (void)_confirmAutomaticOnStateChangeWithCompletion:(id)a3;
- (void)_enterOffStateAutomatically;
- (void)_enterOffStateForced;
- (void)_enterOnStateAutomatically;
- (void)_enterOnStateForced;
- (void)_temporarilySuppressWakeForHIDEvents;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAttentionalEvent:(id)a3;
@end

@implementation SleepSM

- (SleepSM)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SleepSM;
  v2 = -[PBAttentionMonitorStateMachine init](&v17, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v3 addObserver:v2 forKeyPath:@"SleepTimeoutInSeconds" options:5 context:&off_1003D05C8];

    objc_initWeak(&location, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    uint64_t v6 = MCEffectiveSettingsChangedNotification;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100013B04;
    v14[3] = &unk_1003D05D8;
    objc_copyWeak(&v15, &location);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 addObserverForName:v6 object:0 queue:v5 usingBlock:v14]);
    v8 = (void *)qword_10046FF50;
    qword_10046FF50 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    v2->_sleepAllowed = [v9 isDeviceSleepAllowed];

    mach_timebase_info(&info);
    LODWORD(v11) = info.numer;
    LODWORD(v10) = info.denom;
    v2->_suppressTimeInTicks = (unint64_t)((double)v10 * 100000000.0 / (double)v11);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  unint64_t v11 = v10;
  if (a6 == &off_1003D05C8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100013C70;
    block[3] = &unk_1003CFF08;
    id v14 = v10;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___SleepSM;
    -[SleepSM observeValueForKeyPath:ofObject:change:context:]( &v12,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  v10,  a6);
  }
}

- (BOOL)_canBeInOnStateAutomatically
{
  if (-[PBAttentionMonitorStateMachine isOn](self, "isOn")) {
    return 1;
  }
  unsigned int v3 = -[PBAttentionMonitorStateMachine isAutomaticEnabled](self, "isAutomaticEnabled");
  -[PBAttentionMonitorStateMachine enabledOffset](self, "enabledOffset");
  double v5 = v4;
  unsigned int v6 = +[PBAttentionMonitor _focusedSceneWantsIdleDisabled]( &OBJC_CLASS___PBAttentionMonitor,  "_focusedSceneWantsIdleDisabled");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
  unsigned int v8 = [v7 idleTimerAllowed];

  unsigned int v9 = +[PBAttentionMonitor _hasOutstandingIdleAssertionsThatPreventSleep]( &OBJC_CLASS___PBAttentionMonitor,  "_hasOutstandingIdleAssertionsThatPreventSleep");
  id v10 = +[PBSSystemStatus systemPlayingState](&OBJC_CLASS___PBSSystemStatus, "systemPlayingState");
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v12 = [v11 isSleepNever];

  if (v3)
  {
    if (v5 > 0.0 && (v6 & 1) == 0 && v8 && (v9 & 1) == 0 && !v10 && !v12) {
      return 1;
    }
  }

  id v14 = sub_100084338();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136318978;
    v16 = "not autoEnabled, ";
    v24 = "-[SleepSM _canBeInOnStateAutomatically]";
    __int16 v25 = 2080;
    if (v3) {
      v16 = "";
    }
    v26 = v16;
    __int16 v27 = 2080;
    objc_super v17 = "not hasEnabledOffset, ";
    if (v5 > 0.0) {
      objc_super v17 = "";
    }
    v28 = v17;
    __int16 v29 = 2080;
    v18 = "not !focusedIdleDisabled, ";
    if (!v6) {
      v18 = "";
    }
    v30 = v18;
    __int16 v31 = 2080;
    v19 = "not settingsIdleTimerEnabled, ";
    if (v8) {
      v19 = "";
    }
    v32 = v19;
    __int16 v33 = 2080;
    v20 = "not !idleAssertionsExist, ";
    if (!v9) {
      v20 = "";
    }
    v34 = v20;
    __int16 v35 = 2080;
    v21 = "not isNothingPlaying, ";
    if (!v10) {
      v21 = "";
    }
    v36 = v21;
    __int16 v37 = 2080;
    v22 = "not !isSleepNever, ";
    if (!v12) {
      v22 = "";
    }
    v38 = v22;
    __int16 v39 = 2080;
    v40 = "";
    __int16 v41 = 2080;
    v42 = "";
    __int16 v43 = 2080;
    v44 = "";
    __int16 v45 = 2080;
    v46 = "";
    __int16 v47 = 2080;
    v48 = "";
    __int16 v49 = 2080;
    v50 = "";
    __int16 v51 = 2080;
    v52 = "";
    __int16 v53 = 2080;
    v54 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: returning no -> (%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s)",  (uint8_t *)&v23,  0xA2u);
  }

  return 0;
}

- (BOOL)_canEnterOffStateAutomatically
{
  return mach_absolute_time() > self->_suppressTimeInTicks + self->_suppressWakeForHIDEventsTimeRangeStart;
}

- (void)_confirmAutomaticOnStateChangeWithCompletion:(id)a3
{
  id v3 = a3;
  if ((_os_feature_enabled_impl("PineBoard", "RemoteLowBatteryAlerts") & 1) != 0)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBCriticalRemoteBatteryAlertManager sharedInstance]( &OBJC_CLASS___PBCriticalRemoteBatteryAlertManager,  "sharedInstance"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000140B4;
    v5[3] = &unk_1003CFF30;
    id v6 = v3;
    [v4 presentIfNeededWithCompletion:v5];
  }

  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1LL);
  }
}

- (void)_cancelAutomaticOnStateChangeConfirmation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBCriticalRemoteBatteryAlertManager sharedInstance]( &OBJC_CLASS___PBCriticalRemoteBatteryAlertManager,  "sharedInstance"));
  [v2 dismiss];
}

- (void)_enterOnStateAutomatically
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100014250;
  v4[3] = &unk_1003D0628;
  v4[4] = self;
  [v3 _automaticSleepDevice:v4];
}

- (void)_enterOffStateAutomatically
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SleepSM attentionalEvent](self, "attentionalEvent"));
  if (v3
    && (double v4 = (void *)v3,
        double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SleepSM attentionalEvent](self, "attentionalEvent")),
        uint64_t v6 = objc_opt_class(&OBJC_CLASS___AWRemoteAttentionEvent),
        char isKindOfClass = objc_opt_isKindOfClass(v5, v6),
        v5,
        v4,
        (isKindOfClass & 1) != 0))
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SleepSM attentionalEvent](self, "attentionalEvent"));
    BOOL v9 = [v8 usagePage] == (id)12 && objc_msgSend(v8, "usage") == (id)48;
  }

  else
  {
    BOOL v9 = 0;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  unint64_t v11 = v10;
  if (v9) {
    uint64_t v12 = 131LL;
  }
  else {
    uint64_t v12 = 130LL;
  }
  [v10 wakeSystemWithReason:v12];

  -[SleepSM setAttentionalEvent:](self, "setAttentionalEvent:", 0LL);
}

- (void)_enterOnStateForced
{
}

- (void)_enterOffStateForced
{
}

- (void)_temporarilySuppressWakeForHIDEvents
{
  self->_suppressWakeForHIDEventsTimeRangeStart = mach_absolute_time();
}

- (AWAttentionEvent)attentionalEvent
{
  return self->_attentionalEvent;
}

- (void)setAttentionalEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end