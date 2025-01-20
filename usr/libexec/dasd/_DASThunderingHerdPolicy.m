@interface _DASThunderingHerdPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)ignoreTH;
- (BOOL)recentTriggerEvent;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (BOOL)waitingForInactivity;
- (NSArray)triggers;
- (NSDate)eventTriggerTime;
- (NSString)policyDescription;
- (NSString)policyName;
- (NSString)recentTriggerReason;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)longTermTimer;
- (OS_dispatch_source)shortTermTimer;
- (_DASThunderingHerdPolicy)init;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)handleTriggerEvent;
- (void)setEventTriggerTime:(id)a3;
- (void)setIgnoreTH:(BOOL)a3;
- (void)setLongTermTimer:(id)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecentTriggerEvent:(BOOL)a3;
- (void)setRecentTriggerReason:(id)a3;
- (void)setShortTermTimer:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setWaitingForInactivity:(BOOL)a3;
@end

@implementation _DASThunderingHerdPolicy

- (id)initializeTriggers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](&OBJC_CLASS____CDContextQueries, "keyPathForPluginStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:",  v2,  &off_100121D68,  14400.0));

  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForKeybagLockStatus]( &OBJC_CLASS____CDContextQueries,  "keyPathForKeybagLockStatus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:",  v3,  &off_100121D80,  14400.0));

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForWiFiConnectionQuality]( &OBJC_CLASS____CDContextQueries,  "keyPathForWiFiConnectionQuality"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self.value == %@",  &off_100121D80));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualPredicate predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:]( &OBJC_CLASS____CDContextualPredicate,  "predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:",  v4,  v5,  v6,  14400.0));

  v19[0] = @"identifier";
  v19[1] = @"predicate";
  v20[0] = @"com.apple.duetactivityscheduler.thpolicy.lengthyUnplug";
  v20[1] = v14;
  v19[2] = @"deviceSet";
  v19[3] = @"mustWake";
  v20[2] = &off_100121D98;
  v20[3] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));
  v21[0] = v7;
  v17[0] = @"identifier";
  v17[1] = @"predicate";
  v18[0] = @"com.apple.duetactivityscheduler.thpolicy.lengthyLock";
  v18[1] = v13;
  v17[2] = @"deviceSet";
  v17[3] = @"mustWake";
  v18[2] = &off_100121D98;
  v18[3] = &__kCFBooleanTrue;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  4LL));
  v21[1] = v8;
  v15[0] = @"identifier";
  v15[1] = @"predicate";
  v16[0] = @"com.apple.duetactivityscheduler.thpolicy.lengthyNoNetwork";
  v16[1] = v12;
  v15[2] = @"deviceSet";
  v15[3] = @"mustWake";
  v16[2] = &off_100121D98;
  v16[3] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  4LL));
  v21[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));

  return v10;
}

- (_DASThunderingHerdPolicy)init
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS____DASThunderingHerdPolicy;
  v2 = -[_DASThunderingHerdPolicy init](&v30, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Thundering Herd Policy";

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.dasd.thunderingHerdPolicy.syncQueue", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    dispatch_source_t v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v3->_queue);
    shortTermTimer = v3->_shortTermTimer;
    v3->_shortTermTimer = (OS_dispatch_source *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[_DASThunderingHerdPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v11;

    dispatch_source_set_timer( (dispatch_source_t)v3->_shortTermTimer,  0xFFFFFFFFFFFFFFFFLL,  0xFFFFFFFFFFFFFFFFLL,  0xE8D4A51000uLL);
    dispatch_set_qos_class_fallback(v3->_shortTermTimer, 17LL);
    v13 = (dispatch_source_s *)v3->_shortTermTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10004D098;
    handler[3] = &unk_1001150D0;
    v14 = v3;
    v29 = v14;
    dispatch_source_set_event_handler(v13, handler);
    dispatch_activate((dispatch_object_t)v3->_shortTermTimer);
    dispatch_source_t v15 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v3->_queue);
    dispatch_source_t v16 = v14[7];
    v14[7] = v15;

    dispatch_source_set_timer(v14[7], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xE8D4A51000uLL);
    dispatch_set_qos_class_fallback(v14[7], 17LL);
    v17 = v14[7];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10004D0A4;
    v26[3] = &unk_1001150D0;
    v18 = v14;
    v27 = v18;
    dispatch_source_set_event_handler(v17, v26);
    dispatch_activate(v14[7]);
    v19 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
    *((_BYTE *)v18 + 10) = -[NSUserDefaults BOOLForKey:](v19, "BOOLForKey:", @"ignoreTH");

    if (*((_BYTE *)v18 + 10))
    {
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"thpolicy"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Ignoring TH triggers!", buf, 2u);
      }
    }

    v21 = (dispatch_queue_s *)v3->_queue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10004D0B0;
    v23[3] = &unk_100115388;
    v24 = v18;
    notify_register_dispatch("com.apple.dasd.thunderingHerdTrigger", (int *)&unk_1001579E8, v21, v23);
  }

  return v3;
}

- (void)setRecentTriggerEvent:(BOOL)a3
{
  BOOL v3 = a3;
  self->_recentTriggerEvent = a3;
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"thpolicy"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting recent trigger event to %u",  (uint8_t *)v5,  8u);
  }
}

- (void)setWaitingForInactivity:(BOOL)a3
{
  BOOL v3 = a3;
  self->_waitingForInactivity = a3;
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"thpolicy"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Set waiting for user inactivity to %u",  (uint8_t *)v5,  8u);
  }
}

+ (id)policyInstance
{
  if (qword_1001579F0 != -1) {
    dispatch_once(&qword_1001579F0, &stru_100116088);
  }
  return (id)qword_1001579F8;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  if ([v3 budgeted])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fileProtection]);
    dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](&OBJC_CLASS____DASFileProtection, "complete"));
    unsigned int v6 = [v4 isEqual:v5] ^ 1;
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)handleTriggerEvent
{
  shortTermTimer = self->_shortTermTimer;
  dispatch_time_t v4 = dispatch_walltime(0LL, 300000000000LL);
  dispatch_source_set_timer((dispatch_source_t)shortTermTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3E8uLL);
  longTermTimer = self->_longTermTimer;
  dispatch_time_t v6 = dispatch_walltime(0LL, 900000000000LL);
  dispatch_source_set_timer((dispatch_source_t)longTermTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3E8uLL);
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6 = a3;
  if (([v6 isEqualToString:@"com.apple.duetactivityscheduler.thpolicy.lengthyUnplug"] & 1) != 0 || (objc_msgSend( v6,  "isEqualToString:",  @"com.apple.duetactivityscheduler.thpolicy.lengthyLock") & 1) != 0 || objc_msgSend( v6,  "isEqualToString:",  @"com.apple.duetactivityscheduler.thpolicy.lengthyNoNetwork"))
  {
    -[_DASThunderingHerdPolicy handleTriggerEvent](self, "handleTriggerEvent");
    +[_DASMetricRecorder recordOccurrenceForKey:]( &OBJC_CLASS____DASMetricRecorder,  "recordOccurrenceForKey:",  @"com.apple.dasd.thunderingHerdTrigger");
    objc_storeStrong((id *)&self->_recentTriggerReason, a3);
  }

  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_recentTriggerEvent)
  {
    if (!self->_waitingForInactivity) {
      goto LABEL_7;
    }
  }

  else if (!self->_waitingForInactivity)
  {
LABEL_8:
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  0LL,  0LL,  (double)0x384uLL));
    goto LABEL_20;
  }

  if (!+[_DASDeviceActivityPolicy isDeviceInUse:](&OBJC_CLASS____DASDeviceActivityPolicy, "isDeviceInUse:", v7)) {
    -[_DASThunderingHerdPolicy setWaitingForInactivity:](self, "setWaitingForInactivity:", 0LL);
  }
LABEL_7:
  if (self->_ignoreTH) {
    goto LABEL_8;
  }
  dispatch_source_t v9 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Thundering Herd Policy");
  if (self->_recentTriggerEvent)
  {
    v10 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"timeSinceThunderingHerdTriggerEvent < %@",  &off_100121DB0,  v21);
  }

  else
  {
    if (!self->_waitingForInactivity
      || !+[_DASDeviceActivityPolicy isDeviceInUse:](&OBJC_CLASS____DASDeviceActivityPolicy, "isDeviceInUse:", v7))
    {
      uint64_t v13 = 0LL;
      uint64_t v14 = 0LL;
      goto LABEL_16;
    }

    v10 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"deviceInUse == %u and timeSinceThunderingHerdTriggerEvent < %@",  1LL,  &off_100121DC8);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"recentTriggerReason == %@",  self->_recentTriggerReason));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v12);

  uint64_t v13 = 1LL;
  uint64_t v14 = 33LL;
LABEL_16:
  v22 = @"ThunderingHerd";
  dispatch_source_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13));
  v23 = v15;
  dispatch_source_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](&OBJC_CLASS____DASPPSDataManager, "sharedInstance"));
  [v17 sendDataToPPS:v16 subsystem:@"BackgroundProcessing" category:@"SystemConditionsOther"];

  if (+[_DASPhotosPolicy isActivity:consideredNonDiscretionary:]( &OBJC_CLASS____DASPhotosPolicy,  "isActivity:consideredNonDiscretionary:",  v6,  v7))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"isPhotosConsideredNonDiscretionary == 1"));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v18);

    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithScore:validityDuration:rationale:",  v9,  0.8,  (double)0x384uLL));
  }

  else
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v14,  v9,  (double)0x384uLL));
  }

  v8 = (void *)v19;

LABEL_20:
  return v8;
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

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)shortTermTimer
{
  return self->_shortTermTimer;
}

- (void)setShortTermTimer:(id)a3
{
}

- (OS_dispatch_source)longTermTimer
{
  return self->_longTermTimer;
}

- (void)setLongTermTimer:(id)a3
{
}

- (NSDate)eventTriggerTime
{
  return self->_eventTriggerTime;
}

- (void)setEventTriggerTime:(id)a3
{
}

- (NSString)recentTriggerReason
{
  return self->_recentTriggerReason;
}

- (void)setRecentTriggerReason:(id)a3
{
}

- (BOOL)recentTriggerEvent
{
  return self->_recentTriggerEvent;
}

- (BOOL)waitingForInactivity
{
  return self->_waitingForInactivity;
}

- (BOOL)ignoreTH
{
  return self->_ignoreTH;
}

- (void)setIgnoreTH:(BOOL)a3
{
  self->_ignoreTH = a3;
}

- (void).cxx_destruct
{
}

@end