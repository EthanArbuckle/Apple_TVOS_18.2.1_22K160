@interface MLRTrialShadowExperimentTaskWorker
- (BOOL)_DASAllowTask:(id)a3 error:(id *)a4;
- (BOOL)_pluginSupportTrialTask:(id *)a3;
- (BOOL)canRunTask:(id)a3;
- (BOOL)requestedToStop;
- (BOOL)updateTaskAfterCompletion:(id)a3 taskID:(id)a4 error:(id *)a5;
- (DESDebugRecord)debugRecord;
- (MLRTrialShadowExperimentTaskWorker)initWithTrialManager:(id)a3 plugin:(id)a4 alwaysRun:(BOOL)a5;
- (id)telemetryResponse;
- (void)_performAfterTask:(id)a3 duration:(double)a4 error:(id)a5;
- (void)runWithCompletion:(id)a3;
- (void)stop;
@end

@implementation MLRTrialShadowExperimentTaskWorker

- (MLRTrialShadowExperimentTaskWorker)initWithTrialManager:(id)a3 plugin:(id)a4 alwaysRun:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100006B98(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_10;
  }

  if (!v9)
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100006BCC(v21, v29, v30, v31, v32, v33, v34, v35);
    }
LABEL_10:

    v20 = 0LL;
    goto LABEL_11;
  }

  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___MLRTrialShadowExperimentTaskWorker;
  v11 = -[MLRTrialShadowExperimentTaskWorker init](&v37, "init");
  if (v11)
  {
    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("MLRTrialShadowExperimentTaskWorker", v13);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v11->_plugin, a4);
    objc_storeStrong((id *)&v11->_trialManager, a3);
    v11->_alwaysRun = a5;
    v16 = objc_alloc(&OBJC_CLASS___DESDebugRecord);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
    v18 = -[DESDebugRecord initWithPluginID:taskSource:](v16, "initWithPluginID:taskSource:", v17, 1LL);
    debugRecord = v11->_debugRecord;
    v11->_debugRecord = v18;
  }

  self = v11;
  v20 = self;
LABEL_11:

  return v20;
}

- (BOOL)canRunTask:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_alwaysRun)
  {
    if (!v4)
    {
      id v9 = (MLRTaskSchedulingRecord *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Nil scheduling policy."));
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100005360();
      }

      debugRecord = self->_debugRecord;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([0 taskID]);
      -[DESDebugRecord addForTaskID:result:description:](debugRecord, "addForTaskID:result:description:", v10, 1LL, v9);
      goto LABEL_15;
    }

    v7 = objc_alloc(&OBJC_CLASS___MLRTaskSchedulingRecord);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 taskID]);
    id v9 = -[MLRTaskSchedulingRecord initWithTaskID:](v7, "initWithTaskID:", v8);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v11 = -[MLRTaskSchedulingRecord performCount](v9, "performCount");
    if (v11 >= [v5 maxPerformCount])
    {
      id v23 = -[MLRTaskSchedulingRecord performCount](v9, "performCount");
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[DESPluginManaging bundleIdentifier](self->_plugin, "bundleIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot run: too many times (%ld), plugin=%@, policy=%@",  v23,  v24,  v5));

      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v35 = v19;
        goto LABEL_13;
      }
    }

    else
    {
      dispatch_queue_attr_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MLRTaskSchedulingRecord lastCompletionDate](v9, "lastCompletionDate"));
      [v10 timeIntervalSinceDate:v12];
      double v14 = v13;
      [v5 minInterval];
      double v16 = v15;

      if (v14 >= v16)
      {
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v5 startAfterDate]);
        id v29 = [v10 compare:v28];

        if (v29 == (id)-1LL)
        {
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[DESPluginManaging bundleIdentifier](self->_plugin, "bundleIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot run: too early to run, plugin=%@, policy=%@",  v33,  v5));

          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v35 = v19;
        }

        else
        {
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v5 endAtDate]);
          id v31 = [v10 compare:v30];

          if (v31 != (id)1)
          {
            BOOL v6 = 1;
            goto LABEL_16;
          }

          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[DESPluginManaging bundleIdentifier](self->_plugin, "bundleIdentifier"));
          v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot run: too late to run, plugin=%@, policy=%@",  v32,  v5));

          v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v35 = v19;
        }

        goto LABEL_13;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MLRTaskSchedulingRecord lastCompletionDate](v9, "lastCompletionDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DESPluginManaging bundleIdentifier](self->_plugin, "bundleIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot run: too soon since last completion date (%@), plugin=%@, policy=%@",  v17,  v18,  v5));

      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v35 = v19;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }

- (BOOL)updateTaskAfterCompletion:(id)a3 taskID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8 && v9)
  {
    id v11 = -[MLRTaskSchedulingRecord initWithTaskID:]( objc_alloc(&OBJC_CLASS___MLRTaskSchedulingRecord),  "initWithTaskID:",  v9);
    -[MLRTaskSchedulingRecord setLastCompletionDate:](v11, "setLastCompletionDate:", v8);
    -[MLRTaskSchedulingRecord setPerformCount:]( v11,  "setPerformCount:",  (char *)-[MLRTaskSchedulingRecord performCount](v11, "performCount") + 1);
    if (-[MLRTaskSchedulingRecord commitWithError:](v11, "commitWithError:", a5)) {
      LOBYTE(a5) = -[DESDebugRecord commitWithError:](self->_debugRecord, "commitWithError:", a5);
    }
    else {
      LOBYTE(a5) = 0;
    }
  }

  else if (a5)
  {
    uint64_t v12 = kDESDistributedEvaluationErrorDomain;
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    double v16 = @"Nil TaskID or completionDate";
    double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  1400LL,  v13));

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (void)_performAfterTask:(id)a3 duration:(double)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DESPluginManaging bundleIdentifier](self->_plugin, "bundleIdentifier"));
  *(float *)&a4 = a4;
  id v11 = v8;
  id v12 = v9;
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v11 evaluationID]);
  LODWORD(v14) = LODWORD(a4);
  +[DESCoreAnalyticsEventManager sendEventEvaluationForBundleID:evaluationID:duration:deferred:success:error:downloadedAttachmentCount:]( &OBJC_CLASS___DESCoreAnalyticsEventManager,  "sendEventEvaluationForBundleID:evaluationID:duration:deferred:success:error:downloadedAttachmentCount:",  v10,  v13,  0LL,  v9 == 0LL,  v12,  0LL,  v14);

  id v15 = sub_100006ACC(v11);
  double v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  +[DESBitacoraEventManager sendEventTaskCompletedForBundleID:identifiers:error:]( &OBJC_CLASS___DESBitacoraEventManager,  "sendEventTaskCompletedForBundleID:identifiers:error:",  v10,  v16,  v12);
  if (v9)
  {
    if (self->_requestedToStop)
    {
LABEL_10:
      debugRecord = self->_debugRecord;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v11 policy]);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 taskID]);
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
      -[DESDebugRecord addForTaskID:result:description:](debugRecord, "addForTaskID:result:description:", v28, 2LL, v29);

      goto LABEL_11;
    }
  }

  else
  {
    v17 = self->_debugRecord;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v11 policy]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 taskID]);
    -[DESDebugRecord addForTaskID:result:description:](v17, "addForTaskID:result:description:", v19, 0LL, 0LL);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v11 policy]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 taskID]);
  id v30 = 0LL;
  unsigned __int8 v23 = -[MLRTrialShadowExperimentTaskWorker updateTaskAfterCompletion:taskID:error:]( self,  "updateTaskAfterCompletion:taskID:error:",  v20,  v22,  &v30);
  id v24 = v30;

  if ((v23 & 1) == 0)
  {
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100006C00();
    }
  }

  if (v9) {
    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)_pluginSupportTrialTask:(id *)a3
{
  p_plugin = &self->_plugin;
  char v5 = objc_opt_respondsToSelector(self->_plugin, "performTrialTask:outError:");
  if ((v5 & 1) == 0)
  {
    if (a3)
    {
      uint64_t v6 = kDESDistributedEvaluationErrorDomain;
      NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
      id v11 = @"Plugin doesn't support trial task.";
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v6,  5000LL,  v7));
    }

    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100006C7C((id *)p_plugin, v8);
    }
  }

  return v5 & 1;
}

- (BOOL)_DASAllowTask:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL requestedToStop = self->_requestedToStop;
  if (self->_requestedToStop)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DAS requests to stop task = %@", buf, 0xCu);
    }

    debugRecord = self->_debugRecord;
    NSErrorUserInfoKey v10 = (void *)objc_claimAutoreleasedReturnValue([v6 policy]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 taskID]);
    -[DESDebugRecord addForTaskID:result:description:](debugRecord, "addForTaskID:result:description:", v11, 3LL, 0LL);

    if (a4)
    {
      uint64_t v12 = kDESDistributedEvaluationErrorDomain;
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      double v16 = @"Evaluation has been deferred";
      double v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  2LL,  v13));
    }
  }

  return !requestedToStop;
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000065F4;
  v7[3] = &unk_100014888;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)stop
{
  self->_BOOL requestedToStop = 1;
  -[DESPluginManaging stopWithCompletion:](self->_plugin, "stopWithCompletion:", &stru_100014910);
}

- (id)telemetryResponse
{
  return 0LL;
}

- (BOOL)requestedToStop
{
  return self->_requestedToStop;
}

- (DESDebugRecord)debugRecord
{
  return self->_debugRecord;
}

- (void).cxx_destruct
{
}

@end