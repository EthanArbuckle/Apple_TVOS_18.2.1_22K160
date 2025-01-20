@interface _DASFairScheduleManager
- (NSMutableDictionary)activityToDuration;
- (NSUserDefaults)fairSchedulingPreferences;
- (OS_dispatch_source)timer;
- (_DASFairScheduleManager)init;
- (id)loadPriorityQueue;
- (int64_t)compareActivity:(id)a3 withActivity:(id)a4;
- (void)activityCanceled:(id)a3;
- (void)activityCompleted:(id)a3;
- (void)activityStarted:(id)a3;
- (void)clearPriorityQueue;
- (void)handleActivityEnd:(id)a3 withLoggingReason:(id)a4;
- (void)savePriorityQueue;
- (void)setActivityToDuration:(id)a3;
- (void)setFairSchedulingPreferences:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation _DASFairScheduleManager

- (_DASFairScheduleManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS____DASFairScheduleManager;
  id v2 = -[_DASFairScheduleManager init](&v21, "init");
  if (v2)
  {
    v3 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.das.fairscheduling");
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue([v2 loadPriorityQueue]);
    id v6 = [v5 mutableCopy];
    v7 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v6;

    if (!*((void *)v2 + 1))
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v9 = (void *)*((void *)v2 + 1);
      *((void *)v2 + 1) = v8;
    }

    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"fairScheduling"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *((void *)v2 + 1);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Loading fair scheduling information %@",  buf,  0xCu);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v13);
    v15 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v14;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 3), 0LL, 0x4E94914F0000uLL, 0x3B9ACA00uLL);
    objc_initWeak((id *)buf, v2);
    v16 = (dispatch_source_s *)*((void *)v2 + 3);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000A0574;
    v18[3] = &unk_1001173B8;
    objc_copyWeak(&v20, (id *)buf);
    id v19 = v2;
    dispatch_source_set_event_handler(v16, v18);
    dispatch_activate(*((dispatch_object_t *)v2 + 3));

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

  return (_DASFairScheduleManager *)v2;
}

- (void)savePriorityQueue
{
  obj = self->_fairSchedulingPreferences;
  objc_sync_enter(obj);
  -[NSUserDefaults setObject:forKey:]( self->_fairSchedulingPreferences,  "setObject:forKey:",  self->_activityToDuration,  @"priorityQueue");
  objc_sync_exit(obj);
}

- (id)loadPriorityQueue
{
  v3 = self->_fairSchedulingPreferences;
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_fairSchedulingPreferences,  "objectForKey:",  @"priorityQueue"));
  objc_sync_exit(v3);

  return v4;
}

- (void)clearPriorityQueue
{
  obj = self->_fairSchedulingPreferences;
  objc_sync_enter(obj);
  -[NSUserDefaults removeObjectForKey:](self->_fairSchedulingPreferences, "removeObjectForKey:", @"priorityQueue");
  objc_sync_exit(obj);
}

- (int64_t)compareActivity:(id)a3 withActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_activityToDuration;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activityToDuration,  "objectForKeyedSubscript:",  v9));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activityToDuration,  "objectForKeyedSubscript:",  v9));
    [v12 doubleValue];
    double v14 = v13;
  }

  else
  {
    double v14 = 0.0;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activityToDuration,  "objectForKeyedSubscript:",  v10));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activityToDuration,  "objectForKeyedSubscript:",  v10));
    [v16 doubleValue];
    double v18 = v17;
  }

  else
  {
    double v18 = 0.0;
  }

  if (v14 < v18) {
    goto LABEL_8;
  }
  if (v14 > v18)
  {
LABEL_10:
    int64_t v19 = 1LL;
    goto LABEL_11;
  }

  [v6 interval];
  double v22 = v21;
  [v7 interval];
  if (v22 <= v23)
  {
    [v6 interval];
    double v25 = v24;
    [v7 interval];
    if (v25 < v26) {
      goto LABEL_10;
    }
    id v27 = [v6 schedulingPriority];
    if (v27 <= [v7 schedulingPriority])
    {
      id v28 = [v6 schedulingPriority];
      if (v28 < [v7 schedulingPriority]) {
        goto LABEL_10;
      }
      id v29 = [v6 staticPriority];
      if ((uint64_t)v29 >= (uint64_t)[v7 staticPriority])
      {
        id v30 = [v6 staticPriority];
        id v31 = [v6 maximumRuntime];
        if ((uint64_t)v31 >= (uint64_t)[v7 maximumRuntime])
        {
          id v32 = [v6 maximumRuntime];
          if ((uint64_t)v32 <= (uint64_t)[v7 maximumRuntime])
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
            v34 = (void *)objc_claimAutoreleasedReturnValue([v7 startBefore]);
            int64_t v19 = (int64_t)[v33 compare:v34];

            goto LABEL_11;
          }

          goto LABEL_10;
        }
      }
    }
  }

- (void)handleActivityEnd:(id)a3 withLoggingReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_activityToDuration;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
  [v10 timeIntervalSinceNow];
  double v12 = v11;

  double v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activityToDuration,  "objectForKeyedSubscript:",  v9));
  [v13 doubleValue];
  double v15 = v14 - v12;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_activityToDuration,  "setObject:forKeyedSubscript:",  v16,  v9);

  -[_DASFairScheduleManager savePriorityQueue](self, "savePriorityQueue");
  double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"fairScheduling"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    int v19 = 138413058;
    id v20 = v7;
    __int16 v21 = 2112;
    double v22 = v18;
    __int16 v23 = 2048;
    double v24 = v12 / -60.0;
    __int16 v25 = 2048;
    double v26 = v15 / 60.0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%@ %@, ran for %.1f mins, total runtime %.1f mins",  (uint8_t *)&v19,  0x2Au);
  }

  objc_sync_exit(v8);
}

- (void)activityCanceled:(id)a3
{
}

- (void)activityCompleted:(id)a3
{
}

- (void)activityStarted:(id)a3
{
  id v4 = a3;
  v5 = self->_activityToDuration;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activityToDuration,  "objectForKeyedSubscript:",  v6));

  if (v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_activityToDuration,  "objectForKeyedSubscript:",  v6));
    [v8 doubleValue];
    double v10 = v9;
  }

  else
  {
    double v10 = 0.0;
  }

  objc_sync_exit(v5);
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"fairScheduling"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    int v13 = 138412546;
    double v14 = v12;
    __int16 v15 = 2048;
    double v16 = v10 / 60.0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Started %@, total runtime from previous runs %0.1f mins",  (uint8_t *)&v13,  0x16u);
  }
}

- (NSMutableDictionary)activityToDuration
{
  return self->_activityToDuration;
}

- (void)setActivityToDuration:(id)a3
{
}

- (NSUserDefaults)fairSchedulingPreferences
{
  return self->_fairSchedulingPreferences;
}

- (void)setFairSchedulingPreferences:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end