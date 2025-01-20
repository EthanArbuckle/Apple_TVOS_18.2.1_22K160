@interface _DASRequiresRestartPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)cacheSleepPeriod:(id)a3 end:(id)a4 period1:(id *)a5 period2:(id *)a6;
- (BOOL)isDeviceIdle;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSDate)lastCacheDate;
- (NSString)policyDescription;
- (NSString)policyName;
- (_CDContextualKeyPath)deviceAssertionsHeld;
- (_CDContextualKeyPath)inUseStatus;
- (_CDContextualKeyPath)nextWakeRequest;
- (_CDDateRange)deviceRestartPeriod1;
- (_CDDateRange)deviceRestartPeriod2;
- (_DASRequiresRestartPolicy)init;
- (double)minDurationAfterLastUserInteraction;
- (double)minDurationBeforeNextScheduledWake;
- (double)weightForActivity:(id)a3;
- (id)blockReasons:(id)a3;
- (id)defaultDeviceRestartDateRangeWithDate:(id)a3;
- (id)getRebootForecastPeriod;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)getDeviceRestartForecast;
- (void)reportAnalyticsWithStartDate:(id)a3 isDefaultTime:(BOOL)a4;
- (void)setDeviceAssertionsHeld:(id)a3;
- (void)setDeviceRestartPeriod1:(id)a3;
- (void)setDeviceRestartPeriod2:(id)a3;
- (void)setInUseStatus:(id)a3;
- (void)setIsDeviceIdle:(BOOL)a3;
- (void)setLastCacheDate:(id)a3;
- (void)setMinDurationAfterLastUserInteraction:(double)a3;
- (void)setMinDurationBeforeNextScheduledWake:(double)a3;
- (void)setNextWakeRequest:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASRequiresRestartPolicy

- (id)initializeTriggers
{
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_deviceAssertionsHeld));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_inUseStatus));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  self->_nextWakeRequest));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForBacklightOnStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForBacklightOnStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v3));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100045AEC;
  v15[3] = &unk_1001150D0;
  v15[4] = self;
  +[PBSSystemStatus addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:]( &OBJC_CLASS___PBSSystemStatus,  "addPermanentObserverForProperty:notifyInitial:invokeOnMainThread:handler:",  @"systemAttentionState",  0LL,  0LL,  v15);
  v24[0] = @"identifier";
  v24[1] = @"predicate";
  v25[0] = @"com.apple.duetactivityscheduler.restartpolicy.assertionsheld";
  v25[1] = v14;
  v24[2] = @"deviceSet";
  v24[3] = @"mustWake";
  v25[2] = &off_100121D38;
  v25[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  4LL));
  v26[0] = v4;
  v22[0] = @"identifier";
  v22[1] = @"predicate";
  v23[0] = @"com.apple.duetactivityscheduler.restartpolicy.inusestatus";
  v23[1] = v12;
  v22[2] = @"deviceSet";
  v22[3] = @"mustWake";
  v23[2] = &off_100121D38;
  v23[3] = &__kCFBooleanTrue;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  4LL));
  v26[1] = v5;
  v20[0] = @"identifier";
  v20[1] = @"predicate";
  v21[0] = @"com.apple.das.restartpolicy.backlightOn";
  v21[1] = v11;
  v20[2] = @"deviceSet";
  v20[3] = @"mustWake";
  v21[2] = &off_100121D38;
  v21[3] = &__kCFBooleanFalse;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  4LL));
  v26[2] = v6;
  v18[0] = @"identifier";
  v18[1] = @"predicate";
  v19[0] = @"com.apple.duetactivityscheduler.restartpolicy.wakerequest";
  v19[1] = v13;
  v18[2] = @"deviceSet";
  v18[3] = @"mustWake";
  v19[2] = &off_100121D38;
  v19[3] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  4LL));
  v26[3] = v7;
  v16 = @"identifier";
  v17 = @"com.apple.das.restartpolicy.deviceIdle";
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  v26[4] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 5LL));

  return v9;
}

- (_DASRequiresRestartPolicy)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____DASRequiresRestartPolicy;
  v2 = -[_DASRequiresRestartPolicy init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Restart Required Activities Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForDeviceAssertionsHeldStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForDeviceAssertionsHeldStatus"));
    deviceAssertionsHeld = v3->_deviceAssertionsHeld;
    v3->_deviceAssertionsHeld = (_CDContextualKeyPath *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
    inUseStatus = v3->_inUseStatus;
    v3->_inUseStatus = (_CDContextualKeyPath *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForNextUserVisibleWakeDate]( &OBJC_CLASS____CDContextQueries,  "keyPathForNextUserVisibleWakeDate"));
    nextWakeRequest = v3->_nextWakeRequest;
    v3->_nextWakeRequest = (_CDContextualKeyPath *)v9;

    *(_OWORD *)&v3->_minDurationAfterLastUserInteraction = xmmword_1000D8430;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    lastCacheDate = v3->_lastCacheDate;
    v3->_lastCacheDate = (NSDate *)v11;

    -[_DASRequiresRestartPolicy getDeviceRestartForecast](v3, "getDeviceRestartForecast");
    v3->_isDeviceIdle = +[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") == (id)7;
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[_DASRequiresRestartPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v13;
  }

  return v3;
}

+ (id)policyInstance
{
  if (qword_100157970 != -1) {
    dispatch_once(&qword_100157970, &stru_100115F20);
  }
  return (id)qword_100157978;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.restartpolicy.assertionsheld"])
  {
    deviceAssertionsHeld = self->_deviceAssertionsHeld;
LABEL_5:
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:deviceAssertionsHeld]);
    unsigned __int8 v10 = [v9 BOOLValue];

    goto LABEL_6;
  }

  if ([v6 isEqualToString:@"com.apple.duetactivityscheduler.restartpolicy.inusestatus"])
  {
    deviceAssertionsHeld = self->_inUseStatus;
    goto LABEL_5;
  }

  if ([v6 isEqualToString:@"com.apple.das.restartpolicy.backlightOn"])
  {
    unsigned __int8 v10 = 1;
  }

  else if ([v6 isEqualToString:@"com.apple.das.restartpolicy.deviceIdle"])
  {
    unsigned __int8 v10 = !self->_isDeviceIdle;
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  else {
    unsigned __int8 v4 = [v3 requiresSignificantUserInactivity];
  }

  return v4;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (BOOL)cacheSleepPeriod:(id)a3 end:(id)a4 period1:(id *)a5 period2:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  BOOL v12 = 0;
  if (v9 && v10)
  {
    if ([v9 compare:v10] == (id)-1
      && [v9 compare:v10] == (id)-1
      && [v11 compare:v10] == (id)-1)
    {
      if (*a6)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([*a6 endDate]);
        id v15 = [v11 compare:v14];

        if (v15 == (id)1)
        {
          id v16 = *a6;
          *a6 = 0LL;
        }
      }

      if (!*a5
        || (v17 = (void *)objc_claimAutoreleasedReturnValue([*a5 endDate]),
            id v18 = [v11 compare:v17],
            v17,
            v18 == (id)1))
      {
        objc_storeStrong(a5, *a6);
        id v19 = *a6;
        *a6 = 0LL;
      }

      if (!*a6)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[_CDDateRange periodWithStart:end:]( &OBJC_CLASS____CDDateRange,  "periodWithStart:end:",  v9,  v10));
        id v21 = *a6;
        *a6 = v20;
      }

      if (!*a5)
      {
        objc_storeStrong(a5, *a6);
        id v22 = *a6;
        *a6 = 0LL;
      }

      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = *a5;
        int v25 = 138412290;
        id v26 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Using restart times of %@",  (uint8_t *)&v25,  0xCu);
      }

      BOOL v12 = 1;
    }

    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)defaultDeviceRestartDateRangeWithDate:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 components:30 fromDate:v3]);
  [v5 setHour:4];
  [v5 setMinute:0];
  [v5 setSecond:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dateFromComponents:v5]);
  [v6 timeIntervalSinceDate:v3];
  double v8 = v7;

  if (v8 < 0.0)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:86400.0]);

    id v6 = (void *)v9;
  }

  id v10 = [v6 dateByAddingTimeInterval:(double)arc4random_uniform(0xE10u) + -8100.0];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[_CDDateRange periodWithStart:end:](&OBJC_CLASS____CDDateRange, "periodWithStart:end:", v11, v6));

  return v12;
}

- (void)reportAnalyticsWithStartDate:(id)a3 isDefaultTime:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100046284;
  v6[3] = &unk_1001150F8;
  id v7 = a3;
  BOOL v8 = a4;
  id v5 = v7;
  AnalyticsSendEventLazy(@"com.apple.dasd.restartTimes", v6);
}

- (void)getDeviceRestartForecast
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRequiresRestartPolicy lastCacheDate](self, "lastCacheDate"));
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  if (v6 >= 14400.0)
  {
    id v7 = (void *)os_transaction_create("com.apple.dasd.cdsleepforsu");
    BOOL v8 = objc_autoreleasePoolPush();
    id v9 = objc_alloc_init(&OBJC_CLASS____CDSleepForAutoSu);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 getUnlockAndSoftwareUpdateTimes]);

    objc_autoreleasePoolPop(v8);
    if (v10)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kCDSleepAutoSuSuStartKey]);
      id v12 = [v11 dateByAddingTimeInterval:(double)arc4random_uniform(0x384u)];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kCDSleepAutoSuExpirationTimeKey]);
      -[_DASRequiresRestartPolicy reportAnalyticsWithStartDate:isDefaultTime:]( self,  "reportAnalyticsWithStartDate:isDefaultTime:",  v13,  0LL);
      if (-[_DASRequiresRestartPolicy cacheSleepPeriod:end:period1:period2:]( self,  "cacheSleepPeriod:end:period1:period2:",  v13,  v14,  &self->_deviceRestartPeriod1,  &self->_deviceRestartPeriod2))
      {
        -[_DASRequiresRestartPolicy setLastCacheDate:](self, "setLastCacheDate:", v3);
      }
    }

    else
    {
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000B3894(v15);
      }

      id v16 = (_CDDateRange *)objc_claimAutoreleasedReturnValue( -[_DASRequiresRestartPolicy defaultDeviceRestartDateRangeWithDate:]( self,  "defaultDeviceRestartDateRangeWithDate:",  v3));
      deviceRestartPeriod1 = self->_deviceRestartPeriod1;
      self->_deviceRestartPeriod1 = v16;

      -[_DASRequiresRestartPolicy setLastCacheDate:](self, "setLastCacheDate:", v3);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = self->_deviceRestartPeriod1;
        int v20 = 138412290;
        id v21 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Using restart times of %@",  (uint8_t *)&v20,  0xCu);
      }

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[_CDDateRange startDate](self->_deviceRestartPeriod1, "startDate"));
      -[_DASRequiresRestartPolicy reportAnalyticsWithStartDate:isDefaultTime:]( self,  "reportAnalyticsWithStartDate:isDefaultTime:",  v13,  1LL);
    }
  }
}

- (id)getRebootForecastPeriod
{
  return self->_deviceRestartPeriod1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[_DASRequiresRestartPolicy getDeviceRestartForecast](self, "getDeviceRestartForecast");
  BOOL v8 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  unsigned __int8 v10 = [v9 isEqualToString:@"com.apple.dasd.dataCollectiontask.dummyAutoSU"];

  if ((v10 & 1) != 0) {
    goto LABEL_3;
  }
  if ((-[_CDDateRange contains:](self->_deviceRestartPeriod1, "contains:", v44) & 1) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](&OBJC_CLASS____DASDaemon, "sharedInstance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 allPendingRestartTasks]);

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v29 = v28;
    id v30 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v46;
      while (2)
      {
        for (i = 0LL; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(v29);
          }
          if ([*(id *)(*((void *)&v45 + 1) + 8 * (void)i) isSoftwareUpdateActivity])
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"PendingSoftwareUpdate == 1"));
            -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v42);

            int v25 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  33LL,  v8,  (double)0x384uLL));
            goto LABEL_27;
          }
        }

        id v31 = [v29 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

LABEL_3:
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", self->_nextWakeRequest, v6));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForBacklightOnStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForBacklightOnStatus"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v12]);

    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self->_deviceAssertionsHeld]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:self->_inUseStatus]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForLastUseDate](&OBJC_CLASS____CDContextQueries, "keyPathForLastUseDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v16]);

    if (v11)
    {
      [v11 timeIntervalSinceDate:v44];
      BOOL v19 = v18 < 3600.0;
      if (!v13) {
        goto LABEL_6;
      }
    }

    else
    {
      BOOL v19 = 0;
      if (!v13)
      {
LABEL_6:
        if (v14) {
          [v14 BOOLValue];
        }
        if (v15 && ([v15 BOOLValue] & 1) != 0)
        {
          BOOL v20 = 1;
        }

        else if ([v13 BOOLValue])
        {
          BOOL v20 = !self->_isDeviceIdle;
        }

        else
        {
          BOOL v20 = 0;
        }

        if (v17)
        {
          [v44 timeIntervalSinceDate:v17];
          double v22 = v21;
        }

        else
        {
          double v22 = 900.0;
        }

        [v43 triggersRestart];
        [v15 unsignedLongLongValue];
        if (v20)
        {
          -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v8,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"Device idle",  1.0,  0.0);
          -[_DASPolicyResponseRationale setResponseOptions:]( v8,  "setResponseOptions:",  (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 0x400);
          uint64_t v23 = 33LL;
          if (!v19) {
            goto LABEL_24;
          }
        }

        else
        {
          uint64_t v23 = 0LL;
          if (!v19)
          {
LABEL_24:
            if (v22 < 900.0)
            {
              -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v8,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"Minimum seconds since user was last active");
              -[_DASPolicyResponseRationale setResponseOptions:]( v8,  "setResponseOptions:",  (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 0x100);
              uint64_t v23 = 33LL;
            }

            int v25 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v23,  v8,  (double)0x384uLL));

            id v6 = v43;
            goto LABEL_27;
          }
        }

        [v11 timeIntervalSinceDate:v44];
        -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v8,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"Minimum seconds without any scheduled wake",  3600.0,  v24);
        -[_DASPolicyResponseRationale setResponseOptions:]( v8,  "setResponseOptions:",  (unint64_t)-[_DASPolicyResponseRationale responseOptions](v8, "responseOptions") | 1);
        uint64_t v23 = 33LL;
        goto LABEL_24;
      }
    }

    [v13 BOOLValue];
    goto LABEL_6;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"DeviceRestartPeriodNotInRange == 1"));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v8, "addRationaleWithCondition:", v34);

  deviceRestartPeriod1 = self->_deviceRestartPeriod1;
  if (deviceRestartPeriod1)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[_CDDateRange startDate](deviceRestartPeriod1, "startDate"));
    [v6 setStartAfter:v36];

    v37 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v6 startAfter]);
    [v37 timeIntervalSinceDate:v38];
    double v40 = v39;

    if (v40 < 0.0)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[_CDDateRange endDate](self->_deviceRestartPeriod1, "endDate"));
      [v6 setStartBefore:v41];
    }
  }

  int v25 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  33LL,  v8,  (double)0x384uLL));
LABEL_27:

  return v25;
}

- (id)blockReasons:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 rationale]);
  unsigned __int8 v7 = [v6 responseOptions];

  if ((v7 & 1) != 0)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@::WakeScheduled",  self->_policyName));
    [v5 addObject:v8];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 rationale]);
  unsigned __int8 v10 = [v9 responseOptions];

  if ((v10 & 2) != 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@::BacklightOn",  self->_policyName));
    [v5 addObject:v11];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 rationale]);
  unsigned __int8 v13 = [v12 responseOptions];

  if ((v13 & 4) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@::UserPresentActive",  self->_policyName));
    [v5 addObject:v14];
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 rationale]);
  unsigned __int8 v16 = [v15 responseOptions];

  if ((v16 & 8) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@::UserPresentPassiveWithDisplay",  self->_policyName));
    [v5 addObject:v17];
  }

  double v18 = (void *)objc_claimAutoreleasedReturnValue([v4 rationale]);
  unsigned __int8 v19 = [v18 responseOptions];

  if ((v19 & 0x10) != 0)
  {
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@::UserPresentPassiveWithoutDisplay",  self->_policyName));
    [v5 addObject:v20];
  }

  double v21 = (void *)objc_claimAutoreleasedReturnValue([v4 rationale]);
  unsigned __int8 v22 = [v21 responseOptions];

  if ((v22 & 0x20) != 0)
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@::UserRemoteClientActive",  self->_policyName));
    [v5 addObject:v23];
  }

  double v24 = (void *)objc_claimAutoreleasedReturnValue([v4 rationale]);
  unsigned __int8 v25 = [v24 responseOptions];

  if ((v25 & 0x40) != 0)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@::UserNotificationActive",  self->_policyName));
    [v5 addObject:v26];
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v4 rationale]);
  unsigned __int8 v28 = [v27 responseOptions];

  if ((v28 & 0x80) != 0)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@::AssertionsHeld",  self->_policyName));
    [v5 addObject:v29];
  }

  id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 rationale]);
  unsigned __int16 v31 = (unsigned __int16)[v30 responseOptions];

  if ((v31 & 0x100) != 0)
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@::UserActiveRecently",  self->_policyName));
    [v5 addObject:v32];
  }

  return v5;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (_CDContextualKeyPath)deviceAssertionsHeld
{
  return self->_deviceAssertionsHeld;
}

- (void)setDeviceAssertionsHeld:(id)a3
{
}

- (_CDContextualKeyPath)inUseStatus
{
  return self->_inUseStatus;
}

- (void)setInUseStatus:(id)a3
{
}

- (_CDContextualKeyPath)nextWakeRequest
{
  return self->_nextWakeRequest;
}

- (void)setNextWakeRequest:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (NSDate)lastCacheDate
{
  return (NSDate *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLastCacheDate:(id)a3
{
}

- (_CDDateRange)deviceRestartPeriod1
{
  return self->_deviceRestartPeriod1;
}

- (void)setDeviceRestartPeriod1:(id)a3
{
}

- (_CDDateRange)deviceRestartPeriod2
{
  return self->_deviceRestartPeriod2;
}

- (void)setDeviceRestartPeriod2:(id)a3
{
}

- (BOOL)isDeviceIdle
{
  return self->_isDeviceIdle;
}

- (void)setIsDeviceIdle:(BOOL)a3
{
  self->_isDeviceIdle = a3;
}

- (double)minDurationAfterLastUserInteraction
{
  return self->_minDurationAfterLastUserInteraction;
}

- (void)setMinDurationAfterLastUserInteraction:(double)a3
{
  self->_minDurationAfterLastUserInteraction = a3;
}

- (double)minDurationBeforeNextScheduledWake
{
  return self->_minDurationBeforeNextScheduledWake;
}

- (void)setMinDurationBeforeNextScheduledWake:(double)a3
{
  self->_minDurationBeforeNextScheduledWake = a3;
}

- (void).cxx_destruct
{
}

@end