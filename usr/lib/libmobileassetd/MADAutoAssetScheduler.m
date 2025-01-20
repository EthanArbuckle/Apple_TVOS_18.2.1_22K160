@interface MADAutoAssetScheduler
+ (BOOL)isSelector:(id)a3 consideredEqualTo:(id)a4;
+ (id)assetTypesAtAggressiveFrequency;
+ (id)assetTypesAtHeightenedFrequency;
+ (id)autoAssetScheduler;
+ (id)jobTypeName:(BOOL)a3 setJob:(BOOL)a4 requiringRetry:(BOOL)a5;
+ (id)jobsAwaitingTrigger;
+ (id)migrateMismatchedPersistedStateVersion:(id)a3 forEntryID:(id)a4 withMismatchedState:(id)a5;
+ (id)nameForXPCStatus:(int64_t)a3;
+ (id)newSetPolicyForDomainName:(id)a3 forAssetSetIdentifier:(id)a4;
+ (id)persistedEntryIDForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4;
+ (id)stringFromDate:(id)a3;
+ (int64_t)_preferenceChosenTickerIntervalSecs;
+ (int64_t)persistedScheduledCount;
+ (int64_t)tickerIntervalForActivityIntervalSecs:(int64_t)a3;
+ (void)addScheduledJobs:(id)a3 basedOnControl:(id)a4;
+ (void)controlEliminateSelector:(id)a3;
+ (void)controlEliminateSetDomainName:(id)a3 forAssetSetIdentifier:(id)a4 indicatingWhenEliminated:(BOOL)a5;
+ (void)forceGlobalForget:(id)a3;
+ (void)jobFinishedForSelector:(id)a3 withPotentialNetworkFailure:(BOOL)a4;
+ (void)jobFinishedForSetDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withPotentialNetworkFailure:(BOOL)a5;
+ (void)jobsAwaitingTrigger;
+ (void)persistedScheduledCount;
+ (void)resumeFromPersisted:(id)a3;
+ (void)schedulePushNotifications:(id)a3;
+ (void)scheduleSelector:(id)a3 triggeringAtIntervalSecs:(int64_t)a4;
+ (void)scheduleSetDomainName:(id)a3 forAssetSetIdentifier:(id)a4 usingSetUpdatePolicy:(id)a5 forSetConfiguration:(id)a6;
+ (void)setPersistedStateCaching:(BOOL)a3;
+ (void)shutdown;
+ (void)triggerWithRetrySetDomainName:(id)a3 forAssetSetIdentifier:(id)a4 usingSetUpdatePolicy:(id)a5;
- (BOOL)activityTickerFired;
- (BOOL)globalActivityInterval;
- (BOOL)tickerIntervalReRegistering;
- (MADAutoAssetPersisted)persistedState;
- (MADAutoAssetScheduler)init;
- (NSMutableArray)jobsAwaitingTrigger;
- (NSMutableDictionary)jobsBySelector;
- (NSMutableDictionary)setConfigurations;
- (NSSet)schedulerIntervalAggressiveAssetTypes;
- (NSSet)schedulerIntervalHeightenedAssetTypes;
- (NSString)lastTickTimestampString;
- (NSTimer)scheduledJobsBackupTriggerTimer;
- (OS_dispatch_queue)schedulerQueue;
- (SUCoreLog)logger;
- (id)_assetTypeForAssetSelector:(id)a3;
- (id)_currentlyScheduledMarkers;
- (id)_currentlyScheduledMarkersRequiringRetry;
- (id)_markerForSelector:(id)a3;
- (id)_markerForSelector:(id)a3 andJob:(id)a4;
- (id)_newSetPolicyForDomainName:(id)a3 forAssetSetIdentifier:(id)a4 fromLocation:(id)a5;
- (id)_setConfigurationForAssetSelector:(id)a3;
- (id)_snapshotOfJobsBySelector;
- (id)defaultSchedulerSetPolicy;
- (id)summary;
- (int64_t)_aggressiveIntervalSecs;
- (int64_t)_decideTriggerIntervalSecs:(id)a3 forAssetSelector:(id)a4;
- (int64_t)_heightenedIntervalSecs;
- (int64_t)activityIntervalSecs;
- (int64_t)jobsAwaitingPushTrigger;
- (int64_t)pushCounter;
- (int64_t)pushDelaySecs;
- (int64_t)pushJobsXPCActivity;
- (int64_t)scheduledJobsXPCActivity;
- (int64_t)tickerIntervalSecs;
- (void)_eliminateSelector:(id)a3 forSetJob:(BOOL)a4 indicatingWhenEliminated:(BOOL)a5;
- (void)_eliminateSpecificSelector:(id)a3;
- (void)_informConnectorActiveJobFinishedforSelector:(id)a3 withPotentialNetworkFailure:(BOOL)a4;
- (void)_informConnectorAlteredSelectors;
- (void)_informConnectorTriggeredSelectors:(id)a3 withTriggeredRequiringRetry:(id)a4;
- (void)_jobFinishedForSelector:(id)a3 withPotentialNetworkFailure:(BOOL)a4;
- (void)_jobFinishedForSetDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withPotentialNetworkFailure:(BOOL)a5;
- (void)_logPersistedConfigLoad:(id)a3 activityIntervalSecs:(int64_t)a4 pushTriggerSecs:(int64_t)a5 lastTickDate:(id)a6 message:(id)a7;
- (void)_logPersistedConfigSet:(id)a3 activityIntervalSecs:(int64_t)a4 pushTriggerSecs:(int64_t)a5 lastTickDate:(id)a6 message:(id)a7;
- (void)_logPersistedEntry:(id)a3 operation:(id)a4 persistingSelector:(id)a5 intervalSecs:(int64_t)a6 remainingSecs:(int64_t)a7 pushedJob:(BOOL)a8 setJob:(BOOL)a9 setPolicy:(id)a10 pushedPolicy:(id)a11 requiringRetry:(BOOL)a12 message:(id)a13;
- (void)_logPersistedRemovedEntry:(id)a3 removedSelector:(id)a4 message:(id)a5;
- (void)_logPersistedTableOfContents:(id)a3;
- (void)_performActivityOperations;
- (void)_performPushNotificationOperations;
- (void)_performTickerOperations:(int64_t)a3;
- (void)_performTriggeredSetJobForSetConfiguration:(id)a3 usingSetUpdatePolicy:(id)a4;
- (void)_registerForAndStartActivity:(int64_t)a3;
- (void)_resumeConnector;
- (void)_schedulePushNotifications:(id)a3;
- (void)_scheduleSelector:(id)a3 triggeringAtIntervalSecs:(int64_t)a4 withRemainingSecs:(int64_t)a5 forPushedJob:(BOOL)a6 forSetJob:(BOOL)a7 withSetPolicy:(id)a8 triggeringIfLearned:(BOOL)a9 resettingRemaining:(BOOL)a10;
- (void)_setActivityCriteria:(id)a3 pushNotificationInitiated:(BOOL)a4 withActivityDelay:(int64_t)a5;
- (void)_snapshotOfJobsBySelector;
- (void)_startActivityBackupTrigger;
- (void)_startPushDelayTimer:(int64_t)a3;
- (void)_trackSetConfigurations:(id)a3;
- (void)setActivityIntervalSecs:(int64_t)a3;
- (void)setActivityTickerFired:(BOOL)a3;
- (void)setGlobalActivityInterval:(BOOL)a3;
- (void)setJobsAwaitingPushTrigger:(int64_t)a3;
- (void)setJobsAwaitingTrigger:(id)a3;
- (void)setJobsBySelector:(id)a3;
- (void)setLastTickTimestampString:(id)a3;
- (void)setPushCounter:(int64_t)a3;
- (void)setPushDelaySecs:(int64_t)a3;
- (void)setPushJobsXPCActivity:(int64_t)a3;
- (void)setScheduledJobsBackupTriggerTimer:(id)a3;
- (void)setScheduledJobsXPCActivity:(int64_t)a3;
- (void)setSchedulerIntervalAggressiveAssetTypes:(id)a3;
- (void)setSchedulerIntervalHeightenedAssetTypes:(id)a3;
- (void)setSetConfigurations:(id)a3;
- (void)setTickerIntervalReRegistering:(BOOL)a3;
- (void)setTickerIntervalSecs:(int64_t)a3;
@end

@implementation MADAutoAssetScheduler

+ (id)autoAssetScheduler
{
  if (autoAssetScheduler_dispatchOnceAutoAssetScheduler != -1) {
    dispatch_once(&autoAssetScheduler_dispatchOnceAutoAssetScheduler, &__block_literal_global_674);
  }
  return (id)autoAssetScheduler___autoAssetScheduler;
}

- (OS_dispatch_queue)schedulerQueue
{
  return self->_schedulerQueue;
}

- (NSMutableArray)jobsAwaitingTrigger
{
  return self->_jobsAwaitingTrigger;
}

+ (BOOL)isSelector:(id)a3 consideredEqualTo:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    unsigned __int8 v8 = 1;
    goto LABEL_22;
  }

  unsigned __int8 v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([(id)v5 assetType]);
    if (!v9) {
      goto LABEL_16;
    }
    v10 = (void *)v9;
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v7 assetType]);
    if (!v11)
    {
      unsigned __int8 v8 = 0;
LABEL_21:

      goto LABEL_22;
    }

    v12 = (void *)v11;
    uint64_t v13 = objc_claimAutoreleasedReturnValue([(id)v5 assetSpecifier]);
    if (v13)
    {
      v14 = (void *)v13;
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 assetSpecifier]);
      if (!v15)
      {
        unsigned __int8 v8 = 0;
        goto LABEL_14;
      }

      v16 = (void *)v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 assetVersion]);
      if (v17)
      {

        unsigned __int8 v8 = 0;
LABEL_11:

LABEL_14:
LABEL_20:

        goto LABEL_21;
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue([v7 assetVersion]);

      if (v18)
      {
LABEL_16:
        unsigned __int8 v8 = 0;
        goto LABEL_22;
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 assetType]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
      if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v10, v12))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([(id)v5 assetSpecifier]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSpecifier]);
        unsigned __int8 v8 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v14, v16);
        goto LABEL_11;
      }
    }

    unsigned __int8 v8 = 0;
    goto LABEL_20;
  }

- (SUCoreLog)logger
{
  return self->_logger;
}

- (id)summary
{
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsAwaitingTrigger](self, "jobsAwaitingTrigger"));
  id v18 = [v20 count];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector"));
  id v17 = [v19 count];
  int64_t v16 = -[MADAutoAssetScheduler jobsAwaitingPushTrigger](self, "jobsAwaitingPushTrigger");
  id v15 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  -[MADAutoAssetScheduler activityIntervalSecs](self, "activityIntervalSecs"));
  id v3 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  -[MADAutoAssetScheduler tickerIntervalSecs](self, "tickerIntervalSecs"));
  if (-[MADAutoAssetScheduler activityTickerFired](self, "activityTickerFired")) {
    v4 = @"Y";
  }
  else {
    v4 = @"N";
  }
  id v5 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  -[MADAutoAssetScheduler pushDelaySecs](self, "pushDelaySecs"));
  int64_t v6 = -[MADAutoAssetScheduler pushCounter](self, "pushCounter");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler lastTickTimestampString](self, "lastTickTimestampString"));
  if (v7) {
    unsigned __int8 v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler lastTickTimestampString](self, "lastTickTimestampString"));
  }
  else {
    unsigned __int8 v8 = @"N";
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler nameForXPCStatus:]( &OBJC_CLASS___MADAutoAssetScheduler,  "nameForXPCStatus:",  -[MADAutoAssetScheduler scheduledJobsXPCActivity](self, "scheduledJobsXPCActivity")));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler nameForXPCStatus:]( &OBJC_CLASS___MADAutoAssetScheduler,  "nameForXPCStatus:",  -[MADAutoAssetScheduler pushJobsXPCActivity](self, "pushJobsXPCActivity")));
  unsigned int v11 = -[MADAutoAssetScheduler tickerIntervalReRegistering](self, "tickerIntervalReRegistering");
  v12 = @"Y";
  if (!v11) {
    v12 = @"N";
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[jobsAwaitingTrigger:%ld,jobsBySelector:%ld,jobsAwaitingPushTrigger:%ld|activityInterval:%@,tickerInterval:%@,tickerFired:%@,pushDelay:%@,pushCounter:%ld,lastTick:%@|[xpcActivity]scheduled:%@,push:%@|[issueReRegister]scheduled:%@]",  v18,  v17,  v16,  v15,  v3,  v4,  v5,  v6,  v8,  v9,  v10,  v12));

  if (v7) {
  return v13;
  }
}

- (NSMutableDictionary)jobsBySelector
{
  return self->_jobsBySelector;
}

- (int64_t)jobsAwaitingPushTrigger
{
  return self->_jobsAwaitingPushTrigger;
}

- (int64_t)activityIntervalSecs
{
  return self->_activityIntervalSecs;
}

- (int64_t)tickerIntervalSecs
{
  return self->_tickerIntervalSecs;
}

- (BOOL)activityTickerFired
{
  return self->_activityTickerFired;
}

- (int64_t)pushDelaySecs
{
  return self->_pushDelaySecs;
}

- (int64_t)pushCounter
{
  return self->_pushCounter;
}

- (NSString)lastTickTimestampString
{
  return self->_lastTickTimestampString;
}

- (int64_t)scheduledJobsXPCActivity
{
  return self->_scheduledJobsXPCActivity;
}

+ (id)nameForXPCStatus:(int64_t)a3
{
  else {
    return *(&off_34E4D8 + a3);
  }
}

- (int64_t)pushJobsXPCActivity
{
  return self->_pushJobsXPCActivity;
}

- (BOOL)tickerIntervalReRegistering
{
  return self->_tickerIntervalReRegistering;
}

+ (id)newSetPolicyForDomainName:(id)a3 forAssetSetIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler autoAssetScheduler](&OBJC_CLASS___MADAutoAssetScheduler, "autoAssetScheduler"));
  unsigned __int8 v8 = v7;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  id v24 = 0LL;
  if (v7)
  {
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 schedulerQueue]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __73__MADAutoAssetScheduler_newSetPolicyForDomainName_forAssetSetIdentifier___block_invoke;
    v14[3] = &unk_34E2E0;
    id v18 = &v19;
    id v15 = v8;
    id v16 = v5;
    id v17 = v6;
    dispatch_sync(v9, v14);

    v10 = v15;
  }

  else
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler newSetPolicyForDomainName:forAssetSetIdentifier:].cold.1();
    }
  }

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __73__MADAutoAssetScheduler_newSetPolicyForDomainName_forAssetSetIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _newSetPolicyForDomainName:*(void *)(a1 + 40) forAssetSetIdentifier:*(void *)(a1 + 48) fromLocation:@"newSetPolicyForDomainName"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_newSetPolicyForDomainName:(id)a3 forAssetSetIdentifier:(id)a4 fromLocation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unsigned int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v11);

  id v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:_newSetPolicyForDomainName",  v8);
  id v13 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:",  v10,  v9);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 persistedEntryID]);
  id v16 = [v14 safeObjectForKey:v15 ofClass:objc_opt_class(MADAutoAssetScheduledJob)];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if (v17)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 persistedEntryID]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 persistedEntry:v18 fromLocation:v12]);

    if ([v20 BOOLeanForKey:@"setJob"])
    {
      id v21 = [v20 secureCodedObjectForKey:@"setPolicy" ofClass:objc_opt_class(MADAutoSetPolicy)];
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      if (!v22) {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler defaultSchedulerSetPolicy](self, "defaultSchedulerSetPolicy"));
      }
      v23 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetPolicy);
      -[MANAutoAssetSetPolicy setUserInitiated:](v23, "setUserInitiated:", [v22 userInitiated]);
      -[MANAutoAssetSetPolicy setLockInhibitsEmergencyRemoval:]( v23,  "setLockInhibitsEmergencyRemoval:",  [v22 lockInhibitsEmergencyRemoval]);
      -[MANAutoAssetSetPolicy setAllowCheckDownloadOnBattery:]( v23,  "setAllowCheckDownloadOnBattery:",  [v22 allowCheckDownloadOnBattery]);
      -[MANAutoAssetSetPolicy setAllowCheckDownloadWhenBatteryLow:]( v23,  "setAllowCheckDownloadWhenBatteryLow:",  [v22 allowCheckDownloadWhenBatteryLow]);
      -[MANAutoAssetSetPolicy setAllowCheckDownloadWhenCPUHigh:]( v23,  "setAllowCheckDownloadWhenCPUHigh:",  [v22 allowCheckDownloadWhenCPUHigh]);
      -[MANAutoAssetSetPolicy setAllowCheckDownloadOverExpensive:]( v23,  "setAllowCheckDownloadOverExpensive:",  [v22 allowCheckDownloadOverExpensive]);
      -[MANAutoAssetSetPolicy setAllowCheckDownloadOverCellular:]( v23,  "setAllowCheckDownloadOverCellular:",  [v22 allowCheckDownloadOverCellular]);
      -[MANAutoAssetSetPolicy setBlockCheckDownload:]( v23,  "setBlockCheckDownload:",  [v22 blockCheckDownload]);
    }

    else
    {
      v23 = 0LL;
    }
  }

  else
  {
    v23 = 0LL;
  }

  return v23;
}

- (MADAutoAssetPersisted)persistedState
{
  return self->_persistedState;
}

- (id)defaultSchedulerSetPolicy
{
  if (defaultSchedulerSetPolicy_dispatchOnceSchedulerDefaultSetPolicy != -1) {
    dispatch_once(&defaultSchedulerSetPolicy_dispatchOnceSchedulerDefaultSetPolicy, &__block_literal_global_780);
  }
  return (id)defaultSchedulerSetPolicy___defaultSetPolicy;
}

+ (void)shutdown
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler autoAssetScheduler](&OBJC_CLASS___MADAutoAssetScheduler, "autoAssetScheduler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 logger]);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "{AUTO-SCHEDULER:shutdown}: Dispatching shutdown request for autoAssetScheduler",  buf,  2u);
  }

  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 schedulerQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __33__MADAutoAssetScheduler_shutdown__block_invoke;
  block[3] = &unk_34DBC0;
  id v6 = v2;
  id v10 = v6;
  dispatch_sync(v5, block);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 logger]);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "{AUTO-SCHEDULER:shutdown}: Successfully shut down autoAssetScheduler",  buf,  2u);
  }
}

void __33__MADAutoAssetScheduler_shutdown__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "{AUTO-SCHEDULER:shutdown}: Shutdown request running on queue",  v5,  2u);
  }

  v4 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) schedulerQueue]);
  dispatch_suspend(v4);
}

- (MADAutoAssetScheduler)init
{
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___MADAutoAssetScheduler;
  id v2 = -[MADAutoAssetScheduler init](&v44, "init");
  if (v2)
  {
    uint64_t v3 = -[SUCoreLog initWithCategory:]( objc_alloc(&OBJC_CLASS___SUCoreLog),  "initWithCategory:",  @"AUTO-SCHEDULER");
    logger = v2->_logger;
    v2->_logger = v3;

    id v5 = (const char *)[@"com.apple.MobileAsset.daemon.autoassetscheduler" UTF8String];
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(v5, v7);
    schedulerQueue = v2->_schedulerQueue;
    v2->_schedulerQueue = (OS_dispatch_queue *)v8;

    id v10 = -[MADAutoAssetPersisted initForModule:ofModuleVersion:usingDispatchQueue:usingLogger:loggingByName:withVersionMigrator:]( objc_alloc(&OBJC_CLASS___MADAutoAssetPersisted),  "initForModule:ofModuleVersion:usingDispatchQueue:usingLogger:loggingByName:withVersionMigrator:",  @"AutoAssetScheduler",  @"1.0",  v2->_schedulerQueue,  v2->_logger,  0LL,  &__block_literal_global_6);
    persistedState = v2->_persistedState;
    v2->_persistedState = v10;

    id v12 = (dispatch_queue_s *)v2->_schedulerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __29__MADAutoAssetScheduler_init__block_invoke_2;
    block[3] = &unk_34DBC0;
    id v13 = v2;
    v43 = v13;
    dispatch_sync(v12, block);
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    jobsAwaitingTrigger = v13->_jobsAwaitingTrigger;
    v13->_jobsAwaitingTrigger = v14;

    v13->_jobsAwaitingPushTrigger = 0LL;
    id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    jobsBySelector = v13->_jobsBySelector;
    v13->_jobsBySelector = v16;

    v13->_globalActivityInterval = 0;
    v13->_uint64_t activityIntervalSecs = 86400LL;
    unint64_t v18 = +[MADAutoAssetScheduler _preferenceChosenTickerIntervalSecs]( &OBJC_CLASS___MADAutoAssetScheduler,  "_preferenceChosenTickerIntervalSecs");
    if ((v18 & 0x8000000000000000LL) != 0)
    {
      uint64_t activityIntervalSecs = v13->_activityIntervalSecs;
    }

    else
    {
      uint64_t activityIntervalSecs = v18;
      v13->_globalActivityInterval = 1;
      if (v18)
      {
        if (v18 <= 0x3B) {
          uint64_t activityIntervalSecs = 60LL;
        }
        v13->_uint64_t activityIntervalSecs = activityIntervalSecs;
      }

      else
      {
        v13->_uint64_t activityIntervalSecs = 0LL;
      }
    }

    int64_t v20 = +[MADAutoAssetScheduler tickerIntervalForActivityIntervalSecs:]( &OBJC_CLASS___MADAutoAssetScheduler,  "tickerIntervalForActivityIntervalSecs:",  activityIntervalSecs);
    *(_WORD *)&v13->_tickerIntervalReRegistering = 0;
    v13->_tickerIntervalSecs = v20;
    v13->_pushDelaySecs = 0LL;
    v13->_pushCounter = 0LL;
    v13->_scheduledJobsXPCActivity = 0LL;
    scheduledJobsBackupTriggerTimer = v13->_scheduledJobsBackupTriggerTimer;
    v13->_scheduledJobsBackupTriggerTimer = 0LL;

    lastTickTimestampString = v13->_lastTickTimestampString;
    v13->_pushJobsXPCActivity = 0LL;
    v13->_lastTickTimestampString = 0LL;

    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler assetTypesAtHeightenedFrequency]( &OBJC_CLASS___MADAutoAssetScheduler,  "assetTypesAtHeightenedFrequency"));
    p_schedulerIntervalHeightenedAssetTypes = &v13->_schedulerIntervalHeightenedAssetTypes;
    schedulerIntervalHeightenedAssetTypes = v13->_schedulerIntervalHeightenedAssetTypes;
    v13->_schedulerIntervalHeightenedAssetTypes = (NSSet *)v23;

    v26 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager preferenceActivityHeightenedAssetType]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceActivityHeightenedAssetType"));
    if (v26)
    {
      v27 = -[NSMutableSet initWithSet:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithSet:",  *p_schedulerIntervalHeightenedAssetTypes);
      v28 = v27;
      if (v27)
      {
        -[NSMutableSet addObject:](v27, "addObject:", v26);
        objc_storeStrong((id *)&v13->_schedulerIntervalHeightenedAssetTypes, v28);
      }
    }

    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SUCoreLog oslog](v2->_logger, "oslog"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *p_schedulerIntervalHeightenedAssetTypes;
      *(_DWORD *)buf = 138543362;
      v46 = v30;
      _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_DEFAULT,  "{AUTO-SCHEDULER:init} HEIGHTENED trigger frequency | schedulerIntervalHeightenedAssetTypes:\n%{public}@",  buf,  0xCu);
    }

    uint64_t v31 = objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler assetTypesAtAggressiveFrequency]( &OBJC_CLASS___MADAutoAssetScheduler,  "assetTypesAtAggressiveFrequency"));
    p_schedulerIntervalAggressiveAssetTypes = &v13->_schedulerIntervalAggressiveAssetTypes;
    schedulerIntervalAggressiveAssetTypes = v13->_schedulerIntervalAggressiveAssetTypes;
    v13->_schedulerIntervalAggressiveAssetTypes = (NSSet *)v31;

    v34 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager preferenceActivityAggressiveAssetType]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceActivityAggressiveAssetType"));
    if (v34)
    {
      v35 = -[NSMutableSet initWithSet:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithSet:",  *p_schedulerIntervalAggressiveAssetTypes);
      v36 = v35;
      if (v35)
      {
        -[NSMutableSet addObject:](v35, "addObject:", v34);
        objc_storeStrong((id *)&v13->_schedulerIntervalAggressiveAssetTypes, v36);
      }
    }

    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SUCoreLog oslog](v2->_logger, "oslog"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = *p_schedulerIntervalAggressiveAssetTypes;
      *(_DWORD *)buf = 138543362;
      v46 = v38;
      _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_DEFAULT,  "{AUTO-SCHEDULER:init} AGGRESSIVE trigger frequency | schedulerIntervalAggressiveAssetTypes:\n%{public}@",  buf,  0xCu);
    }

    v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    setConfigurations = v13->_setConfigurations;
    v13->_setConfigurations = v39;
  }

  return v2;
}

NSDictionary *__cdecl __29__MADAutoAssetScheduler_init__block_invoke( id a1,  NSString *a2,  NSString *a3,  NSDictionary *a4)
{
  return (NSDictionary *)+[MADAutoAssetScheduler migrateMismatchedPersistedStateVersion:forEntryID:withMismatchedState:]( &OBJC_CLASS___MADAutoAssetScheduler,  "migrateMismatchedPersistedStateVersion:forEntryID:withMismatchedState:",  a2,  a3,  a4);
}

id __29__MADAutoAssetScheduler_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) flushPersistedStateCacheAndSetCachingBehaviour:1];
}

+ (id)assetTypesAtHeightenedFrequency
{
  return -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", &off_38FA78);
}

+ (id)assetTypesAtAggressiveFrequency
{
  return -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", &off_38FA90);
}

void __43__MADAutoAssetScheduler_autoAssetScheduler__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MADAutoAssetScheduler);
  id v2 = (void *)autoAssetScheduler___autoAssetScheduler;
  autoAssetScheduler___autoAssetScheduler = (uint64_t)v1;
}

+ (void)resumeFromPersisted:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler autoAssetScheduler](&OBJC_CLASS___MADAutoAssetScheduler, "autoAssetScheduler"));
  id v5 = v4;
  if (v4)
  {
    dispatch_queue_attr_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 schedulerQueue]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = __45__MADAutoAssetScheduler_resumeFromPersisted___block_invoke_676;
    v8[3] = &unk_34DB98;
    id v9 = v5;
    id v10 = v3;
    dispatch_async(v6, v8);
  }

  else
  {
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager selectDispatchQueue:]( &OBJC_CLASS___MADAutoAssetControlManager,  "selectDispatchQueue:",  0LL));
    dispatch_async(v7, &__block_literal_global_675);
  }
}

void __45__MADAutoAssetScheduler_resumeFromPersisted___block_invoke(id a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue([v1 oslog]);

  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__MADAutoAssetScheduler_resumeFromPersisted___block_invoke_cold_1();
  }

  +[MADAutoAssetControlManager schedulerResumed:](&OBJC_CLASS___MADAutoAssetControlManager, "schedulerResumed:", 0LL);
}

void __45__MADAutoAssetScheduler_resumeFromPersisted___block_invoke_676(uint64_t a1)
{
  uint64_t v1 = a1;
  [*(id *)(a1 + 32) _trackSetConfigurations:*(void *)(a1 + 40)];
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) persistedState]);
  [v2 loadPersistedState:@"resumeFromPersisted"];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) persistedState]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 persistedEntryIDs:@"resumeFromPersisted"]);

  uint64_t v83 = v1;
  if ([v4 count])
  {
    __int128 v97 = 0u;
    __int128 v98 = 0u;
    __int128 v95 = 0u;
    __int128 v96 = 0u;
    v80 = v4;
    id obj = v4;
    id v88 = [obj countByEnumeratingWithState:&v95 objects:v117 count:16];
    if (!v88) {
      goto LABEL_59;
    }
    uint64_t v87 = *(void *)v96;
    while (1)
    {
      id v5 = 0LL;
      do
      {
        if (*(void *)v96 != v87) {
          objc_enumerationMutation(obj);
        }
        dispatch_queue_attr_t v6 = *(__CFString **)(*((void *)&v95 + 1) + 8LL * (void)v5);
        v7 = objc_autoreleasePoolPush();
        dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) persistedState]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 persistedEntry:v6 fromLocation:@"resumeFromPersisted"]);

        if (v9)
        {
          v91 = v7;
          id v10 = [v9 secureCodedObjectForKey:@"assetSelector" ofClass:objc_opt_class(MAAutoAssetSelector)];
          unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          id v12 = (__CFString *)[v9 ullForKey:@"intervalSecs"];
          id v13 = [v9 ullForKey:@"remainingSecs"];
          unsigned int v14 = [v9 BOOLeanForKey:@"pushJob"];
          unsigned __int8 v15 = [v9 BOOLeanForKey:@"requiringRetry"];
          id v16 = [v9 BOOLeanForKey:@"setJob"];
          unsigned __int8 v86 = v15;
          if ((_DWORD)v16)
          {
            id v17 = [v9 secureCodedObjectForKey:@"setPolicy" ofClass:objc_opt_class(MADAutoSetPolicy)];
            uint64_t v90 = objc_claimAutoreleasedReturnValue(v17);
            id v18 = [v9 secureCodedObjectForKey:@"pushedPolicy" ofClass:objc_opt_class(MADAutoSetPolicy)];
            uint64_t v89 = objc_claimAutoreleasedReturnValue(v18);
            v92 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) _setConfigurationForAssetSelector:v11]);
            if (v11) {
              goto LABEL_10;
            }
LABEL_22:
            v27 = @"N";
            v32 = @"N";
            v33 = @"N";
LABEL_31:
            v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) persistedState]);
            [v38 removePersistedEntry:v6 fromLocation:@"resumeFromPersisted"];

            v39 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) logger]);
            v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 oslog]);

            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) summary]);
              *(_DWORD *)buf = 138544386;
              uint64_t v100 = (uint64_t)v42;
              __int16 v101 = 2114;
              v102 = v6;
              __int16 v103 = 2112;
              uint64_t v104 = (uint64_t)v33;
              __int16 v105 = 2112;
              v106 = v27;
              __int16 v107 = 2112;
              v108 = v32;
              _os_log_error_impl( &dword_0,  v40,  OS_LOG_TYPE_ERROR,  "%{public}@ | {AUTO-SCHEDULER:resumeFromPersisted} removed corrupted entry:%{public}@ | assetSelector:%@, assetType:%@, assetSpecifier:%@",  buf,  0x34u);
            }

LABEL_34:
            uint64_t v31 = (void *)v90;
            v7 = v91;
            v41 = (void *)v89;
            goto LABEL_35;
          }

          v92 = 0LL;
          uint64_t v89 = 0LL;
          uint64_t v90 = 0LL;
          if (!v11) {
            goto LABEL_22;
          }
LABEL_10:
          unsigned int v84 = v14;
          uint64_t v19 = objc_claimAutoreleasedReturnValue([v11 assetType]);
          if (v19)
          {
            int64_t v20 = (void *)v19;
            uint64_t v21 = objc_claimAutoreleasedReturnValue([v11 assetSpecifier]);
            if (v21)
            {
              v22 = (void *)v21;
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v11 assetVersion]);

              uint64_t v1 = v83;
              if (!v23)
              {
                if (v92) {
                  int v24 = 0;
                }
                else {
                  int v24 = (int)v16;
                }
                if (v24 == 1)
                {
                  v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 32) persistedState]);
                  [v25 removePersistedEntry:v6 fromLocation:@"resumeFromPersisted(NOT-CONFIGURED)"];

                  v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 32) logger]);
                  v27 = (__CFString *)objc_claimAutoreleasedReturnValue([v26 oslog]);

                  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
                  {
                    v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 32) summary]);
                    v29 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
                    *(_DWORD *)buf = 138543874;
                    uint64_t v100 = (uint64_t)v28;
                    __int16 v101 = 2114;
                    v102 = v6;
                    __int16 v103 = 2112;
                    uint64_t v104 = (uint64_t)v29;
                    _os_log_error_impl( &dword_0,  (os_log_t)v27,  OS_LOG_TYPE_ERROR,  "%{public}@ | {AUTO-SCHEDULER:resumeFromPersisted} removed not-configured entry:%{public}@ | assetSelector:%@",  buf,  0x20u);
                  }

                  goto LABEL_34;
                }

                v43 = (void *)objc_claimAutoreleasedReturnValue([v11 assetType]);
                unsigned int v44 = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v43,  @"com.apple.UnifiedAssetFramework");

                if (v44)
                {
                  else {
                    uint64_t v45 = (uint64_t)v12;
                  }
                  uint64_t v46 = 14400LL;
                  id v81 = (id)v45;
                  id v82 = (id)v46;
                  unsigned int v47 = v84;
                  if (!(_DWORD)v16 || (uint64_t)v12 > 86400 || (uint64_t)v13 >= 14401)
                  {
                    v48 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 32) logger]);
                    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 oslog]);

                    unsigned int v47 = v84;
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v50 = objc_claimAutoreleasedReturnValue([*(id *)(v83 + 32) summary]);
                      uint64_t v51 = objc_claimAutoreleasedReturnValue([v11 summary]);
                      *(_DWORD *)buf = 138545410;
                      v52 = @"N";
                      if ((_DWORD)v16) {
                        v52 = @"Y";
                      }
                      v53 = (void *)v50;
                      uint64_t v100 = v50;
                      __int16 v101 = 2114;
                      v102 = v6;
                      __int16 v103 = 2112;
                      uint64_t v104 = v51;
                      v54 = (void *)v51;
                      __int16 v105 = 2114;
                      v106 = (__CFString *)v52;
                      __int16 v107 = 2048;
                      v108 = v12;
                      __int16 v109 = 2048;
                      id v110 = v13;
                      __int16 v111 = 2114;
                      v112 = @"Y";
                      __int16 v113 = 2048;
                      id v114 = v81;
                      __int16 v115 = 2048;
                      id v116 = v82;
                      _os_log_impl( &dword_0,  v49,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:resumeFromPersisted} migrated set-job entry:%{public}@ | assetSelec tor:%@ | (fromPersisted)setJob:%{public}@,intervalSecs:%ld,remainingSecs:%ld | (alteringTo)setJo b:%{public}@,intervalSecs:%ld,remainingSecs:%ld",  buf,  0x5Cu);

                      unsigned int v47 = v84;
                    }
                  }

                  id v16 = &dword_0 + 1;
                }

                else
                {
                  id v81 = v12;
                  id v82 = v13;
                  unsigned int v47 = v84;
                }

                v7 = v91;
                v41 = (void *)v89;
                if (v47) {
                  objc_msgSend( *(id *)(v83 + 32),  "setJobsAwaitingPushTrigger:",  (char *)objc_msgSend(*(id *)(v83 + 32), "jobsAwaitingPushTrigger") + 1);
                }
                LOBYTE(v79) = v86;
                uint64_t v31 = (void *)v90;
                LOBYTE(v77) = (_BYTE)v16;
                [*(id *)(v83 + 32) _logPersistedEntry:@"resumeFromPersisted" operation:@"ENTRY_LOAD" persistingSelector:v11 intervalSecs:v81 remainingSecs:v82 pushedJob:v84 setJob:v77 setPolicy:v90  pushedPolicy:v89 requiringRetry:v79 message:@"resumed scheduled job"];
                LOWORD(v78) = 0;
                objc_msgSend( *(id *)(v83 + 32),  "_scheduleSelector:triggeringAtIntervalSecs:withRemainingSecs:forPushedJob:forSetJob:withSetPolicy:trig geringIfLearned:resettingRemaining:",  v11,  v81,  v82,  v84,  v16,  v90,  v78);
LABEL_35:

                goto LABEL_36;
              }
            }

            else
            {

              uint64_t v1 = v83;
            }
          }

          v34 = (void *)objc_claimAutoreleasedReturnValue([v11 assetType]);
          v33 = @"Y";
          if (v34) {
            v35 = @"Y";
          }
          else {
            v35 = @"N";
          }
          v27 = v35;

          v36 = (void *)objc_claimAutoreleasedReturnValue([v11 assetSpecifier]);
          if (v36) {
            v37 = @"Y";
          }
          else {
            v37 = @"N";
          }
          v32 = v37;

          goto LABEL_31;
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) logger]);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v30 oslog]);

        if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_37;
        }
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) summary]);
        *(_DWORD *)buf = 138543618;
        uint64_t v100 = (uint64_t)v31;
        __int16 v101 = 2114;
        v102 = v6;
        _os_log_error_impl( &dword_0,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "%{public}@ | {AUTO-SCHEDULER:resumeFromPersisted} unable to determine previous status for entry:%{public}@",  buf,  0x16u);
LABEL_36:

LABEL_37:
        objc_autoreleasePoolPop(v7);
        id v5 = (char *)v5 + 1;
      }

      while (v88 != v5);
      id v55 = [obj countByEnumeratingWithState:&v95 objects:v117 count:16];
      id v88 = v55;
      if (!v55)
      {
LABEL_59:

        v56 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) jobsBySelector]);
        v57 = (__CFString *)[v56 count];

        v58 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) _snapshotOfJobsBySelector]);
        v59 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) logger]);
        v60 = (os_log_s *)objc_claimAutoreleasedReturnValue([v59 oslog]);

        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) summary]);
          v62 = @"s";
          *(_DWORD *)buf = 138543874;
          uint64_t v100 = (uint64_t)v61;
          __int16 v101 = 2048;
          v102 = v57;
          __int16 v103 = 2114;
          uint64_t v104 = (uint64_t)v62;
          _os_log_impl( &dword_0,  v60,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:resumeFromPersisted} %ld job%{public}@ scheduled | MA_MILESTONE",  buf,  0x20u);
        }

        v4 = v80;
        goto LABEL_67;
      }
    }
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) logger]);
  v60 = (os_log_s *)objc_claimAutoreleasedReturnValue([v63 oslog]);

  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 32) summary]);
    *(_DWORD *)buf = 138543362;
    uint64_t v100 = (uint64_t)v64;
    _os_log_impl( &dword_0,  v60,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:resumeFromPersisted} no jobs scheduled | MA_MILESTONE",  buf,  0xCu);
  }

  v58 = 0LL;
LABEL_67:

  [*(id *)(v1 + 32) _logPersistedTableOfContents:@"resumeFromPersisted"];
  uint64_t v65 = +[MADAutoAssetScheduler _preferenceChosenTickerIntervalSecs]( &OBJC_CLASS___MADAutoAssetScheduler,  "_preferenceChosenTickerIntervalSecs");
  if (v65 < 0) {
    v66 = (__CFString *)&loc_15180;
  }
  else {
    v66 = (__CFString *)v65;
  }
  if ((uint64_t)v66 < 1)
  {
    v67 = @"DISABLED";
  }

  else if (v66 == [*(id *)(v1 + 32) activityIntervalSecs])
  {
    v67 = +[MADAutoAssetControlManager allocIntervalString:]( MADAutoAssetControlManager,  "allocIntervalString:",  [*(id *)(v1 + 32) activityIntervalSecs]);
  }

  else
  {
    v68 = objc_alloc(&OBJC_CLASS___NSString);
    id v69 = +[MADAutoAssetControlManager allocIntervalString:]( MADAutoAssetControlManager,  "allocIntervalString:",  [*(id *)(v1 + 32) activityIntervalSecs]);
    id v70 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  v66);
    v67 = -[NSString initWithFormat:](v68, "initWithFormat:", @"%@ (previously %@)", v69, v70);
  }

  else {
    v71 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  900LL);
  }
  v72 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 32) logger]);
  v73 = (os_log_s *)objc_claimAutoreleasedReturnValue([v72 oslog]);

  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v83 + 32) summary]);
    *(_DWORD *)buf = 138544130;
    uint64_t v100 = (uint64_t)v74;
    __int16 v101 = 2114;
    v102 = v67;
    __int16 v103 = 2114;
    uint64_t v104 = (uint64_t)v71;
    __int16 v105 = 2048;
    v106 = v66;
    _os_log_impl( &dword_0,  v73,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:resumeFromPersisted} registering auto-asset-scheduler XPC Activity | activityInterval :%{public}@, pushDelay:%{public}@, intervalSecs:%ld",  buf,  0x2Au);
  }

  [*(id *)(v83 + 32) _registerForAndStartActivity:v66];
  [*(id *)(v83 + 32) _logPersistedConfigLoad:@"resumeFromPersisted" activityIntervalSecs:v66 pushTriggerSecs:900 lastTickDate:0 message:@"completed resuming of auto-asset-scheduler"];
  [*(id *)(v83 + 32) _resumeConnector];
  v75 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager selectDispatchQueue:]( &OBJC_CLASS___MADAutoAssetControlManager,  "selectDispatchQueue:",  0LL));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __45__MADAutoAssetScheduler_resumeFromPersisted___block_invoke_709;
  block[3] = &unk_34DBC0;
  id v94 = v58;
  id v76 = v58;
  dispatch_async(v75, block);
}

id __45__MADAutoAssetScheduler_resumeFromPersisted___block_invoke_709(uint64_t a1)
{
  return +[MADAutoAssetControlManager schedulerResumed:]( &OBJC_CLASS___MADAutoAssetControlManager,  "schedulerResumed:",  *(void *)(a1 + 32));
}

+ (int64_t)persistedScheduledCount
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler autoAssetScheduler](&OBJC_CLASS___MADAutoAssetScheduler, "autoAssetScheduler"));
  id v3 = v2;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  uint64_t v15 = -1LL;
  if (v2)
  {
    v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 schedulerQueue]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __48__MADAutoAssetScheduler_persistedScheduledCount__block_invoke;
    v9[3] = &unk_34DB48;
    unsigned int v11 = &v12;
    id v10 = v3;
    dispatch_sync(v4, v9);

    id v5 = v10;
  }

  else
  {
    dispatch_queue_attr_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler persistedScheduledCount].cold.1();
    }
  }

  int64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__MADAutoAssetScheduler_persistedScheduledCount__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistedState]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 persistedEntryCount:@"AUTO-SCHEDULER"];
}

+ (void)scheduleSelector:(id)a3 triggeringAtIntervalSecs:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    if (a4 < 0)
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      int64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetScheduler scheduleSelector:triggeringAtIntervalSecs:].cold.2();
      }
    }

    else
    {
      dispatch_queue_attr_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler autoAssetScheduler]( &OBJC_CLASS___MADAutoAssetScheduler,  "autoAssetScheduler"));
      int64_t v7 = v6;
      if (v6)
      {
        dispatch_queue_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[os_log_s schedulerQueue](v6, "schedulerQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __67__MADAutoAssetScheduler_scheduleSelector_triggeringAtIntervalSecs___block_invoke;
        block[3] = &unk_34E308;
        uint64_t v14 = v7;
        id v15 = v5;
        int64_t v16 = a4;
        dispatch_async(v8, block);

        id v9 = v14;
      }

      else
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          +[MADAutoAssetScheduler scheduleSelector:triggeringAtIntervalSecs:].cold.3(v5);
        }
      }
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    int64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler scheduleSelector:triggeringAtIntervalSecs:].cold.1();
    }
  }
}

id __67__MADAutoAssetScheduler_scheduleSelector_triggeringAtIntervalSecs___block_invoke(uint64_t a1)
{
  LOWORD(v2) = 1;
  return objc_msgSend( *(id *)(a1 + 32),  "_scheduleSelector:triggeringAtIntervalSecs:withRemainingSecs:forPushedJob:forSetJob:withSetPolicy:triggeringI fLearned:resettingRemaining:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 48),  0,  0,  0,  v2);
}

+ (void)scheduleSetDomainName:(id)a3 forAssetSetIdentifier:(id)a4 usingSetUpdatePolicy:(id)a5 forSetConfiguration:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v9)
  {
    if (v10)
    {
      if (v12)
      {
        id v14 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:",  v9,  v10);
        uint64_t v15 = objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler autoAssetScheduler](&OBJC_CLASS___MADAutoAssetScheduler, "autoAssetScheduler"));
        int64_t v16 = (void *)v15;
        if (v14)
        {
          if (v15)
          {
            uint64_t v17 = +[MADAutoAssetControlManager preferenceActivityIntervalSecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceActivityIntervalSecs");
            if (v17 <= 0) {
              uint64_t v18 = 604800LL;
            }
            else {
              uint64_t v18 = v17;
            }
            if (v11) {
              id v19 = -[MADAutoSetPolicy initFromAutoAssetSetPolicy:]( objc_alloc(&OBJC_CLASS___MADAutoSetPolicy),  "initFromAutoAssetSetPolicy:",  v11);
            }
            else {
              id v19 = 0LL;
            }
            v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 schedulerQueue]);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = __110__MADAutoAssetScheduler_scheduleSetDomainName_forAssetSetIdentifier_usingSetUpdatePolicy_forSetConfiguration___block_invoke;
            block[3] = &unk_34E330;
            id v28 = v9;
            id v29 = v10;
            id v30 = v16;
            id v31 = v13;
            id v33 = v19;
            uint64_t v34 = v18;
            id v32 = v14;
            int v24 = (os_log_s *)v19;
            dispatch_async(v26, block);
          }

          else
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
            int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              +[MADAutoAssetScheduler scheduleSetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:forSetConfiguration:].cold.5();
            }
          }
        }

        else
        {
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            +[MADAutoAssetScheduler scheduleSetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:forSetConfiguration:].cold.4();
          }
        }
      }

      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        id v14 = (id)objc_claimAutoreleasedReturnValue([v22 oslog]);

        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
          +[MADAutoAssetScheduler scheduleSetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:forSetConfiguration:].cold.3();
        }
      }
    }

    else
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v14 = (id)objc_claimAutoreleasedReturnValue([v21 oslog]);

      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetScheduler scheduleSetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:forSetConfiguration:].cold.2();
      }
    }
  }

  else
  {
    int64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v14 = (id)objc_claimAutoreleasedReturnValue([v20 oslog]);

    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler scheduleSetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:forSetConfiguration:].cold.1();
    }
  }
}

void __110__MADAutoAssetScheduler_scheduleSetDomainName_forAssetSetIdentifier_usingSetUpdatePolicy_forSetConfiguration___block_invoke( uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler persistedEntryIDForClientDomain:forAssetSetIdentifier:]( &OBJC_CLASS___MADAutoAssetScheduler,  "persistedEntryIDForClientDomain:forAssetSetIdentifier:",  *(void *)(a1 + 32),  *(void *)(a1 + 40)));
  if (v4)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) setConfigurations]);
    [v2 setSafeObject:*(void *)(a1 + 56) forKey:v4];
  }

  LOWORD(v3) = 1;
  objc_msgSend( *(id *)(a1 + 48),  "_scheduleSelector:triggeringAtIntervalSecs:withRemainingSecs:forPushedJob:forSetJob:withSetPolicy:triggeringIfLearne d:resettingRemaining:",  *(void *)(a1 + 64),  *(void *)(a1 + 80),  *(void *)(a1 + 80),  0,  1,  *(void *)(a1 + 72),  v3);
}

+ (void)triggerWithRetrySetDomainName:(id)a3 forAssetSetIdentifier:(id)a4 usingSetUpdatePolicy:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    if (v8)
    {
      id v10 = (os_log_s *)-[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:",  v7,  v8);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler autoAssetScheduler](&OBJC_CLASS___MADAutoAssetScheduler, "autoAssetScheduler"));
      id v12 = (void *)v11;
      if (v10)
      {
        if (v11)
        {
          if (v9) {

          }
          id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 schedulerQueue]);
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472LL;
          v19[2] = __98__MADAutoAssetScheduler_triggerWithRetrySetDomainName_forAssetSetIdentifier_usingSetUpdatePolicy___block_invoke;
          v19[3] = &unk_34E358;
          int64_t v20 = (os_log_s *)v7;
          id v21 = v8;
          id v22 = v12;
          id v23 = v9;
          dispatch_async(v13, v19);

          id v14 = v20;
        }

        else
        {
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            +[MADAutoAssetScheduler triggerWithRetrySetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:].cold.4();
          }
        }
      }

      else
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          +[MADAutoAssetScheduler triggerWithRetrySetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:].cold.3();
        }
      }
    }

    else
    {
      int64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetScheduler triggerWithRetrySetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:].cold.2();
      }
    }
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler triggerWithRetrySetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:].cold.1();
    }
  }
}

void __98__MADAutoAssetScheduler_triggerWithRetrySetDomainName_forAssetSetIdentifier_usingSetUpdatePolicy___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 32);
  uint64_t v3 = (void *)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler persistedEntryIDForClientDomain:forAssetSetIdentifier:]( &OBJC_CLASS___MADAutoAssetScheduler,  "persistedEntryIDForClientDomain:forAssetSetIdentifier:",  *(void *)(a1 + 32),  *(void *)(a1 + 40)));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) setConfigurations]);
    id v6 = [v5 safeObjectForKey:v4 ofClass:objc_opt_class(MADAutoSetConfiguration)];
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    if (v7)
    {
      [*(id *)(a1 + 48) _performTriggeredSetJobForSetConfiguration:v7 usingSetUpdatePolicy:*(void *)(a1 + 56)];
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __98__MADAutoAssetScheduler_triggerWithRetrySetDomainName_forAssetSetIdentifier_usingSetUpdatePolicy___block_invoke_cold_1( v2,  v3,  v9);
      }
    }
  }
}

+ (void)jobFinishedForSelector:(id)a3 withPotentialNetworkFailure:(BOOL)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler autoAssetScheduler]( &OBJC_CLASS___MADAutoAssetScheduler,  "autoAssetScheduler"));
    id v7 = v6;
    if (v6)
    {
      id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 schedulerQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __76__MADAutoAssetScheduler_jobFinishedForSelector_withPotentialNetworkFailure___block_invoke;
      block[3] = &unk_34E380;
      id v14 = v7;
      id v15 = v5;
      BOOL v16 = a4;
      dispatch_async(v8, block);

      id v9 = v14;
    }

    else
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
        *(_DWORD *)buf = 138543362;
        uint64_t v18 = v12;
        _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "{AUTO-SCHEDULER:jobFinishedForSelector} | no auto-asset-scheduler | selector:%{public}@",  buf,  0xCu);
      }
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler jobFinishedForSelector:withPotentialNetworkFailure:].cold.1();
    }
  }
}

id __76__MADAutoAssetScheduler_jobFinishedForSelector_withPotentialNetworkFailure___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _jobFinishedForSelector:*(void *)(a1 + 40) withPotentialNetworkFailure:*(unsigned __int8 *)(a1 + 48)];
}

+ (void)jobFinishedForSetDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withPotentialNetworkFailure:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler autoAssetScheduler]( &OBJC_CLASS___MADAutoAssetScheduler,  "autoAssetScheduler"));
      uint64_t v11 = v10;
      if (v10)
      {
        id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 schedulerQueue]);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = __103__MADAutoAssetScheduler_jobFinishedForSetDomainName_forAssetSetIdentifier_withPotentialNetworkFailure___block_invoke;
        v17[3] = &unk_34E3A8;
        uint64_t v18 = v11;
        id v19 = v7;
        id v20 = v9;
        BOOL v21 = a5;
        dispatch_async(v12, v17);

        id v13 = v18;
      }

      else
      {
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v23 = v7;
          __int16 v24 = 2114;
          v25 = v9;
          _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "{AUTO-SCHEDULER:jobFinishedForSetDomainName} | no auto-asset-scheduler | clientDomainName:%{public}@ | asset SetIdentifier:%{public}@",  buf,  0x16u);
        }
      }
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v15 oslog]);

      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetScheduler jobFinishedForSetDomainName:forAssetSetIdentifier:withPotentialNetworkFailure:].cold.2();
      }
    }
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v14 oslog]);

    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler jobFinishedForSetDomainName:forAssetSetIdentifier:withPotentialNetworkFailure:].cold.1();
    }
  }
}

id __103__MADAutoAssetScheduler_jobFinishedForSetDomainName_forAssetSetIdentifier_withPotentialNetworkFailure___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _jobFinishedForSetDomainName:*(void *)(a1 + 40) forAssetSetIdentifier:*(void *)(a1 + 48) withPotentialNetworkFailure:*(unsigned __int8 *)(a1 + 56)];
}

+ (void)schedulePushNotifications:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler autoAssetScheduler]( &OBJC_CLASS___MADAutoAssetScheduler,  "autoAssetScheduler"));
    id v5 = v4;
    if (v4)
    {
      id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 schedulerQueue]);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = __51__MADAutoAssetScheduler_schedulePushNotifications___block_invoke;
      v10[3] = &unk_34DB98;
      uint64_t v11 = v5;
      id v12 = v3;
      dispatch_async(v6, v10);

      id v7 = v11;
    }

    else
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetScheduler schedulePushNotifications:].cold.2(v3);
      }
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler schedulePushNotifications:].cold.1();
    }
  }
}

id __51__MADAutoAssetScheduler_schedulePushNotifications___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _schedulePushNotifications:*(void *)(a1 + 40)];
}

+ (void)controlEliminateSelector:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler autoAssetScheduler]( &OBJC_CLASS___MADAutoAssetScheduler,  "autoAssetScheduler"));
    id v5 = v4;
    if (v4)
    {
      id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 schedulerQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __50__MADAutoAssetScheduler_controlEliminateSelector___block_invoke_2;
      block[3] = &unk_34DB98;
      id v7 = &v13;
      id v13 = v5;
      id v14 = (dispatch_queue_s *)v3;
      dispatch_async(v6, block);

      id v8 = v14;
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[MADAutoAssetScheduler controlEliminateSelector:].cold.2(v3);
      }

      id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager selectDispatchQueue:]( &OBJC_CLASS___MADAutoAssetControlManager,  "selectDispatchQueue:",  0LL));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = __50__MADAutoAssetScheduler_controlEliminateSelector___block_invoke;
      v15[3] = &unk_34DBC0;
      id v7 = &v16;
      id v16 = v3;
      dispatch_async(v8, v15);
    }
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler controlEliminateSelector:].cold.1();
    }
  }
}

id __50__MADAutoAssetScheduler_controlEliminateSelector___block_invoke(uint64_t a1)
{
  return +[MADAutoAssetControlManager schedulerEliminatedSelector:]( &OBJC_CLASS___MADAutoAssetControlManager,  "schedulerEliminatedSelector:",  *(void *)(a1 + 32));
}

id __50__MADAutoAssetScheduler_controlEliminateSelector___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _eliminateSelector:*(void *)(a1 + 40) forSetJob:0 indicatingWhenEliminated:1];
}

+ (void)controlEliminateSetDomainName:(id)a3 forAssetSetIdentifier:(id)a4 indicatingWhenEliminated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:",  v7,  v8);
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler autoAssetScheduler]( &OBJC_CLASS___MADAutoAssetScheduler,  "autoAssetScheduler"));
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 schedulerQueue]);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = __102__MADAutoAssetScheduler_controlEliminateSetDomainName_forAssetSetIdentifier_indicatingWhenEliminated___block_invoke_2;
      v18[3] = &unk_34E3D0;
      id v13 = &v19;
      id v19 = v7;
      id v20 = (dispatch_queue_s *)v8;
      id v21 = v11;
      id v22 = v9;
      BOOL v23 = v5;
      dispatch_async(v12, v18);

      id v14 = v20;
LABEL_10:

      goto LABEL_11;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler controlEliminateSetDomainName:forAssetSetIdentifier:indicatingWhenEliminated:].cold.2(v9);
    }

    if (v5)
    {
      id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager selectDispatchQueue:]( &OBJC_CLASS___MADAutoAssetControlManager,  "selectDispatchQueue:",  0LL));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __102__MADAutoAssetScheduler_controlEliminateSetDomainName_forAssetSetIdentifier_indicatingWhenEliminated___block_invoke;
      block[3] = &unk_34DBC0;
      id v13 = &v25;
      id v25 = v9;
      dispatch_async(v14, block);
      goto LABEL_10;
    }
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler controlEliminateSetDomainName:forAssetSetIdentifier:indicatingWhenEliminated:].cold.1();
    }
  }

void __102__MADAutoAssetScheduler_controlEliminateSetDomainName_forAssetSetIdentifier_indicatingWhenEliminated___block_invoke( uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetType]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) assetSpecifier]);
  +[MADAutoAssetControlManager schedulerEliminatedSetDomainName:forAssetSetIdentifier:]( &OBJC_CLASS___MADAutoAssetControlManager,  "schedulerEliminatedSetDomainName:forAssetSetIdentifier:",  v3,  v2);
}

void __102__MADAutoAssetScheduler_controlEliminateSetDomainName_forAssetSetIdentifier_indicatingWhenEliminated___block_invoke_2( uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler persistedEntryIDForClientDomain:forAssetSetIdentifier:]( &OBJC_CLASS___MADAutoAssetScheduler,  "persistedEntryIDForClientDomain:forAssetSetIdentifier:",  *(void *)(a1 + 32),  *(void *)(a1 + 40)));
  if (v3)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) setConfigurations]);
    [v2 removeObjectForKey:v3];
  }

  [*(id *)(a1 + 48) _eliminateSelector:*(void *)(a1 + 56) forSetJob:1 indicatingWhenEliminated:*(unsigned __int8 *)(a1 + 64)];
}

- (void)_trackSetConfigurations:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v5);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v10);
        id v12 = objc_autoreleasePoolPush();
        if (v11)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 clientDomainName]);
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 assetSetIdentifier]);
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler persistedEntryIDForClientDomain:forAssetSetIdentifier:]( &OBJC_CLASS___MADAutoAssetScheduler,  "persistedEntryIDForClientDomain:forAssetSetIdentifier:",  v13,  v14));

          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler setConfigurations](self, "setConfigurations"));
          [v16 setSafeObject:v11 forKey:v15];
        }

        else
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[MADAutoAssetScheduler _trackSetConfigurations:].cold.1((uint64_t)v22, (uint64_t)self);
          }
        }

        objc_autoreleasePoolPop(v12);
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v8);
  }
}

- (id)_setConfigurationForAssetSelector:(id)a3
{
  id v28 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v4);

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler setConfigurations](self, "setConfigurations"));
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v30 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * v9);
      uint64_t v11 = objc_autoreleasePoolPush();
      if (!v10)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[MADAutoAssetScheduler _setConfigurationForAssetSelector:].cold.1((uint64_t)v37, (uint64_t)self);
        }
        goto LABEL_18;
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler setConfigurations](self, "setConfigurations"));
      id v13 = [v12 safeObjectForKey:v10 ofClass:objc_opt_class(MADAutoSetConfiguration)];
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);

      if (v14)
      {
        id v15 = p_ivars;
        id v16 = p_ivars[155];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s clientDomainName](v14, "clientDomainName"));
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v28 assetType]);
        if ((-[__objc2_ivar_list stringIsEqual:to:](v16, "stringIsEqual:to:", v17, v18) & 1) != 0)
        {
          uint64_t v19 = v7;
          v26 = v15[155];
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s assetSetIdentifier](v14, "assetSetIdentifier"));
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v28 assetSpecifier]);
          LOBYTE(v26) = -[__objc2_ivar_list stringIsEqual:to:](v26, "stringIsEqual:to:", v20, v21);

          if ((v26 & 1) != 0)
          {
            objc_autoreleasePoolPop(v11);
            goto LABEL_22;
          }

          uint64_t v7 = v19;
          goto LABEL_17;
        }
      }

      else
      {
        BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v23 oslog]);

        if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
        {
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = v24;
          __int16 v35 = 2114;
          uint64_t v36 = v10;
          _os_log_error_impl( &dword_0,  (os_log_t)v17,  OS_LOG_TYPE_ERROR,  "%{public}@ | {AUTO-SCHEDULER:_setConfigurationForAssetSelector} unable to access entry in self.setConfigurat ions | nextSetConfigurationKey:%{public}@",  buf,  0x16u);
        }
      }

LABEL_17:
      p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
LABEL_18:

      objc_autoreleasePoolPop(v11);
      if (v6 == (id)++v9)
      {
        id v6 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v14 = 0LL;
LABEL_22:

  return v14;
}

- (id)_snapshotOfJobsBySelector
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector"));
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v8);
        uint64_t v10 = objc_autoreleasePoolPush();
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector"));
        id v12 = [v11 safeObjectForKey:v9 ofClass:objc_opt_class(MADAutoAssetScheduledJob)];
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

        if (v13)
        {
          -[NSMutableArray addObject:](v4, "addObject:", v13);
        }

        else
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
          id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 oslog]);

          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[MADAutoAssetScheduler _snapshotOfJobsBySelector].cold.1((uint64_t)v23, (uint64_t)self);
          }
        }

        objc_autoreleasePoolPop(v10);
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v6);
  }

  if (-[NSMutableArray count](v4, "count")) {
    id v16 = v4;
  }
  else {
    id v16 = 0LL;
  }

  return v16;
}

- (void)_scheduleSelector:(id)a3 triggeringAtIntervalSecs:(int64_t)a4 withRemainingSecs:(int64_t)a5 forPushedJob:(BOOL)a6 forSetJob:(BOOL)a7 withSetPolicy:(id)a8 triggeringIfLearned:(BOOL)a9 resettingRemaining:(BOOL)a10
{
  unsigned int v76 = a7;
  BOOL v74 = a6;
  id v13 = a3;
  id v78 = a8;
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v14);

  v80 = v13;
  int64_t v15 = -[MADAutoAssetScheduler _decideTriggerIntervalSecs:forAssetSelector:]( self,  "_decideTriggerIntervalSecs:forAssetSelector:",  @"_scheduleSelector",  v13);
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  if (v15 >= a5) {
    int64_t v16 = a5;
  }
  else {
    int64_t v16 = v15;
  }
  int64_t v71 = v16;
  id v72 = (id)v15;
  __int128 v83 = 0uLL;
  __int128 v84 = 0uLL;
  uint64_t v79 = self;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsAwaitingTrigger](self, "jobsAwaitingTrigger"));
  id v18 = [v17 countByEnumeratingWithState:&v81 objects:v89 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v82;
LABEL_6:
    uint64_t v21 = 0LL;
    while (1)
    {
      if (*(void *)v82 != v20) {
        objc_enumerationMutation(v17);
      }
      __int128 v22 = *(void **)(*((void *)&v81 + 1) + 8 * v21);
      BOOL v23 = objc_autoreleasePoolPush();
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v22 assetSelector]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 persistedEntryID]);

      v26 = (void *)objc_claimAutoreleasedReturnValue([v22 assetSelector]);
      LODWORD(v24) = +[MADAutoAssetScheduler isSelector:consideredEqualTo:]( &OBJC_CLASS___MADAutoAssetScheduler,  "isSelector:consideredEqualTo:",  v80,  v26);

      if ((_DWORD)v24) {
        break;
      }

      objc_autoreleasePoolPop(v23);
      if (v19 == (id)++v21)
      {
        id v19 = [v17 countByEnumeratingWithState:&v81 objects:v89 count:16];
        if (v19) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }

    id v46 = [v22 intervalSecs];
    BOOL v47 = v46 != v72;
    if (v46 != v72) {
      [v22 setIntervalSecs:v72];
    }
    id v28 = v78;
    id v29 = v17;
    v27 = v80;
    if (a10 && [v22 remainingSecs] != v72)
    {
      [v22 setRemainingSecs:v72];
      BOOL v47 = 1;
    }

    if (([v22 pushedJob] & 1) == 0 && v74)
    {
      BOOL v47 = 1;
      [v22 setPushedJob:1];
      [v22 setPushedPolicy:v78];
      -[MADAutoAssetScheduler setJobsAwaitingPushTrigger:]( v79,  "setJobsAwaitingPushTrigger:",  (char *)-[MADAutoAssetScheduler jobsAwaitingPushTrigger](v79, "jobsAwaitingPushTrigger") + 1);
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue([v22 assetSelector]);
    unsigned __int8 v49 = [v80 isEqual:v48];

    if ((v49 & 1) == 0)
    {
      [v22 setAssetSelector:v80];
      BOOL v47 = 1;
    }

    if ([v22 setJob] != v76)
    {
      objc_msgSend(v22, "setSetJob:");
      BOOL v47 = 1;
    }

    if ([v22 setJob])
    {
      if (v78)
      {
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v22 setPolicy]);
        unsigned __int8 v51 = [v78 isEqual:v50];

        if ((v51 & 1) != 0) {
          goto LABEL_35;
        }
        [v22 setSetPolicy:v78];
      }

      else if (!v47)
      {
        goto LABEL_41;
      }

- (void)_schedulePushNotifications:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v5);

  id v88 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  __int128 v109 = 0u;
  __int128 v110 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v107 objects:v126 count:16];
  id v100 = v6;
  __int16 v101 = self;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v108;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v108 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v107 + 1) + 8LL * (void)i);
        id v12 = objc_autoreleasePoolPush();
        id v13 = [v6 safeObjectForKey:v11 ofClass:objc_opt_class(MAAutoAssetUpdatePolicy)];
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        int64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector"));
        id v16 = [v15 safeObjectForKey:v11 ofClass:objc_opt_class(MADAutoAssetScheduledJob)];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        if (v17)
        {
          if ([v17 pushedJob])
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
            id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v14 summary]);
              *(_DWORD *)buf = 138543874;
              v112 = v20;
              __int16 v113 = 2114;
              uint64_t v114 = v11;
              __int16 v115 = 2114;
              id v116 = v21;
              _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_schedulePushNotifications} requested push-notification not modified (alrea dy scheduled push-job) | pushSelectorKey:%{public}@ | pushPolicy:%{public}@",  buf,  0x20u);

              self = v101;
            }

            id v6 = v100;
          }

          else
          {
            -[NSMutableDictionary setSafeObject:forKey:](v88, "setSafeObject:forKey:", v14, v11);
          }
        }

        else
        {
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
          BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](v101, "summary"));
            id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 summary]);
            *(_DWORD *)buf = 138543874;
            v112 = v24;
            __int16 v113 = 2114;
            uint64_t v114 = v11;
            __int16 v115 = 2114;
            id v116 = v25;
            _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_schedulePushNotifications} requested push-notification dropped (no scheduled job) | pushSelectorKey:%{public}@ | pushPolicy:%{public}@",  buf,  0x20u);

            id v6 = v100;
          }

          self = v101;
        }

        objc_autoreleasePoolPop(v12);
      }

      id v8 = [v6 countByEnumeratingWithState:&v107 objects:v126 count:16];
    }

    while (v8);
  }

  v26 = v88;
  if (-[NSMutableDictionary count](v88, "count"))
  {
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    __int128 v103 = 0u;
    __int128 v104 = 0u;
    v27 = v88;
    id v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v103,  v125,  16LL);
    if (v28)
    {
      id v29 = v28;
      uint64_t v99 = *(void *)v104;
      __int128 v84 = v27;
      do
      {
        __int128 v30 = 0LL;
        id v85 = v29;
        do
        {
          if (*(void *)v104 != v99) {
            objc_enumerationMutation(v27);
          }
          uint64_t v31 = *(void *)(*((void *)&v103 + 1) + 8LL * (void)v30);
          __int128 v32 = objc_autoreleasePoolPush();
          id v33 = -[NSMutableDictionary safeObjectForKey:ofClass:]( v27,  "safeObjectForKey:ofClass:",  v31,  objc_opt_class(&OBJC_CLASS___MAAutoAssetUpdatePolicy));
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector"));
          id v36 = [v35 safeObjectForKey:v31 ofClass:objc_opt_class(MADAutoAssetScheduledJob)];
          v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

          if (v37)
          {
            if ([v37 pushedJob])
            {
              id v38 = v29;
              v39 = v27;
              uint64_t v40 = v31;
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
              id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v41 oslog]);

              log = v42;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                id v73 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
                __int128 v98 = v34;
                BOOL v74 = (void *)objc_claimAutoreleasedReturnValue([v34 summary]);
                *(_DWORD *)buf = 138543874;
                v112 = v73;
                __int16 v113 = 2114;
                uint64_t v114 = v40;
                __int16 v115 = 2114;
                id v116 = v74;
                _os_log_error_impl( &dword_0,  v42,  OS_LOG_TYPE_ERROR,  "%{public}@ | {AUTO-SCHEDULER:_schedulePushNotifications} trimmed push-notification when already push-j ob (ignored) | pushSelectorKey:%{public}@ | pushPolicy:%{public}@",  buf,  0x20u);

                uint64_t v34 = v98;
              }

              v27 = v39;
              id v29 = v38;
              id v6 = v100;
            }

            else
            {
              BOOL v47 = (void *)objc_claimAutoreleasedReturnValue([v37 assetSelector]);
              uint64_t v48 = objc_claimAutoreleasedReturnValue([v47 persistedEntryID]);

              if ([v34 checkForNewerIntervalSecs])
              {
                if ((uint64_t)[v34 checkForNewerIntervalSecs] >= 600)
                {
                  unsigned __int8 v49 = (_BYTE *)&loc_93A80;
                }

                else
                {
                  unsigned __int8 v49 = (_BYTE *)(&stru_248 + 16);
                }
              }

              else
              {
                unsigned __int8 v49 = (_BYTE *)(&stru_338 + 76);
              }

              v91 = v49;
              v92 = v32;
              if ([v34 newerFoundAutoDownloadJitterSecs])
              {
                if ((uint64_t)[v34 newerFoundAutoDownloadJitterSecs] >= 600)
                {
                  id v51 = [v34 newerFoundAutoDownloadJitterSecs];
                  unsigned int v50 = 604800;
                }

                else
                {
                  unsigned int v50 = 600;
                }
              }

              else
              {
                unsigned int v50 = 900;
              }

              uint32_t __upper_bound = v50;
              __int128 v97 = v34;
              -[MADAutoAssetScheduler setJobsAwaitingPushTrigger:]( self,  "setJobsAwaitingPushTrigger:",  (char *)-[MADAutoAssetScheduler jobsAwaitingPushTrigger](self, "jobsAwaitingPushTrigger") + 1);
              [v37 setPushedJob:1];
              v52 = objc_opt_new(&OBJC_CLASS___MADAutoSetPolicy);
              -[MADAutoSetPolicy setUserInitiated:](v52, "setUserInitiated:", 1LL);
              -[MADAutoSetPolicy setAllowCheckDownloadOnBattery:](v52, "setAllowCheckDownloadOnBattery:", 1LL);
              -[MADAutoSetPolicy setAllowCheckDownloadOverCellular:](v52, "setAllowCheckDownloadOverCellular:", 1LL);
              -[MADAutoSetPolicy setAllowCheckDownloadOverExpensive:](v52, "setAllowCheckDownloadOverExpensive:", 1LL);
              -[MADAutoSetPolicy setAllowCheckDownloadWhenCPUHigh:](v52, "setAllowCheckDownloadWhenCPUHigh:", 1LL);
              -[MADAutoSetPolicy setAllowCheckDownloadWhenBatteryLow:](v52, "setAllowCheckDownloadWhenBatteryLow:", 1LL);
              [v37 setPushedPolicy:v52];
              v53 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector"));
              [v53 setSafeObject:v37 forKey:v31];

              v54 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
              id v55 = (void *)objc_claimAutoreleasedReturnValue( [v54 persistedEntry:v48 fromLocation:@"_schedulePushNotifications"]);

              log = (void *)v48;
              uint64_t v89 = v55;
              if (v55)
              {
                unsigned __int8 v94 = [v55 BOOLeanForKey:@"requiringRetry"];
                [v55 persistBoolean:1 forKey:@"pushJob"];
                v56 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
                v57 = (void *)objc_claimAutoreleasedReturnValue([v37 summary]);
                [v56 storePersistedEntry:v48 withEntrySummary:v57 fromLocation:@"_schedulePushNotifications"];

                v58 = (os_log_s *)objc_claimAutoreleasedReturnValue([v37 assetSelector]);
                id v86 = [v37 intervalSecs];
                uint64_t v59 = v31;
                id v60 = [v37 remainingSecs];
                id v61 = [v37 pushedJob];
                unsigned __int8 v62 = [v37 setJob];
                v63 = (void *)objc_claimAutoreleasedReturnValue([v37 setPolicy]);
                v64 = (void *)objc_claimAutoreleasedReturnValue([v37 pushedPolicy]);
                LOBYTE(v80) = v94;
                LOBYTE(v79) = v62;
                id v65 = v60;
                uint64_t v31 = v59;
                -[MADAutoAssetScheduler _logPersistedEntry:operation:persistingSelector:intervalSecs:remainingSecs:pushedJob:setJob:setPolicy:pushedPolicy:requiringRetry:message:]( v101,  "_logPersistedEntry:operation:persistingSelector:intervalSecs:remainingSecs:pushedJob:setJob:setPolicy: pushedPolicy:requiringRetry:message:",  @"_schedulePushNotifications",  @"ENTRY_MODIFY",  v58,  v86,  v65,  v61,  v79,  v63,  v64,  v80,  @"scheduled-job now push-job");

                self = v101;
              }

              else
              {
                id v66 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
                v58 = (os_log_s *)objc_claimAutoreleasedReturnValue([v66 oslog]);

                if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                {
                  id v75 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
                  unsigned int v76 = (void *)objc_claimAutoreleasedReturnValue([v37 summary]);
                  *(_DWORD *)buf = 138543874;
                  v112 = v75;
                  __int16 v113 = 2114;
                  uint64_t v114 = v31;
                  __int16 v115 = 2114;
                  id v116 = v76;
                  _os_log_error_impl( &dword_0,  v58,  OS_LOG_TYPE_ERROR,  "%{public}@ | {AUTO-SCHEDULER:_schedulePushNotifications} already-scheduled-job without persisted ent ry (unable to persist that job has been pushed) | pushSelectorKey:%{public}@ | alreadyScheduledJob:%{public}@",  buf,  0x20u);
                }
              }

              v67 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
              v68 = (os_log_s *)objc_claimAutoreleasedReturnValue([v67 oslog]);

              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v87 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
                __int128 v83 = (void *)objc_claimAutoreleasedReturnValue([v97 summary]);
                uint64_t v95 = v31;
                id v69 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  604800LL);
                id v81 = v69;
                id v70 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  0LL);
                id v82 = v70;
                id v71 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  604800LL);
                id v72 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  0LL);

                *(_DWORD *)buf = 138544898;
                v112 = v87;
                __int16 v113 = 2114;
                uint64_t v114 = v95;
                __int16 v115 = 2114;
                id v116 = v83;
                __int16 v117 = 2114;
                id v118 = v69;
                __int16 v119 = 2114;
                id v120 = v70;
                self = v101;
                __int16 v121 = 2114;
                id v122 = v71;
                __int16 v123 = 2114;
                id v124 = v72;
                _os_log_impl( &dword_0,  v68,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_schedulePushNotifications} scheduled-job now push-job | pushSelectorKey: %{public}@ | pushPolicy:%{public}@ | delay(%{public}@..%{public}@), jitter(%{public}@..%{public}@)",  buf,  0x48u);
              }

              -[MADAutoAssetScheduler _startPushDelayTimer:]( self,  "_startPushDelayTimer:",  &v91[arc4random_uniform(__upper_bound)]);
              id v6 = v100;
              v27 = v84;
              id v29 = v85;
              __int128 v32 = v92;
              uint64_t v34 = v97;
            }
          }

          else
          {
            uint64_t v93 = v31;
            id v43 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
            unsigned int v44 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 oslog]);

            log = v44;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
              __int128 v96 = v34;
              id v46 = (void *)objc_claimAutoreleasedReturnValue([v34 summary]);
              *(_DWORD *)buf = 138543874;
              v112 = v45;
              __int16 v113 = 2114;
              uint64_t v114 = v93;
              __int16 v115 = 2114;
              id v116 = v46;
              _os_log_error_impl( &dword_0,  v44,  OS_LOG_TYPE_ERROR,  "%{public}@ | {AUTO-SCHEDULER:_schedulePushNotifications} trimmed push-notification without already-sched uled-job (dropped) | pushSelectorKey:%{public}@ | pushPolicy:%{public}@",  buf,  0x20u);

              uint64_t v34 = v96;
            }
          }

          objc_autoreleasePoolPop(v32);
          __int128 v30 = (char *)v30 + 1;
        }

        while (v29 != v30);
        id v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v103,  v125,  16LL);
      }

      while (v29);
      v26 = v88;
    }
  }

  else
  {
    unsigned __int8 v77 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
    v27 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v77 oslog]);

    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
    {
      id v78 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      *(_DWORD *)buf = 138543362;
      v112 = v78;
      _os_log_impl( &dword_0,  (os_log_t)v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_schedulePushNotifications} no new push-notification (no scheduling change)",  buf,  0xCu);
    }
  }
}

- (int64_t)_decideTriggerIntervalSecs:(id)a3 forAssetSelector:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = +[MADAutoAssetControlManager preferenceActivityIntervalSecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceActivityIntervalSecs");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler _assetTypeForAssetSelector:](self, "_assetTypeForAssetSelector:", v5));
  if (v7 < 0) {
    uint64_t v9 = 604800LL;
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9 >= 1) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = 0LL;
  }
  if ((v7 & 0x8000000000000000LL) == 0 || v9 < 1)
  {
LABEL_28:
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

    BOOL v21 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v7 < 0)
    {
      if (!v21) {
        goto LABEL_42;
      }
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
      *(_DWORD *)buf = 138544130;
      unsigned int v44 = v22;
      __int16 v45 = 2114;
      id v46 = v23;
      __int16 v47 = 2114;
      uint64_t v48 = v8;
      __int16 v49 = 2048;
      uint64_t v50 = v10;
      __int16 v24 = "%{public}@ | {AUTO-SCHEDULER:_decideTriggerIntervalSecs} default | assetSelector:%{public}@ | scheduledJobAs"
            "setType:%{public}@ | determinedIntervalSecs:%ld";
    }

    else
    {
      if (!v21) {
        goto LABEL_42;
      }
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
      *(_DWORD *)buf = 138544130;
      unsigned int v44 = v22;
      __int16 v45 = 2114;
      id v46 = v23;
      __int16 v47 = 2114;
      uint64_t v48 = v8;
      __int16 v49 = 2048;
      uint64_t v50 = v10;
      __int16 v24 = "%{public}@ | {AUTO-SCHEDULER:_decideTriggerIntervalSecs} preference-based | assetSelector:%{public}@ | sched"
            "uledJobAssetType:%{public}@ | determinedIntervalSecs:%ld";
    }

- (int64_t)_heightenedIntervalSecs
{
  int64_t result = +[MADAutoAssetControlManager preferenceActivityHeightenedIntervalSecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceActivityHeightenedIntervalSecs");
  if (result <= 0) {
    return 259200LL;
  }
  return result;
}

- (int64_t)_aggressiveIntervalSecs
{
  int64_t result = +[MADAutoAssetControlManager preferenceActivityAggressiveIntervalSecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceActivityAggressiveIntervalSecs");
  if (result <= 0) {
    return 86400LL;
  }
  return result;
}

- (id)_assetTypeForAssetSelector:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v5);

  v27 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 assetType]);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler setConfigurations](self, "setConfigurations"));
  id v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    __int16 v24 = v6;
    id v25 = self;
    uint64_t v9 = *(void *)v29;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler setConfigurations](self, "setConfigurations", v24));
        id v14 = [v13 safeObjectForKey:v12 ofClass:objc_opt_class(p_ivars[211])];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if (v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v27 assetType]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 clientDomainName]);
          if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v16, v17) & 1) != 0)
          {
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v27 assetSpecifier]);
            id v19 = v8;
            uint64_t v20 = v9;
            BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v15 assetSetIdentifier]);
            unsigned int v22 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v18, v21);

            uint64_t v9 = v20;
            id v8 = v19;

            self = v25;
            p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);

            if (v22)
            {
              id v6 = (void *)objc_claimAutoreleasedReturnValue([v15 firstEntryAssetType]);

              goto LABEL_14;
            }
          }

          else
          {
          }
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v8);
    id v6 = v24;
  }

- (void)_jobFinishedForSelector:(id)a3 withPotentialNetworkFailure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 persistedEntryID]);
  id v10 = [v8 safeObjectForKey:v9 ofClass:objc_opt_class(MADAutoAssetScheduledJob)];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 persistedEntryID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 persistedEntry:v12 fromLocation:@"_jobFinishedForSelector"]);

    if ([v14 BOOLeanForKey:@"requiringRetry"] != v4)
    {
      [v14 persistBoolean:v4 forKey:@"requiringRetry"];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
      [v15 storePersistedEntry:v12 withEntrySummary:v16 fromLocation:@"_jobFinishedForSelector"];

      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v11 assetSelector]);
      id v31 = [v11 intervalSecs];
      id v30 = [v11 remainingSecs];
      unsigned int v29 = [v11 pushedJob];
      unsigned __int8 v17 = [v11 setJob];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 setPolicy]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 pushedPolicy]);
      uint64_t v20 = objc_alloc(&OBJC_CLASS___NSString);
      BOOL v21 = @"no longer retry-required";
      if (v4) {
        BOOL v21 = @"retry-required (potential network failure)";
      }
      unsigned int v22 = -[NSString initWithFormat:](v20, "initWithFormat:", @"scheduled job finished (%@)", v21);
      LOBYTE(v28) = v4;
      LOBYTE(v27) = v17;
      -[MADAutoAssetScheduler _logPersistedEntry:operation:persistingSelector:intervalSecs:remainingSecs:pushedJob:setJob:setPolicy:pushedPolicy:requiringRetry:message:]( self,  "_logPersistedEntry:operation:persistingSelector:intervalSecs:remainingSecs:pushedJob:setJob:setPolicy:pushedPoli cy:requiringRetry:message:",  @"_jobFinishedForSelector",  @"ENTRY_MODIFY",  v32,  v31,  v30,  v29,  v27,  v18,  v19,  v28,  v22);
    }

    -[MADAutoAssetScheduler _informConnectorActiveJobFinishedforSelector:withPotentialNetworkFailure:]( self,  "_informConnectorActiveJobFinishedforSelector:withPotentialNetworkFailure:",  v6,  v4);
  }

  else
  {
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
    __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v6 summary]);
      *(_DWORD *)buf = 138543618;
      __int128 v34 = v25;
      __int16 v35 = 2114;
      __int128 v36 = v26;
      _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_jobFinishedForSelector} no longer associated with scheduled job (presumed eliminat ed) | assetSelector:%{public}@",  buf,  0x16u);
    }
  }
}

- (void)_jobFinishedForSetDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withPotentialNetworkFailure:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v10);

  id v11 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:",  v9,  v8);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 persistedEntryID]);
  id v14 = [v12 safeObjectForKey:v13 ofClass:objc_opt_class(MADAutoAssetScheduledJob)];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 persistedEntryID]);
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 persistedEntry:v16 fromLocation:@"_jobFinishedForSetDomainName"]);

    if ([v18 BOOLeanForKey:@"requiringRetry"] != v5)
    {
      [v18 persistBoolean:v5 forKey:@"requiringRetry"];
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 summary]);
      [v19 storePersistedEntry:v16 withEntrySummary:v20 fromLocation:@"_jobFinishedForSetDomainName"];

      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v15 assetSelector]);
      id v35 = [v15 intervalSecs];
      id v34 = [v15 remainingSecs];
      unsigned int v33 = [v15 pushedJob];
      unsigned __int8 v21 = [v15 setJob];
      unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v15 setPolicy]);
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v15 pushedPolicy]);
      __int16 v24 = objc_alloc(&OBJC_CLASS___NSString);
      id v25 = @"no longer retry-required";
      if (v5) {
        id v25 = @"retry-required (potential network failure)";
      }
      v26 = -[NSString initWithFormat:](v24, "initWithFormat:", @"scheduled job finished (%@)", v25);
      LOBYTE(v32) = v5;
      LOBYTE(v31) = v21;
      -[MADAutoAssetScheduler _logPersistedEntry:operation:persistingSelector:intervalSecs:remainingSecs:pushedJob:setJob:setPolicy:pushedPolicy:requiringRetry:message:]( self,  "_logPersistedEntry:operation:persistingSelector:intervalSecs:remainingSecs:pushedJob:setJob:setPolicy:pushedPoli cy:requiringRetry:message:",  @"_jobFinishedForSetDomainName",  @"ENTRY_MODIFY",  v36,  v35,  v34,  v33,  v31,  v22,  v23,  v32,  v26);
    }

    -[MADAutoAssetScheduler _informConnectorActiveJobFinishedforSelector:withPotentialNetworkFailure:]( self,  "_informConnectorActiveJobFinishedforSelector:withPotentialNetworkFailure:",  v11,  v5);
  }

  else
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v11 summary]);
      *(_DWORD *)buf = 138543618;
      __int128 v38 = v29;
      __int16 v39 = 2114;
      __int128 v40 = v30;
      _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_jobFinishedForSetDomainName} no longer associated with scheduled job (presumed eli minated) | setJobSelector:%{public}@",  buf,  0x16u);
    }
  }
}

- (void)_eliminateSelector:(id)a3 forSetJob:(BOOL)a4 indicatingWhenEliminated:(BOOL)a5
{
  BOOL v61 = a5;
  BOOL v5 = a4;
  id v7 = a3;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSpecifier]);
  BOOL v60 = v5;
  if (v9 || v5)
  {
    -[MADAutoAssetScheduler _eliminateSpecificSelector:](self, "_eliminateSpecificSelector:", v7);
    goto LABEL_37;
  }

  id v65 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector"));
  id v67 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (!v67) {
    goto LABEL_28;
  }
  uint64_t v10 = *(void *)v81;
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  v63 = self;
  id v64 = v7;
  uint64_t v62 = *(void *)v81;
  do
  {
    uint64_t v12 = 0LL;
    do
    {
      if (*(void *)v81 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v69 = v12;
      uint64_t v13 = *(void *)(*((void *)&v80 + 1) + 8 * v12);
      context = objc_autoreleasePoolPush();
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector"));
      id v15 = [v14 safeObjectForKey:v13 ofClass:objc_opt_class(MADAutoAssetScheduledJob)];
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

      unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assetSelector]);
      if (v17)
      {
        uint64_t v18 = p_ivars[155];
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v16 assetSelector]);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetType]);
        unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
        LODWORD(v18) = -[__objc2_ivar_list stringIsEqual:to:](v18, "stringIsEqual:to:", v20, v21);

        if (!(_DWORD)v18) {
          goto LABEL_26;
        }
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        id v71 = v65;
        id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v71,  "countByEnumeratingWithState:objects:count:",  &v76,  v91,  16LL);
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v77;
          uint64_t v70 = *(void *)v77;
          do
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v77 != v24) {
                objc_enumerationMutation(v71);
              }
              v26 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
              uint64_t v27 = p_ivars[155];
              uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v16 assetSelector]);
              unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 assetType]);
              id v30 = (void *)objc_claimAutoreleasedReturnValue([v26 assetType]);
              if ((-[__objc2_ivar_list stringIsEqual:to:](v27, "stringIsEqual:to:", v29, v30) & 1) != 0)
              {
                uint64_t v31 = p_ivars[155];
                uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v16 assetSelector]);
                id v33 = v23;
                id v34 = v16;
                id v35 = (void *)objc_claimAutoreleasedReturnValue([v32 assetSpecifier]);
                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v26 assetSpecifier]);
                LOBYTE(v31) = -[__objc2_ivar_list stringIsEqual:to:]( v31,  "stringIsEqual:to:",  v35,  v36);

                id v16 = v34;
                id v23 = v33;

                p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
                uint64_t v24 = v70;
              }

              else
              {
              }
            }

            id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v71,  "countByEnumeratingWithState:objects:count:",  &v76,  v91,  16LL);
          }

          while (v23);
        }

        uint64_t v37 = objc_claimAutoreleasedReturnValue([v16 assetSelector]);
        -[NSMutableArray addObject:](v71, "addObject:", v37);
        id v71 = (NSMutableArray *)v37;
LABEL_22:
        self = v63;
        id v7 = v64;
        uint64_t v10 = v62;
      }

      else
      {
        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
        __int16 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue([v38 oslog]);

        id v71 = (NSMutableArray *)v39;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 summary]);
          *(_DWORD *)buf = 138543618;
          id v85 = v40;
          __int16 v86 = 2114;
          __int16 v87 = v41;
          _os_log_error_impl( &dword_0,  v39,  OS_LOG_TYPE_ERROR,  "%{public}@ | {AUTO-SCHEDULER:_eliminateSelector} scheduledJob with nil assetSelector encountered on jobsBySe lector | eliminateSelector:%{public}@",  buf,  0x16u);
        }
      }

LABEL_26:
      objc_autoreleasePoolPop(context);
      uint64_t v12 = v69 + 1;
    }

    while ((id)(v69 + 1) != v67);
    id v67 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
  }

  while (v67);
LABEL_28:

  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  id v42 = v65;
  id v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v72,  v90,  16LL);
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v73;
    do
    {
      for (j = 0LL; j != v44; j = (char *)j + 1)
      {
        if (*(void *)v73 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = *(void *)(*((void *)&v72 + 1) + 8LL * (void)j);
        uint64_t v48 = objc_autoreleasePoolPush();
        -[MADAutoAssetScheduler _eliminateSpecificSelector:](self, "_eliminateSpecificSelector:", v47);
        objc_autoreleasePoolPop(v48);
      }

      id v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v72,  v90,  16LL);
    }

    while (v44);
  }

LABEL_37:
  -[MADAutoAssetScheduler _informConnectorAlteredSelectors](self, "_informConnectorAlteredSelectors");
  __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
  uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 oslog]);

  BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
  if (v60)
  {
    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      if (v61) {
        v53 = @"Y";
      }
      else {
        v53 = @"N";
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
      *(_DWORD *)buf = 138543874;
      id v85 = v52;
      __int16 v86 = 2114;
      __int16 v87 = v53;
      __int16 v88 = 2114;
      uint64_t v89 = v54;
      _os_log_impl( &dword_0,  v50,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_eliminateSelector} set-job | indicatingEliminated:%{public}@ | eliminateSelector:%{public}@",  buf,  0x20u);
    }

    if (v61)
    {
      id v55 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
      v56 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSpecifier]);
      +[MADAutoAssetControlManager schedulerEliminatedSetDomainName:forAssetSetIdentifier:]( &OBJC_CLASS___MADAutoAssetControlManager,  "schedulerEliminatedSetDomainName:forAssetSetIdentifier:",  v55,  v56);
    }
  }

  else
  {
    if (v51)
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      if (v61) {
        v58 = @"Y";
      }
      else {
        v58 = @"N";
      }
      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
      *(_DWORD *)buf = 138543874;
      id v85 = v57;
      __int16 v86 = 2114;
      __int16 v87 = v58;
      __int16 v88 = 2114;
      uint64_t v89 = v59;
      _os_log_impl( &dword_0,  v50,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_eliminateSelector} auto-asset-job | indicatingEliminated:%{public}@ | eliminateSel ector:%{public}@",  buf,  0x20u);
    }

    if (v61) {
      +[MADAutoAssetControlManager schedulerEliminatedSelector:]( &OBJC_CLASS___MADAutoAssetControlManager,  "schedulerEliminatedSelector:",  v7);
    }
  }
}

- (void)_eliminateSpecificSelector:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 persistedEntryID]);
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
    unsigned int v8 = [v7 persistedEntryAlreadyExists:v6 fromLocation:@"_eliminateSpecificSelector"];

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 persistedEntry:v6 fromLocation:@"_eliminateSpecificSelector"]);

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsAwaitingTrigger](self, "jobsAwaitingTrigger"));
      id v12 = [v11 count];

      if (v12)
      {
        unint64_t v13 = 0LL;
        while (1)
        {
          id v14 = objc_autoreleasePoolPush();
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsAwaitingTrigger](self, "jobsAwaitingTrigger"));
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:v13]);

          if (v16)
          {
            unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assetSelector]);
            unsigned __int8 v18 = +[MADAutoAssetScheduler isSelector:consideredEqualTo:]( &OBJC_CLASS___MADAutoAssetScheduler,  "isSelector:consideredEqualTo:",  v17,  v4);

            if ((v18 & 1) != 0) {
              break;
            }
          }

          objc_autoreleasePoolPop(v14);
          ++v13;
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsAwaitingTrigger](self, "jobsAwaitingTrigger"));
          id v20 = [v19 count];
        }

        objc_autoreleasePoolPop(v14);
        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsAwaitingTrigger](self, "jobsAwaitingTrigger"));
        [v25 removeObjectAtIndex:v13];
      }
    }

    else
    {
      uint64_t v10 = 0LL;
    }

- (void)_registerForAndStartActivity:(int64_t)a3
{
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v5);

  -[MADAutoAssetScheduler setScheduledJobsXPCActivity:](self, "setScheduledJobsXPCActivity:", 1LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_registerForAndStartActivity} xpc_activity_register...",  buf,  0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __54__MADAutoAssetScheduler__registerForAndStartActivity___block_invoke;
  v12[3] = &unk_34E448;
  v12[4] = self;
  v12[5] = a3;
  xpc_activity_register( (const char *)[@"com.apple.mobileassetd.auto-asset-scheduler" UTF8String],  XPC_ACTIVITY_CHECK_IN,  v12);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
    *(_DWORD *)buf = 138543362;
    id v14 = v11;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_registerForAndStartActivity} ...xpc_activity_register",  buf,  0xCu);
  }
}

void __54__MADAutoAssetScheduler__registerForAndStartActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    xpc_activity_state_t v5 = state;
    if (!state)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "[XPC] {AUTO-SCHEDULER:_registerForAndStartActivity} periodic XPC activity | XPC_ACTIVITY_STATE_CHECK_IN...",  buf,  2u);
      }

      xpc_object_t v8 = xpc_activity_copy_criteria(v3);
      id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) schedulerQueue]);
      unsigned __int8 v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472LL;
      id v23 = __54__MADAutoAssetScheduler__registerForAndStartActivity___block_invoke_743;
      uint64_t v24 = &unk_34E420;
      uint64_t v28 = *(void *)(a1 + 40);
      id v10 = v8;
      uint64_t v11 = *(void *)(a1 + 32);
      id v25 = v10;
      uint64_t v26 = v11;
      uint64_t v27 = v3;
      dispatch_sync(v9, &v21);

      id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logger", v21, v22, v23, v24));
      unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "[XPC] {AUTO-SCHEDULER:_registerForAndStartActivity} periodic XPC activity | ...XPC_ACTIVITY_STATE_CHECK_IN",  buf,  2u);
      }

      goto LABEL_15;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    id v10 = (id)objc_claimAutoreleasedReturnValue([v20 oslog]);

    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 134217984;
    xpc_activity_state_t v30 = v5;
    unsigned __int8 v17 = "[XPC] {AUTO-SCHEDULER:_registerForAndStartActivity} periodic XPC activity | xpc_activity_state_t state:%ld";
    unsigned __int8 v18 = (os_log_s *)v10;
    uint32_t v19 = 12;
LABEL_14:
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    goto LABEL_15;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 oslog]);

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "[XPC] {AUTO-SCHEDULER:_registerForAndStartActivity} periodic XPC activity | XPC_ACTIVITY_STATE_RUN...",  buf,  2u);
  }

  [*(id *)(a1 + 32) _performActivityOperations];
  id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v16 oslog]);

  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    unsigned __int8 v17 = "[XPC] {AUTO-SCHEDULER:_registerForAndStartActivity} periodic XPC activity | ...XPC_ACTIVITY_STATE_RUN";
    unsigned __int8 v18 = (os_log_s *)v10;
    uint32_t v19 = 2;
    goto LABEL_14;
  }

void __54__MADAutoAssetScheduler__registerForAndStartActivity___block_invoke_743(uint64_t a1)
{
  id v2 = +[MADAutoAssetScheduler tickerIntervalForActivityIntervalSecs:]( &OBJC_CLASS___MADAutoAssetScheduler,  "tickerIntervalForActivityIntervalSecs:",  *(void *)(a1 + 56));
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, XPC_ACTIVITY_INTERVAL);
    xpc_activity_state_t v5 = (id *)(a1 + 40);
    id v6 = [*(id *)(a1 + 40) tickerIntervalSecs];
    id v7 = *(void **)(a1 + 40);
    if ((id)uint64 == v6)
    {
      [v7 setScheduledJobsXPCActivity:3];
      [*v5 _startActivityBackupTrigger];
      xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue([*v5 logger]);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*v5 summary]);
        id v11 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  uint64);
        *(_DWORD *)buf = 138543618;
        __int16 v39 = v10;
        __int16 v40 = 2114;
        id v41 = v11;
        _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_registerForAndStartActivity} periodic XPC activity re-activated with delayPeriod:%{public}@",  buf,  0x16u);
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) persistedState]);
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 persistedConfig]);
      [v13 persistULL:*(void *)(a1 + 56) forKey:@"activityInterval" shouldPersist:1];

      [*(id *)(a1 + 40) _logPersistedConfigSet:@"_registerForAndStartActivity" activityIntervalSecs:*(void *)(a1 + 56) pushTriggerSecs:-1 lastTickDate:0 message:@"activity interval verified as known to XPC Activity Manager"];
      return;
    }

    if ((uint64_t)[v7 activityIntervalSecs] < 1)
    {
      xpc_activity_unregister((const char *)[@"com.apple.mobileassetd.auto-asset-scheduler" UTF8String]);
      [*v5 setScheduledJobsXPCActivity:6];
      [*v5 setTickerIntervalReRegistering:0];
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([*v5 logger]);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 oslog]);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        xpc_activity_state_t v30 = (void *)objc_claimAutoreleasedReturnValue([*v5 summary]);
        id v31 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  uint64);
        *(_DWORD *)buf = 138543618;
        __int16 v39 = v30;
        __int16 v40 = 2114;
        id v41 = v31;
        _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_registerForAndStartActivity} periodic XPC activity DISABLED with previous delayP eriod:%{public}@",  buf,  0x16u);
      }

      goto LABEL_24;
    }

    if ([*v5 tickerIntervalReRegistering])
    {
      [*v5 setScheduledJobsXPCActivity:3];
      [*v5 _startActivityBackupTrigger];
      uint32_t v19 = (void *)objc_claimAutoreleasedReturnValue([*v5 logger]);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __54__MADAutoAssetScheduler__registerForAndStartActivity___block_invoke_743_cold_1(v5, uint64, v20);
      }
LABEL_24:

      return;
    }

    xpc_activity_unregister((const char *)[@"com.apple.mobileassetd.auto-asset-scheduler" UTF8String]);
    [*v5 setScheduledJobsXPCActivity:2];
    [*v5 setTickerIntervalReRegistering:1];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([*v5 logger]);
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 oslog]);

    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = (void *)objc_claimAutoreleasedReturnValue([*v5 summary]);
      id v35 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  uint64);
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v34;
      __int16 v40 = 2114;
      id v41 = v35;
      _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_registerForAndStartActivity} attempt to re-register with desired delayPeriod:%{public}@",  buf,  0x16u);
    }

    id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) schedulerQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __54__MADAutoAssetScheduler__registerForAndStartActivity___block_invoke_748;
    block[3] = &unk_34E3F8;
    uint64_t v36 = *(void *)(a1 + 56);
    void block[4] = *(void *)(a1 + 40);
    block[5] = v36;
    block[6] = uint64;
    dispatch_async(v23, block);
LABEL_28:

    return;
  }

  [*(id *)(a1 + 40) setTickerIntervalReRegistering:0];
  id v14 = *(void **)(a1 + 40);
  if (*(uint64_t *)(a1 + 56) <= 0)
  {
    [v14 setActivityIntervalSecs:86400];
    [*(id *)(a1 + 40) setTickerIntervalSecs:14400];
    id v2 = [*(id *)(a1 + 40) tickerIntervalSecs];
    unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    *(_DWORD *)buf = 138543362;
    __int16 v39 = v17;
    _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_registerForAndStartActivity} scheduler XPC activity without criteria (and no activit yInterval provided) - using default ticker",  buf,  0xCu);
  }

  else
  {
    [v14 setTickerIntervalSecs:v2];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    id v18 = +[MADAutoAssetControlManager allocIntervalString:]( MADAutoAssetControlManager,  "allocIntervalString:",  [*(id *)(a1 + 40) tickerIntervalSecs]);
    *(_DWORD *)buf = 138543618;
    __int16 v39 = v17;
    __int16 v40 = 2114;
    id v41 = v18;
    _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_registerForAndStartActivity} periodic XPC activity start with delayPeriod:%{public}@",  buf,  0x16u);
  }

LABEL_16:
  if ((uint64_t)v2 >= 1)
  {
    [*(id *)(a1 + 40) _setActivityCriteria:*(void *)(a1 + 48) pushNotificationInitiated:0 withActivityDelay:v2];
    [*(id *)(a1 + 40) setScheduledJobsXPCActivity:3];
    [*(id *)(a1 + 40) _startActivityBackupTrigger];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
    id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
      id v25 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  v2);
      *(_DWORD *)buf = 138543618;
      __int16 v39 = v24;
      __int16 v40 = 2114;
      id v41 = v25;
      _os_log_impl( &dword_0,  (os_log_t)v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_registerForAndStartActivity} periodic XPC activity started with delayPeriod:%{public}@",  buf,  0x16u);
    }

    goto LABEL_28;
  }

  xpc_activity_unregister((const char *)[@"com.apple.mobileassetd.auto-asset-scheduler" UTF8String]);
  [*(id *)(a1 + 40) setScheduledJobsXPCActivity:6];
  [*(id *)(a1 + 40) setTickerIntervalReRegistering:0];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) logger]);
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 oslog]);

  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    *(_DWORD *)buf = 138543362;
    __int16 v39 = v28;
    _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_registerForAndStartActivity} periodic XPC activity DISABLED (and no activityInterval provided)",  buf,  0xCu);
  }
}

void __54__MADAutoAssetScheduler__registerForAndStartActivity___block_invoke_748(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  *(void *)(a1 + 48));
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "{AUTO-SCHEDULER:_registerForAndStartActivity} made attempt to re-register with desired delayPeriod:%{public}@",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)_startActivityBackupTrigger
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v3);

  if (+[MADAutoAssetControlManager preferenceScheduledBackupTriggersDisabled]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceScheduledBackupTriggersDisabled"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 oslog]);

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      *(_DWORD *)buf = 138543362;
      unint64_t v13 = v6;
      id v7 = "%{public}@ | {AUTO-SCHEDULER:_startActivityBackupTrigger} backup ticker DISABLED";
LABEL_7:
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
LABEL_9:
    }
  }

  else
  {
    xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler scheduledJobsBackupTriggerTimer](self, "scheduledJobsBackupTriggerTimer"));

    if (!v8)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = __52__MADAutoAssetScheduler__startActivityBackupTrigger__block_invoke;
      v11[3] = &unk_34E470;
      v11[4] = self;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:repeats:block:",  1LL,  v11,  (double)(uint64_t)(float)((float)-[MADAutoAssetScheduler tickerIntervalSecs]( self,  "tickerIntervalSecs")
                                               * 1.25)));
      -[MADAutoAssetScheduler setScheduledJobsBackupTriggerTimer:](self, "setScheduledJobsBackupTriggerTimer:", v10);

      int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler scheduledJobsBackupTriggerTimer](self, "scheduledJobsBackupTriggerTimer"));
      -[os_log_s addTimer:forMode:](v5, "addTimer:forMode:", v6, NSDefaultRunLoopMode);
      goto LABEL_9;
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      *(_DWORD *)buf = 138543362;
      unint64_t v13 = v6;
      id v7 = "%{public}@ | {AUTO-SCHEDULER:_startActivityBackupTrigger} backup timer already running - no adjustments made";
      goto LABEL_7;
    }
  }
}

void __52__MADAutoAssetScheduler__startActivityBackupTrigger__block_invoke(uint64_t a1)
{
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) schedulerQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __52__MADAutoAssetScheduler__startActivityBackupTrigger__block_invoke_2;
  block[3] = &unk_34DBC0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __52__MADAutoAssetScheduler__startActivityBackupTrigger__block_invoke_2(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) activityTickerFired];
  [*(id *)(a1 + 32) setActivityTickerFired:0];
  if ((v2 & 1) == 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_startActivityBackupTrigger} backup ticker | ticking...",  (uint8_t *)&v9,  0xCu);
    }

    objc_msgSend( *(id *)(a1 + 32),  "_performTickerOperations:",  2 * (void)objc_msgSend(*(id *)(a1 + 32), "tickerIntervalSecs"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_startActivityBackupTrigger} backup ticker | ...ticking",  (uint8_t *)&v9,  0xCu);
    }
  }

- (void)_startPushDelayTimer:(int64_t)a3
{
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v5);

  if (+[MADAutoAssetControlManager preferenceScheduledBackupTriggersDisabled]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceScheduledBackupTriggersDisabled"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_startPushBackupTrigger} push delay timer DISABLED",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    -[MADAutoAssetScheduler setPushDelaySecs:](self, "setPushDelaySecs:", a3);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x3032000000LL;
    id v18 = __Block_byref_object_copy__4;
    uint32_t v19 = __Block_byref_object_dispose__4;
    id v20 = (id)os_transaction_create("com.apple.MobileAsset.handlePushNotificationReceived");
    int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
    id v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v9);

    dispatch_time_t v11 = dispatch_time(0LL, 1000000000 * a3);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = __46__MADAutoAssetScheduler__startPushDelayTimer___block_invoke;
    handler[3] = &unk_34DC78;
    id v14 = v10;
    p___int128 buf = &buf;
    handler[4] = self;
    id v12 = v10;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(v12);

    _Block_object_dispose(&buf, 8);
  }

void __46__MADAutoAssetScheduler__startPushDelayTimer___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    int v10 = 138543362;
    dispatch_time_t v11 = v4;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_startPushBackupTrigger} push delay timer | pushing...",  (uint8_t *)&v10,  0xCu);
  }

  [*(id *)(a1 + 32) _performPushNotificationOperations];
  int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    int v10 = 138543362;
    dispatch_time_t v11 = v7;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_startPushBackupTrigger} push delay timer | ...pushing",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0LL;

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

- (void)_setActivityCriteria:(id)a3 pushNotificationInitiated:(BOOL)a4 withActivityDelay:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v8 = (_xpc_activity_s *)a3;
  int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v9);

  xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
  dispatch_time_t v11 = v10;
  float v12 = (float)a5 * 0.05;
  if (a5 <= 60) {
    a5 = 60LL;
  }
  if (v12 > 5.0) {
    float v13 = v12;
  }
  else {
    float v13 = 5.0;
  }
  id v14 = (const char **)&XPC_ACTIVITY_DELAY;
  if (!v6) {
    id v14 = (const char **)&XPC_ACTIVITY_INTERVAL;
  }
  xpc_dictionary_set_uint64(v10, *v14, a5);
  xpc_dictionary_set_BOOL(v11, XPC_ACTIVITY_REPEATING, !v6);
  xpc_dictionary_set_uint64(v11, XPC_ACTIVITY_GRACE_PERIOD, (unint64_t)v13);
  xpc_dictionary_set_BOOL(v11, XPC_ACTIVITY_POWER_NAP, 1);
  xpc_dictionary_set_string(v11, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
    if (v6) {
      id v18 = @"push";
    }
    else {
      id v18 = @"scheduled";
    }
    id v19 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  a5);
    id v20 = v19;
    unsigned __int8 v21 = @"s";
    int v22 = 138544642;
    id v23 = v17;
    id v25 = @"MAINTENANCE";
    __int16 v24 = 2114;
    if (v13 == 1.0) {
      unsigned __int8 v21 = &stru_355768;
    }
    __int16 v26 = 2112;
    uint64_t v27 = v18;
    __int16 v28 = 2114;
    id v29 = v19;
    __int16 v30 = 2048;
    unint64_t v31 = (unint64_t)v13;
    __int16 v32 = 2112;
    id v33 = v21;
    _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_setActivityCriteria} [%{public}@] %@-jobs XPC activity started | delayPeriod:%{publi c}@, grace period:%llu sec%@ | run from power-nap:true",  (uint8_t *)&v22,  0x3Eu);
  }

  xpc_activity_set_criteria(v8, v11);
}

- (void)_performActivityOperations
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __51__MADAutoAssetScheduler__performActivityOperations__block_invoke;
  block[3] = &unk_34DBC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __51__MADAutoAssetScheduler__performActivityOperations__block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    int v8 = 138543362;
    int v9 = v4;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_performActivityOperations} periodic ticker XPC activity | ticking...",  (uint8_t *)&v8,  0xCu);
  }

  [*(id *)(a1 + 32) setActivityTickerFired:1];
  objc_msgSend(*(id *)(a1 + 32), "_performTickerOperations:", objc_msgSend(*(id *)(a1 + 32), "tickerIntervalSecs"));
  [*(id *)(a1 + 32) setScheduledJobsXPCActivity:3];
  int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    int v8 = 138543362;
    int v9 = v7;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_performActivityOperations} periodic ticker XPC activity | ...ticking",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)_performTickerOperations:(int64_t)a3
{
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = self;
  int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
  xpc_object_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 persistedConfig]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 dateForKey:@"lastActivityTickerDate"]);

  float v12 = objc_alloc_init(&OBJC_CLASS___NSDate);
  __int128 v73 = v12;
  if (a3 <= 59)
  {
    float v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](v7, "logger"));
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetScheduler _performTickerOperations:].cold.2(v7, a3, v14);
    }

    a3 = 60LL;
    float v12 = v73;
  }

  __int128 v74 = v8;
  __int128 v75 = v6;
  __int128 v72 = (void *)v11;
  if (v11
    && v12
    && (-[NSDate timeIntervalSinceDate:](v12, "timeIntervalSinceDate:", v11), v15 > 0.0)
    && (uint64_t v16 = (uint64_t)v15 / a3, v16 >= 2))
  {
    int64_t v17 = v16 * a3;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](v7, "logger"));
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](v7, "summary"));
      *(_DWORD *)__int128 buf = 138543874;
      uint64_t v90 = v20;
      __int16 v91 = 2048;
      int64_t v92 = a3;
      __int16 v93 = 2048;
      int64_t v94 = v17;
      _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_performActivityOperations} making up for missed tick(s) | standardTickSecs:%ld, el apsedTickerSecs:%ld",  buf,  0x20u);
    }
  }

  else
  {
    int64_t v17 = a3;
  }

  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v83 = 0u;
  __int128 v84 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsAwaitingTrigger](v7, "jobsAwaitingTrigger"));
  id v21 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
  __int128 v78 = v7;
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v84;
    uint64_t v76 = *(void *)v84;
    int64_t v77 = v17;
    do
    {
      __int16 v24 = 0LL;
      id v79 = v22;
      do
      {
        if (*(void *)v84 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v83 + 1) + 8LL * (void)v24);
        __int16 v26 = objc_autoreleasePoolPush();
        if (v25)
        {
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 assetSelector]);

          if (v27)
          {
            __int128 v82 = v26;
            __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v25 assetSelector]);
            id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 persistedEntryID]);

            __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](v7, "persistedState"));
            unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 persistedEntry:v29 fromLocation:@"_performActivityOperations"]);

            unsigned __int8 v32 = [v31 BOOLeanForKey:@"requiringRetry"];
            __int128 v81 = v31;
            if ((uint64_t)[v25 remainingSecs] <= v17)
            {
              unsigned int v37 = [v25 requiringRetry];
              __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v25 assetSelector]);
              if (v37) {
                __int16 v39 = v74;
              }
              else {
                __int16 v39 = v75;
              }
              -[NSMutableArray addObject:](v39, "addObject:", v38);

              unsigned int v40 = [v25 pushedJob];
              id v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](v7, "logger"));
              id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue([v41 oslog]);

              BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
              if (v40)
              {
                if (v43)
                {
                  id v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](v7, "summary"));
                  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v25 summary]);
                  *(_DWORD *)__int128 buf = 138543618;
                  uint64_t v90 = v44;
                  __int16 v91 = 2114;
                  int64_t v92 = (int64_t)v45;
                  _os_log_impl( &dword_0,  v42,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_performActivityOperations} scheduler triggered push-job | currentlyAwa iting:%{public}@",  buf,  0x16u);
                }

                [v25 setPushedJob:0];
                [v25 setPushedPolicy:0];
                if (-[MADAutoAssetScheduler jobsAwaitingPushTrigger](v7, "jobsAwaitingPushTrigger") < 1)
                {
                  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](v7, "logger"));
                  __int16 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 oslog]);

                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    BOOL v60 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](v7, "summary"));
                    BOOL v61 = (void *)objc_claimAutoreleasedReturnValue([v25 summary]);
                    *(_DWORD *)__int128 buf = 138543618;
                    uint64_t v90 = v60;
                    __int16 v91 = 2114;
                    int64_t v92 = (int64_t)v61;
                    _os_log_error_impl( &dword_0,  v49,  OS_LOG_TYPE_ERROR,  "%{public}@ | {AUTO-SCHEDULER:_performActivityOperations} scheduler triggered push-job when no job awaiting push trigger | currentlyAwaiting:%{public}@",  buf,  0x16u);
                  }
                }

                else
                {
                  -[MADAutoAssetScheduler setJobsAwaitingPushTrigger:]( v7,  "setJobsAwaitingPushTrigger:",  (char *)-[MADAutoAssetScheduler jobsAwaitingPushTrigger](v7, "jobsAwaitingPushTrigger") - 1);
                }
              }

              else
              {
                if (v43)
                {
                  id v46 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](v7, "summary"));
                  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v25 summary]);
                  *(_DWORD *)__int128 buf = 138543618;
                  uint64_t v90 = v46;
                  __int16 v91 = 2114;
                  int64_t v92 = (int64_t)v47;
                  _os_log_impl( &dword_0,  v42,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_performActivityOperations} scheduler triggered job | currentlyAwaiting:%{public}@",  buf,  0x16u);
                }
              }

              id v50 = [v31 ullForKey:@"intervalSecs"];
              [v25 setRemainingSecs:v50];
              [v31 persistULL:v50 forKey:@"remainingSecs"];
              [v31 persistBoolean:0 forKey:@"pushJob"];
              [v31 persistBoolean:0 forKey:@"requiringRetry"];
              unsigned __int8 v32 = 0;
            }

            else
            {
              objc_msgSend(v25, "setRemainingSecs:", (char *)objc_msgSend(v25, "remainingSecs") - v17);
              objc_msgSend(v31, "persistULL:forKey:", objc_msgSend(v25, "remainingSecs"), @"remainingSecs");
            }

            BOOL v51 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](v7, "persistedState"));
            v52 = (void *)objc_claimAutoreleasedReturnValue([v25 summary]);
            [v51 storePersistedEntry:v29 withEntrySummary:v52 fromLocation:@"_performActivityOperations"];

            v53 = (void *)objc_claimAutoreleasedReturnValue([v25 assetSelector]);
            id v54 = [v25 intervalSecs];
            id v55 = [v25 remainingSecs];
            id v56 = [v25 pushedJob];
            unsigned __int8 v57 = [v25 setJob];
            v58 = (void *)objc_claimAutoreleasedReturnValue([v25 setPolicy]);
            uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v25 pushedPolicy]);
            LOBYTE(v71) = v32;
            LOBYTE(v70) = v57;
            id v7 = v78;
            -[MADAutoAssetScheduler _logPersistedEntry:operation:persistingSelector:intervalSecs:remainingSecs:pushedJob:setJob:setPolicy:pushedPolicy:requiringRetry:message:]( v78,  "_logPersistedEntry:operation:persistingSelector:intervalSecs:remainingSecs:pushedJob:setJob:setPolicy:push edPolicy:requiringRetry:message:",  @"_performTickerOperations",  @"ENTRY_MODIFY",  v53,  v54,  v55,  v56,  v70,  v58,  v59,  v71,  @"adjusted currently awaiting scheduled job");

            uint64_t v23 = v76;
            int64_t v17 = v77;
            id v22 = v79;
            __int16 v26 = v82;
          }

          else
          {
            id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](v7, "logger"));
            id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 oslog]);

            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](v7, "summary"));
              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v25 summary]);
              *(_DWORD *)__int128 buf = 138543618;
              uint64_t v90 = v35;
              __int16 v91 = 2114;
              int64_t v92 = (int64_t)v36;
              _os_log_error_impl( &dword_0,  v29,  OS_LOG_TYPE_ERROR,  "%{public}@ | {AUTO-SCHEDULER:_performActivityOperations} nil currentlyAwaiting.assetSelector encountered on jobsAwaitingTrigger | currentlyAwaiting:%{public}@",  buf,  0x16u);
            }
          }
        }

        else
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](v7, "logger"));
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 oslog]);

          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[MADAutoAssetScheduler _performTickerOperations:].cold.1((uint64_t)v87, (uint64_t)v7);
          }
        }

        objc_autoreleasePoolPop(v26);
        __int16 v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [obj countByEnumeratingWithState:&v83 objects:v88 count:16];
    }

    while (v22);
  }

  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](v7, "persistedState"));
  v63 = (void *)objc_claimAutoreleasedReturnValue([v62 persistedConfig]);
  [v63 persistDate:v73 forKey:@"lastActivityTickerDate" shouldPersist:1];

  -[MADAutoAssetScheduler _logPersistedConfigSet:activityIntervalSecs:pushTriggerSecs:lastTickDate:message:]( v78,  "_logPersistedConfigSet:activityIntervalSecs:pushTriggerSecs:lastTickDate:message:",  @"_performTickerOperations",  -[MADAutoAssetScheduler activityIntervalSecs](v78, "activityIntervalSecs"),  -1LL,  v73,  @"updated last tick date");
  if (-[NSMutableArray count](v75, "count") || -[NSMutableArray count](v74, "count"))
  {
    id v64 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](v78, "logger"));
    id v65 = (os_log_s *)objc_claimAutoreleasedReturnValue([v64 oslog]);

    id v66 = v72;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      id v67 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](v78, "summary"));
      id v68 = -[NSMutableArray count](v75, "count");
      id v69 = -[NSMutableArray count](v74, "count");
      *(_DWORD *)__int128 buf = 138543874;
      uint64_t v90 = v67;
      __int16 v91 = 2048;
      int64_t v92 = (int64_t)v68;
      __int16 v93 = 2048;
      int64_t v94 = (int64_t)v69;
      _os_log_impl( &dword_0,  v65,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_performActivityOperations} scheduled triggered selectors | NoRetry:%ld RequiringRe try:%ld | MA_MILESTONE",  buf,  0x20u);
    }

    -[MADAutoAssetScheduler _informConnectorTriggeredSelectors:withTriggeredRequiringRetry:]( v78,  "_informConnectorTriggeredSelectors:withTriggeredRequiringRetry:",  v75,  v74);
  }

  else
  {
    +[MADAutoAssetControlManager schedulerTriggeredNoActivity]( &OBJC_CLASS___MADAutoAssetControlManager,  "schedulerTriggeredNoActivity");
    id v66 = v72;
  }
}

- (void)_performPushNotificationOperations
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "summary");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_15((uint64_t)v3, 5.8381e-34);
  OUTLINED_FUNCTION_4_1( &dword_0,  v4,  v5,  "%{public}@ | {AUTO-SCHEDULER:_performPushNotificationActivityOperations} nil currentlyAwaiting encountered on jobsAwaitingTrigger");

  OUTLINED_FUNCTION_11();
}

- (void)_performTriggeredSetJobForSetConfiguration:(id)a3 usingSetUpdatePolicy:(id)a4
{
  id v5 = a3;
  BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v6);

  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  xpc_object_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 clientDomainName]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 assetSetIdentifier]);

  id v12 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( v9,  "initForAssetType:withAssetSpecifier:",  v10,  v11);
  if (v8 && v12)
  {
    -[NSMutableArray addObject:](v8, "addObject:", v12);
    float v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      int v16 = 138543874;
      int64_t v17 = v15;
      __int16 v18 = 2048;
      id v19 = -[NSMutableArray count](v7, "count");
      __int16 v20 = 2048;
      id v21 = -[NSMutableArray count](v8, "count");
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:_performTriggeredSetJobForSetConfiguration} directly triggered selector | NoRetry:% ld RequiringRetry:%ld | MA_MILESTONE",  (uint8_t *)&v16,  0x20u);
    }

    -[MADAutoAssetScheduler _informConnectorTriggeredSelectors:withTriggeredRequiringRetry:]( self,  "_informConnectorTriggeredSelectors:withTriggeredRequiringRetry:",  v7,  v8);
  }
}

void __50__MADAutoAssetScheduler_defaultSchedulerSetPolicy__block_invoke(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MADAutoSetPolicy);
  id v2 = (void *)defaultSchedulerSetPolicy___defaultSetPolicy;
  defaultSchedulerSetPolicy___defaultSetPolicy = (uint64_t)v1;

  [(id)defaultSchedulerSetPolicy___defaultSetPolicy setUserInitiated:0];
  [(id)defaultSchedulerSetPolicy___defaultSetPolicy setLockInhibitsEmergencyRemoval:0];
  [(id)defaultSchedulerSetPolicy___defaultSetPolicy setAllowCheckDownloadOnBattery:1];
  [(id)defaultSchedulerSetPolicy___defaultSetPolicy setAllowCheckDownloadWhenBatteryLow:0];
  [(id)defaultSchedulerSetPolicy___defaultSetPolicy setAllowCheckDownloadWhenCPUHigh:0];
  [(id)defaultSchedulerSetPolicy___defaultSetPolicy setAllowCheckDownloadOverExpensive:0];
  [(id)defaultSchedulerSetPolicy___defaultSetPolicy setAllowCheckDownloadOverCellular:1];
  [(id)defaultSchedulerSetPolicy___defaultSetPolicy setBlockCheckDownload:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)defaultSchedulerSetPolicy___defaultSetPolicy summary]);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "AUTO-SCHEDULER:{defaultSchedulerSetPolicy} initialized the default scheduler set-policy | defaultSetPolicy:%{public}@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)_resumeConnector
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v3);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler _currentlyScheduledMarkers](self, "_currentlyScheduledMarkers"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetScheduler _currentlyScheduledMarkersRequiringRetry]( self,  "_currentlyScheduledMarkersRequiringRetry"));
  +[MADAutoAssetConnector resumeMonitoringMarkers:withMarkersRequiringRetry:]( &OBJC_CLASS___MADAutoAssetConnector,  "resumeMonitoringMarkers:withMarkersRequiringRetry:",  v5,  v4);
}

- (void)_informConnectorAlteredSelectors
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler _currentlyScheduledMarkers](self, "_currentlyScheduledMarkers"));
  +[MADAutoAssetConnector alteredMonitoringMarkers:withTriggeredNoRetry:withTriggeredRequiringRetry:]( &OBJC_CLASS___MADAutoAssetConnector,  "alteredMonitoringMarkers:withTriggeredNoRetry:withTriggeredRequiringRetry:",  v4,  0LL,  0LL);
}

- (void)_informConnectorTriggeredSelectors:(id)a3 withTriggeredRequiringRetry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v8);

  int v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  xpc_object_t v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      double v15 = 0LL;
      do
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v15);
        int64_t v17 = objc_autoreleasePoolPush();
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler _markerForSelector:](self, "_markerForSelector:", v16));
        -[NSMutableArray addObject:](v9, "addObject:", v18);

        objc_autoreleasePoolPop(v17);
        double v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v13);
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v19 = v7;
  id v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      uint64_t v23 = 0LL;
      do
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v23);
        id v25 = objc_autoreleasePoolPush();
        __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler _markerForSelector:](self, "_markerForSelector:", v24, (void)v28));
        -[NSMutableArray addObject:](v10, "addObject:", v26);

        objc_autoreleasePoolPop(v25);
        uint64_t v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }

    while (v21);
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler _currentlyScheduledMarkers](self, "_currentlyScheduledMarkers"));
  +[MADAutoAssetConnector alteredMonitoringMarkers:withTriggeredNoRetry:withTriggeredRequiringRetry:]( &OBJC_CLASS___MADAutoAssetConnector,  "alteredMonitoringMarkers:withTriggeredNoRetry:withTriggeredRequiringRetry:",  v27,  v9,  v10);
}

- (void)_informConnectorActiveJobFinishedforSelector:(id)a3 withPotentialNetworkFailure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler _markerForSelector:](self, "_markerForSelector:", v6));
  +[MADAutoAssetConnector scheduledMarkerFinished:withPotentialNetworkFailure:]( &OBJC_CLASS___MADAutoAssetConnector,  "scheduledMarkerFinished:withPotentialNetworkFailure:",  v8,  v4);
}

- (id)_currentlyScheduledMarkers
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsAwaitingTrigger](self, "jobsAwaitingTrigger", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      int v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        xpc_object_t v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v9);
        id v11 = objc_autoreleasePoolPush();
        if (v10)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSelector]);

          if (v12)
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSelector]);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetScheduler _markerForSelector:andJob:]( self,  "_markerForSelector:andJob:",  v13,  v10));

            -[NSMutableArray addObject:](v4, "addObject:", v14);
          }
        }

        objc_autoreleasePoolPop(v11);
        int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)_currentlyScheduledMarkersRequiringRetry
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsAwaitingTrigger](self, "jobsAwaitingTrigger", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      int v9 = 0LL;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        xpc_object_t v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v9);
        if (v10)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)v9) assetSelector]);
          if (v11)
          {
            id v12 = (void *)v11;
            unsigned int v13 = [v10 requiringRetry];

            if (v13)
            {
              uint64_t v14 = objc_autoreleasePoolPush();
              double v15 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSelector]);
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetScheduler _markerForSelector:andJob:]( self,  "_markerForSelector:andJob:",  v15,  v10));

              -[NSMutableArray addObject:](v4, "addObject:", v16);
              objc_autoreleasePoolPop(v14);
            }
          }
        }

        int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)_markerForSelector:(id)a3
{
  return -[MADAutoAssetScheduler _markerForSelector:andJob:](self, "_markerForSelector:andJob:", a3, 0LL);
}

- (id)_markerForSelector:(id)a3 andJob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if ((v7
     || (int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler jobsBySelector](self, "jobsBySelector")),
         xpc_object_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 persistedEntryID]),
         v11 = [v9 safeObjectForKey:v10 ofClass:objc_opt_class(MADAutoAssetScheduledJob)],  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v11),  v10,  v9,  v8))
    && [v8 setJob])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 assetSelector]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetScheduler _setConfigurationForAssetSelector:]( self,  "_setConfigurationForAssetSelector:",  v12));

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 setPolicy]);
    if (!v14) {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler defaultSchedulerSetPolicy](self, "defaultSchedulerSetPolicy"));
    }
    double v15 = objc_alloc(&OBJC_CLASS___MADMarker);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 assetType]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v13 clientDomainName]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSetIdentifier]);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 pushedPolicy]);
    id v20 = -[MADMarker initForAssetType:forClientDomainName:forAssetSetIdentifier:forAssetSelector:forSetJob:withSetPolicy:withPushedPolicy:]( v15,  "initForAssetType:forClientDomainName:forAssetSetIdentifier:forAssetSelector:forSetJob:withSetPolicy:withPushedPolicy:",  v16,  v17,  v18,  0LL,  1LL,  v14,  v19);
  }

  else
  {
    __int128 v21 = objc_alloc(&OBJC_CLASS___MADMarker);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 assetType]);
    id v20 = -[MADMarker initForAssetType:forClientDomainName:forAssetSetIdentifier:forAssetSelector:forSetJob:withSetPolicy:withPushedPolicy:]( v21,  "initForAssetType:forClientDomainName:forAssetSetIdentifier:forAssetSelector:forSetJob:withSetPolicy:withPushedPolicy:",  v13,  0LL,  0LL,  v6,  0LL,  0LL,  0LL);
  }

  return v20;
}

+ (id)migrateMismatchedPersistedStateVersion:(id)a3 forEntryID:(id)a4 withMismatchedState:(id)a5
{
  return 0LL;
}

+ (id)persistedEntryIDForClientDomain:(id)a3 forAssetSetIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@_%@", v6, v5);

  return v7;
}

- (void)_logPersistedConfigLoad:(id)a3 activityIntervalSecs:(int64_t)a4 pushTriggerSecs:(int64_t)a5 lastTickDate:(id)a6 message:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  double v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v15);

  __int128 v16 = objc_alloc(&OBJC_CLASS___NSString);
  id v17 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  a4);
  id v18 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  a5);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler stringFromDate:](&OBJC_CLASS___MADAutoAssetScheduler, "stringFromDate:", v14));

  id v20 = -[NSString initWithFormat:]( v16,  "initWithFormat:",  @"activityIntervalSecs:%@ | pushTriggerSecs:%@ | lastTickDate:%@",  v17,  v18,  v19);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedOperationSymbol:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedOperationSymbol:",  @"CONFIG_LOAD"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138546178;
    id v25 = @"PERSISTED";
    __int16 v26 = 2114;
    uint64_t v27 = @"AUTO-SCHEDULER";
    __int16 v28 = 2114;
    __int128 v29 = @"CONFIG_LOAD";
    __int16 v30 = 2114;
    __int128 v31 = @"SCHED";
    __int16 v32 = 2114;
    __int128 v33 = @">----->";
    __int16 v34 = 2114;
    id v35 = v12;
    __int16 v36 = 2114;
    id v37 = v13;
    __int16 v38 = 2114;
    __int16 v39 = @"SCHED";
    __int16 v40 = 2114;
    id v41 = v21;
    __int16 v42 = 2114;
    BOOL v43 = v20;
    __int16 v44 = 2114;
    uint64_t v45 = @"SCHED";
    __int16 v46 = 2114;
    uint64_t v47 = @"<-----<";
    _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@][%{public}@]\n #_%{public}@:%{public}@ {%{public}@} %{public}@\n #_%{public}@:(%{public}@) %{public}@\n #_%{public}@:%{public}@",  buf,  0x7Au);
  }
}

- (void)_logPersistedConfigSet:(id)a3 activityIntervalSecs:(int64_t)a4 pushTriggerSecs:(int64_t)a5 lastTickDate:(id)a6 message:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  double v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v15);

  __int128 v16 = objc_alloc(&OBJC_CLASS___NSString);
  if (a4 < 0)
  {
    id v17 = @"UNCHANGED";
    if ((a5 & 0x8000000000000000LL) == 0) {
      goto LABEL_3;
    }
  }

  else
  {
    id v17 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  a4);
    if ((a5 & 0x8000000000000000LL) == 0)
    {
LABEL_3:
      id v18 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  a5);
      goto LABEL_6;
    }
  }

  id v18 = @"UNCHANGED";
LABEL_6:
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler stringFromDate:](&OBJC_CLASS___MADAutoAssetScheduler, "stringFromDate:", v13));
  id v20 = -[NSString initWithFormat:]( v16,  "initWithFormat:",  @"activityIntervalSecs:%@ | pushTriggerSecs:%@ | lastTickDate:%@",  v17,  v18,  v19);

  if ((a5 & 0x8000000000000000LL) == 0) {
  if ((a4 & 0x8000000000000000LL) == 0)
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedOperationSymbol:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedOperationSymbol:",  @"CONFIG_SET"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138546178;
    id v25 = @"PERSISTED";
    __int16 v26 = 2114;
    uint64_t v27 = @"AUTO-SCHEDULER";
    __int16 v28 = 2114;
    __int128 v29 = @"CONFIG_SET";
    __int16 v30 = 2114;
    __int128 v31 = @"SCHED";
    __int16 v32 = 2114;
    __int128 v33 = @">----->";
    __int16 v34 = 2114;
    id v35 = v12;
    __int16 v36 = 2114;
    id v37 = v14;
    __int16 v38 = 2114;
    __int16 v39 = @"SCHED";
    __int16 v40 = 2114;
    id v41 = v21;
    __int16 v42 = 2114;
    BOOL v43 = v20;
    __int16 v44 = 2114;
    uint64_t v45 = @"SCHED";
    __int16 v46 = 2114;
    uint64_t v47 = @"<-----<";
    _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@][%{public}@]\n #_%{public}@:%{public}@ {%{public}@} %{public}@\n #_%{public}@:(%{public}@) %{public}@\n #_%{public}@:%{public}@",  buf,  0x7Au);
  }
}

- (void)_logPersistedEntry:(id)a3 operation:(id)a4 persistingSelector:(id)a5 intervalSecs:(int64_t)a6 remainingSecs:(int64_t)a7 pushedJob:(BOOL)a8 setJob:(BOOL)a9 setPolicy:(id)a10 pushedPolicy:(id)a11 requiringRetry:(BOOL)a12 message:(id)a13
{
  BOOL v13 = a8;
  id v41 = (__CFString *)a3;
  id v19 = a4;
  id v20 = a5;
  id v42 = a10;
  id v21 = a11;
  uint64_t v22 = (__CFString *)a13;
  uint64_t v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v23);

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedOperationSymbol:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedOperationSymbol:",  v19));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v20 persistedEntryID]);
  if (v25)
  {
    __int16 v39 = v24;
    __int16 v40 = v22;
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler jobTypeName:setJob:requiringRetry:]( &OBJC_CLASS___MADAutoAssetScheduler,  "jobTypeName:setJob:requiringRetry:",  v13,  a9,  a12));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
    __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v38 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  a6);
      id v29 =  +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  a7);
      __int16 v30 = @"N";
      __int128 v31 = @"Y";
      if (!a12) {
        __int128 v31 = @"N";
      }
      id v37 = v31;
      if (v42) {
        __int16 v30 = (__CFString *)objc_claimAutoreleasedReturnValue([v42 summary]);
      }
      if (v21) {
        __int16 v32 = (__CFString *)objc_claimAutoreleasedReturnValue([v21 summary]);
      }
      else {
        __int16 v32 = @"N";
      }
      *(_DWORD *)__int128 buf = 138547714;
      __int16 v44 = @"PERSISTED";
      __int16 v45 = 2114;
      __int16 v46 = @"AUTO-SCHEDULER";
      __int16 v47 = 2114;
      id v48 = v19;
      __int16 v49 = 2114;
      id v50 = @"SCHED";
      __int16 v51 = 2114;
      v52 = @">----->";
      __int16 v53 = 2114;
      id v54 = v41;
      __int16 v55 = 2114;
      id v56 = v40;
      __int16 v57 = 2114;
      v58 = @"SCHED";
      __int16 v59 = 2114;
      BOOL v60 = v39;
      __int16 v61 = 2114;
      uint64_t v62 = v25;
      __int16 v63 = 2114;
      id v64 = v26;
      __int16 v65 = 2114;
      id v66 = v38;
      __int16 v67 = 2114;
      id v68 = v29;
      __int16 v69 = 2114;
      uint64_t v70 = v37;
      __int16 v71 = 2114;
      __int128 v72 = v30;
      __int16 v73 = 2114;
      __int128 v74 = v32;
      __int16 v75 = 2114;
      uint64_t v76 = @"SCHED";
      __int16 v77 = 2114;
      __int128 v78 = @"<-----<";
      _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@][%{public}@]\n #_%{public}@:%{public}@ {%{public}@} %{public}@\n #_%{public}@:(%{public}@) [%{public}@] | [%{public}@] intervalSecs:%{public}@ | remainingSecs:%{public}@ | requi ringRetry:%{public}@ | setPolicy:%{public}@ | pushedPolicy:%{public}@\n #_%{public}@:%{public}@",  buf,  0xB6u);
      if (v21) {

      }
      if (v42) {
    }
      }

    __int16 v34 = v42;
    uint64_t v24 = v39;
    uint64_t v22 = v40;
  }

  else
  {
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 oslog]);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v35 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
      __int16 v36 = (__CFString *)objc_claimAutoreleasedReturnValue([v20 summary]);
      *(_DWORD *)__int128 buf = 138544386;
      __int16 v44 = v35;
      __int16 v45 = 2114;
      __int16 v46 = v41;
      __int16 v47 = 2114;
      id v48 = v19;
      __int16 v49 = 2114;
      id v50 = v22;
      __int16 v51 = 2114;
      v52 = v36;
      _os_log_error_impl( &dword_0,  v26,  OS_LOG_TYPE_ERROR,  "%{public}@ | {%{public}@:_logPersistedEntry} %{public}@ | no selectorKey | %{public}@ | assetSelector:%{public}@",  buf,  0x34u);
    }

    __int16 v34 = v42;
  }
}

- (void)_logPersistedRemovedEntry:(id)a3 removedSelector:(id)a4 message:(id)a5
{
  uint64_t v8 = (__CFString *)a3;
  id v9 = a4;
  xpc_object_t v10 = (__CFString *)a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetPersisted persistedOperationSymbol:]( &OBJC_CLASS___MADAutoAssetPersisted,  "persistedOperationSymbol:",  @"ENTRY_REMOVE"));
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v9 persistedEntryID]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
  double v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 oslog]);

  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138546178;
      id v19 = @"PERSISTED";
      __int16 v20 = 2114;
      id v21 = @"AUTO-SCHEDULER";
      __int16 v22 = 2114;
      uint64_t v23 = @"ENTRY_REMOVE";
      __int16 v24 = 2114;
      id v25 = @"SCHED";
      __int16 v26 = 2114;
      uint64_t v27 = @">----->";
      __int16 v28 = 2114;
      id v29 = v8;
      __int16 v30 = 2114;
      __int128 v31 = v10;
      __int16 v32 = 2114;
      __int128 v33 = @"SCHED";
      __int16 v34 = 2114;
      id v35 = v12;
      __int16 v36 = 2114;
      id v37 = v13;
      __int16 v38 = 2114;
      __int16 v39 = @"SCHED";
      __int16 v40 = 2114;
      id v41 = @"<-----<";
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@][%{public}@]\n #_%{public}@:%{public}@ {%{public}@} %{public}@\n #_%{public}@:(%{public}@) [%{public}@]\n #_%{public}@:%{public}@",  (uint8_t *)&v18,  0x7Au);
    }
  }

  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __int128 v16 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
    id v17 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 summary]);
    int v18 = 138544130;
    id v19 = v16;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v10;
    __int16 v24 = 2114;
    id v25 = v17;
    _os_log_error_impl( &dword_0,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@ | {%{public}@:_logPersistedRemovedEntry} %{public}@ | no selectorKey to remove | removedSelector:%{public}@",  (uint8_t *)&v18,  0x2Au);
  }
}

- (void)_logPersistedTableOfContents:(id)a3
{
  BOOL v4 = (__CFString *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler schedulerQueue](self, "schedulerQueue"));
  dispatch_assert_queue_V2(v5);

  if (+[MADAutoAssetControlManager preferencePersistedTableLoggingEnabled]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferencePersistedTableLoggingEnabled"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 persistedEntryIDs:v4]);

    __int16 v38 = v4;
    if ([v7 count])
    {
      id v41 = (const __CFString *)[v7 count];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138544642;
        BOOL v43 = @"PERSISTED";
        __int16 v44 = 2114;
        __int16 v45 = @"AUTO-SCHEDULER";
        __int16 v46 = 2114;
        __int16 v47 = @"ENTRY_LOAD";
        __int16 v48 = 2114;
        __int16 v49 = @"SCHED";
        __int16 v50 = 2114;
        __int16 v51 = @">----->";
        __int16 v52 = 2114;
        __int16 v53 = v4;
        _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@][%{public}@]\n#_%{public}@:%{public}@ {%{public}@} table-of-contents...",  buf,  0x3Eu);
      }

      if ((uint64_t)v41 >= 1)
      {
        uint64_t v11 = 0LL;
        *(void *)&__int128 v10 = 138543874LL;
        __int128 v37 = v10;
        __int16 v39 = v7;
        do
        {
          id v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v11, v37));
          BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler persistedState](self, "persistedState"));
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 persistedEntry:v12 fromLocation:v4]);

          if (v14)
          {
            id v15 = [v14 ullForKey:@"intervalSecs"];
            id v16 = [v14 ullForKey:@"remainingSecs"];
            id v17 = [v14 BOOLeanForKey:@"pushJob"];
            id v18 = [v14 BOOLeanForKey:@"setJob"];
            id v19 = (__CFString *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetScheduler jobTypeName:setJob:requiringRetry:]( MADAutoAssetScheduler,  "jobTypeName:setJob:requiringRetry:",  v17,  v18,  [v14 BOOLeanForKey:@"requiringRetry"]));
            id v40 = v16;
            if ((_DWORD)v18)
            {
              id v20 = [v14 secureCodedObjectForKey:@"setPolicy" ofClass:objc_opt_class(MADAutoSetPolicy)];
              id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              id v22 = [v14 secureCodedObjectForKey:@"pushedPolicy" ofClass:objc_opt_class(MADAutoSetPolicy)];
            }

            else
            {
              id v21 = 0LL;
            }

            id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
            __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v27 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  v15);
              __int16 v28 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  v40);
              id v29 = (__CFString *)v28;
              *(_DWORD *)__int128 buf = 138545410;
              __int16 v30 = @"Y";
              if (!v21) {
                __int16 v30 = @"N";
              }
              BOOL v43 = @"SCHED";
              __int16 v44 = 2114;
              __int16 v45 = @"E_LOD";
              __int16 v46 = 2048;
              __int16 v47 = (const __CFString *)(v11 + 1);
              BOOL v4 = v38;
              __int16 v48 = 2048;
              __int16 v49 = v41;
              __int16 v50 = 2114;
              __int16 v51 = v12;
              __int16 v52 = 2114;
              __int16 v53 = v19;
              __int16 v54 = 2114;
              __int16 v55 = v27;
              __int16 v56 = 2114;
              __int16 v57 = v28;
              __int16 v58 = 2112;
              __int16 v59 = v30;
              _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_DEFAULT,  "\n #_%{public}@:%{public}@ (%ld of %ld) [%{public}@] | (%{public}@) intervalSecs:%{public}@ | remainingSecs :%{public}@ | setPolicy:%@",  buf,  0x5Cu);
            }

            id v7 = v39;
          }

          else
          {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
            id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              __int16 v24 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler summary](self, "summary"));
              *(_DWORD *)__int128 buf = v37;
              BOOL v43 = v4;
              __int16 v44 = 2114;
              __int16 v45 = v24;
              __int16 v46 = 2114;
              __int16 v47 = v12;
              _os_log_error_impl( &dword_0,  v21,  OS_LOG_TYPE_ERROR,  "{%{public}@:_logPersistedTableOfContents} | %{public}@ | unable to load entry:%{public}@",  buf,  0x20u);
            }
          }

          ++v11;
        }

        while (v41 != (const __CFString *)v11);
      }

      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
      __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 oslog]);

      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)__int128 buf = 138544642;
      BOOL v43 = @"PERSISTED";
      __int16 v44 = 2114;
      __int16 v45 = @"AUTO-SCHEDULER";
      __int16 v46 = 2114;
      __int16 v47 = @"ENTRY_LOAD";
      __int16 v48 = 2114;
      __int16 v49 = @"SCHED";
      __int16 v50 = 2114;
      __int16 v51 = @"<-----<";
      __int16 v52 = 2114;
      __int16 v53 = v38;
      __int128 v33 = "[%{public}@][%{public}@][%{public}@]\n#_%{public}@:%{public}@ {%{public}@} ...table-of-contents";
      __int16 v34 = v32;
      uint32_t v35 = 62;
    }

    else
    {
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetScheduler logger](self, "logger"));
      __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 oslog]);

      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:

        BOOL v4 = v38;
        goto LABEL_25;
      }

      *(_DWORD *)__int128 buf = 138545410;
      BOOL v43 = @"PERSISTED";
      __int16 v44 = 2114;
      __int16 v45 = @"AUTO-SCHEDULER";
      __int16 v46 = 2114;
      __int16 v47 = @"ENTRY_LOAD";
      __int16 v48 = 2114;
      __int16 v49 = @"SCHED";
      __int16 v50 = 2114;
      __int16 v51 = @">----->";
      __int16 v52 = 2114;
      __int16 v53 = v38;
      __int16 v54 = 2114;
      __int16 v55 = @"empty table-of-contents";
      __int16 v56 = 2114;
      __int16 v57 = @"SCHED";
      __int16 v58 = 2114;
      __int16 v59 = @"<-----<";
      __int128 v33 = "[%{public}@][%{public}@][%{public}@]\n"
            "#_%{public}@:%{public}@ {%{public}@} %{public}@\n"
            "#_%{public}@:%{public}@";
      __int16 v34 = v32;
      uint32_t v35 = 92;
    }

    _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
    goto LABEL_24;
  }

+ (id)jobTypeName:(BOOL)a3 setJob:(BOOL)a4 requiringRetry:(BOOL)a5
{
  id v5 = @"scheduled-job";
  if (a5) {
    id v5 = @"scheduled-job(requiring-retry)";
  }
  id v6 = @"set-job";
  if (a5) {
    id v6 = @"set-job(requiring-retry)";
  }
  if (a4) {
    id v5 = v6;
  }
  if (a5) {
    id v7 = @"push-job(requiring-retry)";
  }
  else {
    id v7 = @"push-job";
  }
  if (a3) {
    return (id)v7;
  }
  else {
    return (id)v5;
  }
}

+ (id)stringFromDate:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", @"yyyy-MM-dd_HH:mm:ss");
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v4, "stringFromDate:", v3));

    if (!v5) {
      id v5 = @"Y";
    }
  }

  else
  {
    id v5 = @"N";
  }

  return v5;
}

+ (int64_t)tickerIntervalForActivityIntervalSecs:(int64_t)a3
{
  int64_t result = 14400LL;
  if (a3 != 86400 && a3 != 604800)
  {
    if (a3 < 600) {
      return a3;
    }
    else {
      return (uint64_t)(float)((float)((float)a3 / 10.0) + 1.0);
    }
  }

  return result;
}

+ (void)addScheduledJobs:(id)a3 basedOnControl:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler autoAssetScheduler](&OBJC_CLASS___MADAutoAssetScheduler, "autoAssetScheduler"));
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 schedulerQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __57__MADAutoAssetScheduler_addScheduledJobs_basedOnControl___block_invoke;
    block[3] = &unk_34DB70;
    id v13 = v8;
    id v14 = v6;
    id v15 = v5;
    dispatch_sync(v9, block);
  }

  else
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler addScheduledJobs:basedOnControl:].cold.1();
    }
  }
}

void __57__MADAutoAssetScheduler_addScheduledJobs_basedOnControl___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) jobsAwaitingTrigger]);
  id v2 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v26;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v21 = *(void *)v26;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)v6);
        uint64_t v8 = objc_autoreleasePoolPush();
        if (v7)
        {
          id v9 = p_ivars[174];
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSelector]);
          LODWORD(v9) = -[__objc2_ivar_list selectorToBeIncluded:basedOnControl:]( v9,  "selectorToBeIncluded:basedOnControl:",  v10,  *(void *)(v1 + 40));

          if ((_DWORD)v9)
          {
            uint64_t v11 = v1;
            id v12 = objc_alloc(&OBJC_CLASS___MAAutoAssetSummary);
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSelector]);
            else {
              uint64_t v14 = 400LL;
            }
            id v15 = [v7 intervalSecs];
            id v16 = [v7 remainingSecs];
            else {
              id v17 = 0LL;
            }
            id v18 = -[MAAutoAssetSummary initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withScheduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClientCount:withTotalClientCount:]( v12,  "initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:wi thScheduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiv eMonitorCount:withMaximumClientCount:withTotalClientCount:",  v13,  v14,  0LL,  0LL,  0LL,  v15,  v16,  v17,  0LL,  0LL,  0LL,  0LL);

            if (v18)
            {
              uint64_t v1 = v11;
              [*(id *)(v11 + 48) addObject:v18];
              uint64_t v4 = v21;
              p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            }

            else
            {
              id v19 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
              id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

              uint64_t v1 = v11;
              p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                __57__MADAutoAssetScheduler_addScheduledJobs_basedOnControl___block_invoke_cold_1(&buf, v24, v20);
              }

              uint64_t v4 = v21;
            }
          }
        }

        objc_autoreleasePoolPop(v8);
        id v6 = (char *)v6 + 1;
      }

      while (v3 != v6);
      id v3 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v3);
  }
}

+ (id)jobsAwaitingTrigger
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler autoAssetScheduler](&OBJC_CLASS___MADAutoAssetScheduler, "autoAssetScheduler"));
  id v3 = v2;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0LL;
  if (v2)
  {
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v2 schedulerQueue]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __44__MADAutoAssetScheduler_jobsAwaitingTrigger__block_invoke;
    v9[3] = &unk_34DB48;
    uint64_t v11 = &v12;
    __int128 v10 = v3;
    dispatch_sync(v4, v9);

    id v5 = v10;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler jobsAwaitingTrigger].cold.1();
    }
  }

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__MADAutoAssetScheduler_jobsAwaitingTrigger__block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) jobsAwaitingTrigger]);
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (void)forceGlobalForget:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler autoAssetScheduler](&OBJC_CLASS___MADAutoAssetScheduler, "autoAssetScheduler"));
  id v5 = v4;
  if (v4)
  {
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 schedulerQueue]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __43__MADAutoAssetScheduler_forceGlobalForget___block_invoke;
    v9[3] = &unk_34DB98;
    id v10 = v5;
    id v11 = v3;
    dispatch_sync(v6, v9);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetScheduler forceGlobalForget:].cold.1(v3);
    }
  }
}

void __43__MADAutoAssetScheduler_forceGlobalForget___block_invoke(uint64_t a1)
{
  __int16 v50 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetType]);
    *(_DWORD *)uint8_t buf = 138543618;
    __int16 v67 = v4;
    __int16 v68 = 2114;
    __int16 v69 = v5;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:forceGlobalForget} forgotting jobs for assetType:%{public}@",  buf,  0x16u);
  }

  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) jobsBySelector]);
  id v6 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v54 = *(void *)v61;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v61 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v60 + 1) + 8LL * (void)i);
        id v10 = objc_autoreleasePoolPush();
        id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) jobsBySelector]);
        id v12 = [v11 safeObjectForKey:v9 ofClass:objc_opt_class(MADAutoAssetScheduledJob)];
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSelector]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assetType]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) assetType]);
        LODWORD(v11) = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v15, v16);

        if ((_DWORD)v11)
        {
          -[NSMutableDictionary setSafeObject:forKey:](v50, "setSafeObject:forKey:", v13, v9);
        }

        else
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) summary]);
            id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 summary]);
            *(_DWORD *)uint8_t buf = 138543618;
            __int16 v67 = v19;
            __int16 v68 = 2114;
            __int16 v69 = v20;
            _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {AUTO-SCHEDULER:forceGlobalForget} preserving job:%{public}@",  buf,  0x16u);
          }
        }

        objc_autoreleasePoolPop(v10);
      }

      id v7 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
    }

    while (v7);
  }

  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int16 v47 = v50;
  id v46 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v56,  v64,  16LL);
  if (v46)
  {
    uint64_t v45 = *(void *)v57;
    do
    {
      uint64_t v21 = 0LL;
      do
      {
        if (*(void *)v57 != v45) {
          objc_enumerationMutation(v47);
        }
        uint64_t v55 = v21;
        uint64_t v22 = *(void *)(*((void *)&v56 + 1) + 8 * v21);
        id obja = objc_autoreleasePoolPush();
        uint64_t v48 = v22;
        id v23 = -[NSMutableDictionary safeObjectForKey:ofClass:]( v47,  "safeObjectForKey:ofClass:",  v22,  objc_opt_class(&OBJC_CLASS___MADAutoAssetScheduledJob));
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 assetSelector]);
        uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 persistedEntryID]);

        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistedState]);
        __int16 v51 = (void *)v26;
        __int16 v49 = (void *)objc_claimAutoreleasedReturnValue([v27 persistedEntry:v26 fromLocation:@"forceGlobalForget"]);

        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) jobsAwaitingTrigger]);
        id v29 = [v28 count];

        if (v29)
        {
          unint64_t v30 = 0LL;
          while (1)
          {
            __int128 v31 = objc_autoreleasePoolPush();
            uint64_t v32 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) jobsAwaitingTrigger]);
            __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([(id)v32 objectAtIndexedSubscript:v30]);

            __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 assetSelector]);
            uint32_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 assetType]);
            __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v24 assetSelector]);
            __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 assetType]);
            LOBYTE(v32) = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v35,  v37);

            objc_autoreleasePoolPop(v31);
            if ((v32 & 1) != 0) {
              break;
            }
            ++v30;
            __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) jobsAwaitingTrigger]);
            id v39 = [v38 count];
          }

          id v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) jobsAwaitingTrigger]);
          [v40 removeObjectAtIndex:v30];
        }

+ (int64_t)_preferenceChosenTickerIntervalSecs
{
  int64_t result = +[MADAutoAssetControlManager preferenceActivityTickerSecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceActivityTickerSecs");
  if (result < 0) {
    return +[MADAutoAssetControlManager preferenceActivityIntervalSecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceActivityIntervalSecs");
  }
  return result;
}

+ (void)setPersistedStateCaching:(BOOL)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MADAutoAssetScheduler autoAssetScheduler](&OBJC_CLASS___MADAutoAssetScheduler, "autoAssetScheduler"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 schedulerQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __50__MADAutoAssetScheduler_setPersistedStateCaching___block_invoke;
  block[3] = &unk_34E4B8;
  id v8 = v4;
  BOOL v9 = a3;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __50__MADAutoAssetScheduler_setPersistedStateCaching___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) persistedState]);
  [v2 flushPersistedStateCacheAndSetCachingBehaviour:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setJobsAwaitingTrigger:(id)a3
{
}

- (void)setJobsAwaitingPushTrigger:(int64_t)a3
{
  self->_jobsAwaitingPushTrigger = a3;
}

- (void)setJobsBySelector:(id)a3
{
}

- (BOOL)globalActivityInterval
{
  return self->_globalActivityInterval;
}

- (void)setGlobalActivityInterval:(BOOL)a3
{
  self->_globalActivityInterval = a3;
}

- (void)setActivityIntervalSecs:(int64_t)a3
{
  self->_uint64_t activityIntervalSecs = a3;
}

- (void)setTickerIntervalSecs:(int64_t)a3
{
  self->_tickerIntervalSecs = a3;
}

- (void)setTickerIntervalReRegistering:(BOOL)a3
{
  self->_tickerIntervalReRegistering = a3;
}

- (void)setActivityTickerFired:(BOOL)a3
{
  self->_activityTickerFired = a3;
}

- (void)setPushDelaySecs:(int64_t)a3
{
  self->_pushDelaySecs = a3;
}

- (void)setPushCounter:(int64_t)a3
{
  self->_pushCounter = a3;
}

- (void)setScheduledJobsXPCActivity:(int64_t)a3
{
  self->_scheduledJobsXPCActivity = a3;
}

- (NSTimer)scheduledJobsBackupTriggerTimer
{
  return self->_scheduledJobsBackupTriggerTimer;
}

- (void)setScheduledJobsBackupTriggerTimer:(id)a3
{
}

- (void)setPushJobsXPCActivity:(int64_t)a3
{
  self->_pushJobsXPCActivity = a3;
}

- (void)setLastTickTimestampString:(id)a3
{
}

- (NSSet)schedulerIntervalHeightenedAssetTypes
{
  return self->_schedulerIntervalHeightenedAssetTypes;
}

- (void)setSchedulerIntervalHeightenedAssetTypes:(id)a3
{
}

- (NSSet)schedulerIntervalAggressiveAssetTypes
{
  return self->_schedulerIntervalAggressiveAssetTypes;
}

- (void)setSchedulerIntervalAggressiveAssetTypes:(id)a3
{
}

- (NSMutableDictionary)setConfigurations
{
  return self->_setConfigurations;
}

- (void)setSetConfigurations:(id)a3
{
}

- (void).cxx_destruct
{
}

void __45__MADAutoAssetScheduler_resumeFromPersisted___block_invoke_cold_1()
{
}

+ (void)persistedScheduledCount
{
}

+ (void)newSetPolicyForDomainName:forAssetSetIdentifier:.cold.1()
{
}

+ (void)scheduleSelector:triggeringAtIntervalSecs:.cold.1()
{
}

+ (void)scheduleSelector:triggeringAtIntervalSecs:.cold.2()
{
}

+ (void)scheduleSelector:(void *)a1 triggeringAtIntervalSecs:.cold.3(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-SCHEDULER:scheduleSelector} | unable to locate auto-asset-scheduler | failed to [re-]schedule selector:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

+ (void)scheduleSetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:forSetConfiguration:.cold.1()
{
}

+ (void)scheduleSetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:forSetConfiguration:.cold.2()
{
}

+ (void)scheduleSetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:forSetConfiguration:.cold.3()
{
}

+ (void)scheduleSetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:forSetConfiguration:.cold.4()
{
}

+ (void)scheduleSetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:forSetConfiguration:.cold.5()
{
}

+ (void)triggerWithRetrySetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:.cold.1()
{
}

+ (void)triggerWithRetrySetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:.cold.2()
{
}

+ (void)triggerWithRetrySetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:.cold.3()
{
}

+ (void)triggerWithRetrySetDomainName:forAssetSetIdentifier:usingSetUpdatePolicy:.cold.4()
{
}

void __98__MADAutoAssetScheduler_triggerWithRetrySetDomainName_forAssetSetIdentifier_usingSetUpdatePolicy___block_invoke_cold_1( void *a1,  void *a2,  os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2_1( &dword_0,  (uint64_t)a2,  a3,  "{AUTO-SCHEDULER:triggerWithRetrySetDomainName} set-configuration not known - not triggering | clientDomainName:%{pub lic}@ | assetSetIdentifier:%{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_12();
}

+ (void)jobFinishedForSelector:withPotentialNetworkFailure:.cold.1()
{
}

+ (void)jobFinishedForSetDomainName:forAssetSetIdentifier:withPotentialNetworkFailure:.cold.1()
{
}

+ (void)jobFinishedForSetDomainName:forAssetSetIdentifier:withPotentialNetworkFailure:.cold.2()
{
}

+ (void)schedulePushNotifications:.cold.1()
{
}

+ (void)schedulePushNotifications:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 safeSummary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-SCHEDULER:schedulePushNotifications} | unable to locate auto-asset-scheduler | failed to schedule pushNotifica tionsBySelector:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

+ (void)controlEliminateSelector:.cold.1()
{
}

+ (void)controlEliminateSelector:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-SCHEDULER:eliminateSelector} | unable to locate auto-asset-scheduler | failed to eliminate selector:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

+ (void)controlEliminateSetDomainName:forAssetSetIdentifier:indicatingWhenEliminated:.cold.1()
{
}

+ (void)controlEliminateSetDomainName:(void *)a1 forAssetSetIdentifier:indicatingWhenEliminated:.cold.2( void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-SCHEDULER:eliminateSelector} | unable to locate auto-asset-scheduler | failed to eliminate setJobSelector:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

- (void)_trackSetConfigurations:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "summary");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_15((uint64_t)v3, 5.8381e-34);
  OUTLINED_FUNCTION_4_1( &dword_0,  v4,  v5,  "%{public}@ | {AUTO-SCHEDULER:_trackSetConfigurations} unable to access entry in allDefinedSetConfigurations");

  OUTLINED_FUNCTION_11();
}

- (void)_setConfigurationForAssetSelector:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "summary");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_15((uint64_t)v3, 5.8381e-34);
  OUTLINED_FUNCTION_4_1( &dword_0,  v4,  v5,  "%{public}@ | {AUTO-SCHEDULER:_setConfigurationForAssetSelector} unable to access entry key in self.setConfigurations");

  OUTLINED_FUNCTION_11();
}

- (void)_snapshotOfJobsBySelector
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "summary");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_15((uint64_t)v3, 5.8381e-34);
  OUTLINED_FUNCTION_4_1( &dword_0,  v4,  v5,  "%{public}@ | {AUTO-SCHEDULER:_snapshotOfJobsBySelector} unable to load scheduledJob entry");

  OUTLINED_FUNCTION_11();
}

- (void)_scheduleSelector:(os_log_s *)a3 triggeringAtIntervalSecs:withRemainingSecs:forPushedJob:forSetJob:withSetPolicy:triggeringIfLearned:resettingRemaining:.cold.1( void *a1,  void *a2,  os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 summary]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1( &dword_0,  a3,  v7,  "%{public}@ | {AUTO-SCHEDULER:_scheduleSelector} no scheduling change | unable to allocate job for selector:%{public}@",  v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_eliminateSpecificSelector:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-SCHEDULER:_eliminateSpecificSelector} no selectorKey for eliminateSelector:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

void __54__MADAutoAssetScheduler__registerForAndStartActivity___block_invoke_743_cold_1( id *a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*a1 summary]);
  id v6 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  a2);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1( &dword_0,  a3,  v7,  "%{public}@ | {AUTO-SCHEDULER:_registerForAndStartActivity} after re-register attempt still at different than desired delayPeriod:%{public}@",  v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_performTickerOperations:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_9_0(a1, a2), "summary");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_15((uint64_t)v3, 5.8381e-34);
  OUTLINED_FUNCTION_4_1( &dword_0,  v4,  v5,  "%{public}@ | {AUTO-SCHEDULER:_performActivityOperations} nil currentlyAwaiting encountered on jobsAwaitingTrigger");

  OUTLINED_FUNCTION_11();
}

- (void)_performTickerOperations:(os_log_s *)a3 .cold.2(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_13();
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  OUTLINED_FUNCTION_3_1( &dword_0,  a3,  v6,  "%{public}@ | {AUTO-SCHEDULER:_performActivityOperations} invalid elapsed ticker seconds - using minimum | elapsedTickerSecs:%ld",  v7);

  OUTLINED_FUNCTION_2_0();
}

+ (void)addScheduledJobs:basedOnControl:.cold.1()
{
}

void __57__MADAutoAssetScheduler_addScheduledJobs_basedOnControl___block_invoke_cold_1( uint8_t *buf,  _BYTE *a2,  os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "{AUTO-SCHEDULER:addScheduledJobs} unable to allocate summaryEntry",  buf,  2u);
}

+ (void)jobsAwaitingTrigger
{
}

+ (void)forceGlobalForget:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{AUTO-SCHEDULER:forceGlobalForget} unable to locate auto-asset-scheduler | unable to force forgetting of selector:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

@end