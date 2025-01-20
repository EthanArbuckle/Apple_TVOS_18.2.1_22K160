@interface PRXPCActivityManager
- (BOOL)proceedWithPowerStatsQuery;
- (PRXPCActivityManager)init;
- (PRXPCActivityManager)initWithQueue:(id)a3;
- (void)checkInForActivityWithCriteria:(id)a3 identifier:(id)a4;
- (void)cleanupPowerState;
- (void)registerForActivityWithIdentifier:(id)a3;
- (void)runActivityWithIdentifier:(id)a3;
- (void)sendAnalyticsHeartbeatWasSuccessful:(BOOL)a3;
- (void)setupActivityInterval;
@end

@implementation PRXPCActivityManager

- (PRXPCActivityManager)init
{
  return 0LL;
}

- (PRXPCActivityManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PRXPCActivityManager;
  v6 = -[PRXPCActivityManager init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    activities = v7->_activities;
    v7->_activities = v8;

    -[PRXPCActivityManager setupActivityInterval](v7, "setupActivityInterval");
    -[PRXPCActivityManager registerForActivityWithIdentifier:]( v7,  "registerForActivityWithIdentifier:",  @"com.apple.Proximity.LogPowerStatistics");
    v10 = sub_100005150();
    v7->_enableDeepSleepHeartbeat = sub_100355268((uint64_t)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"AllowRoseDeepSleep"]);
    BOOL v13 = v12 == 0LL;

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned __int8 v15 = [v14 BOOLForKey:@"AllowRoseDeepSleep"];
      if (v7->_enableDeepSleepHeartbeat) {
        unsigned __int8 v16 = v15;
      }
      else {
        unsigned __int8 v16 = 0;
      }
      v7->_enableDeepSleepHeartbeat = v16;
    }

    v17 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      if (v7->_enableDeepSleepHeartbeat) {
        v18 = "Y";
      }
      else {
        v18 = "N";
      }
      *(_DWORD *)buf = 136315138;
      v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DSLP heartbeat enabled: %s", buf, 0xCu);
    }
  }

  return v7;
}

- (void)setupActivityInterval
{
  int64_t v3 = XPC_ACTIVITY_INTERVAL_15_MIN;
  self->_xpcActivityInterval = XPC_ACTIVITY_INTERVAL_30_MIN;
  self->_xpcActivityGracePeriod = XPC_ACTIVITY_INTERVAL_15_MIN;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"UWBDSLPHeartbeatInterval"]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 stringForKey:@"UWBDSLPHeartbeatInterval"]);
    if ([v5 isEqualToString:@"1minute"])
    {
      int64_t v3 = XPC_ACTIVITY_INTERVAL_1_MIN;
      self->_xpcActivityInterval = XPC_ACTIVITY_INTERVAL_1_MIN;
    }

    else if ([v5 isEqualToString:@"5minutes"])
    {
      self->_xpcActivityInterval = XPC_ACTIVITY_INTERVAL_5_MIN;
      int64_t v3 = XPC_ACTIVITY_INTERVAL_1_MIN;
    }

    else
    {
      if (![v5 isEqualToString:@"30minutes"])
      {
LABEL_9:

        goto LABEL_10;
      }

      self->_xpcActivityInterval = XPC_ACTIVITY_INTERVAL_30_MIN;
    }

    self->_xpcActivityGracePeriod = v3;
    goto LABEL_9;
  }

- (void)registerForActivityWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.Proximity.LogPowerStatistics"])
  {
    id v5 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "registering for activity: %@",  (uint8_t *)&v7,  0xCu);
    }

    xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, self->_xpcActivityInterval);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, self->_xpcActivityGracePeriod);
    -[PRXPCActivityManager checkInForActivityWithCriteria:identifier:]( self,  "checkInForActivityWithCriteria:identifier:",  v6,  v4);
  }
}

- (void)checkInForActivityWithCriteria:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (const char *)[v7 UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000133E8;
  handler[3] = &unk_1007A2270;
  id v9 = v6;
  id v12 = v9;
  BOOL v13 = self;
  id v10 = v7;
  id v14 = v10;
  xpc_activity_register(v8, XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)runActivityWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "running activity with identifier: %@",  buf,  0xCu);
  }

  if ([v4 isEqualToString:@"com.apple.Proximity.LogPowerStatistics"])
  {
    if (!-[PRXPCActivityManager proceedWithPowerStatsQuery](self, "proceedWithPowerStatsQuery"))
    {
      id v6 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100389568(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }

    id v14 = sub_100288340();
    sub_10028B170((uint64_t)v14, 1000LL, (uint64_t)buf);
    -[PRXPCActivityManager cleanupPowerState](self, "cleanupPowerState");
    if (v35)
    {
      CFAbsoluteTimeGetCurrent();
      if (!v35) {
        sub_100006080();
      }
      v30[0] = *(_OWORD *)buf;
      v30[1] = v33;
      v31[0] = *(_OWORD *)v34;
      *(_OWORD *)((char *)v31 + 12) = *(_OWORD *)&v34[12];
      sub_1001797E4((unsigned int *)v30);
    }

    else
    {
      v22 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100389538(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }

  else
  {
    unsigned __int8 v15 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100389598((uint64_t)v4, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (BOOL)proceedWithPowerStatsQuery
{
  if (self->_enableDeepSleepHeartbeat
    && (self->_deepSleepHeartbeatPowerRequested = 0, int64_t v3 = sub_100288340(), sub_10028B714((uint64_t)v3)))
  {
    id v4 = sub_100288340();
    uint64_t v5 = sub_10028B180((uint64_t)v4, 1);
    id v6 = (os_log_s *)qword_1008000A0;
    if ((_DWORD)v5)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned __int8 v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#heartbeat waking UWB chip", v15, 2u);
      }

      self->_deepSleepHeartbeatPowerRequested = 1;
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_100389600(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    -[PRXPCActivityManager sendAnalyticsHeartbeatWasSuccessful:](self, "sendAnalyticsHeartbeatWasSuccessful:", v5);
  }

  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)cleanupPowerState
{
  if (self->_enableDeepSleepHeartbeat)
  {
    int64_t v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#heartbeat enter DSLP after heartbeat",  v5,  2u);
    }

    if (self->_deepSleepHeartbeatPowerRequested)
    {
      id v4 = sub_100288340();
      sub_10028B180((uint64_t)v4, 0);
    }
  }

- (void)sendAnalyticsHeartbeatWasSuccessful:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = v5;
  if (self->_enableDeepSleepHeartbeat) {
    uint64_t v7 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v7 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, @"HeartbeatIsEnabled");
  if (v3) {
    uint64_t v8 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v8 = &__kCFBooleanFalse;
  }
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v8, @"HeartbeatStatus");
  if (v3) {
    uint64_t v9 = &off_1007D2298;
  }
  else {
    uint64_t v9 = &off_1007D22B0;
  }
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v9, @"HeartbeatFailure");
  if (v3) {
    uint64_t v10 = &off_1007D22B0;
  }
  else {
    uint64_t v10 = &off_1007D2298;
  }
  -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v10, @"HeartbeatSuccess");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000139E0;
  v12[3] = &unk_1007A2298;
  id v11 = -[NSMutableDictionary mutableCopy](v6, "mutableCopy");
  id v13 = v11;
  AnalyticsSendEventLazy(@"com.apple.nearbyd.uwb.deepsleep.heartbeat", v12);
  sub_100179ACC(v3);
}

- (void).cxx_destruct
{
}

@end