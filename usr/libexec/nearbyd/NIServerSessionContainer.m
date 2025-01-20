@interface NIServerSessionContainer
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)_isClientInternalTool;
- (BOOL)_isClientOnGeneralEntitlementAllowlist;
- (BOOL)_isClientOnSystemShutdownAllowlist;
- (BOOL)_supportedPlatform;
- (BOOL)_updateInterruptionForUWBServiceState:(int)a3 cause:(int)a4 requiresNarrowBand:(BOOL)a5;
- (BOOL)_updateInterruptionForUWBSystemOffWithCause:(int)a3;
- (BOOL)addObservers:(id)a3;
- (BOOL)entitlementGranted:(int)a3;
- (BOOL)isBackgroundOperationAllowed;
- (BOOL)isInteresetedInSample:(id)a3;
- (BOOL)isInterestedInSamplesForDevice:(id)a3;
- (BOOL)longRangeEnabled;
- (BOOL)removeObservers:(id)a3;
- (BOOL)requiresBiasCorrection;
- (BOOL)requiresLargeRegions;
- (BOOL)supportsDevicePresence;
- (BOOL)supportsSessionObservers;
- (NIRecentlyObservedObjectsCache)nearbyObjectsCache;
- (NIServerSessionActivationGuard)activationGuard;
- (NIServerSessionAggregateStateProvider)aggregateStateProvider;
- (NIServerSessionContainer)init;
- (NIServerSessionContainer)initWithClient:(id)a3 clientInfo:(const NIServerClientInfo *)a4 connection:(id)a5 authorizationManager:(id)a6;
- (NIServerSessionObservationRegistrar)observationRegistrar;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)processNameBestGuess;
- (NSString)signingIdentity;
- (NSUUID)sessionIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)connectionQueue;
- (PRAppStateMonitor)appStateMonitor;
- (PRUWBServiceProviding)uwbProvider;
- (PRWiFiServiceProviding)wifiProvider;
- (basic_string<char,)_interruptionsMapAsString;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_augmentDiscoveryToken:(id)a3 withHomeAnchorVariant:(unsigned int)a4;
- (id)_augmentDiscoveryTokenWithDeviceCapabilities:(id)a3;
- (id)_augmentDiscoveryTokenWithNbUwbAcquisitionChannel:(id)a3;
- (id)_displayPermissionsPromptIfNeeded;
- (id)_fatalErrorForUwbServiceState:(int)a3 cause:(int)a4;
- (id)_getCapabilities;
- (id)_getExpandedCapabilities;
- (id)analytics;
- (id)btResource;
- (id)canHandleAcwgMsg:(id)a3;
- (id)clientProcessSigningIdentity;
- (id)devicePresenceResource;
- (id)discoveryToken;
- (id)getQueueForInputingData;
- (id)lifecycleSupervisor;
- (id)printableState;
- (id)recentlyObservedObjectsCache;
- (id)remote;
- (id)serverSessionIdentifier;
- (id)updatesQueue;
- (id)uwbResource;
- (id)visionResource;
- (id)wifiResource;
- (int)clientPid;
- (int)latestAppState;
- (int)pid;
- (int64_t)latestBluetoothState;
- (shared_ptr<rose::PowerBudgetProvider>)powerBudgetProvider;
- (shared_ptr<rose::protobuf::Logger>)protobufLogger;
- (unsigned)_getDiscoveryTokenFlags;
- (unsigned)latestSessionContainerState;
- (unsigned)specializedSessionBackgroundSupport;
- (void)_acquireClientAssertionIfNecessary;
- (void)_activateBluetoothResource;
- (void)_addObject:(id)a3 reply:(id)a4;
- (void)_dumpInterruptionsMapWithDebugString:(id)a3;
- (void)_handleBluetoothBecameAvailable;
- (void)_handleBluetoothBecameUnavailable;
- (void)_handleSpecializedSessionBackgroundSupportUpdate:(BOOL)a3;
- (void)_handleSpecializedSessionInvalidation:(id)a3;
- (void)_populateClientEntitlements;
- (void)_processBluetoothSample:(id)a3;
- (void)_processCarKeyEvent:(id)a3 reply:(id)a4;
- (void)_processFindingEvent:(id)a3 reply:(id)a4;
- (void)_processSystemEvent:(id)a3 reply:(id)a4;
- (void)_provideTruthTag:(id)a3;
- (void)_removeObject:(id)a3 reply:(id)a4;
- (void)_setContainerState:(unsigned __int8)a3;
- (void)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4 reply:(id)a5;
- (void)_setURSKTTL:(unint64_t)a3 reply:(id)a4;
- (void)_updateClientAppVisibilityInterruption;
- (void)_updateInterruptionForUWBSystemError;
- (void)_updateInterruptionForUWBSystemReady;
- (void)activate:(id)a3;
- (void)arSessionDidFailWithError:(id)a3;
- (void)arSessionInterruptionEnded;
- (void)arSessionWasInterrupted;
- (void)arSessionWillRunWithInvalidConfiguration;
- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3;
- (void)bluetoothDidChangeState:(int64_t)a3;
- (void)bluetoothServiceInterrupted;
- (void)consumeBluetoothSample:(id)a3;
- (void)dealloc;
- (void)deleteURSKs:(id)a3;
- (void)didDiscoverDevice:(id)a3;
- (void)didFailWithErrorCode:(int64_t)a3 errorString:(const void *)a4;
- (void)didFinishActivatingWithDiscoveryTokenData:(id)a3 error:(id)a4;
- (void)didLoseDevice:(id)a3;
- (void)didReceiveNewSolution:(const void *)a3;
- (void)didReceiveRemoteData:(const void *)a3;
- (void)didReceiveSessionStartNotification:(const void *)a3;
- (void)discoveredDevice:(id)a3 didUpdate:(id)a4;
- (void)generateDiscoveryToken;
- (void)getActivelyInteractingDiscoveryTokens:(id)a3;
- (void)getInteractableDiscoveryTokens:(id)a3;
- (void)getLocalDevicePrintableState:(id)a3;
- (void)interruptSessionWithReason:(int64_t)a3 monotonicTimeSeconds:(double)a4;
- (void)interruptionReasonEnded:(int64_t)a3 monotonicTimeSeconds:(double)a4;
- (void)invalidate;
- (void)isExtendedDistanceMeasurementAllowed:(id)a3;
- (void)isPreciseRangingAllowed:(id)a3;
- (void)isRangingLimitExceeded:(id)a3;
- (void)monitoredApp:(int)a3 didChangeState:(int)a4;
- (void)notifySystemShutdownWithReason:(int64_t)a3 reply:(id)a4;
- (void)pause:(id)a3;
- (void)prefetchAcwgUrsk:(unsigned int)a3;
- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4;
- (void)processAcwgM3Msg:(id)a3;
- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4;
- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 reply:(id)a6;
- (void)processDCKMessage:(id)a3 reply:(id)a4;
- (void)processUpdatedLockState:(unsigned __int16)a3;
- (void)processVisionInput:(id)a3;
- (void)queryDeviceCapabilities:(id)a3;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
- (void)runWithConfiguration:(id)a3 reply:(id)a4;
- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3;
- (void)setActivationGuard:(id)a3;
- (void)setAggregateStateProvider:(id)a3;
- (void)setAppStateMonitor:(id)a3;
- (void)setLatestAppState:(int)a3;
- (void)setLatestBluetoothState:(int64_t)a3;
- (void)setLatestSessionContainerState:(unsigned __int8)a3;
- (void)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4 reply:(id)a5;
- (void)setLocalDeviceDebugParameters:(id)a3 reply:(id)a4;
- (void)setLocalDeviceInteractableDiscoveryTokens:(id)a3 reply:(id)a4;
- (void)setNearbyObjectsCache:(id)a3;
- (void)setObservationRegistrar:(id)a3;
- (void)setSpecializedSessionBackgroundSupport:(unsigned __int8)a3;
- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
@end

@implementation NIServerSessionContainer

- (NIServerSessionContainer)init
{
}

- (NIServerSessionContainer)initWithClient:(id)a3 clientInfo:(const NIServerClientInfo *)a4 connection:(id)a5 authorizationManager:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 _queue]);
  dispatch_assert_queue_V2(v14);

  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }

  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v34 handleFailureInMethod:a2, self, @"NIServerSessionContainer.mm", 304, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v35 handleFailureInMethod:a2, self, @"NIServerSessionContainer.mm", 305, @"Invalid parameter not satisfying: %@", @"authorizationManager" object file lineNumber description];

LABEL_3:
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___NIServerSessionContainer;
  v15 = -[NIServerSessionContainer init](&v36, "init");
  v16 = v15;
  if (v15)
  {
    v15->_entitlementsLock._os_unfair_lock_opaque = 0;
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NIServerClientPublisher publisherForClient:]( &OBJC_CLASS___NIServerClientPublisher,  "publisherForClient:",  v11));
    client = v16->_client;
    v16->_client = (NIServerClientPublisher *)v17;

    objc_storeStrong((id *)&v16->_connection, a5);
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v12 _queue]);
    connectionQueue = v16->_connectionQueue;
    v16->_connectionQueue = (OS_dispatch_queue *)v19;

    v21 = objc_opt_new(&OBJC_CLASS___NSUUID);
    sessionIdentifier = v16->_sessionIdentifier;
    v16->_sessionIdentifier = v21;

    objc_storeStrong((id *)&v16->_signingIdentity, a4->var0);
    bundleIdentifier = v16->_bundleIdentifier;
    v16->_bundleIdentifier = 0LL;

    v16->_pid = a4->var1;
    *(void *)v16->_clientEntitlementsArray.__elems_ = 0LL;
    v16->_clientEntitlementsArray.__elems_[8] = 0;
    objc_storeStrong((id *)&v16->_authManager, a6);
    v24 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](v16, "signingIdentity"));
      unsigned int v26 = -[NIServerSessionContainer pid](v16, "pid");
      v27 = v16->_sessionIdentifier;
      *(_DWORD *)buf = 138412802;
      v38 = v25;
      __int16 v39 = 1024;
      unsigned int v40 = v26;
      __int16 v41 = 2112;
      v42 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Container init. Signing identity: %@, pid: %d, session identifier: %@",  buf,  0x1Cu);
    }

    localDiscoveryToken = v16->_localDiscoveryToken;
    v16->_localDiscoveryToken = 0LL;

    *(_WORD *)&v16->_latestSessionContainerState = 0;
    v16->_latestBluetoothState = 0LL;
    v16->_latestAppState = 0;
    v29 = -[NIServerAssertionManager initWithClientPid:signingIdentity:sessionIdentifier:]( objc_alloc(&OBJC_CLASS___NIServerAssertionManager),  "initWithClientPid:signingIdentity:sessionIdentifier:",  v16->_pid,  v16->_signingIdentity,  v16->_sessionIdentifier);
    assertionManager = v16->_assertionManager;
    v16->_assertionManager = v29;

    v16->_connectedToUwbProvider = 0;
    activationError = v16->_activationError;
    v16->_activationError = 0LL;

    double v32 = sub_100023CC4();
    v16->_initTime = v32;
    v16->_timeOfLatestContainerState = v32;
  }

  return v16;
}

- (void)dealloc
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    signingIdentity = self->_signingIdentity;
    int pid = self->_pid;
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    v10 = signingIdentity;
    __int16 v11 = 1024;
    int v12 = pid;
    __int16 v13 = 2112;
    v14 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Container dealloc. Signing identity: %@, pid: %d, session identifier: %@",  buf,  0x1Cu);
  }

  if (self->_connectedToUwbProvider)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
    [v7 disconnect];

    self->_connectedToUwbProvider = 0;
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIServerSessionContainer;
  -[NIServerSessionContainer dealloc](&v8, "dealloc");
}

- (PRUWBServiceProviding)uwbProvider
{
  __int16 v11 = self;
  if (!self->_uwbProvider)
  {
    v3 = objc_alloc(&OBJC_CLASS___PRUWBManagerAgent);
    sub_100046EDC(&v11, &v9);
    v4 = -[PRUWBManagerAgent initWithClientReference:](v3, "initWithClientReference:", &v9);
    uwbProvider = v11->_uwbProvider;
    v11->_uwbProvider = v4;

    v6 = v10;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        unint64_t v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }

  return (PRUWBServiceProviding *)v11->_uwbProvider;
}

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession description](self->_specializedSession, "description"));
  uint64_t v9 = -[NSMutableString initWithFormat:]( v3,  "initWithFormat:",  @"<Session Container %@ running with specialized session: %@>",  v7,  v8);

  return (NSString *)v9;
}

- (PRWiFiServiceProviding)wifiProvider
{
  wifiProvider = self->_wifiProvider;
  if (!wifiProvider)
  {
    uint64_t v4 = objc_alloc_init(&OBJC_CLASS___PRWiFiManagerAgent);
    v5 = self->_wifiProvider;
    self->_wifiProvider = v4;

    wifiProvider = self->_wifiProvider;
  }

  return (PRWiFiServiceProviding *)wifiProvider;
}

- (BOOL)supportsSessionObservers
{
  return -[NIServerBaseSession supportsSessionObservers](self->_specializedSession, "supportsSessionObservers");
}

- (BOOL)addObservers:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[NIServerBaseSession supportsSessionObservers](self->_specializedSession, "supportsSessionObservers");
  if (v5)
  {
    -[NIServerClientPublisher addObservers:](self->_client, "addObservers:", v4);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10038B000();
  }

  return v5;
}

- (BOOL)removeObservers:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[NIServerBaseSession supportsSessionObservers](self->_specializedSession, "supportsSessionObservers");
  if (v5)
  {
    -[NIServerClientPublisher removeObservers:](self->_client, "removeObservers:", v4);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10038B02C();
  }

  return v5;
}

- (void)queryDeviceCapabilities:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v11 = 138412802;
    int v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = v7;
    __int16 v15 = 2112;
    v16 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - queryDeviceCapabilities. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v11,  0x1Cu);
  }

  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _getExpandedCapabilities](self, "_getExpandedCapabilities"));
  v4[2](v4, v10);
}

- (void)activate:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  BOOL v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (char *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    double v32 = v6;
    __int16 v33 = 1024;
    int v34 = v7;
    __int16 v35 = 2112;
    objc_super v36 = (const char *)sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - activate. Signing identity: %@, pid: %d, session identifier: %@",  buf,  0x1Cu);
  }

  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 1LL);
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v11 = [v10 BOOLForKey:@"ForceCrash_SessionActivate"];

    if (v11)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_10038B058();
      }
      v28 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        double v32 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerSessionContainer.mm";
        __int16 v33 = 1024;
        int v34 = 424;
        __int16 v35 = 2080;
        objc_super v36 = "-[NIServerSessionContainer activate:]";
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "#ses-container,%s:%d: assertion failure in %s",  buf,  0x1Cu);
      }

      abort();
    }
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NIServerSessionContainer entitlementGranted:]( self,  "entitlementGranted:",  0LL,  @"InternalClient")));
  v30 = v12;
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
  unsigned int v14 = (char *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v13));

  if (-[NIServerSessionContainer _supportedPlatform](self, "_supportedPlatform"))
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer activationGuard](self, "activationGuard"));
    if ([v15 isSessionAllowedToActivate:self])
    {
      v16 = -[NIServerAnalyticsManager initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___NIServerAnalyticsManager),  "initWithBundleIdentifier:",  self->_bundleIdentifier);
      analyticsManager = self->_analyticsManager;
      self->_analyticsManager = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
      BOOL v19 = ([v18 deviceCapabilities] & 1) == 0;

      if (!v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
        [v20 connect];

        self->_connectedToUwbProvider = 1;
      }

      v21 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        double v32 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "#ses-container,activation success. Response: %{private}@",  buf,  0xCu);
      }

      -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 2LL);
      v4[2](v4, v14, 0LL);
    }

    else
    {
      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5885LL,  0LL));
      activationError = self->_activationError;
      p_activationError = &self->_activationError;
      *p_activationError = (NSError *)v25;

      ((void (**)(id, void *, NSError *))v4)[2](v4, v14, *p_activationError);
    }
  }

  else
  {
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5889LL,  0LL));
    v24 = self->_activationError;
    v23 = &self->_activationError;
    *v23 = (NSError *)v22;

    ((void (**)(id, void *, NSError *))v4)[2](v4, v14, *v23);
  }
}

- (void)runWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, NSError *))a4;
  unint64_t v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    *(void *)v99 = v9;
    *(_WORD *)&v99[8] = 1024;
    *(_DWORD *)&v99[10] = v10;
    *(_WORD *)&v99[14] = 2112;
    *(void *)&v99[16] = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - runWithConfiguration. Signing identity: %@, pid: %d, session identifier: %@",  buf,  0x1Cu);
  }

  int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  if (-[NIServerSessionContainer _supportedPlatform](self, "_supportedPlatform"))
  {
    if (v6)
    {
      -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 3LL);
      if ([v6 _internalOsTransactionRequired] && !self->_osTransaction)
      {
        __int16 v13 = (OS_os_transaction *)os_transaction_create("com.apple.nearbyd.hasActiveClient");
        osTransaction = self->_osTransaction;
        self->_osTransaction = v13;
      }

      if (self->_activationError)
      {
        __int16 v15 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10038B2FC(buf, -[NSError code](self->_activationError, "code"), v15);
        }

        v7[2](v7, self->_activationError);
        goto LABEL_19;
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
      unsigned __int8 v19 = [v18 deviceCapabilities];

      v21 = (NSError *)objc_claimAutoreleasedReturnValue( -[NIServerSessionContainer _displayPermissionsPromptIfNeeded]( self,  "_displayPermissionsPromptIfNeeded"));
      if (v21) {
        goto LABEL_17;
      }
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___NINearbyPeerConfiguration, v20);
      if ((objc_opt_isKindOfClass(v6, v22) & 1) != 0)
      {
        v24 = off_1007A0428;
      }

      else
      {
        uint64_t v25 = objc_opt_class(&OBJC_CLASS____NIWiFiRangingTestConfiguration, v23);
        if ((objc_opt_isKindOfClass(v6, v25) & 1) != 0)
        {
          v24 = &off_1007A0610;
        }

        else
        {
          uint64_t v26 = objc_opt_class(&OBJC_CLASS___NIHomeDeviceConfiguration, v23);
          if ((objc_opt_isKindOfClass(v6, v26) & 1) != 0)
          {
            v24 = off_1007A0418;
          }

          else
          {
            uint64_t v27 = objc_opt_class(&OBJC_CLASS___NIRangingAuthConfiguration, v23);
            if ((objc_opt_isKindOfClass(v6, v27) & 1) != 0)
            {
              v24 = off_1007A0430;
            }

            else
            {
              uint64_t v28 = objc_opt_class(&OBJC_CLASS___NICarKeyConfiguration, v23);
              if ((objc_opt_isKindOfClass(v6, v28) & 1) != 0)
              {
                v24 = off_1007A0400;
              }

              else
              {
                uint64_t v29 = objc_opt_class(&OBJC_CLASS___NIAcwgConfiguration, v23);
                if ((objc_opt_isKindOfClass(v6, v29) & 1) != 0)
                {
                  v24 = off_1007A03F8;
                }

                else
                {
                  uint64_t v30 = objc_opt_class(&OBJC_CLASS___NINearbyAccessoryConfiguration, v23);
                  if ((objc_opt_isKindOfClass(v6, v30) & 1) != 0)
                  {
                    v24 = off_1007A0420;
                  }

                  else
                  {
                    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NIDevicePresenceConfiguration, v23);
                    if ((objc_opt_isKindOfClass(v6, v31) & 1) != 0)
                    {
                      v24 = off_1007A0408;
                    }

                    else
                    {
                      uint64_t v32 = objc_opt_class(&OBJC_CLASS___NISpatialBrowsingConfiguration, v23);
                      if ((objc_opt_isKindOfClass(v6, v32) & 1) == 0)
                      {
                        uint64_t v85 = objc_opt_class(&OBJC_CLASS___NIFindingConfiguration, v23);
                        if ((objc_opt_isKindOfClass(v6, v85) & 1) != 0)
                        {
                          if (-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 4LL))
                          {
                            v24 = off_1007A0410;
                            goto LABEL_38;
                          }

                          v88 = (os_log_s *)(id)qword_1008000A0;
                          if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
                          {
                            v90 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
                            unsigned int v91 = -[NIServerSessionContainer pid](self, "pid");
                            v92 = self->_sessionIdentifier;
                            *(_DWORD *)buf = 138412802;
                            *(void *)v99 = v90;
                            *(_WORD *)&v99[8] = 1024;
                            *(_DWORD *)&v99[10] = v91;
                            *(_WORD *)&v99[14] = 2112;
                            *(void *)&v99[16] = v92;
                            _os_log_fault_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_FAULT,  "#ses-container,Finding configuration not allowed. Signing identity: %@, pid: %d, session identifier: %@.",  buf,  0x1Cu);
                          }

                          NSErrorUserInfoKey v104 = NSLocalizedFailureReasonErrorKey;
                          v105 = @"Finding configuration not allowed.";
                          v89 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v105,  &v104,  1LL));
                          v21 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v89));
                        }

                        else
                        {
                          uint64_t v87 = objc_opt_class(&OBJC_CLASS___NISystemConfiguration, v86);
                          if ((objc_opt_isKindOfClass(v6, v87) & 1) != 0)
                          {
                            v24 = &off_1007A0440;
                            goto LABEL_38;
                          }

                          v21 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
                        }

                        if (v21)
                        {
                          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                            sub_10038B294();
                          }
LABEL_17:
                          v7[2](v7, v21);
LABEL_18:

                          goto LABEL_19;
                        }

                        __int16 v33 = 0LL;
LABEL_39:
                        specializedSession = self->_specializedSession;
                        if (specializedSession)
                        {
                          if (-[NIServerBaseSession updateConfiguration:]( specializedSession,  "updateConfiguration:",  v6))
                          {
                            __int16 v35 = (os_log_s *)qword_1008000A0;
                            int v36 = 0;
                            if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
                              goto LABEL_51;
                            }
                            *(_WORD *)buf = 0;
                            v37 = "#ses-container,runWithConfiguration can update previous configuration.";
LABEL_46:
                            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
                            int v36 = 0;
                            goto LABEL_51;
                          }

                          v38 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerBaseSession lastConfiguration]( self->_specializedSession,  "lastConfiguration"));
                          unsigned int v39 = [v38 isEqual:v6];

                          __int16 v35 = (os_log_s *)qword_1008000A0;
                          if (v39)
                          {
                            int v36 = 0;
                            if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
                              goto LABEL_51;
                            }
                            *(_WORD *)buf = 0;
                            v37 = "#ses-container,runWithConfiguration with previously run configuration.";
                            goto LABEL_46;
                          }

                          unsigned int v40 = (os_log_s *)(id)qword_1008000A0;
                          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                          {
                            __int16 v41 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerBaseSession lastConfiguration]( self->_specializedSession,  "lastConfiguration"));
                            *(_DWORD *)buf = 138412546;
                            *(void *)v99 = v41;
                            *(_WORD *)&v99[8] = 2112;
                            *(void *)&v99[10] = v6;
                            _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Existing session with different config.\nCurrent:%@\nNew:%@",  buf,  0x16u);
                          }
                        }

                        int v36 = 1;
LABEL_51:
                        v42 = (os_log_s *)(id)qword_1008000A0;
                        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                        {
                          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
                          unsigned int v44 = -[NIServerSessionContainer pid](self, "pid");
                          *(_DWORD *)buf = 67109634;
                          *(_DWORD *)v99 = v36;
                          *(_WORD *)&v99[4] = 2112;
                          *(void *)&v99[6] = v43;
                          *(_WORD *)&v99[14] = 1024;
                          *(_DWORD *)&v99[16] = v44;
                          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Creating a new session: %d, Signing identity: %@, pid: %d.",  buf,  0x18u);
                        }

                        if (v36)
                        {
                          -[NIServerBaseSession invalidate](self->_specializedSession, "invalidate");
                          lifeCycleManager = self->_lifeCycleManager;
                          self->_lifeCycleManager = 0LL;

                          v46 = self->_specializedSession;
                          self->_specializedSession = 0LL;

                          sub_100046F88(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_);
                          id v97 = 0LL;
                          v47 = (NIServerBaseSession *)[[v33 alloc] initWithResourcesManager:self configuration:v6 error:&v97];
                          v21 = (NSError *)v97;
                          v48 = self->_specializedSession;
                          self->_specializedSession = v47;

                          if (v21)
                          {
                            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                              sub_10038B22C();
                            }
                            v7[2](v7, v21);
                            goto LABEL_18;
                          }

                          objc_initWeak((id *)buf, self);
                          v49 = self->_specializedSession;
                          v95[0] = _NSConcreteStackBlock;
                          v95[1] = 3221225472LL;
                          v95[2] = sub_10003D768;
                          v95[3] = &unk_1007A1CC8;
                          objc_copyWeak(&v96, (id *)buf);
                          -[NIServerBaseSession setInvalidationHandler:](v49, "setInvalidationHandler:", v95);
                          v50 = self->_specializedSession;
                          v93[0] = _NSConcreteStackBlock;
                          v93[1] = 3221225472LL;
                          v93[2] = sub_10003D7C8;
                          v93[3] = &unk_1007A3188;
                          objc_copyWeak(&v94, (id *)buf);
                          -[NIServerBaseSession setBackgroundSupportUpdateHandler:]( v50,  "setBackgroundSupportUpdateHandler:",  v93);
                          v51 = -[NIServerSessionLifeCycleManager initWithSessionIdentifier:cycleRate:updatesQueue:analyticsManager:]( objc_alloc(&OBJC_CLASS___NIServerSessionLifeCycleManager),  "initWithSessionIdentifier:cycleRate:updatesQueue:analyticsManager:",  self->_sessionIdentifier,  -[NIServerBaseSession nominalCycleRate](self->_specializedSession, "nominalCycleRate"),  self->_connectionQueue,  self->_analyticsManager);
                          v52 = self->_lifeCycleManager;
                          self->_lifeCycleManager = v51;

                          id v53 = -[NIServerSessionLifeCycleManager addObserver:]( self->_lifeCycleManager,  "addObserver:",  self->_specializedSession);
                          v54 = self->_specializedSession;
                          v55 = (void *)voucher_copy(v53);
                          -[NIServerBaseSession setClientVoucher:](v54, "setClientVoucher:", v55);

                          if ((v19 & 1) != 0)
                          {
                            v56 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
                            [v56 requestAsyncServiceStatusUpdate];
                          }

                          -[NIServerSessionContainer _handleSpecializedSessionBackgroundSupportUpdate:]( self,  "_handleSpecializedSessionBackgroundSupportUpdate:",  -[NIServerBaseSession supportsBackgroundedClients]( self->_specializedSession,  "supportsBackgroundedClients"));
                          objc_destroyWeak(&v94);
                          objc_destroyWeak(&v96);
                          objc_destroyWeak((id *)buf);
                        }

                        unint64_t v57 = -[NIServerBaseSession requiresUWBToRun](self->_specializedSession, "requiresUWBToRun");
                        unint64_t v58 = -[NIServerBaseSession requiresNarrowbandToRun]( self->_specializedSession,  "requiresNarrowbandToRun");
                        if (v58 == 2 && v57 != 2) {
                          __assert_rtn( "-[NIServerSessionContainer runWithConfiguration:reply:]",  "NIServerSessionContainer.mm",  685,  "requiresUWBToRun");
                        }
                        if (v57 == 2)
                        {
                          v59 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
                          unint64_t v60 = (unint64_t)[v59 currentServiceState];

                          BOOL v61 = (_DWORD)v60 == 1;
                          if (v58 != 2) {
                            BOOL v61 = (v60 - 1) < 2;
                          }
                          if (!v61)
                          {
                            v62 = (os_log_s *)qword_1008000A0;
                            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
                            {
                              v81 = self->_sessionIdentifier;
                              v82 = @"NO";
                              *(_DWORD *)buf = 138413314;
                              if (v58 == 2) {
                                v83 = @"YES";
                              }
                              else {
                                v83 = @"NO";
                              }
                              *(void *)v99 = v81;
                              *(_WORD *)&v99[8] = 2112;
                              else {
                                v84 = @"YES";
                              }
                              *(void *)&v99[10] = @"YES";
                              if ((_DWORD)v60 == 1) {
                                v82 = @"YES";
                              }
                              *(_WORD *)&v99[18] = 2112;
                              *(void *)&v99[20] = v83;
                              __int16 v100 = 2112;
                              v101 = v84;
                              __int16 v102 = 2112;
                              v103 = v82;
                              _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "#ses-container,Specialized session %@, requires UWB: %@, requires NB: %@, UWB available: %@, NB available: %@",  buf,  0x34u);
                            }

                            v21 = (NSError *)objc_claimAutoreleasedReturnValue( -[NIServerSessionContainer _fatalErrorForUwbServiceState:cause:]( self,  "_fatalErrorForUwbServiceState:cause:",  v60,  HIDWORD(v60)));
                            if (!v21)
                            {
                              if (!-[NIServerSessionContainer _updateInterruptionForUWBServiceState:cause:requiresNarrowBand:]( self,  "_updateInterruptionForUWBServiceState:cause:requiresNarrowBand:",  v60,  HIDWORD(v60),  v58 == 2)) {
                                __assert_rtn( "-[NIServerSessionContainer runWithConfiguration:reply:]",  "NIServerSessionContainer.mm",  732,  "false");
                              }
                              v7[2](v7, 0LL);
                              v21 = 0LL;
                              goto LABEL_18;
                            }

                            goto LABEL_80;
                          }
                        }

                        if (-[NIServerBaseSession requiresSpatialInteractionBluetoothResource]( self->_specializedSession,  "requiresSpatialInteractionBluetoothResource"))
                        {
                          -[NIServerSessionContainer _activateBluetoothResource](self, "_activateBluetoothResource");
                        }

                        v21 = (NSError *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession configure](self->_specializedSession, "configure"));
                        if (v21)
                        {
                          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                            sub_10038B1C4();
                          }
LABEL_80:
                          v7[2](v7, v21);
                          goto LABEL_18;
                        }

                        if (!-[NIServerBaseSession supportsCameraAssistance]( self->_specializedSession,  "supportsCameraAssistance")
                          && [v6 _internalIsCameraAssistanceEnabled])
                        {
                          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                            sub_10038B150();
                          }
                          v21 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
                          ((void (*)(void (**)(id, NSError *)))v7[2])(v7);
                          goto LABEL_18;
                        }

                        if (-[NIServerBaseSession supportsSessionObservers]( self->_specializedSession,  "supportsSessionObservers"))
                        {
                          v63 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer observationRegistrar](self, "observationRegistrar"));
                          [v63 registerObserversForSession:self];
                        }

                        if ([v6 _internalIsCameraAssistanceEnabled])
                        {
                          v64 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerVisionDataDistributor sharedProvider]( &OBJC_CLASS___NIServerVisionDataDistributor,  "sharedProvider"));
                          [v64 registerForVisionInput:self->_specializedSession];
                        }

                        if (!-[NIServerBaseSession supportsDevicePresence]( self->_specializedSession,  "supportsDevicePresence"))
                        {
LABEL_94:
                          v21 = (NSError *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession run](self->_specializedSession, "run"));
                          if (v21)
                          {
                            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                              sub_10038B0E8();
                            }
                            v72 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerVisionDataDistributor sharedProvider]( &OBJC_CLASS___NIServerVisionDataDistributor,  "sharedProvider"));
                            [v72 unregisterForVisionInput:self->_specializedSession];

                            v73 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerSessionContainer devicePresenceResource]( self,  "devicePresenceResource"));
                            v74 = (void *)objc_claimAutoreleasedReturnValue([v73 internalObserver]);
                            [v74 stopLeechingForConsumer:self];

                            v75 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerSessionContainer devicePresenceResource]( self,  "devicePresenceResource"));
                            v76 = (void *)objc_claimAutoreleasedReturnValue([v75 internalObserver]);
                            [v76 unregisterForInternalBluetoothSamples:self];

                            v7[2](v7, v21);
                          }

                          else
                          {
                            -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 4LL);
                            v7[2](v7, 0LL);
                            if ([v6 _internalIsCameraAssistanceEnabled]
                              && ([v6 _internalIsCameraAssistanceInClientProcess] & 1) == 0)
                            {
                              v77 = objc_alloc(&OBJC_CLASS___NIServerVisionInternalSessionRequest);
                              v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_sessionIdentifier, "UUIDString"));
                              v79 = -[NIServerVisionInternalSessionRequest initWithIdentifier:observer:]( v77,  "initWithIdentifier:observer:",  v78,  self);
                              visionSessionRequest = self->_visionSessionRequest;
                              self->_visionSessionRequest = v79;

                              -[NIServerVisionInternalSessionRequest activate](self->_visionSessionRequest, "activate");
                            }

                            v21 = 0LL;
                            -[NIServerAnalyticsManager sessionSuccessfullyRanWithConfig:withTimestamp:]( self->_analyticsManager,  "sessionSuccessfullyRanWithConfig:withTimestamp:",  v6,  sub_100023CC4());
                          }

                          goto LABEL_18;
                        }

                        uint64_t v66 = objc_opt_class(&OBJC_CLASS___NIDevicePresenceConfiguration, v65);
                        if ((objc_opt_isKindOfClass(v6, v66) & 1) != 0)
                        {
                          id v67 = v6;
                          v68 = (void *)objc_claimAutoreleasedReturnValue([v67 token]);
                          BOOL v69 = v68 == 0LL;

                          if (!v69)
                          {
                            v70 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerSessionContainer devicePresenceResource]( self,  "devicePresenceResource"));
                            v71 = (void *)objc_claimAutoreleasedReturnValue([v70 internalObserver]);
                            [v71 registerForInternalBluetoothSamples:self reportCache:0];

LABEL_93:
                            goto LABEL_94;
                          }
                        }

                        id v67 = (id)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
                        v70 = (void *)objc_claimAutoreleasedReturnValue([v67 internalObserver]);
                        [v70 registerForInternalBluetoothSamples:self];
                        goto LABEL_93;
                      }

                      v24 = off_1007A0438;
                    }
                  }
                }
              }
            }
          }
        }
      }

- (void)pause:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  BOOL v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v13 = 138412802;
    unsigned int v14 = v6;
    __int16 v15 = 1024;
    unsigned int v16 = v7;
    __int16 v17 = 2112;
    v18 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - pause. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v13,  0x1Cu);
  }

  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  if (-[NIServerSessionContainer _supportedPlatform](self, "_supportedPlatform"))
  {
    if (self->_specializedSession)
    {
      -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 5LL);
      -[NIServerAnalyticsManager sessionPausedWithTimestamp:]( self->_analyticsManager,  "sessionPausedWithTimestamp:",  sub_100023CC4());
      -[NIServerBaseSession setClientVoucher:](self->_specializedSession, "setClientVoucher:", 0LL);
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession pauseWithSource:](self->_specializedSession, "pauseWithSource:", 1LL));
      if (!v10) {
        -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 6LL);
      }
      v4[2](v4, v10);
    }

    else
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
      v4[2](v4, v12);

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10038B084();
      }
    }
  }

  else
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5889LL,  0LL));
    v4[2](v4, v11);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B340();
    }
  }
}

- (void)generateDiscoveryToken
{
  v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v5 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v8 = 138412802;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    unsigned int v11 = v5;
    __int16 v12 = 2112;
    int v13 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - generateDiscoveryToken. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v8,  0x1Cu);
  }

  unsigned int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v7);

  -[NIServerSessionContainer _activateBluetoothResource](self, "_activateBluetoothResource");
}

- (void)notifySystemShutdownWithReason:(int64_t)a3 reply:(id)a4
{
  id v6 = (void (**)(id, int64_t))a4;
  unsigned int v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    v24 = v8;
    __int16 v25 = 1024;
    unsigned int v26 = v9;
    __int16 v27 = 2112;
    uint64_t v28 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - notifySystemShutdownWithReason. Signing identity: %@, pid: %d, session identifier: %@",  buf,  0x1Cu);
  }

  if (-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 6LL))
  {
    if ((unint64_t)(a3 - 1) >= 2)
    {
      if (a3)
      {
        NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
        uint64_t v20 = @"Invalid reason.";
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
        a3 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v14));
      }
    }

    else
    {
      unsigned int v11 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ses-container,#shutdown STARTING non-user shutdown tasks",  buf,  2u);
      }

      __int16 v12 = sub_100288340();
      if ((sub_100288598((uint64_t)v12) & 1) != 0)
      {
        a3 = 0LL;
      }

      else
      {
        NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
        v18 = @"Shutdown operation failed.";
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
        a3 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v15));
      }

      unsigned int v16 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#ses-container,#shutdown FINISHED non-user shutdown tasks",  buf,  2u);
      }
    }

    v6[2](v6, a3);
  }

  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    uint64_t v22 = @"Operation disallowed.";
    a3 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  a3));
    v6[2](v6, (int64_t)v13);
  }
}

- (void)_provideTruthTag:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v10 = 138412802;
    unsigned int v11 = v6;
    __int16 v12 = 1024;
    unsigned int v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - _provideTruthTag. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v10,  0x1Cu);
  }

  unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  sub_100047B88(v4);
}

- (void)_addObject:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  int v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v17 = 138412802;
    v18 = v9;
    __int16 v19 = 1024;
    unsigned int v20 = v10;
    __int16 v21 = 2112;
    uint64_t v22 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - _addObject. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v17,  0x1Cu);
  }

  __int16 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  if (-[NIServerSessionContainer _supportedPlatform](self, "_supportedPlatform"))
  {
    specializedSession = self->_specializedSession;
    if (specializedSession)
    {
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession addObject:](specializedSession, "addObject:", v6));
      v7[2](v7, v14);
    }

    else
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
      v7[2](v7, v16);

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10038B084();
      }
    }
  }

  else
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5889LL,  0LL));
    v7[2](v7, v15);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B340();
    }
  }
}

- (void)_removeObject:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  int v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v17 = 138412802;
    v18 = v9;
    __int16 v19 = 1024;
    unsigned int v20 = v10;
    __int16 v21 = 2112;
    uint64_t v22 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - _removeObject. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v17,  0x1Cu);
  }

  __int16 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  if (-[NIServerSessionContainer _supportedPlatform](self, "_supportedPlatform"))
  {
    specializedSession = self->_specializedSession;
    if (specializedSession)
    {
      __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession removeObject:](specializedSession, "removeObject:", v6));
      v7[2](v7, v14);
    }

    else
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
      v7[2](v7, v16);

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10038B084();
      }
    }
  }

  else
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5889LL,  0LL));
    v7[2](v7, v15);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B340();
    }
  }
}

- (void)isPreciseRangingAllowed:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  unsigned int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v11 = 138412802;
    __int16 v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = v7;
    __int16 v15 = 2112;
    unsigned int v16 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - isPreciseRangingAllowed. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v11,  0x1Cu);
  }

  unsigned int v9 = sub_100288340();
  uint64_t v10 = (*(uint64_t (**)(void *))(*(void *)v9 + 152LL))(v9);
  v4[2](v4, v10, 0LL);
}

- (void)isExtendedDistanceMeasurementAllowed:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  unsigned int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v12 = 138412802;
    __int16 v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = v7;
    __int16 v16 = 2112;
    int v17 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - isExtendedDistanceMeasurementAllowed. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v12,  0x1Cu);
  }

  unsigned int v9 = sub_100288340();
  if ((*(unsigned int (**)(void *))(*(void *)v9 + 152LL))(v9))
  {
    uint64_t v10 = sub_100288340();
    uint64_t v11 = (*(uint64_t (**)(void *))(*(void *)v10 + 160LL))(v10);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  v4[2](v4, v11, 0LL);
}

- (void)processDCKMessage:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void, void *))a4;
  int v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v27 = 138412802;
    uint64_t v28 = v9;
    __int16 v29 = 1024;
    unsigned int v30 = v10;
    __int16 v31 = 2112;
    uint64_t v32 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - processDCKMessage. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v27,  0x1Cu);
  }

  int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  if (self->_interruptionsMap.__table_.__p2_.__value_)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10014LL,  0LL));
    v7[2](v7, 0LL, v13);

    __int16 v14 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B3A4(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    -[NIServerSessionContainer _dumpInterruptionsMapWithDebugString:]( self,  "_dumpInterruptionsMapWithDebugString:",  @"processDCKMessage");
  }

  else
  {
    specializedSession = self->_specializedSession;
    if (specializedSession)
    {
      id v23 = -[NIServerBaseSession processDCKMessage:](specializedSession, "processDCKMessage:", v6);
      __int16 v25 = v24;
      ((void (**)(id, id, void *))v7)[2](v7, v23, v24);
    }

    else
    {
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
      v7[2](v7, 0LL, v26);

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10038B084();
      }
    }
  }
}

- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5 reply:(id)a6
{
  unsigned int v10 = (void (**)(id, id, void *))a6;
  uint64_t v11 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v13 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    __int16 v33 = v12;
    __int16 v34 = 1024;
    unsigned int v35 = v13;
    __int16 v36 = 2112;
    v37 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - processBluetoothHostTimeSyncWithType. Signing identity: %@, pid: %d, session identifier: %@",  buf,  0x1Cu);
  }

  uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v15);

  double v16 = sub_100023CC4();
  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    id v29 = 0LL;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerBaseSession processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monotonicTimeSec:response:]( specializedSession,  "processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monotonicTimeSec:response:",  a3,  a4,  a5,  &v29,  v16));
    id v19 = v29;
    v10[2](v10, v19, v18);
  }

  else
  {
    uint64_t v20 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B410(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    __int16 v31 = @"processBluetoothHostTimeSyncWithType called before -runWithConfiguration:";
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v28));

    v10[2](v10, 0LL, v18);
  }
}

- (void)isRangingLimitExceeded:(id)a3
{
  id v4 = (void (**)(id, id, void *))a3;
  unsigned int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v17 = 138412802;
    uint64_t v18 = v6;
    __int16 v19 = 1024;
    unsigned int v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - isRangingLimitExceeded. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v17,  0x1Cu);
  }

  unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    id v11 = -[NIServerBaseSession isRangingLimitExceeded](specializedSession, "isRangingLimitExceeded");
    int v12 = v11;
    __int16 v14 = v13;
    if (v11) {
      id v15 = [v11 BOOLValue];
    }
    else {
      id v15 = 0LL;
    }
    v4[2](v4, v15, v14);
  }

  else
  {
    double v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
    v4[2](v4, 0LL, v16);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B084();
    }
  }
}

- (void)deleteURSKs:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  unsigned int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v13 = 138412802;
    __int16 v14 = v6;
    __int16 v15 = 1024;
    unsigned int v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - deleteURSKs. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v13,  0x1Cu);
  }

  unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession deleteURSKs](specializedSession, "deleteURSKs"));
    v4[2](v4, v11);
  }

  else
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
    v4[2](v4, v12);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B084();
    }
  }
}

- (void)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned int v9 = (void (**)(id, void *))a5;
  unsigned int v10 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v12 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v27 = 138412802;
    uint64_t v28 = v11;
    __int16 v29 = 1024;
    unsigned int v30 = v12;
    __int16 v31 = 2112;
    uint64_t v32 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - _setDebugURSK. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v27,  0x1Cu);
  }

  __int16 v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v14);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    if (v8)
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerBaseSession _setDebugURSK:transactionIdentifier:]( specializedSession,  "_setDebugURSK:transactionIdentifier:",  v8,  v6));
      v9[2](v9, v16);
    }

    else
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -19886LL,  0LL));
      v9[2](v9, v18);

      __int16 v19 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10038B480(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
  }

  else
  {
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
    v9[2](v9, v17);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B084();
    }
  }
}

- (void)_setURSKTTL:(unint64_t)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  unsigned int v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v15 = 138412802;
    unsigned int v16 = v8;
    __int16 v17 = 1024;
    unsigned int v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - _setURSKTTL. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v15,  0x1Cu);
  }

  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v11);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession _setURSKTTL:](specializedSession, "_setURSKTTL:", a3));
    v6[2](v6, v13);
  }

  else
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
    v6[2](v6, v14);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B084();
    }
  }
}

- (void)_processCarKeyEvent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v16 = 138412802;
    __int16 v17 = v9;
    __int16 v18 = 1024;
    unsigned int v19 = v10;
    __int16 v20 = 2112;
    uint64_t v21 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - _processCarKeyEvent. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v16,  0x1Cu);
  }

  unsigned int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession _processCarKeyEvent:](specializedSession, "_processCarKeyEvent:", v6));
    v7[2](v7, v14);
  }

  else
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
    v7[2](v7, v15);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B084();
    }
  }
}

- (id)canHandleAcwgMsg:(id)a3
{
  id v4 = a3;
  if (self->_interruptionsMap.__table_.__p2_.__value_)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10014LL,  0LL));
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B558();
    }
    -[NIServerSessionContainer _dumpInterruptionsMapWithDebugString:](self, "_dumpInterruptionsMapWithDebugString:", v4);
  }

  else if (self->_specializedSession)
  {
    unsigned int v5 = 0LL;
  }

  else
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B4EC();
    }
  }

  return v5;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v14 = 138412802;
    int v15 = v8;
    __int16 v16 = 1024;
    unsigned int v17 = v9;
    __int16 v18 = 2112;
    unsigned int v19 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - processAcwgM1Msg. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v14,  0x1Cu);
  }

  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v11);

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer canHandleAcwgMsg:](self, "canHandleAcwgMsg:", @"processAcwgM1Msg"));
  if (v12)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    [v13 didProcessAcwgM1MsgWithResponse:0 error:v12];
  }

  else
  {
    -[NIServerBaseSession processAcwgM1Msg:withSessionTriggerReason:]( self->_specializedSession,  "processAcwgM1Msg:withSessionTriggerReason:",  v6,  a4);
  }
}

- (void)processAcwgM3Msg:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v12 = 138412802;
    int v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = v7;
    __int16 v16 = 2112;
    unsigned int v17 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - processAcwgM3Msg. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v12,  0x1Cu);
  }

  unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer canHandleAcwgMsg:](self, "canHandleAcwgMsg:", @"processAcwgM3Msg"));
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    [v11 didProcessAcwgM3MsgWithResponse:0 error:v10];
  }

  else
  {
    -[NIServerBaseSession processAcwgM3Msg:](self->_specializedSession, "processAcwgM3Msg:", v4);
  }
}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v14 = 138412802;
    unsigned int v15 = v8;
    __int16 v16 = 1024;
    unsigned int v17 = v9;
    __int16 v18 = 2112;
    unsigned int v19 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - suspendAcwgRanging. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v14,  0x1Cu);
  }

  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v11);

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer canHandleAcwgMsg:](self, "canHandleAcwgMsg:", @"suspendAcwgRanging"));
  if (v12)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    [v13 uwbSessionDidFailWithError:v12];
  }

  else
  {
    -[NIServerBaseSession suspendAcwgRanging:withSuspendTriggerReason:]( self->_specializedSession,  "suspendAcwgRanging:withSuspendTriggerReason:",  v5,  a4);
  }
}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v14 = 138412802;
    unsigned int v15 = v8;
    __int16 v16 = 1024;
    unsigned int v17 = v9;
    __int16 v18 = 2112;
    unsigned int v19 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - processAcwgRangingSessionResumeRequestMsg. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v14,  0x1Cu);
  }

  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v11);

  int v12 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerSessionContainer canHandleAcwgMsg:]( self,  "canHandleAcwgMsg:",  @"processAcwgRangingSessionResumeRequestMsg"));
  if (v12)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    [v13 didProcessAcwgRangingSessionResumeRequestMsgWithResponse:0 error:v12];
  }

  else
  {
    -[NIServerBaseSession processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:]( self->_specializedSession,  "processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:",  v5,  a4);
  }
}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v12 = 138412802;
    int v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = v7;
    __int16 v16 = 2112;
    unsigned int v17 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - prefetchAcwgUrsk. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v12,  0x1Cu);
  }

  unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer canHandleAcwgMsg:](self, "canHandleAcwgMsg:", @"prefetchAcwgUrsk"));
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    [v11 didPrefetchAcwgUrsk:v3 error:v10];
  }

  else
  {
    -[NIServerBaseSession prefetchAcwgUrsk:](self->_specializedSession, "prefetchAcwgUrsk:", v3);
  }
}

- (void)processUpdatedLockState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v11 = 138412802;
    int v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - notifyLockStatusChanged/processUpdatedLockState. Signing identity: %@, pid: %d, sessi on identifier: %@",  (uint8_t *)&v11,  0x1Cu);
  }

  unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerSessionContainer canHandleAcwgMsg:]( self,  "canHandleAcwgMsg:",  @"notifyLockStatusChanged/processUpdatedLockState"));
  if (!v10) {
    -[NIServerBaseSession processUpdatedLockState:](self->_specializedSession, "processUpdatedLockState:", v3);
  }
}

- (void)_processBluetoothSample:(id)a3
{
  id v6 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
  [v5 consumeBluetoothSample:v6];
}

- (void)processVisionInput:(id)a3
{
  id v6 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerVisionDataDistributor sharedProvider]( &OBJC_CLASS___NIServerVisionDataDistributor,  "sharedProvider"));
  [v5 processVisionInput:v6];
}

- (void)arSessionDidFailWithError:(id)a3
{
  id v8 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10010LL,  v5));

  -[NIServerBaseSession invalidate](self->_specializedSession, "invalidate");
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
  [v7 uwbSessionDidFailWithError:v6];
}

- (void)arSessionWasInterrupted
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer interruptSessionWithReason:monotonicTimeSeconds:]( self,  "interruptSessionWithReason:monotonicTimeSeconds:",  6LL,  sub_100023CC4());
}

- (void)arSessionInterruptionEnded
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer interruptionReasonEnded:monotonicTimeSeconds:]( self,  "interruptionReasonEnded:monotonicTimeSeconds:",  6LL,  sub_100023CC4());
}

- (void)arSessionWillRunWithInvalidConfiguration
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5883LL,  0LL));
  -[NIServerBaseSession invalidate](self->_specializedSession, "invalidate");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
  [v3 uwbSessionDidFailWithError:v4];
}

- (void)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v12 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - setLocalDeviceCanInteract:withDiscoveryTokens:. Signing identity: %@, pid: %d, sessio n identifier: %@",  buf,  0x1Cu);
  }

  unsigned int v14 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = "NO";
    if (v6) {
      __int16 v15 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-container,canInteract: %s", buf, 0xCu);
  }

  __int16 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v16);

  LOBYTE(v16) = -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 3LL);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_100040A04;
  __int16 v33 = sub_100040A14;
  __int16 v34 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  uint64_t v26 = sub_100040A1C;
  int v27 = &unk_1007A31B0;
  char v31 = (char)v16;
  id v17 = v9;
  uint64_t v28 = self;
  id v29 = v17;
  unsigned int v30 = buf;
  [v8 enumerateObjectsUsingBlock:&v24];
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild", v24, v25, v26, v27)) {
    sub_1002786E8(*(void **)(*(void *)&buf[8] + 40LL));
  }
  if ([*(id *)(*(void *)&buf[8] + 40) count])
  {
    if (v6)
    {
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindableDeviceProxySessionManager sharedInstance]( &OBJC_CLASS___NIServerFindableDeviceProxySessionManager,  "sharedInstance"));
      uint64_t v19 = *(void *)(*(void *)&buf[8] + 40LL);
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v18 startBeingFindableWithDiscoveryTokens:v19 tokenGroup:v20]);
    }

    else
    {
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindableDeviceProxySessionManager sharedInstance]( &OBJC_CLASS___NIServerFindableDeviceProxySessionManager,  "sharedInstance"));
      uint64_t v23 = *(void *)(*(void *)&buf[8] + 40LL);
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
      uint64_t v21 = objc_claimAutoreleasedReturnValue([v18 stopBeingFindableWithDiscoveryTokens:v23 tokenGroup:v20]);
    }

    uint64_t v22 = (void *)v21;
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  (*((void (**)(id, void *))v17 + 2))(v17, v22);

  _Block_object_dispose(buf, 8);
}

- (void)setLocalDeviceInteractableDiscoveryTokens:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v10;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - setLocalDeviceInteractableDiscoveryTokens. Signing identity: %@, pid: %d, session identifier: %@",  buf,  0x1Cu);
  }

  unsigned int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  LOBYTE(v12) = -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 3LL);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  *(void *)&buf[24] = sub_100040A04;
  int v27 = sub_100040A14;
  uint64_t v28 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int16 v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  __int16 v20 = sub_100040EC0;
  uint64_t v21 = &unk_1007A31B0;
  char v25 = (char)v12;
  id v13 = v7;
  uint64_t v22 = self;
  id v23 = v13;
  uint64_t v24 = buf;
  [v6 enumerateObjectsUsingBlock:&v18];
  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild", v18, v19, v20, v21)) {
    sub_1002786E8(*(void **)(*(void *)&buf[8] + 40LL));
  }
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindableDeviceProxySessionManager sharedInstance]( &OBJC_CLASS___NIServerFindableDeviceProxySessionManager,  "sharedInstance"));
  uint64_t v15 = *(void *)(*(void *)&buf[8] + 40LL);
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 setFindableDiscoveryTokens:v15 tokenGroup:v16]);

  (*((void (**)(id, void *))v13 + 2))(v13, v17);
  _Block_object_dispose(buf, 8);
}

- (void)setLocalDeviceDebugParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, os_log_s *))a4;
  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v10 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    __int16 v20 = v9;
    __int16 v21 = 1024;
    unsigned int v22 = v10;
    __int16 v23 = 2112;
    uint64_t v24 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - setLocalDeviceDebugParameters:reply:. Signing identity: %@, pid: %d, session identifier: %@",  buf,  0x1Cu);
  }

  unsigned int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v12);

  if (-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 3LL))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindableDeviceProxySessionManager sharedInstance]( &OBJC_CLASS___NIServerFindableDeviceProxySessionManager,  "sharedInstance"));
    unsigned int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 setLocalDeviceDebugParameters:v6]);

    v7[2](v7, v14);
  }

  else
  {
    NSErrorUserInfoKey v17 = NSLocalizedFailureReasonErrorKey;
    __int16 v18 = @"Not allowed to configure findable local device.";
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v15));
    v7[2](v7, v16);

    unsigned int v14 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
      -[NIServerSessionContainer pid](self, "pid");
      sub_10038B5C4();
    }
  }
}

- (void)getInteractableDiscoveryTokens:(id)a3
{
  id v4 = (void (**)(id, NSMutableArray *, void))a3;
  uint64_t v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v14 = 138412802;
    uint64_t v15 = v6;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - getInteractableDiscoveryTokens. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v14,  0x1Cu);
  }

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  unsigned int v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 3LL))
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindableDeviceProxySessionManager sharedInstance]( &OBJC_CLASS___NIServerFindableDeviceProxySessionManager,  "sharedInstance"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 findableDiscoveryTokensForGroup:v12]);

    -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v13);
  }

  v4[2](v4, v10, 0LL);
}

- (void)getActivelyInteractingDiscoveryTokens:(id)a3
{
  id v4 = (void (**)(id, NSMutableArray *, void))a3;
  uint64_t v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v14 = 138412802;
    uint64_t v15 = v6;
    __int16 v16 = 1024;
    unsigned int v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - getActivelyInteractingDiscoveryTokens. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v14,  0x1Cu);
  }

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  unsigned int v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 3LL))
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindableDeviceProxySessionManager sharedInstance]( &OBJC_CLASS___NIServerFindableDeviceProxySessionManager,  "sharedInstance"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 interactingFinderDiscoveryTokensForGroup:v12]);

    -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v13);
  }

  v4[2](v4, v10, 0LL);
}

- (void)getLocalDevicePrintableState:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v7 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    *(_DWORD *)buf = 138412802;
    uint64_t v19 = v6;
    __int16 v20 = 1024;
    unsigned int v21 = v7;
    __int16 v22 = 2112;
    __int16 v23 = sessionIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,XPC Command - getLocalDevicePrintableState. Signing identity: %@, pid: %d, session identifier: %@",  buf,  0x1Cu);
  }

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  if (!-[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 0LL))
  {
    NSErrorUserInfoKey v16 = NSLocalizedFailureReasonErrorKey;
    unsigned int v17 = @"Not allowed to get local device state.";
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v10));

    v4[2](v4, 0LL, v11);
  }

  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000419CC;
  v13[3] = &unk_1007A31D8;
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v4;
  unsigned int v12 = v4;
  dispatch_async(&_dispatch_main_q, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)_processFindingEvent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v14 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v16 = 138412802;
    unsigned int v17 = v13;
    __int16 v18 = 1024;
    unsigned int v19 = v14;
    __int16 v20 = 2112;
    unsigned int v21 = sessionIdentifier;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "#ses-container,XPC Command - _processFindingEvent. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v16,  0x1Cu);
  }

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession _processFindingEvent:](specializedSession, "_processFindingEvent:", v6));
    v7[2](v7, v11);
  }

  else
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
    v7[2](v7, v12);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B084();
    }
  }
}

- (void)_processSystemEvent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v14 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    int v16 = 138412802;
    unsigned int v17 = v13;
    __int16 v18 = 1024;
    unsigned int v19 = v14;
    __int16 v20 = 2112;
    unsigned int v21 = sessionIdentifier;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "#ses-container,XPC Command - _processSystemEvent. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v16,  0x1Cu);
  }

  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  specializedSession = self->_specializedSession;
  if (specializedSession)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession _processSystemEvent:](specializedSession, "_processSystemEvent:", v6));
    v7[2](v7, v11);
  }

  else
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
    v7[2](v7, v12);

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B084();
    }
  }
}

- (void)consumeBluetoothSample:(id)a3
{
}

- (BOOL)supportsDevicePresence
{
  return -[NIServerBaseSession supportsDevicePresence](self->_specializedSession, "supportsDevicePresence");
}

- (BOOL)isInterestedInSamplesForDevice:(id)a3
{
  return -[NIServerBaseSession isInterestedInSamplesForDevice:]( self->_specializedSession,  "isInterestedInSamplesForDevice:",  a3);
}

- (BOOL)isInteresetedInSample:(id)a3
{
  return -[NIServerBaseSession isInteresetedInSample:](self->_specializedSession, "isInteresetedInSample:", a3);
}

- (id)getQueueForInputingData
{
  return -[NIServerBaseSession getQueueForInputingData](self->_specializedSession, "getQueueForInputingData");
}

- (void)_activateBluetoothResource
{
  if (!self->_bleProvider)
  {
    if (!self->_bleProviderSessionIRK)
    {
      uint64_t v3 = NSRandomData(16LL, 0LL);
      id v4 = (NSData *)objc_claimAutoreleasedReturnValue(v3);
      bleProviderSessionIRK = self->_bleProviderSessionIRK;
      self->_bleProviderSessionIRK = v4;
    }

    if (!self->_bleProviderSessionIdentifier)
    {
      uint64_t v6 = NSRandomData(3LL, 0LL);
      unsigned int v7 = (NSData *)objc_claimAutoreleasedReturnValue(v6);
      bleProviderSessionIdentifier = self->_bleProviderSessionIdentifier;
      self->_bleProviderSessionIdentifier = v7;
    }

    id v9 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v22 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Activating Bluetooth resource",  v22,  2u);
    }

    unsigned int v10 = objc_opt_new(&OBJC_CLASS___PRBLEDiscoverySession);
    bleProvider = self->_bleProvider;
    self->_bleProvider = v10;

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
    unsigned __int8 v13 = [v12 deviceCapabilities];

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer wifiProvider](self, "wifiProvider"));
    else {
      unsigned int v15 = 0;
    }

    int v16 = self->_bleProvider;
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
    __int16 v18 = self->_bleProviderSessionIRK;
    unsigned int v19 = self->_bleProviderSessionIdentifier;
    uint64_t v20 = -[NIServerSessionContainer _getDiscoveryTokenFlags](self, "_getDiscoveryTokenFlags");
    uint64_t v21 = 256LL;
    if (!v15) {
      uint64_t v21 = 0LL;
    }
    -[PRBLEDiscoverySession activateWithDelegate:delegateQueue:sessionIRK:sessionIdentifier:controlFlags:tokenFlags:]( v16,  "activateWithDelegate:delegateQueue:sessionIRK:sessionIdentifier:controlFlags:tokenFlags:",  self,  v17,  v18,  v19,  v21 | v13 & 1,  v20);
  }

- (unsigned)_getDiscoveryTokenFlags
{
  unsigned int v3 = -[NIServerSessionContainer longRangeEnabled](self, "longRangeEnabled");
  if (-[NIServerSessionContainer requiresBiasCorrection](self, "requiresBiasCorrection")) {
    v3 |= 2u;
  }
  if (-[NIServerSessionContainer requiresLargeRegions](self, "requiresLargeRegions")) {
    return v3 | 4;
  }
  else {
    return v3;
  }
}

- (id)_augmentDiscoveryToken:(id)a3 withHomeAnchorVariant:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  if (v5)
  {
    int v11 = &off_1007D22C8;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
    unsigned int v12 = v6;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));

    id v8 = sub_1002522E0(v7, v5);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (id)_augmentDiscoveryTokenWithNbUwbAcquisitionChannel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer discoveryToken](self, "discoveryToken"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"FindingNapChannel"]);

    if (v7 && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8), (objc_opt_isKindOfClass(v7, v9) & 1) != 0))
    {
      LOBYTE(v10) = [v7 intValue];
      int v11 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v22 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Using NAP channel %d from defaults writes",  buf,  8u);
      }
    }

    else
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 getIRK]);
      if (!v12) {
        __assert_rtn( "_pickRandomNbUwbAcquisitionChannelInGivenRange",  "NIServerSessionContainer.mm",  2710,  "IRK != nil");
      }
      id v13 = v12;
      int v10 = SipHash([v13 bytes], &unk_10040CDA0, 8) % 7uLL + 5;
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v10));
    unsigned int v19 = &off_1007D22E0;
    uint64_t v20 = v14;
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    id v16 = sub_1002522E0(v15, v4);
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }

  else
  {
    unsigned int v17 = 0LL;
  }

  return v17;
}

- (id)_augmentDiscoveryTokenWithDeviceCapabilities:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _getCapabilities](self, "_getCapabilities"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"UWBSupportedPlatform"]);
    id v7 = [v6 BOOLValue];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"WifiSupportedPlatform"]);
    id v9 = [v8 BOOLValue];

    int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"UWBSupportedPlatformPDOA"]);
    id v11 = [v10 BOOLValue];

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"UWBSupportedPlatformSyntheticAperture"]);
    id v13 = [v12 BOOLValue];

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"UWBSupportedPlatformExtendedDistance"]);
    id v15 = [v14 BOOLValue];

    id v16 = -[NIDeviceCapabilities initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:]( objc_alloc(&OBJC_CLASS___NIDeviceCapabilities),  "initWithFineRangingSupport:coarseRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:",  v7,  v9,  v11,  v15,  v13);
    int v22 = &off_1007D22F8;
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[NIDeviceCapabilities toBitmap](v16, "toBitmap")));
    __int16 v23 = v17;
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));

    id v19 = sub_1002522E0(v18, v4);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  return v20;
}

- (void)_handleSpecializedSessionInvalidation:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_10038B600((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  objc_initWeak(&location, self);
  unsigned int v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000429C0;
  block[3] = &unk_1007A2060;
  objc_copyWeak(&v16, &location);
  id v15 = v4;
  id v13 = v4;
  dispatch_async(v12, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_handleSpecializedSessionBackgroundSupportUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Specialized session updated background support: %d",  (uint8_t *)&buf,  8u);
  }

  if (v3) {
    unsigned __int8 v7 = 1;
  }
  else {
    unsigned __int8 v7 = 2;
  }
  self->_specializedSessionBackgroundSupport = v7;
  objc_initWeak(&buf, self);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100042BA4;
  block[3] = &unk_1007A1CA0;
  objc_copyWeak(&v10, &buf);
  dispatch_async(v8, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&buf);
}

- (void)_updateClientAppVisibilityInterruption
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = -[NIServerSessionContainer isBackgroundOperationAllowed](self, "isBackgroundOperationAllowed");
  *(void *)__int16 v18 = 0LL;
  id v5 = sub_100046FEC(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)v18);
  if (self->_latestAppState == 3) {
    int v6 = v4 ^ 1;
  }
  else {
    int v6 = 0;
  }
  unsigned __int8 v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    unsigned int v9 = -[NIServerSessionContainer pid](self, "pid");
    sessionIdentifier = self->_sessionIdentifier;
    uint64_t v11 = sub_1001948A8(self->_latestAppState);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    id v13 = (void *)v12;
    unsigned int v14 = "N";
    *(_DWORD *)__int16 v18 = 138413826;
    *(void *)&v18[4] = v8;
    __int16 v19 = 1024;
    if (v6) {
      id v15 = "Y";
    }
    else {
      id v15 = "N";
    }
    unsigned int v20 = v9;
    if (v5) {
      id v16 = "Y";
    }
    else {
      id v16 = "N";
    }
    __int16 v21 = 2112;
    if (v4) {
      unsigned int v14 = "Y";
    }
    int v22 = sessionIdentifier;
    __int16 v23 = 2080;
    uint64_t v24 = v16;
    __int16 v25 = 2080;
    uint64_t v26 = v15;
    __int16 v27 = 2112;
    uint64_t v28 = v12;
    __int16 v29 = 2080;
    unsigned int v30 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Update client visibility interruption. Signing identity: %@, pid: %d, session identifier: %@, alrea dy interrupted: %s, should be interrupted now: %s, app state: %@. BG allowed: %s",  v18,  0x44u);
  }

  if ((v5 != 0LL) != v6)
  {
    double v17 = sub_100023CC4();
    if (v6) {
      -[NIServerSessionContainer interruptSessionWithReason:monotonicTimeSeconds:]( self,  "interruptSessionWithReason:monotonicTimeSeconds:",  0LL,  v17);
    }
    else {
      -[NIServerSessionContainer interruptionReasonEnded:monotonicTimeSeconds:]( self,  "interruptionReasonEnded:monotonicTimeSeconds:",  0LL,  v17);
    }
  }

- (void)setAppStateMonitor:(id)a3
{
  id v5 = a3;
  int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v6);

  objc_storeStrong((id *)&self->_appStateMonitor, a3);
  -[PRAppStateMonitor addObserver:](self->_appStateMonitor, "addObserver:", self);
  self->_latestAppState = -[PRAppStateMonitor currentAppState](self->_appStateMonitor, "currentAppState");
  if (-[PRAppStateMonitor isRunningBoardApp](self->_appStateMonitor, "isRunningBoardApp"))
  {
    connection = self->_connection;
    if (connection) {
      -[NSXPCConnection auditToken](connection, "auditToken");
    }
    else {
      memset(v21, 0, sizeof(v21));
    }
    id v20 = 0LL;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordForAuditToken:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordForAuditToken:error:",  v21,  &v20));
    uint64_t v12 = (NSString *)v20;
    id v10 = v12;
    if (!v11 || v12)
    {
      __int16 v18 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10038B664((uint64_t)self, v18);
      }
      bundleIdentifier = self->_bundleIdentifier;
      self->_bundleIdentifier = 0LL;
    }

    else
    {
      id v13 = (NSString *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
      unsigned int v14 = self->_bundleIdentifier;
      self->_bundleIdentifier = v13;

      id v15 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        int pid = self->_pid;
        double v17 = self->_bundleIdentifier;
        *(_DWORD *)id buf = 67109378;
        int v23 = pid;
        __int16 v24 = 2112;
        __int16 v25 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Pid %d bundle identifier is %@",  buf,  0x12u);
      }
    }
  }

  else
  {
    uint64_t v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = self->_pid;
      *(_DWORD *)id buf = 67109120;
      int v23 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Pid %d is not a RunningBoard app. Bundle identifier will be nil",  buf,  8u);
    }

    id v10 = self->_bundleIdentifier;
    self->_bundleIdentifier = 0LL;
  }

  -[NIServerSessionContainer _populateClientEntitlements](self, "_populateClientEntitlements");
}

- (BOOL)isBackgroundOperationAllowed
{
  return 1;
}

- (void)_acquireClientAssertionIfNecessary
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  if (!-[PRAppStateMonitor isDaemon](self->_appStateMonitor, "isDaemon")
    && -[PRAppStateMonitor isRunningBoardApp](self->_appStateMonitor, "isRunningBoardApp"))
  {
    -[NIServerAssertionManager acquireAssertionToSendMessageToClient]( self->_assertionManager,  "acquireAssertionToSendMessageToClient");
  }

- (BOOL)_isClientInternalTool
{
  if (!self->_appStateMonitor)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2 object:self file:@"NIServerSessionContainer.mm" lineNumber:1707 description:@"AppStateMonitor is required for to check if client is internal tool."];
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
  if ([&off_1007D2160 containsObject:v3])
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
    unsigned __int8 v4 = [&off_1007D2178 containsObject:v5];
  }

  return v4;
}

- (BOOL)_isClientOnGeneralEntitlementAllowlist
{
  if (!self->_appStateMonitor)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2 object:self file:@"NIServerSessionContainer.mm" lineNumber:1726 description:@"AppStateMonitor is required for to check if client is on general entitlement allowlist."];
  }

  unsigned int v3 = -[NIServerSessionContainer _isClientInternalTool](self, "_isClientInternalTool");
  unsigned int v4 = +[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild");
  int v5 = os_variant_allows_internal_security_policies([@"com.apple.nearbyd" UTF8String]);
  if (-[PRAppStateMonitor isDaemon](self->_appStateMonitor, "isDaemon")) {
    return 1;
  }
  unsigned __int8 v6 = 1;
  if (!-[PRAppStateMonitor isXPCService](self->_appStateMonitor, "isXPCService") && (v3 & (v4 | v5) & 1) == 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
    unsigned __int8 v6 = [&off_1007D2190 containsObject:v7];
  }

  return v6;
}

- (BOOL)_isClientOnSystemShutdownAllowlist
{
  if (!self->_appStateMonitor)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2 object:self file:@"NIServerSessionContainer.mm" lineNumber:1757 description:@"AppStateMonitor is required for to check if client is on system shutdown entitlement allowlist."];
  }

  unsigned __int8 v3 = -[NIServerSessionContainer _isClientInternalTool](self, "_isClientInternalTool");
  unsigned __int8 v4 = +[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild");
  char v5 = os_variant_allows_internal_security_policies([@"com.apple.nearbyd" UTF8String]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
  if ([v6 isEqualToString:@"com.apple.SpringBoard"])
  {
    char v7 = 1;
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
    else {
      char v7 = v3 & (v4 | v5);
    }
  }

  return v7;
}

- (void)_populateClientEntitlements
{
  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  if (!self->_appStateMonitor)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v28 handleFailureInMethod:a2 object:self file:@"NIServerSessionContainer.mm" lineNumber:1774 description:@"AppStateMonitor is required for populating client entitlements."];
  }

  unsigned int v5 = -[NIServerSessionContainer _isClientInternalTool](self, "_isClientInternalTool");
  unsigned int v6 = -[NIServerSessionContainer _isClientOnGeneralEntitlementAllowlist]( self,  "_isClientOnGeneralEntitlementAllowlist");
  unsigned int v30 = -[NIServerSessionContainer _isClientOnSystemShutdownAllowlist](self, "_isClientOnSystemShutdownAllowlist");
  char v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer processNameBestGuess](self, "processNameBestGuess"));
    bundleIdentifier = self->_bundleIdentifier;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    *(_DWORD *)id buf = 138414082;
    uint64_t v32 = v8;
    __int16 v33 = 2112;
    __int16 v34 = bundleIdentifier;
    __int16 v35 = 2112;
    *(void *)__int16 v36 = v10;
    *(_WORD *)&v36[8] = 2112;
    *(void *)&v36[10] = v11;
    __int16 v37 = 2112;
    v38 = v12;
    __int16 v39 = 1024;
    unsigned int v40 = v5;
    __int16 v41 = 1024;
    unsigned int v42 = v6;
    __int16 v43 = 1024;
    unsigned int v44 = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Populating entitlements for client %@ [bundle ID: %@, job label: %@, monitored name: %@, signing id entity: %@, internal flags %d|%d|%d]",  buf,  0x46u);
  }

  os_unfair_lock_t lock = &self->_entitlementsLock;
  os_unfair_lock_lock(&self->_entitlementsLock);
  uint64_t v13 = 0LL;
  self->_clientEntitlementsArray.__elems_[8] = 0;
  *(void *)self->_clientEntitlementsArray.__elems_ = 0LL;
  do
  {
    unsigned int v14 = (NSString *)*((void *)&off_1007A3418 + v13);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection valueForEntitlement:]( self->_connection,  "valueForEntitlement:",  *((void *)&off_1007A33D0 + v13)));
    if (v16)
    {
      uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber, v15);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0) {
        self->_clientEntitlementsArray.__elems_[v13] = objc_msgSend(v16, "BOOLValue", lock);
      }
    }

    BOOL v18 = v6;
    if (v13 >= 3)
    {
      BOOL v18 = v6;
      if ((_DWORD)v13 != 5)
      {
        if ((_DWORD)v13 != 6) {
          goto LABEL_17;
        }
        BOOL v18 = v30;
      }
    }

    if (!self->_clientEntitlementsArray.__elems_[v13]) {
      BOOL v18 = 0;
    }
    self->_clientEntitlementsArray.__elems_[v13] = v18;
LABEL_17:
    if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild", lock))
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
      if ([v19 isEqualToString:@"com.apple.dt.xctest.tool"])
      {

LABEL_21:
        self->_clientEntitlementsArray.__elems_[v13] = 1;
        goto LABEL_22;
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
      unsigned int v21 = [v20 isEqualToString:@"com.apple.xctest"];

      if (v21) {
        goto LABEL_21;
      }
    }

- (id)_getCapabilities
{
  unsigned __int8 v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
  unsigned int v5 = [v4 deviceCapabilities];

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer wifiProvider](self, "wifiProvider"));
  LOBYTE(self) = [v6 deviceCapabilities];

  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5 & 1));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, @"UWBSupportedPlatform");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", (v5 >> 8) & 1));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, @"UWBSupportedPlatformPDOA");

  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", HIWORD(v5) & 1));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, @"UWBSupportedPlatformExtendedDistance");

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self & 1));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, @"WifiSupportedPlatform");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[NIPlatformInfo supportsSyntheticAperture]( &OBJC_CLASS___NIPlatformInfo,  "supportsSyntheticAperture")));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v11, @"UWBSupportedPlatformSyntheticAperture");

  return v3;
}

- (id)_getExpandedCapabilities
{
  unsigned __int8 v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _getCapabilities](self, "_getCapabilities"));
  -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v4);

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 internalObserver]);
  LODWORD(v4) = [v6 deviceCapabilities];

  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v3, "objectForKey:", @"UWBSupportedPlatform"));
  LODWORD(v5) = [v7 BOOLValue];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v3, "objectForKey:", @"WifiSupportedPlatform"));
  LODWORD(v7) = [v8 BOOLValue];

  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  v5 | -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 5LL) & v4 | -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 2LL) & v7));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v9, @"SupportedPlatform");

  return v3;
}

- (BOOL)_supportedPlatform
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _getExpandedCapabilities](self, "_getExpandedCapabilities"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"SupportedPlatform"]);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)displayName
{
  return -[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName");
}

- (NSString)processNameBestGuess
{
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
  {
    unsigned __int8 v3 = bundleIdentifier;
  }

  else
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](self->_appStateMonitor, "launchdJobLabel"));

    appStateMonitor = self->_appStateMonitor;
    if (v5)
    {
      unsigned __int8 v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor launchdJobLabel](appStateMonitor, "launchdJobLabel"));
    }

    else
    {
      char v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](appStateMonitor, "monitoredProcessName"));

      if (v7) {
        unsigned __int8 v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[PRAppStateMonitor monitoredProcessName](self->_appStateMonitor, "monitoredProcessName"));
      }
      else {
        unsigned __int8 v3 = 0LL;
      }
    }
  }

  return v3;
}

- (id)_displayPermissionsPromptIfNeeded
{
  unsigned int v3 = -[NIServerSessionContainer entitlementGranted:](self, "entitlementGranted:", 0LL);
  if ((v3 & 1) != 0) {
    unsigned int v4 = 3;
  }
  else {
    unsigned int v4 = -[NIPrivacyAuthorizationManager authorizationStatusForSession:promptUserIfUndetermined:]( self->_authManager,  "authorizationStatusForSession:promptUserIfUndetermined:",  self,  1LL);
  }
  unsigned int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = sub_10002156C(v4);
    char v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    sessionIdentifier = self->_sessionIdentifier;
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer signingIdentity](self, "signingIdentity"));
    id v10 = (void *)v9;
    uint64_t v11 = @"NO";
    *(_DWORD *)uint64_t v15 = 138478851;
    *(void *)&v15[4] = v7;
    *(_WORD *)&v15[12] = 2113;
    if (v3) {
      uint64_t v11 = @"YES";
    }
    *(void *)&v15[14] = sessionIdentifier;
    __int16 v16 = 2113;
    uint64_t v17 = v9;
    __int16 v18 = 2113;
    __int16 v19 = @"Privileged?";
    __int16 v20 = 2113;
    unsigned int v21 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,[Session] User authorization status: %{private}@. Session: %{private}@. Signing identity: %{private }@. %{private}@: %{private}@",  v15,  0x34u);
  }

  if (v4)
  {
    if (v4 == 4)
    {
      uint64_t v12 = -5884LL;
      goto LABEL_13;
    }

    if (v4 != 2)
    {
      uint64_t v13 = 0LL;
      return v13;
    }
  }

  uint64_t v12 = -5887LL;
LABEL_13:
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v12,  0LL,  *(_OWORD *)v15));
  return v13;
}

- (id)clientProcessSigningIdentity
{
  return self->_signingIdentity;
}

- (int)clientPid
{
  return self->_pid;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_connection;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (id)serverSessionIdentifier
{
  return self->_sessionIdentifier;
}

- (id)btResource
{
  return self->_bleProvider;
}

- (id)uwbResource
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_10038B6D8();
    }
    unsigned int v5 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315650;
      char v7 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerSessionContainer.mm";
      __int16 v8 = 1024;
      int v9 = 2004;
      __int16 v10 = 2080;
      uint64_t v11 = "-[NIServerSessionContainer uwbResource]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#ses-container,%s:%d: assertion failure in %s",  (uint8_t *)&v6,  0x1Cu);
    }

    abort();
  }

  return -[NIServerSessionContainer uwbProvider](self, "uwbProvider");
}

- (id)wifiResource
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer wifiProvider](self, "wifiProvider"));

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_10038B704();
    }
    unsigned int v5 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315650;
      char v7 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerSessionContainer.mm";
      __int16 v8 = 1024;
      int v9 = 2009;
      __int16 v10 = 2080;
      uint64_t v11 = "-[NIServerSessionContainer wifiResource]";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "#ses-container,%s:%d: assertion failure in %s",  (uint8_t *)&v6,  0x1Cu);
    }

    abort();
  }

  return -[NIServerSessionContainer wifiProvider](self, "wifiProvider");
}

- (id)visionResource
{
  return +[NIServerVisionDataDistributor sharedProvider](&OBJC_CLASS___NIServerVisionDataDistributor, "sharedProvider");
}

- (id)lifecycleSupervisor
{
  return self->_lifeCycleManager;
}

- (PRAppStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (id)analytics
{
  return self->_analyticsManager;
}

- (id)discoveryToken
{
  if (self->_localDiscoveryToken) {
    v2 = -[NIDiscoveryToken initWithBytes:]( objc_alloc(&OBJC_CLASS___NIDiscoveryToken),  "initWithBytes:",  self->_localDiscoveryToken);
  }
  else {
    v2 = 0LL;
  }
  return v2;
}

- (id)remote
{
  return self->_client;
}

- (shared_ptr<rose::protobuf::Logger>)protobufLogger
{
  unsigned int v3 = v2;
  unsigned int v4 = (Logger *)sub_100288340();
  uint64_t v6 = *((void *)v4 + 21);
  void *v3 = *((void *)v4 + 20);
  v3[1] = v6;
  if (v6)
  {
    char v7 = (unint64_t *)(v6 + 8);
    do
      unint64_t v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }

  result.__cntrl_ = v5;
  result.__ptr_ = v4;
  return result;
}

- (BOOL)longRangeEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v3 = [v2 BOOLForKey:@"DisableLongRangeOverride"];

  if (v3)
  {
    unsigned int v4 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#ses-container,* disable ND through default writes.",  v6,  2u);
    }
  }

  return v3 ^ 1;
}

- (BOOL)entitlementGranted:(int)a3
{
  p_entitlementsLock = &self->_entitlementsLock;
  os_unfair_lock_lock(&self->_entitlementsLock);
  if (a3 >= 9)
  {
    char v7 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_10038B730(a3, v7);
    }
    BOOL v6 = 0;
  }

  else
  {
    BOOL v6 = self->_clientEntitlementsArray.__elems_[a3];
  }

  os_unfair_lock_unlock(p_entitlementsLock);
  return v6;
}

- (BOOL)requiresBiasCorrection
{
  v2 = sub_100005150();
  return sub_1003209B8(v2[144]);
}

- (BOOL)requiresLargeRegions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"RegionMonitorRequiresLargeRegionsOverride"]);

  if (v3)
  {
    unsigned __int8 v4 = [v2 BOOLForKey:@"RegionMonitorRequiresLargeRegionsOverride"];
  }

  else
  {
    unsigned int v5 = sub_100005150();
    unsigned __int8 v4 = sub_1003209B8(v5[144]);
  }

  BOOL v6 = v4;

  return v6;
}

- (id)devicePresenceResource
{
  devicePresenceProvider = self->_devicePresenceProvider;
  if (!devicePresenceProvider)
  {
    objc_initWeak(&location, self);
    unsigned __int8 v4 = objc_alloc(&OBJC_CLASS___NIServerBluetoothSampleConsumer);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000444C8;
    v8[3] = &unk_1007A3200;
    objc_copyWeak(&v9, &location);
    unsigned int v5 = -[NIServerBluetoothSampleConsumer initWithConsumerBlock:](v4, "initWithConsumerBlock:", v8);
    BOOL v6 = self->_devicePresenceProvider;
    self->_devicePresenceProvider = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    devicePresenceProvider = self->_devicePresenceProvider;
  }

  return devicePresenceProvider;
}

- (shared_ptr<rose::PowerBudgetProvider>)powerBudgetProvider
{
  unsigned int v3 = v2;
  unsigned __int8 v4 = (PowerBudgetProvider *)sub_100288340();
  uint64_t v6 = *((void *)v4 + 23);
  void *v3 = *((void *)v4 + 22);
  v3[1] = v6;
  if (v6)
  {
    char v7 = (unint64_t *)(v6 + 8);
    do
      unint64_t v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }

  result.__cntrl_ = v5;
  result.__ptr_ = v4;
  return result;
}

- (id)recentlyObservedObjectsCache
{
  return -[NIServerSessionContainer nearbyObjectsCache](self, "nearbyObjectsCache");
}

- (id)printableState
{
  uint64_t v31 = 0LL;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  __int16 v34 = sub_100040A04;
  __int16 v35 = sub_100040A14;
  __int16 v36 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  double v3 = sub_100023CC4();
  os_unfair_lock_lock(&self->_entitlementsLock);
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  do
  {
    if (self->_clientEntitlementsArray.__elems_[v4]) {
      uint64_t v6 = (1 << v4);
    }
    else {
      uint64_t v6 = 0LL;
    }
    v5 |= v6;
    ++v4;
  }

  while (v4 != 9);
  os_unfair_lock_unlock(&self->_entitlementsLock);
  char v7 = (void *)v32[5];
  sessionIdentifier = self->_sessionIdentifier;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer discoveryToken](self, "discoveryToken"));
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 descriptionInternal]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Identifier: %@. Token: %@. Entitlements: 0x%llX%s. Transaction: %d",  sessionIdentifier,  v10,  v5,  "",  self->_osTransaction != 0LL));
  [v7 addObject:v11];

  else {
    uint64_t v12 = off_1007A3328[(char)(self->_latestSessionContainerState - 1)];
  }
  uint64_t v13 = (void *)v32[5];
  double initTime = self->_initTime;
  double timeOfLatestContainerState = self->_timeOfLatestContainerState;
  -[NIServerSessionContainer _interruptionsMapAsString](self, "_interruptionsMapAsString");
  if (v30 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"State: %s. Age: total %.2f s, in-state %.2f s. Interruptions: %s",  v12,  v3 - initTime,  v3 - timeOfLatestContainerState,  p_p));
  [v13 addObject:v17];

  if (v30 < 0) {
    operator delete(__p);
  }
  __int16 v18 = (void *)v32[5];
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession lastConfiguration](self->_specializedSession, "lastConfiguration"));
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Configuration: %@",  v19));
  [v18 addObject:v20];

  unsigned int v21 = (void *)v32[5];
  unsigned int v23 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Specialized session: %@",  objc_opt_class(self->_specializedSession, v22));
  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v21 addObject:v24];

  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession printableState](self->_specializedSession, "printableState"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100044918;
  v28[3] = &unk_1007A3228;
  v28[4] = &v31;
  [v25 enumerateObjectsUsingBlock:v28];
  id v26 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  return v26;
}

- (void)didFailWithErrorCode:(int64_t)a3 errorString:(const void *)a4
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
    sub_10038B7A0();
  }
}

- (void)didReceiveNewSolution:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
    sub_10038B7CC();
  }
}

- (void)didReceiveSessionStartNotification:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
    sub_10038B7F8();
  }
}

- (void)didReceiveRemoteData:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
    sub_10038B824();
  }
}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
    sub_10038B850();
  }
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer uwbProvider](self, "uwbProvider"));
  unint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 getQueue]);
  dispatch_assert_queue_V2(v8);

  objc_initWeak(&location, self);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100044BD4;
  block[3] = &unk_1007A1DA8;
  objc_copyWeak(&v11, &location);
  int v12 = a3;
  int v13 = a4;
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)didFinishActivatingWithDiscoveryTokenData:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    __int16 v10 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B8A8((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
    }
LABEL_4:
    bleProvider = self->_bleProvider;
    self->_bleProvider = 0LL;
    goto LABEL_16;
  }

  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B87C();
    }
    goto LABEL_4;
  }

  p_localDiscoveryToken = &self->_localDiscoveryToken;
  objc_storeStrong((id *)&self->_localDiscoveryToken, a3);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v20 = [v19 BOOLForKey:@"NIHomeDisableDeviceSpecificSTS"];

  unsigned int v21 = sub_100005150();
  if ((v20 & 1) != 0) {
    uint64_t v22 = 0LL;
  }
  else {
    uint64_t v22 = sub_100320A0C(v21[144]);
  }
  unsigned int v23 = (NSData *)objc_claimAutoreleasedReturnValue( -[NIServerSessionContainer _augmentDiscoveryTokenWithDeviceCapabilities:]( self,  "_augmentDiscoveryTokenWithDeviceCapabilities:",  v7));
  localDiscoveryToken = self->_localDiscoveryToken;
  self->_localDiscoveryToken = v23;

  __int16 v25 = (NSData *)objc_claimAutoreleasedReturnValue( -[NIServerSessionContainer _augmentDiscoveryToken:withHomeAnchorVariant:]( self,  "_augmentDiscoveryToken:withHomeAnchorVariant:",  self->_localDiscoveryToken,  v22));
  id v26 = self->_localDiscoveryToken;
  self->_localDiscoveryToken = v25;

  BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer _getCapabilities](self, "_getCapabilities"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKey:@"UWBSupportedPlatformExtendedDistance"]);
  unsigned int v29 = [v28 BOOLValue];

  if (v29)
  {
    uint64_t v30 = objc_claimAutoreleasedReturnValue( -[NIServerSessionContainer _augmentDiscoveryTokenWithNbUwbAcquisitionChannel:]( self,  "_augmentDiscoveryTokenWithNbUwbAcquisitionChannel:",  self->_localDiscoveryToken));
    uint64_t v31 = *p_localDiscoveryToken;
    *p_localDiscoveryToken = (NSData *)v30;
  }

  uint64_t v32 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = CUPrintNSObjectMasked(*p_localDiscoveryToken, v33);
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    int v37 = 138478083;
    v38 = v35;
    __int16 v39 = 1024;
    int v40 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#ses-container,BT resource activated. Token: %{private}@. Device anchor variant: %u",  (uint8_t *)&v37,  0x12u);
  }

  bleProvider = (PRBLEDiscoverySession *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
  __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer discoveryToken](self, "discoveryToken"));
  -[PRBLEDiscoverySession didUpdateLocalDiscoveryToken:](bleProvider, "didUpdateLocalDiscoveryToken:", v36);

LABEL_16:
}

- (void)didDiscoverDevice:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  -[NIServerBaseSession deviceDiscovered:](self->_specializedSession, "deviceDiscovered:", v5);
}

- (void)discoveredDevice:(id)a3 didUpdate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v7);

  -[NIServerBaseSession device:rediscovered:](self->_specializedSession, "device:rediscovered:", v8, v6);
}

- (void)didLoseDevice:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v4);

  -[NIServerBaseSession deviceLost:](self->_specializedSession, "deviceLost:", v5);
}

- (void)bluetoothDidChangeState:(int64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v5);

  switch(a3)
  {
    case 1LL:
    case 4LL:
      -[NIServerSessionContainer _handleBluetoothBecameUnavailable](self, "_handleBluetoothBecameUnavailable");
      break;
    case 2LL:
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_10038B938();
      }
      break;
    case 3LL:
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_10038B90C();
      }
      break;
    case 5LL:
      -[NIServerSessionContainer _handleBluetoothBecameAvailable](self, "_handleBluetoothBecameAvailable");
      break;
    default:
      break;
  }

  -[NIServerSessionContainer setLatestBluetoothState:](self, "setLatestBluetoothState:", a3);
}

- (void)bluetoothServiceInterrupted
{
  double v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer _handleBluetoothBecameUnavailable](self, "_handleBluetoothBecameUnavailable");
}

- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v5);

  -[NIServerBaseSession bluetoothAdvertisingAddressChanged:]( self->_specializedSession,  "bluetoothAdvertisingAddressChanged:",  a3);
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)-[NIServerBaseSession nominalCycleRate]( self->_specializedSession,  "nominalCycleRate");
}

- (void)_setContainerState:(unsigned __int8)a3
{
  if (self->_latestSessionContainerState != a3)
  {
    id v5 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      else {
        id v6 = off_1007A3328[(char)(a3 - 1)];
      }
      else {
        id v7 = off_1007A3328[(char)(self->_latestSessionContainerState - 1)];
      }
      signingIdentity = self->_signingIdentity;
      int pid = self->_pid;
      sessionIdentifier = self->_sessionIdentifier;
      int v11 = 136316162;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = signingIdentity;
      __int16 v17 = 1024;
      int v18 = pid;
      __int16 v19 = 2112;
      unsigned __int8 v20 = sessionIdentifier;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Container state change. New: %s. Old: %s. Signing identity: %@, pid: %d, session identifier: %@",  (uint8_t *)&v11,  0x30u);
    }

    self->_latestSessionContainerState = a3;
    self->_double timeOfLatestContainerState = sub_100023CC4();
  }

- (basic_string<char,)_interruptionsMapAsString
{
  v2 = v1;
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v1 connectionQueue]);
  dispatch_assert_queue_V2(v4);

  sub_100045754((uint64_t)v12);
  sub_100046B94(&v13, (uint64_t)"[", 1LL);
  for (i = (void *)v2[14]; i; i = (void *)*i)
  {
    id v6 = sub_10029449C(i[2]);
    id v7 = objc_claimAutoreleasedReturnValue(v6);
    id v8 = (const char *)[v7 UTF8String];
    size_t v9 = strlen(v8);
    sub_100046B94(&v13, (uint64_t)v8, v9);
    if (*i) {
      sub_100046B94(&v13, (uint64_t)", ", 2LL);
    }
  }

  sub_100046B94(&v13, (uint64_t)"]", 1LL);
  std::stringbuf::str((std::stringbuf::string_type *)retstr, &v14);
  *(void *)((char *)v12
  uint64_t v13 = v10;
  std::streambuf::~streambuf(&v14);
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::ios::~ios(&v15);
}

- (void)_dumpInterruptionsMapWithDebugString:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[NIServerSessionContainer _interruptionsMapAsString](self, "_interruptionsMapAsString");
    int v7 = v12;
    id v8 = (void **)__p;
    double v9 = sub_100023CC4();
    p_p = &__p;
    *(_DWORD *)id buf = 138412802;
    if (v7 < 0) {
      p_p = v8;
    }
    id v14 = v4;
    __int16 v15 = 2080;
    uint64_t v16 = p_p;
    __int16 v17 = 2048;
    double v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#ses-container,#interrupt [%@] Interruptions map: %s, machContTime: %f",  buf,  0x20u);
    if (v12 < 0) {
      operator delete(__p);
    }
  }
}

- (void)interruptSessionWithReason:(int64_t)a3 monotonicTimeSeconds:(double)a4
{
  int64_t v22 = a3;
  int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    uint64_t v10 = sub_10029449C(a3);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)id buf = 138412802;
    *(void *)&uint8_t buf[4] = sessionIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2048;
    double v24 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-container,#interrupt Interrupt session %@ with reason: %@. ContTime: %f",  buf,  0x20u);
  }

  -[NIServerSessionContainer _setContainerState:](self, "_setContainerState:", 7LL);
  if (sub_100046FEC(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v22))
  {
    char v12 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#ses-container,#interrupt Not interrupting session with duplicate reason.",  buf,  2u);
    }
  }

  else
  {
    *(void *)id buf = v22;
    *(void *)&buf[8] = v22;
    *(double *)&buf[16] = a4;
    sub_1000470A0((uint64_t)&self->_interruptionsMap, (unint64_t *)buf, (uint64_t)buf);
    -[NIServerSessionContainer _dumpInterruptionsMapWithDebugString:]( self,  "_dumpInterruptionsMapWithDebugString:",  @"interruptWithReason");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession pauseWithSource:](self->_specializedSession, "pauseWithSource:", 2LL));
    if (v13)
    {
      id v14 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10038B964((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }

    -[NIServerVisionInternalSessionRequest invalidate](self->_visionSessionRequest, "invalidate");
    -[NIServerAnalyticsManager sessionInterruptedWithTimestamp:]( self->_analyticsManager,  "sessionInterruptedWithTimestamp:",  a4);
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    [v21 uwbSessionInterruptedWithReason:v22 timestamp:a4];
  }

- (void)interruptionReasonEnded:(int64_t)a3 monotonicTimeSeconds:(double)a4
{
  int64_t v14 = a3;
  int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    uint64_t v10 = sub_10029449C(a3);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)id buf = 138412802;
    uint64_t v16 = sessionIdentifier;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2048;
    double v20 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-container,#interrupt Session %@ interruption ended. Reason: %@. ContTime: %f",  buf,  0x20u);
  }

  char v12 = sub_100046FEC(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v14);
  if (v12)
  {
    sub_1000217D4(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, v12);
    -[NIServerSessionContainer _dumpInterruptionsMapWithDebugString:]( self,  "_dumpInterruptionsMapWithDebugString:",  @"interruptionEnded");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer remote](self, "remote"));
    [v13 uwbSessionInterruptionReasonEnded:v14 timestamp:a4];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10038B9C8();
  }

- (void)invalidate
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerVisionDataDistributor sharedProvider]( &OBJC_CLASS___NIServerVisionDataDistributor,  "sharedProvider"));
  [v3 unregisterForVisionInput:self->_specializedSession];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 internalObserver]);
  [v5 stopLeechingForConsumer:self];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer devicePresenceResource](self, "devicePresenceResource"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 internalObserver]);
  [v7 unregisterForInternalBluetoothSamples:self];

  -[NIServerBaseSession invalidate](self->_specializedSession, "invalidate");
  specializedSession = self->_specializedSession;
  self->_specializedSession = 0LL;

  -[PRBLEDiscoverySession invalidate](self->_bleProvider, "invalidate");
  bleProvider = self->_bleProvider;
  self->_bleProvider = 0LL;

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer appStateMonitor](self, "appStateMonitor"));
  [v10 removeObserver:self];

  -[NIServerAssertionManager invalidate](self->_assertionManager, "invalidate");
  assertionManager = self->_assertionManager;
  self->_assertionManager = 0LL;

  osTransaction = self->_osTransaction;
  self->_osTransaction = 0LL;

  -[NIServerVisionInternalSessionRequest invalidate](self->_visionSessionRequest, "invalidate");
  analyticsManager = self->_analyticsManager;
  double v14 = sub_100023CC4();
  -[NIServerAnalyticsManager sessionInvalidatedWithTimestamp:]( analyticsManager,  "sessionInvalidatedWithTimestamp:",  v14);
}

- (id)_fatalErrorForUwbServiceState:(int)a3 cause:(int)a4
{
  int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v7);

  id v8 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    sub_1000065CC(v18, off_1007A3368[a3]);
    int v10 = v19;
    int v11 = (void **)v18[0];
    sub_1000065CC(__p, off_1007A3390[a4]);
    char v12 = v18;
    if (v10 < 0) {
      char v12 = v11;
    }
    if (v17 >= 0) {
      uint64_t v13 = __p;
    }
    else {
      uint64_t v13 = (void **)__p[0];
    }
    *(_DWORD *)id buf = 138412802;
    unsigned int v21 = sessionIdentifier;
    __int16 v22 = 2080;
    unsigned int v23 = v12;
    __int16 v24 = 2080;
    __int16 v25 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Check for fatal error for session %@ for UWB service state %s with cause %s",  buf,  0x20u);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    if (v19 < 0) {
      operator delete(v18[0]);
    }
  }

  double v14 = 0LL;
  if (a3 == 3 && (a4 - 5) <= 1)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10038B9F4();
    }
    double v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5889LL,  0LL));
  }

  return v14;
}

- (BOOL)_updateInterruptionForUWBServiceState:(int)a3 cause:(int)a4 requiresNarrowBand:(BOOL)a5
{
  uint64_t v6 = *(void *)&a4;
  double v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v9);

  int v10 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    sessionIdentifier = self->_sessionIdentifier;
    sub_1000065CC(v19, off_1007A3368[a3]);
    int v12 = v20;
    uint64_t v13 = (void **)v19[0];
    sub_1000065CC(__p, off_1007A3390[(int)v6]);
    double v14 = v19;
    if (v12 < 0) {
      double v14 = v13;
    }
    if (v18 >= 0) {
      uint64_t v15 = __p;
    }
    else {
      uint64_t v15 = (void **)__p[0];
    }
    *(_DWORD *)id buf = 138412802;
    __int16 v22 = sessionIdentifier;
    __int16 v23 = 2080;
    __int16 v24 = v14;
    __int16 v25 = 2080;
    id v26 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Update interruption for session %@ for UWB service state %s with cause %s",  buf,  0x20u);
    if (v18 < 0) {
      operator delete(__p[0]);
    }
    if (v20 < 0) {
      operator delete(v19[0]);
    }
  }

  switch(a3)
  {
    case 0:
      sub_10038BA20();
    case 1:
      goto LABEL_16;
    case 2:
      if (a5) {
        return -[NIServerSessionContainer _updateInterruptionForUWBSystemOffWithCause:]( self,  "_updateInterruptionForUWBSystemOffWithCause:",  v6);
      }
LABEL_16:
      -[NIServerSessionContainer _updateInterruptionForUWBSystemReady](self, "_updateInterruptionForUWBSystemReady");
      return 0;
    case 3:
      return -[NIServerSessionContainer _updateInterruptionForUWBSystemOffWithCause:]( self,  "_updateInterruptionForUWBSystemOffWithCause:",  v6);
    case 4:
      -[NIServerSessionContainer _updateInterruptionForUWBSystemError](self, "_updateInterruptionForUWBSystemError");
      return 1;
    default:
      return 0;
  }

- (void)_updateInterruptionForUWBSystemReady
{
  double v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  __p = 0LL;
  char v19 = 0LL;
  char v20 = 0LL;
  -[NIServerSessionContainer _dumpInterruptionsMapWithDebugString:]( self,  "_dumpInterruptionsMapWithDebugString:",  @"_updateInterruptionForUWBSystemReady");
  id v4 = (unint64_t *)&qword_10040CD80;
  do
  {
    if (sub_100046FEC(&self->_interruptionsMap.__table_.__bucket_list_.__ptr_.__value_, v4))
    {
      id v5 = v19;
      if (v19 >= v20)
      {
        int v7 = __p;
        uint64_t v8 = v19 - __p;
        unint64_t v9 = v8 + 1;
        uint64_t v10 = (char *)v20 - (char *)__p;
        else {
          unint64_t v11 = v9;
        }
        if (v11)
        {
          int v12 = (char *)sub_1000472C0((uint64_t)&v20, v11);
          int v7 = __p;
          id v5 = v19;
        }

        else
        {
          int v12 = 0LL;
        }

        uint64_t v13 = (unint64_t *)&v12[8 * v8];
        *uint64_t v13 = *v4;
        uint64_t v6 = v13 + 1;
        while (v5 != v7)
        {
          unint64_t v14 = *--v5;
          *--uint64_t v13 = v14;
        }

        __p = v13;
        char v20 = (unint64_t *)&v12[8 * v11];
        if (v7) {
          operator delete(v7);
        }
      }

      else
      {
        *char v19 = *v4;
        uint64_t v6 = v19 + 1;
      }

      char v19 = v6;
    }

    ++v4;
  }

  while (v4 != (unint64_t *)&unk_10040CDA0);
  double v15 = sub_100023CC4();
  uint64_t v16 = __p;
  if (__p != v19)
  {
    double v17 = v15;
    do
      -[NIServerSessionContainer interruptionReasonEnded:monotonicTimeSeconds:]( self,  "interruptionReasonEnded:monotonicTimeSeconds:",  *v16++,  v17);
    while (v16 != v19);
    uint64_t v16 = __p;
  }

  if (v16) {
    operator delete(v16);
  }
}

- (BOOL)_updateInterruptionForUWBSystemOffWithCause:(int)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v5);

  BOOL v6 = 0;
  double v7 = sub_100023CC4();
  uint64_t v8 = 5LL;
  switch(a3)
  {
    case 0:
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_10038BA48();
      }
      return 0;
    case 1:
    case 7:
      goto LABEL_7;
    case 2:
      sub_10038BA74();
    case 3:
      uint64_t v8 = 1LL;
      goto LABEL_7;
    case 4:
      uint64_t v8 = 2LL;
LABEL_7:
      -[NIServerSessionContainer interruptSessionWithReason:monotonicTimeSeconds:]( self,  "interruptSessionWithReason:monotonicTimeSeconds:",  v8,  v7);
      BOOL v6 = 1;
      break;
    default:
      return v6;
  }

  return v6;
}

- (void)_updateInterruptionForUWBSystemError
{
  double v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer interruptSessionWithReason:monotonicTimeSeconds:]( self,  "interruptSessionWithReason:monotonicTimeSeconds:",  4LL,  sub_100023CC4());
}

- (void)_handleBluetoothBecameUnavailable
{
  double v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer interruptSessionWithReason:monotonicTimeSeconds:]( self,  "interruptSessionWithReason:monotonicTimeSeconds:",  7LL,  sub_100023CC4());
}

- (void)_handleBluetoothBecameAvailable
{
  double v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NIServerSessionContainer connectionQueue](self, "connectionQueue"));
  dispatch_assert_queue_V2(v3);

  -[NIServerSessionContainer interruptionReasonEnded:monotonicTimeSeconds:]( self,  "interruptionReasonEnded:monotonicTimeSeconds:",  7LL,  sub_100023CC4());
}

- (void)monitoredApp:(int)a3 didChangeState:(int)a4
{
  double v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = sub_1001948A8(a4);
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v12 = 67109378;
    *(_DWORD *)uint64_t v13 = a3;
    *(_WORD *)&void v13[4] = 2112;
    *(void *)&v13[6] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-container,Monitored app with pid: %d did change state: %@",  (uint8_t *)&v12,  0x12u);
  }

  if (!a4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_10038BA9C();
    }
    unint64_t v11 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315650;
      *(void *)uint64_t v13 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServe"
                       "rSessionContainer.mm";
      *(_WORD *)&v13[8] = 1024;
      *(_DWORD *)&v13[10] = 2667;
      __int16 v14 = 2080;
      double v15 = "-[NIServerSessionContainer monitoredApp:didChangeState:]";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "#ses-container,%s:%d: assertion failure in %s",  (uint8_t *)&v12,  0x1Cu);
    }

    abort();
  }

  double v10 = sub_100023CC4();
  self->_latestAppState = a4;
  if (a4 == 2)
  {
    -[NIServerAnalyticsManager appBecameVisibleWithTimestamp:]( self->_analyticsManager,  "appBecameVisibleWithTimestamp:",  v10);
  }

  else
  {
    if (a4 != 3) {
      return;
    }
    -[NIServerAnalyticsManager appBecameNotVisibleWithTimestamp:]( self->_analyticsManager,  "appBecameNotVisibleWithTimestamp:",  v10);
  }

  -[NIServerSessionContainer _updateClientAppVisibilityInterruption](self, "_updateClientAppVisibilityInterruption");
}

- (id)updatesQueue
{
  return self->_connectionQueue;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 248LL, 1);
}

- (OS_dispatch_queue)connectionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 256LL, 1);
}

- (NSString)signingIdentity
{
  return (NSString *)objc_getProperty(self, a2, 264LL, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 272LL, 1);
}

- (int)pid
{
  return self->_pid;
}

- (NSUUID)sessionIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 280LL, 1);
}

- (NIServerSessionActivationGuard)activationGuard
{
  return (NIServerSessionActivationGuard *)objc_loadWeakRetained((id *)&self->_activationGuard);
}

- (void)setActivationGuard:(id)a3
{
}

- (NIServerSessionObservationRegistrar)observationRegistrar
{
  return (NIServerSessionObservationRegistrar *)objc_loadWeakRetained((id *)&self->_observationRegistrar);
}

- (void)setObservationRegistrar:(id)a3
{
}

- (NIServerSessionAggregateStateProvider)aggregateStateProvider
{
  return (NIServerSessionAggregateStateProvider *)objc_loadWeakRetained((id *)&self->_aggregateStateProvider);
}

- (void)setAggregateStateProvider:(id)a3
{
}

- (NIRecentlyObservedObjectsCache)nearbyObjectsCache
{
  return (NIRecentlyObservedObjectsCache *)objc_loadWeakRetained((id *)&self->_nearbyObjectsCache);
}

- (void)setNearbyObjectsCache:(id)a3
{
}

- (unsigned)latestSessionContainerState
{
  return self->_latestSessionContainerState;
}

- (void)setLatestSessionContainerState:(unsigned __int8)a3
{
  self->_latestSessionContainerState = a3;
}

- (int64_t)latestBluetoothState
{
  return self->_latestBluetoothState;
}

- (void)setLatestBluetoothState:(int64_t)a3
{
  self->_latestBluetoothState = a3;
}

- (int)latestAppState
{
  return self->_latestAppState;
}

- (void)setLatestAppState:(int)a3
{
  self->_latestAppState = a3;
}

- (unsigned)specializedSessionBackgroundSupport
{
  return self->_specializedSessionBackgroundSupport;
}

- (void)setSpecializedSessionBackgroundSupport:(unsigned __int8)a3
{
  self->_specializedSessionBackgroundSupport = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

@end