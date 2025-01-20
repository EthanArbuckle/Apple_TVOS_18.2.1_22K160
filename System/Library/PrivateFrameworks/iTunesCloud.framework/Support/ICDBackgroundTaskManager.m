@interface ICDBackgroundTaskManager
- (BOOL)_cellularDataAllowed;
- (ICDAccountManaging)accountManager;
- (ICDBackgroundTaskManager)initWithAccountManager:(id)a3 handlerCoordinator:(id)a4;
- (ICDHandlerCoordinating)handlerCoordinator;
- (NSMutableSet)currentTasks;
- (id)_deferredPushActivityCriteriaForTask:(id)a3 startTime:(int64_t)a4 gracePeriod:(int64_t)a5;
- (id)_periodicPollingActivityCriteriaWithRefreshInterval:(int64_t)a3 gracePeriod:(int64_t)a4;
- (id)_taskWithName:(id)a3;
- (id)activityCriteriaForTask:(id)a3 startTimeInSeconds:(int64_t)a4;
- (int64_t)_deferredPushGracePeriodSeconds;
- (int64_t)_pollingGracePeriodSecondsForRefreshInterval:(int64_t)a3;
- (int64_t)_pollingRefreshIntervalSecondsUsingBag:(id)a3;
- (void)_handleJaliscoDeferredPushUpdateTask:(id)a3 completion:(id)a4;
- (void)_handleSagaDeferredPushUpdateTask:(id)a3 completion:(id)a4;
- (void)_handleTask:(id)a3 completion:(id)a4;
- (void)_restoreCurrentTasks;
- (void)_saveCurrentTasks;
- (void)_scheduleTask:(id)a3 withStartTime:(int64_t)a4;
- (void)_startTask:(id)a3;
- (void)_stopTask:(id)a3;
- (void)_unscheduleTask:(id)a3;
- (void)scheduleTaskOfType:(int64_t)a3 forConfiguration:(id)a4;
- (void)startPeriodicPolling;
@end

@implementation ICDBackgroundTaskManager

- (ICDBackgroundTaskManager)initWithAccountManager:(id)a3 handlerCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ICDBackgroundTaskManager;
  v9 = -[ICDBackgroundTaskManager init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handlerCoordinator, a4);
    objc_storeStrong((id *)&v10->_accountManager, a3);
    v11 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 7LL);
    currentTasks = v10->_currentTasks;
    v10->_currentTasks = v11;

    -[ICDBackgroundTaskManager _restoreCurrentTasks](v10, "_restoreCurrentTasks");
  }

  return v10;
}

- (void)startPeriodicPolling
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "ICDBackgroundTaskManager %p - startPeriodicPolling",  buf,  0xCu);
  }

  id v4 = [[MSVXPCTransaction alloc] initWithName:@"ICDBackgroundTaskManager - Polling setup - LoadBag"];
  [v4 beginTransaction];
  v5 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  id v7 = -[ICStoreRequestContext initWithIdentity:](v5, "initWithIdentity:", v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10011BA08;
  v10[3] = &unk_1001A7180;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 getBagForRequestContext:v7 withCompletionHandler:v10];
}

- (void)scheduleTaskOfType:(int64_t)a3 forConfiguration:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[_ICDBackgroundTask taskWithType:configuration:]( &OBJC_CLASS____ICDBackgroundTask,  "taskWithType:configuration:",  a3,  a4));
  v6 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDBackgroundTaskManager currentTasks](self, "currentTasks"));
    int v13 = 134218498;
    objc_super v14 = self;
    __int16 v15 = 2114;
    v16 = v7;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDBackgroundTaskManager %p - scheduleTaskOfType:forConfiguration: - newTask=%{public}@ - currentTasks=%@",  (uint8_t *)&v13,  0x20u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDBackgroundTaskManager _taskWithName:](self, "_taskWithName:", v9));

  if (v10)
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
      int v13 = 134218242;
      objc_super v14 = self;
      __int16 v15 = 2114;
      v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "ICDBackgroundTaskManager %p - scheduleTaskOfType:forConfiguration: - Task already on-going [%{public}@]",  (uint8_t *)&v13,  0x16u);
    }
  }

  else
  {
    -[ICDBackgroundTaskManager _startTask:](self, "_startTask:", v5);
  }
}

- (void)_restoreCurrentTasks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICDDefaults daemonDefaults](&OBJC_CLASS___ICDDefaults, "daemonDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pendingBackgroundTasksData]);

  if (v4)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSSet, v5);
    id v8 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS____ICDBackgroundTask, v7),  0LL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v16 = 0LL;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v9,  v4,  &v16));
    id v11 = (os_log_s *)v16;
    v12 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
    currentTasks = (NSMutableSet *)v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v18 = self;
        __int16 v19 = 2114;
        v20 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)currentTasks,  OS_LOG_TYPE_ERROR,  "ICDBackgroundTaskManager %p - _restoreCurrentTasks - Restoring current tasks failed - error=%{public}@",  buf,  0x16u);
      }
    }

    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_super v14 = (os_log_s *)[v10 count];
        *(_DWORD *)buf = 134218498;
        v18 = self;
        __int16 v19 = 2048;
        v20 = v14;
        __int16 v21 = 2112;
        v22 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)currentTasks,  OS_LOG_TYPE_DEBUG,  "ICDBackgroundTaskManager %p - _restoreCurrentTasks - State restored [%lu tasks] - tasks=%@",  buf,  0x20u);
      }

      __int16 v15 = (NSMutableSet *)[v10 mutableCopy];
      currentTasks = self->_currentTasks;
      self->_currentTasks = v15;
    }
  }

  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "ICDBackgroundTaskManager %p - _restoreCurrentTasks - No state to restore",  buf,  0xCu);
    }
  }
}

- (void)_saveCurrentTasks
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDBackgroundTaskManager currentTasks](self, "currentTasks"));
  id v4 = [v3 copy];
  id v12 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v4,  1LL,  &v12));
  id v6 = v12;

  uint64_t v7 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      objc_super v14 = self;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "ICDBackgroundTaskManager %p - _saveCurrentTasks - Saving current tasks failed - error=%{public}@",  buf,  0x16u);
    }
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDBackgroundTaskManager currentTasks](self, "currentTasks"));
      id v10 = [v9 count];
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDBackgroundTaskManager currentTasks](self, "currentTasks"));
      *(_DWORD *)buf = 134218498;
      objc_super v14 = self;
      __int16 v15 = 2048;
      id v16 = v10;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "ICDBackgroundTaskManager %p - _saveCurrentTasks - State saved [%lu tasks] - tasks=%@",  buf,  0x20u);
    }

    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ICDDefaults daemonDefaults](&OBJC_CLASS___ICDDefaults, "daemonDefaults"));
    -[os_log_s setPendingBackgroundTasksData:](v8, "setPendingBackgroundTasksData:", v5);
  }
}

- (void)_startTask:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDBackgroundTaskManager currentTasks](self, "currentTasks"));
  objc_sync_enter(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDBackgroundTaskManager currentTasks](self, "currentTasks"));
  [v5 addObject:v6];

  -[ICDBackgroundTaskManager _saveCurrentTasks](self, "_saveCurrentTasks");
  objc_sync_exit(v4);

  if ((unint64_t)[v6 type] < 2) {
    -[ICDBackgroundTaskManager _scheduleTask:withStartTime:]( self,  "_scheduleTask:withStartTime:",  v6,  XPC_ACTIVITY_INTERVAL_1_MIN);
  }
}

- (void)_stopTask:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDBackgroundTaskManager currentTasks](self, "currentTasks"));
  objc_sync_enter(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDBackgroundTaskManager currentTasks](self, "currentTasks"));
  [v5 removeObject:v6];

  -[ICDBackgroundTaskManager _saveCurrentTasks](self, "_saveCurrentTasks");
  objc_sync_exit(v4);

  -[ICDBackgroundTaskManager _unscheduleTask:](self, "_unscheduleTask:", v6);
}

- (void)_scheduleTask:(id)a3 withStartTime:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  id v8 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    __int16 v19 = self;
    __int16 v20 = 2112;
    __int16 v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "ICDBackgroundTaskManager %p - scheduleTask - taskName=%@",  buf,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[ICDBackgroundTaskManager activityCriteriaForTask:startTimeInSeconds:]( self,  "activityCriteriaForTask:startTimeInSeconds:",  v6,  a4));
  objc_initWeak((id *)buf, self);
  id v10 = v7;
  id v11 = (const char *)[v10 UTF8String];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10011B6A4;
  handler[3] = &unk_1001A71D0;
  objc_copyWeak(&v17, (id *)buf);
  id v12 = v10;
  id v15 = v12;
  id v13 = v6;
  id v16 = v13;
  xpc_activity_register(v11, v9, handler);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)_unscheduleTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 name]);
    uint64_t v7 = (void *)v6;
    id v8 = @"no-name";
    if (v6) {
      id v8 = (const __CFString *)v6;
    }
    int v10 = 134218242;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDBackgroundTaskManager %p - Unregistering task: %@",  (uint8_t *)&v10,  0x16u);
  }

  id v9 = objc_claimAutoreleasedReturnValue([v4 name]);
  xpc_activity_unregister((const char *)[v9 UTF8String]);
}

- (id)_taskWithName:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDBackgroundTaskManager currentTasks](self, "currentTasks"));
  objc_sync_enter(v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDBackgroundTaskManager currentTasks](self, "currentTasks"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10011B664;
  v13[3] = &unk_1001A71F8;
  id v8 = v5;
  id v14 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectsPassingTest:v13]);

  objc_sync_exit(v6);
  if ((unint64_t)[v9 count] >= 2)
  {
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2 object:self file:@"ICDBackgroundTaskManager.m" lineNumber:277 description:@"More tasks than expected have the same name"];
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 anyObject]);

  return v10;
}

- (void)_handleTask:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [v8 type];
  if (v7 == (id)1)
  {
    -[ICDBackgroundTaskManager _handleJaliscoDeferredPushUpdateTask:completion:]( self,  "_handleJaliscoDeferredPushUpdateTask:completion:",  v8,  v6);
  }

  else if (!v7)
  {
    -[ICDBackgroundTaskManager _handleSagaDeferredPushUpdateTask:completion:]( self,  "_handleSagaDeferredPushUpdateTask:completion:",  v8,  v6);
  }
}

- (id)activityCriteriaForTask:(id)a3 startTimeInSeconds:(int64_t)a4
{
  id v6 = a3;
  else {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ICDBackgroundTaskManager _deferredPushActivityCriteriaForTask:startTime:gracePeriod:]( self,  "_deferredPushActivityCriteriaForTask:startTime:gracePeriod:",  v6,  a4,  -[ICDBackgroundTaskManager _deferredPushGracePeriodSeconds]( self,  "_deferredPushGracePeriodSeconds")));
  }

  return v7;
}

- (BOOL)_cellularDataAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned int v3 = [v2 isCellularDataRestrictedForMusic];

  if (!v3) {
    return 1;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned __int8 v5 = [v4 isCellularDataRestrictedForVideos];

  return v5 ^ 1;
}

- (int64_t)_pollingRefreshIntervalSecondsUsingBag:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 dictionaryForBagKey:@"purchase-daap"]);
  uint64_t v5 = ICGetCloudDAAPClientPrefix();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"forced-refresh-frequency-minutes"]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v7]);
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"forced-refresh-frequency-minutes"]);
  }
  id v11 = v10;

  else {
    int64_t v12 = XPC_ACTIVITY_INTERVAL_7_DAYS;
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
  unsigned __int8 v14 = [v13 bypassBagSanityChecks];

  if ((v14 & 1) == 0 && v12 < XPC_ACTIVITY_INTERVAL_1_DAY)
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218240;
      v18 = self;
      __int16 v19 = 2048;
      int64_t v20 = XPC_ACTIVITY_INTERVAL_1_DAY;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "ICDBackgroundTaskManager %p - startPeriodicPolling -  Adjusting bag refresh interval of %lldmin --> 7 days",  (uint8_t *)&v17,  0x16u);
    }

    int64_t v12 = XPC_ACTIVITY_INTERVAL_1_DAY;
  }

  return v12;
}

- (int64_t)_pollingGracePeriodSecondsForRefreshInterval:(int64_t)a3
{
  if (XPC_ACTIVITY_INTERVAL_1_DAY <= a3) {
    unsigned int v3 = (int64_t *)&XPC_ACTIVITY_INTERVAL_1_HOUR;
  }
  else {
    unsigned int v3 = (int64_t *)&XPC_ACTIVITY_INTERVAL_15_MIN;
  }
  return *v3;
}

- (id)_periodicPollingActivityCriteriaWithRefreshInterval:(int64_t)a3 gracePeriod:(int64_t)a4
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, a3);
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, a4);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 0);
  return v6;
}

- (int64_t)_deferredPushGracePeriodSeconds
{
  return XPC_ACTIVITY_INTERVAL_1_HOUR;
}

- (id)_deferredPushActivityCriteriaForTask:(id)a3 startTime:(int64_t)a4 gracePeriod:(int64_t)a5
{
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 configuration]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userIdentity]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountDSID]);

  if (!v11)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v14 handleFailureInMethod:a2, self, @"ICDBackgroundTaskManager.m", 366, @"Invalid parameter not satisfying: %@", @"task.configuration.userIdentity.accountDSID != nil" object file lineNumber description];
  }

  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v12, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v12, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_int64(v12, XPC_ACTIVITY_DELAY, a4);
  xpc_dictionary_set_int64(v12, XPC_ACTIVITY_GRACE_PERIOD, a5);
  xpc_dictionary_set_BOOL(v12, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 0);
  return v12;
}

- (void)_handleSagaDeferredPushUpdateTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 type];
    id v10 = @"com.apple.itunescloudd.deferredPushUpdate.jalisco";
    if (!v9) {
      id v10 = @"com.apple.itunescloudd.deferredPushUpdate.saga";
    }
    *(_DWORD *)buf = 134218242;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ICDBackgroundTaskManager %p - Job Fired: sagaDeferredPushUpate [%{public}@]",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
  xpc_object_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientIdentity]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10011B53C;
  v16[3] = &unk_1001A7220;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  [v12 updateSagaLibraryWithClientIdentity:v14 forReason:1000 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:v16];
}

- (void)_handleJaliscoDeferredPushUpdateTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "BackgroundTasks");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 type];
    id v10 = @"com.apple.itunescloudd.deferredPushUpdate.jalisco";
    if (!v9) {
      id v10 = @"com.apple.itunescloudd.deferredPushUpdate.saga";
    }
    *(_DWORD *)buf = 134218242;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ICDBackgroundTaskManager %p - Job Fired: jaliscoDeferredPushUpate [%{public}@]",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
  xpc_object_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v11));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 configuration]);
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientIdentity]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10011B414;
  v16[3] = &unk_1001A7220;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  [v12 updateJaliscoLibraryWithClientIdentity:v14 forReason:1000 completionHandler:v16];
}

- (ICDAccountManaging)accountManager
{
  return self->_accountManager;
}

- (ICDHandlerCoordinating)handlerCoordinator
{
  return self->_handlerCoordinator;
}

- (NSMutableSet)currentTasks
{
  return self->_currentTasks;
}

- (void).cxx_destruct
{
}

@end