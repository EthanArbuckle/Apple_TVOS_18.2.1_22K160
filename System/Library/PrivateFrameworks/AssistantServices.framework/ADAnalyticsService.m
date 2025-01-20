@interface ADAnalyticsService
+ (id)sharedService;
- (ADAnalyticsService)init;
- (NSString)currentEventStreamUID;
- (id)_determineSpeechIdForEndpointUUID:(id)a3;
- (id)_speechIdByEndpointUUID;
- (id)_store;
- (id)_unstageEvents;
- (void)_addConnection:(id)a3;
- (void)_beginEventsFuzzingWithStartTime:(unint64_t)a3;
- (void)_beginEventsGrouping;
- (void)_clearSpeechIdForEndpointUUID:(id)a3;
- (void)_endEventsFuzzingWithEndTime:(unint64_t)a3;
- (void)_endEventsGrouping;
- (void)_enumerateConnectionsAsServiceDelegates:(id)a3 completion:(id)a4;
- (void)_executeDelegateBlockOnAllConnections:(id)a3 completion:(id)a4;
- (void)_houseKeeperArrived;
- (void)_linkStoreForSysdiagnose;
- (void)_observeConnectionDisrupted:(int)a3 observer:(id)a4 referenceId:(id)a5;
- (void)_processStagedEvents;
- (void)_publishEventsToObserver:(id)a3 completion:(id)a4;
- (void)_removeConnection:(id)a3;
- (void)_resumeEventsStaging;
- (void)_setSpeechId:(id)a3 forEndpointUUID:(id)a4;
- (void)_signalConnectionDisruption:(id)a3;
- (void)_speechIdUpdatedForEndpointUUID:(id)a3;
- (void)_stageEvent:(id)a3;
- (void)_stageEvents:(id)a3;
- (void)_startHouseKeepingTimer;
- (void)_stopHouseKeepingTimer;
- (void)_stopObservingConnectionDisrupted:(int)a3 referenceId:(id)a4;
- (void)_suspendEventsStaging;
- (void)_unlinkStoreForSysdiagnose;
- (void)accessStoreUsingBlock:(id)a3;
- (void)beginEventsFuzzingWithStartTime:(unint64_t)a3;
- (void)beginEventsGrouping;
- (void)boostAllConnections:(id)a3;
- (void)checkForMetricsUploadProblem;
- (void)connectionConnected:(id)a3;
- (void)connectionDisconnected:(id)a3;
- (void)connectionInterrupted:(id)a3;
- (void)dealloc;
- (void)endEventsFuzzingWithEndTime:(unint64_t)a3;
- (void)endEventsGrouping;
- (void)flushWithCompletion:(id)a3;
- (void)homehubManager:(id)a3 didActivateEndpointWithContext:(id)a4;
- (void)homehubManager:(id)a3 didAddEndpointWithContext:(id)a4;
- (void)homehubManager:(id)a3 didDeactivateEndpointWithContext:(id)a4;
- (void)homehubManager:(id)a3 didDeleteEndpointWithContext:(id)a4;
- (void)homehubManager:(id)a3 didReceiveLaunchNotificationForEndpointUUID:(id)a4;
- (void)logInstrumentationOfType:(id)a3 machAbsoluteTime:(unint64_t)a4 endpointUUID:(id)a5 turnIdentifier:(id)a6;
- (void)managedConfigurationEffectiveSettingsChanged;
- (void)observeWithCompletion:(id)a3;
- (void)resumeEventsStaging;
- (void)setObserverConnection:(id)a3;
- (void)speechIdUpdatedForEndpointUUID:(id)a3;
- (void)stageEvents:(id)a3 endpointUUID:(id)a4 completion:(id)a5;
- (void)stageUEIEventData:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5;
- (void)storeGenericInstrumentation:(id)a3 completion:(id)a4;
- (void)suspendEventsStaging;
@end

@implementation ADAnalyticsService

- (ADAnalyticsService)init
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___ADAnalyticsService;
  v2 = -[ADAnalyticsService init](&v35, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.assistant.analytics.service", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    stagedEvents = v2->_stagedEvents;
    v2->_stagedEvents = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    connections = v2->_connections;
    v2->_connections = v11;

    id v13 = sub_1001EB128();
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    streamUID = v2->_streamUID;
    v2->_streamUID = (NSString *)v14;

    v16 = -[ADInstrumentationResolver initWithQueue:]( objc_alloc(&OBJC_CLASS___ADInstrumentationResolver),  "initWithQueue:",  v2->_queue);
    instrumentationResolver = v2->_instrumentationResolver;
    v2->_instrumentationResolver = v16;

    if (!v2->_streamUID)
    {
      v18 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[ADAnalyticsService init]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Unable to use boot session UUID as stream UID, falling back to in memory UUID instead.",  buf,  0xCu);
      }

      v19 = objc_alloc_init(&OBJC_CLASS___NSUUID);
      uint64_t v20 = objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v19, "UUIDString"));
      v21 = v2->_streamUID;
      v2->_streamUID = (NSString *)v20;
    }

    v22 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      v23 = v2->_streamUID;
      *(_DWORD *)buf = 136315394;
      v37 = "-[ADAnalyticsService init]";
      __int16 v38 = 2112;
      v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s streamUID = %@", buf, 0x16u);
    }

    v24 = objc_alloc_init(&OBJC_CLASS___AFQueue);
    fuzzingIntervals = v2->_fuzzingIntervals;
    v2->_fuzzingIntervals = v24;

    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    connectionDisruptedObservers = v2->_connectionDisruptedObservers;
    v2->_connectionDisruptedObservers = (NSMutableDictionary *)v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[ADAccount activeAccount](&OBJC_CLASS___ADAccount, "activeAccount"));
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 speechIdentifier]);
    speechId = v2->_speechId;
    v2->_speechId = (NSString *)v29;

    v31 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002E3B2C;
    block[3] = &unk_1004FD940;
    v34 = v2;
    dispatch_async(v31, block);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADAnalyticsService;
  -[ADAnalyticsService dealloc](&v3, "dealloc");
}

- (NSString)currentEventStreamUID
{
  return self->_streamUID;
}

- (void)connectionConnected:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002E3B20;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)connectionInterrupted:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002E3B14;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)connectionDisconnected:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002E3AE8;
    v7[3] = &unk_1004FD968;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)accessStoreUsingBlock:(id)a3
{
  id v4 = a3;
  dispatch_queue_attr_t v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1002E3AA4;
    v7[3] = &unk_1004FD990;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)setObserverConnection:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002E3A34;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)suspendEventsStaging
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E3A2C;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)resumeEventsStaging
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E3A24;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)managedConfigurationEffectiveSettingsChanged
{
  objc_super v3 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    dispatch_queue_t v7 = "-[ADAnalyticsService managedConfigurationEffectiveSettingsChanged]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E39B0;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)checkForMetricsUploadProblem
{
  objc_super v3 = (os_log_s *)AFSiriLogContextAnalytics;
  BOOL v4 = os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO);
  if (v4)
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[ADAnalyticsService checkForMetricsUploadProblem]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  uint64_t v5 = AFIsInternalInstall(v4);
  if ((_DWORD)v5)
  {
    if ((AFHasUnlockedSinceBoot(v5) & 1) != 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
      dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastMetricsUploadDate]);

      [v7 timeIntervalSinceNow];
      if (v8 <= -21600.0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
        v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastMetricsUploadFailureReportedOnDate]);

        [v10 timeIntervalSinceNow];
        if (v11 >= -86400.0)
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472LL;
          v13[2] = sub_1002E371C;
          v13[3] = &unk_1004FAD88;
          id v14 = v7;
          -[ADAnalyticsService accessStoreUsingBlock:](self, "accessStoreUsingBlock:", v13);
        }
      }
    }

    else
    {
      v12 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[ADAnalyticsService checkForMetricsUploadProblem]";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Skipping check due to storage lock.",  buf,  0xCu);
      }
    }
  }

- (void)stageEvents:(id)a3 endpointUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002E33F4;
  v17[3] = &unk_1004FC838;
  id v10 = a5;
  id v18 = v10;
  double v11 = objc_retainBlock(v17);
  if ([v8 count])
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002E3408;
    block[3] = &unk_1004FDA30;
    void block[4] = self;
    id v14 = v9;
    id v15 = v8;
    v16 = v11;
    dispatch_async(queue, block);
  }

  else
  {
    ((void (*)(void *))v11[2])(v11);
  }
}

- (void)beginEventsGrouping
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E33EC;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)endEventsGrouping
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E33E4;
  block[3] = &unk_1004FD940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)logInstrumentationOfType:(id)a3 machAbsoluteTime:(unint64_t)a4 endpointUUID:(id)a5 turnIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E33CC;
  block[3] = &unk_1004FCF60;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, block);
}

- (void)speechIdUpdatedForEndpointUUID:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002E33C0;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)beginEventsFuzzingWithStartTime:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002E33B4;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)endEventsFuzzingWithEndTime:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1002E33A8;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)stageUEIEventData:(id)a3 timestamp:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E3318;
  block[3] = &unk_1004FB930;
  id v15 = v9;
  unint64_t v16 = a4;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, block);
}

- (void)boostAllConnections:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[ADAnalyticsService boostAllConnections:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1002E2FF4;
  v12[3] = &unk_1004FC838;
  id v13 = v4;
  id v6 = v4;
  dispatch_queue_t v7 = objc_retainBlock(v12);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E3008;
  block[3] = &unk_1004FD990;
  void block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)storeGenericInstrumentation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[ADAnalyticsService storeGenericInstrumentation:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002E2F94;
  v17[3] = &unk_1004FC838;
  id v18 = v7;
  id v9 = v7;
  id v10 = objc_retainBlock(v17);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002E2FA8;
  block[3] = &unk_1004FD990;
  id v15 = v6;
  id v16 = v10;
  id v12 = v10;
  id v13 = v6;
  dispatch_async(queue, block);
}

- (void)_publishEventsToObserver:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002E2E9C;
  v17[3] = &unk_1004FC838;
  id v7 = a4;
  id v18 = v7;
  id v8 = objc_retainBlock(v17);
  id v9 = v8;
  observerConnection = self->_observerConnection;
  if (observerConnection)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1002E2EB0;
    v15[3] = &unk_1004FCC00;
    id v11 = v8;
    id v16 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( observerConnection,  "remoteObjectProxyWithErrorHandler:",  v15));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002E2F88;
    v13[3] = &unk_1004FC838;
    id v14 = v11;
    [v12 didObserveEvents:v6 completion:v13];
  }

  else
  {
    ((void (*)(void *))v8[2])(v8);
  }
}

- (void)observeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002E2E48;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)flushWithCompletion:(id)a3
{
}

- (void)homehubManager:(id)a3 didReceiveLaunchNotificationForEndpointUUID:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAnalyticsService homehubManager:didReceiveLaunchNotificationForEndpointUUID:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s endpointUUID = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002E2DA0;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)homehubManager:(id)a3 didAddEndpointWithContext:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAnalyticsService homehubManager:didAddEndpointWithContext:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s instanceContext = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002E2D58;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)homehubManager:(id)a3 didActivateEndpointWithContext:(id)a4
{
  id v5 = a4;
  id v6 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAnalyticsService homehubManager:didActivateEndpointWithContext:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s instanceContext = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002E2D10;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)homehubManager:(id)a3 didDeactivateEndpointWithContext:(id)a4
{
  id v4 = a4;
  id v5 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[ADAnalyticsService homehubManager:didDeactivateEndpointWithContext:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s instanceContext = %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)homehubManager:(id)a3 didDeleteEndpointWithContext:(id)a4
{
  id v5 = a4;
  int v6 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[ADAnalyticsService homehubManager:didDeleteEndpointWithContext:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s instanceContext = %@", buf, 0x16u);
  }

  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1002E2CC8;
  v9[3] = &unk_1004FD968;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (id)_speechIdByEndpointUUID
{
  speechIdByEndpointUUID = self->_speechIdByEndpointUUID;
  if (!speechIdByEndpointUUID)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v5 = self->_speechIdByEndpointUUID;
    self->_speechIdByEndpointUUID = v4;

    speechIdByEndpointUUID = self->_speechIdByEndpointUUID;
  }

  return speechIdByEndpointUUID;
}

- (id)_determineSpeechIdForEndpointUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsService _speechIdByEndpointUUID](self, "_speechIdByEndpointUUID"));
    int v6 = (NSString *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

    if (!v6)
    {
      id v7 = -[AFInstanceContext initWithEndpointUUID:loadsEndpointOnDemand:]( objc_alloc(&OBJC_CLASS___AFInstanceContext),  "initWithEndpointUUID:loadsEndpointOnDemand:",  v4,  0LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ADAccount activeAccountForInstanceContext:]( &OBJC_CLASS___ADAccount,  "activeAccountForInstanceContext:",  v7));
      int v6 = (NSString *)objc_claimAutoreleasedReturnValue([v8 speechIdentifier]);

      if (v6)
      {
        id v9 = self;
        id v10 = v6;
        id v11 = v4;
LABEL_9:
        -[ADAnalyticsService _setSpeechId:forEndpointUUID:](v9, "_setSpeechId:forEndpointUUID:", v10, v11);
      }
    }
  }

  else
  {
    speechId = self->_speechId;
    if (speechId)
    {
      int v6 = speechId;
    }

    else
    {
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADAccount activeAccount](&OBJC_CLASS___ADAccount, "activeAccount"));
      int v6 = (NSString *)objc_claimAutoreleasedReturnValue([v13 speechIdentifier]);

      if (v6)
      {
        id v9 = self;
        id v10 = v6;
        id v11 = 0LL;
        goto LABEL_9;
      }
    }
  }

  return v6;
}

- (void)_clearSpeechIdForEndpointUUID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADAnalyticsService _speechIdByEndpointUUID](self, "_speechIdByEndpointUUID"));
  [v5 removeObjectForKey:v4];
}

- (void)_setSpeechId:(id)a3 forEndpointUUID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9 && !v6)
  {
    id v7 = (NSString *)v9;
    speechId = self->_speechId;
    self->_speechId = v7;
LABEL_7:

    goto LABEL_8;
  }

  if (v9 && v6)
  {
    speechId = (NSString *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsService _speechIdByEndpointUUID](self, "_speechIdByEndpointUUID"));
    -[NSString setObject:forKey:](speechId, "setObject:forKey:", v9, v6);
    goto LABEL_7;
  }

- (void)_speechIdUpdatedForEndpointUUID:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[ADAnalyticsService _speechIdUpdatedForEndpointUUID:]";
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s endpointUUID = %@", buf, 0x16u);
  }

  if (v4)
  {
    id v6 = -[AFInstanceContext initWithEndpointUUID:loadsEndpointOnDemand:]( objc_alloc(&OBJC_CLASS___AFInstanceContext),  "initWithEndpointUUID:loadsEndpointOnDemand:",  v4,  0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ADAccount activeAccountForInstanceContext:]( &OBJC_CLASS___ADAccount,  "activeAccountForInstanceContext:",  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 speechIdentifier]);

    if (v8)
    {
      -[ADAnalyticsService _setSpeechId:forEndpointUUID:](self, "_setSpeechId:forEndpointUUID:", v8, v4);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsService _store](self, "_store"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1002E2BE4;
      v19[3] = &unk_1004FC278;
      id v20 = v9;
      id v11 = v8;
      id v21 = v11;
      id v12 = v9;
      [v10 updateRecordsWithSpeechId:v12 toUpdatedSpeechId:v11 withCompletion:v19];
    }

    else
    {
      id v15 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[ADAnalyticsService _speechIdUpdatedForEndpointUUID:]";
        __int16 v26 = 2112;
        id v27 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Unable to determine speechId for endpoint (%@)",  buf,  0x16u);
      }

      id v11 = 0LL;
    }
  }

  else
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADAccount activeAccount](&OBJC_CLASS___ADAccount, "activeAccount"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 speechIdentifier]);

    if (v14)
    {
      objc_storeStrong((id *)&self->_speechId, v14);
    }

    else
    {
      id v16 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[ADAnalyticsService _speechIdUpdatedForEndpointUUID:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Unable to determine speechId for hub",  buf,  0xCu);
      }
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsService _store](self, "_store"));
    speechId = self->_speechId;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1002E2B08;
    v22[3] = &unk_1004FAE50;
    id v23 = v14;
    id v11 = v14;
    [v17 updateRecordsWithSpeechId:0 toUpdatedSpeechId:speechId withCompletion:v22];
  }
}

- (id)_store
{
  if (!self->_store)
  {
    objc_super v3 = objc_alloc(&OBJC_CLASS___ADAnalyticsStore);
    id v4 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"SiriAnalytics.db"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v8 = -[ADAnalyticsStore initWithPath:](v3, "initWithPath:", v7);
    store = self->_store;
    self->_store = v8;

    if ((AFIsInternalInstall(v10) & 1) != 0
      || (id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences")),
          unsigned int v12 = [v11 shouldLogForQA],
          v11,
          v12))
    {
      -[ADAnalyticsService _linkStoreForSysdiagnose](self, "_linkStoreForSysdiagnose");
    }

    else
    {
      -[ADAnalyticsService _unlinkStoreForSysdiagnose](self, "_unlinkStoreForSysdiagnose");
    }
  }

  return self->_store;
}

- (void)_addConnection:(id)a3
{
}

- (void)_signalConnectionDisruption:(id)a3
{
  id v4 = [a3 processIdentifier];
  connectionDisruptedObservers = self->_connectionDisruptedObservers;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](connectionDisruptedObservers, "objectForKey:", v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      __int16 v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v13) + 16LL))(*(void *)(*((void *)&v14 + 1) + 8LL * (void)v13));
        __int16 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }
}

- (void)_removeConnection:(id)a3
{
}

- (void)_observeConnectionDisrupted:(int)a3 observer:(id)a4 referenceId:(id)a5
{
  if (a4 && a5)
  {
    uint64_t v6 = *(void *)&a3;
    id v8 = a5;
    id v15 = [a4 copy];
    connectionDisruptedObservers = self->_connectionDisruptedObservers;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](connectionDisruptedObservers, "objectForKey:", v10));

    if (!v11)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      uint64_t v12 = self->_connectionDisruptedObservers;
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v6));
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, v13);
    }

    id v14 = objc_retainBlock(v15);
    [v11 setObject:v14 forKey:v8];
  }

- (void)_stopObservingConnectionDisrupted:(int)a3 referenceId:(id)a4
{
  if (a4)
  {
    uint64_t v4 = *(void *)&a3;
    connectionDisruptedObservers = self->_connectionDisruptedObservers;
    id v7 = a4;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
    id v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](connectionDisruptedObservers, "objectForKey:", v8));

    [v11 removeObjectForKey:v7];
    if (![v11 count])
    {
      id v9 = self->_connectionDisruptedObservers;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
      -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);
    }
  }

- (void)_enumerateConnectionsAsServiceDelegates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002E2928;
  v11[3] = &unk_1004FBE08;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 barrier:v11];
}

- (void)_executeDelegateBlockOnAllConnections:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_group_create();
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  dispatch_group_enter(v8);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1002E23D0;
  v19[3] = &unk_1004FAEE8;
  id v20 = v8;
  id v21 = v9;
  v22 = self;
  id v23 = v6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002E2654;
  v17[3] = &unk_1004FD940;
  id v18 = v20;
  id v10 = v20;
  id v11 = v6;
  id v12 = v9;
  -[ADAnalyticsService _enumerateConnectionsAsServiceDelegates:completion:]( self,  "_enumerateConnectionsAsServiceDelegates:completion:",  v19,  v17);
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002E265C;
  v15[3] = &unk_1004FC838;
  id v16 = v7;
  id v14 = v7;
  dispatch_group_notify(v10, queue, v15);
}

- (void)_stageEvent:(id)a3
{
}

- (void)_stageEvents:(id)a3
{
}

- (id)_unstageEvents
{
  objc_super v3 = self->_stagedEvents;
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  stagedEvents = self->_stagedEvents;
  self->_stagedEvents = v4;

  return v3;
}

- (void)_processStagedEvents
{
  v2 = self;
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsService _unstageEvents](self, "_unstageEvents"));
  if ([v3 count])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
    unsigned int v5 = [v4 isDictationHIPAACompliant];

    if (v5)
    {
      id v6 = (os_log_s *)AFSiriLogContextAnalytics;
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v86 = "-[ADAnalyticsService _processStagedEvents]";
        id v7 = "%s Dont unstage the events and send them, because we have HIPAA On-Device Dictation enabled";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, buf, 0xCu);
      }
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[AFSiriDataSharingSensitivityManager shared]( &OBJC_CLASS___AFSiriDataSharingSensitivityManager,  "shared"));
      unsigned int v9 = [v8 isOptedOutOfMTE];

      if (v9)
      {
        id v6 = (os_log_s *)AFSiriLogContextAnalytics;
        if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v86 = "-[ADAnalyticsService _processStagedEvents]";
          id v7 = "%s #MTEOptOut Skipping writing staged events to disk because device is opted out of MTE";
          goto LABEL_8;
        }
      }

      else
      {
        id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v77 = 0u;
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        v47 = v3;
        id obj = v3;
        id v11 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v78;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v78 != v13) {
                objc_enumerationMutation(obj);
              }
              id v15 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)i);
              uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 speechId]);
              if (v16) {
                __int128 v17 = (__CFString *)v16;
              }
              else {
                __int128 v17 = @"unknown";
              }
              id v18 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v10, "objectForKey:", v17));
              if (!v18)
              {
                id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
                -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v18, v17);
              }

              -[NSMutableSet addObject:](v18, "addObject:", v15);
            }

            id v12 = [obj countByEnumeratingWithState:&v77 objects:v84 count:16];
          }

          while (v12);
        }

        id v19 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [obj count]);
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        v51 = v10;
        id v50 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v73,  v83,  16LL);
        if (v50)
        {
          uint64_t v49 = *(void *)v74;
          v54 = v19;
          v55 = v2;
          do
          {
            uint64_t v20 = 0LL;
            do
            {
              if (*(void *)v74 != v49) {
                objc_enumerationMutation(v51);
              }
              uint64_t v52 = v20;
              uint64_t v57 = *(void *)(*((void *)&v73 + 1) + 8 * v20);
              id v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v51, "objectForKey:"));
              __int128 v69 = 0u;
              __int128 v70 = 0u;
              __int128 v71 = 0u;
              __int128 v72 = 0u;
              id v53 = v21;
              id v58 = [v21 countByEnumeratingWithState:&v69 objects:v82 count:16];
              if (v58)
              {
                uint64_t v56 = *(void *)v70;
                do
                {
                  for (j = 0LL; j != v58; j = (char *)j + 1)
                  {
                    if (*(void *)v70 != v56) {
                      objc_enumerationMutation(v53);
                    }
                    id v23 = (AFAnalyticsEvent *)*(id *)(*((void *)&v69 + 1) + 8LL * (void)j);
                    v24 = v2->_streamUID;
                    if (-[AFQueue count](v2->_fuzzingIntervals, "count"))
                    {
                      v59 = j;
                      __int128 v67 = 0u;
                      __int128 v68 = 0u;
                      __int128 v65 = 0u;
                      __int128 v66 = 0u;
                      v61 = v2->_fuzzingIntervals;
                      id v25 = -[AFQueue countByEnumeratingWithState:objects:count:]( v61,  "countByEnumeratingWithState:objects:count:",  &v65,  v81,  16LL);
                      if (v25)
                      {
                        id v26 = v25;
                        uint64_t v27 = *(void *)v66;
                        v60 = v23;
                        v28 = v23;
                        do
                        {
                          for (k = 0LL; k != v26; k = (char *)k + 1)
                          {
                            if (*(void *)v66 != v27) {
                              objc_enumerationMutation(v61);
                            }
                            v30 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)k);
                            id v31 = -[AFAnalyticsEvent timestamp](v28, "timestamp");
                            if (v31 >= [v30 startTime])
                            {
                              if (![v30 endTime]
                                || (id v32 = -[AFAnalyticsEvent timestamp](v28, "timestamp"),
                                    v32 <= [v30 endTime]))
                              {
                                uint64_t v62 = objc_claimAutoreleasedReturnValue([v30 streamUID]);

                                v33 = (char *)-[AFAnalyticsEvent timestamp](v60, "timestamp");
                                v34 = &v33[(void)[v30 offset]];
                                objc_super v35 = objc_alloc(&OBJC_CLASS___AFAnalyticsEvent);
                                id v36 = -[AFAnalyticsEvent deliveryStream](v60, "deliveryStream");
                                id v37 = -[AFAnalyticsEvent type](v60, "type");
                                id v38 = v26;
                                uint64_t v39 = v27;
                                id v40 = -[AFAnalyticsEvent contextDataType](v60, "contextDataType");
                                v41 = (void *)objc_claimAutoreleasedReturnValue(-[AFAnalyticsEvent contextData](v60, "contextData"));
                                v42 = -[AFAnalyticsEvent initWithDeliveryStream:type:timestamp:contextDataType:contextData:]( v35,  "initWithDeliveryStream:type:timestamp:contextDataType:contextData:",  v36,  v37,  v34,  v40,  v41);

                                v24 = (NSString *)v62;
                                v28 = v42;
                                uint64_t v27 = v39;
                                id v26 = v38;
                              }
                            }
                          }

                          id v26 = -[AFQueue countByEnumeratingWithState:objects:count:]( v61,  "countByEnumeratingWithState:objects:count:",  &v65,  v81,  16LL);
                        }

                        while (v26);
                      }

                      else
                      {
                        v28 = v23;
                      }

                      id v23 = v28;
                      id v19 = v54;
                      v2 = v55;
                      j = v59;
                    }

                    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                    v44 = v23;
                    id v45 = [[AFAnalyticsEventRecord alloc] initWithEvent:v23 streamUID:v24 dateCreated:v43 speechId:v57];
                    if (v45) {
                      -[NSMutableArray addObject:](v19, "addObject:", v45);
                    }
                  }

                  id v58 = [v53 countByEnumeratingWithState:&v69 objects:v82 count:16];
                }

                while (v58);
              }

              uint64_t v20 = v52 + 1;
            }

            while ((id)(v52 + 1) != v50);
            id v50 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v51,  "countByEnumeratingWithState:objects:count:",  &v73,  v83,  16LL);
          }

          while (v50);
        }

        if (-[NSMutableArray count](v19, "count"))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsService _store](v2, "_store"));
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472LL;
          v63[2] = sub_1002E22D4;
          v63[3] = &unk_1004FAE50;
          id v64 = obj;
          [v46 insertEventRecords:v19 completion:v63];
        }

        objc_super v3 = v47;
      }
    }
  }
}

- (void)_beginEventsGrouping
{
  int64_t depthOfEventsGrouping = self->_depthOfEventsGrouping;
  self->_int64_t depthOfEventsGrouping = depthOfEventsGrouping + 1;
  if (!depthOfEventsGrouping)
  {
    -[ADAnalyticsService _stopHouseKeepingTimer](self, "_stopHouseKeepingTimer");
    -[ADAnalyticsService _startHouseKeepingTimer](self, "_startHouseKeepingTimer");
  }

- (void)_endEventsGrouping
{
  int64_t v2 = self->_depthOfEventsGrouping - 1;
  self->_int64_t depthOfEventsGrouping = v2;
  if (!v2)
  {
    -[ADAnalyticsService _stopHouseKeepingTimer](self, "_stopHouseKeepingTimer");
    -[ADAnalyticsService _startHouseKeepingTimer](self, "_startHouseKeepingTimer");
  }

- (void)_suspendEventsStaging
{
  if (self->_isSuspended)
  {
    int64_t v2 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136315138;
      uint64_t v4 = "-[ADAnalyticsService _suspendEventsStaging]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s Attempted to suspend events staging while already suspended.",  (uint8_t *)&v3,  0xCu);
    }
  }

  else
  {
    self->_isSuspended = 1;
  }

- (void)_resumeEventsStaging
{
  if (self->_isSuspended)
  {
    self->_isSuspended = 0;
  }

  else
  {
    int64_t v2 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136315138;
      uint64_t v4 = "-[ADAnalyticsService _resumeEventsStaging]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s Attempted to resume events staging while not suspended.",  (uint8_t *)&v3,  0xCu);
    }
  }

- (void)_startHouseKeepingTimer
{
  if (!self->_houseKeepingTimer)
  {
    int64_t depthOfEventsGrouping = self->_depthOfEventsGrouping;
    uint64_t v4 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_queue);
    houseKeepingTimer = self->_houseKeepingTimer;
    self->_houseKeepingTimer = v4;

    id v6 = self->_houseKeepingTimer;
    if (depthOfEventsGrouping <= 0) {
      int64_t v7 = 4000000000LL;
    }
    else {
      int64_t v7 = 16000000000LL;
    }
    dispatch_time_t v8 = dispatch_time(0LL, v7);
    dispatch_source_set_timer((dispatch_source_t)v6, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak(&location, self);
    unsigned int v9 = self->_houseKeepingTimer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002E2298;
    v10[3] = &unk_1004FAF58;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v9, v10);
    dispatch_resume((dispatch_object_t)self->_houseKeepingTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

- (void)_stopHouseKeepingTimer
{
  houseKeepingTimer = self->_houseKeepingTimer;
  if (houseKeepingTimer)
  {
    dispatch_source_cancel((dispatch_source_t)houseKeepingTimer);
    uint64_t v4 = self->_houseKeepingTimer;
    self->_houseKeepingTimer = 0LL;
  }

- (void)_houseKeeperArrived
{
}

- (void)_beginEventsFuzzingWithStartTime:(unint64_t)a3
{
  if (self->_isFuzzing)
  {
    int v3 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      id v11 = "-[ADAnalyticsService _beginEventsFuzzingWithStartTime:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Haven't ended previous fuzzing interval, unable to begin new one",  (uint8_t *)&v10,  0xCu);
    }
  }

  else
  {
    self->_isFuzzing = 1;
    unsigned int v5 = -[ADAnalyticsFuzzingInterval initWithStartTime:]( objc_alloc(&OBJC_CLASS___ADAnalyticsFuzzingInterval),  "initWithStartTime:",  a3);
    objc_storeStrong((id *)&self->_currentFuzzingInterval, v5);
    -[AFQueue enqueueObject:](self->_fuzzingIntervals, "enqueueObject:", self->_currentFuzzingInterval);
    id v6 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      int64_t v7 = v6;
      unint64_t v8 = -[ADAnalyticsFuzzingInterval startTime](v5, "startTime");
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsFuzzingInterval streamUID](v5, "streamUID"));
      int v10 = 136315650;
      id v11 = "-[ADAnalyticsService _beginEventsFuzzingWithStartTime:]";
      __int16 v12 = 2048;
      unint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Fuzzing time interval created with start time: %lld streamUID: %@",  (uint8_t *)&v10,  0x20u);
    }
  }

- (void)_endEventsFuzzingWithEndTime:(unint64_t)a3
{
  if (self->_isFuzzing)
  {
    unsigned int v5 = self->_currentFuzzingInterval;
    self->_isFuzzing = 0;
    -[ADAnalyticsFuzzingInterval setEndTime:](v5, "setEndTime:", a3);
    id v6 = (void *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
    {
      int64_t v7 = v6;
      unint64_t v8 = -[ADAnalyticsFuzzingInterval endTime](v5, "endTime");
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsFuzzingInterval streamUID](v5, "streamUID"));
      *(_DWORD *)buf = 136315650;
      unint64_t v13 = "-[ADAnalyticsService _endEventsFuzzingWithEndTime:]";
      __int16 v14 = 2048;
      unint64_t v15 = v8;
      __int16 v16 = 2112;
      __int128 v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Fuzzing time interval ended with end time: %lld streamUID: %@",  buf,  0x20u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1002E21D4;
    v11[3] = &unk_1004FD940;
    v11[4] = self;
    -[ADAnalyticsService flushWithCompletion:](self, "flushWithCompletion:", v11);
  }

  else
  {
    int v10 = (os_log_s *)AFSiriLogContextAnalytics;
    if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v13 = "-[ADAnalyticsService _endEventsFuzzingWithEndTime:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Haven't start a fuzzing interval, unable to end",  buf,  0xCu);
    }
  }

- (void)_linkStoreForSysdiagnose
{
  int v3 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[ADAnalyticsService _linkStoreForSysdiagnose]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  uint64_t v4 = AFAnalyticsLogsDirectory();
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = AFAnalyticsLogsDirectory();
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore path](self->_store, "path"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (([v11 fileExistsAtPath:v10 isDirectory:0] & 1) == 0)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1002E2058;
    v18[3] = &unk_1004FD4C0;
    id v12 = v11;
    id v19 = v12;
    id v20 = v10;
    id v21 = self;
    unint64_t v13 = objc_retainBlock(v18);
    if ([v12 fileExistsAtPath:v5])
    {
      ((void (*)(void *))v13[2])(v13);
    }

    else
    {
      id v17 = 0LL;
      unsigned int v14 = [v12 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v17];
      id v15 = v17;
      if (v14)
      {
        ((void (*)(void *))v13[2])(v13);
      }

      else
      {
        __int16 v16 = (os_log_s *)AFSiriLogContextAnalytics;
        if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          id v23 = "-[ADAnalyticsService _linkStoreForSysdiagnose]";
          __int16 v24 = 2112;
          id v25 = v5;
          __int16 v26 = 2112;
          id v27 = v15;
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Failed to create directory at %@ due to error %@.",  buf,  0x20u);
        }
      }
    }
  }
}

- (void)_unlinkStoreForSysdiagnose
{
  int v3 = (os_log_s *)AFSiriLogContextAnalytics;
  if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[ADAnalyticsService _unlinkStoreForSysdiagnose]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  uint64_t v4 = AFAnalyticsLogsDirectory();
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADAnalyticsStore path](self->_store, "path"));
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v7]);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v9 fileExistsAtPath:v8 isDirectory:0])
  {
    id v13 = 0LL;
    unsigned int v10 = [v9 removeItemAtPath:v8 error:&v13];
    id v11 = v13;
    id v12 = (os_log_s *)AFSiriLogContextAnalytics;
    if (v10)
    {
      if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v15 = "-[ADAnalyticsService _unlinkStoreForSysdiagnose]";
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Deleted link at %@.", buf, 0x16u);
      }
    }

    else if (os_log_type_enabled(AFSiriLogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "-[ADAnalyticsService _unlinkStoreForSysdiagnose]";
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Failed to delete link at %@ due to error %@.",  buf,  0x20u);
    }
  }
}

- (void).cxx_destruct
{
}

+ (id)sharedService
{
  if (qword_100578480 != -1) {
    dispatch_once(&qword_100578480, &stru_1004FAD38);
  }
  return (id)qword_100578488;
}

@end