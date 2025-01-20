@interface _DASNetworkSynchronizationPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)inPossibleSynchronizationWindow;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)shouldLogScoreToPowerLog;
- (NSArray)triggers;
- (NSIndexSet)affectedSeconds;
- (NSSet)spikeMinutes;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_source)timer;
- (_CDContext)context;
- (_DASNetworkSynchronizationPolicy)init;
- (double)lastUserInactivity;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)lastWakeDate;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (id)secondsFromSpikeMinutes:(id)a3 secondsBeforeSpike:(unint64_t)a4 secondsAfterSpike:(unint64_t)a5;
- (int)randomizationInterval;
- (int)recentActivityInterval;
- (int)recentWakeInterval;
- (unint64_t)secondsAfterSpike;
- (unint64_t)secondsBeforeSpike;
- (void)handleTimerFireAtDate:(id)a3 withContext:(id)a4;
- (void)postNotificationInWindow:(BOOL)a3;
- (void)setAffectedSeconds:(id)a3;
- (void)setContext:(id)a3;
- (void)setInPossibleSynchronizationWindow:(BOOL)a3;
- (void)setLastUserInactivity:(double)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setRandomizationInterval:(int)a3;
- (void)setRecentActivityInterval:(int)a3;
- (void)setRecentWakeInterval:(int)a3;
- (void)setSecondsAfterSpike:(unint64_t)a3;
- (void)setSecondsBeforeSpike:(unint64_t)a3;
- (void)setSpikeMinutes:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation _DASNetworkSynchronizationPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForChangeAtKeyPath:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForChangeAtKeyPath:",  v2));

  v7[0] = @"identifier";
  v7[1] = @"predicate";
  v8[0] = @"Network Synchronization Policy";
  v8[1] = v3;
  v7[2] = @"deviceSet";
  v7[3] = @"mustWake";
  v8[2] = &off_100121B40;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  4LL));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v5;
}

- (void)handleTimerFireAtDate:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 components:192 fromDate:v6]);
  id v10 = [v9 minute];
  v11 = (char *)[v9 second] + 60 * (void)v10;
  NSUInteger v12 = -[NSIndexSet indexGreaterThanOrEqualToIndex:](self->_affectedSeconds, "indexGreaterThanOrEqualToIndex:", v11);
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v12 == (void)v11)
  {
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"policy"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_1000B2458((uint64_t)v11, v25);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v26]);

    unsigned __int8 v28 = [v27 BOOLValue];
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForLastUseDate](&OBJC_CLASS____CDContextQueries, "keyPathForLastUseDate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v29]);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkSynchronizationPolicy lastWakeDate](self, "lastWakeDate"));
    [v6 timeIntervalSinceDate:v31];
    double v33 = v32;
    [v6 timeIntervalSinceDate:v30];
    self->_lastUserInactivity = v34;
    if ((v28 & 1) == 0
      && v33 > 0.0
      && v33 < (double)self->_recentWakeInterval
      && v34 > (double)self->_recentActivityInterval)
    {
      if (!self->_inPossibleSynchronizationWindow) {
        -[_DASNetworkSynchronizationPolicy postNotificationInWindow:](self, "postNotificationInWindow:", 1LL);
      }
      self->_inPossibleSynchronizationWindow = 1;
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"policy"));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        sub_1000B2424(v35, v36, v37, v38, v39, v40, v41, v42);
      }
    }

    unint64_t v43 = self->_secondsAfterSpike + self->_secondsBeforeSpike;
    uint32_t v44 = arc4random_uniform(self->_randomizationInterval);
    timer = self->_timer;
    dispatch_time_t v46 = dispatch_walltime(0LL, 1000000000 * (v43 + v44));
    dispatch_source_set_timer((dispatch_source_t)timer, v46, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
  }

  else
  {
    v14 = (char *)v12;
    if (self->_inPossibleSynchronizationWindow) {
      -[_DASNetworkSynchronizationPolicy postNotificationInWindow:](self, "postNotificationInWindow:", 0LL);
    }
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"policy"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1000B24CC(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    self->_inPossibleSynchronizationWindow = 0;
    v23 = self->_timer;
    dispatch_time_t v24 = dispatch_walltime(0LL, 1000000000 * (v14 - v11));
    dispatch_source_set_timer((dispatch_source_t)v23, v24, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
  }
}

- (id)secondsFromSpikeMinutes:(id)a3 secondsBeforeSpike:(unint64_t)a4 secondsAfterSpike:(unint64_t)a5
{
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v20 = *(void *)v22;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = 60 * (void)[*(id *)(*((void *)&v21 + 1) + 8 * (void)v11) unsignedLongValue];
        if (a4)
        {
          unint64_t v13 = v12 + 3599;
          unint64_t v14 = a4;
          do
          {
            [v8 addIndex:v13 % 0xE10];
            --v13;
            --v14;
          }

          while (v14);
        }

        unint64_t v15 = 0LL;
        unint64_t v16 = v12;
        do
        {
          [v8 addIndex:v15 + v12 - 3600 * (v16 / 0xE10)];
          ++v15;
          ++v16;
        }

        while (v15 <= a5);
        v11 = (char *)v11 + 1;
      }

      while (v11 != v10);
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v10);
  }

  id v17 = [v8 copy];
  return v17;
}

- (_DASNetworkSynchronizationPolicy)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS____DASNetworkSynchronizationPolicy;
  v2 = -[_DASNetworkSynchronizationPolicy init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Network Synchronization Policy";

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
    context = v3->_context;
    v3->_context = (_CDContext *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[_DASNetworkSynchronizationPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  &off_100121B58,  &off_100121B70,  &off_100121B88,  &off_100121BA0,  0LL));
    spikeMinutes = v3->_spikeMinutes;
    v3->_spikeMinutes = (NSSet *)v9;

    *(_OWORD *)&v3->_secondsBeforeSpike = xmmword_1000D83D0;
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[_DASNetworkSynchronizationPolicy secondsFromSpikeMinutes:secondsBeforeSpike:secondsAfterSpike:]( v3,  "secondsFromSpikeMinutes:secondsBeforeSpike:secondsAfterSpike:",  v3->_spikeMinutes,  30LL,  15LL));
    affectedSeconds = v3->_affectedSeconds;
    v3->_affectedSeconds = (NSIndexSet *)v11;

    v3->_recentActivityInterval = 300;
    *(void *)&v3->_randomizationInterval = 0xA000001C2LL;
    if (-[NSIndexSet count](v3->_affectedSeconds, "count"))
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
      unint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_source_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v14);
      timer = v3->_timer;
      v3->_timer = (OS_dispatch_source *)v15;

      id v17 = (dispatch_source_s *)v3->_timer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_100031278;
      handler[3] = &unk_1001150D0;
      uint64_t v18 = v3;
      __int128 v22 = v18;
      dispatch_source_set_event_handler(v17, handler);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      -[_DASNetworkSynchronizationPolicy handleTimerFireAtDate:withContext:]( v18,  "handleTimerFireAtDate:withContext:",  v19,  v3->_context);

      dispatch_activate((dispatch_object_t)v3->_timer);
    }
  }

  return v3;
}

+ (id)policyInstance
{
  if (qword_100157700 != -1) {
    dispatch_once(&qword_100157700, &stru_1001159A8);
  }
  return (id)qword_100157708;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 0.00001;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a4;
  if ([a3 isEqualToString:@"Network Synchronization Policy"])
  {
    if (+[_DASDeviceActivityPolicy isDeviceInUse:](&OBJC_CLASS____DASDeviceActivityPolicy, "isDeviceInUse:", v6)
      && self->_inPossibleSynchronizationWindow)
    {
      BOOL v7 = 0;
      self->_inPossibleSynchronizationWindow = 0;
    }

    else
    {
      BOOL v7 = 1;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_inPossibleSynchronizationWindow
    && [v4 requiresNetwork]
    && (id v6 = [v5 schedulingPriority], (unint64_t)v6 <= _DASSchedulingPriorityUtility))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 startDate]);
    if (v9 || +[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v5))
    {
      BOOL v7 = 0;
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 fastPass]);
      BOOL v7 = v10 == 0LL;
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)lastWakeDate
{
  size_t v5 = 16LL;
  sysctlbyname("kern.waketime", v6, &v5, 0LL, 0LL);
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)v6[1] / 1000000000.0 + (double)v6[0]));
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"policy"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Last wake date: %@", buf, 0xCu);
  }

  return v2;
}

- (void)postNotificationInWindow:(BOOL)a3
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(-2LL, 0LL);
  size_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000315F8;
  block[3] = &unk_1001159C8;
  BOOL v7 = a3;
  dispatch_async(v5, block);
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  size_t v5 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  self->_policyName);
  if (self->_inPossibleSynchronizationWindow
    && _os_feature_enabled_impl("DAS", "network_synchronization_policy"))
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v5,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"lastUserActivity",  (double)self->_recentActivityInterval,  self->_lastUserInactivity);
    uint64_t v6 = 33LL;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v6,  v5,  (double)0x384uLL));

  return v7;
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

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)inPossibleSynchronizationWindow
{
  return self->_inPossibleSynchronizationWindow;
}

- (void)setInPossibleSynchronizationWindow:(BOOL)a3
{
  self->_inPossibleSynchronizationWindow = a3;
}

- (double)lastUserInactivity
{
  return self->_lastUserInactivity;
}

- (void)setLastUserInactivity:(double)a3
{
  self->_lastUserInactivity = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSIndexSet)affectedSeconds
{
  return self->_affectedSeconds;
}

- (void)setAffectedSeconds:(id)a3
{
}

- (NSSet)spikeMinutes
{
  return self->_spikeMinutes;
}

- (void)setSpikeMinutes:(id)a3
{
}

- (unint64_t)secondsBeforeSpike
{
  return self->_secondsBeforeSpike;
}

- (void)setSecondsBeforeSpike:(unint64_t)a3
{
  self->_secondsBeforeSpike = a3;
}

- (unint64_t)secondsAfterSpike
{
  return self->_secondsAfterSpike;
}

- (void)setSecondsAfterSpike:(unint64_t)a3
{
  self->_secondsAfterSpike = a3;
}

- (int)randomizationInterval
{
  return self->_randomizationInterval;
}

- (void)setRandomizationInterval:(int)a3
{
  self->_randomizationInterval = a3;
}

- (int)recentWakeInterval
{
  return self->_recentWakeInterval;
}

- (void)setRecentWakeInterval:(int)a3
{
  self->_recentWakeInterval = a3;
}

- (int)recentActivityInterval
{
  return self->_recentActivityInterval;
}

- (void)setRecentActivityInterval:(int)a3
{
  self->_recentActivityInterval = a3;
}

- (void).cxx_destruct
{
}

@end