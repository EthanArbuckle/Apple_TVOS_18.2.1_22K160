@interface MLRTaskScheduler
- (BOOL)allowBypassDiagnosticsUsage:(id)a3;
- (BOOL)taskIsDeferred;
- (MLRTaskScheduler)initWithBaseURL:(id)a3 localeIdentifier:(id)a4 fromDesTool:(BOOL)a5;
- (MLRTaskScheduler)initWithBaseURL:(id)a3 localeIdentifier:(id)a4 fromDesTool:(BOOL)a5 bundleRegistry:(id)a6 recordStoreManager:(id)a7;
- (double)_maxTimeLimitForBundle:(id)a3;
- (id)_requestedToStopError;
- (id)filterPluginIDs:(id)a3;
- (id)tasksForPluginIDs:(id)a3;
- (void)_completeTaskRunWithResult:(id)a3 error:(id)a4;
- (void)_scheduleNextTask;
- (void)_startTasks:(id)a3 completion:(id)a4;
- (void)createTaskWorkerForShadowEvaluationTask:(id)a3 completion:(id)a4;
- (void)createTaskWorkerForTask:(id)a3 completion:(id)a4;
- (void)startTasks:(id)a3 completion:(id)a4;
- (void)startTasksForPluginIDs:(id)a3 completion:(id)a4;
- (void)stop;
- (void)updateInterval;
@end

@implementation MLRTaskScheduler

- (MLRTaskScheduler)initWithBaseURL:(id)a3 localeIdentifier:(id)a4 fromDesTool:(BOOL)a5
{
  return -[MLRTaskScheduler initWithBaseURL:localeIdentifier:fromDesTool:bundleRegistry:recordStoreManager:]( self,  "initWithBaseURL:localeIdentifier:fromDesTool:bundleRegistry:recordStoreManager:",  a3,  a4,  a5,  0LL,  0LL);
}

- (MLRTaskScheduler)initWithBaseURL:(id)a3 localeIdentifier:(id)a4 fromDesTool:(BOOL)a5 bundleRegistry:(id)a6 recordStoreManager:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___MLRTaskScheduler;
  v17 = -[MLRTaskScheduler init](&v41, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_baseURL, a3);
    if (v15) {
      v19 = (DESBundleRegistryManaging *)v15;
    }
    else {
      v19 = (DESBundleRegistryManaging *)objc_claimAutoreleasedReturnValue( +[DESBundleRegistry sharedInstance]( &OBJC_CLASS___DESBundleRegistry,  "sharedInstance"));
    }
    bundleRegistry = v18->_bundleRegistry;
    v18->_bundleRegistry = v19;

    if (v16) {
      v21 = (DESRecordStoreManager *)v16;
    }
    else {
      v21 = objc_opt_new(&OBJC_CLASS___DESRecordStoreManager);
    }
    recordStoreManager = v18->_recordStoreManager;
    v18->_recordStoreManager = v21;

    dispatch_queue_attr_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v23);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.MLRuntime.MLRTaskScheduler.TaskWorker", v24);
    taskWorkerQueue = v18->_taskWorkerQueue;
    v18->_taskWorkerQueue = (OS_dispatch_queue *)v25;

    dispatch_queue_attr_t v27 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v27);
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.MLRuntime.MLRTaskScheduler.TaskStop", v28);
    taskStopQueue = v18->_taskStopQueue;
    v18->_taskStopQueue = (OS_dispatch_queue *)v29;

    v18->_alwaysRun = DESShouldAlwaysParticipate() | a5;
    if (v14)
    {
      v31 = (NSString *)v14;
    }

    else
    {
      uint64_t v32 = DESGetDeviceLocale();
      v31 = (NSString *)objc_claimAutoreleasedReturnValue(v32);
    }

    localeIdentifier = v18->_localeIdentifier;
    v18->_localeIdentifier = v31;

    uint64_t v34 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    workers = v18->_workers;
    v18->_workers = (NSHashTable *)v34;

    v36 = -[MLRPluginFactory initWithBundleRegistry:]( objc_alloc(&OBJC_CLASS___MLRPluginFactory),  "initWithBundleRegistry:",  v18->_bundleRegistry);
    pluginFactory = v18->_pluginFactory;
    v18->_pluginFactory = v36;

    v38 = objc_opt_new(&OBJC_CLASS___MLRTrialManager);
    trialManager = v18->_trialManager;
    v18->_trialManager = v38;
  }

  return v18;
}

- (id)_requestedToStopError
{
  uint64_t v2 = kDESDistributedEvaluationErrorDomain;
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  v7 = @"Requested to defer by DAS.";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v2,  1902LL,  v3));

  return v4;
}

- (void)_scheduleNextTask
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000A7C0((uint64_t)self, v3);
  }

  if (self->_numOfCompletedTasks == self->_numOfExpectedTasks)
  {
    -[MLRTaskScheduler _completeTaskRunWithResult:error:](self, "_completeTaskRunWithResult:error:", 0LL, 0LL);
    return;
  }

  if (self->_requestedToStop)
  {
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Task scheduling deferred by DAS.", buf, 2u);
    }

    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MLRTaskScheduler _requestedToStopError](self, "_requestedToStopError"));
    -[MLRTaskScheduler _completeTaskRunWithResult:error:](self, "_completeTaskRunWithResult:error:", 0LL, v5);
  }

  else
  {
    if (!-[NSMutableArray count](self->_tasks, "count")) {
      return;
    }
    NSErrorUserInfoKey v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_tasks, "lastObject"));
    -[NSMutableArray removeLastObject](self->_tasks, "removeLastObject");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000091A0;
    v7[3] = &unk_100014A68;
    id v8 = v6;
    v9 = self;
    id v5 = v6;
    -[MLRTaskScheduler createTaskWorkerForTask:completion:](self, "createTaskWorkerForTask:completion:", v5, v7);
  }
}

- (void)createTaskWorkerForShadowEvaluationTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, MLRTrialShadowExperimentTaskWorker *, void))a4;
  if (self->_trialManager)
  {
    pluginFactory = self->_pluginFactory;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
    id v16 = 0LL;
    v10 = (void *)objc_claimAutoreleasedReturnValue( -[MLRPluginFactory pluginWithBundleIdentifier:errorOut:]( pluginFactory,  "pluginWithBundleIdentifier:errorOut:",  v9,  &v16));
    id v11 = v16;

    if (v10)
    {
      v12 = -[MLRTrialShadowExperimentTaskWorker initWithTrialManager:plugin:alwaysRun:]( objc_alloc(&OBJC_CLASS___MLRTrialShadowExperimentTaskWorker),  "initWithTrialManager:plugin:alwaysRun:",  self->_trialManager,  v10,  self->_alwaysRun);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);
        *(_DWORD *)buf = 138412546;
        v18 = v12;
        __int16 v19 = 2112;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Created worker=%@ for plugin=%@.", buf, 0x16u);
      }

      v7[2](v7, v12, 0LL);
    }

    else
    {
      ((void (**)(id, MLRTrialShadowExperimentTaskWorker *, id))v7)[2](v7, 0LL, v11);
    }
  }

  else
  {
    uint64_t v15 = kDESDistributedEvaluationErrorDomain;
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    v22 = @"Nil _trialManager. Please make sure Trial Framework is present.";
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  1903LL,  v11));
    ((void (**)(id, MLRTrialShadowExperimentTaskWorker *, void *))v7)[2](v7, 0LL, v10);
  }
}

- (void)createTaskWorkerForTask:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = objc_autoreleasePoolPush();
  if ([v8 source] == (id)1) {
    -[MLRTaskScheduler createTaskWorkerForShadowEvaluationTask:completion:]( self,  "createTaskWorkerForShadowEvaluationTask:completion:",  v8,  v6);
  }
  objc_autoreleasePoolPop(v7);
}

- (void)_completeTaskRunWithResult:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_taskWorkerQueue);
  -[MLRTaskScheduler updateInterval](self, "updateInterval");
  completionAfterTaskRun = (void (**)(id, id, id))self->_completionAfterTaskRun;
  if (completionAfterTaskRun)
  {
    completionAfterTaskRun[2](completionAfterTaskRun, v10, v6);
    id v8 = self->_completionAfterTaskRun;
  }

  else
  {
    id v8 = 0LL;
  }

  self->_completionAfterTaskRun = 0LL;

  self->_numOfCompletedTasks = 0LL;
  self->_numOfExpectedTasks = 0LL;
  tasks = self->_tasks;
  self->_tasks = 0LL;

  self->_busy = 0;
}

- (void)updateInterval
{
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___MLRSchedulerRecord);
  -[MLRSchedulerRecord updateWakeUpPeriodInSeconds](v2, "updateWakeUpPeriodInSeconds");
}

- (double)_maxTimeLimitForBundle:(id)a3
{
  id v3 = a3;
  double v4 = 5.0;
  if (([v3 isEqualToString:MLRuntimePluginID_DPMLRuntimePluginClassB] & 1) == 0)
  {
    else {
      double v4 = 0.0;
    }
  }

  return v4;
}

- (BOOL)allowBypassDiagnosticsUsage:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:MLRuntimePluginID_DPMeadPlugin] & 1) != 0
    || ([v3 isEqualToString:MLRuntimePluginID_FedStatsPluginNonDnU] & 1) != 0
    || ([v3 isEqualToString:MLRuntimePluginID_MediaMLPluginApp] & 1) != 0
    || ([v3 isEqualToString:MLRuntimePluginID_RepackagingPlugin] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:MLRuntimePluginID_SiriCoreMetricsPlugin];
  }

  return v4;
}

- (void)_startTasks:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if ([v6 count])
  {
    if (self->_busy)
    {
      uint64_t v8 = kDESDistributedEvaluationErrorDomain;
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      v22 = @"Task Scheduler busy.";
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v8,  1901LL,  v9));
      v7[2](v7, 0LL, v10);
    }

    else if (self->_requestedToStop)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MLRTaskScheduler _requestedToStopError](self, "_requestedToStopError"));
      v7[2](v7, 0LL, v11);
    }

    else
    {
      self->_busy = 1;
      v12 = (NSMutableArray *)[v6 mutableCopy];
      tasks = self->_tasks;
      self->_tasks = v12;

      id v14 = [v7 copy];
      id completionAfterTaskRun = self->_completionAfterTaskRun;
      self->_id completionAfterTaskRun = v14;

      id v16 = -[NSMutableArray count](self->_tasks, "count");
      self->_numOfCompletedTasks = 0LL;
      self->_unint64_t numOfExpectedTasks = (unint64_t)v16;
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        unint64_t numOfExpectedTasks = self->_numOfExpectedTasks;
        int v19 = 134217984;
        unint64_t v20 = numOfExpectedTasks;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Starting scheduling %ld tasks.",  (uint8_t *)&v19,  0xCu);
      }

      +[DESBitacoraEventManager sendEventActivityScheduled]( &OBJC_CLASS___DESBitacoraEventManager,  "sendEventActivityScheduled");
      -[MLRTaskScheduler _scheduleNextTask](self, "_scheduleNextTask");
    }
  }

  else
  {
    v7[2](v7, 0LL, 0LL);
  }
}

- (void)startTasks:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    taskWorkerQueue = self->_taskWorkerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100009FDC;
    block[3] = &unk_100014A90;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)taskWorkerQueue, block);
  }

  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (id)tasksForPluginIDs:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        v12 = (char *)-[DESBundleRegistryManaging pluginTypeForBundleId:]( self->_bundleRegistry,  "pluginTypeForBundleId:",  v11);
        if ((unint64_t)(v12 - 2) >= 2)
        {
          if (v12 != (char *)4)
          {
            v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              sub_10000A998(v11, v17);
            }

            NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
            v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"bundleID=%@",  v11));
            v26 = v18;
            int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
            id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Invalid pluginType",  v19));

            objc_exception_throw(v20);
          }

          id v14 = objc_alloc(&OBJC_CLASS___MLRSchedulingTask);
          -[MLRTaskScheduler _maxTimeLimitForBundle:](self, "_maxTimeLimitForBundle:", v11);
          id v13 = -[MLRSchedulingTask initWithBundleIdentifier:taskSource:maxTimeLimit:]( v14,  "initWithBundleIdentifier:taskSource:maxTimeLimit:",  v11,  1LL);
        }

        else
        {
          id v13 = -[MLRSchedulingTask initWithBundleIdentifier:taskSource:]( objc_alloc(&OBJC_CLASS___MLRSchedulingTask),  "initWithBundleIdentifier:taskSource:",  v11,  1LL);
        }

        uint64_t v15 = v13;
        [v5 addObject:v13];
      }

      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)filterPluginIDs:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned __int8 v6 = -[MLRTaskScheduler diagnosticsUsageAllowed](self, "diagnosticsUsageAllowed");
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v21;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v19 = v9;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v12);
        if ((-[DESBundleRegistryManaging containsBundleId:]( self->_bundleRegistry,  "containsBundleId:",  v13,  v19,  (void)v20) & 1) != 0)
        {
          if ((v6 & 1) != 0
            || -[MLRTaskScheduler allowBypassDiagnosticsUsage:](self, "allowBypassDiagnosticsUsage:", v13))
          {
            [v5 addObject:v13];
            id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_13;
            }
            *(_DWORD *)buf = v19;
            uint64_t v25 = v13;
            uint64_t v15 = v14;
            id v16 = "Found plugin %@";
          }

          else
          {
            id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_13;
            }
            *(_DWORD *)buf = v19;
            uint64_t v25 = v13;
            uint64_t v15 = v14;
            id v16 = "Cannot schedule plugin=%@ because D&U is not enabled";
          }

          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0xCu);
        }

        else
        {
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            uint64_t v25 = v13;
            _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Cannot schedule plugin=%@ because it is missing",  buf,  0xCu);
          }
        }

- (void)startTasksForPluginIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MLRTaskScheduler filterPluginIDs:](self, "filterPluginIDs:", a3));
  id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_fides_shuffledArray"));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MLRTaskScheduler tasksForPluginIDs:](self, "tasksForPluginIDs:", v9));
  -[MLRTaskScheduler startTasks:completion:](self, "startTasks:completion:", v8, v6);
}

- (void)stop
{
  self->_requestedToStop = 1;
  taskWorkerQueue = self->_taskWorkerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A588;
  block[3] = &unk_100014708;
  block[4] = self;
  dispatch_async((dispatch_queue_t)taskWorkerQueue, block);
}

- (BOOL)taskIsDeferred
{
  return self->_requestedToStop;
}

- (void).cxx_destruct
{
}

@end