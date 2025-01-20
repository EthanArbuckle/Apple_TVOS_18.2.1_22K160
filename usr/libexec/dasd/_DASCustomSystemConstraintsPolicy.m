@interface _DASCustomSystemConstraintsPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)heavyDiskUsage;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSMutableDictionary)workloadDates;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)resetTimer;
- (_DASCustomSystemConstraintsPolicy)init;
- (_DASDaemon)daemon;
- (double)weightForActivity:(id)a3;
- (id)initializeTriggers;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (int64_t)gpWorkloadCounts;
- (void)armResetTimer;
- (void)cancelResetTimer;
- (void)reevaluateAllActivitiesWithDaemon:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setGpWorkloadCounts:(int64_t)a3;
- (void)setHeavyDiskUsage:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResetTimer:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setWorkloadDates:(id)a3;
- (void)updateHeavyDiskUsage:(BOOL)a3;
- (void)updateSystemConstraint:(id)a3 withState:(BOOL)a4 withDaemon:(id)a5;
@end

@implementation _DASCustomSystemConstraintsPolicy

- (id)initializeTriggers
{
  v5 = @"identifier";
  v6 = @"com.apple.duetactivityscheduler.customsystemconstraint";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
  v7 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

  return v3;
}

- (_DASCustomSystemConstraintsPolicy)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____DASCustomSystemConstraintsPolicy;
  v2 = -[_DASCustomSystemConstraintsPolicy init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Custom System Constraints Policy";

    v3->_heavyDiskUsage = 0;
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    workloadDates = v3->_workloadDates;
    v3->_workloadDates = (NSMutableDictionary *)v5;

    resetTimer = v3->_resetTimer;
    v3->_gpWorkloadCounts = 0LL;
    v3->_resetTimer = 0LL;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[_DASCustomSystemConstraintsPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v8;

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.dasd.sysConstraint", v11);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v12;
  }

  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A0FA8;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157CB8 != -1) {
    dispatch_once(&qword_100157CB8, block);
  }
  return (id)qword_100157CC0;
}

- (void)reevaluateAllActivitiesWithDaemon:(id)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_workloadDates,  "objectForKeyedSubscript:",  kDASSystemContextMCWorkloadRunningState));
  if (v5)
  {

LABEL_4:
    int v7 = 0;
    goto LABEL_5;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_workloadDates,  "objectForKeyedSubscript:",  kDASSystemContextGPWorkloadRunningState));

  if (v6) {
    goto LABEL_4;
  }
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Reevaluate to unblock activities from system constraint policy!",  v14,  2u);
  }

  int v7 = 1;
LABEL_5:
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_workloadDates,  "objectForKeyedSubscript:",  kDASSystemContextGPWorkloadRunningState));
  if (v8)
  {
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_workloadDates,  "objectForKeyedSubscript:",  kDASSystemContextMCWorkloadRunningState));

    if (!v9)
    {
      if (!v7) {
        return;
      }
      goto LABEL_11;
    }
  }

  dispatch_queue_attr_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Reevaluate to block activities from system constraint policy!",  v14,  2u);
  }

LABEL_11:
  if (a3)
  {
    daemon = self->_daemon;
    objc_super v15 = @"com.apple.duetactivityscheduler.customsystemconstraint";
    dispatch_queue_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    -[_DASDaemon handleTriggersBatched:](daemon, "handleTriggersBatched:", v12);
  }

  else
  {
    dispatch_queue_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000B8CBC(v12);
    }
  }
}

- (void)armResetTimer
{
  if (!self->_resetTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    resetTimer = self->_resetTimer;
    self->_resetTimer = v3;

    uint64_t v5 = self->_resetTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000A1348;
    handler[3] = &unk_1001150D0;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
    v6 = self->_resetTimer;
    dispatch_time_t v7 = dispatch_walltime(0LL, 300000000000LL);
    dispatch_source_set_timer((dispatch_source_t)v6, v7, 0x45D964B800uLL, 0xDF8475800uLL);
    dispatch_activate((dispatch_object_t)self->_resetTimer);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = &off_100122080;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Armed timer to fire in %@", buf, 0xCu);
    }
  }

- (void)cancelResetTimer
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000B8CFC(v3);
  }

  resetTimer = self->_resetTimer;
  if (resetTimer && !dispatch_source_testcancel((dispatch_source_t)resetTimer))
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Canceled timer", v7, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_resetTimer);
    v6 = self->_resetTimer;
    self->_resetTimer = 0LL;
  }

- (void)updateHeavyDiskUsage:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting _heavyDiskUsage = %d", buf, 8u);
  }

  self->_heavyDiskUsage = v3;
  if (v3)
  {
    dispatch_time_t v6 = dispatch_time(0LL, 15000000000LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A1878;
    block[3] = &unk_1001150D0;
    block[4] = self;
    dispatch_after(v6, v8, block);
  }

- (void)updateSystemConstraint:(id)a3 withState:(BOOL)a4 withDaemon:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_attr_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"customsysconstraints"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v28 = [v8 UTF8String];
    __int16 v29 = 1024;
    BOOL v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting %s running state = %d", buf, 0x12u);
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_workloadDates, "objectForKeyedSubscript:", v8));
  if ([v8 isEqualToString:kDASSystemContextKeyHeavyDiskUsage])
  {
    -[_DASCustomSystemConstraintsPolicy updateHeavyDiskUsage:](self, "updateHeavyDiskUsage:", v6);
    goto LABEL_10;
  }

  if ([v8 isEqualToString:kDASSystemContextMCWorkloadRunningState])
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A1B54;
    block[3] = &unk_1001173E0;
    BOOL v26 = v6;
    id v22 = v11;
    v23 = self;
    id v24 = v8;
    id v25 = v9;
    dispatch_sync(queue, block);

    v13 = v22;
  }

  else
  {
    v14 = (dispatch_queue_s *)self->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000A1CD4;
    v17[3] = &unk_100117408;
    BOOL v20 = v6;
    v17[4] = self;
    id v18 = v8;
    id v19 = v9;
    dispatch_sync(v14, v17);

    v13 = v18;
  }

LABEL_10:
  daemon = self->_daemon;
  p_daemon = &self->_daemon;
  if (!daemon) {
    objc_storeStrong((id *)p_daemon, a5);
  }
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = [a3 schedulingPriority];
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return objc_msgSend( a3,  "isEqualToString:",  @"com.apple.duetactivityscheduler.customsystemconstraint",  a4) ^ 1;
}

- (double)weightForActivity:(id)a3
{
  return 0.1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[_DASPolicyResponseRationale initWithPolicyName:]( objc_alloc(&OBJC_CLASS____DASPolicyResponseRationale),  "initWithPolicyName:",  @"Custom System Constraints Policy");
  id v9 = self;
  objc_sync_enter(v9);
  if (v9->_heavyDiskUsage)
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v8,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"heavyDiskUsage",  0.0,  1.0);
    uint64_t v10 = 100LL;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  if (!+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v6))
  {
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v9->_workloadDates,  "objectForKeyedSubscript:",  kDASSystemContextGPWorkloadRunningState));
    if (v11)
    {
      dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 relatedApplications]);
      unsigned __int8 v13 = [v12 containsObject:@"com.apple.GenerativePlaygroundApp"];

      if ((v13 & 1) == 0)
      {
        -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v8,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"gpRunning",  0.0,  1.0);
        uint64_t v10 = 100LL;
      }
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v9->_workloadDates,  "objectForKeyedSubscript:",  kDASSystemContextMCWorkloadRunningState));

    if (v14)
    {
      -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:]( v8,  "addRationaleForCondition:withRequiredValue:withCurrentValue:",  @"mcRunning",  0.0,  1.0);
      uint64_t v10 = 100LL;
    }
  }

  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:]( &OBJC_CLASS____DASPolicyResponse,  "policyResponseWithDecision:validityDuration:rationale:",  v10,  v8,  15.0));
  objc_sync_exit(v9);

  return v15;
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

- (BOOL)heavyDiskUsage
{
  return self->_heavyDiskUsage;
}

- (void)setHeavyDiskUsage:(BOOL)a3
{
  self->_heavyDiskUsage = a3;
}

- (NSMutableDictionary)workloadDates
{
  return self->_workloadDates;
}

- (void)setWorkloadDates:(id)a3
{
}

- (int64_t)gpWorkloadCounts
{
  return self->_gpWorkloadCounts;
}

- (void)setGpWorkloadCounts:(int64_t)a3
{
  self->_gpWorkloadCounts = a3;
}

- (OS_dispatch_source)resetTimer
{
  return self->_resetTimer;
}

- (void)setResetTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end