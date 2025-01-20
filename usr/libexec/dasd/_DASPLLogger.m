@interface _DASPLLogger
+ (id)sharedInstance;
- (BOOL)didCoalesceWithPrevious:(id)a3;
- (BOOL)powerLogExists;
- (BOOL)shouldLogActivity:(id)a3;
- (BOOL)shouldLogAppPrediction:(id)a3;
- (BOOL)shouldLogPrediction:(id)a3;
- (NSDate)lastCoalesced;
- (NSMutableArray)activities;
- (NSMutableDictionary)activityToLifeCycle;
- (NSMutableDictionary)appPredictions;
- (NSMutableDictionary)multiplier;
- (NSMutableDictionary)predictions;
- (OS_dispatch_queue)syncQueue;
- (OS_dispatch_source)dailyPeriodTimer;
- (OS_dispatch_source)longPeriodTimer;
- (OS_dispatch_source)shortPeriodTimer;
- (_DASPLLogger)init;
- (id)commaDelimitedEntriesFrom:(id)a3;
- (id)createRecordFromActivity:(id)a3;
- (id)getValuesFromTimeline:(id)a3 valueMultiplier:(id)a4;
- (id)numberFromDouble:(double)a3;
- (id)processNameFromPID:(int)a3;
- (int)appPredictionCount;
- (int)droppedCount;
- (int)eventsCoalesced;
- (int)taskCount;
- (os_unfair_lock_s)lock;
- (unint64_t)uptime;
- (void)recordActivity:(id)a3;
- (void)recordAppPrediction:(id)a3 app:(id)a4;
- (void)recordCAEventsForActivity:(id)a3 withParams:(id)a4;
- (void)recordPrediction:(id)a3 key:(id)a4 valueMultiplier:(int)a5;
- (void)sendAnalyticsEventForStream:(id)a3 withActivity:(id)a4 withMetricValueKey:(id)a5 withMetricValue:(id)a6;
- (void)setActivities:(id)a3;
- (void)setActivityToLifeCycle:(id)a3;
- (void)setAppPredictionCount:(int)a3;
- (void)setAppPredictions:(id)a3;
- (void)setDailyPeriodTimer:(id)a3;
- (void)setDroppedCount:(int)a3;
- (void)setEventsCoalesced:(int)a3;
- (void)setLastCoalesced:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLongPeriodTimer:(id)a3;
- (void)setMultiplier:(id)a3;
- (void)setPowerLogExists:(BOOL)a3;
- (void)setPredictions:(id)a3;
- (void)setShortPeriodTimer:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTaskCount:(int)a3;
@end

@implementation _DASPLLogger

- (_DASPLLogger)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS____DASPLLogger;
  v2 = -[_DASPLLogger init](&v23, "init");
  if (!v2) {
    goto LABEL_4;
  }
  BOOL v3 = dlopen_preflight("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog");
  v2->_powerLogExists = v3;
  if (v3)
  {
    v2->_taskCount = 0;
    v2->_droppedCount = 0;
    v2->_eventsCoalesced = 0;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    lastCoalesced = v2->_lastCoalesced;
    v2->_lastCoalesced = (NSDate *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    activities = v2->_activities;
    v2->_activities = (NSMutableArray *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    predictions = v2->_predictions;
    v2->_predictions = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    appPredictions = v2->_appPredictions;
    v2->_appPredictions = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    multiplier = v2->_multiplier;
    v2->_multiplier = (NSMutableDictionary *)v12;

    v2->_lock._os_unfair_lock_opaque = 0;
    -[_DASPLLogger setupTimers](v2, "setupTimers");
    syncQueue = (dispatch_queue_s *)v2->_syncQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000AD6DC;
    handler[3] = &unk_100115388;
    v15 = v2;
    v22 = v15;
    notify_register_dispatch("com.apple.dasd.plloger.logActivities", &out_token, syncQueue, handler);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    activityToLifeCycle = v15->_activityToLifeCycle;
    v15->_activityToLifeCycle = (NSMutableDictionary *)v16;

LABEL_4:
    v18 = v2;
    goto LABEL_8;
  }

  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"PowerLog"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int out_token = 136315138;
    v25 = "/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog";
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Powerlog library at %s does not exist",  (uint8_t *)&out_token,  0xCu);
  }

  v18 = 0LL;
LABEL_8:

  return v18;
}

+ (id)sharedInstance
{
  if (qword_100157DA8 != -1) {
    dispatch_once(&qword_100157DA8, &stru_100117728);
  }
  return (id)qword_100157DB0;
}

- (BOOL)didCoalesceWithPrevious:(id)a3
{
  id v4 = a3;
  if ([v4 requiresNetwork])
  {
    v5 = self->_lastCoalesced;
    objc_sync_enter(v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
      [v7 timeIntervalSinceDate:self->_lastCoalesced];
      BOOL v9 = v8 < 10.0;
    }

    else
    {
      BOOL v9 = 0;
    }

    uint64_t v10 = (NSDate *)objc_claimAutoreleasedReturnValue([v4 startDate]);
    lastCoalesced = self->_lastCoalesced;
    self->_lastCoalesced = v10;

    objc_sync_exit(v5);
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)shouldLogActivity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
    [v6 timeIntervalSinceDate:v7];
    BOOL v10 = v8 > 5.0
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)shouldLogPrediction:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 startDate]);
  [v3 timeIntervalSinceNow];
  BOOL v5 = v4 <= 64800.0;

  return v5;
}

- (BOOL)shouldLogAppPrediction:(id)a3
{
  if (self->_appPredictionCount > 19) {
    return 0;
  }
  else {
    return -[_DASPLLogger shouldLogPrediction:](self, "shouldLogPrediction:", a3);
  }
}

- (void)recordActivity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    BOOL v5 = self->_activities;
    objc_sync_enter(v5);
    if (-[_DASPLLogger shouldLogActivity:](self, "shouldLogActivity:", v7))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger createRecordFromActivity:](self, "createRecordFromActivity:", v7));
      -[NSMutableArray addObject:](self->_activities, "addObject:", v6);
      ++self->_taskCount;
    }

    else
    {
      ++self->_droppedCount;
    }

    if (-[_DASPLLogger didCoalesceWithPrevious:](self, "didCoalesceWithPrevious:", v7)) {
      ++self->_eventsCoalesced;
    }
    objc_sync_exit(v5);

    id v4 = v7;
  }
}

- (id)getValuesFromTimeline:(id)a3 valueMultiplier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = objc_autoreleasePoolPush();
  [v7 doubleValue];
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  14400.0));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPredictionManager getValuesForPrediction:tillEndDate:withIntervals:]( &OBJC_CLASS____DASPredictionManager,  "getValuesForPrediction:tillEndDate:withIntervals:",  v6,  v11,  900.0));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v12));
    if ([v13 count])
    {
      unint64_t v14 = 0LL;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v14]);
        unsigned int v16 = [v15 intValue];

        if (v16 != -1)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v14]);
          [v17 doubleValue];
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v10 * v18));
          [v13 setObject:v19 atIndexedSubscript:v14];
        }

        ++v14;
      }

      while (v14 < (unint64_t)[v13 count]);
    }
  }

  else
  {
    v13 = 0LL;
  }

  objc_autoreleasePoolPop(v8);
  return v13;
}

- (void)recordPrediction:(id)a3 key:(id)a4 valueMultiplier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v11 = a3;
  id v8 = a4;
  if (-[_DASPLLogger shouldLogPrediction:](self, "shouldLogPrediction:", v11))
  {
    double v9 = self->_predictions;
    objc_sync_enter(v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_predictions, "setObject:forKeyedSubscript:", v11, v8);
    double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_multiplier, "setObject:forKeyedSubscript:", v10, v8);

    objc_sync_exit(v9);
  }
}

- (void)recordAppPrediction:(id)a3 app:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (-[_DASPLLogger shouldLogAppPrediction:](self, "shouldLogAppPrediction:", v8))
  {
    id v7 = self->_appPredictions;
    objc_sync_enter(v7);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appPredictions, "setObject:forKeyedSubscript:", v8, v6);
    ++self->_appPredictionCount;
    objc_sync_exit(v7);
  }
}

- (id)numberFromDouble:(double)a3
{
  return +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", ((int)(a3 * 100.0) / 100));
}

- (id)commaDelimitedEntriesFrom:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", v5));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if (([v12 isEqualToString:v5] & 1) == 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @", %@",  v12));
            [v6 appendString:v13];
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)createRecordFromActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  [v9 setObject:v10 forKeyedSubscript:@"taskName"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[_DASPLLogger numberFromDouble:]( self,  "numberFromDouble:",  (double)(unint64_t)[v4 schedulingPriority]));
  [v9 setObject:v11 forKeyedSubscript:@"priority"];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 startAfter]);
  [v9 setObject:v12 forKeyedSubscript:@"startTime"];

  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
  [v9 setObject:v13 forKeyedSubscript:@"timeWhenRun"];

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 startBefore]);
  [v9 setObject:v14 forKeyedSubscript:@"endTime"];

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v8));
  [v9 setObject:v15 forKeyedSubscript:@"duration"];

  [v4 predictedOptimalScore];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v16 * 100.0));
  [v9 setObject:v17 forKeyedSubscript:@"optimalScore"];

  id v18 = v4;
  objc_sync_enter(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 policyResponseMetadata]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"scoreWhenRun"]);

  if (v20)
  {
    [v20 score];
    double v22 = v21;
    objc_super v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v21 * 100.0));
    [v9 setObject:v23 forKeyedSubscript:@"scoreWhenRun"];

    v24 = (void *)objc_claimAutoreleasedReturnValue([v18 policyResponseMetadata]);
    [v24 removeObjectForKey:@"scoreWhenRun"];
  }

  else
  {
    double v22 = -1.0;
    [v9 setObject:&off_1001223B0 forKeyedSubscript:@"scoreWhenRun"];
  }

  objc_sync_exit(v18);
  [v18 predictedOptimalScore];
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger numberFromDouble:](self, "numberFromDouble:", v22 / v25 * 100.0));
  [v9 setObject:v26 forKeyedSubscript:@"optimalScorePercentage"];

  else {
    v27 = &__kCFBooleanFalse;
  }
  [v9 setObject:v27 forKeyedSubscript:@"requiresPlugin"];
  else {
    v28 = &__kCFBooleanFalse;
  }
  [v9 setObject:v28 forKeyedSubscript:@"requiresInexpensiveNetworking"];
  if ([v18 transferSize])
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v18 transferSize]));
    [v9 setObject:v29 forKeyedSubscript:@"networkTaskSize"];
  }

  else {
    v30 = &__kCFBooleanFalse;
  }
  [v9 setObject:v30 forKeyedSubscript:@"requiresDeviceInactivity"];
  else {
    v31 = &__kCFBooleanFalse;
  }
  [v9 setObject:v31 forKeyedSubscript:@"isCpuIntensive"];
  else {
    v32 = &__kCFBooleanFalse;
  }
  [v9 setObject:v32 forKeyedSubscript:@"isMemoryIntensive"];
  else {
    v33 = &__kCFBooleanFalse;
  }
  [v9 setObject:v33 forKeyedSubscript:@"isANEIntensive"];
  else {
    v34 = &__kCFBooleanFalse;
  }
  [v9 setObject:v34 forKeyedSubscript:@"isGPUIntensive"];
  v35 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleId]);

  if (v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleId]);
    [v9 setObject:v36 forKeyedSubscript:@"bundleID"];
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue([v18 relatedApplications]);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger commaDelimitedEntriesFrom:](self, "commaDelimitedEntriesFrom:", v37));

  if (v38) {
    [v9 setObject:v38 forKeyedSubscript:@"application"];
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue([v18 involvedProcesses]);
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[_DASPLLogger commaDelimitedEntriesFrom:](self, "commaDelimitedEntriesFrom:", v39));

  if (v40) {
    [v9 setObject:v40 forKeyedSubscript:@"involvedProcesses"];
  }
  id v41 = v18;
  objc_sync_enter(v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 policyResponseMetadata]);
  id v43 = [v42 count];

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue([v41 policyResponseMetadata]);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    v46[2] = sub_1000AE494;
    v46[3] = &unk_100117750;
    id v47 = v9;
    v48 = self;
    [v44 enumerateKeysAndObjectsUsingBlock:v46];
  }

  objc_sync_exit(v41);

  return v9;
}

- (void)recordCAEventsForActivity:(id)a3 withParams:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v18 startDate]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v18 startBefore]);
  [v7 timeIntervalSinceDate:v8];
  uint64_t v10 = (uint64_t)v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v10 & ~(v10 >> 63)));
  -[_DASPLLogger sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:]( self,  "sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:",  @"com.apple.dasd.metrics.starvation_durations",  v18,  @"TimeInSeconds",  v11);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Duration"]);
  uint64_t v13 = (int)[v12 intValue];

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
  -[_DASPLLogger sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:]( self,  "sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:",  @"com.apple.dasd.metrics.runtime_durations",  v18,  @"TimeInSeconds",  v14);

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v18 suspendRequestDate]);
  if (v15) {
    -[_DASPLLogger sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:]( self,  "sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:",  @"com.apple.dasd.metrics.suspension_count",  v18,  @"Occurrences",  &off_1001223C8);
  }
  double v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"BeyondDeadline"]);
  unsigned int v17 = [v16 BOOLValue];

  if (v17) {
    -[_DASPLLogger sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:]( self,  "sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:",  @"com.apple.dasd.metrics.starvation_count",  v18,  @"Occurrences",  &off_1001223C8);
  }
  -[_DASPLLogger sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:]( self,  "sendAnalyticsEventForStream:withActivity:withMetricValueKey:withMetricValue:",  @"com.apple.dasd.metrics.run_count",  v18,  @"Occurrences",  &off_1001223C8);
}

- (void)sendAnalyticsEventForStream:(id)a3 withActivity:(id)a4 withMetricValueKey:(id)a5 withMetricValue:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivity prettySchedulingPriorityDescription:]( _DASActivity,  "prettySchedulingPriorityDescription:",  [v9 schedulingPriority]));
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 fileProtection]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](&OBJC_CLASS____DASFileProtection, "complete"));
  unsigned __int8 v16 = [v14 isEqual:v15];

  if ((v16 & 1) != 0)
  {
    unsigned int v17 = @"Fa";
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v9 fileProtection]);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](&OBJC_CLASS____DASFileProtection, "completeUnlessOpen"));
    unsigned __int8 v20 = [v18 isEqual:v19];

    if ((v20 & 1) != 0)
    {
      unsigned int v17 = @"Fb";
    }

    else
    {
      double v21 = (void *)objc_claimAutoreleasedReturnValue([v9 fileProtection]);
      double v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection none](&OBJC_CLASS____DASFileProtection, "none"));
      unsigned int v23 = [v21 isEqual:v22];

      if (v23) {
        unsigned int v17 = @"-";
      }
      else {
        unsigned int v17 = @"Fc";
      }
    }
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000AEA00;
  v29[3] = &unk_100117778;
  v30 = @"Priority";
  id v31 = v13;
  v32 = @"RequiresPlugin";
  id v33 = v9;
  v34 = @"RequiresNetwork";
  v35 = @"IsIntensive";
  v36 = @"RequiresDeviceInactivity";
  v37 = @"RequiresFileProtection";
  v38 = (__CFString *)v17;
  id v39 = v10;
  id v40 = v11;
  id v41 = (id)objc_claimAutoreleasedReturnValue( +[_DASTrialManager sharedInstanceForNamespace:]( &OBJC_CLASS____DASTrialManager,  "sharedInstanceForNamespace:",  @"COREOS_DAS"));
  v42 = @"trialExperimentId";
  id v43 = @"trialTreatmentId";
  v44 = @"trialDeploymentId";
  id v24 = v41;
  id v25 = v11;
  id v26 = v10;
  id v27 = v9;
  id v28 = v13;
  AnalyticsSendEventLazy(v12, v29);
}

- (unint64_t)uptime
{
  return clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
}

- (id)processNameFromPID:(int)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v4));
}

- (OS_dispatch_source)shortPeriodTimer
{
  return self->_shortPeriodTimer;
}

- (void)setShortPeriodTimer:(id)a3
{
}

- (OS_dispatch_source)longPeriodTimer
{
  return self->_longPeriodTimer;
}

- (void)setLongPeriodTimer:(id)a3
{
}

- (OS_dispatch_source)dailyPeriodTimer
{
  return self->_dailyPeriodTimer;
}

- (void)setDailyPeriodTimer:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (NSDate)lastCoalesced
{
  return self->_lastCoalesced;
}

- (void)setLastCoalesced:(id)a3
{
}

- (NSMutableDictionary)multiplier
{
  return self->_multiplier;
}

- (void)setMultiplier:(id)a3
{
}

- (int)eventsCoalesced
{
  return self->_eventsCoalesced;
}

- (void)setEventsCoalesced:(int)a3
{
  self->_eventsCoalesced = a3;
}

- (BOOL)powerLogExists
{
  return self->_powerLogExists;
}

- (void)setPowerLogExists:(BOOL)a3
{
  self->_powerLogExists = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)activityToLifeCycle
{
  return self->_activityToLifeCycle;
}

- (void)setActivityToLifeCycle:(id)a3
{
}

- (int)taskCount
{
  return self->_taskCount;
}

- (void)setTaskCount:(int)a3
{
  self->_taskCount = a3;
}

- (int)appPredictionCount
{
  return self->_appPredictionCount;
}

- (void)setAppPredictionCount:(int)a3
{
  self->_appPredictionCount = a3;
}

- (int)droppedCount
{
  return self->_droppedCount;
}

- (void)setDroppedCount:(int)a3
{
  self->_droppedCount = a3;
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (NSMutableDictionary)predictions
{
  return self->_predictions;
}

- (void)setPredictions:(id)a3
{
}

- (NSMutableDictionary)appPredictions
{
  return self->_appPredictions;
}

- (void)setAppPredictions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end