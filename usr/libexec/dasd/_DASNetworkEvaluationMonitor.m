@interface _DASNetworkEvaluationMonitor
+ (BOOL)inexpensivePathAvailable;
+ (_DASNetworkEvaluationMonitor)sharedInstance;
+ (id)defaultInexpensivePathEvaluator;
+ (id)defaultPathEvaluator;
+ (id)defaultUnconstrainedPathEvaluator;
+ (id)nwParametersForActivity:(id)a3;
- (BOOL)isNetworkPathAvailableForActivity:(id)a3;
- (BOOL)isUnconstrainedPathAvailableForActivity:(id)a3;
- (BOOL)requiresNetworkPathMonitoring:(id)a3;
- (NSMutableArray)networkEvaluationGroups;
- (OS_dispatch_queue)callbackQueue;
- (OS_os_log)log;
- (_DASNetworkEvaluationMonitor)init;
- (id)callback;
- (id)evaluationGroupForActivityID:(id)a3;
- (id)evaluationGroupForParameters:(id)a3 endpoint:(id)a4;
- (id)setupNetworkMonitoringWithNetworkParameters:(id)a3 endpoint:(id)a4 withActivityID:(id)a5;
- (os_unfair_recursive_lock_s)lock;
- (void)registerForNetworkEvaluationWithCallback:(id)a3;
- (void)setCallback:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setLock:(os_unfair_recursive_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setNetworkEvaluationGroups:(id)a3;
- (void)startMonitoringActivity:(id)a3 withNetworkParameters:(id)a4 withEndpoint:(id)a5;
- (void)stopMonitoringActivity:(id)a3;
@end

@implementation _DASNetworkEvaluationMonitor

- (_DASNetworkEvaluationMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____DASNetworkEvaluationMonitor;
  v2 = -[_DASNetworkEvaluationMonitor init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    networkEvaluationGroups = v2->_networkEvaluationGroups;
    v2->_networkEvaluationGroups = (NSMutableArray *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.NetworkEvaluationMonitor.serial", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    os_log_t v9 = os_log_create("com.apple.duetactivityscheduler", "NetworkEvaluationMonitor");
    log = v2->_log;
    v2->_log = v9;

    v2->_lock = 0LL;
  }

  return v2;
}

+ (_DASNetworkEvaluationMonitor)sharedInstance
{
  if (qword_100157CC8 != -1) {
    dispatch_once(&qword_100157CC8, &stru_100117450);
  }
  return (_DASNetworkEvaluationMonitor *)(id)qword_100157CD0;
}

+ (id)defaultPathEvaluator
{
  if (qword_100157CD8 != -1) {
    dispatch_once(&qword_100157CD8, &stru_100117470);
  }
  return (id)qword_100157CE0;
}

+ (id)defaultInexpensivePathEvaluator
{
  if (qword_100157CE8 != -1) {
    dispatch_once(&qword_100157CE8, &stru_100117490);
  }
  return (id)qword_100157CF0;
}

+ (id)defaultUnconstrainedPathEvaluator
{
  if (qword_100157CF8 != -1) {
    dispatch_once(&qword_100157CF8, &stru_1001174B0);
  }
  return (id)qword_100157D00;
}

+ (id)nwParametersForActivity:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kNWParametersKey]);

  if (!v5)
  {
    if ([v3 requiresInexpensiveNetworking])
    {
      if (qword_100157D08 != -1) {
        dispatch_once(&qword_100157D08, &stru_1001174D0);
      }
      v6 = &qword_100157D10;
    }

    else
    {
      if (qword_100157D18 != -1) {
        dispatch_once(&qword_100157D18, &stru_1001174F0);
      }
      v6 = &qword_100157D20;
    }

    id v5 = (id)*v6;
  }

  return v5;
}

+ (BOOL)inexpensivePathAvailable
{
  id v2 = [(id)objc_opt_class(a1) defaultInexpensivePathEvaluator];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  id v5 = [v4 status];

  return v5 != (id)2;
}

- (void)registerForNetworkEvaluationWithCallback:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id callback = self->_callback;
  self->_id callback = v4;
}

- (BOOL)requiresNetworkPathMonitoring:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kNWEndpointKey]);
  BOOL v5 = v4 != 0LL;

  return v5;
}

- (void)startMonitoringActivity:(id)a3 withNetworkParameters:(id)a4 withEndpoint:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( -[_DASNetworkEvaluationMonitor evaluationGroupForParameters:endpoint:]( self,  "evaluationGroupForParameters:endpoint:",  v9,  v10));
  if (v11)
  {
    objc_super v12 = (void *)v11;
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000B8E54();
    }
  }

  else
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( -[_DASNetworkEvaluationMonitor setupNetworkMonitoringWithNetworkParameters:endpoint:withActivityID:]( self,  "setupNetworkMonitoringWithNetworkParameters:endpoint:withActivityID:",  v9,  v10,  v8));
  }

  [v12 startMonitoringForActivityID:v8];
}

- (id)evaluationGroupForParameters:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_recursive_lock_lock_with_options(&self->_lock, 0LL);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v9 = self->_networkEvaluationGroups;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (objc_msgSend(v13, "isMonitoringWithParameters:endpoint:", v6, v7, (void)v15))
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

- (id)setupNetworkMonitoringWithNetworkParameters:(id)a3 endpoint:(id)a4 withActivityID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = -[_DASNetworkMonitorEvaluationGroup initWithEndpoint:parameters:activityID:callback:onQueue:]( objc_alloc(&OBJC_CLASS____DASNetworkMonitorEvaluationGroup),  "initWithEndpoint:parameters:activityID:callback:onQueue:",  v9,  v8,  v10,  self->_callback,  self->_callbackQueue);
  if (v11)
  {
    os_unfair_recursive_lock_lock_with_options(&self->_lock, 0LL);
    -[NSMutableArray addObject:](self->_networkEvaluationGroups, "addObject:", v11);
    os_unfair_recursive_lock_unlock(&self->_lock);
    objc_super v12 = v11;
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412802;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to instantiate evaluationGroup for %@ (%@, %@",  (uint8_t *)&v15,  0x20u);
    }
  }

  return v11;
}

- (void)stopMonitoringActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( -[_DASNetworkEvaluationMonitor evaluationGroupForActivityID:]( self,  "evaluationGroupForActivityID:",  v4));
  if (v5)
  {
    os_unfair_recursive_lock_lock_with_options(&self->_lock, 0LL);
    os_unfair_recursive_lock_unlock(&self->_lock);
  }

  else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000B8EB8();
  }
}

- (id)evaluationGroupForActivityID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_recursive_lock_lock_with_options(&self->_lock, 0LL);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = self->_networkEvaluationGroups;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (objc_msgSend(v10, "isMonitoringActivityID:", v4, (void)v12))
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

- (BOOL)isNetworkPathAvailableForActivity:(id)a3
{
  id v4 = a3;
  if (-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:](self, "requiresNetworkPathMonitoring:", v4))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[_DASNetworkEvaluationMonitor evaluationGroupForActivityID:]( self,  "evaluationGroupForActivityID:",  v5));
    if (v6) {
      unsigned __int8 v7 = [v6 isNetworkPathAvailable];
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }

  else
  {
    unsigned int v8 = [v4 requiresInexpensiveNetworking];

    id v9 = (void *)objc_opt_class(self);
    if (v8) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 defaultInexpensivePathEvaluator]);
    }
    else {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 defaultPathEvaluator]);
    }
    uint64_t v11 = v10;
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
    id v13 = [v12 status];

    return v13 != (id)2;
  }

  return v7;
}

- (BOOL)isUnconstrainedPathAvailableForActivity:(id)a3
{
  id v4 = a3;
  if (!-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:](self, "requiresNetworkPathMonitoring:", v4))
  {
    id v12 = [(id)objc_opt_class(self) defaultUnconstrainedPathEvaluator];
    evaluator_for_endpoint = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([evaluator_for_endpoint path]);
    BOOL v14 = [v13 status] == (id)2;
    goto LABEL_11;
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kNWEndpointKey]);

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASNetworkEvaluationMonitor nwParametersForActivity:]( &OBJC_CLASS____DASNetworkEvaluationMonitor,  "nwParametersForActivity:",  v4));
    id v9 = [v7 copyCEndpoint];
    id v10 = [v8 copyCParameters];
    evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint(v9, v10);
  }

  else
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[_DASNetworkEvaluationMonitor evaluationGroupForActivityID:]( self,  "evaluationGroupForActivityID:",  v7));
    evaluator_for_endpoint = (void *)objc_claimAutoreleasedReturnValue([v8 evaluator]);
  }

  if (evaluator_for_endpoint)
  {
    id v13 = (void *)nw_path_evaluator_copy_path(evaluator_for_endpoint, v15);
    if (nw_path_is_constrained((nw_path_t)v13))
    {
      BOOL v16 = 0;
LABEL_14:

      goto LABEL_15;
    }

    BOOL v14 = nw_path_get_status((nw_path_t)v13) == nw_path_status_unsatisfied;
LABEL_11:
    BOOL v16 = !v14;
    goto LABEL_14;
  }

  BOOL v16 = 1;
LABEL_15:

  return v16;
}

- (NSMutableArray)networkEvaluationGroups
{
  return self->_networkEvaluationGroups;
}

- (void)setNetworkEvaluationGroups:(id)a3
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (os_unfair_recursive_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_recursive_lock_s)a3
{
  self->_lock = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end