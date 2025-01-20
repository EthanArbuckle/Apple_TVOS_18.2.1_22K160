@interface W5BGTaskManager
- (BGSystemTaskScheduler)scheduler;
- (BOOL)scheduleRepeatingTask:(id)a3 interval:(double)a4 repeatingTask:(id)a5;
- (NSMutableArray)registeredIdentifiers;
- (W5BGTaskManager)init;
- (void)dealloc;
- (void)setRegisteredIdentifiers:(id)a3;
- (void)setScheduler:(id)a3;
- (void)stopAllRepeatingTasks;
@end

@implementation W5BGTaskManager

- (W5BGTaskManager)init
{
  self->_scheduler = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___W5BGTaskManager;
  v3 = -[W5BGTaskManager init](&v5, "init");
  if (v3)
  {
    if (objc_opt_class(&OBJC_CLASS___BGSystemTaskScheduler, v2)) {
      v3->_scheduler = (BGSystemTaskScheduler *)+[BGSystemTaskScheduler sharedScheduler]( &OBJC_CLASS___BGSystemTaskScheduler,  "sharedScheduler");
    }
    else {
      return 0LL;
    }
  }

  return v3;
}

- (BOOL)scheduleRepeatingTask:(id)a3 interval:(double)a4 repeatingTask:(id)a5
{
  if (-[NSMutableArray containsObject:](self->_registeredIdentifiers, "containsObject:"))
  {
    v9 = (os_log_s *)sub_10008C90C();
    unsigned __int8 v10 = 0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315906;
      v21 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
      __int16 v22 = 2080;
      v23 = "W5BGTaskManager.m";
      __int16 v24 = 1024;
      int v25 = 39;
      __int16 v26 = 2114;
      id v27 = a3;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) Task: %{public}@ already registered",  &v20,  38);
      return 0;
    }
  }

  else
  {
    scheduler = self->_scheduler;
    if (!scheduler) {
      return 0;
    }
    if ((-[BGSystemTaskScheduler registerForTaskWithIdentifier:usingQueue:launchHandler:]( scheduler,  "registerForTaskWithIdentifier:usingQueue:launchHandler:",  a3,  0LL,  a5) & 1) == 0)
    {
      v18 = (os_log_s *)sub_10008C90C();
      unsigned __int8 v10 = 0;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        return v10;
      }
      int v20 = 136315906;
      v21 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
      __int16 v22 = 2080;
      v23 = "W5BGTaskManager.m";
      __int16 v24 = 1024;
      int v25 = 49;
      __int16 v26 = 2114;
      id v27 = a3;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) Failed to register task: %{public}@",  &v20,  38);
      return 0;
    }

    if (-[BGSystemTaskScheduler taskRequestForIdentifier:](self->_scheduler, "taskRequestForIdentifier:", a3))
    {
      v12 = (os_log_s *)sub_10008C90C();
      unsigned __int8 v10 = 0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315906;
        v21 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
        __int16 v22 = 2080;
        v23 = "W5BGTaskManager.m";
        __int16 v24 = 1024;
        int v25 = 52;
        __int16 v26 = 2114;
        id v27 = a3;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) Task: %{public}@ already exists",  &v20,  38);
        return 0;
      }
    }

    else
    {
      id v14 = [[BGRepeatingSystemTaskRequest alloc] initWithIdentifier:a3];
      [v14 setRequiresNetworkConnectivity:0];
      [v14 setRequiresExternalPower:0];
      [v14 setInterval:a4];
      [v14 setMinDurationBetweenInstances:a4];
      [v14 setShouldWakeDevice:0];
      v19 = 0LL;
      unsigned __int8 v10 = objc_msgSend( +[BGSystemTaskScheduler sharedScheduler]( BGSystemTaskScheduler,  "sharedScheduler"),  "submitTaskRequest:error:",  v14,  &v19);
      v15 = (os_log_s *)sub_10008C90C();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if ((v10 & 1) != 0)
      {
        if (v16)
        {
          int v20 = 136315906;
          v21 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
          __int16 v22 = 2080;
          v23 = "W5BGTaskManager.m";
          __int16 v24 = 1024;
          int v25 = 69;
          __int16 v26 = 2114;
          id v27 = a3;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) Scheduled periodic task: %{public}@",  &v20,  38);
        }

        -[NSMutableArray addObject:](self->_registeredIdentifiers, "addObject:", a3);
      }

      else if (v16)
      {
        v17 = v19;
        if (!v19) {
          v17 = @"Unknown";
        }
        int v20 = 136315906;
        v21 = "-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]";
        __int16 v22 = 2080;
        v23 = "W5BGTaskManager.m";
        __int16 v24 = 1024;
        int v25 = 65;
        __int16 v26 = 2114;
        id v27 = (id)v17;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) Failed to submit task with error: %{public}@",  &v20,  38);
      }
    }
  }

  return v10;
}

- (void)stopAllRepeatingTasks
{
  if (self->_scheduler)
  {
    v3 = (char *)-[NSMutableArray count](self->_registeredIdentifiers, "count");
    v4 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      v12 = "-[W5BGTaskManager stopAllRepeatingTasks]";
      __int16 v13 = 2080;
      id v14 = "W5BGTaskManager.m";
      __int16 v15 = 1024;
      int v16 = 87;
      __int16 v17 = 2048;
      v18 = v3;
      LODWORD(v8) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) #Registered Tasks: %ld",  (const char *)&v11,  v8,  v9,  v10);
    }

    if (v3)
    {
      for (i = 0LL; i != v3; ++i)
      {
        v6 = (char *)-[NSMutableArray objectAtIndex:](self->_registeredIdentifiers, "objectAtIndex:", i);
        if (-[BGSystemTaskScheduler deregisterTaskWithIdentifier:]( self->_scheduler,  "deregisterTaskWithIdentifier:",  v6))
        {
          v7 = (os_log_s *)sub_10008C90C();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = 136315906;
            v12 = "-[W5BGTaskManager stopAllRepeatingTasks]";
            __int16 v13 = 2080;
            id v14 = "W5BGTaskManager.m";
            __int16 v15 = 1024;
            int v16 = 94;
            __int16 v17 = 2114;
            v18 = v6;
            LODWORD(v8) = 38;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) Succeafully de-registered task: %{public}@",  &v11,  v8);
          }

          -[NSMutableArray removeObjectAtIndex:](self->_registeredIdentifiers, "removeObjectAtIndex:", i);
        }
      }
    }
  }

- (void)dealloc
{
  scheduler = self->_scheduler;
  if (scheduler) {

  }
  registeredIdentifiers = self->_registeredIdentifiers;
  if (registeredIdentifiers) {

  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___W5BGTaskManager;
  -[W5BGTaskManager dealloc](&v5, "dealloc");
}

- (BGSystemTaskScheduler)scheduler
{
  return (BGSystemTaskScheduler *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setScheduler:(id)a3
{
}

- (NSMutableArray)registeredIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setRegisteredIdentifiers:(id)a3
{
}

@end