@interface _DASBARScheduler
+ (id)barSchedulerWithScheduler:(id)a3;
- (BOOL)appUsesBackgroundTaskScheduler:(id)a3;
- (BOOL)applicationStateRequiresImmediateDelivery:(id)a3;
- (BOOL)backgroundAppRefreshEnabled;
- (BOOL)backgroundAppRefreshEnabledForApp:(id)a3;
- (BOOL)backgroundLaunchAllowedForApp:(id)a3;
- (BOOL)backgroundLaunchAllowedForBGTaskActivity:(id)a3;
- (BOOL)barEnabled;
- (BOOL)barWiFiOnly;
- (BOOL)isBAREnabledOnWiFiOnly;
- (BOOL)isNewsstandApp:(id)a3;
- (BOOL)pushLaunchAllowedForApp:(id)a3 immediately:(BOOL *)a4;
- (NSMutableDictionary)appToMinimumLaunchDelay;
- (NSMutableDictionary)appsToPendingTasks;
- (NSMutableSet)appsLaunchedInLastFourteenDays;
- (NSMutableSet)appsLaunchedInLastThreeDays;
- (NSMutableSet)disallowedApps;
- (NSMutableSet)fetchEnabledApps;
- (NSMutableSet)killedApps;
- (NSMutableSet)newsstandApps;
- (NSMutableSet)pushEnabledApps;
- (NSSet)foregroundApps;
- (NSUserDefaults)barPreferences;
- (NSUserDefaults)delayPreferences;
- (NSUserDefaults)killedAppPreferences;
- (NSUserDefaults)lastLaunchPreferences;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)schedulingQueue;
- (OS_dispatch_source)appUpdateTimer;
- (OS_os_log)log;
- (SBSApplicationUserQuitMonitor)quitMonitor;
- (_DASActivityGroup)barGroup;
- (_DASBARScheduler)initWithScheduler:(id)a3;
- (_DASDaemon)scheduler;
- (_DKKnowledgeQuerying)knowledgeStore;
- (double)minimumDelayBetweenLaunchesForApp:(id)a3;
- (id)appsLaunchedInLastDays:(int)a3;
- (id)queueAppsEligibleForBackgroundFetchInSet:(id)a3;
- (id)queueAppsWithDelaySpecifiedInSet:(id)a3;
- (id)queueObtainAppsEligibleForBackgroundFetch;
- (id)queuePendingRefreshes;
- (id)topNAppsUserHasLaunchedInSet:(id)a3;
- (int)barSettingsChangedToken;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)cancelActivitiesForAllApps;
- (void)createBARApplicationGroup;
- (void)dealloc;
- (void)determineAppsWithBackgroundRunningModes;
- (void)disableAppRefreshForApps:(id)a3;
- (void)handleAppsForegrounded:(id)a3;
- (void)queueCancelActivitiesForAllApps;
- (void)queueCancelActivitiesForApps:(id)a3;
- (void)queueHandleAppKilled:(id)a3;
- (void)queueHandleAppsKilled:(id)a3;
- (void)queueHandleAppsRevived:(id)a3;
- (void)queueHandleAppsUninstalled:(id)a3;
- (void)queueHandleBARSettingsChangedNotification:(BOOL)a3;
- (void)queueReloadRequestedDelays;
- (void)queueScheduleActivitiesForEligibleApps:(id)a3 withDelay:(BOOL)a4;
- (void)queueScheduleActivityForApp:(id)a3 startingAfter:(id)a4;
- (void)queueStartIfBAREnabled;
- (void)queueUpdateLastLaunchTimesToDate:(id)a3 forApps:(id)a4;
- (void)queue_cancelBackgroundTasksForUnusedApps;
- (void)quitMonitor:(id)a3 userClosedLastSceneOfApplicationWithBundleID:(id)a4;
- (void)recordBARState;
- (void)registerForAppKilledNotifications;
- (void)registerForBARNotifications;
- (void)reloadRequestedDelays;
- (void)setAppToMinimumLaunchDelay:(id)a3;
- (void)setAppUpdateTimer:(id)a3;
- (void)setAppsLaunchedInLastFourteenDays:(id)a3;
- (void)setAppsLaunchedInLastThreeDays:(id)a3;
- (void)setAppsToPendingTasks:(id)a3;
- (void)setBarEnabled:(BOOL)a3;
- (void)setBarGroup:(id)a3;
- (void)setBarPreferences:(id)a3;
- (void)setBarSettingsChangedToken:(int)a3;
- (void)setBarWiFiOnly:(BOOL)a3;
- (void)setDelayPreferences:(id)a3;
- (void)setDisallowedApps:(id)a3;
- (void)setFetchEnabledApps:(id)a3;
- (void)setForegroundApps:(id)a3;
- (void)setKilledAppPreferences:(id)a3;
- (void)setKilledApps:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setLastLaunchPreferences:(id)a3;
- (void)setLog:(id)a3;
- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4;
- (void)setNewsstandApps:(id)a3;
- (void)setPushEnabledApps:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQuitMonitor:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setSchedulingQueue:(id)a3;
- (void)start;
- (void)startIfBAREnabled;
@end

@implementation _DASBARScheduler

- (_DASBARScheduler)initWithScheduler:(id)a3
{
  id v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS____DASBARScheduler;
  id v6 = -[_DASBARScheduler init](&v47, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.backgroundAppRefresh.syncQueue", v8);
    v10 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.backgroundAppRefresh.schedulingQueue", v12);
    v14 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v13;

    dispatch_source_t v15 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  *((dispatch_queue_t *)v6 + 4));
    v16 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v15;

    dispatch_set_qos_class_fallback(*((void *)v6 + 6), 17LL);
    objc_storeStrong((id *)v6 + 7, a3);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v18 = (void *)*((void *)v6 + 22);
    *((void *)v6 + 22) = v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](&OBJC_CLASS____DASDaemonLogger, "logForCategory:", @"bar"));
    v20 = (void *)*((void *)v6 + 23);
    *((void *)v6 + 23) = v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[_DASPredictionManager sharedKnowledgeStore](&OBJC_CLASS____DASPredictionManager, "sharedKnowledgeStore"));
    v22 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v24 = (void *)*((void *)v6 + 13);
    *((void *)v6 + 13) = v23;

    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v26 = (void *)*((void *)v6 + 14);
    *((void *)v6 + 14) = v25;

    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v28 = (void *)*((void *)v6 + 15);
    *((void *)v6 + 15) = v27;

    uint64_t v29 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v30 = (void *)*((void *)v6 + 18);
    *((void *)v6 + 18) = v29;

    uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v32 = (void *)*((void *)v6 + 19);
    *((void *)v6 + 19) = v31;

    uint64_t v33 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v34 = (void *)*((void *)v6 + 16);
    *((void *)v6 + 16) = v33;

    uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v36 = (void *)*((void *)v6 + 17);
    *((void *)v6 + 17) = v35;

    v37 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mt");
    v38 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v37;

    v39 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mt.launchDelay");
    v40 = (void *)*((void *)v6 + 10);
    *((void *)v6 + 10) = v39;

    v41 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mt.lastLaunch");
    v42 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v41;

    v43 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mt.killed");
    v44 = (void *)*((void *)v6 + 12);
    *((void *)v6 + 12) = v43;

    [v6 registerForAppKilledNotifications];
    [v6 reloadRequestedDelays];
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v45 addObserver:v6];
  }

  return (_DASBARScheduler *)v6;
}

+ (id)barSchedulerWithScheduler:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithScheduler:v4];

  return v5;
}

- (void)dealloc
{
  int barSettingsChangedToken = self->_barSettingsChangedToken;
  if (barSettingsChangedToken) {
    notify_cancel(barSettingsChangedToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____DASBARScheduler;
  -[_DASBARScheduler dealloc](&v4, "dealloc");
}

- (id)queueAppsEligibleForBackgroundFetchInSet:(id)a3
{
  id v4 = [a3 mutableCopy];
  [v4 intersectSet:self->_fetchEnabledApps];
  [v4 minusSet:self->_killedApps];
  [v4 minusSet:self->_disallowedApps];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler queueAppsWithDelaySpecifiedInSet:](self, "queueAppsWithDelaySpecifiedInSet:", v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler topNAppsUserHasLaunchedInSet:](self, "topNAppsUserHasLaunchedInSet:", v5));

  dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        dispatch_queue_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v12), "dk_dedup", (void)v15));
        [v7 addObject:v13];

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v10);
  }

  return v7;
}

- (id)queueObtainAppsEligibleForBackgroundFetch
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[_DASBARScheduler queueAppsEligibleForBackgroundFetchInSet:]( self,  "queueAppsEligibleForBackgroundFetchInSet:",  self->_fetchEnabledApps));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    dispatch_queue_attr_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Apps Eligible: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (void)determineAppsWithBackgroundRunningModes
{
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v24 = (void *)os_transaction_create("com.apple.dasd.bar.appsWithBGRunningModes");
  context = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationRecord enumeratorWithOptions:]( &OBJC_CLASS___LSApplicationRecord,  "enumeratorWithOptions:",  0LL));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 nextObject]);
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v25 = v3;
    while (1)
    {
      int v6 = objc_autoreleasePoolPush();
      if (([v5 isLaunchProhibited] & 1) == 0)
      {
        dispatch_queue_attr_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationState]);
        unsigned __int8 v8 = [v7 isRestricted];

        if ((v8 & 1) == 0) {
          break;
        }
      }

- (id)queueAppsWithDelaySpecifiedInSet:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [v4 mutableCopy];
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v15 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_appToMinimumLaunchDelay, "valueForKey:", v11));

          if (!v12)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v21 = v11;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "No delay specified for %@", buf, 0xCu);
            }

            [v5 removeObject:v11];
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }

      while (v8);
    }

    id v4 = v15;
  }

  else
  {
    id v5 = v4;
  }

  return v5;
}

- (id)topNAppsUserHasLaunchedInSet:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v51 = (void *)os_transaction_create("com.apple.dasd.bar.topNApps");
    v52 = objc_autoreleasePoolPush();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v63 objects:v72 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v64;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v64 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithStringValue:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithStringValue:",  *(void *)(*((void *)&v63 + 1) + 8LL * (void)i)));
          [v5 addObject:v11];
        }

        id v8 = [v6 countByEnumeratingWithState:&v63 objects:v72 count:16];
      }

      while (v8);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 dateByAddingTimeInterval:-1209600.0]);
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventQuery predicateForEventsOfMinimumDuration:]( &OBJC_CLASS____DKEventQuery,  "predicateForEventsOfMinimumDuration:",  10.0));
    v71[0] = v49;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v5));
    v71[1] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 2LL));
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v15));

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appInFocusStream](&OBJC_CLASS____DKSystemEventStreams, "appInFocusStream"));
    v50 = (void *)v13;
    __int128 v18 = -[NSDateInterval initWithStartDate:endDate:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:endDate:",  v13,  v12);
    v48 = (void *)v16;
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[_DKHistogramQuery histogramQueryForStream:interval:withPredicate:]( &OBJC_CLASS____DKHistogramQuery,  "histogramQueryForStream:interval:withPredicate:",  v17,  v18,  v16));

    context = objc_autoreleasePoolPush();
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_DKKnowledgeQuerying executeQuery:error:](self->_knowledgeStore, "executeQuery:error:", v19, 0LL));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 countDictionary]);

    if (!v21) {
      uint64_t v21 = &__NSDictionary0__struct;
    }
    if ((unint64_t)[v21 count] > 0x32)
    {
      v44 = v19;
      v45 = v12;
      id v46 = v4;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v21 allKeys]);
      id v26 = [v25 mutableCopy];

      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472LL;
      v61[2] = sub_10005E014;
      v61[3] = &unk_1001158C0;
      v43 = v21;
      id v62 = v21;
      [v26 sortUsingComparator:v61];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id v28 = v26;
      id v29 = [v28 countByEnumeratingWithState:&v57 objects:v70 count:16];
      if (v29)
      {
        id v30 = v29;
        int v31 = 0;
        uint64_t v32 = *(void *)v58;
LABEL_16:
        uint64_t v33 = 0LL;
        while (1)
        {
          if (*(void *)v58 != v32) {
            objc_enumerationMutation(v28);
          }
          v34 = *(void **)(*((void *)&v57 + 1) + 8 * v33);
          if ([v6 containsObject:v34])
          {
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "dk_dedup"));
            [v27 addObject:v35];

            if (++v31 == 50) {
              break;
            }
          }

          if (v30 == (id)++v33)
          {
            id v30 = [v28 countByEnumeratingWithState:&v57 objects:v70 count:16];
            if (v30) {
              goto LABEL_16;
            }
            break;
          }
        }
      }

      id v23 = [v27 mutableCopy];
      uint64_t v12 = v45;
      id v4 = v46;
      uint64_t v21 = v43;
      __int128 v19 = v44;
    }

    else
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 allKeys]);
      id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](&OBJC_CLASS___NSMutableSet, "setWithArray:", v22));

      [v23 intersectSet:v6];
    }

    objc_autoreleasePoolPop(context);
    objc_autoreleasePoolPop(v52);
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id v24 = v23;
    id v36 = [v24 countByEnumeratingWithState:&v53 objects:v69 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v54;
      do
      {
        for (j = 0LL; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v24);
          }
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v41 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)j);
            *(_DWORD *)buf = 138412290;
            uint64_t v68 = v41;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "User has launched: %@", buf, 0xCu);
          }
        }

        id v37 = [v24 countByEnumeratingWithState:&v53 objects:v69 count:16];
      }

      while (v37);
    }
  }

  else
  {
    id v24 = v4;
  }

  return v24;
}

- (BOOL)isBAREnabledOnWiFiOnly
{
  v3 = (void *)os_transaction_create("com.apple.dasd.bar.settings");
  id v4 = objc_autoreleasePoolPush();
  LOBYTE(self) = -[NSUserDefaults BOOLForKey:](self->_barPreferences, "BOOLForKey:", @"WiFiOnly");
  objc_autoreleasePoolPop(v4);

  return (char)self;
}

- (void)queueHandleBARSettingsChangedNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)os_transaction_create("com.apple.dasd.bar.settingsChanged");
  id v6 = objc_autoreleasePoolPush();
  unsigned int v7 = -[_DASBARScheduler isBAREnabledOnWiFiOnly](self, "isBAREnabledOnWiFiOnly");
  int v8 = v7;
  if (self->_barEnabled || !v3)
  {
    if (!self->_barEnabled || v3)
    {
      char v13 = !self->_barEnabled || !v3;
      if ((v13 & 1) == 0)
      {
        int barWiFiOnly = self->_barWiFiOnly;
        if (barWiFiOnly != v7)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
            sub_1000B55E8(v8, log);
          }
          self->_int barWiFiOnly = v8;
        }

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults dictionaryForKey:]( self->_barPreferences,  "dictionaryForKey:",  @"KeepAppsUpToDateAppList"));
        id v17 = [v16 mutableCopy];

        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472LL;
        v59[2] = sub_10005E6C0;
        v59[3] = &unk_100116660;
        id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        id v60 = v19;
        id v20 = v18;
        id v61 = v20;
        [v17 enumerateKeysAndObjectsUsingBlock:v59];
        if ([v20 count])
        {
          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
            sub_1000B5588();
          }
          -[_DASBARScheduler queueCancelActivitiesForApps:](self, "queueCancelActivitiesForApps:", v20);
          -[_DASDaemon cancelPushLaunchTasksForApps:](self->_scheduler, "cancelPushLaunchTasksForApps:", v20);
          -[_DASDaemon cancelBackgroundTasksForApps:](self->_scheduler, "cancelBackgroundTasksForApps:", v20);
          -[NSMutableSet unionSet:](self->_disallowedApps, "unionSet:", v20);
        }

        if ([v19 count])
        {
          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
            sub_1000B5528();
          }
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler queuePendingRefreshes](self, "queuePendingRefreshes"));
          [v19 minusSet:v21];
          -[NSMutableSet minusSet:](self->_disallowedApps, "minusSet:", v19);
          -[_DASBARScheduler queueScheduleActivitiesForEligibleApps:withDelay:]( self,  "queueScheduleActivitiesForEligibleApps:withDelay:",  v19,  1LL);
        }

        if (barWiFiOnly != v8)
        {
          id v46 = v20;
          id v47 = v19;
          id v48 = v17;
          v49 = v6;
          v50 = v5;
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler queuePendingRefreshes](self, "queuePendingRefreshes"));
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          id v23 = [v22 countByEnumeratingWithState:&v55 objects:v67 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v56;
            do
            {
              id v26 = 0LL;
              do
              {
                if (*(void *)v56 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v27 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)v26);
                BOOL v28 = self->_barWiFiOnly;
                id v29 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_appsToPendingTasks,  "objectForKeyedSubscript:",  v27));
                [v29 setRequiresInexpensiveNetworking:v28];

                id v30 = self->_log;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  appsToPendingTasks = self->_appsToPendingTasks;
                  uint64_t v32 = v30;
                  uint64_t v33 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( appsToPendingTasks,  "objectForKeyedSubscript:",  v27));
                  v34 = (void *)v33;
                  uint64_t v35 = @"requires";
                  if (!self->_barWiFiOnly) {
                    uint64_t v35 = @"does not require";
                  }
                  *(_DWORD *)buf = 138412546;
                  uint64_t v64 = v33;
                  __int16 v65 = 2112;
                  __int128 v66 = v35;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "Activity %@ now %@ inexepensive networking",  buf,  0x16u);
                }

                id v26 = (char *)v26 + 1;
              }

              while (v24 != v26);
              id v36 = [v22 countByEnumeratingWithState:&v55 objects:v67 count:16];
              id v24 = v36;
            }

            while (v36);
          }

          id v37 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon allPendingPushLaunchTasks](self->_scheduler, "allPendingPushLaunchTasks"));
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          id v38 = [v37 countByEnumeratingWithState:&v51 objects:v62 count:16];
          if (v38)
          {
            id v39 = v38;
            uint64_t v40 = *(void *)v52;
            do
            {
              uint64_t v41 = 0LL;
              do
              {
                if (*(void *)v52 != v40) {
                  objc_enumerationMutation(v37);
                }
                v42 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)v41);
                [v42 setRequiresInexpensiveNetworking:self->_barWiFiOnly];
                v43 = self->_log;
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                {
                  v44 = @"requires";
                  if (!self->_barWiFiOnly) {
                    v44 = @"does not require";
                  }
                  *(_DWORD *)buf = 138412546;
                  uint64_t v64 = (uint64_t)v42;
                  __int16 v65 = 2112;
                  __int128 v66 = v44;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "Activity %@ now %@ inexepensive networking",  buf,  0x16u);
                }

                uint64_t v41 = (char *)v41 + 1;
              }

              while (v39 != v41);
              id v45 = [v37 countByEnumeratingWithState:&v51 objects:v62 count:16];
              id v39 = v45;
            }

            while (v45);
          }

          id v6 = v49;
          id v5 = v50;
          id v19 = v47;
          id v17 = v48;
          id v20 = v46;
        }
      }
    }

    else
    {
      id v10 = self->_log;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BAR now disabled", buf, 2u);
      }

      self->_barEnabled = 0;
      -[_DASBARScheduler queueCancelActivitiesForAllApps](self, "queueCancelActivitiesForAllApps");
      -[_DASDaemon cancelAllBackgroundTasks](self->_scheduler, "cancelAllBackgroundTasks");
      dispatch_suspend((dispatch_object_t)self->_appUpdateTimer);
    }
  }

  else
  {
    uint64_t v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BAR now enabled", buf, 2u);
    }

    self->_barEnabled = 1;
    self->_int barWiFiOnly = v8;
    -[_DASBARScheduler queueStartIfBAREnabled](self, "queueStartIfBAREnabled");
  }

  -[_DASBARScheduler recordBARState](self, "recordBARState");
  objc_autoreleasePoolPop(v6);
}

- (void)registerForBARNotifications
{
  BOOL v3 = objc_autoreleasePoolPush();
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults dictionaryForKey:]( self->_barPreferences,  "dictionaryForKey:",  @"KeepAppsUpToDateAppList"));
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005E830;
  block[3] = &unk_100115148;
  id v11 = v4;
  uint64_t v12 = self;
  id v6 = v4;
  dispatch_sync(queue, block);

  objc_autoreleasePoolPop(v3);
  unsigned int v7 = (const char *)[@"kKeepAppsUpToDateEnabledChangedNotification" UTF8String];
  int v8 = (dispatch_queue_s *)self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10005E924;
  handler[3] = &unk_100115388;
  handler[4] = self;
  notify_register_dispatch(v7, &self->_barSettingsChangedToken, v8, handler);
  -[_DASBARScheduler recordBARState](self, "recordBARState");
}

- (void)registerForAppKilledNotifications
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005E9F0;
  block[3] = &unk_1001150D0;
  void block[4] = self;
  dispatch_sync(queue, block);
  id v4 = -[SBSApplicationUserQuitMonitor initWithDelegate:]( objc_alloc(&OBJC_CLASS___SBSApplicationUserQuitMonitor),  "initWithDelegate:",  self);
  quitMonitor = self->_quitMonitor;
  self->_quitMonitor = v4;
}

- (void)queueHandleAppKilled:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B5728();
  }
  if ((-[NSMutableSet containsObject:](self->_killedApps, "containsObject:", v4) & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dedup"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v5));

    -[NSMutableSet unionSet:](self->_killedApps, "unionSet:", v6);
    killedAppPreferences = self->_killedAppPreferences;
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_killedApps, "allObjects"));
    -[NSUserDefaults setObject:forKey:](killedAppPreferences, "setObject:forKey:", v8, @"killed");

    -[_DASBARScheduler queueCancelActivitiesForApps:](self, "queueCancelActivitiesForApps:", v6);
    schedulingQueue = (dispatch_queue_s *)self->_schedulingQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10005EC78;
    v11[3] = &unk_100115148;
    v11[4] = self;
    id v12 = v6;
    id v10 = v6;
    dispatch_async(schedulingQueue, v11);
  }
}

- (void)queueHandleAppsKilled:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    char v8 = 1;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ((-[NSMutableSet containsObject:](self->_killedApps, "containsObject:", v10) & 1) == 0)
        {
          killedApps = self->_killedApps;
          id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dk_dedup"));
          -[NSMutableSet addObject:](killedApps, "addObject:", v12);

          char v8 = 0;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v6);
    if ((v8 & 1) == 0)
    {
      killedAppPreferences = self->_killedAppPreferences;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_killedApps, "allObjects"));
      -[NSUserDefaults setObject:forKey:](killedAppPreferences, "setObject:forKey:", v14, @"killed");

      -[_DASBARScheduler queueCancelActivitiesForApps:](self, "queueCancelActivitiesForApps:", v4);
      -[_DASDaemon cancelAppRefreshTasksForApps:](self->_scheduler, "cancelAppRefreshTasksForApps:", v4);
    }
  }
}

- (void)queueHandleAppsRevived:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  uint64_t v9 = v6;
  if (!v7) {
    goto LABEL_14;
  }
  id v10 = v7;
  char v11 = 0;
  uint64_t v12 = *(void *)v20;
  *(void *)&__int128 v8 = 138412290LL;
  __int128 v18 = v8;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v6);
      }
      v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
      if (-[NSMutableSet containsObject:](self->_killedApps, "containsObject:", v14, v18, (void)v19))
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v18;
          id v24 = v14;
          _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "App revived: %@", buf, 0xCu);
        }

        -[NSMutableSet removeObject:](self->_killedApps, "removeObject:", v14);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dk_dedup"));
        [v5 addObject:v16];

        char v11 = 1;
      }
    }

    id v10 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  }

  while (v10);

  if ((v11 & 1) != 0)
  {
    killedAppPreferences = self->_killedAppPreferences;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_killedApps, "allObjects"));
    -[NSUserDefaults setObject:forKey:](killedAppPreferences, "setObject:forKey:", v9, @"killed");
LABEL_14:
  }
}

- (void)queueHandleAppsUninstalled:(id)a3
{
  id v4 = a3;
  -[_DASBARScheduler queueCancelActivitiesForApps:](self, "queueCancelActivitiesForApps:", v4);
  schedulingQueue = (dispatch_queue_s *)self->_schedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005F1F8;
  block[3] = &unk_100115148;
  void block[4] = self;
  id v6 = v4;
  id v22 = v6;
  dispatch_async(schedulingQueue, block);
  -[NSMutableSet minusSet:](self->_fetchEnabledApps, "minusSet:", v6);
  -[NSMutableSet minusSet:](self->_pushEnabledApps, "minusSet:", v6);
  -[NSMutableSet minusSet:](self->_newsstandApps, "minusSet:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults dictionaryForKey:]( self->_barPreferences,  "dictionaryForKey:",  @"KeepAppsUpToDateAppList"));
  id v8 = [v7 mutableCopy];

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        -[NSMutableDictionary removeObjectForKey:]( self->_appToMinimumLaunchDelay,  "removeObjectForKey:",  v14,  (void)v17);
        [v8 removeObjectForKey:v14];
      }

      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v11);
  }

  barPreferences = self->_barPreferences;
  id v16 = [v8 copy];
  -[NSUserDefaults setObject:forKey:](barPreferences, "setObject:forKey:", v16, @"KeepAppsUpToDateAppList");

  -[NSUserDefaults setObject:forKey:]( self->_delayPreferences,  "setObject:forKey:",  self->_appToMinimumLaunchDelay,  @"delays");
  -[_DASBARScheduler queueUpdateLastLaunchTimesToDate:forApps:]( self,  "queueUpdateLastLaunchTimesToDate:forApps:",  0LL,  v9);
  -[_DASBARScheduler queueHandleAppsRevived:](self, "queueHandleAppsRevived:", v9);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  id v7 = (id)os_transaction_create("com.apple.dasd.applicationDidUninstall");
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005F2A0;
  block[3] = &unk_100115148;
  id v9 = v4;
  id v10 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create("com.apple.dasd.bar.appsInstalled");
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005F480;
  block[3] = &unk_100115120;
  id v10 = v5;
  id v11 = v4;
  uint64_t v12 = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(queue, block);
}

- (id)appsLaunchedInLastDays:(int)a3
{
  id v5 = (void *)os_transaction_create("com.apple.dasd.appsLaunchedInLastNDays");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v7 timeIntervalSinceReferenceDate];
  uint64_t v9 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:(double)(-86400 * a3)]);
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  char v13 = (void *)objc_claimAutoreleasedReturnValue(+[BMStreams appLaunch](&OBJC_CLASS___BMStreams, "appLaunch"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 publisherFromStartTime:v12]);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 filterWithIsIncluded:&stru_100116680]);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10005F90C;
  v23[3] = &unk_1001166A8;
  v23[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10005F978;
  v20[3] = &unk_1001166D0;
  uint64_t v22 = v9;
  id v21 = v6;
  id v16 = v6;
  id v17 = [v15 sinkWithCompletion:v23 receiveInput:v20];

  id v18 = [v16 copy];
  return v18;
}

- (void)queue_cancelBackgroundTasksForUnusedApps
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBARScheduler appsLaunchedInLastDays:](self, "appsLaunchedInLastDays:", 14LL));
  -[NSMutableSet removeAllObjects](self->_appsLaunchedInLastFourteenDays, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_appsLaunchedInLastThreeDays, "removeAllObjects");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005FB60;
  v8[3] = &unk_100115070;
  v8[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  schedulingQueue = (dispatch_queue_s *)self->_schedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005FBC4;
  block[3] = &unk_100115148;
  void block[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(schedulingQueue, block);
}

- (id)queuePendingRefreshes
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_appsToPendingTasks, "allKeys"));
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (void)queueCancelActivitiesForAllApps
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_appsToPendingTasks, "allValues"));
  -[NSMutableDictionary removeAllObjects](self->_appsToPendingTasks, "removeAllObjects");
  schedulingQueue = (dispatch_queue_s *)self->_schedulingQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005FE04;
  v6[3] = &unk_100115148;
  id v7 = v3;
  uint64_t v8 = self;
  id v5 = v3;
  dispatch_async(schedulingQueue, v6);
}

- (void)cancelActivitiesForAllApps
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005FF5C;
  block[3] = &unk_1001150D0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)queueCancelActivitiesForApps:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        double v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_appsToPendingTasks,  "objectForKeyedSubscript:",  v11));
        if (v12)
        {
          [v5 addObject:v12];
          -[NSMutableDictionary removeObjectForKey:](self->_appsToPendingTasks, "removeObjectForKey:", v11);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }

  schedulingQueue = (dispatch_queue_s *)self->_schedulingQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100060100;
  v15[3] = &unk_100115148;
  id v16 = v5;
  id v17 = self;
  id v14 = v5;
  dispatch_async(schedulingQueue, v15);
}

- (void)queueScheduleActivitiesForEligibleApps:(id)a3 withDelay:(BOOL)a4
{
  id v6 = a3;
  id v17 = (void *)os_transaction_create("com.apple.dasd.bar.scheduleEligibleApps");
  __int128 v18 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_DASBARScheduler queueAppsEligibleForBackgroundFetchInSet:]( self,  "queueAppsEligibleForBackgroundFetchInSet:",  v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      char v13 = 0LL;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v13);
        if (a4)
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_appToMinimumLaunchDelay,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v13)));
          [v15 doubleValue];
          id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:"));
          -[_DASBARScheduler queueScheduleActivityForApp:startingAfter:]( self,  "queueScheduleActivityForApp:startingAfter:",  v14,  v16);
        }

        else
        {
          -[_DASBARScheduler queueScheduleActivityForApp:startingAfter:]( self,  "queueScheduleActivityForApp:startingAfter:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v13),  v8);
        }

        char v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v11);
  }
}

- (void)queueScheduleActivityForApp:(id)a3 startingAfter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Scheduling refresh for %@", buf, 0xCu);
  }

  if ([v6 isEqualToString:@"com.apple.purplebuddy"])
  {
    id v9 = self->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000B581C(v9, v10, v11);
    }
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_appToMinimumLaunchDelay,  "objectForKeyedSubscript:",  v6));

    if (v12)
    {
      char v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"com.apple.fetch.",  v6));
      uint64_t v14 = _DASSchedulingPriorityBackground;
      uint64_t v15 = _DASLaunchReasonBackgroundFetch;
      uint64_t v16 = _DASActivityDurationVeryShort;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 dateByAddingTimeInterval:86400.0]);
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivity applicationLaunchActivityWithName:priority:forApplication:withReason:duration:startingAfter:startingBefore:]( &OBJC_CLASS____DASActivity,  "applicationLaunchActivityWithName:priority:forApplication:withReason:duration:startingAfter:startingBefore:",  v13,  v14,  v6,  v15,  v16,  v7,  v17));

      [v18 setShouldBePersisted:0];
      [v18 setRequiresNetwork:1];
      [v18 setRequiresInexpensiveNetworking:self->_barWiFiOnly];
      [v18 setTransferSize:_DASActivityTransferSizeSmall];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100060644;
      v24[3] = &unk_100116720;
      v24[4] = self;
      id v19 = v6;
      id v25 = v19;
      [v18 setStartHandler:v24];
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_appsToPendingTasks,  "setObject:forKeyedSubscript:",  v18,  v19);
      schedulingQueue = (dispatch_queue_s *)self->_schedulingQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10006079C;
      block[3] = &unk_100115148;
      void block[4] = self;
      id v23 = v18;
      id v21 = v18;
      dispatch_async(schedulingQueue, block);
    }
  }
}

- (void)createBARApplicationGroup
{
  BOOL v3 = (_DASActivityGroup *)objc_claimAutoreleasedReturnValue( +[_DASActivityGroup groupWithName:maxConcurrent:]( &OBJC_CLASS____DASActivityGroup,  "groupWithName:maxConcurrent:",  @"com.apple.backgroundAppRefresh",  3LL));
  barGroup = self->_barGroup;
  self->_barGroup = v3;

  schedulingQueue = (dispatch_queue_s *)self->_schedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100060830;
  block[3] = &unk_1001150D0;
  void block[4] = self;
  dispatch_async(schedulingQueue, block);
}

- (void)queueStartIfBAREnabled
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[_DASBARScheduler queueObtainAppsEligibleForBackgroundFetch]( self,  "queueObtainAppsEligibleForBackgroundFetch"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        -[_DASBARScheduler queueScheduleActivityForApp:startingAfter:]( self,  "queueScheduleActivityForApp:startingAfter:",  v8,  v9);

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v5);
  }

  appUpdateTimer = self->_appUpdateTimer;
  dispatch_time_t v11 = dispatch_walltime(0LL, 1000000000LL);
  dispatch_source_set_timer((dispatch_source_t)appUpdateTimer, v11, 0x9D29229E000uLL, 0x19254D3800uLL);
  uint64_t v12 = self->_appUpdateTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000609E8;
  handler[3] = &unk_1001150D0;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v12, handler);
  dispatch_resume((dispatch_object_t)self->_appUpdateTimer);
}

- (void)startIfBAREnabled
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100060BA8;
  block[3] = &unk_1001150D0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)recordBARState
{
  if (self->_barEnabled)
  {
    if (self->_barWiFiOnly) {
      uint64_t v2 = 2LL;
    }
    else {
      uint64_t v2 = 3LL;
    }
  }

  else
  {
    uint64_t v2 = 1LL;
  }

  +[_DASMetricRecorder setValue:forKey:]( &OBJC_CLASS____DASMetricRecorder,  "setValue:forKey:",  v2,  @"com.apple.dasd.barEnabled");
}

- (void)start
{
  BOOL v3 = objc_autoreleasePoolPush();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  -[_DASBARScheduler registerForBARNotifications](self, "registerForBARNotifications");
  unsigned int v5 = [v4 isAutomaticAppUpdatesAllowed];
  log = self->_log;
  BOOL v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "BAR enabled", buf, 2u);
    }

    self->_barEnabled = 1;
    self->_int barWiFiOnly = -[_DASBARScheduler isBAREnabledOnWiFiOnly](self, "isBAREnabledOnWiFiOnly");
    -[_DASBARScheduler startIfBAREnabled](self, "startIfBAREnabled");
  }

  else if (v7)
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "BAR disabled", v8, 2u);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)queueUpdateLastLaunchTimesToDate:(id)a3 forApps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults dictionaryForKey:]( self->_lastLaunchPreferences,  "dictionaryForKey:",  @"launches"));
  id v19 = v8;
  if (v8) {
    id v9 = [v8 mutableCopy];
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  uint64_t v10 = v9;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v16 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        if (-[NSMutableSet containsObject:](self->_fetchEnabledApps, "containsObject:", v16))
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            id v25 = v11;
            __int16 v26 = 2112;
            id v27 = v6;
            _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Updating last launch time for %@ to %@",  buf,  0x16u);
          }

          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dk_dedup"));
          [v10 setObject:v6 forKeyedSubscript:v18];
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v13);
  }

  -[NSUserDefaults setObject:forKey:](self->_lastLaunchPreferences, "setObject:forKey:", v10, @"launches");
}

- (void)handleAppsForegrounded:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)os_transaction_create("com.apple.dasd.bar.appFG");
  id v6 = objc_autoreleasePoolPush();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006101C;
  block[3] = &unk_1001156A8;
  id v10 = v5;
  id v15 = v10;
  __int128 v16 = self;
  id v13 = v4;
  id v17 = v13;
  id v18 = v8;
  id v19 = v7;
  id v11 = v7;
  id v12 = v8;
  dispatch_sync(queue, block);

  objc_autoreleasePoolPop(v6);
}

- (BOOL)backgroundLaunchAllowedForApp:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061468;
  block[3] = &unk_1001154E8;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)applicationStateRequiresImmediateDelivery:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v4));
  id v12 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForPredicate:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForPredicate:error:",  v5,  &v12));
  id v7 = v12;

  if (v7)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000B5950();
    }
    BOOL v8 = 0;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 currentState]);
    if ([v9 isDebugging])
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
        sub_1000B58F0();
      }
      BOOL v8 = 1;
    }

    else if ([v9 taskState] == 4)
    {
      log = self->_log;
      BOOL v8 = 1;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Remote Notification: %@ - Running", buf, 0xCu);
      }
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)pushLaunchAllowedForApp:(id)a3 immediately:(BOOL *)a4
{
  id v6 = a3;
  if (a4)
  {
    *a4 = 0;
    if (-[_DASBARScheduler applicationStateRequiresImmediateDelivery:]( self,  "applicationStateRequiresImmediateDelivery:",  v6))
    {
      BOOL v7 = 1;
      *a4 = 1;
      goto LABEL_18;
    }
  }

  else if (-[_DASBARScheduler applicationStateRequiresImmediateDelivery:]( self,  "applicationStateRequiresImmediateDelivery:",  v6))
  {
    BOOL v7 = 1;
    goto LABEL_18;
  }

  if (self->_barEnabled)
  {
    *(void *)&__int128 v25 = 0LL;
    *((void *)&v25 + 1) = &v25;
    uint64_t v26 = 0x2020000000LL;
    char v27 = 1;
    queue = (dispatch_queue_s *)self->_queue;
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    id v17 = sub_1000618B8;
    id v18 = &unk_100116748;
    __int128 v21 = &v25;
    id v19 = self;
    id v9 = v6;
    id v20 = v9;
    __int128 v22 = a4;
    dispatch_sync(queue, &v15);
    if (a4 && *a4
      || (v10 = (void *)objc_claimAutoreleasedReturnValue( +[_APRSPrewarmInterface sharedInstance]( _APRSPrewarmInterface,  "sharedInstance",  v15,  v16,  v17,  v18,  v19)),  unsigned int v11 = [v10 hasPrewarmAssertionForApplication:v9],  v10,  !v11))
    {
      BOOL v7 = *(_BYTE *)(*((void *)&v25 + 1) + 24LL) != 0;
    }

    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_INFO,  "Remote Notification: %@ - Prewarm Assertion",  buf,  0xCu);
      }

      BOOL v7 = 0;
    }

    _Block_object_dispose(&v25, 8);
  }

  else
  {
    uint64_t v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(v25) = 138412290;
      *(void *)((char *)&v25 + 4) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Remote Notification: %@ - BAR Disabled",  (uint8_t *)&v25,  0xCu);
    }

    BOOL v7 = 0;
  }

- (BOOL)isNewsstandApp:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000LL;
    char v15 = 0;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100061BC8;
    block[3] = &unk_1001154E8;
    unsigned int v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(queue, block);
    BOOL v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)quitMonitor:(id)a3 userClosedLastSceneOfApplicationWithBundleID:(id)a4
{
  id v6 = a4;
  if (self->_quitMonitor == a3)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[1] = 3221225472LL;
    block[2] = sub_100061C88;
    block[3] = &unk_100115148;
    void block[4] = self;
    id v8 = v6;
    block[0] = _NSConcreteStackBlock;
    id v10 = v6;
    dispatch_sync(queue, block);

    id v6 = v8;
  }
}

- (void)reloadRequestedDelays
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061CEC;
  block[3] = &unk_1001150D0;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)queueReloadRequestedDelays
{
  BOOL v3 = objc_autoreleasePoolPush();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults dictionaryForKey:](self->_delayPreferences, "dictionaryForKey:", @"delays"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100061DEC;
  v8[3] = &unk_100115070;
  unsigned int v5 = (NSMutableDictionary *)(id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionary]( &OBJC_CLASS___NSMutableDictionary,  "dictionary"));
  id v9 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000B59B4();
  }
  appToMinimumLaunchDelay = self->_appToMinimumLaunchDelay;
  self->_appToMinimumLaunchDelay = v5;
  BOOL v7 = v5;

  objc_autoreleasePoolPop(v3);
}

- (double)minimumDelayBetweenLaunchesForApp:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = 0x7FEFFFFFFFFFFFFFLL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061F08;
  block[3] = &unk_1001152D8;
  void block[4] = self;
  id v10 = v4;
  unsigned int v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100061FE4;
  block[3] = &unk_100115510;
  id v10 = v6;
  unsigned int v11 = self;
  double v12 = a3;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (BOOL)backgroundAppRefreshEnabled
{
  return self->_barEnabled;
}

- (BOOL)backgroundAppRefreshEnabledForApp:(id)a3
{
  if (!self->_barEnabled) {
    return 0;
  }
  barPreferences = self->_barPreferences;
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults dictionaryForKey:]( barPreferences,  "dictionaryForKey:",  @"KeepAppsUpToDateAppList"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6) {
    unsigned __int8 v7 = [v6 BOOLValue];
  }
  else {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (void)disableAppRefreshForApps:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Disabling BAR for %@", (uint8_t *)&v6, 0xCu);
  }

  -[_DASBARScheduler queueHandleAppsKilled:](self, "queueHandleAppsKilled:", v4);
}

- (BOOL)appUsesBackgroundTaskScheduler:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 backgroundTaskSchedulerPermittedIdentifiers]);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)backgroundLaunchAllowedForBGTaskActivity:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
  uint64_t v6 = _DASLaunchReasonBackgroundProcessing;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
  if ([v7 isEqualToString:_DASLaunchReasonHealthResearch])
  {

LABEL_4:
    goto LABEL_5;
  }

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
  unsigned __int8 v24 = [v23 isEqualToString:_DASLaunchReasonBackgroundRefresh];

  if ((v24 & 1) != 0)
  {
LABEL_5:
    id v8 = (void *)os_transaction_create("com.apple.dasd.backgroundLaunchAllowedForBGTask");
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

    id v11 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v10 allowPlaceholder:0 error:0];
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationState]);
    unsigned __int8 v13 = [v12 isValid];

    if ((v13 & 1) == 0)
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000B5C24();
      }
      goto LABEL_33;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationState]);
    unsigned __int8 v15 = [v14 isInstalled];

    if ((v15 & 1) == 0)
    {
      if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000B5BA0();
      }
      goto LABEL_33;
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
    uint64_t v17 = _DASLaunchReasonHealthResearch;
    if (([v16 isEqualToString:_DASLaunchReasonHealthResearch] & 1) != 0
      || ([v4 isContactTracingBackgroundActivity] & 1) != 0)
    {
    }

    else
    {
      unsigned __int8 v31 = -[_DASBARScheduler backgroundLaunchAllowedForApp:](self, "backgroundLaunchAllowedForApp:", v10);

      if ((v31 & 1) == 0)
      {
        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          sub_1000B5B1C();
        }
        goto LABEL_33;
      }
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
    unsigned int v19 = [v18 isEqualToString:_DASLaunchReasonBackgroundRefresh];

    if (v19)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 UIBackgroundModes]);
      __int128 v21 = v20;
      __int128 v22 = @"fetch";
    }

    else
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
      if ([v30 isEqualToString:v6])
      {
      }

      else
      {
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
        unsigned int v33 = [v32 isEqualToString:v17];

        if (!v33)
        {
LABEL_31:
          if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
            sub_1000B5A98();
          }
LABEL_33:
          BOOL v29 = 0;
LABEL_34:

          goto LABEL_35;
        }
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 UIBackgroundModes]);
      __int128 v21 = v20;
      __int128 v22 = @"processing";
    }

    unsigned __int8 v34 = [v20 containsObject:v22];

    if ((v34 & 1) != 0)
    {
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProvidedIdentifier]);
      if (v35
        && (id v36 = (void *)objc_claimAutoreleasedReturnValue([v11 backgroundTaskSchedulerPermittedIdentifiers]),
            unsigned __int8 v37 = [v36 containsObject:v35],
            v36,
            (v37 & 1) != 0))
      {
        BOOL v29 = 1;
      }

      else
      {
        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          sub_1000B5A14();
        }
        BOOL v29 = 0;
      }

      goto LABEL_34;
    }

    goto LABEL_31;
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = log;
    char v27 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
    int v39 = 138543618;
    uint64_t v40 = v27;
    __int16 v41 = 2114;
    v42 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ launch reason %{public}@ is not a BGTask reason. Allowing background launch.",  (uint8_t *)&v39,  0x16u);
  }

  BOOL v29 = 1;
LABEL_35:

  return v29;
}

- (BOOL)barEnabled
{
  return self->_barEnabled;
}

- (void)setBarEnabled:(BOOL)a3
{
  self->_barEnabled = a3;
}

- (BOOL)barWiFiOnly
{
  return self->_barWiFiOnly;
}

- (void)setBarWiFiOnly:(BOOL)a3
{
  self->_int barWiFiOnly = a3;
}

- (SBSApplicationUserQuitMonitor)quitMonitor
{
  return self->_quitMonitor;
}

- (void)setQuitMonitor:(id)a3
{
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)schedulingQueue
{
  return self->_schedulingQueue;
}

- (void)setSchedulingQueue:(id)a3
{
}

- (OS_dispatch_source)appUpdateTimer
{
  return self->_appUpdateTimer;
}

- (void)setAppUpdateTimer:(id)a3
{
}

- (int)barSettingsChangedToken
{
  return self->_barSettingsChangedToken;
}

- (void)setBarSettingsChangedToken:(int)a3
{
  self->_int barSettingsChangedToken = a3;
}

- (_DASDaemon)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (_DASActivityGroup)barGroup
{
  return self->_barGroup;
}

- (void)setBarGroup:(id)a3
{
}

- (NSUserDefaults)barPreferences
{
  return self->_barPreferences;
}

- (void)setBarPreferences:(id)a3
{
}

- (NSUserDefaults)delayPreferences
{
  return self->_delayPreferences;
}

- (void)setDelayPreferences:(id)a3
{
}

- (NSUserDefaults)lastLaunchPreferences
{
  return self->_lastLaunchPreferences;
}

- (void)setLastLaunchPreferences:(id)a3
{
}

- (NSUserDefaults)killedAppPreferences
{
  return self->_killedAppPreferences;
}

- (void)setKilledAppPreferences:(id)a3
{
}

- (NSMutableSet)fetchEnabledApps
{
  return self->_fetchEnabledApps;
}

- (void)setFetchEnabledApps:(id)a3
{
}

- (NSMutableSet)pushEnabledApps
{
  return self->_pushEnabledApps;
}

- (void)setPushEnabledApps:(id)a3
{
}

- (NSMutableSet)newsstandApps
{
  return self->_newsstandApps;
}

- (void)setNewsstandApps:(id)a3
{
}

- (NSMutableSet)disallowedApps
{
  return self->_disallowedApps;
}

- (void)setDisallowedApps:(id)a3
{
}

- (NSMutableSet)killedApps
{
  return self->_killedApps;
}

- (void)setKilledApps:(id)a3
{
}

- (NSMutableSet)appsLaunchedInLastFourteenDays
{
  return self->_appsLaunchedInLastFourteenDays;
}

- (void)setAppsLaunchedInLastFourteenDays:(id)a3
{
}

- (NSMutableSet)appsLaunchedInLastThreeDays
{
  return self->_appsLaunchedInLastThreeDays;
}

- (void)setAppsLaunchedInLastThreeDays:(id)a3
{
}

- (NSSet)foregroundApps
{
  return self->_foregroundApps;
}

- (void)setForegroundApps:(id)a3
{
}

- (NSMutableDictionary)appToMinimumLaunchDelay
{
  return self->_appToMinimumLaunchDelay;
}

- (void)setAppToMinimumLaunchDelay:(id)a3
{
}

- (NSMutableDictionary)appsToPendingTasks
{
  return self->_appsToPendingTasks;
}

- (void)setAppsToPendingTasks:(id)a3
{
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