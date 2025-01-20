@interface _DASDaemonClient
+ (id)clientForDaemon:(id)a3 withConnection:(id)a4 isRestricted:(BOOL)a5;
- (BOOL)activityCompletedInternal:(id)a3;
- (BOOL)hasEntitlementForCustomIconBundleIdentifier;
- (BOOL)hasEntitlementForProgressTask;
- (BOOL)restricted;
- (NSMutableSet)delayedStartTasks;
- (NSMutableSet)runningBGTasks;
- (NSMutableSet)startedTasks;
- (NSMutableSet)submittedTasks;
- (NSString)applicationBundleIdentifier;
- (NSString)mainApplicationBundleIdentifier;
- (NSXPCConnection)connection;
- (_DASDaemon)daemon;
- (_DASDaemonClient)initWithDaemon:(id)a3 withConnection:(id)a4 isRestricted:(BOOL)a5;
- (id)activityNamesFromActivities:(id)a3;
- (id)bundleIdentifierFromTeamAppTuple:(id)a3;
- (id)unlockedActivitiesWithNames:(id)a3 inSet:(id)a4;
- (id)unsafe_applicationBundleIdentifier;
- (id)unsafe_mainApplicationBundleIdentifier;
- (os_unfair_lock_s)lock;
- (void)_resetWidgetBudgets;
- (void)acknowledgeSystemTaskLaunchWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)acknowledgeSystemTaskSuspensionWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5;
- (void)activity:(id)a3 blockedOnPolicies:(id)a4;
- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4;
- (void)activityCanceled:(id)a3;
- (void)activityCompleted:(id)a3;
- (void)activityContainsOverrides:(id)a3 handler:(id)a4;
- (void)activityRunStatisticsWithHandler:(id)a3;
- (void)activityStarted:(id)a3;
- (void)activityStartedWithParameters:(id)a3;
- (void)activityStoppedWithParameters:(id)a3;
- (void)addPauseExceptParameter:(id)a3 handler:(id)a4;
- (void)allBudgetsWithHandler:(id)a3;
- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4;
- (void)balanceForBudgetWithName:(id)a3 withHandler:(id)a4;
- (void)blockingPoliciesWithParameters:(id)a3 handler:(id)a4;
- (void)cancelActivities:(id)a3;
- (void)cancelAllActivities;
- (void)cancelAllTaskRequestsWithCompletionHandler:(id)a3;
- (void)cancelTaskRequestWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)clasStatusWithHandler:(id)a3;
- (void)completeSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)completeTaskRequest:(id)a3 completionHandler:(id)a4;
- (void)createActivityGroup:(id)a3;
- (void)currentPredictionsWithHandler:(id)a3;
- (void)dealloc;
- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4;
- (void)deferActivities:(id)a3 withHandler:(id)a4;
- (void)delayedRunningActivitiesWithHandler:(id)a3;
- (void)delayedStartActivities:(id)a3;
- (void)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4 handler:(id)a5;
- (void)disableAppRefreshForApps:(id)a3;
- (void)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4 handler:(id)a5;
- (void)endLaunchWithReason:(id)a3 forApp:(id)a4;
- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4 handler:(id)a5;
- (void)establishConnection:(id)a3;
- (void)evaluateAllActivities:(id)a3 handler:(id)a4;
- (void)evaluatePolicies:(id)a3 handler:(id)a4;
- (void)forceResetOfResultIdentifier:(id)a3;
- (void)forceRunActivities:(id)a3;
- (void)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getBuddyEvents:(id)a3 bgsqlData:(id)a4 handler:(id)a5;
- (void)getConditionsPenalties:(id)a3 handler:(id)a4;
- (void)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4 handler:(id)a5;
- (void)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6;
- (void)getInstallTimeline:(id)a3 bgsqlData:(id)a4 handler:(id)a5;
- (void)getLimiterResponseForActivity:(id)a3 handler:(id)a4;
- (void)getPendingTaskRequestsWithCompletionHandler:(id)a3;
- (void)getRuntimeLimit:(id)a3 handler:(id)a4;
- (void)handleClientInterruption;
- (void)handleClientLedSystemTaskExpirationWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5;
- (void)handleEligibleActivities:(id)a3;
- (void)handleLaunchFromDaemonForActivities:(id)a3;
- (void)handleRunningActivities:(id)a3;
- (void)inspect:(id)a3 withHandler:(id)a4;
- (void)pauseWithParameters:(id)a3 handler:(id)a4;
- (void)policiesWithHandler:(id)a3;
- (void)prewarmApplication:(id)a3;
- (void)prewarmSuspendWithHandler:(id)a3;
- (void)queryDependenciesOfTaskIdentifier:(id)a3 withHandler:(id)a4;
- (void)queryStatusOfResultIdentifier:(id)a3 withHandler:(id)a4;
- (void)removeKnownActivitiesFromSet:(id)a3;
- (void)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 withHandler:(id)a5;
- (void)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 withHandler:(id)a5;
- (void)reportSystemTaskWithIdentifier:(id)a3 consumedResults:(id)a4 completionHandler:(id)a5;
- (void)reportSystemTaskWithIdentifier:(id)a3 producedResults:(id)a4 completionHandler:(id)a5;
- (void)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 withHandler:(id)a5;
- (void)reportTaskWorkloadProgress:(id)a3 target:(unint64_t)a4 completed:(unint64_t)a5 category:(unint64_t)a6 subCategory:(id)a7 completionHandler:(id)a8;
- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5;
- (void)resetResultsForIdentifier:(id)a3 byTaskWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)resubmitRunningTasks:(id)a3;
- (void)resumeTaskSchedulingWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)runActivities:(id)a3;
- (void)runActivitiesWithDelayedStart:(id)a3;
- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4;
- (void)runProceedableActivities:(id)a3 handler:(id)a4;
- (void)runningActivitiesWithHandler:(id)a3;
- (void)runningGroupActivitiesWithHandler:(id)a3;
- (void)scoresForActivityWithName:(id)a3 withHandler:(id)a4;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setBalance:(double)a3 forBudgetWithName:(id)a4;
- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDelayedStartTasks:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMainApplicationBundleIdentifier:(id)a3;
- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4;
- (void)setRestricted:(BOOL)a3;
- (void)setRunningBGTasks:(id)a3;
- (void)setStartedTasks:(id)a3;
- (void)setSubmittedTasks:(id)a3;
- (void)startedActivities:(id)a3;
- (void)statisticsWithHandler:(id)a3;
- (void)submitActivities:(id)a3;
- (void)submitActivitiesInternal:(id)a3;
- (void)submitActivity:(id)a3;
- (void)submitActivity:(id)a3 inGroup:(id)a4;
- (void)submitActivity:(id)a3 inGroup:(id)a4 withHandler:(id)a5;
- (void)submitActivity:(id)a3 inGroupWithName:(id)a4;
- (void)submitActivityInternal:(id)a3;
- (void)submitRateLimitConfiguration:(id)a3 handler:(id)a4;
- (void)submitTaskRequest:(id)a3 withHandler:(id)a4;
- (void)submitTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5;
- (void)submittedActivitiesWithHandler:(id)a3;
- (void)suspendActivities:(id)a3;
- (void)unregisterSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)updateActivity:(id)a3 withParameters:(id)a4;
- (void)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5 handler:(id)a6;
- (void)updateOngoingTask:(id)a3 completionHandler:(id)a4;
- (void)updateProgressForOngoingTask:(id)a3 completionHandler:(id)a4;
- (void)updateSystemConstraintsWithParameters:(id)a3;
- (void)updateTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5;
- (void)willExpireBGTaskActivities:(id)a3;
@end

@implementation _DASDaemonClient

- (_DASDaemonClient)initWithDaemon:(id)a3 withConnection:(id)a4 isRestricted:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS____DASDaemonClient;
  v11 = -[_DASDaemonClient init](&v29, "init");
  v12 = v11;
  if (v11)
  {
    v11->_restricted = a5;
    objc_storeStrong((id *)&v11->_daemon, a3);
    objc_storeStrong((id *)&v12->_connection, a4);
    if (qword_100157C88 != -1) {
      dispatch_once(&qword_100157C88, &stru_100117300);
    }
    -[NSXPCConnection setRemoteObjectInterface:](v12->_connection, "setRemoteObjectInterface:", qword_100157C90);
    if (qword_100157C98 != -1) {
      dispatch_once(&qword_100157C98, &stru_100117320);
    }
    -[NSXPCConnection setExportedInterface:](v12->_connection, "setExportedInterface:", qword_100157CA0);
    -[NSXPCConnection setExportedObject:](v12->_connection, "setExportedObject:", v12);
    -[NSXPCConnection resume](v12->_connection, "resume");
    objc_initWeak(&location, v12);
    connection = v12->_connection;
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    v25 = sub_100099398;
    v26 = &unk_100114FB8;
    objc_copyWeak(&v27, &location);
    -[NSXPCConnection setInvalidationHandler:](connection, "setInvalidationHandler:", &v23);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set", v23, v24, v25, v26));
    submittedTasks = v12->_submittedTasks;
    v12->_submittedTasks = (NSMutableSet *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    startedTasks = v12->_startedTasks;
    v12->_startedTasks = (NSMutableSet *)v16;

    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    delayedStartTasks = v12->_delayedStartTasks;
    v12->_delayedStartTasks = (NSMutableSet *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    runningBGTasks = v12->_runningBGTasks;
    v12->_runningBGTasks = (NSMutableSet *)v20;

    v12->_lock._os_unfair_lock_opaque = 0;
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v12;
}

+ (id)clientForDaemon:(id)a3 withConnection:(id)a4 isRestricted:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = -[_DASDaemonClient initWithDaemon:withConnection:isRestricted:]( objc_alloc(&OBJC_CLASS____DASDaemonClient),  "initWithDaemon:withConnection:isRestricted:",  v8,  v7,  v5);

  return v9;
}

- (void)removeKnownActivitiesFromSet:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_submittedTasks;
  objc_sync_enter(v5);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v6 = self->_submittedTasks;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v4, "removeObject:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v9), (void)v10);
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (id)unlockedActivitiesWithNames:(id)a3 inSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100099658;
  v11[3] = &unk_1001172B8;
  id v8 = v5;
  id v12 = v8;
  __int128 v13 = v15;
  id v14 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectsPassingTest:v11]);

  _Block_object_dispose(v15, 8);
  return v9;
}

- (void)handleClientInterruption
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient daemon](self, "daemon"));
  [v3 removeClient:self];
}

- (id)activityNamesFromActivities:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "name", (void)v13));
          [v4 addObject:v10];

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v4));
  }

  else
  {
    __int128 v11 = 0LL;
  }

  return v11;
}

- (void)runActivitiesWithDelayedStart:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = self->_submittedTasks;
  objc_sync_enter(v6);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (-[NSMutableSet containsObject:](self->_submittedTasks, "containsObject:", v11, (void)v15))
        {
          [v5 addObject:v11];
          -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v11);
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  objc_sync_exit(v6);
  if ([v5 count])
  {
    id v12 = self->_delayedStartTasks;
    objc_sync_enter(v12);
    -[NSMutableSet _DAS_unionSetOverridingExisting:](self->_delayedStartTasks, "_DAS_unionSetOverridingExisting:", v5);
    objc_sync_exit(v12);

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v5));
    [v13 runActivitiesWithDelayedStart:v14];
  }
}

- (void)runActivities:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = self->_submittedTasks;
  objc_sync_enter(v6);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (-[NSMutableSet containsObject:](self->_submittedTasks, "containsObject:", v11, (void)v14))
        {
          [v5 addObject:v11];
          -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v11);
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  objc_sync_exit(v6);
  if ([v5 count])
  {
    -[_DASDaemonClient handleRunningActivities:](self, "handleRunningActivities:", v5);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v5));
    [v12 runActivities:v13];
  }
}

- (void)suspendActivities:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = self->_startedTasks;
  objc_sync_enter(v6);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
      }

      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  objc_sync_exit(v6);
  if ([v5 count])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v7));
    [v12 suspendActivities:v13];
  }
}

- (void)cancelActivities:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = self->_submittedTasks;
  objc_sync_enter(v6);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        if (-[NSMutableSet containsObject:](self->_submittedTasks, "containsObject:", v11))
        {
          [v5 addObject:v11];
          -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v11);
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v8);
  }

  objc_sync_exit(v6);
  id v12 = self->_delayedStartTasks;
  objc_sync_enter(v12);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)j);
        if (-[NSMutableSet containsObject:]( self->_delayedStartTasks,  "containsObject:",  v17,  (void)v20))
        {
          [v5 addObject:v17];
          -[NSMutableSet removeObject:](self->_delayedStartTasks, "removeObject:", v17);
        }
      }

      id v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v14);
  }

  objc_sync_exit(v12);
  if ([v5 count])
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v13));
    [v18 cancelActivities:v19];
  }
}

- (void)activity:(id)a3 blockedOnPolicies:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"));
  [v8 activity:v7 blockedOnPolicies:v6];
}

- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy"));
  [v8 activity:v7 runWithoutHonoringPolicies:v6];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____DASDaemonClient;
  -[_DASDaemonClient dealloc](&v3, "dealloc");
}

- (void)submitActivityInternal:(id)a3
{
  id v5 = a3;
  id v4 = self->_submittedTasks;
  objc_sync_enter(v4);
  objc_msgSend( v5,  "setUserIdentifier:",  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"));
  objc_msgSend(v5, "setPid:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
  -[_DASDaemonClient setApplicationURLForActivity:](self, "setApplicationURLForActivity:", v5);
  -[NSMutableSet _DAS_addOrReplaceObject:](self->_submittedTasks, "_DAS_addOrReplaceObject:", v5);
  objc_sync_exit(v4);
}

- (void)submitActivitiesInternal:(id)a3
{
  id v4 = a3;
  id v5 = self->_submittedTasks;
  objc_sync_enter(v5);
  id v6 = objc_autoreleasePoolPush();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v10);
        objc_msgSend( v11,  "setUserIdentifier:",  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier", (void)v12));
        objc_msgSend(v11, "setPid:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
        -[_DASDaemonClient setApplicationURLForActivity:](self, "setApplicationURLForActivity:", v11);
        -[NSMutableSet _DAS_addOrReplaceObject:](self->_submittedTasks, "_DAS_addOrReplaceObject:", v11);
        __int128 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  objc_autoreleasePoolPop(v6);
  objc_sync_exit(v5);
}

- (void)submitActivity:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemonClient submitActivityInternal:](self, "submitActivityInternal:", v5);
    -[_DASDaemon submitActivity:](self->_daemon, "submitActivity:", v5);
  }
}

- (void)submitActivities:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemonClient submitActivitiesInternal:](self, "submitActivitiesInternal:", v5);
    -[_DASDaemon submitActivities:](self->_daemon, "submitActivities:", v5);
  }
}

- (void)handleEligibleActivities:(id)a3
{
}

- (void)handleRunningActivities:(id)a3
{
  id v5 = a3;
  id v4 = self->_startedTasks;
  objc_sync_enter(v4);
  -[NSMutableSet _DAS_unionSetOverridingExisting:](self->_startedTasks, "_DAS_unionSetOverridingExisting:", v5);
  objc_sync_exit(v4);

  -[_DASDaemon handleRunningActivities:](self->_daemon, "handleRunningActivities:", v5);
}

- (void)startedActivities:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B8350(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
    id v8 = self->_startedTasks;
    objc_sync_enter(v8);
    -[NSMutableSet unionSet:](self->_startedTasks, "unionSet:", v7);
    objc_sync_exit(v8);

    uint64_t v9 = self;
    objc_sync_enter(v9);
    -[_DASDaemon startedActivities:](v9->_daemon, "startedActivities:", v7);
    objc_sync_exit(v9);
  }
}

- (void)delayedStartActivities:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B83CC(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
    id v8 = self->_delayedStartTasks;
    objc_sync_enter(v8);
    -[NSMutableSet unionSet:](self->_delayedStartTasks, "unionSet:", v7);
    objc_sync_exit(v8);
  }
}

- (void)activityStarted:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B8448(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    id v7 = self->_delayedStartTasks;
    objc_sync_enter(v7);
    if (-[NSMutableSet containsObject:](self->_delayedStartTasks, "containsObject:", v5))
    {
      -[NSMutableSet removeObject:](self->_delayedStartTasks, "removeObject:", v5);
      objc_sync_exit(v7);

      id v8 = self->_startedTasks;
      objc_sync_enter(v8);
      -[NSMutableSet _DAS_addOrReplaceObject:](self->_startedTasks, "_DAS_addOrReplaceObject:", v5);
      objc_sync_exit(v8);

      uint64_t v9 = self;
      objc_sync_enter(v9);
      -[_DASDaemon activityStarted:](v9->_daemon, "activityStarted:", v5);
      objc_sync_exit(v9);
    }

    else
    {
      __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 shortDescription]);
        int v12 = 138412290;
        __int128 v13 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Can't start %@!,not scheduled to run!",  (uint8_t *)&v12,  0xCu);
      }

      objc_sync_exit(v7);
    }
  }
}

- (BOOL)activityCompletedInternal:(id)a3
{
  id v4 = a3;
  id v5 = self->_startedTasks;
  objc_sync_enter(v5);
  unsigned int v6 = -[NSMutableSet containsObject:](self->_startedTasks, "containsObject:", v4);
  if (v6)
  {
    -[NSMutableSet removeObject:](self->_startedTasks, "removeObject:", v4);
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 shortDescription]);
      int v12 = 138412290;
      __int128 v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Can't complete, %@ - not running, cancelling instead!",  (uint8_t *)&v12,  0xCu);
    }
  }

  objc_sync_exit(v5);

  uint64_t v9 = self->_submittedTasks;
  objc_sync_enter(v9);
  -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v4);
  objc_sync_exit(v9);

  __int128 v10 = self->_delayedStartTasks;
  objc_sync_enter(v10);
  -[NSMutableSet removeObject:](self->_delayedStartTasks, "removeObject:", v4);
  objc_sync_exit(v10);

  return v6;
}

- (void)activityCompleted:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B84C4(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    unsigned int v7 = -[_DASDaemonClient activityCompletedInternal:](self, "activityCompletedInternal:", v5);
    id v8 = self;
    objc_sync_enter(v8);
    daemon = v8->_daemon;
    if (v7) {
      -[_DASDaemon activityCompleted:](daemon, "activityCompleted:", v5);
    }
    else {
      -[_DASDaemon activityCanceled:](daemon, "activityCanceled:", v5);
    }
    objc_sync_exit(v8);
  }
}

- (void)cancelAllActivities
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v4 = self->_submittedTasks;
  objc_sync_enter(v4);
  [v3 unionSet:self->_submittedTasks];
  -[NSMutableSet removeAllObjects](self->_submittedTasks, "removeAllObjects");
  objc_sync_exit(v4);

  id v5 = self->_startedTasks;
  objc_sync_enter(v5);
  [v3 unionSet:self->_startedTasks];
  -[NSMutableSet removeAllObjects](self->_startedTasks, "removeAllObjects");
  objc_sync_exit(v5);

  unsigned int v6 = self->_delayedStartTasks;
  objc_sync_enter(v6);
  [v3 unionSet:self->_delayedStartTasks];
  -[NSMutableSet removeAllObjects](self->_delayedStartTasks, "removeAllObjects");
  objc_sync_exit(v6);

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (!objc_msgSend(v11, "requestsApplicationLaunch", (void)v12)
          || ([v11 shouldBePersisted] & 1) == 0)
        {
          -[_DASDaemon activityCanceled:](self->_daemon, "activityCanceled:", v11);
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)activityCanceled:(id)a3
{
  id v5 = a3;
  unsigned int v6 = v5;
  if (self->_restricted && ([v5 isContinuedProcessingTask] & 1) == 0)
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000B8540(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    id v7 = self->_startedTasks;
    objc_sync_enter(v7);
    -[NSMutableSet removeObject:](self->_startedTasks, "removeObject:", v6);
    objc_sync_exit(v7);

    id v8 = self->_submittedTasks;
    objc_sync_enter(v8);
    -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v6);
    objc_sync_exit(v8);

    uint64_t v9 = self->_delayedStartTasks;
    objc_sync_enter(v9);
    -[NSMutableSet removeObject:](self->_delayedStartTasks, "removeObject:", v6);
    objc_sync_exit(v9);

    __int128 v10 = self;
    objc_sync_enter(v10);
    -[_DASDaemon activityCanceled:](v10->_daemon, "activityCanceled:", v6);
    objc_sync_exit(v10);
  }
}

- (void)updateActivity:(id)a3 withParameters:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  -[_DASDaemon updateActivity:withParameters:](v7->_daemon, "updateActivity:withParameters:", v8, v6);
  objc_sync_exit(v7);
}

- (void)_resetWidgetBudgets
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForEntitlement:@"com.apple.dasd.widgetBudgetReset"]);
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    -[_DASDaemon _resetWidgetBudgets](self->_daemon, "_resetWidgetBudgets");
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"misuse"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Please file a bug for – client %{public}@ attempted to reset widget budgets but lacked appropriate entitlement",  (uint8_t *)&v8,  0xCu);
    }
  }

- (void)updateSystemConstraintsWithParameters:(id)a3
{
}

- (void)createActivityGroup:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self->_connection,  "valueForEntitlement:",  @"com.apple.networkd.configure_connection_pool"));
    if ([v7 BOOLValue])
    {
      -[_DASDaemon createActivityGroup:](self->_daemon, "createActivityGroup:", v5);
    }

    else
    {
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Unentitled client tried to create an Activity Group. Dropping on the floor",  v9,  2u);
      }
    }
  }
}

- (void)submitActivity:(id)a3 inGroupWithName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_restricted)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemonClient submitActivityInternal:](self, "submitActivityInternal:", v7);
    -[_DASDaemon submitActivity:inGroupWithName:](self->_daemon, "submitActivity:inGroupWithName:", v7, v8);
  }
}

- (void)submitActivity:(id)a3 inGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_restricted)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemonClient submitActivityInternal:](self, "submitActivityInternal:", v7);
    -[_DASDaemon submitActivity:inGroup:](self->_daemon, "submitActivity:inGroup:", v7, v8);
  }
}

- (void)submitActivity:(id)a3 inGroup:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  __int128 v10 = (void (**)(id, BOOL, void))a5;
  objc_msgSend( v8,  "setUserIdentifier:",  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"));
  objc_msgSend(v8, "setPid:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"));
  -[_DASDaemonClient setApplicationURLForActivity:](self, "setApplicationURLForActivity:", v8);
  uint64_t v11 = self->_submittedTasks;
  objc_sync_enter(v11);
  -[NSMutableSet _DAS_addOrReplaceObject:](self->_submittedTasks, "_DAS_addOrReplaceObject:", v8);
  objc_sync_exit(v11);

  uint64_t v22 = 0LL;
  __int128 v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10009B550;
  __int128 v20 = sub_10009B560;
  id v21 = 0LL;
  daemon = self->_daemon;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10009B568;
  v15[3] = &unk_1001172E0;
  void v15[4] = &v22;
  v15[5] = &v16;
  -[_DASDaemon submitActivity:inGroup:withHandler:](daemon, "submitActivity:inGroup:withHandler:", v8, v9, v15);
  if (*((_BYTE *)v23 + 24))
  {
    BOOL v13 = 1LL;
  }

  else
  {
    __int128 v14 = self;
    objc_sync_enter(v14);
    -[NSMutableSet removeObject:](self->_submittedTasks, "removeObject:", v8);
    objc_sync_exit(v14);

    BOOL v13 = *((_BYTE *)v23 + 24) != 0;
  }

  v10[2](v10, v13, v17[5]);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4
{
}

- (void)endLaunchWithReason:(id)a3 forApp:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon endLaunchWithReason:forApp:](self->_daemon, "endLaunchWithReason:forApp:", a3, a4);
  }

- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon backgroundAppRefreshEnabledForApp:withHandler:]( self->_daemon,  "backgroundAppRefreshEnabledForApp:withHandler:",  a3,  a4);
  }

- (void)disableAppRefreshForApps:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon disableAppRefreshForApps:](self->_daemon, "disableAppRefreshForApps:", a3);
  }

- (id)bundleIdentifierFromTeamAppTuple:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"com.apple."])
  {
    id v4 = v3;
  }

  else if ((unint64_t)[v3 length] > 0xA)
  {
    __chkstk_darwin();
    objc_msgSend(v3, "getCharacters:range:", v18, 0, 10);
    for (uint64_t i = 0LL; i != 20; i += 2LL)
    {
      int v7 = *(unsigned __int16 *)&v18[i];
      if ((v7 - 65) >= 0x1A && (v7 - 48) >= 0xA)
      {
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000B8650();
        }
        goto LABEL_19;
      }
    }

    if ([v3 characterAtIndex:10] == 46)
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue([v3 substringFromIndex:11]);
      goto LABEL_20;
    }

    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000B8620(v9, v10, v11, v12, v13, v14, v15, v16);
    }
LABEL_19:

    id v4 = 0LL;
  }

  else
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B85BC();
    }

    id v4 = 0LL;
  }

- (id)unsafe_applicationBundleIdentifier
{
  p_applicationBundleIdentifier = &self->_applicationBundleIdentifier;
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  if (!applicationBundleIdentifier)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self->_connection,  "valueForEntitlement:",  @"application-identifier"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[_DASDaemonClient bundleIdentifierFromTeamAppTuple:](self, "bundleIdentifierFromTeamAppTuple:", v5));
    int v7 = (void *)v6;
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    else {
      id v8 = &stru_100118C98;
    }
    objc_storeStrong((id *)p_applicationBundleIdentifier, v8);

    applicationBundleIdentifier = self->_applicationBundleIdentifier;
  }

  id v9 = -[NSString length](applicationBundleIdentifier, "length");
  if (v9) {
    id v9 = *p_applicationBundleIdentifier;
  }
  return v9;
}

- (NSString)applicationBundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient unsafe_applicationBundleIdentifier](self, "unsafe_applicationBundleIdentifier"));
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (BOOL)hasEntitlementForProgressTask
{
  return 0;
}

- (BOOL)hasEntitlementForCustomIconBundleIdentifier
{
  return 0;
}

- (id)unsafe_mainApplicationBundleIdentifier
{
  p_mainApplicationBundleIdentifier = (id *)&self->_mainApplicationBundleIdentifier;
  mainApplicationBundleIdentifier = self->_mainApplicationBundleIdentifier;
  if (!mainApplicationBundleIdentifier)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection _xpcConnection](self->_connection, "_xpcConnection"));
    int is_extension = xpc_connection_is_extension();

    if (is_extension)
    {
      int v7 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierWithPid:",  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier")));
      id v20 = 0LL;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v7,  &v20));
      id v9 = v20;
      if (v8) {
        BOOL v10 = v9 == 0LL;
      }
      else {
        BOOL v10 = 0;
      }
      if (!v10)
      {
        uint64_t v11 = v9;
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000B86B4();
        }

        id v13 = *p_mainApplicationBundleIdentifier;
        id *p_mainApplicationBundleIdentifier = &stru_100118C98;

        return 0LL;
      }

      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 hostProcess]);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundle]);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 identifier]);
    }

    else
    {
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue( -[_DASDaemonClient unsafe_applicationBundleIdentifier]( self,  "unsafe_applicationBundleIdentifier"));
    }

    if (v15) {
      uint64_t v18 = v15;
    }
    else {
      uint64_t v18 = &stru_100118C98;
    }
    objc_storeStrong(p_mainApplicationBundleIdentifier, v18);

    mainApplicationBundleIdentifier = (NSString *)*p_mainApplicationBundleIdentifier;
  }

  if (-[NSString length](mainApplicationBundleIdentifier, "length")) {
    id v19 = *p_mainApplicationBundleIdentifier;
  }
  else {
    id v19 = 0LL;
  }
  return v19;
}

- (NSString)mainApplicationBundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_DASDaemonClient unsafe_mainApplicationBundleIdentifier]( self,  "unsafe_mainApplicationBundleIdentifier"));
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (void)submitTaskRequest:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivity validateBGTaskRequestWithActivity:]( &OBJC_CLASS____DASActivity,  "validateBGTaskRequestWithActivity:",  v6));
  if (!v8)
  {
    uint64_t v23 = _DASActivitySchedulerErrorDomain;
    uint64_t v24 = 3LL;
    goto LABEL_58;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);
  unsigned int v10 = [v9 isEqualToString:_DASLaunchReasonHealthResearch];

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self->_connection,  "valueForEntitlement:",  @"com.apple.developer.backgroundtasks.healthresearch"));
    uint64_t v12 = v11;
    if (!v11 || ([v11 BOOLValue] & 1) == 0)
    {
      char v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1000B8734();
      }

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  _DASActivitySchedulerErrorDomain,  0LL,  0LL));
      v7[2](v7, v17);
      goto LABEL_54;
    }
  }

  unsigned int v13 = [v6 isContinuedProcessingTask];
  if (v13)
  {
    if (-[_DASDaemonClient hasEntitlementForProgressTask](self, "hasEntitlementForProgressTask"))
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 clientProvidedIconBundleIdentifier]);
      if (!v14) {
        goto LABEL_10;
      }
      uint64_t v15 = (void *)v14;
      unsigned __int8 v16 = -[_DASDaemonClient hasEntitlementForCustomIconBundleIdentifier]( self,  "hasEntitlementForCustomIconBundleIdentifier");

      if ((v16 & 1) != 0) {
        goto LABEL_10;
      }
      __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000B8AD8();
      }
    }

    else
    {
      __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000B8B54();
      }
    }

    uint64_t v23 = _DASActivitySchedulerErrorDomain;
    uint64_t v24 = 0LL;
LABEL_58:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  v24,  0LL));
    v7[2](v7, v12);
    goto LABEL_59;
  }

- (void)getPendingTaskRequestsWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (v5)
  {
    -[_DASDaemon getPendingTaskRequestsForApplication:withCompletionHandler:]( self->_daemon,  "getPendingTaskRequestsForApplication:withCompletionHandler:",  v5,  v4);
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", v7, 2u);
    }

    v4[2](v4, &__NSArray0__struct);
  }
}

- (void)cancelTaskRequestWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (v8)
  {
    -[_DASDaemon cancelTaskRequestWithIdentifier:forApplication:]( self->_daemon,  "cancelTaskRequestWithIdentifier:forApplication:",  v6,  v8);
  }

  else
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", v10, 2u);
    }
  }

  v7[2](v7);
}

- (void)cancelAllTaskRequestsWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (v5)
  {
    -[_DASDaemon cancelAllTaskRequestsForApplication:](self->_daemon, "cancelAllTaskRequestsForApplication:", v5);
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "App missing application-identifier", v7, 2u);
    }
  }

  v4[2](v4);
}

- (void)handleLaunchFromDaemonForActivities:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Telling client %@ to handle activities: %@",  (uint8_t *)&v8,  0x16u);
  }

  id v6 = self->_runningBGTasks;
  objc_sync_enter(v6);
  -[NSMutableSet unionSet:](self->_runningBGTasks, "unionSet:", v4);
  objc_sync_exit(v6);

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
  [v7 handleLaunchFromDaemonForActivities:v4];
}

- (void)willExpireBGTaskActivities:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = self->_runningBGTasks;
  objc_sync_enter(v6);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
      }

      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }

    while (v8);
  }

  objc_sync_exit(v6);
  if ([v5 count])
  {
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = self;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Warning client %@ for activities about to expire: %@",  buf,  0x16u);
    }

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy"));
    [v13 willExpireBGTaskActivities:v5];
  }
}

- (void)establishConnection:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Establishing connection from client: %@",  (uint8_t *)&v6,  0xCu);
  }

  -[_DASDaemon establishConnectionFromClient:withCompletionHandler:]( self->_daemon,  "establishConnectionFromClient:withCompletionHandler:",  self,  v4);
}

- (void)completeTaskRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    unsigned int v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Completing for client %@ task request %@",  (uint8_t *)&v12,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (v9 || ([v6 isContinuedProcessingTask] & 1) != 0)
  {
    __int16 v10 = self->_runningBGTasks;
    objc_sync_enter(v10);
    -[NSMutableSet removeObject:](self->_runningBGTasks, "removeObject:", v6);
    objc_sync_exit(v10);

    -[_DASDaemon completeTaskRequest:forApplication:](self->_daemon, "completeTaskRequest:forApplication:", v6, v9);
  }

  else
  {
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "App missing application-identifier",  (uint8_t *)&v12,  2u);
    }
  }

  v7[2](v7);
}

- (void)updateOngoingTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updating task request %@", (uint8_t *)&v10, 0xCu);
  }

  if (-[_DASDaemonClient hasEntitlementForProgressTask](self, "hasEntitlementForProgressTask"))
  {
    -[_DASDaemon updateOngoingTask:completionHandler:](self->_daemon, "updateOngoingTask:completionHandler:", v6, v7);
  }

  else
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Missing valid entitlement",  (uint8_t *)&v10,  2u);
    }

    v7[2](v7);
  }
}

- (void)updateProgressForOngoingTask:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 progress]);
    int v11 = 138412546;
    int v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Updating progress %@ for task request %@",  (uint8_t *)&v11,  0x16u);
  }

  if (-[_DASDaemonClient hasEntitlementForProgressTask](self, "hasEntitlementForProgressTask"))
  {
    -[_DASDaemon updateProgressForOngoingTask:completionHandler:]( self->_daemon,  "updateProgressForOngoingTask:completionHandler:",  v6,  v7);
  }

  else
  {
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Missing valid entitlement",  (uint8_t *)&v11,  2u);
    }

    v7[2](v7);
  }
}

- (void)acknowledgeSystemTaskLaunchWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v8,  "acknowledgeSystemTaskLaunchWithIdentifier:withPID:withUID:completionHandler:",  v7,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"),  v6);
}

- (void)acknowledgeSystemTaskSuspensionWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v10,  "acknowledgeSystemTaskSuspensionWithIdentifier:withPID:withUID:retryAfter:completionHandler:",  v9,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"),  v8,  a4);
}

- (void)handleClientLedSystemTaskExpirationWithIdentifier:(id)a3 retryAfter:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v10,  "handleClientLedSystemTaskExpirationWithIdentifier:withPID:withUID:retryAfter:completionHandler:",  v9,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"),  v8,  a4);
}

- (void)submitTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v11,  "submitTaskRequestWithIdentifier:descriptor:withPID:withUID:completionHandler:",  v10,  v9,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"),  v8);
}

- (void)updateTaskRequestWithIdentifier:(id)a3 descriptor:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v11,  "updateTaskRequestWithIdentifier:descriptor:withPID:withUID:completionHandler:",  v10,  v9,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"),  v8);
}

- (void)completeSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v8,  "completeSystemTaskWithIdentifier:withPID:withUID:completionHandler:",  v7,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"),  v6);
}

- (void)resumeTaskSchedulingWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v8,  "resumeTaskSchedulingWithIdentifier:withPID:withUID:completionHandler:",  v7,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"),  v6);
}

- (void)unregisterSystemTaskWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v8,  "unregisterSystemTaskWithIdentifier:withPID:withUID:completionHandler:",  v7,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"),  v6);
}

- (void)reportSystemTaskWithIdentifier:(id)a3 producedResults:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v11,  "reportSystemTaskWithIdentifier:producedResults:withPID:withUID:completionHandler:",  v10,  v9,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"),  v8);
}

- (void)reportSystemTaskWithIdentifier:(id)a3 consumedResults:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v11,  "reportSystemTaskWithIdentifier:consumedResults:withPID:withUID:completionHandler:",  v10,  v9,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"),  v8);
}

- (void)resetResultsForIdentifier:(id)a3 byTaskWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v11,  "resetResultsForIdentifier:byTaskWithIdentifier:withPID:withUID:completionHandler:",  v10,  v9,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"),  v8);
}

- (void)reportTaskWorkloadProgress:(id)a3 target:(unint64_t)a4 completed:(unint64_t)a5 category:(unint64_t)a6 subCategory:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  id v19 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  uint64_t v17 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  LODWORD(v18) = -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier");
  [v19 recordTaskWorkloadProgress:v16 target:a4 completed:a5 category:a6 subCategory:v15 withPID:v17 withUID:v18 completionHandler:v14];
}

- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  [v9 resetFastPassActivities:v8 resetAll:v5 withHandler:v7];
}

- (void)inspect:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  [v7 inspect:v6 withHandler:v5];
}

- (void)resubmitRunningTasks:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  objc_msgSend( v5,  "resubmitRunningTasks:withPID:withUID:",  v4,  -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"),  -[NSXPCConnection effectiveUserIdentifier](self->_connection, "effectiveUserIdentifier"));
}

- (void)submittedActivitiesWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon submittedActivitiesWithHandler:](self->_daemon, "submittedActivitiesWithHandler:", a3);
  }

- (void)delayedRunningActivitiesWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon delayedRunningActivitiesWithHandler:](self->_daemon, "delayedRunningActivitiesWithHandler:", a3);
  }

- (void)runningActivitiesWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon runningActivitiesWithHandler:](self->_daemon, "runningActivitiesWithHandler:", a3);
  }

- (void)runningGroupActivitiesWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon runningGroupActivitiesWithHandler:](self->_daemon, "runningGroupActivitiesWithHandler:", a3);
  }

- (void)scoresForActivityWithName:(id)a3 withHandler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon scoresForActivityWithName:withHandler:]( self->_daemon,  "scoresForActivityWithName:withHandler:",  a3,  a4);
  }

- (void)activityRunStatisticsWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon activityRunStatisticsWithHandler:](self->_daemon, "activityRunStatisticsWithHandler:", a3);
  }

- (void)forceRunActivities:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon forceRunActivities:](self->_daemon, "forceRunActivities:", a3);
  }

- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon runActivitiesWithUrgency:activities:](self->_daemon, "runActivitiesWithUrgency:activities:", a3, a4);
  }

- (void)deferActivities:(id)a3 withHandler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon deferActivities:withHandler:](self->_daemon, "deferActivities:withHandler:", a3, a4);
  }

- (void)currentPredictionsWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon currentPredictionsWithHandler:](self->_daemon, "currentPredictionsWithHandler:", a3);
  }

- (void)statisticsWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon statisticsWithHandler:](self->_daemon, "statisticsWithHandler:", a3);
  }

- (void)forceResetOfResultIdentifier:(id)a3
{
  id v5 = a3;
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"dependencies"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityDependencyManager sharedInstance]( &OBJC_CLASS____DASActivityDependencyManager,  "sharedInstance"));
    objc_msgSend(v7, "dastool_forceResetOfResultIdentifier:", v5);
  }
}

- (void)queryStatusOfResultIdentifier:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (self->_restricted)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"dependencies"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityDependencyManager sharedInstance]( &OBJC_CLASS____DASActivityDependencyManager,  "sharedInstance"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dastool_queryStatusOfResultIdentifier:", v7));

    v8[2](v8, v11);
  }
}

- (void)queryDependenciesOfTaskIdentifier:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  if (self->_restricted)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"dependencies"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon getActivityWithName:](self->_daemon, "getActivityWithName:", v7));
    if (v10)
    {
      id v23 = v7;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 dependencies]);
      id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v25;
        do
        {
          for (uint64_t i = 0LL; i != v14; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
            uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"dependencies"));
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v31 = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "dependency: %@", buf, 0xCu);
            }

            id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 dictionary]);
            [v11 addEntriesFromDictionary:v19];
          }

          id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }

        while (v14);
      }

      v28[0] = @"activityIdentifier";
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
      v28[1] = @"dependencies";
      v29[0] = v20;
      v29[1] = v11;
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  2LL));
      v8[2](v8, v21);

      id v7 = v23;
    }

    else
    {
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"dependencies"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000B8BD0();
      }

      v8[2](v8, 0LL);
    }
  }
}

- (void)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"budgeting",  a4,  a5));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon deleteLimitForActivity:forLimiterWithName:handler:]( self->_daemon,  "deleteLimitForActivity:forLimiterWithName:handler:",  a3,  a4,  a5);
  }

- (void)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"budgeting",  a5,  a6,  a3));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon updateLimit:forActivity:forLimiterWithName:handler:]( self->_daemon,  "updateLimit:forActivity:forLimiterWithName:handler:",  a4,  a5,  a6,  a3);
  }

- (void)getLimiterResponseForActivity:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"budgeting",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon getLimiterResponseForActivity:handler:]( self->_daemon,  "getLimiterResponseForActivity:handler:",  a3,  a4);
  }

- (void)getRuntimeLimit:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"budgeting",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon getRuntimeLimit:handler:](self->_daemon, "getRuntimeLimit:handler:", a3, a4);
  }

- (void)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"latency",  a4,  a5,  a6));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon getElapsedRuntimes:timeFilter:bgsqlData:handler:]( self->_daemon,  "getElapsedRuntimes:timeFilter:bgsqlData:handler:",  a3,  a4,  a5,  a6);
  }

- (void)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"latency",  a4,  a5,  a6));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon getEstimatedRuntimes:timeFilter:bgsqlData:handler:]( self->_daemon,  "getEstimatedRuntimes:timeFilter:bgsqlData:handler:",  a3,  a4,  a5,  a6);
  }

- (void)getConditionsPenalties:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"latency",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon getConditionsPenalties:handler:](self->_daemon, "getConditionsPenalties:handler:", a3, a4);
  }

- (void)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"latency",  a4,  a5,  a6));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon getFeatureTimelines:timeFilter:bgsqlData:handler:]( self->_daemon,  "getFeatureTimelines:timeFilter:bgsqlData:handler:",  a3,  a4,  a5,  a6);
  }

- (void)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"latency",  a4,  a5,  a6));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon getActivityTimelines:timeFilter:bgsqlData:handler:]( self->_daemon,  "getActivityTimelines:timeFilter:bgsqlData:handler:",  a3,  a4,  a5,  a6);
  }

- (void)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"latency",  a4,  a5));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon getDeviceConditionTimelines:bgsqlData:handler:]( self->_daemon,  "getDeviceConditionTimelines:bgsqlData:handler:",  a3,  a4,  a5);
  }

- (void)getInstallTimeline:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"latency",  a4,  a5));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon getInstallTimeline:bgsqlData:handler:]( self->_daemon,  "getInstallTimeline:bgsqlData:handler:",  a3,  a4,  a5);
  }

- (void)getBuddyEvents:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"latency",  a4,  a5));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon getBuddyEvents:bgsqlData:handler:](self->_daemon, "getBuddyEvents:bgsqlData:handler:", a3, a4, a5);
  }

- (void)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  if (self->_restricted)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"latency",  a4,  a5,  a6));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon getEstimatedMADCompletionTimes:endDate:bgsqlData:handler:]( self->_daemon,  "getEstimatedMADCompletionTimes:endDate:bgsqlData:handler:",  a3,  a4,  a5,  a6);
  }

- (void)allBudgetsWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"budgeting"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon allBudgetsWithHandler:](self->_daemon, "allBudgetsWithHandler:", a3);
  }

- (void)balanceForBudgetWithName:(id)a3 withHandler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"budgeting",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon balanceForBudgetWithName:withHandler:](self->_daemon, "balanceForBudgetWithName:withHandler:", a3, a4);
  }

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"budgeting",  a3));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon setBalance:forBudgetWithName:](self->_daemon, "setBalance:forBudgetWithName:", a4, a3);
  }

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"budgeting",  a3));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon decrementBy:forBudgetWithName:](self->_daemon, "decrementBy:forBudgetWithName:", a4, a3);
  }

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"budgeting",  a3));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon setCapacity:forBudgetWithName:](self->_daemon, "setCapacity:forBudgetWithName:", a4, a3);
  }

- (void)policiesWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon policiesWithHandler:](self->_daemon, "policiesWithHandler:", a3);
  }

- (void)clasStatusWithHandler:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"clas"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon clasStatusWithHandler:](self->_daemon, "clasStatusWithHandler:", a3);
  }

- (void)evaluatePolicies:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon evaluatePolicies:handler:](self->_daemon, "evaluatePolicies:handler:", a3, a4);
  }

- (void)evaluateAllActivities:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon evaluateAllActivities:handler:](self->_daemon, "evaluateAllActivities:handler:", a3, a4);
  }

- (void)runProceedableActivities:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon runProceedableActivities:handler:](self->_daemon, "runProceedableActivities:handler:", a3, a4);
  }

- (void)activityContainsOverrides:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon activityContainsOverrides:handler:](self->_daemon, "activityContainsOverrides:handler:", a3, a4);
  }

- (void)blockingPoliciesWithParameters:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon blockingPoliciesWithParameters:handler:]( self->_daemon,  "blockingPoliciesWithParameters:handler:",  a3,  a4);
  }

- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4,  a5));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon enterTestModeWithParameters:reset:handler:]( self->_daemon,  "enterTestModeWithParameters:reset:handler:",  a3,  a4,  a5);
  }

- (void)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4 handler:(id)a5
{
  if (self->_restricted)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4,  a5));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon enableTaskRegistryMode:processes:handler:]( self->_daemon,  "enableTaskRegistryMode:processes:handler:",  a3,  a4,  a5);
  }

- (void)submitRateLimitConfiguration:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon submitRateLimitConfiguration:handler:](self->_daemon, "submitRateLimitConfiguration:handler:", a3, a4);
  }

- (void)pauseWithParameters:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon pauseWithParameters:handler:](self->_daemon, "pauseWithParameters:handler:", a3, a4);
  }

- (void)addPauseExceptParameter:(id)a3 handler:(id)a4
{
  if (self->_restricted)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar",  a4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon addPauseExceptParameter:handler:](self->_daemon, "addPauseExceptParameter:handler:", a3, a4);
  }

- (void)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 withHandler:(id)a5
{
}

- (void)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 withHandler:(id)a5
{
}

- (void)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 withHandler:(id)a5
{
}

- (void)activityStartedWithParameters:(id)a3
{
}

- (void)activityStoppedWithParameters:(id)a3
{
}

- (void)prewarmApplication:(id)a3
{
  if (self->_restricted)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000B82D8(a2);
    }

    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }

  else
  {
    -[_DASDaemon prewarmApplication:](self->_daemon, "prewarmApplication:", a3);
  }

- (void)prewarmSuspendWithHandler:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemonClient mainApplicationBundleIdentifier](self, "mainApplicationBundleIdentifier"));
  if (!v4) {
    v5[2](v5, 0LL);
  }
  -[_DASDaemon prewarmSuspendApplication:withHandler:](self->_daemon, "prewarmSuspendApplication:withHandler:", v4, v5);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSMutableSet)submittedTasks
{
  return self->_submittedTasks;
}

- (void)setSubmittedTasks:(id)a3
{
}

- (NSMutableSet)delayedStartTasks
{
  return self->_delayedStartTasks;
}

- (void)setDelayedStartTasks:(id)a3
{
}

- (NSMutableSet)startedTasks
{
  return self->_startedTasks;
}

- (void)setStartedTasks:(id)a3
{
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (void)setMainApplicationBundleIdentifier:(id)a3
{
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (NSMutableSet)runningBGTasks
{
  return self->_runningBGTasks;
}

- (void)setRunningBGTasks:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)restricted
{
  return self->_restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

- (void).cxx_destruct
{
}

@end