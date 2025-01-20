@interface ProcessExitFetcher
+ (id)sharedInstance;
- (NSMutableArray)processExitRecords;
- (NSString)launchServiceMonitorID;
- (OS_dispatch_source)fetchTimer;
- (ProcessExitFetcher)initWithMonitorID:(id)a3 fetchIntervalMs:(double)a4;
- (double)fetchIntervalMs;
- (id)extractProcessNameToDisplayFromBundleID:(id)a3;
- (id)getProcessExitRecordFetchQueue;
- (id)processExitHandler;
- (id)processNameToDisplayForBundleID:(id)a3;
- (int64_t)launchServiceMaxRecordCount;
- (void)kickOffFetchTimer;
- (void)setFetchIntervalMs:(double)a3;
- (void)setFetchTimer:(id)a3;
- (void)setLaunchServiceMaxRecordCount:(int64_t)a3;
- (void)setLaunchServiceMonitorID:(id)a3;
- (void)setProcessExitHandler:(id)a3;
- (void)setProcessExitRecords:(id)a3;
- (void)stopFetchTimer;
@end

@implementation ProcessExitFetcher

+ (id)sharedInstance
{
  if (qword_1000365A0 != -1) {
    dispatch_once(&qword_1000365A0, &stru_100029920);
  }
  return (id)qword_100036598;
}

- (ProcessExitFetcher)initWithMonitorID:(id)a3 fetchIntervalMs:(double)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ProcessExitFetcher;
  v8 = -[ProcessExitFetcher init](&v20, "init");
  v9 = v8;
  if (v8)
  {
    id processExitHandler = v8->_processExitHandler;
    v8->_id processExitHandler = 0LL;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    processExitRecords = v9->_processExitRecords;
    v9->_processExitRecords = v11;

    objc_storeStrong((id *)&v9->_launchServiceMonitorID, a3);
    v9->_launchServiceMaxRecordCount = 128LL;
    v9->_fetchIntervalMs = a4;
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.HangHUD.procExitfetchTimer", v14);
    timerQueue = v9->_timerQueue;
    v9->_timerQueue = (OS_dispatch_queue *)v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSCache);
    bundleIdToProcessNameCache = v9->_bundleIdToProcessNameCache;
    v9->_bundleIdToProcessNameCache = v17;

    -[NSCache setCountLimit:](v9->_bundleIdToProcessNameCache, "setCountLimit:", 100LL);
  }

  return v9;
}

- (id)getProcessExitRecordFetchQueue
{
  if (qword_1000365B0 != -1) {
    dispatch_once(&qword_1000365B0, &stru_100029940);
  }
  return (id)qword_1000365A8;
}

- (id)processNameToDisplayForBundleID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_bundleIdToProcessNameCache, "objectForKey:", v4));
  if (!v5)
  {
    id v12 = 0LL;
    id v6 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v12];
    id v7 = v12;
    if (v7)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( -[ProcessExitFetcher extractProcessNameToDisplayFromBundleID:]( self,  "extractProcessNameToDisplayFromBundleID:",  v4));
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[HUDConfiguration sharedInstance](&OBJC_CLASS___HUDConfiguration, "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 thirdPartyDevPreferredLanguages]);

      if ([v9 count]) {
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 localizedNameWithPreferredLocalizations:v9]);
      }
      else {
        uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 localizedName]);
      }
      v5 = (void *)v10;
    }

    -[NSCache setObject:forKey:](self->_bundleIdToProcessNameCache, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (id)extractProcessNameToDisplayFromBundleID:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"."]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", (char *)objc_msgSend(v3, "count") - 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  @"[({<"));
  id v6 = [v4 rangeOfCharacterFromSet:v5];
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 substringToIndex:v6]);

    id v4 = (void *)v7;
  }

  return v4;
}

- (void)kickOffFetchTimer
{
  if (!self->_fetchTimer)
  {
    int v3 = launch_service_stats_enable( -[NSString UTF8String](self->_launchServiceMonitorID, "UTF8String"),  LODWORD(self->_launchServiceMaxRecordCount));
    id v4 = sub_10000A4EC();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10001674C(v3, v5);
    }

    id v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_timerQueue);
    fetchTimer = self->_fetchTimer;
    self->_fetchTimer = v6;

    dispatch_time_t v8 = dispatch_time(0LL, 0LL);
    dispatch_source_set_timer( (dispatch_source_t)self->_fetchTimer,  v8,  (unint64_t)(self->_fetchIntervalMs * 1000000.0),  (unint64_t)(self->_fetchIntervalMs * 1000000.0) / 0xA);
    v9 = self->_fetchTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000EE4C;
    handler[3] = &unk_1000286E0;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
    id v10 = sub_10000A4EC();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100016718(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    dispatch_resume((dispatch_object_t)self->_fetchTimer);
  }

- (void)stopFetchTimer
{
  if (self->_fetchTimer)
  {
    id v3 = sub_10000A4EC();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000167D8(v4, v5, v6, v7, v8, v9, v10, v11);
    }

    dispatch_source_cancel((dispatch_source_t)self->_fetchTimer);
    fetchTimer = self->_fetchTimer;
    self->_fetchTimer = 0LL;

    launch_service_stats_disable(-[NSString UTF8String](self->_launchServiceMonitorID, "UTF8String"));
  }

- (id)processExitHandler
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setProcessExitHandler:(id)a3
{
}

- (NSMutableArray)processExitRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setProcessExitRecords:(id)a3
{
}

- (NSString)launchServiceMonitorID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLaunchServiceMonitorID:(id)a3
{
}

- (int64_t)launchServiceMaxRecordCount
{
  return self->_launchServiceMaxRecordCount;
}

- (void)setLaunchServiceMaxRecordCount:(int64_t)a3
{
  self->_launchServiceMaxRecordCount = a3;
}

- (double)fetchIntervalMs
{
  return self->_fetchIntervalMs;
}

- (void)setFetchIntervalMs:(double)a3
{
  self->_fetchIntervalMs = a3;
}

- (OS_dispatch_source)fetchTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setFetchTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end