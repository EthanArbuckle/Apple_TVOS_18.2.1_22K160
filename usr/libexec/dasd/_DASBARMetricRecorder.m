@interface _DASBARMetricRecorder
+ (BOOL)shouldRecordBARMetricForActivity:(id)a3;
+ (id)sharedInstance;
- (NSMutableDictionary)barMetricDict;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASBARMetricRecorder)init;
- (id)fetchLatestBARMetric;
- (void)loadState;
- (void)recordBARMetric:(id)a3 atStage:(int64_t)a4;
- (void)resetBARMetric;
- (void)saveState;
- (void)setBarMetricDict:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASBARMetricRecorder

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C1CC;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_1001575A0 != -1) {
    dispatch_once(&qword_1001575A0, block);
  }
  return (id)qword_100157598;
}

- (_DASBARMetricRecorder)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____DASBARMetricRecorder;
  v2 = -[_DASBARMetricRecorder init](&v11, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"barMetricRecorder"));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000B1C94(v5);
    }
    v6 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.dasd.barMetricRecorder");
    defaults = v2->_defaults;
    v2->_defaults = v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    barMetricDict = v2->_barMetricDict;
    v2->_barMetricDict = (NSMutableDictionary *)v8;

    -[_DASBARMetricRecorder loadState](v2, "loadState");
  }

  return v2;
}

+ (BOOL)shouldRecordBARMetricForActivity:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 launchReason]);
  if ([v4 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification])
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 launchReason]);
    unsigned __int8 v5 = [v6 isEqualToString:_DASLaunchReasonBackgroundRefresh];
  }

  return v5;
}

- (void)loadState
{
  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary removeAllObjects](v2->_barMetricDict, "removeAllObjects");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", @"BARMetricDict"));
  id v4 = [v3 mutableCopy];

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        barMetricDict = v2->_barMetricDict;
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9, (void)v14));
        -[NSMutableDictionary setObject:forKey:](barMetricDict, "setObject:forKey:", v11, v9);
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  log = v2->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1CD4((uint64_t *)&v2->_barMetricDict, log, v13);
  }

  objc_sync_exit(v2);
}

- (void)saveState
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  v2->_barMetricDict,  1LL);
  -[NSUserDefaults setObject:forKey:](v2->_defaults, "setObject:forKey:", v3, @"BARMetricDict");
  id v4 = v2->_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", @"BARMetricDict"));
    sub_1000B1D40(v5, (uint64_t)&v6, v4);
  }

  objc_sync_exit(v2);
}

- (void)resetBARMetric
{
  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary removeAllObjects](v2->_barMetricDict, "removeAllObjects");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_barMetricDict,  "setObject:forKeyedSubscript:",  &off_100121A50,  @"BgRefreshSubmissionCount");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_barMetricDict,  "setObject:forKeyedSubscript:",  &off_100121A50,  @"BgRefreshCompletionCount");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_barMetricDict,  "setObject:forKeyedSubscript:",  &off_100121A50,  @"PushLaunchSubmissionCount");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2->_barMetricDict,  "setObject:forKeyedSubscript:",  &off_100121A50,  @"PushLaunchCompletionCount");
  -[_DASBARMetricRecorder saveState](v2, "saveState");
  log = v2->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B1D8C((uint64_t *)&v2->_barMetricDict, log, v4);
  }
  objc_sync_exit(v2);
}

- (void)recordBARMetric:(id)a3 atStage:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
    unsigned int v9 = [v12 isEqualToString:_DASLaunchReasonBackgroundRefresh];

    v10 = @"PushLaunchCompletionCount";
    objc_super v11 = @"BgRefreshCompletionCount";
LABEL_5:
    if (v9) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v10;
    }
    goto LABEL_11;
  }

  if (!a4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
    unsigned int v9 = [v8 isEqualToString:_DASLaunchReasonBackgroundRefresh];

    v10 = @"PushLaunchSubmissionCount";
    objc_super v11 = @"BgRefreshSubmissionCount";
    goto LABEL_5;
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    sub_1000B1DF8(a4, log);
  }
  uint64_t v13 = 0LL;
LABEL_11:
  __int128 v15 = self;
  objc_sync_enter(v15);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15->_barMetricDict, "objectForKeyedSubscript:", v13));
  uint64_t v17 = [v16 intValue] + 1;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v17));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15->_barMetricDict, "setObject:forKeyedSubscript:", v18, v13);

  objc_sync_exit(v15);
  -[_DASBARMetricRecorder saveState](v15, "saveState");
}

- (id)fetchLatestBARMetric
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_barMetricDict;
  objc_sync_exit(v2);

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)barMetricDict
{
  return self->_barMetricDict;
}

- (void)setBarMetricDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end