@interface MSDSystemMonitor
+ (id)sharedInstance;
- (BOOL)coreDuetTriggeredPause;
- (BOOL)diskSpaceTriggeredPause;
- (MSDSystemMonitorObserver)observer;
- (NSSet)foregroundAllowedApps;
- (NSTimer)diskSpaceMonitoringTimer;
- (_CDClientContext)coreDuetContext;
- (_CDContextualChangeRegistration)applicationRegistration;
- (unint64_t)systemIdleDuration;
- (void)processCoreDuetCallBack;
- (void)processDiskSpaceMonitorCallback;
- (void)setApplicationRegistration:(id)a3;
- (void)setCoreDuetTriggeredPause:(BOOL)a3;
- (void)setDiskSpaceMonitoringTimer:(id)a3;
- (void)setDiskSpaceTriggeredPause:(BOOL)a3;
- (void)setForegroundAllowedApps:(id)a3;
- (void)setObserver:(id)a3;
- (void)startDiskSpaceMonitoring;
- (void)startPowerForegroundAppMonitoring;
- (void)startSystemIdleDetection;
- (void)stopDiskSpaceMonitoring;
- (void)stopSystemIdleDetection;
- (void)unregisterObserver;
@end

@implementation MSDSystemMonitor

+ (id)sharedInstance
{
  if (qword_100125288 != -1) {
    dispatch_once(&qword_100125288, &stru_1000F9680);
  }
  return (id)qword_100125280;
}

- (unint64_t)systemIdleDuration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](self, "coreDuetContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  if ([v5 BOOLValue])
  {
    unint64_t v6 = 0LL;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](self, "coreDuetContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForLastUseDate](&OBJC_CLASS____CDContextQueries, "keyPathForLastUseDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v10 timeIntervalSinceDate:v9];
    double v12 = v11;

    double v13 = 0.0;
    if (v12 > 0.0) {
      double v13 = v12;
    }
    unint64_t v6 = (unint64_t)v13;
  }

  return v6;
}

- (void)unregisterObserver
{
}

- (void)startSystemIdleDetection
{
}

- (void)stopSystemIdleDetection
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](self, "coreDuetContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor applicationRegistration](self, "applicationRegistration"));
  [v3 deregisterCallback:v4];

  -[MSDSystemMonitor stopDiskSpaceMonitoring](self, "stopDiskSpaceMonitoring");
}

- (_CDClientContext)coreDuetContext
{
  return (_CDClientContext *)+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext");
}

- (void)startDiskSpaceMonitoring
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100016144;
  v2[3] = &unk_1000F96A8;
  objc_copyWeak(&v3, &location);
  dispatch_async(&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)stopDiskSpaceMonitoring
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000162A4;
  v2[3] = &unk_1000F96A8;
  objc_copyWeak(&v3, &location);
  dispatch_async(&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)processDiskSpaceMonitorCallback
{
  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  id v3 = [v2 getFreeSpace];

  if ((unint64_t)v3 + 0xFFFFF > 0x1FFFFE)
  {
    -[MSDSystemMonitor setDiskSpaceTriggeredPause:](obj, "setDiskSpaceTriggeredPause:", 0LL);
    v4 = 0LL;
  }

  else
  {
    -[MSDSystemMonitor setDiskSpaceTriggeredPause:](obj, "setDiskSpaceTriggeredPause:", 1LL);
    v4 = @"diskSpaceTriggeredPause";
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor observer](obj, "observer"));

  if (v5)
  {
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor observer](obj, "observer"));
    uint64_t v7 = -[MSDSystemMonitor coreDuetTriggeredPause](obj, "coreDuetTriggeredPause")
      || -[MSDSystemMonitor diskSpaceTriggeredPause](obj, "diskSpaceTriggeredPause");
    [v6 didReceiveNewPauseStatus:v7 forReason:v4];
  }

  objc_sync_exit(obj);
}

- (void)startPowerForegroundAppMonitoring
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
  v16[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForForegroundApp]( &OBJC_CLASS____CDContextQueries,  "keyPathForForegroundApp"));
  v16[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](&OBJC_CLASS____CDContextQueries, "keyPathForBatteryLevel"));
  v16[2] = v5;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForBatteryStateDataDictionary]( &OBJC_CLASS____CDContextQueries,  "keyPathForBatteryStateDataDictionary"));
  v16[3] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 4LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPaths:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPaths:",  v7));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100016654;
  v13[3] = &unk_1000F96D0;
  objc_copyWeak(&v14, &location);
  v9 = objc_retainBlock(v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:callback:]( &OBJC_CLASS____CDContextualChangeRegistration,  "localWakingRegistrationWithIdentifier:contextualPredicate:callback:",  @"com.apple.mobilestoredemo",  v8,  v9));
  -[MSDSystemMonitor setApplicationRegistration:](self, "setApplicationRegistration:", v10);

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](self, "coreDuetContext"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor applicationRegistration](self, "applicationRegistration"));
  [v11 registerCallback:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)processCoreDuetCallBack
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](v2, "coreDuetContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForForegroundApp]( &OBJC_CLASS____CDContextQueries,  "keyPathForForegroundApp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v4]);

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](v2, "coreDuetContext"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);
  unsigned int v9 = [v8 BOOLValue];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](v2, "coreDuetContext"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](&OBJC_CLASS____CDContextQueries, "keyPathForBatteryLevel"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);
  id v13 = [v12 unsignedIntegerValue];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSystemMonitor coreDuetContext](v2, "coreDuetContext"));
  uint64_t v15 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForBatteryStateDataDictionary]( &OBJC_CLASS____CDContextQueries,  "keyPathForBatteryStateDataDictionary"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  LOBYTE(v15) = [v17 tvOS];

  if ((v15 & 1) != 0)
  {
LABEL_2:
    int v18 = 0;
    v19 = 0LL;
    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_6;
  }

  v19 = @"batteryLevelTriggeredPause";
  if ((unint64_t)v13 >= 0x15)
  {
    if ((unint64_t)v13 <= 0x31)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries batteryExternalConnectedKey]( &OBJC_CLASS____CDContextQueries,  "batteryExternalConnectedKey"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:v23]);
      unsigned int v25 = [v24 BOOLValue];

      if (v25) {
        v19 = 0LL;
      }
      int v18 = v25 ^ 1;
      if (!v9) {
        goto LABEL_13;
      }
      goto LABEL_6;
    }

    goto LABEL_2;
  }

  int v18 = 1;
  if (!v9)
  {
LABEL_13:
    int v22 = 0;
    goto LABEL_14;
  }

- (_CDContextualChangeRegistration)applicationRegistration
{
  return self->_applicationRegistration;
}

- (void)setApplicationRegistration:(id)a3
{
}

- (NSTimer)diskSpaceMonitoringTimer
{
  return self->_diskSpaceMonitoringTimer;
}

- (void)setDiskSpaceMonitoringTimer:(id)a3
{
}

- (NSSet)foregroundAllowedApps
{
  return self->_foregroundAllowedApps;
}

- (void)setForegroundAllowedApps:(id)a3
{
}

- (MSDSystemMonitorObserver)observer
{
  return (MSDSystemMonitorObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
}

- (BOOL)coreDuetTriggeredPause
{
  return self->_coreDuetTriggeredPause;
}

- (void)setCoreDuetTriggeredPause:(BOOL)a3
{
  self->_coreDuetTriggeredPause = a3;
}

- (BOOL)diskSpaceTriggeredPause
{
  return self->_diskSpaceTriggeredPause;
}

- (void)setDiskSpaceTriggeredPause:(BOOL)a3
{
  self->_diskSpaceTriggeredPause = a3;
}

- (void).cxx_destruct
{
}

@end