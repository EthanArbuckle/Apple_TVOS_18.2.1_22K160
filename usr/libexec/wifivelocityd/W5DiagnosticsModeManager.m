@interface W5DiagnosticsModeManager
- (BOOL)_isFaultSupported:(int64_t)a3;
- (BOOL)_shouldShowNotification:(int64_t)a3;
- (BOOL)registerPeer:(id)a3 role:(int64_t)a4 configuration:(id)a5 error:(id *)a6;
- (BOOL)unregisterPeer:(id)a3 role:(int64_t)a4 error:(id *)a5;
- (NSArray)activeDiagnostics;
- (NSArray)allDiagnostics;
- (NSArray)registeredPeers;
- (NSMutableArray)processors;
- (NSMutableDictionary)lastNotificationTimestamp;
- (NSUUID)stopNotificationUUID;
- (W5DiagnosticsModeLocalStore)localStore;
- (W5DiagnosticsModeManager)initWithNetUsageManager:(id)a3 peerManager:(id)a4 userNotificationManager:(id)a5 snifferManager:(id)a6 statusManager:(id)a7 logManager:(id)a8;
- (W5DiagnosticsModePeer)controller;
- (W5DiagnosticsModeStore)store;
- (W5FaultEventManager)faultEventManager;
- (W5LogManager)logManager;
- (W5NetUsageManager)netUsageManager;
- (W5Peer)localPeer;
- (W5PeerManager)peerManager;
- (W5WiFiSniffManager)snifferManager;
- (id)_actionHandler;
- (id)finishedDiagnostics;
- (int64_t)registeredRoleForPeer:(id)a3;
- (int64_t)role;
- (int64_t)state;
- (void)__collectNetUsageFiles:(id)a3 uuid:(id)a4;
- (void)__waitForLogRequestToComplete:(id)a3 maxWait:(unint64_t)a4;
- (void)__writeDiagnosticModeToFile:(id)a3 file:(id)a4;
- (void)__writePeerStatusToFile:(id)a3;
- (void)_archiveAndCollectLogs:(id)a3 logCollectionPath:(id)a4 outputDirectory:(id)a5 maxWait:(unint64_t)a6;
- (void)_collectAnalyticsCSVsForDiagnosticMode:(id)a3;
- (void)_collectNetworkInfoForDiagnosticMode:(id)a3;
- (void)_collectSystemLogsForDiagnosticMode:(id)a3;
- (void)_finishedProcessingDiagnosticMode:(id)a3;
- (void)_notifyPeers:(id)a3 info:(id)a4;
- (void)_queryDebugConfigurationForPeer:(id)a3 reply:(id)a4;
- (void)_runDiagnosticsForDiagnosticMode:(id)a3;
- (void)_showSuggestedStartNotificationForEvent:(id)a3;
- (void)_showSuggestedStopNotificationForEvent:(id)a3;
- (void)_startDiagnosticsModeWithConfiguration:(id)a3 currentPeer:(id)a4 reply:(id)a5;
- (void)_stopDiagnosticsMode:(id)a3 currentPeer:(id)a4 info:(id)a5 reply:(id)a6;
- (void)_storeSnifferInfo:(id)a3 peer:(id)a4 uuid:(id)a5 path:(id)a6;
- (void)_updateDiagnosticsMode:(id)a3 incomingMode:(id)a4 currentPeer:(id)a5 reply:(id)a6;
- (void)collectLogsDiagnosticMode:(id)a3 outputName:(id)a4 reply:(id)a5;
- (void)handlePeerFaultEvent:(id)a3;
- (void)setController:(id)a3;
- (void)setFaultEventManager:(id)a3;
- (void)setLastNotificationTimestamp:(id)a3;
- (void)setLocalPeer:(id)a3;
- (void)setLocalStore:(id)a3;
- (void)setLogManager:(id)a3;
- (void)setNetUsageManager:(id)a3;
- (void)setPeerManager:(id)a3;
- (void)setProcessors:(id)a3;
- (void)setRegisteredPeers:(id)a3;
- (void)setSnifferManager:(id)a3;
- (void)setStopNotificationUUID:(id)a3;
- (void)setStore:(id)a3;
- (void)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4;
- (void)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5;
- (void)updateDiagnosticsMode:(id)a3 reply:(id)a4;
@end

@implementation W5DiagnosticsModeManager

- (W5DiagnosticsModeManager)initWithNetUsageManager:(id)a3 peerManager:(id)a4 userNotificationManager:(id)a5 snifferManager:(id)a6 statusManager:(id)a7 logManager:(id)a8
{
  id v31 = a3;
  id v15 = a4;
  id v30 = a5;
  id v16 = a6;
  id v29 = a7;
  id v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___W5DiagnosticsModeManager;
  v18 = -[W5DiagnosticsModeManager init](&v32, "init");
  objc_storeStrong((id *)&v18->_netUsageManager, a3);
  if (v15
    && (objc_storeStrong((id *)&v18->_peerManager, a4), v16)
    && (objc_storeStrong((id *)&v18->_snifferManager, a6), v17))
  {
    objc_storeStrong((id *)&v18->_logManager, a8);
    objc_storeStrong((id *)&v18->_userNotificationManager, a5);
    objc_storeStrong((id *)&v18->_statusManager, a7);
    v19 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsModeStore);
    store = v18->_store;
    v18->_store = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___W5DiagnosticsModeLocalStore);
    localStore = v18->_localStore;
    v18->_localStore = v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    processors = v18->_processors;
    v18->_processors = (NSMutableArray *)v23;

    uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    lastNotificationTimestamp = v18->_lastNotificationTimestamp;
    v18->_lastNotificationTimestamp = (NSMutableDictionary *)v25;

    faultEventManager = v18->_faultEventManager;
    v18->_faultEventManager = 0LL;
  }

  else
  {
    faultEventManager = v18;
    v18 = 0LL;
  }

  return v18;
}

- (void)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = sub_10008C90C();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136315906;
    v28 = "-[W5DiagnosticsModeManager startDiagnosticsModeWithConfiguration:reply:]";
    __int16 v29 = 2080;
    id v30 = "W5DiagnosticsModeManager.m";
    __int16 v31 = 1024;
    int v32 = 148;
    __int16 v33 = 2114;
    id v34 = v6;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) [DM] starting with info='%{public}@'",  &v27,  38);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"Peers"]);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 peerID]);
    id v13 = sub_100086510(v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v14)
    {
      -[W5DiagnosticsModeManager _startDiagnosticsModeWithConfiguration:currentPeer:reply:]( self,  "_startDiagnosticsModeWithConfiguration:currentPeer:reply:",  v6,  v14,  v7);
    }

    else
    {
      uint64_t v18 = sub_10008C90C();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136315906;
        v28 = "-[W5DiagnosticsModeManager startDiagnosticsModeWithConfiguration:reply:]";
        __int16 v29 = 2080;
        id v30 = "W5DiagnosticsModeManager.m";
        __int16 v31 = 1024;
        int v32 = 159;
        __int16 v33 = 2114;
        id v34 = v10;
        LODWORD(v22) = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) [DM] missing current peer in peers list='%{public}@'",  &v27,  v22);
      }

      NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
      v24 = @"W5ParamErr";
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v20));
      v7[2](v7, 0LL, v21);

      v14 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = sub_10008C90C();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315906;
      v28 = "-[W5DiagnosticsModeManager startDiagnosticsModeWithConfiguration:reply:]";
      __int16 v29 = 2080;
      id v30 = "W5DiagnosticsModeManager.m";
      __int16 v31 = 1024;
      int v32 = 152;
      __int16 v33 = 2114;
      id v34 = v6;
      LODWORD(v22) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  0LL,  "[wifivelocity] %s (%s:%u) [DM] missing peers info='%{public}@'",  &v27,  v22);
    }

    NSErrorUserInfoKey v25 = NSLocalizedFailureReasonErrorKey;
    v26 = @"W5ParamErr";
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v14));
    v7[2](v7, 0LL, v17);
  }
}

- (void)_startDiagnosticsModeWithConfiguration:(id)a3 currentPeer:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sub_10008C90C();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)NSErrorUserInfoKey v25 = 136315394;
    *(void *)&v25[4] = "-[W5DiagnosticsModeManager _startDiagnosticsModeWithConfiguration:currentPeer:reply:]";
    *(_WORD *)&v25[12] = 2114;
    *(void *)&v25[14] = v8;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s: [DM] config='%{public}@'",  v25,  22);
  }

  id v13 = -[W5DiagnosticsModeProcessor initWithCurrentPeer:]( objc_alloc(&OBJC_CLASS___W5DiagnosticsModeProcessor),  "initWithCurrentPeer:",  v9);
  if (v13)
  {
    -[NSMutableArray addObject:](self->_processors, "addObject:", v13);
    *(void *)NSErrorUserInfoKey v25 = 0LL;
    *(void *)&v25[8] = v25;
    *(void *)&v25[16] = 0x3032000000LL;
    v26 = sub_100002E9C;
    int v27 = sub_100002EAC;
    v14 = (void *)os_transaction_create("_startDiagnosticsModeWithConfiguration");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](&OBJC_CLASS___W5ActivityManager, "sharedActivityManager"));
    [v15 osTransactionCreate:"_startDiagnosticsModeWithConfiguration" transaction:v14];

    id v28 = v14;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager _actionHandler](self, "_actionHandler"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100002EB4;
    v19[3] = &unk_1000D0F58;
    id v23 = v10;
    id v20 = v9;
    v21 = self;
    uint64_t v22 = v13;
    v24 = v25;
    -[W5DiagnosticsModeProcessor performStartOperationsWithConfiguration:handler:completion:]( v22,  "performStartOperationsWithConfiguration:handler:completion:",  v8,  v16,  v19);

    _Block_object_dispose(v25, 8);
  }

  else
  {
    NSErrorUserInfoKey v29 = NSLocalizedFailureReasonErrorKey;
    id v30 = @"W5InternalErr";
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  9LL,  v17));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v18);
  }
}

- (void)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Peer"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 diagnosticsModeMatchingUUID:v8]);

  if (!(v13 | v11))
  {
    uint64_t v21 = sub_10008C90C();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 136315394;
      v35 = "-[W5DiagnosticsModeManager stopDiagnosticsModeWithUUID:info:reply:]";
      __int16 v36 = 2114;
      id v37 = v8;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s: [DM] no mode matching UUID='%{public}@'",  &v34,  22);
    }

    NSErrorUserInfoKey v32 = NSLocalizedFailureReasonErrorKey;
    __int16 v33 = @"W5ParamErr";
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v18));
    v10[2](v10, v23);

    goto LABEL_11;
  }

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([(id)v13 peers]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 peerID]);
    id v17 = sub_100086510(v14, v16);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v19 = objc_alloc(&OBJC_CLASS___W5DiagnosticsModePeer);
    if (v18) {
      uint64_t v20 = (uint64_t)[v18 role];
    }
    else {
      uint64_t v20 = 8LL;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    NSErrorUserInfoKey v25 = -[W5DiagnosticsModePeer initWithRole:peer:](v19, "initWithRole:peer:", v20, v24);

    -[W5DiagnosticsModeManager _stopDiagnosticsMode:currentPeer:info:reply:]( self,  "_stopDiagnosticsMode:currentPeer:info:reply:",  v13,  v25,  v9,  v10);
LABEL_11:

    goto LABEL_12;
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100003410;
  v26[3] = &unk_1000D0F80;
  id v27 = v8;
  id v28 = self;
  id v29 = v9;
  __int16 v31 = v10;
  id v30 = (id)v11;
  -[W5DiagnosticsModeManager _queryDebugConfigurationForPeer:reply:]( self,  "_queryDebugConfigurationForPeer:reply:",  v30,  v26);

LABEL_12:
}

- (void)_stopDiagnosticsMode:(id)a3 currentPeer:(id)a4 info:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = sub_10008C90C();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v28 = 136315394;
    *(void *)&v28[4] = "-[W5DiagnosticsModeManager _stopDiagnosticsMode:currentPeer:info:reply:]";
    *(_WORD *)&v28[12] = 2114;
    *(void *)&v28[14] = v10;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s: [DM] mode='%{public}@'",  v28,  22);
  }

  id v16 = -[W5DiagnosticsModeProcessor initWithCurrentPeer:]( objc_alloc(&OBJC_CLASS___W5DiagnosticsModeProcessor),  "initWithCurrentPeer:",  v11);
  if (v16)
  {
    -[NSMutableArray addObject:](self->_processors, "addObject:", v16);
    *(void *)id v28 = 0LL;
    *(void *)&v28[8] = v28;
    *(void *)&v28[16] = 0x3032000000LL;
    id v29 = sub_100002E9C;
    id v30 = sub_100002EAC;
    id v17 = (void *)os_transaction_create("_stopDiagnosticsMode");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](&OBJC_CLASS___W5ActivityManager, "sharedActivityManager"));
    [v18 osTransactionCreate:"_stopDiagnosticsMode" transaction:v17];

    id v31 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager _actionHandler](self, "_actionHandler"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100003B08;
    v22[3] = &unk_1000D0F58;
    id v26 = v13;
    id v23 = v11;
    v24 = self;
    NSErrorUserInfoKey v25 = v16;
    id v27 = v28;
    -[W5DiagnosticsModeProcessor performStopOperationsForMode:handler:completion:]( v25,  "performStopOperationsForMode:handler:completion:",  v10,  v19,  v22);

    _Block_object_dispose(v28, 8);
  }

  else
  {
    NSErrorUserInfoKey v32 = NSLocalizedFailureReasonErrorKey;
    __int16 v33 = @"W5InternalErr";
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  9LL,  v20));
    (*((void (**)(id, void *))v13 + 2))(v13, v21);
  }
}

- (void)_queryDebugConfigurationForPeer:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___W5PeerDebugConfigurationRequest);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100003E6C;
  v13[3] = &unk_1000D0FA8;
  id v9 = v6;
  id v14 = v9;
  id v10 = -[W5PeerDebugConfigurationRequest initWithPeer:type:debugConfiguration:reply:]( v8,  "initWithPeer:type:debugConfiguration:reply:",  v7,  1LL,  0LL,  v13);

  uint64_t v11 = objc_claimAutoreleasedReturnValue( -[W5PeerManager sendDebugConfigurationForPeerWithRequest:]( self->_peerManager,  "sendDebugConfigurationForPeerWithRequest:",  v10));
  id v12 = (void *)v11;
  if (v9 && v11) {
    (*((void (**)(id, void, uint64_t))v9 + 2))(v9, 0LL, v11);
  }
}

- (void)updateDiagnosticsMode:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v8 = sub_10008C90C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v63 = 136316162;
    v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
    __int16 v65 = 2080;
    v66 = "W5DiagnosticsModeManager.m";
    __int16 v67 = 1024;
    int v68 = 310;
    __int16 v69 = 2080;
    v70 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
    __int16 v71 = 2114;
    id v72 = v6;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] incoming update mode='%{public}@'",  &v63,  48);
  }

  if (v6)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 peers]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 peerID]);
    id v13 = sub_100086510(v10, v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (!v14)
    {
      uint64_t v39 = sub_10008C90C();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (char *)objc_claimAutoreleasedReturnValue([v6 peers]);
        int v63 = 136315906;
        v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        __int16 v65 = 2080;
        v66 = "W5DiagnosticsModeManager.m";
        __int16 v67 = 1024;
        int v68 = 320;
        __int16 v69 = 2114;
        v70 = v41;
        LODWORD(v50) = 38;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v40,  0LL,  "[wifivelocity] %s (%s:%u) [DM] missing current peer in peers list='%{public}@'",  &v63,  v50);
      }

      NSErrorUserInfoKey v76 = NSLocalizedFailureReasonErrorKey;
      v77 = @"W5ParamErr";
      NSErrorUserInfoKey v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v77,  &v76,  1LL));
      id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  1LL,  v25));
      v7[2](v7, v26);
      goto LABEL_36;
    }

    v53 = v7;
    v54 = v6;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    v52 = self;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager activeDiagnostics](self, "activeDiagnostics"));
    id v16 = [v15 countByEnumeratingWithState:&v57 objects:v75 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v58;
LABEL_7:
      uint64_t v19 = 0LL;
      while (1)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v57 + 1) + 8 * v19);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 peers]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 peer]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 peerID]);
        id v24 = sub_100086510(v21, v23);
        NSErrorUserInfoKey v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

        if (v25)
        {
        }

        if (v17 == (id)++v19)
        {
          id v17 = [v15 countByEnumeratingWithState:&v57 objects:v75 count:16];
          if (v17) {
            goto LABEL_7;
          }
          goto LABEL_15;
        }
      }

      id v26 = v20;

      id v29 = (void *)objc_claimAutoreleasedReturnValue([v26 uuid]);
      id v6 = v54;
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v54 uuid]);
      unsigned __int8 v31 = [v29 isEqual:v30];

      if ((v31 & 1) != 0) {
        goto LABEL_20;
      }
      uint64_t v42 = sub_10008C90C();
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        int v63 = 136316418;
        v64 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        __int16 v65 = 2080;
        v66 = "W5DiagnosticsModeManager.m";
        __int16 v67 = 1024;
        int v68 = 342;
        __int16 v69 = 2080;
        v70 = "-[W5DiagnosticsModeManager updateDiagnosticsMode:reply:]";
        __int16 v71 = 2114;
        id v72 = v25;
        __int16 v73 = 2114;
        id v74 = v26;
        LODWORD(v50) = 58;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v43,  0LL,  "[wifivelocity] %s (%s:%u) %s: [DM] current peer ('%{public}@') is already active in mode='%{public}@'",  &v63,  v50);
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue([v25 peer]);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 name]);
      v46 = (void *)objc_claimAutoreleasedReturnValue([v25 peer]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 peerID]);
      v48 = (void *)objc_claimAutoreleasedReturnValue([v26 uuid]);
      int v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Device ('%@ - %@') is already in active diagnostics (UUID='%@')",  v45,  v47,  v48));

      NSErrorUserInfoKey v61 = NSLocalizedFailureReasonErrorKey;
      v62 = @"W5NotPermittedErr";
      id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
      v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  5LL,  v37));
      v53[2](v53, v49);

      id v7 = v53;
      goto LABEL_35;
    }

- (void)_updateDiagnosticsMode:(id)a3 incomingMode:(id)a4 currentPeer:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = sub_10008C90C();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v26 = 136315394;
    *(void *)&void v26[4] = "-[W5DiagnosticsModeManager _updateDiagnosticsMode:incomingMode:currentPeer:reply:]";
    *(_WORD *)&v26[12] = 2114;
    *(void *)&v26[14] = v11;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s: [DM] incoming mode='%{public}@'",  v26,  22);
  }

  id v16 = -[W5DiagnosticsModeProcessor initWithCurrentPeer:]( objc_alloc(&OBJC_CLASS___W5DiagnosticsModeProcessor),  "initWithCurrentPeer:",  v12);
  if (v16)
  {
    -[NSMutableArray addObject:](self->_processors, "addObject:", v16);
    *(void *)id v26 = 0LL;
    *(void *)&v26[8] = v26;
    *(void *)&v26[16] = 0x3032000000LL;
    uint64_t v27 = sub_100002E9C;
    id v28 = sub_100002EAC;
    id v17 = (void *)os_transaction_create("_updateDiagnosticsMode");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[W5ActivityManager sharedActivityManager](&OBJC_CLASS___W5ActivityManager, "sharedActivityManager"));
    [v18 osTransactionCreate:"_updateDiagnosticsMode" transaction:v17];

    id v29 = v17;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager _actionHandler](self, "_actionHandler"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100004A9C;
    v22[3] = &unk_1000D1020;
    id v24 = v13;
    void v22[4] = self;
    id v23 = v16;
    NSErrorUserInfoKey v25 = v26;
    -[W5DiagnosticsModeProcessor performUpdateOperationsForMode:incomingMode:handler:completion:]( v23,  "performUpdateOperationsForMode:incomingMode:handler:completion:",  v10,  v11,  v19,  v22);

    _Block_object_dispose(v26, 8);
  }

  else
  {
    NSErrorUserInfoKey v30 = NSLocalizedFailureReasonErrorKey;
    unsigned __int8 v31 = @"W5InternalErr";
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  9LL,  v20));
    (*((void (**)(id, void *))v13 + 2))(v13, v21);
  }
}

- (id)_actionHandler
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004D30;
  v5[3] = &unk_1000D11A0;
  v5[4] = self;
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  return v3;
}

- (void)_storeSnifferInfo:(id)a3 peer:(id)a4 uuid:(id)a5 path:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 info]);
  [v14 setObject:v11 forKey:@"UUID"];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 info]);
  [v15 setObject:v10 forKey:@"path"];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
  v18[0] = @"UUID";
  v18[1] = @"path";
  v19[0] = v11;
  v19[1] = v10;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));

  [v16 addToStore:v13 newInfo:v17];
}

- (void)collectLogsDiagnosticMode:(id)a3 outputName:(id)a4 reply:(id)a5
{
  uint64_t v8 = (NSError *)a3;
  id v9 = a4;
  id v10 = (void (**)(id, NSError *, void, void *))a5;
  uint64_t v11 = sub_10008C90C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v88 = 136315906;
    v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
    __int16 v90 = 2080;
    v91 = "W5DiagnosticsModeManager.m";
    __int16 v92 = 1024;
    int v93 = 805;
    __int16 v94 = 2112;
    v95 = v8;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Received log collection request with configuration:%@",  &v88,  38);
  }

  id v13 = objc_alloc(&OBJC_CLASS___NSUUID);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v8, "objectForKey:", @"DiagnosticsModeUUID"));
  uint64_t v15 = -[NSUUID initWithUUIDString:](v13, "initWithUUIDString:", v14);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  id v17 = v16;
  if (v15)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v16 diagnosticsModeMatchingUUID:v15]);
LABEL_7:
    uint64_t v20 = (NSError *)v18;
    goto LABEL_8;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 diagnosticsModeWithState:10]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v19 sortedArrayUsingSelector:"compareCollectionTimeLatestFirst:"]);
  if ([v17 count])
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 firstObject]);
    goto LABEL_7;
  }

  uint64_t v20 = 0LL;
LABEL_8:

  uint64_t v21 = sub_10008C90C();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v23)
    {
      int v88 = 136315906;
      v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
      __int16 v90 = 2080;
      v91 = "W5DiagnosticsModeManager.m";
      __int16 v92 = 1024;
      int v93 = 830;
      __int16 v94 = 2114;
      v95 = v20;
      LODWORD(v81) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Collecting logs for dm='%{public}@'",  &v88,  v81);
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSError peers](v20, "peers"));
    NSErrorUserInfoKey v25 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 peerID]);
    id v27 = sub_100086510(v24, v26);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    if (v28)
    {
      v84 = v15;
      unsigned __int8 v29 = [v28 role];
      NSErrorUserInfoKey v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/run/com.apple.wifivelocity"));
      id v86 = v9;
      unsigned __int8 v31 = (NSError *)objc_claimAutoreleasedReturnValue([v30 URLByAppendingPathComponent:v9]);

      NSErrorUserInfoKey v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", @"Compress"));
      unsigned int v33 = [v32 BOOLValue];

      HIDWORD(v82) = v33;
      if (v33)
      {
        uint64_t v34 = objc_claimAutoreleasedReturnValue(-[NSError URLByDeletingPathExtension](v31, "URLByDeletingPathExtension"));

        unsigned __int8 v31 = (NSError *)v34;
      }

      v85 = v8;
      id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSError path](v31, "path"));
      [v35 createDirectoryAtPath:v36 withIntermediateDirectories:1 attributes:0 error:0];

      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSError URLByAppendingPathComponent:](v31, "URLByAppendingPathComponent:", @"status.txt"));
      -[W5DiagnosticsModeManager __writePeerStatusToFile:](self, "__writePeerStatusToFile:", v37);

      BOOL v38 = (void *)objc_claimAutoreleasedReturnValue( -[NSError URLByAppendingPathComponent:]( v31,  "URLByAppendingPathComponent:",  @"diagnostic_mode.txt"));
      -[W5DiagnosticsModeManager __writeDiagnosticModeToFile:file:](self, "__writeDiagnosticModeToFile:file:", v20, v38);

      if ((v29 & 4) == 0 && self->_netUsageManager)
      {
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSError uuid](v20, "uuid"));
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DiagnosticsMode-%@-NetworkUsage",  v39));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSError URLByAppendingPathComponent:](v31, "URLByAppendingPathComponent:", v40));

        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSError uuid](v20, "uuid"));
        -[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:](self, "__collectNetUsageFiles:uuid:", v41, v42);
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
      v44 = (NSError *)objc_claimAutoreleasedReturnValue([v43 infoMatchingDiagnosticMode:v20]);

      if (v44)
      {
        if ((v29 & 4) != 0)
        {
          uint64_t v45 = sub_10008C90C();
          v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            int v88 = 136315650;
            v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
            __int16 v90 = 2080;
            v91 = "W5DiagnosticsModeManager.m";
            __int16 v92 = 1024;
            int v93 = 870;
            LODWORD(v82) = 28;
            _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v46,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Collecting Sniffer capture",  (const char *)&v88,  v82,  (_DWORD)v84);
          }

          v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", @"path"));
          -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]( self,  "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:",  0LL,  v47,  v31,  0LL);
        }

        uint64_t v48 = sub_10008C90C();
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          int v88 = 136315650;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          __int16 v92 = 1024;
          int v93 = 877;
          LODWORD(v82) = 28;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v49,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Collecting WiFi DE Test Logs",  (const char *)&v88,  v82,  (_DWORD)v84);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", @"diagnosticTestsRequestUUID"));
        int v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", @"TestOutputDirectory"));
        -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]( self,  "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:",  v50,  v51,  v31,  240LL);

        uint64_t v52 = sub_10008C90C();
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          int v88 = 136315650;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          __int16 v92 = 1024;
          int v93 = 883;
          LODWORD(v82) = 28;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v53,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Collecting WiFi Analytics CSVs",  (const char *)&v88,  v82,  (_DWORD)v84);
        }

        v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", @"analyticsCSVsRequestUUID"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", @"analyticsCSVsOutputPath"));
        -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]( self,  "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:",  v54,  v55,  v31,  240LL);

        uint64_t v56 = sub_10008C90C();
        __int128 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          int v88 = 136315650;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          __int16 v92 = 1024;
          int v93 = 889;
          LODWORD(v82) = 28;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v57,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Collecting System Logarchive",  (const char *)&v88,  v82,  (_DWORD)v84);
        }

        __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", @"systemLogsRequestUUID"));
        __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", @"systemLogsOutputPath"));
        -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]( self,  "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:",  v58,  v59,  v31,  240LL);

        uint64_t v60 = sub_10008C90C();
        NSErrorUserInfoKey v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          int v88 = 136315650;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          __int16 v92 = 1024;
          int v93 = 895;
          LODWORD(v82) = 28;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v61,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Collecting Network Info Logs",  (const char *)&v88,  v82,  (_DWORD)v84);
        }

        v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", @"networkInfoGenUUID"));
        -[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:]( self,  "__waitForLogRequestToComplete:maxWait:",  v62,  100LL);

        int v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", @"networkInfoCollectUUID"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", @"networkInfoOutputPath"));
        -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]( self,  "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:",  v63,  v64,  v31,  180LL);

        uint64_t v65 = sub_10008C90C();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          int v88 = 136315650;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          __int16 v92 = 1024;
          int v93 = 902;
          LODWORD(v82) = 28;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v66,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Collecting TCPDump Logs",  (const char *)&v88,  v82,  (_DWORD)v84);
        }

        __int16 v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v44, "objectForKey:", @"tcpdumpOutputPath"));
        -[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]( self,  "_archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:",  0LL,  v67,  v31,  0LL);
      }

      else
      {
        uint64_t v72 = sub_10008C90C();
        __int16 v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          int v88 = 136315906;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          __int16 v92 = 1024;
          int v93 = 909;
          __int16 v94 = 2112;
          v95 = v20;
          LODWORD(v82) = 38;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v67,  0LL,  "[wifivelocity] %s (%s:%u) [DM] no local store URL for dm='%@'",  &v88,  v82);
        }
      }

      if (HIDWORD(v82))
      {
        __int16 v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/run/com.apple.wifivelocity"));
        id v74 = (NSError *)objc_claimAutoreleasedReturnValue([v73 URLByAppendingPathComponent:v86]);

        v87 = 0LL;
        int v75 = sub_10008C94C(v31, v74, &v87);
        NSErrorUserInfoKey v76 = v87;
        uint64_t v77 = sub_10008C90C();
        NSErrorUserInfoKey v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          int v88 = 136316674;
          v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
          __int16 v90 = 2080;
          v91 = "W5DiagnosticsModeManager.m";
          __int16 v92 = 1024;
          int v93 = 918;
          __int16 v94 = 2112;
          v95 = v31;
          __int16 v96 = 2112;
          v97 = v74;
          __int16 v98 = 1024;
          int v99 = v75;
          __int16 v100 = 2112;
          v101 = v76;
          LODWORD(v82) = 64;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v78,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Compress: %@ -> %@, success: %d, error: %@",  &v88,  v82);
        }

        v79 = v74;
      }

      else
      {
        NSErrorUserInfoKey v76 = 0LL;
        v79 = 0LL;
        id v74 = v31;
      }

      -[NSError setState:](v20, "setState:", 11LL);
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
      [v80 updateStoreWithDiagnosticsMode:v20];

      if (v10) {
        v10[2](v10, v76, 0LL, v74);
      }

      uint64_t v15 = (NSUUID *)v84;
    }

    else
    {
      uint64_t v68 = sub_10008C90C();
      __int16 v69 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v70 = (NSError *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
        __int16 v71 = (NSError *)objc_claimAutoreleasedReturnValue(-[NSError peers](v20, "peers"));
        v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
        __int16 v90 = 2080;
        int v88 = 136316162;
        v91 = "W5DiagnosticsModeManager.m";
        __int16 v92 = 1024;
        int v93 = 835;
        __int16 v94 = 2112;
        v95 = v70;
        __int16 v96 = 2114;
        v97 = v71;
        LODWORD(v81) = 48;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v69,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Local device (%@) not found in dm peer list='%{public}@'",  &v88,  v81);
      }

      if (!v10)
      {
        id v28 = 0LL;
        goto LABEL_53;
      }

      v85 = v8;
      id v86 = v9;
      NSErrorUserInfoKey v102 = NSLocalizedFailureReasonErrorKey;
      v103 = @"W5NotPermittedErr";
      unsigned __int8 v31 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v103,  &v102,  1LL));
      v44 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  5LL,  v31));
      v10[2](v10, v44, 0LL, 0LL);
    }

    uint64_t v8 = v85;
LABEL_52:

    id v9 = v86;
LABEL_53:

    goto LABEL_54;
  }

  if (v23)
  {
    int v88 = 136315650;
    v89 = "-[W5DiagnosticsModeManager collectLogsDiagnosticMode:outputName:reply:]";
    __int16 v90 = 2080;
    v91 = "W5DiagnosticsModeManager.m";
    __int16 v92 = 1024;
    int v93 = 825;
    LODWORD(v81) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "[wifivelocity] %s (%s:%u) [DM] No UUID specified and No Diagnostic Mode sessions waiting for collection.",  (const char *)&v88,  v81,  v83);
  }

  if (v10)
  {
    id v86 = v9;
    NSErrorUserInfoKey v104 = NSLocalizedFailureReasonErrorKey;
    v105 = @"W5NotPermittedErr";
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v105,  &v104,  1LL));
    unsigned __int8 v31 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.wifivelocity.error",  5LL,  v28));
    v10[2](v10, v31, 0LL, 0LL);
    goto LABEL_52;
  }

- (void)_archiveAndCollectLogs:(id)a3 logCollectionPath:(id)a4 outputDirectory:(id)a5 maxWait:(unint64_t)a6
{
  id v10 = (NSError *)a3;
  uint64_t v11 = (NSError *)a4;
  id v12 = a5;
  uint64_t v13 = sub_10008C90C();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 136316418;
    NSErrorUserInfoKey v32 = "-[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]";
    __int16 v33 = 2080;
    uint64_t v34 = "W5DiagnosticsModeManager.m";
    __int16 v35 = 1024;
    int v36 = 930;
    __int16 v37 = 2112;
    BOOL v38 = v10;
    __int16 v39 = 2112;
    v40 = v11;
    __int16 v41 = 2112;
    v42[0] = v12;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Archive and collect logs UUID: %@, at: %@ to: %@",  &v31,  58);
  }

  if (v10) {
    -[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:]( self,  "__waitForLogRequestToComplete:maxWait:",  v10,  a6);
  }
  if (v11)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSError lastPathComponent](v11, "lastPathComponent"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.tgz", v15));

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/run/com.apple.wifivelocity"));
    uint64_t v18 = (NSError *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:v16]);

    NSErrorUserInfoKey v30 = 0LL;
    sub_10008C94C(v11, v18, &v30);
    uint64_t v19 = v30;
    if (v19)
    {
      uint64_t v20 = sub_10008C90C();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136316162;
        NSErrorUserInfoKey v32 = "-[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]";
        __int16 v33 = 2080;
        uint64_t v34 = "W5DiagnosticsModeManager.m";
        __int16 v35 = 1024;
        int v36 = 941;
        __int16 v37 = 2112;
        BOOL v38 = v11;
        __int16 v39 = 2112;
        v40 = v19;
        LODWORD(v28) = 48;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[wifivelocity] %s (%s:%u) [DM] failed to create tarball for logs at URL='%@', error='%@'",  &v31,  v28);
      }
    }

    else
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue([v12 URLByAppendingPathComponent:v16]);
      id v29 = 0LL;
      unsigned int v24 = [v22 moveItemAtURL:v18 toURL:v23 error:&v29];
      uint64_t v21 = (os_log_s *)v29;

      uint64_t v25 = sub_10008C90C();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = (NSError *)objc_claimAutoreleasedReturnValue([v12 URLByAppendingPathComponent:v16]);
        int v31 = 136316674;
        NSErrorUserInfoKey v32 = "-[W5DiagnosticsModeManager _archiveAndCollectLogs:logCollectionPath:outputDirectory:maxWait:]";
        __int16 v33 = 2080;
        uint64_t v34 = "W5DiagnosticsModeManager.m";
        __int16 v35 = 1024;
        int v36 = 946;
        __int16 v37 = 2112;
        BOOL v38 = v18;
        __int16 v39 = 2112;
        v40 = v27;
        __int16 v41 = 1024;
        LODWORD(v42[0]) = v24;
        WORD2(v42[0]) = 2112;
        *(void *)((char *)v42 + 6) = v21;
        LODWORD(v28) = 64;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "[wifivelocity] %s (%s:%u) [DM] move log tarball: %@ -> %@, moved: %d, error: %@",  &v31,  v28);
      }
    }
  }
}

- (BOOL)registerPeer:(id)a3 role:(int64_t)a4 configuration:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = sub_10008C90C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](&OBJC_CLASS___W5CloudStore, "sharedStore"));
    uint64_t v14 = (W5DiagnosticsModePeer *)objc_claimAutoreleasedReturnValue([v13 registeredPeers]);
    int v23 = 136315906;
    unsigned int v24 = "-[W5DiagnosticsModeManager registerPeer:role:configuration:error:]";
    __int16 v25 = 2080;
    id v26 = "W5DiagnosticsModeManager.m";
    __int16 v27 = 1024;
    int v28 = 953;
    __int16 v29 = 2114;
    NSErrorUserInfoKey v30 = v14;
    int v22 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) current peers='%{public}@'",  &v23,  v22);
  }

  uint64_t v15 = -[W5DiagnosticsModePeer initWithRole:peer:]( objc_alloc(&OBJC_CLASS___W5DiagnosticsModePeer),  "initWithRole:peer:",  a4,  v10);
  uint64_t v16 = sub_10008C90C();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315906;
    unsigned int v24 = "-[W5DiagnosticsModeManager registerPeer:role:configuration:error:]";
    __int16 v25 = 2080;
    id v26 = "W5DiagnosticsModeManager.m";
    __int16 v27 = 1024;
    int v28 = 955;
    __int16 v29 = 2114;
    NSErrorUserInfoKey v30 = v15;
    LODWORD(v21) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] %s (%s:%u) registering peer='%{public}@'",  &v23,  v21);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](&OBJC_CLASS___W5CloudStore, "sharedStore"));
  unsigned __int8 v19 = [v18 registerDiagnosticModePeer:v15 configuration:v9 error:a6];

  return v19;
}

- (BOOL)unregisterPeer:(id)a3 role:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = sub_10008C90C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](&OBJC_CLASS___W5CloudStore, "sharedStore"));
    uint64_t v11 = (W5DiagnosticsModePeer *)objc_claimAutoreleasedReturnValue([v10 registeredPeers]);
    int v20 = 136315906;
    uint64_t v21 = "-[W5DiagnosticsModeManager unregisterPeer:role:error:]";
    __int16 v22 = 2080;
    int v23 = "W5DiagnosticsModeManager.m";
    __int16 v24 = 1024;
    int v25 = 961;
    __int16 v26 = 2114;
    __int16 v27 = v11;
    int v19 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  0LL,  "[wifivelocity] %s (%s:%u) current peers='%{public}@'",  &v20,  v19);
  }

  id v12 = -[W5DiagnosticsModePeer initWithRole:peer:]( objc_alloc(&OBJC_CLASS___W5DiagnosticsModePeer),  "initWithRole:peer:",  a4,  v7);
  uint64_t v13 = sub_10008C90C();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315906;
    uint64_t v21 = "-[W5DiagnosticsModeManager unregisterPeer:role:error:]";
    __int16 v22 = 2080;
    int v23 = "W5DiagnosticsModeManager.m";
    __int16 v24 = 1024;
    int v25 = 963;
    __int16 v26 = 2114;
    __int16 v27 = v12;
    LODWORD(v18) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "[wifivelocity] %s (%s:%u) unregistering peer='%{public}@'",  &v20,  v18);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](&OBJC_CLASS___W5CloudStore, "sharedStore"));
  unsigned __int8 v16 = [v15 unregisterDiagnosticModePeer:v12 error:a5];

  return v16;
}

- (void)__waitForLogRequestToComplete:(id)a3 maxWait:(unint64_t)a4
{
  id v6 = a3;
  if (-[W5LogManager isRequestActiveOrPending:](self->_logManager, "isRequestActiveOrPending:", v6))
  {
    unint64_t v7 = (unint64_t)(double)(a4 / 0xA);
    if (v7)
    {
      unint64_t v8 = 1LL;
      uint64_t v9 = 10LL;
      while (1)
      {
        dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
        uint64_t v11 = sub_10008C90C();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v24 = (uint64_t)"-[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:]";
          __int16 v25 = 2080;
          __int16 v26 = "W5DiagnosticsModeManager.m";
          __int16 v27 = 1024;
          int v28 = 975;
          __int16 v29 = 2048;
          uint64_t v30 = 10LL;
          __int16 v31 = 2112;
          uint64_t v32 = (uint64_t)v6;
          __int16 v33 = 2048;
          unint64_t v34 = v8;
          LODWORD(v20) = 58;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) Waiting for additional %ld seconds to let log request: %@ to complete, attempt: %ld",  buf,  v20);
        }

        dispatch_time_t v13 = dispatch_time(0LL, 10000000000LL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100009D08;
        block[3] = &unk_1000D11C8;
        uint64_t v14 = v10;
        __int16 v22 = v14;
        dispatch_after(v13, &_dispatch_main_q, block);
        dispatch_time_t v15 = dispatch_time(0LL, 80000000000LL);
        if (dispatch_semaphore_wait(v14, v15) >= 1
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v24 = 0x4054000000000000LL;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing",  buf,  0xCu);
        }

        unsigned __int8 v16 = -[W5LogManager isRequestActiveOrPending:](self->_logManager, "isRequestActiveOrPending:", v6);
        uint64_t v17 = sub_10008C90C();
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if ((v16 & 1) == 0) {
          break;
        }
        if (v19)
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v24 = (uint64_t)"-[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:]";
          __int16 v25 = 2080;
          __int16 v26 = "W5DiagnosticsModeManager.m";
          __int16 v27 = 1024;
          int v28 = 986;
          __int16 v29 = 2112;
          uint64_t v30 = (uint64_t)v6;
          __int16 v31 = 2048;
          uint64_t v32 = v9;
          LODWORD(v20) = 48;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) Log request: %@ still active/pending, continuing wait. Waited (till now): %ld seconds",  buf,  v20);
        }

        ++v8;
        v9 += 10LL;
        if (v8 > v7) {
          goto LABEL_17;
        }
      }

      if (v19)
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v24 = (uint64_t)"-[W5DiagnosticsModeManager __waitForLogRequestToComplete:maxWait:]";
        __int16 v25 = 2080;
        __int16 v26 = "W5DiagnosticsModeManager.m";
        __int16 v27 = 1024;
        int v28 = 983;
        __int16 v29 = 2112;
        uint64_t v30 = (uint64_t)v6;
        __int16 v31 = 2048;
        uint64_t v32 = v9;
        LODWORD(v20) = 48;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) Log request: %@ no longer active/pending, ending wait. Waited: %ld seconds",  buf,  v20);
      }
    }
  }

- (void)__writePeerStatusToFile:(id)a3
{
  id v4 = a3;
  statusManager = self->_statusManager;
  if (statusManager)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5StatusManager status](statusManager, "status"));
    if (!v6)
    {
      uint64_t v14 = sub_10008C90C();
      dispatch_time_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)dispatch_time_t v15 = 136315650;
        *(void *)&v15[4] = "-[W5DiagnosticsModeManager __writePeerStatusToFile:]";
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "W5DiagnosticsModeManager.m";
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) nil status",  v15,  28,  *(_OWORD *)v15);
      }

      goto LABEL_9;
    }

    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
    unsigned int v11 = [v7 createFileAtPath:v8 contents:v10 attributes:0];

    if (v11)
    {
      uint64_t v12 = sub_10008C90C();
      dispatch_time_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)dispatch_time_t v15 = 136315906;
        *(void *)&v15[4] = "-[W5DiagnosticsModeManager __writePeerStatusToFile:]";
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "W5DiagnosticsModeManager.m";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 1000;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v4;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) Status File: %@",  v15,  38,  *(_OWORD *)v15,  *(void *)&v15[16],  v16);
      }

- (void)__writeDiagnosticModeToFile:(id)a3 file:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    uint64_t v14 = sub_10008C90C();
    dispatch_time_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)dispatch_time_t v15 = 136315650;
      *(void *)&v15[4] = "-[W5DiagnosticsModeManager __writeDiagnosticModeToFile:file:]";
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "W5DiagnosticsModeManager.m";
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) nil mode",  v15,  28,  *(_OWORD *)v15);
    }

    goto LABEL_7;
  }

  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
  dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataUsingEncoding:4]);
  unsigned int v11 = [v7 createFileAtPath:v8 contents:v10 attributes:0];

  if (v11)
  {
    uint64_t v12 = sub_10008C90C();
    dispatch_time_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)dispatch_time_t v15 = 136315906;
      *(void *)&v15[4] = "-[W5DiagnosticsModeManager __writeDiagnosticModeToFile:file:]";
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "W5DiagnosticsModeManager.m";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 1014;
      WORD2(v16) = 2112;
      *(void *)((char *)&v16 + 6) = v6;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) Diagnostics Mode File: %@",  v15,  38,  *(_OWORD *)v15,  *(void *)&v15[16],  v16);
    }

- (void)__collectNetUsageFiles:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v29 = 0LL;
  unsigned int v9 = [v8 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v29];
  dispatch_semaphore_t v10 = (NSError *)v29;

  uint64_t v11 = sub_10008C90C();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136316418;
    __int16 v31 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
    __int16 v32 = 2080;
    __int16 v33 = "W5DiagnosticsModeManager.m";
    __int16 v34 = 1024;
    int v35 = 1029;
    __int16 v36 = 2112;
    id v37 = v6;
    __int16 v38 = 1024;
    *(_DWORD *)__int16 v39 = v9;
    *(_WORD *)&v39[4] = 2112;
    *(void *)&v39[6] = v10;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) Create Directory: %@, success: %d, error: %@",  &v30,  54);
  }

  if (v9)
  {
    dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5NetUsageManager calculateUsageDelta:](self->_netUsageManager, "calculateUsageDelta:", v7));
    uint64_t v14 = sub_10008C90C();
    dispatch_time_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315650;
      __int16 v31 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
      __int16 v32 = 2080;
      __int16 v33 = "W5DiagnosticsModeManager.m";
      __int16 v34 = 1024;
      int v35 = 1033;
      LODWORD(v27) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) Generating Network Usage Delta File",  (const char *)&v30,  v27,  (_DWORD)v28);
    }

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"netusage_delta.csv"]);
    +[W5NetUsageManager writeProcNetUsage:ToFile:]( &OBJC_CLASS___W5NetUsageManager,  "writeProcNetUsage:ToFile:",  v13,  v16);

    uint64_t v17 = sub_10008C90C();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315650;
      __int16 v31 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
      __int16 v32 = 2080;
      __int16 v33 = "W5DiagnosticsModeManager.m";
      __int16 v34 = 1024;
      int v35 = 1036;
      LODWORD(v27) = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "[wifivelocity] %s (%s:%u) Requesting Periodic Network Usage Data Files",  (const char *)&v30,  v27,  (_DWORD)v28);
    }

    +[W5NetUsageManager copyPeriodicNetUsageToDir:uuid:]( &OBJC_CLASS___W5NetUsageManager,  "copyPeriodicNetUsageToDir:uuid:",  v6,  v7);
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.tgz", v6));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v19));

    int v28 = v10;
    int v21 = sub_10008C94C(v6, v20, &v28);
    __int16 v22 = v28;

    uint64_t v23 = sub_10008C90C();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136316674;
      __int16 v31 = "-[W5DiagnosticsModeManager __collectNetUsageFiles:uuid:]";
      __int16 v32 = 2080;
      __int16 v33 = "W5DiagnosticsModeManager.m";
      __int16 v34 = 1024;
      int v35 = 1041;
      __int16 v36 = 2112;
      id v37 = v6;
      __int16 v38 = 2112;
      *(void *)__int16 v39 = v20;
      *(_WORD *)&v39[8] = 1024;
      *(_DWORD *)&v39[10] = v21;
      __int16 v40 = 2112;
      __int16 v41 = v22;
      LODWORD(v27) = 64;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v24,  0LL,  "[wifivelocity] %s (%s:%u) Compress %@ -> %@, success:%d, error: %@",  &v30,  v27);
    }

    if (v21)
    {
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
      [v25 removeItemAtPath:v26 error:0];
    }
  }

  else
  {
    __int16 v22 = v10;
  }
}

- (void)handlePeerFaultEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10008C90C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v97 = 136315906;
    __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
    __int16 v99 = 2080;
    __int16 v100 = "W5DiagnosticsModeManager.m";
    __int16 v101 = 1024;
    int v102 = 1048;
    __int16 v103 = 2114;
    id v104 = v4;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "[wifivelocity] %s (%s:%u) [DM] received fault event='%{public}@'",  &v97,  38);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"RemoteListener"]);

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
  dispatch_semaphore_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 peerID]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 peerID]);
    unsigned int v13 = [v10 isEqualToString:v12];

    if (!v13)
    {
      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"DiagnosticMode"]);

      if (v19)
      {
        uint64_t v34 = sub_10008C90C();
        int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v36 = (void *)objc_claimAutoreleasedReturnValue([v4 peer]);
          __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          __int16 v99 = 2080;
          int v97 = 136316162;
          __int16 v100 = "W5DiagnosticsModeManager.m";
          __int16 v101 = 1024;
          int v102 = 1104;
          __int16 v103 = 2112;
          id v104 = v19;
          __int16 v105 = 2114;
          id v106 = v36;
          LODWORD(v80) = 48;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Active DM instance: %@ reported by peer='%{public}@'",  &v97,  v80);
        }

        id v37 = objc_alloc(&OBJC_CLASS___W5DiagnosticsModePeer);
        __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
        __int16 v39 = -[W5DiagnosticsModePeer initWithRole:peer:](v37, "initWithRole:peer:", 8LL, v38);

        __int16 v40 = (void *)objc_claimAutoreleasedReturnValue([v19 peers]);
        id v41 = sub_100086378(v40, v39, 8LL);
        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

        if (!v42)
        {
LABEL_60:

          goto LABEL_67;
        }

        v82 = v39;
        int v83 = v8;
        v43 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"FaultType"]);
        id v45 = [v44 integerValue];

        v46 = (void *)objc_claimAutoreleasedReturnValue([v19 info]);
        v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"Faults"]);

        __int128 v86 = 0u;
        __int128 v87 = 0u;
        __int128 v84 = 0u;
        __int128 v85 = 0u;
        id v48 = v47;
        id v49 = [v48 countByEnumeratingWithState:&v84 objects:v95 count:16];
        if (v49)
        {
          id v50 = v49;
          uint64_t v51 = *(void *)v85;
          while (2)
          {
            for (i = 0LL; i != v50; i = (char *)i + 1)
            {
              if (*(void *)v85 != v51) {
                objc_enumerationMutation(v48);
              }
              if ([*(id *)(*((void *)&v84 + 1) + 8 * (void)i) integerValue] == v45)
              {

                uint64_t v73 = sub_10008C90C();
                id v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v73);
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  int v97 = 136315650;
                  __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
                  __int16 v99 = 2080;
                  __int16 v100 = "W5DiagnosticsModeManager.m";
                  __int16 v101 = 1024;
                  int v102 = 1132;
                  LODWORD(v80) = 28;
                  _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v74,  0LL,  "[wifivelocity] %s (%s:%u) [DM] showing auto stop user notification",  (const char *)&v97,  v80,  (_DWORD)v82);
                }

                __int16 v39 = v82;
                if (self->_userNotificationManager)
                {
                  -[W5DiagnosticsModeManager _showSuggestedStopNotificationForEvent:]( self,  "_showSuggestedStopNotificationForEvent:",  v4);
                  unint64_t v8 = v83;
                }

                else
                {
                  uint64_t v75 = sub_10008C90C();
                  NSErrorUserInfoKey v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
                  unint64_t v8 = v83;
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    int v97 = 136315650;
                    __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
                    __int16 v99 = 2080;
                    __int16 v100 = "W5DiagnosticsModeManager.m";
                    __int16 v101 = 1024;
                    int v102 = 1139;
                    LODWORD(v80) = 28;
                    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v76,  0LL,  "[wifivelocity] %s (%s:%u) [DM] userNotificationManager is nil",  (const char *)&v97,  v80,  (_DWORD)v82);
                  }
                }

                goto LABEL_60;
              }
            }

            id v50 = [v48 countByEnumeratingWithState:&v84 objects:v95 count:16];
            if (v50) {
              continue;
            }
            break;
          }
        }

        uint64_t v53 = sub_10008C90C();
        v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          __int16 v99 = 2080;
          int v97 = 136316162;
          __int16 v100 = "W5DiagnosticsModeManager.m";
          __int16 v101 = 1024;
          int v102 = 1128;
          __int16 v103 = 2048;
          id v104 = v45;
          __int16 v105 = 2114;
          id v106 = v48;
          LODWORD(v80) = 48;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v54,  0LL,  "[wifivelocity] %s (%s:%u) [DM] received peer fault (%ld) that is not being monitored (monitoring='%{public}@')",  &v97,  v80);
        }

        goto LABEL_48;
      }

      uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
      NSErrorUserInfoKey v61 = (void *)objc_claimAutoreleasedReturnValue([v60 peerID]);
      unsigned int v62 = [v8 isEqualToString:v61];

      uint64_t v63 = sub_10008C90C();
      v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
      BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
      if (!v62)
      {
        if (v65)
        {
          int v97 = 136315906;
          __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          __int16 v99 = 2080;
          __int16 v100 = "W5DiagnosticsModeManager.m";
          __int16 v101 = 1024;
          int v102 = 1159;
          __int16 v103 = 2114;
          id v104 = v4;
          LODWORD(v80) = 38;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v64,  0LL,  "[wifivelocity] %s (%s:%u) [DM] unhandled fault event='%{public}@'",  &v97,  v80);
        }

        goto LABEL_66;
      }

      if (v65)
      {
        int v97 = 136315650;
        __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
        __int16 v99 = 2080;
        __int16 v100 = "W5DiagnosticsModeManager.m";
        __int16 v101 = 1024;
        int v102 = 1146;
        LODWORD(v80) = 28;
        _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v64,  0LL,  "[wifivelocity] %s (%s:%u)  [DM] showing auto start user notification",  (const char *)&v97,  v80,  v81);
      }

      if (self->_userNotificationManager)
      {
        v66 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
        __int16 v67 = (void *)objc_claimAutoreleasedReturnValue([v66 objectForKeyedSubscript:@"FaultType"]);
        unsigned int v68 = -[W5DiagnosticsModeManager _isFaultSupported:]( self,  "_isFaultSupported:",  [v67 integerValue]);

        if (v68)
        {
          -[W5DiagnosticsModeManager _showSuggestedStartNotificationForEvent:]( self,  "_showSuggestedStartNotificationForEvent:",  v4);
LABEL_66:
          BOOL v19 = 0LL;
          goto LABEL_67;
        }

        uint64_t v79 = sub_10008C90C();
        NSErrorUserInfoKey v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          int v97 = 136315906;
          __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          __int16 v99 = 2080;
          __int16 v100 = "W5DiagnosticsModeManager.m";
          __int16 v101 = 1024;
          int v102 = 1150;
          __int16 v103 = 2114;
          id v104 = v4;
          LODWORD(v80) = 38;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v78,  0LL,  "[wifivelocity] %s (%s:%u) Unsupported fault event:'%{public}@'",  &v97,  v80);
        }
      }

      else
      {
        uint64_t v77 = sub_10008C90C();
        NSErrorUserInfoKey v78 = (os_log_s *)objc_claimAutoreleasedReturnValue(v77);
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          int v97 = 136315650;
          __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
          __int16 v99 = 2080;
          __int16 v100 = "W5DiagnosticsModeManager.m";
          __int16 v101 = 1024;
          int v102 = 1154;
          LODWORD(v80) = 28;
          _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v78,  0LL,  "[wifivelocity] %s (%s:%u) [DM] userNotificationManager is nil",  &v97,  v80);
        }
      }

      goto LABEL_66;
    }
  }

  uint64_t v14 = sub_10008C90C();
  dispatch_time_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v97 = 136315650;
    __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
    __int16 v99 = 2080;
    __int16 v100 = "W5DiagnosticsModeManager.m";
    __int16 v101 = 1024;
    int v102 = 1054;
    LODWORD(v80) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) [DM] received fault event for local device",  (const char *)&v97,  v80,  v81);
  }

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localPeer](self, "localPeer"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 peerID]);
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v16 diagnosticsModeMatchingPeerID:v18 state:3 role:1]);

  if ([v19 count])
  {
    int v83 = v8;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);
    int v21 = (void *)objc_claimAutoreleasedReturnValue([v4 info]);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"FaultType"]);
    id v23 = [v22 integerValue];

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v20 info]);
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKeyedSubscript:@"Faults"]);

    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v91 = 0u;
    __int128 v92 = 0u;
    id v26 = v25;
    id v27 = [v26 countByEnumeratingWithState:&v91 objects:v107 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v92;
      while (2)
      {
        for (j = 0LL; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v92 != v29) {
            objc_enumerationMutation(v26);
          }
          if ([*(id *)(*((void *)&v91 + 1) + 8 * (void)j) integerValue] == v23)
          {

            [v20 setState:4];
            v55 = (void *)objc_claimAutoreleasedReturnValue([v20 info]);
            if (v55)
            {
              uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue([v20 info]);
              id v57 = [v56 mutableCopy];
            }

            else
            {
              id v57 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
            }

            __int16 v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v23));
            __int16 v96 = v69;
            v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v96,  1LL));
            [v57 setObject:v70 forKeyedSubscript:@"DetectedFaults"];

            [v20 setInfo:v57];
            __int16 v71 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
            [v71 updateStoreWithDiagnosticsMode:v20];

            uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v20 uuid]);
            v88[0] = _NSConcreteStackBlock;
            v88[1] = 3221225472LL;
            v88[2] = sub_10000B32C;
            v88[3] = &unk_1000D11F0;
            v88[4] = self;
            id v89 = v4;
            id v90 = v20;
            -[W5DiagnosticsModeManager stopDiagnosticsModeWithUUID:info:reply:]( self,  "stopDiagnosticsModeWithUUID:info:reply:",  v72,  &__NSDictionary0__struct,  v88);

            goto LABEL_47;
          }
        }

        id v28 = [v26 countByEnumeratingWithState:&v91 objects:v107 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }

    uint64_t v31 = sub_10008C90C();
    __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
      __int16 v99 = 2080;
      int v97 = 136316162;
      __int16 v100 = "W5DiagnosticsModeManager.m";
      __int16 v101 = 1024;
      int v102 = 1074;
      __int16 v103 = 2048;
      id v104 = v23;
      __int16 v105 = 2114;
      id v106 = v26;
      LODWORD(v80) = 48;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v32,  0LL,  "[wifivelocity] %s (%s:%u) [DM] received local fault (%ld) that is not being monitored (monitoring='%{public}@')",  &v97,  v80);
    }

    -[W5DiagnosticsModeManager _notifyPeers:info:](self, "_notifyPeers:info:", v4, 0LL);
LABEL_47:

LABEL_48:
    unint64_t v8 = v83;
    goto LABEL_67;
  }

  uint64_t v58 = sub_10008C90C();
  __int128 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    int v97 = 136315650;
    __int16 v98 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]";
    __int16 v99 = 2080;
    __int16 v100 = "W5DiagnosticsModeManager.m";
    __int16 v101 = 1024;
    int v102 = 1094;
    LODWORD(v80) = 28;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v59,  0LL,  "[wifivelocity] %s (%s:%u) [DM] no active DM instances for local device",  (const char *)&v97,  v80,  v81);
  }

  -[W5DiagnosticsModeManager _notifyPeers:info:](self, "_notifyPeers:info:", v4, 0LL);
LABEL_67:
}

- (BOOL)_isFaultSupported:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([&off_1000E3000 objectAtIndex:0]);
  id v5 = [v4 integerValue];

  if (v5 == (id)a3) {
    return 1;
  }
  unint64_t v7 = 0LL;
  do
  {
    unint64_t v8 = v7;
    if (v7 == 3) {
      break;
    }
    ++v7;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([&off_1000E3000 objectAtIndex:v8 + 1]);
    id v10 = [v9 integerValue];
  }

  while (v10 != (id)a3);
  return v8 < 3;
}

- (void)_notifyPeers:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  faultEventManager = self->_faultEventManager;
  uint64_t v9 = sub_10008C90C();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (faultEventManager)
  {
    if (v11)
    {
      int v12 = 136315906;
      unsigned int v13 = "-[W5DiagnosticsModeManager _notifyPeers:info:]";
      __int16 v14 = 2080;
      dispatch_time_t v15 = "W5DiagnosticsModeManager.m";
      __int16 v16 = 1024;
      int v17 = 1175;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) Notifying registered peers for fault event: %@",  &v12,  38);
    }

    -[W5FaultEventManager notifyPeersWithFaultEvent:info:]( self->_faultEventManager,  "notifyPeersWithFaultEvent:info:",  v6,  v7);
  }

  else
  {
    if (v11)
    {
      int v12 = 136315650;
      unsigned int v13 = "-[W5DiagnosticsModeManager _notifyPeers:info:]";
      __int16 v14 = 2080;
      dispatch_time_t v15 = "W5DiagnosticsModeManager.m";
      __int16 v16 = 1024;
      int v17 = 1179;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "[wifivelocity] %s (%s:%u) nil W5FaultEventManager",  (const char *)&v12,  28);
    }
  }
}

- (void)_showSuggestedStartNotificationForEvent:(id)a3
{
  id v22 = a3;
  if (-[W5DiagnosticsModeManager _shouldShowNotification:](self, "_shouldShowNotification:", 2LL))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    -[W5DiagnosticsModeManager setStopNotificationUUID:](self, "setStopNotificationUUID:", v4);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v22 info]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"FaultType"]);
    id v7 = [v6 integerValue];

    uint64_t v8 = W5DescriptionForDiagnosticsFaultType(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Issue Detected",  v9));

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v22 peer]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
    if (v12)
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v22 peer]);
      __int16 v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 name]);
    }

    else
    {
      __int16 v14 = @"Your device";
    }

    dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue([v22 peer]);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 peerID]);
    int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"wifiapp://startDiagnostics?peerID=%@",  v16));
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v17));

    userNotificationManager = self->_userNotificationManager;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ has detected an issue. Tap here to help diagnose the issue.",  v14));
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager stopNotificationUUID](self, "stopNotificationUUID"));
    -[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:]( userNotificationManager,  "dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:",  v10,  0LL,  v20,  3LL,  v21,  v18);
  }
}

- (void)_showSuggestedStopNotificationForEvent:(id)a3
{
  id v26 = a3;
  if (-[W5DiagnosticsModeManager _shouldShowNotification:](self, "_shouldShowNotification:", 3LL))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    -[W5DiagnosticsModeManager setStopNotificationUUID:](self, "setStopNotificationUUID:", v4);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v26 info]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"FaultType"]);
    id v7 = [v6 integerValue];

    uint64_t v8 = W5DescriptionForDiagnosticsFaultType(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Issue Diagnostics Complete",  v9));

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v26 peer]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
    if (v12)
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v26 peer]);
      __int16 v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 name]);
    }

    else
    {
      __int16 v14 = @"Your device";
    }

    dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue([v26 info]);
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"DiagnosticMode"]);
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 uuid]);

    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v26 peer]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 peerID]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
    int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"wifiapp://endDiagnostics?peerID=%@&dmUUID=%@",  v19,  v20));
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v21));

    userNotificationManager = self->_userNotificationManager;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ has detected the issue again and has completed diagnostics. Tap here to file a radar.",  v14));
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager stopNotificationUUID](self, "stopNotificationUUID"));
    -[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:]( userNotificationManager,  "dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:",  v10,  0LL,  v24,  3LL,  v25,  v22);
  }
}

- (BOOL)_shouldShowNotification:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  double v6 = 300.0;
  if (a3 != 3) {
    double v6 = 0.0;
  }
  if (a3 == 2) {
    double v7 = 900.0;
  }
  else {
    double v7 = v6;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](&OBJC_CLASS___W5CloudStore, "sharedStore", v6));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5Peer peerID](self->_localPeer, "peerID"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 getMinNotificationInterval:v9 notificationType:a3]);

  if (v10)
  {
    uint64_t v11 = sub_10008C90C();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315906;
      __int16 v32 = "-[W5DiagnosticsModeManager _shouldShowNotification:]";
      __int16 v33 = 2080;
      uint64_t v34 = "W5DiagnosticsModeManager.m";
      __int16 v35 = 1024;
      int v36 = 1240;
      __int16 v37 = 2112;
      __int16 v38 = v10;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Minimum Notification Interval (Cloud KVS): %@",  &v31,  38);
    }

    [v10 doubleValue];
    double v7 = v13;
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 persistentDomainForName:@"com.apple.wifi.diagnosticsMode"]);

  if (a3 == 2)
  {
    __int16 v16 = @"MinStartNotificationInterval";
  }

  else
  {
    if (a3 != 3)
    {
      int v17 = 0LL;
      goto LABEL_19;
    }

    __int16 v16 = @"MinStopNotificationInterval";
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v16]);
  if (v17)
  {
    uint64_t v18 = sub_10008C90C();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315906;
      __int16 v32 = "-[W5DiagnosticsModeManager _shouldShowNotification:]";
      __int16 v33 = 2080;
      uint64_t v34 = "W5DiagnosticsModeManager.m";
      __int16 v35 = 1024;
      int v36 = 1260;
      __int16 v37 = 2112;
      __int16 v38 = v17;
      LODWORD(v30) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Minimum Notification Interval (User defaults): %@",  &v31,  v30);
    }

    [v17 doubleValue];
    double v7 = v20;
  }

- (void)_runDiagnosticsForDiagnosticMode:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DiagnosticsMode-%@-WiFiDETestsAtFault",  v6));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___W5LogItemRequestInternal);
  -[W5LogItemRequestInternal setUuid:](v9, "setUuid:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  55LL,  0LL));
  uint64_t v34 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
  -[W5LogItemRequestInternal setItemRequests:](v9, "setItemRequests:", v11);

  -[W5LogItemRequestInternal setFilename:](v9, "setFilename:", v7);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[W5LogItemRequestInternal setAddedAt:](v9, "setAddedAt:", v12);

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager logManager](self, "logManager"));
  [v13 addRequest:v9];

  uint64_t v14 = sub_10008C90C();
  dispatch_time_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315906;
    id v27 = "-[W5DiagnosticsModeManager _runDiagnosticsForDiagnosticMode:]";
    __int16 v28 = 2080;
    uint64_t v29 = "W5DiagnosticsModeManager.m";
    __int16 v30 = 1024;
    int v31 = 1288;
    __int16 v32 = 2112;
    __int16 v33 = v9;
    int v23 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) Added to W5LogManager queue: %@",  &v26,  v23);
  }

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/run/com.apple.wifivelocity"));
  int v17 = (W5LogItemRequestInternal *)objc_claimAutoreleasedReturnValue([v16 URLByAppendingPathComponent:v7]);

  uint64_t v18 = sub_10008C90C();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315906;
    id v27 = "-[W5DiagnosticsModeManager _runDiagnosticsForDiagnosticMode:]";
    __int16 v28 = 2080;
    uint64_t v29 = "W5DiagnosticsModeManager.m";
    __int16 v30 = 1024;
    int v31 = 1291;
    __int16 v32 = 2114;
    __int16 v33 = v17;
    LODWORD(v22) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) [DM] running fault log collection to dir='%{public}@'",  &v26,  v22);
  }

  double v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
  v24[0] = @"diagnosticTestsRequestUUID";
  v24[1] = @"TestOutputDirectory";
  v25[0] = v8;
  v25[1] = v17;
  int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL));
  [v20 addToStore:v4 newInfo:v21];
}

- (void)_collectAnalyticsCSVsForDiagnosticMode:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DiagnosticsMode-%@-AnalyticsCSVs",  v6));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___W5LogItemRequestInternal);
  -[W5LogItemRequestInternal setUuid:](v9, "setUuid:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  85LL,  &off_1000E1B38));
  v36[0] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  84LL,  &off_1000E1B60));
  v36[1] = v11;
  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  88LL,  &off_1000E1B88));
  v36[2] = v12;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 3LL));
  -[W5LogItemRequestInternal setItemRequests:](v9, "setItemRequests:", v13);

  -[W5LogItemRequestInternal setFilename:](v9, "setFilename:", v7);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[W5LogItemRequestInternal setAddedAt:](v9, "setAddedAt:", v14);

  dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager logManager](self, "logManager"));
  [v15 addRequest:v9];

  uint64_t v16 = sub_10008C90C();
  int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136315906;
    uint64_t v29 = "-[W5DiagnosticsModeManager _collectAnalyticsCSVsForDiagnosticMode:]";
    __int16 v30 = 2080;
    int v31 = "W5DiagnosticsModeManager.m";
    __int16 v32 = 1024;
    int v33 = 1316;
    __int16 v34 = 2112;
    __int16 v35 = v9;
    int v25 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v17,  0LL,  "[wifivelocity] %s (%s:%u) Added to W5LogManager queue: %@",  &v28,  v25);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/run/com.apple.wifivelocity"));
  id v19 = (W5LogItemRequestInternal *)objc_claimAutoreleasedReturnValue([v18 URLByAppendingPathComponent:v7]);

  uint64_t v20 = sub_10008C90C();
  int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136315906;
    uint64_t v29 = "-[W5DiagnosticsModeManager _collectAnalyticsCSVsForDiagnosticMode:]";
    __int16 v30 = 2080;
    int v31 = "W5DiagnosticsModeManager.m";
    __int16 v32 = 1024;
    int v33 = 1319;
    __int16 v34 = 2114;
    __int16 v35 = v19;
    LODWORD(v24) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "[wifivelocity] %s (%s:%u) [DM] collecting analytics CSVs to dir='%{public}@'",  &v28,  v24);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
  v26[0] = @"analyticsCSVsRequestUUID";
  v26[1] = @"analyticsCSVsOutputPath";
  v27[0] = v8;
  v27[1] = v19;
  int v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
  [v22 addToStore:v4 newInfo:v23];
}

- (void)_collectSystemLogsForDiagnosticMode:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DiagnosticsMode-%@-SystemLogs",  v6));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___W5LogItemRequestInternal);
  -[W5LogItemRequestInternal setUuid:](v9, "setUuid:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  31LL,  &off_1000E1BB0));
  __int16 v34 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
  -[W5LogItemRequestInternal setItemRequests:](v9, "setItemRequests:", v11);

  -[W5LogItemRequestInternal setFilename:](v9, "setFilename:", v7);
  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[W5LogItemRequestInternal setAddedAt:](v9, "setAddedAt:", v12);

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager logManager](self, "logManager"));
  [v13 addRequest:v9];

  uint64_t v14 = sub_10008C90C();
  dispatch_time_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315906;
    id v27 = "-[W5DiagnosticsModeManager _collectSystemLogsForDiagnosticMode:]";
    __int16 v28 = 2080;
    uint64_t v29 = "W5DiagnosticsModeManager.m";
    __int16 v30 = 1024;
    int v31 = 1338;
    __int16 v32 = 2112;
    int v33 = v9;
    int v23 = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "[wifivelocity] %s (%s:%u) Added to W5LogManager queue: %@",  &v26,  v23);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/run/com.apple.wifivelocity"));
  int v17 = (W5LogItemRequestInternal *)objc_claimAutoreleasedReturnValue([v16 URLByAppendingPathComponent:v7]);

  uint64_t v18 = sub_10008C90C();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 136315906;
    id v27 = "-[W5DiagnosticsModeManager _collectSystemLogsForDiagnosticMode:]";
    __int16 v28 = 2080;
    uint64_t v29 = "W5DiagnosticsModeManager.m";
    __int16 v30 = 1024;
    int v31 = 1341;
    __int16 v32 = 2114;
    int v33 = v17;
    LODWORD(v22) = 38;
    _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) [DM] collecting system logs to dir='%{public}@'",  &v26,  v22);
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
  v24[0] = @"systemLogsRequestUUID";
  v24[1] = @"systemLogsOutputPath";
  v25[0] = v8;
  v25[1] = v17;
  int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  2LL));
  [v20 addToStore:v4 newInfo:v21];
}

- (void)_collectNetworkInfoForDiagnosticMode:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DiagnosticsMode-%@-NetworkInfo",  v6));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:",  @"/var/run/com.apple.wifivelocity"));
  uint64_t v9 = (W5LogItemRequestInternal *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:v7]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5LogItemRequestInternal path](v9, "path"));
  unsigned int v12 = [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];

  if (v12)
  {
    double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___W5LogItemRequestInternal);
    -[W5LogItemRequestInternal setUuid:](v14, "setUuid:", v13);
    dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  89LL,  &off_1000E1BD8));
    v41[0] = v15;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  91LL,  &off_1000E1C00));
    v41[1] = v16;
    int v17 = (void *)objc_claimAutoreleasedReturnValue( +[W5LogItemRequest requestWithItemID:configuration:]( &OBJC_CLASS___W5LogItemRequest,  "requestWithItemID:configuration:",  92LL,  0LL));
    v41[2] = v17;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 3LL));
    -[W5LogItemRequestInternal setItemRequests:](v14, "setItemRequests:", v18);

    -[W5LogItemRequestInternal setFilename:](v14, "setFilename:", v7);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[W5LogItemRequestInternal setAddedAt:](v14, "setAddedAt:", v19);

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    void v27[2] = sub_10000CDF8;
    v27[3] = &unk_1000D1218;
    id v28 = v7;
    uint64_t v29 = self;
    id v20 = v4;
    id v30 = v20;
    -[W5LogItemRequestInternal setReply:](v14, "setReply:", v27);
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager logManager](self, "logManager"));
    [v21 addRequest:v14];

    uint64_t v22 = sub_10008C90C();
    int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315906;
      __int16 v34 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]";
      __int16 v35 = 2080;
      int v36 = "W5DiagnosticsModeManager.m";
      __int16 v37 = 1024;
      int v38 = 1386;
      __int16 v39 = 2112;
      __int16 v40 = v14;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "[wifivelocity] %s (%s:%u) Added to W5LogManager queue: %@",  &v33,  38);
    }

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager localStore](self, "localStore"));
    v31[0] = @"networkInfoGenUUID";
    v31[1] = @"networkInfoOutputPath";
    v32[0] = v13;
    v32[1] = v9;
    int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  2LL));
    [v24 addToStore:v20 newInfo:v25];
  }

  else
  {
    uint64_t v26 = sub_10008C90C();
    double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136315906;
      __int16 v34 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]";
      __int16 v35 = 2080;
      int v36 = "W5DiagnosticsModeManager.m";
      __int16 v37 = 1024;
      int v38 = 1393;
      __int16 v39 = 2112;
      __int16 v40 = v9;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "[wifivelocity] %s (%s:%u) [DM] Unable to create network info dir: %@",  &v33,  38);
    }
  }
}

- (NSArray)registeredPeers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[W5CloudStore sharedStore](&OBJC_CLASS___W5CloudStore, "sharedStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 registeredPeers]);

  return (NSArray *)v3;
}

- (int64_t)registeredRoleForPeer:(id)a3
{
  id v4 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager registeredPeers](self, "registeredPeers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 peer]);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 peerID]);
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v4 peerID]);
        unsigned int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          id v6 = [v9 role];
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (NSArray)activeDiagnostics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 diagnosticsModeWithState:3]);

  return (NSArray *)v3;
}

- (id)finishedDiagnostics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 diagnosticsModeWithState:11]);

  return v3;
}

- (NSArray)allDiagnostics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 diagnostics]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allObjects]);

  return (NSArray *)v4;
}

- (void)_finishedProcessingDiagnosticMode:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[W5DiagnosticsModeManager store](self, "store"));
  [v5 updateStoreWithDiagnosticsMode:v4];
}

- (W5Peer)localPeer
{
  return self->_localPeer;
}

- (void)setLocalPeer:(id)a3
{
}

- (W5DiagnosticsModePeer)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (int64_t)role
{
  return self->_role;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setRegisteredPeers:(id)a3
{
}

- (W5FaultEventManager)faultEventManager
{
  return self->_faultEventManager;
}

- (void)setFaultEventManager:(id)a3
{
}

- (W5NetUsageManager)netUsageManager
{
  return self->_netUsageManager;
}

- (void)setNetUsageManager:(id)a3
{
}

- (W5PeerManager)peerManager
{
  return self->_peerManager;
}

- (void)setPeerManager:(id)a3
{
}

- (W5WiFiSniffManager)snifferManager
{
  return self->_snifferManager;
}

- (void)setSnifferManager:(id)a3
{
}

- (W5LogManager)logManager
{
  return self->_logManager;
}

- (void)setLogManager:(id)a3
{
}

- (NSUUID)stopNotificationUUID
{
  return self->_stopNotificationUUID;
}

- (void)setStopNotificationUUID:(id)a3
{
}

- (NSMutableDictionary)lastNotificationTimestamp
{
  return self->_lastNotificationTimestamp;
}

- (void)setLastNotificationTimestamp:(id)a3
{
}

- (W5DiagnosticsModeStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (W5DiagnosticsModeLocalStore)localStore
{
  return self->_localStore;
}

- (void)setLocalStore:(id)a3
{
}

- (NSMutableArray)processors
{
  return self->_processors;
}

- (void)setProcessors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end