@interface W5Engine
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (W5Engine)init;
- (id)__localPeer;
- (id)__model;
- (id)_peerListeners;
- (void)__cancelCollectLogsWithUUID:(id)a3 reply:(id)a4;
- (void)__cancelDiagnosticsWithUUID:(id)a3 reply:(id)a4;
- (void)__cancelPeerDiscoveryWithUUID:(id)a3;
- (void)__cancelWiFiPerfLoggingWithUUID:(id)a3 reply:(id)a4;
- (void)__cancelWiFiSnifferWithUUID:(id)a3 peer:(id)a4 reply:(id)a5;
- (void)__cancelWiFiSnifferWithUUID:(id)a3 reply:(id)a4;
- (void)__collectLogItem:(id)a3 reply:(id)a4;
- (void)__collectLogs:(id)a3 configuration:(id)a4 additionalLog:(id)a5 filename:(id)a6 uid:(unsigned int)a7 gid:(unsigned int)a8 uuid:(id)a9 reply:(id)a10;
- (void)__collectLogsDiagnosticMode:(id)a3 outputName:(id)a4 uid:(unsigned int)a5 gid:(unsigned int)a6 uuid:(id)a7 reply:(id)a8;
- (void)__collectedLogItem:(id)a3;
- (void)__completedDiagnosticsTest:(id)a3;
- (void)__queryDatabaseAndReply:(id)a3 reply:(id)a4;
- (void)__queryDebugConfigurationAndReply:(id)a3;
- (void)__queryStatusAndReply:(id)a3;
- (void)__runDiagnostics:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)__runWiFiPerfLoggingWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)__runWiFiSnifferOnChannel:(id)a3 duration:(double)a4 uuid:(id)a5 tcpDump:(BOOL)a6 reply:(id)a7;
- (void)__runWiFiSnifferOnPeer:(id)a3 channels:(id)a4 duration:(double)a5 uuid:(id)a6 reply:(id)a7;
- (void)__setDebugConfiguration:(id)a3 reply:(id)a4;
- (void)__setupCallbacks;
- (void)__updateStatusMonitoring;
- (void)__updatedStatusWithEvent:(id)a3;
- (void)_scheduleRepeatingCleanupTasks;
- (void)dealloc;
- (void)run;
- (void)terminateAndNotify:(id)a3;
- (void)xpcConnection:(id)a3 cancelCollectLogsWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 cancelDiagnosticsWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 cancelWiFiPerformanceLoggingWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 cancelWiFiSnifferWithUUID:(id)a4 peer:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 cancelWiFiSnifferWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 collectLogs:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7;
- (void)xpcConnection:(id)a3 collectLogsDiagnosticMode:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 listFilesFromPeer:(id)a4 remoteDirPath:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 queryDatabaseForPeer:(id)a4 fetch:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 queryDebugConfigurationForPeer:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 queryDiagnosticsModeForPeer:(id)a4 info:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 queryFaultEventCacheForPeer:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 queryLocalPeerAndReply:(id)a4;
- (void)xpcConnection:(id)a3 queryRegisteredDiagnosticsPeersWithReply:(id)a4;
- (void)xpcConnection:(id)a3 queryStatusForPeer:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 registerRemoteDiagnosticEventsForPeer:(id)a4 configuration:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 requestFileFromPeer:(id)a4 remoteFilePath:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 runDiagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7;
- (void)xpcConnection:(id)a3 runDiagnosticsForPeer:(id)a4 diagnostics:(id)a5 configuration:(id)a6 uuid:(id)a7 reply:(id)a8;
- (void)xpcConnection:(id)a3 runWiFiPerformanceLoggingWithConfiguration:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 runWiFiSnifferOnChannels:(id)a4 duration:(double)a5 peer:(id)a6 uuid:(id)a7 reply:(id)a8;
- (void)xpcConnection:(id)a3 runWiFiSnifferWithTCPDumpOnChannels:(id)a4 duration:(double)a5 peer:(id)a6 uuid:(id)a7 reply:(id)a8;
- (void)xpcConnection:(id)a3 setDebugConfiguration:(id)a4 peer:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 startDiagnosticsModeWithConfiguration:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 startMonitoringEvents:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 startMonitoringFaultEventsForPeer:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 startPeerDiscoveryWithConfiguration:(id)a4 uuid:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 stopDiagnosticsModeWithUUID:(id)a4 info:(id)a5 reply:(id)a6;
- (void)xpcConnection:(id)a3 stopMonitoringEvents:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 stopMonitoringFaultEventsForPeer:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 stopPeerDiscoveryWithUUID:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 submitFaultEvent:(id)a4 reply:(id)a5;
- (void)xpcConnection:(id)a3 unregisterRemoteDiagnosticEventsForPeer:(id)a4 configuration:(id)a5 reply:(id)a6;
@end

@implementation W5Engine

- (W5Engine)init
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___W5Engine;
  v2 = -[W5Engine init](&v25, "init");
  if (!v2) {
    goto LABEL_72;
  }
  v3 = dispatch_queue_create("com.apple.wifivelocity.engine", 0LL);
  v2->_queue = (OS_dispatch_queue *)v3;
  if (!v3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil disaptch_queue";
LABEL_71:
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] %s",  buf,  0xCu);
    goto LABEL_72;
  }

  dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0LL);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v2->_xpcConnections = v4;
  if (!v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil XPC Connections List";
    goto LABEL_71;
  }

  v5 = objc_alloc_init(&OBJC_CLASS___W5StatusManager);
  v2->_status = v5;
  if (!v5)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5StatusManager";
    goto LABEL_71;
  }

  if ((_os_feature_enabled_impl("WiFiVelocity", "PeerDiagnostics") & 1) != 0
    || _os_feature_enabled_impl("WiFiVelocity", "PeerTypes"))
  {
    v6 = -[W5PeerDiagnosticsManager initWithStatusManager:]( objc_alloc(&OBJC_CLASS___W5PeerDiagnosticsManager),  "initWithStatusManager:",  v2->_status);
    v2->_peerDiagnostics = v6;
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "nil W5StatusManager";
        goto LABEL_71;
      }

      goto LABEL_72;
    }
  }

  else
  {
    v23 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "-[W5Engine init]";
      __int16 v28 = 2080;
      v29 = "W5Engine.m";
      __int16 v30 = 1024;
      int v31 = 134;
      LODWORD(v24) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "[wifivelocity] %s (%s:%u) PeerDiagnostics disabled via feature flags",  (const char *)buf,  v24,  LODWORD(v25.receiver));
    }
  }

  v7 = -[W5DiagnosticsManager initWithStatusManager:peerDiagnosticsManager:]( objc_alloc(&OBJC_CLASS___W5DiagnosticsManager),  "initWithStatusManager:peerDiagnosticsManager:",  v2->_status,  v2->_peerDiagnostics);
  v2->_diagnostics = v7;
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5DiagnosticsManager";
    goto LABEL_71;
  }

  v8 = objc_alloc_init(&OBJC_CLASS___W5UserNotificationManager);
  v2->_notificationManager = v8;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5UserNotificationManager";
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] %s",  buf,  0xCu);
  }

  if (+[W5FeatureAvailability diagnosticsModeEnabled](&OBJC_CLASS___W5FeatureAvailability, "diagnosticsModeEnabled"))
  {
    v9 = objc_alloc_init(&OBJC_CLASS___W5BGTaskManager);
    v2->_bgTaskManager = v9;
    if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "nil W5BGTaskManager";
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] %s",  buf,  0xCu);
    }
  }

  v10 = -[W5WiFiSniffManager initWithStatusManager:andUserNotificationManager:]( objc_alloc(&OBJC_CLASS___W5WiFiSniffManager),  "initWithStatusManager:andUserNotificationManager:",  v2->_status,  v2->_notificationManager);
  v2->_sniff = v10;
  if (!v10)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5StatusManager";
    goto LABEL_71;
  }

  v11 = objc_alloc_init(&OBJC_CLASS___W5FileTransferManager);
  v2->_transferManager = v11;
  if (!v11)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5FileTransferManager";
    goto LABEL_71;
  }

  v12 = objc_alloc_init(&OBJC_CLASS___W5NetUsageManager);
  v2->_netUsageManager = v12;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5NetUsageManager";
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] %s",  buf,  0xCu);
  }

  v13 = objc_alloc_init(&OBJC_CLASS___W5PeerManager);
  v2->_peerManager = v13;
  if (!v13)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5PeerManager";
    goto LABEL_71;
  }

  v14 = -[W5LogManager initWithStatusManager:diagnosticsManager:peerDiagnosticsManager:]( objc_alloc(&OBJC_CLASS___W5LogManager),  "initWithStatusManager:diagnosticsManager:peerDiagnosticsManager:",  v2->_status,  v2->_diagnostics,  v2->_peerDiagnostics);
  v2->_log = v14;
  if (!v14)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5LogManager";
    goto LABEL_71;
  }

  v15 = -[W5DiagnosticsModeManager initWithNetUsageManager:peerManager:userNotificationManager:snifferManager:statusManager:logManager:]( objc_alloc(&OBJC_CLASS___W5DiagnosticsModeManager),  "initWithNetUsageManager:peerManager:userNotificationManager:snifferManager:statusManager:logManager:",  v2->_netUsageManager,  v2->_peerManager,  v2->_notificationManager,  v2->_sniff,  v2->_status,  v2->_log);
  v2->_diagnosticsModeManager = v15;
  if (!v15)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5DiagnosticsModeManager";
    goto LABEL_71;
  }

  v16 = -[W5DebugManager initWithDiagnosticsModeManager:statusManager:]( objc_alloc(&OBJC_CLASS___W5DebugManager),  "initWithDiagnosticsModeManager:statusManager:",  v2->_diagnosticsModeManager,  v2->_status);
  v2->_debug = v16;
  if (!v16)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5DebugManager";
    goto LABEL_71;
  }

  v17 = -[W5WiFiConnectionMonitor initWithStatusManager:diagnosticsManager:]( objc_alloc(&OBJC_CLASS___W5WiFiConnectionMonitor),  "initWithStatusManager:diagnosticsManager:",  v2->_status,  v2->_diagnostics);
  v2->_monitor = v17;
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5WiFiConnectionMonitor";
    goto LABEL_71;
  }

  v18 = -[W5WiFiPerfLoggingManager initWithStatusManager:]( objc_alloc(&OBJC_CLASS___W5WiFiPerfLoggingManager),  "initWithStatusManager:",  v2->_status);
  v2->_wifiperf = v18;
  if (!v18)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5WiFiPerfLoggingManager";
    goto LABEL_71;
  }

  v19 = -[W5FaultEventManager initWithPeerManager:diagnosticsModeManager:]( objc_alloc(&OBJC_CLASS___W5FaultEventManager),  "initWithPeerManager:diagnosticsModeManager:",  v2->_peerManager,  v2->_diagnosticsModeManager);
  v2->_faultEventManager = v19;
  if (!v19)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_72;
    }
    *(_DWORD *)buf = 136315138;
    v27 = "nil W5FaultEventManager";
    goto LABEL_71;
  }

  -[W5FaultEventManager setLocalPeer:]( v2->_faultEventManager,  "setLocalPeer:",  -[W5Engine __localPeer](v2, "__localPeer"));
  -[W5DiagnosticsModeManager setLocalPeer:]( v2->_diagnosticsModeManager,  "setLocalPeer:",  -[W5Engine __localPeer](v2, "__localPeer"));
  -[W5DiagnosticsModeManager setFaultEventManager:]( v2->_diagnosticsModeManager,  "setFaultEventManager:",  v2->_faultEventManager);
  -[W5StatusManager setDiagnosticsModeManager:](v2->_status, "setDiagnosticsModeManager:", v2->_diagnosticsModeManager);
  if (+[W5FeatureAvailability diagnosticsModeEnabled](&OBJC_CLASS___W5FeatureAvailability, "diagnosticsModeEnabled"))
  {
    v20 = +[W5DatabaseManager sharedObject](&OBJC_CLASS___W5DatabaseManager, "sharedObject");
    v2->_databaseManager = v20;
    if (!v20)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "nil _databaseManager";
        goto LABEL_71;
      }

      goto LABEL_72;
    }
  }

  v21 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.wifivelocityd");
  v2->_listener = v21;
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "nil NSXPCListener";
      goto LABEL_71;
    }

- (void)dealloc
{
  notificationManager = self->_notificationManager;
  if (notificationManager) {

  }
  queue = (dispatch_object_s *)self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  isMonitoringTransaction = self->_isMonitoringTransaction;
  if (isMonitoringTransaction)
  {

    self->_isMonitoringTransaction = 0LL;
  }

  isMonitoringConnectionTransaction = self->_isMonitoringConnectionTransaction;
  if (isMonitoringConnectionTransaction)
  {

    self->_isMonitoringConnectionTransaction = 0LL;
  }

  bgTaskManager = self->_bgTaskManager;
  if (bgTaskManager) {

  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___W5Engine;
  -[W5Engine dealloc](&v8, "dealloc");
}

- (void)run
{
  v3 = objc_autoreleasePoolPush();
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026B90;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  dispatch_async(queue, block);
  objc_autoreleasePoolPop(v3);
  -[NSRunLoop run](+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"), "run");
}

- (void)terminateAndNotify:(id)a3
{
  v5 = dispatch_semaphore_create(0LL);
  sniff = self->_sniff;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100026DE0;
  v14[3] = &unk_1000D1BF8;
  v14[4] = v5;
  -[W5WiFiSniffManager teardownAndNotify:](sniff, "teardownAndNotify:", v14);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  log = self->_log;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100026DE8;
  v13[3] = &unk_1000D1BF8;
  v13[4] = v5;
  -[W5LogManager teardownAndNotify:](log, "teardownAndNotify:", v13);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  -[W5LogManager setCollectedItemCallback:](self->_log, "setCollectedItemCallback:", 0LL);
  -[W5LogManager setPingCallback:](self->_log, "setPingCallback:", 0LL);
  diagnostics = self->_diagnostics;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100026DF0;
  v12[3] = &unk_1000D1BF8;
  v12[4] = v5;
  -[W5DiagnosticsManager teardownAndNotify:](diagnostics, "teardownAndNotify:", v12);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  -[W5DiagnosticsManager setPingCallback:](self->_diagnostics, "setPingCallback:", 0LL);
  -[W5DiagnosticsManager setCompletedTestCallback:](self->_diagnostics, "setCompletedTestCallback:", 0LL);
  wifiperf = self->_wifiperf;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100026DF8;
  v11[3] = &unk_1000D1BF8;
  v11[4] = v5;
  -[W5WiFiPerfLoggingManager teardownAndNotify:](wifiperf, "teardownAndNotify:", v11);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  -[W5StatusManager stopEventMonitoring](self->_status, "stopEventMonitoring");
  -[W5StatusManager setUpdatedWiFiCallback:](self->_status, "setUpdatedWiFiCallback:", 0LL);
  -[W5StatusManager setUpdatedBluetoothCallback:](self->_status, "setUpdatedBluetoothCallback:", 0LL);
  -[W5StatusManager setUpdatedAWDLStatusCallback:](self->_status, "setUpdatedAWDLStatusCallback:", 0LL);
  -[W5StatusManager setUpdatedWiFiStatusCallback:](self->_status, "setUpdatedWiFiStatusCallback:", 0LL);
  -[W5StatusManager setUpdatedBluetoothStatusCallback:](self->_status, "setUpdatedBluetoothStatusCallback:", 0LL);
  -[W5StatusManager setUpdatedPowerSourceCallback:](self->_status, "setUpdatedPowerSourceCallback:", 0LL);
  -[W5StatusManager setUpdatedNetworkStatusCallback:](self->_status, "setUpdatedNetworkStatusCallback:", 0LL);
  -[W5StatusManager setUpdatedPowerManagementCallback:](self->_status, "setUpdatedPowerManagementCallback:", 0LL);
  -[W5StatusManager setUpdatedPowerStatusCallback:](self->_status, "setUpdatedPowerStatusCallback:", 0LL);
  -[W5StatusManager setLowBatteryCallback:](self->_status, "setLowBatteryCallback:", 0LL);
  -[W5WiFiConnectionMonitor stopMonitoring](self->_monitor, "stopMonitoring");
  -[W5WiFiConnectionMonitor setDroppedWiFiConnectionCallback:](self->_monitor, "setDroppedWiFiConnectionCallback:", 0LL);
  -[W5FaultEventManager invalidate](self->_faultEventManager, "invalidate");
  bgTaskManager = self->_bgTaskManager;
  if (bgTaskManager) {
    -[W5BGTaskManager stopAllRepeatingTasks](bgTaskManager, "stopAllRepeatingTasks");
  }
  if (v5) {
    dispatch_release(v5);
  }
  (*((void (**)(id))a3 + 2))(a3);
}

- (id)__model
{
  v2 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (!MatchingService) {
    return 0LL;
  }
  io_object_t v4 = MatchingService;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( MatchingService,  @"model",  kCFAllocatorDefault,  0);
  if (CFProperty)
  {
    v6 = CFProperty;
    v7 =  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@",  +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  CFDataGetBytePtr(CFProperty),  4LL));
    CFRelease(v6);
  }

  else
  {
    v7 = 0LL;
  }

  IOObjectRelease(v4);
  return v7;
}

- (id)__localPeer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100026F64;
  block[3] = &unk_1000D1BF8;
  block[4] = self;
  if (qword_1000F7528 != -1) {
    dispatch_once(&qword_1000F7528, block);
  }
  return -[W5Peer copy](self->_localPeer, "copy");
}

- (void)__updateStatusMonitoring
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  xpcConnections = self->_xpcConnections;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( xpcConnections,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    char v7 = 0;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(xpcConnections);
      }
      v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      v7 |= objc_msgSend(objc_msgSend(v10, "eventIDs"), "count") != 0;
      v6 |= objc_msgSend(objc_msgSend(v10, "eventIDs"), "containsObject:", &off_1000DECB8);
      if ((v7 & 1) != 0 && (v6 & 1) != 0) {
        break;
      }
      if (v5 == (id)++v9)
      {
        id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( xpcConnections,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
        if (v5) {
          goto LABEL_3;
        }
        p_isMonitoring = &self->_isMonitoring;
        if (self->_isMonitoring != (v7 & 1))
        {
          if ((v7 & 1) == 0) {
            goto LABEL_18;
          }
          goto LABEL_21;
        }

        goto LABEL_23;
      }
    }

    p_isMonitoring = &self->_isMonitoring;
    if (!self->_isMonitoring)
    {
      LOBYTE(v6) = 1;
LABEL_21:
      -[W5StatusManager startEventMonitoring](self->_status, "startEventMonitoring");
      v14 = (OS_os_transaction *)os_transaction_create("com.apple.wifivelocity.monitoring");
      objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  "com.apple.wifivelocity.monitoring",  v14);
      self->_isMonitoringTransaction = v14;
      LOBYTE(isMonitoringTransaction) = 1;
      goto LABEL_22;
    }

    p_isMonitoringWiFiConnection = &self->_isMonitoringWiFiConnection;
    if (self->_isMonitoringWiFiConnection) {
      return;
    }
    goto LABEL_25;
  }

  p_isMonitoring = &self->_isMonitoring;
  if (!self->_isMonitoring)
  {
    p_isMonitoringWiFiConnection = &self->_isMonitoringWiFiConnection;
    if (!self->_isMonitoringWiFiConnection) {
      return;
    }
    goto LABEL_27;
  }

  LOBYTE(v6) = 0;
LABEL_18:
  -[W5StatusManager stopEventMonitoring](self->_status, "stopEventMonitoring");
  isMonitoringTransaction = self->_isMonitoringTransaction;
  if (isMonitoringTransaction)
  {
    objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionComplete:",  self->_isMonitoringTransaction);

    LOBYTE(isMonitoringTransaction) = 0;
    self->_isMonitoringTransaction = 0LL;
  }

- (void)__queryStatusAndReply:(id)a3
{
}

- (void)__queryDebugConfigurationAndReply:(id)a3
{
}

- (void)__setDebugConfiguration:(id)a3 reply:(id)a4
{
}

- (void)__runDiagnostics:(id)a3 configuration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  v11 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsTestRequestInternal);
  -[W5DiagnosticsTestRequestInternal setUuid:](v11, "setUuid:", a5);
  -[W5DiagnosticsTestRequestInternal setTestRequests:](v11, "setTestRequests:", a3);
  -[W5DiagnosticsTestRequestInternal setConfiguration:](v11, "setConfiguration:", a4);
  -[W5DiagnosticsTestRequestInternal setIncludeEvents:]( v11,  "setIncludeEvents:",  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"IncludeEvents"), "BOOLValue"));
  -[W5DiagnosticsTestRequestInternal setReply:](v11, "setReply:", a6);
  -[W5DiagnosticsManager addRequest:](self->_diagnostics, "addRequest:", v11);
}

- (void)__cancelDiagnosticsWithUUID:(id)a3 reply:(id)a4
{
}

- (void)__collectLogs:(id)a3 configuration:(id)a4 additionalLog:(id)a5 filename:(id)a6 uid:(unsigned int)a7 gid:(unsigned int)a8 uuid:(id)a9 reply:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v11 = *(void *)&a7;
  id v17 = [a4 mutableCopy];
  if (objc_msgSend( -[W5DebugManager queryDebugConfigurationAndReturnError:]( self->_debug,  "queryDebugConfigurationAndReturnError:",  0),  "megaWiFiProfile") == (id)1) {
    [v17 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseMegaWiFiProfileLimits"];
  }
  __int128 v18 = objc_alloc_init(&OBJC_CLASS___W5LogItemRequestInternal);
  -[W5LogItemRequestInternal setUuid:](v18, "setUuid:", a9);
  -[W5LogItemRequestInternal setItemRequests:](v18, "setItemRequests:", a3);
  -[W5LogItemRequestInternal setConfiguration:](v18, "setConfiguration:", v17);
  -[W5LogItemRequestInternal setFilename:](v18, "setFilename:", a6);
  -[W5LogItemRequestInternal setAdditionalLog:](v18, "setAdditionalLog:", a5);
  -[W5LogItemRequestInternal setUid:](v18, "setUid:", v11);
  -[W5LogItemRequestInternal setGid:](v18, "setGid:", v10);
  -[W5LogItemRequestInternal setIncludeEvents:]( v18,  "setIncludeEvents:",  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"IncludeEvents"), "BOOLValue"));
  -[W5LogItemRequestInternal setAddedAt:](v18, "setAddedAt:", +[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10002759C;
  v19[3] = &unk_1000D1CD0;
  v19[5] = self;
  v19[6] = a10;
  v19[4] = a4;
  -[W5LogItemRequestInternal setReply:](v18, "setReply:", v19);
  -[W5LogManager addRequest:](self->_log, "addRequest:", v18);
}

- (void)__collectLogsDiagnosticMode:(id)a3 outputName:(id)a4 uid:(unsigned int)a5 gid:(unsigned int)a6 uuid:(id)a7 reply:(id)a8
{
  id v12 = [a3 mutableCopy];
  if (objc_msgSend( -[W5DebugManager queryDebugConfigurationAndReturnError:]( self->_debug,  "queryDebugConfigurationAndReturnError:",  0),  "megaWiFiProfile") == (id)1) {
    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseMegaWiFiProfileLimits"];
  }
  diagnosticsModeManager = self->_diagnosticsModeManager;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100027910;
  v14[3] = &unk_1000D1CF8;
  v14[4] = a8;
  -[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]( diagnosticsModeManager,  "collectLogsDiagnosticMode:outputName:reply:",  a3,  a4,  v14);
}

- (void)__cancelCollectLogsWithUUID:(id)a3 reply:(id)a4
{
}

- (void)__runWiFiSnifferOnPeer:(id)a3 channels:(id)a4 duration:(double)a5 uuid:(id)a6 reply:(id)a7
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000279FC;
  v9[3] = &unk_1000D1D20;
  v9[4] = a7;
  id v8 = -[W5PeerManager runSnifferAtPeerWithRequest:]( self->_peerManager,  "runSnifferAtPeerWithRequest:",  -[W5PeerSnifferRequest initWithPeer:requestType:duration:uuid:channels:config:reply:]( objc_alloc(&OBJC_CLASS___W5PeerSnifferRequest),  "initWithPeer:requestType:duration:uuid:channels:config:reply:",  a3,  1LL,  0LL,  a4,  0LL,  v9,  a5));
  if (a7)
  {
    if (v8) {
      (*((void (**)(id, id, void, void, void))a7 + 2))(a7, v8, 0LL, 0LL, 0LL);
    }
  }

- (void)__runWiFiSnifferOnChannel:(id)a3 duration:(double)a4 uuid:(id)a5 tcpDump:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  v13 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v13, "setDateFormat:", @"yyyy-MM-dd_HH.mm.ss.SSS");
  v14 = -[NSURL URLByAppendingPathComponent:]( +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/var/run/com.apple.wifivelocity"),  "URLByAppendingPathComponent:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@_ch%li_%@.pcap",  objc_msgSend(-[W5Engine __localPeer](self, "__localPeer"), "name"),  objc_msgSend(a3, "channel"),  -[NSDateFormatter stringFromDate:](v13, "stringFromDate:", +[NSDate date](NSDate, "date"))));
  v15 = objc_alloc_init(&OBJC_CLASS___W5WiFiSnifferRequest);
  -[W5WiFiSnifferRequest setUuid:](v15, "setUuid:", a5);
  -[W5WiFiSnifferRequest setChannel:](v15, "setChannel:", a3);
  -[W5WiFiSnifferRequest setDuration:](v15, "setDuration:", a4);
  -[W5WiFiSnifferRequest setOutputFile:](v15, "setOutputFile:", v14);
  -[W5WiFiSnifferRequest setMonitorMode:](v15, "setMonitorMode:", a3 != 0LL);
  -[W5WiFiSnifferRequest setTcpDump:](v15, "setTcpDump:", v8);
  -[W5WiFiSnifferRequest setNoAutoStop:](v15, "setNoAutoStop:", 0LL);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100027C60;
  v18[3] = &unk_1000D1D48;
  v18[4] = v14;
  v18[5] = a7;
  -[W5WiFiSnifferRequest setReply:](v15, "setReply:", v18);
  -[W5WiFiSniffManager addRequest:](self->_sniff, "addRequest:", v15);
  v16 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138544130;
    id v20 = a5;
    __int16 v21 = 2114;
    id v22 = a3;
    __int16 v23 = 2048;
    uint64_t v24 = (uint64_t)a4;
    __int16 v25 = 2114;
    v26 = v14;
    LODWORD(v17) = 42;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] Sniffer Request added to queue with UUID: %{public}@, channel: %{public}@, duration: %ld, outputFile: %{public}@",  &v19,  v17);
  }

- (void)__cancelWiFiSnifferWithUUID:(id)a3 reply:(id)a4
{
}

- (void)__cancelWiFiSnifferWithUUID:(id)a3 peer:(id)a4 reply:(id)a5
{
  if (a4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100027D6C;
    v7[3] = &unk_1000D1D20;
    v7[4] = a5;
    id v6 = -[W5PeerManager runSnifferAtPeerWithRequest:]( self->_peerManager,  "runSnifferAtPeerWithRequest:",  -[W5PeerSnifferRequest initWithPeer:requestType:duration:uuid:channels:config:reply:]( objc_alloc(&OBJC_CLASS___W5PeerSnifferRequest),  "initWithPeer:requestType:duration:uuid:channels:config:reply:",  a4,  2LL,  a3,  0LL,  0LL,  v7,  0.0));
    if (a5)
    {
      if (v6) {
        (*((void (**)(id, id))a5 + 2))(a5, v6);
      }
    }
  }

  else
  {
    -[W5Engine __cancelWiFiSnifferWithUUID:reply:](self, "__cancelWiFiSnifferWithUUID:reply:", a3, a5);
  }

- (void)__runWiFiPerfLoggingWithConfiguration:(id)a3 uuid:(id)a4 reply:(id)a5
{
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___W5WiFiPerfLoggingRequest);
  -[W5WiFiPerfLoggingRequest setUuid:](v9, "setUuid:", a4);
  -[W5WiFiPerfLoggingRequest setConfiguration:](v9, "setConfiguration:", a3);
  -[W5WiFiPerfLoggingRequest setReply:](v9, "setReply:", a5);
  -[W5WiFiPerfLoggingManager addRequest:](self->_wifiperf, "addRequest:", v9);
}

- (void)__cancelWiFiPerfLoggingWithUUID:(id)a3 reply:(id)a4
{
}

- (void)__queryDatabaseAndReply:(id)a3 reply:(id)a4
{
}

- (void)__updatedStatusWithEvent:(id)a3
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  xpcConnections = self->_xpcConnections;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( xpcConnections,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(xpcConnections);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if (objc_msgSend( objc_msgSend(v9, "eventIDs"),  "containsObject:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(a3, "eventID")))) {
          objc_msgSend(objc_msgSend(objc_msgSend(v9, "connection"), "remoteObjectProxy"), "receivedEvent:", a3);
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( xpcConnections,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

- (void)__completedDiagnosticsTest:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "info"), "objectForKeyedSubscript:", @"UUID");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  xpcConnections = self->_xpcConnections;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( xpcConnections,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(xpcConnections);
        }
        if ((v8 & 1) != 0)
        {
LABEL_17:
          char v8 = 1;
        }

        else
        {
          __int128 v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v10);
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          id v12 = [v11 activeRequests];
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v20;
            while (2)
            {
              for (i = 0LL; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                if (objc_msgSend( objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)i), "uuid"),  "isEqual:",  v4))
                {
                  objc_msgSend(objc_msgSend(objc_msgSend(v11, "connection"), "remoteObjectProxy"), "receivedEvent:", a3);
                  goto LABEL_17;
                }
              }

              id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
              char v8 = 0;
              if (v14) {
                continue;
              }
              break;
            }
          }

          else
          {
            char v8 = 0;
          }
        }

        __int128 v10 = (char *)v10 + 1;
      }

      while (v10 != v7);
      id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( xpcConnections,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
      id v7 = v17;
    }

    while (v17);
  }

- (void)__collectedLogItem:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "info"), "objectForKeyedSubscript:", @"UUID");
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  xpcConnections = self->_xpcConnections;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( xpcConnections,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      __int128 v10 = 0LL;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(xpcConnections);
        }
        if ((v8 & 1) != 0)
        {
LABEL_17:
          char v8 = 1;
        }

        else
        {
          __int128 v11 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v10);
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          id v12 = [v11 activeRequests];
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v20;
            while (2)
            {
              for (i = 0LL; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                if (objc_msgSend( objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)i), "uuid"),  "isEqual:",  v4))
                {
                  objc_msgSend(objc_msgSend(objc_msgSend(v11, "connection"), "remoteObjectProxy"), "receivedEvent:", a3);
                  goto LABEL_17;
                }
              }

              id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
              char v8 = 0;
              if (v14) {
                continue;
              }
              break;
            }
          }

          else
          {
            char v8 = 0;
          }
        }

        __int128 v10 = (char *)v10 + 1;
      }

      while (v10 != v7);
      id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( xpcConnections,  "countByEnumeratingWithState:objects:count:",  &v23,  v28,  16LL);
      id v7 = v17;
    }

    while (v17);
  }

- (void)__collectLogItem:(id)a3 reply:(id)a4
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100028354;
  v7[3] = &unk_1000D1B80;
  v7[4] = a3;
  void v7[5] = a4;
  dispatch_async(global_queue, v7);
}

- (void)__setupCallbacks
{
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x3052000000LL;
  v28[3] = sub_1000276F0;
  v28[4] = sub_100027700;
  v28[5] = self;
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x3052000000LL;
  v27[3] = sub_1000276F0;
  v27[4] = sub_100027700;
  queue = self->_queue;
  status = self->_status;
  v27[5] = queue;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x3052000000LL;
  v26[3] = sub_1000276F0;
  v26[4] = sub_100027700;
  v26[5] = status;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x3052000000LL;
  v25[3] = sub_1000276F0;
  v25[4] = sub_100027700;
  v25[5] = self->_monitor;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100028954;
  v24[3] = &unk_1000D1D70;
  v24[4] = v27;
  v24[5] = v28;
  -[W5StatusManager setUpdatedWiFiStatusCallback:](status, "setUpdatedWiFiStatusCallback:", v24);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000289E8;
  v23[3] = &unk_1000D1D70;
  v23[4] = v27;
  v23[5] = v28;
  -[W5StatusManager setUpdatedAWDLStatusCallback:](self->_status, "setUpdatedAWDLStatusCallback:", v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100028A7C;
  v22[3] = &unk_1000D1D70;
  v22[4] = v27;
  v22[5] = v28;
  -[W5StatusManager setUpdatedBluetoothStatusCallback:](self->_status, "setUpdatedBluetoothStatusCallback:", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100028B10;
  v21[3] = &unk_1000D1D70;
  v21[4] = v27;
  v21[5] = v28;
  -[W5StatusManager setUpdatedNetworkStatusCallback:](self->_status, "setUpdatedNetworkStatusCallback:", v21);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100028BA4;
  v20[3] = &unk_1000D1D70;
  v20[4] = v27;
  v20[5] = v28;
  -[W5StatusManager setUpdatedPowerStatusCallback:](self->_status, "setUpdatedPowerStatusCallback:", v20);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100028C38;
  v19[3] = &unk_1000D1D98;
  v19[4] = v27;
  v19[5] = v26;
  v19[6] = v25;
  void v19[7] = v28;
  -[W5StatusManager setUpdatedWiFiCallback:](self->_status, "setUpdatedWiFiCallback:", v19);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100028D58;
  v18[3] = &unk_1000D1D70;
  v18[4] = v27;
  v18[5] = v28;
  -[W5StatusManager setUpdatedBluetoothCallback:](self->_status, "setUpdatedBluetoothCallback:", v18);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100028DEC;
  v17[3] = &unk_1000D1D98;
  v17[4] = v27;
  v17[5] = v26;
  v17[6] = v25;
  v17[7] = v28;
  -[W5StatusManager setUpdatedPowerManagementCallback:](self->_status, "setUpdatedPowerManagementCallback:", v17);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100028EFC;
  v16[3] = &unk_1000D1D70;
  v16[4] = v27;
  v16[5] = v28;
  -[W5StatusManager setUpdatedPowerSourceCallback:](self->_status, "setUpdatedPowerSourceCallback:", v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100028F90;
  v15[3] = &unk_1000D1D70;
  v15[4] = v27;
  v15[5] = v28;
  -[W5StatusManager setLowBatteryCallback:](self->_status, "setLowBatteryCallback:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100029024;
  v14[3] = &unk_1000D1D70;
  v14[4] = v27;
  void v14[5] = v28;
  -[W5StatusManager setUpdatedFaultsCallback:](self->_status, "setUpdatedFaultsCallback:", v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000290B8;
  v13[3] = &unk_1000D1D70;
  v13[4] = v27;
  void v13[5] = v28;
  -[W5StatusManager setUpdatedLinkTestsCallback:](self->_status, "setUpdatedLinkTestsCallback:", v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002914C;
  v12[3] = &unk_1000D1D70;
  v12[4] = v27;
  void v12[5] = v28;
  -[W5StatusManager setUpdatedRecoveriesCallback:](self->_status, "setUpdatedRecoveriesCallback:", v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000291E0;
  v11[3] = &unk_1000D1DE8;
  v11[4] = v27;
  void v11[5] = v28;
  -[W5DiagnosticsManager setCompletedTestCallback:](self->_diagnostics, "setCompletedTestCallback:", v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100029330;
  v10[3] = &unk_1000D1E38;
  v10[4] = v27;
  v10[5] = v26;
  v10[6] = v28;
  -[W5DiagnosticsManager setPingCallback:](self->_diagnostics, "setPingCallback:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000293E4;
  v9[3] = &unk_1000D1E60;
  v9[4] = v27;
  void v9[5] = v28;
  -[W5LogManager setCollectedItemCallback:](self->_log, "setCollectedItemCallback:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100029534;
  v8[3] = &unk_1000D1EB0;
  v8[4] = v27;
  v8[5] = v28;
  -[W5LogManager setCollectLogItemCallback:](self->_log, "setCollectLogItemCallback:", v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000295D0;
  v7[3] = &unk_1000D1E38;
  v7[4] = v27;
  void v7[5] = v26;
  void v7[6] = v28;
  -[W5LogManager setPingCallback:](self->_log, "setPingCallback:", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100029684;
  v6[3] = &unk_1000D1E38;
  v6[4] = v27;
  v6[5] = v26;
  v6[6] = v28;
  -[W5WiFiConnectionMonitor setDroppedWiFiConnectionCallback:](self->_monitor, "setDroppedWiFiConnectionCallback:", v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100029738;
  v5[3] = &unk_1000D1ED8;
  v5[4] = self;
  v5[5] = v27;
  -[W5FaultEventManager setFaultEventHandler:](self->_faultEventManager, "setFaultEventHandler:", v5);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
}

- (void)xpcConnection:(id)a3 startMonitoringEvents:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002992C;
  v6[3] = &unk_1000D1B80;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(queue, v6);
}

- (void)xpcConnection:(id)a3 stopMonitoringEvents:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000299C8;
  v6[3] = &unk_1000D1B80;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(queue, v6);
}

- (void)xpcConnection:(id)a3 queryLocalPeerAndReply:(id)a4
{
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100029A64;
  v5[3] = &unk_1000D1B80;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)xpcConnection:(id)a3 queryStatusForPeer:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029B40;
  block[3] = &unk_1000D2018;
  void block[5] = self;
  block[6] = a5;
  block[4] = a4;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 queryDatabaseForPeer:(id)a4 fetch:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100029D58;
  v7[3] = &unk_1000D1FC8;
  v7[4] = a4;
  void v7[5] = self;
  void v7[6] = a5;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 requestFileFromPeer:(id)a4 remoteFilePath:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002A100;
  v7[3] = &unk_1000D1FC8;
  v7[4] = a4;
  void v7[5] = a5;
  void v7[6] = self;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 listFilesFromPeer:(id)a4 remoteDirPath:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002A270;
  v7[3] = &unk_1000D1FC8;
  v7[4] = a4;
  void v7[5] = a5;
  void v7[6] = self;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 queryDebugConfigurationForPeer:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002A3AC;
  block[3] = &unk_1000D2018;
  void block[5] = self;
  block[6] = a5;
  block[4] = a4;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 setDebugConfiguration:(id)a4 peer:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002A5CC;
  v7[3] = &unk_1000D2090;
  v7[4] = a5;
  void v7[5] = a4;
  void v7[6] = self;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 runDiagnostics:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002A7E8;
  v8[3] = &unk_1000D20E0;
  v8[4] = a6;
  v8[5] = a3;
  void v8[6] = a5;
  v8[7] = a4;
  v8[8] = self;
  v8[9] = a7;
  dispatch_async(queue, v8);
}

- (void)xpcConnection:(id)a3 runDiagnosticsForPeer:(id)a4 diagnostics:(id)a5 configuration:(id)a6 uuid:(id)a7 reply:(id)a8
{
  __int128 v11 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 136316674;
    v37 = "-[W5Engine xpcConnection:runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:]";
    __int16 v38 = 2080;
    v39 = "W5Engine.m";
    __int16 v40 = 1024;
    int v41 = 1202;
    __int16 v42 = 2114;
    id v43 = objc_msgSend(objc_msgSend(a7, "UUIDString"), "substringToIndex:", 5);
    __int16 v44 = 2114;
    id v45 = [a3 processName];
    __int16 v46 = 1024;
    unsigned int v47 = objc_msgSend(objc_msgSend(a3, "connection"), "processIdentifier");
    __int16 v48 = 2114;
    id v49 = a6;
    int v23 = 64;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  0LL,  "[wifivelocity] %s (%s:%u) RECEIVED DIAGNOSTICS REQUEST (uuid=%{public}@) from %{public}@ (%d) with configuration % {public}@ and items:",  &v36,  v23);
  }

  id v25 = a6;
  id v26 = a7;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v12 = [a5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(a5);
        }
        v16 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        id v17 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = W5DescriptionForDiagnosticsTestID([v16 testID]);
          id v19 = [v16 testID];
          int v36 = 136316162;
          v37 = "-[W5Engine xpcConnection:runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:]";
          __int16 v38 = 2080;
          v39 = "W5Engine.m";
          __int16 v40 = 1024;
          int v41 = 1204;
          __int16 v42 = 2114;
          id v43 = (id)v18;
          __int16 v44 = 2048;
          id v45 = v19;
          LODWORD(v22) = 48;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] %s (%s:%u) TEST: %{public}@ (%ld)",  &v36,  v22);
        }
      }

      id v13 = [a5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v13);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10002B02C;
  v30[3] = &unk_1000D1F78;
  v30[4] = a8;
  __int128 v20 = -[W5PeerDiagnosticsRequest initWithPeer:diagnostics:configuration:uuid:reply:]( objc_alloc(&OBJC_CLASS___W5PeerDiagnosticsRequest),  "initWithPeer:diagnostics:configuration:uuid:reply:",  a4,  a5,  v25,  v26,  v30);
  id v21 = -[W5PeerManager runDiagnosticsOnPeerWithRequest:](self->_peerManager, "runDiagnosticsOnPeerWithRequest:", v20);
  if (a8 && v21) {
    (*((void (**)(id, id, void))a8 + 2))(a8, v21, 0LL);
  }
  if (v20) {
    CFRelease(v20);
  }
}

- (void)xpcConnection:(id)a3 registerRemoteDiagnosticEventsForPeer:(id)a4 configuration:(id)a5 reply:(id)a6
{
  uint64_t v10 = 0LL;
  if (!-[W5DiagnosticsModeManager registerPeer:role:configuration:error:]( self->_diagnosticsModeManager,  "registerPeer:role:configuration:error:",  a4,  16LL,  a5,  &v10))
  {
    char v8 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316162;
      id v12 = "-[W5Engine xpcConnection:registerRemoteDiagnosticEventsForPeer:configuration:reply:]";
      __int16 v13 = 2080;
      uint64_t v14 = "W5Engine.m";
      __int16 v15 = 1024;
      int v16 = 1224;
      __int16 v17 = 2114;
      id v18 = a4;
      __int16 v19 = 2114;
      uint64_t v20 = v10;
      int v9 = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) failed to register peer='%{public}@' error='%{public}@'",  &v11,  v9);
    }
  }

  if (a6) {
    (*((void (**)(id, uint64_t))a6 + 2))(a6, v10);
  }
}

- (void)xpcConnection:(id)a3 unregisterRemoteDiagnosticEventsForPeer:(id)a4 configuration:(id)a5 reply:(id)a6
{
  uint64_t v10 = 0LL;
  if (!-[W5DiagnosticsModeManager unregisterPeer:role:error:]( self->_diagnosticsModeManager,  "unregisterPeer:role:error:",  a4,  16LL,  &v10))
  {
    char v8 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316162;
      id v12 = "-[W5Engine xpcConnection:unregisterRemoteDiagnosticEventsForPeer:configuration:reply:]";
      __int16 v13 = 2080;
      uint64_t v14 = "W5Engine.m";
      __int16 v15 = 1024;
      int v16 = 1234;
      __int16 v17 = 2114;
      id v18 = a4;
      __int16 v19 = 2114;
      uint64_t v20 = v10;
      int v9 = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[wifivelocity] %s (%s:%u) failed to unregisterPeer peer='%{public}@' error='%{public}@'",  &v11,  v9);
    }
  }

  if (a6) {
    (*((void (**)(id, uint64_t))a6 + 2))(a6, v10);
  }
}

- (void)xpcConnection:(id)a3 queryRegisteredDiagnosticsPeersWithReply:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, id))a4 + 2))( a4,  0LL,  -[W5DiagnosticsModeManager registeredPeersForFaultType:]( self->_diagnosticsModeManager,  "registeredPeersForFaultType:",  0x7FFFFFFFFFFFFFFFLL));
  }
}

- (void)xpcConnection:(id)a3 startDiagnosticsModeWithConfiguration:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002B33C;
  v6[3] = &unk_1000D1FC8;
  v6[4] = a3;
  v6[5] = a4;
  void v6[6] = self;
  void v6[7] = a5;
  dispatch_async(queue, v6);
}

- (void)xpcConnection:(id)a3 stopDiagnosticsModeWithUUID:(id)a4 info:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B5D0;
  block[3] = &unk_1000D2130;
  block[4] = a4;
  void block[5] = a3;
  block[6] = a5;
  void block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 queryDiagnosticsModeForPeer:(id)a4 info:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B860;
  block[3] = &unk_1000D2130;
  block[4] = a3;
  void block[5] = a5;
  block[6] = a4;
  void block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 collectLogs:(id)a4 configuration:(id)a5 uuid:(id)a6 reply:(id)a7
{
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002BC00;
  v8[3] = &unk_1000D20E0;
  v8[4] = a6;
  v8[5] = a3;
  void v8[6] = a5;
  v8[7] = a4;
  v8[8] = self;
  v8[9] = a7;
  dispatch_async(queue, v8);
}

- (void)xpcConnection:(id)a3 collectLogsDiagnosticMode:(id)a4 uuid:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C2BC;
  block[3] = &unk_1000D2130;
  block[4] = a5;
  void block[5] = a3;
  block[6] = a4;
  void block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 runWiFiSnifferOnChannels:(id)a4 duration:(double)a5 peer:(id)a6 uuid:(id)a7 reply:(id)a8
{
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002C8E0;
  v9[3] = &unk_1000D2298;
  v9[4] = a6;
  void v9[5] = self;
  *(double *)&v9[9] = a5;
  v9[7] = a7;
  v9[8] = a8;
  void v9[6] = a4;
  dispatch_async(queue, v9);
}

- (void)xpcConnection:(id)a3 runWiFiSnifferWithTCPDumpOnChannels:(id)a4 duration:(double)a5 peer:(id)a6 uuid:(id)a7 reply:(id)a8
{
  queue = (dispatch_queue_s *)self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002CCE4;
  v9[3] = &unk_1000D2298;
  v9[4] = a6;
  void v9[5] = self;
  *(double *)&v9[9] = a5;
  v9[7] = a7;
  v9[8] = a8;
  void v9[6] = a4;
  dispatch_async(queue, v9);
}

- (void)xpcConnection:(id)a3 startPeerDiscoveryWithConfiguration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002CFDC;
  block[3] = &unk_1000D2130;
  block[4] = a4;
  void block[5] = a5;
  block[6] = a3;
  void block[7] = self;
  block[8] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 stopPeerDiscoveryWithUUID:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002D244;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)__cancelPeerDiscoveryWithUUID:(id)a3
{
  if (-[W5PeerManager stopPeerDiscoveryWithRequestUUID:](self->_peerManager, "stopPeerDiscoveryWithRequestUUID:"))
  {
    id v4 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      id v7 = "-[W5Engine __cancelPeerDiscoveryWithUUID:]";
      __int16 v8 = 2080;
      int v9 = "W5Engine.m";
      __int16 v10 = 1024;
      int v11 = 1515;
      __int16 v12 = 2114;
      id v13 = a3;
      int v5 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v4,  0LL,  "[wifivelocity] %s (%s:%u) failed to stop peer discovery for UUID='%{public}@'",  &v6,  v5);
    }
  }

- (void)xpcConnection:(id)a3 runWiFiPerformanceLoggingWithConfiguration:(id)a4 uuid:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002D3D8;
  v7[3] = &unk_1000D1FC8;
  v7[4] = self;
  void v7[5] = a4;
  void v7[6] = a5;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 cancelDiagnosticsWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002D53C;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  void block[5] = a4;
  block[6] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 cancelCollectLogsWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002D6A0;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  void block[5] = a4;
  block[6] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 cancelWiFiSnifferWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002D804;
  v7[3] = &unk_1000D1FC8;
  v7[4] = a5;
  void v7[5] = self;
  void v7[6] = a4;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 cancelWiFiSnifferWithUUID:(id)a4 peer:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10002DA84;
  v7[3] = &unk_1000D1FC8;
  v7[4] = a5;
  void v7[5] = self;
  void v7[6] = a4;
  void v7[7] = a6;
  dispatch_async(queue, v7);
}

- (void)xpcConnection:(id)a3 cancelWiFiPerformanceLoggingWithUUID:(id)a4 peerID:(id)a5 reply:(id)a6
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DCBC;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  void block[5] = a4;
  block[6] = a6;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 startMonitoringFaultEventsForPeer:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DE20;
  block[3] = &unk_1000D1BD0;
  block[4] = a4;
  void block[5] = self;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 stopMonitoringFaultEventsForPeer:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DED0;
  block[3] = &unk_1000D1BD0;
  block[4] = a4;
  void block[5] = self;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 submitFaultEvent:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DF80;
  block[3] = &unk_1000D1BD0;
  block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (void)xpcConnection:(id)a3 queryFaultEventCacheForPeer:(id)a4 reply:(id)a5
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E024;
  block[3] = &unk_1000D1BD0;
  block[4] = a4;
  void block[5] = self;
  block[6] = a5;
  dispatch_async(queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x3052000000LL;
  v40[3] = sub_1000276F0;
  v40[4] = sub_100027700;
  v40[5] = a4;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3052000000LL;
  v37 = sub_1000276F0;
  __int16 v38 = sub_100027700;
  uint64_t v39 = 0LL;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3052000000LL;
  __int128 v31 = sub_1000276F0;
  __int128 v32 = sub_100027700;
  uint64_t v33 = 0LL;
  int v6 =  -[W5XPCConnection initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___W5XPCConnection),  "initWithXPCConnection:",  a4);
  id v7 = v6;
  if (!v6)
  {
    __int16 v17 = (os_log_s *)sub_10008C90C();
    BOOL v15 = 0;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    unsigned int v18 = [a4 processIdentifier];
    int v41 = 136315906;
    __int16 v42 = "-[W5Engine listener:shouldAcceptNewConnection:]";
    __int16 v43 = 2080;
    __int16 v44 = "W5Engine.m";
    __int16 v45 = 1024;
    int v46 = 1712;
    __int16 v47 = 1024;
    LODWORD(v48) = v18;
    int v23 = 34;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] %s (%s:%u) FAILED to create W5XPCConnection object for pid=%d, will not accept new XPC connection",  &v41,  v23);
LABEL_12:
    BOOL v15 = 0;
    goto LABEL_9;
  }

  if ((objc_msgSend( -[NSXPCConnection valueForEntitlement:]( -[W5XPCConnection connection](v6, "connection"),  "valueForEntitlement:",  @"com.apple.private.wifivelocity"),  "BOOLValue") & 1) == 0 && (objc_msgSend( -[NSXPCConnection valueForEntitlement:]( -[W5XPCConnection connection](v7, "connection"),  "valueForEntitlement:",  @"com.apple.private.network-performance-tester"),  "BOOLValue") & 1) == 0 && (objc_msgSend( -[NSXPCConnection valueForEntitlement:]( -[W5XPCConnection connection](v7, "connection"),  "valueForEntitlement:",  @"com.apple.wifivelocity"),  "BOOLValue") & 1) == 0 && (objc_msgSend( -[NSXPCConnection valueForEntitlement:]( -[W5XPCConnection connection](v7, "connection"),  "valueForEntitlement:",  @"com.apple.wireless-diagnostics"),  "BOOLValue") & 1) == 0)
  {
    __int16 v19 = (os_log_s *)sub_10008C90C();
    BOOL v15 = 0;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    uint64_t v20 = -[W5XPCConnection processName](v7, "processName");
    unsigned int v21 = -[NSXPCConnection processIdentifier](-[W5XPCConnection connection](v7, "connection"), "processIdentifier");
    int v41 = 136316418;
    __int16 v42 = "-[W5Engine listener:shouldAcceptNewConnection:]";
    __int16 v43 = 2080;
    __int16 v44 = "W5Engine.m";
    __int16 v45 = 1024;
    int v46 = 1719;
    __int16 v47 = 2114;
    __int16 v48 = v20;
    __int16 v49 = 1024;
    unsigned int v50 = v21;
    __int16 v51 = 2114;
    *(void *)v52 = @"com.apple.private.wifivelocity";
    int v24 = 54;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) ERROR: %{public}@ (%d) is not entitled for %{public}@, rejecting connection!!!",  &v41,  v24);
    goto LABEL_12;
  }

  -[W5XPCConnection setDelegate:](v7, "setDelegate:", self);
  [a4 setExportedInterface:sub_100030094()];
  [a4 setExportedObject:v7];
  [a4 setRemoteObjectInterface:sub_100031DAC()];
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002E5E4;
  block[3] = &unk_1000D1BA8;
  block[4] = self;
  void block[5] = v7;
  dispatch_sync(queue, block);
  uint64_t v9 = os_transaction_create(-[NSString utf8ValueSafe](-[W5XPCConnection processName](v7, "processName"), "utf8ValueSafe"));
  objc_msgSend( +[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager"),  "osTransactionCreate:transaction:",  -[NSString utf8ValueSafe](-[W5XPCConnection processName](v7, "processName"), "utf8ValueSafe"),  v9);
  v29[5] = v9;
  v35[5] = (uint64_t)v7;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10002E618;
  v26[3] = &unk_1000D2310;
  v26[4] = &v34;
  v26[5] = v40;
  [a4 setInterruptionHandler:v26];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10002E778;
  v25[3] = &unk_1000D2338;
  v25[4] = self;
  v25[5] = &v34;
  void v25[6] = v40;
  v25[7] = &v28;
  [a4 setInvalidationHandler:v25];
  __int16 v10 = (os_log_s *)sub_10008C90C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = -[W5XPCConnection processName](v7, "processName");
    unsigned int v12 = [a4 processIdentifier];
    unsigned int v13 = [a4 effectiveUserIdentifier];
    unsigned int v14 = [a4 effectiveGroupIdentifier];
    int v41 = 136316674;
    __int16 v42 = "-[W5Engine listener:shouldAcceptNewConnection:]";
    __int16 v43 = 2080;
    __int16 v44 = "W5Engine.m";
    __int16 v45 = 1024;
    int v46 = 1823;
    __int16 v47 = 2114;
    __int16 v48 = v11;
    __int16 v49 = 1024;
    unsigned int v50 = v12;
    __int16 v51 = 1024;
    *(_DWORD *)v52 = v13;
    *(_WORD *)&v52[4] = 1024;
    *(_DWORD *)&v52[6] = v14;
    int v22 = 56;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) ADDED XPC CONNECTION %{public}@ [pid=%d, euid=%d, egid=%d]",  &v41,  v22);
  }

  [a4 resume];
  BOOL v15 = 1;
LABEL_9:
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v40, 8);
  return v15;
}

- (id)_peerListeners
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v4 =  -[W5PeerSensingListener initWithInterface:]( objc_alloc(&OBJC_CLASS___W5PeerSensingListener),  "initWithInterface:",  -[W5StatusManager corewifi](self->_status, "corewifi"));
  if (v4)
  {
    -[NSMutableArray addObject:](v3, "addObject:", v4);
    int v5 =  -[W5PeerStatusListener initWithInterface:statusManager:]( objc_alloc(&OBJC_CLASS___W5PeerStatusListener),  "initWithInterface:statusManager:",  -[W5StatusManager corewifi](self->_status, "corewifi"),  self->_status);
    if (v5)
    {
      -[NSMutableArray addObject:](v3, "addObject:", v5);
      int v6 =  -[W5PeerSnifferListener initWithInterface:snifferManager:]( objc_alloc(&OBJC_CLASS___W5PeerSnifferListener),  "initWithInterface:snifferManager:",  -[W5StatusManager corewifi](self->_status, "corewifi"),  self->_sniff);
      if (v6)
      {
        -[NSMutableArray addObject:](v3, "addObject:", v6);
        id v7 =  -[W5PeerDebugListener initWithDebugManager:]( objc_alloc(&OBJC_CLASS___W5PeerDebugListener),  "initWithDebugManager:",  self->_debug);
        if (v7)
        {
          -[NSMutableArray addObject:](v3, "addObject:", v7);
          __int16 v8 =  -[W5PeerDiagnosticsListener initWithDiagnosticsManager:]( objc_alloc(&OBJC_CLASS___W5PeerDiagnosticsListener),  "initWithDiagnosticsManager:",  self->_diagnostics);
          if (v8)
          {
            -[NSMutableArray addObject:](v3, "addObject:", v8);
            uint64_t v9 =  -[W5PeerFileTransferListener initWithTransferManager:]( objc_alloc(&OBJC_CLASS___W5PeerFileTransferListener),  "initWithTransferManager:",  self->_transferManager);
            if (v9)
            {
              -[NSMutableArray addObject:](v3, "addObject:", v9);
              __int16 v10 =  -[W5PeerDatabaseListener initWithDatabaseAccessManager:]( objc_alloc(&OBJC_CLASS___W5PeerDatabaseListener),  "initWithDatabaseAccessManager:",  self->_databaseManager);
              if (v10)
              {
                -[NSMutableArray addObject:](v3, "addObject:", v10);
                -[NSMutableArray addObject:]( v3,  "addObject:",  -[W5FaultEventManager listener](self->_faultEventManager, "listener"));
              }

              else
              {
                unsigned int v18 = (os_log_s *)sub_10008C90C();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)__int16 v19 = 136315650;
                  *(void *)&v19[4] = "-[W5Engine _peerListeners]";
                  *(_WORD *)&v19[12] = 2080;
                  *(void *)&v19[14] = "W5Engine.m";
                  _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) failed to create databaseListener",  v19,  28,  *(_OWORD *)v19);
                }
              }
            }

            else
            {
              __int16 v17 = (os_log_s *)sub_10008C90C();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int16 v19 = 136315650;
                *(void *)&v19[4] = "-[W5Engine _peerListeners]";
                *(_WORD *)&v19[12] = 2080;
                *(void *)&v19[14] = "W5Engine.m";
                _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] %s (%s:%u) failed to create file transfer listener",  v19,  28,  *(_OWORD *)v19);
              }
            }
          }

          else
          {
            int v16 = (os_log_s *)sub_10008C90C();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int16 v19 = 136315650;
              *(void *)&v19[4] = "-[W5Engine _peerListeners]";
              *(_WORD *)&v19[12] = 2080;
              *(void *)&v19[14] = "W5Engine.m";
              _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) failed to create diagnostics listener",  v19,  28,  *(_OWORD *)v19);
            }
          }
        }

        else
        {
          BOOL v15 = (os_log_s *)sub_10008C90C();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v19 = 136315650;
            *(void *)&v19[4] = "-[W5Engine _peerListeners]";
            *(_WORD *)&v19[12] = 2080;
            *(void *)&v19[14] = "W5Engine.m";
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) failed to create debug listener",  v19,  28,  *(_OWORD *)v19);
          }
        }
      }

      else
      {
        unsigned int v14 = (os_log_s *)sub_10008C90C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v19 = 136315650;
          *(void *)&v19[4] = "-[W5Engine _peerListeners]";
          *(_WORD *)&v19[12] = 2080;
          *(void *)&v19[14] = "W5Engine.m";
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) failed to create sniffer listener",  v19,  28,  *(_OWORD *)v19);
        }
      }
    }

    else
    {
      unsigned int v13 = (os_log_s *)sub_10008C90C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v19 = 136315650;
        *(void *)&v19[4] = "-[W5Engine _peerListeners]";
        *(_WORD *)&v19[12] = 2080;
        *(void *)&v19[14] = "W5Engine.m";
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) failed to create connection listener",  v19,  28,  *(_OWORD *)v19);
      }
    }
  }

  else
  {
    unsigned int v12 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v19 = 136315650;
      *(void *)&v19[4] = "-[W5Engine _peerListeners]";
      *(_WORD *)&v19[12] = 2080;
      *(void *)&v19[14] = "W5Engine.m";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) failed to create sensing listener",  v19,  28,  *(_OWORD *)v19);
    }
  }

  return v3;
}

- (void)_scheduleRepeatingCleanupTasks
{
  if (!-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]( self->_bgTaskManager,  "scheduleRepeatingTask:interval:repeatingTask:",  @"com.apple.wifivelocity.sniffer_cleanup",  &stru_1000D2378,  86400.0))
  {
    v3 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      int v11 = "-[W5Engine _scheduleRepeatingCleanupTasks]";
      __int16 v12 = 2080;
      unsigned int v13 = "W5Engine.m";
      __int16 v14 = 1024;
      int v15 = 1922;
      LODWORD(v8) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v3,  0LL,  "[wifivelocity] %s (%s:%u) Failed to setup Sniffer Cleanup Periodic Task",  (const char *)&v10,  v8,  LODWORD(v9[0]));
    }
  }

  id v4 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF.absoluteString CONTAINS %@",  @"WiFiNetworkDiagnostics");
  int v5 = +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"pathExtension='tgz'");
  bgTaskManager = self->_bgTaskManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002F6E4;
  v9[3] = &unk_1000D23A0;
  v9[4] = v4;
  void v9[5] = v5;
  if (!-[W5BGTaskManager scheduleRepeatingTask:interval:repeatingTask:]( bgTaskManager,  "scheduleRepeatingTask:interval:repeatingTask:",  @"com.apple.wifivelocity.de_cleanup",  v9,  86400.0))
  {
    id v7 = (os_log_s *)sub_10008C90C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      int v11 = "-[W5Engine _scheduleRepeatingCleanupTasks]";
      __int16 v12 = 2080;
      unsigned int v13 = "W5Engine.m";
      __int16 v14 = 1024;
      int v15 = 1951;
      LODWORD(v8) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "[wifivelocity] %s (%s:%u) Failed to setup DE Cleanup Periodic Task",  (const char *)&v10,  v8,  LODWORD(v9[0]));
    }
  }

@end