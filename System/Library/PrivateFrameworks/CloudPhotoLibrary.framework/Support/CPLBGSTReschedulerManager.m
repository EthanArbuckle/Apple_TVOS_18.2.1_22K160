@interface CPLBGSTReschedulerManager
+ (NSString)groupNameForAppLibrarySync;
+ (NSString)groupNameForSystemLibrarySync;
+ (NSString)taskIdentifierForSystemLibrary;
+ (id)taskIdentifierForLibraryIdentifier:(id)a3;
- (BOOL)isQuiet;
- (BOOL)isWaitingForAcquiredTaskWithIdentifier:(id)a3;
- (CPLBGSTReschedulerManager)initWithTaskIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5 groupName:(id)a6;
- (CPLBGSystemTaskScheduler)scheduler;
- (Class)requestClass;
- (NSArray)involvedProcesses;
- (NSArray)relatedApplications;
- (NSDate)now;
- (NSString)description;
- (NSString)groupName;
- (NSString)reschedulerDescription;
- (NSString)taskIdentifier;
- (OS_dispatch_queue)queue;
- (double)_expectedDurationFromPrediction:(id)a3;
- (double)minimumRuntime;
- (double)minimumRuntimeLeeway;
- (double)minimumRuntimeWithExtendedTime;
- (double)minimumRuntimeWithVeryLongExtendedTime;
- (id)_persistedSyncSessionForScheduler:(id)a3 startSyncSessionBlock:(id)a4;
- (id)_requestFromUpdatedRequest:(id)a3 updatedPrediction:(id)a4;
- (id)_summaryForTaskRequest:(id)a3;
- (id)newReschedulerWithExpectedDuration:(double)a3;
- (id)newTaskRequestForSession:(id)a3;
- (id)newTaskRequestWithExpectedDuration:(double)a3;
- (id)resubmitTaskRequestForRescheduler:(id)a3 updatedPrediction:(id)a4 afterTaskHasBeenDeferred:(id)a5;
- (id)taskStatusesWithNow:(id)a3;
- (id)updateTaskRequest:(id)a3 updatedPrediction:(id)a4;
- (void)_acquiredTask:(id)a3 error:(id)a4;
- (void)_deregisterTaskIdentifier:(id)a3;
- (void)_reallySubmitTaskRequest:(id)a3;
- (void)_registerWithTaskIdentifier:(id)a3;
- (void)activityHasExpired:(id)a3 forRescheduler:(id)a4;
- (void)dropPersistedInitialSyncSession;
- (void)dropTaskRequest:(id)a3 forRescheduler:(id)a4;
- (void)findPersistedSyncSession:(id)a3 forScheduler:(id)a4 completionHandler:(id)a5;
- (void)setMinimumRuntime:(double)a3;
- (void)setMinimumRuntimeLeeway:(double)a3;
- (void)setMinimumRuntimeWithExtendedTime:(double)a3;
- (void)setMinimumRuntimeWithVeryLongExtendedTime:(double)a3;
- (void)setNow:(id)a3;
- (void)setScheduler:(id)a3;
- (void)submitTaskRequestForRescheduler:(id)a3;
@end

@implementation CPLBGSTReschedulerManager

- (CPLBGSTReschedulerManager)initWithTaskIdentifier:(id)a3 involvedProcesses:(id)a4 relatedApplications:(id)a5 groupName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___CPLBGSTReschedulerManager;
  v14 = -[CPLBGSTReschedulerManager init](&v33, "init");
  v15 = v14;
  if (v14)
  {
    uint64_t v16 = CPLCopyDefaultSerialQueueAttributes(v14);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.cpl.bgst.rescheduler", v17);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
    scheduler = v15->_scheduler;
    v15->_scheduler = (CPLBGSystemTaskScheduler *)v20;

    v22 = (NSString *)[v10 copy];
    taskIdentifier = v15->_taskIdentifier;
    v15->_taskIdentifier = v22;

    v24 = (NSArray *)[v11 copy];
    involvedProcesses = v15->_involvedProcesses;
    v15->_involvedProcesses = v24;

    v26 = (NSArray *)[v12 copy];
    relatedApplications = v15->_relatedApplications;
    v15->_relatedApplications = v26;

    v28 = (NSString *)[v13 copy];
    groupName = v15->_groupName;
    v15->_groupName = v28;

    v30 = objc_alloc_init(&OBJC_CLASS___CPLBGSTActivitiesReport);
    report = v15->_report;
    v15->_report = v30;

    *(_OWORD *)&v15->_minimumRuntime = xmmword_1002121F0;
    *(_OWORD *)&v15->_minimumRuntimeLeeway = xmmword_100212200;
  }

  return v15;
}

- (NSDate)now
{
  now = self->_now;
  if (now) {
    return now;
  }
  else {
    return (NSDate *)(id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
}

- (Class)requestClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___BGNonRepeatingSystemTaskRequest);
}

- (BOOL)isWaitingForAcquiredTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000285A0;
  block[3] = &unk_10023EFF0;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)isQuiet
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002868C;
  v5[3] = &unk_10023DD58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"[%@ for %@]",  objc_opt_class(self),  self->_taskIdentifier);
}

- (id)newTaskRequestWithExpectedDuration:(double)a3
{
  v5 = -[BGNonRepeatingSystemTaskRequest initWithIdentifier:]( objc_alloc(&OBJC_CLASS___BGNonRepeatingSystemTaskRequest),  "initWithIdentifier:",  self->_taskIdentifier);
  -[BGNonRepeatingSystemTaskRequest setExpectedDuration:](v5, "setExpectedDuration:", a3);
  -[BGNonRepeatingSystemTaskRequest setInvolvedProcesses:](v5, "setInvolvedProcesses:", self->_involvedProcesses);
  -[BGNonRepeatingSystemTaskRequest setRelatedApplications:](v5, "setRelatedApplications:", self->_relatedApplications);
  if (self->_groupName)
  {
    -[BGNonRepeatingSystemTaskRequest setGroupName:](v5, "setGroupName:");
    -[BGNonRepeatingSystemTaskRequest setGroupConcurrencyLimit:](v5, "setGroupConcurrencyLimit:", 1LL);
  }

  -[BGNonRepeatingSystemTaskRequest setPriority:](v5, "setPriority:", 1LL);
  -[BGNonRepeatingSystemTaskRequest setRequiresExternalPower:](v5, "setRequiresExternalPower:", 0LL);
  -[BGNonRepeatingSystemTaskRequest setRequiresNetworkConnectivity:](v5, "setRequiresNetworkConnectivity:", 1LL);
  -[BGNonRepeatingSystemTaskRequest setScheduleAfter:](v5, "setScheduleAfter:", 0.0);
  -[BGNonRepeatingSystemTaskRequest setTrySchedulingBefore:](v5, "setTrySchedulingBefore:", 3600.0);
  -[BGNonRepeatingSystemTaskRequest setOverrideRateLimiting:](v5, "setOverrideRateLimiting:", 1LL);
  return v5;
}

- (double)_expectedDurationFromPrediction:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastPrediction, a3);
  +[CPLBGSTActivity estimatedRunningTimeFromPrediction:minimumRuntime:minimumRuntimeWithExtendedTime:minimumRuntimeWithVeryLongExtendedTime:]( &OBJC_CLASS___CPLBGSTActivity,  "estimatedRunningTimeFromPrediction:minimumRuntime:minimumRuntimeWithExtendedTime:minimumRuntimeWithVeryLongExtendedTime:",  v5,  self->_minimumRuntime,  self->_minimumRuntimeWithExtendedTime,  self->_minimumRuntimeWithVeryLongExtendedTime);
  double v7 = v6 + self->_minimumRuntimeLeeway;
  if (v7 >= self->_minimumRuntime) {
    double minimumRuntime = v7;
  }
  else {
    double minimumRuntime = self->_minimumRuntime;
  }
  self->_double lastEstimatedRunningTime = minimumRuntime;
  if (!_CPLSilentLogging)
  {
    id v9 = sub_100025C4C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double lastEstimatedRunningTime = self->_lastEstimatedRunningTime;
      int v13 = 134217984;
      double v14 = lastEstimatedRunningTime;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Estimated running time from predictions: %.0fs",  (uint8_t *)&v13,  0xCu);
    }

    double minimumRuntime = self->_lastEstimatedRunningTime;
  }

  return minimumRuntime;
}

- (id)newTaskRequestForSession:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 predictor]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentPrediction]);

  LODWORD(v5) = [v4 shouldRequestMoreTime];
  if ((_DWORD)v5)
  {
    if (self->_lastEstimatedRunningTime + self->_lastEstimatedRunningTime >= self->_minimumRuntimeWithVeryLongExtendedTime) {
      double minimumRuntimeWithVeryLongExtendedTime = self->_minimumRuntimeWithVeryLongExtendedTime;
    }
    else {
      double minimumRuntimeWithVeryLongExtendedTime = self->_lastEstimatedRunningTime + self->_lastEstimatedRunningTime;
    }
    -[CPLBGSTReschedulerManager _expectedDurationFromPrediction:](self, "_expectedDurationFromPrediction:", v6);
    if (minimumRuntimeWithVeryLongExtendedTime >= v8) {
      double v8 = minimumRuntimeWithVeryLongExtendedTime;
    }
    self->_double lastEstimatedRunningTime = v8;
    BOOL v9 = 1;
  }

  else
  {
    -[CPLBGSTReschedulerManager _expectedDurationFromPrediction:](self, "_expectedDurationFromPrediction:", v6);
    BOOL v9 = 0;
  }

  self->_lastSessionWasExplicitlyExtended = v9;
  id v10 = -[CPLBGSTReschedulerManager newTaskRequestWithExpectedDuration:](self, "newTaskRequestWithExpectedDuration:");
  [v10 updateWithPrediction:v6];

  return v10;
}

- (void)_registerWithTaskIdentifier:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_registeredTaskIdentifier = &self->_registeredTaskIdentifier;
  if (!self->_registeredTaskIdentifier) {
    goto LABEL_5;
  }
  if ((objc_msgSend(v6, "isEqualToString:") & 1) == 0)
  {
    -[CPLBGSystemTaskScheduler deregisterTaskWithIdentifier:]( self->_scheduler,  "deregisterTaskWithIdentifier:",  self->_registeredTaskIdentifier);
    registeredTaskIdentifier = self->_registeredTaskIdentifier;
    self->_registeredTaskIdentifier = 0LL;
  }

  BOOL v9 = *p_registeredTaskIdentifier;
  if (!*p_registeredTaskIdentifier)
  {
LABEL_5:
    objc_storeStrong((id *)&self->_registeredTaskIdentifier, a3);
    scheduler = self->_scheduler;
    uint64_t v11 = self->_registeredTaskIdentifier;
    queue = self->_queue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100028BCC;
    v18[3] = &unk_10023F018;
    v18[4] = self;
    if ((-[CPLBGSystemTaskScheduler registerForTaskWithIdentifier:usingQueue:launchHandler:]( scheduler,  "registerForTaskWithIdentifier:usingQueue:launchHandler:",  v11,  queue,  v18) & 1) == 0) {
      sub_10018F284(&self->_registeredTaskIdentifier, a2, self);
    }
    BOOL v9 = *p_registeredTaskIdentifier;
  }

  if (!-[NSString isEqualToString:](v9, "isEqualToString:", v6))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v13 = __CPLGenericOSLogDomain();
      double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *p_registeredTaskIdentifier;
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = v15;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Unexpected registered task identifier %@ after registering %@",  buf,  0x16u);
      }
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
    [v16 handleFailureInMethod:a2, self, v17, 655, @"Unexpected registered task identifier %@ after registering %@", self->_registeredTaskIdentifier, v6 object file lineNumber description];

    abort();
  }
}

- (void)_deregisterTaskIdentifier:(id)a3
{
  *((void *)&v20 + 1) = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_registeredTaskIdentifier = &self->_registeredTaskIdentifier;
  if (self->_registeredTaskIdentifier)
  {
    if (self->_interestedRescheduler)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v12 = __CPLGenericOSLogDomain();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          registeredTaskIdentifier = self->_registeredTaskIdentifier;
          interestedRescheduler = self->_interestedRescheduler;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = registeredTaskIdentifier;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = interestedRescheduler;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Trying to deregister %@ while we are waiting for a task for %@",  buf,  0x16u);
        }
      }

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
      [v16 handleFailureInMethod:a2, self, v17, 661, @"Trying to deregister %@ while we are waiting for a task for %@", self->_registeredTaskIdentifier, self->_interestedRescheduler object file lineNumber description];

      abort();
    }

    if ((objc_msgSend(*((id *)&v20 + 1), "isEqualToString:") & 1) == 0) {
      sub_10018F444( *((uint64_t *)&v20 + 1),  (uint64_t)self,  (uint64_t)a2,  v6,  v7,  v8,  v9,  v10,  v18,  v19,  v20,  *(uint64_t *)buf,  *(uint64_t *)&buf[8],  *(uint64_t *)&buf[16],  v22,  v23,  v24,  v25,  v26,  vars0,  vars8);
    }
    if ((-[CPLBGSystemTaskScheduler deregisterTaskWithIdentifier:]( self->_scheduler,  "deregisterTaskWithIdentifier:",  self->_registeredTaskIdentifier) & 1) == 0) {
      sub_10018F364(&self->_registeredTaskIdentifier, a2, self);
    }
    uint64_t v11 = *p_registeredTaskIdentifier;
    *p_registeredTaskIdentifier = 0LL;
  }
}

- (void)_reallySubmitTaskRequest:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentTaskRequest, a3);
  lastTaskRequest = self->_lastTaskRequest;
  self->_lastTaskRequest = 0LL;

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  -[CPLBGSTReschedulerManager _registerWithTaskIdentifier:](self, "_registerWithTaskIdentifier:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v9 = [v8 BOOLForKey:@"CPLAlwaysFailBackgroundTask"];

  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_100025C4C();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Automatically failing %@", buf, 0xCu);
      }
    }

    id v12 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  150LL,  @"Automatically failing background task"));
LABEL_13:
    self->_currentTaskRequestHasBeenSubmitted = 0;
    -[CPLBGSTReschedulerManager _acquiredTask:error:](self, "_acquiredTask:error:", 0LL, v12);
    goto LABEL_14;
  }

  scheduler = self->_scheduler;
  id v19 = 0LL;
  int v14 = -[CPLBGSystemTaskScheduler submitTaskRequest:error:]( scheduler,  "submitTaskRequest:error:",  v5,  &v19);
  id v12 = v19;
  if ((v14 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v17 = sub_100025C4C();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v5;
        __int16 v22 = 2112;
        id v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to submit %@: %@", buf, 0x16u);
      }
    }

    goto LABEL_13;
  }

  report = self->_report;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  -[CPLBGSTActivitiesReport didSubmitTaskWithIdentifier:](report, "didSubmitTaskWithIdentifier:", v16);

  self->_currentTaskRequestHasBeenSubmitted = 1;
LABEL_14:
}

- (void)_acquiredTask:(id)a3 error:(id)a4
{
  id v27 = a3;
  id v7 = a4;
  currentTaskRequest = self->_currentTaskRequest;
  if (!currentTaskRequest) {
    sub_10018F540();
  }
  if (!self->_registeredTaskIdentifier) {
    sub_10018F5F0();
  }
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[BGNonRepeatingSystemTaskRequest identifier](currentTaskRequest, "identifier"));
  unsigned __int8 v10 = [v9 isEqualToString:self->_registeredTaskIdentifier];

  if ((v10 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v18 = __CPLGenericOSLogDomain();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        registeredTaskIdentifier = self->_registeredTaskIdentifier;
        __int128 v20 = self->_currentTaskRequest;
        *(_DWORD *)buf = 138412546;
        v29 = v20;
        __int16 v30 = 2112;
        v31 = registeredTaskIdentifier;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Acquired %@ mismatches task identifier %@",  buf,  0x16u);
      }
    }

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
    [v22 handleFailureInMethod:a2, self, v23, 692, @"Acquired %@ mismatches task identifier %@", self->_currentTaskRequest, self->_registeredTaskIdentifier object file lineNumber description];
    goto LABEL_24;
  }

  interestedRescheduler = self->_interestedRescheduler;
  id v12 = interestedRescheduler;
  self->_currentTaskRequestHasBeenSubmitted = 0;
  objc_storeStrong((id *)&self->_runningRescheduler, self->_interestedRescheduler);
  uint64_t v13 = self->_interestedRescheduler;
  self->_interestedRescheduler = 0LL;

  if (v27)
  {
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
    unsigned __int8 v15 = [v14 isEqualToString:self->_registeredTaskIdentifier];

    if ((v15 & 1) != 0)
    {
      report = self->_report;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[BGNonRepeatingSystemTaskRequest identifier](self->_currentTaskRequest, "identifier"));
      -[CPLBGSTActivitiesReport didAcquireTaskWithIdentifier:](report, "didAcquireTaskWithIdentifier:", v17);

      -[CPLBGSTRescheduler acquiredTask:](v12, "acquiredTask:", v27);
      goto LABEL_10;
    }

    if (!_CPLSilentLogging)
    {
      uint64_t v24 = __CPLGenericOSLogDomain();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = self->_registeredTaskIdentifier;
        *(_DWORD *)buf = 138412546;
        v29 = (BGNonRepeatingSystemTaskRequest *)v27;
        __int16 v30 = 2112;
        v31 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Acquired %@ mismatches registered task identifier %@",  buf,  0x16u);
      }
    }

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
    [v22 handleFailureInMethod:a2, self, v23, 700, @"Acquired %@ mismatches registered task identifier %@", v27, self->_registeredTaskIdentifier object file lineNumber description];
LABEL_24:

    abort();
  }

  if (!v7) {
    sub_10018F750();
  }
  -[CPLBGSTRescheduler failedToAcquireTaskWithError:](v12, "failedToAcquireTaskWithError:", v7);
LABEL_10:
}

- (id)_requestFromUpdatedRequest:(id)a3 updatedPrediction:(id)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = a4;
    -[CPLBGSTReschedulerManager _expectedDurationFromPrediction:](self, "_expectedDurationFromPrediction:", v7);
    objc_msgSend(v6, "setExpectedDuration:");
    [v6 updateWithPrediction:v7];
  }

  return v6;
}

- (void)submitTaskRequestForRescheduler:(id)a3
{
  id v5 = (CPLBGSTRescheduler *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_interestedRescheduler)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v7 = __CPLGenericOSLogDomain();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        registeredTaskIdentifier = self->_registeredTaskIdentifier;
        interestedRescheduler = self->_interestedRescheduler;
        *(_DWORD *)buf = 138412802;
        id v19 = v5;
        __int16 v20 = 2112;
        id v21 = registeredTaskIdentifier;
        __int16 v22 = 2112;
        id v23 = interestedRescheduler;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Trying to register %@ for %@ twice (already registered: %@)",  buf,  0x20u);
      }
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
    [v11 handleFailureInMethod:a2, self, v12, 720, @"Trying to register %@ for %@ twice (already registered: %@)", v5, self->_registeredTaskIdentifier, self->_interestedRescheduler object file lineNumber description];
LABEL_15:

    abort();
  }

  if (self->_runningRescheduler)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v13 = __CPLGenericOSLogDomain();
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v15 = self->_registeredTaskIdentifier;
        uint64_t v16 = self->_interestedRescheduler;
        *(_DWORD *)buf = 138412802;
        id v19 = v5;
        __int16 v20 = 2112;
        id v21 = v15;
        __int16 v22 = 2112;
        id v23 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Trying to register %@ for %@ while %@ is running",  buf,  0x20u);
      }
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
    [v11 handleFailureInMethod:a2, self, v12, 721, @"Trying to register %@ for %@ while %@ is running", v5, self->_registeredTaskIdentifier, self->_interestedRescheduler object file lineNumber description];
    goto LABEL_15;
  }

  if (self->_registeredTaskIdentifier) {
    sub_10018F800(v5, a2, self);
  }
  self->_interestedRescheduler = v5;
  id v6 = v5;

  id v17 = (id)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler request](v6, "request"));
  -[CPLBGSTReschedulerManager _reallySubmitTaskRequest:](self, "_reallySubmitTaskRequest:", v17);
}

- (id)resubmitTaskRequestForRescheduler:(id)a3 updatedPrediction:(id)a4 afterTaskHasBeenDeferred:(id)a5
{
  unsigned __int8 v10 = (CPLBGSTRescheduler *)a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_registeredTaskIdentifier = &self->_registeredTaskIdentifier;
  registeredTaskIdentifier = self->_registeredTaskIdentifier;
  if (!registeredTaskIdentifier
    || (unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler taskIdentifier](v10, "taskIdentifier")),
        unsigned __int8 v16 = -[NSString isEqualToString:](registeredTaskIdentifier, "isEqualToString:", v15),
        v15,
        (v16 & 1) == 0))
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v37 = ((uint64_t (*)(void))__CPLGenericOSLogDomain)();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = (BGNonRepeatingSystemTaskRequest *)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler taskIdentifier](v10, "taskIdentifier"));
        v40 = *p_registeredTaskIdentifier;
        *(_DWORD *)buf = 138412546;
        v59 = v39;
        __int16 v60 = 2112;
        id v61 = v40;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Trying to resubmit request for %@ while we are currently registered for %@",  buf,  0x16u);
      }
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler taskIdentifier](v10, "taskIdentifier"));
    [v41 handleFailureInMethod:a2, self, v42, 732, @"Trying to resubmit request for %@ while we are currently registered for %@", v43, self->_registeredTaskIdentifier object file lineNumber description];

LABEL_36:
    abort();
  }

  if (self->_currentTaskRequestHasBeenSubmitted)
  {
    sub_10018F9B8(&self->_registeredTaskIdentifier, a2, self);
    goto LABEL_30;
  }

  p_interestedRescheduler = &self->_interestedRescheduler;
  if (self->_interestedRescheduler)
  {
LABEL_30:
    p_interestedRescheduler = (CPLBGSTRescheduler **)sub_10018F8D8(&self->_registeredTaskIdentifier, a2, self);
    goto LABEL_31;
  }

  if (self->_runningRescheduler != v10)
  {
LABEL_31:
    if (!_CPLSilentLogging)
    {
      uint64_t v44 = __CPLGenericOSLogDomain(p_interestedRescheduler);
      v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = self->_registeredTaskIdentifier;
        runningRescheduler = self->_runningRescheduler;
        *(_DWORD *)buf = 138412802;
        v59 = (BGNonRepeatingSystemTaskRequest *)v46;
        __int16 v60 = 2112;
        id v61 = v10;
        __int16 v62 = 2112;
        v63 = runningRescheduler;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Trying to resubmit %@ for %@ but current running one is %@",  buf,  0x20u);
      }
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
    [v41 handleFailureInMethod:a2, self, v42, 735, @"Trying to resubmit %@ for %@ but current running one is %@", self->_registeredTaskIdentifier, v10, self->_runningRescheduler object file lineNumber description];
    goto LABEL_36;
  }

  objc_storeStrong((id *)p_interestedRescheduler, a3);
  uint64_t v18 = self->_runningRescheduler;
  self->_runningRescheduler = 0LL;

  id v19 = (BGNonRepeatingSystemTaskRequest *)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler request](v10, "request"));
  __int16 v20 = (BGNonRepeatingSystemTaskRequest *)objc_claimAutoreleasedReturnValue( -[CPLBGSTReschedulerManager _requestFromUpdatedRequest:updatedPrediction:]( self,  "_requestFromUpdatedRequest:updatedPrediction:",  v19,  v11));
  if (v20 != v19)
  {
    [v12 setTaskCompleted];
    id v21 = -[CPLBGSTReschedulerManager _reallySubmitTaskRequest:](self, "_reallySubmitTaskRequest:", v20);
    if (self->_currentTaskRequest == v20)
    {
      __int16 v22 = *p_registeredTaskIdentifier;
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[BGNonRepeatingSystemTaskRequest identifier](v20, "identifier"));
      LOBYTE(v22) = -[NSString isEqualToString:](v22, "isEqualToString:", v23);

      if ((v22 & 1) != 0)
      {
        uint64_t v25 = v20;
        goto LABEL_23;
      }

      if (!_CPLSilentLogging)
      {
        uint64_t v53 = __CPLGenericOSLogDomain(v24);
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v55 = *p_registeredTaskIdentifier;
          *(_DWORD *)buf = 138412546;
          v59 = v20;
          __int16 v60 = 2112;
          id v61 = v55;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_ERROR,  "New %@ should be our current registered task identifier (%@)",  buf,  0x16u);
        }
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
      [v51 handleFailureInMethod:a2, self, v52, 747, @"New %@ should be our current registered task identifier (%@)", v20, self->_registeredTaskIdentifier object file lineNumber description];
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v48 = __CPLGenericOSLogDomain(v21);
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          currentTaskRequest = self->_currentTaskRequest;
          *(_DWORD *)buf = 138412546;
          v59 = v20;
          __int16 v60 = 2112;
          id v61 = currentTaskRequest;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "New %@ should be our current task request (%@)",  buf,  0x16u);
        }
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
      [v51 handleFailureInMethod:a2, self, v52, 746, @"New %@ should be our current task request (%@)", v20, self->_currentTaskRequest object file lineNumber description];
    }

    abort();
  }

  id v57 = 0LL;
  unsigned __int8 v26 = [v12 setTaskExpiredWithRetryAfter:&v57 error:0.0];
  id v27 = v57;
  if ((v26 & 1) != 0)
  {
    report = self->_report;
    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[BGNonRepeatingSystemTaskRequest identifier](v19, "identifier"));
    -[CPLBGSTActivitiesReport didDeferTaskWithIdentifier:](report, "didDeferTaskWithIdentifier:", v29);

    scheduler = self->_scheduler;
    id v56 = 0LL;
    LOBYTE(v29) = -[CPLBGSystemTaskScheduler updateTaskRequest:error:]( scheduler,  "updateTaskRequest:error:",  v19,  &v56);
    id v31 = v56;
    if ((v29 & 1) == 0 && !_CPLSilentLogging)
    {
      id v32 = sub_100025C4C();
      objc_super v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v59 = v19;
        __int16 v60 = 2112;
        id v61 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Failed to update task request %@: %@",  buf,  0x16u);
      }
    }

    self->_currentTaskRequestHasBeenSubmitted = 1;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v34 = sub_100025C4C();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v59 = (BGNonRepeatingSystemTaskRequest *)v12;
        __int16 v60 = 2112;
        id v61 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Failed to reschedule expired %@: %@",  buf,  0x16u);
      }
    }

    self->_currentTaskRequestHasBeenSubmitted = 0;
    [v12 setTaskCompleted];
    -[CPLBGSTReschedulerManager _acquiredTask:error:](self, "_acquiredTask:error:", 0LL, v27);
  }

  uint64_t v25 = v19;

LABEL_23:
  return v25;
}

- (void)dropTaskRequest:(id)a3 forRescheduler:(id)a4
{
  uint64_t v7 = (BGNonRepeatingSystemTaskRequest *)a3;
  uint64_t v8 = (CPLBGSTRescheduler *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v7) {
    sub_10018FA98((uint64_t)a2);
  }
  if (self->_currentTaskRequest != v7)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v24 = __CPLGenericOSLogDomain(v9);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        currentTaskRequest = self->_currentTaskRequest;
        *(_DWORD *)buf = 138412546;
        v43 = v7;
        __int16 v44 = 2112;
        v45 = currentTaskRequest;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Cancelling an unknown task request %@ (current: %@)",  buf,  0x16u);
      }
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
    [v27 handleFailureInMethod:a2, self, v28, 774, @"Cancelling an unknown task request %@ (current: %@)", v7, self->_currentTaskRequest object file lineNumber description];

    abort();
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[BGNonRepeatingSystemTaskRequest identifier](v7, "identifier"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBGSTRescheduler currentActivity](v8, "currentActivity"));

  if (v11)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v29 = __CPLGenericOSLogDomain(v12);
      __int16 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v43 = v7;
        __int16 v44 = 2112;
        v45 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "Trying to unregister %@ for %@ while a task is running",  buf,  0x16u);
      }
    }

    id v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
    [v31 handleFailureInMethod:a2, self, v32, 776, @"Trying to unregister %@ for %@ while a task is running", v7, v8 object file lineNumber description];

    abort();
  }

  interestedRescheduler = self->_interestedRescheduler;
  if (!interestedRescheduler)
  {
    if (self->_runningRescheduler == v8)
    {
      self->_runningRescheduler = 0LL;

      -[CPLBGSTActivitiesReport didFinishTaskWithIdentifier:](self->_report, "didFinishTaskWithIdentifier:", v10);
      goto LABEL_13;
    }

    if (!_CPLSilentLogging)
    {
      uint64_t v38 = __CPLGenericOSLogDomain(v12);
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        runningRescheduler = self->_runningRescheduler;
        *(_DWORD *)buf = 138412546;
        v43 = v8;
        __int16 v44 = 2112;
        v45 = runningRescheduler;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Trying to drop task request for %@ but the currently active one is %@",  buf,  0x16u);
      }
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
    [v36 handleFailureInMethod:a2, self, v37, 798, @"Trying to drop task request for %@ but the currently active one is %@", v8, self->_runningRescheduler object file lineNumber description];
LABEL_36:

    abort();
  }

  if (interestedRescheduler != v8)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v33 = __CPLGenericOSLogDomain(v12);
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = self->_interestedRescheduler;
        *(_DWORD *)buf = 138412546;
        v43 = v8;
        __int16 v44 = 2112;
        v45 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "Trying to drop task request for %@ but the currently active one is %@",  buf,  0x16u);
      }
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
    [v36 handleFailureInMethod:a2, self, v37, 779, @"Trying to drop task request for %@ but the currently active one is %@", v8, self->_interestedRescheduler object file lineNumber description];
    goto LABEL_36;
  }

  if (!self->_currentTaskRequestHasBeenSubmitted)
  {
LABEL_13:
    -[CPLBGSTReschedulerManager _deregisterTaskIdentifier:](self, "_deregisterTaskIdentifier:", v10);
    goto LABEL_14;
  }

  scheduler = self->_scheduler;
  registeredTaskIdentifier = self->_registeredTaskIdentifier;
  id v41 = 0LL;
  unsigned __int8 v16 = -[CPLBGSystemTaskScheduler cancelTaskRequestWithIdentifier:error:]( scheduler,  "cancelTaskRequestWithIdentifier:error:",  registeredTaskIdentifier,  &v41);
  id v17 = v41;
  uint64_t v18 = v17;
  if ((v16 & 1) == 0)
  {
    id v19 = v17;
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 domain]);
    if ([v20 isEqualToString:BGSystemTaskSchedulerErrorDomain])
    {
      id v21 = [v19 code];

      if (v21 == (id)6) {
        goto LABEL_10;
      }
    }

    else
    {
    }

    sub_10018FB48(&self->_currentTaskRequest, (uint64_t)a2, (uint64_t)self, (uint64_t)v19);
  }

- (id)updateTaskRequest:(id)a3 updatedPrediction:(id)a4
{
  uint64_t v7 = (BGNonRepeatingSystemTaskRequest *)a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentTaskRequest != v7) {
    sub_10018FBD4((uint64_t)a2);
  }
  if (self->_interestedRescheduler)
  {
    uint64_t v9 = (BGNonRepeatingSystemTaskRequest *)objc_claimAutoreleasedReturnValue( -[CPLBGSTReschedulerManager _requestFromUpdatedRequest:updatedPrediction:]( self,  "_requestFromUpdatedRequest:updatedPrediction:",  v7,  v8));
    if (v9 == v7)
    {
      scheduler = self->_scheduler;
      id v20 = 0LL;
      unsigned __int8 v15 = -[CPLBGSystemTaskScheduler updateTaskRequest:error:]( scheduler,  "updateTaskRequest:error:",  v7,  &v20);
      id v16 = v20;
      if ((v15 & 1) == 0 && !_CPLSilentLogging)
      {
        id v17 = sub_100025C4C();
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v22 = v7;
          __int16 v23 = 2112;
          id v24 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to update task request %@: %@",  buf,  0x16u);
        }
      }
    }

    else
    {
      unsigned __int8 v10 = self->_interestedRescheduler;
      -[CPLBGSTReschedulerManager dropTaskRequest:forRescheduler:]( self,  "dropTaskRequest:forRescheduler:",  v7,  self->_interestedRescheduler);
      -[CPLBGSTReschedulerManager _reallySubmitTaskRequest:](self, "_reallySubmitTaskRequest:", v9);
      interestedRescheduler = self->_interestedRescheduler;
      self->_interestedRescheduler = v10;
      uint64_t v12 = v10;

      uint64_t v13 = v9;
      uint64_t v7 = v13;
    }
  }

  return v7;
}

- (void)activityHasExpired:(id)a3 forRescheduler:(id)a4
{
  queue = self->_queue;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 request]);

  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 identifier]);
  -[CPLBGSTActivitiesReport didExpireTaskWithIdentifier:](self->_report, "didExpireTaskWithIdentifier:", v8);
}

- (id)_persistedSyncSessionForScheduler:(id)a3 startSyncSessionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  -[CPLBGSTReschedulerManager _registerWithTaskIdentifier:](self, "_registerWithTaskIdentifier:", self->_taskIdentifier);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLBGSystemTaskScheduler taskRequestForIdentifier:]( self->_scheduler,  "taskRequestForIdentifier:",  self->_taskIdentifier));
  if (v9)
  {
    unsigned __int8 v10 = -[CPLBGSTRescheduler initWithRequest:reschedulerManager:]( objc_alloc(&OBJC_CLASS___CPLBGSTRescheduler),  "initWithRequest:reschedulerManager:",  v9,  self);
    BOOL v11 = -[NSString isEqualToString:](self->_registeredTaskIdentifier, "isEqualToString:", self->_taskIdentifier);
    if (!v11)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v17 = __CPLGenericOSLogDomain(v11);
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          registeredTaskIdentifier = self->_registeredTaskIdentifier;
          taskIdentifier = self->_taskIdentifier;
          *(_DWORD *)location = 138412546;
          *(void *)&location[4] = registeredTaskIdentifier;
          __int16 v27 = 2112;
          v28 = taskIdentifier;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Invalid registered task identifier %@ - expecting %@",  location,  0x16u);
        }
      }

      id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLBGSTRescheduler.m"));
      [v21 handleFailureInMethod:a2, self, v22, 852, @"Invalid registered task identifier %@ - expecting %@", self->_registeredTaskIdentifier, self->_taskIdentifier object file lineNumber description];

      abort();
    }

    objc_storeStrong((id *)&self->_currentTaskRequest, v9);
    self->_currentTaskRequestHasBeenSubmitted = 1;
    objc_storeStrong((id *)&self->_interestedRescheduler, v10);
    uint64_t v12 = objc_alloc(&OBJC_CLASS___CPLSyncSession);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v7 configuration]);
    int v14 = -[CPLSyncSession initWithSequenceNumber:expectedDate:scheduler:configuration:scopeFilter:]( v12,  "initWithSequenceNumber:expectedDate:scheduler:configuration:scopeFilter:",  0LL,  0LL,  v7,  v13,  0LL);

    objc_initWeak((id *)location, v14);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10002A6E0;
    v23[3] = &unk_10023F040;
    objc_copyWeak(&v25, (id *)location);
    id v24 = v8;
    -[CPLBGSTRescheduler _registerFromPersistentSyncSessionWithLaunchBlock:]( v10,  "_registerFromPersistentSyncSessionWithLaunchBlock:",  v23);
    -[CPLSyncSession setRescheduler:](v14, "setRescheduler:", v10);
    unsigned __int8 v15 = v14;

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);
  }

  else
  {
    -[CPLBGSTReschedulerManager _deregisterTaskIdentifier:](self, "_deregisterTaskIdentifier:", self->_taskIdentifier);
    unsigned __int8 v15 = 0LL;
  }

  return v15;
}

- (void)findPersistedSyncSession:(id)a3 forScheduler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10002A8B0;
  v18[3] = &unk_10023F068;
  v18[4] = self;
  id v19 = v9;
  id v20 = v8;
  id v21 = v10;
  uint64_t v12 = v18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B460;
  block[3] = &unk_10023DBC8;
  id v23 = v12;
  uint64_t v13 = queue;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v17);
}

- (void)dropPersistedInitialSyncSession
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002AAC8;
  v6[3] = &unk_10023DC98;
  v6[4] = self;
  v6[5] = a2;
  char v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B460;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  id v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (id)newReschedulerWithExpectedDuration:(double)a3
{
  id v4 = -[CPLBGSTReschedulerManager newTaskRequestWithExpectedDuration:](self, "newTaskRequestWithExpectedDuration:", a3);
  dispatch_block_t v5 = -[CPLBGSTRescheduler initWithRequest:reschedulerManager:]( objc_alloc(&OBJC_CLASS___CPLBGSTRescheduler),  "initWithRequest:reschedulerManager:",  v4,  self);

  return v5;
}

- (NSString)reschedulerDescription
{
  char v3 = objc_alloc(&OBJC_CLASS___NSString);
  taskIdentifier = self->_taskIdentifier;
  dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray componentsJoinedByString:]( self->_relatedApplications,  "componentsJoinedByString:",  @","));
  id v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@ for %@", taskIdentifier, v5);

  return v6;
}

- (id)_summaryForTaskRequest:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CPLBGSTActivityReport simplifiedTaskIdentifierForTaskIdentifier:]( &OBJC_CLASS___CPLBGSTActivityReport,  "simplifiedTaskIdentifierForTaskIdentifier:",  v4));

  id v6 = [v5 mutableCopy];
  unsigned int v7 = [v3 resourceIntensive];
  if (v7) {
    objc_msgSend(v6, "appendFormat:", @"%s%@", " (", @"resourceIntensive");
  }
  if ([v3 requiresUserInactivity])
  {
    id v8 = " (";
    if (v7) {
      id v8 = " ";
    }
    [v6 appendFormat:@"%s%@", v8, @"requiresUserInactivity"];
    int v9 = 0;
  }

  else
  {
    int v9 = v7 ^ 1;
  }

  if ([v3 requiresSignificantUserInactivity])
  {
    id v10 = " ";
    if (v9) {
      id v10 = " (";
    }
    [v6 appendFormat:@"%s%@", v10, @"requiresSignificantUserInactivity"];
    int v9 = 0;
  }

  if ([v3 powerNap])
  {
    BOOL v11 = " ";
    if (v9) {
      BOOL v11 = " (";
    }
    [v6 appendFormat:@"%s%@", v11, @"powerNap"];
    int v9 = 0;
  }

  if ([v3 requiresExternalPower])
  {
    uint64_t v12 = " ";
    if (v9) {
      uint64_t v12 = " (";
    }
    [v6 appendFormat:@"%s%@", v12, @"requiresExternalPower"];
    int v9 = 0;
  }

  if ([v3 requiresNetworkConnectivity])
  {
    uint64_t v13 = " ";
    id v14 = " (";
    if (!v9) {
      id v14 = " ";
    }
    [v6 appendFormat:@"%s%@", v14, @"requiresNetworkConnectivity"];
    goto LABEL_29;
  }

  if ([v3 overrideRateLimiting])
  {
    if (v9) {
      uint64_t v13 = " (";
    }
    else {
      uint64_t v13 = " ";
    }
LABEL_29:
    [v6 appendFormat:@"%s%@", v13, @"overrideRateLimiting"];
LABEL_31:
    [v6 appendString:@""]);
    goto LABEL_32;
  }

  if ((v9 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_32:
  id v15 = [v6 copy];

  return v15;
}

- (id)taskStatusesWithNow:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_100025440;
  id v16 = sub_100025450;
  id v17 = 0LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B018;
  block[3] = &unk_10023EFF0;
  id v10 = v4;
  BOOL v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (NSString)taskIdentifierForSystemLibrary
{
  return (NSString *)@"com.apple.cloudphotod.sync.discretionary";
}

+ (id)taskIdentifierForLibraryIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.cloudphotod.sync.%@",  v3);

  return v4;
}

+ (NSString)groupNameForSystemLibrarySync
{
  return (NSString *)@"com.apple.cloudphotod.sync.SystemLibrary";
}

+ (NSString)groupNameForAppLibrarySync
{
  return (NSString *)@"com.apple.cloudphotod.sync.AppLibrary";
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (NSArray)involvedProcesses
{
  return self->_involvedProcesses;
}

- (NSArray)relatedApplications
{
  return self->_relatedApplications;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setNow:(id)a3
{
}

- (CPLBGSystemTaskScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (double)minimumRuntime
{
  return self->_minimumRuntime;
}

- (void)setMinimumRuntime:(double)a3
{
  self->_double minimumRuntime = a3;
}

- (double)minimumRuntimeWithExtendedTime
{
  return self->_minimumRuntimeWithExtendedTime;
}

- (void)setMinimumRuntimeWithExtendedTime:(double)a3
{
  self->_minimumRuntimeWithExtendedTime = a3;
}

- (double)minimumRuntimeLeeway
{
  return self->_minimumRuntimeLeeway;
}

- (void)setMinimumRuntimeLeeway:(double)a3
{
  self->_minimumRuntimeLeeway = a3;
}

- (double)minimumRuntimeWithVeryLongExtendedTime
{
  return self->_minimumRuntimeWithVeryLongExtendedTime;
}

- (void)setMinimumRuntimeWithVeryLongExtendedTime:(double)a3
{
  self->_double minimumRuntimeWithVeryLongExtendedTime = a3;
}

- (void).cxx_destruct
{
}

@end