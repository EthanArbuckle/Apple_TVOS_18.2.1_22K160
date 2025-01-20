@interface SDProxHandoffAgent
+ (id)sharedAgent;
- (BOOL)_bleActionDiscoveryShouldStart;
- (BOOL)_bleInfoDiscoveryShouldStart;
- (BOOL)_clinkShouldStart;
- (BOOL)_combinedDeviceIsSuppressed:(id)a3;
- (BOOL)_expectingContentForDeviceID:(id)a3;
- (BOOL)_motionShouldStart;
- (BOOL)_runStateVerify:(int)a3 device:(id)a4;
- (BOOL)_serviceShouldStart;
- (BOOL)_shouldMediumPromptWithInfo:(id)a3;
- (BOOL)_systemCanTrigger;
- (BOOL)_throttleEventsReachedMax;
- (BOOL)_throttleMediumAllowsTrigger;
- (BOOL)callTransferShouldPush:(id)a3;
- (BOOL)preventNotifications;
- (OS_dispatch_queue)dispatchQueue;
- (SDProxHandoffAgent)init;
- (id)_bleUpdateMappingWithDevice:(id)a3;
- (id)_combinedDeviceForUIID:(id)a3;
- (id)_combinedDevicePending;
- (id)_routeForDevice:(id)a3;
- (id)_routes;
- (id)callTransferInfoForDevice:(id)a3;
- (id)description;
- (id)displayNameForContact:(id)a3;
- (id)mediaTransferInfoFromInfo:(id)a3;
- (int)proximityClient:(id)a3 dismissContentForDevice:(id)a4;
- (int)proximityClient:(id)a3 provideContent:(id)a4 forDevice:(id)a5 force:(BOOL)a6;
- (int)proximityClient:(id)a3 stopSuppressingDevice:(id)a4;
- (int)proximityClient:(id)a3 suppressDevice:(id)a4;
- (int)proximityClient:(id)a3 updateContent:(id)a4 forDevice:(id)a5;
- (int)proximityClientRequestScannerTimerReset:(id)a3;
- (int)proximityClientStart:(id)a3;
- (unint64_t)notificationHomePodTypeForDevice:(id)a3;
- (void)_bleActionDeviceChanged:(id)a3;
- (void)_bleActionDeviceFound:(id)a3;
- (void)_bleActionDeviceFoundCandidate:(id)a3;
- (void)_bleActionDeviceLost:(id)a3;
- (void)_bleActionDiscoveryEnsureStarted;
- (void)_bleActionDiscoveryEnsureStopped;
- (void)_bleActionScanTimerActivate;
- (void)_bleActionScanTimerFired;
- (void)_bleActionScanTimerInvalidate;
- (void)_bleDeviceNearbyEnter:(id)a3;
- (void)_bleDeviceNearbyExit:(id)a3;
- (void)_bleInfoDeviceChanged:(id)a3;
- (void)_bleInfoDeviceFound:(id)a3;
- (void)_bleInfoDeviceLost:(id)a3;
- (void)_bleInfoDiscoveryEnsureStarted;
- (void)_bleInfoDiscoveryEnsureStopped;
- (void)_bleUpdateMappingAndNearby;
- (void)_bleUpdateMappingAndNearbyCoalesced;
- (void)_bleUpdateMappingReset;
- (void)_clinkEnsureStarted;
- (void)_clinkEnsureStopped;
- (void)_clinkHandleRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_clinkHomePodHandleRequest:(id)a3 responseHandler:(id)a4;
- (void)_combinedDevicePrepareForCallTransferTrigger:(id)a3;
- (void)_commonCallCountChanged;
- (void)_commonEnsureStarted;
- (void)_commonEnsureStopped;
- (void)_commonScreenStateChanged;
- (void)_commonShouldAdvertiseChanged;
- (void)_invalidate;
- (void)_proxiedNotificationDidDismiss:(id)a3 reason:(int64_t)a4;
- (void)_proxiedNotificationWasTapped:(id)a3;
- (void)_proximityClientDeviceDidUnTrigger:(id)a3;
- (void)_proximityClientDeviceEnteredImmediate:(id)a3;
- (void)_proximityClientDeviceEnteredNearby:(id)a3;
- (void)_proximityClientDeviceExitedImmediate:(id)a3;
- (void)_proximityClientDeviceExitedNearby:(id)a3;
- (void)_proximityClientDeviceUpdated:(id)a3;
- (void)_proximityClientDeviceWasDismissed:(id)a3;
- (void)_proximityClientDeviceWasDismissed:(id)a3 reason:(int64_t)a4;
- (void)_proximityClientDeviceWasSelected:(id)a3;
- (void)_proximityClientDeviceWillTrigger:(id)a3;
- (void)_proximityClientSeedInitialDevices:(id)a3;
- (void)_proximityClientSeedWillTriggerDeviceIfNeeded:(id)a3;
- (void)_resetAllStates;
- (void)_run;
- (void)_runCallHandoffHandleDelayTimerFired;
- (void)_runCallHandoffHandleResponse:(id)a3 error:(id)a4;
- (void)_runCallHandoffStart:(id)a3;
- (void)_runCallHandoffStartDelayTimer;
- (void)_runNotificationDismissed;
- (void)_runNotificationPending;
- (void)_runNotificationPendingContent;
- (void)_runNotificationPresented;
- (void)_runNotificationReady;
- (void)_runTransferDone;
- (void)_runTransferInProgress;
- (void)_runTransferPending;
- (void)_runTransferPendingDismiss;
- (void)_runTransferReady;
- (void)_scheduleRunAfter:(double)a3;
- (void)_serviceEnsureStarted;
- (void)_serviceEnsureStopped;
- (void)_serviceTimeoutActivate;
- (void)_serviceTimeoutFired;
- (void)_serviceTimeoutInvalidate;
- (void)_throttleEventDidOccur;
- (void)_throttleEventSet:(unint64_t)a3;
- (void)_throttleEventsReset;
- (void)_throttleMediumReset;
- (void)_throttleMediumSetTicks:(unint64_t)a3;
- (void)_uiDismissWhenReady:(id)a3 reason:(int64_t)a4;
- (void)_uiStopIfNeeded:(id)a3 reason:(int64_t)a4;
- (void)_update;
- (void)_updateCandidateIsNearby;
- (void)activate;
- (void)commonSystemUIChanged;
- (void)invalidate;
- (void)notificationDidDismiss:(id)a3 reason:(int64_t)a4;
- (void)prefsChanged;
- (void)proximityClientStop:(id)a3;
- (void)proximityClientUpdate:(id)a3;
- (void)proximityDeviceDidTrigger:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setPreventNotifications:(BOOL)a3;
- (void)testUI:(id)a3;
- (void)userDidTapNotification:(id)a3;
@end

@implementation SDProxHandoffAgent

+ (id)sharedAgent
{
  if (qword_100656EA8 != -1) {
    dispatch_once(&qword_100656EA8, &stru_1005CC718);
  }
  return (id)qword_100656EB0;
}

- (SDProxHandoffAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SDProxHandoffAgent;
  v2 = -[SDProxHandoffAgent init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }

  return v2;
}

- (id)description
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"-- SDProxHandoffAgent --\n");
  if (self->_prefEnabled) {
    uint64_t v4 = "yes";
  }
  else {
    uint64_t v4 = "no";
  }
  if (self->_userOnCall) {
    v5 = "yes";
  }
  else {
    v5 = "no";
  }
  if (self->_clientShouldAdvertise) {
    v6 = "yes";
  }
  else {
    v6 = "no";
  }
  if (self->_candidateNearby) {
    objc_super v7 = "yes";
  }
  else {
    objc_super v7 = "no";
  }
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"Enabled: %s, On call: %s, client should advertise: %s, Candidate nearby: %s\n",  v4,  v5,  v6,  v7);
  clinkClient = self->_clinkClient;
  if (clinkClient)
  {
    v9 = clinkClient;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](v9, "activeDevices"));
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"CLinkClient (%ld devices): %@\n",  [v10 count],  v9);
  }

  if (self->_bleActionService) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"BLE Action Service: %@\n", self->_bleActionService);
  }
  if (-[NSMutableSet count](self->_proxClients, "count")) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"ProxClients: (%ld)\n",  -[NSMutableSet count](self->_proxClients, "count"));
  }
  bleActionDiscovery = self->_bleActionDiscovery;
  if (bleActionDiscovery)
  {
    id v12 = -[NSMutableDictionary count](self->_bleActionDevices, "count");
    if (self->_bleActionScanTimedOut) {
      v13 = @", TIMED OUT";
    }
    else {
      v13 = &stru_1005E3958;
    }
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"BLE NearbyAction Discovery: %@, %ld devices%@\n",  bleActionDiscovery,  v12,  v13);
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleActionDevices, "allValues"));
    id v15 = [v14 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v42;
      do
      {
        v18 = 0LL;
        do
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v14);
          }
          -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" - %@\n",  *(void *)(*((void *)&v41 + 1) + 8LL * (void)v18));
          v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }

      while (v16);
    }
  }

  if (self->_bleInfoDiscovery) {
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"BLE NearbyInfo Discovery: %@\n",  self->_bleInfoDiscovery);
  }
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"Mapped Devices (%ld), unmapped (%ld):\n",  -[NSMutableDictionary count](self->_mappedDevices, "count"),  -[NSMutableDictionary count](self->_bleUnmapped, "count"));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_mappedDevices, "allValues"));
  id v20 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v38;
    do
    {
      v23 = 0LL;
      do
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v19);
        }
        -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @" - %@",  *(void *)(*((void *)&v37 + 1) + 8LL * (void)v23));
        -[NSMutableString appendFormat:](v3, "appendFormat:", @"\n");
        v23 = (char *)v23 + 1;
      }

      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }

    while (v21);
  }

  uiDevice = self->_uiDevice;
  if (uiDevice)
  {
    v25 = uiDevice;
    id v26 = sub_10006ED70(-[SFCombinedDevice nextState](v25, "nextState"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"UI Device: (next state = %@)\n - %@\n", v27, v25);
  }

  v36 = v3;
  uint64_t v28 = -[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags");
  unsigned int v29 = -[SDProxHandoffAgent _systemCanTrigger](self, "_systemCanTrigger");
  v30 = @"canTrigger";
  if (!v29) {
    v30 = &stru_1005E3958;
  }
  if (self->_stationary) {
    v31 = "yes";
  }
  else {
    v31 = "no";
  }
  NSAppendPrintF(&v36, "System UI flags: %#{flags} %@, stationary: %s\n", v28, &unk_1004CAD6E, v30, v31);
  v32 = v36;

  v35 = v32;
  NSAppendPrintF(&v35, "Throttle events: %d / %d\n", self->_prefThrottleEventCount, self->_prefThrottleEventMax);
  v33 = v35;

  return v33;
}

- (void)activate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000707AC;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100070874;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  proxClients = self->_proxClients;
  self->_proxClients = 0LL;
}

- (void)prefsChanged
{
  int v59 = 0;
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.Sharing", @"chEnabled", &v59);
  BOOL v5 = Int64 != 0;
  if (v59)
  {
    uint64_t v6 = SFDeviceClassCodeGet(Int64, v4);
    BOOL v5 = (v6 - 1) < 2 || SFDeviceClassCodeGet(v6, v7) == 4;
  }

  if (self->_prefEnabled != v5)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      v8 = "yes";
      if (v5) {
        v9 = "no";
      }
      else {
        v9 = "yes";
      }
      if (!v5) {
        v8 = "no";
      }
      LogPrintF(&dword_100642038, "-[SDProxHandoffAgent prefsChanged]", 30LL, "Pref enabled: %s -> %s\n", v9, v8);
    }

    self->_prefEnabled = v5;
  }

  CFPrefs_GetDouble(@"com.apple.Sharing", @"chBLEScanSecs", &v59);
  if (v59) {
    double v11 = 300.0;
  }
  else {
    double v11 = v10;
  }
  double prefBLEActionScanSecs = self->_prefBLEActionScanSecs;
  if (v11 != prefBLEActionScanSecs)
  {
    if (dword_100642038 <= 30)
    {
      if (dword_100642038 == -1)
      {
        double prefBLEActionScanSecs = self->_prefBLEActionScanSecs;
      }

      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent prefsChanged]",  30LL,  "Pref BLE scan secs: %f -> %f\n",  prefBLEActionScanSecs,  v11);
    }

- (void)setPreventNotifications:(BOOL)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000711E8;
  v4[3] = &unk_1005CC3A8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_update
{
  if (self->_prefEnabled && !self->_unansweredCall)
  {
    -[SDProxHandoffAgent _commonEnsureStarted](self, "_commonEnsureStarted");
    if (-[SDProxHandoffAgent _clinkShouldStart](self, "_clinkShouldStart")) {
      -[SDProxHandoffAgent _clinkEnsureStarted](self, "_clinkEnsureStarted");
    }
    else {
      -[SDProxHandoffAgent _clinkEnsureStopped](self, "_clinkEnsureStopped");
    }
    if (-[SDProxHandoffAgent _bleActionDiscoveryShouldStart](self, "_bleActionDiscoveryShouldStart")) {
      -[SDProxHandoffAgent _bleActionDiscoveryEnsureStarted](self, "_bleActionDiscoveryEnsureStarted");
    }
    else {
      -[SDProxHandoffAgent _bleActionDiscoveryEnsureStopped](self, "_bleActionDiscoveryEnsureStopped");
    }
    if (-[SDProxHandoffAgent _bleInfoDiscoveryShouldStart](self, "_bleInfoDiscoveryShouldStart")) {
      -[SDProxHandoffAgent _bleInfoDiscoveryEnsureStarted](self, "_bleInfoDiscoveryEnsureStarted");
    }
    else {
      -[SDProxHandoffAgent _bleInfoDiscoveryEnsureStopped](self, "_bleInfoDiscoveryEnsureStopped");
    }
    if (-[SDProxHandoffAgent _motionShouldStart](self, "_motionShouldStart")) {
      -[SDProxHandoffAgent _motionEnsureStarted](self, "_motionEnsureStarted");
    }
    else {
      -[SDProxHandoffAgent _motionEnsureStopped](self, "_motionEnsureStopped");
    }
    if (-[SDProxHandoffAgent _serviceShouldStart](self, "_serviceShouldStart")) {
      -[SDProxHandoffAgent _serviceEnsureStarted](self, "_serviceEnsureStarted");
    }
    else {
      -[SDProxHandoffAgent _serviceEnsureStopped](self, "_serviceEnsureStopped");
    }
    -[SDProxHandoffAgent _run](self, "_run");
  }

  else
  {
    -[SDProxHandoffAgent _bleActionDiscoveryEnsureStopped](self, "_bleActionDiscoveryEnsureStopped");
    -[SDProxHandoffAgent _bleInfoDiscoveryEnsureStopped](self, "_bleInfoDiscoveryEnsureStopped");
    -[SDProxHandoffAgent _clinkEnsureStopped](self, "_clinkEnsureStopped");
    -[SDProxHandoffAgent _motionEnsureStopped](self, "_motionEnsureStopped");
    -[SDProxHandoffAgent _serviceEnsureStopped](self, "_serviceEnsureStopped");
  }

- (void)_updateCandidateIsNearby
{
  id v3 = -[NSMutableDictionary count](self->_mappedDevices, "count");
  BOOL v4 = v3 != 0LL;
  if (self->_candidateNearby != v4)
  {
    if (dword_100642038 <= 30)
    {
      id v5 = v3;
      if (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL))
      {
        uint64_t v6 = "yes";
        if (v5) {
          uint64_t v7 = "no";
        }
        else {
          uint64_t v7 = "yes";
        }
        if (!v5) {
          uint64_t v6 = "no";
        }
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _updateCandidateIsNearby]",  30LL,  "Candidate is nearby: %s -> %s\n",  v7,  v6);
      }
    }

    self->_candidateNearby = v4;
  }

- (void)_commonEnsureStarted
{
  v2 = self;
  if (!self->_systemMonitor)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _commonEnsureStarted]", 30LL, "System monitor start\n");
    }

    id v3 = objc_alloc_init(&OBJC_CLASS___CUSystemMonitor);
    systemMonitor = v2->_systemMonitor;
    v2->_systemMonitor = v3;

    -[CUSystemMonitor setDispatchQueue:](v2->_systemMonitor, "setDispatchQueue:", v2->_dispatchQueue);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100071748;
    v19[3] = &unk_1005CB2F8;
    v19[4] = v2;
    -[CUSystemMonitor setCallChangedHandler:](v2->_systemMonitor, "setCallChangedHandler:", v19);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100071750;
    v18[3] = &unk_1005CB2F8;
    v18[4] = v2;
    -[CUSystemMonitor setScreenOnChangedHandler:](v2->_systemMonitor, "setScreenOnChangedHandler:", v18);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100071758;
    v17[3] = &unk_1005CB2F8;
    v17[4] = v2;
    -[CUSystemMonitor setScreenLockedChangedHandler:](v2->_systemMonitor, "setScreenLockedChangedHandler:", v17);
    id v5 = v2->_systemMonitor;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100071760;
    v16[3] = &unk_1005CB2F8;
    v16[4] = v2;
    self = (SDProxHandoffAgent *)-[CUSystemMonitor activateWithCompletion:](v5, "activateWithCompletion:", v16);
  }

  if (!v2->_bleMapCoalescer)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___CUCoalescer);
    bleMapCoalescer = v2->_bleMapCoalescer;
    v2->_bleMapCoalescer = v6;

    -[CUCoalescer setDispatchQueue:](v2->_bleMapCoalescer, "setDispatchQueue:", v2->_dispatchQueue);
    -[CUCoalescer setMaxDelay:](v2->_bleMapCoalescer, "setMaxDelay:", 0.05);
    -[CUCoalescer setMinDelay:](v2->_bleMapCoalescer, "setMinDelay:", 0.05);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000717D8;
    v15[3] = &unk_1005CB2F8;
    v15[4] = v2;
    self = (SDProxHandoffAgent *)-[CUCoalescer setActionHandler:](v2->_bleMapCoalescer, "setActionHandler:", v15);
  }

  if (!v2->_statusMonitor && SFDeviceClassCodeGet(self, a2) - 1 <= 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v2 selector:"commonSystemUIChanged" name:@"com.apple.sharingd.SystemUIChanged" object:0];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
    statusMonitor = v2->_statusMonitor;
    v2->_statusMonitor = (SDStatusMonitor *)v9;
  }

  if (!v2->_notificationProxy)
  {
    double v11 = objc_alloc_init(&OBJC_CLASS___SFNotificationProxy);
    notificationProxy = v2->_notificationProxy;
    v2->_notificationProxy = v11;

    -[SFNotificationProxy setDispatchQueue:](v2->_notificationProxy, "setDispatchQueue:", v2->_dispatchQueue);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000717E0;
    v14[3] = &unk_1005CC740;
    v14[4] = v2;
    -[SFNotificationProxy setDismissedHandler:](v2->_notificationProxy, "setDismissedHandler:", v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000717F0;
    v13[3] = &unk_1005CC768;
    v13[4] = v2;
    -[SFNotificationProxy setTappedHandler:](v2->_notificationProxy, "setTappedHandler:", v13);
  }

- (void)_commonEnsureStopped
{
  if (self->_systemMonitor)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _commonEnsureStopped]", 30LL, "System monitor stop\n");
    }

    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0LL;
  }

  bleMapCoalescer = self->_bleMapCoalescer;
  if (bleMapCoalescer)
  {
    -[CUCoalescer invalidate](bleMapCoalescer, "invalidate");
    id v5 = self->_bleMapCoalescer;
    self->_bleMapCoalescer = 0LL;
  }

  if (self->_statusMonitor)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:self name:@"com.apple.sharingd.SystemUIChanged" object:0];

    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0LL;
  }

  notificationProxy = self->_notificationProxy;
  if (notificationProxy)
  {
    -[SFNotificationProxy setDismissedHandler:](notificationProxy, "setDismissedHandler:", 0LL);
    -[SFNotificationProxy setTappedHandler:](self->_notificationProxy, "setTappedHandler:", 0LL);
    uint64_t v9 = self->_notificationProxy;
    self->_notificationProxy = 0LL;
  }

  -[SDProxHandoffAgent _hapticsEnsureStopped](self, "_hapticsEnsureStopped");
}

- (void)_commonCallCountChanged
{
  id v3 = self->_systemMonitor;
  if (v3)
  {
    id v16 = v3;
    signed int v4 = -[CUSystemMonitor activeCallCount](v3, "activeCallCount");
    int v5 = -[CUSystemMonitor connectedCallCount](v16, "connectedCallCount");
    BOOL v6 = v5 > 0 || self->_prefForceOnCall;
    BOOL userOnCall = self->_userOnCall;
    self->_BOOL userOnCall = v6;
    if (dword_100642038 <= 30)
    {
      if (dword_100642038 == -1)
      {
        BOOL v6 = self->_userOnCall;
      }

      v8 = "no";
      if (userOnCall) {
        uint64_t v9 = "yes";
      }
      else {
        uint64_t v9 = "no";
      }
      if (v6) {
        double v10 = "yes";
      }
      else {
        double v10 = "no";
      }
      if (self->_prefForceOnCall) {
        v8 = "yes";
      }
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _commonCallCountChanged]",  30LL,  "Active call count = %d (%d connected), userOnCall %s -> %s, prefForceOnCall = %s\n",  v4,  v5,  v9,  v10,  v8);
    }

- (void)_commonShouldAdvertiseChanged
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = self->_proxClients;
  id v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= [*(id *)(*((void *)&v14 + 1) + 8 * (void)i) shouldAdvertise];
      }

      id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v5);
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  BOOL prefForceShouldAdvertise = self->_prefForceShouldAdvertise;
  int v10 = prefForceShouldAdvertise | v6 & 1;
  if (v10 != self->_clientShouldAdvertise)
  {
    if (dword_100642038 <= 30)
    {
      if (dword_100642038 != -1)
      {
LABEL_13:
        if (v10) {
          double v11 = "no";
        }
        else {
          double v11 = "yes";
        }
        if (v10) {
          BOOL v12 = "yes";
        }
        else {
          BOOL v12 = "no";
        }
        if (prefForceShouldAdvertise) {
          uint64_t v13 = "yes";
        }
        else {
          uint64_t v13 = "no";
        }
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _commonShouldAdvertiseChanged]",  30LL,  "Client should advertise changed: %s -> %s, BOOL prefForceShouldAdvertise = %s\n",  v11,  v12,  v13);
        goto LABEL_24;
      }

      if (_LogCategory_Initialize(&dword_100642038, 30LL))
      {
        BOOL prefForceShouldAdvertise = self->_prefForceShouldAdvertise;
        goto LABEL_13;
      }
    }

- (void)_commonScreenStateChanged
{
  unsigned int v3 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  if (dword_100642038 <= 30 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
  {
    if (v3) {
      id v4 = "on";
    }
    else {
      id v4 = "off";
    }
    unsigned int v5 = -[CUSystemMonitor screenLocked](self->_systemMonitor, "screenLocked");
    int v6 = @"Unlocked";
    if (v5) {
      int v6 = @"Locked";
    }
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _commonScreenStateChanged]",  30LL,  "Screen state changed to %s, %@\n",  v4,  v6);
  }

  if ((v3 & 1) == 0)
  {
    -[SDProxHandoffAgent _bleUpdateMappingReset](self, "_bleUpdateMappingReset");
    -[SFNotificationProxy requestRemoveAll](self->_notificationProxy, "requestRemoveAll");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](&OBJC_CLASS___SDNearbyAgent, "sharedNearbyAgent"));
    [v7 bleProximityEstimatorsResetDeviceClose];
  }

  -[SDProxHandoffAgent _update](self, "_update");
}

- (BOOL)_systemCanTrigger
{
  unsigned int v3 = -[SDStatusMonitor systemUIFlags](self->_statusMonitor, "systemUIFlags");
  unsigned int v4 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  if (v4) {
    LOBYTE(v4) = !v3 && (-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn") & 1) != 0
  }
              || (v3 & 0x18001) == 0;
  return v4;
}

- (void)commonSystemUIChanged
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100071EF8;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_scheduleRunAfter:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072040;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_after(v4, dispatchQueue, block);
}

- (void)_run
{
  unsigned int v3 = (SFCombinedDevice *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDevicePending](self, "_combinedDevicePending"));
  uiDevice = self->_uiDevice;
  self->_uiDevice = v3;

  switch(-[SFCombinedDevice state](self->_uiDevice, "state"))
  {
    case 0xB:
      -[SDProxHandoffAgent _runNotificationPending](self, "_runNotificationPending");
      break;
    case 0xC:
      -[SDProxHandoffAgent _runNotificationPendingContent](self, "_runNotificationPendingContent");
      break;
    case 0xD:
      -[SDProxHandoffAgent _runNotificationReady](self, "_runNotificationReady");
      break;
    case 0xE:
      -[SDProxHandoffAgent _runNotificationPresented](self, "_runNotificationPresented");
      break;
    case 0xF:
      -[SDProxHandoffAgent _runNotificationDismissed](self, "_runNotificationDismissed");
      break;
    case 0x10:
      -[SDProxHandoffAgent _runTransferPending](self, "_runTransferPending");
      break;
    case 0x11:
      -[SDProxHandoffAgent _runTransferReady](self, "_runTransferReady");
      break;
    case 0x12:
      -[SDProxHandoffAgent _runTransferInProgress](self, "_runTransferInProgress");
      break;
    case 0x13:
      -[SDProxHandoffAgent _runTransferPendingDismiss](self, "_runTransferPendingDismiss");
      break;
    case 0x14:
      -[SDProxHandoffAgent _runTransferDone](self, "_runTransferDone");
      break;
    default:
      return;
  }

- (BOOL)_runStateVerify:(int)a3 device:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 state];
  if (v6 != a3
    && dword_100642038 <= 90
    && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
  {
    id v7 = sub_10006ED70((int)[v5 state]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = sub_10006ED70(a3);
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runStateVerify:device:]",  90LL,  "### Run state mismatch: %@, expected %@\n",  v8,  v10);
  }

  return v6 == a3;
}

- (void)_runNotificationPending
{
  unsigned int v3 = self->_uiDevice;
  if (v3)
  {
    BOOL v12 = v3;
    unsigned int v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 11LL, v3);
    unsigned int v3 = v12;
    if (v4)
    {
      unsigned int v5 = -[SFCombinedDevice nextState](v12, "nextState");
      unsigned int v3 = v12;
      if (v5 == 13)
      {
        if (dword_100642038 <= 30)
        {
          if (dword_100642038 != -1 || (v6 = _LogCategory_Initialize(&dword_100642038, 30LL), unsigned int v3 = v12, v6))
          {
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationPending]",  30LL,  "Run notification pending: %@\n",  v3);
            unsigned int v3 = v12;
          }
        }

        if (self->_userOnCall) {
          -[SDProxHandoffAgent _combinedDevicePrepareForCallTransferTrigger:]( self,  "_combinedDevicePrepareForCallTransferTrigger:",  v3);
        }
        else {
          -[SFCombinedDevice setNotificationType:](v3, "setNotificationType:", 2LL);
        }
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v12, "effectiveID"));
        if (!v7)
        {
          if (dword_100642038 <= 90
            && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
          {
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationPending]",  90LL,  "### No UI ID for request %@\n",  v11);
          }

          goto LABEL_32;
        }

        unsigned int v8 = -[SFCombinedDevice notificationType](v12, "notificationType");
        if (v8 == 2)
        {
          if (-[SFCombinedDevice canTransition:](v12, "canTransition:", 12LL))
          {
            -[SFCombinedDevice setPendingContentTicks:](v12, "setPendingContentTicks:", mach_absolute_time());
            -[SFCombinedDevice setState:](v12, "setState:", 12LL);
            id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v12, "notificationInfo"));
            if (v9) {
              uint64_t v10 = 13LL;
            }
            else {
              uint64_t v10 = 0LL;
            }
            -[SFCombinedDevice setNextState:](v12, "setNextState:", v10);

            -[SDProxHandoffAgent _proximityClientDeviceWillTrigger:](self, "_proximityClientDeviceWillTrigger:", v7);
            goto LABEL_24;
          }
        }

        else
        {
          if (v8 != 3)
          {
            if (dword_100642038 <= 90
              && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
            {
              -[SFCombinedDevice notificationType](v12, "notificationType");
              LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationPending]",  90LL,  "### Notification type not supported: %d");
            }

            goto LABEL_32;
          }

          if (-[SFCombinedDevice canTransition:](v12, "canTransition:", 13LL))
          {
            -[SFCombinedDevice setPendingContentTicks:](v12, "setPendingContentTicks:", mach_absolute_time());
            -[SFCombinedDevice setState:](v12, "setState:", 13LL);
            -[SFCombinedDevice setNextState:](v12, "setNextState:", 14LL);
LABEL_24:
            -[SDProxHandoffAgent _run](self, "_run");
          }
        }

- (void)_runNotificationPendingContent
{
  unsigned int v3 = self->_uiDevice;
  if (v3)
  {
    uint64_t v10 = v3;
    unsigned int v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 12LL, v3);
    unsigned int v3 = v10;
    if (v4)
    {
      unsigned int v5 = -[SFCombinedDevice nextState](v10, "nextState");
      unsigned int v3 = v10;
      if (v5 == 13)
      {
        int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v10, "notificationInfo"));
        if (v6)
        {
          uint64_t v7 = mach_absolute_time();
          double v8 = UpTicksToSecondsF(v7 - -[SFCombinedDevice pendingContentTicks](v10, "pendingContentTicks"));
          -[SFCombinedDevice setPendingContentDurationSecs:](v10, "setPendingContentDurationSecs:");
          if (dword_100642038 <= 30
            && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
          {
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationPendingContent]",  30LL,  "Run notification pending content: %@, waited: %f\n",  v10,  *(void *)&v8);
          }

          if (-[SFCombinedDevice canTransition:](v10, "canTransition:", 13LL))
          {
            -[SFCombinedDevice setState:](v10, "setState:", 13LL);
            if (-[SDProxHandoffAgent _shouldMediumPromptWithInfo:](self, "_shouldMediumPromptWithInfo:", v6)) {
              uint64_t v9 = 14LL;
            }
            else {
              uint64_t v9 = 0LL;
            }
            -[SFCombinedDevice setNextState:](v10, "setNextState:", v9);
            -[SDProxHandoffAgent _run](self, "_run");
          }
        }

        else if (dword_100642038 <= 90 {
               && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
        }
        {
          LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationPendingContent]",  90LL,  "### UI Start without notification info?\n");
        }

        unsigned int v3 = v10;
      }
    }
  }
}

- (void)_runNotificationReady
{
  unsigned int v3 = self->_uiDevice;
  if (v3
    && -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 13LL, v3)
    && (-[SFCombinedDevice nextState](v3, "nextState") == 14 || -[SFCombinedDevice nextState](v3, "nextState") == 16)
    && -[SFCombinedDevice canTransition:](v3, "canTransition:", 14LL))
  {
    if (-[SDProxHandoffAgent _systemCanTrigger](self, "_systemCanTrigger"))
    {
      unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v3, "effectiveID"));
      if (!v4)
      {
        if (dword_100642038 <= 90
          && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
        {
          LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationReady]",  90LL,  "### UI Start without UI ID?\n");
        }

        goto LABEL_66;
      }

      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v3, "notificationInfo"));
      if (!v5)
      {
        if (dword_100642038 <= 90
          && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
        {
          LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationReady]",  90LL,  "### UI Start without notification info?\n");
        }

        goto LABEL_65;
      }

      if (self->_stationary)
      {
        if (dword_100642038 <= 60
          && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 60LL)))
        {
          LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationReady]",  60LL,  "### Device is stationary, so we shouldn't trigger notification\n");
        }

        goto LABEL_65;
      }

      unsigned int v6 = -[SFCombinedDevice nextState](v3, "nextState");
      if (v6 == 14)
      {
        id v7 = (id)objc_claimAutoreleasedReturnValue([v5 mediumBubbleVersion]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice bleDevice](v3, "bleDevice"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bleDevice]);
        else {
          uint64_t v9 = 0LL;
        }

        if (v7)
        {
          uint64_t v8 = 1LL;
          goto LABEL_34;
        }
      }

      else if (v6 == 16)
      {
        id v7 = v5;
        uint64_t v8 = 0LL;
        uint64_t v9 = 16LL;
LABEL_34:
        uint64_t v12 = mach_absolute_time();
        double v13 = UpTicksToSecondsF(v12 - -[SFCombinedDevice pendingContentTicks](v3, "pendingContentTicks"));
        if ((_DWORD)v8 && (double v14 = 0.25 - v13, 0.25 - v13 > 0.0))
        {
          if (!-[SFCombinedDevice medBubbleDelayed](v3, "medBubbleDelayed"))
          {
            if (dword_100642038 <= 30
              && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
            {
              LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationReady]",  30LL,  "Delay threshold %f, deferring medium bubble notification for %f seconds\n",  0.25,  v14);
            }

            -[SFCombinedDevice setMedBubbleDelayed:](v3, "setMedBubbleDelayed:", 1LL);
            -[SDProxHandoffAgent _scheduleRunAfter:](self, "_scheduleRunAfter:", v14);
          }
        }

        else
        {
          -[SFCombinedDevice setMedBubbleDelayed:](v3, "setMedBubbleDelayed:", 0LL, v13);
          if (dword_100642038 <= 30
            && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
          {
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationReady]",  30LL,  "Run notification ready %@\n",  v3);
          }

          -[SFCombinedDevice setNotificationTicks:](v3, "setNotificationTicks:", mach_absolute_time());
          -[SFCombinedDevice setState:](v3, "setState:", 14LL);
          -[SFCombinedDevice setNextState:](v3, "setNextState:", v9);
          if (dword_100642038 <= 30
            && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
          {
            __int128 v15 = "no";
            if ((_DWORD)v8) {
              __int128 v15 = "yes";
            }
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationReady]",  30LL,  "UI Start: %@, medium version: %s\n",  v4,  v15);
          }

          -[SFNotificationProxy requestPostOrUpdate:info:mediumVariant:]( self->_notificationProxy,  "requestPostOrUpdate:info:mediumVariant:",  v4,  v7,  v8);
          if ((_DWORD)v8) {
            -[SDProxHandoffAgent _throttleMediumSetTicks:](self, "_throttleMediumSetTicks:", mach_absolute_time());
          }
          v18[0] = @"notificationType";
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[SFCombinedDevice notificationType](v3, "notificationType")));
          v18[1] = @"uiID";
          v19[0] = v16;
          v19[1] = v4;
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
          SFMetricsLog(@"com.apple.sharing.HomePodHandoff.UIStart", v17);

          -[SDProxHandoffAgent _run](self, "_run");
        }

- (void)_runNotificationPresented
{
  unsigned int v3 = self->_uiDevice;
  if (v3)
  {
    __int128 v15 = v3;
    unsigned int v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 14LL, v3);
    unsigned int v3 = v15;
    if (v4)
    {
      unsigned int v5 = -[SFCombinedDevice nextState](v15, "nextState");
      unsigned int v3 = v15;
      if (v5 == 16
        || (v6 = -[SFCombinedDevice nextState](v15, "nextState"), unsigned int v3 = v15, v6 == 18)
        || (v7 = -[SFCombinedDevice nextState](v15, "nextState"), unsigned int v3 = v15, v7 == 15))
      {
        if (dword_100642038 <= 30)
        {
          if (dword_100642038 != -1 || (v8 = _LogCategory_Initialize(&dword_100642038, 30LL), unsigned int v3 = v15, v8))
          {
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationPresented]",  30LL,  "Run notification presented %@\n",  v3);
            unsigned int v3 = v15;
          }
        }

        id v9 = (id)-[SFCombinedDevice nextState](v3, "nextState");
        id v10 = v9;
        if ((_DWORD)v9 == 18)
        {
          unsigned int v12 = -[SFCombinedDevice canTransition:](v15, "canTransition:", 18LL);
          unsigned int v3 = v15;
          if (v12)
          {
            -[SFCombinedDevice setDismissReason:](v15, "setDismissReason:", 3LL);
            -[SFCombinedDevice setTransferPendingStartTicks:]( v15,  "setTransferPendingStartTicks:",  mach_absolute_time());
            goto LABEL_17;
          }
        }

        else if ((_DWORD)v9 == 16)
        {
          unsigned int v14 = -[SFCombinedDevice canTransition:](v15, "canTransition:", 16LL);
          unsigned int v3 = v15;
          if (v14)
          {
            -[SFCombinedDevice setTransferPendingStartTicks:]( v15,  "setTransferPendingStartTicks:",  mach_absolute_time());
            uint64_t v13 = 17LL;
            goto LABEL_20;
          }
        }

        else
        {
          unsigned int v3 = v15;
          if ((_DWORD)v9 == 15)
          {
            unsigned int v11 = -[SFCombinedDevice canTransition:](v15, "canTransition:", 15LL);
            unsigned int v3 = v15;
            if (v11)
            {
              -[SFCombinedDevice setNotificationInfo:](v15, "setNotificationInfo:", 0LL);
              -[SFCombinedDevice setNotificationType:](v15, "setNotificationType:", 0LL);
              -[SFCombinedDevice setTransferDoneTicks:](v15, "setTransferDoneTicks:", mach_absolute_time());
LABEL_17:
              uint64_t v13 = 0LL;
LABEL_20:
              -[SFCombinedDevice setState:](v15, "setState:", v10);
              -[SFCombinedDevice setNextState:](v15, "setNextState:", v13);
              -[SDProxHandoffAgent _run](self, "_run");
              unsigned int v3 = v15;
            }
          }
        }
      }
    }
  }
}

- (void)_runNotificationDismissed
{
  unsigned int v3 = self->_uiDevice;
  if (v3)
  {
    unsigned int v14 = v3;
    unsigned int v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 15LL, v3);
    unsigned int v3 = v14;
    if (v4)
    {
      unsigned int v5 = -[SFCombinedDevice nextState](v14, "nextState");
      unsigned int v3 = v14;
      if (v5 == 10 || (v6 = -[SFCombinedDevice nextState](v14, "nextState"), unsigned int v3 = v14, v6 == 16))
      {
        if (dword_100642038 <= 30)
        {
          if (dword_100642038 != -1 || (v7 = _LogCategory_Initialize(&dword_100642038, 30LL), unsigned int v3 = v14, v7))
          {
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runNotificationDismissed]",  30LL,  "Run notification dismissed %@\n",  v3);
            unsigned int v3 = v14;
          }
        }

        unsigned int v8 = -[SFCombinedDevice nextState](v3, "nextState");
        if (v8 == 16)
        {
          unsigned int v11 = -[SFCombinedDevice canTransition:](v14, "canTransition:", 16LL);
          unsigned int v3 = v14;
          if (v11)
          {
            -[SFCombinedDevice setTransferPendingStartTicks:]( v14,  "setTransferPendingStartTicks:",  mach_absolute_time());
            -[SFCombinedDevice setState:](v14, "setState:", 16LL);
            unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v14, "notificationInfo"));
            unsigned int v13 = [v12 interactionBehavior];

            if (v13 == 1) {
              uint64_t v10 = 17LL;
            }
            else {
              uint64_t v10 = 0LL;
            }
            goto LABEL_17;
          }
        }

        else
        {
          unsigned int v3 = v14;
          if (v8 == 10)
          {
            unsigned int v9 = -[SFCombinedDevice canTransition:](v14, "canTransition:", 10LL);
            unsigned int v3 = v14;
            if (v9)
            {
              -[SFCombinedDevice resetTicks](v14, "resetTicks");
              -[SFCombinedDevice setState:](v14, "setState:", 10LL);
              uint64_t v10 = 0LL;
LABEL_17:
              -[SFCombinedDevice setNextState:](v14, "setNextState:", v10);
              -[SDProxHandoffAgent _run](self, "_run");
              unsigned int v3 = v14;
            }
          }
        }
      }
    }
  }
}

- (void)_runTransferInProgress
{
  unsigned int v3 = self->_uiDevice;
  if (v3)
  {
    unsigned int v11 = v3;
    unsigned int v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 18LL, v3);
    unsigned int v3 = v11;
    if (v4)
    {
      unsigned int v5 = -[SFCombinedDevice nextState](v11, "nextState");
      unsigned int v3 = v11;
      if (v5 == 19 || (v6 = -[SFCombinedDevice nextState](v11, "nextState"), unsigned int v3 = v11, v6 == 20))
      {
        if (dword_100642038 <= 30)
        {
          if (dword_100642038 != -1 || (v7 = _LogCategory_Initialize(&dword_100642038, 30LL), unsigned int v3 = v11, v7))
          {
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runTransferInProgress]",  30LL,  "Run transfer in progress %@\n",  v3);
            unsigned int v3 = v11;
          }
        }

        unsigned int v8 = -[SFCombinedDevice nextState](v3, "nextState");
        if (v8 == 20)
        {
          unsigned int v10 = -[SFCombinedDevice canTransition:](v11, "canTransition:", 20LL);
          unsigned int v3 = v11;
          if (v10)
          {
            -[SFCombinedDevice setState:](v11, "setState:", 20LL);
            -[SFCombinedDevice setTransferDoneTicks:](v11, "setTransferDoneTicks:", mach_absolute_time());
            -[SFCombinedDevice setNextState:](v11, "setNextState:", 0LL);
            -[SDProxHandoffAgent _uiStopIfNeeded:reason:]( self,  "_uiStopIfNeeded:reason:",  v11,  -[SFCombinedDevice dismissReason](v11, "dismissReason"));
            -[SFCombinedDevice setDismissReason:](v11, "setDismissReason:", 0LL);
            goto LABEL_15;
          }
        }

        else
        {
          unsigned int v3 = v11;
          if (v8 == 19)
          {
            unsigned int v9 = -[SFCombinedDevice canTransition:](v11, "canTransition:", 19LL);
            unsigned int v3 = v11;
            if (v9)
            {
              -[SFCombinedDevice setState:](v11, "setState:", 19LL);
              -[SFCombinedDevice setNextState:](v11, "setNextState:", 20LL);
LABEL_15:
              -[SDProxHandoffAgent _run](self, "_run");
              unsigned int v3 = v11;
            }
          }
        }
      }
    }
  }
}

- (void)_runTransferPending
{
  unsigned int v3 = self->_uiDevice;
  if (v3)
  {
    BOOL v19 = v3;
    unsigned int v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 16LL, v3);
    unsigned int v3 = v19;
    if (v4)
    {
      unsigned int v5 = -[SFCombinedDevice nextState](v19, "nextState");
      unsigned int v3 = v19;
      if (v5 == 18 || (v6 = -[SFCombinedDevice nextState](v19, "nextState"), unsigned int v3 = v19, v6 == 17))
      {
        if (-[SFCombinedDevice transferPendingStartTicks](v3, "transferPendingStartTicks") == -1LL)
        {
          if (dword_100642038 <= 30
            && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
          {
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runTransferPending]",  30LL,  "Run transfer pending start %@\n",  v19);
          }

          -[SFCombinedDevice setTransferPendingStartTicks:](v19, "setTransferPendingStartTicks:", mach_absolute_time());
        }

        uint64_t v7 = mach_absolute_time();
        double v8 = UpTicksToSecondsF(v7 - -[SFCombinedDevice transferPendingStartTicks](v19, "transferPendingStartTicks"));
        unsigned int v3 = v19;
        if (v8 >= self->_prefTransferSecs)
        {
          if (dword_100642038 <= 30)
          {
            if (dword_100642038 != -1 || (v9 = _LogCategory_Initialize(&dword_100642038, 30LL), unsigned int v3 = v19, v9))
            {
              LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runTransferPending]",  30LL,  "Run transfer pending threshold %f\n",  v8);
              unsigned int v3 = v19;
            }
          }

          -[SFCombinedDevice setTransferPendingDurationSecs:](v3, "setTransferPendingDurationSecs:", v8);
          unsigned int v10 = -[SFCombinedDevice nextState](v19, "nextState");
          if (v10 == 17)
          {
            unsigned int v12 = -[SFCombinedDevice canTransition:](v19, "canTransition:", 17LL);
            unsigned int v3 = v19;
            if (v12)
            {
              uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v19, "effectiveID"));
              if (v13)
              {
                unsigned int v14 = (void *)v13;
                if (self->_userOnCall)
                {
                  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v19, "notificationInfo"));
                  unsigned int v16 = [v15 notificationType];

                  if (v16 == 2) {
                    -[SDProxHandoffAgent _combinedDevicePrepareForCallTransferTrigger:]( self,  "_combinedDevicePrepareForCallTransferTrigger:",  v19);
                  }
                }

                __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice notificationInfo](v19, "notificationInfo"));
                if (v17)
                {
                  if (-[SFCombinedDevice notificationTicks](v19, "notificationTicks") == -1LL) {
                    -[SFCombinedDevice setNotificationTicks:](v19, "setNotificationTicks:", mach_absolute_time());
                  }
                  -[SFNotificationProxy requestPostOrUpdate:info:mediumVariant:]( self->_notificationProxy,  "requestPostOrUpdate:info:mediumVariant:",  v14,  v17,  0LL);
                  -[SDProxHandoffAgent _hapticsFireNotificationSuccess](self, "_hapticsFireNotificationSuccess");

                  -[SFCombinedDevice setTransferPendingStartTicks:](v19, "setTransferPendingStartTicks:", -1LL);
                  -[SFCombinedDevice setState:](v19, "setState:", 17LL);
                  -[SFCombinedDevice setNextState:](v19, "setNextState:", 18LL);

                  -[SDProxHandoffAgent _run](self, "_run");
                  -[SDProxHandoffAgent _throttleEventDidOccur](self, "_throttleEventDidOccur");
                  goto LABEL_33;
                }

                -[SFCombinedDevice setTransferPendingStartTicks:](v19, "setTransferPendingStartTicks:", -1LL);
                -[SFCombinedDevice setState:](v19, "setState:", 17LL);
                -[SFCombinedDevice setNextState:](v19, "setNextState:", 18LL);

                goto LABEL_20;
              }

              unsigned int v3 = v19;
              if (dword_100642038 <= 90)
              {
                if (dword_100642038 != -1 || (v18 = _LogCategory_Initialize(&dword_100642038, 90LL), unsigned int v3 = v19, v18))
                {
                  LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runTransferPending]",  90LL,  "### No uiID? %@\n",  v3);
                  goto LABEL_33;
                }
              }
            }
          }

          else
          {
            unsigned int v3 = v19;
            if (v10 == 18)
            {
              unsigned int v11 = -[SFCombinedDevice canTransition:](v19, "canTransition:", 18LL);
              unsigned int v3 = v19;
              if (v11)
              {
                -[SFCombinedDevice setTransferPendingStartTicks:]( v19,  "setTransferPendingStartTicks:",  mach_absolute_time());
                -[SFCombinedDevice setState:](v19, "setState:", 18LL);
                -[SFCombinedDevice setDismissReason:](v19, "setDismissReason:", 3LL);
                -[SFCombinedDevice setNextState:](v19, "setNextState:", 0LL);
LABEL_20:
                -[SDProxHandoffAgent _run](self, "_run");
LABEL_33:
                unsigned int v3 = v19;
              }
            }
          }
        }
      }
    }
  }
}

- (void)_runTransferReady
{
  unsigned int v3 = self->_uiDevice;
  if (v3)
  {
    double v8 = v3;
    unsigned int v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 17LL, v3);
    unsigned int v3 = v8;
    if (v4)
    {
      unsigned int v5 = -[SFCombinedDevice nextState](v8, "nextState");
      unsigned int v3 = v8;
      if (v5 == 18)
      {
        unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v8, "effectiveID"));
        if (!v6)
        {
          if (dword_100642038 <= 90
            && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
          {
            LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _runTransferReady]", 90LL, "### No UI ID? %@\n", v8);
          }

          goto LABEL_25;
        }

        if (dword_100642038 <= 30
          && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
        {
          LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _runTransferReady]", 30LL, "Run transfer ready %@\n", v8);
        }

        unsigned int v7 = -[SFCombinedDevice notificationType](v8, "notificationType");
        if (v7 == 2)
        {
          -[SDProxHandoffAgent _proximityClientDeviceEnteredImmediate:]( self,  "_proximityClientDeviceEnteredImmediate:",  v6);
        }

        else
        {
          if (v7 != 3)
          {
            if (dword_100642038 <= 90
              && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
            {
              -[SFCombinedDevice notificationType](v8, "notificationType");
              LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _runTransferReady]", 90LL, "### Type not supported: %d");
            }

            goto LABEL_25;
          }

          -[SDProxHandoffAgent _runCallHandoffStart:](self, "_runCallHandoffStart:", v8);
        }

        if (-[SFCombinedDevice canTransition:](v8, "canTransition:", 18LL))
        {
          -[SFCombinedDevice setState:](v8, "setState:", 18LL);
          -[SFCombinedDevice setNextState:](v8, "setNextState:", 0LL);
          -[SDProxHandoffAgent _run](self, "_run");
        }

- (void)_runTransferPendingDismiss
{
  unsigned int v3 = self->_uiDevice;
  if (v3)
  {
    int v9 = v3;
    unsigned int v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 19LL, v3);
    unsigned int v3 = v9;
    if (v4)
    {
      unsigned int v5 = -[SFCombinedDevice nextState](v9, "nextState");
      unsigned int v3 = v9;
      if (v5 == 20)
      {
        uint64_t v6 = mach_absolute_time();
        double v7 = UpTicksToSecondsF(v6 - -[SFCombinedDevice notificationTicks](v9, "notificationTicks"));
        if (1.5 - v7 > 0.0)
        {
          -[SDProxHandoffAgent _scheduleRunAfter:](self, "_scheduleRunAfter:");
LABEL_12:
          unsigned int v3 = v9;
          goto LABEL_13;
        }

        -[SFCombinedDevice setNotificationDurationSecs:](v9, "setNotificationDurationSecs:", v7);
        if (dword_100642038 <= 30
          && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
        {
          LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runTransferPendingDismiss]",  30LL,  "Run transfer pending dismiss %f %@\n",  *(void *)&v7,  v9);
        }

        unsigned int v8 = -[SFCombinedDevice canTransition:](v9, "canTransition:", 20LL);
        unsigned int v3 = v9;
        if (v8)
        {
          -[SFCombinedDevice setNotificationTicks:](v9, "setNotificationTicks:", -1LL);
          -[SFCombinedDevice setTransferDoneTicks:](v9, "setTransferDoneTicks:", mach_absolute_time());
          -[SFCombinedDevice setState:](v9, "setState:", 20LL);
          -[SFCombinedDevice setNextState:](v9, "setNextState:", 0LL);
          -[SDProxHandoffAgent _uiStopIfNeeded:reason:](self, "_uiStopIfNeeded:reason:", v9, 1LL);
          -[SDProxHandoffAgent _run](self, "_run");
          goto LABEL_12;
        }
      }
    }
  }

- (void)_runTransferDone
{
  unsigned int v3 = self->_uiDevice;
  if (v3)
  {
    int v9 = v3;
    unsigned int v4 = -[SDProxHandoffAgent _runStateVerify:device:](self, "_runStateVerify:device:", 20LL, v3);
    unsigned int v3 = v9;
    if (v4)
    {
      unsigned int v5 = -[SFCombinedDevice nextState](v9, "nextState");
      unsigned int v3 = v9;
      if (v5 == 15)
      {
        if (dword_100642038 <= 30)
        {
          if (dword_100642038 != -1 || (v6 = _LogCategory_Initialize(&dword_100642038, 30LL), unsigned int v3 = v9, v6))
          {
            LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _runTransferDone]", 30LL, "Run transfer done");
            unsigned int v3 = v9;
          }
        }

        -[SDProxHandoffAgent _uiStopIfNeeded:reason:]( self,  "_uiStopIfNeeded:reason:",  v9,  -[SFCombinedDevice dismissReason](v3, "dismissReason"));
        if (-[SFCombinedDevice notificationType](v9, "notificationType") == 2)
        {
          double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v9, "effectiveID"));
          if (v7) {
            -[SDProxHandoffAgent _proximityClientDeviceExitedImmediate:]( self,  "_proximityClientDeviceExitedImmediate:",  v7);
          }
        }

        unsigned int v8 = -[SFCombinedDevice canTransition:](v9, "canTransition:", 15LL);
        unsigned int v3 = v9;
        if (v8)
        {
          -[SFCombinedDevice setState:](v9, "setState:", 15LL);
          -[SFCombinedDevice setNextState:](v9, "setNextState:", 0LL);
          -[SDProxHandoffAgent _run](self, "_run");
          unsigned int v3 = v9;
        }
      }
    }
  }
}

- (void)_runCallHandoffStart:(id)a3
{
  id v4 = a3;
  if (self->_clinkClient)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clinkDevice]);
    if (v5)
    {
      if (dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _runCallHandoffStart:]", 30LL, "CallHandoff start\n");
      }

      clinkClient = self->_clinkClient;
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 effectiveIdentifier]);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_100073A34;
      v8[3] = &unk_1005CC790;
      v8[4] = self;
      -[RPCompanionLinkClient sendRequestID:request:destinationID:options:responseHandler:]( clinkClient,  "sendRequestID:request:destinationID:options:responseHandler:",  @"com.apple.sharing.calltransfer",  &off_1005F98D8,  v7,  0LL,  v8);
    }

    else if (dword_100642038 <= 90 {
           && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
    }
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runCallHandoffStart:]",  90LL,  "### CallHandoff start without CompanionLink device? %@\n",  v4);
    }
  }
}

- (void)_runCallHandoffHandleResponse:(id)a3 error:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v5)
  {
    if (dword_100642038 <= 90
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runCallHandoffHandleResponse:error:]",  90LL,  "### Execute handoff response with error: %@\n",  v5);
    }
  }

  else
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runCallHandoffHandleResponse:error:]",  30LL,  "CallHandoff handle response\n");
    }

    -[SDProxHandoffAgent _runCallHandoffStartDelayTimer](self, "_runCallHandoffStartDelayTimer");
  }
}

- (void)_runCallHandoffStartDelayTimer
{
  delayTimer = self->_delayTimer;
  if (delayTimer)
  {
    id v4 = delayTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_delayTimer;
    self->_delayTimer = 0LL;
  }

  int v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  double v7 = self->_delayTimer;
  self->_delayTimer = v6;

  unsigned int v8 = self->_delayTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100073BF0;
  handler[3] = &unk_1005CB2F8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
  CUDispatchTimerSet(self->_delayTimer, 0.5, -1.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_delayTimer);
}

- (void)_runCallHandoffHandleDelayTimerFired
{
  delayTimer = self->_delayTimer;
  if (delayTimer)
  {
    id v4 = delayTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_delayTimer;
    self->_delayTimer = 0LL;
  }

  int v6 = self->_uiDevice;
  if (v6)
  {
    int v9 = v6;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](v6, "effectiveID"));
    if (v7)
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice route](v9, "route"));
      if (v8)
      {
        if (dword_100642038 <= 60
          && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 60LL)))
        {
          LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runCallHandoffHandleDelayTimerFired]",  60LL,  "### Call handoff not supported on current platform\n");
        }

        -[SDProxHandoffAgent _uiDismissWhenReady:reason:](self, "_uiDismissWhenReady:reason:", v9, 3LL);
        -[SDProxHandoffAgent _run](self, "_run");
      }

      else if (dword_100642038 <= 90 {
             && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
      }
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _runCallHandoffHandleDelayTimerFired]",  90LL,  "### No staged route after delay\n");
      }
    }

    int v6 = v9;
  }
}

- (void)_bleActionDiscoveryEnsureStarted
{
  if (!self->_proximityController)
  {
    unsigned int v3 = (SDProximityController *)objc_claimAutoreleasedReturnValue( +[SDProximityController sharedController]( &OBJC_CLASS___SDProximityController,  "sharedController"));
    proximityController = self->_proximityController;
    self->_proximityController = v3;
  }

  bleActionDiscovery = self->_bleActionDiscovery;
  if (bleActionDiscovery) {
    goto LABEL_33;
  }
  if (dword_100642038 <= 30 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleActionDiscoveryEnsureStarted]",  30LL,  "BLE action discovery start\n");
  }
  int v6 = objc_alloc_init(&OBJC_CLASS___SFDeviceDiscovery);
  double v7 = self->_bleActionDiscovery;
  self->_bleActionDiscovery = v6;

  uint64_t v8 = self->_stationary ? 9LL : 29LL;
  -[SFDeviceDiscovery setChangeFlags:](self->_bleActionDiscovery, "setChangeFlags:", v8);
  -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleActionDiscovery, "setDiscoveryFlags:", 8388624LL);
  -[SFDeviceDiscovery setDispatchQueue:](self->_bleActionDiscovery, "setDispatchQueue:", self->_dispatchQueue);
  -[SFDeviceDiscovery setPurpose:](self->_bleActionDiscovery, "setPurpose:", @"HandoffAction");
  -[SFDeviceDiscovery setRssiThreshold:](self->_bleActionDiscovery, "setRssiThreshold:", -60LL);
  -[SFDeviceDiscovery setFastScanMode:](self->_bleActionDiscovery, "setFastScanMode:", 2LL);
  -[SFDeviceDiscovery setScanRate:](self->_bleActionDiscovery, "setScanRate:", 20LL);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100074098;
  v15[3] = &unk_1005CB8C8;
  v15[4] = self;
  -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleActionDiscovery, "setDeviceFoundHandler:", v15);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000740A4;
  v14[3] = &unk_1005CB8C8;
  v14[4] = self;
  -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleActionDiscovery, "setDeviceLostHandler:", v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000740B0;
  v13[3] = &unk_1005CB8F0;
  v13[4] = self;
  -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleActionDiscovery, "setDeviceChangedHandler:", v13);
  int v9 = self->_bleActionDiscovery;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000740BC;
  v12[3] = &unk_1005CB3E8;
  v12[4] = self;
  -[SFDeviceDiscovery activateWithCompletion:](v9, "activateWithCompletion:", v12);
  -[SDProxHandoffAgent _bleActionScanTimerActivate](self, "_bleActionScanTimerActivate");
  bleActionDiscovery = self->_bleActionDiscovery;
  if (bleActionDiscovery)
  {
LABEL_33:
    if (self->_prefHighNormal)
    {
      if (self->_stationary && (uint64_t)-[SFDeviceDiscovery scanRate](bleActionDiscovery, "scanRate") > 10
        || self->_bleActionScanTimedOut)
      {
        if (dword_100642038 <= 30
          && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
        {
          LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleActionDiscoveryEnsureStarted]",  30LL,  "BLE action scan rate -> Background with FastScanMatch\n");
        }

        -[SFDeviceDiscovery setChangeFlags:](self->_bleActionDiscovery, "setChangeFlags:", 9LL);
        -[SFDeviceDiscovery setFastScanMode:](self->_bleActionDiscovery, "setFastScanMode:", 2LL);
        -[SFDeviceDiscovery setScanRate:](self->_bleActionDiscovery, "setScanRate:", 10LL);
        -[SDProxHandoffAgent _bleActionScanTimerInvalidate](self, "_bleActionScanTimerInvalidate");
      }

      else if (!self->_stationary)
      {
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_mappedDevices, "allKeys"));
        if ([v10 count])
        {
          uint64_t v11 = (uint64_t)-[SFDeviceDiscovery scanRate](self->_bleActionDiscovery, "scanRate");

          if (v11 <= 29)
          {
            if (dword_100642038 <= 30
              && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
            {
              LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleActionDiscoveryEnsureStarted]",  30LL,  "BLE action scan rate -> HighNormal\n");
            }

            -[SFDeviceDiscovery setChangeFlags:](self->_bleActionDiscovery, "setChangeFlags:", 29LL);
            -[SFDeviceDiscovery setFastScanMode:](self->_bleActionDiscovery, "setFastScanMode:", 0LL);
            -[SFDeviceDiscovery setScanRate:](self->_bleActionDiscovery, "setScanRate:", 30LL);
            -[SDProxHandoffAgent _bleActionScanTimerActivate](self, "_bleActionScanTimerActivate");
          }
        }

        else
        {
        }
      }
    }
  }

- (void)_bleActionDiscoveryEnsureStopped
{
  if (self->_bleActionDiscovery)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleActionDiscoveryEnsureStopped]",  30LL,  "BLE action discovery stop\n");
    }

    -[SFDeviceDiscovery invalidate](self->_bleActionDiscovery, "invalidate");
    bleActionDiscovery = self->_bleActionDiscovery;
    self->_bleActionDiscovery = 0LL;

    -[SDProxHandoffAgent _bleUpdateMappingReset](self, "_bleUpdateMappingReset");
  }

  -[NSMutableDictionary removeAllObjects](self->_bleActionDevices, "removeAllObjects");
  bleActionDevices = self->_bleActionDevices;
  self->_bleActionDevices = 0LL;

  uiDevice = self->_uiDevice;
  self->_uiDevice = 0LL;

  -[SDProxHandoffAgent _bleActionScanTimerInvalidate](self, "_bleActionScanTimerInvalidate");
}

- (BOOL)_bleActionDiscoveryShouldStart
{
  else {
    return -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  }
}

- (void)_bleActionDeviceChanged:(id)a3
{
  id v28 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v28 identifier]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleActionDevices,  "objectForKeyedSubscript:",  v4));

    if (v5) {
      goto LABEL_6;
    }
    unsigned __int16 v6 = (unsigned __int16)[v28 deviceFlags];
    if ((v6 & 0x200) != 0 && (v6 & 0x48) != 0)
    {
      -[SDProxHandoffAgent _bleActionDeviceFoundCandidate:](self, "_bleActionDeviceFoundCandidate:", v28);
LABEL_6:
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_bleActionDevices,  "setObject:forKeyedSubscript:",  v28,  v4);
      double v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_mappedDevices,  "objectForKeyedSubscript:",  v4));
      if (!v7)
      {
        double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _bleUpdateMappingWithDevice:](self, "_bleUpdateMappingWithDevice:", v28));
        if (!v7) {
          goto LABEL_71;
        }
      }

      [v7 setBleDevice:v28];
      if (-[SDProxHandoffAgent _combinedDeviceIsSuppressed:](self, "_combinedDeviceIsSuppressed:", v7)) {
        goto LABEL_71;
      }
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v28 bleDevice]);
      unsigned int v9 = [v8 insideSmallBubble];

      unint64_t v10 = -[SDProximityController checkDeviceRegion:](self->_proximityController, "checkDeviceRegion:", v28);
      if (v10 == 1
        && dword_100642038 <= 50
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 50LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleActionDeviceChanged:]",  50LL,  "#ni_estimator handoff triggered");
      }

      BOOL v11 = v10 == 1;
      else {
        unsigned int v12 = v9;
      }
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v28 bleDevice]);
      unsigned __int8 v14 = [v13 insideMediumBubble];

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v28 bleDevice]);
      id v16 = [v15 rssiEstimate];

      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
      if (v12 == 1)
      {
        if ([v7 state] == 15)
        {
          if (dword_100642038 <= 30
            && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
          {
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleActionDeviceChanged:]",  30LL,  "%@ Retrigger after dismiss (%d)\n",  v17,  v16);
          }

- (void)_bleActionDeviceFound:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_bleActionDiscovery)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    if (v4
      && ([v5 deviceFlags] & 0x200) != 0
      && ([v5 deviceFlags] & 0x48) != 0)
    {
      -[SDProxHandoffAgent _bleActionDeviceFoundCandidate:](self, "_bleActionDeviceFoundCandidate:", v5);
      -[SDProxHandoffAgent _bleActionDeviceChanged:](self, "_bleActionDeviceChanged:", v5);
      -[SDProxHandoffAgent _update](self, "_update");
    }
  }
}

- (void)_bleActionDeviceFoundCandidate:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  if (v4)
  {
    if (([v8 deviceFlags] & 0x200) != 0)
    {
      if (([v8 deviceFlags] & 0x48) != 0)
      {
        if (dword_100642038 <= 10
          && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 10LL)))
        {
          LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleActionDeviceFoundCandidate:]",  10LL,  "BLE action device found: %@\n",  v8);
        }

        bleActionDevices = self->_bleActionDevices;
        if (!bleActionDevices)
        {
          unsigned __int16 v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          double v7 = self->_bleActionDevices;
          self->_bleActionDevices = v6;

          bleActionDevices = self->_bleActionDevices;
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](bleActionDevices, "setObject:forKeyedSubscript:", v8, v4);
        -[SDProxHandoffAgent _bleDeviceNearbyEnter:](self, "_bleDeviceNearbyEnter:", v8);
      }
    }

    else if (dword_100642038 <= 90 {
           && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
    }
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleActionDeviceFoundCandidate:]",  90LL,  "### Found candidate has wrong action type %@\n",  v8);
    }
  }
}

- (void)_bleActionDeviceLost:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleActionDevices,  "objectForKeyedSubscript:",  v4));

    if (v5)
    {
      if (dword_100642038 <= 10
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 10LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleActionDeviceLost:]",  10LL,  "BLE action device lost: %@\n",  v6);
      }

      -[SDProxHandoffAgent _bleDeviceNearbyExit:](self, "_bleDeviceNearbyExit:", v6);
      -[NSMutableDictionary removeObjectForKey:](self->_bleActionDevices, "removeObjectForKey:", v4);
      -[SDProxHandoffAgent _update](self, "_update");
    }
  }
}

- (void)_bleActionScanTimerActivate
{
  if (dword_100642038 <= 30 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleActionScanTimerActivate]",  30LL,  "BLE action scan timer activate\n");
  }
  self->_bleActionScanTimedOut = 0;
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  bleActionScanTimer = self->_bleActionScanTimer;
  self->_bleActionScanTimer = v3;

  SFDispatchTimerSet(self->_bleActionScanTimer, self->_prefBLEActionScanSecs, -1.0, 250000000.0);
  id v5 = self->_bleActionScanTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100074D64;
  handler[3] = &unk_1005CB2F8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
  dispatch_resume((dispatch_object_t)self->_bleActionScanTimer);
}

- (void)_bleActionScanTimerInvalidate
{
  if (self->_bleActionScanTimer)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleActionScanTimerInvalidate]",  30LL,  "BLE action scan timer invalidate\n");
    }

    self->_bleActionScanTimedOut = 0;
    bleActionScanTimer = self->_bleActionScanTimer;
    if (bleActionScanTimer)
    {
      id v5 = bleActionScanTimer;
      dispatch_source_cancel(v5);
      uint64_t v4 = self->_bleActionScanTimer;
      self->_bleActionScanTimer = 0LL;
    }
  }

- (void)_bleActionScanTimerFired
{
  self->_bleActionScanTimedOut = 1;
  -[SDProxHandoffAgent _update](self, "_update");
}

- (void)_bleInfoDiscoveryEnsureStarted
{
  if (!self->_bleInfoDiscovery)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleInfoDiscoveryEnsureStarted]",  30LL,  "BLE info discovery start\n");
    }

    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SFDeviceDiscovery);
    bleInfoDiscovery = self->_bleInfoDiscovery;
    self->_bleInfoDiscovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_bleInfoDiscovery, "setChangeFlags:", 9LL);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleInfoDiscovery, "setDiscoveryFlags:", 1LL);
    -[SFDeviceDiscovery setDispatchQueue:](self->_bleInfoDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setFastScanMode:](self->_bleInfoDiscovery, "setFastScanMode:", 1LL);
    -[SFDeviceDiscovery setPurpose:](self->_bleInfoDiscovery, "setPurpose:", @"HandoffInfo");
    -[SFDeviceDiscovery setRssiThreshold:](self->_bleInfoDiscovery, "setRssiThreshold:", -37LL);
    -[SFDeviceDiscovery setScanRate:](self->_bleInfoDiscovery, "setScanRate:", 20LL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10007506C;
    v9[3] = &unk_1005CB8C8;
    v9[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleInfoDiscovery, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100075078;
    v8[3] = &unk_1005CB8C8;
    v8[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleInfoDiscovery, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100075084;
    v7[3] = &unk_1005CB8F0;
    v7[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleInfoDiscovery, "setDeviceChangedHandler:", v7);
    id v5 = self->_bleInfoDiscovery;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100075090;
    v6[3] = &unk_1005CB3E8;
    v6[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_bleInfoDiscoveryEnsureStopped
{
  if (self->_bleInfoDiscovery)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleInfoDiscoveryEnsureStopped]",  30LL,  "BLE info discovery stop\n");
    }

    -[SFDeviceDiscovery invalidate](self->_bleInfoDiscovery, "invalidate");
    bleInfoDiscovery = self->_bleInfoDiscovery;
    self->_bleInfoDiscovery = 0LL;

    -[SDProxHandoffAgent _bleUpdateMappingReset](self, "_bleUpdateMappingReset");
  }

  -[NSMutableDictionary removeAllObjects](self->_bleInfoDevices, "removeAllObjects");
  bleInfoDevices = self->_bleInfoDevices;
  self->_bleInfoDevices = 0LL;

  -[NSMutableDictionary removeAllObjects](self->_bleUnmapped, "removeAllObjects");
  bleUnmapped = self->_bleUnmapped;
  self->_bleUnmapped = 0LL;
}

- (BOOL)_bleInfoDiscoveryShouldStart
{
  return SFDeviceClassCodeGet(self, a2) == 4;
}

- (void)_bleInfoDeviceChanged:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = v9;
  if (self->_bleInfoDiscovery)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    if (v5 && ([v9 deviceFlags] & 0x48) != 0)
    {
      if (dword_100642038 <= 10
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 10LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleInfoDeviceChanged:]",  10LL,  "BLE info device changed: %@\n",  v9);
      }

      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleInfoDevices,  "objectForKeyedSubscript:",  v5));
      if (!v6
        && dword_100642038 <= 90
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleInfoDeviceChanged:]",  90LL,  "### Unknown BLE info device changed?\n");
      }

      double v7 = (void *)objc_claimAutoreleasedReturnValue([v9 bleDevice]);
      id v8 = [v7 rssi];

      if ((unint64_t)v8 <= 0xFFFFFFFFFFFFFFDALL
        && dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleInfoDeviceChanged:]",  30LL,  "BLE info device has bad rssi: %d, %@\n",  v8,  v9);
      }

      -[SDProxHandoffAgent _bleDeviceNearbyEnter:](self, "_bleDeviceNearbyEnter:", v9);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bleInfoDevices, "setObject:forKeyedSubscript:", v9, v5);
      -[SDProxHandoffAgent _update](self, "_update");
    }

    uint64_t v4 = v9;
  }
}

- (void)_bleInfoDeviceFound:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = v11;
  if (self->_bleInfoDiscovery)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    if (v5 && ([v11 deviceFlags] & 0x48) != 0)
    {
      if (dword_100642038 <= 10
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 10LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleInfoDeviceFound:]",  10LL,  "BLE info device found: %@\n",  v11);
      }

      bleInfoDevices = self->_bleInfoDevices;
      if (!bleInfoDevices)
      {
        double v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        id v8 = self->_bleInfoDevices;
        self->_bleInfoDevices = v7;

        bleInfoDevices = self->_bleInfoDevices;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](bleInfoDevices, "setObject:forKeyedSubscript:", v11, v5);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v11 bleDevice]);
      id v10 = [v9 rssi];

      if ((unint64_t)v10 <= 0xFFFFFFFFFFFFFFDALL
        && dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleInfoDeviceFound:]",  30LL,  "BLE info device has bad rssi: %d, %@\n",  v10,  v11);
      }

      -[SDProxHandoffAgent _bleDeviceNearbyEnter:](self, "_bleDeviceNearbyEnter:", v11);
      -[SDProxHandoffAgent _update](self, "_update");
    }

    uint64_t v4 = v11;
  }
}

- (void)_bleInfoDeviceLost:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if (v4)
  {
    if (dword_100642038 <= 10
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 10LL)))
    {
      LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _bleInfoDeviceLost:]", 10LL, "BLE info device lost: %@\n", v6);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v4));
    if (v5) {
      -[SDProxHandoffAgent _uiStopIfNeeded:reason:](self, "_uiStopIfNeeded:reason:", v5, 4LL);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_bleInfoDevices, "removeObjectForKey:", v4);
    -[SDProxHandoffAgent _bleDeviceNearbyExit:](self, "_bleDeviceNearbyExit:", v6);
    -[SDProxHandoffAgent _update](self, "_update");
  }
}

- (void)_bleDeviceNearbyEnter:(id)a3
{
  id v11 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v4));

    id v6 = -[SDProxHandoffAgent _bleUpdateMappingWithDevice:](self, "_bleUpdateMappingWithDevice:", v11);
    -[SDProxHandoffAgent _updateCandidateIsNearby](self, "_updateCandidateIsNearby");
    if (!v5)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_mappedDevices,  "objectForKeyedSubscript:",  v4));
      id v8 = v7;
      if (v7)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 clinkDevice]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mediaRouteIdentifier]);

        if (v10)
        {
          if (dword_100642038 <= 30
            && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
          {
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleDeviceNearbyEnter:]",  30LL,  "Nearby enter (CL.MR): %@\n",  v10);
          }

          -[SDProxHandoffAgent _proximityClientDeviceEnteredNearby:](self, "_proximityClientDeviceEnteredNearby:", v10);
        }
      }
    }

    -[SDProxHandoffAgent _update](self, "_update");
  }
}

- (void)_bleDeviceNearbyExit:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a3 identifier]);
  if (v4)
  {
    id v9 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v4));
    id v6 = v5;
    if (v5)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 clinkDevice]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaRouteIdentifier]);

      if (v8)
      {
        if (dword_100642038 <= 30
          && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
        {
          LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleDeviceNearbyExit:]",  30LL,  "Nearby exit (CL.MR): %@\n",  v8);
        }

        -[SDProxHandoffAgent _proximityClientDeviceExitedNearby:](self, "_proximityClientDeviceExitedNearby:", v8);
      }
    }

    -[NSMutableDictionary removeObjectForKey:](self->_mappedDevices, "removeObjectForKey:", v9);
    -[NSMutableDictionary removeObjectForKey:](self->_bleUnmapped, "removeObjectForKey:", v9);
    -[SDProxHandoffAgent _updateCandidateIsNearby](self, "_updateCandidateIsNearby");
    -[SDProxHandoffAgent _update](self, "_update");
    uint64_t v4 = v9;
  }
}

- (void)_bleUpdateMappingAndNearby
{
}

- (void)_bleUpdateMappingAndNearbyCoalesced
{
  if (dword_100642038 <= 10 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 10LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleUpdateMappingAndNearbyCoalesced]",  10LL,  "Processing unmapped BLE info devices\n");
  }
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleUnmapped, "allValues"));
  id v4 = [v3 copy];

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 =  -[SDProxHandoffAgent _bleUpdateMappingWithDevice:]( self,  "_bleUpdateMappingWithDevice:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)i));
      }

      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v7);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleActionDevices, "allValues", 0LL));
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (j = 0LL; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 =  -[SDProxHandoffAgent _bleUpdateMappingWithDevice:]( self,  "_bleUpdateMappingWithDevice:",  *(void *)(*((void *)&v17 + 1) + 8LL * (void)j));
      }

      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }

    while (v13);
  }

  -[SDProxHandoffAgent _updateCandidateIsNearby](self, "_updateCandidateIsNearby");
  -[SDProxHandoffAgent _update](self, "_update");
}

- (void)_bleUpdateMappingReset
{
  bleUnmapped = self->_bleUnmapped;
  self->_bleUnmapped = 0LL;

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_mappedDevices, "allValues", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 effectiveID]);
        if (v10)
        {
          if ([v9 stateIsClose]) {
            -[SDProxHandoffAgent _proximityClientDeviceExitedImmediate:]( self,  "_proximityClientDeviceExitedImmediate:",  v10);
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_mappedDevices, "removeAllObjects");
  mappedDevices = self->_mappedDevices;
  self->_mappedDevices = 0LL;

  -[SDProxHandoffAgent _bleUpdateMappingAndNearby](self, "_bleUpdateMappingAndNearby");
}

- (id)_bleUpdateMappingWithDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
    uint64_t v7 = SFDeviceToRPCompanionLinkDevice(v4, v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = v8;
    if (!v8)
    {
      if (dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleUpdateMappingWithDevice:]",  30LL,  "Unable to map BLE info %@\n",  v4);
      }

      goto LABEL_26;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 model]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
    __int128 v13 = (void *)v11;
    if (v11)
    {
      int v14 = SFDeviceClassCodeGet(v11, v12);
      if ((v14 - 1) < 2)
      {
        __int128 v15 = @"audioaccessory";
        goto LABEL_6;
      }

      if (v14 == 4)
      {
        if ([v13 containsString:@"iphone"])
        {

          goto LABEL_15;
        }

        __int128 v15 = @"ipod";
LABEL_6:
        unsigned __int8 v16 = [v13 containsString:v15];

        if ((v16 & 1) == 0) {
          goto LABEL_18;
        }
LABEL_15:
        unsigned __int8 v18 = [v4 deviceFlags];
        if ((v18 & 8) != 0)
        {
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
          if ([v21 decryptedActivityLevel] == 16)
          {
            unsigned int v22 = 0;
          }

          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
            unsigned int v22 = [v27 decryptedActivityLevel];
          }

          if (dword_100642038 <= 30
            && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
          {
            uint64_t v28 = objc_claimAutoreleasedReturnValue([v4 name]);
            BOOL v29 = (void *)v28;
            if (v22 > 0xE) {
              BOOL v30 = "?";
            }
            else {
              BOOL v30 = off_1005CC958[(char)v22];
            }
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _bleUpdateMappingWithDevice:]",  30LL,  "%@ activity level: %s\n",  v28,  v30);
          }

          if (v22 > 3)
          {
            unsigned int v19 = 1;
          }

          else
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
            unsigned int v19 = [v31 hasPrefix:@"AudioAccessory"];
          }
        }

        else
        {
          unsigned int v19 = 0;
        }

        uint64_t v32 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mappedDevices, "objectForKeyedSubscript:", v5));
        __int128 v17 = (SFCombinedDevice *)v32;
        if ((v18 & 8) == 0)
        {
          if (v32) {
            goto LABEL_72;
          }
          goto LABEL_59;
        }

        if (v32) {
          int v33 = 1;
        }
        else {
          int v33 = v19;
        }
        if (v33 == 1)
        {
          if (v32) {
            char v34 = v19;
          }
          else {
            char v34 = 1;
          }
          if ((v34 & 1) != 0)
          {
            char v35 = v19 ^ 1;
            if (v32) {
              char v35 = 1;
            }
            if ((v35 & 1) != 0)
            {
LABEL_72:
              -[SFCombinedDevice setBleDevice:](v17, "setBleDevice:", v4);
              id v37 = (id)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice clinkDevice](v17, "clinkDevice"));
              id v38 = v9;
              uint64_t v39 = v38;
              if (v37 == v38)
              {
              }

              else
              {
                if (v37)
                {
                  unsigned __int8 v40 = [v37 isEqual:v38];

                  if ((v40 & 1) != 0) {
                    goto LABEL_79;
                  }
                }

                else
                {
                }

                -[SFCombinedDevice setClinkDevice:](v17, "setClinkDevice:", v39);
              }

- (void)_clinkEnsureStarted
{
  if (!self->_clinkClient)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _clinkEnsureStarted]", 30LL, "CLink start\n");
    }

    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___RPCompanionLinkClient);
    clinkClient = self->_clinkClient;
    self->_clinkClient = v3;

    -[RPCompanionLinkClient setControlFlags:](self->_clinkClient, "setControlFlags:", 2052LL);
    id v5 = -[RPCompanionLinkClient setDispatchQueue:](self->_clinkClient, "setDispatchQueue:", self->_dispatchQueue);
    if (SFDeviceClassCodeGet(v5, v6) - 1 <= 1) {
      -[RPCompanionLinkClient setFlags:]( self->_clinkClient,  "setFlags:",  -[RPCompanionLinkClient flags](self->_clinkClient, "flags") | 2);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100076454;
    v14[3] = &unk_1005CB2F8;
    v14[4] = self;
    -[RPCompanionLinkClient setInterruptionHandler:](self->_clinkClient, "setInterruptionHandler:", v14);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10007645C;
    v13[3] = &unk_1005CC5C0;
    v13[4] = self;
    -[RPCompanionLinkClient setDeviceChangedHandler:](self->_clinkClient, "setDeviceChangedHandler:", v13);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000764FC;
    v12[3] = &unk_1005CC598;
    v12[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_clinkClient, "setDeviceFoundHandler:", v12);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10007658C;
    v11[3] = &unk_1005CC598;
    v11[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_clinkClient, "setDeviceLostHandler:", v11);
    uint64_t v7 = self->_clinkClient;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10007661C;
    v10[3] = &unk_1005CB3E8;
    v10[4] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v7, "activateWithCompletion:", v10);
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _clinkEnsureStarted]",  30LL,  "Registering for call transfer messages");
    }

    uint64_t v8 = self->_clinkClient;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000766F8;
    v9[3] = &unk_1005CC7B8;
    v9[4] = self;
    -[RPCompanionLinkClient registerRequestID:options:handler:]( v8,  "registerRequestID:options:handler:",  @"com.apple.sharing.calltransfer",  0LL,  v9);
  }

- (void)_clinkEnsureStopped
{
  if (self->_clinkClient)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _clinkEnsureStopped]", 30LL, "CLink stop\n");
    }

    -[RPCompanionLinkClient deregisterRequestID:]( self->_clinkClient,  "deregisterRequestID:",  @"com.apple.sharing.calltransfer");
    -[RPCompanionLinkClient invalidate](self->_clinkClient, "invalidate");
    clinkClient = self->_clinkClient;
    self->_clinkClient = 0LL;
  }

- (BOOL)_clinkShouldStart
{
  id v2 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn");
  return result;
}

- (void)_clinkHandleRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (SFDeviceClassCodeGet(v8, v9) == 4)
  {
    -[SDProxHandoffAgent _clinkHomePodHandleRequest:responseHandler:]( self,  "_clinkHomePodHandleRequest:responseHandler:",  v7,  v8);
  }

  else if (v8)
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    id v10 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960596LL, 0LL, 0LL));
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = (void *)v11;
    __int128 v13 = @"?";
    if (v11) {
      __int128 v13 = (const __CFString *)v11;
    }
    __int128 v17 = v13;
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6700LL,  v14));
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0LL, 0LL, v15);
  }
}

- (void)_clinkHomePodHandleRequest:(id)a3 responseHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (SFDeviceClassCodeGet(v6, v7) == 4)
  {
    uint64_t Int64Ranged = CFDictionaryGetInt64Ranged(v5, @"op", 0LL, 0xFFFFFFFFLL, 0LL);
    if (Int64Ranged == 1)
    {
      if (dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _clinkHomePodHandleRequest:responseHandler:]",  30LL,  "Overriding stereo leader via call transfer message\n");
      }

      id v9 = objc_alloc_init(off_1006420A8());
      [v9 setDeviceAsStereoLeader:1 withOptions:0];
      if (v6) {
        (*((void (**)(id, void, void, void))v6 + 2))(v6, 0LL, 0LL, 0LL);
      }
    }

    else
    {
      if (dword_100642038 <= 90
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _clinkHomePodHandleRequest:responseHandler:]",  90LL,  "### Unexpected opCode (%d)",  Int64Ranged);
      }

      if (v6)
      {
        NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
        id v10 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  DebugGetErrorString(4294960564LL, 0LL, 0LL));
        uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
        uint64_t v12 = (void *)v11;
        __int128 v13 = @"?";
        if (v11) {
          __int128 v13 = (const __CFString *)v11;
        }
        __int128 v17 = v13;
        int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -6732LL,  v14));
        (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0LL, 0LL, v15);
      }
    }
  }
}

- (BOOL)_motionShouldStart
{
  return 0;
}

- (int)proximityClientStart:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [v4 setDispatchQueue:self->_dispatchQueue];
  proxClients = self->_proxClients;
  if (!proxClients)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v7 = self->_proxClients;
    self->_proxClients = v6;

    proxClients = self->_proxClients;
  }

  -[NSMutableSet addObject:](proxClients, "addObject:", v4);
  -[SDProxHandoffAgent _commonShouldAdvertiseChanged](self, "_commonShouldAdvertiseChanged");
  -[SDProxHandoffAgent _proximityClientSeedInitialDevices:](self, "_proximityClientSeedInitialDevices:", v4);
  -[SDProxHandoffAgent _proximityClientSeedWillTriggerDeviceIfNeeded:]( self,  "_proximityClientSeedWillTriggerDeviceIfNeeded:",  v4);
  -[SDProxHandoffAgent _update](self, "_update");

  return 0;
}

- (void)proximityClientStop:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableSet removeObject:](self->_proxClients, "removeObject:", v4);
  if (!-[NSMutableSet count](self->_proxClients, "count"))
  {
    -[SDProxHandoffAgent _bleUpdateMappingReset](self, "_bleUpdateMappingReset");
    -[NSMutableSet removeAllObjects](self->_suppressedDeviceIDs, "removeAllObjects");
    -[SFNotificationProxy requestRemoveAll](self->_notificationProxy, "requestRemoveAll");
    -[SDProxHandoffAgent _resetAllStates](self, "_resetAllStates");
  }

  -[SDProxHandoffAgent _update](self, "_update");
}

- (void)proximityClientUpdate:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100076DF8;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (int)proximityClient:(id)a3 dismissContentForDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v6) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v7));
    if (v8)
    {
      if (dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:dismissContentForDevice:]",  30LL,  "Proximity client dismiss %@\n",  v7);
      }

      -[SDProxHandoffAgent _uiDismissWhenReady:reason:](self, "_uiDismissWhenReady:reason:", v8, 1LL);
      int v9 = 0;
    }

    else
    {
      if (dword_100642038 <= 90
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:dismissContentForDevice:]",  90LL,  "### Proximity client dismiss without UI Device?\n");
      }

      int v9 = -6705;
    }
  }

  else
  {
    if (dword_100642038 <= 90
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:dismissContentForDevice:]",  90LL,  "### Unrecognized client: %@\n",  v6);
    }

    int v9 = -6700;
  }

  return v9;
}

- (int)proximityClient:(id)a3 provideContent:(id)a4 forDevice:(id)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v10) & 1) != 0)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v12));
    int v14 = (SFCombinedDevice *)v13;
    if (!v6 && !v13)
    {
      if (dword_100642038 <= 60
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 60LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:provideContent:forDevice:force:]",  60LL,  "### Unexpected content for %@: %@\n",  v12,  v11);
      }

      int v17 = -6709;
      goto LABEL_38;
    }

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v11 error]);
    if (!v15)
    {
      if (!v14 && v6)
      {
        int v14 = objc_alloc_init(&OBJC_CLASS___SFCombinedDevice);
        -[SFCombinedDevice setForced:](v14, "setForced:", 1LL);
        -[SFCombinedDevice setForcedID:](v14, "setForcedID:", v12);
        -[SFCombinedDevice setNotificationType:](v14, "setNotificationType:", 2LL);
      }

      NSErrorUserInfoKey v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent mediaTransferInfoFromInfo:](self, "mediaTransferInfoFromInfo:", v11));
      objc_msgSend( v16,  "setHomePodType:",  -[SDProxHandoffAgent notificationHomePodTypeForDevice:](self, "notificationHomePodTypeForDevice:", v14));
      -[SFCombinedDevice setNotificationInfo:](v14, "setNotificationInfo:", v16);
      if (dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        unsigned __int8 v18 = "no";
        if (v6) {
          unsigned __int8 v18 = "yes";
        }
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:provideContent:forDevice:force:]",  30LL,  "Proximity client content for: %@, force: %s: %@\n",  v14,  v18,  v16);
      }

      -[SFCombinedDevice setNextState:](v14, "setNextState:", 13LL);
      uiDevice = self->_uiDevice;
      self->_uiDevice = 0LL;

      dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100077428;
      block[3] = &unk_1005CB2F8;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
      goto LABEL_37;
    }

    NSErrorUserInfoKey v16 = (void *)v15;
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:provideContent:forDevice:force:]",  30LL,  "Proximity client content provided error: %@\n",  v11);
    }

    -[SFCombinedDevice setClientProvidedError:](v14, "setClientProvidedError:", 1LL);
    -[SFCombinedDevice resetTicks](v14, "resetTicks");
    if (-[SFCombinedDevice stateIsClose](v14, "stateIsClose")
      || -[SFCombinedDevice stateIsMedium](v14, "stateIsMedium")
      && (__int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice bleDevice](v14, "bleDevice")),
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bleDevice]),
          unsigned __int8 v22 = [v21 insideSmallBubble],
          v21,
          v20,
          (v22 & 1) != 0))
    {
      uint64_t v19 = 20LL;
    }

    else
    {
      if (!-[SFCombinedDevice stateIsMedium](v14, "stateIsMedium"))
      {
LABEL_34:
        -[SFCombinedDevice setNextState:](v14, "setNextState:", 0LL);
LABEL_37:

        int v17 = 0;
        goto LABEL_38;
      }

      uint64_t v19 = 15LL;
    }

    -[SFCombinedDevice setState:](v14, "setState:", v19);
    goto LABEL_34;
  }

  if (dword_100642038 <= 90 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:provideContent:forDevice:force:]",  90LL,  "### Unrecognized client: %@\n",  v10);
  }
  int v17 = -6700;
LABEL_38:

  return v17;
}

- (int)proximityClient:(id)a3 suppressDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v6) & 1) != 0)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:suppressDevice:]",  30LL,  "Suppressing %@ per client request\n",  v7);
    }

    suppressedDeviceIDs = self->_suppressedDeviceIDs;
    if (!suppressedDeviceIDs)
    {
      int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      id v10 = self->_suppressedDeviceIDs;
      self->_suppressedDeviceIDs = v9;

      suppressedDeviceIDs = self->_suppressedDeviceIDs;
    }

    -[NSMutableSet addObject:](suppressedDeviceIDs, "addObject:", v7);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v7));
    if (v11)
    {
      if (dword_100642038 < 31
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:suppressDevice:]",  30LL,  "Suppressed device maps to %@, resetting its state\n",  v11);
      }

      [v11 resetTicks];
      [v11 setState:10];
      [v11 setNextState:0];
    }

    id v13 = (id)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](self->_uiDevice, "effectiveID"));
    id v14 = v7;
    uint64_t v15 = v14;
    if (v13 == v14)
    {
    }

    else
    {
      if ((v14 != 0LL) == (v13 == 0LL))
      {

LABEL_30:
        int v12 = 0;
        goto LABEL_31;
      }

      unsigned __int8 v16 = [v13 isEqual:v14];

      if ((v16 & 1) == 0) {
        goto LABEL_30;
      }
    }

    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:suppressDevice:]",  30LL,  "Suppressed device matches current UI Device. Resetting UI Device.");
    }

    uiDevice = self->_uiDevice;
    self->_uiDevice = 0LL;

    goto LABEL_30;
  }

  if (dword_100642038 <= 90 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:suppressDevice:]",  90LL,  "### Unrecognized client: %@\n",  v6);
  }
  int v12 = -6700;
LABEL_31:

  return v12;
}

- (int)proximityClient:(id)a3 stopSuppressingDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v6) & 1) != 0)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:stopSuppressingDevice:]",  30LL,  "Stop suppressing %@ per client request\n",  v7);
    }

    -[NSMutableSet removeObject:](self->_suppressedDeviceIDs, "removeObject:", v7);
    int v8 = 0;
  }

  else
  {
    if (dword_100642038 <= 90
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:stopSuppressingDevice:]",  90LL,  "### Unrecognized client: %@\n",  v6);
    }

    int v8 = -6700;
  }

  return v8;
}

- (int)proximityClient:(id)a3 updateContent:(id)a4 forDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v8) & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v10));
    int v12 = v11;
    if (!v11)
    {
      int v17 = -6709;
      goto LABEL_43;
    }

    id v13 = (id)objc_claimAutoreleasedReturnValue([v11 effectiveID]);
    id v14 = v10;
    uint64_t v15 = v14;
    if (v13 == v14)
    {
    }

    else
    {
      if ((v14 != 0LL) == (v13 == 0LL))
      {

        int v17 = -6705;
        unsigned __int8 v18 = v13;
LABEL_42:

        goto LABEL_43;
      }

      unsigned int v16 = [v13 isEqual:v14];

      if (!v16)
      {
        int v17 = -6705;
LABEL_43:

        goto LABEL_44;
      }
    }

    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:updateContent:forDevice:]",  30LL,  "Proximity client update %@\n",  v15);
    }

    unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent mediaTransferInfoFromInfo:](self, "mediaTransferInfoFromInfo:", v9));
    objc_msgSend( v18,  "setHomePodType:",  -[SDProxHandoffAgent notificationHomePodTypeForDevice:](self, "notificationHomePodTypeForDevice:", v12));
    [v12 setNotificationInfo:v18];
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v9 error]);
    if (!v19)
    {
      if ([v12 state] == 14 && !objc_msgSend(v12, "nextState"))
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue([v18 mediumBubbleVersion]);
        uint64_t v20 = 1LL;
      }

      else
      {
        id v13 = v18;
        uint64_t v20 = 0LL;
      }

      id v21 = [v12 clientProvidedError];
      if ((_DWORD)v21)
      {
        [v12 setState:15];
        [v12 setNextState:16];
        [v12 setClientProvidedError:0];
      }

      if ((_DWORD)v20
        && dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:updateContent:forDevice:]",  30LL,  "Updating with medium bubble variant\n");
      }

      -[SFNotificationProxy requestUpdate:info:mediumVariant:canPostNotification:]( self->_notificationProxy,  "requestUpdate:info:mediumVariant:canPostNotification:",  v15,  v13,  v20,  v21);
      goto LABEL_41;
    }

    id v13 = (id)v19;
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:updateContent:forDevice:]",  30LL,  "Proximity client content updated with error: %@\n",  v9);
    }

    -[SFNotificationProxy requestRemove:withReason:](self->_notificationProxy, "requestRemove:withReason:", v15, 1LL);
    [v12 setClientProvidedError:1];
    if ([v12 stateIsClose])
    {
      uint64_t v22 = 20LL;
    }

    else
    {
      if (([v12 stateIsMedium] & 1) == 0)
      {
LABEL_41:
        int v17 = 0;
        goto LABEL_42;
      }

      uint64_t v22 = 15LL;
    }

    [v12 setState:v22];
    goto LABEL_41;
  }

  if (dword_100642038 <= 90 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClient:updateContent:forDevice:]",  90LL,  "### Unrecognized client: %@\n",  v8);
  }
  int v17 = -6700;
LABEL_44:

  return v17;
}

- (int)proximityClientRequestScannerTimerReset:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_proxClients, "containsObject:", v4) & 1) != 0)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClientRequestScannerTimerReset:]",  30LL,  "Proximity client request scanner timer reset\n");
    }

    if (self->_bleActionScanTimedOut || self->_bleActionScanTimer)
    {
      -[SDProxHandoffAgent _bleActionScanTimerActivate](self, "_bleActionScanTimerActivate");
    }

    else if (dword_100642038 <= 30 {
           && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    }
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClientRequestScannerTimerReset:]",  30LL,  "Timer not valid, not activating\n");
    }

    int v5 = 0;
  }

  else
  {
    if (dword_100642038 <= 90
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityClientRequestScannerTimerReset:]",  90LL,  "### Unrecognized client: %@\n",  v4);
    }

    int v5 = -6700;
  }

  return v5;
}

- (void)_proximityClientDeviceEnteredImmediate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proximityClientDeviceEnteredImmediate:]",  30LL,  "ProxClient deviceEnteredImmediate %@\n",  v4);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    int v5 = self->_proxClients;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceEnteredImmediateHandler]);

          if (v11)
          {
            int v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v10 deviceEnteredImmediateHandler]);
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }

        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v7);
    }
  }
}

- (void)_proximityClientDeviceExitedImmediate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proximityClientDeviceExitedImmediate:]",  30LL,  "ProxClient deviceExitedImmediate %@\n",  v4);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    int v5 = self->_proxClients;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceExitedImmediateHandler]);

          if (v11)
          {
            int v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v10 deviceExitedImmediateHandler]);
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }

        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v7);
    }
  }
}

- (void)_proximityClientDeviceEnteredNearby:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proximityClientDeviceEnteredNearby:]",  30LL,  "ProxClient deviceEnteredNearby %@\n",  v4);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    int v5 = self->_proxClients;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceEnteredNearbyHandler]);

          if (v11)
          {
            int v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v10 deviceEnteredNearbyHandler]);
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }

        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v7);
    }
  }
}

- (void)_proximityClientDeviceExitedNearby:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proximityClientDeviceExitedNearby:]",  30LL,  "ProxClient deviceExitedNearby %@\n",  v4);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    int v5 = self->_proxClients;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceExitedNearbyHandler]);

          if (v11)
          {
            int v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v10 deviceExitedNearbyHandler]);
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }

        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v7);
    }
  }
}

- (void)_proximityClientDeviceWasDismissed:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proximityClientDeviceWasDismissed:]",  30LL,  "ProxClient deviceWasDismissed %@\n",  v4);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    int v5 = self->_proxClients;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceWasDismissedHandler]);

          if (v11)
          {
            int v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v10 deviceWasDismissedHandler]);
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }

        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v7);
    }
  }
}

- (void)_proximityClientDeviceWasDismissed:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v6 length])
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      else {
        id v7 = *(&off_1005CC9D0 + a4 - 1);
      }
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proximityClientDeviceWasDismissed:reason:]",  30LL,  "ProxClient deviceWasDismissed %@, %@\n",  v6,  v7);
    }

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    uint64_t v8 = self->_proxClients;
    id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          __int128 v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 deviceWasDismissedHandlerEx]);

          if (v14)
          {
            __int128 v15 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue([v13 deviceWasDismissedHandlerEx]);
            ((void (**)(void, id, int64_t))v15)[2](v15, v6, a4);
          }
        }

        id v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
      }

      while (v10);
    }
  }
}

- (void)_proximityClientDeviceWasSelected:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proximityClientDeviceWasSelected:]",  30LL,  "ProxClient deviceWasSelected %@\n",  v4);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    int v5 = self->_proxClients;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceWasSelectedHandler]);

          if (v11)
          {
            int v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v10 deviceWasSelectedHandler]);
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }

        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v7);
    }
  }
}

- (void)_proximityClientDeviceWillTrigger:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proximityClientDeviceWillTrigger:]",  30LL,  "ProxClient deviceWillTrigger %@\n",  v4);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    int v5 = self->_proxClients;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceWillTriggerHandler]);

          if (v11)
          {
            int v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v10 deviceWillTriggerHandler]);
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }

        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v7);
    }
  }
}

- (void)_proximityClientDeviceDidUnTrigger:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([v4 length])
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proximityClientDeviceDidUnTrigger:]",  30LL,  "ProxClient deviceDidUntrigger %@\n",  v4);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    int v5 = self->_proxClients;
    id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceDidUntriggerHandler]);

          if (v11)
          {
            int v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v10 deviceDidUntriggerHandler]);
            ((void (**)(void, id))v12)[2](v12, v4);
          }
        }

        id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v7);
    }
  }
}

- (void)_proximityClientDeviceUpdated:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clinkDevice]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaRouteIdentifier]);

  if (v6)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = self->_proxClients;
    id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceUpdateHandler]);

          if (v13)
          {
            if (dword_100642038 <= 10
              && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 10LL)))
            {
              LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proximityClientDeviceUpdated:]",  10LL,  "Updating client with %@\n",  v4);
            }

            __int128 v14 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v12 deviceUpdateHandler]);
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bleDevice]);
            ((void (**)(void, void *, id, void))v14)[2]( v14,  v6,  [v16 rssi],  (int)objc_msgSend(v4, "state"));
          }
        }

        id v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      }

      while (v9);
    }
  }
}

- (void)_proximityClientSeedInitialDevices:(id)a3
{
  id v4 = a3;
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x3032000000LL;
  v10[3] = sub_100078E78;
  v10[4] = sub_100078E88;
  id v11 = 0LL;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_mappedDevices, "allValues"));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100078E90;
  v7[3] = &unk_1005CC7E0;
  id v8 = v4;
  id v9 = v10;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);

  _Block_object_dispose(v10, 8);
}

- (void)_proximityClientSeedWillTriggerDeviceIfNeeded:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000790C0;
  v7[3] = &unk_1005CB480;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_serviceEnsureStarted
{
  if (!self->_bleActionService)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _serviceEnsureStarted]", 30LL, "BLE action service start\n");
    }

    uint64_t v3 = objc_alloc_init(&OBJC_CLASS___SFProxHandoffService);
    bleActionService = self->_bleActionService;
    self->_bleActionService = v3;

    -[SFProxHandoffService setDispatchQueue:](self->_bleActionService, "setDispatchQueue:", self->_dispatchQueue);
    int v5 = self->_bleActionService;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000792F0;
    v6[3] = &unk_1005CB3E8;
    v6[4] = self;
    -[SFProxHandoffService activateWithCompletion:](v5, "activateWithCompletion:", v6);
  }

- (void)_serviceEnsureStopped
{
  if (self->_bleActionService)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF(&dword_100642038, "-[SDProxHandoffAgent _serviceEnsureStopped]", 30LL, "BLE action service stop\n");
    }

    -[SFProxHandoffService invalidate](self->_bleActionService, "invalidate");
    bleActionService = self->_bleActionService;
    self->_bleActionService = 0LL;
  }

- (BOOL)_serviceShouldStart
{
  return SFDeviceClassCodeGet(v3, v4) == 4 && self->_candidateNearby || self->_prefForceShouldAdvertise;
}

- (void)_serviceTimeoutActivate
{
  if (dword_100642038 <= 30 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _serviceTimeoutActivate]",  30LL,  "BLE action service timeout activate\n");
  }
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_dispatchQueue);
  bleActionServiceTimer = self->_bleActionServiceTimer;
  self->_bleActionServiceTimer = v3;

  SFDispatchTimerSet(self->_bleActionServiceTimer, 60.0, -1.0, 250000000.0);
  int v5 = self->_bleActionServiceTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000795B8;
  handler[3] = &unk_1005CB2F8;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
  dispatch_resume((dispatch_object_t)self->_bleActionServiceTimer);
}

- (void)_serviceTimeoutInvalidate
{
  if (self->_bleActionServiceTimer)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _serviceTimeoutInvalidate]",  30LL,  "BLE action service timeout invalidate\n");
    }

    bleActionServiceTimer = self->_bleActionServiceTimer;
    if (bleActionServiceTimer)
    {
      int v5 = bleActionServiceTimer;
      dispatch_source_cancel(v5);
      uint64_t v4 = self->_bleActionServiceTimer;
      self->_bleActionServiceTimer = 0LL;
    }
  }

- (void)_serviceTimeoutFired
{
  if (dword_100642038 <= 30 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _serviceTimeoutFired]",  30LL,  "BLE action service timeout fired\n");
  }
  -[SDProxHandoffAgent _serviceTimeoutInvalidate](self, "_serviceTimeoutInvalidate");
}

- (void)_throttleEventDidOccur
{
}

- (void)_throttleEventSet:(unint64_t)a3
{
}

- (BOOL)_throttleEventsReachedMax
{
  return !self->_prefIgnoreMediumThrottle && self->_prefThrottleEventCount >= self->_prefThrottleEventMax;
}

- (void)_throttleEventsReset
{
}

- (BOOL)_throttleMediumAllowsTrigger
{
  if (self->_prefIgnoreMediumThrottle || self->_prefMediumBubbleLastTicks == -1LL) {
    return 1;
  }
  uint64_t v4 = mach_absolute_time();
  return 64800.0 - UpTicksToSecondsF(v4 - self->_prefMediumBubbleLastTicks) <= 0.0;
}

- (void)_throttleMediumReset
{
}

- (void)_throttleMediumSetTicks:(unint64_t)a3
{
  if (dword_100642038 <= 30 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _throttleMediumSetTicks:]",  30LL,  "Throttle medium set ticks: %d\n",  a3);
  }
  CFPrefs_SetInt64(@"com.apple.Sharing", @"chThrottleMediumTicks", a3);
  -[SDProxHandoffAgent prefsChanged](self, "prefsChanged");
}

- (void)_proxiedNotificationDidDismiss:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v6));
  id v8 = v7;
  if (!v7) {
    goto LABEL_29;
  }
  unint64_t v9 = a4 - 1;
  else {
    uint64_t v10 = *(&off_1005CC9D0 + v9);
  }
  id v11 = [v7 notificationType];
  if (dword_100642038 <= 30 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
  {
    if (v9 > 3) {
      int v12 = @"?";
    }
    else {
      int v12 = *(&off_1005CC9D0 + v9);
    }
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proxiedNotificationDidDismiss:reason:]",  30LL,  "Notification did dismiss %@, %@\n",  v6,  v12);
  }

  id v13 = (id)objc_claimAutoreleasedReturnValue([v8 effectiveID]);
  id v14 = v6;
  __int128 v15 = v14;
  if (v13 == v14)
  {
    uint64_t v26 = v10;
  }

  else
  {
    if ((v14 != 0LL) == (v13 == 0LL))
    {

LABEL_25:
      if (dword_100642038 <= 90
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proxiedNotificationDidDismiss:reason:]",  90LL,  "### Unrecognized UI ID: %@\n",  v15);
      }

      goto LABEL_29;
    }

    uint64_t v26 = v10;
    unsigned __int8 v16 = [v13 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_25;
    }
  }

  -[SDProxHandoffAgent _proximityClientDeviceWasDismissed:reason:]( self,  "_proximityClientDeviceWasDismissed:reason:",  v15,  a4);
  unsigned int v17 = [v8 canTransition:15];
  if (v9 <= 1 && v17)
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v8 bleDevice]);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bleDevice]);
    unsigned __int8 v20 = [v19 insideSmallBubble];

    if ((v20 & 1) == 0) {
      [v8 setNextState:15];
    }
    [v8 setDismissReason:a4];
    -[SDProxHandoffAgent _run](self, "_run");
  }

  v27[0] = @"notificationDurationSecs";
  [v8 notificationDurationSecs];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v28[0] = v21;
  v27[1] = @"notificationType";
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v11));
  v28[1] = v22;
  v27[2] = @"pendingContentSecs";
  [v8 pendingContentDurationSecs];
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v28[2] = v23;
  v27[3] = @"reason";
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  v28[3] = v24;
  v28[4] = v26;
  v27[4] = @"reasonStr";
  v27[5] = @"uiID";
  v28[5] = v15;
  BOOL v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  6LL));
  SFMetricsLog(@"com.apple.sharing.HomePodHandoff.NotificationDidDismiss", v25);

LABEL_29:
}

- (void)_proxiedNotificationWasTapped:(id)a3
{
  id v4 = a3;
  if (dword_100642038 <= 30 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proxiedNotificationWasTapped:]",  30LL,  "Notification was tapped %@\n",  v4);
  }
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v32 = 0LL;
    int v33 = 0LL;
    uint64_t v34 = *(void *)v40;
    int v8 = 0x7FFFFFFF;
    id obj = v5;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", v10));
        int v12 = v11;
        if (v11)
        {
          id v13 = self;
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 bleDevice]);
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bleDevice]);
          signed int v16 = [v15 rssiEstimate];

          unint64_t v17 = v16;
          unint64_t v18 = v8;
          if (v17 > v18)
          {
            id v19 = v12;

            id v20 = v10;
            uint64_t v32 = v20;
            int v33 = v19;
            int v8 = v16;
          }

          self = v13;
        }
      }

      id v5 = obj;
      id v7 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    }

    while (v7);

    if (v33)
    {
      id v21 = v32;
      if (dword_100642038 <= 30
        && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
      {
        LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proxiedNotificationWasTapped:]",  30LL,  "Closest device: %@\n",  v33);
      }

      if (!self->_userOnCall) {
        -[SDProxHandoffAgent _proximityClientDeviceWasSelected:](self, "_proximityClientDeviceWasSelected:", v32);
      }
      if ([v33 canTransition:18])
      {
        [v33 setNextState:18];
        -[SDProxHandoffAgent _run](self, "_run");
      }

      id v23 = [obj mutableCopy];
      [v23 removeObject:v32];
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      id v24 = v23;
      id v25 = [v24 countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v36;
        do
        {
          for (j = 0LL; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v36 != v27) {
              objc_enumerationMutation(v24);
            }
            -[SDProxHandoffAgent _proxiedNotificationDidDismiss:reason:]( self,  "_proxiedNotificationDidDismiss:reason:",  *(void *)(*((void *)&v35 + 1) + 8LL * (void)j),  2LL);
          }

          id v26 = [v24 countByEnumeratingWithState:&v35 objects:v45 count:16];
        }

        while (v26);
      }

      v43[0] = @"onCall";
      BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_userOnCall));
      v43[1] = @"uiID";
      v44[0] = v29;
      v44[1] = v32;
      BOOL v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));
      SFMetricsLog(@"com.apple.sharing.HomePodHandoff.NotificationWasTapped", v30);

      id v5 = obj;
      uint64_t v22 = v33;
      goto LABEL_44;
    }

    id v21 = v32;
  }

  else
  {

    id v21 = 0LL;
  }

  if (dword_100642038 <= 90 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _proxiedNotificationWasTapped:]",  90LL,  "### Unable to determine closest device\n");
  }
  uint64_t v22 = 0LL;
LABEL_44:
}

- (void)notificationDidDismiss:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007A274;
  block[3] = &unk_1005CBF30;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)userDidTapNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007A33C;
  v7[3] = &unk_1005CB480;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_uiDismissWhenReady:(id)a3 reason:(int64_t)a4
{
  id v11 = a3;
  uint64_t v6 = mach_absolute_time();
  double v7 = UpTicksToSecondsF(v6 - (void)[v11 notificationTicks]);
  if (1.5 - v7 > 0.0)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _uiDismissWhenReady:reason:]",  30LL,  "Notification only displayed for %f, delaying dismiss\n",  v7);
    }

    if ([v11 canTransition:19])
    {
      [v11 setDismissReason:a4];
      [v11 setNextState:19];
      -[SDProxHandoffAgent _run](self, "_run");
    }

    -[SDProxHandoffAgent _scheduleRunAfter:](self, "_scheduleRunAfter:", 1.5 - v7);
    goto LABEL_17;
  }

  if (dword_100642038 <= 30 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _uiDismissWhenReady:reason:]",  30LL,  "Dismiss notification after %f\n",  v7);
  }
  [v11 setNotificationDurationSecs:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v11 effectiveID]);
  if (v8) {
    -[SFNotificationProxy requestRemove:withReason:](self->_notificationProxy, "requestRemove:withReason:", v8, a4);
  }

  unsigned int v9 = [v11 canTransition:20];
  id v10 = v11;
  if (v9)
  {
    [v11 setDismissReason:a4];
    [v11 setNextState:20];
    -[SDProxHandoffAgent _run](self, "_run");
LABEL_17:
    id v10 = v11;
  }
}

- (void)_uiStopIfNeeded:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  if (SFDeviceClassCodeGet(v6, v7) - 1 <= 1)
  {
    id v8 = self->_uiDevice;
    if (!v8)
    {
LABEL_31:

      goto LABEL_32;
    }

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 effectiveID]);
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFCombinedDevice effectiveID](self->_uiDevice, "effectiveID"));
      id v11 = v9;
      id v12 = v10;
      if (v11 == v12)
      {

        goto LABEL_9;
      }

      id v13 = v12;
      if (v12)
      {
        unsigned int v14 = [v11 isEqual:v12];

        if (!v14) {
          goto LABEL_30;
        }
LABEL_9:
        else {
          __int128 v15 = *(&off_1005CC9D0 + a4 - 1);
        }
        if (dword_100642038 <= 30
          && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
        {
          LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _uiStopIfNeeded:reason:]",  30LL,  "Presented UI Stop: %@, %@\n",  v11,  v15);
        }

        -[SFNotificationProxy requestRemove:withReason:](self->_notificationProxy, "requestRemove:withReason:", v11, a4);
        signed int v16 = (void *)objc_claimAutoreleasedReturnValue([v6 attachmentURL]);
        if (v16)
        {
          uint64_t v28 = v15;
          unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          id v29 = 0LL;
          id v18 = [v17 removeItemAtURL:v16 error:&v29];
          id v19 = v29;

          if (dword_100642038 <= 30
            && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
          {
            if ((_DWORD)v18) {
              id v20 = "yes";
            }
            else {
              id v20 = "no";
            }
            uint64_t v21 = objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
            uint64_t v22 = (void *)v21;
            id v23 = &stru_1005E3958;
            if (v21) {
              id v23 = (const __CFString *)v21;
            }
            LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _uiStopIfNeeded:reason:]",  30LL,  "Deleted %@: %s %@\n",  v16,  v20,  v23);
          }

          __int128 v15 = v28;
        }

        else
        {
          id v18 = 0LL;
        }

        v30[0] = @"deletedAttachment";
        id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v18));
        v31[0] = v24;
        v30[1] = @"notificationType";
        id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v6 notificationType]));
        v31[1] = v25;
        v30[2] = @"reason";
        id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
        v31[2] = v26;
        v31[3] = v15;
        v30[3] = @"reasonStr";
        v30[4] = @"uiID";
        v31[4] = v11;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  5LL));
        SFMetricsLog(@"com.apple.sharing.HomePodHandoff.UIStop", v27);

        goto LABEL_30;
      }
    }

- (id)_combinedDevicePending
{
  uint64_t v55 = 0LL;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000LL;
  v58 = sub_100078E78;
  int v59 = sub_100078E88;
  id v60 = 0LL;
  uint64_t v49 = 0LL;
  v50 = &v49;
  uint64_t v51 = 0x3032000000LL;
  v52 = sub_100078E78;
  uint64_t v53 = sub_100078E88;
  id v54 = 0LL;
  uint64_t v43 = 0LL;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  v46 = sub_100078E78;
  double v47 = sub_100078E88;
  id v48 = 0LL;
  uint64_t v37 = 0LL;
  __int128 v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  __int128 v40 = sub_100078E78;
  __int128 v41 = sub_100078E88;
  id v42 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_100078E78;
  __int128 v35 = sub_100078E88;
  id v36 = 0LL;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_100078E78;
  id v29 = sub_100078E88;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_100078E78;
  id v23 = sub_100078E88;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  unsigned int v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  signed int v16 = sub_100078E78;
  unint64_t v17 = sub_100078E88;
  id v18 = 0LL;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_100078E78;
  id v11 = sub_100078E88;
  id v12 = 0LL;
  mappedDevices = self->_mappedDevices;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007AB58;
  v6[3] = &unk_1005CC830;
  v6[4] = self;
  void v6[5] = &v49;
  v6[6] = &v37;
  v6[7] = &v43;
  v6[8] = &v25;
  v6[9] = &v19;
  v6[10] = &v31;
  v6[11] = &v13;
  v6[12] = &v55;
  v6[13] = &v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mappedDevices, "enumerateKeysAndObjectsUsingBlock:", v6);
  uint64_t v3 = (void *)v20[5];
  if (!v3)
  {
    uint64_t v3 = (void *)v14[5];
    if (!v3)
    {
      uint64_t v3 = (void *)v26[5];
      if (!v3)
      {
        uint64_t v3 = (void *)v32[5];
        if (!v3)
        {
          uint64_t v3 = (void *)v50[5];
          if (!v3)
          {
            uint64_t v3 = (void *)v44[5];
            if (!v3)
            {
              uint64_t v3 = (void *)v38[5];
              if (!v3)
              {
                uint64_t v3 = (void *)v56[5];
                if (!v3) {
                  uint64_t v3 = (void *)v8[5];
                }
              }
            }
          }
        }
      }
    }
  }

  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v4;
}

- (id)_combinedDeviceForUIID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100078E78;
  signed int v16 = sub_100078E88;
  id v17 = 0LL;
  mappedDevices = self->_mappedDevices;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10007AD14;
  v9[3] = &unk_1005CC858;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mappedDevices, "enumerateKeysAndObjectsUsingBlock:", v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)_combinedDeviceIsSuppressed:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 effectiveID]);
  BOOL v6 = v5 && (-[NSMutableSet containsObject:](self->_suppressedDeviceIDs, "containsObject:", v5) & 1) != 0;

  return v6;
}

- (BOOL)_expectingContentForDeviceID:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _combinedDeviceForUIID:](self, "_combinedDeviceForUIID:", a3));
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)_combinedDevicePrepareForCallTransferTrigger:(id)a3
{
  id v6 = a3;
  [v6 setNotificationType:3];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _routeForDevice:](self, "_routeForDevice:", v6));
  if (v4) {
    [v6 setRoute:v4];
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent callTransferInfoForDevice:](self, "callTransferInfoForDevice:", v6));
  if (v5) {
    [v6 setNotificationInfo:v5];
  }
}

- (void)_resetAllStates
{
  uiDevice = self->_uiDevice;
  self->_uiDevice = 0LL;

  mappedDevices = self->_mappedDevices;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007AF74;
  v5[3] = &unk_1005CC880;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mappedDevices, "enumerateKeysAndObjectsUsingBlock:", v5);
  -[SDProxHandoffAgent _run](self, "_run");
}

- (id)_routeForDevice:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent _routes](self, "_routes"));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bleDevice]);
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clinkDevice]);
      id v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }

      else
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_clinkClient, "activeDevices"));
        uint64_t v11 = SFDeviceToRPCompanionLinkDevice(v6, v10);
        id v9 = (id)objc_claimAutoreleasedReturnValue(v11);
      }

      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v12 = v5;
      uint64_t v13 = (char *)[v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v18;
        while (1)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          if (!--v14)
          {
            uint64_t v14 = (char *)[v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
            if (!v14) {
              break;
            }
          }
        }
      }
    }

    else if (dword_100642038 <= 90 {
           && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 90LL)))
    }
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _routeForDevice:]",  90LL,  "### Cannot find route without a BLE device.\n");
    }
  }

  return 0LL;
}

- (id)_routes
{
  return 0LL;
}

- (BOOL)_shouldMediumPromptWithInfo:(id)a3
{
  id v4 = a3;
  if (!self->_prefMediumBubbleEnabled)
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _shouldMediumPromptWithInfo:]",  30LL,  "Shouldn't prompt medium, disabled via pref\n");
    }

    goto LABEL_20;
  }

  if (-[SDProxHandoffAgent _throttleEventsReachedMax](self, "_throttleEventsReachedMax"))
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent _shouldMediumPromptWithInfo:]",  30LL,  "Shouldn't prompt medium, maximum trigger events reached\n");
    }

- (id)callTransferInfoForDevice:(id)a3
{
  id v4 = a3;
  if (dword_100642038 <= 30 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent callTransferInfoForDevice:]",  30LL,  "Generating call transfer notification info\n");
  }
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SDProxHandoffAgent displayNameForContact:](self, "displayNameForContact:", 0LL));
  id v7 = (void *)v5;
  if (!v5)
  {

    id v12 = 0LL;
LABEL_12:
    uint64_t v16 = SFLocalizedStringForKey(@"HOMEPOD_HANDOFF_MESSAGE_CALL_GENERIC", v11);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v16);

    goto LABEL_13;
  }

  unsigned int v9 = SFDeviceClassCodeGet(v5, v6) - 1;
  if (v9 >= 3) {
    id v10 = @"HOMEPOD_HANDOFF_MESSAGE_CALL_PEER";
  }
  else {
    id v10 = *(&off_1005CC9F0 + (char)v9);
  }
  uint64_t v13 = SFLocalizedStringForKey(v10, v8);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v7));

  if (!v12) {
    goto LABEL_12;
  }
  uint64_t v15 = v12;
  if (![v12 length]) {
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v17 = SFLocalizedStringForKey(@"HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING", v11);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  __int128 v19 = objc_alloc_init(&OBJC_CLASS___SFNotificationInfo);
  -[SFNotificationInfo setBody:](v19, "setBody:", v15);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  uint64_t v21 = SFHomePodDisplayNameForDeviceName();
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[SFNotificationInfo setHeader:](v19, "setHeader:", v22);

  -[SFNotificationInfo setInteractionBehavior:](v19, "setInteractionBehavior:", 2LL);
  -[SFNotificationInfo setInteractionDirection:](v19, "setInteractionDirection:", 2LL);
  -[SFNotificationInfo setNotificationType:](v19, "setNotificationType:", 3LL);
  -[SFNotificationInfo setTitle:](v19, "setTitle:", v18);
  -[SFNotificationInfo setHomePodType:]( v19,  "setHomePodType:",  -[SDProxHandoffAgent notificationHomePodTypeForDevice:](self, "notificationHomePodTypeForDevice:", v4));

  return v19;
}

- (BOOL)callTransferShouldPush:(id)a3
{
  return 1;
}

- (id)mediaTransferInfoFromInfo:(id)a3
{
  id v3 = [a3 copy];
  id v4 = [v3 setNotificationType:2];
  int v6 = SFDeviceClassCodeGet(v4, v5);
  unsigned int v7 = [v3 interactionDirection];
  if (![v3 interactionBehavior])
  {
    if (dword_100642038 <= 30
      && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 30LL)))
    {
      LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent mediaTransferInfoFromInfo:]",  30LL,  "No interaction behavior provided, using default (prompt)\n");
    }

    [v3 setInteractionBehavior:2];
  }

  if (v7 == 2)
  {
    unsigned int v9 = @"HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING";
  }

  else if (v7 == 1 && v6 == 2)
  {
    unsigned int v9 = @"HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING_IPOD";
  }

  else if (v6 != 2 && v7 == 1)
  {
    unsigned int v9 = @"HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING_IPHONE";
  }

  else
  {
    unsigned int v9 = @"HOMEPOD_HANDOFF_SUBTITLE_TRANSFERRING_GENERIC";
  }

  uint64_t v11 = SFLocalizedStringForKey(v9, v8);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v3 setTitle:v12];

  return v3;
}

- (unint64_t)notificationHomePodTypeForDevice:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 bleDevice]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 model]);
  unsigned int v5 = [v4 isEqualToString:@"AudioAccessory5,1"];

  if (v5) {
    return 2LL;
  }
  else {
    return 1LL;
  }
}

- (id)displayNameForContact:(id)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( +[CNContactFormatter stringFromContact:style:]( &OBJC_CLASS___CNContactFormatter,  "stringFromContact:style:",  a3,  0LL));
  }
  else {
    return 0LL;
  }
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  id v4 = a3;
  if (dword_100642038 <= 50 && (dword_100642038 != -1 || _LogCategory_Initialize(&dword_100642038, 50LL))) {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent proximityDeviceDidTrigger:]",  50LL,  "#ni_estimator handoff delegate triggered for device: %@",  v4);
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_bleActionDevices,  "objectForKeyedSubscript:",  v4));

  if (v5)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007B794;
    block[3] = &unk_1005CB480;
    block[4] = self;
    id v8 = v4;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)testUI:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (dword_100642038 <= 60
    && ((v6 = v3, dword_100642038 != -1) || (v5 = _LogCategory_Initialize(&dword_100642038, 60LL), id v4 = v6, v5)))
  {
    LogPrintF( &dword_100642038,  "-[SDProxHandoffAgent testUI:]",  60LL,  "### Test UI not supported on current platform.\n");
  }

  else
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