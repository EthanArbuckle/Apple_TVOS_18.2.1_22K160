@interface ADDaemon
+ (double)processLaunchTime;
+ (id)sharedDaemon;
+ (unint64_t)processLaunchMachTime;
+ (unint64_t)processLoadedMachTime;
- (ADDaemon)init;
- (BOOL)_analyticsListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_analyticsObservationListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_audioSessionAssertionServiceListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_clientListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_dictationListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_locationServiceListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_managedStorageListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_notificationServiceListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_securityListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_settingsListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)_synapseSyncListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_peerLocationService;
- (id)_proxyService;
- (id)_synapseAppBundleIDFromPossibleDeamonBundleID:(id)a3;
- (void)_bundleID:(id *)a3 andPath:(id *)a4 forXPCConnection:(id)a5;
- (void)_daemonDidLaunchWithContext:(id)a3;
- (void)_daemonWillShutdown;
- (void)_enabledBitsChanged:(id)a3;
- (void)_meDeviceChanged:(id)a3;
- (void)_registerForSyncNotifications;
- (void)_registerSyncCoalescedJob;
- (void)_setupAnalyticsListener;
- (void)_setupAnalyticsObservationListener;
- (void)_setupAnnouncementSpeakingStatePublisher;
- (void)_setupAudioSessionAssertionAcquisitionService;
- (void)_setupAudioSessionAssertionServiceListener;
- (void)_setupClientListener;
- (void)_setupClientLiteListener;
- (void)_setupCloudKit;
- (void)_setupDictationListener;
- (void)_setupDistributedNotificationHandlers;
- (void)_setupExternalRequestListener;
- (void)_setupHomeKit;
- (void)_setupIDSServices;
- (void)_setupInternal;
- (void)_setupLocationService;
- (void)_setupLocationServiceListener;
- (void)_setupManagedStorageListener;
- (void)_setupMemoryPressureObservation;
- (void)_setupMobileGestaltNotificationHandlers;
- (void)_setupNotificationServiceListener;
- (void)_setupNotifyHandlers;
- (void)_setupOfflineDictationStatusObserver;
- (void)_setupPairedSync;
- (void)_setupPommesSearchService;
- (void)_setupRapportServices;
- (void)_setupSecurityListener;
- (void)_setupSessionLanguage;
- (void)_setupSettingsListener;
- (void)_setupSiriAnalyticsListener;
- (void)_setupSynapseSyncListener;
- (void)_setupSyncListener;
- (void)_setupTetherListener;
- (void)_syncForReason:(id)a3 withCoalescing:(BOOL)a4;
- (void)_xpcActivityRemoraStatusCheck;
- (void)dealloc;
- (void)keepAlive;
- (void)runWithLaunchContext:(id)a3;
- (void)scheduleDestroyJob;
- (void)scheduleUnlockedWork:(id)a3;
- (void)scheduleValidationRefreshForInterval:(double)a3;
- (void)shutdown;
- (void)startUIRequestWithInfo:(id)a3;
- (void)startUISpeechRequest;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncForReason:(id)a3 withCoalescing:(BOOL)a4;
- (void)unscheduleDestroyJob;
@end

@implementation ADDaemon

- (ADDaemon)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADDaemon;
  v2 = -[ADDaemon init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_attr_t initially_inactive = dispatch_queue_attr_make_initially_inactive(v6);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(initially_inactive);

    dispatch_queue_t v9 = dispatch_queue_create("ADDaemon", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ADDaemon;
  -[ADDaemon dealloc](&v3, "dealloc");
}

- (void)runWithLaunchContext:(id)a3
{
  id v6 = a3;
  v4 = objc_autoreleasePoolPush();
  CFBundleGetMainBundle();
  -[ADDaemon _daemonDidLaunchWithContext:](self, "_daemonDidLaunchWithContext:", v6);
  objc_autoreleasePoolPop(v4);
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v5 run];
}

- (void)shutdown
{
}

- (void)keepAlive
{
  v6[0] = 0LL;
  v6[1] = v6;
  v6[2] = 0x3032000000LL;
  v6[3] = sub_1000CB714;
  v6[4] = sub_1000CB724;
  id v7 = (id)os_transaction_create("keepAlive", a2);
  dispatch_time_t v3 = dispatch_time(0LL, 10000000000LL);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CC5EC;
  block[3] = &unk_1004FDB20;
  block[4] = v6;
  dispatch_after(v3, queue, block);
  _Block_object_dispose(v6, 8);
}

- (void)_setupInternal
{
  if (AFIsInternalInstall(self, a2) && _AFPreferencesNetworkLoggingEnabled())
  {
    v2 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v3 = 136315138;
      v4 = "-[ADDaemon _setupInternal]";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s Enabling CFNetwork diagnostics",  (uint8_t *)&v3,  0xCu);
    }

    setenv("CFNETWORK_DIAGNOSTICS", "3", 1);
    setenv("CFNETWORK_DIAGNOSTICS_NO_SYSLOG", "1", 1);
  }

- (void)_setupRapportServices
{
  id v4 = +[ADCoreSpeechService sharedService](&OBJC_CLASS___ADCoreSpeechService, "sharedService");
  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCompanionService sharedInstance](&OBJC_CLASS___ADCompanionService, "sharedInstance"));
  [v5 startListeningForRemote];

  xpc_set_event_stream_handler("com.apple.rapport.matching", (dispatch_queue_t)self->_queue, &stru_1004F0370);
}

- (void)_setupLocationService
{
}

- (void)_setupLocationServiceListener
{
  id v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAFLocationServiceMachServiceName));
  locationServiceListener = self->_locationServiceListener;
  self->_locationServiceListener = v3;

  -[NSXPCListener setDelegate:](self->_locationServiceListener, "setDelegate:", self);
  dispatch_queue_attr_t v5 = self->_locationServiceListener;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ADLocationService sharedService](&OBJC_CLASS___ADLocationService, "sharedService"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dispatchQueue]);
  -[NSXPCListener _setQueue:](v5, "_setQueue:", v7);

  -[NSXPCListener resume](self->_locationServiceListener, "resume");
}

- (BOOL)_locationServiceListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  char HasEntitlement = AFConnectionHasEntitlement();
  if ((HasEntitlement & 1) != 0)
  {
    unsigned int v5 = [v3 processIdentifier];
    id v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      v13 = "-[ADDaemon _locationServiceListenerShouldAcceptNewConnection:]";
      __int16 v14 = 2112;
      id v15 = v3;
      __int16 v16 = 1024;
      unsigned int v17 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s %@ Location Service Connection Connected (pid=%d])",  (uint8_t *)&v12,  0x1Cu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADLocationService sharedService](&OBJC_CLASS___ADLocationService, "sharedService"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFLocationServiceInterface));
    [v3 setExportedInterface:v8];

    [v3 setExportedObject:v7];
    dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dispatchQueue]);
    [v3 _setQueue:v9];

    [v3 resume];
  }

  else
  {
    v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      v13 = "-[ADDaemon _locationServiceListenerShouldAcceptNewConnection:]";
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s %@ Location Service Connection does not have required entitlements.",  (uint8_t *)&v12,  0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupIDSServices
{
  if ((AFIsNano(self) & 1) == 0)
  {
    id v3 = -[ADDaemon _proxyService](self, "_proxyService");
    id v4 = -[ADDaemon _peerLocationService](self, "_peerLocationService");
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v6 = [v5 _sharedDataService];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v7 listenForSharedDataFromCloud];

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[ADPeerCloudService sharedInstance](&OBJC_CLASS___ADPeerCloudService, "sharedInstance"));
  [v8 startListeningForRemote];
}

- (id)_proxyService
{
  if (!self->_proxyRemote && AFSupportsPairedDevice())
  {
    id v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "-[ADDaemon _proxyService]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Starting Siri Connection Proxy",  (uint8_t *)&v7,  0xCu);
    }

    id v4 = objc_alloc_init(&OBJC_CLASS___ADSiriConnectionRemote);
    proxyRemote = self->_proxyRemote;
    self->_proxyRemote = v4;
  }

  return self->_proxyRemote;
}

- (id)_peerLocationService
{
  if (!self->_peerLocationManagerRemote && AFSupportsPairedDevice())
  {
    id v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "-[ADDaemon _peerLocationService]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Starting Peer Location Service",  (uint8_t *)&v7,  0xCu);
    }

    id v4 = objc_alloc_init(&OBJC_CLASS___ADPeerLocationRemote);
    peerLocationManagerRemote = self->_peerLocationManagerRemote;
    self->_peerLocationManagerRemote = v4;
  }

  return self->_peerLocationManagerRemote;
}

- (void)_setupClientListener
{
  id v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantClientServiceName));
  clientListener = self->_clientListener;
  self->_clientListener = v3;

  -[NSXPCListener setDelegate:](self->_clientListener, "setDelegate:", self);
  unsigned int v5 = self->_clientListener;
  id v6 = (dispatch_queue_s *)(id)qword_1005780B0;
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UNSPECIFIED, 0);
  v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);

  dispatch_queue_t v11 = dispatch_queue_create_with_target_V2(0LL, v10, v6);
  -[NSXPCListener _setQueue:](v5, "_setQueue:", v11);

  -[NSXPCListener resume](self->_clientListener, "resume");
}

- (BOOL)_clientListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 processIdentifier];
  uint64_t v5 = kAssistantClientEntitlement;
  char HasEntitlement = AFConnectionHasEntitlement(v3, kAssistantClientEntitlement);
  if ((HasEntitlement & 1) != 0)
  {
    *(void *)v45 = 0LL;
    *(void *)&v45[8] = v45;
    *(void *)&v45[16] = 0x3032000000LL;
    *(void *)&v45[24] = sub_1000CB714;
    v46 = sub_1000CB724;
    id v47 = (id)os_transaction_create("_setupClientListener", v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    [v8 beginMonitoring];

    dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
    [v9 beginEventsGrouping];

    if (AFIsNano(v10) && (AFDeviceSupportsSiriUOD() & 1) == 0)
    {
      dispatch_queue_t v11 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v40 = "-[ADDaemon _clientListenerShouldAcceptNewConnection:]";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Preheating session on client connection",  buf,  0xCu);
      }

      int v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      [v12 preheatWithStyle:3 forOptions:0 completion:0];
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    if (AFIsHorseman(v13, v14)) {
      [v13 showingVisibleAssistantUIForReason:@"ADLocationInUseReasonHorsemanConnected" completion:0];
    }
    id v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v40 = "-[ADDaemon _clientListenerShouldAcceptNewConnection:]";
      __int16 v41 = 2112;
      id v42 = v3;
      __int16 v43 = 1024;
      unsigned int v44 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s %@ Client Connection Connected (pid=%d])",  buf,  0x1Cu);
    }

    uint64_t v16 = AFClientServiceDelegateXPCInterface();
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v3 setRemoteObjectInterface:v17];

    uint64_t v18 = AFClientServiceXPCInterface();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v3 setExportedInterface:v19];

    v20 = (dispatch_queue_s *)(id)qword_1005780B0;
    dispatch_queue_attr_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v21);
    dispatch_queue_attr_t v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_UNSPECIFIED, 0);
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v23);

    dispatch_queue_t v25 = dispatch_queue_create_with_target_V2(0LL, v24, v20);
    [v3 _setQueue:v25];

    v26 = -[ADClientConnection initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___ADClientConnection),  "initWithXPCConnection:",  v3);
    [v3 setExportedObject:v26];
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    v33 = sub_1000CC384;
    v34 = &unk_1004F0398;
    v27 = v26;
    v35 = v27;
    unsigned int v38 = v4;
    id v28 = v13;
    id v36 = v28;
    v37 = v45;
    [v3 setInvalidationHandler:&v31];
    objc_msgSend(v28, "clientConnected:", v27, v31, v32, v33, v34);
    [v3 resume];

    _Block_object_dispose(v45, 8);
  }

  else
  {
    v29 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v45 = 136315650;
      *(void *)&v45[4] = "-[ADDaemon _clientListenerShouldAcceptNewConnection:]";
      *(_WORD *)&v45[12] = 1024;
      *(_DWORD *)&v45[14] = v4;
      *(_WORD *)&v45[18] = 2112;
      *(void *)&v45[20] = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s Rejecting connection attempt by PID %d because it is missing the entitlement %@",  v45,  0x1Cu);
    }
  }

  return HasEntitlement;
}

- (void)startUIRequestWithInfo:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CC34C;
  block[3] = &unk_1004FD940;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)startUISpeechRequest
{
}

- (BOOL)_dictationListenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 processIdentifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
  dispatch_queue_attr_t v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[ADDaemon _dictationListenerShouldAcceptNewConnection:]";
    __int16 v30 = 2112;
    id v31 = v4;
    __int16 v32 = 1024;
    int v33 = (int)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s %@ Dictation Connection Connected (pid=%d])",  buf,  0x1Cu);
  }

  NSUInteger v8 = -[NSCountedSet countForObject:](self->_dictationPidSet, "countForObject:", v6);
  if (v8 >= 0x10)
  {
    uint64_t v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[ADDaemon _dictationListenerShouldAcceptNewConnection:]";
      __int16 v30 = 1024;
      LODWORD(v31) = (_DWORD)v5;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "%s Too many connections from pid %d, refusing connection",  buf,  0x12u);
    }
  }

  else
  {
    dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
    [v9 beginMonitoring];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
    [v10 beginEventsGrouping];

    uint64_t v11 = AFDictationServiceDelegateXPCInterface(-[NSCountedSet addObject:](self->_dictationPidSet, "addObject:", v6));
    int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v4 setRemoteObjectInterface:v12];

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFDictationService));
    [v4 setExportedInterface:v13];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxy]);
    id v15 = -[ADDictationConnection initWithServiceDelegate:]( objc_alloc(&OBJC_CLASS___ADDictationConnection),  "initWithServiceDelegate:",  v14);
    [v4 setExportedObject:v15];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ADDictationConnection queue](v15, "queue"));
    [v4 _setQueue:v16];

    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_1000CC1A0;
    dispatch_queue_attr_t v23 = &unk_1004FAE98;
    int v27 = (int)v5;
    v24 = v15;
    dispatch_queue_t v25 = self;
    id v26 = v6;
    unsigned int v17 = v15;
    [v4 setInvalidationHandler:&v20];
    objc_msgSend(v4, "resume", v20, v21, v22, v23);
  }

  return v8 < 0x10;
}

- (void)_setupDictationListener
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
  dictationPidSet = self->_dictationPidSet;
  self->_dictationPidSet = v3;

  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, 0);
  NSUInteger v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);

  dispatch_queue_attr_t v9 = (OS_dispatch_queue *)dispatch_queue_create(0LL, v8);
  dictationListenerQueue = self->_dictationListenerQueue;
  self->_dictationListenerQueue = v9;

  uint64_t v11 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantDictationServiceName));
  dictationListener = self->_dictationListener;
  self->_dictationListener = v11;

  -[NSXPCListener setDelegate:](self->_dictationListener, "setDelegate:", self);
  -[NSXPCListener _setQueue:](self->_dictationListener, "_setQueue:", self->_dictationListenerQueue);
  -[NSXPCListener resume](self->_dictationListener, "resume");
}

- (BOOL)_settingsListenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kAssistantSettingsEntitlement;
  if ((AFConnectionHasEntitlement(v4, kAssistantSettingsEntitlement) & 1) != 0
    || (uint64_t v6 = kAssistantClientEntitlement, (AFConnectionHasEntitlement(v4, kAssistantClientEntitlement) & 1) != 0))
  {
    unsigned int v7 = [v4 processIdentifier];
    NSUInteger v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      int v27 = "-[ADDaemon _settingsListenerShouldAcceptNewConnection:]";
      __int16 v28 = 2112;
      *(void *)v29 = v4;
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)&v29[10] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s %@ Settings Connection Connected (pid=%d)",  buf,  0x1Cu);
    }

    if ((-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint") & 1) == 0)
    {
      dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      [v9 sanityCheckAutodownloadedAssetsForced:0];
    }

    uint64_t v10 = AFSettingsServiceDelegateXPCInterface();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v4 setRemoteObjectInterface:v11];

    uint64_t v12 = AFSettingsServiceXPCInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v4 setExportedInterface:v13];

    uint64_t v14 = -[ADSettingsClient initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___ADSettingsClient),  "initWithXPCConnection:",  v4);
    [v4 setExportedObject:v14];
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_1000CC0D0;
    dispatch_queue_attr_t v23 = &unk_1004F06C0;
    v24 = v14;
    unsigned int v25 = v7;
    id v15 = v14;
    [v4 setInvalidationHandler:&v20];
    objc_msgSend(v4, "resume", v20, v21, v22, v23);

    BOOL v16 = 1;
  }

  else
  {
    unsigned int v17 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v19 = v17;
      *(_DWORD *)buf = 136315906;
      int v27 = "-[ADDaemon _settingsListenerShouldAcceptNewConnection:]";
      __int16 v28 = 1024;
      *(_DWORD *)v29 = [v4 processIdentifier];
      *(_WORD *)&v29[4] = 2112;
      *(void *)&v29[6] = v5;
      __int16 v30 = 2112;
      uint64_t v31 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s Rejecting attempt to connect by pid=%d because it is missing one of the entitlements %@ or %@ (either will do)",  buf,  0x26u);
    }

    BOOL v16 = 0;
  }

  return v16;
}

- (void)_setupSettingsListener
{
  id v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantSettingsServiceName));
  settingsListener = self->_settingsListener;
  self->_settingsListener = v3;

  -[NSXPCListener setDelegate:](self->_settingsListener, "setDelegate:", self);
  if (AFIsInternalInstall(-[NSXPCListener resume](self->_settingsListener, "resume")))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v6, &stru_1004F03D8);
  }

- (void)_setupSynapseSyncListener
{
  id v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kINVocabularyUpdateServiceName));
  synapseSyncListener = self->_synapseSyncListener;
  self->_synapseSyncListener = v3;

  -[NSXPCListener setDelegate:](self->_synapseSyncListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_synapseSyncListener, "resume");
}

- (void)_bundleID:(id *)a3 andPath:(id *)a4 forXPCConnection:(id)a5
{
  id v7 = a5;
  NSUInteger v8 = v7;
  CFErrorRef error = 0LL;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  dispatch_queue_attr_t v9 = SecTaskCreateWithAuditToken(0LL, &token);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (__CFString *)SecTaskCopySigningIdentifier(v9, &error);
    CFErrorRef v12 = error;
    if (error)
    {
      v13 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        int v27 = "-[ADDaemon _bundleID:andPath:forXPCConnection:]";
        __int16 v28 = 2112;
        v29 = v8;
        __int16 v30 = 2112;
        uint64_t v31 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Could not get signing identifier. Connection: %@, error:  %@",  buf,  0x20u);
        CFErrorRef v12 = error;
      }

      CFRelease(v12);
    }

    if (!v11)
    {
      uint64_t v14 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v27 = "-[ADDaemon _bundleID:andPath:forXPCConnection:]";
        __int16 v28 = 2112;
        v29 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s Could not get the bundle identifier. Connection: %@",  buf,  0x16u);
      }
    }

    CFRelease(v10);
    id v15 = 0LL;
    BOOL v16 = a4 != 0LL;
    if (a4 && v11)
    {
      id v23 = 0LL;
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v11,  0LL,  &v23));
      unsigned int v17 = (__CFString *)v23;
      if (!v15)
      {
        uint64_t v18 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          v19 = &stru_1004FECA0;
          *(_DWORD *)buf = 136315650;
          int v27 = "-[ADDaemon _bundleID:andPath:forXPCConnection:]";
          __int16 v28 = 2112;
          if (v17) {
            v19 = v17;
          }
          v29 = v8;
          __int16 v30 = 2112;
          uint64_t v31 = (void *)v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%s Could not get bundle path for other-side of XPC connection %@ %@",  buf,  0x20u);
        }
      }

      BOOL v16 = 1;
    }
  }

  else
  {
    v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v27 = "-[ADDaemon _bundleID:andPath:forXPCConnection:]";
      __int16 v28 = 2112;
      v29 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s Could not create task with audit token. Connection: %@",  buf,  0x16u);
    }

    uint64_t v11 = 0LL;
    id v15 = 0LL;
    BOOL v16 = a4 != 0LL;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v15 URL]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 path]);

  if (a3) {
    *a3 = v11;
  }
  if (v16) {
    *a4 = v22;
  }
}

- (id)_synapseAppBundleIDFromPossibleDeamonBundleID:(id)a3
{
  id v3 = (__CFString *)a3;
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", @"com.apple.imagent"))
  {

    id v3 = @"com.apple.MobileSMS";
  }

  return v3;
}

- (BOOL)_synapseSyncListenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kAssistantSiriDeveloperEntitlement;
  if ((AFConnectionHasEntitlement(v4, kAssistantSiriDeveloperEntitlement) & 1) != 0
    || (AFConnectionHasEntitlement(v4, kAssistantLegacyUserVocabularyUpdateEntitlement) & 1) != 0)
  {
    unsigned int v6 = [v4 processIdentifier];
    id v22 = 0LL;
    id v23 = 0LL;
    -[ADDaemon _bundleID:andPath:forXPCConnection:](self, "_bundleID:andPath:forXPCConnection:", &v23, &v22, v4);
    id v7 = v23;
    id v8 = v22;
    dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[ADDaemon _synapseAppBundleIDFromPossibleDeamonBundleID:]( self,  "_synapseAppBundleIDFromPossibleDeamonBundleID:",  v7));

    BOOL v10 = v9 != 0LL;
    uint64_t v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (v9)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        int v27 = "-[ADDaemon _synapseSyncListenerShouldAcceptNewConnection:]";
        __int16 v28 = 1024;
        *(_DWORD *)v29 = v6;
        *(_WORD *)&v29[4] = 2112;
        *(void *)&v29[6] = v9;
        *(_WORD *)&_BYTE v29[14] = 2112;
        *(void *)&v29[16] = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s assistantd accepted connection from app (pid=%d bundleID=%@) %@",  buf,  0x26u);
      }

      CFErrorRef v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ADIntentPreferencesAndVocabularyUpdateService));
      v25[0] = objc_opt_class(&OBJC_CLASS___NSArray);
      v25[1] = objc_opt_class(&OBJC_CLASS____INVocabularyItem);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
      [v12 setClasses:v14 forSelector:"recordVocabulary:forIntentSlot:withValidationCompletion:" argumentIndex:0 ofReply:0];

      v24[0] = objc_opt_class(&OBJC_CLASS___NSArray);
      v24[1] = objc_opt_class(&OBJC_CLASS____INVocabularyItem);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));
      [v12 setClasses:v16 forSelector:"recordVocabulary:forIntentSlot:onBehalfOf:withValidationCompletion:" argumentIndex:0 ofReply:0];

      [v4 setExportedInterface:v12];
      unsigned int v17 = -[ADIntentVocabularyUpdateConnection initWithBundleID:path:canDonateOnBehalfOfApps:]( objc_alloc(&OBJC_CLASS___ADIntentVocabularyUpdateConnection),  "initWithBundleID:path:canDonateOnBehalfOfApps:",  v9,  v8,  AFConnectionHasEntitlement(v4, kAssistantDonatesVocabularyOnBehalfOfAppsEntitlement));
      [v4 setExportedObject:v17];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1000CBFFC;
      v20[3] = &unk_1004F9D00;
      unsigned int v21 = v6;
      [v4 setInvalidationHandler:v20];
      [v4 resume];
    }

    else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v27 = "-[ADDaemon _synapseSyncListenerShouldAcceptNewConnection:]";
      __int16 v28 = 2112;
      *(void *)v29 = v4;
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)&v29[10] = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s %@ Rejecting connection, because no kCFBundleIdentifierKey could be found for pid=%d but we expected it to be a .app bundle",  buf,  0x1Cu);
    }
  }

  else
  {
    uint64_t v18 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v27 = "-[ADDaemon _synapseSyncListenerShouldAcceptNewConnection:]";
      __int16 v28 = 2112;
      *(void *)v29 = v5;
      *(_WORD *)&v29[8] = 2114;
      *(void *)&v29[10] = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s no '%@' entitlement for connection %{public}@",  buf,  0x20u);
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (void)_setupManagedStorageListener
{
  id v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantManagedStorageServiceName));
  managedStorageListener = self->_managedStorageListener;
  self->_managedStorageListener = v3;

  -[NSXPCListener setDelegate:](self->_managedStorageListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_managedStorageListener, "resume");
}

- (BOOL)_managedStorageListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  int HasEntitlement = AFConnectionHasEntitlement(v3, kAssistantClientEntitlement);
  if (HasEntitlement)
  {
    unsigned int v5 = [v3 processIdentifier];
    unsigned int v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v18 = "-[ADDaemon _managedStorageListenerShouldAcceptNewConnection:]";
      __int16 v19 = 2112;
      id v20 = v3;
      __int16 v21 = 1024;
      unsigned int v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s %@ Managed Storage Connection Connected (pid=%d)",  buf,  0x1Cu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFManagedStorageService));
    [v3 setExportedInterface:v7];

    id v8 = objc_alloc_init(&OBJC_CLASS___ADManagedStorageConnection);
    [v3 setExportedObject:v8];
    uint64_t v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    v13 = sub_1000CBF34;
    uint64_t v14 = &unk_1004F06C0;
    id v15 = v8;
    unsigned int v16 = v5;
    dispatch_queue_attr_t v9 = v8;
    [v3 setInvalidationHandler:&v11];
    objc_msgSend(v3, "resume", v11, v12, v13, v14);
  }

  return HasEntitlement;
}

- (void)_setupSiriAnalyticsListener
{
  if (AFProcessIsRunningAsInstance(self, a2))
  {
    v2 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v5 = "-[ADDaemon _setupSiriAnalyticsListener]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s Only a hub process should host SiriAnalyticsService",  buf,  0xCu);
    }
  }

  else
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[ADSiriAnalyticsServiceHost sharedSiriAnalyticsServiceHost]( &OBJC_CLASS___ADSiriAnalyticsServiceHost,  "sharedSiriAnalyticsServiceHost"));
    [v3 setupXPCListener];
  }

- (void)_setupAnalyticsListener
{
  id v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantAnalyticsServiceName));
  analyticsListener = self->_analyticsListener;
  self->_analyticsListener = v3;

  -[NSXPCListener setDelegate:](self->_analyticsListener, "setDelegate:", self);
  unsigned int v5 = self->_analyticsListener;
  dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
  dispatch_queue_attr_t v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);

  dispatch_queue_t v10 = dispatch_queue_create(0LL, v9);
  -[NSXPCListener _setQueue:](v5, "_setQueue:", v10);

  -[NSXPCListener resume](self->_analyticsListener, "resume");
}

- (BOOL)_analyticsListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 processIdentifier];
  unsigned int v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v27 = "-[ADDaemon _analyticsListenerShouldAcceptNewConnection:]";
    __int16 v28 = 2112;
    id v29 = v3;
    __int16 v30 = 1024;
    unsigned int v31 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s %@ Analytics Connection Connected (pid=%d])",  buf,  0x1Cu);
  }

  uint64_t XPCInterface = AFAnalyticsServiceGetXPCInterface();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(XPCInterface);
  [v3 setExportedInterface:v7];

  dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
  [v3 setExportedObject:v8];

  dispatch_queue_attr_t v9 = (void *)AFAnalyticsServiceDelegateGetXPCInterface();
  [v3 setRemoteObjectInterface:v9];

  objc_initWeak((id *)buf, v3);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000CBD58;
  v23[3] = &unk_1004F0400;
  unsigned int v25 = v4;
  objc_copyWeak(&v24, (id *)buf);
  [v3 setInvalidationHandler:v23];
  unsigned int v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  __int16 v19 = sub_1000CBE44;
  id v20 = &unk_1004F0400;
  unsigned int v22 = v4;
  objc_copyWeak(&v21, (id *)buf);
  [v3 setInterruptionHandler:&v17];
  dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
  dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
  v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);

  dispatch_queue_t v14 = dispatch_queue_create(0LL, v13);
  objc_msgSend(v3, "_setQueue:", v14, v17, v18, v19, v20);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
  [v15 connectionConnected:v3];

  [v3 resume];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)_setupAnalyticsObservationListener
{
  id v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantAnalyticsObservationServiceName));
  analyticsObservationListener = self->_analyticsObservationListener;
  self->_analyticsObservationListener = v3;

  -[NSXPCListener setDelegate:](self->_analyticsObservationListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_analyticsObservationListener, "resume");
}

- (BOOL)_analyticsObservationListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  char HasEntitlement = AFConnectionHasEntitlement(v3, kAssistantAnalyticsObservationEntitlement);
  if ((HasEntitlement & 1) != 0)
  {
    unsigned int v5 = [v3 processIdentifier];
    dispatch_queue_attr_t v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v20 = "-[ADDaemon _analyticsObservationListenerShouldAcceptNewConnection:]";
      __int16 v21 = 2112;
      id v22 = v3;
      __int16 v23 = 1024;
      unsigned int v24 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s %@ Analytics Observation Connection Connected (pid=%d])",  buf,  0x1Cu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
    [v3 setExportedObject:v7];

    uint64_t XPCInterface = AFAnalyticsObservationServiceGetXPCInterface();
    dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(XPCInterface);
    [v3 setExportedInterface:v9];

    uint64_t v10 = AFAnalyticsObserverGetXPCInterface();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v3 setRemoteObjectInterface:v11];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000CBBC4;
    v17[3] = &unk_1004F9D00;
    unsigned int v18 = v5;
    [v3 setInvalidationHandler:v17];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000CBC9C;
    v15[3] = &unk_1004F9D00;
    unsigned int v16 = v5;
    [v3 setInterruptionHandler:v15];
    dispatch_queue_attr_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[ADAnalyticsService sharedService](&OBJC_CLASS___ADAnalyticsService, "sharedService"));
    [v12 setObserverConnection:v3];

    [v3 resume];
  }

  else
  {
    v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[ADDaemon _analyticsObservationListenerShouldAcceptNewConnection:]";
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s %@ Analytics Observation Connection does not have required entitlements.",  buf,  0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupSecurityListener
{
  id v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantSecurityServiceName));
  securityListener = self->_securityListener;
  self->_securityListener = v3;

  -[NSXPCListener setDelegate:](self->_securityListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_securityListener, "resume");
}

- (BOOL)_securityListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  char HasEntitlement = AFConnectionHasEntitlement(v3, kAssistantSecurityEntitlement);
  if ((HasEntitlement & 1) != 0)
  {
    unsigned int v5 = [v3 processIdentifier];
    dispatch_queue_attr_t v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v17 = "-[ADDaemon _securityListenerShouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 1024;
      unsigned int v21 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s %@ Security Connection Connected (pid=%d])",  buf,  0x1Cu);
    }

    uint64_t XPCInterface = AFSecurityServiceGetXPCInterface();
    dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(XPCInterface);
    [v3 setExportedInterface:v8];

    dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADSecurityService sharedService](&OBJC_CLASS___ADSecurityService, "sharedService"));
    [v3 setExportedObject:v9];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000CBA54;
    v14[3] = &unk_1004F9D00;
    unsigned int v15 = v5;
    [v3 setInvalidationHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000CBB0C;
    v12[3] = &unk_1004F9D00;
    unsigned int v13 = v5;
    [v3 setInterruptionHandler:v12];
    [v3 resume];
  }

  else
  {
    uint64_t v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v17 = "-[ADDaemon _securityListenerShouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s %@ Security Connection does not have required entitlements.",  buf,  0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupNotificationServiceListener
{
  id v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantNotificationServiceName));
  notificationServiceListener = self->_notificationServiceListener;
  self->_notificationServiceListener = v3;

  -[NSXPCListener setDelegate:](self->_notificationServiceListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_notificationServiceListener, "resume");
  id v5 =  +[ADUserNotificationServiceProvider personalDomainNotificationProvider]( &OBJC_CLASS___ADUserNotificationServiceProvider,  "personalDomainNotificationProvider");
}

- (BOOL)_notificationServiceListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  char HasEntitlement = AFConnectionHasEntitlement(v3, kAssistantNotificationServiceEntitlement);
  if ((HasEntitlement & 1) != 0)
  {
    unsigned int v5 = [v3 processIdentifier];
    dispatch_queue_attr_t v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      unsigned int v17 = "-[ADDaemon _notificationServiceListenerShouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 1024;
      unsigned int v21 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s %@ Notification Service Connection Connected (pid=%d])",  buf,  0x1Cu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFUserNotificationService));
    [v3 setExportedInterface:v7];

    dispatch_queue_attr_t v8 = -[ADUserNotificationServiceProvider initWithConnection:bundleIdentifier:notificationCategories:]( objc_alloc(&OBJC_CLASS___ADUserNotificationServiceProvider),  "initWithConnection:bundleIdentifier:notificationCategories:",  v3,  0LL,  0LL);
    [v3 setExportedObject:v8];

    dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AFUserNotificationServiceDelegate));
    [v3 setRemoteObjectInterface:v9];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000CB8E4;
    v14[3] = &unk_1004F9D00;
    unsigned int v15 = v5;
    [v3 setInvalidationHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000CB99C;
    v12[3] = &unk_1004F9D00;
    unsigned int v13 = v5;
    [v3 setInterruptionHandler:v12];
    [v3 resume];
  }

  else
  {
    uint64_t v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v17 = "-[ADDaemon _notificationServiceListenerShouldAcceptNewConnection:]";
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s %@ Notification Service Connection does not have required entitlements.",  buf,  0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupAudioSessionAssertionServiceListener
{
  id v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue( -[AFInstanceContext createXPCListenerWithMachServiceName:]( self->_instanceContext,  "createXPCListenerWithMachServiceName:",  kAssistantAudioSessionAssertionServiceName));
  audioSessionAssertionServiceListener = self->_audioSessionAssertionServiceListener;
  self->_audioSessionAssertionServiceListener = v3;

  -[NSXPCListener setDelegate:](self->_audioSessionAssertionServiceListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_audioSessionAssertionServiceListener, "resume");
}

- (BOOL)_audioSessionAssertionServiceListenerShouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  char HasEntitlement = AFConnectionHasEntitlement(v3, kAssistantAudioSessionAssertionServiceEntitlement);
  if ((HasEntitlement & 1) != 0)
  {
    unsigned int v5 = [v3 processIdentifier];
    dispatch_queue_attr_t v6 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ADDaemon _audioSessionAssertionServiceListenerShouldAcceptNewConnection:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v3;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v16) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s %@ Audio Session Assertion Service Connection Connected (pid=%d])",  buf,  0x1Cu);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    unsigned int v16 = sub_1000CB714;
    unsigned int v17 = sub_1000CB724;
    __int16 v18 = -[ADAudioSessionAssertionConnection initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___ADAudioSessionAssertionConnection),  "initWithXPCConnection:",  v3);
    uint64_t v7 = AFAudioSessionAssertionServiceXPCInterface();
    dispatch_queue_attr_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v3 setExportedInterface:v8];

    [v3 setExportedObject:*(void *)(*(void *)&buf[8] + 40)];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000CB72C;
    v13[3] = &unk_1004F0428;
    unsigned int v14 = v5;
    v13[4] = buf;
    [v3 setInvalidationHandler:v13];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000CB808;
    v11[3] = &unk_1004F0428;
    unsigned int v12 = v5;
    v11[4] = buf;
    [v3 setInterruptionHandler:v11];
    [v3 resume];
    _Block_object_dispose(buf, 8);
  }

  else
  {
    dispatch_queue_attr_t v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ADDaemon _audioSessionAssertionServiceListenerShouldAcceptNewConnection:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s %@ Audio Session Assertion Service Connection does not have required entitlements.",  buf,  0x16u);
    }
  }

  return HasEntitlement;
}

- (void)_setupAnnouncementSpeakingStatePublisher
{
  id v2 =  +[ADUserNotificationAnnouncementSpeakingStatePublisher sharedPublisher]( &OBJC_CLASS___ADUserNotificationAnnouncementSpeakingStatePublisher,  "sharedPublisher");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  dispatch_queue_attr_t v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_clientListener == v6)
  {
    unsigned __int8 v9 = -[ADDaemon _clientListenerShouldAcceptNewConnection:](self, "_clientListenerShouldAcceptNewConnection:", v7);
LABEL_24:
    BOOL v8 = v9;
    goto LABEL_25;
  }

  if (self->_settingsListener == v6)
  {
    unsigned __int8 v9 = -[ADDaemon _settingsListenerShouldAcceptNewConnection:]( self,  "_settingsListenerShouldAcceptNewConnection:",  v7);
    goto LABEL_24;
  }

  if (self->_dictationListener == v6)
  {
    unsigned __int8 v9 = -[ADDaemon _dictationListenerShouldAcceptNewConnection:]( self,  "_dictationListenerShouldAcceptNewConnection:",  v7);
    goto LABEL_24;
  }

  if (self->_managedStorageListener == v6)
  {
    unsigned __int8 v9 = -[ADDaemon _managedStorageListenerShouldAcceptNewConnection:]( self,  "_managedStorageListenerShouldAcceptNewConnection:",  v7);
    goto LABEL_24;
  }

  if (self->_synapseSyncListener == v6)
  {
    unsigned __int8 v9 = -[ADDaemon _synapseSyncListenerShouldAcceptNewConnection:]( self,  "_synapseSyncListenerShouldAcceptNewConnection:",  v7);
    goto LABEL_24;
  }

  if (self->_analyticsListener == v6)
  {
    unsigned __int8 v9 = -[ADDaemon _analyticsListenerShouldAcceptNewConnection:]( self,  "_analyticsListenerShouldAcceptNewConnection:",  v7);
    goto LABEL_24;
  }

  if (self->_securityListener == v6)
  {
    unsigned __int8 v9 = -[ADDaemon _securityListenerShouldAcceptNewConnection:]( self,  "_securityListenerShouldAcceptNewConnection:",  v7);
    goto LABEL_24;
  }

  if (self->_analyticsObservationListener == v6)
  {
    unsigned __int8 v9 = -[ADDaemon _analyticsObservationListenerShouldAcceptNewConnection:]( self,  "_analyticsObservationListenerShouldAcceptNewConnection:",  v7);
    goto LABEL_24;
  }

  if (self->_notificationServiceListener == v6)
  {
    unsigned __int8 v9 = -[ADDaemon _notificationServiceListenerShouldAcceptNewConnection:]( self,  "_notificationServiceListenerShouldAcceptNewConnection:",  v7);
    goto LABEL_24;
  }

  if (self->_audioSessionAssertionServiceListener == v6)
  {
    unsigned __int8 v9 = -[ADDaemon _audioSessionAssertionServiceListenerShouldAcceptNewConnection:]( self,  "_audioSessionAssertionServiceListenerShouldAcceptNewConnection:",  v7);
    goto LABEL_24;
  }

  if (self->_locationServiceListener == v6)
  {
    unsigned __int8 v9 = -[ADDaemon _locationServiceListenerShouldAcceptNewConnection:]( self,  "_locationServiceListenerShouldAcceptNewConnection:",  v7);
    goto LABEL_24;
  }

  BOOL v8 = 0;
LABEL_25:

  return v8;
}

- (void)_setupNotifyHandlers
{
  queue = (dispatch_queue_s *)self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000CB1A4;
  handler[3] = &unk_1004FA030;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", queue, handler);
}

- (void)_setupDistributedNotificationHandlers
{
  queue = (dispatch_queue_s *)self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000CAE74;
  handler[3] = &unk_1004FA030;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", queue, handler);
}

- (void)_setupMobileGestaltNotificationHandlers
{
  if (!self->_mg_notification_token)
  {
    unsigned int v4 = @"UserAssignedDeviceName";
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL));
    self->_mg_notification_audit_token_t token = (MGNotificationTokenStruct *)MGRegisterForUpdates( v3,  0LL,  self->_queue,  &stru_1004F0488);
  }

- (void)_setupSyncListener
{
  if ((sub_1001EA830() & 1) != 0)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    mach_service = xpc_connection_create_mach_service("com.apple.assistant.sync", v4, 1uLL);
    syncListener = self->_syncListener;
    self->_syncListener = mach_service;

    xpc_connection_set_event_handler(self->_syncListener, &stru_1004F04A8);
    xpc_connection_resume(self->_syncListener);
  }

  else
  {
    id v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      unsigned __int8 v9 = "-[ADDaemon _setupSyncListener]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Skipping setup for sync listener because the process is running as an instance of a multi-instance service, o r the device can never sync",  (uint8_t *)&v8,  0xCu);
    }
  }

- (void)_enabledBitsChanged:(id)a3
{
  id v4 = sub_1002D6D90(@"ADPreferencesEnabledBitsDidChangeNotification");
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  -[ADDaemon syncForReason:withCoalescing:](self, "syncForReason:withCoalescing:", v5, 1LL);
}

- (void)_meDeviceChanged:(id)a3
{
  v5[0] = @"com.apple.contact.people";
  v5[1] = @"com.apple.siri.applications";
  v5[2] = @"com.apple.siri.vocabularyupdates";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 3LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v4 syncAnchorKeys:v3 forceReset:0 reasons:&off_100512FE8];
}

- (void)_registerForSyncNotifications
{
  if ((-[AFInstanceContext isEndpoint](self->_instanceContext, "isEndpoint") & 1) == 0)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver( LocalCenter,  self,  (CFNotificationCallback)sub_1000CA770,  kCFLocaleCurrentLocaleDidChangeNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 addObserver:self selector:"_enabledBitsChanged:" name:@"ADPreferencesEnabledBitsDidChangeNotification" object:0];
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADFMIPListener sharedListener](&OBJC_CLASS___ADFMIPListener, "sharedListener"));
    [v4 startListening];
  }

- (void)_setupTetherListener
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ADSiriTetherListener);
  siriTetherListener = self->_siriTetherListener;
  self->_siriTetherListener = v3;

  -[ADSiriTetherListener listen](self->_siriTetherListener, "listen");
}

- (void)_setupExternalRequestListener
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ADExternalRequestListener);
  externalRequestListener = self->_externalRequestListener;
  self->_externalRequestListener = v3;

  -[ADExternalRequestListener listen](self->_externalRequestListener, "listen");
  sub_1001EBEE8();
}

- (void)_setupClientLiteListener
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ADClientLiteListener);
  clientLiteListener = self->_clientLiteListener;
  self->_clientLiteListener = v3;

  -[ADClientLiteListener listen](self->_clientLiteListener, "listen");
}

- (void)_setupPairedSync
{
  id v3 = [off_100572BF0() syncCoordinatorWithServiceName:@"com.apple.pairedsync.siri"];
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  [v4 setDelegate:self];
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a4;
  dispatch_queue_attr_t v6 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v12 = "-[ADDaemon syncCoordinator:beginSyncSession:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000CA5D8;
  block[3] = &unk_1004FD940;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, block);
}

- (void)_setupHomeKit
{
  id v2 = +[ADHomeInfoManager sharedInfoManager](&OBJC_CLASS___ADHomeInfoManager, "sharedInfoManager");
}

- (void)_setupCloudKit
{
  if (AFProcessIsRunningAsInstance(self, a2))
  {
    id v2 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v5 = "-[ADDaemon _setupCloudKit]";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s Skipping setup for CloudKit because the process is running as an instance of a multi-instance service.",  buf,  0xCu);
    }
  }

  else
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[ADCloudKitManager sharedManager](&OBJC_CLASS___ADCloudKitManager, "sharedManager"));
    [v3 enablePushNotifications];
  }

- (void)_setupMemoryPressureObservation
{
  id v2 = +[AFMemoryPressureObserver sharedObserver](&OBJC_CLASS___AFMemoryPressureObserver, "sharedObserver");
}

- (void)_setupAudioSessionAssertionAcquisitionService
{
}

- (void)_setupPommesSearchService
{
  if ((AFIsHorseman(self, a2) & 1) == 0)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___PommesSearchServiceLauncher);
    pommesSearchServiceLauncher = self->_pommesSearchServiceLauncher;
    self->_pommesSearchServiceLauncher = v3;
  }

- (void)_daemonDidLaunchWithContext:(id)a3
{
  id v4 = a3;
  AFLogInitIfNeeded();
  id v5 = sub_1001EB070(0LL);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)qword_1005780B0;
  qword_1005780B0 = v6;

  AFInstallCommonSignalHandlers();
  if (qword_100577D00 != -1) {
    dispatch_once(&qword_100577D00, &stru_1004F13B0);
  }
  id v8 = +[AFInstanceContext currentContext](&OBJC_CLASS___AFInstanceContext, "currentContext");
  unsigned __int8 v9 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unsigned int v38 = "-[ADDaemon _daemonDidLaunchWithContext:]";
    __int16 v39 = 2080;
    v40 = "MobileAssistantDaemons-3402.74.3";
    __int16 v41 = 2080;
    id v42 = "205";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s assistantd launched build %s~%s", buf, 0x20u);
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000C999C;
  v36[3] = &unk_1004FD940;
  v36[4] = self;
  id v10 = objc_retainBlock(v36);
  dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unsigned int v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
  dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INTERACTIVE, 0);
  unsigned int v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);

  unsigned int v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.assistantd.trial", v14);
  trialExperimentsQueue = self->_trialExperimentsQueue;
  self->_trialExperimentsQueue = v15;

  +[ADExperimentManager tracerAllocationsWithQueue:]( &OBJC_CLASS___ADExperimentManager,  "tracerAllocationsWithQueue:",  self->_trialExperimentsQueue);
  unsigned int v17 = self->_queue;
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADQueueMonitor sharedMonitor](&OBJC_CLASS___ADQueueMonitor, "sharedMonitor"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000CA37C;
  v34[3] = &unk_1004FBBD0;
  v35 = v17;
  id v19 = v17;
  [v18 addQueue:v19 heartBeatInterval:v34 timeoutInterval:5.0 timeoutHandler:5.0];

  id v20 = [v4 daemonType];
  if (v20 == (id)1)
  {
    int v27 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
    instanceContext = self->_instanceContext;
    self->_instanceContext = v27;

    ((void (*)(void *))v10[2])(v10);
  }

  else
  {
    if (v20 != (id)2)
    {
      id v29 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        unsigned int v38 = "-[ADDaemon _daemonDidLaunchWithContext:]";
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s daemonType = Unknown", buf, 0xCu);
      }

      exit(0);
    }

    unsigned int v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v38 = "-[ADDaemon _daemonDidLaunchWithContext:]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s setupHomeHub", buf, 0xCu);
    }

    dispatch_queue_t v22 = dispatch_queue_create("assistant.postSetupQueue", 0LL);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
    unsigned int v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v22, v24);

    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(+[SHAFHomeHubManager sharedManager](&OBJC_CLASS___SHAFHomeHubManager, "sharedManager"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000CA494;
    v30[3] = &unk_1004F0510;
    dispatch_queue_t v31 = v22;
    __int16 v32 = self;
    int v33 = v10;
    id v26 = v22;
    [v25 fetchLocalInstanceContextWithCompletion:v30];
  }
}

- (void)_daemonWillShutdown
{
  id v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[ADDaemon _daemonWillShutdown]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s assistantd shutting down\n\n",  (uint8_t *)&v5,  0xCu);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v3 prepareForShutdown];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AFDiagnostics sharedDiagnostics](&OBJC_CLASS___AFDiagnostics, "sharedDiagnostics"));
  [v4 flush];
}

- (void)_setupSessionLanguage
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  [v2 setLanguageCodeIfNeeded];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADPreferences sharedPreferences](&OBJC_CLASS___ADPreferences, "sharedPreferences"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 outputVoice]);
  objc_msgSend(v5, "_outputVoice_setOutputVoice:", v4);
}

- (void)_registerSyncCoalescedJob
{
  self->_lastSyncRequested = mach_absolute_time();
  if (self->_syncActivityRegistered)
  {
    id v3 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADDaemon _registerSyncCoalescedJob]";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Sync now activity already registered",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000C98A8;
    v9[3] = &unk_1004FD940;
    v9[4] = self;
    id v4 = v9;
    if ((sub_1001EAC58() & 1) != 0)
    {
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      dispatch_queue_attr_t v13 = sub_100260950;
      unsigned int v14 = &unk_1004F7E10;
      unsigned int v15 = v4;
      id v5 = objc_retainBlock(&buf);
      xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v6, XPC_ACTIVITY_DELAY, 0LL);
      xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
      xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
      xpc_dictionary_set_string( v6,  XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION,  XPC_ACTIVITY_NETWORK_TRANSFER_BIDIRECTIONAL);
      sub_100260A3C("com.apple.siri.xpc_activity.sync.now", v6, 0LL, v5);
      id v7 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v10 = 136315138;
        dispatch_queue_attr_t v11 = "ADRegisterSyncNowActivity";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s sync now xpc activity registered",  v10,  0xCu);
      }
    }

    else
    {
      id v8 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "ADRegisterSyncNowActivity";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Skipped register XPC activitiy for SyncNow because sync is disabled",  (uint8_t *)&buf,  0xCu);
      }
    }

    self->_syncActivityRegistered = 1;
  }

- (void)syncForReason:(id)a3 withCoalescing:(BOOL)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C9898;
  block[3] = &unk_1004FC188;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_syncForReason:(id)a3 withCoalescing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (__CFString *)a3;
  if ((sub_1001EAC58() & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ADDaemon sharedDaemon](&OBJC_CLASS___ADDaemon, "sharedDaemon"));
    [v7 keepAlive];

    sub_1002D649C(v6);
    syncReasonsQueued = self->_syncReasonsQueued;
    if (!syncReasonsQueued)
    {
      unsigned __int8 v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v10 = self->_syncReasonsQueued;
      self->_syncReasonsQueued = v9;

      syncReasonsQueued = self->_syncReasonsQueued;
    }

    -[NSMutableSet addObject:](syncReasonsQueued, "addObject:", v6);
    if (v4
      && self->_lastSyncRequested
      && (uint64_t v11 = mach_absolute_time(), v11 < AFMachAbsoluteTimeAddTimeInterval(self->_lastSyncRequested, 3.0)))
    {
      unsigned int v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v17 = self->_syncReasonsQueued;
        *(_DWORD *)__int128 buf = 136315394;
        id v20 = "-[ADDaemon _syncForReason:withCoalescing:]";
        __int16 v21 = 2112;
        dispatch_queue_t v22 = v17;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s Sync requested recently; sync reasons enqueued: %@",
          buf,
          0x16u);
      }

      if (!self->_syncActivityRegistered)
      {
        dispatch_time_t v13 = dispatch_time(0LL, 3000000000LL);
        queue = (dispatch_queue_s *)self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000C9890;
        block[3] = &unk_1004FD940;
        void block[4] = self;
        dispatch_after(v13, queue, block);
      }
    }

    else
    {
      -[ADDaemon _registerSyncCoalescedJob](self, "_registerSyncCoalescedJob");
    }
  }

  else
  {
    unsigned int v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      unsigned int v16 = &stru_1004FECA0;
      if (v6) {
        unsigned int v16 = v6;
      }
      *(_DWORD *)__int128 buf = 136315394;
      id v20 = "-[ADDaemon _syncForReason:withCoalescing:]";
      __int16 v21 = 2112;
      dispatch_queue_t v22 = (void *)v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ignoring request to sync %@", buf, 0x16u);
    }
  }
}

- (void)scheduleDestroyJob
{
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_DELAY, 15LL);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  sub_100260A3C("com.apple.siri.xpc_activity.destroy", xdict, &stru_1004F7FF8, &stru_1004F8018);
}

- (void)unscheduleDestroyJob
{
}

- (void)scheduleValidationRefreshForInterval:(double)a3
{
  BOOL v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    unsigned __int8 v9 = "_ADValidationRefreshCriteriaForInterval";
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %lf", (uint8_t *)&v8, 0x16u);
  }

  if (a3 >= 0.0) {
    double v5 = a3;
  }
  else {
    double v5 = (double)XPC_ACTIVITY_INTERVAL_1_DAY;
  }
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, (uint64_t)v5);
  if (v5 * 0.5 > a3)
  {
    double v7 = 0.0;
    if (a3 >= 0.0) {
      double v7 = a3;
    }
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_DELAY, (uint64_t)v7);
  }

  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, 0LL);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  sub_100260A3C("com.apple.siri.xpc_activity.refresh_validation", v6, &stru_1004F7F98, &stru_1004F7FD8);
}

- (void)scheduleUnlockedWork:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C97F8;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_setupOfflineDictationStatusObserver
{
  id v2 =  +[ADDictationOfflineStatusObserver sharedDictationOfflineStatusObserver]( &OBJC_CLASS___ADDictationOfflineStatusObserver,  "sharedDictationOfflineStatusObserver");
}

- (void)_xpcActivityRemoraStatusCheck
{
  remoraCleanupManager = self->_remoraCleanupManager;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 300.0));
  -[ADRemoraCleanupManager cleanupUntilDate:](remoraCleanupManager, "cleanupUntilDate:", v3);
}

- (void).cxx_destruct
{
}

+ (id)sharedDaemon
{
  if (qword_100577C70 != -1) {
    dispatch_once(&qword_100577C70, &stru_1004F0350);
  }
  return (id)qword_100577C68;
}

+ (double)processLaunchTime
{
  return *(double *)&qword_100577C78;
}

+ (unint64_t)processLaunchMachTime
{
  return qword_100577C80;
}

+ (unint64_t)processLoadedMachTime
{
  return qword_100577C88;
}

@end