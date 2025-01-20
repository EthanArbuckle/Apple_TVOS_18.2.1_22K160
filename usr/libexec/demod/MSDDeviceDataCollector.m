@interface MSDDeviceDataCollector
+ (id)sharedInstance;
- (NSString)sessionUUID;
- (NSTimer)collectAppUsageTimer;
- (id)getCurrentAppUsageSessionUUID;
- (id)lastAppUsageSyncTime;
- (void)collectAppUsageBetweenLastSetupDoneAndNow;
- (void)collectAppUsageDataForSession:(id)a3 fromStart:(id)a4 toEnd:(id)a5;
- (void)collectAppUsageDataTimerHandler:(id)a3;
- (void)collectAppUsageWithSessionStart:(id)a3 andEnd:(id)a4;
- (void)saveLastAppUsageSyncTime:(id)a3;
- (void)setCollectAppUsageTimer:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setupCollectAppUsageDataTimer;
@end

@implementation MSDDeviceDataCollector

+ (id)sharedInstance
{
  if (qword_100125248 != -1) {
    dispatch_once(&qword_100125248, &stru_1000F9390);
  }
  return (id)qword_100125240;
}

- (id)getCurrentAppUsageSessionUUID
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDeviceDataCollector sessionUUID](self, "sessionUUID"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDeviceDataCollector sessionUUID](self, "sessionUUID"));
  id v5 = [v4 copy];

  objc_sync_exit(v3);
  return v5;
}

- (void)collectAppUsageBetweenLastSetupDoneAndNow
{
  v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.demo-settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v3, "objectForKey:", @"SetupDoneTimestamp"));
  if (v4)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", @"dd-MM-yyyy_HH:mm:ss:SSS");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v5, "dateFromString:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    -[MSDDeviceDataCollector collectAppUsageWithSessionStart:andEnd:]( self,  "collectAppUsageWithSessionStart:andEnd:",  v6,  v7);
    sleep(1u);
    -[NSUserDefaults removeObjectForKey:](v3, "removeObjectForKey:", @"SetupDoneTimestamp");
    -[NSUserDefaults synchronize](v3, "synchronize");
  }

  else
  {
    id v8 = sub_10003A95C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Skip collecting any app usage data as setup done timestamp is not set.",  v10,  2u);
    }
  }
}

- (void)collectAppUsageWithSessionStart:(id)a3 andEnd:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDeviceDataCollector sessionUUID](self, "sessionUUID"));
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDeviceDataCollector sessionUUID](self, "sessionUUID"));
  id v9 = [v8 copy];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  -[MSDDeviceDataCollector setSessionUUID:](self, "setSessionUUID:", v11);

  objc_sync_exit(v7);
  -[MSDDeviceDataCollector collectAppUsageDataForSession:fromStart:toEnd:]( self,  "collectAppUsageDataForSession:fromStart:toEnd:",  v9,  v12,  v6);
}

- (void)setupCollectAppUsageDataTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009300;
  block[3] = &unk_1000F93B8;
  objc_copyWeak(&v4, &location);
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)collectAppUsageDataForSession:(id)a3 fromStart:(id)a4 toEnd:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10003A95C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 toString]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v10 toString]);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Collecting app usage data between %{public}@ and %{public}@",  buf,  0x16u);
  }

  -[MSDDeviceDataCollector saveLastAppUsageSyncTime:](self, "saveLastAppUsageSyncTime:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[MSDBiome collectAppUsageDataFrom:to:]( &OBJC_CLASS___MSDBiome,  "collectAppUsageDataFrom:to:",  v9,  v10));
  v16 = v15;
  if (v15)
  {
    if ([v15 count])
    {
      v17 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      [v10 timeIntervalSinceDate:v9];
      double v19 = v18;
      -[NSDateFormatter setDateFormat:](v17, "setDateFormat:", @"dd-MM-yyyy_HH:mm:ss:SSS");
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      uint64_t v28 = 1LL;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10000991C;
      v22[3] = &unk_1000F93E0;
      v20 = v17;
      v23 = v20;
      v25 = buf;
      uint64_t v26 = (uint64_t)v19;
      id v24 = v8;
      [v16 enumerateObjectsUsingBlock:v22];

      _Block_object_dispose(buf, 8);
    }

    else
    {
      id v21 = sub_10003A95C();
      v20 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_DEFAULT,  "Unable to find any app usage info in the Biome database.",  buf,  2u);
      }
    }
  }
}

- (id)lastAppUsageSyncTime
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"LastAppUsageSyncTime"]);

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  }
  id v5 = v4;

  return v5;
}

- (void)saveLastAppUsageSyncTime:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSDPreferencesFile sharedInstance](&OBJC_CLASS___MSDPreferencesFile, "sharedInstance"));
  [v4 setObject:v3 forKey:@"LastAppUsageSyncTime"];
}

- (void)collectAppUsageDataTimerHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDeviceDataCollector lastAppUsageSyncTime](self, "lastAppUsageSyncTime"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDate, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 messageQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100009CF8;
    block[3] = &unk_1000F93B8;
    objc_copyWeak(&v14, &location);
    id v13 = v5;
    dispatch_async(v9, block);

    objc_destroyWeak(&v14);
  }

  else
  {
    id v10 = sub_10003A95C();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100090794(v11);
    }
  }

  objc_destroyWeak(&location);
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSTimer)collectAppUsageTimer
{
  return self->_collectAppUsageTimer;
}

- (void)setCollectAppUsageTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end