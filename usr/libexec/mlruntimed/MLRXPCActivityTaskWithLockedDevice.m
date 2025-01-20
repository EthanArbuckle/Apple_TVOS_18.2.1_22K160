@interface MLRXPCActivityTaskWithLockedDevice
- (BOOL)activityDeferred;
- (BOOL)bypassDiagnosticsUsage;
- (BOOL)dynamicallyRegistered;
- (MLRTaskScheduler)taskScheduler;
- (NSString)description;
- (NSString)identifier;
- (OS_xpc_object)activity;
- (_xpc_activity_eligibility_changed_handler_s)eligibilityHandler;
- (id)createTaskScheduler;
- (id)criteria;
- (void)setActivity:(id)a3;
- (void)setActivityDeferred:(BOOL)a3;
- (void)setEligibilityHandler:(_xpc_activity_eligibility_changed_handler_s *)a3;
- (void)startTaskWithCompletion:(id)a3;
- (void)stop;
@end

@implementation MLRXPCActivityTaskWithLockedDevice

- (BOOL)bypassDiagnosticsUsage
{
  return 0;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.mlruntimed.xpc_activity-orchestra";
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithLockedDevice identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithLockedDevice activity](self, "activity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithLockedDevice criteria](self, "criteria"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"identifier=%@, activity=%@, criteria=%@",  v3,  v4,  v5));

  return (NSString *)v6;
}

- (id)criteria
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (allowCustomWakeUpPeriod())
  {
    v3 = objc_opt_new(&OBJC_CLASS___MLRSchedulerRecord);
    int64_t v4 = -[MLRSchedulerRecord wakeUpPeriodInSeconds](v3, "wakeUpPeriodInSeconds");
  }

  else
  {
    int64_t v4 = XPC_ACTIVITY_INTERVAL_1_DAY;
  }

  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, v4);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION, XPC_ACTIVITY_NETWORK_TRANSFER_BIDIRECTIONAL);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_CPU_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);
  return v2;
}

- (id)createTaskScheduler
{
  return  -[MLRTaskScheduler initWithBaseURL:localeIdentifier:fromDesTool:]( objc_alloc(&OBJC_CLASS___MLRTaskScheduler),  "initWithBaseURL:localeIdentifier:fromDesTool:",  0LL,  0LL,  0LL);
}

- (void)startTaskWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DESBundleRegistry sharedInstance](&OBJC_CLASS___DESBundleRegistry, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allNonFedStatsUnrestrictedBundleIds]);

  v7 = (MLRTaskScheduler *)objc_claimAutoreleasedReturnValue(-[MLRXPCActivityTaskWithLockedDevice createTaskScheduler](self, "createTaskScheduler"));
  taskScheduler = self->_taskScheduler;
  self->_taskScheduler = v7;

  v9 = self->_taskScheduler;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100002674;
  v11[3] = &unk_100014668;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  -[MLRTaskScheduler startTasksForPluginIDs:completion:](v9, "startTasksForPluginIDs:completion:", v6, v11);
}

- (void)stop
{
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (BOOL)activityDeferred
{
  return self->_activityDeferred;
}

- (void)setActivityDeferred:(BOOL)a3
{
  self->_activityDeferred = a3;
}

- (BOOL)dynamicallyRegistered
{
  return self->_dynamicallyRegistered;
}

- (_xpc_activity_eligibility_changed_handler_s)eligibilityHandler
{
  return self->_eligibilityHandler;
}

- (void)setEligibilityHandler:(_xpc_activity_eligibility_changed_handler_s *)a3
{
  self->_eligibilityHandler = a3;
}

- (MLRTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (void).cxx_destruct
{
}

@end