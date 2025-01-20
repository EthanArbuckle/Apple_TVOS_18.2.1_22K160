@interface MRDGroupSessionServer
- (BOOL)isPresentingProximityCard;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)running;
- (MRDGroupSessionAssertionManager)assertionManager;
- (MRDGroupSessionEligibilityMonitor)eligibilityMonitor;
- (MRDGroupSessionManager)sessionManager;
- (MRDGroupSessionServer)initWithNowPlayingServer:(id)a3;
- (MRDNetworkMonitor)networkMonitor;
- (MRDNowPlayingServer)nowPlayingServer;
- (MRDRemoteControlGroupSessionCoordinator)coordinator;
- (MRUserIdentity)localMusicIdentity;
- (MSVTimer)requestAssertionTimer;
- (MSVTimer)stopTimer;
- (NSError)lastConnectionError;
- (NSMapTable)assertionsByClient;
- (NSMutableSet)clients;
- (NSMutableSet)requestGroupSessionCompletions;
- (NSXPCListener)listener;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)notificationQueue;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (id)clientForConnection:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_completeGroupSessionRequestsWithIdentifier:(id)a3;
- (void)_handleCreateGroupSessionTokenMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetUserIdentityForDSIDMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetUserIdentityMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGroupSessionEventMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePresentProximityCardMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestGroupSessionMessage:(id)a3 fromClient:(id)a4;
- (void)addClient:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)dismissProximityCard;
- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4;
- (void)groupSessionAssertionManagerDidAssert:(id)a3;
- (void)groupSessionAssertionManagerDidUnassert:(id)a3;
- (void)handleClientConnect:(id)a3;
- (void)handleClientInvalidate:(id)a3;
- (void)handleGetGroupSessionServerEndpointMessage:(id)a3 fromClient:(id)a4;
- (void)handleJoinGroupSessionMessage:(id)a3 fromClient:(id)a4;
- (void)handleLeaveGroupSessionMessage:(id)a3 fromClient:(id)a4;
- (void)handleUserStateChange:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)joinGroupSessionViaEquivalentWHAEndpoint:(id)a3 completion:(id)a4;
- (void)manager:(id)a3 activeSessionDidChange:(id)a4;
- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4;
- (void)manager:(id)a3 discoveredSessionsDidChange:(id)a4;
- (void)notifyActiveSessionStateChanged;
- (void)notifyEligibilityChanged:(id)a3;
- (void)presentProximityCardWithDeviceName:(id)a3 modelIdentifier:(id)a4 color:(id)a5 url:(id)a6 error:(id *)a7;
- (void)reevaluateAssertionState;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)removeClient:(id)a3;
- (void)requestEligibilityMonitoring;
- (void)requestGroupSessionWithCompletion:(id)a3;
- (void)restoreClientState:(id)a3 handler:(id)a4;
- (void)setAssertionsByClient:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setEligibilityMonitor:(id)a3;
- (void)setLastConnectionError:(id)a3;
- (void)setLocalMusicIdentity:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)setRequestGroupSessionCompletions:(id)a3;
- (void)setSessionManager:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRDGroupSessionServer

- (MRDGroupSessionServer)initWithNowPlayingServer:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___MRDGroupSessionServer;
  v6 = -[MRDGroupSessionServer init](&v37, "init");
  if (v6)
  {
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t Queue = MRGroupSessionSubsystemGetQueue();
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(Queue);
    dispatch_queue_t v11 = dispatch_queue_create_with_target_V2("com.apple.MRDGroupSessionServer.notification", v8, v10);
    notificationuint64_t Queue = v6->_notificationQueue;
    v6->_notificationuint64_t Queue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UNSPECIFIED, 0);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.MRDGroupSessionServer.messageQueue", v16);
    messageuint64_t Queue = v6->_messageQueue;
    v6->_messageuint64_t Queue = (OS_dispatch_queue *)v17;

    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    clients = v6->_clients;
    v6->_clients = (NSMutableSet *)v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "weakToStrongObjectsMapTable"));
    assertionsByClient = v6->_assertionsByClient;
    v6->_assertionsByClient = (NSMapTable *)v21;

    objc_storeStrong((id *)&v6->_nowPlayingServer, a3);
    if (MSVDeviceIsAudioAccessory())
    {
      v23 = objc_alloc_init(&OBJC_CLASS___MRDGroupSessionAssertionManager);
      assertionManager = v6->_assertionManager;
      v6->_assertionManager = v23;
    }

    v25 = objc_alloc_init(&OBJC_CLASS___MRDNetworkMonitor);
    networkMonitor = v6->_networkMonitor;
    v6->_networkMonitor = v25;

    -[MRDNetworkMonitor startWithQueue:](v6->_networkMonitor, "startWithQueue:", v6->_notificationQueue);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v27 addObserver:v6 selector:"handleClientConnect:" name:@"MRDMediaRemoteClientDidConnect" object:0];

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v28 addObserver:v6 selector:"handleClientInvalidate:" name:@"MRDMediaRemoteServerClientInvalidatedNotification" object:0];

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v29 addObserver:v6 selector:"handleUserStateChange:" name:@"MRDMusicUserStateCenterCloudStateDidUpdateNotification" object:0];

    uint64_t v31 = _MRLogForCategory(12LL, v30);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Initialized",  buf,  2u);
    }

    if (MSVDeviceIsAudioAccessory())
    {
      -[MRDGroupSessionAssertionManager addObserver:](v6->_assertionManager, "addObserver:", v6);
    }

    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100009B2C;
      block[3] = &unk_100399250;
      v35 = v6;
      dispatch_async(&_dispatch_main_q, block);
    }
  }

  return v6;
}

- (void)requestEligibilityMonitoring
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_eligibilityMonitor)
  {
    os_unfair_lock_unlock(p_lock);
  }

  else
  {
    uint64_t v5 = _MRLogForCategory(12LL, v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Starting eligibility monitoring",  v9,  2u);
    }

    dispatch_queue_attr_t v7 = objc_alloc_init(&OBJC_CLASS___MRDGroupSessionEligibilityMonitor);
    eligibilityMonitor = self->_eligibilityMonitor;
    self->_eligibilityMonitor = v7;

    -[MRDGroupSessionEligibilityMonitor addObserver:](self->_eligibilityMonitor, "addObserver:", self);
    os_unfair_lock_unlock(p_lock);
    dispatch_async((dispatch_queue_t)self->_notificationQueue, &stru_100399328);
  }

- (void)start
{
  uint64_t v3 = _MRLogForCategory(12LL, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Starting...", buf, 2u);
  }

  -[MRDGroupSessionServer requestEligibilityMonitoring](self, "requestEligibilityMonitoring");
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = -[MRDGroupSessionManager initWithEligibilityMonitor:]( objc_alloc(&OBJC_CLASS___MRDGroupSessionManager),  "initWithEligibilityMonitor:",  self->_eligibilityMonitor);
  sessionManager = self->_sessionManager;
  self->_sessionManager = v5;

  -[MRDGroupSessionManager addObserver:](self->_sessionManager, "addObserver:", self);
  dispatch_queue_attr_t v7 = -[MRDRemoteControlGroupSessionCoordinator initWithSessionManager:eligibilityMonitor:]( objc_alloc(&OBJC_CLASS___MRDRemoteControlGroupSessionCoordinator),  "initWithSessionManager:eligibilityMonitor:",  self->_sessionManager,  self->_eligibilityMonitor);
  coordinator = self->_coordinator;
  self->_coordinator = v7;

  self->_running = 1;
  os_unfair_lock_unlock(&self->_lock);
  notificationuint64_t Queue = (dispatch_queue_s *)self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009DB0;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(notificationQueue, block);
  uint64_t v11 = _MRLogForCategory(12LL, v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Started.", buf, 2u);
  }
}

- (void)stop
{
  uint64_t v3 = _MRLogForCategory(12LL, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Stopping...", buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  coordinator = self->_coordinator;
  self->_coordinator = 0LL;

  -[MRDGroupSessionManager removeObserver:](self->_sessionManager, "removeObserver:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionManager session](self->_sessionManager, "session"));
  if ([v6 isHosted])
  {
    -[MRDGroupSessionManager finishRemoteControlGroupSession:]( self->_sessionManager,  "finishRemoteControlGroupSession:",  v6);
  }

  else if (v6)
  {
    -[MRDGroupSessionManager leaveRemoteControlGroupSession:]( self->_sessionManager,  "leaveRemoteControlGroupSession:",  v6);
  }

  sessionManager = self->_sessionManager;
  self->_sessionManager = 0LL;

  self->_running = 0;
  os_unfair_lock_unlock(&self->_lock);
  notificationuint64_t Queue = (dispatch_queue_s *)self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009F6C;
  block[3] = &unk_100399250;
  void block[4] = self;
  dispatch_async(notificationQueue, block);
  uint64_t v10 = _MRLogForCategory(12LL, v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[MRDGroupSessionServer] Stopped.", buf, 2u);
  }
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0xC00000000000001uLL:
      -[MRDGroupSessionServer handleGetGroupSessionServerEndpointMessage:fromClient:]( self,  "handleGetGroupSessionServerEndpointMessage:fromClient:",  xdict,  v6);
      break;
    case 0xC00000000000002uLL:
      -[MRDGroupSessionServer handleJoinGroupSessionMessage:fromClient:]( self,  "handleJoinGroupSessionMessage:fromClient:",  xdict,  v6);
      break;
    case 0xC00000000000003uLL:
      -[MRDGroupSessionServer handleLeaveGroupSessionMessage:fromClient:]( self,  "handleLeaveGroupSessionMessage:fromClient:",  xdict,  v6);
      break;
    case 0xC00000000000004uLL:
      -[MRDGroupSessionServer _handleGroupSessionEventMessage:fromClient:]( self,  "_handleGroupSessionEventMessage:fromClient:",  xdict,  v6);
      break;
    case 0xC00000000000005uLL:
      -[MRDGroupSessionServer _handleGetUserIdentityMessage:fromClient:]( self,  "_handleGetUserIdentityMessage:fromClient:",  xdict,  v6);
      break;
    case 0xC00000000000006uLL:
      -[MRDGroupSessionServer _handleCreateGroupSessionTokenMessage:fromClient:]( self,  "_handleCreateGroupSessionTokenMessage:fromClient:",  xdict,  v6);
      break;
    case 0xC00000000000007uLL:
      -[MRDGroupSessionServer _handleGetUserIdentityForDSIDMessage:fromClient:]( self,  "_handleGetUserIdentityForDSIDMessage:fromClient:",  xdict,  v6);
      break;
    case 0xC00000000000008uLL:
      -[MRDGroupSessionServer _handlePresentProximityCardMessage:fromClient:]( self,  "_handlePresentProximityCardMessage:fromClient:",  xdict,  v6);
      break;
    case 0xC00000000000009uLL:
      -[MRDGroupSessionServer _handleRequestGroupSessionMessage:fromClient:]( self,  "_handleRequestGroupSessionMessage:fromClient:",  xdict,  v6);
      break;
    default:
      break;
  }
}

- (void)handleGetGroupSessionServerEndpointMessage:(id)a3 fromClient:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000A140;
  v4[3] = &unk_100399350;
  v4[4] = self;
  sub_10013ADE4(a3, v4);
}

- (void)handleJoinGroupSessionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MRCreateDataFromXPCMessage(v6, "MRXPC_GROUP_SESSION_TOKEN_KEY");
  uint64_t v9 = -[MRGroupSessionToken initWithData:](objc_alloc(&OBJC_CLASS___MRGroupSessionToken), "initWithData:", v8);
  uint64_t v11 = _MRLogForCategory(12LL, v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Handling join command from client: %@",  buf,  0xCu);
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10000A568;
  v43[3] = &unk_1003993A0;
  id v13 = v6;
  id v44 = v13;
  objc_super v37 = objc_retainBlock(v43);
  id v14 = kMREventJoinSessionModeQRCode;
  dispatch_queue_attr_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRGroupSessionToken discoveredSession](v9, "discoveredSession"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRGroupSessionToken discoveredSession](v9, "discoveredSession"));
    id v17 = [v16 source];

    v18 = (id *)&kMREventJoinSessionModeProximity;
    if (v17 == (id)1) {
      v18 = (id *)&kMREventJoinSessionModeBoop;
    }
    goto LABEL_9;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRGroupSessionToken sharedSecret](v9, "sharedSecret"));

  if (v19)
  {
    v18 = (id *)&kMREventJoinSessionModeWHAAutoJoin;
LABEL_9:
    id v20 = *v18;

    id v14 = v20;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer networkMonitor](self, "networkMonitor"));
  if ([v21 isUsingWifi])
  {
    unsigned int v22 = 1;
  }

  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer networkMonitor](self, "networkMonitor"));
    unsigned int v22 = [v23 isUsingWiredEthernet];
  }

  uint64_t v24 = objc_claimAutoreleasedReturnValue(-[MRGroupSessionToken equivalentMediaIdentifier](v9, "equivalentMediaIdentifier"));
  if (!v24) {
    goto LABEL_20;
  }
  v25 = (void *)v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MRGroupSessionToken sharedSecret](v9, "sharedSecret"));
  if (v26) {
    unsigned int v22 = 0;
  }

  if (v22 == 1)
  {
    uint64_t v28 = _MRLogForCategory(12LL, v27);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Attempting to join group session by searching for equivalent WHA device",  buf,  2u);
    }

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10000A638;
    v41[3] = &unk_1003993C8;
    uint64_t v30 = v37;
    v42 = v37;
    uint64_t v31 = v37;
    -[MRDGroupSessionServer joinGroupSessionViaEquivalentWHAEndpoint:completion:]( self,  "joinGroupSessionViaEquivalentWHAEndpoint:completion:",  v9,  v41);
    v32 = v42;
  }

  else
  {
LABEL_20:
    v33 = -[MRDGroupSessionJoinAttemptAnalytics initWithJoinMode:]( objc_alloc(&OBJC_CLASS___MRDGroupSessionJoinAttemptAnalytics),  "initWithJoinMode:",  v14);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionJoinAttemptAnalytics request](v33, "request"));
    [v34 start];

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer sessionManager](self, "sessionManager"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10000A69C;
    v38[3] = &unk_1003993F0;
    uint64_t v30 = v37;
    v39 = v33;
    v40 = v37;
    v36 = v37;
    v32 = v33;
    [v35 joinGroupSessionWithToken:v9 completion:v38];
  }
}

- (void)joinGroupSessionViaEquivalentWHAEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = _MRLogForCategory(12LL, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 equivalentMediaIdentifier]);
    *(_DWORD *)buf = 138412290;
    v33 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Searching for WHA endpoint with device identifier: %@",  buf,  0xCu);
  }

  v12 = objc_alloc(&OBJC_CLASS___MRDGroupSessionJoinAttemptAnalytics);
  id v13 = -[MRDGroupSessionJoinAttemptAnalytics initWithJoinMode:]( v12,  "initWithJoinMode:",  kMREventJoinSessionModeWHAAutoJoin);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer sessionManager](self, "sessionManager"));
  id v15 = objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionJoinAttemptAnalytics recon](v13, "recon"));
  [v16 start];

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 equivalentMediaIdentifier]);
  uint64_t Queue = MRGroupSessionSubsystemGetQueue();
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(Queue);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000A968;
  v25[3] = &unk_1003994E0;
  id v26 = v15;
  id v27 = v14;
  id v28 = v6;
  v29 = v13;
  uint64_t v30 = self;
  id v31 = v7;
  id v20 = v13;
  id v21 = v7;
  id v22 = v6;
  id v23 = v14;
  id v24 = v15;
  [v24 searchEndpointsForOutputDeviceUID:v17 timeout:@"MRGroupSession.waitForWHAEndpoint" reason:v19 queue:v25 completion:3.0];
}

- (void)handleLeaveGroupSessionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = MRCreateStringFromXPCMessage();
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer sessionManager](self, "sessionManager"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 session]);
  uint64_t v13 = _MRLogForCategory(12LL, v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Handling leave command from client: %@",  buf,  0xCu);
  }

  id v15 = (id)objc_claimAutoreleasedReturnValue([v11 identifier]);
  if (v9 == v15)
  {

LABEL_7:
    if ([v11 isHosted])
    {
      uint64_t v18 = MRGroupSessionError;
      uint64_t v19 = @"Cannot leave hosted session.";
      uint64_t v20 = 9LL;
      goto LABEL_9;
    }

    id v38 = v6;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 joinToken]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 equivalentMediaIdentifier]);
    id v24 = v23;
    if (v23) {
      id v25 = v23;
    }
    else {
      id v25 = (id)objc_claimAutoreleasedReturnValue([v11 identifier]);
    }
    id v26 = v25;

    id v27 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 routingServer]);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 systemEndpointController]);
    id v30 = (id)objc_claimAutoreleasedReturnValue([v29 activeOutputDeviceUID:0]);
    if (v30 == v26)
    {
    }

    else
    {
      id v31 = v30;
      unsigned __int8 v32 = [v30 isEqual:v26];

      if ((v32 & 1) == 0) {
        goto LABEL_18;
      }
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 routingServer]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 systemEndpointController]);
    id v36 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:0 reason:@"Group session ended."];
    [v35 updateSystemEndpointForRequest:v36];

LABEL_18:
    [v10 leaveRemoteControlGroupSession:v11];

    id v21 = 0LL;
    id v6 = v38;
    goto LABEL_19;
  }

  v16 = v15;
  unsigned int v17 = [v9 isEqual:v15];

  if (v17) {
    goto LABEL_7;
  }
  uint64_t v18 = MRGroupSessionError;
  uint64_t v19 = @"Did not find session for leave request.";
  uint64_t v20 = 2LL;
LABEL_9:
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  v18,  v20,  v19));
LABEL_19:
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10000B75C;
  v39[3] = &unk_100399350;
  id v40 = v21;
  id v37 = v21;
  sub_10013ADE4(v7, v39);
}

- (void)_handleGetUserIdentityMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000B7EC;
  v6[3] = &unk_100399350;
  id v7 = a4;
  id v5 = v7;
  sub_10013ADE4(a3, v6);
}

- (void)_handleGroupSessionEventMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MRCreatePropertyListFromXPCMessage(v6, "MRXPC_GROUP_SESSION_EVENT_KEY");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer sessionManager](self, "sessionManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MRGroupSessionEventOptionEventType]);
  unint64_t v11 = (unint64_t)[v10 integerValue];

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10000BCD0;
  v36[3] = &unk_100399508;
  id v12 = v6;
  id v37 = v12;
  uint64_t v13 = objc_retainBlock(v36);
  id v14 = (void (**)(void, void))v13;
  if (v11)
  {
    if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      os_unfair_lock_t lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_assertionsByClient, "objectForKey:", v7));
      v16 = v15;
      if (v15) {
        id v17 = v15;
      }
      else {
        id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      }
      uint64_t v19 = v17;

      id v21 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:MRGroupSessionEventOptionAssertionIdentifier]);
      if (v21
        || (uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MRGroupSessionError,  9LL,  @"No assertion ID provided."))) == 0LL)
      {
        uint64_t v22 = _MRLogForCategory(12LL, v20);
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v11 == 2)
        {
          if (v24)
          {
            uint64_t v25 = objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
            id v26 = (void *)v25;
            if (!v25) {
              uint64_t v25 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 pid]));
            }
            *(_DWORD *)buf = 138412546;
            unsigned __int8 v32 = (void *)v25;
            uint64_t v39 = v25;
            __int16 v40 = 2112;
            v41 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Client: %@ asserting with ID: %@",  buf,  0x16u);
            if (!v26) {
          }
            }

          id v27 = (void *)objc_claimAutoreleasedReturnValue([v9 assertSessionManagementScreenVisible]);
          [v19 setObject:v27 forKeyedSubscript:v21];
        }

        else
        {
          if (v24)
          {
            uint64_t v28 = objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
            v29 = (void *)v28;
            if (!v28) {
              uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 pid]));
            }
            *(_DWORD *)buf = 138412546;
            unsigned __int8 v32 = (void *)v28;
            uint64_t v39 = v28;
            __int16 v40 = 2112;
            v41 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Client: %@ removing assertion with ID: %@",  buf,  0x16u);
            if (!v29) {
          }
            }

          [v19 setObject:0 forKeyedSubscript:v21];
          [v9 releaseSessionManagementScreenVisibleAssertion];
        }

        id v30 = objc_msgSend(v19, "count", v32, lock);
        assertionsByClient = self->_assertionsByClient;
        if (v30) {
          -[NSMapTable setObject:forKey:](assertionsByClient, "setObject:forKey:", v19, v7);
        }
        else {
          -[NSMapTable removeObjectForKey:](assertionsByClient, "removeObjectForKey:", v7);
        }
        uint64_t v18 = 0LL;
      }

      os_unfair_lock_unlock(lock);
      ((void (**)(void, void *))v14)[2](v14, v18);
    }

    else
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10000BD64;
      v34[3] = &unk_100399530;
      v35 = v13;
      [v9 handleGroupSessionEvent:v11 withOptions:v8 completion:v34];
      uint64_t v18 = v35;
    }
  }

  else
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MRGroupSessionError,  9LL,  @"No event type provided."));
    ((void (**)(void, void *))v14)[2](v14, v18);
  }
}

- (void)_handleCreateGroupSessionTokenMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  id v5 = (void *)MRCreateDataFromXPCMessage(v4, "MRXPC_GROUP_SESSION_INVITATION_DATA_KEY");
  uint64_t v6 = MRCreateStringFromXPCMessage(v4, "MRXPC_GROUP_SESSION_EQUIVALENT_MEDIA_ID_KEY");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  xpc_dictionary_get_int64(v4, "MRXPC_GROUP_SESSION_VERSION_KEY"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = -[MRGroupSessionToken initWithInvitationData:sharedSecret:sessionIdentifier:equivalentMediaIdentifier:version:]( [MRGroupSessionToken alloc],  "initWithInvitationData:sharedSecret:sessionIdentifier:equivalentMediaIdentifier:version:",  v5,  0,  0,  v7,  [v9 integerValue]);
  unint64_t v11 = 0LL;
  if (!v10) {
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError msv_errorWithDomain:code:debugDescription:]( &OBJC_CLASS___NSError,  "msv_errorWithDomain:code:debugDescription:",  MRGroupSessionError,  12LL,  @"Failed to parse group session token"));
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000BEDC;
  v14[3] = &unk_100399378;
  id v15 = v11;
  v16 = v10;
  id v12 = v10;
  id v13 = v11;
  sub_10013ADE4(v4, v14);
}

- (void)_handleGetUserIdentityForDSIDMessage:(id)a3 fromClient:(id)a4
{
  id v4 = a3;
  uint64_t v5 = MRCreateStringFromXPCMessage(v4, "MRXPC_DSID_KEY");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMusicUserStateCenter sharedCenter](&OBJC_CLASS___MRDMusicUserStateCenter, "sharedCenter"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000C004;
  v9[3] = &unk_100399558;
  id v10 = v4;
  id v8 = v4;
  [v7 userIdentityForDSID:v6 completion:v9];
}

- (void)_handlePresentProximityCardMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t v6 = MRCreateStringFromXPCMessage(v5, "deviceName");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = MRCreateStringFromXPCMessage(v5, "modelIdentifier");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = MRCreateStringFromXPCMessage(v5, "color");
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = MRCreateStringFromXPCMessage(v5, "url");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v17 = 0LL;
  -[MRDGroupSessionServer presentProximityCardWithDeviceName:modelIdentifier:color:url:error:]( self,  "presentProximityCardWithDeviceName:modelIdentifier:color:url:error:",  v7,  v9,  v11,  v13,  &v17);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000C244;
  v15[3] = &unk_100399350;
  id v16 = v17;
  id v14 = v16;
  sub_10013ADE4(v5, v15);
}

- (void)_handleRequestGroupSessionMessage:(id)a3 fromClient:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000C2D4;
  v6[3] = &unk_1003993A0;
  id v7 = a3;
  id v5 = v7;
  -[MRDGroupSessionServer requestGroupSessionWithCompletion:](self, "requestGroupSessionWithCompletion:", v6);
}

- (void)requestGroupSessionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, NSError *, void))a3;
  if ((MSVDeviceIsAudioAccessory() & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer sessionManager](self, "sessionManager"));
    uint64_t v6 = (NSError *)objc_claimAutoreleasedReturnValue([v5 session]);

    if (v6)
    {
      if (-[NSError isHosted](v6, "isHosted"))
      {
        id v7 = (NSError *)objc_claimAutoreleasedReturnValue(-[NSError identifier](v6, "identifier"));
        v4[2](v4, v7, 0LL);
      }

      else
      {
        id v7 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 3LL);
        ((void (**)(id, NSError *, NSError *))v4)[2](v4, 0LL, v7);
      }
    }

    else
    {
      os_unfair_lock_lock(&self->_lock);
      requestGroupSessionCompletions = self->_requestGroupSessionCompletions;
      if (!requestGroupSessionCompletions)
      {
        id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        uint64_t v10 = self->_requestGroupSessionCompletions;
        self->_requestGroupSessionCompletions = v9;

        requestGroupSessionCompletions = self->_requestGroupSessionCompletions;
      }

      id v11 = [v4 copy];
      id v12 = objc_retainBlock(v11);
      -[NSMutableSet addObject:](requestGroupSessionCompletions, "addObject:", v12);

      v19[0] = 0LL;
      v19[1] = v19;
      v19[2] = 0x3032000000LL;
      v19[3] = sub_10000B044;
      v19[4] = sub_10000B054;
      id v20 = (id)objc_claimAutoreleasedReturnValue( -[MRDGroupSessionAssertionManager createAssertionWithReason:]( self->_assertionManager,  "createAssertionWithReason:",  @"Client requested group session"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
      [v13 groupSessionStartRequestAssertionDuration];
      double v15 = v14;

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_10000C5FC;
      v18[3] = &unk_100399580;
      v18[4] = v19;
      id v16 = (MSVTimer *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:repeats:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:repeats:block:",  0LL,  v18,  v15));
      requestAssertionTimer = self->_requestAssertionTimer;
      self->_requestAssertionTimer = v16;

      os_unfair_lock_unlock(&self->_lock);
      _Block_object_dispose(v19, 8);
    }
  }

  else
  {
    uint64_t v6 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 6LL);
    ((void (**)(id, NSError *, NSError *))v4)[2](v4, 0LL, v6);
  }
}

- (BOOL)isPresentingProximityCard
{
  return self->_remoteAlertHandle != 0LL;
}

- (void)presentProximityCardWithDeviceName:(id)a3 modelIdentifier:(id)a4 color:(id)a5 url:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v17 = v15;
  if (!v12)
  {
    if (!a7) {
      goto LABEL_21;
    }
    v29 = objc_alloc(&OBJC_CLASS___NSError);
    id v30 = @"device name is missing";
LABEL_20:
    *a7 = -[NSError initWithMRError:description:](v29, "initWithMRError:description:", 2LL, v30);
    goto LABEL_21;
  }

  if (!v13)
  {
    if (!a7) {
      goto LABEL_21;
    }
    v29 = objc_alloc(&OBJC_CLASS___NSError);
    id v30 = @"model is missing";
    goto LABEL_20;
  }

  if (!v14)
  {
    if (!a7) {
      goto LABEL_21;
    }
    v29 = objc_alloc(&OBJC_CLASS___NSError);
    id v30 = @"color is missing";
    goto LABEL_20;
  }

  if (!v15)
  {
    if (!a7) {
      goto LABEL_21;
    }
    v29 = objc_alloc(&OBJC_CLASS___NSError);
    id v30 = @"url is missing";
    goto LABEL_20;
  }

  if (self->_remoteAlertHandle)
  {
    uint64_t v18 = _MRLogForCategory(12LL, v16);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Dismissing existing proximity card to present a new one",  buf,  2u);
    }

    -[MRDGroupSessionServer dismissProximityCard](self, "dismissProximityCard");
  }

  uint64_t v20 = _MRLogForCategory(12LL, v16);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v34 = v12;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2112;
    id v38 = v14;
    __int16 v39 = 2112;
    __int16 v40 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Presenting proximity card for device with name: %@, model: %@, color: %@, url: %@",  buf,  0x2Au);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentity identityForAngelJobLabel:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForAngelJobLabel:",  @"com.apple.MediaRemoteUI"));
  id v23 = [[SBSRemoteAlertDefinition alloc] initWithSceneProvidingProcess:v22 configurationIdentifier:@"proximity-card"];
  id v24 = objc_alloc_init(&OBJC_CLASS___SBSRemoteAlertConfigurationContext);
  v31[0] = @"deviceName";
  v31[1] = @"modelIdentifier";
  v32[0] = v12;
  v32[1] = v13;
  v31[2] = @"color";
  v31[3] = @"url";
  v32[2] = v14;
  v32[3] = v17;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  4LL));
  [v24 setUserInfo:v25];

  id v26 = objc_alloc_init(&OBJC_CLASS___SBSRemoteAlertActivationContext);
  id v27 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:]( &OBJC_CLASS___SBSRemoteAlertHandle,  "newHandleWithDefinition:configurationContext:",  v23,  v24);
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = v27;

  -[SBSRemoteAlertHandle registerObserver:](self->_remoteAlertHandle, "registerObserver:", self);
  -[SBSRemoteAlertHandle activateWithContext:](self->_remoteAlertHandle, "activateWithContext:", v26);

LABEL_21:
}

- (void)dismissProximityCard
{
  uint64_t v3 = _MRLogForCategory(12LL, a2);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Dismissing proximity card",  v6,  2u);
  }

  -[SBSRemoteAlertHandle unregisterObserver:](self->_remoteAlertHandle, "unregisterObserver:", self);
  -[SBSRemoteAlertHandle invalidate](self->_remoteAlertHandle, "invalidate");
  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = 0LL;
}

- (void)handleClientConnect:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer sessionManager](self, "sessionManager"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 session]);

  if (sub_1000097C4(v4))
  {
    if (v6) {
      id v7 = -[MRGroupSessionInfo initWithGroupSession:]( objc_alloc(&OBJC_CLASS___MRGroupSessionInfo),  "initWithGroupSession:",  v6);
    }
    else {
      id v7 = 0LL;
    }
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v7,  MRActiveGroupSessionInfoUserInfoKey);
    uint64_t v10 = _MRLogForCategory(12LL, v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1002B4730((uint64_t)v7, v4);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v13 = _MRGroupSessionInfoDidChangeNotification;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10000CC38;
    v26[3] = &unk_1003995A8;
    id v14 = v4;
    id v27 = v14;
    [v12 postClientNotificationNamed:v13 userInfo:v8 predicate:v26];

    id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer eligibilityMonitor](self, "eligibilityMonitor"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 eligibilityStatus]);

    id v18 = [v17 copy];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v18,  MRGroupSessionEligibilityStatusUserInfoKey);

    uint64_t v20 = _MRLogForCategory(12LL, v19);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_1002B46AC((uint64_t)v15, v14);
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    uint64_t v23 = _MRGroupSessionEligibilityDidChangeNotification;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10000CC70;
    v24[3] = &unk_1003995A8;
    id v25 = v14;
    [v22 postClientNotificationNamed:v23 userInfo:v8 predicate:v24];
  }
}

- (void)handleClientInvalidate:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 object]);
  os_unfair_lock_lock(&self->_lock);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_assertionsByClient, "objectForKey:", v4));
  if ([v5 count])
  {
    uint64_t v7 = _MRLogForCategory(12LL, v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
      uint64_t v10 = v9;
      if (!v9) {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 pid]));
      }
      int v11 = 138412546;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Cleaning up assertions for invalidated client: %@ - %@",  (uint8_t *)&v11,  0x16u);
      if (!v9) {
    }
      }
  }

  -[NSMapTable removeObjectForKey:](self->_assertionsByClient, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)restoreClientState:(id)a3 handler:(id)a4
{
  id v19 = a3;
  uint64_t v6 = (void (**)(id, void, NSMutableDictionary *))a4;
  int v7 = sub_1000097C4(v19);
  uint64_t v8 = v19;
  if (v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer sessionManager](self, "sessionManager"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 session]);

    int v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (v10)
    {
      id v12 = -[MRGroupSessionInfo initWithGroupSession:]( objc_alloc(&OBJC_CLASS___MRGroupSessionInfo),  "initWithGroupSession:",  v10);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v12,  MRActiveGroupSessionInfoUserInfoKey);
    }

    v6[2](v6, _MRGroupSessionInfoDidChangeNotification, v11);

    uint64_t v8 = v19;
  }

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  int IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication();

  if (IsSystemMediaApplication)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMusicUserStateCenter sharedCenter](&OBJC_CLASS___MRDMusicUserStateCenter, "sharedCenter"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 localActiveIdentity]);

    id v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 protobufData]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v17,  "setObject:forKeyedSubscript:",  v18,  _MRUserIdentityDataUserInfoKey);

    v6[2](v6, _MRUserIdentityDidChangeNotification, v17);
  }
}

- (void)handleUserStateChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMusicUserStateCenter sharedCenter](&OBJC_CLASS___MRDMusicUserStateCenter, "sharedCenter", a3));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v4 localActiveIdentity]);

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer localMusicIdentity](self, "localMusicIdentity"));
  uint64_t v6 = v11;
  int v7 = v11;
  if (v5 == v11) {
    goto LABEL_4;
  }
  uint64_t v8 = v5;
  unsigned __int8 v9 = [v5 isEqual:v11];

  if ((v9 & 1) == 0)
  {
    -[MRDGroupSessionServer setLocalMusicIdentity:](self, "setLocalMusicIdentity:", v11);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v11 protobufData]);
    [v7 setObject:v10 forKeyedSubscript:_MRUserIdentityDataUserInfoKey];

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    [v6 postClientNotificationNamed:_MRUserIdentityDidChangeNotification userInfo:v7 predicate:&stru_1003995E8];
LABEL_4:
  }
}

- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  -[MRDGroupSessionServer _completeGroupSessionRequestsWithIdentifier:]( self,  "_completeGroupSessionRequestsWithIdentifier:",  v5);

  -[MRDGroupSessionServer notifyActiveSessionStateChanged](self, "notifyActiveSessionStateChanged");
}

- (void)manager:(id)a3 activeSessionDidChange:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer lastConnectionError](self, "lastConnectionError"));
  id v7 = [v6 code];

  if (v7 == (id)100)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 joinToken]);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 equivalentMediaIdentifier]);

    if (v9)
    {
      uint64_t v11 = _MRLogForCategory(12LL, v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionServer] Registering WHA identifier for connection failure: %@",  (uint8_t *)&v18,  0xCu);
      }

      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 routingServer]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 hostedRoutingService]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 hostedRoutingController]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 discoverySession]);

      [v17 registerConnectionFailureForWHAIdentifier:v9];
    }
  }
}

- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "joinToken", a3));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v5 equivalentMediaIdentifier]);

  if (v11)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 routingServer]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 hostedRoutingService]);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 hostedRoutingController]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 discoverySession]);

    [v10 unregisterConnectionFailureForWHAIdentifier:v11];
  }

  -[MRDGroupSessionServer notifyActiveSessionStateChanged](self, "notifyActiveSessionStateChanged");
}

- (void)manager:(id)a3 discoveredSessionsDidChange:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "msv_firstWhere:", &stru_100399628));
  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer nowPlayingServer](self, "nowPlayingServer"));
    if ([v6 activePlayerIsPlaying])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer nowPlayingServer](self, "nowPlayingServer"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activePlayerPath]);
      unsigned __int8 v9 = [v8 isSystemMediaApplication];

      if ((v9 & 1) == 0)
      {
        uint64_t v11 = _MRLogForCategory(12LL, v10);
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionServer] Suppressing proximity card because local device is playing non-Music content",  buf,  2u);
        }

        goto LABEL_15;
      }
    }

    else
    {
    }

    __int16 v13 = -[MRGroupSessionToken initWithDiscoveredSession:autoConnect:]( objc_alloc(&OBJC_CLASS___MRGroupSessionToken),  "initWithDiscoveredSession:autoConnect:",  v5,  1LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 hostInfo]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 displayName]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 hostInfo]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 modelIdentifier]);
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v5 hostInfo]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 color]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MRGroupSessionToken joinURLString](v13, "joinURLString"));
    id v28 = 0LL;
    -[MRDGroupSessionServer presentProximityCardWithDeviceName:modelIdentifier:color:url:error:]( self,  "presentProximityCardWithDeviceName:modelIdentifier:color:url:error:",  v15,  v17,  v19,  v20,  &v28);
    id v21 = v28;

    if (v21)
    {
      uint64_t v23 = _MRLogForCategory(12LL, v22);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1002B47B4(v21, v24);
      }
    }

    else
    {
      uint64_t v25 = kMREventGroupSessionNearbyNotificationDisplayed;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10000D64C;
      v26[3] = &unk_100399650;
      id v27 = v5;
      MRAnalyticsSendEvent(v25, 0LL, v26);
      id v24 = v27;
    }
  }

  else if (-[MRDGroupSessionServer isPresentingProximityCard](self, "isPresentingProximityCard"))
  {
    -[MRDGroupSessionServer dismissProximityCard](self, "dismissProximityCard");
  }

- (void)notifyActiveSessionStateChanged
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer sessionManager](self, "sessionManager"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 session]);

  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v3)
  {
    uint64_t v6 = -[MRGroupSessionInfo initWithGroupSession:]( objc_alloc(&OBJC_CLASS___MRGroupSessionInfo),  "initWithGroupSession:",  v3);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v6,  MRActiveGroupSessionInfoUserInfoKey);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = _MRLogForCategory(12LL, v4);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Push active session state: %@ to clients",  (uint8_t *)&v10,  0xCu);
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  [v9 postClientNotificationNamed:_MRGroupSessionInfoDidChangeNotification userInfo:v5 predicate:&stru_100399670];
}

- (void)_completeGroupSessionRequestsWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = self->_requestGroupSessionCompletions;
  id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      unsigned __int8 v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8LL * (void)v9) + 16LL))(*(void *)(*((void *)&v11 + 1) + 8LL * (void)v9));
        unsigned __int8 v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v7);
  }

  requestGroupSessionCompletions = self->_requestGroupSessionCompletions;
  self->_requestGroupSessionCompletions = 0LL;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)eligibilityMonitor:(id)a3 eligibilityStatusDidChange:(id)a4
{
}

- (void)notifyEligibilityChanged:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v3,  MRGroupSessionEligibilityStatusUserInfoKey);
  uint64_t v6 = _MRLogForCategory(12LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Push local session state: %{public}@ to clients",  (uint8_t *)&v9,  0xCu);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  [v8 postClientNotificationNamed:_MRGroupSessionEligibilityDidChangeNotification userInfo:v4 predicate:&stru_100399690];
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v7 = _MRLogForCategory(12LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Adding client %{public}@",  (uint8_t *)&v10,  0xCu);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer clients](self, "clients"));
  [v9 addObject:v4];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer messageQueue](self, "messageQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v7 = _MRLogForCategory(12LL, v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] Removing client %{public}@",  (uint8_t *)&v10,  0xCu);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer clients](self, "clients"));
  [v9 removeObject:v4];
}

- (id)clientForConnection:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer clients](self, "clients"));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        int v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connection", (void)v13));
        unsigned __int8 v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (NSXPCListener)listener
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  listener = self->_listener;
  if (!listener)
  {
    id v5 = (NSXPCListener *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    id v6 = self->_listener;
    self->_listener = v5;

    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    -[NSXPCListener resume](self->_listener, "resume");
    listener = self->_listener;
  }

  uint64_t v7 = listener;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v46, 0, 32);
  }
  uint64_t v9 = MSVBundleIDForAuditToken(v46);
  int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 length];
  uint64_t v13 = _MRLogForCategory(12LL, v12);
  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  __int128 v15 = v14;
  if (v11)
  {
    id v40 = v11;
    id v41 = v6;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1002B4840((uint64_t)v10, v15);
    }

    __int16 v39 = -[MRDGroupSessionClient initWithConnection:bundleID:]( objc_alloc(&OBJC_CLASS___MRDGroupSessionClient),  "initWithConnection:bundleID:",  v8,  v10);
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MRGroupSessionServerXPCProtocol));
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___MRCodableGroupSessionParticipant);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___MRUserIdentity);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___MRDiscoveredGroupSession);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___MRGroupSessionHostInfo);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___MRGroupSessionInfo);
    id v21 = +[NSMutableSet setWithObjects:]( &OBJC_CLASS___NSMutableSet,  "setWithObjects:",  v16,  v17,  v18,  v19,  v20,  objc_opt_class(&OBJC_CLASS___NSSet),  0LL);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    uint64_t v23 = MSVPropertyListDataClasses();
    id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    [v22 unionSet:v24];

    -[os_log_s setClasses:forSelector:argumentIndex:ofReply:]( v15,  "setClasses:forSelector:argumentIndex:ofReply:",  v22,  "connectToSession:reply:",  0LL,  1LL);
    -[os_log_s setClasses:forSelector:argumentIndex:ofReply:]( v15,  "setClasses:forSelector:argumentIndex:ofReply:",  v22,  "connectToDiscoveryWithReply:",  0LL,  1LL);
    -[os_log_s setClasses:forSelector:argumentIndex:ofReply:]( v15,  "setClasses:forSelector:argumentIndex:ofReply:",  v22,  "connectToDiscoveryWithReply:",  1LL,  1LL);
    -[os_log_s setClasses:forSelector:argumentIndex:ofReply:]( v15,  "setClasses:forSelector:argumentIndex:ofReply:",  v22,  "session:approvePendingParticipant:reply:",  1LL,  0LL);
    -[os_log_s setClasses:forSelector:argumentIndex:ofReply:]( v15,  "setClasses:forSelector:argumentIndex:ofReply:",  v22,  "session:denyPendingParticipant:reply:",  1LL,  0LL);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MRGroupSessionClientXPCProtocol));
    [v25 setClasses:v22 forSelector:"session:didUpdateParticipants:" argumentIndex:1 ofReply:0];
    [v25 setClasses:v22 forSelector:"session:didUpdatePendingParticipants:" argumentIndex:1 ofReply:0];
    [v25 setClasses:v22 forSelector:"session:didUpdateMembers:" argumentIndex:1 ofReply:0];
    [v25 setClasses:v22 forSelector:"discoveredSessionsDidChange:" argumentIndex:0 ofReply:0];
    [v25 setClasses:v22 forSelector:"activeSessionDidChange:" argumentIndex:0 ofReply:0];
    [v8 setExportedInterface:v15];
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[MSVWeakProxy proxyWithObject:protocol:]( &OBJC_CLASS___MSVWeakProxy,  "proxyWithObject:protocol:",  v39,  &OBJC_PROTOCOL___MRGroupSessionServerXPCProtocol));
    [v8 setExportedObject:v26];

    [v8 setRemoteObjectInterface:v25];
    id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer messageQueue](self, "messageQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000E35C;
    block[3] = &unk_100398E60;
    void block[4] = self;
    id v28 = v39;
    v45 = v28;
    dispatch_sync(v27, block);

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10000E368;
    v42[3] = &unk_100398E60;
    v42[4] = self;
    v43 = v28;
    v29 = v28;
    [v8 setInvalidationHandler:v42];
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer messageQueue](self, "messageQueue"));
    [v8 _setQueue:v30];

    [v8 resume];
    id v11 = v40;
    id v6 = v41;
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    sub_1002B48B4(v15, v31, v32, v33, v34, v35, v36, v37);
  }

  return v11 != 0LL;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v3 = _MRLogForCategory(12LL, a2, a3);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionServer] Remote alert handle did activate",  v5,  2u);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v4 = _MRLogForCategory(12LL, a2, a3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionServer] Remote alert handle did deactivate",  v7,  2u);
  }

  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = 0LL;
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  uint64_t v8 = _MRLogForCategory(12LL, v6, v7);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "[MRDGroupSessionServer] Remote alert handle did invalidate with error: %@",  (uint8_t *)&v11,  0xCu);
  }

  remoteAlertHandle = self->_remoteAlertHandle;
  self->_remoteAlertHandle = 0LL;
}

- (void)groupSessionAssertionManagerDidAssert:(id)a3
{
}

- (void)groupSessionAssertionManagerDidUnassert:(id)a3
{
}

- (void)reevaluateAssertionState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MRDGroupSessionServer assertionManager](self, "assertionManager"));
  unsigned __int8 v4 = [v3 isAsserting];
  os_unfair_lock_lock(&self->_lock);
  BOOL running = self->_running;
  if ((v4 & 1) == 0)
  {
    if (self->_running)
    {
      uint64_t v7 = _MRLogForCategory(12LL, v5);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[MRDGroupSessionServer] No group session assertions: Scheduling stop timer",  buf,  2u);
      }

      -[MSVTimer invalidate](self->_stopTimer, "invalidate");
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10000E664;
      v11[3] = &unk_100398E60;
      id v12 = v3;
      uint64_t v13 = self;
      uint64_t v9 = (MSVTimer *)objc_claimAutoreleasedReturnValue( +[MSVTimer timerWithInterval:repeats:block:]( &OBJC_CLASS___MSVTimer,  "timerWithInterval:repeats:block:",  0LL,  v11,  30.0));
      stopTimer = self->_stopTimer;
      self->_stopTimer = v9;
    }

    goto LABEL_8;
  }

  -[MSVTimer invalidate](self->_stopTimer, "invalidate");
  if (running)
  {
LABEL_8:
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_9;
  }

  os_unfair_lock_unlock(&self->_lock);
  -[MRDGroupSessionServer start](self, "start");
LABEL_9:
}

- (MRDGroupSessionManager)sessionManager
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v4 = self->_sessionManager;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (MRDRemoteControlGroupSessionCoordinator)coordinator
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v4 = self->_coordinator;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (MRDGroupSessionEligibilityMonitor)eligibilityMonitor
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v4 = self->_eligibilityMonitor;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSError)lastConnectionError
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v4 = self->_lastConnectionError;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLastConnectionError:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (NSError *)[v5 copy];

  lastConnectionError = self->_lastConnectionError;
  self->_lastConnectionError = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)collectDiagnostic:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[MRDRemoteControlGroupSessionCoordinator collectDiagnostic:](self->_coordinator, "collectDiagnostic:", v5);
  -[MRDGroupSessionManager collectDiagnostic:](self->_sessionManager, "collectDiagnostic:", v5);
  -[MRDGroupSessionAssertionManager collectDiagnostic:](self->_assertionManager, "collectDiagnostic:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (MRDGroupSessionAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (void)setCoordinator:(id)a3
{
}

- (void)setSessionManager:(id)a3
{
}

- (void)setEligibilityMonitor:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (MRDNowPlayingServer)nowPlayingServer
{
  return self->_nowPlayingServer;
}

- (MRDNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (NSMapTable)assertionsByClient
{
  return self->_assertionsByClient;
}

- (void)setAssertionsByClient:(id)a3
{
}

- (MRUserIdentity)localMusicIdentity
{
  return self->_localMusicIdentity;
}

- (void)setLocalMusicIdentity:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)running
{
  return self->_running;
}

- (MSVTimer)stopTimer
{
  return self->_stopTimer;
}

- (MSVTimer)requestAssertionTimer
{
  return self->_requestAssertionTimer;
}

- (NSMutableSet)requestGroupSessionCompletions
{
  return self->_requestGroupSessionCompletions;
}

- (void)setRequestGroupSessionCompletions:(id)a3
{
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end