@interface SDRemoteInteractionAgent
+ (id)sharedAgent;
- (BOOL)_clientShouldStart;
- (BOOL)preventNotifications;
- (OS_dispatch_queue)dispatchQueue;
- (SDRemoteInteractionAgent)init;
- (id)_rpCompanionLinkDeviceForSFDevice:(id)a3;
- (id)description;
- (int)sessionStart:(id)a3;
- (void)_clientClinkDeviceChanged:(id)a3;
- (void)_clientClinkDeviceFound:(id)a3;
- (void)_clientClinkDeviceLost:(id)a3;
- (void)_clientDeviceFound:(id)a3;
- (void)_clientDeviceLockStatusChanged;
- (void)_clientDeviceLost:(id)a3;
- (void)_clientEnsureStarted;
- (void)_clientEnsureStopped;
- (void)_commonEnsureStarted;
- (void)_commonEnsureStopped;
- (void)_commonIDSChanged:(id)a3;
- (void)_commonRapportChanged:(id)a3;
- (void)_legacy_serverHandleEvent:(id)a3;
- (void)_legacy_serverHandleRequest:(id)a3;
- (void)_legacy_serverRespondInfo:(id)a3;
- (void)_sendRTIPayload:(id)a3;
- (void)_serverEnsureStarted;
- (void)_serverEnsureStopped;
- (void)_serverSendTextSessionDidBegin:(id)a3;
- (void)_serverSendTextSessionDidEnd:(id)a3;
- (void)_update;
- (void)activate;
- (void)advertisingTimerFired;
- (void)advertisingTimerStart;
- (void)clientNotificationPostIfNeededForDevice:(id)a3;
- (void)clientNotificationRemoveForDevice:(id)a3;
- (void)clientNotificationUpdateForDevice:(id)a3 info:(id)a4;
- (void)clientNotificationUpdateForDevice:(id)a3 rtiData:(id)a4;
- (void)clientTextSessionDidBegin:(id)a3 device:(id)a4;
- (void)clientUserDidTapNotification:(id)a3;
- (void)handleEventWithData:(id)a3;
- (void)handleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4;
- (void)handleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4;
- (void)invalidate;
- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5;
- (void)prefsChanged;
- (void)sessionStop:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPreventNotifications:(BOOL)a3;
- (void)testKeyboardPost:(id)a3;
- (void)testKeyboardPostThenUpdate;
- (void)testKeyboardPostWithDelay;
- (void)testKeyboardRemove;
- (void)testKeyboardRemoveWithDelay;
- (void)testKeyboardUpdate;
- (void)testKeyboardUpdateWithDelay;
@end

@implementation SDRemoteInteractionAgent

+ (id)sharedAgent
{
  if (qword_100656FB0 != -1) {
    dispatch_once(&qword_100656FB0, &stru_1005CD0E0);
  }
  return (id)qword_100656FB8;
}

- (SDRemoteInteractionAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SDRemoteInteractionAgent;
  v2 = -[SDRemoteInteractionAgent init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }

  return v2;
}

- (id)description
{
  id v27 = 0LL;
  NSAppendPrintF(&v27, "-- SDRemoteInteractionAgent --\n");
  id v3 = v27;
  id v26 = v3;
  controlService = self->_controlService;
  if (!controlService) {
    controlService = (SFService *)@"off";
  }
  NSAppendPrintF(&v26, "Server: %@\n", controlService);
  id v5 = v26;

  id v25 = v5;
  if (self->_deviceDiscovery) {
    deviceDiscovery = self->_deviceDiscovery;
  }
  else {
    deviceDiscovery = (SFDeviceDiscovery *)@"off";
  }
  NSAppendPrintF( &v25,  "Client: %@, %ld NeedsKeyboard, %ld RSSI threshold\n",  deviceDiscovery,  -[NSMutableDictionary count](self->_devices, "count"),  self->_rssiThreshold);
  id v7 = v25;

  id v24 = v7;
  NSAppendPrintF(&v24, "Sessions: %ld\n", -[NSMutableSet count](self->_sessions, "count"));
  id v8 = v24;

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v9 = self->_devices;
  id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      v13 = 0LL;
      v14 = v8;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v13);
        id v19 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 description]);
        NSAppendPrintF(&v19, "    Found device: %@\n", v17);
        id v8 = v19;

        v13 = (char *)v13 + 1;
        v14 = v8;
      }

      while (v11 != v13);
      id v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v28,  16LL);
    }

    while (v11);
  }

  return v8;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009A640;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009A7D4;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)prefsChanged
{
  int v19 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.Sharing", @"riClientEnabled", &v19);
  BOOL v4 = Int64 != 0;
  if (self->_clientEnabled != v4)
  {
    if (dword_100642860 <= 40)
    {
      uint64_t v5 = Int64;
      if (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 40LL))
      {
        v6 = "yes";
        if (v5) {
          id v7 = "no";
        }
        else {
          id v7 = "yes";
        }
        if (!v5) {
          v6 = "no";
        }
        LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent prefsChanged]",  40LL,  "Client enabled: %s -> %s\n",  v7,  v6);
      }
    }

    self->_clientEnabled = v4;
  }

  int v8 = CFPrefs_GetInt64(@"com.apple.Sharing", @"riCloudPairedOnly", &v19) != 0;
  if (v19) {
    int v8 = _os_feature_enabled_impl("Sharing", "muck") ^ 1;
  }
  if (self->_cloudPairedOnly != v8)
  {
    if (dword_100642860 <= 40
      && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 40LL)))
    {
      v9 = "yes";
      if (v8) {
        id v10 = "no";
      }
      else {
        id v10 = "yes";
      }
      if (!v8) {
        v9 = "no";
      }
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent prefsChanged]",  40LL,  "Cloud paired only: %s -> %s\n",  v10,  v9);
    }

    self->_cloudPairedOnly = v8;
  }

  uint64_t v11 = CFPrefs_GetInt64(@"com.apple.Sharing", @"riServerEnabled", &v19);
  if (v19) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  BOOL v13 = !v12;
  if (self->_serverEnabled != v13)
  {
    if (dword_100642860 <= 40
      && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 40LL)))
    {
      v14 = "yes";
      if (v13) {
        uint64_t v15 = "no";
      }
      else {
        uint64_t v15 = "yes";
      }
      if (!v13) {
        v14 = "no";
      }
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent prefsChanged]",  40LL,  "Server enabled: %s -> %s\n",  v15,  v14);
    }

    self->_serverEnabled = v13;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  id v17 = [v16 bleProximityRSSIThreshold:@"kb"];

  int64_t rssiThreshold = self->_rssiThreshold;
  if (v17 != (id)rssiThreshold)
  {
    if (dword_100642860 <= 40)
    {
      if (dword_100642860 == -1)
      {
        int64_t rssiThreshold = self->_rssiThreshold;
      }

      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent prefsChanged]",  40LL,  "RSSI threshold: %ld -> %ld\n",  rssiThreshold,  v17);
    }

- (void)setPreventNotifications:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10009ABA0;
  v4[3] = &unk_1005CC3A8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_update
{
  if (self->_serverEnabled) {
    -[SDRemoteInteractionAgent _serverEnsureStarted](self, "_serverEnsureStarted");
  }
  else {
    -[SDRemoteInteractionAgent _serverEnsureStopped](self, "_serverEnsureStopped");
  }
  if (-[SDRemoteInteractionAgent _clientShouldStart](self, "_clientShouldStart")) {
    -[SDRemoteInteractionAgent _clientEnsureStarted](self, "_clientEnsureStarted");
  }
  else {
    -[SDRemoteInteractionAgent _clientEnsureStopped](self, "_clientEnsureStopped");
  }
}

- (void)_commonEnsureStarted
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  BOOL v4 = (void *)v3;
  if (!self->_idsMonitorInstalled)
  {
    v6 = (void *)v3;
    if (dword_100642860 <= 30)
    {
      if (dword_100642860 != -1 || (v5 = _LogCategory_Initialize(&dword_100642860, 30LL), BOOL v4 = v6, v5))
      {
        LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _commonEnsureStarted]",  30LL,  "Subscribing to IDS notifications\n");
        BOOL v4 = v6;
      }
    }

    [v4 addObserver:self selector:"_commonIDSChanged:" name:@"SDNotificationNameIDSAccountsChanged" object:0];
    [v6 addObserver:self selector:"_commonIDSChanged:" name:@"SDNotificationNameIDSDevicesChanged" object:0];
    BOOL v4 = v6;
    self->_idsMonitorInstalled = 1;
  }

  if (!self->_rapportMonitorInstalled)
  {
    id v7 = v4;
    [v4 addObserver:self selector:"_commonRapportChanged:" name:off_100643AF8 object:0];
    BOOL v4 = v7;
    self->_rapportMonitorInstalled = 1;
  }
}

- (void)_commonEnsureStopped
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  int v5 = v3;
  if (self->_idsMonitorInstalled)
  {
    if (dword_100642860 <= 30)
    {
      if (dword_100642860 != -1 || (v4 = _LogCategory_Initialize(&dword_100642860, 30LL), uint64_t v3 = v5, v4))
      {
        LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _commonEnsureStopped]",  30LL,  "Unsubscribing to IDS notifications\n");
        uint64_t v3 = v5;
      }
    }

    [v3 removeObserver:self name:@"SDNotificationNameIDSAccountsChanged" object:0];
    [v5 removeObserver:self name:@"SDNotificationNameIDSDevicesChanged" object:0];
    uint64_t v3 = v5;
    self->_idsMonitorInstalled = 0;
  }

  if (self->_rapportMonitorInstalled)
  {
    [v3 removeObserver:self name:off_100643AF8 object:0];
    uint64_t v3 = v5;
    self->_rapportMonitorInstalled = 0;
  }
}

- (void)_commonIDSChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009AFA8;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_commonRapportChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009B06C;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_serverEnsureStarted
{
  if (!self->_bleWPNearby)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SFBLEClient sharedClient](&OBJC_CLASS___SFBLEClient, "sharedClient"));
    id v4 = (WPNearby *)objc_claimAutoreleasedReturnValue([v3 addNearbyDelegate:self]);
    bleWPNearby = self->_bleWPNearby;
    self->_bleWPNearby = v4;
  }

  if (!self->_controlService)
  {
    if (dword_100642860 <= 30
      && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL)))
    {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _serverEnsureStarted]",  30LL,  "Control service activate\n");
    }

    v6 = objc_alloc_init(&OBJC_CLASS___SFService);
    controlService = self->_controlService;
    self->_controlService = v6;

    -[SFService setIdentifier:](self->_controlService, "setIdentifier:", SFServiceIdentifierControl);
    -[SFService setSessionFlags:]( self->_controlService,  "setSessionFlags:",  -[SFService sessionFlags](self->_controlService, "sessionFlags") | 0x100);
    -[SFService setReceivedObjectHandler:](self->_controlService, "setReceivedObjectHandler:", &stru_1005CD120);
    -[SFService setReceivedRequestHandler:](self->_controlService, "setReceivedRequestHandler:", &stru_1005CD160);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10009B2D0;
    v10[3] = &unk_1005CD188;
    v10[4] = self;
    -[SFService setEventMessageHandler:](self->_controlService, "setEventMessageHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10009B2DC;
    v9[3] = &unk_1005CBAD0;
    v9[4] = self;
    -[SFService setRequestMessageHandler:](self->_controlService, "setRequestMessageHandler:", v9);
    -[SFService activateWithCompletion:](self->_controlService, "activateWithCompletion:", &stru_1005CD1A8);
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[SDSharedRemoteTextInputClient sharedClient]( &OBJC_CLASS___SDSharedRemoteTextInputClient,  "sharedClient"));
  [v8 addDelegate:self];
}

- (void)_serverEnsureStopped
{
  aggressiveTimer = self->_aggressiveTimer;
  if (aggressiveTimer)
  {
    id v4 = aggressiveTimer;
    dispatch_source_cancel(v4);
    int v5 = self->_aggressiveTimer;
    self->_aggressiveTimer = 0LL;
  }

  rtiTimer = self->_rtiTimer;
  if (rtiTimer)
  {
    id v7 = rtiTimer;
    dispatch_source_cancel(v7);
    int v8 = self->_rtiTimer;
    self->_rtiTimer = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SFBLEClient sharedClient](&OBJC_CLASS___SFBLEClient, "sharedClient"));
  [v9 removeNearbyDelegate:self];

  bleWPNearby = self->_bleWPNearby;
  self->_bleWPNearby = 0LL;

  currentSessionID = self->_currentSessionID;
  self->_currentSessionID = 0LL;

  currentText = self->_currentText;
  self->_currentText = 0LL;

  -[SFService invalidate](self->_controlService, "invalidate");
  controlService = self->_controlService;
  self->_controlService = 0LL;

  id v14 = (id)objc_claimAutoreleasedReturnValue(+[SDSharedRemoteTextInputClient sharedClient](&OBJC_CLASS___SDSharedRemoteTextInputClient, "sharedClient"));
  [v14 removeDelegate:self];
}

- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[NSMutableSet containsObject:](self->_legacy_sessionDeviceIDs, "containsObject:", v6))
  {
    if (dword_100642860 <= 30
      && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL)))
    {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent nearby:didDisconnectFromPeer:error:]",  30LL,  "Remove %@ on disconnect\n",  v6);
    }

    -[NSMutableSet removeObject:](self->_legacy_sessionDeviceIDs, "removeObject:", v6);
  }
}

- (void)_legacy_serverHandleEvent:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peerDevice]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  unsigned int v24 = 0;
  if (!v6)
  {
    unsigned int v24 = -6708;
    id v10 = "### Ignoring event from peer with no identifier\n";
    goto LABEL_7;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsBluetoothDeviceIDsForSharing]);
  unsigned __int8 v9 = [v8 containsObject:v6];

  if ((v9 & 1) == 0 && (self->_cloudPairedOnly || [v5 systemPairState] <= 0x13))
  {
    unsigned int v24 = -6708;
    unint64_t v23 = (unint64_t)v5;
    id v10 = "### Ignoring event from unpaired peer %@\n";
LABEL_7:
    uint64_t v11 = 50LL;
    goto LABEL_21;
  }

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v4 headerFields]);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue(v12, @"rp", TypeID, 0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  if (v15)
  {
    if (dword_100642860 <= 30
      && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL)))
    {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _legacy_serverHandleEvent:]",  30LL,  "Received event has RTI payload");
    }

    int v19 = (void *)objc_claimAutoreleasedReturnValue( +[SDSharedRemoteTextInputClient sharedClient]( &OBJC_CLASS___SDSharedRemoteTextInputClient,  "sharedClient"));
    [v19 handleTextInputData:v15];

    goto LABEL_25;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 headerFields]);
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v16, @"o", 0LL, 255LL, &v24);

  uint64_t v18 = v24;
  if (!v24)
  {
    if (Int64Ranged == 10)
    {
      if (dword_100642860 <= 30
        && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL)))
      {
        LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _legacy_serverHandleEvent:]",  30LL,  "Received start session %@ from %@\n",  self->_currentSessionID,  v6);
      }

      if (self->_currentSessionID)
      {
        legacy_sessionDeviceIDs = self->_legacy_sessionDeviceIDs;
        if (!legacy_sessionDeviceIDs)
        {
          __int128 v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          __int128 v22 = self->_legacy_sessionDeviceIDs;
          self->_legacy_sessionDeviceIDs = v21;

          legacy_sessionDeviceIDs = self->_legacy_sessionDeviceIDs;
        }

        -[NSMutableSet addObject:](legacy_sessionDeviceIDs, "addObject:", v6);
        -[SDRemoteInteractionAgent _serverSendTextSessionDidBegin:](self, "_serverSendTextSessionDidBegin:", v6);
      }

      goto LABEL_25;
    }

    unint64_t v23 = Int64Ranged;
    id v10 = "### Unknown event opcode: %d\n";
    uint64_t v11 = 40LL;
LABEL_21:
    LogPrintF(&dword_100642860, "-[SDRemoteInteractionAgent _legacy_serverHandleEvent:]", v11, v10, v23);
    goto LABEL_25;
  }

  if (dword_100642860 <= 60)
  {
    if (dword_100642860 == -1)
    {
      uint64_t v18 = v24;
    }

    LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _legacy_serverHandleEvent:]",  60LL,  "### Bad event opcode: %#m\n",  v18);
  }

- (void)_legacy_serverHandleRequest:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peerDevice]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  int v12 = 0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsBluetoothDeviceIDsForSharing]);
  unsigned __int8 v9 = [v8 containsObject:v6];

  if ((v9 & 1) == 0 && (self->_cloudPairedOnly || [v5 systemPairState] <= 0x13))
  {
    if (dword_100642860 <= 50
      && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 50LL)))
    {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _legacy_serverHandleRequest:]",  50LL,  "### Ignoring request from unpaired peer %@\n",  v5);
    }
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 headerFields]);
    char Int64Ranged = CFDictionaryGetInt64Ranged(v10, @"o", 0LL, 255LL, &v12);

    if (v12)
    {
      if (dword_100642860 <= 60
        && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 60LL)))
      {
        LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _legacy_serverHandleRequest:]",  60LL,  "### Bad request opcode: %#m\n");
      }
    }

    else if (Int64Ranged == 1)
    {
      -[SDRemoteInteractionAgent _legacy_serverRespondInfo:](self, "_legacy_serverRespondInfo:", v4);
    }

    else if (dword_100642860 <= 40 {
           && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 40LL)))
    }
    {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _legacy_serverHandleRequest:]",  40LL,  "### Unknown request opcode: %d\n");
    }
  }
}

- (void)_legacy_serverRespondInfo:(id)a3
{
  id v4 = a3;
  unsigned __int8 v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v5 = MGCopyAnswer(@"UserAssignedDeviceName", 0LL);
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (const __CFString *)v5;
  }
  else {
    id v7 = @"?";
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v7, @"name");
  id v8 = [[SFResponseMessage alloc] initWithRequestMessage:v4];

  [v8 setHeaderFields:v9];
  -[SFService sendResponse:](self->_controlService, "sendResponse:", v8);
}

- (void)_serverSendTextSessionDidBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDSharedRemoteTextInputClient sharedClient]( &OBJC_CLASS___SDSharedRemoteTextInputClient,  "sharedClient"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentPayload]);

  uint64_t v7 = SFRTIDataPayloadForData(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [[SFRemoteTextSessionInfo alloc] initWithRTIPayload:v8];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_currentSessionID, "UUIDString"));
  [v9 setIdentifier:v10];

  [v9 setText:self->_currentText];
  uint64_t v11 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v19[0] = @"o";
  v19[1] = @"tsi";
  v20[0] = &off_1005F77B0;
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 dictionaryRepresentation]);
  v20[1] = v12;
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
  id v14 = -[NSMutableDictionary initWithDictionary:](v11, "initWithDictionary:", v13);

  if (v6) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v6, @"rp");
  }
  id v15 = objc_alloc_init(&OBJC_CLASS___SFEventMessage);
  v16 = v15;
  if (v4)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v4));
    [v16 setDeviceIDs:v17];
  }

  else
  {
    [v15 setDeviceIDs:self->_legacy_sessionDeviceIDs];
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  [v16 setIdentifier:v18];

  [v16 setHeaderFields:v14];
  -[SFService sendEvent:](self->_controlService, "sendEvent:", v16);
}

- (void)_serverSendTextSessionDidEnd:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet count](self->_legacy_sessionDeviceIDs, "count"))
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___SFRemoteTextSessionInfo);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
    [v5 setIdentifier:v6];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SDSharedRemoteTextInputClient sharedClient]( &OBJC_CLASS___SDSharedRemoteTextInputClient,  "sharedClient"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 currentPayload]);

    id v9 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    v15[0] = @"o";
    v15[1] = @"tsi";
    v16[0] = &off_1005F77C8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionaryRepresentation]);
    v16[1] = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
    int v12 = -[NSMutableDictionary initWithDictionary:](v9, "initWithDictionary:", v11);

    if (v8) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v8, @"rp");
    }
    id v13 = objc_alloc_init(&OBJC_CLASS___SFEventMessage);
    [v13 setDeviceIDs:self->_legacy_sessionDeviceIDs];
    [v13 setHeaderFields:v12];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    [v13 setIdentifier:v14];

    -[SFService sendEvent:](self->_controlService, "sendEvent:", v13);
  }
}

- (void)_sendRTIPayload:(id)a3
{
  id v18 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v18)
  {
    uint64_t v5 = SFRTIDataPayloadForData(v18);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v18, @"rp");
      uint64_t v8 = SFFullTextFromRTIDataPayload(v7);
      uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
      id v10 = (void *)v9;
      if (v9) {
        uint64_t v11 = (__CFString *)v9;
      }
      else {
        uint64_t v11 = &stru_1005E3958;
      }
      int v12 = v11;

      objc_storeStrong((id *)&self->_currentText, v11);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  &off_1005F77E0,  @"o");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, @"t");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v18, @"rp");
      id v13 = [[SFRemoteTextSessionInfo alloc] initWithRTIPayload:v7];
      id v14 = v13;
      if (v13)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionaryRepresentation]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v15, @"tsi");
      }

      if (dword_100642860 <= 30
        && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL)))
      {
        LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _sendRTIPayload:]",  30LL,  "Sending RTI payloads to peers (%u)\n",  -[NSMutableSet count](self->_legacy_sessionDeviceIDs, "count"));
      }

      id v16 = objc_alloc_init(&OBJC_CLASS___SFEventMessage);
      [v16 setDeviceIDs:self->_legacy_sessionDeviceIDs];
      [v16 setHeaderFields:v4];
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      [v16 setIdentifier:v17];

      -[SFService sendEvent:](self->_controlService, "sendEvent:", v16);
    }

    else if (dword_100642860 <= 60 {
           && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 60LL)))
    }
    {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _sendRTIPayload:]",  60LL,  "### Failed to deserialize payload?");
    }
  }

  else if (dword_100642860 <= 60 {
         && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 60LL)))
  }
  {
    LogPrintF(&dword_100642860, "-[SDRemoteInteractionAgent _sendRTIPayload:]", 60LL, "### Send payload without data?");
  }
}

- (void)handleEventWithData:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (dword_100642860 <= 30)
  {
    if (dword_100642860 != -1 || (v7 = _LogCategory_Initialize(&dword_100642860, 30LL), id v4 = v8, v7))
    {
      uint64_t v5 = SFTextInputDataLogString(v4);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent handleEventWithData:]",  30LL,  "RTI Client event fired (%@)\n",  v6);

      id v4 = v8;
    }
  }

  -[SDRemoteInteractionAgent _sendRTIPayload:](self, "_sendRTIPayload:", v4);
}

- (void)handleInputDidBeginWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  id v5 = a4;
  if (dword_100642860 <= 30 && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL))) {
    LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent handleInputDidBeginWithFlags:sessionInfo:]",  30LL,  "RTI did BEGIN");
  }
  -[SFService setAdvertiseRate:](self->_controlService, "setAdvertiseRate:", 50LL);
  -[SFService setNeedsKeyboard:](self->_controlService, "setNeedsKeyboard:", 1LL);
  uint64_t v6 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  currentSessionID = self->_currentSessionID;
  self->_currentSessionID = v6;

  -[SDRemoteInteractionAgent advertisingTimerStart](self, "advertisingTimerStart");
  aggressiveTimer = self->_aggressiveTimer;
  if (aggressiveTimer)
  {
    uint64_t v9 = aggressiveTimer;
    dispatch_source_cancel(v9);
    id v10 = self->_aggressiveTimer;
    self->_aggressiveTimer = 0LL;
  }

  uint64_t v11 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  int v12 = self->_aggressiveTimer;
  self->_aggressiveTimer = v11;

  id v13 = self->_aggressiveTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10009C47C;
  handler[3] = &unk_1005CB2F8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v13, handler);
  id v14 = self->_aggressiveTimer;
  dispatch_time_t v15 = dispatch_time(0LL, 4000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)self->_aggressiveTimer);
}

- (void)handleInputDidEndWithFlags:(unint64_t)a3 sessionInfo:(id)a4
{
  id v9 = a4;
  if (dword_100642860 <= 30)
  {
    if (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL)) {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent handleInputDidEndWithFlags:sessionInfo:]",  30LL,  "RTI did END");
    }
    if (dword_100642860 <= 30
      && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL)))
    {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent handleInputDidEndWithFlags:sessionInfo:]",  30LL,  "Stopping advertising timer\n");
    }
  }

  rtiTimer = self->_rtiTimer;
  if (rtiTimer)
  {
    uint64_t v6 = rtiTimer;
    dispatch_source_cancel(v6);
    int v7 = self->_rtiTimer;
    self->_rtiTimer = 0LL;
  }

  -[SFService setNeedsKeyboard:](self->_controlService, "setNeedsKeyboard:", 0LL);
  -[SDRemoteInteractionAgent _serverSendTextSessionDidEnd:]( self,  "_serverSendTextSessionDidEnd:",  self->_currentSessionID);
  currentSessionID = self->_currentSessionID;
  self->_currentSessionID = 0LL;
}

- (void)advertisingTimerFired
{
  rtiTimer = self->_rtiTimer;
  if (rtiTimer)
  {
    id v4 = rtiTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_rtiTimer;
    self->_rtiTimer = 0LL;
  }

  if (dword_100642860 <= 30 && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL))) {
    LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent advertisingTimerFired]",  30LL,  "Advertising timer fired, simulating end event\n");
  }
  -[SDRemoteInteractionAgent handleInputDidEndWithFlags:sessionInfo:]( self,  "handleInputDidEndWithFlags:sessionInfo:",  0LL,  0LL);
  SFMetricsLog(@"com.apple.sharing.ContinuityKeyboardRTI", &off_1005F9950);
}

- (void)advertisingTimerStart
{
  if (dword_100642860 <= 30 && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL))) {
    LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent advertisingTimerStart]",  30LL,  "Starting advertising timer\n");
  }
  rtiTimer = self->_rtiTimer;
  if (rtiTimer)
  {
    id v4 = rtiTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_rtiTimer;
    self->_rtiTimer = 0LL;
  }

  uint64_t v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  int v7 = self->_rtiTimer;
  self->_rtiTimer = v6;

  id v8 = self->_rtiTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10009C7C4;
  handler[3] = &unk_1005CB2F8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
  id v9 = self->_rtiTimer;
  dispatch_time_t v10 = dispatch_time(0LL, 3600000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)self->_rtiTimer);
}

- (int)sessionStart:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0LL;
  __int128 v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  __int128 v22 = sub_10009C9B8;
  unint64_t v23 = sub_10009C9E0;
  id v24 = 0LL;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 peerDevice]);

  if (v5)
  {
    [v4 setDispatchQueue:self->_dispatchQueue];
    [v4 setAgent:self];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteTextEventHandler]);

    if (v6)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 remoteTextEventHandler]);
      id v8 = (void *)v20[5];
      v20[5] = v7;
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    void v15[2] = sub_10009C9E8;
    v15[3] = &unk_1005CD1D0;
    id v18 = &v19;
    id v9 = v4;
    id v16 = v9;
    id v17 = self;
    [v9 setRemoteTextEventHandler:v15];

    sessions = self->_sessions;
    if (!sessions)
    {
      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      int v12 = self->_sessions;
      self->_sessions = v11;

      sessions = self->_sessions;
    }

    -[NSMutableSet addObject:](sessions, "addObject:", v9);
    [v9 activateWithCompletion:0];
    -[SDRemoteInteractionAgent _update](self, "_update");
    int v13 = 0;
  }

  else
  {
    int v13 = -6705;
  }

  _Block_object_dispose(&v19, 8);

  return v13;
}

- (void)sessionStop:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableSet removeObject:](self->_sessions, "removeObject:", v4);
  -[SDRemoteInteractionAgent _update](self, "_update");
}

- (void)_clientEnsureStarted
{
  if (self->_deviceDiscovery)
  {
    if (self->_cloudPairedOnly)
    {
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 idsBluetoothDeviceIDsForSharing]);
    }

    else
    {
      id v4 = 0LL;
    }

    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SFDeviceDiscovery deviceFilter](self->_deviceDiscovery, "deviceFilter"));
    id v6 = v4;
    uint64_t v7 = v6;
    if (v5 == v6)
    {
    }

    else
    {
      if ((v6 != 0LL) != (v5 == 0LL))
      {
        unsigned __int8 v8 = [v5 isEqual:v6];

        if ((v8 & 1) != 0) {
          goto LABEL_15;
        }
      }

      else
      {
      }

      -[SFDeviceDiscovery setDeviceFilter:](self->_deviceDiscovery, "setDeviceFilter:", v7);
    }

- (void)_clientEnsureStopped
{
  sessions = self->_sessions;
  self->_sessions = 0LL;

  if (self->_deviceDiscovery)
  {
    if (dword_100642860 <= 30
      && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL)))
    {
      LogPrintF(&dword_100642860, "-[SDRemoteInteractionAgent _clientEnsureStopped]", 30LL, "Discovery stop\n");
    }

    -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0LL;

    -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
    devices = self->_devices;
    self->_devices = 0LL;
  }

  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    -[RPCompanionLinkClient invalidate](clinkClient, "invalidate");
    uint64_t v7 = self->_clinkClient;
    self->_clinkClient = 0LL;
  }

- (void)_clientClinkDeviceFound:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100642860 <= 30
    && ((v6 = v3, dword_100642860 != -1) || (v5 = _LogCategory_Initialize(&dword_100642860, 30LL), id v4 = v6, v5)))
  {
    LogPrintF(&dword_100642860, "-[SDRemoteInteractionAgent _clientClinkDeviceFound:]", 30LL, "Clink Found: %@\n", v4);
  }

  else
  {
  }

- (void)_clientClinkDeviceLost:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100642860 <= 30
    && ((v6 = v3, dword_100642860 != -1) || (v5 = _LogCategory_Initialize(&dword_100642860, 30LL), id v4 = v6, v5)))
  {
    LogPrintF(&dword_100642860, "-[SDRemoteInteractionAgent _clientClinkDeviceLost:]", 30LL, "Clink Lost: %@\n", v4);
  }

  else
  {
  }

- (void)_clientClinkDeviceChanged:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100642860 <= 30
    && ((v6 = v3, dword_100642860 != -1) || (v5 = _LogCategory_Initialize(&dword_100642860, 30LL), id v4 = v6, v5)))
  {
    LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _clientClinkDeviceChanged:]",  30LL,  "Clink Changed: %@\n",  v4);
  }

  else
  {
  }

- (void)_clientDeviceFound:(id)a3
{
  id v22 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v22 bleDevice]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v22 identifier]);
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v22 idsIdentifier]);
  uint64_t v7 = (void *)v6;
  if (self->_deviceDiscovery) {
    BOOL v8 = v5 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    goto LABEL_35;
  }
  if (self->_cloudPairedOnly)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
    dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 idsBluetoothDeviceIDsForSharing]);
    uint64_t v11 = v10;
    int v12 = v5;
  }

  else
  {
    if (!v6) {
      goto LABEL_15;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
    dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 idsDeviceIDsForRIServers]);
    uint64_t v11 = v10;
    int v12 = v7;
  }

  unsigned __int8 v13 = [v10 containsObject:v12];

  if ((v13 & 1) != 0) {
    goto LABEL_16;
  }
  if (self->_cloudPairedOnly)
  {
LABEL_11:
    if (dword_100642860 <= 9 && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 9LL))) {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _clientDeviceFound:]",  9LL,  "### Ignoring unpaired device %@\n",  v4);
    }
    goto LABEL_35;
  }

- (void)_clientDeviceLost:(id)a3
{
  id v8 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v8 identifier]);
  int v5 = (void *)v4;
  if (self->_deviceDiscovery) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));

    if (v7)
    {
      if (dword_100642860 <= 50
        && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 50LL)))
      {
        LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _clientDeviceLost:]",  50LL,  "Device NeedsKeyboard lost: %@\n",  v8);
      }

      -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v5);
      -[SDRemoteInteractionAgent clientNotificationRemoveForDevice:](self, "clientNotificationRemoveForDevice:", v8);
    }
  }
}

- (void)_clientDeviceLockStatusChanged
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009DA78;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)_clientShouldStart
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 idsDeviceIDsForRIServers]);
    unint64_t v6 = (unint64_t)[v5 count];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 idsBluetoothDeviceIDsForWatches]);
    unint64_t v8 = (unint64_t)[v7 count];

    BOOL v9 = self->_clientEnabled || -[NSMutableSet count](self->_sessions, "count") != 0LL;
    if (v6 | v8) {
      BOOL v10 = v9;
    }
    else {
      BOOL v10 = 0;
    }
    if (dword_100642860 <= 30
      && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL)))
    {
      uint64_t v11 = "no";
      if (v10) {
        int v12 = "yes";
      }
      else {
        int v12 = "no";
      }
      if (v6) {
        unsigned __int8 v13 = "yes";
      }
      else {
        unsigned __int8 v13 = "no";
      }
      if (v8) {
        uint64_t v14 = "yes";
      }
      else {
        uint64_t v14 = "no";
      }
      if (v9) {
        uint64_t v11 = "yes";
      }
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _clientShouldStart]",  30LL,  "Client should start %s: tvs: %s, watches: %s, enabled: %s\n",  v12,  v13,  v14,  v11);
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)_rpCompanionLinkDeviceForSFDevice:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 idsIdentifier]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaRouteID]);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    id v22 = v4;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 idsDeviceIdentifier]);
        unsigned __int8 v14 = [v13 isEqualToString:v6];

        if ((v14 & 1) != 0) {
          goto LABEL_20;
        }
        dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaRouteIdentifier]);
        unsigned __int8 v16 = [v15 isEqualToString:v7];

        if ((v16 & 1) != 0) {
          goto LABEL_20;
        }
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
        if ([v17 isEqualToString:v5])
        {
          unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 model]);
          unsigned int v19 = [v18 isEqualToString:v23];

          if (v19)
          {
            if (dword_100642860 <= 90
              && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 90LL)))
            {
              LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent _rpCompanionLinkDeviceForSFDevice:]",  90LL,  "### No IDS or route identifier match between %@ and %@ \n",  v22,  v12);
            }

- (void)clientNotificationPostIfNeededForDevice:(id)a3
{
  id v23 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v23 model]);
  int v5 = v4;
  if (v4)
  {
    if (![v4 hasPrefix:@"AppleTV"])
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
      unsigned int v8 = [v7 isDeviceValidRIServer:v5];

      if (v8)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
        uint64_t v10 = SFDeviceToRPCompanionLinkDevice(v23, v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        BOOL v12 = v11 != 0LL;

        -[SDNotificationManager riServerPostIfNeeded:backgroundAction:]( self->_notificationManager,  "riServerPostIfNeeded:backgroundAction:",  v23,  v12);
      }

      else if ([v5 hasPrefix:@"Watch"])
      {
        -[SDNotificationManager watchKeyboardPostIfNeeded:]( self->_notificationManager,  "watchKeyboardPostIfNeeded:",  v23);
      }

      else if (dword_100642860 <= 60 {
             && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 60LL)))
      }
      {
        LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent clientNotificationPostIfNeededForDevice:]",  60LL,  "### Unrecognized device model: %@\n",  v5);
      }

      goto LABEL_40;
    }

    if ([v23 deviceActionType] == 19)
    {
      if (dword_100642860 <= 90
        && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 90LL)))
      {
        unint64_t v6 = "### Ignoring remote auto fill action type\n";
LABEL_10:
        LogPrintF(&dword_100642860, "-[SDRemoteInteractionAgent clientNotificationPostIfNeededForDevice:]", 90LL, v6);
        goto LABEL_40;
      }

      goto LABEL_40;
    }

    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
    uint64_t v14 = SFDeviceToRPCompanionLinkDevice(v23, v13);
    dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v15
      || (dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[SDRemoteInteractionAgent _rpCompanionLinkDeviceForSFDevice:]( self,  "_rpCompanionLinkDeviceForSFDevice:",  v23))) != 0LL)
    {
      if ((objc_opt_respondsToSelector(v15, "activeUserAltDSID") & 1) == 0)
      {
LABEL_39:

        goto LABEL_40;
      }

      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 activeUserAltDSID]);
      id v17 = objc_alloc_init(off_1006428D0());
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "aa_primaryAppleAccount"));
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "aa_altDSID"));
      if ([v19 isEqualToString:v16])
      {
        -[SDNotificationManager riServerPostIfNeeded:backgroundAction:]( self->_notificationManager,  "riServerPostIfNeeded:backgroundAction:",  v23,  1LL);
      }

      else if (dword_100642860 <= 30 {
             && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 30LL)))
      }
      {
        LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent clientNotificationPostIfNeededForDevice:]",  30LL,  "### Ignoring posting the notification since active user profiles do not match \n");
      }
    }

    else
    {
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 idsBluetoothDeviceIDsForSharing]);
      unsigned int v22 = [v21 containsObject:v16];

      if (v22) {
        -[SDNotificationManager riServerPostIfNeeded:backgroundAction:]( self->_notificationManager,  "riServerPostIfNeeded:backgroundAction:",  v23,  0LL);
      }
      dispatch_time_t v15 = 0LL;
    }

    goto LABEL_39;
  }

  if (dword_100642860 <= 90 && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 90LL)))
  {
    unint64_t v6 = "### Cannot post notification without device model\n";
    goto LABEL_10;
  }

- (void)clientNotificationRemoveForDevice:(id)a3
{
  id v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 model]);
  int v5 = v4;
  if (v4)
  {
    if (([v4 hasPrefix:@"AppleTV"] & 1) != 0
      || (unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent")),
          unsigned int v7 = [v6 isDeviceValidRIServer:v5],
          v6,
          v7))
    {
      -[SDNotificationManager riServerRemove:](self->_notificationManager, "riServerRemove:", v8);
    }

    else if ([v5 hasPrefix:@"Watch"])
    {
      -[SDNotificationManager watchKeyboardRemove:](self->_notificationManager, "watchKeyboardRemove:", v8);
    }

    else if (dword_100642860 <= 60 {
           && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 60LL)))
    }
    {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent clientNotificationRemoveForDevice:]",  60LL,  "### Unrecognized device model: %@\n",  v5);
    }
  }

  else if (dword_100642860 <= 60 {
         && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 60LL)))
  }
  {
    LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent clientNotificationRemoveForDevice:]",  60LL,  "### Cannot remove notification without device model\n");
  }
}

- (void)clientNotificationUpdateForDevice:(id)a3 rtiData:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v11 model]);
  id v8 = v7;
  if (v7)
  {
    if (([v7 hasPrefix:@"AppleTV"] & 1) != 0
      || (id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent")),
          unsigned int v10 = [v9 isDeviceValidRIServer:v8],
          v9,
          v10))
    {
      -[SDNotificationManager riServerUpdate:rtiData:](self->_notificationManager, "riServerUpdate:rtiData:", v11, v6);
    }

    else if ([v8 hasPrefix:@"Watch"])
    {
      -[SDNotificationManager watchKeyboardUpdate:rtiData:]( self->_notificationManager,  "watchKeyboardUpdate:rtiData:",  v11,  v6);
    }

    else if (dword_100642860 <= 60 {
           && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 60LL)))
    }
    {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent clientNotificationUpdateForDevice:rtiData:]",  60LL,  "### Unrecognized device model: %@\n",  v8);
    }
  }

  else if (dword_100642860 <= 60 {
         && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 60LL)))
  }
  {
    LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent clientNotificationUpdateForDevice:rtiData:]",  60LL,  "### Cannot update notification without device model\n");
  }
}

- (void)clientNotificationUpdateForDevice:(id)a3 info:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v11 model]);
  id v8 = v7;
  if (v7)
  {
    if (([v7 hasPrefix:@"AppleTV"] & 1) != 0
      || (id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent")),
          unsigned int v10 = [v9 isDeviceValidRIServer:v8],
          v9,
          v10))
    {
      -[SDNotificationManager riServerUpdate:info:](self->_notificationManager, "riServerUpdate:info:", v11, v6);
    }

    else if ([v8 hasPrefix:@"Watch"])
    {
      -[SDNotificationManager watchKeyboardUpdate:info:]( self->_notificationManager,  "watchKeyboardUpdate:info:",  v11,  v6);
    }

    else if (dword_100642860 <= 60 {
           && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 60LL)))
    }
    {
      LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent clientNotificationUpdateForDevice:info:]",  60LL,  "### Unrecognized device model: %@\n",  v8);
    }
  }

  else if (dword_100642860 <= 60 {
         && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 60LL)))
  }
  {
    LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent clientNotificationUpdateForDevice:info:]",  60LL,  "### Cannot update notification without device model\n");
  }
}

- (void)clientTextSessionDidBegin:(id)a3 device:(id)a4
{
}

- (void)clientUserDidTapNotification:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100642860 <= 90
    && ((v6 = v3, dword_100642860 != -1) || (v5 = _LogCategory_Initialize(&dword_100642860, 90LL), id v4 = v6, v5)))
  {
    LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent clientUserDidTapNotification:]",  90LL,  "### Launching TV Remote not supported on current platform\n");
  }

  else
  {
  }

- (void)testKeyboardPost:(id)a3
{
  id v6 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  int v5 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v4, "setIdentifier:", v5);

  -[SDNotificationManager riServerPostIfNeeded:backgroundAction:]( self->_notificationManager,  "riServerPostIfNeeded:backgroundAction:",  v4,  0LL);
}

- (void)testKeyboardPostThenUpdate
{
  if (dword_100642860 <= 50 && (dword_100642860 != -1 || _LogCategory_Initialize(&dword_100642860, 50LL))) {
    LogPrintF( &dword_100642860,  "-[SDRemoteInteractionAgent testKeyboardPostThenUpdate]",  50LL,  "Testing keyboard post then update\n");
  }
  id v4 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  id v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v4, "setIdentifier:", v3);

  -[SFDevice setName:](v4, "setName:", @"postAndUpdate");
  -[SDNotificationManager riServerPostIfNeeded:backgroundAction:]( self->_notificationManager,  "riServerPostIfNeeded:backgroundAction:",  v4,  0LL);
}

- (void)testKeyboardPostWithDelay
{
}

- (void)testKeyboardRemove
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  id v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v4, "setIdentifier:", v3);

  -[SDNotificationManager riServerRemove:](self->_notificationManager, "riServerRemove:", v4);
}

- (void)testKeyboardRemoveWithDelay
{
}

- (void)testKeyboardUpdate
{
  int v5 = objc_alloc_init(&OBJC_CLASS___SFDevice);
  id v3 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"00000000-0000-0000-0000-000000000000");
  -[SFDevice setIdentifier:](v5, "setIdentifier:", v3);

  id v4 = objc_alloc_init(&OBJC_CLASS___SFRemoteTextSessionInfo);
  [v4 setTitle:@"Continuity Keyboard"];
  -[SDNotificationManager riServerUpdate:info:](self->_notificationManager, "riServerUpdate:info:", v5, v4);
}

- (void)testKeyboardUpdateWithDelay
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)preventNotifications
{
  return self->_preventNotifications;
}

- (void).cxx_destruct
{
}

@end