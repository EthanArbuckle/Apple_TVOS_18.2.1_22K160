@interface VOTCrashManager
+ (VOTCrashManager)sharedInstance;
- (AXDispatchTimer)crashloopTimer;
- (BOOL)didStartFromCrashState;
- (id)_init;
- (int64_t)consecutiveCrashCount;
- (void)_incrementConsecutiveCrashCount;
- (void)_resetConsecutiveCrashCount;
- (void)handleStartUp;
- (void)setCrashloopTimer:(id)a3;
- (void)setDidStartFromCrashState:(BOOL)a3;
@end

@implementation VOTCrashManager

+ (VOTCrashManager)sharedInstance
{
  if (qword_1001ACCC8 != -1) {
    dispatch_once(&qword_1001ACCC8, &stru_100177248);
  }
  return (VOTCrashManager *)(id)qword_1001ACCC0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTCrashManager;
  return -[VOTCrashManager init](&v3, "init");
}

- (void)handleStartUp
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 preferenceForKey:@"VOTIsRunningKey"]);
  self->_didStartFromCrashState = [v4 BOOLValue];

  if (self->_didStartFromCrashState)
  {
    uint64_t v6 = VOTLogCommon(-[VOTCrashManager _incrementConsecutiveCrashCount](self, "_incrementConsecutiveCrashCount"));
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[VOTCrashManager consecutiveCrashCount](self, "consecutiveCrashCount")));
      int v13 = 138412290;
      v14 = v8;
      v9 = "VoiceOver starting up from crash state. Consecutive crashes: %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0xCu);
    }
  }

  else
  {
    uint64_t v10 = VOTLogCommon(v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[VOTCrashManager consecutiveCrashCount](self, "consecutiveCrashCount")));
      int v13 = 138412290;
      v14 = v8;
      v9 = "VoiceOver starting up from fresh state. Consecutive crashes: %@";
      goto LABEL_6;
    }
  }

  v11 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  0LL);
  -[VOTCrashManager setCrashloopTimer:](self, "setCrashloopTimer:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTCrashManager crashloopTimer](self, "crashloopTimer"));
  [v12 afterDelay:&stru_100177268 processBlock:20.0];
}

- (int64_t)consecutiveCrashCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferenceForKey:@"VOTConsecutiveCrashCount"]);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (void)_incrementConsecutiveCrashCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferenceForKey:@"VOTConsecutiveCrashCount"]);
  id v4 = (char *)[v3 integerValue];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4 + 1));
  [v6 setPreferenceSync:v5 forKey:@"VOTConsecutiveCrashCount"];
}

- (void)_resetConsecutiveCrashCount
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[VOTConfiguration rootConfiguration](&OBJC_CLASS___VOTConfiguration, "rootConfiguration"));
  [v2 setPreference:0 forKey:@"VOTConsecutiveCrashCount"];
}

- (BOOL)didStartFromCrashState
{
  return self->_didStartFromCrashState;
}

- (void)setDidStartFromCrashState:(BOOL)a3
{
  self->_didStartFromCrashState = a3;
}

- (AXDispatchTimer)crashloopTimer
{
  return self->_crashloopTimer;
}

- (void)setCrashloopTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end