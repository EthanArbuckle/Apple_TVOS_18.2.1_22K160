@interface _DASDaemon
+ (_DASDaemon)sharedInstance;
- (BOOL)activityIsTimewiseEligible:(id)a3 atDate:(id)a4;
- (BOOL)addLaunchRequest:(id)a3;
- (BOOL)canSubmitValidatedTaskRequest:(id)a3 withError:(id *)a4;
- (BOOL)evaluateAllActivitiesFor:(id)a3 writingToFile:(id)a4;
- (BOOL)evaluatePoliciesForActivitiesChunk:(id)a3 writingToFile:(id)a4;
- (BOOL)isActivitySuspendable:(id)a3 withStartDate:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)pausedParametersApplyToActivity:(id)a3;
- (BOOL)recomEngineDisabled;
- (BOOL)removeTempBGSQLFile:(id)a3;
- (BOOL)shouldEvaluateTask:(id)a3 atDate:(id)a4;
- (BOOL)shouldPreemptActivity:(id)a3 forFastPassActivity:(id)a4;
- (BOOL)shouldRunActivityNow:(id)a3;
- (BOOL)shouldRunActivityNow:(id)a3 withOtherActivities:(id)a4;
- (BOOL)shouldSuspendLongRunningActivity:(id)a3 withStartDate:(id)a4 whileBlockingOtherTasks:(BOOL)a5 atDate:(id)a6;
- (BOOL)taskRegistryMode;
- (BOOL)testModeConstraintsApplyToActivity:(id)a3;
- (BOOL)testModeConstraintsRequireOverridingDecisionWithScores:(id)a3 ignoredPolicies:(id)a4 honoredPolicies:(id)a5;
- (BOOL)validateConfigurationForActivity:(id)a3;
- (NSCountedSet)launchesPerApp;
- (NSDate)timerEarliestFireDate;
- (NSDate)timerLatestFireDate;
- (NSDictionary)pausedParameters;
- (NSDictionary)testModeParameters;
- (NSDictionary)triggerToPolicyMap;
- (NSMutableArray)clients;
- (NSMutableDictionary)activitiesWaitingForBGTaskClients;
- (NSMutableDictionary)activityToIncompatibleActivitiesMap;
- (NSMutableDictionary)applicationLaunchRequests;
- (NSMutableDictionary)applicationsLaunched;
- (NSMutableDictionary)connectedBGTaskClients;
- (NSMutableDictionary)extensionLaunchRequests;
- (NSMutableDictionary)groupToPendingTasks;
- (NSMutableDictionary)groupToPrerunningTasks;
- (NSMutableDictionary)groupToRunningTasks;
- (NSMutableDictionary)groups;
- (NSMutableDictionary)powerAssertions;
- (NSMutableDictionary)recentlyLaunchedApps;
- (NSMutableDictionary)triggerToActivitiesMap;
- (NSMutableSet)pendingTasks;
- (NSMutableSet)prerunningTasks;
- (NSMutableSet)prewarmInvalidationConnections;
- (NSMutableSet)runningTasks;
- (NSSet)taskRegistryProcesses;
- (NSString)description;
- (NSUserDefaults)testingDefaults;
- (NSXPCListener)bgstListener;
- (NSXPCListener)listener;
- (OS_dispatch_queue)activityLaunchQueue;
- (OS_dispatch_queue)evaluationQueue;
- (OS_dispatch_queue)groupMonitoringQueue;
- (OS_dispatch_queue)launchQueue;
- (OS_dispatch_queue)timerSchedulingQueue;
- (OS_dispatch_source)databaseMaintenanceTimer;
- (OS_dispatch_source)groupMonitoringTimer;
- (OS_dispatch_source)launchTimeResetTimer;
- (OS_dispatch_source)optimalScoringTimer;
- (OS_xpc_object)prewarmInvalidationListener;
- (_APRSManager)appResumeManager;
- (_CDContextualKeyPath)maintenanceConstraintsKP;
- (_CDContextualKeyPath)utilityConstraintsKP;
- (_CDLocalContext)context;
- (_DASActivityDependencyManager)dependencyManager;
- (_DASActivityRateLimitManager)rateLimiter;
- (_DASAssertionArbiter)assertionArbiter;
- (_DASBARScheduler)barScheduler;
- (_DASBatchingQueue)activityCompletedBatchingQueue;
- (_DASBatchingQueue)networkActivitiesQueue;
- (_DASBatchingQueue)triggerBatchingQueue;
- (_DASBatchingQueue)triggerRecorderBatchingQueue;
- (_DASBlueListManager)blueListManager;
- (_DASBudgetManager)budgetManager;
- (_DASClosureManager)closureManager;
- (_DASConfigurationLimiter)configurationLimiter;
- (_DASControlEngine)controlEngine;
- (_DASDataStore)store;
- (_DASFairScheduleManager)fairScheduleManager;
- (_DASFeatureDurationTracker)featureDurationTracker;
- (_DASNetworkEvaluationMonitor)networkEvaluationMonitor;
- (_DASRemoteDeviceNearbyMonitor)remoteDeviceNearbyMonitor;
- (_DASRemoteDeviceWakeMonitor)remoteDeviceWakeMonitor;
- (_DASRuntimeLimiter)runtimeLimiter;
- (_DASSleepWakeMonitor)sleepWakeMonitor;
- (_DASTimer)schedulingTimer;
- (_DASTrialManager)trialManager;
- (_DASUserRequestedBackupTaskManager)backupTaskManager;
- (id)activityAnalyticsWithActivity:(id)a3 didComplete:(BOOL)a4;
- (id)activityMatchingPredicate:(id)a3;
- (id)activityRunStatistics;
- (id)allPendingBackgroundTasks;
- (id)allPendingPushLaunchTasks;
- (id)allPendingRestartTasks;
- (id)allPendingSyncOnBackupTasks;
- (id)allPendingTasks;
- (id)allPrerunningTasks;
- (id)allTasks;
- (id)allTimewiseEligibleNetworkTasksAllowingCell:(BOOL)a3;
- (id)assertionArbiter:(id)a3 clientWithPID:(int)a4;
- (id)candidateGroupActivityForPreemption:(id)a3;
- (id)clientForActivity:(id)a3;
- (id)createTempBGSQLFile:(id)a3;
- (id)currentReportingConditions;
- (id)earlyToday;
- (id)evaluatePolicies:(id)a3;
- (id)getActivityRunningWithName:(id)a3;
- (id)getActivityRunningWithUUID:(id)a3;
- (id)getActivityWithName:(id)a3;
- (id)getActivityWithUUID:(id)a3;
- (id)initAsAnonymous:(BOOL)a3 withContext:(id)a4;
- (id)sortCandidateActivities:(id)a3;
- (id)startedTasks;
- (id)tasksNoLongerEligible;
- (id)tasksNoLongerEligibleFromTasks:(id)a3;
- (id)widgetRefreshStatisticsWithStore:(id)a3;
- (id)widgetViewsStatisticsWithStore:(id)a3;
- (int64_t)additionalCapacityForActivity:(id)a3 inGroupWithName:(id)a4 shouldTryToSuspend:(BOOL)a5;
- (int64_t)capacityFromGroupMax:(int64_t)a3 forPriority:(unint64_t)a4;
- (int64_t)currentLoadFromActivities:(id)a3 inGroupWithName:(id)a4;
- (os_unfair_lock_s)constraintsLock;
- (os_unfair_lock_s)groupLock;
- (os_unfair_lock_s)prewarmInvalidationLock;
- (os_unfair_recursive_lock_s)activityStateLock;
- (os_unfair_recursive_lock_s)applicationLaunchRequestsLock;
- (unint64_t)maintenanceConstraints;
- (unint64_t)photosIsBlocked;
- (unint64_t)requestCountForApplication:(id)a3;
- (unint64_t)submittedTaskCount;
- (unint64_t)utilityConstraints;
- (void)_prewarmSuspendForMessage:(id)a3;
- (void)_prewarmSuspendHandleIncoming:(id)a3 onConnection:(id)a4;
- (void)_resetWidgetBudgets;
- (void)_unexpectedXPCObject:(id)a3 WithLog:(id)a4;
- (void)activity:(id)a3 blockedOnPolicies:(id)a4;
- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4;
- (void)activityCanceled:(id)a3;
- (void)activityCompleted:(id)a3;
- (void)activityContainsOverrides:(id)a3 handler:(id)a4;
- (void)activityRunStatisticsWithHandler:(id)a3;
- (void)activityStarted:(id)a3;
- (void)activityStartedWithParameters:(id)a3;
- (void)activityStoppedWithParameters:(id)a3;
- (void)addConstraint:(unint64_t)a3 forSchedulingPriority:(unint64_t)a4;
- (void)addPauseExceptParameter:(id)a3 handler:(id)a4;
- (void)addPendingActivitiesToGroups:(id)a3;
- (void)addPendingActivity:(id)a3 toGroupWithName:(id)a4;
- (void)addPrerunningActivity:(id)a3 toGroupWithName:(id)a4;
- (void)addRunningActivity:(id)a3 toGroupWithName:(id)a4;
- (void)addTriggersToActivity:(id)a3;
- (void)advanceAppLaunchDateIfNecessaryForActivity:(id)a3;
- (void)allBudgetsWithHandler:(id)a3;
- (void)allClientsDo:(id)a3;
- (void)assertionArbiter:(id)a3 didIssueInvalidationFor:(id)a4 serverInitiated:(BOOL)a5;
- (void)assertionArbiter:(id)a3 didIssueWarningFor:(id)a4;
- (void)associateActivity:(id)a3 withTriggerKeys:(id)a4;
- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4;
- (void)balanceForBudgetWithName:(id)a3 withHandler:(id)a4;
- (void)beginWorkForActivity:(id)a3;
- (void)blockingPoliciesWithParameters:(id)a3 handler:(id)a4;
- (void)cancelActivities:(id)a3;
- (void)cancelAllBackgroundTasks;
- (void)cancelAllTaskRequestsForApplication:(id)a3;
- (void)cancelAppRefreshTasksForApps:(id)a3;
- (void)cancelBackgroundTasksForApps:(id)a3;
- (void)cancelContactTracingTasksForApps:(id)a3;
- (void)cancelLaunchesOfTypes:(id)a3 forApps:(id)a4;
- (void)cancelPushLaunchTasksForApps:(id)a3;
- (void)cancelTaskRequestWithIdentifier:(id)a3 forApplication:(id)a4;
- (void)chooseActivitiesToRunFromCandidateActivities:(id)a3 toBeRunActivities:(id)a4 toLaunchApplications:(id)a5 toLaunchExtension:(id)a6;
- (void)clasStatusWithHandler:(id)a3;
- (void)cleanupForActivity:(id)a3 wasCompleted:(BOOL)a4;
- (void)clearActivityFromPrerunning:(id)a3;
- (void)clearRecentlyLaunchedApps;
- (void)computeStaticPriorityForActivity:(id)a3;
- (void)createActivityGroup:(id)a3;
- (void)createAssertion:(id)a3;
- (void)createDefaultActivityGroups;
- (void)currentPredictionsWithHandler:(id)a3;
- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4;
- (void)deferActivities:(id)a3 withHandler:(id)a4;
- (void)delayLaunchesOfType:(id)a3 forApps:(id)a4;
- (void)delayedRunningActivitiesWithHandler:(id)a3;
- (void)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4 handler:(id)a5;
- (void)determineNextTimerFireDateAndSchedule;
- (void)disableAppRefreshForApps:(id)a3;
- (void)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4 handler:(id)a5;
- (void)endLaunchWithReason:(id)a3 forApp:(id)a4;
- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4 handler:(id)a5;
- (void)establishConnectionFromClient:(id)a3 withCompletionHandler:(id)a4;
- (void)evaluateAllActivities:(id)a3 handler:(id)a4;
- (void)evaluateAssertions;
- (void)evaluatePolicies:(id)a3 handler:(id)a4;
- (void)evaluateScoreAndRunActivities:(id)a3;
- (void)evaluateScoreAndRunAllActivitiesForReason:(id)a3;
- (void)extensionActivity:(id)a3 finishedWithStatus:(unsigned __int8)a4;
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
- (void)getPendingTaskRequestsForApplication:(id)a3 withCompletionHandler:(id)a4;
- (void)getRuntimeLimit:(id)a3 handler:(id)a4;
- (void)handleCompletedActivities:(id)a3;
- (void)handleRunningActivities:(id)a3;
- (void)handleSysdiagnoseStartEvent;
- (void)handleTriggers:(id)a3;
- (void)handleTriggersBatched:(id)a3;
- (void)immediatelyBeginWorkForActivity:(id)a3;
- (void)inspect:(id)a3 withHandler:(id)a4;
- (void)launchApplication:(id)a3 applicationURL:(id)a4 additionalOptions:(id)a5 completion:(id)a6;
- (void)loadState;
- (void)loadStateWhenAvailable;
- (void)loadTestingDefaults;
- (void)logLimitations:(id)a3;
- (void)moveActivityToPrerunning:(id)a3;
- (void)moveActivityToRunning:(id)a3;
- (void)pauseWithParameters:(id)a3 handler:(id)a4;
- (void)periodicCalculationForOptimal;
- (void)policiesWithHandler:(id)a3;
- (void)prewarmApplication:(id)a3;
- (void)prewarmSuspendApplication:(id)a3 withHandler:(id)a4;
- (void)recordToTaskRegistry:(id)a3 lifeCycleStateName:(id)a4;
- (void)registerForNetworkPathEvaluation;
- (void)registerForTrial;
- (void)registerTriggersWithContextStoreForPolicies:(id)a3;
- (void)registerWithContextStoreForId:(id)a3 contextualPredicate:(id)a4 dismissalCondition:(id)a5 deviceSet:(unint64_t)a6 mustWake:(BOOL)a7 qualityOfService:(unsigned int)a8;
- (void)releaseAssertion:(id)a3;
- (void)releaseAssertions:(id)a3;
- (void)removeActivityFromGroupToPendingTasks:(id)a3;
- (void)removeActivityFromIncompatibleActivitiesMap:(id)a3;
- (void)removeActivityFromNestedMaps:(id)a3;
- (void)removeActivityFromTriggerMap:(id)a3;
- (void)removeClient:(id)a3;
- (void)removeConstraint:(unint64_t)a3 forSchedulingPriority:(unint64_t)a4;
- (void)removeDuplicateLaunchTasks:(id)a3;
- (void)removeLaunchRequest:(id)a3;
- (void)reportActivity:(id)a3 isBlockedWithDecision:(int64_t)a4;
- (void)reportActivityTiming:(id)a3;
- (void)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 withHandler:(id)a5;
- (void)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 withHandler:(id)a5;
- (void)reportPostRestoreCheckpoint:(unint64_t)a3 withParameters:(id)a4;
- (void)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 withHandler:(id)a5;
- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5;
- (void)resetOnlyPreemptiveSuspend;
- (void)runActivities:(id)a3;
- (void)runActivitiesAndRemoveUnknown:(id)a3;
- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4;
- (void)runApplicationLaunchActivities:(id)a3;
- (void)runExtensionLaunchActivities:(id)a3;
- (void)runLaunchTasks:(id)a3 forApplication:(id)a4 forApplicationURL:(id)a5 onLaunch:(id)a6 onCompletion:(id)a7 onFailure:(id)a8;
- (void)runLocalActivity:(id)a3;
- (void)runProceedableActivities:(id)a3 handler:(id)a4;
- (void)runningActivitiesWithHandler:(id)a3;
- (void)runningGroupActivitiesWithHandler:(id)a3;
- (void)scheduleConnectionTimeoutForPid:(int)a3;
- (void)scheduleTimerForActivity:(id)a3;
- (void)scheduleTimerOnBehalfOf:(id)a3 between:(double)a4 and:(double)a5 waking:(BOOL)a6;
- (void)schedulingTimerFired;
- (void)scoresForActivityWithName:(id)a3 withHandler:(id)a4;
- (void)setActivitiesWaitingForBGTaskClients:(id)a3;
- (void)setActivityCompletedBatchingQueue:(id)a3;
- (void)setActivityLaunchQueue:(id)a3;
- (void)setActivityStateLock:(os_unfair_recursive_lock_s)a3;
- (void)setActivityToIncompatibleActivitiesMap:(id)a3;
- (void)setAppResumeManager:(id)a3;
- (void)setApplicationLaunchRequests:(id)a3;
- (void)setApplicationLaunchRequestsLock:(os_unfair_recursive_lock_s)a3;
- (void)setApplicationsLaunched:(id)a3;
- (void)setAssertionArbiter:(id)a3;
- (void)setBackupTaskManager:(id)a3;
- (void)setBalance:(double)a3 forBudgetWithName:(id)a4;
- (void)setBarScheduler:(id)a3;
- (void)setBgstListener:(id)a3;
- (void)setBlueListManager:(id)a3;
- (void)setBudgetManager:(id)a3;
- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)setClients:(id)a3;
- (void)setClosureManager:(id)a3;
- (void)setConfigurationLimiter:(id)a3;
- (void)setConnectedBGTaskClients:(id)a3;
- (void)setConstraintsLock:(os_unfair_lock_s)a3;
- (void)setContext:(id)a3;
- (void)setControlEngine:(id)a3;
- (void)setDatabaseMaintenanceTimer:(id)a3;
- (void)setDependencyManager:(id)a3;
- (void)setEvaluationQueue:(id)a3;
- (void)setExtensionLaunchRequests:(id)a3;
- (void)setFairScheduleManager:(id)a3;
- (void)setFeatureDurationTracker:(id)a3;
- (void)setGroupLock:(os_unfair_lock_s)a3;
- (void)setGroupMonitoringQueue:(id)a3;
- (void)setGroupMonitoringTimer:(id)a3;
- (void)setGroupToPendingTasks:(id)a3;
- (void)setGroupToPrerunningTasks:(id)a3;
- (void)setGroupToRunningTasks:(id)a3;
- (void)setGroups:(id)a3;
- (void)setLaunchQueue:(id)a3;
- (void)setLaunchTimeResetTimer:(id)a3;
- (void)setLaunchesPerApp:(id)a3;
- (void)setListener:(id)a3;
- (void)setMaintenanceConstraints:(unint64_t)a3;
- (void)setMaintenanceConstraintsKP:(id)a3;
- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4;
- (void)setNetworkActivitiesQueue:(id)a3;
- (void)setNetworkEvaluationMonitor:(id)a3;
- (void)setOptimalScoringTimer:(id)a3;
- (void)setPausedParameters:(id)a3;
- (void)setPendingTasks:(id)a3;
- (void)setPhotosIsBlocked:(unint64_t)a3;
- (void)setPowerAssertions:(id)a3;
- (void)setPrerunningTasks:(id)a3;
- (void)setPrewarmInvalidationConnections:(id)a3;
- (void)setPrewarmInvalidationListener:(id)a3;
- (void)setPrewarmInvalidationLock:(os_unfair_lock_s)a3;
- (void)setRateLimiter:(id)a3;
- (void)setRecentlyLaunchedApps:(id)a3;
- (void)setRecomEngineDisabled:(BOOL)a3;
- (void)setRemoteDeviceNearbyMonitor:(id)a3;
- (void)setRemoteDeviceWakeMonitor:(id)a3;
- (void)setRunningTasks:(id)a3;
- (void)setRuntimeLimiter:(id)a3;
- (void)setSchedulingTimer:(id)a3;
- (void)setSleepWakeMonitor:(id)a3;
- (void)setStore:(id)a3;
- (void)setTaskRegistryMode:(BOOL)a3;
- (void)setTaskRegistryProcesses:(id)a3;
- (void)setTestModeParameters:(id)a3;
- (void)setTestingDefaults:(id)a3;
- (void)setTimerEarliestFireDate:(id)a3;
- (void)setTimerLatestFireDate:(id)a3;
- (void)setTimerSchedulingQueue:(id)a3;
- (void)setTrialManager:(id)a3;
- (void)setTriggerBatchingQueue:(id)a3;
- (void)setTriggerRecorderBatchingQueue:(id)a3;
- (void)setTriggerToActivitiesMap:(id)a3;
- (void)setTriggerToPolicyMap:(id)a3;
- (void)setUtilityConstraints:(unint64_t)a3;
- (void)setUtilityConstraintsKP:(id)a3;
- (void)setupDatabaseMaintenance;
- (void)setupPrewarmSuspendListener;
- (void)setupTimers;
- (void)solicitActivityResubmission;
- (void)start;
- (void)startedActivities:(id)a3;
- (void)statisticsWithHandler:(id)a3;
- (void)submitActivities:(id)a3;
- (void)submitActivity:(id)a3;
- (void)submitActivity:(id)a3 inGroup:(id)a4;
- (void)submitActivity:(id)a3 inGroup:(id)a4 withHandler:(id)a5;
- (void)submitRateLimitConfiguration:(id)a3 handler:(id)a4;
- (void)submittedActivitiesWithHandler:(id)a3;
- (void)suspendActivities:(id)a3;
- (void)suspendActivitiesWithIdentifiers:(id)a3;
- (void)suspendActivity:(id)a3;
- (void)suspendPlugin:(id)a3;
- (void)unprotectedEvaluateScoreAndRunActivities:(id)a3;
- (void)updateActivity:(id)a3 withParameters:(id)a4;
- (void)updateCompletionStatus:(BOOL)a3 forOngoingTask:(id)a4;
- (void)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5 handler:(id)a6;
- (void)updateOngoingTask:(id)a3 completionHandler:(id)a4;
- (void)updateOnlyPreemptiveSuspend:(BOOL)a3;
- (void)updateProgressForOngoingTask:(id)a3 completionHandler:(id)a4;
- (void)updateSuspendRequestDate:(id)a3 forActivity:(id)a4 withReason:(id)a5;
- (void)updateSystemConstraintsWithParameters:(id)a3;
- (void)updateTrialParameters;
- (void)updateiCPLTasksBlocked:(unint64_t)a3;
- (void)warnBGTaskClientsForActivitiesAboutToExpire:(id)a3;
@end

@implementation _DASDaemon

+ (_DASDaemon)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100074CA0;
  block[3] = &unk_100114FE0;
  block[4] = a1;
  if (qword_100157C40 != -1) {
    dispatch_once(&qword_100157C40, block);
  }
  return (_DASDaemon *)(id)qword_100157C48;
}

- (id)initAsAnonymous:(BOOL)a3 withContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v146.receiver = self;
  v146.super_class = (Class)&OBJC_CLASS____DASDaemon;
  v7 = -[_DASDaemon init](&v146, "init");
  v8 = v7;
  if (v7)
  {
    BOOL v133 = v4;
    -[_DASDaemon setupPrewarmSuspendListener](v7, "setupPrewarmSuspendListener");
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.dasscheduler.batchingqueue.taskevaluation", v10);
    evaluationQueue = v8->_evaluationQueue;
    v8->_evaluationQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    clients = v8->_clients;
    v8->_clients = (NSMutableArray *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    connectedBGTaskClients = v8->_connectedBGTaskClients;
    v8->_connectedBGTaskClients = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    activitiesWaitingForBGTaskClients = v8->_activitiesWaitingForBGTaskClients;
    v8->_activitiesWaitingForBGTaskClients = (NSMutableDictionary *)v17;

    v8->_activityStateLock = 0LL;
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    pendingTasks = v8->_pendingTasks;
    v8->_pendingTasks = (NSMutableSet *)v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    prerunningTasks = v8->_prerunningTasks;
    v8->_prerunningTasks = (NSMutableSet *)v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    runningTasks = v8->_runningTasks;
    v8->_runningTasks = (NSMutableSet *)v23;

    v8->_recomEngineDisabled = 0;
    v8->_groupLock._os_unfair_lock_opaque = 0;
    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    groups = v8->_groups;
    v8->_groups = (NSMutableDictionary *)v25;

    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    groupToPendingTasks = v8->_groupToPendingTasks;
    v8->_groupToPendingTasks = (NSMutableDictionary *)v27;

    uint64_t v29 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    groupToRunningTasks = v8->_groupToRunningTasks;
    v8->_groupToRunningTasks = (NSMutableDictionary *)v29;

    uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    groupToPrerunningTasks = v8->_groupToPrerunningTasks;
    v8->_groupToPrerunningTasks = (NSMutableDictionary *)v31;

    v8->_applicationLaunchRequestsLock = 0LL;
    uint64_t v33 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    applicationLaunchRequests = v8->_applicationLaunchRequests;
    v8->_applicationLaunchRequests = (NSMutableDictionary *)v33;

    uint64_t v35 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    applicationsLaunched = v8->_applicationsLaunched;
    v8->_applicationsLaunched = (NSMutableDictionary *)v35;

    uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    extensionLaunchRequests = v8->_extensionLaunchRequests;
    v8->_extensionLaunchRequests = (NSMutableDictionary *)v37;

    uint64_t v39 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    recentlyLaunchedApps = v8->_recentlyLaunchedApps;
    v8->_recentlyLaunchedApps = (NSMutableDictionary *)v39;

    v41 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.dasd.testingDefaults");
    testingDefaults = v8->_testingDefaults;
    v8->_testingDefaults = v41;

    uint64_t v43 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    powerAssertions = v8->_powerAssertions;
    v8->_powerAssertions = (NSMutableDictionary *)v43;

    -[_DASDaemon loadTestingDefaults](v8, "loadTestingDefaults");
    v134 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.duetactivityscheduler");
    uint64_t v45 = -[NSUserDefaults integerForKey:](v134, "integerForKey:", @"enRelaunchInterval");
    if ((_set_user_dir_suffix("com.apple.dasd") & 1) == 0)
    {
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Unable to set temporary file directory",  buf,  2u);
      }
    }

    id v47 = NSTemporaryDirectory();
    uint64_t v48 = objc_claimAutoreleasedReturnValue(+[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set"));
    launchesPerApp = v8->_launchesPerApp;
    v8->_launchesPerApp = (NSCountedSet *)v48;

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v51 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_source_t v52 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v51);
    launchTimeResetTimer = v8->_launchTimeResetTimer;
    v8->_launchTimeResetTimer = (OS_dispatch_source *)v52;

    v54 = (dispatch_source_s *)v8->_launchTimeResetTimer;
    dispatch_time_t v55 = dispatch_walltime(0LL, 3600000000000LL);
    dispatch_source_set_timer(v54, v55, 0x34630B8A000uLL, 0xDF8475800uLL);
    dispatch_set_qos_class_fallback(v8->_launchTimeResetTimer, 9LL);
    v56 = (dispatch_source_s *)v8->_launchTimeResetTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000756EC;
    handler[3] = &unk_1001150D0;
    v57 = v8;
    v144 = v57;
    dispatch_source_set_event_handler(v56, handler);
    dispatch_resume((dispatch_object_t)v8->_launchTimeResetTimer);
    v58 = v8->_evaluationQueue;
    v141[0] = _NSConcreteStackBlock;
    v141[1] = 3221225472LL;
    v141[2] = sub_10007575C;
    v141[3] = &unk_100116C50;
    v59 = v57;
    v142 = v59;
    uint64_t v60 = objc_claimAutoreleasedReturnValue( +[_DASBatchingQueue queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:]( &OBJC_CLASS____DASBatchingQueue,  "queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:",  @"com.apple.dasscheduler.triggerbatchingqueue",  10LL,  v58,  v141,  2.0));
    triggerBatchingQueue = v59->_triggerBatchingQueue;
    v59->_triggerBatchingQueue = (_DASBatchingQueue *)v60;

    uint64_t v62 = objc_claimAutoreleasedReturnValue( +[_DASBatchingQueue queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:]( &OBJC_CLASS____DASBatchingQueue,  "queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:",  @"com.apple.dasscheduler.triggerRecorder",  30LL,  v8->_evaluationQueue,  &stru_100116C90,  5.0));
    triggerRecorderBatchingQueue = v59->_triggerRecorderBatchingQueue;
    v59->_triggerRecorderBatchingQueue = (_DASBatchingQueue *)v62;

    v64 = v8->_evaluationQueue;
    v139[0] = _NSConcreteStackBlock;
    v139[1] = 3221225472LL;
    v139[2] = sub_1000757B8;
    v139[3] = &unk_100116C50;
    v65 = v59;
    v140 = v65;
    uint64_t v66 = objc_claimAutoreleasedReturnValue( +[_DASBatchingQueue queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:]( &OBJC_CLASS____DASBatchingQueue,  "queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:",  @"com.apple.dasscheduler.activitycompletionbatchingqueue",  15LL,  v64,  v139,  15.0));
    activityCompletedBatchingQueue = v65->_activityCompletedBatchingQueue;
    v65->_activityCompletedBatchingQueue = (_DASBatchingQueue *)v66;

    v68 = v8->_evaluationQueue;
    v137[0] = _NSConcreteStackBlock;
    v137[1] = 3221225472LL;
    v137[2] = sub_1000757C4;
    v137[3] = &unk_100116C50;
    v69 = v65;
    v138 = v69;
    uint64_t v70 = objc_claimAutoreleasedReturnValue( +[_DASBatchingQueue queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:]( &OBJC_CLASS____DASBatchingQueue,  "queueWithName:maxBatchingDelay:maxQueueDepth:queue:workItemsHandler:",  @"com.apple.das.networkActivitiesQueue",  256LL,  v68,  v137,  1.0));
    networkActivitiesQueue = v69->_networkActivitiesQueue;
    v69->_networkActivitiesQueue = (_DASBatchingQueue *)v70;

    if (v6) {
      v72 = (_CDLocalContext *)v6;
    }
    else {
      v72 = (_CDLocalContext *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](&OBJC_CLASS____CDClientContext, "userContext"));
    }
    context = v69->_context;
    v69->_context = v72;

    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Initializing DASDaemon...", buf, 2u);
    }

    uint64_t v75 = objc_claimAutoreleasedReturnValue( +[_DASUserRequestedBackupTaskManager managerWithContext:]( &OBJC_CLASS____DASUserRequestedBackupTaskManager,  "managerWithContext:",  v69->_context));
    backupTaskManager = v69->_backupTaskManager;
    v69->_backupTaskManager = (_DASUserRequestedBackupTaskManager *)v75;

    uint64_t v77 = objc_claimAutoreleasedReturnValue(+[_DASNetworkEvaluationMonitor sharedInstance](&OBJC_CLASS____DASNetworkEvaluationMonitor, "sharedInstance"));
    networkEvaluationMonitor = v69->_networkEvaluationMonitor;
    v69->_networkEvaluationMonitor = (_DASNetworkEvaluationMonitor *)v77;

    uint64_t v79 = objc_claimAutoreleasedReturnValue( +[_DASSleepWakeMonitor sharedMonitorWithDaemon:]( &OBJC_CLASS____DASSleepWakeMonitor,  "sharedMonitorWithDaemon:",  v69));
    sleepWakeMonitor = v69->_sleepWakeMonitor;
    v69->_sleepWakeMonitor = (_DASSleepWakeMonitor *)v79;

    -[_DASDaemon registerForNetworkPathEvaluation](v69, "registerForNetworkPathEvaluation");
    v81 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPolicyManager allPoliciesForPlatform]( &OBJC_CLASS____DASPolicyManager,  "allPoliciesForPlatform"));
    -[_DASDaemon registerTriggersWithContextStoreForPolicies:](v69, "registerTriggersWithContextStoreForPolicies:", v81);
    uint64_t v82 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    triggerToActivitiesMap = v69->_triggerToActivitiesMap;
    v69->_triggerToActivitiesMap = (NSMutableDictionary *)v82;

    uint64_t v84 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    activityToIncompatibleActivitiesMap = v69->_activityToIncompatibleActivitiesMap;
    v69->_activityToIncompatibleActivitiesMap = (NSMutableDictionary *)v84;

    dispatch_queue_attr_t v86 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v87 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v86);
    dispatch_queue_t v88 = dispatch_queue_create("com.apple.duetactivityscheduler.timeschedulingqueue", v87);
    timerSchedulingQueue = v69->_timerSchedulingQueue;
    v69->_timerSchedulingQueue = (OS_dispatch_queue *)v88;

    uint64_t v90 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    timerEarliestFireDate = v69->_timerEarliestFireDate;
    v69->_timerEarliestFireDate = (NSDate *)v90;

    uint64_t v92 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    timerLatestFireDate = v69->_timerLatestFireDate;
    v69->_timerLatestFireDate = (NSDate *)v92;

    uint64_t v94 = objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
    trialManager = v69->_trialManager;
    v69->_trialManager = (_DASTrialManager *)v94;

    v135[0] = _NSConcreteStackBlock;
    v135[1] = 3221225472LL;
    v135[2] = sub_1000758AC;
    v135[3] = &unk_1001150D0;
    v96 = v69;
    v136 = v96;
    uint64_t v97 = objc_claimAutoreleasedReturnValue(+[_DASTimer timerWithCallback:](&OBJC_CLASS____DASTimer, "timerWithCallback:", v135));
    id v98 = v96[23];
    v96[23] = (id)v97;

    [v96 setupTimers];
    uint64_t v99 = objc_claimAutoreleasedReturnValue( +[_DASCoreDataStore storageWithDirectory:readOnly:]( &OBJC_CLASS____DASCoreDataStore,  "storageWithDirectory:readOnly:",  @"/var/mobile/Library/DuetActivityScheduler",  0LL));
    id v100 = v96[30];
    v96[30] = (id)v99;

    if (v133)
    {
      v101 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    }

    else
    {
      v102 = objc_alloc(&OBJC_CLASS___NSXPCListener);
      v101 = -[NSXPCListener initWithMachServiceName:](v102, "initWithMachServiceName:", _DASDaemonServiceName);
    }

    id v103 = v96[20];
    v96[20] = v101;

    [v96[20] setDelegate:v96];
    uint64_t v104 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    id v105 = v96[21];
    v96[21] = (id)v104;

    [v96[21] setDelegate:v96];
    +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.startup",  1LL);
    dispatch_queue_attr_t v106 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v107 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v106);
    dispatch_queue_t v108 = dispatch_queue_create("com.apple.duetactivityscheduler.backgroundLaunchQueue", v107);
    id v109 = v96[48];
    v96[48] = v108;

    v110 = v69->_context;
    v111 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPhotosPolicy keyPathForPhotosIsBlocked]( &OBJC_CLASS____DASPhotosPolicy,  "keyPathForPhotosIsBlocked"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v110, "objectForKeyedSubscript:", v111));

    if (v112) {
      v96[57] = [v112 unsignedIntegerValue];
    }
    else {
      [v96 updateiCPLTasksBlocked:0];
    }
    *((_DWORD *)v96 + 4) = 0;
    uint64_t v113 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/das/utilityConstraints"));
    id v114 = v96[58];
    v96[58] = (id)v113;

    uint64_t v115 = objc_claimAutoreleasedReturnValue( +[_CDContextualKeyPath keyPathWithKey:]( &OBJC_CLASS____CDContextualKeyPath,  "keyPathWithKey:",  @"/das/maintenanceConstraints"));
    id v116 = v96[59];
    v96[59] = (id)v115;

    v117 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v69->_context, "objectForKeyedSubscript:", v96[58]));
    v118 = v117;
    if (v117) {
      v96[60] = [v117 unsignedIntegerValue];
    }
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v69->_context, "objectForKeyedSubscript:", v96[59]));
    v120 = v119;
    if (v119) {
      v96[61] = [v119 unsignedIntegerValue];
    }
    uint64_t v121 = objc_claimAutoreleasedReturnValue(+[_DASBudgetManager sharedInstance](&OBJC_CLASS____DASBudgetManager, "sharedInstance"));
    id v122 = v96[54];
    v96[54] = (id)v121;

    uint64_t v123 = objc_claimAutoreleasedReturnValue( +[_DASActivityDependencyManager sharedInstance]( &OBJC_CLASS____DASActivityDependencyManager,  "sharedInstance"));
    id v124 = v96[55];
    v96[55] = (id)v123;

    v125 = -[_DASAssertionArbiter initWithDelegate:]( objc_alloc(&OBJC_CLASS____DASAssertionArbiter),  "initWithDelegate:",  v96);
    id v126 = v96[56];
    v96[56] = v125;

    v127 = objc_opt_new(&OBJC_CLASS____DASFairScheduleManager);
    id v128 = v96[39];
    v96[39] = v127;

    uint64_t v129 = objc_claimAutoreleasedReturnValue(+[_DASFeatureDurationTracker sharedInstance](&OBJC_CLASS____DASFeatureDurationTracker, "sharedInstance"));
    id v130 = v96[44];
    v96[44] = (id)v129;

    v131 = (void *)objc_claimAutoreleasedReturnValue(+[_DASIssueDetector sharedInstance](&OBJC_CLASS____DASIssueDetector, "sharedInstance"));
    [v131 schedule];
  }

  return v8;
}

- (void)solicitActivityResubmission
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Soliciting activities for resubmission.",  v3,  2u);
  }

  notify_post((const char *)[@"com.appple.duet.activityscheduler.requestActivityResubmission" UTF8String]);
}

- (void)registerForTrial
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[_DASTrialManager sharedInstance](&OBJC_CLASS____DASTrialManager, "sharedInstance"));
  [v3 addDelegate:self];
}

- (void)updateTrialParameters
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTrialManager factorWithName:](self->_trialManager, "factorWithName:", @"APRS_Disabled"));
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v13[0] = 67109120;
      v13[1] = [v3 BOOLeanValue];
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Trial: recomEngineDisabled set to %d",  (uint8_t *)v13,  8u);
    }

    self->_recomEngineDisabled = [v3 BOOLeanValue];
  }

  else
  {
    if (v5)
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Trial: Failed to load recomEngineDisabled",  (uint8_t *)v13,  2u);
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"Sched_MaxAllowableDurationSeconds"));
  v7 = v6;
  if (v6) {
    [v6 doubleValue];
  }
  uint64_t v8 = qword_100156D50;
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"Sched_DefaultGroupMax"));

  if (v9) {
    qword_100156D50 = (uint64_t)[v9 longValue];
  }
  uint64_t v10 = qword_100156D58;
  dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTrialManager factorWithName:]( self->_trialManager,  "factorWithName:",  @"Sched_NetworkDefaultGroupMax"));

  if (v11)
  {
    id v12 = [v11 longValue];
    qword_100156D58 = (uint64_t)v12;
  }

  else
  {
    id v12 = (id)qword_100156D58;
  }

  if (qword_100156D50 != v8 || v12 != (id)v10) {
    -[_DASDaemon createDefaultActivityGroups](self, "createDefaultActivityGroups");
  }
}

- (void)assertionArbiter:(id)a3 didIssueWarningFor:(id)a4
{
  id v4 = a4;
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received assertion warning for %@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)assertionArbiter:(id)a3 didIssueInvalidationFor:(id)a4 serverInitiated:(BOOL)a5
{
  id v5 = a4;
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received assertion invalidation for %@",  (uint8_t *)&v7,  0xCu);
  }
}

- (id)assertionArbiter:(id)a3 clientWithPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon connectedBGTaskClients](self, "connectedBGTaskClients"));
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon connectedBGTaskClients](self, "connectedBGTaskClients"));
  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

  objc_sync_exit(v7);
  return v10;
}

- (void)createAssertion:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl("DAS", "activity_prevent_sleep"))
  {
    if (([v4 requestsApplicationLaunch] & 1) == 0)
    {
      unsigned int v5 = +[_DASSystemContext isPluggedIn:]( &OBJC_CLASS____DASSystemContext,  "isPluggedIn:",  self->_context);
      if ((v5 & 1) != 0 || [v4 preventDeviceSleep])
      {
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
          *(_DWORD *)buf = 138412802;
          v34 = v7;
          __int16 v35 = 1024;
          *(_DWORD *)v36 = [v4 preventDeviceSleep];
          *(_WORD *)&v36[4] = 1024;
          *(_DWORD *)&v36[6] = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Activity %@ has preventDeviceSleep %d. PluggedIn state: %d",  buf,  0x18u);
        }

        else {
          id v8 = &stru_100118C98;
        }
        dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DASActivity%@:%@",  v8,  v9));

        dispatch_queue_t v11 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
        v31[0] = @"AssertType";
        v31[1] = @"AssertName";
        v32[0] = @"PreventUserIdleSystemSleep";
        v32[1] = v10;
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
        uint64_t v13 = -[NSMutableDictionary initWithDictionary:](v11, "initWithDictionary:", v12);

        if ([v4 pid])
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 pid]));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v14,  @"AssertionOnBehalfOfPID");
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"AllowsDeviceRestart");
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
        objc_sync_enter(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v17]);

        if (v18)
        {
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
            v22 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v22]);
            *(_DWORD *)buf = 138412546;
            v34 = v20;
            __int16 v35 = 2112;
            *(void *)v36 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Assertion already exists for UUID %@ %@",  buf,  0x16u);
          }

          goto LABEL_23;
        }

        IOPMAssertionID AssertionID = 0;
        IOReturn v24 = IOPMAssertionCreateWithProperties((CFDictionaryRef)v13, &AssertionID);
        if (v24)
        {
          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v34) = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Failed to create an assertion 0x%x",  buf,  8u);
          }
        }

        else
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  AssertionID));
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
          v28 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
          [v27 setObject:v26 forKeyedSubscript:v28];

          if (![v4 preventDeviceSleep])
          {
LABEL_23:
            objc_sync_exit(v15);

            goto LABEL_24;
          }

          uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
            *(_DWORD *)buf = 138412546;
            v34 = v29;
            __int16 v35 = 1024;
            *(_DWORD *)v36 = AssertionID;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Creating assertion for  %@ %u",  buf,  0x12u);
          }
        }

        goto LABEL_23;
      }
    }
  }

- (void)releaseAssertion:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl("DAS", "activity_prevent_sleep"))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
    objc_sync_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v7]);

    if (v8)
    {
      IOPMAssertionID v9 = [v8 unsignedIntValue];
      if ([v4 preventDeviceSleep])
      {
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
          int v14 = 138412546;
          uint64_t v15 = v11;
          __int16 v16 = 1024;
          IOPMAssertionID v17 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Releasing assertion for %@ %u",  (uint8_t *)&v14,  0x12u);
        }
      }

      IOPMAssertionRelease(v9);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
      [v12 removeObjectForKey:v13];
    }

    objc_sync_exit(v5);
  }
}

- (void)releaseAssertions:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl("DAS", "activity_prevent_sleep"))
  {
    id v18 = v4;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
    objc_sync_enter(obj);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v5);
          }
          IOPMAssertionID v9 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
          dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

          if (v12)
          {
            IOPMAssertionID v13 = [v12 unsignedIntValue];
            int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
              *(_DWORD *)buf = 138412546;
              uint64_t v25 = v15;
              __int16 v26 = 1024;
              IOPMAssertionID v27 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Releasing assertion for %@ %u",  buf,  0x12u);
            }

            IOPMAssertionRelease(v13);
            __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
            IOPMAssertionID v17 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
            [v16 removeObjectForKey:v17];
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }

      while (v6);
    }

    objc_sync_exit(obj);
    id v4 = v18;
  }
}

- (void)evaluateAssertions
{
  if (_os_feature_enabled_impl("DAS", "activity_prevent_sleep")
    && (+[_DASSystemContext isPluggedIn:](&OBJC_CLASS____DASSystemContext, "isPluggedIn:", self->_context) & 1) == 0)
  {
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Evaluating assertions on pluggedIn state change",  buf,  2u);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
    objc_sync_enter(v5);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon powerAssertions](self, "powerAssertions"));
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        IOPMAssertionID v9 = 0LL;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[_DASDaemon getActivityRunningWithUUID:]( self,  "getActivityRunningWithUUID:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v9)));
          dispatch_queue_t v11 = v10;

          IOPMAssertionID v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }

      while (v7);
    }

    objc_sync_exit(v5);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v12 = v4;
    id v13 = [v12 countByEnumeratingWithState:&v16 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          -[_DASDaemon releaseAssertion:]( self,  "releaseAssertion:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v15),  (void)v16);
          uint64_t v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v16 objects:v25 count:16];
      }

      while (v13);
    }
  }

- (void)setupTimers
{
  id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_evaluationQueue);
  optimalScoringTimer = self->_optimalScoringTimer;
  self->_optimalScoringTimer = v3;

  dispatch_set_qos_class_fallback(self->_optimalScoringTimer, 17LL);
  id v5 = self->_optimalScoringTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100076B4C;
  handler[3] = &unk_1001150D0;
  void handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
  id v6 = self->_optimalScoringTimer;
  dispatch_time_t v7 = dispatch_walltime(0LL, 21600000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v6, v7, 0x13A52453C000uLL, 0x34630B8A000uLL);
  dispatch_resume((dispatch_object_t)self->_optimalScoringTimer);
  -[_DASDaemon setupDatabaseMaintenance](self, "setupDatabaseMaintenance");
  uint64_t v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.dasd.groupsqueue", 0LL);
  groupMonitoringQueue = self->_groupMonitoringQueue;
  self->_groupMonitoringQueue = v8;

  uint64_t v10 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_groupMonitoringQueue);
  groupMonitoringTimer = self->_groupMonitoringTimer;
  self->_groupMonitoringTimer = v10;

  dispatch_set_qos_class_fallback(self->_groupMonitoringTimer, 17LL);
  id v12 = self->_groupMonitoringTimer;
  dispatch_time_t v13 = dispatch_walltime(0LL, 180000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v12, v13, 0x29E8D60800uLL, 0x3B9ACA00uLL);
  uint64_t v14 = self->_groupMonitoringTimer;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100076B54;
  v15[3] = &unk_1001150D0;
  v15[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v14, v15);
  dispatch_activate((dispatch_object_t)self->_groupMonitoringTimer);
}

- (void)scheduleTimerForActivity:(id)a3
{
  id v4 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 predictedOptimalStartDate]);
  [v6 timeIntervalSinceDate:v13];
  double v8 = v7;
  IOPMAssertionID v9 = (void *)objc_claimAutoreleasedReturnValue([v4 startBefore]);
  [v9 timeIntervalSinceDate:v13];
  double v11 = v10;
  id v12 = [v4 schedulingPriority];

  -[_DASDaemon scheduleTimerOnBehalfOf:between:and:waking:]( self,  "scheduleTimerOnBehalfOf:between:and:waking:",  v5,  (unint64_t)v12 > _DASSchedulingPriorityUtility,  v8,  v11);
}

- (void)scheduleTimerOnBehalfOf:(id)a3 between:(double)a4 and:(double)a5 waking:(BOOL)a6
{
  id v10 = a3;
  timerSchedulingQueue = (dispatch_queue_s *)self->_timerSchedulingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100077158;
  block[3] = &unk_100116CB8;
  double v15 = a4;
  double v16 = a5;
  BOOL v17 = a6;
  block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_sync(timerSchedulingQueue, block);
}

- (void)setupDatabaseMaintenance
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  id v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v4);
  databaseMaintenanceTimer = self->_databaseMaintenanceTimer;
  self->_databaseMaintenanceTimer = v5;

  dispatch_set_qos_class_fallback(self->_databaseMaintenanceTimer, 5LL);
  double v7 = self->_databaseMaintenanceTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000774C4;
  handler[3] = &unk_1001150D0;
  void handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
  double v8 = self->_databaseMaintenanceTimer;
  dispatch_time_t v9 = dispatch_walltime(0LL, 86400000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v8, v9, 0x4E94914F0000uLL, 0x4E94914F0000uLL);
  dispatch_resume((dispatch_object_t)self->_databaseMaintenanceTimer);
}

- (void)removeDuplicateLaunchTasks:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id obj = v3;
  id v31 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v44;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v43 + 1) + 8 * v5);
        else {
          uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 name]);
        }
        v32 = (void *)v7;
        uint64_t v33 = v5;
        double v8 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v7]);
        if (!v8) {
          double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        }
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        id v9 = v8;
        id v10 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v40;
          do
          {
            for (i = 0LL; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v40 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
              if ([v6 isBackgroundTaskActivity]
                && [v14 isBackgroundTaskActivity]
                && [v6 shouldReplaceActivity:v14 andKeepsSubmitted:&v38])
              {
                int v15 = v38;
                double v16 = (void *)objc_claimAutoreleasedReturnValue([v6 submitDate]);
                BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v14 submitDate]);
                [v16 timeIntervalSinceDate:v17];
                if (v15) {
                  double v19 = -v18;
                }
                else {
                  double v19 = v18;
                }

                if (v19 <= 0.0) {
                  __int128 v20 = v6;
                }
                else {
                  __int128 v20 = v14;
                }
                [v4 addObject:v20];
              }
            }

            id v11 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
          }

          while (v11);
        }

        uint64_t v5 = v33 + 1;
      }

      while ((id)(v33 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }

    while (v31);
  }

  [obj minusSet:v4];
  __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"persistence"));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_1000B73E4();
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v22 = v4;
  id v23 = [v22 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        -[_DASDataStore deleteActivity:]( self->_store,  "deleteActivity:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)j));
      }

      id v24 = [v22 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }

    while (v24);
  }
}

- (void)loadState
{
  id v3 = objc_alloc_init(&OBJC_CLASS____DASDataProtectionStateMonitor);
  uint64_t v14 = 0LL;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  uint64_t v9 = 0LL;
  id v10 = (os_unfair_lock_s *)&v9;
  uint64_t v11 = 0x2810000000LL;
  uint64_t v12 = &unk_10010A1B3;
  int v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100077A08;
  v8[3] = &unk_100116CE0;
  v8[5] = &v9;
  v8[6] = &v14;
  v8[4] = self;
  -[_DASDataProtectionStateMonitor setChangeHandler:](v3, "setChangeHandler:", v8);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDataProtectionStateMonitor dataProtectionClassC]( &OBJC_CLASS____DASDataProtectionStateMonitor,  "dataProtectionClassC"));
  unsigned __int8 v5 = -[_DASDataProtectionStateMonitor isDataAvailableFor:](v3, "isDataAvailableFor:", v4);

  if ((v5 & 1) != 0)
  {
    os_unfair_lock_lock(v10 + 8);
    if (!*((_BYTE *)v15 + 24))
    {
      -[_DASDaemon loadStateWhenAvailable](self, "loadStateWhenAvailable");
      *((_BYTE *)v15 + 24) = 1;
    }

    os_unfair_lock_unlock(v10 + 8);
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Class C not yet available. Not loading activities",  v7,  2u);
    }
  }

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v14, 8);
}

- (void)loadStateWhenAvailable
{
  id v3 = (void *)os_transaction_create("com.apple.dasd.loadState");
  id v4 = objc_autoreleasePoolPush();
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Loading saved activities.", buf, 2u);
  }

  -[_DASDataStore deleteActivitiesIfRequired](self->_store, "deleteActivitiesIfRequired");
  -[_DASDataStore loadPendingLaunchTasks:](self->_store, "loadPendingLaunchTasks:", v5);
  -[_DASDataStore loadAllGroups:](self->_store, "loadAllGroups:", v6);
  -[_DASDaemon removeDuplicateLaunchTasks:](self, "removeDuplicateLaunchTasks:", v5);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (!v9)
  {

LABEL_20:
    -[_DASDaemon createDefaultActivityGroups](self, "createDefaultActivityGroups");
    goto LABEL_21;
  }

  id v10 = v9;
  uint64_t v25 = v5;
  __int16 v26 = v4;
  IOPMAssertionID v27 = v3;
  uint64_t v29 = 0LL;
  int v28 = 0;
  uint64_t v11 = *(void *)v31;
  do
  {
    for (i = 0LL; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v31 != v11) {
        objc_enumerationMutation(v8);
      }
      int v13 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger defaultCategory]( &OBJC_CLASS____DASDaemonLogger,  "defaultCategory",  v25,  v26,  v27));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
        id v16 = [v13 maxConcurrent];
        *(_DWORD *)buf = 138412546;
        __int128 v35 = v15;
        __int16 v36 = 2048;
        id v37 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Loading group %@ (capacity=%lld).",  buf,  0x16u);
      }

      os_unfair_lock_lock(&self->_groupLock);
      groups = self->_groups;
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v13 name]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](groups, "setObject:forKeyedSubscript:", v13, v18);

      os_unfair_lock_unlock(&self->_groupLock);
      double v19 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
      LOBYTE(v18) = [v19 isEqualToString:_DASDefaultNetworkGroupName];

      if ((v18 & 1) != 0)
      {
        LODWORD(v29) = 1;
      }

      else
      {
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
        unsigned __int8 v21 = [v20 isEqualToString:_DASDefaultGroupName];

        if ((v21 & 1) != 0)
        {
          int v28 = 1;
        }

        else
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
          unsigned int v23 = [v22 isEqualToString:_DASDefaultRemoteGroupName];

          HIDWORD(v29) |= v23;
        }
      }
    }

    id v10 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
  }

  while (v10);

  id v4 = v26;
  id v3 = v27;
  unsigned __int8 v5 = v25;
LABEL_21:
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  -[_DASDaemon submitActivities:](self, "submitActivities:", v24);

  objc_autoreleasePoolPop(v4);
}

- (void)loadTestingDefaults
{
  id v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_testingDefaults,  "objectForKey:",  @"testModeParameters"));
  testModeParameters = self->_testModeParameters;
  self->_testModeParameters = v3;

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_testingDefaults, "objectForKey:", @"testModeLastUpdated"));
  id v6 = (void *)v5;
  if (self->_testModeParameters) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v8 timeIntervalSinceDate:v6];
    if (v9 > 86400.0)
    {
      id v10 = self->_testModeParameters;
      self->_testModeParameters = 0LL;

      -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", 0LL, @"testModeParameters");
    }

    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = self->_testModeParameters;
      int v24 = 138412290;
      uint64_t v25 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Test mode parameters: %@",  (uint8_t *)&v24,  0xCu);
    }
  }

  int v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_testingDefaults,  "objectForKey:",  @"pausedParameters"));
  pausedParameters = self->_pausedParameters;
  self->_pausedParameters = v13;

  if (self->_pausedParameters)
  {
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = self->_pausedParameters;
      int v24 = 138412290;
      uint64_t v25 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Paused parameters: %@",  (uint8_t *)&v24,  0xCu);
    }
  }

  char v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_testingDefaults, "objectForKey:", @"taskRegistryMode"));
  self->_BOOL taskRegistryMode = v17 != 0LL;

  if (self->_taskRegistryMode)
  {
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL taskRegistryMode = self->_taskRegistryMode;
      int v24 = 67109120;
      LODWORD(v25) = taskRegistryMode;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Task Registry Mode: %i", (uint8_t *)&v24, 8u);
    }
  }

  __int128 v20 = (NSSet *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults objectForKey:]( self->_testingDefaults,  "objectForKey:",  @"taskRegistryProcesses"));
  taskRegistryProcesses = self->_taskRegistryProcesses;
  self->_taskRegistryProcesses = v20;

  if (self->_taskRegistryProcesses)
  {
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v23 = self->_taskRegistryProcesses;
      int v24 = 138412290;
      uint64_t v25 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Task Registry Processes: %@",  (uint8_t *)&v24,  0xCu);
    }
  }
}

- (int64_t)capacityFromGroupMax:(int64_t)a3 forPriority:(unint64_t)a4
{
  if (_DASSchedulingPriorityUserInitiatedOvercommit <= a4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return a3 << (_DASSchedulingPriorityUserInitiated <= a4);
  }
}

- (int64_t)currentLoadFromActivities:(id)a3 inGroupWithName:(id)a4
{
  id v5 = a3;
  if ([a4 hasPrefix:@"com.apple.dasd"])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v28 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v30;
      double v11 = 0.0;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          int v13 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 startDate]);
          [v14 timeIntervalSinceDate:v6];
          double v16 = v15;

          if (v16 > 0.0)
          {
            char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle(activityGroup)"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v13 startDate]);
              *(_DWORD *)buf = 138412546;
              __int128 v34 = v13;
              __int16 v35 = 2112;
              __int16 v36 = v23;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Adjusting start date for %@ to %@",  buf,  0x16u);
            }

            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 dateByAddingTimeInterval:-300.0]);
            [v13 setStartDate:v18];
          }

          double v19 = (void *)objc_claimAutoreleasedReturnValue([v13 startDate]);
          if (v19)
          {
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v13 startDate]);
            [v6 timeIntervalSinceDate:v20];
            double v22 = v21;
          }

          else
          {
            double v22 = 0.0;
          }

          double v11 = v11 + exp(v22 * -0.6931472 / 2700.0);
        }

        id v9 = [v7 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }

      while (v9);
    }

    else
    {
      double v11 = 0.0;
    }

    id v25 = [v7 count];
    double v26 = ceil(v11);
    id v24 = (id)(uint64_t)v26;

    id v5 = v28;
  }

  else
  {
    id v24 = [v5 count];
  }

  return (int64_t)v24;
}

- (int64_t)additionalCapacityForActivity:(id)a3 inGroupWithName:(id)a4 shouldTryToSuspend:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    os_unfair_lock_lock(&self->_groupLock);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_groups, "objectForKeyedSubscript:", v9));
    v57 = v10;
    if (v10) {
      uint64_t v11 = (uint64_t)[v10 maxConcurrent];
    }
    else {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    os_unfair_lock_unlock(&self->_groupLock);
    os_unfair_lock_lock(&self->_groupLock);
    int v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToPrerunningTasks,  "objectForKeyedSubscript:",  v9));
    id v14 = [v13 copy];
    double v15 = v14;
    if (v14) {
      id v16 = v14;
    }
    else {
      id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    id v17 = v16;

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToRunningTasks,  "objectForKeyedSubscript:",  v9));
    id v19 = [v18 copy];
    __int128 v20 = v19;
    if (v19) {
      id v21 = v19;
    }
    else {
      id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    }
    double v22 = v21;

    v56 = v22;
    v59 = v17;
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 setByAddingObjectsFromSet:v17]);
    unsigned __int8 v24 = [v23 containsObject:v8];
    v58 = v23;
    int64_t v25 = -[_DASDaemon currentLoadFromActivities:inGroupWithName:]( self,  "currentLoadFromActivities:inGroupWithName:",  v23,  v9);
    double v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle(activityGroup)"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v67 = v9;
      __int16 v68 = 2048;
      int64_t v69 = v25;
      __int16 v70 = 2048;
      id v71 = [v59 count];
      _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "%@: Current Load=%lld (Pre-running=%lld)",  buf,  0x20u);
    }

    os_unfair_lock_unlock(&self->_groupLock);
    if ((v24 & 1) != 0)
    {
      int64_t v12 = 1LL;
      IOPMAssertionID v27 = v58;
      id v28 = v59;
    }

    else
    {
      int64_t v12 = v11 - v25;
      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      IOPMAssertionID v27 = v58;
      id v29 = [v58 mutableCopy];
      __int128 v30 = v29;
      id v28 = v59;
      if (v5 && v12 <= 0)
      {
        id v53 = v29;
        int64_t v54 = v12;
        id v55 = v9;
        __int128 v63 = 0u;
        __int128 v64 = 0u;
        __int128 v61 = 0u;
        __int128 v62 = 0u;
        id v31 = v58;
        id v32 = [v31 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v62;
          do
          {
            __int16 v35 = 0LL;
            do
            {
              if (*(void *)v62 != v34) {
                objc_enumerationMutation(v31);
              }
              __int16 v36 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)v35);
              id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 suspendRequestDate]);

              if (!v37)
              {
                unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue([v36 startDate]);
                __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
                unsigned int v40 = -[_DASDaemon shouldSuspendLongRunningActivity:withStartDate:whileBlockingOtherTasks:atDate:]( self,  "shouldSuspendLongRunningActivity:withStartDate:whileBlockingOtherTasks:atDate:",  v36,  v38,  1LL,  v39);

                if (v40)
                {
                  __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"runtimeLimiter"));
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    id v67 = v36;
                    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Group full! Found long running activity %{public}@ to suspend",  buf,  0xCu);
                  }

                  -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:]( self,  "updateSuspendRequestDate:forActivity:withReason:",  v60,  v36,  @"Limitations");
                  -[_DASDaemon suspendActivity:](self, "suspendActivity:", v36);
                }

                uint64_t v42 = objc_claimAutoreleasedReturnValue([v8 fastPass]);
                if (v42)
                {
                  __int128 v43 = (void *)v42;
                  unsigned int v44 = -[_DASDaemon shouldPreemptActivity:forFastPassActivity:]( self,  "shouldPreemptActivity:forFastPassActivity:",  v36,  v8);

                  if (v44)
                  {
                    __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger defaultCategory]( &OBJC_CLASS____DASDaemonLogger,  "defaultCategory"));
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543618;
                      id v67 = v36;
                      __int16 v68 = 2114;
                      int64_t v69 = (int64_t)v8;
                      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Preempting %{public}@ to unblock the associated fast pass %{public}@",  buf,  0x16u);
                    }

                    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                    -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:]( self,  "updateSuspendRequestDate:forActivity:withReason:",  v46,  v36,  @"Preemption");

                    -[_DASDaemon suspendActivity:](self, "suspendActivity:", v36);
                  }
                }
              }

              __int16 v35 = (char *)v35 + 1;
            }

            while (v33 != v35);
            id v47 = [v31 countByEnumeratingWithState:&v61 objects:v65 count:16];
            id v33 = v47;
          }

          while (v47);
        }

        id v48 = [v8 schedulingPriority];
        if ((unint64_t)v48 <= _DASSchedulingPriorityDefault)
        {
          v49 = 0LL;
          int64_t v12 = v54;
          id v9 = v55;
          IOPMAssertionID v27 = v58;
          id v28 = v59;
          __int128 v30 = v53;
        }

        else
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue( -[_DASDaemon candidateGroupActivityForPreemption:]( self,  "candidateGroupActivityForPreemption:",  v31));
          int64_t v12 = v54;
          id v9 = v55;
          id v28 = v59;
          __int128 v30 = v53;
          if (v49)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue([v8 suspendRequestDate]);

            if (!v50)
            {
              v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                id v67 = v49;
                __int16 v68 = 2114;
                int64_t v69 = (int64_t)v8;
                _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Preempting %{public}@ to unblock high priority %{public}@",  buf,  0x16u);
              }

              -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:]( self,  "updateSuspendRequestDate:forActivity:withReason:",  v60,  v49,  @"Preemption");
              -[_DASDaemon suspendActivity:](self, "suspendActivity:", v49);
            }
          }

          IOPMAssertionID v27 = v58;
        }
      }
    }
  }

  else
  {
    int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (void)cancelLaunchesOfTypes:(id)a3 forApps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  double v22 = self;
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options();
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id obj = v7;
  id v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v22->_applicationLaunchRequests,  "objectForKeyedSubscript:",  v10));
        id v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v25;
          do
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)j);
              if (([v16 isContactTracingBackgroundActivity] & 1) == 0)
              {
                id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 launchReason]);
                unsigned int v18 = [v6 containsObject:v17];

                if (v18) {
                  [v8 addObject:v16];
                }
              }
            }

            id v13 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v13);
        }
      }

      id v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v23);
  }

  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  -[_DASDaemon cancelActivities:](v22, "cancelActivities:", v8);
}

- (void)cancelPushLaunchTasksForApps:(id)a3
{
  uint64_t v4 = _DASLaunchReasonBackgroundRemoteNotification;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));
  -[_DASDaemon cancelLaunchesOfTypes:forApps:](self, "cancelLaunchesOfTypes:forApps:", v6, v5);
}

- (void)cancelAppRefreshTasksForApps:(id)a3
{
  uint64_t v4 = _DASLaunchReasonBackgroundRefresh;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));
  -[_DASDaemon cancelLaunchesOfTypes:forApps:](self, "cancelLaunchesOfTypes:forApps:", v6, v5);
}

- (void)cancelBackgroundTasksForApps:(id)a3
{
  uint64_t v4 = _DASLaunchReasonBackgroundRefresh;
  uint64_t v5 = _DASLaunchReasonBackgroundProcessing;
  uint64_t v6 = _DASLaunchReasonHealthResearch;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v4, v5, v6, 0LL));
  -[_DASDaemon cancelLaunchesOfTypes:forApps:](self, "cancelLaunchesOfTypes:forApps:", v8, v7);
}

- (void)cancelContactTracingTasksForApps:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  os_unfair_recursive_lock_lock_with_options();
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)i);
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_applicationLaunchRequests,  "objectForKeyedSubscript:",  v10));
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)j);
            }

            id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }

          while (v13);
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v7);
  }

  os_unfair_recursive_lock_unlock(&self->_applicationLaunchRequestsLock);
  -[_DASDaemon cancelActivities:](self, "cancelActivities:", v5);
}

- (void)cancelAllBackgroundTasks
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0LL);
  applicationLaunchRequests = self->_applicationLaunchRequests;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007910C;
  v6[3] = &unk_100116D08;
  id v7 = v3;
  id v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( applicationLaunchRequests,  "enumerateKeysAndObjectsUsingBlock:",  v6);

  os_unfair_recursive_lock_unlock(&self->_applicationLaunchRequestsLock);
  -[_DASDaemon cancelActivities:](self, "cancelActivities:", v5);
}

- (void)delayLaunchesOfType:(id)a3 forApps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v33 = self;
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  uint64_t v10 = (void *)v8;
  __int128 v31 = p_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(p_applicationLaunchRequestsLock, 0LL);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v11 = v7;
  id v34 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v44;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(v11);
        }
        uint64_t v35 = v12;
        uint64_t v13 = *(void *)(*((void *)&v43 + 1) + 8 * v12);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v33->_applicationLaunchRequests,  "objectForKeyedSubscript:",  v13,  v31));
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v42 = 0u;
        id v38 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v38)
        {
          uint64_t v15 = *(void *)v40;
          __int16 v36 = v14;
          uint64_t v37 = *(void *)v40;
          do
          {
            for (i = 0LL; i != v38; i = (char *)i + 1)
            {
              if (*(void *)v40 != v15) {
                objc_enumerationMutation(v14);
              }
              id v17 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
              __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 launchReason]);
              unsigned int v19 = [v18 isEqualToString:v6];

              if (v19)
              {
                __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 startAfter]);
                __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v13]);
                [v21 doubleValue];
                __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:"));

                [v22 timeIntervalSinceDate:v20];
                if (v23 > 0.0)
                {
                  double v24 = v23;
                  [v17 setStartAfter:v22];
                  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v17 startBefore]);
                  uint64_t v26 = v13;
                  id v27 = v6;
                  id v28 = v11;
                  __int128 v29 = v10;
                  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v25 dateByAddingTimeInterval:v24]);
                  [v17 setStartBefore:v30];

                  uint64_t v10 = v29;
                  id v11 = v28;
                  id v6 = v27;
                  uint64_t v13 = v26;
                  uint64_t v14 = v36;
                }

                uint64_t v15 = v37;
              }
            }

            id v38 = [v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }

          while (v38);
        }

        uint64_t v12 = v35 + 1;
      }

      while ((id)(v35 + 1) != v34);
      id v34 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }

    while (v34);
  }

  os_unfair_recursive_lock_unlock(v31);
}

- (BOOL)addLaunchRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]);
  id v6 = [v5 count];

  if (!v6)
  {
    BOOL v28 = 1;
    goto LABEL_49;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0LL);
  unsigned int v10 = [v4 requestsExtensionLaunch];
  uint64_t v11 = 16LL;
  if (v10) {
    uint64_t v11 = 18LL;
  }
  uint64_t v12 = (&self->super.isa)[v11];
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
    *(_DWORD *)buf = 138412802;
    v51 = v14;
    __int16 v52 = 2112;
    id v53 = v8;
    __int16 v54 = 2112;
    id v55 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Adding a launch request (%@) for application %@ by activity %@",  buf,  0x20u);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v8));
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v51 = v8;
    __int16 v52 = 2112;
    id v53 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Pre-existing launch requests for %@: %@",  buf,  0x16u);
  }

  if (!v15)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[objc_class setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v15, v8);
  }

  buf[0] = 1;
  if (![v4 isBackgroundTaskActivity])
  {
    __int128 v42 = 0uLL;
    __int128 v43 = 0uLL;
    __int128 v40 = 0uLL;
    __int128 v41 = 0uLL;
    id v29 = v15;
    id v35 = [v29 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (!v35) {
      goto LABEL_38;
    }
    id v38 = &self->_applicationLaunchRequestsLock;
    uint64_t v30 = *(void *)v41;
    while (1)
    {
      for (i = 0LL; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(v29);
        }
        uint64_t v32 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        if (objc_msgSend(v32, "isIdenticalLaunchTo:", v4, v38))
        {
          if (![v4 overwritesPrevious])
          {
            os_unfair_recursive_lock_unlock(v38);

            id v35 = 0LL;
            BOOL v28 = 0;
            goto LABEL_48;
          }

          id v35 = v32;
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v35 startAfter]);
          [v4 setStartAfter:v33];

          id v34 = (void *)objc_claimAutoreleasedReturnValue([v35 startBefore]);
          [v4 setStartBefore:v34];

LABEL_37:
          p_applicationLaunchRequestsLock = v38;
LABEL_38:

          goto LABEL_44;
        }
      }

      id v35 = [v29 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (!v35) {
        goto LABEL_37;
      }
    }
  }

  __int128 v46 = 0uLL;
  __int128 v47 = 0uLL;
  __int128 v44 = 0uLL;
  __int128 v45 = 0uLL;
  id v17 = v15;
  id v18 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v18)
  {
    id v35 = 0LL;
    goto LABEL_43;
  }

  id v19 = v18;
  uint64_t v20 = *(void *)v45;
  __int128 v39 = v8;
  while (2)
  {
    __int128 v21 = self;
    __int128 v22 = v12;
    double v23 = p_applicationLaunchRequestsLock;
    for (j = 0LL; j != v19; j = (char *)j + 1)
    {
      if (*(void *)v45 != v20) {
        objc_enumerationMutation(v17);
      }
      __int128 v25 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)j);
      unsigned int v26 = [v4 shouldReplaceActivity:v25 andKeepsSubmitted:buf];
      if (buf[0]) {
        BOOL v27 = v26 == 0;
      }
      else {
        BOOL v27 = 1;
      }
      if (!v27)
      {
        id v35 = v25;
LABEL_42:
        p_applicationLaunchRequestsLock = v23;
        uint64_t v12 = v22;
        self = v21;
        uint64_t v8 = v39;
        goto LABEL_43;
      }

      if (!buf[0])
      {
        id v35 = 0LL;
        goto LABEL_42;
      }
    }

    id v19 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
    id v35 = 0LL;
    p_applicationLaunchRequestsLock = v23;
    uint64_t v12 = v22;
    self = v21;
    uint64_t v8 = v39;
    if (v19) {
      continue;
    }
    break;
  }

- (void)removeLaunchRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]);
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

    p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
    os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0LL);
    unsigned int v10 = [v4 requestsExtensionLaunch];
    uint64_t v11 = 16LL;
    if (v10) {
      uint64_t v11 = 18LL;
    }
    uint64_t v12 = (&self->super.isa)[v11];
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Removing a launch request for application %@ by activity %@",  (uint8_t *)&v17,  0x16u);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v8));
    [v14 removeObject:v4];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v8));
    id v16 = [v15 count];

    if (!v16) {
      -[objc_class removeObjectForKey:](v12, "removeObjectForKey:", v8);
    }

    os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  }
}

- (unint64_t)requestCountForApplication:(id)a3
{
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  id v5 = a3;
  os_unfair_recursive_lock_lock_with_options(p_applicationLaunchRequestsLock, 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_applicationLaunchRequests,  "objectForKeyedSubscript:",  v5));

  id v7 = [v6 count];
  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  return (unint64_t)v7;
}

- (void)start
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating _DASBGSystemTaskHelper", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper sharedInstance](&OBJC_CLASS____DASBGSystemTaskHelper, "sharedInstance"));
  [v4 startWithListener:self->_bgstListener];

  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activating listener", buf, 2u);
  }

  -[NSXPCListener activate](self->_listener, "activate");
  -[_DASDaemon solicitActivityResubmission](self, "solicitActivityResubmission");
  +[_DASDataCollectionTasks schedule](&OBJC_CLASS____DASDataCollectionTasks, "schedule");
  +[_DASAutoBugCaptureHelper schedule](&OBJC_CLASS____DASAutoBugCaptureHelper, "schedule");
  id v6 = (_DASRemoteDeviceNearbyMonitor *)objc_claimAutoreleasedReturnValue( +[_DASRemoteDeviceNearbyMonitor sharedMonitorWithDaemon:]( &OBJC_CLASS____DASRemoteDeviceNearbyMonitor,  "sharedMonitorWithDaemon:",  self));
  remoteDeviceNearbyMonitor = self->_remoteDeviceNearbyMonitor;
  self->_remoteDeviceNearbyMonitor = v6;

  uint64_t v8 = (_DASRemoteDeviceWakeMonitor *)objc_claimAutoreleasedReturnValue( +[_DASRemoteDeviceWakeMonitor sharedMonitorWithDaemon:]( &OBJC_CLASS____DASRemoteDeviceWakeMonitor,  "sharedMonitorWithDaemon:",  self));
  remoteDeviceWakeMonitor = self->_remoteDeviceWakeMonitor;
  self->_remoteDeviceWakeMonitor = v8;

  unsigned int v10 = (_DASActivityRateLimitManager *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimitManager sharedLimiter]( &OBJC_CLASS____DASActivityRateLimitManager,  "sharedLimiter"));
  rateLimiter = self->_rateLimiter;
  self->_rateLimiter = v10;

  uint64_t v12 = (_DASRuntimeLimiter *)objc_claimAutoreleasedReturnValue(+[_DASRuntimeLimiter sharedLimiter](&OBJC_CLASS____DASRuntimeLimiter, "sharedLimiter"));
  runtimeLimiter = self->_runtimeLimiter;
  self->_runtimeLimiter = v12;

  uint64_t v14 = (_DASConfigurationLimiter *)objc_claimAutoreleasedReturnValue( +[_DASConfigurationLimiter sharedLimiter]( &OBJC_CLASS____DASConfigurationLimiter,  "sharedLimiter"));
  configurationLimiter = self->_configurationLimiter;
  self->_configurationLimiter = v14;

  *(_DWORD *)buf = 0;
  evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100079F18;
  handler[3] = &unk_100115388;
  void handler[4] = self;
  notify_register_dispatch("com.apple.sysdiagnose.sysdiagnoseStarted", (int *)buf, evaluationQueue, handler);
  BOOL v17 = dlopen_preflight("/System/Library/Frameworks/UIKit.framework/UIKit");
  byte_100157C50 = v17;
  if (v17)
  {
    id v18 = (_DASBlueListManager *)objc_claimAutoreleasedReturnValue( +[_DASBlueListManager managerWithContext:]( &OBJC_CLASS____DASBlueListManager,  "managerWithContext:",  self->_context));
    blueListManager = self->_blueListManager;
    self->_blueListManager = v18;

    dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency( &_dispatch_queue_attr_concurrent,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    __int128 v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
    __int128 v22 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.duetactivityscheduler.activityLaunchQueue", v21);
    activityLaunchQueue = self->_activityLaunchQueue;
    self->_activityLaunchQueue = v22;

    double v24 = (_DASBARScheduler *)objc_claimAutoreleasedReturnValue( +[_DASBARScheduler barSchedulerWithScheduler:]( &OBJC_CLASS____DASBARScheduler,  "barSchedulerWithScheduler:",  self));
    barScheduler = self->_barScheduler;
    self->_barScheduler = v24;

    unsigned int v26 = (os_log_s *)os_transaction_create("com.apple.dasd.barTransactionCreate");
    -[_DASBARScheduler start](self->_barScheduler, "start");
    -[_DASDaemon registerForTrial](self, "registerForTrial");
    -[_DASDaemon updateTrialParameters](self, "updateTrialParameters");
    if (!self->_recomEngineDisabled && +[_DASConfig isAudioAccessory](&OBJC_CLASS____DASConfig, "isAudioAccessory"))
    {
      BOOL v27 = (_APRSManager *)objc_claimAutoreleasedReturnValue(+[_APRSManager sharedInstance](&OBJC_CLASS____APRSManager, "sharedInstance"));
      appResumeManager = self->_appResumeManager;
      self->_appResumeManager = v27;
    }

    id v29 = objc_alloc_init(&OBJC_CLASS____DASClosureManager);
    closureManager = self->_closureManager;
    self->_closureManager = v29;
  }

  else
  {
    unsigned int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "UIKit framework not found...", v33, 2u);
    }
  }

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
  [v31 registerReportTaskInfoTask];

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
  [v32 registerFeatureStatusTask];
}

- (void)handleSysdiagnoseStartEvent
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Sysdiagnose started, suspending running tasks if any",  buf,  2u);
  }

  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_runningTasks;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 suspendRequestDate]);
        if (v11)
        {
        }

        else
        {
          id v12 = [v10 schedulingPriority];
          if ((unint64_t)v12 < _DASSchedulingPriorityUserInitiated
            || [v10 isIntensive])
          {
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
            -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:]( self,  "updateSuspendRequestDate:forActivity:withReason:",  v13,  v10,  @"Sysdiagnose");

            [v4 addObject:v10];
          }
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
    }

    while (v7);
  }

  if ([v4 count]) {
    -[_DASDaemon suspendActivities:](self, "suspendActivities:", v4);
  }
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
}

- (unint64_t)submittedTaskCount
{
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  id v4 = -[NSMutableSet count](self->_pendingTasks, "count");
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return (unint64_t)v4;
}

- (id)allPendingTasks
{
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  id v4 = -[NSMutableSet copy](self->_pendingTasks, "copy");
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v4;
}

- (id)allPendingRestartTasks
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v4 = self->_triggerToActivitiesMap;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_triggerToActivitiesMap,  "objectForKeyedSubscript:",  @"com.apple.duetactivityscheduler.restartpolicy.assertionsheld"));
  if (v5) {
    [v3 unionSet:v5];
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)allPendingPushLaunchTasks
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0LL);
  applicationLaunchRequests = self->_applicationLaunchRequests;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007A300;
  v8[3] = &unk_100116D08;
  id v6 = v3;
  id v9 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( applicationLaunchRequests,  "enumerateKeysAndObjectsUsingBlock:",  v8);

  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  return v6;
}

- (id)allPendingBackgroundTasks
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0LL);
  applicationLaunchRequests = self->_applicationLaunchRequests;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10007A4DC;
  v8[3] = &unk_100116D08;
  id v6 = v3;
  id v9 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( applicationLaunchRequests,  "enumerateKeysAndObjectsUsingBlock:",  v8);

  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  return v6;
}

- (id)allPendingSyncOnBackupTasks
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_pendingTasks;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v7);
  }

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v3;
}

- (id)allTimewiseEligibleNetworkTasksAllowingCell:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = self->_triggerToActivitiesMap;
  objc_sync_enter(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_triggerToActivitiesMap,  "objectForKeyedSubscript:",  @"com.apple.duetactivityscheduler.nwstatus.wifi"));
  id v9 = v8;
  if (v8)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          __int128 v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          if ((objc_msgSend(v14, "timewiseEligibleAtDate:", v6, (void)v16) & v3) == 1
            && ([v14 requiresInexpensiveNetworking] & 1) == 0)
          {
            [v5 addObject:v14];
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v11);
    }
  }

  objc_sync_exit(v7);
  return v5;
}

- (id)startedTasks
{
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  id v4 = -[NSMutableSet copy](self->_runningTasks, "copy");
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v4;
}

- (id)allPrerunningTasks
{
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  id v4 = -[NSMutableSet copy](self->_prerunningTasks, "copy");
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v4;
}

- (id)allTasks
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  [v3 unionSet:self->_prerunningTasks];
  [v3 unionSet:self->_runningTasks];
  [v3 unionSet:self->_pendingTasks];
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  id v4 = [v3 copy];

  return v4;
}

- (void)createDefaultActivityGroups
{
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = _DASDefaultNetworkGroupName;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating %@", (uint8_t *)&v9, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityGroup groupWithName:maxConcurrent:]( &OBJC_CLASS____DASActivityGroup,  "groupWithName:maxConcurrent:",  _DASDefaultNetworkGroupName,  qword_100156D58));
  -[_DASDaemon createActivityGroup:](self, "createActivityGroup:", v4);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = _DASDefaultGroupName;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating %@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityGroup groupWithName:maxConcurrent:]( &OBJC_CLASS____DASActivityGroup,  "groupWithName:maxConcurrent:",  _DASDefaultGroupName,  qword_100156D50));
  -[_DASDaemon createActivityGroup:](self, "createActivityGroup:", v6);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = _DASDefaultRemoteGroupName;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityGroup groupWithName:maxConcurrent:]( &OBJC_CLASS____DASActivityGroup,  "groupWithName:maxConcurrent:",  _DASDefaultRemoteGroupName,  10LL));
  -[_DASDaemon createActivityGroup:](self, "createActivityGroup:", v8);
}

- (NSString)description
{
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet description](self->_runningTasks, "description"));
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  id v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: Listener: %@, Clients: %@, Started Tasks: %@",  objc_opt_class(self),  self->_listener,  self->_clients,  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  if ([v6 isEqual:v8->_listener])
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.duet.activityscheduler.allow"]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"application-identifier"]);
    if (+[_DASConfig isInternalBuild](&OBJC_CLASS____DASConfig, "isInternalBuild")
      && ([v10 isEqualToString:@"com.apple.Preferences"] & 1) != 0
      || v9 && ([v9 BOOLValue] & 1) != 0)
    {
      uint64_t v11 = 0LL;
    }

    else
    {
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Creating restricted client for connection %@",  (uint8_t *)&v16,  0xCu);
      }

      uint64_t v11 = 1LL;
    }
  }

  else
  {
    if (![v6 isEqual:v8->_bgstListener])
    {
      uint64_t v11 = 0LL;
      goto LABEL_17;
    }

    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Creating unrestricted client connection for BGSTHelper %@",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v11 = 0LL;
  }

LABEL_17:
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDaemonClient clientForDaemon:withConnection:isRestricted:]( &OBJC_CLASS____DASDaemonClient,  "clientForDaemon:withConnection:isRestricted:",  v8,  v7,  v11));
  __int128 v14 = v8->_clients;
  objc_sync_enter(v14);
  -[NSMutableArray addObject:](v8->_clients, "addObject:", v13);
  objc_sync_exit(v14);

  objc_sync_exit(v8);
  return 1;
}

- (void)removeClient:(id)a3
{
  id v12 = a3;
  id v4 = self->_clients;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](self->_clients, "removeObject:", v12);
  objc_sync_exit(v4);

  id v5 = self->_connectedBGTaskClients;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v12 connection]);
  id v7 = [v6 processIdentifier];

  connectedBGTaskClients = self->_connectedBGTaskClients;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
  -[NSMutableDictionary removeObjectForKey:](connectedBGTaskClients, "removeObjectForKey:", v9);

  activitiesWaitingForBGTaskClients = self->_activitiesWaitingForBGTaskClients;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v7));
  -[NSMutableDictionary removeObjectForKey:](activitiesWaitingForBGTaskClients, "removeObjectForKey:", v11);

  objc_sync_exit(v5);
}

- (void)allClientsDo:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = self->_clients;
  objc_sync_enter(v5);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = self->_clients;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      int v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8LL * (void)v9));
        int v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (id)clientForActivity:(id)a3
{
  id v4 = a3;
  id v5 = self->_clients;
  objc_sync_enter(v5);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = self->_clients;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        __int128 v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startedTasks", (void)v15));
        objc_sync_enter(v11);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 startedTasks]);
        unsigned int v13 = [v12 containsObject:v4];

        if (v13)
        {
          id v7 = v10;
          objc_sync_exit(v11);

          goto LABEL_11;
        }

        objc_sync_exit(v11);
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

- (void)runLocalActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));
  -[_DASDaemon handleRunningActivities:](self, "handleRunningActivities:", v5);

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 handlerQueue]);
  launchQueue = v6;
  if (!v6) {
    launchQueue = (dispatch_queue_s *)self->_launchQueue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007B3D0;
  block[3] = &unk_1001150D0;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(launchQueue, block);
}

- (void)runActivities:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v64 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Running activities : %@", buf, 0xCu);
  }

  context = objc_autoreleasePoolPush();
  __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v59;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
        -[_DASDaemon reportActivityTiming:](self, "reportActivityTiming:", v9);
        unsigned int v10 = [v9 delayedStart];
        __int128 v11 = v39;
        if (v10)
        {
          __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v64 = v9;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Activity %@ has delayed start",  buf,  0xCu);
          }

          __int128 v11 = v36;
        }

        [v11 addObject:v9];
      }

      id v6 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
    }

    while (v6);
  }

  if ([v39 count])
  {
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_10007BD68;
    v56[3] = &unk_100116D30;
    id v13 = v39;
    id v57 = v13;
    -[_DASDaemon allClientsDo:](self, "allClientsDo:", v56);
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v35 = v13;
    id v14 = [v35 countByEnumeratingWithState:&v52 objects:v67 count:16];
    if (!v14) {
      goto LABEL_37;
    }
    uint64_t v15 = *(void *)v53;
    while (1)
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v53 != v15) {
          objc_enumerationMutation(v35);
        }
        __int128 v17 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)j);
        if (![v17 isContinuedProcessingTask])
        {
LABEL_34:
          -[_DASDaemon createAssertion:](self, "createAssertion:", v17);
          continue;
        }

        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[_DASAssertionArbiter createUnmanagedAssertionForActivity:targetPID:]( self->_assertionArbiter,  "createUnmanagedAssertionForActivity:targetPID:",  v17,  [v17 pid]));
        if (v18)
        {
          objc_initWeak(&location, v18);
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472LL;
          v49[2] = sub_10007BD74;
          v49[3] = &unk_100116D58;
          objc_copyWeak(&v50, &location);
          v49[4] = self;
          v49[5] = v17;
          [v18 setWarningHandler:v49];
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472LL;
          v47[2] = sub_10007BE64;
          v47[3] = &unk_100116D80;
          objc_copyWeak(&v48, &location);
          v47[4] = self;
          v47[5] = v17;
          [v18 setInvalidationHandler:v47];
          id v46 = 0LL;
          unsigned __int8 v19 = [v18 acquireWithError:&v46];
          id v20 = v46;
          if (v20) {
            unsigned __int8 v21 = 0;
          }
          else {
            unsigned __int8 v21 = v19;
          }
          if ((v21 & 1) != 0)
          {
            [v17 setAssertion:v18];
            __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v64 = v18;
              __int16 v65 = 2112;
              id v66 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Successfully acquired %@ for %@",  buf,  0x16u);
            }
          }

          else
          {
            __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v64 = v18;
              __int16 v65 = 2112;
              id v66 = v20;
              _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Failed to acquire %@ with error: %@",  buf,  0x16u);
            }
          }

          objc_destroyWeak(&v48);
          objc_destroyWeak(&v50);
          objc_destroyWeak(&location);

          if ((v21 & 1) != 0) {
            goto LABEL_34;
          }
        }

        else
        {
          double v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"BackgroundTasks"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v64 = v17;
            _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Unable to create assertion for %@",  buf,  0xCu);
          }
        }
      }

      id v14 = [v35 countByEnumeratingWithState:&v52 objects:v67 count:16];
      if (!v14)
      {
LABEL_37:

        break;
      }
    }
  }

  if ([v36 count])
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10007C0CC;
    v44[3] = &unk_100116D30;
    id v45 = v36;
    -[_DASDaemon allClientsDo:](self, "allClientsDo:", v44);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obja = obj;
  id v24 = [obja countByEnumeratingWithState:&v40 objects:v62 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v41;
    do
    {
      for (k = 0LL; k != v24; k = (char *)k + 1)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(obja);
        }
        BOOL v27 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)k);
        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue([v27 startHandler]);

        if (v28)
        {
          -[_DASDaemon runLocalActivity:](self, "runLocalActivity:", v27);
        }

        else if (([v27 requestsApplicationLaunch] & 1) == 0)
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v27 widgetID]);
          if (v29)
          {
          }

          else if (([v27 delayedStart] & 1) == 0)
          {
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](&OBJC_CLASS____DASPLLogger, "sharedInstance"));
            [v30 recordActivityLifeCycleStart:v27];

            -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:]( self,  "recordToTaskRegistry:lifeCycleStateName:",  v27,  @"started");
          }
        }

        if (+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v27))
        {
          __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_photosIsBlocked));
            *(_DWORD *)buf = 138543618;
            id v64 = v27;
            __int16 v65 = 2112;
            id v66 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Reporting photos activity no longer blocked: %{public}@ (was %@)",  buf,  0x16u);
          }

          -[_DASDaemon updateiCPLTasksBlocked:](self, "updateiCPLTasksBlocked:", 0LL);
        }

        [v27 isContinuedProcessingTask];
        id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        if ([v27 overdueAtDate:v33])
        {
          if (([v27 requiresPlugin] & 1) == 0) {
            +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.missedDeadlineCount.nonPlugin",  1LL);
          }
          if (([v27 requiresNetwork] & 1) == 0) {
            +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.missedDeadlineCount.nonNetwork",  1LL);
          }
          if (([v27 requiresNetwork] & 1) == 0
            && ([v27 requiresPlugin] & 1) == 0)
          {
            +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.missedDeadlineCount.nonPluginNetwork",  1LL);
          }

          +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.missedDeadlineCount",  1LL);
        }
      }

      id v24 = [obja countByEnumeratingWithState:&v40 objects:v62 count:16];
    }

    while (v24);
  }

  objc_autoreleasePoolPop(context);
}

- (void)runActivitiesAndRemoveUnknown:(id)a3
{
  id v4 = a3;
  context = objc_autoreleasePoolPush();
  -[_DASDaemon runActivities:](self, "runActivities:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        if (([v11 delayedStart] & 1) == 0)
        {
          if ([v11 requestsApplicationLaunch])
          {
            __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon clientForActivity:](self, "clientForActivity:", v11));

            if (!v12)
            {
              id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v53 = v11;
                _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Launch Task %@ has no known client",  buf,  0xCu);
              }

              -[_DASDaemon activityCompleted:](self, "activityCompleted:", v11);
              [v5 addObject:v11];
            }
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }

    while (v8);
  }

  [v6 minusSet:v5];
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v14 = self->_runningTasks;
  id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v41,  v51,  16LL);
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v42;
LABEL_16:
    uint64_t v18 = 0LL;
    while (1)
    {
      if (*(void *)v42 != v17) {
        objc_enumerationMutation(v14);
      }
      [v6 removeObject:*(void *)(*((void *)&v41 + 1) + 8 * v18)];
      if (![v6 count]) {
        break;
      }
      if (v16 == (id)++v18)
      {
        id v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v41,  v51,  16LL);
        if (v16) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v19 = [v6 copy];
  id v20 = [v19 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v38;
    do
    {
      for (j = 0LL; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)j);
      }

      id v21 = [v19 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }

    while (v21);
  }

  if ([v6 count])
  {
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "No XPC Connection to client for activities: %@",  buf,  0xCu);
    }

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v26 = v6;
    id v27 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v34;
      do
      {
        for (k = 0LL; k != v28; k = (char *)k + 1)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v26);
          }
          __int128 v31 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)k);
          if ([v31 requestsApplicationLaunch])
          {
            -[_DASDaemon activityCompleted:](self, "activityCompleted:", v31);
          }

          else if (([v31 requestsExtensionLaunch] & 1) == 0)
          {
            -[_DASDaemon activityCanceled:](self, "activityCanceled:", v31);
          }
        }

        id v28 = [v26 countByEnumeratingWithState:&v33 objects:v49 count:16];
      }

      while (v28);
    }
  }

  objc_autoreleasePoolPop(context);
}

- (void)clearRecentlyLaunchedApps
{
  context = objc_autoreleasePoolPush();
  BOOL v3 = self->_recentlyLaunchedApps;
  objc_sync_enter(v3);
  if ((unint64_t)-[NSMutableDictionary count](self->_recentlyLaunchedApps, "count") >= 0x1A)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_recentlyLaunchedApps, "allKeys"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_recentlyLaunchedApps,  "objectForKeyedSubscript:",  v10));
          [v5 timeIntervalSinceDate:v11];
          BOOL v13 = v12 > 450.0;

          if (v13)
          {
            -[NSMutableDictionary removeObjectForKey:](self->_recentlyLaunchedApps, "removeObjectForKey:", v10);
            -[NSCountedSet removeObject:](self->_launchesPerApp, "removeObject:", v10);
          }
        }

        id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }

      while (v7);
    }

    if ((unint64_t)-[NSMutableDictionary count](self->_recentlyLaunchedApps, "count") >= 0x1A)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_recentlyLaunchedApps, "allKeys"));

      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id v6 = v14;
      id v15 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v27;
        do
        {
          for (j = 0LL; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v6);
            }
            uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)j);
            id v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_recentlyLaunchedApps,  "objectForKeyedSubscript:",  v18));
            [v5 timeIntervalSinceDate:v19];
            BOOL v21 = v20 > 225.0;

            if (v21)
            {
              -[NSMutableDictionary removeObjectForKey:](self->_recentlyLaunchedApps, "removeObjectForKey:", v18);
              -[NSCountedSet removeObject:](self->_launchesPerApp, "removeObject:", v18);
            }
          }

          id v15 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }

        while (v15);
      }

      while ((unint64_t)-[NSMutableDictionary count](self->_recentlyLaunchedApps, "count") >= 0x1A)
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_recentlyLaunchedApps, "allKeys"));

        id v23 = objc_msgSend(v22, "objectAtIndex:", arc4random_uniform((uint32_t)objc_msgSend(v22, "count")));
        id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        -[NSMutableDictionary removeObjectForKey:](self->_recentlyLaunchedApps, "removeObjectForKey:", v24);
        -[NSCountedSet removeObject:](self->_launchesPerApp, "removeObject:", v24);

        id v6 = v22;
      }
    }
  }

  objc_sync_exit(v3);

  objc_autoreleasePoolPop(context);
}

- (void)runLaunchTasks:(id)a3 forApplication:(id)a4 forApplicationURL:(id)a5 onLaunch:(id)a6 onCompletion:(id)a7 onFailure:(id)a8
{
  id v14 = a3;
  id v88 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = (void (**)(void))a7;
  id v18 = a8;
  id v19 = (void *)os_transaction_create("com.apple.dasd.activateLaunchTasks");
  oslog = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v120 = v14;
    __int16 v121 = 2112;
    id v122 = v88;
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_INFO,  "Running launch tasks: %@ for application: %@",  buf,  0x16u);
  }

  dispatch_group_t v86 = dispatch_group_create();
  double v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  if (byte_100157C50)
  {
    id v71 = v20;
    __int16 v65 = v19;
    id v66 = v18;
    id v67 = v17;
    __int16 v68 = v16;
    int64_t v69 = v15;
    id v89 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v109 = 0u;
    __int128 v110 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    id v70 = v14;
    id obj = v14;
    id v21 = [obj countByEnumeratingWithState:&v109 objects:v117 count:16];
    if (!v21) {
      goto LABEL_30;
    }
    id v23 = v21;
    uint64_t v24 = *(void *)v110;
    uint64_t v25 = _DASLaunchReasonBackgroundFetch;
    uint64_t v83 = _DASLaunchReasonBackgroundRemoteNotification;
    uint64_t v82 = _DASLaunchReasonNSURLSessionComplete;
    uint64_t v78 = _DASLaunchReasonSignificantLocationChange;
    uint64_t v77 = _DASLaunchReasonHealthKit;
    uint64_t v75 = _DASLaunchReasonBackgroundRefresh;
    uint64_t v74 = _DASLaunchReasonBackgroundProcessing;
    uint64_t v73 = _DASLaunchReasonHealthResearch;
    uint64_t v76 = _DASLaunchOptionsSignificantLocationChange;
    v80 = (void *)_DASLaunchOptionsNSURLSession;
    uint64_t v81 = _DASRemoteNotificationPayloadKey;
    *(void *)&__int128 v22 = 138412546LL;
    __int128 v64 = v22;
    while (1)
    {
      __int128 v26 = 0LL;
      do
      {
        if (*(void *)v110 != v24) {
          objc_enumerationMutation(obj);
        }
        __int128 v27 = *(void **)(*((void *)&v109 + 1) + 8LL * (void)v26);
        -[_DASDaemon moveActivityToPrerunning:](self, "moveActivityToPrerunning:", v27, v64);
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472LL;
        v103[2] = sub_10007D1D4;
        v103[3] = &unk_100116DA8;
        __int128 v28 = oslog;
        uint64_t v104 = v28;
        id v105 = v88;
        dispatch_queue_attr_t v106 = v27;
        v107 = v86;
        dispatch_queue_t v108 = self;
        __int128 v29 = objc_retainBlock(v103);
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v27 launchReason]);
        unsigned int v31 = [v30 isEqualToString:v25];

        if (v31)
        {
          id v32 = [[UISFetchContentInBackgroundAction alloc] initWithHandler:v29];
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v27 uuid]);
          __int128 v34 = v89;
          id v35 = v32;
          __int128 v36 = v33;
          goto LABEL_11;
        }

        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v27 launchReason]);
        unsigned int v38 = [v37 isEqualToString:v83];

        if (v38)
        {
          __int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v27 userInfo]);
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:v81]);

          id v32 = [[UISHandleRemoteNotificationAction alloc] initWithRemoteNotificationPayload:v33 withHandler:v29];
          __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v27 uuid]);
          [v89 setObject:v32 forKeyedSubscript:v40];

          goto LABEL_19;
        }

        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v27 launchReason]);
        unsigned int v42 = [v41 isEqualToString:v82];

        if (v42)
        {
          __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v27 userInfo]);
          __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:v80]);

          if (v44)
          {
            id v32 = (id)objc_claimAutoreleasedReturnValue([v27 userInfo]);
            __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v80]);
            __int128 v34 = v79;
            id v35 = v33;
            __int128 v36 = v80;
LABEL_11:
            [v34 setObject:v35 forKeyedSubscript:v36];
LABEL_19:
          }

- (void)launchApplication:(id)a3 applicationURL:(id)a4 additionalOptions:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  id v10 = a5;
  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
  double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));

  uint64_t v25 = FBSOpenApplicationOptionKeyActivateSuspended;
  __int128 v26 = &__kCFBooleanTrue;
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  [v12 addEntriesFromDictionary:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  v12));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Launching with FBSOpenApplicationService for application %@",  buf,  0xCu);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007E4EC;
  v19[3] = &unk_100116E98;
  double v20 = v11;
  id v21 = v8;
  id v22 = v9;
  id v16 = v9;
  id v17 = v8;
  id v18 = v11;
  [v15 openApplication:v17 withOptions:v14 completion:v19];
}

- (void)runExtensionLaunchActivities:(id)a3
{
  id v4 = a3;
  id v23 = (void *)os_transaction_create("com.apple.dasd.runExtensionLaunchActivities");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    uint64_t v10 = _DASExtensionLaunchReasonMLCompute;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        -[_DASDaemon prepareActivityForStart:atTime:](self, "prepareActivityForStart:atTime:", v12, v5);
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 launchReason]);
        unsigned int v14 = [v13 isEqualToString:v10];

        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 extensionIdentifier]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPlugin pluginForIdentifier:ofType:]( &OBJC_CLASS____DASPlugin,  "pluginForIdentifier:ofType:",  v15,  @"com.apple.ml-extension"));

          if (v16)
          {
            [v16 setPluginDelegate:self];
            id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              __int128 v30 = v12;
              __int16 v31 = 2112;
              id v32 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Activity: %@ requesting launch of extension: %@",  buf,  0x16u);
            }

            [v16 performActivity:v12];
            if ((int)[v12 pid] > 0)
            {
              double v18 = (double)(unint64_t)[v12 duration] * 1.5;
              dispatch_time_t v19 = dispatch_time(0LL, (uint64_t)(v18 * 1000000000.0));
              evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_10007EA38;
              block[3] = &unk_100115148;
              void block[4] = v12;
              void block[5] = self;
              dispatch_after(v19, evaluationQueue, block);
              goto LABEL_21;
            }

            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              __int128 v30 = v12;
              _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Extension failed to launch for activity %@",  buf,  0xCu);
            }

            [v16 unload];
          }

          else
          {
            id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              __int128 v30 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Unable to find extension for activity %@",  buf,  0xCu);
            }
          }

          -[_DASDaemon activityCompleted:](self, "activityCompleted:", v12);
LABEL_21:

          continue;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v8);
  }
}

- (void)runApplicationLaunchActivities:(id)a3
{
  id v4 = a3;
  unsigned int v46 = (void *)os_transaction_create("com.apple.dasd.runLaunchTasks");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v87;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v87 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
        if ([v10 requestsApplicationLaunch])
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 relatedApplications]);
          double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

          if (v12) {
            [v5 addObject:v12];
          }
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
    }

    while (v7);
  }

  id v47 = [obj mutableCopy];
  __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  id v45 = v5;
  id v49 = [v45 countByEnumeratingWithState:&v82 objects:v98 count:16];
  if (v49)
  {
    p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
    p_activityStateLock = &self->_activityStateLock;
    uint64_t v48 = *(void *)v83;
    do
    {
      for (j = 0LL; j != v49; j = (char *)j + 1)
      {
        if (*(void *)v83 != v48) {
          objc_enumerationMutation(v45);
        }
        id v54 = *(id *)(*((void *)&v82 + 1) + 8LL * (void)j);
        __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        os_unfair_recursive_lock_lock_with_options(p_activityStateLock, 0LL);
        id v56 = -[NSMutableSet copy](self->_runningTasks, "copy");
        os_unfair_recursive_lock_unlock(p_activityStateLock);
        os_unfair_recursive_lock_lock_with_options(p_applicationLaunchRequestsLock, 0LL);
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_applicationLaunchRequests,  "objectForKeyedSubscript:",  v54));
        id v14 = [v13 copy];

        os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
        __int128 v80 = 0u;
        __int128 v81 = 0u;
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        id v15 = v14;
        id v16 = [v15 countByEnumeratingWithState:&v78 objects:v97 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v79;
          do
          {
            for (k = 0LL; k != v16; k = (char *)k + 1)
            {
              if (*(void *)v79 != v17) {
                objc_enumerationMutation(v15);
              }
              dispatch_time_t v19 = *(NSMutableSet **)(*((void *)&v78 + 1) + 8LL * (void)k);
              if ((-[NSMutableSet wasForceRun](v19, "wasForceRun") & 1) != 0)
              {
LABEL_23:
                if (-[_DASBARScheduler backgroundLaunchAllowedForBGTaskActivity:]( self->_barScheduler,  "backgroundLaunchAllowedForBGTaskActivity:",  v19))
                {
                  [v59 addObject:v19];
                  -[NSMutableSet setStartDate:](v19, "setStartDate:", v6);
                  double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v91 = v19;
                    __int16 v92 = 2112;
                    id v93 = v54;
                    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Activity: %@ requesting launch of application: %@",  buf,  0x16u);
                  }
                }

                else
                {
                  [v58 addObject:v19];
                  double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v91 = v19;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Background launch not allowed for %@, cancelling",  buf,  0xCu);
                  }
                }

                goto LABEL_41;
              }

              if ((-[NSMutableSet timewiseEligibleAtDate:](v19, "timewiseEligibleAtDate:", v6) & 1) != 0)
              {
                if ([v56 containsObject:v19])
                {
                  double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v91 = v19;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Skipping activity %@ because it's already running",  buf,  0xCu);
                  }
                }

                else
                {
                  +[_DASConditionScore scoreForActivity:withState:response:]( &OBJC_CLASS____DASConditionScore,  "scoreForActivity:withState:response:",  v19,  self->_context,  v77);
                  if (v21 != 0.0) {
                    goto LABEL_23;
                  }
                  double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v91 = v19;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Skipping activity %@ because it was scored too low",  buf,  0xCu);
                  }
                }
              }

              else
              {
                double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v91 = v19;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Skipping activity %@ because it's not timewise eligible",  buf,  0xCu);
                }
              }

- (void)suspendPlugin:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 extensionIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPlugin existingPluginForIdentifier:ofType:]( &OBJC_CLASS____DASPlugin,  "existingPluginForIdentifier:ofType:",  v5,  @"com.apple.ml-extension"));

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000B7700(v6, v8);
    }

    [v6 suspend];
    dispatch_time_t v9 = dispatch_time(0LL, 10000000000LL);
    evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000801A4;
    v11[3] = &unk_100115148;
    double v12 = (os_log_s *)v4;
    id v13 = v6;
    dispatch_after(v9, evaluationQueue, v11);

    uint64_t v8 = v12;
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Not suspending activity %{public}@ - extension already gone",  buf,  0xCu);
  }
}

- (void)warnBGTaskClientsForActivitiesAboutToExpire:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon connectedBGTaskClients](self, "connectedBGTaskClients"));
  objc_sync_enter(v5);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon connectedBGTaskClients](self, "connectedBGTaskClients", 0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allValues]);

  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) willExpireBGTaskActivities:v4];
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }

  objc_sync_exit(v5);
}

- (void)deferActivities:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  dispatch_time_t v19 = (void (**)(id, BOOL))a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v26 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deferring %lu activities", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon getActivityRunningWithName:](self, "getActivityRunningWithName:", v15));
        if (v16)
        {
          [v8 addObject:v16];
          -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:]( self,  "updateSuspendRequestDate:forActivity:withReason:",  v9,  v16,  0LL);
        }

        else
        {
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unable to find activity %@ to defer",  buf,  0xCu);
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  BOOL v18 = [v8 count] != 0;
  -[_DASDaemon suspendActivities:](self, "suspendActivities:", v8);
  v19[2](v19, v18);
}

- (void)resetFastPassActivities:(id)a3 resetAll:(BOOL)a4 withHandler:(id)a5
{
}

- (void)inspect:(id)a3 withHandler:(id)a4
{
}

- (void)suspendActivity:(id)a3
{
  id v4 = a3;
  -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:]( self,  "recordToTaskRegistry:lifeCycleStateName:",  v4,  @"suspended");
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));

  -[_DASDaemon suspendActivities:](self, "suspendActivities:", v5);
}

- (void)suspendActivitiesWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = self->_runningTasks;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uuid]);
        unsigned int v13 = [v4 containsObject:v12];

        if (v13) {
          [v5 addObject:v11];
        }
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
  }

  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  -[_DASDaemon suspendActivities:](self, "suspendActivities:", v5);
}

- (void)suspendActivities:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v42 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Suspending: %{public}@", buf, 0xCu);
    }

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100080B3C;
    v38[3] = &unk_100116D30;
    id v6 = v4;
    id v39 = v6;
    -[_DASDaemon allClientsDo:](self, "allClientsDo:", v38);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon connectedBGTaskClients](self, "connectedBGTaskClients"));
    id v8 = [v7 count];

    if (v8)
    {
      -[_DASDaemon warnBGTaskClientsForActivitiesAboutToExpire:]( self,  "warnBGTaskClientsForActivitiesAboutToExpire:",  v6);
      id v9 = [v6 copy];
      dispatch_time_t v10 = dispatch_time(0LL, 5000000000LL);
      evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100080B48;
      block[3] = &unk_100115148;
      void block[4] = self;
      id v37 = v9;
      id v12 = v9;
      dispatch_after(v10, evaluationQueue, block);
    }

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          BOOL v18 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        }

        id v15 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }

      while (v15);
    }

    dispatch_time_t v19 = (void **)[v13 copy];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBootTimePolicy getDeviceBootTime](&OBJC_CLASS____DASBootTimePolicy, "getDeviceBootTime"));
    [v20 timeIntervalSinceDate:v21];
    double v23 = v22;

    unsigned int v24 = +[_DASConfig isInternalBuild](&OBJC_CLASS____DASConfig, "isInternalBuild");
    dispatch_time_t v25 = dispatch_time(0LL, 10000000000LL);
    id v26 = (dispatch_queue_s *)self->_evaluationQueue;
    if (v24 && v23 >= 300.0)
    {
      __int16 v31 = _NSConcreteStackBlock;
      id v27 = (void **)sub_100080ED0;
      __int128 v28 = &v31;
    }

    else
    {
      __int128 v30 = _NSConcreteStackBlock;
      id v27 = (void **)sub_100081440;
      __int128 v28 = &v30;
    }

    v28[1] = (void **)3221225472LL;
    v28[2] = v27;
    v28[3] = (void **)&unk_100115148;
    v28[4] = (void **)&self->super.isa;
    v28[5] = v19;
    __int128 v29 = v19;
    dispatch_after(v25, v26, v28);
  }
}

- (void)cancelActivities:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Daemon Canceling Activities: %{public}@",  buf,  0xCu);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        dispatch_time_t v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          -[_DASDaemon activityCanceled:]( self,  "activityCanceled:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10));
          dispatch_time_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000815FC;
    v11[3] = &unk_100116D30;
    id v12 = v6;
    -[_DASDaemon allClientsDo:](self, "allClientsDo:", v11);
  }
}

- (void)activity:(id)a3 blockedOnPolicies:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000816A8;
  v8[3] = &unk_100116EE8;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[_DASDaemon allClientsDo:](self, "allClientsDo:", v8);
}

- (void)activity:(id)a3 runWithoutHonoringPolicies:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100081754;
  v8[3] = &unk_100116EE8;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[_DASDaemon allClientsDo:](self, "allClientsDo:", v8);
}

- (id)activityMatchingPredicate:(id)a3
{
  id v4 = a3;
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = self->_pendingTasks;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
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
        if (objc_msgSend(v4, "evaluateWithObject:", v10, (void)v12))
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)getActivityWithUUID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self.uuid = %@",  a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon activityMatchingPredicate:](self, "activityMatchingPredicate:", v4));

  return v5;
}

- (id)getActivityWithName:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self.name = %@",  a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon activityMatchingPredicate:](self, "activityMatchingPredicate:", v4));

  return v5;
}

- (id)getActivityRunningWithName:(id)a3
{
  id v4 = a3;
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = self->_runningTasks;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v7)
  {
    id v8 = v7;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        __int128 v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name", (void)v17));
        unsigned int v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          id v15 = v12;

          id v9 = v15;
        }
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v8);
  }

  else
  {
    id v9 = 0LL;
  }

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v9;
}

- (id)getActivityRunningWithUUID:(id)a3
{
  id v4 = a3;
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = self->_runningTasks;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v7)
  {
    id v8 = v7;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        __int128 v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid", (void)v17));
        unsigned int v14 = [v13 isEqual:v4];

        if (v14)
        {
          id v15 = v12;

          id v9 = v15;
        }
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v8);
  }

  else
  {
    id v9 = 0LL;
  }

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  return v9;
}

- (void)addConstraint:(unint64_t)a3 forSchedulingPriority:(unint64_t)a4
{
  p_constraintsLock = &self->_constraintsLock;
  os_unfair_lock_lock(&self->_constraintsLock);
  if (_DASSchedulingPriorityBackground >= a4)
  {
    unint64_t maintenanceConstraints = self->_maintenanceConstraints;
    if ((maintenanceConstraints & a3) == 0)
    {
      self->_unint64_t maintenanceConstraints = maintenanceConstraints | a3;
      uint64_t v9 = 59LL;
      goto LABEL_6;
    }
  }

  else
  {
    unint64_t utilityConstraints = self->_utilityConstraints;
    if ((utilityConstraints & a3) == 0)
    {
      self->_unint64_t utilityConstraints = utilityConstraints | a3;
      uint64_t v9 = 58LL;
LABEL_6:
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
      -[_CDLocalContext setObject:forKeyedSubscript:]( self->_context,  "setObject:forKeyedSubscript:",  v11,  (&self->super.isa)[v9]);
    }
  }

  os_unfair_lock_unlock(p_constraintsLock);
}

- (void)removeConstraint:(unint64_t)a3 forSchedulingPriority:(unint64_t)a4
{
  p_constraintsLock = &self->_constraintsLock;
  os_unfair_lock_lock(&self->_constraintsLock);
  if (_DASSchedulingPriorityBackground >= a4)
  {
    unint64_t maintenanceConstraints = self->_maintenanceConstraints;
    if ((maintenanceConstraints & a3) != 0)
    {
      self->_unint64_t maintenanceConstraints = maintenanceConstraints & ~a3;
      uint64_t v9 = 59LL;
      goto LABEL_6;
    }
  }

  else
  {
    unint64_t utilityConstraints = self->_utilityConstraints;
    if ((utilityConstraints & a3) != 0)
    {
      self->_unint64_t utilityConstraints = utilityConstraints & ~a3;
      uint64_t v9 = 58LL;
LABEL_6:
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
      -[_CDLocalContext setObject:forKeyedSubscript:]( self->_context,  "setObject:forKeyedSubscript:",  v11,  (&self->super.isa)[v9]);
    }
  }

  os_unfair_lock_unlock(p_constraintsLock);
}

- (void)updateiCPLTasksBlocked:(unint64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPhotosPolicy keyPathForPhotosIsBlocked]( &OBJC_CLASS____DASPhotosPolicy,  "keyPathForPhotosIsBlocked"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPhotosPolicy keyPathForBlockedStartDate]( &OBJC_CLASS____DASPhotosPolicy,  "keyPathForBlockedStartDate"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPhotosPolicy keyPathForPhotosIsUnBlocked]( &OBJC_CLASS____DASPhotosPolicy,  "keyPathForPhotosIsUnBlocked"));
  id v8 = v5;
  objc_sync_enter(v8);
  unint64_t photosIsBlocked = self->_photosIsBlocked;
  if (a3)
  {
    if (!photosIsBlocked)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v10, v6);
    }
  }

  else if (photosIsBlocked)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", v6));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v12 timeIntervalSinceDate:v11];
    double v14 = v13;

    double v15 = fmax(v14, 0.0);
    +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.dasd.icpl-blocked",  llround(v15));
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"stats"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134217984;
      double v29 = v15 / 60.0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "iCPL gated for %5.2f mins",  (uint8_t *)&v28,  0xCu);
    }

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v17, v6);
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", v18, v8);
  BOOL v19 = a3 == 0;

  self->_unint64_t photosIsBlocked = a3;
  objc_sync_exit(v8);

  id v20 = v7;
  objc_sync_enter(v20);
  if (v19)
  {
    if (+[_DASPhotosPolicy isPhotosSyncOverriddenWithContext:]( &OBJC_CLASS____DASPhotosPolicy,  "isPhotosSyncOverriddenWithContext:",  self->_context))
    {
      -[_CDLocalContext setObject:forKeyedSubscript:]( self->_context,  "setObject:forKeyedSubscript:",  &off_100121FD8,  v20);
      *(double *)&__int128 v21 = COERCE_DOUBLE(@"Sync Now Override");
    }

    else
    {
      double v22 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](&OBJC_CLASS____DASPhotosPolicy, "policyInstance"));
      unsigned int v23 = [v22 intentSyncIsEngaged];

      context = self->_context;
      if (v23)
      {
        -[_CDLocalContext setObject:forKeyedSubscript:](context, "setObject:forKeyedSubscript:", &off_100121FF0, v20);
        *(double *)&__int128 v21 = COERCE_DOUBLE(@"Remote Device Intent");
      }

      else
      {
        -[_CDLocalContext setObject:forKeyedSubscript:](context, "setObject:forKeyedSubscript:", &off_100122008, v20);
        *(double *)&__int128 v21 = COERCE_DOUBLE(@"DAS");
      }
    }

    dispatch_time_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      double v29 = *(double *)&v21;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Reporting photos activity no longer blocked due to: %@",  (uint8_t *)&v28,  0xCu);
    }
  }

  else
  {
    -[_CDLocalContext setObject:forKeyedSubscript:](self->_context, "setObject:forKeyedSubscript:", &off_100122020, v20);
  }

  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    double v27 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", v20)));
    int v28 = 138412290;
    double v29 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Reporting photos activity unBlockedOptions: %@",  (uint8_t *)&v28,  0xCu);
  }

  objc_sync_exit(v20);
}

- (void)reportActivity:(id)a3 isBlockedWithDecision:(int64_t)a4
{
  id v6 = a3;
  if (!+[_DASPolicyResponse isPolicyDecisionProceedable:]( &OBJC_CLASS____DASPolicyResponse,  "isPolicyDecisionProceedable:",  a4)
    && +[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v6))
  {
    id v47 = self;
    uint64_t v59 = 0LL;
    id v60 = &v59;
    uint64_t v61 = 0x2020000000LL;
    uint64_t v62 = 0LL;
    id v7 = (NSDictionary *)v6;
    objc_sync_enter(v7);
    id v8 = objc_alloc(&OBJC_CLASS___NSDictionary);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary policyResponseMetadata](v7, "policyResponseMetadata"));
    uint64_t v10 = -[NSDictionary initWithDictionary:copyItems:](v8, "initWithDictionary:copyItems:", v9, 1LL);

    objc_sync_exit(v7);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[_DASLowPowerModePolicy policyInstance](&OBJC_CLASS____DASLowPowerModePolicy, "policyInstance"));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 policyName]);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v12));
    unsigned __int8 v46 = [v13 reason];

    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](&OBJC_CLASS____DASPhotosPolicy, "policyInstance"));
    double v15 = (void *)objc_claimAutoreleasedReturnValue([v14 policyName]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v15));
    unsigned __int8 v45 = [v16 reason];

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPhotosPolicy policyInstance](&OBJC_CLASS____DASPhotosPolicy, "policyInstance"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 policyName]);
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v18));
    unsigned __int8 v44 = [v19 reason];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkQualityPolicy policyInstance](&OBJC_CLASS____DASNetworkQualityPolicy, "policyInstance"));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 policyName]);
    double v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v21));
    unsigned __int8 v43 = [v22 reason];

    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASNetworkQualityPolicy policyInstance](&OBJC_CLASS____DASNetworkQualityPolicy, "policyInstance"));
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 policyName]);
    dispatch_time_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v24));
    unsigned __int8 v26 = [v25 reason];

    double v27 = (void *)objc_claimAutoreleasedReturnValue(+[_DASThermalPolicy policyInstance](&OBJC_CLASS____DASThermalPolicy, "policyInstance"));
    int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 policyName]);
    double v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v28));
    BOOL v30 = ((unint64_t)[v29 reason] & 0x18) != 0;

    uint64_t v31 = objc_claimAutoreleasedReturnValue(+[_DASRequiresPluggedInPolicy policyInstance](&OBJC_CLASS____DASRequiresPluggedInPolicy, "policyInstance"));
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([(id)v31 policyName]);
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v32));
    unsigned __int8 v34 = [v33 reason];

    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDeviceActivityPolicy policyInstance](&OBJC_CLASS____DASDeviceActivityPolicy, "policyInstance"));
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 policyName]);
    id v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v36));
    LOBYTE(v31) = [v37 reason];

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_1000826FC;
    v48[3] = &unk_100116F10;
    char v51 = v46 & 1;
    id v50 = &v59;
    char v52 = v45 & 1;
    BOOL v53 = (v44 & 2) != 0;
    BOOL v54 = (v43 & 2) != 0;
    BOOL v55 = (v26 & 4) != 0;
    unsigned int v38 = v10;
    id v49 = v38;
    BOOL v56 = v30;
    char v57 = v34 & 1;
    char v58 = v31 & 1;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v38, "enumerateKeysAndObjectsUsingBlock:", v48);
    uint64_t v39 = v60[3];
    if (v39 != v47->_photosIsBlocked)
    {
      if (v39)
      {
        __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v41 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v60[3]));
          *(_DWORD *)buf = 138412802;
          __int128 v64 = v41;
          __int16 v65 = 2114;
          id v66 = v7;
          __int16 v67 = 2112;
          __int16 v68 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Reporting photos activity blocked: %@ %{public}@ %@",  buf,  0x20u);
        }
      }

      else
      {
        __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          id v42 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v47->_photosIsBlocked));
          *(_DWORD *)buf = 138543874;
          __int128 v64 = v7;
          __int16 v65 = 2112;
          id v66 = v38;
          __int16 v67 = 2112;
          __int16 v68 = v42;
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Reporting photos activity no longer blocked: %{public}@ %@ (was %@)",  buf,  0x20u);
        }
      }

      -[_DASDaemon updateiCPLTasksBlocked:](v47, "updateiCPLTasksBlocked:", v60[3]);
    }

    _Block_object_dispose(&v59, 8);
  }
}

- (BOOL)pausedParametersApplyToActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));

  if (!v5)
  {
    BOOL v11 = 0;
    goto LABEL_82;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"validUntil"]);
  [v7 doubleValue];
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));

  [v8 timeIntervalSinceNow];
  if (v9 < 0.0)
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No longer pausing activities!", buf, 2u);
    }

    -[NSUserDefaults removeObjectForKey:](self->_testingDefaults, "removeObjectForKey:", @"pausedParameters");
    -[_DASDaemon setPausedParameters:](self, "setPausedParameters:", 0LL);
    BOOL v11 = 0;
    goto LABEL_81;
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"activities"]);

  double v14 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  unsigned int v15 = [v13 containsObject:v14];

  if (v15)
  {
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v75 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Scheduling paused for activity: %@",  buf,  0xCu);
    }

    BOOL v11 = 1;
    goto LABEL_80;
  }

  BOOL v56 = v13;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"anyTypes"]);

  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"allTypes"]);

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
  char v57 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"exceptTypes"]);

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v16 = v18;
  id v22 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v67,  v73,  16LL);
  char v58 = v20;
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v68;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v68 != v24) {
          objc_enumerationMutation(v16);
        }
        unsigned __int8 v26 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)i);
        if (![v26 isEqualToString:@"network"]
          || ([v4 requiresNetwork] & 1) == 0)
        {
          if (![v26 isEqualToString:@"userinitiated"]
            || (id v27 = [v4 schedulingPriority],
                (unint64_t)v27 > _DASSchedulingPriorityUserInitiatedOvercommit))
          {
            if (![v26 isEqualToString:@"utility"]
              || (id v28 = [v4 schedulingPriority], (unint64_t)v28 > _DASSchedulingPriorityDefault))
            {
              if (![v26 isEqualToString:@"maintenance"]
                || (id v29 = [v4 schedulingPriority],
                    (unint64_t)v29 > _DASSchedulingPriorityMaintenance))
              {
                if (![v26 isEqualToString:@"background"]
                  || (id v30 = [v4 schedulingPriority],
                      (unint64_t)v30 > _DASSchedulingPriorityBackground))
                {
                  if ((![v26 isEqualToString:@"intensive"]
                     || ([v4 isIntensive] & 1) == 0)
                    && (![v26 isEqualToString:@"icpl"]
                     || !+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v4))
                    && (![v26 isEqualToString:@"plugin"]
                     || ([v4 requiresPlugin] & 1) == 0)
                    && (![v26 isEqualToString:@"inactivity"]
                     || ([v4 requiresDeviceInactivity] & 1) == 0))
                  {
                    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 fastPass]);

                    if (!v31) {
                      continue;
                    }
                  }
                }
              }
            }
          }
        }

        BOOL v11 = 1;
LABEL_78:
        unsigned __int8 v43 = v57;
        id v20 = v58;
        goto LABEL_79;
      }

      id v23 = -[os_log_s countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v67,  v73,  16LL);
      id v20 = v58;
    }

    while (v23);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  id v32 = v20;
  id v33 = [v32 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (!v33) {
    goto LABEL_65;
  }
  id v34 = v33;
  uint64_t v35 = *(void *)v64;
  do
  {
    for (j = 0LL; j != v34; j = (char *)j + 1)
    {
      if (*(void *)v64 != v35) {
        objc_enumerationMutation(v32);
      }
      id v37 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)j);
      if (![v37 isEqualToString:@"network"]
        || [v4 requiresNetwork])
      {
        if (![v37 isEqualToString:@"userinitiated"]
          || (id v38 = [v4 schedulingPriority],
              (unint64_t)v38 <= _DASSchedulingPriorityUserInitiatedOvercommit))
        {
          if (![v37 isEqualToString:@"utility"]
            || (id v39 = [v4 schedulingPriority], (unint64_t)v39 <= _DASSchedulingPriorityDefault))
          {
            if (![v37 isEqualToString:@"maintenance"]
              || (id v40 = [v4 schedulingPriority],
                  (unint64_t)v40 <= _DASSchedulingPriorityMaintenance))
            {
              if (![v37 isEqualToString:@"background"]
                || (id v41 = [v4 schedulingPriority],
                    (unint64_t)v41 <= _DASSchedulingPriorityBackground))
              {
                if ((![v37 isEqualToString:@"intensive"]
                   || [v4 isIntensive])
                  && (![v37 isEqualToString:@"icpl"]
                   || !+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v4))
                  && (![v37 isEqualToString:@"plugin"]
                   || [v4 requiresPlugin])
                  && (![v37 isEqualToString:@"inactivity"]
                   || [v4 requiresDeviceInactivity]))
                {
                  id v42 = (void *)objc_claimAutoreleasedReturnValue([v4 fastPass]);

                  if (v42) {
                    continue;
                  }
                }
              }
            }
          }
        }
      }

      BOOL v11 = 0;
      goto LABEL_78;
    }

    id v34 = [v32 countByEnumeratingWithState:&v63 objects:v72 count:16];
    id v20 = v58;
  }

  while (v34);
LABEL_65:

  unsigned __int8 v43 = v57;
  if (![v57 count])
  {
    BOOL v11 = [v32 count] != 0;
    goto LABEL_79;
  }

  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v44 = v57;
  id v45 = [v44 countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (!v45)
  {
    BOOL v11 = 1;
    goto LABEL_91;
  }

  id v46 = v45;
  uint64_t v47 = *(void *)v60;
  while (2)
  {
    uint64_t v48 = 0LL;
    while (2)
    {
      if (*(void *)v60 != v47) {
        objc_enumerationMutation(v44);
      }
      uint64_t v49 = *(void *)(*((void *)&v59 + 1) + 8 * v48);
      id v50 = (void *)objc_claimAutoreleasedReturnValue([v4 activityType]);
      unsigned int v51 = [v50 isEqualToString:v49];

      if (v51)
      {
        BOOL v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v75 = v4;
LABEL_89:
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Not pausing for: %@", buf, 0xCu);
        }

- (BOOL)testModeConstraintsApplyToActivity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"activities"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Test Mode Applies To Activity: %@", buf, 0xCu);
    }

    BOOL v10 = 1;
    goto LABEL_27;
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"activityClasses"]);

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  double v9 = v12;
  id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v34,  v42,  16LL);
  if (!v13)
  {
    BOOL v10 = 0;
    goto LABEL_26;
  }

  id v14 = v13;
  id v32 = v6;
  id v33 = v4;
  uint64_t v15 = *(void *)v35;
  p_cache = &OBJC_METACLASS____DASActivityRecorder.cache;
  __int128 v17 = @"photos";
LABEL_7:
  uint64_t v18 = 0LL;
  while (1)
  {
    if (*(void *)v35 != v15) {
      objc_enumerationMutation(v9);
    }
    BOOL v19 = *(void **)(*((void *)&v34 + 1) + 8 * v18);
    if ((objc_msgSend(v19, "isEqualToString:", @"icpl", v32) & 1) != 0
      || [v19 isEqualToString:v17])
    {
      if ([p_cache + 393 isiCPLActivity:v4])
      {
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }

      goto LABEL_13;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    __int128 v21 = p_cache;
    id v22 = v9;
    id v23 = v20;
    uint64_t v24 = v17;
    dispatch_time_t v25 = (void *)objc_claimAutoreleasedReturnValue([v20 lowercaseString]);
    unsigned int v26 = [v25 containsString:v19];

    __int128 v17 = v24;
    double v9 = v22;
    p_cache = v21;
    id v4 = v33;
    if (v26)
    {
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      goto LABEL_24;
    }

- (BOOL)testModeConstraintsRequireOverridingDecisionWithScores:(id)a3 ignoredPolicies:(id)a4 honoredPolicies:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"overrides"]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100083BD8;
  v20[3] = &unk_100116F38;
  id v13 = v12;
  id v21 = v13;
  id v14 = v8;
  id v22 = v14;
  id v15 = v9;
  id v23 = v15;
  [v10 enumerateKeysAndObjectsUsingBlock:v20];

  __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Ignored policies: %@", buf, 0xCu);
  }

  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Honored policies: %@", buf, 0xCu);
  }

  BOOL v18 = [v15 count] == 0;
  return v18;
}

- (BOOL)activityIsTimewiseEligible:(id)a3 atDate:(id)a4
{
  return [a3 timewiseEligibleAtDate:a4];
}

- (BOOL)shouldRunActivityNow:(id)a3 withOtherActivities:(id)a4
{
  id v6 = a3;
  id v68 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_evaluationQueue);
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithObjectsFrom:]( &OBJC_CLASS___NSMutableSet,  "setWithObjectsFrom:",  self->_prerunningTasks,  self->_runningTasks,  0LL));
  unsigned int v7 = [v69 containsObject:v6];
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  if (v7)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v81 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ is already running. Should not be run again.",  buf,  0xCu);
    }

    goto LABEL_15;
  }

  uint64_t v70 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = (os_log_s *)v70;
  if (-[_DASDaemon activityIsTimewiseEligible:atDate:](self, "activityIsTimewiseEligible:atDate:", v6, v70))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 lastScored]);
    if (!v9)
    {
      if (!+[_DASCheckpointRecorder shouldLogCheckpointForActivity:]( &OBJC_CLASS____DASCheckpointRecorder,  "shouldLogCheckpointForActivity:",  v6))
      {
LABEL_9:
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));

        if (v10 && -[_DASDaemon pausedParametersApplyToActivity:](self, "pausedParametersApplyToActivity:", v6))
        {
          BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v81 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Scheduling Paused: Skipping activity: %{public}@",  buf,  0xCu);
          }

          goto LABEL_14;
        }

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 fastPass]);

        if (v14)
        {
          __int128 v78 = 0u;
          __int128 v79 = 0u;
          __int128 v76 = 0u;
          __int128 v77 = 0u;
          id v15 = v68;
          id v16 = [v15 countByEnumeratingWithState:&v76 objects:v89 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v77;
            do
            {
              for (i = 0LL; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v77 != v17) {
                  objc_enumerationMutation(v15);
                }
                BOOL v19 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
                if (-[_DASDaemon shouldPreemptActivity:forFastPassActivity:]( self,  "shouldPreemptActivity:forFastPassActivity:",  v19,  v6))
                {
                  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger defaultCategory]( &OBJC_CLASS____DASDaemonLogger,  "defaultCategory"));
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    id v81 = v19;
                    __int16 v82 = 2114;
                    double v83 = *(double *)&v6;
                    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Preempting %{public}@ to unblock the associated fast pass %{public}@",  buf,  0x16u);
                  }

                  -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:]( self,  "updateSuspendRequestDate:forActivity:withReason:",  v70,  v19,  @"Preemption");
                  -[_DASDaemon suspendActivity:](self, "suspendActivity:", v19);
                }
              }

              id v16 = [v15 countByEnumeratingWithState:&v76 objects:v89 count:16];
            }

            while (v16);
          }
        }

        +[_DASConditionScore scoreForActivity:withState:response:]( &OBJC_CLASS____DASConditionScore,  "scoreForActivity:withState:response:",  v6,  self->_context,  &v75);
        double v22 = v21;
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));

        if (v23
          && (v75 == 100 || v75 == 33)
          && -[_DASDaemon testModeConstraintsApplyToActivity:](self, "testModeConstraintsApplyToActivity:", v6))
        {
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v6 policyScores]);
          unsigned int v27 = -[_DASDaemon testModeConstraintsRequireOverridingDecisionWithScores:ignoredPolicies:honoredPolicies:]( self,  "testModeConstraintsRequireOverridingDecisionWithScores:ignoredPolicies:honoredPolicies:",  v26,  v24,  v25);

          if (v24) {
            -[_DASDaemon activity:runWithoutHonoringPolicies:](self, "activity:runWithoutHonoringPolicies:", v6, v24);
          }
          if (v25) {
            -[_DASDaemon activity:blockedOnPolicies:](self, "activity:blockedOnPolicies:", v6, v25);
          }
          if (v27)
          {
            id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v81 = v6;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Test Mode: Proceeding with activity: %@",  buf,  0xCu);
            }

            goto LABEL_78;
          }
        }

        -[_DASDaemon reportActivity:isBlockedWithDecision:](self, "reportActivity:isBlockedWithDecision:", v6, v75);
        BOOL v12 = 0;
        if (v75 == 33) {
          goto LABEL_79;
        }
        id v8 = (os_log_s *)v70;
        if (v75 == 100) {
          goto LABEL_16;
        }
        if (v75 == 67)
        {
          BOOL v12 = 1;
          goto LABEL_16;
        }

        id v29 = [v6 schedulingPriority];
        if ((unint64_t)v29 >= _DASSchedulingPriorityUserInitiated)
        {
          int v31 = 0;
        }

        else
        {
          __int128 v73 = 0u;
          __int128 v74 = 0u;
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          id v30 = v68;
          int v31 = 0;
          id v32 = [v30 countByEnumeratingWithState:&v71 objects:v88 count:16];
          if (v32)
          {
            uint64_t v33 = *(void *)v72;
            while (2)
            {
              for (j = 0LL; j != v32; j = (char *)j + 1)
              {
                if (*(void *)v72 != v33) {
                  objc_enumerationMutation(v30);
                }
                __int128 v35 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)j);
                __int128 v36 = objc_autoreleasePoolPush();
                [v6 compatibilityWith:v35];
                double v38 = v37;
                if (+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v6))
                {
                  if (+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v35))
                  {
                    id v39 = [v6 transferSizeType];
                    id v40 = [v35 transferSizeType];
                    if ((unint64_t)v39 >= 0xB && (unint64_t)v40 > 0xA)
                    {
                      double v38 = -1.0;
LABEL_81:
                      unsigned int v53 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring"));
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v54 = objc_claimAutoreleasedReturnValue([v35 startDate]);
                        BOOL v55 = (void *)v54;
                        BOOL v56 = @"<Not yet started>";
                        *(_DWORD *)buf = 138544130;
                        if (v54) {
                          BOOL v56 = (const __CFString *)v54;
                        }
                        id v81 = v6;
                        __int16 v82 = 2048;
                        double v83 = v38;
                        __int16 v84 = 2114;
                        double v85 = *(double *)&v35;
                        __int16 v86 = 2112;
                        __int128 v87 = v56;
                        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "'%{public}@' has compatibility score of %lf with %{public}@ (Started at %@). Bailing out.",  buf,  0x2Au);
                      }

                      char v57 = self->_activityToIncompatibleActivitiesMap;
                      objc_sync_enter(v57);
                      activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
                      __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v35 name]);
                      __int128 v60 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( activityToIncompatibleActivitiesMap,  "objectForKeyedSubscript:",  v59));

                      if (v60)
                      {
                        objc_msgSend(v60, "_DAS_addOrReplaceObject:", v6);
                      }

                      else
                      {
                        __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v6));
                        __int128 v62 = self->_activityToIncompatibleActivitiesMap;
                        __int128 v63 = (void *)objc_claimAutoreleasedReturnValue([v35 name]);
                        -[NSMutableDictionary setObject:forKeyedSubscript:]( v62,  "setObject:forKeyedSubscript:",  v61,  v63);
                      }

                      objc_sync_exit(v57);
                      __int128 v64 = (void *)objc_claimAutoreleasedReturnValue([v35 startDate]);
                      __int128 v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
                      unsigned int v66 = -[_DASDaemon shouldSuspendLongRunningActivity:withStartDate:whileBlockingOtherTasks:atDate:]( self,  "shouldSuspendLongRunningActivity:withStartDate:whileBlockingOtherTasks:atDate:",  v35,  v64,  1LL,  v65);

                      if (v66)
                      {
                        __int128 v67 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"runtimeLimiter"));
                        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138543362;
                          id v81 = v35;
                          _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "Another intensive activity! Found long running activity %{public}@ to suspend",  buf,  0xCu);
                        }

                        -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:]( self,  "updateSuspendRequestDate:forActivity:withReason:",  v70,  v35,  @"Limitations");
                        -[_DASDaemon suspendActivity:](self, "suspendActivity:", v35);
                      }

                      objc_autoreleasePoolPop(v36);

                      goto LABEL_14;
                    }
                  }
                }

                if (v38 < 0.0) {
                  goto LABEL_81;
                }
                if (!v31 && v38 > 0.0)
                {
                  id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring"));
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543874;
                    id v81 = v6;
                    __int16 v82 = 2048;
                    double v83 = v38;
                    __int16 v84 = 2114;
                    double v85 = *(double *)&v35;
                    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "'%{public}@' has compatibility score of %lf with '%{public}@'. Relaxing scores.",  buf,  0x20u);
                  }

                  int v31 = 1;
                }

                objc_autoreleasePoolPop(v36);
              }

              id v32 = [v30 countByEnumeratingWithState:&v71 objects:v88 count:16];
              if (v32) {
                continue;
              }
              break;
            }
          }
        }

        +[_DASConditionScore thresholdScoreForActivity:]( &OBJC_CLASS____DASConditionScore,  "thresholdScoreForActivity:",  v6);
        if (v31) {
          double v43 = v42 * 0.9;
        }
        else {
          double v43 = v42;
        }
        unsigned int v44 = [v6 bypassesPredictions];
        id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"scoring"));
        BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
        if (v44)
        {
          if (v46)
          {
            *(_DWORD *)buf = 138543618;
            id v81 = v6;
            __int16 v82 = 1024;
            LODWORD(v83) = v22 > v43;
            uint64_t v47 = "'%{public}@' DecisionToRun: %d (Bypasses Predictions)";
            uint64_t v48 = v45;
            uint32_t v49 = 18;
LABEL_75:
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
          }
        }

        else if (v46)
        {
          *(_DWORD *)buf = 138544130;
          id v81 = v6;
          __int16 v82 = 2048;
          double v83 = v22;
          __int16 v84 = 2048;
          double v85 = v43;
          __int16 v86 = 1024;
          LODWORD(v87) = v22 > v43;
          uint64_t v47 = "'%{public}@' CurrentScore: %lf, ThresholdScore: %lf DecisionToRun:%d";
          uint64_t v48 = v45;
          uint32_t v49 = 38;
          goto LABEL_75;
        }

        if (v22 <= v43)
        {
LABEL_14:
          BOOL v12 = 0;
LABEL_79:
          id v8 = (os_log_s *)v70;
          goto LABEL_16;
        }

        id v50 = v6;
        objc_sync_enter(v50);
        unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue( +[_DASInternalPolicyEvaluationMetadata metadataWithScore:]( &OBJC_CLASS____DASInternalPolicyEvaluationMetadata,  "metadataWithScore:",  v22));
        char v52 = (void *)objc_claimAutoreleasedReturnValue([v50 policyResponseMetadata]);
        [v52 setObject:v51 forKeyedSubscript:@"scoreWhenRun"];

        objc_sync_exit(v50);
LABEL_78:
        BOOL v12 = 1;
        goto LABEL_79;
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
      [v9 reportTaskCheckpoint:15 forTask:v6 error:0];
    }

    goto LABEL_9;
  }

- (BOOL)shouldRunActivityNow:(id)a3
{
  BOOL v3 = self;
  p_activityStateLock = &self->_activityStateLock;
  id v5 = a3;
  os_unfair_recursive_lock_lock_with_options(p_activityStateLock, 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjectsFrom:]( &OBJC_CLASS___NSArray,  "arrayWithObjectsFrom:",  v3->_prerunningTasks,  v3->_runningTasks,  0LL));
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  LOBYTE(v3) = -[_DASDaemon shouldRunActivityNow:withOtherActivities:]( v3,  "shouldRunActivityNow:withOtherActivities:",  v5,  v6);

  return (char)v3;
}

- (void)moveActivityToPrerunning:(id)a3
{
  id v4 = a3;
  -[_DASDaemon removeActivityFromTriggerMap:](self, "removeActivityFromTriggerMap:", v4);
  if (-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:]( self->_networkEvaluationMonitor,  "requiresNetworkPathMonitoring:",  v4))
  {
    networkEvaluationMonitor = self->_networkEvaluationMonitor;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    -[_DASNetworkEvaluationMonitor stopMonitoringActivity:](networkEvaluationMonitor, "stopMonitoringActivity:", v6);
  }

  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  -[NSMutableSet removeObject:](self->_pendingTasks, "removeObject:", v4);
  -[NSMutableSet addObject:](self->_prerunningTasks, "addObject:", v4);
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:]( self,  "recordToTaskRegistry:lifeCycleStateName:",  v4,  @"prerunning");
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 groupName]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 groupName]);
    -[_DASDaemon addPrerunningActivity:toGroupWithName:](self, "addPrerunningActivity:toGroupWithName:", v4, v8);
  }

  dispatch_time_t v9 = dispatch_time(0LL, 61000000000LL);
  evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100084914;
  v12[3] = &unk_100115148;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_after(v9, evaluationQueue, v12);
}

- (void)clearActivityFromPrerunning:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  uint64_t v17 = 0LL;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_100084B3C;
  double v21 = sub_100084B4C;
  id v22 = 0LL;
  prerunningTasks = self->_prerunningTasks;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_100084B54;
  id v14 = &unk_100116F60;
  id v6 = v4;
  id v15 = v6;
  id v16 = &v17;
  -[NSMutableSet enumerateObjectsUsingBlock:](prerunningTasks, "enumerateObjectsUsingBlock:", &v11);
  if (v18[5]) {
    -[NSMutableSet removeObject:](self->_prerunningTasks, "removeObject:", v11, v12, v13, v14);
  }
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  groupToPrerunningTasks = self->_groupToPrerunningTasks;
  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v18[5] groupName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( groupToPrerunningTasks,  "objectForKeyedSubscript:",  v9));
  [v10 removeObject:v18[5]];

  os_unfair_lock_unlock(p_groupLock);
  _Block_object_dispose(&v17, 8);
}

- (void)moveActivityToRunning:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  if (-[NSMutableSet containsObject:](self->_runningTasks, "containsObject:", v4))
  {
    os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  }

  else
  {
    -[NSMutableSet removeObject:](self->_prerunningTasks, "removeObject:", v4);
    -[NSMutableSet removeObject:](self->_pendingTasks, "removeObject:", v4);
    -[NSMutableSet count](self->_runningTasks, "count");
    -[NSMutableSet addObject:](self->_runningTasks, "addObject:", v4);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"runningTasks"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000B7910();
    }

    os_unfair_recursive_lock_unlock(&self->_activityStateLock);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v4 setStartDate:v6];

    if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:]( &OBJC_CLASS____DASCheckpointRecorder,  "shouldLogCheckpointForActivity:",  v4))
    {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
      [v7 reportTaskCheckpoint:20 forTask:v4 error:0];
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 groupName]);

    if (v8)
    {
      dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 groupName]);
      -[_DASDaemon addRunningActivity:toGroupWithName:](self, "addRunningActivity:toGroupWithName:", v4, v9);
    }

    if ([v4 userRequestedBackupTask]) {
      -[_DASUserRequestedBackupTaskManager reportActivityRunning:]( self->_backupTaskManager,  "reportActivityRunning:",  v4);
    }
  }
}

- (void)beginWorkForActivity:(id)a3
{
  id v6 = a3;
  if ([v6 requestsApplicationLaunch])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v6));
    -[_DASDaemon runApplicationLaunchActivities:](self, "runApplicationLaunchActivities:", v4);
  }

  else
  {
    unsigned int v5 = [v6 requestsExtensionLaunch];
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v6));
    if (v5) {
      -[_DASDaemon runExtensionLaunchActivities:](self, "runExtensionLaunchActivities:", v4);
    }
    else {
      -[_DASDaemon runActivitiesAndRemoveUnknown:](self, "runActivitiesAndRemoveUnknown:", v4);
    }
  }
}

- (void)immediatelyBeginWorkForActivity:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithObjectsFrom:]( &OBJC_CLASS___NSMutableSet,  "setWithObjectsFrom:",  self->_prerunningTasks,  self->_runningTasks,  0LL));
  unsigned int v6 = [v5 containsObject:v4];
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  if (v6)
  {
    unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@ is already running, cannot begin work for it.",  buf,  0xCu);
    }
  }

  else
  {
    -[_DASDaemon moveActivityToPrerunning:](self, "moveActivityToPrerunning:", v4);
    -[_DASDaemon beginWorkForActivity:](self, "beginWorkForActivity:", v4);
  }
}

- (BOOL)shouldEvaluateTask:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_activityToIncompatibleActivitiesMap;
  objc_sync_enter(v8);
  activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( activityToIncompatibleActivitiesMap,  "objectForKeyedSubscript:",  v10));

  id v12 = [v11 count];
  objc_sync_exit(v8);

  if (v12)
  {
    BOOL v13 = 0;
  }

  else if (([v6 hasManyConstraints] & 1) != 0 {
         || ([v6 bypassesPredictions] & 1) != 0)
  }
  {
    BOOL v13 = 1;
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
    [v14 timeIntervalSinceDate:v7];
    BOOL v13 = v15 < 1800.0;
  }

  return v13;
}

- (void)advanceAppLaunchDateIfNecessaryForActivity:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:_DASNonRateLimitedLaunchKey]);
  unsigned __int8 v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]);
    if ([v8 count]
      && (id v9 = [v4 schedulingPriority], (unint64_t)v9 <= _DASSchedulingPriorityUtility))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 widgetID]);

      if (!v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DASApplicationPolicy focalApplicationsWithContext:]( &OBJC_CLASS____DASApplicationPolicy,  "focalApplicationsWithContext:",  self->_context));
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        id v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "relatedApplications", 0));
        id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v35,  v45,  16LL);
        if (v13)
        {
          uint64_t v14 = *(void *)v36;
LABEL_8:
          uint64_t v15 = 0LL;
          while (1)
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(v12);
            }
            if (v13 == (id)++v15)
            {
              id v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v35,  v45,  16LL);
              if (v13) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
        }

        else
        {
LABEL_14:

          id v12 = self->_recentlyLaunchedApps;
          objc_sync_enter(v12);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 relatedApplications]);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);

          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_recentlyLaunchedApps,  "objectForKeyedSubscript:",  v17));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 startAfter]);
          if (-[NSCountedSet countForObject:](self->_launchesPerApp, "countForObject:", v17) > 9
            || (id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]),
                BOOL v21 = v20 == (void *)_DASLaunchReasonBackgroundProcessing,
                v20,
                v21))
          {
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 launchReason]);
            BOOL v23 = v22 == (void *)_DASLaunchReasonBackgroundProcessing;

            double v24 = v23 ? *(double *)&qword_100156D48 : 450.0;
            if (v18)
            {
              id v25 = (void *)objc_claimAutoreleasedReturnValue([v4 startAfter]);
              [v25 timeIntervalSinceDate:v18];
              BOOL v27 = v26 < v24;

              if (v27)
              {
                id v28 = (void *)objc_claimAutoreleasedReturnValue([v18 dateByAddingTimeInterval:v24]);
                [v4 setStartAfter:v28];

                id v29 = (void *)objc_claimAutoreleasedReturnValue([v4 startAfter]);
                [v4 setStartBefore:v29];

                id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  int v31 = (void *)objc_claimAutoreleasedReturnValue([v4 startAfter]);
                  [v31 timeIntervalSinceDate:v19];
                  double v33 = v32;
                  __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v4 startAfter]);
                  *(_DWORD *)buf = 138412802;
                  id v40 = v4;
                  __int16 v41 = 2048;
                  double v42 = v33 / 60.0;
                  __int16 v43 = 2112;
                  unsigned int v44 = v34;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Advancing start date for %@ by %3.1lf minutes to %@",  buf,  0x20u);
                }
              }
            }
          }

          objc_sync_exit(v12);
        }
      }
    }

    else
    {
    }
  }
}

- (void)computeStaticPriorityForActivity:(id)a3
{
  uint64_t v3 = 999999999LL;
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 featureCodes]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionaryForPlist:2]);

    if ([v7 count])
    {
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featureCodes", 0));
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)i) stringValue]);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v13]);

            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"priority"]);
            id v16 = v15;
            if (v15) {
              signed int v17 = [v15 intValue];
            }
            else {
              signed int v17 = 999999999;
            }
            if (v3 >= v17) {
              uint64_t v3 = v17;
            }
          }

          id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }

        while (v10);
      }
    }
  }

  [v4 setStaticPriority:v3];
}

- (BOOL)validateConfigurationForActivity:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[_DASConfigurationLimiter shouldLimitActivityAtSubmission:]( self->_configurationLimiter,  "shouldLimitActivityAtSubmission:",  v4));
  id v6 = v5;
  if (v5 && [v5 count])
  {
    -[_DASConfigurationLimiter limitedActivity:withLimitsResponses:]( self->_configurationLimiter,  "limitedActivity:withLimitsResponses:",  v4,  v6);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 limitationResponse]);
    unsigned int v8 = +[_DASLimiterResponse queryActivityDecision:fromResponses:]( &OBJC_CLASS____DASLimiterResponse,  "queryActivityDecision:fromResponses:",  4LL,  v7);

    if (v8)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
      if (!v9
        || (id v10 = (void *)v9,
            unsigned __int8 v11 = -[_DASDaemon testModeConstraintsApplyToActivity:](self, "testModeConstraintsApplyToActivity:", v4),
            v10,
            (v11 & 1) == 0))
      {
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"ConfigurationLimiter"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000B7970(v4, v16);
        }
        BOOL v14 = 0;
        goto LABEL_17;
      }

      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"ConfigurationLimiter"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_1000B7A94();
      }
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 limitationResponse]);
    BOOL v14 = 1;
    unsigned int v15 = +[_DASLimiterResponse queryActivityDecision:fromResponses:]( &OBJC_CLASS____DASLimiterResponse,  "queryActivityDecision:fromResponses:",  1LL,  v13);

    if (v15)
    {
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"ConfigurationLimiter"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000B7A14(v4, v16);
      }
      BOOL v14 = 1;
LABEL_17:
    }
  }

  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (void)submitActivity:(id)a3
{
}

- (void)startedActivities:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)os_transaction_create("com.apple.dasd.startedActivities");
  id v6 = self;
  objc_sync_enter(v6);
  unsigned __int8 v7 = objc_autoreleasePoolPush();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      unsigned __int8 v11 = 0LL;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        -[_DASDaemon moveActivityToRunning:]( v6,  "moveActivityToRunning:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11));
        unsigned __int8 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v9);
  }

  objc_autoreleasePoolPop(v7);
  objc_sync_exit(v6);

  evaluationQueue = (dispatch_queue_s *)v6->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100085ACC;
  block[3] = &unk_1001150D0;
  void block[4] = v6;
  dispatch_sync(evaluationQueue, block);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Started activities: %{public}@", buf, 0xCu);
  }
}

- (void)submitActivities:(id)a3
{
  id v4 = a3;
  uint64_t v72 = os_transaction_create("com.apple.dasd.submitActivities");
  unsigned int v5 = self;
  objc_sync_enter(v5);
  __int128 v74 = objc_autoreleasePoolPush();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v101 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Submitted activities: %{public}@", buf, 0xCu);
  }

  id v7 = [v4 count];
  double v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v7));
  uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  -[NSMutableDictionary count](v5->_groups, "count")));
  __int128 v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", v7));
  __int128 v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", v7));
  __int128 v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", v7));
  __int128 v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", v7));
  __int128 v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v94 objects:v99 count:16];
  if (v8)
  {
    uint64_t v85 = *(void *)v95;
    uint64_t v81 = _DASLaunchReasonBackgroundRemoteNotification;
    lock = &v5->_groupLock;
    p_activityStateLock = &v5->_activityStateLock;
    uint64_t v78 = kNWEndpointKey;
    do
    {
      id v86 = v8;
      for (i = 0LL; i != v86; i = (char *)i + 1)
      {
        if (*(void *)v95 != v85) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v94 + 1) + 8LL * (void)i);
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteDevice", v72));
        if (v11)
        {
          BOOL v12 = [v10 targetDevice] == (id)3;

          if (v12) {
            -[_DASRemoteDeviceNearbyMonitor registerForRemoteDeviceWithActivity:]( v5->_remoteDeviceNearbyMonitor,  "registerForRemoteDeviceWithActivity:",  v10);
          }
        }

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteDevice]);
        if (v13)
        {
          unsigned int v14 = [v10 requiresRemoteDeviceWake];

          if (v14) {
            -[_DASRemoteDeviceWakeMonitor registerRemoteDeviceWakeStateWithActivity:]( v5->_remoteDeviceWakeMonitor,  "registerRemoteDeviceWakeStateWithActivity:",  v10);
          }
        }

        if ([v10 triggersRestart]
          && [v10 isSoftwareUpdateActivity])
        {
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v10 startAfter]);
          id v16 = [v15 dateByAddingTimeInterval:(double)arc4random_uniform(0xE10u) + -900.0];
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          [v10 setStartAfter:v17];
        }

        context = objc_autoreleasePoolPush();
        -[_DASDaemon clearActivityFromPrerunning:](v5, "clearActivityFromPrerunning:", v10);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v10 submitDate]);
        BOOL v19 = v18 == 0LL;

        if (v19) {
          [v10 setSubmitDate:v87];
        }
        if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:]( &OBJC_CLASS____DASCheckpointRecorder,  "shouldLogCheckpointForActivity:",  v10))
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue( +[_DASCheckpointRecorder sharedInstance]( &OBJC_CLASS____DASCheckpointRecorder,  "sharedInstance"));
          [v20 reportTaskCheckpoint:10 forTask:v10 error:0];
        }

        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v10 featureCodes]);
        if (v21)
        {
        }

        else
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v10 fastPass]);
          BOOL v23 = v22 == 0LL;

          if (v23) {
            goto LABEL_25;
          }
        }

        double v24 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
        double v26 = (void *)objc_claimAutoreleasedReturnValue([v10 featureCodes]);
        BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v10 fastPass]);
        objc_msgSend( v24,  "addFeatureCodesForTask:featureCodes:semanticVersion:",  v25,  v26,  objc_msgSend(v27, "semanticVersion"));

LABEL_25:
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v10 producedResultIdentifiers]);
        if (v28)
        {
        }

        else
        {
          id v29 = (void *)objc_claimAutoreleasedReturnValue([v10 dependencies]);
          BOOL v30 = v29 == 0LL;

          if (v30) {
            goto LABEL_36;
          }
        }

        int v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
        __int128 v92 = 0u;
        __int128 v93 = 0u;
        __int128 v90 = 0u;
        __int128 v91 = 0u;
        double v32 = (void *)objc_claimAutoreleasedReturnValue([v10 dependencies]);
        id v33 = [v32 countByEnumeratingWithState:&v90 objects:v98 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v91;
          do
          {
            for (j = 0LL; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v91 != v34) {
                objc_enumerationMutation(v32);
              }
              [v31 addObject:v36];
            }

            id v33 = [v32 countByEnumeratingWithState:&v90 objects:v98 count:16];
          }

          while (v33);
        }

        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v10 producedResultIdentifiers]);
        [v37 addDependencyInfoForTask:v38 producedResultIdentifiers:v39 dependencyIdentifiers:v31];

LABEL_36:
        -[_DASDaemon computeStaticPriorityForActivity:](v5, "computeStaticPriorityForActivity:", v10);
        +[_DASConditionScore setActivityShouldBypassPredictions:]( &OBJC_CLASS____DASConditionScore,  "setActivityShouldBypassPredictions:",  v10);
        -[_DASDaemon addTriggersToActivity:](v5, "addTriggersToActivity:", v10);
        if ([v10 requestsApplicationLaunch])
        {
          id v40 = (void *)objc_claimAutoreleasedReturnValue([v10 launchReason]);
          unsigned int v41 = [v40 isEqualToString:v81];

          if (v41)
          {
            unsigned int v42 = [v10 isSilentPush];
            id v43 = [v10 schedulingPriority];
            else {
              unsigned int v44 = 0;
            }
            if (v44 == 1)
            {
              id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                __int128 v69 = (void *)objc_claimAutoreleasedReturnValue([v10 relatedApplications]);
                uint64_t v70 = (void *)objc_claimAutoreleasedReturnValue([v69 firstObject]);
                *(_DWORD *)buf = 138412290;
                id v101 = v70;
                _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "High-priority silent push for %@",  buf,  0xCu);
              }

              [v77 addObject:v10];
              goto LABEL_76;
            }

            barScheduler = v5->_barScheduler;
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v10 relatedApplications]);
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 firstObject]);
            unsigned int v49 = -[_DASBARScheduler pushLaunchAllowedForApp:immediately:]( barScheduler,  "pushLaunchAllowedForApp:immediately:",  v48,  buf);

            if (buf[0]) {
              unsigned int v50 = v49;
            }
            else {
              unsigned int v50 = 0;
            }
            if (v50 == 1)
            {
              -[_DASDaemon addLaunchRequest:](v5, "addLaunchRequest:", v10);
              -[_DASDaemon immediatelyBeginWorkForActivity:](v5, "immediatelyBeginWorkForActivity:", v10);
              goto LABEL_76;
            }

            unsigned int v51 = v5->_barScheduler;
            char v52 = (void *)objc_claimAutoreleasedReturnValue([v10 relatedApplications]);
            unsigned int v53 = (void *)objc_claimAutoreleasedReturnValue([v52 firstObject]);
            LODWORD(v51) = -[_DASBARScheduler isNewsstandApp:](v51, "isNewsstandApp:", v53);

            if ((_DWORD)v51) {
              [v10 setRequestsNewsstandLaunch:1];
            }
          }

          if (!-[_DASDaemon addLaunchRequest:](v5, "addLaunchRequest:", v10))
          {
            [v77 addObject:v10];
            goto LABEL_76;
          }
        }

        if (([v10 requestsApplicationLaunch] & 1) != 0
          || [v10 requestsExtensionLaunch])
        {
          uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v10 groupName]);

          if (v54)
          {
            os_unfair_lock_lock(lock);
            groups = v5->_groups;
            BOOL v56 = (void *)objc_claimAutoreleasedReturnValue([v10 groupName]);
            char v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](groups, "objectForKeyedSubscript:", v56));

            if (v57)
            {
              char v58 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
              [v75 setObject:v57 forKey:v58];
            }

            os_unfair_lock_unlock(lock);
          }
        }

        __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v10 groupName]);
        if (v59)
        {
          __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKeyedSubscript:v59]);
          __int128 v61 = v60;
          if (v60)
          {
            [v60 addObject:v10];
          }

          else
          {
            __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v10));
            [v83 setObject:v62 forKeyedSubscript:v59];
          }
        }

        +[_DASConditionScore computeOptimalScoreAndDateForActivity:]( &OBJC_CLASS____DASConditionScore,  "computeOptimalScoreAndDateForActivity:",  v10);
        os_unfair_recursive_lock_lock_with_options(p_activityStateLock, 0LL);
        -[NSMutableSet addObject:](v5->_pendingTasks, "addObject:", v10);
        os_unfair_recursive_lock_unlock(p_activityStateLock);
        if (-[_DASDaemon shouldEvaluateTask:atDate:](v5, "shouldEvaluateTask:atDate:", v10, v87)) {
          [v80 addObject:v10];
        }
        if (-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:]( v5->_networkEvaluationMonitor,  "requiresNetworkPathMonitoring:",  v10))
        {
          __int128 v63 = objc_autoreleasePoolPush();
          networkEvaluationMonitor = v5->_networkEvaluationMonitor;
          __int128 v65 = (void *)objc_claimAutoreleasedReturnValue([v10 uuid]);
          unsigned int v66 = (void *)objc_claimAutoreleasedReturnValue( +[_DASNetworkEvaluationMonitor nwParametersForActivity:]( &OBJC_CLASS____DASNetworkEvaluationMonitor,  "nwParametersForActivity:",  v10));
          __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
          id v68 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKeyedSubscript:v78]);
          -[_DASNetworkEvaluationMonitor startMonitoringActivity:withNetworkParameters:withEndpoint:]( networkEvaluationMonitor,  "startMonitoringActivity:withNetworkParameters:withEndpoint:",  v65,  v66,  v68);

          objc_autoreleasePoolPop(v63);
        }

LABEL_76:
        objc_autoreleasePoolPop(context);
      }

      id v8 = [obj countByEnumeratingWithState:&v94 objects:v99 count:16];
    }

    while (v8);
  }

  -[_DASDaemon addPendingActivitiesToGroups:](v5, "addPendingActivitiesToGroups:", v83);
  if ([v76 count])
  {
    __int128 v71 = objc_autoreleasePoolPush();
    -[_DASDataStore saveActivities:](v5->_store, "saveActivities:", v76);
    objc_autoreleasePoolPop(v71);
  }

  -[_DASDaemon cancelActivities:](v5, "cancelActivities:", v77, v72);
  -[_DASDaemon evaluateScoreAndRunActivities:](v5, "evaluateScoreAndRunActivities:", v80);
  -[_DASDaemon determineNextTimerFireDateAndSchedule](v5, "determineNextTimerFireDateAndSchedule");

  objc_autoreleasePoolPop(v74);
  objc_sync_exit(v5);
}

- (void)handleRunningActivities:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[_DASDaemon prepareActivityForStart:atTime:]( self,  "prepareActivityForStart:atTime:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  v5,  (void)v11);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)cleanupForActivity:(id)a3 wasCompleted:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5) {
    goto LABEL_62;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 assertion]);

  if (v7)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"assertions"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000B7B5C();
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 assertion]);
    id v91 = 0LL;
    unsigned __int8 v10 = [v9 invalidateWithError:&v91];
    id v11 = v91;

    if ((v10 & 1) == 0 && v11)
    {
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000B7AF4();
      }
    }
  }

  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  -[NSMutableSet removeObject:](self->_runningTasks, "removeObject:", v6);
  -[NSMutableSet removeObject:](self->_pendingTasks, "removeObject:", v6);
  -[NSMutableSet removeObject:](self->_prerunningTasks, "removeObject:", v6);
  -[_DASDaemon removeActivityFromNestedMaps:](self, "removeActivityFromNestedMaps:", v6);
  __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"runningTasks"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7910();
  }

  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  -[_DASDaemon releaseAssertion:](self, "releaseAssertion:", v6);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](&OBJC_CLASS____DASPLLogger, "sharedInstance"));
  [v14 recordActivity:v6];

  -[_DASActivityDependencyManager endDependencyMonitoringForActivity:]( self->_dependencyManager,  "endDependencyMonitoringForActivity:",  v6);
  if (-[_DASNetworkEvaluationMonitor requiresNetworkPathMonitoring:]( self->_networkEvaluationMonitor,  "requiresNetworkPathMonitoring:",  v6))
  {
    networkEvaluationMonitor = self->_networkEvaluationMonitor;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    -[_DASNetworkEvaluationMonitor stopMonitoringActivity:](networkEvaluationMonitor, "stopMonitoringActivity:", v16);
  }

  uint64_t v17 = objc_claimAutoreleasedReturnValue([v6 remoteDevice]);
  if (v17)
  {
    __int128 v18 = (void *)v17;
    id v19 = [v6 targetDevice];

    if (v19 == (id)3) {
      -[_DASRemoteDeviceNearbyMonitor unregisterForRemoteDeviceWithActivity:]( self->_remoteDeviceNearbyMonitor,  "unregisterForRemoteDeviceWithActivity:",  v6);
    }
  }

  uint64_t v20 = objc_claimAutoreleasedReturnValue([v6 remoteDevice]);
  if (v20)
  {
    __int128 v21 = (void *)v20;
    unsigned int v22 = [v6 requiresRemoteDeviceWake];

    if (v22) {
      -[_DASRemoteDeviceWakeMonitor unregisterRemoteDeviceWakeStateWithActivity:]( self->_remoteDeviceWakeMonitor,  "unregisterRemoteDeviceWakeStateWithActivity:",  v6);
    }
  }

  -[_DASActivityRateLimitManager completeActivity:](self->_rateLimiter, "completeActivity:", v6);
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);

  if (!v23) {
    goto LABEL_33;
  }
  os_unfair_lock_lock(&self->_groupLock);
  groupToPrerunningTasks = self->_groupToPrerunningTasks;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
  double v26 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( groupToPrerunningTasks,  "objectForKeyedSubscript:",  v25));
  [v26 removeObject:v6];

  groupToPendingTasks = self->_groupToPendingTasks;
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](groupToPendingTasks, "objectForKeyedSubscript:", v28));
  [v29 removeObject:v6];

  groupToRunningTasks = self->_groupToRunningTasks;
  int v31 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
  double v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](groupToRunningTasks, "objectForKeyedSubscript:", v31));
  unsigned int v33 = [v32 containsObject:v6];

  if (!v33)
  {
    os_unfair_lock_unlock(&self->_groupLock);
LABEL_33:
    int v45 = 0;
    goto LABEL_34;
  }

  uint64_t v34 = self->_groupToRunningTasks;
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v35));
  [v36 removeObject:v6];

  __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle(activityGroup)"));
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
    id v39 = self->_groupToRunningTasks;
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
    unsigned int v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v39, "objectForKeyedSubscript:", v40));
    id v42 = [v41 count];
    *(_DWORD *)buf = 138543874;
    __int128 v94 = v6;
    __int16 v95 = 2112;
    double v96 = *(double *)&v38;
    __int16 v97 = 2048;
    id v98 = v42;
    _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "NO LONGER RUNNING %{public}@ ...Tasks running in group [%@] are %ld!",  buf,  0x20u);
  }

  os_unfair_lock_unlock(&self->_groupLock);
  id v43 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
  unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
  if ([v44 isEqualToString:_DASDefaultNetworkGroupName])
  {

LABEL_30:
LABEL_31:
    int v45 = 1;
    goto LABEL_34;
  }

  __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
  unsigned __int8 v68 = [v67 isEqualToString:_DASDefaultRemoteGroupName];

  if ((v68 & 1) != 0) {
    goto LABEL_31;
  }
  __int128 v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  os_unfair_lock_lock(&self->_groupLock);
  uint64_t v70 = self->_groupToPendingTasks;
  __int128 v71 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
  uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v70, "objectForKeyedSubscript:", v71));
  id v73 = [v72 copy];

  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id v74 = v73;
  id v75 = [v74 countByEnumeratingWithState:&v87 objects:v92 count:16];
  if (v75)
  {
    id v76 = v75;
    uint64_t v77 = *(void *)v88;
    do
    {
      for (i = 0LL; i != v76; i = (char *)i + 1)
      {
        if (*(void *)v88 != v77) {
          objc_enumerationMutation(v74);
        }
        __int128 v79 = *(void **)(*((void *)&v87 + 1) + 8LL * (void)i);
      }

      id v76 = [v74 countByEnumeratingWithState:&v87 objects:v92 count:16];
    }

    while (v76);
  }

  os_unfair_lock_unlock(&self->_groupLock);
  if ([v69 count])
  {
    evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
    uint64_t v81 = _NSConcreteStackBlock;
    uint64_t v82 = 3221225472LL;
    double v83 = sub_100087094;
    __int16 v84 = &unk_100115148;
    uint64_t v85 = self;
    id v86 = v69;
    dispatch_async(evaluationQueue, &v81);
  }

  int v45 = 1;
LABEL_34:
  if ((objc_msgSend(v6, "requestsApplicationLaunch", v81, v82, v83, v84, v85) & 1) != 0
    || [v6 requestsExtensionLaunch])
  {
    -[_DASDaemon removeLaunchRequest:](self, "removeLaunchRequest:", v6);
  }

  BOOL v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  if ([v6 isIntensive])
  {
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);

    if (v47)
    {
      uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
      [v46 timeIntervalSinceDate:v48];
      unint64_t v50 = llround(v49 / 60.0);

      +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.runtimemins.intensive",  v50);
      unsigned int v51 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      unsigned __int8 v52 = [v51 isEqualToString:@"com.apple.photoanalysisd.backgroundanalysis"];

      if ((v52 & 1) != 0)
      {
        unsigned int v53 = &off_100116580;
LABEL_44:
        +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  *v53,  v50);
        goto LABEL_45;
      }

      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      unsigned int v55 = [v54 isEqualToString:@"com.apple.mediaanalysisd.fullanalysis"];

      if (v55)
      {
        unsigned int v53 = &off_100116588;
        goto LABEL_44;
      }
    }
  }

- (void)removeActivityFromNestedMaps:(id)a3
{
  id v4 = a3;
  -[_DASDaemon removeActivityFromTriggerMap:](self, "removeActivityFromTriggerMap:", v4);
  -[_DASDaemon removeActivityFromGroupToPendingTasks:](self, "removeActivityFromGroupToPendingTasks:", v4);
  -[_DASDaemon removeActivityFromIncompatibleActivitiesMap:](self, "removeActivityFromIncompatibleActivitiesMap:", v4);
}

- (void)removeActivityFromTriggerMap:(id)a3
{
  id v4 = a3;
  id v5 = self->_triggerToActivitiesMap;
  objc_sync_enter(v5);
  triggerToActivitiesMap = self->_triggerToActivitiesMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000871AC;
  v8[3] = &unk_100116D08;
  id v7 = v4;
  id v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( triggerToActivitiesMap,  "enumerateKeysAndObjectsUsingBlock:",  v8);

  objc_sync_exit(v5);
}

- (void)removeActivityFromGroupToPendingTasks:(id)a3
{
  id v4 = a3;
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  groupToPendingTasks = self->_groupToPendingTasks;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100087258;
  v8[3] = &unk_100116D08;
  id v9 = v4;
  id v7 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( groupToPendingTasks,  "enumerateKeysAndObjectsUsingBlock:",  v8);
  os_unfair_lock_unlock(p_groupLock);
}

- (void)removeActivityFromIncompatibleActivitiesMap:(id)a3
{
  id v4 = a3;
  id v5 = self->_activityToIncompatibleActivitiesMap;
  objc_sync_enter(v5);
  activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100087320;
  v8[3] = &unk_100116D08;
  id v7 = v4;
  id v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( activityToIncompatibleActivitiesMap,  "enumerateKeysAndObjectsUsingBlock:",  v8);

  objc_sync_exit(v5);
}

- (void)activityStarted:(id)a3
{
  id v4 = a3;
  if ([v4 delayedStart])
  {
    id v5 = (void *)os_transaction_create("com.apple.dasd.activityStarted");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 shortDescription]);
      *(_DWORD *)buf = 138543362;
      __int128 v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "STARTING %{public}@!", buf, 0xCu);
    }

    os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
    prerunningTasks = self->_prerunningTasks;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000875AC;
    v18[3] = &unk_100116FC8;
    id v9 = v4;
    id v19 = v9;
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet objectsPassingTest:](prerunningTasks, "objectsPassingTest:", v18));
    if ([v10 count])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 anyObject]);
      [v9 reconcileWithActivity:v11];
    }

    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon currentReportingConditions](self, "currentReportingConditions"));
    [v9 setStartConditions:v12];

    os_unfair_recursive_lock_unlock(&self->_activityStateLock);
    -[_DASDaemon createAssertion:](self, "createAssertion:", v9);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](&OBJC_CLASS____DASPLLogger, "sharedInstance"));
    [v13 recordActivityLifeCycleStart:v9];

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v9));
    -[_DASDaemon handleRunningActivities:](self, "handleRunningActivities:", v14);

    -[_DASDaemon recordToTaskRegistry:lifeCycleStateName:]( self,  "recordToTaskRegistry:lifeCycleStateName:",  v9,  @"started");
    if (([v9 wasForceRun] & 1) == 0)
    {
      evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10008761C;
      block[3] = &unk_100115148;
      void block[4] = self;
      id v17 = v9;
      dispatch_sync(evaluationQueue, block);
    }
  }
}

- (id)currentReportingConditions
{
  int64_t v3 = +[_DASNetworkQualityPolicy currentNetworkQualityWithContext:interface:]( &OBJC_CLASS____DASNetworkQualityPolicy,  "currentNetworkQualityWithContext:interface:",  self->_context,  &v29);
  context = self->_context;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForBatteryStateDataDictionary]( &OBJC_CLASS____CDContextQueries,  "keyPathForBatteryStateDataDictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v5));

  v30[0] = @"batteryLevel";
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries batteryPercentageKey](&OBJC_CLASS____CDContextQueries, "batteryPercentageKey"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v28]);
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (_UNKNOWN **)v7;
  }
  else {
    id v9 = &off_100122038;
  }
  v31[0] = v9;
  v30[1] = @"onCharger";
  BOOL v27 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries batteryExternalConnectedKey]( &OBJC_CLASS____CDContextQueries,  "batteryExternalConnectedKey"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v27]);
  id v11 = (void *)v10;
  if (v10) {
    __int128 v12 = (_UNKNOWN **)v10;
  }
  else {
    __int128 v12 = &off_100122038;
  }
  v31[1] = v12;
  v30[2] = @"nwInterface";
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v29));
  void v31[2] = v13;
  v30[3] = @"nwQuality";
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v3));
  v31[3] = v14;
  v30[4] = @"idle";
  __int128 v15 = self->_context;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](&OBJC_CLASS____CDContextQueries, "keyPathForInUseStatus"));
  uint64_t v17 = objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16));
  __int128 v18 = (void *)v17;
  if (v17) {
    id v19 = (_UNKNOWN **)v17;
  }
  else {
    id v19 = &off_100122038;
  }
  v31[4] = v19;
  v30[5] = @"thermalLevel";
  uint64_t v20 = self->_context;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextQueries keyPathForThermalPressureLevel]( &OBJC_CLASS____CDContextQueries,  "keyPathForThermalPressureLevel"));
  uint64_t v22 = objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v21));
  BOOL v23 = (void *)v22;
  if (v22) {
    double v24 = (_UNKNOWN **)v22;
  }
  else {
    double v24 = &off_100122038;
  }
  v31[5] = v24;
  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  6LL));

  return v25;
}

- (void)logLimitations:(id)a3
{
  id v4 = a3;
  if (([v4 requestsApplicationLaunch] & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
    if (v5)
    {
    }

    else
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 limitationResponse]);
      if (!v10) {
        goto LABEL_8;
      }
      id v11 = (void *)v10;
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 limitationResponse]);
      id v13 = [v12 count];

      if (!v13) {
        goto LABEL_8;
      }
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100087A7C;
    v16[3] = &unk_1001153D8;
    id v6 = v4;
    id v17 = v6;
    AnalyticsSendEventLazy(@"com.apple.dasd.limitationDistribution", v16);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 startDate]);
    if (v7)
    {
      id v8 = (void *)v7;
      unsigned int v9 = -[_DASRuntimeLimiter limitsApplyToActivity:](self->_runtimeLimiter, "limitsApplyToActivity:", v6);

      if (v9)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100087CCC;
        v14[3] = &unk_100116FF0;
        v14[4] = self;
        id v15 = v6;
        AnalyticsSendEventLazy(@"com.apple.dasd.runtimeLimits", v14);
      }
    }
  }

- (id)activityAnalyticsWithActivity:(id)a3 didComplete:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_queue_t v108 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 startAfter]);
  [v8 timeIntervalSinceDate:v9];
  uint64_t v11 = (uint64_t)v10;

  dispatch_queue_attr_t v106 = (void *)objc_claimAutoreleasedReturnValue([v6 startConditions]);
  id v105 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon currentReportingConditions](self, "currentReportingConditions"));
  __int128 v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 name]);
  if ((-[__CFString hasPrefix:](v12, "hasPrefix:", @"com.apple.CFNetwork-cc") & 1) != 0)
  {
    id v13 = @"com.apple.CFNetwork";
  }

  else
  {
    if (!-[__CFString containsString:](v12, "containsString:", @"x-coredata"))
    {
      __int128 v110 = v12;
      goto LABEL_7;
    }

    id v13 = (const __CFString *)objc_claimAutoreleasedReturnValue( -[__CFString substringWithRange:]( v12,  "substringWithRange:",  0LL,  -[__CFString rangeOfString:](v12, "rangeOfString:", @".x-coredata")));
  }

  __int128 v110 = (__CFString *)v13;
LABEL_7:
  uint64_t v14 = 0LL;
  while (1)
  {
    [v6 interval];
    uint64_t v16 = qword_1000D85C8[v14];
    [v6 interval];
    if (++v14 == 120) {
      goto LABEL_13;
    }
  }

  __int128 v18 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:"));
  if (v18) {
    goto LABEL_14;
  }
LABEL_13:
  __int128 v18 = &off_100122068;
LABEL_14:
  __int128 v109 = v18;
  uint64_t v19 = 0LL;
  while (1)
  {
    uint64_t v20 = qword_1000D85C8[v19];
    if (v20 == v11) {
      break;
    }
    if (v20 > v11)
    {
      uint64_t v21 = v20 - 1;
      goto LABEL_21;
    }

    if (++v19 == 120) {
      goto LABEL_22;
    }
  }

  uint64_t v21 = v11;
LABEL_21:
  uint64_t v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v21));
  if (v22) {
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v22 = &off_100122068;
LABEL_23:
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
  double v24 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
  [v23 timeIntervalSinceDate:v24];
  int v26 = llround(v25);
  uint64_t v27 = v26;

  if (v26 < 1)
  {
    int v31 = 120;
    double v32 = v22;
    while (1)
    {
      if (!v31)
      {
        __int128 v36 = 0LL;
        goto LABEL_41;
      }

      if (!(v26 + qword_1000D85C8[v31 - 1])) {
        break;
      }
      uint64_t v33 = qword_1000D85C8[v31--];
      if (v33 < -(uint64_t)v26)
      {
        uint64_t v34 = 1 - v33;
        goto LABEL_40;
      }
    }

    uint64_t v34 = -qword_1000D85C8[v31];
LABEL_40:
    __int128 v36 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v34));
LABEL_41:

    uint64_t v29 = &off_100122038;
  }

  else
  {
    uint64_t v28 = 0LL;
    uint64_t v29 = v22;
    while (1)
    {
      uint64_t v30 = qword_1000D85C8[v28];
      if (v30 == v27) {
        break;
      }
      if (v30 > v27)
      {
        uint64_t v35 = v30 - 1;
        goto LABEL_36;
      }

      if (++v28 == 120) {
        goto LABEL_37;
      }
    }

    uint64_t v35 = v27;
LABEL_36:
    __int128 v36 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v35));
    if (v36) {
      goto LABEL_42;
    }
LABEL_37:
    __int128 v36 = &off_100122068;
  }

- (void)activityCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v21 = (void *)os_transaction_create("com.apple.dasd.activityCompleted");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 shortDescription]);
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "COMPLETED %{public}@", buf, 0xCu);
  }

  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v7 = self->_runningTasks;
  id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid", p_activityStateLock));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
        unsigned int v15 = [v13 isEqual:v14];

        if (v15)
        {
          [v4 reconcileWithActivity:v12];
          goto LABEL_13;
        }
      }

      id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v24,  v28,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

- (void)recordToTaskRegistry:(id)a3 lifeCycleStateName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
  if (!self->_taskRegistryMode || !-[NSSet containsObject:](self->_taskRegistryProcesses, "containsObject:", v9)) {
    goto LABEL_29;
  }
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"taskregistry"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7D14();
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_testingDefaults, "objectForKey:", @"taskRegistry"));
  __int128 v12 = (NSMutableDictionary *)[v11 mutableCopy];

  if (!v12) {
    __int128 v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  id v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v36 = v9;
  double v32 = v8;
  if ([v7 isEqualToString:@"submitted"])
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v6 submitDate]);
  }

  else
  {
    if ([v7 isEqualToString:@"started"])
    {
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v6 startDate]);
      uint64_t v37 = objc_claimAutoreleasedReturnValue([v6 startConditions]);
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 policyResponseMetadata]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"scoreWhenRun"]);
      [v16 score];
      double v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));

      +[_DASConditionScore thresholdScoreForActivity:]( &OBJC_CLASS____DASConditionScore,  "thresholdScoreForActivity:",  v6);
      uint64_t v18 = v34;
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v19 doubleValue];
      uint64_t v21 = v37;
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20 * 0.9));
      goto LABEL_15;
    }

    if ([v7 isEqualToString:@"suspended"])
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v6 suspendRequestDate]);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(-[_DASDaemon currentReportingConditions](self, "currentReportingConditions"));
      double v17 = 0LL;
      uint64_t v19 = 0LL;
      uint64_t v22 = 0LL;
      goto LABEL_15;
    }

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  }

  uint64_t v18 = v14;
  double v17 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v21 = 0LL;
LABEL_15:
  if (([v7 isEqualToString:@"started"] & 1) != 0
    || [v7 isEqualToString:@"suspended"])
  {
    uint64_t v35 = v18;
    id v23 = v12;
    __int128 v24 = v22;
    __int128 v25 = v19;
    if ([v6 wasForceRun])
    {
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 wasForceRun]));
      -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v26, @"wasForceRun");
    }

    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 lastDenialValue]));
    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v27, @"lastDenialValue");

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v6 lastScored]);
    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v28, @"lastScored");

    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v21, @"conditions");
    uint64_t v19 = v25;
    uint64_t v22 = v24;
    __int128 v12 = v23;
    uint64_t v18 = v35;
  }

  if (v17) {
    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v17, @"scoreWhenRun");
  }
  if (v19) {
    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v19, @"thresholdScore");
  }
  uint64_t v33 = v19;
  __int128 v38 = (void *)v21;
  if (v22) {
    -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v22, @"relaxedThresholdScore");
  }
  -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v18, @"timestamp");
  -[NSMutableDictionary setValue:forKey:](v13, "setValue:forKey:", v7, @"state");
  uint64_t v29 = (void *)v18;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v12, "objectForKey:", v32));
  int v31 = (NSMutableArray *)[v30 mutableCopy];

  if (!v31) {
    int v31 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  }
  -[NSMutableArray addObject:](v31, "addObject:", v13);
  -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v31, v32);
  -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", v12, @"taskRegistry");

  id v8 = v32;
  id v9 = v36;
LABEL_29:
}

- (void)activityCanceled:(id)a3
{
  id v4 = a3;
  double v40 = (void *)os_transaction_create("com.apple.dasd.activityCanceled");
  unsigned int v5 = +[_DASConfig isInternalBuild](&OBJC_CLASS____DASConfig, "isInternalBuild");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_7;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 shortDescription]);
    *(_DWORD *)buf = 138412290;
    id v49 = v8;
    id v9 = "CANCELED: %@";
    uint64_t v10 = v6;
    uint32_t v11 = 12;
  }

  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 schedulingPriority]));
    *(_DWORD *)buf = 138543618;
    id v49 = v4;
    __int16 v50 = 2114;
    unsigned int v51 = v8;
    id v9 = "CANCELED: %{public}@ at priority %{public}@";
    uint64_t v10 = v6;
    uint32_t v11 = 22;
  }

  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);

LABEL_7:
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v12 = self->_runningTasks;
  id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v44;
    while (2)
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uuid", p_activityStateLock));
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
        unsigned int v20 = [v18 isEqual:v19];

        if (v20)
        {
          [v4 reconcileWithActivity:v17];
          goto LABEL_17;
        }
      }

      id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v43,  v47,  16LL);
      if (v14) {
        continue;
      }
      break;
    }
  }

- (void)updateActivity:(id)a3 withParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[_DASBudgetManager reportUpdateForActivity:withDataConsumed:]( self->_budgetManager,  "reportUpdateForActivity:withDataConsumed:",  v6,  v7);
  uint64_t v8 = _DASUpdateActivityPercentCompletedKey;
  uint64_t v21 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:_DASUpdateActivityPercentCompletedKey]);

  if (v9)
  {
    p_activityStateLock = &self->_activityStateLock;
    os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v10 = self->_runningTasks;
    id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid", p_activityStateLock));
          double v17 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
          unsigned int v18 = [v16 isEqual:v17];

          if (v18)
          {
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v8]);
            [v19 doubleValue];
            objc_msgSend(v15, "setPercentCompleted:");
          }
        }

        id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
      }

      while (v12);
    }

    os_unfair_recursive_lock_unlock(p_activityStateLock);
  }
}

- (void)_resetWidgetBudgets
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[_DASWidgetRefreshBudgetManager sharedInstance]( &OBJC_CLASS____DASWidgetRefreshBudgetManager,  "sharedInstance"));
  [v2 resetBudgets];
}

- (void)updateSystemConstraintsWithParameters:(id)a3
{
  uint64_t v4 = kDASSystemContextKeyHeavyDiskUsage;
  id v5 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kDASSystemContextNonDASCriticalWorkloadRunning]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState]);

  if (v11)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASCustomSystemConstraintsPolicy policyInstance]( &OBJC_CLASS____DASCustomSystemConstraintsPolicy,  "policyInstance"));
    objc_msgSend( v9,  "updateSystemConstraint:withState:withDaemon:",  kDASSystemContextKeyHeavyDiskUsage,  objc_msgSend(v11, "BOOLValue"),  0);
LABEL_5:

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon tasksNoLongerEligible](self, "tasksNoLongerEligible"));
    -[_DASDaemon suspendActivities:](self, "suspendActivities:", v10);

    goto LABEL_6;
  }

  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFastPassPolicy policyInstance](&OBJC_CLASS____DASFastPassPolicy, "policyInstance"));
    objc_msgSend(v9, "updateFastPassShallYield:", objc_msgSend(v6, "BOOLValue"));
    goto LABEL_5;
  }

- (void)addPrerunningActivity:(id)a3 toGroupWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToPendingTasks,  "objectForKeyedSubscript:",  v7));
  [v9 removeObject:v6];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToPrerunningTasks,  "objectForKeyedSubscript:",  v7));
  if (!v10)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    groupToPrerunningTasks = self->_groupToPrerunningTasks;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( groupToPrerunningTasks,  "setObject:forKeyedSubscript:",  v10,  v12);
  }

  objc_msgSend(v10, "_DAS_addOrReplaceObject:", v6);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle(activityGroup)"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2048;
    id v19 = [v10 count];
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "With %@ ...Tasks pre-running in group [%@] are %ld!",  (uint8_t *)&v14,  0x20u);
  }

  os_unfair_lock_unlock(p_groupLock);
}

- (void)addRunningActivity:(id)a3 toGroupWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToPrerunningTasks,  "objectForKeyedSubscript:",  v7));
  [v9 removeObject:v6];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToPendingTasks,  "objectForKeyedSubscript:",  v7));
  [v10 removeObject:v6];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToRunningTasks,  "objectForKeyedSubscript:",  v7));
  if (!v11)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    groupToRunningTasks = self->_groupToRunningTasks;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 groupName]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](groupToRunningTasks, "setObject:forKeyedSubscript:", v11, v13);
  }

  objc_msgSend(v11, "_DAS_addOrReplaceObject:", v6);
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle(activityGroup)"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2048;
    id v20 = [v11 count];
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "With %@ ...Tasks running in group [%@] are %ld!",  (uint8_t *)&v15,  0x20u);
  }

  os_unfair_lock_unlock(p_groupLock);
}

- (void)addPendingActivity:(id)a3 toGroupWithName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_groupLock);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_groupToPendingTasks,  "objectForKeyedSubscript:",  v6));
  if (!v7)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_groupToPendingTasks,  "setObject:forKeyedSubscript:",  v7,  v6);
  }

  objc_msgSend(v7, "_DAS_addOrReplaceObject:", v8);
  os_unfair_lock_unlock(&self->_groupLock);
}

- (void)addPendingActivitiesToGroups:(id)a3
{
  p_groupLock = &self->_groupLock;
  id v5 = a3;
  os_unfair_lock_lock(p_groupLock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10008A484;
  v6[3] = &unk_100116D08;
  void v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];

  os_unfair_lock_unlock(p_groupLock);
}

- (void)createActivityGroup:(id)a3
{
  id v10 = a3;
  os_unfair_lock_lock(&self->_groupLock);
  groups = self->_groups;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](groups, "objectForKeyedSubscript:", v5));

  if (!v6 || (id v7 = [v6 maxConcurrent], v7 != objc_msgSend(v10, "maxConcurrent")))
  {
    id v8 = self->_groups;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 name]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, v9);

    -[_DASDataStore saveGroup:](self->_store, "saveGroup:", v10);
  }

  os_unfair_lock_unlock(&self->_groupLock);
}

- (void)submitActivity:(id)a3 inGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2048;
    id v15 = [v7 maxConcurrent];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Submit activity: %@ in group: %@ with capacity: %ld",  (uint8_t *)&v10,  0x20u);
  }

  -[_DASDaemon submitActivity:inGroup:withHandler:]( self,  "submitActivity:inGroup:withHandler:",  v6,  v7,  &stru_100117010);
}

- (void)submitActivity:(id)a3 inGroup:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void, void *))a5;
  dispatch_queue_attr_t v106 = (void *)os_transaction_create("com.apple.dasd.submitActivity");
  v107 = v9;
  if (!-[_DASDaemon validateConfigurationForActivity:](self, "validateConfigurationForActivity:", v8))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  _DASActivitySchedulerErrorDomain,  3LL,  &off_1001224C0));
    v10[2](v10, 0LL, v20);

    goto LABEL_93;
  }

  if (v9)
  {
    -[_DASDaemon createActivityGroup:](self, "createActivityGroup:", v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    [v8 setGroupName:v11];
  }

  if ([v8 triggersRestart] && objc_msgSend(v8, "isSoftwareUpdateActivity"))
  {
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 startAfter]);
    id v13 = [v12 dateByAddingTimeInterval:(double)arc4random_uniform(0xE10u) + -900.0];
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v8 setStartAfter:v14];
  }

  if (!-[_DASRuntimeLimiter featureHasNoRemainingRuntimeForActivity:]( self->_runtimeLimiter,  "featureHasNoRemainingRuntimeForActivity:",  v8))
  {
    uint64_t v21 = self;
    objc_sync_enter(v21);
    context = objc_autoreleasePoolPush();
    -[_DASActivityRateLimitManager submitActivity:](v21->_rateLimiter, "submitActivity:", v8);
    [v8 interval];
    if (v22 <= 0.0)
    {
      if (+[_DASConfig isInternalBuild](&OBJC_CLASS____DASConfig, "isInternalBuild"))
      {
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
LABEL_19:
          __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v8 debugDescription]);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Submitted: %@", buf, 0xCu);
        }
      }

      else
      {
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 schedulingPriority]));
          int v31 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue([v8 startAfter]);
          double v32 = (void *)objc_claimAutoreleasedReturnValue([v8 startBefore]);
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 2114;
          uint64_t v123 = v31;
          *(_WORD *)id v124 = 2114;
          *(void *)&v124[2] = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Submitted: %{public}@ at priority %{public}@ (%{public}@ - %{public}@)",  buf,  0x2Au);
        }
      }
    }

    else
    {
      if (+[_DASConfig isInternalBuild](&OBJC_CLASS____DASConfig, "isInternalBuild"))
      {
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        goto LABEL_19;
      }

      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 schedulingPriority]));
        [v8 interval];
        unsigned int v27 = v26;
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v8 startAfter]);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v8 startBefore]);
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v123 = v27;
        *(_WORD *)id v124 = 2114;
        *(void *)&v124[2] = v28;
        *(_WORD *)&v124[10] = 2114;
        *(void *)&v124[12] = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Submitted: %{public}@ at priority %{public}@ with interval %.0f (%{public}@ - %{public}@)",  buf,  0x34u);
      }
    }

- (void)setMinimumBackgroundFetchInterval:(double)a3 forApp:(id)a4
{
}

- (void)endLaunchWithReason:(id)a3 forApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008BBD0;
    block[3] = &unk_100115120;
    __int16 v12 = (os_log_s *)v7;
    id v13 = v6;
    __int16 v14 = self;
    dispatch_async(evaluationQueue, block);

    int v10 = v12;
  }

  else
  {
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "endLaunchWithReason: launchReason or appName is null",  buf,  2u);
    }
  }
}

- (void)backgroundAppRefreshEnabledForApp:(id)a3 withHandler:(id)a4
{
  barScheduler = self->_barScheduler;
  int v10 = (void (**)(id, id, BOOL))a4;
  id v7 = a3;
  BOOL v8 = -[_DASBARScheduler backgroundAppRefreshEnabled](barScheduler, "backgroundAppRefreshEnabled");
  BOOL v9 = -[_DASBARScheduler backgroundAppRefreshEnabledForApp:]( self->_barScheduler,  "backgroundAppRefreshEnabledForApp:",  v7);

  v10[2](v10, (id)v8, v9);
}

- (void)disableAppRefreshForApps:(id)a3
{
  barScheduler = self->_barScheduler;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", a3));
  -[_DASBARScheduler disableAppRefreshForApps:](barScheduler, "disableAppRefreshForApps:", v4);
}

- (BOOL)canSubmitValidatedTaskRequest:(id)a3 withError:(id *)a4
{
  id v6 = (_DASDaemon *)a3;
  if ((-[_DASDaemon isContinuedProcessingTask](v6, "isContinuedProcessingTask") & 1) != 0)
  {
    char v7 = 1;
    goto LABEL_77;
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon relatedApplications](v6, "relatedApplications"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

  if ((-[_DASDaemon isContactTracingBackgroundActivity](v6, "isContactTracingBackgroundActivity") & 1) == 0
    && !-[_DASBARScheduler backgroundLaunchAllowedForApp:](self->_barScheduler, "backgroundLaunchAllowedForApp:", v9))
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon launchReason](v6, "launchReason"));
    unsigned __int8 v11 = [v10 isEqualToString:_DASLaunchReasonHealthResearch];

    if ((v11 & 1) == 0)
    {
      if (a4)
      {
        uint64_t v16 = _DASActivitySchedulerErrorDomain;
        uint64_t v17 = 0LL;
        goto LABEL_64;
      }

- (void)cancelAllTaskRequestsForApplication:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_applicationLaunchRequests,  "objectForKeyedSubscript:",  v4));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  os_unfair_recursive_lock_unlock(&self->_applicationLaunchRequestsLock);
  -[_DASDaemon cancelActivities:](self, "cancelActivities:", v5);
}

- (void)cancelTaskRequestWithIdentifier:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0LL);
  id v19 = v7;
  id v20 = self;
  int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_applicationLaunchRequests,  "objectForKeyedSubscript:",  v7));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if ([v15 isBackgroundTaskActivity])
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 clientProvidedIdentifier]);
          unsigned int v17 = [v16 isEqualToString:v6];

          if (v17) {
            [v8 addObject:v15];
          }
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v12);
  }

  os_unfair_recursive_lock_unlock(p_applicationLaunchRequestsLock);
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = v6;
    __int16 v27 = 2112;
    uint64_t v28 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Canceling task request %{public}@ for %@",  buf,  0x16u);
  }

  -[_DASDaemon cancelActivities:](v20, "cancelActivities:", v8);
}

- (void)getPendingTaskRequestsForApplication:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  os_unfair_recursive_lock_lock_with_options(&self->_applicationLaunchRequestsLock, 0LL);
  uint64_t v16 = v6;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_applicationLaunchRequests,  "objectForKeyedSubscript:",  v6));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        __int128 v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        if ([v14 isBackgroundTaskActivity]
          && (-[NSMutableSet containsObject:](self->_runningTasks, "containsObject:", v14) & 1) == 0)
        {
          [v8 addObject:v14];
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }

  os_unfair_recursive_lock_unlock(&self->_applicationLaunchRequestsLock);
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  id v15 = [v8 copy];
  v7[2](v7, v15);
}

- (void)scheduleConnectionTimeoutForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7E84(v3, v5, v6, v7, v8, v9, v10, v11);
  }

  dispatch_time_t v12 = dispatch_time(0LL, 10000000000LL);
  activityLaunchQueue = (dispatch_queue_s *)self->_activityLaunchQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10008CC78;
  v14[3] = &unk_100117060;
  int v15 = v3;
  v14[4] = self;
  dispatch_after(v12, activityLaunchQueue, v14);
}

- (void)establishConnectionFromClient:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v29 = (void (**)(void))a4;
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
    *(_DWORD *)buf = 138412546;
    id v36 = v6;
    __int16 v37 = 1024;
    LODWORD(v38) = [v8 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Establishing connection from client %@ with pid %d",  buf,  0x12u);
  }

  uint64_t v9 = self->_connectedBGTaskClients;
  objc_sync_enter(v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
  id v11 = [v10 processIdentifier];

  dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon connectedBGTaskClients](self, "connectedBGTaskClients"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
  [v12 setObject:v6 forKeyedSubscript:v13];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon activitiesWaitingForBGTaskClients](self, "activitiesWaitingForBGTaskClients"));
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v15]);

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon activitiesWaitingForBGTaskClients](self, "activitiesWaitingForBGTaskClients"));
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
  [v17 removeObjectForKey:v18];

  objc_sync_exit(v9);
  if ([v16 count])
  {
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"bar"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v16;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Delivering pending activities %@ to client %@",  buf,  0x16u);
    }

    [v6 handleLaunchFromDaemonForActivities:v16];
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v20 = v16;
    __int128 v21 = 0LL;
    id v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          __int128 v25 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 suspendRequestDate]);
          BOOL v27 = v26 == 0LL;

          if (!v27)
          {
            if (!v21) {
              __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
            }
            [v21 addObject:v25];
          }
        }

        id v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }

      while (v22);
    }

    if ([v21 count])
    {
      id v28 = [v21 copy];
      [v6 willExpireBGTaskActivities:v28];
    }
  }

  v29[2]();
}

- (void)updateCompletionStatus:(BOOL)a3 forOngoingTask:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = (NSProgress *)objc_claimAutoreleasedReturnValue([v5 progress]);
  if (!v6) {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSProgress);
  }
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"ActivityProgress"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v8) {
      sub_1000B7FC4();
    }

    if (-[NSProgress completedUnitCount](v6, "completedUnitCount") < 1) {
      uint64_t v9 = 1LL;
    }
    else {
      uint64_t v9 = -[NSProgress completedUnitCount](v6, "completedUnitCount");
    }
    -[NSProgress setCompletedUnitCount:](v6, "setCompletedUnitCount:", v9);
    -[NSProgress setTotalUnitCount:]( v6,  "setTotalUnitCount:",  -[NSProgress completedUnitCount](v6, "completedUnitCount"));
  }

  else
  {
    if (v8) {
      sub_1000B8024();
    }

    -[NSProgress cancel](v6, "cancel");
  }

  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"ActivityProgress"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"incomplete";
    int v12 = 138412802;
    if (v4) {
      id v11 = @"completed";
    }
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    int v15 = v6;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Finishing progress (%@) to %@ for %@",  (uint8_t *)&v12,  0x20u);
  }

  [v5 setProgress:v6];
}

- (void)updateOngoingTask:(id)a3 completionHandler:(id)a4
{
}

- (void)updateProgressForOngoingTask:(id)a3 completionHandler:(id)a4
{
}

- (void)submittedActivitiesWithHandler:(id)a3
{
  p_activityStateLock = &self->_activityStateLock;
  id v5 = (void (**)(id, void *))a3;
  os_unfair_recursive_lock_lock_with_options(p_activityStateLock, 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_pendingTasks, "allObjects"));
  id v8 = [v6 mutableCopy];

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  [v8 sortUsingComparator:&stru_1001170A0];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v8));
  v5[2](v5, v7);
}

- (void)delayedRunningActivitiesWithHandler:(id)a3
{
  p_activityStateLock = &self->_activityStateLock;
  id v5 = (void (**)(id, id))a3;
  os_unfair_recursive_lock_lock_with_options(p_activityStateLock, 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_prerunningTasks, "allObjects"));
  id v8 = [v6 mutableCopy];

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  [v8 sortUsingComparator:&stru_1001170C0];
  id v7 = [v8 copy];
  v5[2](v5, v7);
}

- (void)runningActivitiesWithHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10008D8A0;
  v7[3] = &unk_100116D30;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v5 = v8;
  -[_DASDaemon allClientsDo:](self, "allClientsDo:", v7);
  [v5 sortUsingComparator:&stru_1001170E0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));
  v4[2](v4, v6);
}

- (void)runningGroupActivitiesWithHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  p_groupLock = &self->_groupLock;
  os_unfair_lock_lock(&self->_groupLock);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_groupToRunningTasks, "allValues", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) allObjects]);
        [v5 addObjectsFromArray:v12];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  os_unfair_lock_unlock(p_groupLock);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));
  v4[2](v4, v13);
}

- (void)scoresForActivityWithName:(id)a3 withHandler:(id)a4
{
}

- (void)activityRunStatisticsWithHandler:(id)a3
{
}

- (id)activityRunStatistics
{
  return 0LL;
}

- (void)forceRunActivities:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v21 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Force Running %lu activities", buf, 0xCu);
  }

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        int v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon getActivityWithName:](self, "getActivityWithName:", v11, (void)v15));
        if (!v12)
        {
          __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v21 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Force run activities unable to find activity %@",  buf,  0xCu);
          }

          goto LABEL_15;
        }

        uint64_t v13 = v12;
        [v12 setWasForceRun:1];
        -[_DASDaemon immediatelyBeginWorkForActivity:](self, "immediatelyBeginWorkForActivity:", v13);
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)runActivitiesWithUrgency:(int64_t)a3 activities:(id)a4
{
  id v6 = a4;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)__int128 v31 = a3;
    *(_WORD *)&v31[4] = 2112;
    *(void *)&void v31[6] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "With %i urgency level, Running %@ activities",  buf,  0x12u);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v26;
    *(void *)&__int128 v10 = 138412290LL;
    __int128 v20 = v10;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon getActivityWithName:](self, "getActivityWithName:", v14, v20));
        if (v15)
        {
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[_DASUrgencyOverridePolicy policyInstance]( &OBJC_CLASS____DASUrgencyOverridePolicy,  "policyInstance"));
          [v16 addActivity:v14 urgencyLevel:a3];

          evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10008DFB0;
          block[3] = &unk_100116408;
          void block[4] = self;
          id v18 = v15;
          uint64_t v23 = v14;
          int64_t v24 = a3;
          id v22 = v18;
          dispatch_async(evaluationQueue, block);
        }

        else
        {
          __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            *(void *)__int128 v31 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "With urgency level, run activities unable to find activity %@",  buf,  0xCu);
          }
        }
      }

      id v11 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v11);
  }
}

- (void)currentPredictionsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[_DASPredictionManager currentPredictions](&OBJC_CLASS____DASPredictionManager, "currentPredictions"));
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (id)earlyToday
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 components:28 fromDate:v3]);

  [v4 setHour:3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v2 dateFromComponents:v4]);

  return v5;
}

- (id)widgetViewsStatisticsWithStore:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set"));
  id v42 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon earlyToday](self, "earlyToday"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[_DKEventQuery predicateForEventsWithStartDateAfter:]( &OBJC_CLASS____DKEventQuery,  "predicateForEventsWithStartDateAfter:"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:",  kDASWidgetViewStreamName));
  __int128 v63 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v63, 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"startDate",  0LL));
  __int128 v62 = v9;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v62, 1LL));
  double v41 = (void *)v6;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:]( &OBJC_CLASS____DKEventQuery,  "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:",  v6,  v8,  0LL,  0LL,  v10));

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  unsigned int v43 = v4;
  double v40 = (void *)v11;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 executeQuery:v11 error:0]);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
        [v5 addObject:v19];

        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 startDate]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
        [v12 setObject:v20 forKeyedSubscript:v21];
      }

      id v15 = [v13 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }

    while (v15);
  }

  uint64_t v39 = v12;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_10008E628;
  v51[3] = &unk_100117108;
  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v52 = v22;
  id v23 = v5;
  id v53 = v23;
  [v23 enumerateObjectsUsingBlock:v51];
  id v38 = v23;
  int64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allObjects]);
  id v25 = [v24 mutableCopy];

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_10008E6A0;
  v49[3] = &unk_1001158C0;
  id v26 = v22;
  id v50 = v26;
  [v25 sortUsingComparator:v49];
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v25;
  id v28 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v46;
    do
    {
      for (j = 0LL; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v46 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)j);
        v58[0] = @"name";
        v58[1] = @"count";
        v59[0] = v32;
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:"));
        [v33 doubleValue];
        id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v34)));
        v59[1] = v35;
        id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  2LL));
        [v27 addObject:v36];
      }

      id v29 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
    }

    while (v29);
  }

  return v27;
}

- (id)widgetRefreshStatisticsWithStore:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet set](&OBJC_CLASS___NSCountedSet, "set"));
  id v50 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon earlyToday](self, "earlyToday"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[_DKEventQuery predicateForEventsWithStartDateAfter:]( &OBJC_CLASS____DKEventQuery,  "predicateForEventsWithStartDateAfter:"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventStream eventStreamWithName:]( &OBJC_CLASS____DKEventStream,  "eventStreamWithName:",  kDASWidgetRefreshStreamName));
  BOOL v77 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v77, 1LL));
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"startDate",  0LL));
  id v76 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v76, 1LL));
  BOOL v49 = (void *)v7;
  uint64_t v12 = objc_claimAutoreleasedReturnValue( +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:]( &OBJC_CLASS____DKEventQuery,  "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:",  v7,  v9,  0LL,  0LL,  v11));

  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int v51 = v4;
  __int128 v48 = (void *)v12;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v4 executeQuery:v12 error:0]);
  id v13 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v69;
    uint64_t v16 = kDASWidgetMetadataDASInitiated;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v69 != v15) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)i);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
        [v5 addObject:v19];

        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v18 metadata]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v16]);
        unsigned int v22 = [v21 BOOLValue];

        if (v22)
        {
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
          [v6 addObject:v23];
        }

        int64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v18 startDate]);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v18 stringValue]);
        [v56 setObject:v24 forKeyedSubscript:v25];
      }

      id v14 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
    }

    while (v14);
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_10008ECD4;
  v63[3] = &unk_100117130;
  id v28 = v26;
  id v64 = v28;
  id v29 = v5;
  id v65 = v29;
  id v55 = v27;
  id v66 = v55;
  id v46 = v6;
  id v67 = v46;
  [v29 enumerateObjectsUsingBlock:v63];
  __int128 v47 = v29;
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 allObjects]);
  id v31 = [v30 mutableCopy];

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_10008ED8C;
  v61[3] = &unk_1001158C0;
  id v32 = v28;
  id v62 = v32;
  [v31 sortUsingComparator:v61];
  id v54 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v52 = v31;
  id v33 = [v52 countByEnumeratingWithState:&v57 objects:v74 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v58;
    do
    {
      for (j = 0LL; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v58 != v35) {
          objc_enumerationMutation(v52);
        }
        uint64_t v37 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)j);
        v73[0] = v37;
        v72[0] = @"name";
        v72[1] = @"count";
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:v37]);
        [v38 doubleValue];
        double v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v39)));
        v73[1] = v40;
        v72[2] = @"dasRefreshes";
        double v41 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKeyedSubscript:v37]);
        [v41 doubleValue];
        unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", round(v42)));
        v73[2] = v43;
        __int128 v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v73,  v72,  3LL));
        [v54 addObject:v44];
      }

      id v34 = [v52 countByEnumeratingWithState:&v57 objects:v74 count:16];
    }

    while (v34);
  }

  return v54;
}

- (void)statisticsWithHandler:(id)a3
{
  v16[0] = @"widgetViews";
  v14[0] = @"name";
  v14[1] = @"data";
  v15[0] = @"Widget Views";
  id v4 = (void (**)(id, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPredictionManager sharedKnowledgeStore]( &OBJC_CLASS____DASPredictionManager,  "sharedKnowledgeStore"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon widgetViewsStatisticsWithStore:](self, "widgetViewsStatisticsWithStore:", v5));
  v15[1] = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
  v16[1] = @"widgetRefreshes";
  v17[0] = v7;
  v12[1] = @"data";
  v13[0] = @"Widget Refreshes";
  v12[0] = @"name";
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPredictionManager sharedKnowledgeStore]( &OBJC_CLASS____DASPredictionManager,  "sharedKnowledgeStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon widgetRefreshStatisticsWithStore:](self, "widgetRefreshStatisticsWithStore:", v8));
  v13[1] = v9;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
  v17[1] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));

  v4[2](v4, v11);
}

- (void)allBudgetsWithHandler:(id)a3
{
  budgetManager = self->_budgetManager;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[_DASBudgetManager allBudgets](budgetManager, "allBudgets"));
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)balanceForBudgetWithName:(id)a3 withHandler:(id)a4
{
  budgetManager = self->_budgetManager;
  id v7 = a4;
  -[_DASBudgetManager balanceForBudgetWithName:](budgetManager, "balanceForBudgetWithName:", a3);
  (*((void (**)(id))a4 + 2))(v7);
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
}

- (void)policiesWithHandler:(id)a3
{
  id v18 = (void (**)(id, id))a3;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](&OBJC_CLASS____DASPolicyManager, "allPoliciesForPlatform"));
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 policyName]);
        unint64_t v10 = +[_DASPolicyManager bitmaskForPolicy:](&OBJC_CLASS____DASPolicyManager, "bitmaskForPolicy:", v9);

        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 policyName]);
        [v11 setValue:v12 forKey:@"policyName"];

        id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 policyDescription]);
        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 policyDescription]);
          [v11 setValue:v14 forKey:@"policyDescription"];
        }

        else
        {
          [v11 setValue:&stru_100118C98 forKey:@"policyDescription"];
        }

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v10));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
        [v3 setValue:v11 forKey:v16];
      }

      id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v5);
  }

  id v17 = [v3 copy];
  v18[2](v18, v17);
}

- (void)clasStatusWithHandler:(id)a3
{
  controlEngine = self->_controlEngine;
  id v4 = (void (**)(id, id))a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[_DASControlEngine status](controlEngine, "status"));
  id v5 = [v6 copy];
  v4[2](v4, v5);
}

- (id)evaluatePolicies:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v70 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pendingTasks](self, "pendingTasks"));
  id v8 = [v7 countByEnumeratingWithState:&v86 objects:v95 count:16];
  id obj = p_activityStateLock;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v87;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v87 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
        unsigned int v14 = [v4 isEqualToString:v13];

        if (v14)
        {
          id v15 = v12;
          unsigned int v68 = 1;
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v86 objects:v95 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  unsigned int v68 = 0;
  id v15 = 0LL;
LABEL_11:

  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon prerunningTasks](v70, "prerunningTasks"));
  id v17 = [v16 countByEnumeratingWithState:&v82 objects:v94 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v83;
    while (2)
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v83 != v19) {
          objc_enumerationMutation(v16);
        }
        __int128 v21 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)j);
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
        unsigned int v23 = [v4 isEqualToString:v22];

        if (v23)
        {
          id v24 = v21;

          unsigned int v67 = 1;
          id v15 = v24;
          goto LABEL_21;
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v82 objects:v94 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  unsigned int v67 = 0;
LABEL_21:

  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon runningTasks](v70, "runningTasks"));
  id v26 = [v25 countByEnumeratingWithState:&v78 objects:v93 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v79;
    while (2)
    {
      for (k = 0LL; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v79 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)k);
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 name]);
        unsigned int v32 = [v4 isEqualToString:v31];

        if (v32)
        {
          id v34 = v30;

          int v33 = 1;
          id v15 = v34;
          goto LABEL_31;
        }
      }

      id v27 = [v25 countByEnumeratingWithState:&v78 objects:v93 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }

  int v33 = 0;
LABEL_31:

  os_unfair_recursive_lock_unlock(obj);
  if (v15)
  {
    id v66 = v5;
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v92 = v4;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Evaluating policies for %@", buf, 0xCu);
    }

    unsigned int v65 = v33;

    id v36 = &AnalyticsSendEventLazy_ptr;
    __int128 v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    id obja = (id)objc_claimAutoreleasedReturnValue( +[_DASPolicyManager allPoliciesForPlatform]( &OBJC_CLASS____DASPolicyManager,  "allPoliciesForPlatform"));
    id v37 = [obja countByEnumeratingWithState:&v74 objects:v90 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v75;
      do
      {
        double v40 = 0LL;
        id v71 = v38;
        do
        {
          if (*(void *)v75 != v39) {
            objc_enumerationMutation(obja);
          }
          double v41 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)v40);
          double v42 = objc_autoreleasePoolPush();
          unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue([v36[84] dictionary]);
          if ([v41 appliesToActivity:v15])
          {
            [v41 weightForActivity:v15];
            double v45 = v44;
            id v46 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon context](v70, "context"));
            id v47 = v15;
            __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v41 responseForActivity:v15 withState:v46]);

            BOOL v49 = (void *)objc_claimAutoreleasedReturnValue([v48 rationale]);
            id v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v45));
            [v43 setValue:v50 forKey:@"weightForActivity"];

            [v48 score];
            int v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
            [v43 setValue:v51 forKey:@"score"];

            id v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v48 policyDecision]));
            [v43 setValue:v52 forKey:@"policyDecision"];

            [v48 validityDuration];
            id v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
            [v43 setValue:v53 forKey:@"validityDuration"];

            id v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v49 responseOptions]));
            [v43 setValue:v54 forKey:@"rationaleResponseOptions"];

            if ((objc_opt_respondsToSelector(v41, "blockReasons:") & 1) != 0)
            {
              id v55 = (void *)objc_claimAutoreleasedReturnValue([v41 blockReasons:v48]);
              [v43 setValue:v55 forKey:@"blockReasons"];
            }

            __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v49 description]);
            [v43 setValue:v56 forKey:@"rationaleDescription"];

            __int128 v57 = (void *)objc_claimAutoreleasedReturnValue([v41 policyName]);
            [v69 setValue:v43 forKey:v57];

            id v36 = &AnalyticsSendEventLazy_ptr;
            id v15 = v47;
            id v38 = v71;
          }

          objc_autoreleasePoolPop(v42);
          double v40 = (char *)v40 + 1;
        }

        while (v38 != v40);
        id v38 = [obja countByEnumeratingWithState:&v74 objects:v90 count:16];
      }

      while (v38);
    }

    __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v68));
    unsigned int v59 = [v58 unsignedIntValue];
    __int128 v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v67));
    unsigned int v61 = v59 | (2 * [v60 unsignedIntValue]);
    id v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v65));
    __int128 v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  v61 | (4 * [v62 unsignedIntValue])));

    id v5 = v66;
    [v66 setValue:v63 forKey:@"taskStatus"];
    [v66 setValue:v69 forKey:@"policyEvaluations"];
  }

  return v5;
}

- (void)evaluatePolicies:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_100084B3C;
  id v18 = sub_100084B4C;
  id v19 = 0LL;
  evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008FB90;
  block[3] = &unk_1001154E8;
  id v13 = &v14;
  void block[4] = self;
  id v9 = v6;
  id v12 = v9;
  dispatch_sync(evaluationQueue, block);
  id v10 = [(id)v15[5] copy];
  v7[2](v7, v10);

  _Block_object_dispose(&v14, 8);
}

- (void)evaluateAllActivities:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 1;
  evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008FCC0;
  block[3] = &unk_100117158;
  void block[4] = self;
  id v12 = &v13;
  id v9 = v6;
  id v11 = v9;
  dispatch_sync(evaluationQueue, block);
  v7[2](v7, *((unsigned __int8 *)v14 + 24));

  _Block_object_dispose(&v13, 8);
}

- (BOOL)evaluateAllActivitiesFor:(id)a3 writingToFile:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10008FE4C;
  v7[3] = &unk_100117180;
  void v7[4] = self;
  id v8 = a4;
  id v5 = v8;
  LOBYTE(a3) = [a3 enumerateObjectsInChunksOfSize:5 block:v7];

  return (char)a3;
}

- (BOOL)evaluatePoliciesForActivitiesChunk:(id)a3 writingToFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
        char v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon evaluatePolicies:](self, "evaluatePolicies:", v15));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 name]);
        [v8 setValue:v16 forKey:v17];
      }

      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v11);
  }

  id v27 = 0LL;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v8,  0LL,  &v27));
  id v19 = v27;
  if (v19)
  {
    __int128 v20 = v19;
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000B814C();
    }
LABEL_16:

    BOOL v24 = 0;
    goto LABEL_17;
  }

  id v26 = 0LL;
  unsigned int v22 = [v7 writeData:v18 error:&v26];
  id v23 = v26;
  __int128 v20 = v23;
  if (!v22 || v23)
  {
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000B80E8();
    }
    goto LABEL_16;
  }

  BOOL v24 = 1;
LABEL_17:

  return v24;
}

- (void)runProceedableActivities:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v26 = (void (**)(id, void *))a4;
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v27 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
  id v38 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"activities"]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
  id v36 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"overrides"]);

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = v5;
  id v32 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v32)
  {
    uint64_t v29 = *(void *)v51;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v51 != v29)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }

        uint64_t v33 = v8;
        uint64_t v10 = *(void *)(*((void *)&v50 + 1) + 8 * v8);
        id v37 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
        uint64_t v44 = 0LL;
        double v45 = &v44;
        uint64_t v46 = 0x3032000000LL;
        id v47 = sub_100084B3C;
        __int128 v48 = sub_100084B4C;
        id v49 = 0LL;
        evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000906F0;
        block[3] = &unk_1001154E8;
        void block[5] = v10;
        void block[6] = &v44;
        void block[4] = self;
        dispatch_sync(evaluationQueue, block);
        id v34 = (void *)objc_claimAutoreleasedReturnValue([(id)v45[5] objectForKey:@"taskStatus"]);
        unsigned __int8 v12 = [v34 unsignedIntegerValue];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v13 setObject:v37 forKeyedSubscript:@"blockingPolicies"];
        [v13 setObject:&__kCFBooleanFalse forKeyedSubscript:@"foundActivity"];
        uint64_t v35 = v13;
        if ([(id)v45[5] count] && (v12 & 1) != 0)
        {
          [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:@"foundActivity"];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([(id)v45[5] objectForKeyedSubscript:@"policyEvaluations"]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
          char v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"]);

          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          id v17 = v16;
          id v18 = [v17 countByEnumeratingWithState:&v39 objects:v56 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v40;
            do
            {
              for (i = 0LL; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v40 != v19) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
                unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v21]);
                id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"policyDecision"]);
                id v24 = [v23 longValue];

                if ((![v38 containsObject:v10]
                   || ([v36 containsObject:v21] & 1) == 0)
                  && (v24 == (id)100 || v24 == (id)33))
                {
                  -[NSMutableArray addObject:](v37, "addObject:", v21);
                }
              }

              id v18 = [v17 countByEnumeratingWithState:&v39 objects:v56 count:16];
            }

            while (v18);
          }

          if (!-[NSMutableArray count](v37, "count"))
          {
            id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v55 = v10;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%@ is a proceedable activity!",  buf,  0xCu);
            }

            -[NSMutableArray addObject:](v27, "addObject:", v10);
          }
        }

        [v30 setObject:v35 forKeyedSubscript:v10];

        _Block_object_dispose(&v44, 8);
        uint64_t v8 = v33 + 1;
      }

      while ((id)(v33 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
    }

    while (v32);
  }

  -[_DASDaemon forceRunActivities:](self, "forceRunActivities:", v27);
  v26[2](v26, v30);
}

- (void)activityContainsOverrides:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[_DASPlistParser sharedInstance](&OBJC_CLASS____DASPlistParser, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 loadOverrides]);
  (*((void (**)(id, void *))a4 + 2))(v5, v6);
}

- (void)blockingPoliciesWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v37 = a4;
  id v38 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"activity"]);
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v40 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_pendingTasks, "allObjects"));
  id v8 = [v7 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v53;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
        unsigned int v14 = [v13 isEqualToString:v38];

        if (v14)
        {
          id v15 = v12;
          goto LABEL_11;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v15 = 0LL;
LABEL_11:

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"activityClasses"]);
  id v16 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v49;
    uint64_t v39 = *(void *)v49;
    do
    {
      uint64_t v19 = 0LL;
      id v41 = v17;
      do
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(obj);
        }
        if ([*(id *)(*((void *)&v48 + 1) + 8 * (void)v19) isEqualToString:@"icpl"])
        {
          unsigned int v43 = v19;
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          __int128 v47 = 0u;
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v40->_pendingTasks, "allObjects"));
          id v22 = [v21 countByEnumeratingWithState:&v44 objects:v58 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v45;
            do
            {
              for (j = 0LL; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v45 != v24) {
                  objc_enumerationMutation(v21);
                }
                id v26 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)j);
                if (+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v26))
                {
                  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lastScored]);
                  if (v27)
                  {
                    [v20 timeIntervalSinceDate:v27];
                    if (v28 < 0.0)
                    {
                      id v29 = v27;

                      id v30 = v26;
                      __int128 v20 = v29;
                      id v15 = v30;
                    }
                  }
                }
              }

              id v23 = [v21 countByEnumeratingWithState:&v44 objects:v58 count:16];
            }

            while (v23);
          }

          uint64_t v18 = v39;
          id v17 = v41;
          uint64_t v19 = v43;
        }

        uint64_t v19 = (char *)v19 + 1;
      }

      while (v19 != v17);
      id v17 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    }

    while (v17);
  }

  os_unfair_recursive_lock_unlock(p_activityStateLock);
  if (v15)
  {
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[_DASConditionScore lastDenialResponses:]( &OBJC_CLASS____DASConditionScore,  "lastDenialResponses:",  v15));
    id v32 = v37;
    (*((void (**)(id, void *))v37 + 2))(v37, v31);

    uint64_t v33 = v6;
  }

  else
  {
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    id v32 = v37;
    uint64_t v33 = v6;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
      *(_DWORD *)buf = 138412290;
      __int128 v57 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "No blocked activity was found for %@",  buf,  0xCu);
    }

    (*((void (**)(id, void *))v37 + 2))(v37, &__NSArray0__struct);
  }
}

- (void)updateOnlyPreemptiveSuspend:(BOOL)a3
{
}

- (void)resetOnlyPreemptiveSuspend
{
}

- (void)enterTestModeWithParameters:(id)a3 reset:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      LOWORD(v13) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Resetting test mode parameters",  (uint8_t *)&v13,  2u);
    }

    -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", 0LL, @"testModeParameters");
    -[_DASDaemon setTestModeParameters:](self, "setTestModeParameters:", 0LL);
  }

  else
  {
    if (v11)
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Entering test mode with parameters: %@",  (uint8_t *)&v13,  0xCu);
    }

    -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", v8, @"testModeParameters");
    -[_DASDaemon setTestModeParameters:](self, "setTestModeParameters:", v8);
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", v12, @"testModeLastUpdated");
  }

  v9[2](v9, 1LL);
}

- (void)enableTaskRegistryMode:(BOOL)a3 processes:(id)a4 handler:(id)a5
{
  BOOL v6 = a3;
  id v8 = (NSSet *)a4;
  id v9 = (void (**)(id, uint64_t))a5;
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 67109120;
    LODWORD(v16) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Setting task registry mode to: %i",  (uint8_t *)&v15,  8u);
  }

  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Setting processes to: %@",  (uint8_t *)&v15,  0xCu);
  }

  self->_BOOL taskRegistryMode = v6;
  taskRegistryProcesses = self->_taskRegistryProcesses;
  self->_taskRegistryProcesses = v8;
  int v13 = v8;

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v13, "allObjects"));
  -[NSUserDefaults setBool:forKey:](self->_testingDefaults, "setBool:forKey:", v6, @"taskRegistryMode");
  -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", v14, @"taskRegistryProcesses");

  v9[2](v9, 1LL);
}

- (void)submitRateLimitConfiguration:(id)a3 handler:(id)a4
{
  id v7 = (void (**)(id, uint64_t))a4;
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRateLimitManager sharedLimiter]( &OBJC_CLASS____DASActivityRateLimitManager,  "sharedLimiter"));
  [v6 submitRateLimitConfiguration:v5];

  v7[2](v7, 1LL);
}

- (void)pauseWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Pausing scheduling with parameters: %@",  (uint8_t *)&v13,  0xCu);
  }

  if ([v6 count])
  {
    id v9 = [v6 mutableCopy];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  86400.0));
    [v10 timeIntervalSinceReferenceDate];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v9 setObject:v11 forKeyedSubscript:@"validUntil"];

    -[NSUserDefaults setObject:forKey:](self->_testingDefaults, "setObject:forKey:", v9, @"pausedParameters");
    -[_DASDaemon setPausedParameters:](self, "setPausedParameters:", v9);
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon tasksNoLongerEligible](self, "tasksNoLongerEligible"));
    -[_DASDaemon suspendActivities:](self, "suspendActivities:", v12);
  }

  else
  {
    -[NSUserDefaults removeObjectForKey:](self->_testingDefaults, "removeObjectForKey:", @"pausedParameters");
    -[_DASDaemon setPausedParameters:](self, "setPausedParameters:", 0LL);
  }

  v7[2](v7, 1LL);
}

- (void)addPauseExceptParameter:(id)a3 handler:(id)a4
{
  id v6 = (void (**)(id, uint64_t))a4;
  if (a3)
  {
    testingDefaults = self->_testingDefaults;
    id v8 = a3;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](testingDefaults, "objectForKey:", @"pausedParameters"));
    uint64_t v10 = v9;
    if (v9) {
      id v11 = [v9 mutableCopy];
    }
    else {
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    unsigned __int8 v12 = v11;
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"exceptTypes"]);
    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"exceptTypes"]);
      id v15 = [v14 mutableCopy];
    }

    else
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    }

    [v15 addObject:v8];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v15));
    [v12 setObject:v16 forKeyedSubscript:@"exceptTypes"];

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v12));
    -[_DASDaemon setPausedParameters:](self, "setPausedParameters:", v17);

    uint64_t v18 = self->_testingDefaults;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
    -[NSUserDefaults setObject:forKey:](v18, "setObject:forKey:", v19, @"pausedParameters");

    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon pausedParameters](self, "pausedParameters"));
      int v22 = 138412290;
      id v23 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Adding pause parameter: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  v6[2](v6, 1LL);
}

- (void)deleteLimitForActivity:(id)a3 forLimiterWithName:(id)a4 handler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRuntimeLimiter limitationName](self->_runtimeLimiter, "limitationName"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
  unsigned __int8 v12 = [v11 isEqualToString:v8];

  if ((v12 & 1) != 0)
  {
    p_runtimeLimiter = (id *)&self->_runtimeLimiter;
LABEL_5:
    v9[2](v9, [*p_runtimeLimiter deleteLimitForActivity:v17]);
    goto LABEL_6;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASConfigurationLimiter limitationName](self->_configurationLimiter, "limitationName"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lowercaseString]);
  unsigned int v16 = [v15 isEqualToString:v8];

  if (v16)
  {
    p_runtimeLimiter = (id *)&self->_configurationLimiter;
    goto LABEL_5;
  }

- (void)updateLimit:(double)a3 forActivity:(id)a4 forLimiterWithName:(id)a5 handler:(id)a6
{
  id v21 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, id))a6;
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASRuntimeLimiter limitationName](self->_runtimeLimiter, "limitationName"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lowercaseString]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
  unsigned int v15 = [v13 isEqualToString:v14];

  if (v15)
  {
    id v16 = (id)-[_DASRuntimeLimiter setLimit:forActivity:](self->_runtimeLimiter, "setLimit:forActivity:", v21, a3);
LABEL_5:
    v11[2](v11, v16);
    goto LABEL_6;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[_DASConfigurationLimiter limitationName](self->_configurationLimiter, "limitationName"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 lowercaseString]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
  unsigned int v20 = [v18 isEqualToString:v19];

  if (v20)
  {
    id v16 = -[_DASConfigurationLimiter setLimitForActivity:](self->_configurationLimiter, "setLimitForActivity:", v21);
    goto LABEL_5;
  }

- (void)getLimiterResponseForActivity:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[_DASDaemon allTasks](self, "allTasks"));
  id v9 = [v8 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v41 != v11) {
        objc_enumerationMutation(v8);
      }
      int v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
      unsigned __int8 v15 = [v6 isEqualToString:v14];

      if ((v15 & 1) != 0) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v40 objects:v47 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v13 limitationResponse]);

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if (!v19)
    {
      id v16 = 0LL;
      goto LABEL_22;
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v18 = v19;
    id v20 = [v18 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v20)
    {
      id v21 = v20;
      id v34 = v6;
      id obj = v18;
      id v32 = v8;
      uint64_t v33 = v7;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionary]( &OBJC_CLASS___NSMutableDictionary,  "dictionary",  v32,  v33,  v34));
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v24 decision]));
          [v24 validityDuration];
          id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          [v25 setObject:v26 forKey:@"decision"];
          double v28 = (void *)objc_claimAutoreleasedReturnValue([v24 rationale]);
          [v25 setObject:v28 forKey:@"rationale"];

          id v29 = (void *)objc_claimAutoreleasedReturnValue([v24 limiterName]);
          [v25 setObject:v29 forKey:@"limiterName"];

          [v25 setObject:v27 forKey:@"validityDuration"];
          [v17 addObject:v25];
        }

        id v21 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      }

      while (v21);
      id v6 = v34;
      id v18 = obj;
      id v16 = obj;
      id v8 = v32;
      id v7 = v33;
    }

    else
    {
      id v16 = v18;
    }
  }

  else
  {
LABEL_9:
    id v16 = 0LL;
    id v17 = 0LL;
    id v18 = v8;
  }

LABEL_22:
  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v45 = v17;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Limiter Response: %@", buf, 0xCu);
  }

  id v31 = [v17 copy];
  v7[2](v7, v31);
}

- (void)getRuntimeLimit:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void, double))a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[_DASDaemon allTasks](self, "allTasks"));
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  double v10 = -1.0;
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name", (void)v19));
        unsigned int v16 = [v6 isEqualToString:v15];

        if (v16)
        {
          -[_DASRuntimeLimiter maximumRuntimeForActivity:](self->_runtimeLimiter, "maximumRuntimeForActivity:", v14);
          double v10 = v17;
          goto LABEL_11;
        }
      }

      id v11 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

- (id)createTempBGSQLFile:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v3 = a3;
  id v4 = NSTemporaryDirectory();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@tempSQL_%@.BGSQL",  v5,  v6));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = [v7 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "File Path: %s", buf, 0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v9 createFileAtPath:v7 contents:v3 attributes:0];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v7, 0LL));
  return v10;
}

- (BOOL)removeTempBGSQLFile:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = objc_claimAutoreleasedReturnValue([v3 path]);
      *(_DWORD *)buf = 136315138;
      id v14 = [v5 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Removing temporary BGSQL file at %s", buf, 0xCu);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v12 = 0LL;
    unsigned __int8 v7 = [v6 removeItemAtURL:v3 error:&v12];
    id v8 = v12;

    if ((v7 & 1) == 0)
    {
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000B81B0(v8, v9);
      }
    }

    BOOL v10 = v8 == 0LL;
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)getElapsedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  BOOL v10 = (void (**)(id, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](&OBJC_CLASS____DASLatencyProjector, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v11));

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v17 computeElapsedRunTimes:v13 timeFilter:v12 filepath:v14]);
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v14);
  id v16 = [v15 copy];
  v10[2](v10, v16);
}

- (void)getEstimatedRuntimes:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  BOOL v10 = (void (**)(id, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](&OBJC_CLASS____DASLatencyProjector, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v11));

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v17 computeEstimatedRunTimes:v13 timeFilter:v12 filepath:v14]);
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v14);
  id v16 = [v15 copy];
  v10[2](v10, v16);
}

- (void)getConditionsPenalties:(id)a3 handler:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](&OBJC_CLASS____DASLatencyProjector, "sharedInstance"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v9 getConditionsPenalties:v6]);

  id v8 = [v7 copy];
  v5[2](v5, v8);
}

- (void)getFeatureTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  BOOL v10 = (void (**)(id, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](&OBJC_CLASS____DASLatencyProjector, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v11));

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v17 getFeatureTimelines:v13 timeFilter:v12 filepath:v14]);
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v14);
  id v16 = [v15 copy];
  v10[2](v10, v16);
}

- (void)getActivityTimelines:(id)a3 timeFilter:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  BOOL v10 = (void (**)(id, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](&OBJC_CLASS____DASLatencyProjector, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v11));

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v17 getActivityTimelines:v13 timeFilter:v12 filepath:v14]);
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v14);
  id v16 = [v15 copy];
  v10[2](v10, v16);
}

- (void)getDeviceConditionTimelines:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(id, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](&OBJC_CLASS____DASLatencyProjector, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v9));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v14 getDeviceConditionTimelines:v10 filepath:v11]);
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v11);
  id v13 = [v12 copy];
  v8[2](v8, v13);
}

- (void)getInstallTimeline:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(id, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](&OBJC_CLASS____DASLatencyProjector, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v9));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v14 getInstallTimeline:v10 filepath:v11]);
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v11);
  id v13 = [v12 copy];
  v8[2](v8, v13);
}

- (void)getBuddyEvents:(id)a3 bgsqlData:(id)a4 handler:(id)a5
{
  id v8 = (void (**)(id, id))a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](&OBJC_CLASS____DASLatencyProjector, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v9));

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v14 getBuddyData:v10 filepath:v11]);
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v11);
  id v13 = [v12 copy];
  v8[2](v8, v13);
}

- (void)getEstimatedMADCompletionTimes:(id)a3 endDate:(id)a4 bgsqlData:(id)a5 handler:(id)a6
{
  id v10 = (void (**)(id, id))a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[_DASLatencyProjector sharedInstance](&OBJC_CLASS____DASLatencyProjector, "sharedInstance"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon createTempBGSQLFile:](self, "createTempBGSQLFile:", v11));

  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v17 computeEstimatedMADCompletionTimes:v13 endDate:v12 filepath:v14]);
  -[_DASDaemon removeTempBGSQLFile:](self, "removeTempBGSQLFile:", v14);
  id v16 = [v15 copy];
  v10[2](v10, v16);
}

- (void)registerForNetworkPathEvaluation
{
  networkEvaluationMonitor = self->_networkEvaluationMonitor;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100092604;
  v3[3] = &unk_1001171A8;
  v3[4] = self;
  -[_DASNetworkEvaluationMonitor registerForNetworkEvaluationWithCallback:]( networkEvaluationMonitor,  "registerForNetworkEvaluationWithCallback:",  v3);
}

- (void)handleTriggersBatched:(id)a3
{
}

- (void)handleTriggers:(id)a3
{
  id v3 = a3;
  __int128 v52 = (void *)os_transaction_create("com.apple.dasd.handleTriggers");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "]);
    *(_DWORD *)buf = 138543362;
    id v89 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Attempting to suspend based on triggers: %{public}@",  buf,  0xCu);
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon tasksNoLongerEligible](self, "tasksNoLongerEligible"));
  -[_DASDaemon suspendActivities:](self, "suspendActivities:", v7);

  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  id obj = v3;
  id v55 = [obj countByEnumeratingWithState:&v84 objects:v95 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v85;
    p_applicationLaunchRequestsLock = &self->_applicationLaunchRequestsLock;
    uint64_t v8 = _DASLaunchReasonNSURLSessionComplete;
    uint64_t v71 = _DASLaunchReasonWatchConnectivityPendingData;
    uint64_t v70 = _DASLaunchReasonBackgroundRemoteNotification;
    do
    {
      for (i = 0LL; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v85 != v54) {
          objc_enumerationMutation(obj);
        }
        unsigned int v59 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v57, "containsObject:") & 1) == 0)
        {
          [v57 addObject:v59];
          __int128 v56 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_triggerToPolicyMap,  "objectForKeyedSubscript:",  v59));
          if ([v56 shouldIgnoreTrigger:v59 withState:self->_context])
          {
            id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v89 = v59;
              _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Ignoring trigger %{public}@, conditions are worse",  buf,  0xCu);
            }

            goto LABEL_54;
          }

          id v60 = (id)objc_claimAutoreleasedReturnValue( +[_DASApplicationPolicy focalApplicationsWithContext:]( &OBJC_CLASS____DASApplicationPolicy,  "focalApplicationsWithContext:",  self->_context));
          __int128 v82 = 0u;
          __int128 v83 = 0u;
          __int128 v80 = 0u;
          __int128 v81 = 0u;
          id v62 = (char *)[v60 countByEnumeratingWithState:&v80 objects:v94 count:16];
          if (!v62) {
            goto LABEL_36;
          }
          uint64_t v61 = *(void *)v81;
          while (2)
          {
            id v10 = 0LL;
            while (2)
            {
              if (*(void *)v81 != v61)
              {
                id v11 = v10;
                objc_enumerationMutation(v60);
                id v10 = v11;
              }

              id v64 = v10;
              id v68 = *(id *)(*((void *)&v80 + 1) + 8LL * (void)v10);
              id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
              os_unfair_recursive_lock_lock_with_options(p_applicationLaunchRequestsLock, 0LL);
              id v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_applicationLaunchRequests,  "objectForKeyedSubscript:",  v68));
              __int128 v78 = 0u;
              __int128 v79 = 0u;
              __int128 v76 = 0u;
              __int128 v77 = 0u;
              id v14 = [v13 countByEnumeratingWithState:&v76 objects:v93 count:16];
              if (v14)
              {
                uint64_t v15 = *(void *)v77;
                do
                {
                  id v16 = 0LL;
                  do
                  {
                    if (*(void *)v77 != v15) {
                      objc_enumerationMutation(v13);
                    }
                    id v17 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)v16);
                    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 launchReason]);
                    if ([v18 isEqualToString:v8])
                    {

LABEL_26:
                      [v12 addObject:v17];
                      goto LABEL_27;
                    }

                    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 launchReason]);
                    unsigned int v20 = [v19 isEqualToString:v71];

                    if (v20) {
                      goto LABEL_26;
                    }
                    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v17 launchReason]);
                    unsigned int v22 = [v21 isEqualToString:v70];

                    if (v22)
                    {
                      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                      double v24 = (void *)objc_claimAutoreleasedReturnValue([v17 startAfter]);
                      [v24 timeIntervalSinceDate:v23];
                      BOOL v26 = v25 > 0.0;

                      if (v26) {
                        [v17 setStartAfter:v23];
                      }
                    }

- (void)handleCompletedActivities:(id)a3
{
  id v4 = a3;
  uint64_t v35 = (void *)os_transaction_create("com.apple.dasd.completedActivitiesQueueHandler");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = v4;
  id v38 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v44 != v37) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v7 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        uint64_t v8 = self->_activityToIncompatibleActivitiesMap;
        objc_sync_enter(v8);
        activityToIncompatibleActivitiesMap = self->_activityToIncompatibleActivitiesMap;
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( activityToIncompatibleActivitiesMap,  "objectForKeyedSubscript:",  v10));

        if (v11)
        {
          [v5 unionSet:v11];
          id v12 = self->_activityToIncompatibleActivitiesMap;
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
          -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);
        }

        objc_sync_exit(v8);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 groupName]);
        if (([v14 isEqualToString:_DASDefaultGroupName] & 1) == 0)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 groupName]);
          if (![v15 isEqualToString:_DASDefaultNetworkGroupName])
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v7 groupName]);
            unsigned __int8 v24 = [v23 isEqualToString:_DASDefaultRemoteGroupName];

            if ((v24 & 1) == 0) {
              goto LABEL_15;
            }
            goto LABEL_12;
          }
        }

LABEL_12:
        os_unfair_lock_lock(&self->_groupLock);
        groupToPendingTasks = self->_groupToPendingTasks;
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 groupName]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( groupToPendingTasks,  "objectForKeyedSubscript:",  v17));
        id v19 = [v18 copy];

        os_unfair_lock_unlock(&self->_groupLock);
        if (v19) {
          [v5 unionSet:v19];
        }

LABEL_15:
        id v20 = (id)objc_claimAutoreleasedReturnValue([v7 groupName]);
        if (!v20) {
          continue;
        }
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v7 groupName]);
        if (([v21 isEqualToString:_DASDefaultGroupName] & 1) == 0)
        {
          unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v7 groupName]);
          if ([v22 isEqualToString:_DASDefaultNetworkGroupName])
          {
          }

          else
          {
            double v25 = (void *)objc_claimAutoreleasedReturnValue([v7 groupName]);
            unsigned __int8 v26 = [v25 isEqualToString:_DASDefaultRemoteGroupName];

            if ((v26 & 1) != 0) {
              continue;
            }
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
            os_unfair_lock_lock(&self->_groupLock);
            id v27 = self->_groupToPendingTasks;
            double v28 = (void *)objc_claimAutoreleasedReturnValue([v7 groupName]);
            id v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v28));
            id v30 = [v29 copy];

            __int128 v41 = 0u;
            __int128 v42 = 0u;
            __int128 v39 = 0u;
            __int128 v40 = 0u;
            id v20 = v30;
            id v31 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (v31)
            {
              uint64_t v32 = *(void *)v40;
              do
              {
                for (j = 0LL; j != v31; j = (char *)j + 1)
                {
                  if (*(void *)v40 != v32) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v34 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)j);
                }

                id v31 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
              }

              while (v31);
            }

            os_unfair_lock_unlock(&self->_groupLock);
            if ([v21 count]) {
              [v5 unionSet:v21];
            }
          }
        }
      }

      id v38 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }

    while (v38);
  }

  -[_DASDaemon unprotectedEvaluateScoreAndRunActivities:](self, "unprotectedEvaluateScoreAndRunActivities:", v5);
}

- (void)registerWithContextStoreForId:(id)a3 contextualPredicate:(id)a4 dismissalCondition:(id)a5 deviceSet:(unint64_t)a6 mustWake:(BOOL)a7 qualityOfService:(unsigned int)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000936C0;
  v19[3] = &unk_1001171D0;
  id v20 = a4;
  __int128 v21 = self;
  id v22 = v14;
  id v15 = v14;
  id v16 = v20;
  LODWORD(v18) = a8;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[_CDContextualChangeRegistration registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:clientIdentifier:mustWake:qualityOfService:callback:]( &OBJC_CLASS____CDContextualChangeRegistration,  "registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:clientIdentifier:mustWake:q ualityOfService:callback:",  v15,  v16,  a5,  a6,  @"com.apple.dasd.trigger",  v9,  v18,  v19));
  -[_CDLocalContext registerCallback:](self->_context, "registerCallback:", v17);
}

- (void)registerTriggersWithContextStoreForPolicies:(id)a3
{
  id v3 = a3;
  id v30 = [&__NSDictionary0__struct mutableCopy];
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id obj = v3;
  id v24 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v38;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v4;
        id v31 = *(void **)(*((void *)&v37 + 1) + 8 * v4);
        id v29 = (id)objc_claimAutoreleasedReturnValue([v31 triggers]);
        if (v29)
        {
          __int128 v35 = 0u;
          __int128 v36 = 0u;
          __int128 v33 = 0u;
          __int128 v34 = 0u;
          id v5 = [v29 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v5)
          {
            id v6 = v5;
            uint64_t v7 = *(void *)v34;
            uint64_t v27 = *(void *)v34;
            do
            {
              uint64_t v8 = 0LL;
              id v28 = v6;
              do
              {
                if (*(void *)v34 != v7) {
                  objc_enumerationMutation(v29);
                }
                BOOL v9 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)v8);
                id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"identifier"]);
                if (v10)
                {
                  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"predicate"]);

                  if (v11)
                  {
                    uint64_t v32 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"predicate"]);
                    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"dismissalCondition"]);
                    id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"deviceSet"]);
                    id v14 = [v13 unsignedIntegerValue];
                    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"mustWake"]);
                    id v16 = [v15 BOOLValue];
                    id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"qualityOfService"]);
                    if (v17)
                    {
                      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"qualityOfService"]);
                      id v19 = (void *)v32;
                      -[_DASDaemon registerWithContextStoreForId:contextualPredicate:dismissalCondition:deviceSet:mustWake:qualityOfService:]( self,  "registerWithContextStoreForId:contextualPredicate:dismissalCondition:deviceSet:mustWake:qualityOfService:",  v10,  v32,  v12,  v14,  v16,  [v18 unsignedIntegerValue]);
                    }

                    else
                    {
                      id v19 = (void *)v32;
                      -[_DASDaemon registerWithContextStoreForId:contextualPredicate:dismissalCondition:deviceSet:mustWake:qualityOfService:]( self,  "registerWithContextStoreForId:contextualPredicate:dismissalCondition:deviceSet:mustWake:qualityOfService:",  v10,  v32,  v12,  v14,  v16,  17LL);
                    }

                    uint64_t v7 = v27;
                    id v6 = v28;
                  }

                  [v30 setObject:v31 forKeyedSubscript:v10];
                }

                uint64_t v8 = (char *)v8 + 1;
              }

              while (v6 != v8);
              id v6 = [v29 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }

            while (v6);
          }
        }

        uint64_t v4 = v25 + 1;
      }

      while ((id)(v25 + 1) != v24);
      id v24 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }

    while (v24);
  }

  id v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v30));
  triggerToPolicyMap = self->_triggerToPolicyMap;
  self->_triggerToPolicyMap = v20;
}

- (void)addTriggersToActivity:(id)a3
{
  id v29 = self;
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[_DASPolicyManager allPoliciesForPlatform](&OBJC_CLASS____DASPolicyManager, "allPoliciesForPlatform"));
  id v5 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v42;
    uint64_t v8 = @"com.apple.das.fileprotectionpolicy.statuschanged";
    uint64_t v30 = *(void *)v42;
    do
    {
      BOOL v9 = 0LL;
      id v31 = v6;
      do
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v9);
        if (objc_msgSend(v10, "appliesToActivity:", v3, v29))
        {
          __int128 v33 = v9;
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 triggers]);
          id v12 = &AnalyticsSendEventLazy_ptr;
          id v36 = v11;
          if (v11)
          {
            __int128 v39 = 0u;
            __int128 v40 = 0u;
            __int128 v37 = 0u;
            __int128 v38 = 0u;
            id v13 = [v11 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v13)
            {
              id v14 = v13;
              uint64_t v15 = *(void *)v38;
              uint64_t v34 = *(void *)v38;
              do
              {
                id v16 = 0LL;
                id v35 = v14;
                do
                {
                  if (*(void *)v38 != v15) {
                    objc_enumerationMutation(v36);
                  }
                  id v17 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v37 + 1) + 8 * (void)v16) objectForKeyedSubscript:@"identifier"]);
                  uint64_t v18 = v17;
                  if (v17)
                  {
                    id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 fileProtection]);
                    id v20 = (void *)objc_claimAutoreleasedReturnValue([v12[150] none]);
                    if ([v19 isEqual:v20])
                    {

                      uint64_t v15 = v34;
                      id v14 = v35;
                      goto LABEL_25;
                    }

                    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v3 fileProtection]);
                    uint64_t v22 = objc_claimAutoreleasedReturnValue([v12[150] completeUntilFirstUserAuthentication]);
                    uint64_t v23 = v8;
                    id v24 = v3;
                    uint64_t v25 = v4;
                    unsigned __int8 v26 = (void *)v22;
                    unsigned __int8 v27 = [v21 isEqual:v22];

                    uint64_t v4 = v25;
                    id v3 = v24;
                    uint64_t v8 = v23;
                    id v12 = &AnalyticsSendEventLazy_ptr;

                    uint64_t v15 = v34;
                    id v14 = v35;
                    if ((v27 & 1) == 0)
                    {
LABEL_35:
                      if (([v18 isEqualToString:@"com.apple.duetactivityscheduler.cpuusagepolicy.cpuusagelevelchange"] & 1) == 0 && !objc_msgSend( v18,  "isEqualToString:",  @"com.apple.duetactivityscheduler.thermalpolicypolicy.thermalpressurechange")
                        || ([v3 bypassesPredictions] & 1) != 0
                        || (id v28 = [v3 schedulingPriority],
                            (unint64_t)v28 >= _DASSchedulingPriorityUtility)
                        || ([v3 isIntensive] & 1) != 0
                        || [v3 triggersRestart])
                      {
                        [v4 addObject:v18];
                      }
                    }
                  }

- (void)associateActivity:(id)a3 withTriggerKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_triggerToActivitiesMap;
  objc_sync_enter(v8);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_triggerToActivitiesMap,  "objectForKeyedSubscript:",  v13,  (void)v18));
        BOOL v15 = v14 == 0LL;

        if (v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_triggerToActivitiesMap,  "setObject:forKeyedSubscript:",  v16,  v13);
        }

        id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_triggerToActivitiesMap,  "objectForKeyedSubscript:",  v13));
        objc_msgSend(v17, "_DAS_addOrReplaceObject:", v6);
      }

      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)periodicCalculationForOptimal
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](&OBJC_CLASS____DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Periodic scoring of activities for optimal date",  buf,  2u);
  }

  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = self->_pendingTasks;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "startBefore", (void)v15));
        [v12 timeIntervalSinceDate:v5];
        double v14 = v13;

        if (v14 > 0.0) {
          +[_DASConditionScore computeOptimalScoreAndDateForActivity:]( &OBJC_CLASS____DASConditionScore,  "computeOptimalScoreAndDateForActivity:",  v11);
        }
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    }

    while (v8);
  }

  os_unfair_recursive_lock_unlock(p_activityStateLock);
}

- (void)schedulingTimerFired
{
  id v7 = (id)os_transaction_create("com.apple.dasd.schedulingTimerFired");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 descriptionWithLocale:v4]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Periodic timer fired (%@)",  v5));

  -[_DASDaemon evaluateScoreAndRunAllActivitiesForReason:](self, "evaluateScoreAndRunAllActivitiesForReason:", v6);
  -[_DASDaemon determineNextTimerFireDateAndSchedule](self, "determineNextTimerFireDateAndSchedule");
}

- (void)determineNextTimerFireDateAndSchedule
{
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  id v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSMutableSet count](self->_pendingTasks, "count")));
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id v3 = self->_pendingTasks;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v66,  v71,  16LL);
  if (v4)
  {
    id v5 = v4;
    id v6 = 0LL;
    uint64_t v7 = *(void *)v67;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v67 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)i);
        if (([v9 triggersRestart] & 1) == 0)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 startBefore]);
          [v10 timeIntervalSinceDate:v61];
          double v12 = v11;

          if (v12 <= 0.0) {
            continue;
          }
        }

        if (![v9 requiresNetwork]
          || -[_DASNetworkEvaluationMonitor isNetworkPathAvailableForActivity:]( self->_networkEvaluationMonitor,  "isNetworkPathAvailableForActivity:",  v9))
        {
          unsigned int v13 = +[_DASSystemContext isPluggedIn:]( &OBJC_CLASS____DASSystemContext,  "isPluggedIn:",  self->_context);
          if (![v9 requiresPlugin] || v13 != 0)
          {
            [v60 addObject:v9];
            if (v6)
            {
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 startBefore]);
              [v15 timeIntervalSinceDate:v16];
              double v18 = v17;

              if (v18 >= 0.0)
              {
                id v19 = v9;

                id v6 = v19;
              }
            }

            else
            {
              id v6 = v9;
            }
          }
        }
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v66,  v71,  16LL);
    }

    while (v5);
  }

  else
  {
    id v6 = 0LL;
  }

  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  if ([v60 count])
  {
    id v20 = [v6 schedulingPriority];
    unint64_t v21 = _DASSchedulingPriorityUtility;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
    [v22 timeIntervalSinceDate:v61];
    double v24 = v23;

    if (v24 <= 0.0)
    {
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      -[_DASDaemon scheduleTimerOnBehalfOf:between:and:waking:]( self,  "scheduleTimerOnBehalfOf:between:and:waking:",  v31,  (unint64_t)v20 > v21,  600.0,  900.0);
    }

    else
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v6 predictedOptimalStartDate]);
      [v25 timeIntervalSinceDate:v26];
      if (v27 >= 90.0)
      {
      }

      else
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v6 predictedOptimalStartDate]);
        [v28 timeIntervalSinceDate:v61];
        double v30 = v29;

        if (v30 > 0.0)
        {
          -[_DASDaemon scheduleTimerForActivity:](self, "scheduleTimerForActivity:", v6);
          goto LABEL_46;
        }
      }

      unint64_t v59 = (unint64_t)v20;
      id v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "predictedOptimalStartDate", v21));
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      id v32 = v60;
      id v33 = [v32 countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v63;
        do
        {
          for (j = 0LL; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v63 != v35) {
              objc_enumerationMutation(v32);
            }
            __int128 v37 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)j);
            __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 predictedOptimalStartDate]);
            __int128 v39 = v38;
            if (v38)
            {
              [v38 timeIntervalSinceDate:v61];
              if (v40 >= 0.0)
              {
                __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
                [v39 timeIntervalSinceDate:v41];
                double v43 = v42;

                if (v43 <= 0.0)
                {
                  [v39 timeIntervalSinceDate:v31];
                  if (v44 > 0.0)
                  {
                    uint64_t v45 = objc_claimAutoreleasedReturnValue([v37 predictedOptimalStartDate]);

                    id v31 = (void *)v45;
                  }
                }
              }
            }
          }

          id v34 = [v32 countByEnumeratingWithState:&v62 objects:v70 count:16];
        }

        while (v34);
      }

      [v31 timeIntervalSinceDate:v61];
      double v47 = v46;
      __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v6 startBefore]);
      [v48 timeIntervalSinceDate:v61];
      double v50 = v49;

      [v31 timeIntervalSinceDate:v61];
      double v52 = v51;
      __int128 v53 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      if (v52 >= 0.0)
      {
        id v55 = self;
        __int128 v56 = v53;
        double v57 = v47;
        double v54 = v50;
      }

      else
      {
        double v54 = v50 + 90.0;
        id v55 = self;
        __int128 v56 = v53;
        double v57 = v50;
      }

      -[_DASDaemon scheduleTimerOnBehalfOf:between:and:waking:]( v55,  "scheduleTimerOnBehalfOf:between:and:waking:",  v56,  v59 > v58,  v57,  v54);
    }
  }

- (void)chooseActivitiesToRunFromCandidateActivities:(id)a3 toBeRunActivities:(id)a4 toLaunchApplications:(id)a5 toLaunchExtension:(id)a6
{
  id v33 = a4;
  id v36 = a5;
  id v34 = a6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon sortCandidateActivities:](self, "sortCandidateActivities:", a3));
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithObjectsFrom:]( &OBJC_CLASS___NSMutableArray,  "arrayWithObjectsFrom:",  self->_prerunningTasks,  self->_runningTasks,  0LL));
  os_unfair_recursive_lock_unlock(&self->_activityStateLock);
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (!v11)
  {
    LOBYTE(v35) = 0;
    goto LABEL_38;
  }

  int v35 = 0;
  uint64_t v12 = *(void *)v42;
  do
  {
    unsigned int v13 = 0LL;
    do
    {
      if (*(void *)v42 != v12) {
        objc_enumerationMutation(obj);
      }
      double v14 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v13);
      if (+[_DASPhotosPolicy isActivity:consideredNonDiscretionary:]( &OBJC_CLASS____DASPhotosPolicy,  "isActivity:consideredNonDiscretionary:",  v14,  self->_context)
        || ([v14 isIntensive] & 1) != 0)
      {
        goto LABEL_13;
      }

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 fastPass]);
      if (v15
        || ([v14 triggersRestart] & 1) != 0
        || (__int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 groupName])) == 0
        || (id v16 = [v14 schedulingPriority], (unint64_t)v16 > _DASSchedulingPriorityDefault))
      {

LABEL_13:
        os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
        if ((-[NSMutableSet containsObject:](self->_pendingTasks, "containsObject:", v14) & 1) != 0)
        {
          os_unfair_recursive_lock_unlock(&self->_activityStateLock);
          if (-[_DASDaemon shouldRunActivityNow:withOtherActivities:]( self,  "shouldRunActivityNow:withOtherActivities:",  v14,  v39))
          {
            if (-[_DASActivityRateLimitManager executeActivity:](self->_rateLimiter, "executeActivity:", v14))
            {
              [v39 addObject:v14];
              if ([v14 requestsApplicationLaunch])
              {
                [v36 addObject:v14];
              }

              else if ([v14 requestsExtensionLaunch])
              {
                [v34 addObject:v14];
              }

              else
              {
                [v33 addObject:v14];
                v35 |= [v14 triggersRestart];
              }

              -[_DASDaemon moveActivityToPrerunning:](self, "moveActivityToPrerunning:", v14);
            }

            else
            {
              [v37 addObject:v14];
            }
          }
        }

        else
        {
          double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%@ previously run or canceled",  (uint8_t *)&buf,  0xCu);
          }

          os_unfair_recursive_lock_unlock(&self->_activityStateLock);
        }

        goto LABEL_21;
      }

      double v18 = (void *)objc_claimAutoreleasedReturnValue([v14 groupName]);
      BOOL v19 = -[_DASDaemon additionalCapacityForActivity:inGroupWithName:shouldTryToSuspend:]( self,  "additionalCapacityForActivity:inGroupWithName:shouldTryToSuspend:",  v14,  v18,  0LL) == 0;

      if (!v19) {
        goto LABEL_13;
      }
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 groupName]);
      if ([v20 isEqualToString:_DASDefaultGroupName])
      {
      }

      else
      {
        unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v14 groupName]);
        if ([v21 isEqualToString:_DASDefaultNetworkGroupName])
        {
        }

        else
        {
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 groupName]);
          unsigned __int8 v31 = [v22 isEqualToString:_DASDefaultRemoteGroupName];

          if ((v31 & 1) == 0) {
            [v32 addObject:v14];
          }
        }
      }

- (id)sortCandidateActivities:(id)a3
{
  context = self->_context;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath]( &OBJC_CLASS____DASUserRequestedBackupTaskManager,  "userRequestedBackupKeyPath"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v6));
  unsigned __int8 v8 = [v7 BOOLValue];

  unsigned __int8 v9 = +[_DASPhotosPolicy isPhotosForegroundWithContext:]( &OBJC_CLASS____DASPhotosPolicy,  "isPhotosForegroundWithContext:",  self->_context);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  void v14[2] = sub_1000952B4;
  v14[3] = &unk_1001171F8;
  unsigned __int8 v15 = v8;
  unsigned __int8 v16 = v9;
  v14[4] = self;
  id v10 = objc_retainBlock(v14);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingComparator:v10]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v11));
  return v12;
}

- (void)evaluateScoreAndRunActivities:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create("com.apple.dasd.evaluateScoreAndRun");
  evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100095864;
  block[3] = &unk_100115120;
  id v10 = v5;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(evaluationQueue, block);
}

- (void)unprotectedEvaluateScoreAndRunActivities:(id)a3
{
  id v4 = a3;
  id v5 = objc_autoreleasePoolPush();
  if (![v4 count]) {
    goto LABEL_41;
  }
  __int128 v43 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  double v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  IOReturn v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  double v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unsigned __int8 v48 = +[_DASSystemContext isPluggedIn:]( &OBJC_CLASS____DASSystemContext,  "isPluggedIn:",  self->_context);
  context = self->_context;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASUserRequestedBackupTaskManager userRequestedBackupKeyPath]( &OBJC_CLASS____DASUserRequestedBackupTaskManager,  "userRequestedBackupKeyPath"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[_CDLocalContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v8));
  unsigned int v10 = [v9 BOOLValue];

  unsigned int v11 = -[_DASSleepWakeMonitor inADarkWake](self->_sleepWakeMonitor, "inADarkWake");
  IOPMAllowsBackgroundTask(-[_DASSleepWakeMonitor wakeState](self->_sleepWakeMonitor, "wakeState"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASLowPowerModePolicy policyInstance](&OBJC_CLASS____DASLowPowerModePolicy, "policyInstance"));
  double v47 = self;
  [v12 isLowPowerModePolicyEnforced:self->_context];

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v44 = v4;
  id v13 = v4;
  id v14 = [v13 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (!v14) {
    goto LABEL_32;
  }
  id v15 = v14;
  uint64_t v16 = *(void *)v51;
  do
  {
    double v17 = 0LL;
    do
    {
      if (*(void *)v51 != v16) {
        objc_enumerationMutation(v13);
      }
      double v18 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v17);
      if (v11)
      {
        unsigned __int8 v19 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)v17) darkWakeEligible];
        id v20 = v6;
        if ((v19 & 1) != 0) {
          goto LABEL_13;
        }
        unsigned __int8 v21 = [v18 triggersRestart];
        id v20 = v6;
        if ((v21 & 1) != 0) {
          goto LABEL_13;
        }
      }

      else
      {
        if (v10)
        {
          unsigned __int8 v22 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)v17) userRequestedBackupTask];
          id v20 = v6;
          if ((v22 & 1) != 0) {
            goto LABEL_13;
          }
        }

        if (([v18 userRequestedBackupTask] & 1) == 0
          && ((v48 & 1) != 0 || ([v18 skipEvaluationIfUnplugged] & 1) == 0)
          && -[_DASDaemon activityIsTimewiseEligible:atDate:](v47, "activityIsTimewiseEligible:atDate:", v18, v49))
        {
          if ([v18 cancelAfterDeadline])
          {
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 startBefore]);
            [v49 timeIntervalSinceDate:v23];
            double v25 = v24;

            id v20 = v46;
            if (v25 > 0.0) {
              goto LABEL_13;
            }
          }

          unsigned __int8 v26 = [v18 bypassesPredictions];
          id v20 = v6;
          if ((v26 & 1) != 0) {
            goto LABEL_13;
          }
          uint64_t v27 = objc_claimAutoreleasedReturnValue([v18 remoteDevice]);
          if (!v27
            || (v28 = (void *)v27, id v29 = [v18 targetDevice], v28, v29 != (id)3)
            || (dispatch_time_t v30 = (void *)objc_claimAutoreleasedReturnValue([v18 remoteDevice]),
                unsigned int v31 = -[_DASRemoteDeviceNearbyMonitor isRemoteDeviceNearby:]( v47->_remoteDeviceNearbyMonitor,  "isRemoteDeviceNearby:",  v30),  v30,  v31))
          {
            unsigned __int8 v32 = [v18 hasManyConstraints];
            id v20 = v6;
            if ((v32 & 1) != 0) {
              goto LABEL_13;
            }
            id v33 = (void *)objc_claimAutoreleasedReturnValue([v18 startBefore]);
            [v33 timeIntervalSinceDate:v49];
            if (v34 <= 1800.0 || (uint64_t v35 = objc_claimAutoreleasedReturnValue([v18 lastScored])) == 0)
            {

              id v20 = v6;
LABEL_13:
              [v20 addObject:v18];
              goto LABEL_28;
            }

            id v36 = (void *)v35;
            uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v18 lastScored]);
            [v49 timeIntervalSinceDate:v45];
            double v38 = v37;

            id v20 = v6;
            if (v38 >= 300.0) {
              goto LABEL_13;
            }
          }
        }
      }

- (void)evaluateScoreAndRunAllActivitiesForReason:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create("com.apple.dasd.evaluateScoreAndRunAll");
  evaluationQueue = (dispatch_queue_s *)self->_evaluationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100095E04;
  block[3] = &unk_100115120;
  id v10 = v5;
  unsigned int v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_sync(evaluationQueue, block);
}

- (BOOL)shouldSuspendLongRunningActivity:(id)a3 withStartDate:(id)a4 whileBlockingOtherTasks:(BOOL)a5 atDate:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (-[_DASDaemon isActivitySuspendable:withStartDate:](self, "isActivitySuspendable:withStartDate:", v10, v11)
    && (!-[_DASRuntimeLimiter onlyPreemptiveSuspend](self->_runtimeLimiter, "onlyPreemptiveSuspend") || v7))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[_DASRuntimeLimiter shouldLimitActivityAtRuntime:withStartDate:atDate:withContext:]( self->_runtimeLimiter,  "shouldLimitActivityAtRuntime:withStartDate:atDate:withContext:",  v10,  v11,  v12,  self->_context));
    id v15 = v14;
    if (v14) {
      BOOL v13 = [v14 decision] == (id)3;
    }
    else {
      BOOL v13 = 0;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)shouldPreemptActivity:(id)a3 forFastPassActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 startDate]);
  if (!-[_DASDaemon isActivitySuspendable:withStartDate:](self, "isActivitySuspendable:withStartDate:", v6, v8))
  {
    BOOL v15 = 0;
LABEL_12:

    goto LABEL_13;
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 fastPass]);

  if (v9)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 fastPass]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 processingTaskIdentifiers]);
    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 fastPass]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 processingTaskIdentifiers]);
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      if ([v12 containsObject:v13])
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 fastPass]);
        BOOL v15 = v14 == 0LL;
      }

      else
      {
        BOOL v15 = 0;
      }
    }

    else
    {
      BOOL v15 = 0;
    }

    goto LABEL_12;
  }

  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (BOOL)isActivitySuspendable:(id)a3 withStartDate:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 suspendRequestDate]);
  if (v7
    || (id v10 = [v6 schedulingPriority], !a4)
    || (unint64_t)v10 > _DASSchedulingPriorityDefault)
  {
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);

    if (v11
      && (!+[_DASPhotosPolicy isiCPLActivity:](&OBJC_CLASS____DASPhotosPolicy, "isiCPLActivity:", v6)
       || !+[_DASPhotosPolicy isPhotosSyncOverriddenWithContext:]( &OBJC_CLASS____DASPhotosPolicy,  "isPhotosSyncOverriddenWithContext:",  self->_context)))
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
      if (!v12
        || (BOOL v13 = (void *)v12,
            unsigned __int8 v14 = -[_DASDaemon testModeConstraintsApplyToActivity:](self, "testModeConstraintsApplyToActivity:", v6),
            v13,
            (v14 & 1) == 0))
      {
        BOOL v8 = 1;
        goto LABEL_4;
      }
    }
  }

  BOOL v8 = 0;
LABEL_4:

  return v8;
}

- (id)candidateGroupActivityForPreemption:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v6)
  {
    BOOL v8 = 0LL;
    unsigned __int8 v21 = v5;
LABEL_18:

    goto LABEL_19;
  }

  id v7 = v6;
  BOOL v8 = 0LL;
  uint64_t v9 = *(void *)v24;
  do
  {
    for (i = 0LL; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      id v12 = objc_msgSend(v11, "schedulingPriority", (void)v23);
      if ((unint64_t)v12 <= _DASSchedulingPriorityDefault)
      {
        if ([v11 suspendable])
        {
          uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 startDate]);
          if (v13)
          {
            unsigned __int8 v14 = (void *)v13;
            BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v11 suspendRequestDate]);

            if (!v15)
            {
              uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 startDate]);
              [v16 timeIntervalSinceDate:v4];
              double v18 = v17;

              if (v18 > 0.0)
              {
                uint64_t v19 = objc_claimAutoreleasedReturnValue([v11 startDate]);

                id v20 = v11;
                BOOL v8 = v20;
                id v4 = (void *)v19;
              }
            }
          }
        }
      }
    }

    id v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  }

  while (v7);

  if (v8)
  {
    unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      IOReturn v28 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "Suspending %{public}@ as it may block other high priority activities.",  buf,  0xCu);
    }

    goto LABEL_18;
  }

- (id)tasksNoLongerEligibleFromTasks:(id)a3
{
  id v4 = a3;
  __int128 v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v6)
  {
    id v8 = v6;
    p_info = &OBJC_METACLASS____DASBackgroundAppKillDemo.info;
    uint64_t v10 = *(void *)v55;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v49 = v7;
    id v51 = v5;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        if (objc_msgSend(v12, "suspendable", v49))
        {
          if (-[_DASDaemon pausedParametersApplyToActivity:](self, "pausedParametersApplyToActivity:", v12))
          {
            uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([p_info + 436 defaultCategory]);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138543362;
              id v60 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Scheduling Paused: Suspending activity: %{public}@",  buf,  0xCu);
            }
          }

          unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 startDate]);

          if (v14)
          {
            BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v12 startDate]);
            [v52 timeIntervalSinceDate:v15];
            double v17 = v16 / 60.0;

            if (v17 > 60.0 && v17 < 70.0)
            {
              double v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([p_info + 436 logForCategory:@"lifecycle"]);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 suspendRequestDate]);
                -[_DASRuntimeLimiter maximumRuntimeForActivity:]( self->_runtimeLimiter,  "maximumRuntimeForActivity:",  v12);
                unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20 / 60.0));
                *(_DWORD *)__int128 buf = 138544130;
                id v60 = v12;
                __int16 v61 = 2048;
                double v62 = v17;
                __int16 v63 = 1024;
                BOOL v64 = v19 != 0LL;
                __int16 v65 = 2112;
                __int128 v66 = v21;
                _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ running for %lf mins (suspendRequested=%u), Max runtime: %@ mins",  buf,  0x26u);
              }

              id v5 = v51;
            }

            if (v17 > 90.0 && v17 < 100.0)
            {
              __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([p_info + 436 logForCategory:@"lifecycle"]);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v12 suspendRequestDate]);
                *(_DWORD *)__int128 buf = 138543874;
                id v60 = v12;
                __int16 v61 = 2048;
                double v62 = v17;
                __int16 v63 = 1024;
                BOOL v64 = v24 != 0LL;
                _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@ running for %lf mins (suspendRequested=%u)",  buf,  0x1Cu);
              }
            }

            if (v17 > 120.0 && v17 < 130.0)
            {
              __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([p_info + 436 logForCategory:@"lifecycle"]);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v12 suspendRequestDate]);
                *(_DWORD *)__int128 buf = 138543874;
                id v60 = v12;
                __int16 v61 = 2048;
                double v62 = v17;
                __int16 v63 = 1024;
                BOOL v64 = v26 != 0LL;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@ running for %lf mins (suspendRequested=%u)",  buf,  0x1Cu);
              }
            }
          }

          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v12 suspendRequestDate]);

          if (!v27)
          {
            runtimeLimiter = self->_runtimeLimiter;
            id v29 = (void *)objc_claimAutoreleasedReturnValue([v12 startDate]);
            dispatch_time_t v30 = (void *)objc_claimAutoreleasedReturnValue( -[_DASRuntimeLimiter shouldLimitActivityAtRuntime:withStartDate:atDate:withContext:]( runtimeLimiter,  "shouldLimitActivityAtRuntime:withStartDate:atDate:withContext:",  v12,  v29,  v52,  self->_context));

            if (v30 && [v30 decision] == (id)3)
            {
              unsigned int v31 = self->_runtimeLimiter;
              unint64_t v58 = v30;
              unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v58,  1LL));
              LODWORD(v31) = -[_DASRuntimeLimiter limitedActivity:withLimitsResponses:]( v31,  "limitedActivity:withLimitsResponses:",  v12,  v32);

              if ((_DWORD)v31)
              {
                uint64_t v33 = objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
                if (v33)
                {
                  double v34 = (void *)v33;
                  unsigned __int8 v35 = -[_DASDaemon testModeConstraintsApplyToActivity:]( self,  "testModeConstraintsApplyToActivity:",  v12);

                  if ((v35 & 1) != 0)
                  {
                    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"runtimeLimiter"));
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)__int128 buf = 138543362;
                      id v60 = v12;
                      _os_log_debug_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "WARNING: Test mode is on so activity %{public}@ is not being suspended for running too long",  buf,  0xCu);
                    }

                    goto LABEL_55;
                  }
                }

                uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"runtimeLimiter"));
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)__int128 buf = 138543362;
                  id v60 = v12;
                  _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Suspending %{public}@ - running for too long",  buf,  0xCu);
                }

                -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:]( self,  "updateSuspendRequestDate:forActivity:withReason:",  v52,  v12,  @"Limitations");
LABEL_54:
                [v50 addObject:v12];
              }
            }

            else
            {
              +[_DASConditionScore scoreForActivity:withState:response:]( &OBJC_CLASS____DASConditionScore,  "scoreForActivity:withState:response:",  v12,  self->_context,  &v53);
              if (v53 == 100 || v53 == 33)
              {
                uint64_t v37 = objc_claimAutoreleasedReturnValue(-[_DASDaemon testModeParameters](self, "testModeParameters"));
                if (v37)
                {
                  double v38 = (void *)v37;
                  unsigned int v39 = -[_DASDaemon testModeConstraintsApplyToActivity:]( self,  "testModeConstraintsApplyToActivity:",  v12);

                  if (v39)
                  {
                    double v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v12 policyScores]);
                    unsigned int v43 = -[_DASDaemon testModeConstraintsRequireOverridingDecisionWithScores:ignoredPolicies:honoredPolicies:]( self,  "testModeConstraintsRequireOverridingDecisionWithScores:ignoredPolicies:honoredPolicies:",  v42,  v40,  v41);

                    if (v43)
                    {
                      id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger defaultCategory]( &OBJC_CLASS____DASDaemonLogger,  "defaultCategory"));
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)__int128 buf = v49;
                        id v60 = v12;
                        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Test Mode: Not suspending: %@",  buf,  0xCu);
                      }

                      id v5 = v51;
                      goto LABEL_55;
                    }

                    id v5 = v51;
                  }
                }

                IOReturn v46 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)__int128 buf = 138543362;
                  id v60 = v12;
                  _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Suspending %{public}@ - required criterion is not satisfied.",  buf,  0xCu);
                }

                double v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
                -[_DASDaemon updateSuspendRequestDate:forActivity:withReason:]( self,  "updateSuspendRequestDate:forActivity:withReason:",  v47,  v12,  0LL);

                goto LABEL_54;
              }
            }

- (id)tasksNoLongerEligible
{
  p_activityStateLock = &self->_activityStateLock;
  os_unfair_recursive_lock_lock_with_options(&self->_activityStateLock, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_runningTasks, "allObjects"));
  os_unfair_recursive_lock_unlock(p_activityStateLock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASDaemon tasksNoLongerEligibleFromTasks:](self, "tasksNoLongerEligibleFromTasks:", v4));

  return v5;
}

- (void)updateSuspendRequestDate:(id)a3 forActivity:(id)a4 withReason:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  [v11 setSuspendRequestDate:a3];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPLLogger sharedInstance](&OBJC_CLASS____DASPLLogger, "sharedInstance"));
  [v8 recordActivityLifeCycleSuspend:v11];

  +[_DASMetricRecorder incrementOccurrencesForKey:byCount:]( &OBJC_CLASS____DASMetricRecorder,  "incrementOccurrencesForKey:byCount:",  @"com.apple.das.suspensioncount",  1LL);
  if ([v7 isEqualToString:@"Limitations"])
  {
    objc_msgSend( v11,  "setLastDenialValue:",  (unint64_t)objc_msgSend(v11, "lastDenialValue") | +[_DASPolicyManager bitmaskForPolicy:]( _DASPolicyManager,  "bitmaskForPolicy:",  @"Limitations"));
    if (+[_DASCheckpointRecorder shouldLogCheckpointForActivity:]( &OBJC_CLASS____DASCheckpointRecorder,  "shouldLogCheckpointForActivity:",  v11))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
      [v9 reportTaskCheckpoint:45 forTask:v11 error:0];
    }
  }

  else
  {
    uint64_t v10 = @"Sysdiagnose";
    if ([v7 isEqualToString:@"Sysdiagnose"]
      || (uint64_t v10 = @"Preemption", [v7 isEqualToString:@"Preemption"])
      || (uint64_t v10 = @"Incompatibility", [v7 isEqualToString:@"Incompatibility"]))
    {
      objc_msgSend( v11,  "setLastDenialValue:",  (unint64_t)objc_msgSend(v11, "lastDenialValue") | +[_DASPolicyManager bitmaskForPolicy:]( _DASPolicyManager,  "bitmaskForPolicy:",  v10));
    }
  }
}

- (void)reportPostRestoreCheckpoint:(unint64_t)a3 withParameters:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v8 = kBGSTKeyTaskName;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kBGSTKeyTaskName]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
  char isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v8]);
  uint64_t v13 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);
  }

  else
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    char v16 = objc_opt_isKindOfClass(v13, v15);

    if ((v16 & 1) != 0) {
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v8]);
    }
    else {
      unsigned __int8 v14 = 0LL;
    }
  }

  uint64_t v17 = kBGSTKeyFeatureCode;
  double v18 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kBGSTKeyFeatureCode]);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray);
  char v20 = objc_opt_isKindOfClass(v18, v19);

  uint64_t v21 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v17]);
  unsigned __int8 v22 = (void *)v21;
  if ((v20 & 1) != 0)
  {
  }

  else
  {
    uint64_t v34 = v21;
    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));

    unsigned __int8 v22 = (void *)v23;
  }

  uint64_t v24 = kBGSTKeyInvolvedProcesses;
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kBGSTKeyInvolvedProcesses]);
  uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSArray);
  char v27 = objc_opt_isKindOfClass(v25, v26);

  uint64_t v28 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v24]);
  id v29 = (void *)v28;
  if ((v27 & 1) == 0)
  {
    uint64_t v33 = v28;
    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));

    id v7 = v29;
    id v29 = (void *)v30;
  }

  if (a3 == 30)
  {
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kBGSTKeyPaused]);
    [v31 BOOLValue];
  }

  unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPostRestoreBUILogger sharedInstance](&OBJC_CLASS____DASPostRestoreBUILogger, "sharedInstance"));
  [v32 reportState:a3 forTaskName:v14 featureCode:v22 involvedProcesses:v29];
}

- (void)activityStartedWithParameters:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kBGSTKeyFeatureCode]);

  if (v4) {
    -[_DASDaemon reportPostRestoreCheckpoint:withParameters:]( self,  "reportPostRestoreCheckpoint:withParameters:",  20LL,  v5);
  }
  -[_DASBudgetManager reportActivityRunningWithParameters:]( self->_budgetManager,  "reportActivityRunningWithParameters:",  v5);
}

- (void)activityStoppedWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:kBGSTKeyFeatureCode]);

  if (v5) {
    -[_DASDaemon reportPostRestoreCheckpoint:withParameters:]( self,  "reportPostRestoreCheckpoint:withParameters:",  30LL,  v4);
  }
  -[_DASBudgetManager reportActivityNoLongerRunningWithParameters:]( self->_budgetManager,  "reportActivityNoLongerRunningWithParameters:",  v4);
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x3032000000LL;
  v11[3] = sub_100084B3C;
  void v11[4] = sub_100084B4C;
  id v12 = 0LL;
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x3032000000LL;
  v9[3] = sub_100084B3C;
  v9[4] = sub_100084B4C;
  id v10 = 0LL;
  v7[0] = 0LL;
  v7[1] = v7;
  v7[2] = 0x3032000000LL;
  v7[3] = sub_100084B3C;
  void v7[4] = sub_100084B4C;
  id v8 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000972C4;
  v6[3] = &unk_100117220;
  void v6[4] = v11;
  void v6[5] = v7;
  v6[6] = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  _Block_object_dispose(v7, 8);

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
}

- (void)reportActivityTiming:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100097470;
  v6[3] = &unk_100116FF0;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v8 = v3;
  id v4 = v3;
  id v5 = v7;
  AnalyticsSendEventLazy(@"com.apple.das.activity.timing.minimal", v6);
}

- (void)reportSystemWorkload:(unint64_t)a3 ofCategory:(unint64_t)a4 withHandler:(id)a5
{
  id v7 = (void (**)(id, id, id))a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_DASSystemWorkloadRecorder sharedInstance]( &OBJC_CLASS____DASSystemWorkloadRecorder,  "sharedInstance"));
  id v11 = 0LL;
  id v9 = [v8 recordWorkload:a3 ofCategory:a4 error:&v11];
  id v10 = v11;

  v7[2](v7, v9, v10);
}

- (void)reportFeatureCheckpoint:(unint64_t)a3 forFeature:(unint64_t)a4 withHandler:(id)a5
{
  id v7 = (void (**)(id, id, id))a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
  id v11 = 0LL;
  id v9 = [v8 reportFeatureCheckpoint:a3 forFeature:a4 error:&v11];
  id v10 = v11;

  v7[2](v7, v9, v10);
}

- (void)reportCustomCheckpoint:(unint64_t)a3 forTask:(id)a4 withHandler:(id)a5
{
  id v7 = (void (**)(id, id, id))a5;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASCheckpointRecorder sharedInstance](&OBJC_CLASS____DASCheckpointRecorder, "sharedInstance"));
  id v12 = 0LL;
  id v10 = [v9 reportCustomCheckpoint:a3 forTask:v8 error:&v12];

  id v11 = v12;
  v7[2](v7, v10, v11);
}

- (void)extensionActivity:(id)a3 finishedWithStatus:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ finished with status %hhu",  (uint8_t *)&v10,  0x12u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 extensionIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DASPlugin existingPluginForIdentifier:ofType:]( &OBJC_CLASS____DASPlugin,  "existingPluginForIdentifier:ofType:",  v8,  @"com.apple.ml-extension"));

  [v9 unload];
  if (v4 == 2)
  {
    -[_DASDaemon activityCanceled:](self, "activityCanceled:", v6);
    -[_DASDaemon submitActivity:](self, "submitActivity:", v6);
  }

  else
  {
    -[_DASDaemon activityCompleted:](self, "activityCompleted:", v6);
  }
}

- (void)prewarmApplication:(id)a3
{
  id v5 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](&OBJC_CLASS____APRSPrewarmInterface, "sharedInstance"));
  id v4 = [v3 prewarmLaunchAppFromBundleID:v5];
}

- (void)prewarmSuspendApplication:(id)a3 withHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](&OBJC_CLASS____APRSPrewarmInterface, "sharedInstance"));
  [v7 invalidatePrewarmAssertionForApplication:v6 onInvalidation:v5];
}

- (void)_unexpectedXPCObject:(id)a3 WithLog:(id)a4
{
  id v5 = a4;
  id v6 = (void *)xpc_dictionary_copy_basic_description(a3);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000B8238();
  }

  free(v6);
}

- (void)_prewarmSuspendForMessage:(id)a3
{
  id v4 = a3;
  *(void *)&__int128 v5 = -1LL;
  *((void *)&v5 + 1) = -1LL;
  __int128 v16 = v5;
  __int128 v17 = v5;
  xpc_dictionary_get_audit_token();
  if (DWORD1(v17) == -1)
  {
    -[_DASDaemon _unexpectedXPCObject:WithLog:]( self,  "_unexpectedXPCObject:WithLog:",  v4,  @"Prewarm suspend failed to fetch audit token");
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
    id v15 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v6,  &v15));
    id v8 = v15;

    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 bundle]);
        __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
        *(_DWORD *)__int128 buf = 138412290;
        id v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Suspending prewarm for %@", buf, 0xCu);
      }

      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[_APRSPrewarmInterface sharedInstance](&OBJC_CLASS____APRSPrewarmInterface, "sharedInstance"));
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v7 bundle]);
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      -[os_log_s invalidatePrewarmAssertionForApplication:](v9, "invalidatePrewarmAssertionForApplication:", v14);
    }

    else if (v10)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Prewarm suspend failed to fetch handle with error %@",  buf,  0xCu);
    }
  }
}

- (void)_prewarmSuspendHandleIncoming:(id)a3 onConnection:(id)a4
{
  id v6 = a3;
  id v7 = (_xpc_connection_s *)a4;
  p_prewarmInvalidationLock = &self->_prewarmInvalidationLock;
  os_unfair_lock_lock(&self->_prewarmInvalidationLock);
  if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
  {
    -[_DASDaemon _prewarmSuspendForMessage:](self, "_prewarmSuspendForMessage:", v6);
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    BOOL v10 = reply;
    if (v7 && reply)
    {
      xpc_connection_send_message(v7, reply);
    }

    else
    {
      int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000B82AC();
      }
    }
  }

  else if (v6 == &_xpc_error_connection_invalid)
  {
    -[NSMutableSet removeObject:](self->_prewarmInvalidationConnections, "removeObject:", v7);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      unsigned int v12 = -[NSMutableSet count](self->_prewarmInvalidationConnections, "count");
      v14[0] = 67109120;
      v14[1] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "setupPrewarmSuspendListener connection invalidated (outstanding connections: %d)",  (uint8_t *)v14,  8u);
    }
  }

  else
  {
    -[_DASDaemon _unexpectedXPCObject:WithLog:]( self,  "_unexpectedXPCObject:WithLog:",  v6,  @"Prewarm suspend connection received unexpected message");
  }

  os_unfair_lock_unlock(p_prewarmInvalidationLock);
}

- (void)setupPrewarmSuspendListener
{
  self->_prewarmInvalidationLock._os_unfair_lock_opaque = 0;
  p_prewarmInvalidationLock = &self->_prewarmInvalidationLock;
  os_unfair_lock_lock(&self->_prewarmInvalidationLock);
  id v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  prewarmInvalidationConnections = self->_prewarmInvalidationConnections;
  self->_prewarmInvalidationConnections = v4;

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  mach_service = xpc_connection_create_mach_service("com.apple.dasd.end-prewarm", v7, 1uLL);
  prewarmInvalidationListener = self->_prewarmInvalidationListener;
  self->_prewarmInvalidationListener = mach_service;

  BOOL v10 = self->_prewarmInvalidationListener;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100098464;
  handler[3] = &unk_100117270;
  void handler[4] = self;
  xpc_connection_set_event_handler(v10, handler);
  xpc_connection_activate(self->_prewarmInvalidationListener);
  os_unfair_lock_unlock(p_prewarmInvalidationLock);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"lifecycle"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setupPrewarmSuspendListener complete", v12, 2u);
  }
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (os_unfair_recursive_lock_s)activityStateLock
{
  return self->_activityStateLock;
}

- (void)setActivityStateLock:(os_unfair_recursive_lock_s)a3
{
  self->_activityStateLock = a3;
}

- (NSMutableSet)pendingTasks
{
  return self->_pendingTasks;
}

- (void)setPendingTasks:(id)a3
{
}

- (NSMutableSet)prerunningTasks
{
  return self->_prerunningTasks;
}

- (void)setPrerunningTasks:(id)a3
{
}

- (NSMutableSet)runningTasks
{
  return self->_runningTasks;
}

- (void)setRunningTasks:(id)a3
{
}

- (NSDictionary)triggerToPolicyMap
{
  return self->_triggerToPolicyMap;
}

- (void)setTriggerToPolicyMap:(id)a3
{
}

- (NSMutableDictionary)triggerToActivitiesMap
{
  return self->_triggerToActivitiesMap;
}

- (void)setTriggerToActivitiesMap:(id)a3
{
}

- (NSMutableDictionary)activityToIncompatibleActivitiesMap
{
  return self->_activityToIncompatibleActivitiesMap;
}

- (void)setActivityToIncompatibleActivitiesMap:(id)a3
{
}

- (os_unfair_lock_s)groupLock
{
  return self->_groupLock;
}

- (void)setGroupLock:(os_unfair_lock_s)a3
{
  self->_groupLock = a3;
}

- (NSMutableDictionary)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (NSMutableDictionary)groupToPendingTasks
{
  return self->_groupToPendingTasks;
}

- (void)setGroupToPendingTasks:(id)a3
{
}

- (NSMutableDictionary)groupToRunningTasks
{
  return self->_groupToRunningTasks;
}

- (void)setGroupToRunningTasks:(id)a3
{
}

- (NSMutableDictionary)groupToPrerunningTasks
{
  return self->_groupToPrerunningTasks;
}

- (void)setGroupToPrerunningTasks:(id)a3
{
}

- (os_unfair_recursive_lock_s)applicationLaunchRequestsLock
{
  return self->_applicationLaunchRequestsLock;
}

- (void)setApplicationLaunchRequestsLock:(os_unfair_recursive_lock_s)a3
{
  self->_applicationLaunchRequestsLock = a3;
}

- (NSMutableDictionary)applicationLaunchRequests
{
  return self->_applicationLaunchRequests;
}

- (void)setApplicationLaunchRequests:(id)a3
{
}

- (NSMutableDictionary)applicationsLaunched
{
  return self->_applicationsLaunched;
}

- (void)setApplicationsLaunched:(id)a3
{
}

- (NSMutableDictionary)extensionLaunchRequests
{
  return self->_extensionLaunchRequests;
}

- (void)setExtensionLaunchRequests:(id)a3
{
}

- (_DASUserRequestedBackupTaskManager)backupTaskManager
{
  return self->_backupTaskManager;
}

- (void)setBackupTaskManager:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)bgstListener
{
  return self->_bgstListener;
}

- (void)setBgstListener:(id)a3
{
}

- (OS_dispatch_queue)timerSchedulingQueue
{
  return self->_timerSchedulingQueue;
}

- (void)setTimerSchedulingQueue:(id)a3
{
}

- (_DASTimer)schedulingTimer
{
  return self->_schedulingTimer;
}

- (void)setSchedulingTimer:(id)a3
{
}

- (NSDate)timerEarliestFireDate
{
  return self->_timerEarliestFireDate;
}

- (void)setTimerEarliestFireDate:(id)a3
{
}

- (NSDate)timerLatestFireDate
{
  return self->_timerLatestFireDate;
}

- (void)setTimerLatestFireDate:(id)a3
{
}

- (_DASNetworkEvaluationMonitor)networkEvaluationMonitor
{
  return self->_networkEvaluationMonitor;
}

- (void)setNetworkEvaluationMonitor:(id)a3
{
}

- (_DASSleepWakeMonitor)sleepWakeMonitor
{
  return self->_sleepWakeMonitor;
}

- (void)setSleepWakeMonitor:(id)a3
{
}

- (_DASRemoteDeviceNearbyMonitor)remoteDeviceNearbyMonitor
{
  return self->_remoteDeviceNearbyMonitor;
}

- (void)setRemoteDeviceNearbyMonitor:(id)a3
{
}

- (_DASRemoteDeviceWakeMonitor)remoteDeviceWakeMonitor
{
  return self->_remoteDeviceWakeMonitor;
}

- (void)setRemoteDeviceWakeMonitor:(id)a3
{
}

- (_DASDataStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (OS_dispatch_source)optimalScoringTimer
{
  return self->_optimalScoringTimer;
}

- (void)setOptimalScoringTimer:(id)a3
{
}

- (OS_dispatch_source)databaseMaintenanceTimer
{
  return self->_databaseMaintenanceTimer;
}

- (void)setDatabaseMaintenanceTimer:(id)a3
{
}

- (OS_dispatch_source)groupMonitoringTimer
{
  return self->_groupMonitoringTimer;
}

- (void)setGroupMonitoringTimer:(id)a3
{
}

- (OS_dispatch_queue)evaluationQueue
{
  return self->_evaluationQueue;
}

- (void)setEvaluationQueue:(id)a3
{
}

- (_DASBatchingQueue)triggerBatchingQueue
{
  return self->_triggerBatchingQueue;
}

- (void)setTriggerBatchingQueue:(id)a3
{
}

- (_DASBatchingQueue)triggerRecorderBatchingQueue
{
  return self->_triggerRecorderBatchingQueue;
}

- (void)setTriggerRecorderBatchingQueue:(id)a3
{
}

- (_DASBatchingQueue)activityCompletedBatchingQueue
{
  return self->_activityCompletedBatchingQueue;
}

- (void)setActivityCompletedBatchingQueue:(id)a3
{
}

- (_DASBatchingQueue)networkActivitiesQueue
{
  return self->_networkActivitiesQueue;
}

- (void)setNetworkActivitiesQueue:(id)a3
{
}

- (_DASFairScheduleManager)fairScheduleManager
{
  return self->_fairScheduleManager;
}

- (void)setFairScheduleManager:(id)a3
{
}

- (_DASActivityRateLimitManager)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (_DASControlEngine)controlEngine
{
  return self->_controlEngine;
}

- (void)setControlEngine:(id)a3
{
}

- (_DASRuntimeLimiter)runtimeLimiter
{
  return self->_runtimeLimiter;
}

- (void)setRuntimeLimiter:(id)a3
{
}

- (_DASConfigurationLimiter)configurationLimiter
{
  return self->_configurationLimiter;
}

- (void)setConfigurationLimiter:(id)a3
{
}

- (_DASFeatureDurationTracker)featureDurationTracker
{
  return self->_featureDurationTracker;
}

- (void)setFeatureDurationTracker:(id)a3
{
}

- (NSMutableDictionary)recentlyLaunchedApps
{
  return self->_recentlyLaunchedApps;
}

- (void)setRecentlyLaunchedApps:(id)a3
{
}

- (NSCountedSet)launchesPerApp
{
  return self->_launchesPerApp;
}

- (void)setLaunchesPerApp:(id)a3
{
}

- (OS_dispatch_source)launchTimeResetTimer
{
  return self->_launchTimeResetTimer;
}

- (void)setLaunchTimeResetTimer:(id)a3
{
}

- (OS_dispatch_queue)launchQueue
{
  return self->_launchQueue;
}

- (void)setLaunchQueue:(id)a3
{
}

- (OS_dispatch_queue)groupMonitoringQueue
{
  return self->_groupMonitoringQueue;
}

- (void)setGroupMonitoringQueue:(id)a3
{
}

- (_DASBlueListManager)blueListManager
{
  return self->_blueListManager;
}

- (void)setBlueListManager:(id)a3
{
}

- (OS_dispatch_queue)activityLaunchQueue
{
  return self->_activityLaunchQueue;
}

- (void)setActivityLaunchQueue:(id)a3
{
}

- (_APRSManager)appResumeManager
{
  return self->_appResumeManager;
}

- (void)setAppResumeManager:(id)a3
{
}

- (_DASClosureManager)closureManager
{
  return self->_closureManager;
}

- (void)setClosureManager:(id)a3
{
}

- (_DASBudgetManager)budgetManager
{
  return self->_budgetManager;
}

- (void)setBudgetManager:(id)a3
{
}

- (_DASActivityDependencyManager)dependencyManager
{
  return self->_dependencyManager;
}

- (void)setDependencyManager:(id)a3
{
}

- (_DASAssertionArbiter)assertionArbiter
{
  return self->_assertionArbiter;
}

- (void)setAssertionArbiter:(id)a3
{
}

- (unint64_t)photosIsBlocked
{
  return self->_photosIsBlocked;
}

- (void)setPhotosIsBlocked:(unint64_t)a3
{
  self->_unint64_t photosIsBlocked = a3;
}

- (os_unfair_lock_s)constraintsLock
{
  return self->_constraintsLock;
}

- (void)setConstraintsLock:(os_unfair_lock_s)a3
{
  self->_constraintsLock = a3;
}

- (_CDContextualKeyPath)utilityConstraintsKP
{
  return self->_utilityConstraintsKP;
}

- (void)setUtilityConstraintsKP:(id)a3
{
}

- (_CDContextualKeyPath)maintenanceConstraintsKP
{
  return self->_maintenanceConstraintsKP;
}

- (void)setMaintenanceConstraintsKP:(id)a3
{
}

- (unint64_t)utilityConstraints
{
  return self->_utilityConstraints;
}

- (void)setUtilityConstraints:(unint64_t)a3
{
  self->_unint64_t utilityConstraints = a3;
}

- (unint64_t)maintenanceConstraints
{
  return self->_maintenanceConstraints;
}

- (void)setMaintenanceConstraints:(unint64_t)a3
{
  self->_unint64_t maintenanceConstraints = a3;
}

- (NSDictionary)testModeParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 496LL, 1);
}

- (void)setTestModeParameters:(id)a3
{
}

- (NSDictionary)pausedParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 504LL, 1);
}

- (void)setPausedParameters:(id)a3
{
}

- (NSUserDefaults)testingDefaults
{
  return self->_testingDefaults;
}

- (void)setTestingDefaults:(id)a3
{
}

- (NSMutableDictionary)activitiesWaitingForBGTaskClients
{
  return self->_activitiesWaitingForBGTaskClients;
}

- (void)setActivitiesWaitingForBGTaskClients:(id)a3
{
}

- (NSMutableDictionary)connectedBGTaskClients
{
  return self->_connectedBGTaskClients;
}

- (void)setConnectedBGTaskClients:(id)a3
{
}

- (NSMutableDictionary)powerAssertions
{
  return self->_powerAssertions;
}

- (void)setPowerAssertions:(id)a3
{
}

- (_DASTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (BOOL)recomEngineDisabled
{
  return self->_recomEngineDisabled;
}

- (void)setRecomEngineDisabled:(BOOL)a3
{
  self->_recomEngineDisabled = a3;
}

- (OS_xpc_object)prewarmInvalidationListener
{
  return self->_prewarmInvalidationListener;
}

- (void)setPrewarmInvalidationListener:(id)a3
{
}

- (NSMutableSet)prewarmInvalidationConnections
{
  return self->_prewarmInvalidationConnections;
}

- (void)setPrewarmInvalidationConnections:(id)a3
{
}

- (os_unfair_lock_s)prewarmInvalidationLock
{
  return self->_prewarmInvalidationLock;
}

- (void)setPrewarmInvalidationLock:(os_unfair_lock_s)a3
{
  self->_prewarmInvalidationLock = a3;
}

- (BOOL)taskRegistryMode
{
  return self->_taskRegistryMode;
}

- (void)setTaskRegistryMode:(BOOL)a3
{
  self->_BOOL taskRegistryMode = a3;
}

- (NSSet)taskRegistryProcesses
{
  return self->_taskRegistryProcesses;
}

- (void)setTaskRegistryProcesses:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_DASBARScheduler)barScheduler
{
  return self->_barScheduler;
}

- (void)setBarScheduler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end