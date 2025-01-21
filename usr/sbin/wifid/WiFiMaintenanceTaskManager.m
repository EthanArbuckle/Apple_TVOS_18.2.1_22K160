@interface WiFiMaintenanceTaskManager
+ (id)sharedWiFiMaintenanceTaskManager;
- (AnalyticsWorkspace)symptomsAnalyticsWorkspace;
- (NetworkPerformanceFeed)symptomsNetworkHistoryFeed;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)serialQForNetworkPerformanceFeed;
- (WiFiMaintenanceTaskManager)init;
- (__WiFiManager)wifiManager;
- (void)dealloc;
- (void)networkPerformanceFeedSync;
- (void)schedule3BarsObserver;
- (void)scheduleHistoricNetworkPerformanceFeedSync;
- (void)scheduleOrphanedSetsCleanUp;
- (void)scheduleOutdatedListEntriesCleanUp;
- (void)schedulePNLMigration;
- (void)scheduleWCADownloadObserver;
- (void)setQueue:(id)a3;
- (void)setSerialQForNetworkPerformanceFeed:(id)a3;
- (void)setSymptomsAnalyticsWorkspace:(id)a3;
- (void)setSymptomsNetworkHistoryFeed:(id)a3;
- (void)setWifiManager:(__WiFiManager *)a3;
- (void)unSchedule3BarsObserver;
- (void)unScheduleHistoricNetworkPerformanceFeedSync;
- (void)unScheduleOrphanedSetsCleanUp;
- (void)unScheduleOutdatedListEntriesCleanUp;
- (void)unSchedulePNLMigration;
- (void)unScheduleWCADownloadObserver;
- (void)unscheduleFromQueue:(id)a3;
@end

@implementation WiFiMaintenanceTaskManager

+ (id)sharedWiFiMaintenanceTaskManager
{
  if (qword_100219858 != -1) {
    dispatch_once(&qword_100219858, &stru_1001E2DB0);
  }
  return (id)qword_100219850;
}

- (void)dealloc
{
  serialQForNetworkPerformanceFeed = (dispatch_object_s *)self->_serialQForNetworkPerformanceFeed;
  if (serialQForNetworkPerformanceFeed) {
    dispatch_release(serialQForNetworkPerformanceFeed);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___WiFiMaintenanceTaskManager;
  -[WiFiMaintenanceTaskManager dealloc](&v4, "dealloc");
}

- (WiFiMaintenanceTaskManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___WiFiMaintenanceTaskManager;
  v2 = -[WiFiMaintenanceTaskManager init](&v10, "init");
  if (v2)
  {
    if (!objc_opt_class(&OBJC_CLASS___AnalyticsWorkspace)) {
      return 0LL;
    }
    v3 = objc_alloc(&OBJC_CLASS___AnalyticsWorkspace);
    objc_super v4 = (AnalyticsWorkspace *)-[AnalyticsWorkspace initWorkspaceWithService:]( v3,  "initWorkspaceWithService:",  kSymptomAnalyticsServiceEndpoint);
    v2->_symptomsAnalyticsWorkspace = v4;
    if (v4)
    {
      if (!objc_opt_class(&OBJC_CLASS___NetworkPerformanceFeed)) {
        return 0LL;
      }
      v5 = -[NetworkPerformanceFeed initWithWorkspace:]( objc_alloc(&OBJC_CLASS___NetworkPerformanceFeed),  "initWithWorkspace:",  v2->_symptomsAnalyticsWorkspace);
      v2->_symptomsNetworkHistoryFeed = v5;
      if (v5)
      {
        v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v7 = dispatch_queue_create("com.apple.wifid.networkStoreController.symptomsReplyQ", v6);
        v2->_serialQForNetworkPerformanceFeed = (OS_dispatch_queue *)v7;
        if (v7)
        {
          -[NetworkPerformanceFeed setQueue:]( -[WiFiMaintenanceTaskManager symptomsNetworkHistoryFeed](v2, "symptomsNetworkHistoryFeed"),  "setQueue:",  -[WiFiMaintenanceTaskManager serialQForNetworkPerformanceFeed](v2, "serialQForNetworkPerformanceFeed"));
          return v2;
        }

        return 0LL;
      }

      v9 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"%s: Failed in initWithWorkspace" message:3];
      }
    }

    else
    {
      v9 = objc_autoreleasePoolPush();
      if (qword_100219F60) {
        [qword_100219F60 WFLog:@"Failed in initWorkspaceWithService!"];
      }
    }

    objc_autoreleasePoolPop(v9);
    return 0LL;
  }

  return v2;
}

- (void)unscheduleFromQueue:(id)a3
{
}

- (void)unScheduleOrphanedSetsCleanUp
{
  v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s",  "-[WiFiMaintenanceTaskManager unScheduleOrphanedSetsCleanUp]");
  }
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.OrphanedSetsCleanUpActivity");
}

- (void)scheduleOrphanedSetsCleanUp
{
  v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"-[WiFiMaintenanceTaskManager scheduleOrphanedSetsCleanUp]"];
  }
  objc_autoreleasePoolPop(v3);
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_30_MIN);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100024C74;
  handler[3] = &unk_1001E2DD8;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.OrphanedSetsCleanUpActivity", v4, handler);
  xpc_release(v4);
}

- (void)unScheduleOutdatedListEntriesCleanUp
{
  v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"-[WiFiMaintenanceTaskManager unScheduleOutdatedListEntriesCleanUp]"];
  }
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.OutdatedListEntriesCleanUpActivity");
}

- (void)scheduleOutdatedListEntriesCleanUp
{
  v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"-[WiFiMaintenanceTaskManager scheduleOutdatedListEntriesCleanUp]"];
  }
  objc_autoreleasePoolPop(v3);
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_8_HOURS);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100024FB8;
  handler[3] = &unk_1001E2DD8;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.OutdatedListEntriesCleanUpActivity", v4, handler);
  xpc_release(v4);
}

- (void)schedule3BarsObserver
{
  v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s",  "-[WiFiMaintenanceTaskManager schedule3BarsObserver]");
  }
  objc_autoreleasePoolPop(v3);
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_PREVENT_DEVICE_SLEEP, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000252E0;
  handler[3] = &unk_1001E2DD8;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.3BarsObserverActivity", v4, handler);
  xpc_release(v4);
}

- (void)unSchedule3BarsObserver
{
  v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s",  "-[WiFiMaintenanceTaskManager unSchedule3BarsObserver]");
  }
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.3BarsObserverActivity");
}

- (void)unSchedulePNLMigration
{
  v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s",  "-[WiFiMaintenanceTaskManager unSchedulePNLMigration]");
  }
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.ListMigrationActivity");
}

- (void)schedulePNLMigration
{
  v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"-[WiFiMaintenanceTaskManager schedulePNLMigration]" message:3];
  }
  objc_autoreleasePoolPop(v3);
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_30_MIN);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000256AC;
  handler[3] = &unk_1001E2DD8;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.ListMigrationActivity", v4, handler);
  xpc_release(v4);
}

- (void)unScheduleHistoricNetworkPerformanceFeedSync
{
  v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"-[WiFiMaintenanceTaskManager unScheduleHistoricNetworkPerformanceFeedSync]"];
  }
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.HistoricNetworkPerformanceFeedActivity");
}

- (void)scheduleHistoricNetworkPerformanceFeedSync
{
  v3 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s",  "-[WiFiMaintenanceTaskManager scheduleHistoricNetworkPerformanceFeedSync]");
  }
  objc_autoreleasePoolPop(v3);
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_INTERVAL, 10080 * XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_int64(v4, XPC_ACTIVITY_GRACE_PERIOD, (uint64_t)((double)XPC_ACTIVITY_INTERVAL_1_MIN * 720.0));
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100025A08;
  handler[3] = &unk_1001E2DD8;
  handler[4] = self;
  xpc_activity_register("com.apple.wifimanager.HistoricNetworkPerformanceFeedActivity", v4, handler);
  xpc_release(v4);
}

- (void)networkPerformanceFeedSync
{
  context = objc_autoreleasePoolPush();
  id v2 = [WiFiAnalyticsManager sharedWiFiAnalyticsManager] copyAllStoredNetworkSsids];
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  xpc_object_t v4 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: step 1 - syncing scores for %d networks",  "-[WiFiMaintenanceTaskManager networkPerformanceFeedSync]",  objc_msgSend(v2, "count"));
  }
  objc_autoreleasePoolPop(v4);
  v5 = dispatch_semaphore_create(0LL);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = [v2 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = kSymptomAnalyticsServiceNetworkAttachmentHistorical;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        id v11 = v3;
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v2);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        uint64_t v24 = v9;
        uint64_t v25 = v12;
        v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL);
        v14 = objc_autoreleasePoolPush();
        if (qword_100219F60) {
          [(id)qword_100219F60 WFLog:3, "%s: step 2 - getting perf feed for %@", "-[WiFiMaintenanceTaskManager networkPerformanceFeedSync]", v12 message];
        }
        objc_autoreleasePoolPop(v14);
        v15 = -[WiFiMaintenanceTaskManager symptomsNetworkHistoryFeed](self, "symptomsNetworkHistoryFeed");
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_100025D3C;
        v19[3] = &unk_1001E2E00;
        v19[4] = v13;
        v19[5] = v12;
        id v3 = v11;
        v19[6] = v11;
        v19[7] = v5;
        if (-[NetworkPerformanceFeed fullScorecardFor:options:reply:]( v15,  "fullScorecardFor:options:reply:",  1LL,  v13,  v19)) {
          dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
        }
      }

      id v7 = [v2 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v7);
  }

  if ([v3 count])
  {
    v16 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s: step 3 - Submit syncd network performance feed for %d networks",  "-[WiFiMaintenanceTaskManager networkPerformanceFeedSync]",  objc_msgSend(v3, "count"));
    }
    objc_autoreleasePoolPop(v16);
    sub_100037DA4((uint64_t)v3);
  }

  dispatch_release(v5);
  if (v2) {
    CFRelease(v2);
  }
  objc_autoreleasePoolPop(context);
}

- (void)scheduleWCADownloadObserver
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 0);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_activity_register("com.apple.wifimanager.wcaDownloadActivity", v2, &stru_1001E2E40);
  xpc_release(v2);
}

- (void)unScheduleWCADownloadObserver
{
  xpc_object_t v2 = objc_autoreleasePoolPush();
  if (qword_100219F60) {
    [qword_100219F60 WFLog:@"-[WiFiMaintenanceTaskManager unScheduleWCADownloadObserver]" message:3];
  }
  objc_autoreleasePoolPop(v2);
  xpc_activity_unregister("com.apple.wifimanager.wcaDownloadActivity");
}

- (__WiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(__WiFiManager *)a3
{
  self->_wifiManager = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (AnalyticsWorkspace)symptomsAnalyticsWorkspace
{
  return self->_symptomsAnalyticsWorkspace;
}

- (void)setSymptomsAnalyticsWorkspace:(id)a3
{
}

- (NetworkPerformanceFeed)symptomsNetworkHistoryFeed
{
  return self->_symptomsNetworkHistoryFeed;
}

- (void)setSymptomsNetworkHistoryFeed:(id)a3
{
}

- (OS_dispatch_queue)serialQForNetworkPerformanceFeed
{
  return self->_serialQForNetworkPerformanceFeed;
}

- (void)setSerialQForNetworkPerformanceFeed:(id)a3
{
}

@end