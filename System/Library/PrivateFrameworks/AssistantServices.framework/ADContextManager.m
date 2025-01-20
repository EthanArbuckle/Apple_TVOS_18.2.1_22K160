@interface ADContextManager
- (ADContextManager)initWithDelegate:(id)a3;
- (ADContextManagerDelegate)delegate;
- (ADLocalContextStore)localContextStore;
- (ADRemoteContextStore)remoteContextStore;
- (BOOL)_inlineUpdateCurrentHomeKitHome;
- (BOOL)_inlineUpdatePhoneState;
- (BOOL)_isCollectingContext;
- (BOOL)alertContextIsDirty;
- (BOOL)backgroundContextIsDirty;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)queue;
- (id)_alarmAceObjectFromAlarm:(id)a3 withProximity:(int64_t)a4 inDeviceContext:(id)a5;
- (id)_appInfoWithBundleID:(id)a3;
- (id)_configuredContextLink;
- (id)_configuredLocalContextStoreWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5;
- (id)_configuredRemoteContextStoreWithRapportLink:(id)a3 queue:(id)a4;
- (id)_contextLinkMessageOptions;
- (id)_dataSourceInfoWithProximity:(int64_t)a3 deviceContext:(id)a4;
- (id)_filteredApplicationInfosForLockedStark:(id)a3;
- (id)_initWithDelegate:(id)a3 deviceCircleManager:(id)a4 deviceProximityManager:(id)a5;
- (id)_makeUserTokenStatusWithICTokenStatus:(id)a3 icError:(id)a4;
- (id)_timerAceObjectFromTimer:(id)a3 withProximity:(int64_t)a4 inDeviceContext:(id)a5;
- (id)localContextWithPrivacyClass:(int64_t)a3;
- (void)_addDeviceContextConnection:(id)a3;
- (void)_callStateDidChange:(id)a3;
- (void)_cancelNowPlayingCoalescingTimer;
- (void)_enumerateDeviceContextConnectionsUsingBlock:(id)a3;
- (void)_fetchContextSnapshotForCurrentRequest;
- (void)_getBackgroundContext:(id)a3;
- (void)_getCurrentUserActivityOnQueue:(id)a3 completion:(id)a4;
- (void)_getDevicesWithContexts:(id)a3 passingTest:(id)a4 capabilitesPassingTest:(id)a5 completion:(id)a6;
- (void)_getNowPlayingMediaIsResumable:(id)a3;
- (void)_handleAggregateContextFetchWithMessage:(id)a3 fromDeviceWithPeerInfo:(id)a4 completion:(id)a5;
- (void)_handleContextSnapshotPush:(id)a3 completion:(id)a4;
- (void)_handleDeviceProblemsChangedWithToken:(int)a3;
- (void)_handleHomeAnnouncementSnapshotUpdate:(id)a3;
- (void)_handlePushContextMessage:(id)a3 fromDeviceWithPeerInfo:(id)a4 completion:(id)a5;
- (void)_initialize;
- (void)_logContextCollectorFetchEnded:(id)a3 numDeviceContextsFetched:(unint64_t)a4;
- (void)_logContextCollectorFetchFailed:(id)a3;
- (void)_logContextCollectorFetchStarted:(id)a3;
- (void)_logFetchLocalContextEnded:(id)a3;
- (void)_logFetchLocalContextStarted:(id)a3;
- (void)_logForceFetchContextEndedWithHALMetricsId:(id)a3 contextId:(id)a4 forceFetchCount:(unint64_t)a5;
- (void)_logForceFetchContextFailedWithHALMetricsId:(id)a3 contextId:(id)a4 error:(id)a5;
- (void)_logForceFetchContextStartedWithHALMetricsId:(id)a3 contextId:(id)a4 timestamp:(unint64_t)a5;
- (void)_logForceFetchWithStartTime:(unint64_t)a3 forceFetchCount:(unint64_t)a4 forceFetchError:(id)a5 halMetricsId:(id)a6;
- (void)_playbackDevicesDidChange:(id)a3;
- (void)_reallyUpdateBackgroundContextIfNowPlayingInfoChangedForReason:(id)a3;
- (void)_registerForBGUpdates;
- (void)_removeDeviceContextConnection:(id)a3;
- (void)_resetContextLinkAndReconnectNow:(BOOL)a3;
- (void)_scheduleNowPlayingRefreshForReason:(id)a3 isPlaying:(id)a4;
- (void)_setCollectingContext:(BOOL)a3;
- (void)_setDelegate:(id)a3;
- (void)_startPeriodicContextFetchFromNearbyDevices;
- (void)_stopPeriodicContextFetchFromNearbyDevices;
- (void)_unregisterForBGUpdates;
- (void)_updateBackgroundContextIfMusicPersonalizationTokenChanged;
- (void)_updateDeviceProblemsWithContext:(id)a3 token:(int)a4 completion:(id)a5;
- (void)_updateHomeAnnouncementWithContext:(id)a3 supplementalSnapshot:(id)a4 completion:(id)a5;
- (void)_updateMultiUserPersonalizationTokensWithSingleUserTokenChanged:(BOOL)a3 completion:(id)a4;
- (void)_updateMusicPersonalizationTokenWithContext:(id)a3 completion:(id)a4;
- (void)_updateNavStatusWithContext:(id)a3 completion:(id)a4;
- (void)_updateNowPlayingInfoWithContext:(id)a3 completion:(id)a4;
- (void)_updatePlaybackDevicesWithContext:(id)a3 completion:(id)a4;
- (void)_updateSimpleThingsWithContext:(id)a3 completion:(id)a4;
- (void)_updateSingleUserMusicPersonalizationTokenFromKeychainWithCompletion:(id)a3;
- (void)clearAlertContextDirtyState;
- (void)clearBackgroundContextDirtyState;
- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4;
- (void)dealloc;
- (void)deviceContextConnection:(id)a3 donateSerializedContextMapByPrivacyClass:(id)a4 withMetadataMap:(id)a5 forType:(id)a6 pushToRemote:(BOOL)a7 completion:(id)a8;
- (void)deviceContextConnection:(id)a3 getLocalDeviceContextWithCompletion:(id)a4;
- (void)deviceContextConnectionDidInvalidate:(id)a3;
- (void)getAlertContextWithBulletins:(id)a3 externalAlarmSnapshot:(id)a4 timerSnapshot:(id)a5 nlAlertContextCompletion:(id)a6 fullAlertContextCompletion:(id)a7;
- (void)getAppContextForDeviceState:(int64_t)a3 applicationInfos:(id)a4 completion:(id)a5;
- (void)getBackgroundContext:(id)a3;
- (void)getContextIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 timeOut:(double)a5 completion:(id)a6;
- (void)getContextIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 timeOut:(double)a5 localContextCompletion:(id)a6 completion:(id)a7;
- (void)getContextSnapshotForCurrentRequestWithCompletion:(id)a3;
- (void)getContextSnapshotForForeignRequestID:(id)a3 completion:(id)a4;
- (void)getDeviceContextsForKeys:(id)a3 forForeignRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6;
- (void)getDomainObjectFromMessageContext:(id)a3 completion:(id)a4;
- (void)getLocalContextWithPrivacyClass:(int64_t)a3 completion:(id)a4;
- (void)getNowPlayingMediaIsResumable:(id)a3;
- (void)keepReportingNowPlayingTimingEventsHeuristically;
- (void)localContextStore:(id)a3 didUpdateDeviceContext:(id)a4;
- (void)markBulletinAsAcknolwedgedForDomainObject:(id)a3;
- (void)navStatusDidChange:(id)a3;
- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6;
- (void)nowPlayingObserverNowPlayingInfoDidChange:(id)a3;
- (void)preheatBackgroundContext;
- (void)pushContextSnapshotForCurrentRequestWithID:(id)a3 toDevice:(id)a4;
- (void)pushMyriadAdvertisementContextToContextCollector:(id)a3 completion:(id)a4;
- (void)pushSCDAAdvertisementContextToContextCollector:(id)a3 completion:(id)a4;
- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7;
- (void)rapportLinkDidInterrupt:(id)a3;
- (void)rapportLinkDidInvalidate:(id)a3;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)reset;
- (void)setAlertContextDirty;
- (void)setBackgroundContextDirty;
- (void)setDelegate:(id)a3;
- (void)updateBackgroundContextIfHomeKitInfoChanged;
- (void)updateBackgroundContextIfNowPlayingInfoChanged;
@end

@implementation ADContextManager

- (ADContextManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceProximityManager sharedManager](&OBJC_CLASS___ADDeviceProximityManager, "sharedManager"));
  v7 = -[ADContextManager _initWithDelegate:deviceCircleManager:deviceProximityManager:]( self,  "_initWithDelegate:deviceCircleManager:deviceProximityManager:",  v4,  v5,  v6);

  return v7;
}

- (id)_initWithDelegate:(id)a3 deviceCircleManager:(id)a4 deviceProximityManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___ADContextManager;
  v11 = -[ADContextManager init](&v59, "init");
  if (v11)
  {
    v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v61 = "-[ADContextManager _initWithDelegate:deviceCircleManager:deviceProximityManager:]";
      __int16 v62 = 2048;
      v63 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }

    if (qword_100577D00 != -1) {
      dispatch_once(&qword_100577D00, &stru_1004F13B0);
    }
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v11->_deviceCircleManager, a4);
    objc_storeStrong((id *)&v11->_deviceProximityManager, a5);
    -[ADContextManager _initialize](v11, "_initialize");
    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_t v15 = dispatch_queue_create("BackgroundContextQueue", v14);
    bgContextQueue = v11->_bgContextQueue;
    v11->_bgContextQueue = (OS_dispatch_queue *)v15;

    *(void *)&v11->_deviceProblemsRegistrationToken = -1LL;
    -[ADContextManager keepReportingNowPlayingTimingEventsHeuristically]( v11,  "keepReportingNowPlayingTimingEventsHeuristically");
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);

    dispatch_queue_t v21 = dispatch_queue_create("ContextQueue", v20);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v21;

    dispatch_queue_attr_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v23);
    dispatch_queue_attr_t v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_BACKGROUND, 0);
    v26 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v25);

    dispatch_queue_t v27 = dispatch_queue_create("com.apple.assistant.MetricsQueue", v26);
    metricsQueue = v11->_metricsQueue;
    v11->_metricsQueue = (OS_dispatch_queue *)v27;

    uint64_t v29 = objc_claimAutoreleasedReturnValue(+[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext"));
    instanceContext = v11->_instanceContext;
    v11->_instanceContext = (AFInstanceContext *)v29;

    v31 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    contextSnapshotsReadUUIDs = v11->_contextSnapshotsReadUUIDs;
    v11->_contextSnapshotsReadUUIDs = v31;

    uint64_t v33 = objc_claimAutoreleasedReturnValue(-[ADContextManager _configuredContextLink](v11, "_configuredContextLink"));
    rapportLink = v11->_rapportLink;
    v11->_rapportLink = (ADRapportLink *)v33;

    -[ADRapportLink addListener:](v11->_rapportLink, "addListener:", v11);
    uint64_t v35 = objc_claimAutoreleasedReturnValue( -[ADContextManager _configuredRemoteContextStoreWithRapportLink:queue:]( v11,  "_configuredRemoteContextStoreWithRapportLink:queue:",  v11->_rapportLink,  v11->_queue));
    remoteContextStore = v11->_remoteContextStore;
    v11->_remoteContextStore = (ADRemoteContextStore *)v35;

    v37 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
    [v37 addListener:v11];

    -[ADDeviceCircleManager addListener:](v11->_deviceCircleManager, "addListener:", v11);
    deviceCircleManager = v11->_deviceCircleManager;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_1000FAC7C;
    v57[3] = &unk_1004F46C8;
    v39 = v11;
    v58 = v39;
    -[ADDeviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:]( deviceCircleManager,  "getContextCollectorDeviceIdentifiersWithCompletion:",  v57);
    uint64_t v40 = objc_claimAutoreleasedReturnValue( [v39 _configuredLocalContextStoreWithInstanceContext:v11->_instanceContext rapportLink:v11->_rapportLink queue:v11->_queue]);
    id v41 = v39[31];
    v39[31] = (id)v40;

    if (+[AFFeatureFlags isAnnounceEnabled](&OBJC_CLASS___AFFeatureFlags, "isAnnounceEnabled"))
    {
      v42 = -[ADHomeAnnouncementContextAdaptor initWithInstanceContext:]( objc_alloc(&OBJC_CLASS___ADHomeAnnouncementContextAdaptor),  "initWithInstanceContext:",  v11->_instanceContext);
      id v43 = v39[13];
      v39[13] = v42;
    }

    uint64_t v44 = objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( v11->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantDeviceContextServiceName));
    id v45 = v39[28];
    v39[28] = (id)v44;

    [v39[28] setDelegate:v39];
    [v39[28] _setQueue:v11->_queue];
    [v39[28] resume];
    v46 = v11->_queue;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_1000FACF4;
    v55[3] = &unk_1004FBBD0;
    v56 = v46;
    v48 = v46;
    [v47 addQueue:v48 heartBeatInterval:v55 timeoutInterval:5.0 timeoutHandler:5.0];

    v49 = v11->_bgContextQueue;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_1000FAE0C;
    v53[3] = &unk_1004FBBD0;
    v54 = v49;
    v51 = v49;
    [v50 addQueue:v51 heartBeatInterval:v53 timeoutInterval:5.0 timeoutHandler:5.0];
  }

  return v11;
}

- (id)_configuredLocalContextStoreWithInstanceContext:(id)a3 rapportLink:(id)a4 queue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = -[ADLocalContextStore initWithInstanceContext:rapportLink:queue:delegate:]( objc_alloc(&OBJC_CLASS___ADLocalContextStore),  "initWithInstanceContext:rapportLink:queue:delegate:",  v10,  v9,  v8,  self);

  return v11;
}

- (id)_configuredRemoteContextStoreWithRapportLink:(id)a3 queue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[ADRemoteContextStore initWithRapportLink:queue:]( objc_alloc(&OBJC_CLASS___ADRemoteContextStore),  "initWithRapportLink:queue:",  v6,  v5);

  return v7;
}

- (id)_configuredContextLink
{
  int v3 = AFSupportsHALOnDemandRapportConnection(self, a2);
  char v4 = v3;
  uint64_t v5 = 1LL;
  if (!v3) {
    uint64_t v5 = 2LL;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000FAA0C;
  v10[3] = &unk_1004F0CB8;
  v10[4] = v5;
  char v11 = v3;
  id v6 = +[ADRapportLinkConfiguration newWithBuilder:](&OBJC_CLASS___ADRapportLinkConfiguration, "newWithBuilder:", v10);
  v7 = -[ADRapportLink initWithQueue:configuration:]( objc_alloc(&OBJC_CLASS___ADRapportLink),  "initWithQueue:configuration:",  self->_queue,  v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADContextManager _contextLinkMessageOptions](self, "_contextLinkMessageOptions"));
  -[ADRapportLink registerRequestID:options:]( v7,  "registerRequestID:options:",  @"com.apple.siri.rapport-link.request.generic",  v8);
  if ((v4 & 1) == 0)
  {
    -[ADRapportLink setRequestHandler:forRequestID:messageType:]( v7,  "setRequestHandler:forRequestID:messageType:",  self,  @"com.apple.siri.rapport-link.request.generic",  @"context_push");
    -[ADRapportLink setRequestHandler:forRequestID:messageType:]( v7,  "setRequestHandler:forRequestID:messageType:",  self,  @"com.apple.siri.rapport-link.request.generic",  @"agg_context_fetch");
    -[ADRapportLink setRequestHandler:forRequestID:messageType:]( v7,  "setRequestHandler:forRequestID:messageType:",  self,  @"com.apple.siri.rapport-link.request.generic",  @"context_snapshot_push");
    -[ADRapportLink activateWithCompletion:](v7, "activateWithCompletion:", &stru_1004F0CD8);
  }

  return v7;
}

- (id)_contextLinkMessageOptions
{
  uint64_t v3 = RPOptionStatusFlags;
  char v4 = &off_100513228;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

- (void)reset
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADContextManager reset]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000FAA04;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(bgContextQueue, block);
}

- (void)_initialize
{
  uint64_t v3 = (AFAnalytics *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  analytics = self->_analytics;
  self->_analytics = v3;

  *(_WORD *)&self->_alertContextIsDirty = 257;
  bgContext = self->_bgContext;
  self->_bgContext = 0LL;
}

- (void)_setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj) {
      -[ADContextManager _registerForBGUpdates](self, "_registerForBGUpdates");
    }
    else {
      -[ADContextManager _unregisterForBGUpdates](self, "_unregisterForBGUpdates");
    }
    uint64_t v5 = obj;
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000FA9F8;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(bgContextQueue, v7);
}

- (void)dealloc
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[ADContextManager dealloc]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  -[ADContextManager _cancelNowPlayingCoalescingTimer](self, "_cancelNowPlayingCoalescingTimer");
  -[ADContextManager _unregisterForBGUpdates](self, "_unregisterForBGUpdates");
  -[ADHomeAnnouncementContextAdaptor invalidate](self->_homeAnnouncementContextAdaptor, "invalidate");
  homeAnnouncementContextAdaptor = self->_homeAnnouncementContextAdaptor;
  self->_homeAnnouncementContextAdaptor = 0LL;

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADContextManager;
  -[ADContextManager dealloc](&v5, "dealloc");
}

- (void)keepReportingNowPlayingTimingEventsHeuristically
{
  uint64_t v3 = mach_absolute_time();
  self->_ignoreNowPlayingUpdatesAfterTimestamp = AFMachAbsoluteTimeAddTimeInterval(v3, 30.0);
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADContextManager keepReportingNowPlayingTimingEventsHeuristically]";
    __int16 v7 = 2048;
    uint64_t v8 = 0x403E000000000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Recording performance numbers on NowPlaying updates for %g seconds",  (uint8_t *)&v5,  0x16u);
  }

- (void)setAlertContextDirty
{
  self->_alertContextIsDirty = 1;
}

- (BOOL)alertContextIsDirty
{
  return self->_alertContextIsDirty;
}

- (void)clearAlertContextDirtyState
{
  self->_alertContextIsDirty = 0;
}

- (void)setBackgroundContextDirty
{
  self->_bgContextIsDirty = 1;
}

- (BOOL)backgroundContextIsDirty
{
  return self->_bgContextIsDirty;
}

- (void)clearBackgroundContextDirtyState
{
  self->_bgContextIsDirty = 0;
}

- (id)_filteredApplicationInfosForLockedStark:(id)a3
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier", (void)v14));
      unsigned __int8 v10 = [v9 isEqualToString:@"com.apple.Maps"];

      if ((v10 & 1) != 0) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v12 = v8;

    if (v12)
    {
      id v18 = v12;
      char v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
      goto LABEL_12;
    }

    char v11 = 0LL;
  }

  else
  {
LABEL_9:
    char v11 = 0LL;
    id v12 = v3;
LABEL_12:
  }

  return v11;
}

- (id)_appInfoWithBundleID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SAAppInfo);
  id v5 = objc_alloc_init(&OBJC_CLASS___SASyncAppIdentifyingInfo);
  [v5 setBundleId:v3];

  [v4 setAppIdentifyingInfo:v5];
  return v4;
}

- (void)getAppContextForDeviceState:(int64_t)a3 applicationInfos:(id)a4 completion:(id)a5
{
  char v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((v6 & 1) != 0)
  {
    if ((v6 & 2) != 0) {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( -[ADContextManager _filteredApplicationInfosForLockedStark:]( self,  "_filteredApplicationInfosForLockedStark:",  v8));
    }
    else {
      uint64_t v10 = 0LL;
    }

    id v8 = (id)v10;
  }

  dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
  dispatch_queue_t v13 = dispatch_queue_create("ContextCollation", v12);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000F9E68;
  v17[3] = &unk_1004FDA30;
  id v18 = v8;
  dispatch_queue_t v19 = v13;
  v20 = self;
  id v21 = v9;
  id v14 = v9;
  __int128 v15 = v13;
  id v16 = v8;
  dispatch_async(v15, v17);
}

- (void)_getCurrentUserActivityOnQueue:(id)a3 completion:(id)a4
{
  id v5 = (dispatch_queue_s *)a3;
  id v6 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x3032000000LL;
  v20[3] = sub_1000F15F0;
  v20[4] = sub_1000F1600;
  id v21 = 0LL;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3032000000LL;
  v18[3] = sub_1000F15F0;
  v18[4] = sub_1000F1600;
  id v19 = 0LL;
  uint64_t v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000F9848;
  v14[3] = &unk_1004F0DB8;
  id v8 = v7;
  __int128 v15 = v8;
  id v16 = v20;
  __int128 v17 = v18;
  if ((+[NSUserActivity _currentUserActivityUUIDWithOptions:completionHandler:]( &OBJC_CLASS___NSUserActivity,  "_currentUserActivityUUIDWithOptions:completionHandler:",  0LL,  v14) & 1) == 0) {
    dispatch_group_leave(v8);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000F9A60;
  v10[3] = &unk_1004F0DE0;
  id v11 = v6;
  id v12 = v20;
  dispatch_queue_t v13 = v18;
  id v9 = v6;
  dispatch_group_notify(v8, v5, v10);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

- (void)getAlertContextWithBulletins:(id)a3 externalAlarmSnapshot:(id)a4 timerSnapshot:(id)a5 nlAlertContextCompletion:(id)a6 fullAlertContextCompletion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v43 = a7;
  __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v16 = dispatch_group_create();
  __int128 v17 = dispatch_group_create();
  dispatch_group_enter(v16);
  dispatch_group_enter(v17);
  id v18 = sub_1000F8FA8();
  id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v18);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F8FE8;
  block[3] = &unk_1004FD470;
  id v61 = v11;
  v20 = v15;
  __int16 v62 = v20;
  id v21 = v16;
  v63 = v21;
  v22 = v17;
  v64 = v22;
  id v44 = v11;
  dispatch_async(v19, block);

  dispatch_queue_attr_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  dispatch_group_enter(v21);
  dispatch_group_enter(v22);
  id v25 = sub_1000F8FA8();
  v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v25);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_1000F9264;
  v51[3] = &unk_1004F3448;
  id v52 = v12;
  v53 = self;
  v54 = v23;
  id v55 = v13;
  v56 = v24;
  dispatch_queue_t v27 = v20;
  v57 = v27;
  v58 = v21;
  objc_super v59 = v22;
  v28 = v22;
  uint64_t v29 = v21;
  v42 = v24;
  id v40 = v13;
  v30 = v23;
  id v31 = v12;
  dispatch_async(v26, v51);

  id v32 = sub_1000F8FA8();
  uint64_t v33 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v32);
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1000F9510;
  v48[3] = &unk_1004FD990;
  v34 = v27;
  v49 = v34;
  id v50 = v14;
  id v35 = v14;
  dispatch_group_notify(v29, v33, v48);

  id v36 = sub_1000F8FA8();
  v37 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v36);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1000F957C;
  v45[3] = &unk_1004FD990;
  v46 = v34;
  id v47 = v43;
  id v38 = v43;
  v39 = v34;
  dispatch_group_notify(v28, v37, v45);
}

- (void)markBulletinAsAcknolwedgedForDomainObject:(id)a3
{
  id v4 = a3;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___SAPhoneVoiceMail);
  objc_opt_isKindOfClass(v4, v3);
}

- (void)getDomainObjectFromMessageContext:(id)a3 completion:(id)a4
{
  id v13 = (void (**)(id, void *))a4;
  if (v13)
  {
    id v7 = a3;
    uint64_t DomainObjectsFromContext = AFMessagesGetDomainObjectsFromContext(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(DomainObjectsFromContext);

    v13[2](v13, v9);
  }

  else
  {
    id v10 = a3;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"ADContextManager.m", 891, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    uint64_t v12 = AFMessagesGetDomainObjectsFromContext(v10);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }
}

- (void)getNowPlayingMediaIsResumable:(id)a3
{
  id v4 = a3;
  bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F8F9C;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(bgContextQueue, v7);
}

- (void)_getNowPlayingMediaIsResumable:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ADContextManager _getNowPlayingMediaIsResumable:]";
    __int16 v7 = 2080;
    id v8 = "-[ADContextManager _getNowPlayingMediaIsResumable:]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s %s is not yet supported on this platform",  (uint8_t *)&v5,  0x16u);
  }

  if (v3) {
    v3[2](v3, 0LL);
  }
}

- (void)getContextIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 timeOut:(double)a5 completion:(id)a6
{
}

- (void)getContextIncludingKeys:(id)a3 excludingMandatoryKeys:(id)a4 timeOut:(double)a5 localContextCompletion:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 componentsSeparatedByString:@"-"]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);

  v20 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    id v31 = "-[ADContextManager getContextIncludingKeys:excludingMandatoryKeys:timeOut:localContextCompletion:completion:]";
    __int16 v32 = 2112;
    uint64_t v33 = v19;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2112;
    id v37 = v13;
    __int16 v38 = 2048;
    double v39 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s #hal (%@) includedKeys: %@, excludedKeys: %@, timeOut: %f",  buf,  0x34u);
  }

  kdebug_trace(722470324LL, 0LL, 0LL, 0LL, 0LL);
  if (v15)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F8010;
    block[3] = &unk_1004F0E80;
    id v23 = v19;
    v24 = self;
    id v27 = v15;
    double v29 = a5;
    id v28 = v14;
    id v25 = v12;
    id v26 = v13;
    dispatch_async(queue, block);
  }
}

- (void)getLocalContextWithPrivacyClass:(int64_t)a3 completion:(id)a4
{
  if (a4) {
    -[ADLocalContextStore getLocalContextWithPrivacyClass:completion:]( self->_localContextStore,  "getLocalContextWithPrivacyClass:completion:",  a3);
  }
}

- (id)localContextWithPrivacyClass:(int64_t)a3
{
  return -[ADLocalContextStore localContextWithPrivacyClass:]( self->_localContextStore,  "localContextWithPrivacyClass:",  a3);
}

- (void)getDeviceContextsForKeys:(id)a3 forForeignRequestID:(id)a4 includesNearbyDevices:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v28 = "-[ADContextManager getDeviceContextsForKeys:forForeignRequestID:includesNearbyDevices:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s #hal", buf, 0xCu);
  }

  if (v12)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000F7520;
    v23[3] = &unk_1004F0ED0;
    BOOL v26 = v7;
    v23[4] = self;
    id v24 = v10;
    id v25 = v12;
    id v14 = objc_retainBlock(v23);
    id v15 = v14;
    if (v11)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000F7764;
      v21[3] = &unk_1004FC5F0;
      v22 = v14;
      -[ADContextManager getContextSnapshotForForeignRequestID:completion:]( self,  "getContextSnapshotForForeignRequestID:completion:",  v11,  v21);
      id v16 = v22;
    }

    else if (v7)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000F7770;
      v19[3] = &unk_1004FD6C8;
      v19[4] = self;
      v20 = v14;
      -[ADContextManager getContextSnapshotForCurrentRequestWithCompletion:]( self,  "getContextSnapshotForCurrentRequestWithCompletion:",  v19);
      id v16 = v20;
    }

    else
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000F7804;
      v17[3] = &unk_1004F5730;
      void v17[4] = self;
      id v18 = v14;
      -[ADContextManager getLocalContextWithPrivacyClass:completion:]( self,  "getLocalContextWithPrivacyClass:completion:",  10LL,  v17);
      id v16 = v18;
    }
  }
}

- (void)_getDevicesWithContexts:(id)a3 passingTest:(id)a4 capabilitesPassingTest:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = (unsigned int (**)(id, void *))a4;
  id v29 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v12)
  {
    BOOL v26 = v12;
    id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v14 = dispatch_group_create();
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v27 = v10;
    id v15 = v10;
    id v16 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v39;
      do
      {
        id v19 = 0LL;
        do
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v38 + 1) + 8 * (void)v19) content]);
          if (v11[2](v11, v20))
          {
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 deviceInfo]);
            dispatch_group_enter(v14);
            deviceCircleManager = self->_deviceCircleManager;
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472LL;
            v33[2] = sub_1000F73F8;
            v33[3] = &unk_1004F0EF8;
            v33[4] = self;
            id v37 = v29;
            __int16 v34 = v28;
            id v35 = v21;
            __int16 v36 = v14;
            id v23 = v21;
            -[ADDeviceCircleManager getCapabilitiesForDevice:completion:]( deviceCircleManager,  "getCapabilitiesForDevice:completion:",  v23,  v33);
          }

          id v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }

      while (v17);
    }

    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F74D4;
    block[3] = &unk_1004FD990;
    id v13 = v26;
    id v31 = v28;
    id v32 = v26;
    id v25 = v28;
    dispatch_group_notify(v14, queue, block);

    id v10 = v27;
  }
}

- (void)_fetchContextSnapshotForCurrentRequest
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    currentRequestInfoUUID = self->_currentRequestInfoUUID;
    *(_DWORD *)buf = 136315394;
    __int128 v40 = "-[ADContextManager _fetchContextSnapshotForCurrentRequest]";
    __int16 v41 = 2112;
    v42 = currentRequestInfoUUID;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "%s _currentRequestInfoUUID = %@",  buf,  0x16u);
  }

  id v4 = self->_currentRequestInfoUUID;
  self->_contextSnapshotFetchTimedOut = 0LL;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1000F5D40;
  v35[3] = &unk_1004F9100;
  v35[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v36 = v5;
  id v6 = v4;
  id v37 = v6;
  BOOL v7 = objc_retainBlock(v35);
  ((void (*)(void *, void *))v7[2])(v7, &__NSArray0__struct);
  id v8 = self->_analytics;
  uint64_t v9 = mach_absolute_time();
  uint64_t Milliseconds = AFMachAbsoluteTimeGetMilliseconds(v9);
  deviceCircleManager = self->_deviceCircleManager;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000F6178;
  v32[3] = &unk_1004F0F60;
  id v12 = v8;
  uint64_t v33 = v12;
  uint64_t v34 = v9;
  -[ADDeviceCircleManager getContextCollectorDeviceIdentifiersWithCompletion:]( deviceCircleManager,  "getContextCollectorDeviceIdentifiersWithCompletion:",  v32);
  -[ADContextManager _logFetchLocalContextStarted:](self, "_logFetchLocalContextStarted:", v5);
  id v13 = -[ADContextManager _logContextCollectorFetchStarted:](self, "_logContextCollectorFetchStarted:", v5);
  else {
    double v15 = 1.6;
  }
  id v16 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v22 = v16;
    id v23 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15));
    *(_DWORD *)buf = 136315394;
    __int128 v40 = "-[ADContextManager _fetchContextSnapshotForCurrentRequest]";
    __int16 v41 = 2112;
    v42 = v23;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s #hal context fetch timeout value: %@",  buf,  0x16u);
  }

  uint64_t v38 = AFDeviceContextKeyAll;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000F6274;
  v29[3] = &unk_1004F0F88;
  v29[4] = self;
  id v31 = v7;
  id v30 = v5;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000F6328;
  v24[3] = &unk_1004F1160;
  id v27 = v31;
  uint64_t v28 = Milliseconds;
  v24[4] = self;
  id v25 = v12;
  id v26 = v30;
  id v18 = v30;
  id v19 = v12;
  v20 = v31;
  -[ADContextManager getContextIncludingKeys:excludingMandatoryKeys:timeOut:localContextCompletion:completion:]( self,  "getContextIncludingKeys:excludingMandatoryKeys:timeOut:localContextCompletion:completion:",  v17,  0LL,  v29,  v24,  v15);
}

- (void)getContextSnapshotForCurrentRequestWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADContextManager getContextSnapshotForCurrentRequestWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }

  if (v4)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x3032000000LL;
    id v24 = sub_1000F15F0;
    id v25 = sub_1000F1600;
    id v26 = 0LL;
    id v6 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000F59E8;
    v19[3] = &unk_1004FC1B0;
    p___int128 buf = &buf;
    v19[4] = self;
    id v20 = v4;
    BOOL v7 = -[AFSafetyBlock initWithBlock:](v6, "initWithBlock:", v19);
    objc_initWeak(&location, v7);
    id v8 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
    queue = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000F5A50;
    v16[3] = &unk_1004FBF48;
    objc_copyWeak(&v17, &location);
    v16[4] = self;
    id v10 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v8,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v16,  1.7);
    id v11 = *(void **)(*((void *)&buf + 1) + 40LL);
    *(void *)(*((void *)&buf + 1) + 40LL) = v10;

    [*(id *)(*((void *)&buf + 1) + 40) start];
    id v12 = (dispatch_queue_s *)self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000F5B24;
    v14[3] = &unk_1004FD968;
    void v14[4] = self;
    double v15 = v7;
    id v13 = v7;
    dispatch_async(v12, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
  }
}

- (void)pushContextSnapshotForCurrentRequestWithID:(id)a3 toDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (AFSupportsHALContextDonation())
  {
    if (v6)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 afPeerInfo]);
      id v9 = sub_10016563C(v8, 0LL);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1000F5528;
      v13[3] = &unk_1004F9100;
      id v14 = v6;
      double v15 = self;
      id v16 = v10;
      id v11 = v10;
      -[ADContextManager getContextSnapshotForCurrentRequestWithCompletion:]( self,  "getContextSnapshotForCurrentRequestWithCompletion:",  v13);
    }

    else
    {
      id v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v18 = "-[ADContextManager pushContextSnapshotForCurrentRequestWithID:toDevice:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s #hal No request ID specified, skipping",  buf,  0xCu);
      }
    }
  }
}

- (void)getContextSnapshotForForeignRequestID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F54DC;
  block[3] = &unk_1004FD9E0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F51E8;
  block[3] = &unk_1004FDA80;
  id v13 = self;
  int64_t v14 = a5;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
  id v10 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int64_t v14 = v10;
    double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5));
    currentRequestInfoUUID = self->_currentRequestInfoUUID;
    *(_DWORD *)__int128 buf = 136315906;
    uint64_t v23 = "-[ADContextManager requestLifecycleObserver:requestDidEndWithInfo:origin:client:]";
    __int16 v24 = 2112;
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = currentRequestInfoUUID;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "%s #hal requestDidEndWithInfo origin:%@, uuid: %@. _currentRequestInfoUUID: %@",  buf,  0x2Au);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000F501C;
  v17[3] = &unk_1004FD510;
  id v18 = v9;
  id v19 = self;
  id v20 = v8;
  int64_t v21 = a5;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v17);
}

- (void)_startPeriodicContextFetchFromNearbyDevices
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v10 = "-[ADContextManager _startPeriodicContextFetchFromNearbyDevices]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }

  id v4 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000F4E38;
  v8[3] = &unk_1004FD940;
  v8[4] = self;
  id v6 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v4,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v8,  14400.0);
  contextRefreshTimer = self->_contextRefreshTimer;
  self->_contextRefreshTimer = v6;

  -[AFWatchdogTimer start](self->_contextRefreshTimer, "start");
}

- (void)_stopPeriodicContextFetchFromNearbyDevices
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[ADContextManager _stopPeriodicContextFetchFromNearbyDevices]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }

  -[AFWatchdogTimer cancel](self->_contextRefreshTimer, "cancel");
  contextRefreshTimer = self->_contextRefreshTimer;
  self->_contextRefreshTimer = 0LL;
}

- (void)_logContextCollectorFetchStarted:(id)a3
{
  id v4 = a3;
  metricsQueue = (dispatch_queue_s *)self->_metricsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F4CBC;
  block[3] = &unk_1004FD940;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(metricsQueue, block);
}

- (void)_logContextCollectorFetchEnded:(id)a3 numDeviceContextsFetched:(unint64_t)a4
{
  id v6 = a3;
  metricsQueue = (dispatch_queue_s *)self->_metricsQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000F4B38;
  v9[3] = &unk_1004FD0A0;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(metricsQueue, v9);
}

- (void)_logContextCollectorFetchFailed:(id)a3
{
  id v4 = a3;
  metricsQueue = (dispatch_queue_s *)self->_metricsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F49BC;
  block[3] = &unk_1004FD940;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(metricsQueue, block);
}

- (void)_logFetchLocalContextStarted:(id)a3
{
  id v4 = a3;
  metricsQueue = (dispatch_queue_s *)self->_metricsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F4840;
  block[3] = &unk_1004FD940;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(metricsQueue, block);
}

- (void)_logFetchLocalContextEnded:(id)a3
{
  id v4 = a3;
  metricsQueue = (dispatch_queue_s *)self->_metricsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F46C4;
  block[3] = &unk_1004FD940;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(metricsQueue, block);
}

- (void)_logForceFetchContextStartedWithHALMetricsId:(id)a3 contextId:(id)a4 timestamp:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALForceFetchStarted);
  [v9 setExists:1];
  id v10 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEvent);
  id v11 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALForceFetchContext);
  [v11 setContextId:v7];

  [v11 setStartedOrChanged:v9];
  [v10 setForceFetchContext:v11];
  id v12 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEventMetadata);
  id v13 = [[SISchemaUUID alloc] initWithNSUUID:v8];

  [v12 setHalId:v13];
  [v10 setEventMetadata:v12];
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v14 emitMessage:v10 timestamp:a5];

  uint64_t v15 = mach_absolute_time();
  double TimeInterval = AFMachAbsoluteTimeGetTimeInterval(v15 - a5);
  id v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    id v19 = "-[ADContextManager _logForceFetchContextStartedWithHALMetricsId:contextId:timestamp:]";
    __int16 v20 = 2048;
    double v21 = TimeInterval;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s #hal Emitted forceFetch.started event (%fs ago): %@ to sharedStream",  (uint8_t *)&v18,  0x20u);
  }
}

- (void)_logForceFetchContextEndedWithHALMetricsId:(id)a3 contextId:(id)a4 forceFetchCount:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALForceFetchEnded);
  [v9 setNumDeviceContextsFetched:a5];
  id v10 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEvent);
  id v11 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALForceFetchContext);
  [v11 setContextId:v7];

  [v11 setEnded:v9];
  [v10 setForceFetchContext:v11];
  id v12 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEventMetadata);
  id v13 = [[SISchemaUUID alloc] initWithNSUUID:v8];

  [v12 setHalId:v13];
  [v10 setEventMetadata:v12];
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v14 emitMessage:v10];

  uint64_t v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    id v17 = "-[ADContextManager _logForceFetchContextEndedWithHALMetricsId:contextId:forceFetchCount:]";
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s #hal Emitted forceFetch.ended event %@ to sharedStream",  (uint8_t *)&v16,  0x16u);
  }
}

- (void)_logForceFetchContextFailedWithHALMetricsId:(id)a3 contextId:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  LODWORD(a3) = [v10 isEqualToString:kAFAssistantErrorDomain];

  if ((_DWORD)a3)
  {
    id v11 = [v7 code];
    if (v11 == (id)1013) {
      uint64_t v12 = 3LL;
    }
    else {
      uint64_t v12 = v11 == (id)3102;
    }
  }

  else
  {
    uint64_t v12 = 2 * (v7 == 0LL);
  }

  id v13 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALForceFetchFailed);
  [v13 setFailureReason:v12];
  id v14 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEvent);
  id v15 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALForceFetchContext);
  [v15 setContextId:v8];

  [v15 setFailed:v13];
  [v14 setForceFetchContext:v15];
  id v16 = objc_alloc_init(&OBJC_CLASS___HALSchemaHALClientEventMetadata);
  id v17 = [[SISchemaUUID alloc] initWithNSUUID:v9];

  [v16 setHalId:v17];
  [v14 setEventMetadata:v16];
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[AssistantSiriAnalytics sharedStream](&OBJC_CLASS___AssistantSiriAnalytics, "sharedStream"));
  [v18 emitMessage:v14];

  id v19 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    double v21 = "-[ADContextManager _logForceFetchContextFailedWithHALMetricsId:contextId:error:]";
    __int16 v22 = 2112;
    id v23 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s #hal Emitted forceFetch.failed event %@ to sharedStream",  (uint8_t *)&v20,  0x16u);
  }
}

- (void)_logForceFetchWithStartTime:(unint64_t)a3 forceFetchCount:(unint64_t)a4 forceFetchError:(id)a5 halMetricsId:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  metricsQueue = (dispatch_queue_s *)self->_metricsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F4620;
  block[3] = &unk_1004FCF38;
  void block[4] = self;
  id v16 = v11;
  unint64_t v18 = a3;
  unint64_t v19 = a4;
  id v17 = v10;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(metricsQueue, block);
}

- (void)_updateSimpleThingsWithContext:(id)a3 completion:(id)a4
{
  id v20 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = self->_analytics;
  -[AFAnalytics logEventWithType:context:](v7, "logEventWithType:context:", 4519LL, v20);
  if (-[AFInstanceContext supportsTelephony](self->_instanceContext, "supportsTelephony"))
  {
    -[AFAnalytics logEventWithType:context:](v7, "logEventWithType:context:", 4517LL, v20);
    uint64_t v8 = -[ADContextManager _inlineUpdatePhoneState](self, "_inlineUpdatePhoneState");
    int v9 = v8;
    id v10 = sub_1000F4528(v20, v8);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[AFAnalytics logEventWithType:context:](v7, "logEventWithType:context:", 4518LL, v11);
  }

  else
  {
    int v9 = 0;
  }

  -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 4511LL, v20);
  uint64_t v12 = -[ADContextManager _inlineUpdateCurrentHomeKitHome](self, "_inlineUpdateCurrentHomeKitHome");
  unsigned int v13 = v12;
  analytics = self->_analytics;
  id v15 = sub_1000F4528(v20, v12);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[AFAnalytics logEventWithType:context:](analytics, "logEventWithType:context:", 4512LL, v16);

  uint64_t v17 = v9 | v13;
  id v18 = sub_1000F4528(v20, v17);
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  -[AFAnalytics logEventWithType:context:](v7, "logEventWithType:context:", 4520LL, v19);

  if (v6) {
    v6[2](v6, v17);
  }
}

- (void)_getBackgroundContext:(id)a3
{
  id v4 = a3;
  int v5 = dispatch_group_create();
  id v6 = self->_analytics;
  v53 = @"group";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v5));
  v54 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));

  -[AFAnalytics logEventWithType:context:](v6, "logEventWithType:context:", 4501LL, v8);
  int v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    bgContext = self->_bgContext;
    v48 = "-[ADContextManager _getBackgroundContext:]";
    *(_DWORD *)__int128 buf = 136315650;
    if (bgContext) {
      id v11 = "(cache read)";
    }
    else {
      id v11 = "(regenerating all values)";
    }
    __int16 v49 = 2048;
    id v50 = v5;
    __int16 v51 = 2080;
    id v52 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Start ctxg=%p %s", buf, 0x20u);
  }

  if (!self->_bgContext)
  {
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___ADBackgroundContextCache);
    unsigned int v13 = self->_bgContext;
    self->_bgContext = v12;

    if (AFDeviceSupportsNavigation(-[ADContextManager _registerForBGUpdates](self, "_registerForBGUpdates")))
    {
      dispatch_group_enter(v5);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_1000F3EB4;
      v45[3] = &unk_1004FB0E0;
      v46 = v5;
      -[ADContextManager _updateNavStatusWithContext:completion:]( self,  "_updateNavStatusWithContext:completion:",  v8,  v45);
    }

    dispatch_group_enter(v5);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_1000F3F74;
    v43[3] = &unk_1004FB0E0;
    id v14 = v5;
    id v44 = v14;
    -[ADContextManager _updateNowPlayingInfoWithContext:completion:]( self,  "_updateNowPlayingInfoWithContext:completion:",  v8,  v43);
    dispatch_group_enter(v14);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_1000F4034;
    v41[3] = &unk_1004FB0E0;
    id v15 = v14;
    v42 = v15;
    -[ADContextManager _updatePlaybackDevicesWithContext:completion:]( self,  "_updatePlaybackDevicesWithContext:completion:",  v8,  v41);
    dispatch_group_enter(v15);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000F40F4;
    v39[3] = &unk_1004FB0E0;
    id v16 = v15;
    __int128 v40 = v16;
    id v17 = -[ADContextManager _updateSimpleThingsWithContext:completion:]( self,  "_updateSimpleThingsWithContext:completion:",  v8,  v39);
    uint64_t v19 = AFIsHorseman(v17, v18);
    if ((v19 & 1) != 0 || AFIsATV(v19, v20))
    {
      dispatch_group_enter(v16);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      v37[2] = sub_1000F41B4;
      v37[3] = &unk_1004FB0E0;
      uint64_t v38 = v16;
      -[ADContextManager _updateDeviceProblemsWithContext:token:completion:]( self,  "_updateDeviceProblemsWithContext:token:completion:",  v8,  0xFFFFFFFFLL,  v37);
    }

    dispatch_group_enter(v16);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000F4274;
    v35[3] = &unk_1004FB0E0;
    double v21 = v16;
    id v36 = v21;
    -[ADContextManager _updateMusicPersonalizationTokenWithContext:completion:]( self,  "_updateMusicPersonalizationTokenWithContext:completion:",  v8,  v35);
    if (+[AFFeatureFlags isAnnounceEnabled](&OBJC_CLASS___AFFeatureFlags, "isAnnounceEnabled"))
    {
      dispatch_group_enter(v21);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000F4334;
      v33[3] = &unk_1004FB0E0;
      uint64_t v34 = v21;
      -[ADContextManager _updateHomeAnnouncementWithContext:supplementalSnapshot:completion:]( self,  "_updateHomeAnnouncementWithContext:supplementalSnapshot:completion:",  v8,  0LL,  v33);
    }
  }

  bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000F43F4;
  v27[3] = &unk_1004FCBB0;
  __int16 v28 = v6;
  id v29 = v8;
  id v30 = v5;
  id v31 = self;
  id v32 = v4;
  id v23 = v4;
  __int16 v24 = v5;
  id v25 = v8;
  __int16 v26 = v6;
  dispatch_group_notify(v24, bgContextQueue, v27);
}

- (void)preheatBackgroundContext
{
  uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[ADContextManager preheatBackgroundContext]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADContextManager getBackgroundContext:](self, "getBackgroundContext:", 0LL);
}

- (void)getBackgroundContext:(id)a3
{
  id v4 = a3;
  int v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315138;
    id v11 = "-[ADContextManager getBackgroundContext:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000F3EA8;
  v8[3] = &unk_1004FD990;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async((dispatch_queue_t)self->_bgContextQueue, v7);
}

- (void)_registerForBGUpdates
{
  if (!self->_registeredForContextUpdates)
  {
    self->_registeredForContextUpdates = 1;
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:self selector:"navStatusDidChange:" name:AFPreferencesNavStatusDidChangeNotification object:0];
    [v3 addObserver:self selector:"updateBackgroundContextIfHomeKitInfoChanged" name:@"ADCurrentHomeKitHomeChanged" object:0];
    [v3 addObserver:self selector:"_callStateDidChange:" name:@"ADCallStateDidChangeNotification" object:0];
    [v3 addObserver:self selector:"_playbackDevicesDidChange:" name:@"ADCompanionServicePlaybackDevicesDidChangeNotification" object:0];
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SOMediaNowPlayingObserver defaultObserver]( &OBJC_CLASS___SOMediaNowPlayingObserver,  "defaultObserver"));
    [v4 addListener:self];

    uint64_t v7 = AFIsHorseman(v5, v6);
    if (((v7 & 1) != 0 || AFIsATV(v7, v8)) && self->_deviceProblemsRegistrationToken == -1)
    {
      LODWORD(out_token) = -1;
      objc_initWeak((id *)location, self);
      bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_1000F3D5C;
      handler[3] = &unk_1004F8E08;
      objc_copyWeak(&v22, (id *)location);
      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)location);
    }

    if (self->_musicPersonalizationTokenRegistrationToken == -1)
    {
      int v20 = -1;
      objc_initWeak(&out_token, self);
      id v10 = (dispatch_queue_s *)self->_bgContextQueue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000F3D98;
      v17[3] = &unk_1004F8E08;
      objc_copyWeak(&v18, &out_token);
      uint64_t v11 = AFCachedFusePersonalizationTokenChanged;
      if (notify_register_dispatch(AFCachedFusePersonalizationTokenChanged, &v20, v10, v17))
      {
        uint64_t v12 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id location = 136315394;
          *(void *)&location[4] = "-[ADContextManager _registerForBGUpdates]";
          __int16 v24 = 2080;
          uint64_t v25 = v11;
          _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Could not register for %s notification",  location,  0x16u);
        }
      }

      else
      {
        self->_musicPersonalizationTokenRegistrationToken = v20;
      }

      objc_destroyWeak(&v18);
      objc_destroyWeak(&out_token);
    }

    if (+[AFFeatureFlags isAnnounceEnabled](&OBJC_CLASS___AFFeatureFlags, "isAnnounceEnabled"))
    {
      objc_initWeak((id *)location, self);
      homeAnnouncementContextAdaptor = self->_homeAnnouncementContextAdaptor;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_1000F3DC4;
      v15[3] = &unk_1004F11B0;
      v15[4] = self;
      objc_copyWeak(&v16, (id *)location);
      -[ADHomeAnnouncementContextAdaptor registerSnapshotUpdater:]( homeAnnouncementContextAdaptor,  "registerSnapshotUpdater:",  v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)location);
    }

    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id location = 136315138;
      *(void *)&location[4] = "-[ADContextManager _registerForBGUpdates]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s observing notifications", location, 0xCu);
    }
  }

- (void)_unregisterForBGUpdates
{
  if (self->_registeredForContextUpdates)
  {
    uint64_t v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[ADContextManager _unregisterForBGUpdates]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s No longer observing notifications",  (uint8_t *)&v8,  0xCu);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 removeObserver:self name:AFPreferencesNavStatusDidChangeNotification object:0];
    [v4 removeObserver:self name:@"ADCurrentHomeKitHomeChanged" object:0];
    [v4 removeObserver:self name:@"ADCallStateDidChangeNotification" object:0];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SOMediaNowPlayingObserver defaultObserver]( &OBJC_CLASS___SOMediaNowPlayingObserver,  "defaultObserver"));
    [v5 removeListener:self];

    int deviceProblemsRegistrationToken = self->_deviceProblemsRegistrationToken;
    if (deviceProblemsRegistrationToken != -1)
    {
      notify_cancel(deviceProblemsRegistrationToken);
      self->_int deviceProblemsRegistrationToken = -1;
    }

    int musicPersonalizationTokenRegistrationToken = self->_musicPersonalizationTokenRegistrationToken;
    if (musicPersonalizationTokenRegistrationToken != -1)
    {
      notify_cancel(musicPersonalizationTokenRegistrationToken);
      self->_int musicPersonalizationTokenRegistrationToken = -1;
    }

    -[ADHomeAnnouncementContextAdaptor unregisterSnapshotUpdater]( self->_homeAnnouncementContextAdaptor,  "unregisterSnapshotUpdater");
    self->_registeredForContextUpdates = 0;
  }

- (void)_setCollectingContext:(BOOL)a3
{
  if (self->_collectingContext != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      int v8 = "-[ADContextManager _setCollectingContext:]";
      __int16 v9 = 1024;
      BOOL v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s #hal %d", (uint8_t *)&v7, 0x12u);
    }

    self->_collectingContext = v3;
    remoteContextStore = self->_remoteContextStore;
    if (v3) {
      -[ADRemoteContextStore startCollectingContext](remoteContextStore, "startCollectingContext");
    }
    else {
      -[ADRemoteContextStore stopCollectingContext](remoteContextStore, "stopCollectingContext");
    }
  }

- (id)_timerAceObjectFromTimer:(id)a3 withProximity:(int64_t)a4 inDeviceContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = objc_alloc_init(&OBJC_CLASS___SATimerObject);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 timerURL]);
  -[SATimerObject setIdentifier:](v10, "setIdentifier:", v11);

  if ([v8 isFiring])
  {
    id v12 = SATimerStateFiringValue;
    -[SATimerObject setIsFiring:](v10, "setIsFiring:", &__kCFBooleanTrue);
  }

  else
  {
    switch((unint64_t)[v8 state])
    {
      case 0uLL:
        unsigned int v13 = (id *)&SATimerStateUndefinedValue;
        goto LABEL_9;
      case 1uLL:
        unsigned int v13 = (id *)&SATimerStateStoppedValue;
        goto LABEL_9;
      case 2uLL:
        unsigned int v13 = (id *)&SATimerStatePausedValue;
        goto LABEL_9;
      case 3uLL:
        unsigned int v13 = (id *)&SATimerStateRunningValue;
LABEL_9:
        id v12 = *v13;
        break;
      default:
        id v12 = 0LL;
        break;
    }
  }

  -[SATimerObject setState:](v10, "setState:", v12);
  if ([v8 state] == (id)1 || objc_msgSend(v8, "state") == (id)2)
  {
    [v8 fireTimeInterval];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[SATimerObject setTimerValue:](v10, "setTimerValue:", v14);
  }

  if ([v8 state] == (id)3)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 fireDate]);
    [v15 timeIntervalSinceNow];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[SATimerObject setTimerValue:](v10, "setTimerValue:", v16);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
  -[SATimerObject setTitle:](v10, "setTitle:", v17);

  id v18 = SATimerTypeUndefinedValue;
  id v19 = [v8 type];
  if (v19 == (id)1)
  {
    int v20 = (id *)&SATimerTypeDefaultValue;
    goto LABEL_19;
  }

  if (v19 == (id)2)
  {
    int v20 = (id *)&SATimerTypeSleepTimerValue;
LABEL_19:
    id v21 = *v20;

    id v18 = v21;
  }

  -[SATimerObject setType:](v10, "setType:", v18);
  id v22 = (void *)objc_claimAutoreleasedReturnValue( -[ADContextManager _dataSourceInfoWithProximity:deviceContext:]( self,  "_dataSourceInfoWithProximity:deviceContext:",  a4,  v9));

  -[SATimerObject setDataSourceInfo:](v10, "setDataSourceInfo:", v22);
  return v10;
}

- (id)_alarmAceObjectFromAlarm:(id)a3 withProximity:(int64_t)a4 inDeviceContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = objc_alloc_init(&OBJC_CLASS___SAAlarmObject);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 alarmURL]);
  -[SAAlarmObject setIdentifier:](v10, "setIdentifier:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 hour]));
  -[SAAlarmObject setHour:](v10, "setHour:", v12);

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 minute]));
  -[SAAlarmObject setMinute:](v10, "setMinute:", v13);

  id v14 = [v8 repeatOptions];
  if (!v14)
  {
    id v17 = 0LL;
    goto LABEL_18;
  }

  char v15 = (char)v14;
  id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v17 = v16;
  if ((v15 & 1) != 0)
  {
    -[NSMutableArray addObject:](v16, "addObject:", SAAlarmDayOfWeekMondayValue);
    if ((v15 & 2) == 0)
    {
LABEL_4:
      if ((v15 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }

  else if ((v15 & 2) == 0)
  {
    goto LABEL_4;
  }

  -[NSMutableArray addObject:](v17, "addObject:", SAAlarmDayOfWeekTuesdayValue);
  if ((v15 & 4) == 0)
  {
LABEL_5:
    if ((v15 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }

- (id)_dataSourceInfoWithProximity:(int64_t)a3 deviceContext:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(&OBJC_CLASS___SADataSourceInfo);
  id v7 = SAProximityHintUnknownValue;
  if (a3 > 2999)
  {
    if (a3 == 4000)
    {
      id v8 = (id *)&SAProximityHintPrimaryValue;
    }

    else
    {
      if (a3 != 3000) {
        goto LABEL_11;
      }
      id v8 = (id *)&SAProximityHintImmediateValue;
    }
  }

  else if (a3 == 1000)
  {
    id v8 = (id *)&SAProximityHintFarValue;
  }

  else
  {
    if (a3 != 2000) {
      goto LABEL_11;
    }
    id v8 = (id *)&SAProximityHintNearbyValue;
  }

  id v9 = *v8;

  id v7 = v9;
LABEL_11:
  [v6 setProximityHint:v7];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  [v6 setContextIdentifier:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceInfo]);
  unsigned int v13 = [v12 isCommunalDevice];
  id v14 = &SASourceDeviceOwnershipCommunalValue;
  if (!v13) {
    id v14 = &SASourceDeviceOwnershipPersonalValue;
  }
  [v6 setSourceDeviceOwnership:*v14];

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_deviceContextServiceListener != a3)
  {
LABEL_6:
    BOOL v11 = 0;
    goto LABEL_7;
  }

  if (!AFConnectionHasEntitlement(v6, kAssistantDeviceContextServiceEntitlement))
  {
    id v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 136315138;
      id v17 = "-[ADContextManager listener:shouldAcceptNewConnection:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Reject the connection as it's missing entitlement",  buf,  0xCu);
    }

    goto LABEL_6;
  }

  id v8 = -[ADDeviceContextConnection initWithQueue:xpcConnection:delegate:]( objc_alloc(&OBJC_CLASS___ADDeviceContextConnection),  "initWithQueue:xpcConnection:delegate:",  self->_queue,  v7,  self);
  queue = (dispatch_queue_s *)self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000F3D50;
  v14[3] = &unk_1004FD968;
  void v14[4] = self;
  char v15 = v8;
  BOOL v10 = v8;
  dispatch_async(queue, v14);

  BOOL v11 = 1;
LABEL_7:

  return v11;
}

- (void)deviceContextConnectionDidInvalidate:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F3D44;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)deviceContextConnection:(id)a3 getLocalDeviceContextWithCompletion:(id)a4
{
  if (a4) {
    -[ADContextManager getLocalContextWithPrivacyClass:completion:]( self,  "getLocalContextWithPrivacyClass:completion:",  10LL);
  }
}

- (void)deviceContextConnection:(id)a3 donateSerializedContextMapByPrivacyClass:(id)a4 withMetadataMap:(id)a5 forType:(id)a6 pushToRemote:(BOOL)a7 completion:(id)a8
{
}

- (void)contextCollectorChangedToDevicesWithIdentifiers:(id)a3 localDeviceIsCollector:(BOOL)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F3BD4;
  block[3] = &unk_1004FC188;
  BOOL v12 = a4;
  id v10 = v6;
  BOOL v11 = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)localContextStore:(id)a3 didUpdateDeviceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F3B4C;
  block[3] = &unk_1004FD4C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_resetContextLinkAndReconnectNow:(BOOL)a3
{
  BOOL v3 = a3;
  -[ADRapportLink removeListener:](self->_rapportLink, "removeListener:", self);
  -[ADRapportLink invalidate](self->_rapportLink, "invalidate");
  rapportLink = self->_rapportLink;
  self->_rapportLink = 0LL;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000F3AD0;
  v12[3] = &unk_1004FD940;
  v12[4] = self;
  id v6 = objc_retainBlock(v12);
  id v7 = v6;
  if (v3)
  {
    ((void (*)(void *))v6[2])(v6);
  }

  else
  {
    dispatch_time_t v8 = dispatch_time(0LL, 20000000000LL);
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000F3B30;
    block[3] = &unk_1004FD990;
    void block[4] = self;
    id v11 = v7;
    dispatch_after(v8, queue, block);
  }
}

- (void)rapportLinkDidInterrupt:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[ADContextManager rapportLinkDidInterrupt:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s ", (uint8_t *)&v5, 0xCu);
  }

  -[ADContextManager _resetContextLinkAndReconnectNow:](self, "_resetContextLinkAndReconnectNow:", 1LL);
}

- (void)rapportLinkDidInvalidate:(id)a3
{
  id v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    id v6 = "-[ADContextManager rapportLinkDidInvalidate:]";
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s ", (uint8_t *)&v5, 0xCu);
  }

  -[ADContextManager _resetContextLinkAndReconnectNow:](self, "_resetContextLinkAndReconnectNow:", 0LL);
}

- (void)rapportLink:(id)a3 didReceiveMessage:(id)a4 ofType:(id)a5 fromPeer:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  char v15 = (void *)objc_claimAutoreleasedReturnValue([v13 idsDeviceUniqueIdentifier]);
  id v16 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315906;
    id v27 = "-[ADContextManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    uint64_t v33 = v15;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s type: %@, message: %@, device ID: %@",  buf,  0x2Au);
  }

  if (![v12 isEqualToString:@"agg_context_fetch"])
  {
    if ([v12 isEqualToString:@"context_push"])
    {
      if (self->_collectingContext)
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472LL;
        v24[2] = sub_1000F3A9C;
        v24[3] = &unk_1004FC7E8;
        id v25 = v14;
        -[ADContextManager _handlePushContextMessage:fromDeviceWithPeerInfo:completion:]( self,  "_handlePushContextMessage:fromDeviceWithPeerInfo:completion:",  v11,  v13,  v24);
        id v17 = v25;
LABEL_10:

        goto LABEL_18;
      }

      int v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315138;
        id v27 = "-[ADContextManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s #hal Not collecting context. Ignored",  buf,  0xCu);
        if (!v14) {
          goto LABEL_18;
        }
      }

      else if (!v14)
      {
        goto LABEL_18;
      }

      uint64_t v19 = 2901LL;
    }

    else
    {
      if ([v12 isEqualToString:@"context_snapshot_push"])
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000F3AB4;
        v22[3] = &unk_1004FCC00;
        id v23 = v14;
        -[ADContextManager _handleContextSnapshotPush:completion:]( self,  "_handleContextSnapshotPush:completion:",  v11,  v22);
        id v17 = v23;
        goto LABEL_10;
      }

      uint64_t v18 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 136315650;
        id v27 = "-[ADContextManager rapportLink:didReceiveMessage:ofType:fromPeer:completion:]";
        __int16 v28 = 2112;
        id v29 = v12;
        __int16 v30 = 2112;
        id v31 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Unexpected request to handle message: %@, from device: %@",  buf,  0x20u);
        if (!v14) {
          goto LABEL_18;
        }
      }

      else if (!v14)
      {
        goto LABEL_18;
      }

      uint64_t v19 = 2900LL;
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", v19));
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0LL, v21);

    goto LABEL_18;
  }

  -[ADContextManager _handleAggregateContextFetchWithMessage:fromDeviceWithPeerInfo:completion:]( self,  "_handleAggregateContextFetchWithMessage:fromDeviceWithPeerInfo:completion:",  v11,  v13,  v14);
LABEL_18:
}

- (void)_handleAggregateContextFetchWithMessage:(id)a3 fromDeviceWithPeerInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v62 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v11 logEventWithType:4586 context:0];

    id v12 = dispatch_group_create();
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"prefers_assistant_identifiers"]);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0) {
      id v15 = v13;
    }
    else {
      id v15 = 0LL;
    }

    unsigned __int8 v61 = [v15 BOOLValue];
    v98[0] = 0LL;
    v98[1] = v98;
    v98[2] = 0x3032000000LL;
    v98[3] = sub_1000F15F0;
    v98[4] = sub_1000F1600;
    id v99 = 0LL;
    dispatch_group_enter(v12);
    localContextStore = self->_localContextStore;
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472LL;
    v95[2] = sub_1000F3058;
    v95[3] = &unk_1004F1200;
    v97 = v98;
    id v17 = v12;
    v96 = v17;
    -[ADLocalContextStore getLocalContextWithPrivacyClass:completion:]( localContextStore,  "getLocalContextWithPrivacyClass:completion:",  50LL,  v95);
    v93[0] = 0LL;
    v93[1] = v93;
    v93[2] = 0x3032000000LL;
    v93[3] = sub_1000F15F0;
    v93[4] = sub_1000F1600;
    id v94 = 0LL;
    if (!self->_collectingContext
      && !+[AFFeatureFlags isCrossDeviceTVControlFromWatchEnabled]( &OBJC_CLASS___AFFeatureFlags,  "isCrossDeviceTVControlFromWatchEnabled"))
    {
      id v43 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADContextManager _handleAggregateContextFetchWithMessage:fromDeviceWithPeerInfo:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEBUG,  "%s Direct force fetch requested from %@",  buf,  0x16u);
      }

      goto LABEL_61;
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"force_fetch_assistant_identifiers"]);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    {
      id v20 = v18;

      if (v20)
      {
        id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        __int128 v91 = 0u;
        __int128 v92 = 0u;
        __int128 v89 = 0u;
        __int128 v90 = 0u;
        id v22 = v20;
        id v23 = [v22 countByEnumeratingWithState:&v89 objects:v107 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v90;
          do
          {
            for (i = 0LL; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v90 != v24) {
                objc_enumerationMutation(v22);
              }
              id v26 = sub_10016ABE0(*(void **)(*((void *)&v89 + 1) + 8LL * (void)i));
              id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
              if (v27) {
                -[NSMutableSet addObject:](v21, "addObject:", v27);
              }
            }

            id v23 = [v22 countByEnumeratingWithState:&v89 objects:v107 count:16];
          }

          while (v23);
        }

        if (v21) {
          goto LABEL_33;
        }
      }
    }

    else
    {
    }

    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"forceFetchingContextFrom"]);
    uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v28, v29) & 1) == 0)
    {
      id v21 = 0LL;
      char v42 = 1;
LABEL_45:

LABEL_50:
      id v44 = -[NSMutableSet count](v21, "count");
      id v45 = (os_log_s *)AFSiriLogContextDaemon;
      BOOL v46 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
      if (v44)
      {
        if (v46)
        {
          *(_DWORD *)__int128 buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[ADContextManager _handleAggregateContextFetchWithMessage:fromDeviceWithPeerInfo:completion:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "%s #hal Relaying force fetch request from %@",  buf,  0x16u);
        }

        dispatch_group_enter(v17);
        remoteContextStore = self->_remoteContextStore;
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v21, "allObjects"));
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472LL;
        v77[2] = sub_1000F313C;
        v77[3] = &unk_1004F1228;
        v78 = v21;
        v80 = v93;
        v79 = v17;
        -[ADRemoteContextStore fetchContextSnapshotFromDevicesWithPeerInfo:completion:]( remoteContextStore,  "fetchContextSnapshotFromDevicesWithPeerInfo:completion:",  v48,  v77);
      }

      else if ((v42 & 1) != 0)
      {
        if (v46)
        {
          *(_DWORD *)__int128 buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[ADContextManager _handleAggregateContextFetchWithMessage:fromDeviceWithPeerInfo:completion:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "%s #hal Regular context fetch request from %@",  buf,  0x16u);
        }

        dispatch_group_enter(v17);
        __int16 v49 = self->_remoteContextStore;
        uint64_t v104 = AFDeviceContextKeyAll;
        id v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v104, 1LL));
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472LL;
        v74[2] = sub_1000F32D0;
        v74[3] = &unk_1004F1250;
        v76 = v93;
        v75 = v17;
        -[ADRemoteContextStore getContextSnapshotIncludingKeys:excludingMandatoryKeys:completion:]( v49,  "getContextSnapshotIncludingKeys:excludingMandatoryKeys:completion:",  v50,  0LL,  v74);
      }

      else if (v46)
      {
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADContextManager _handleAggregateContextFetchWithMessage:fromDeviceWithPeerInfo:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "%s #hal Direct force fetch requested from %@",  buf,  0x16u);
      }

LABEL_61:
      *(void *)__int128 buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v101 = sub_1000F15F0;
      v102 = sub_1000F1600;
      id v103 = 0LL;
      __int16 v51 = objc_alloc(&OBJC_CLASS___AFSafetyBlock);
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472LL;
      v67[2] = sub_1000F3448;
      v67[3] = &unk_1004F1278;
      unsigned __int8 v73 = v61;
      v67[4] = self;
      v70 = buf;
      v71 = v98;
      v72 = v93;
      id v68 = v9;
      id v69 = v62;
      id v52 = -[AFSafetyBlock initWithBlock:](v51, "initWithBlock:", v67);
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000F3A84;
      block[3] = &unk_1004FD940;
      v54 = v52;
      v66 = v54;
      dispatch_group_notify(v17, queue, block);
      id v55 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
      v56 = self->_queue;
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472LL;
      v63[2] = sub_1000F3A90;
      v63[3] = &unk_1004FD940;
      v57 = v54;
      v64 = v57;
      v58 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v55,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  v56,  v63,  0.75);
      objc_super v59 = *(void **)(*(void *)&buf[8] + 40LL);
      *(void *)(*(void *)&buf[8] + 40LL) = v58;

      [*(id *)(*(void *)&buf[8] + 40) start];
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(v93, 8);
      _Block_object_dispose(v98, 8);

      id v10 = v62;
      goto LABEL_62;
    }

    id v30 = v28;

    if (v30)
    {
      id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      id v31 = v30;
      id v32 = [v31 countByEnumeratingWithState:&v85 objects:v106 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v86;
        do
        {
          for (j = 0LL; j != v32; j = (char *)j + 1)
          {
            if (*(void *)v86 != v33) {
              objc_enumerationMutation(v31);
            }
            id v35 = sub_100165580(*(void **)(*((void *)&v85 + 1) + 8LL * (void)j));
            id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
            if (v36) {
              -[NSMutableSet addObject:](v21, "addObject:", v36);
            }
          }

          id v32 = [v31 countByEnumeratingWithState:&v85 objects:v106 count:16];
        }

        while (v32);
      }

      if (v21)
      {
LABEL_33:
        id v60 = v8;
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager localPeerInfo](self->_deviceCircleManager, "localPeerInfo"));
        __int128 v83 = 0u;
        __int128 v84 = 0u;
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        id v37 = -[NSMutableSet copy](v21, "copy");
        id v38 = [v37 countByEnumeratingWithState:&v81 objects:v105 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v82;
          do
          {
            for (k = 0LL; k != v38; k = (char *)k + 1)
            {
              if (*(void *)v82 != v39) {
                objc_enumerationMutation(v37);
              }
              __int16 v41 = *(void **)(*((void *)&v81 + 1) + 8LL * (void)k);
            }

            id v38 = [v37 countByEnumeratingWithState:&v81 objects:v105 count:16];
          }

          while (v38);
        }

        id v8 = v60;
        char v42 = 0;
        goto LABEL_45;
      }
    }

    else
    {
      id v21 = 0LL;
    }

    char v42 = 1;
    goto LABEL_50;
  }

- (void)_handlePushContextMessage:(id)a3 fromDeviceWithPeerInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(queue);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[ADContextManager remoteContextStore](self, "remoteContextStore"));
  id v12 = -[AFDeviceContext initWithSerializedBackingStore:fromLocalDevice:contextCollectorSource:]( objc_alloc(&OBJC_CLASS___AFDeviceContext),  "initWithSerializedBackingStore:fromLocalDevice:contextCollectorSource:",  v11,  0LL,  0LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"included_context_types_in_request"]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"excluded_context_keys_in_request"]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"included_context_types_in_response"]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"excluded_context_keys_in_response"]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"prefers_assistant_identifiers"]);

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v19 = 0LL;
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
    id v19 = v17;
  }

  unsigned __int8 v20 = [v19 BOOLValue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000F2930;
  v26[3] = &unk_1004F5B98;
  id v27 = v15;
  __int16 v28 = self;
  unsigned __int8 v32 = v20;
  id v29 = v16;
  id v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v31 = v8;
  id v21 = v8;
  id v22 = v30;
  id v23 = v16;
  id v24 = v15;
  [v25 setDeviceContext:v12 includedKeys:v13 excludedKeys:v14 forDeviceWithPeerInfo:v10 completion:v26];
}

- (void)_handleContextSnapshotPush:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"request_id"]);
  if (v8)
  {
    if (!self->_contextSnapshotByForeignRequestID)
    {
      id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      contextSnapshotByForeignRequestID = self->_contextSnapshotByForeignRequestID;
      self->_contextSnapshotByForeignRequestID = v9;
    }

    id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADDeviceCircleManager localPeerInfo](self->_deviceCircleManager, "localPeerInfo"));
    id v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 136315394;
      uint64_t v39 = "-[ADContextManager _handleContextSnapshotPush:completion:]";
      __int16 v40 = 2112;
      __int16 v41 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s #hal received context_snapshot_push for request %@:",  buf,  0x16u);
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"context_snapshot"]);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
      id v16 = v14;
    }
    else {
      id v16 = 0LL;
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_1000F254C;
    v35[3] = &unk_1004F41F0;
    id v19 = v12;
    id v36 = v19;
    unsigned __int8 v20 = v11;
    id v37 = v20;
    [v16 enumerateKeysAndObjectsUsingBlock:v35];

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"context_snapshot_by_assistant_identifier"]);
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0) {
      id v23 = v21;
    }
    else {
      id v23 = 0LL;
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000F2738;
    v32[3] = &unk_1004F41F0;
    id v24 = v19;
    id v33 = v24;
    uint64_t v18 = v20;
    uint64_t v34 = v18;
    [v23 enumerateKeysAndObjectsUsingBlock:v32];

    id v25 = self->_contextSnapshotByForeignRequestID;
    id v26 = sub_10029C1C4(v18);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v27, v8);

    dispatch_time_t v28 = dispatch_time(0LL, 12000000000LL);
    queue = (dispatch_queue_s *)self->_queue;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000F2924;
    v30[3] = &unk_1004FD968;
    v30[4] = self;
    id v31 = v8;
    dispatch_after(v28, queue, v30);
    if (v7) {
      v7[2](v7, 0LL);
    }

    goto LABEL_18;
  }

  id v17 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v39 = "-[ADContextManager _handleContextSnapshotPush:completion:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s #hal malformed message: missing request ID",  buf,  0xCu);
    if (!v7) {
      goto LABEL_19;
    }
    goto LABEL_10;
  }

  if (v7)
  {
LABEL_10:
    uint64_t v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 11LL));
    ((void (**)(id, NSMutableArray *))v7)[2](v7, v18);
LABEL_18:
  }

- (void)_updateSingleUserMusicPersonalizationTokenFromKeychainWithCompletion:(id)a3
{
  id v8 = (void (**)(id, uint64_t))a3;
  uint64_t v4 = AFKeychainValueForAccountAndKey( AFSiriGlobalKeychainAccountIdentifier,  @"com.apple.assistant.music.fusetoken");
  int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if ([v5 length]) {
    id v6 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v5, 4LL);
  }
  else {
    id v6 = 0LL;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADBackgroundContextCache musicPersonalizationToken](self->_bgContext, "musicPersonalizationToken"));
  if (([v7 isEqual:v6] & 1) == 0)
  {
    -[ADBackgroundContextCache setMusicPersonalizationToken:](self->_bgContext, "setMusicPersonalizationToken:", v6);
    v8[2](v8, 1LL);
  }
}

- (id)_makeUserTokenStatusWithICTokenStatus:(id)a3 icError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___SAUserTokenStatus);
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 code]));
    -[SAUserTokenStatus setErrorCode:](v7, "setErrorCode:", v8);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 lastError]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v9 code]));
    -[SAUserTokenStatus setErrorCode:](v7, "setErrorCode:", v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 shouldExcludeFromBackgroundRefresh]));
    -[SAUserTokenStatus setShouldExcludeFromBackgroundRefresh:](v7, "setShouldExcludeFromBackgroundRefresh:", v11);

    [v5 lastUpdateAttemptTime];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[SAUserTokenStatus setLastUpdateAttemptTime:](v7, "setLastUpdateAttemptTime:", v8);
  }

  return v7;
}

- (void)_updateMultiUserPersonalizationTokensWithSingleUserTokenChanged:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [off_100572E40() sharedProvider];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000F1C60;
  v10[3] = &unk_1004F1340;
  id v11 = (id)objc_claimAutoreleasedReturnValue(v7);
  id v12 = self;
  BOOL v14 = a3;
  id v13 = v6;
  id v8 = v6;
  id v9 = v11;
  [v9 getAllTokensForAssistantForcingRefresh:0 completion:v10];
}

- (void)_updateMusicPersonalizationTokenWithContext:(id)a3 completion:(id)a4
{
  analytics = self->_analytics;
  id v7 = a4;
  id v8 = a3;
  -[AFAnalytics logEventWithType:context:](analytics, "logEventWithType:context:", 4515LL, v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[AFAnalytics _ad_contextLoggerWithEventType:context:completion:]( self->_analytics,  "_ad_contextLoggerWithEventType:context:completion:",  4516LL,  v8,  v7));

  id v10 = [off_100572E40() sharedProvider];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000F1754;
  v13[3] = &unk_1004F1390;
  void v13[4] = self;
  id v14 = (id)objc_claimAutoreleasedReturnValue(v10);
  id v15 = v9;
  id v11 = v9;
  id v12 = v14;
  [v12 getTokenForcingRefresh:0 completion:v13];
}

- (void)_updateBackgroundContextIfMusicPersonalizationTokenChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000F1640;
  v2[3] = &unk_1004FB0E0;
  v2[4] = self;
  -[ADContextManager _updateMusicPersonalizationTokenWithContext:completion:]( self,  "_updateMusicPersonalizationTokenWithContext:completion:",  &off_100513908,  v2);
}

- (BOOL)_inlineUpdateCurrentHomeKitHome
{
  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  id v26 = sub_1000F15F0;
  id v27 = sub_1000F1600;
  id v28 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F1608;
  block[3] = &unk_1004FDB20;
  void block[4] = buf;
  dispatch_sync((dispatch_queue_t)qword_100577CF8, block);
  id v3 = *(id *)(*(void *)&buf[8] + 40LL);
  _Block_object_dispose(buf, 8);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);
  if ([v4 length])
  {
    unint64_t v5 = objc_alloc_init(&OBJC_CLASS___SAHACurrentHome);
    [(id)v5 setCurrentHomeIdentifier:v4];
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[ADBackgroundContextCache currentHome](self->_bgContext, "currentHome"));
  id v8 = (void *)v6;
  if (v5 | v6 && (uint64_t v6 = (uint64_t)[(id)v6 isEqual:v5], (v6 & 1) == 0))
  {
    uint64_t v6 = (uint64_t)-[ADBackgroundContextCache setCurrentHome:](self->_bgContext, "setCurrentHome:", v5);
    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = 0;
  }

  if (AFIsHorseman(v6, v7))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 preferredMediaUserInfo]);

    if (-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint"))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AFInstanceContext endpointUUID](self->_instanceContext, "endpointUUID"));
      id v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136315395;
        *(void *)&uint8_t buf[4] = "-[ADContextManager _inlineUpdateCurrentHomeKitHome]";
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Accessory %{private}@", buf, 0x16u);
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 preferredMediaUserSharedUserIDByAccessoryUUID]);
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 objectForKey:v12]);

      id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 preferredMediaUserHomeUserIDByAccessoryUUID]);
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 objectForKey:v12]);
    }

    else
    {
      uint64_t v18 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ADContextManager _inlineUpdateCurrentHomeKitHome]";
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s Hub", buf, 0xCu);
      }

      uint64_t v15 = objc_claimAutoreleasedReturnValue([v11 preferredMediaUserSharedUserID]);
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v11 preferredMediaUserHomeUserID]);
    }

    uint64_t v19 = objc_claimAutoreleasedReturnValue( -[ADBackgroundContextCache preferredMediaUserSharedUserID]( self->_bgContext,  "preferredMediaUserSharedUserID"));
    if (v15 | v19 && ([(id)v15 isEqual:v19] & 1) == 0)
    {
      -[ADBackgroundContextCache setPreferredMediaUserSharedUserID:]( self->_bgContext,  "setPreferredMediaUserSharedUserID:",  v15);
      unsigned __int8 v20 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADContextManager _inlineUpdateCurrentHomeKitHome]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%s Updated backgroundContextCache preferredMediaUserSharedUserID to (%@)",  buf,  0x16u);
      }

      BOOL v9 = 1;
    }

    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[ADBackgroundContextCache preferredMediaUserHomeUserID](self->_bgContext, "preferredMediaUserHomeUserID"));
    if (v17 | v21 && ([(id)v17 isEqual:v21] & 1) == 0)
    {
      -[ADBackgroundContextCache setPreferredMediaUserHomeUserID:]( self->_bgContext,  "setPreferredMediaUserHomeUserID:",  v17);
      uint64_t v22 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ADContextManager _inlineUpdateCurrentHomeKitHome]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v17;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s Updated backgroundContextCache preferredMediaUserHomeUserID to (%@)",  buf,  0x16u);
      }

      BOOL v9 = 1;
    }
  }

  return v9;
}

- (void)updateBackgroundContextIfHomeKitInfoChanged
{
  bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F14CC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(bgContextQueue, block);
}

- (void)_updateNavStatusWithContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = self->_analytics;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( -[AFAnalytics _ad_contextLoggerWithEventType:context:completion:]( v8,  "_ad_contextLoggerWithEventType:context:completion:",  4504LL,  v7,  a4));
  -[AFAnalytics logEventWithType:context:](v8, "logEventWithType:context:", 4503LL, v7);
  -[AFAnalytics logEventWithType:context:](v8, "logEventWithType:context:", 4521LL, v7);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[ADBackgroundContextCache navStatus](self->_bgContext, "navStatus"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ADBackgroundContextCache localSearchGetNavigationStatusCompleted]( self->_bgContext,  "localSearchGetNavigationStatusCompleted"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  id v13 = [v12 currentNavigationState];

  char IsNavigating = AFNavigationStateIsNavigating(v13);
  unint64_t v15 = objc_alloc_init(&OBJC_CLASS___SANavStatus);
  [(id)v15 setStatusValue:v4];

  if (v10 | v15 && ([(id)v15 isEqual:v10] & 1) == 0)
  {
    -[ADBackgroundContextCache setNavStatus:](self->_bgContext, "setNavStatus:", v15);
    char v16 = 1;
  }

  else
  {
    char v16 = 0;
  }

  if (v7) {
    char v17 = IsNavigating;
  }
  else {
    char v17 = 0;
  }
  id v38 = (void *)v10;
  if ((v17 & 1) != 0)
  {
    v48[0] = v7;
    BOOL v46 = @"isNavigating";
    char v35 = v16;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    id v47 = v18;
    id v36 = v9;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
    v48[1] = v19;
    id v20 = v7;
    uint64_t v21 = self;
    unint64_t v22 = v15;
    id v23 = v8;
    char v24 = IsNavigating;
    id v25 = v11;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v48, 2LL));
    uint64_t v27 = AFAnalyticsContextsMerge();
    id v28 = (id)objc_claimAutoreleasedReturnValue(v27);

    id v11 = v25;
    char IsNavigating = v24;
    id v8 = v23;
    unint64_t v15 = v22;
    self = v21;
    id v7 = v20;

    BOOL v9 = v36;
    char v16 = v35;
  }

  else
  {
    id v28 = v7;
  }

  -[AFAnalytics logEventWithType:context:](v8, "logEventWithType:context:", 4522LL, v28);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000F126C;
  v41[3] = &unk_1004F1458;
  id v29 = v11;
  id v42 = v29;
  id v43 = self;
  id v30 = v9;
  id v44 = v30;
  char v45 = v16;
  id v31 = objc_retainBlock(v41);
  unsigned __int8 v32 = v31;
  if ((IsNavigating & 1) != 0)
  {
    if (!v29)
    {
      id v37 = objc_alloc_init(&OBJC_CLASS___SALocalSearchGetNavigationStatus);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_1000F12EC;
      v39[3] = &unk_1004F1480;
      void v39[4] = self;
      id v40 = v32;
      [v34 _sendServiceCommand:v37 completion:v39];

      goto LABEL_18;
    }

    id v33 = (void (*)(void))v31[2];
  }

  else
  {
    id v33 = (void (*)(void))v31[2];
  }

  v33();
LABEL_18:
}

- (void)navStatusDidChange:(id)a3
{
  bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F1148;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(bgContextQueue, block);
}

- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  id v13 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    uint64_t Name = AFMediaPlaybackStateGetName(a4);
    char v16 = (void *)objc_claimAutoreleasedReturnValue(Name);
    uint64_t v17 = AFMediaPlaybackStateGetName(a5);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)__int128 buf = 136316162;
    unint64_t v22 = "-[ADContextManager nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:]";
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v16;
    __int16 v27 = 2112;
    id v28 = v18;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s nowPlayingObserver = %@, fromState = %@, toState = %@, lastPlayingDate = %@",  buf,  0x34u);
  }

  bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F10D8;
  block[3] = &unk_1004FBF70;
  void block[4] = self;
  void block[5] = a5;
  block[6] = a2;
  dispatch_async(bgContextQueue, block);
}

- (void)nowPlayingObserverNowPlayingInfoDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v10 = "-[ADContextManager nowPlayingObserverNowPlayingInfoDidChange:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s nowPlayingObserver = %@", buf, 0x16u);
  }

  bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000F1094;
  v8[3] = &unk_1004FD0A0;
  v8[4] = self;
  void v8[5] = a2;
  dispatch_async(bgContextQueue, v8);
}

- (void)_cancelNowPlayingCoalescingTimer
{
  nowPlayingCoalescingTimer = self->_nowPlayingCoalescingTimer;
  if (nowPlayingCoalescingTimer)
  {
    dispatch_source_cancel((dispatch_source_t)nowPlayingCoalescingTimer);
    id v4 = self->_nowPlayingCoalescingTimer;
    self->_nowPlayingCoalescingTimer = 0LL;

    coalescedNowPlayingUpdateSources = self->_coalescedNowPlayingUpdateSources;
    self->_coalescedNowPlayingUpdateSources = 0LL;
  }

- (void)_scheduleNowPlayingRefreshForReason:(id)a3 isPlaying:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315650;
    unint64_t v22 = "-[ADContextManager _scheduleNowPlayingRefreshForReason:isPlaying:]";
    __int16 v23 = 2112;
    uint64_t v24 = (uint64_t)v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s reason = %@, isPlaying = %@", buf, 0x20u);
  }

  if (v7 && mach_absolute_time() <= self->_ignoreNowPlayingUpdatesAfterTimestamp)
  {
    uint64_t v19 = kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey;
    id v20 = v7;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 2801LL, v9);
  }

  if (!self->_nowPlayingCoalescingTimer)
  {
    uint64_t v10 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", 2LL);
    coalescedNowPlayingUpdateSources = self->_coalescedNowPlayingUpdateSources;
    self->_coalescedNowPlayingUpdateSources = v10;

    id v12 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_bgContextQueue);
    nowPlayingCoalescingTimer = self->_nowPlayingCoalescingTimer;
    self->_nowPlayingCoalescingTimer = v12;

    id v14 = self->_nowPlayingCoalescingTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000F0F60;
    handler[3] = &unk_1004FD940;
    void handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v14, handler);
    unint64_t v15 = self->_nowPlayingCoalescingTimer;
    dispatch_time_t v16 = dispatch_time(0LL, 100000000LL);
    dispatch_source_set_timer((dispatch_source_t)v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)self->_nowPlayingCoalescingTimer);
    uint64_t v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 136315394;
      unint64_t v22 = "-[ADContextManager _scheduleNowPlayingRefreshForReason:isPlaying:]";
      __int16 v23 = 2048;
      uint64_t v24 = 0x3FB999999999999ALL;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "%s Updating NowPlaying info in %.4g seconds",  buf,  0x16u);
    }
  }

  if (!-[__CFString length](v6, "length"))
  {

    uint64_t v6 = @"UNKNOWN";
  }

  -[NSMutableSet addObject:](self->_coalescedNowPlayingUpdateSources, "addObject:", v6);
}

- (void)_updateNowPlayingInfoWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_group_t v8 = dispatch_group_create();
  BOOL v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    uint64_t v18 = "-[ADContextManager _updateNowPlayingInfoWithContext:completion:]";
    __int16 v19 = 2048;
    dispatch_group_t v20 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s group=%p canceling _nowPlayingCoalescingTimer because we are starting an update now",  buf,  0x16u);
  }

  -[ADContextManager _cancelNowPlayingCoalescingTimer](self, "_cancelNowPlayingCoalescingTimer");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[AFAnalytics _ad_contextLoggerWithEventType:context:completion:]( self->_analytics,  "_ad_contextLoggerWithEventType:context:completion:",  4506LL,  v7,  v6));

  -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 4505LL, v7);
  bgContextQueue = self->_bgContextQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000F0DF0;
  v14[3] = &unk_1004F14A8;
  void v14[4] = self;
  dispatch_group_t v15 = v8;
  id v16 = v10;
  id v12 = v10;
  id v13 = v8;
  AFGetNowPlayingQueueState(bgContextQueue, v13, v14);
}

- (void)_reallyUpdateBackgroundContextIfNowPlayingInfoChangedForReason:(id)a3
{
  id v4 = (__CFString *)a3;
  if (!-[__CFString length](v4, "length"))
  {

    id v4 = @"poll";
  }

  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v11 = "-[ADContextManager _reallyUpdateBackgroundContextIfNowPlayingInfoChangedForReason:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  dispatch_group_t v8 = @"source";
  BOOL v9 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000F0D28;
  v7[3] = &unk_1004FB0E0;
  v7[4] = self;
  -[ADContextManager _updateNowPlayingInfoWithContext:completion:]( self,  "_updateNowPlayingInfoWithContext:completion:",  v6,  v7);
}

- (void)updateBackgroundContextIfNowPlayingInfoChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0D1C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async((dispatch_queue_t)self->_bgContextQueue, v3);
}

- (void)_handleDeviceProblemsChangedWithToken:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315394;
    dispatch_group_t v8 = "-[ADContextManager _handleDeviceProblemsChangedWithToken:]";
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s token = %d", buf, 0x12u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000F0C54;
  v6[3] = &unk_1004FB0E0;
  v6[4] = self;
  -[ADContextManager _updateDeviceProblemsWithContext:token:completion:]( self,  "_updateDeviceProblemsWithContext:token:completion:",  &off_100513980,  v3,  v6);
}

- (void)_updateDeviceProblemsWithContext:(id)a3 token:(int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int out_token = 136315394;
    __int16 v23 = "-[ADContextManager _updateDeviceProblemsWithContext:token:completion:]";
    __int16 v24 = 1024;
    LODWORD(v25) = a4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s token = %d",  (uint8_t *)&out_token,  0x12u);
  }

  -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 4509LL, v8);
  __int16 v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[AFAnalytics _ad_contextLoggerWithEventType:context:completion:]( self->_analytics,  "_ad_contextLoggerWithEventType:context:completion:",  4510LL,  v8,  v9));
  uint64_t state64 = 0LL;
  if (a4 == -1)
  {
    int out_token = -1;
    uint32_t state = notify_register_check("com.apple.sharing.problems", &out_token);
    if (!state)
    {
      uint32_t state = notify_get_state(out_token, &state64);
      notify_cancel(out_token);
    }
  }

  else
  {
    uint32_t state = notify_get_state(a4, &state64);
  }

  id v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (state)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int out_token = 136315394;
      __int16 v23 = "-[ADContextManager _updateDeviceProblemsWithContext:token:completion:]";
      __int16 v24 = 1024;
      LODWORD(v25) = state;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s could not get device problem state. notify.h status = %u",  (uint8_t *)&out_token,  0x12u);
    }

    goto LABEL_64;
  }

  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int out_token = 136315394;
    __int16 v23 = "-[ADContextManager _updateDeviceProblemsWithContext:token:completion:]";
    __int16 v24 = 2048;
    uint64_t v25 = state64;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s uint32_t state = %llu",  (uint8_t *)&out_token,  0x16u);
  }

  if (!state64)
  {
    unint64_t v14 = 0LL;
    goto LABEL_59;
  }

  unint64_t v14 = objc_alloc_init(&OBJC_CLASS___SAErrorIndicatorStatus);
  dispatch_group_t v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v16 = v15;
  int v17 = state64;
  if ((state64 & 2) != 0)
  {
    -[NSMutableArray addObject:](v15, "addObject:", SAErrorIndicatorStatusValueICloudProblemValue);
    int v17 = state64;
    if ((state64 & 4) == 0)
    {
LABEL_15:
      if ((v17 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_38;
    }
  }

  else if ((state64 & 4) == 0)
  {
    goto LABEL_15;
  }

  -[NSMutableArray addObject:](v16, "addObject:", SAErrorIndicatorStatusValueITunesProblemValue);
  int v17 = state64;
  if ((state64 & 8) == 0)
  {
LABEL_16:
    if ((v17 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }

- (BOOL)_inlineUpdatePhoneState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  unsigned int v4 = [v3 _isInCall];
  unsigned int v5 = [v3 _hasIncomingCall];
  unsigned int v6 = -[AFInstanceContext supportsTelephony](self->_instanceContext, "supportsTelephony");
  uint64_t v7 = v6 & v5;
  uint64_t v8 = v6 & v4;
  unint64_t v9 = objc_alloc_init(&OBJC_CLASS___SAPhoneCallState);
  [(id)v9 setActive:v8];
  [(id)v9 setIncoming:v7];
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[ADBackgroundContextCache phoneCallState](self->_bgContext, "phoneCallState"));
  if (v9 | v10) {
    uint64_t v11 = [(id)v9 isEqual:v10] ^ 1;
  }
  else {
    uint64_t v11 = 0LL;
  }
  __int16 v12 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
    dispatch_group_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
    int v18 = 136315906;
    __int16 v19 = "-[ADContextManager _inlineUpdatePhoneState]";
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    __int16 v23 = v15;
    __int16 v24 = 2112;
    uint64_t v25 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s #callState callState did change: %@, active: %@, incoming: %@",  (uint8_t *)&v18,  0x2Au);
  }

  if ((_DWORD)v11) {
    -[ADBackgroundContextCache setPhoneCallState:](self->_bgContext, "setPhoneCallState:", v9);
  }

  return v11;
}

- (void)_callStateDidChange:(id)a3
{
  bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0B30;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(bgContextQueue, block);
}

- (void)_updatePlaybackDevicesWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[AFAnalytics _ad_contextLoggerWithEventType:context:completion:]( self->_analytics,  "_ad_contextLoggerWithEventType:context:completion:",  4524LL,  v6,  a4));
  bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F095C;
  block[3] = &unk_1004FD9E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(bgContextQueue, block);
}

- (void)_playbackDevicesDidChange:(id)a3
{
  bgContextQueue = (dispatch_queue_s *)self->_bgContextQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F0838;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(bgContextQueue, block);
}

- (void)pushMyriadAdvertisementContextToContextCollector:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 contextData]);
  [v7 contextFetchDelay];
  id v10 = v9;

  if (v8)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADContextManager localContextStore](self, "localContextStore"));
      objc_initWeak(&location, v12);

      objc_initWeak(&from, self);
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000F04E4;
      block[3] = &unk_1004F1520;
      objc_copyWeak(&v19, &from);
      objc_copyWeak(v20, &location);
      id v17 = v8;
      id v18 = v6;
      v20[1] = v10;
      dispatch_async(queue, block);

      objc_destroyWeak(v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      goto LABEL_9;
    }

    unint64_t v14 = @"Invalid context data type";
  }

  else
  {
    unint64_t v14 = @"Nil Myriad advertisement context";
  }

  dispatch_group_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:description:](&OBJC_CLASS___AFError, "errorWithCode:description:", 30LL, v14));
  if (v6) {
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v15);
  }

LABEL_9:
}

- (void)pushSCDAAdvertisementContextToContextCollector:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 contextData]);
  [v7 contextFetchDelay];
  id v10 = v9;

  if (v8)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ADContextManager localContextStore](self, "localContextStore"));
      objc_initWeak(&location, v12);

      objc_initWeak(&from, self);
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000F0190;
      block[3] = &unk_1004F1520;
      objc_copyWeak(&v19, &from);
      objc_copyWeak(v20, &location);
      id v17 = v8;
      id v18 = v6;
      v20[1] = v10;
      dispatch_async(queue, block);

      objc_destroyWeak(v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      goto LABEL_9;
    }

    unint64_t v14 = @"Invalid context data type";
  }

  else
  {
    unint64_t v14 = @"Nil Myriad advertisement context";
  }

  dispatch_group_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:description:](&OBJC_CLASS___AFError, "errorWithCode:description:", 30LL, v14));
  if (v6) {
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v15);
  }

LABEL_9:
}

- (void)_updateHomeAnnouncementWithContext:(id)a3 supplementalSnapshot:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315394;
    __int16 v22 = "-[ADContextManager _updateHomeAnnouncementWithContext:supplementalSnapshot:completion:]";
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s supplementalSnapshot = %@", buf, 0x16u);
  }

  -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 4528LL, v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[AFAnalytics _ad_contextLoggerWithEventType:context:completion:]( self->_analytics,  "_ad_contextLoggerWithEventType:context:completion:",  4529LL,  v8,  v10));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000EFDD0;
  v19[3] = &unk_1004F1548;
  v19[4] = self;
  id v13 = v12;
  id v20 = v13;
  unint64_t v14 = objc_retainBlock(v19);
  dispatch_group_t v15 = v14;
  if (v9)
  {
    ((void (*)(void *, id))v14[2])(v14, v9);
  }

  else
  {
    homeAnnouncementContextAdaptor = self->_homeAnnouncementContextAdaptor;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000F0034;
    v17[3] = &unk_1004F1548;
    void v17[4] = self;
    id v18 = v14;
    -[ADHomeAnnouncementContextAdaptor getSnapshotWithCompletion:]( homeAnnouncementContextAdaptor,  "getSnapshotWithCompletion:",  v17);
  }
}

- (void)_handleHomeAnnouncementSnapshotUpdate:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int128 buf = 136315394;
    id v8 = "-[ADContextManager _handleHomeAnnouncementSnapshotUpdate:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s snapshot = %@", buf, 0x16u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000EFD08;
  v6[3] = &unk_1004FB0E0;
  v6[4] = self;
  -[ADContextManager _updateHomeAnnouncementWithContext:supplementalSnapshot:completion:]( self,  "_updateHomeAnnouncementWithContext:supplementalSnapshot:completion:",  &off_1005139F8,  v4,  v6);
}

- (void)_addDeviceContextConnection:(id)a3
{
  id v4 = a3;
  deviceContextConnections = self->_deviceContextConnections;
  id v8 = v4;
  if (!deviceContextConnections)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v7 = self->_deviceContextConnections;
    self->_deviceContextConnections = v6;

    id v4 = v8;
    deviceContextConnections = self->_deviceContextConnections;
  }

  -[NSMutableSet addObject:](deviceContextConnections, "addObject:", v4);
}

- (void)_removeDeviceContextConnection:(id)a3
{
  deviceContextConnections = self->_deviceContextConnections;
  id v4 = a3;
  -[NSMutableSet removeObject:](deviceContextConnections, "removeObject:", v4);
  [v4 invalidate];
}

- (void)_enumerateDeviceContextConnectionsUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    deviceContextConnections = self->_deviceContextConnections;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000EFCFC;
    v7[3] = &unk_1004F1570;
    id v6 = v4;
    v7[0] = _NSConcreteStackBlock;
    id v8 = v4;
    -[NSMutableSet enumerateObjectsUsingBlock:](deviceContextConnections, "enumerateObjectsUsingBlock:", v7);

    id v4 = v6;
  }
}

- (ADLocalContextStore)localContextStore
{
  return self->_localContextStore;
}

- (ADRemoteContextStore)remoteContextStore
{
  return self->_remoteContextStore;
}

- (ADContextManagerDelegate)delegate
{
  return (ADContextManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)_isCollectingContext
{
  return self->_collectingContext;
}

- (void).cxx_destruct
{
}

@end