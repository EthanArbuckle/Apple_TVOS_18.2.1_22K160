@interface NIServerHomeDeviceSession
- (BOOL)_biasCorrectionRequirementFromDiscoveryToken:(id)a3;
- (BOOL)_biasCorrectionRequirementFromModelString:(id)a3;
- (BOOL)_isWifiRangingAllowed;
- (BOOL)_shouldRespondToDevice:(id)a3;
- (BOOL)_validateDiscoveryTokenDict:(id)a3;
- (BOOL)isInterestedInSamplesForDevice:(id)a3;
- (BOOL)supportsDevicePresence;
- (BOOL)supportsSessionObservers;
- (BOOL)updateConfiguration:(id)a3;
- (NIHomeDeviceConfiguration)configuration;
- (NIServerHomeDeviceSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (float)prewarmStateRegionThreshold;
- (id).cxx_construct;
- (id)_addPeers:(id)a3;
- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3;
- (id)_triggerInitiatorRanging;
- (id)_triggerResponderRangingForSession:(shared_ptr<rose:(id)a4 :objects::GRSession>)a3 initiatorDevice:;
- (id)addObject:(id)a3;
- (id)configure;
- (id)disableAllServices;
- (id)getQueueForInputingData;
- (id)lastConfiguration;
- (id)objectFromIdentifier:(unint64_t)a3;
- (id)pauseWithSource:(int64_t)a3;
- (id)printableState;
- (id)removeObject:(id)a3;
- (id)run;
- (int)_intentPredictorConfigFromDiscoveryToken:(id)a3;
- (int)_intentPredictorConfigFromModelString:(id)a3;
- (int)_magneticFieldStrengthCheckOptionFromDiscoveryToken:(id)a3;
- (int)_magneticFieldStrengthCheckOptionFromModelString:(id)a3;
- (int64_t)_regionCategoryFromBluetoothDevice:(id)a3;
- (int64_t)_regionCategoryFromDiscoveryToken:(id)a3;
- (int64_t)_regionCategoryFromModelString:(id)a3;
- (optional<rose::RoseServiceRequest>)_prepareServiceRequestWithConfig:(SEL)a3;
- (shared_ptr<WiFiRanging::Session>)_buildWifiSession;
- (shared_ptr<rose::objects::GRSession>)_buildRoseSession:(const void *)a3;
- (unint64_t)requiresSpatialInteractionBluetoothResource;
- (unint64_t)requiresUWBToRun;
- (unsigned)_flagsFromDiscoveryToken:(id)a3;
- (unsigned)_homeAnchorVariantFromDiscoveryToken:(id)a3;
- (void)_handleUWBSystemStateReadinessUpdate:(BOOL)a3;
- (void)_handleWifiRangingAvailableUpdate:(BOOL)a3;
- (void)_notifyPeerRemoval:(id)a3 withReason:(unint64_t)a4;
- (void)_pauseWifiRanging;
- (void)_peerHungUp:(unint64_t)a3;
- (void)_removePeerObject:(id)a3 uwbIdentifier:(unint64_t)a4 withReason:(unint64_t)a5;
- (void)_resumeWifiRanging;
- (void)_roseSession:(shared_ptr<rose:(int)a4 :(float)a5 objects:(float)a6 :(int)a7 RoseBaseSession>)a3 didChangeRangingUpdateRate:newThrottleRate:prevThrottleRate:effectiveSinceCycleInde:;
- (void)_roseSession:(shared_ptr<rose:(int)a4 :objects::RoseBaseSession>)a3 invalidatedWithReason:;
- (void)_sendHangupSignalForSession:(shared_ptr<rose::objects::GRSession>)a3;
- (void)_stopWiFiSessionsWithReason:(id)a3;
- (void)_updateAnalyticsAboutRangingRateForDevice:(id)a3 responseSkipRatio:(float)a4 cycleRate:(duration<long)long;
- (void)adjustResponderThrottleRateIfNeeded:(id)a3 object:(id)a4;
- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3;
- (void)consumeBluetoothSample:(id)a3;
- (void)dealloc;
- (void)device:(id)a3 rediscovered:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)deviceLost:(id)a3;
- (void)didReceiveDeviceMotion:(const void *)a3;
- (void)didReceiveNewSolution:(const void *)a3;
- (void)didReceiveRemoteData:(const void *)a3;
- (void)didUpdateMinimumPreferredUpdateRate:(int64_t)a3;
- (void)invalidate;
- (void)peerInactivityPeriodExceeded:(id)a3;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)updatesEngine:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6 regionTransitionSuppressed:(BOOL)a7;
@end

@implementation NIServerHomeDeviceSession

- (NIServerHomeDeviceSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v12 = objc_opt_class(v10, v11);
  if (v12 != objc_opt_class(&OBJC_CLASS___NIHomeDeviceConfiguration, v13))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v37 handleFailureInMethod:a2 object:self file:@"NIServerHomeDeviceSession.mm" lineNumber:479 description:@"NIServerHomeDeviceSession given invalid configuration."];
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);

  if (!v14)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v38 handleFailureInMethod:a2, self, @"NIServerHomeDeviceSession.mm", 480, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }

  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  v15 = -[NIServerBaseSession initWithResourcesManager:configuration:error:]( &v40,  "initWithResourcesManager:configuration:error:",  v9,  v10,  a5);
  if (v15)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v9 uwbResource]);
    v17 = (void *)*((void *)v15 + 27);
    *((void *)v15 + 27) = v16;

    if (v9) {
      [v9 protobufLogger];
    }
    else {
      __int128 v39 = 0uLL;
    }
    sub_10000EE54((uint64_t)(v15 + 48), &v39);
    v18 = (std::__shared_weak_count *)*((void *)&v39 + 1);
    if (*((void *)&v39 + 1))
    {
      v19 = (unint64_t *)(*((void *)&v39 + 1) + 8LL);
      do
        unint64_t v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }

    v15[200] = 100;
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v9 clientConnectionQueue]);
    v22 = (void *)*((void *)v15 + 10);
    *((void *)v15 + 10) = v21;

    id v23 = [v10 copy];
    v24 = (void *)*((void *)v15 + 60);
    *((void *)v15 + 60) = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);
    uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 UUIDString]);
    v27 = (void *)*((void *)v15 + 11);
    *((void *)v15 + 11) = v26;

    v15[96] = 0;
    *((void *)v15 + 26) = 3LL;
    v28 = operator new(0x88uLL);
    v28[1] = 0LL;
    v28[2] = 0LL;
    void *v28 = off_1007B16C0;
    *(void *)&__int128 v39 = sub_10026E70C((_BYTE *)v28 + 24);
    *((void *)&v39 + 1) = v28;
    sub_10000EE54((uint64_t)(v15 + 336), &v39);
    v29 = (std::__shared_weak_count *)*((void *)&v39 + 1);
    if (*((void *)&v39 + 1))
    {
      v30 = (unint64_t *)(*((void *)&v39 + 1) + 8LL);
      do
        unint64_t v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }

    unsigned int v32 = [*((id *)v15 + 27) currentServiceState];
    BOOL v33 = 1;
    if (v32 != 1) {
      BOOL v33 = [*((id *)v15 + 27) currentServiceState] == 2;
    }
    v15[97] = v33;
    v15[98] = 1;
    atomic_store(1u, (unsigned __int8 *)v15 + 352);
    *((void *)v15 + 45) = 0LL;
    sub_10016300C((uint64_t)(v15 + 368));
    *((void *)v15 + 53) = 1LL;
    *(_OWORD *)(v15 + 408) = xmmword_100426C78;
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerHomeDeviceService sharedInstance]( &OBJC_CLASS___NIServerHomeDeviceService,  "sharedInstance"));
    [v34 addServiceClient:v15 identifier:*((void *)v15 + 11) configuration:*((void *)v15 + 60)];

    v35 = v15;
  }

  return (NIServerHomeDeviceSession *)v15;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (BOOL)supportsSessionObservers
{
  return 1;
}

- (id)configure
{
  if (!self->_configuration) {
    sub_1003977C4();
  }
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    *(_DWORD *)buf = 138412290;
    v62 = configuration;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Configure. Configuration given: %@",  buf,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  if ([v5 BOOLForKey:@"NIHomeDisable"])
  {
    v6 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "#ses-home,NIHomeDisable set in defaults. Skip configuring session";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  if (!self->_isRunning)
  {
    unsigned int v10 = -[PRUWBServiceProviding currentServiceState](self->_uwbResource, "currentServiceState");
    BOOL v11 = 1;
    if (v10 != 1) {
      BOOL v11 = -[PRUWBServiceProviding currentServiceState](self->_uwbResource, "currentServiceState") == 2;
    }
    self->_uwbSystemAvailable = v11;
    self->_shouldHandleUWBStateReadinessUpdates = 1;
    -[NIServerHomeDeviceSession setupBackoffResumeManager](self, "setupBackoffResumeManager");
    v57.receiver = self;
    v57.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
    uint64_t v12 = -[NIServerBaseSession resourcesManager](&v57, "resourcesManager");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (!self->_updatesEngine)
    {
      v14 = objc_alloc(&OBJC_CLASS___NINearbyUpdatesEngine);
      v15 = self->_configuration;
      clientQueue = self->_clientQueue;
      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 analytics]);
      cntrl = self->_pbLogger.__cntrl_;
      ptr = self->_pbLogger.__ptr_;
      v56 = cntrl;
      if (cntrl)
      {
        v19 = (unint64_t *)((char *)cntrl + 8);
        do
          unint64_t v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }

      id v54 = 0LL;
      uint64_t v21 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:]( v14,  "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:",  v15,  clientQueue,  self,  self,  v17,  &ptr,  &v54);
      id v8 = v54;
      updatesEngine = self->_updatesEngine;
      self->_updatesEngine = v21;

      id v23 = (std::__shared_weak_count *)v56;
      if (v56)
      {
        v24 = (unint64_t *)((char *)v56 + 8);
        do
          unint64_t v25 = __ldaxr(v24);
        while (__stlxr(v25 - 1, v24));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }

      if (!self->_updatesEngine) {
        goto LABEL_62;
      }
    }

    if (!-[NIHomeDeviceConfiguration allowedDevices](self->_configuration, "allowedDevices"))
    {
      NSErrorUserInfoKey v68 = NSLocalizedDescriptionKey;
      v69 = @"NIRelationshipSpecifierNone is not a valid relationship specifier for this configuration.";
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v69,  &v68,  1LL));
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v27));
      goto LABEL_61;
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration sessionKey](self->_configuration, "sessionKey"));
    v27 = v26;
    if (v26 && [v26 length] != (id)16)
    {
      unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"sessionKey has invalid length. Expected: %d bytes. Got: %lu",  16,  [v27 length]));
      NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
      v67 = v31;
      unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v67,  &v66,  1LL));
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v32));

      goto LABEL_61;
    }

    if (!-[NIHomeDeviceConfiguration isAnchor](self->_configuration, "isAnchor")
      && -[NIHomeDeviceConfiguration antennaDiversityOverride](self->_configuration, "antennaDiversityOverride"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"antenna diversity option is invalid for responders"));
      NSErrorUserInfoKey v64 = NSLocalizedDescriptionKey;
      v65 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v29));

LABEL_61:
LABEL_62:

      goto LABEL_12;
    }

    int v30 = *((_DWORD *)sub_100005150() + 144);
    if (-[NIHomeDeviceConfiguration isAnchor](self->_configuration, "isAnchor"))
    {
      self->_currentSessionRole = 0;
      if (!self->_initiatorSession.__ptr_ && self->_uwbSystemAvailable)
      {
        -[NIServerHomeDeviceSession _prepareServiceRequestWithConfig:]( self,  "_prepareServiceRequestWithConfig:",  sub_100320A0C(v30));
        if (!v63)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to prepare service request."));
          NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
          v60 = v47;
          v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
          id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v48));

          goto LABEL_61;
        }

        -[NIServerHomeDeviceSession _buildRoseSession:](self, "_buildRoseSession:", buf);
        if (!v53[0] || !*(_BYTE *)(v53[0] + 682))
        {
          id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
          sub_100012390((uint64_t)v53);
          goto LABEL_61;
        }

        sub_100018E60(&self->_initiatorSession.__ptr_, v53);
        sub_100012390((uint64_t)v53);
      }
    }

    else
    {
      self->_currentSessionRole = 1;
    }

    int v33 = sub_1003209B8(v30);
    int64_t v34 = 10LL;
    if (!v33) {
      int64_t v34 = 0LL;
    }
    self->_recommendedProcessingOptions.regionSizeCategory = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"NIHomeLocalRegionSizeRecommendationOverride"]);
    BOOL v36 = v35 == 0LL;

    if (v36)
    {
LABEL_51:
      __int128 v39 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      objc_super v40 = (void *)objc_claimAutoreleasedReturnValue(-[NIHomeDeviceConfiguration monitoredRegions](self->_configuration, "monitoredRegions"));
      id v41 = [v40 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v50;
        do
        {
          for (i = 0LL; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v50 != v42) {
              objc_enumerationMutation(v40);
            }
            v44 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
            if (![v44 regionSizeCategory]) {
              -[NSMutableArray addObject:](v39, "addObject:", v44);
            }
          }

          id v41 = [v40 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }

        while (v41);
      }

      int v45 = -[NIServerHomeDeviceSession nominalCycleRate](self, "nominalCycleRate");
      id v46 = -[NSMutableArray copy](v39, "copy");
      sub_1001E0780((uint64_t)&self->_handoffCAManager, v46, v45);

      id v8 = 0LL;
      goto LABEL_61;
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue([v5 stringForKey:@"NIHomeLocalRegionSizeRecommendationOverride"]);
    if ([v37 isEqualToString:@"Default"])
    {
      int64_t v38 = 0LL;
    }

    else
    {
      if (![v37 isEqualToString:@"Large"])
      {
LABEL_50:

        goto LABEL_51;
      }

      int64_t v38 = 10LL;
    }

    self->_recommendedProcessingOptions.regionSizeCategory = v38;
    goto LABEL_50;
  }

  v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v7 = "#ses-home,Session is running, skip re-configure";
    goto LABEL_10;
  }

- (id)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  if ([v3 BOOLForKey:@"NIHomeDisable"])
  {
    v4 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#ses-home,NIHomeDisable set in defaults. Skip running session",  buf,  2u);
    }

    v5 = 0LL;
    goto LABEL_43;
  }

  if (self->_currentSessionRole != 100)
  {
    v6 = sub_1000141DC();
    atomic_store(sub_1000166AC((uint64_t)v6), (unsigned __int8 *)&self->_wifiServiceAllowsRanging);
    v44.receiver = self;
    v44.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
    v7 = -[NIServerBaseSession resourcesManager](&v44, "resourcesManager");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 btResource]);
    objc_msgSend( v9,  "setDeviceRelationshipFlags:",  -[NIHomeDeviceConfiguration allowedDevices](self->_configuration, "allowedDevices"));

    if (-[NIServerHomeDeviceSession _isWifiRangingAllowed](self, "_isWifiRangingAllowed"))
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 btResource]);
      [v10 setWifiRangingActiveAdvertisement];
    }

    else
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 btResource]);
      [v10 clearWifiRangingActiveAdvertisement];
    }

    if (self->_isRunning)
    {
      BOOL v11 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Session is running, return",  buf,  2u);
      }

      v5 = 0LL;
LABEL_42:

      goto LABEL_43;
    }

    self->_firstWifiMeasurementsReceived = 0;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 btResource]);
    [v12 startAdvertising];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v14 = [v13 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"];

    if (v14)
    {
      v15 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Disable UWB-aided handoff with HomeDeviceSessionBTLeechingEnabled",  buf,  2u);
      }

      uint64_t v16 = objc_opt_new(&OBJC_CLASS___CBAdvertiser);
      leechingAidingAdvertiser = self->_leechingAidingAdvertiser;
      self->_leechingAidingAdvertiser = v16;

      -[CBAdvertiser setDispatchQueue:](self->_leechingAidingAdvertiser, "setDispatchQueue:", self->_clientQueue);
      -[CBAdvertiser setLabel:]( self->_leechingAidingAdvertiser,  "setLabel:",  @"ProximityLeechingAidForHomeDeviceSession");
      -[CBAdvertiser setAdvertiseRate:](self->_leechingAidingAdvertiser, "setAdvertiseRate:", 50LL);
      -[CBAdvertiser setNearbyActionType:](self->_leechingAidingAdvertiser, "setNearbyActionType:", 17LL);
      -[CBAdvertiser setNearbyActionFlags:](self->_leechingAidingAdvertiser, "setNearbyActionFlags:", 64LL);
      -[CBAdvertiser activateWithCompletion:]( self->_leechingAidingAdvertiser,  "activateWithCompletion:",  &stru_1007B4A28);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v8 devicePresenceResource]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 internalObserver]);
      [v19 startBTScanningWithMaxRateForPrototypeHomeSession:self];
    }

    if ((-[NIConfiguration suspensionPolicy](self->_configuration, "suspensionPolicy") & 1) == 0)
    {
      unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 btResource]);
      [v20 allowScreenOffOperation:1];
    }

    uint64_t v21 = self;
    sub_1000065CC(buf, (char *)-[NSString UTF8String](v21->_containerUniqueIdentifier, "UTF8String"));
    v22 = sub_1000141DC();
    if (SHIBYTE(v43) < 0)
    {
      sub_1000063A8(__p, *(void **)buf, *(unint64_t *)&buf[8]);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v41 = v43;
    }

    id v23 = v21;
    v45[0] = off_1007B4A80;
    v45[1] = v23;
    id v46 = v45;
    sub_100014984((uint64_t)v22, (__int128 *)__p, (uint64_t)v45, self->_clientQueue);
    v24 = v46;
    if (v46 == v45)
    {
      uint64_t v25 = 4LL;
      v24 = v45;
    }

    else
    {
      if (!v46)
      {
LABEL_30:
        if (SHIBYTE(v41) < 0) {
          operator delete(__p[0]);
        }
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v8 btResource]);
        [v26 startScanning];

        v27 = (void *)objc_claimAutoreleasedReturnValue([v8 lifecycleSupervisor]);
        [v27 runWithConfigurationCalled];

        double v28 = sub_100023CC4();
        sub_1001E07B4((uint64_t)&v23->_handoffCAManager, v28);
        sub_10026EE70((uint64_t)v23->_wifiCAManager.__ptr_, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue([v8 btResource]);
        id v30 = [v29 nonConnectableAdvertisingAddress];
        if (v31)
        {
          id v39 = v30;
          unsigned int v32 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v39, 6LL);
          int v33 = sub_1000141DC();
          sub_100014270((uint64_t)v33, v32);
        }

        if (v23->_initiatorSession.__ptr_) {
          v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession _triggerInitiatorRanging](v23, "_triggerInitiatorRanging"));
        }
        else {
          v5 = 0LL;
        }
        self->_isRunning = v5 == 0LL;
        v23->_shouldDeliverUpdates = v5 == 0LL;
        if (self->_isRunning)
        {
          clientQueue = (dispatch_queue_s *)self->_clientQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1001B0FB4;
          block[3] = &unk_1007A2248;
          id v37 = v8;
          int64_t v38 = v23;
          dispatch_async(clientQueue, block);
        }

        if (SHIBYTE(v43) < 0) {
          operator delete(*(void **)buf);
        }

        goto LABEL_42;
      }

      uint64_t v25 = 5LL;
    }

    (*(void (**)(void))(*v24 + 8 * v25))();
    goto LABEL_30;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
    sub_1003977EC();
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
LABEL_43:

  return v5;
}

- (id)pauseWithSource:(int64_t)a3
{
  self->_isRunning = 0;
  self->_shouldDeliverUpdates = 0;
  sub_10016300C((uint64_t)&self->_cachedRegionUpdateEvent);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerHomeDeviceSession _disableAllServicesAndSendHangupSignal:]( self,  "_disableAllServicesAndSendHangupSignal:",  0LL));
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  v5 = -[NIServerBaseSession resourcesManager](&v10, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lifecycleSupervisor]);
  [v7 pauseCalled];

  double v8 = sub_100023CC4();
  sub_1001E0814((uint64_t)&self->_handoffCAManager, v8);
  sub_10026E900(self->_wifiCAManager.__ptr_);
  self->_firstWifiMeasurementsReceived = 0;
  return v4;
}

- (BOOL)updateConfiguration:(id)a3
{
  v4 = (NIHomeDeviceConfiguration *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_isRunning)
  {
    uint64_t v12 = (os_log_s *)qword_1008000A0;
    BOOL v11 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    configuration = self->_configuration;
    int v17 = 138412546;
    v18 = configuration;
    __int16 v19 = 2112;
    unint64_t v20 = v4;
    unsigned int v14 = "#ses-home,Can't update configuration, not running\nOld: %@\nNew: %@";
    goto LABEL_12;
  }

  if (!v4
    || !self->_configuration
    || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NIHomeDeviceConfiguration, v5), (objc_opt_isKindOfClass(v4, v6) & 1) == 0))
  {
    uint64_t v12 = (os_log_s *)qword_1008000A0;
    BOOL v11 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v13 = self->_configuration;
    int v17 = 138412546;
    v18 = v13;
    __int16 v19 = 2112;
    unint64_t v20 = v4;
    unsigned int v14 = "#ses-home,Can't update configuration, one is nil or wrong type\nOld: %@\nNew: %@";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 0x16u);
    BOOL v11 = 0;
    goto LABEL_13;
  }

  v7 = (NIHomeDeviceConfiguration *)-[NIHomeDeviceConfiguration copy](v4, "copy");
  double v8 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = self->_configuration;
    int v17 = 138412546;
    v18 = v9;
    __int16 v19 = 2112;
    unint64_t v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Update configuration\nOld: %@\nNew: %@",  (uint8_t *)&v17,  0x16u);
  }

  objc_super v10 = self->_configuration;
  self->_configuration = v7;

  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (id)addObject:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  uint64_t v5 = -[NIServerBaseSession resourcesManager](&v12, "resourcesManager");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v14 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession _addPeers:](self, "_addPeers:", v7));

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100397884();
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 lifecycleSupervisor]);
    [v9 failedToAddPeer];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 lifecycleSupervisor]);
    id v13 = v4;
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
    [v9 startedDiscoveringPeersWithTokens:v10];
  }

  return 0LL;
}

- (id)removeObject:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  uint64_t v5 = -[NIServerBaseSession resourcesManager](&v16, "resourcesManager");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  id v7 = -[NIServerBaseSession identifierFromDiscoveryToken:](&v15, "identifierFromDiscoveryToken:", v4);
  if (v8)
  {
    id v9 = 0LL;
    -[NIServerHomeDeviceSession _removePeerObject:uwbIdentifier:withReason:]( self,  "_removePeerObject:uwbIdentifier:withReason:",  v4,  v7,  2LL);
  }

  else
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Token %@ has no associated identifier.",  v4));
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100397900();
    }
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    __int16 v19 = v10;
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v11));
  }

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 lifecycleSupervisor]);
  id v17 = v4;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  [v12 stoppedDiscoveringPeersWithTokens:v13];

  return 0LL;
}

- (id)disableAllServices
{
  return -[NIServerHomeDeviceSession _disableAllServicesAndSendHangupSignal:]( self,  "_disableAllServicesAndSendHangupSignal:",  1LL);
}

- (BOOL)_isWifiRangingAllowed
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_wifiServiceAllowsRanging);
  if ((v3 & 1) == 0) {
    return 0;
  }
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_wifiRangingAllowedLockscreen);
  return v5 & 1;
}

- (void)_resumeWifiRanging
{
  if (-[NIServerHomeDeviceSession _isWifiRangingAllowed](self, "_isWifiRangingAllowed"))
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
    unsigned __int8 v3 = -[NIServerBaseSession resourcesManager](&v21, "resourcesManager");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 btResource]);
    [v5 setWifiRangingActiveAdvertisement];

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uwbResource]);
    unsigned __int8 v7 = [v6 deviceCapabilities];

    if ((v7 & 1) == 0)
    {
      char v8 = (void *)objc_claimAutoreleasedReturnValue([v4 btResource]);
      [v8 startScanning];
    }

    if (self->_wifiSessions.__table_.__p2_.__value_)
    {
      for (i = self->_wifiSessions.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
      {
        sub_1001B983C(&buf, i[3] + 120LL);
        if (v20)
        {

          uint64_t v10 = i[3];
          sub_1001B983C(&buf, v10 + 120);
          if (!v20) {
            sub_100006080();
          }
          sub_100024E24(v10, (uint64_t)&buf);
          if (!v20) {
            continue;
          }
        }

        else
        {
          uint64_t v11 = i[2];
          objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configuration](self, "configuration"));
          else {
            int v13 = 1;
          }
          sub_100024390((uint64_t)&buf, v11, v13);

          sub_100024E24(i[3], (uint64_t)&buf);
          id v14 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)objc_super v16 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ses-home,no configuration for starting wifi ranging session, creating new config",  v16,  2u);
          }
        }
      }
    }
  }

  else
  {
    objc_super v15 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      buf.n128_u16[0] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#ses-home,wifi ranging is not allowed at this time",  (uint8_t *)&buf,  2u);
    }
  }

- (void)_pauseWifiRanging
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  unsigned __int8 v3 = -[NIServerBaseSession resourcesManager](&v10, "resourcesManager");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 btResource]);
  [v5 clearWifiRangingActiveAdvertisement];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uwbResource]);
  unsigned __int8 v7 = [v6 deviceCapabilities];

  if ((v7 & 1) == 0)
  {
    char v8 = (void *)objc_claimAutoreleasedReturnValue([v4 btResource]);
    [v8 stopScanningAndRemovePeers:0];
  }

  if (self->_wifiSessions.__table_.__p2_.__value_)
  {
    for (i = &self->_wifiSessions.__table_.__p1_; ; sub_100024A6C((uint64_t)i[3].__value_.__next_))
    {
      i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *>>> *)i->__value_.__next_;
      if (!i) {
        break;
      }
    }
  }
}

- (void)invalidate
{
  self->_isRunning = 0;
  self->_shouldDeliverUpdates = 0;
  self->_shouldHandleUWBStateReadinessUpdates = 0;
  -[CBAdvertiser invalidate](self->_leechingAidingAdvertiser, "invalidate");
  leechingAidingAdvertiser = self->_leechingAidingAdvertiser;
  self->_leechingAidingAdvertiser = 0LL;

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  id v4 = -[NIServerBaseSession resourcesManager](&v17, "resourcesManager");
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 devicePresenceResource]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 internalObserver]);
  [v7 stopBTScanningWithMaxRateForPrototypeHomeSession];

  sub_10016300C((uint64_t)&self->_cachedRegionUpdateEvent);
  id v8 = -[NIServerHomeDeviceSession disableAllServices](self, "disableAllServices");
  double v9 = sub_100023CC4();
  sub_1001E0814((uint64_t)&self->_handoffCAManager, v9);
  sub_10026E900(self->_wifiCAManager.__ptr_);
  sub_1000065CC(v15, (char *)-[NSString UTF8String](self->_containerUniqueIdentifier, "UTF8String"));
  objc_super v10 = sub_1000141DC();
  if (SHIBYTE(v16) < 0)
  {
    sub_1000063A8(__p, v15[0], (unint64_t)v15[1]);
  }

  else
  {
    *(_OWORD *)__p = *(_OWORD *)v15;
    uint64_t v14 = v16;
  }

  sub_100014BA8((uint64_t)v10, (const void **)__p);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
  self->_firstWifiMeasurementsReceived = 0;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  -[NIServerBaseSession invalidate](&v12, "invalidate");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerHomeDeviceService sharedInstance](&OBJC_CLASS___NIServerHomeDeviceService, "sharedInstance"));
  [v11 removeServiceClientWithIdentifier:self->_containerUniqueIdentifier];

  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
}

- (void)dealloc
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NIServerHomeDeviceService sharedInstance](&OBJC_CLASS___NIServerHomeDeviceService, "sharedInstance"));
  [v3 removeServiceClientWithIdentifier:self->_containerUniqueIdentifier];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  -[NIServerHomeDeviceSession dealloc](&v4, "dealloc");
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)150LL;
}

- (unint64_t)requiresUWBToRun
{
  return 1LL;
}

- (unint64_t)requiresSpatialInteractionBluetoothResource
{
  return 2LL;
}

- (void)deviceDiscovered:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_currentSessionRole == 100) {
    goto LABEL_117;
  }
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v6 = [v5 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"];

  unsigned __int8 v7 = (os_log_s *)qword_1008000A0;
  BOOL v8 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      containerUniqueIdentifier = self->_containerUniqueIdentifier;
      *(_DWORD *)__n128 buf = 138412546;
      *(void *)&uint8_t buf[4] = containerUniqueIdentifier;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Device discovered. Session Identifier: %@. Device: %@",  buf,  0x16u);
    }

    v102.receiver = self;
    v102.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
    objc_super v10 = -[NIServerBaseSession resourcesManager](&v102, "resourcesManager");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 wifiResource]);
    unsigned int v95 = [v12 deviceCapabilities];

    else {
      BOOL uwbSystemAvailable = 0;
    }
    unsigned int v94 = [v4 isWifiRangingCapable];
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 btResource]);
    [v13 startAdvertisingBurstForDeviceDiscovery];

    __int128 v100 = xmmword_100426C78;
    uint64_t v101 = 1LL;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    if ([v4 systemKeyRelationship])
    {
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v4 cbDevice]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 model]);

      if (!v16)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100397960();
        }
        goto LABEL_116;
      }

      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"NIHomeDisableAllowListPolicy"]);
      BOOL v18 = v17 == 0LL;

      if (v18) {
        unsigned int v19 = 0;
      }
      else {
        unsigned int v19 = [v14 BOOLForKey:@"NIHomeDisableAllowListPolicy"];
      }
      int v26 = sub_1001B303C(v16);
      int v27 = v26;
      if ((uwbSystemAvailable & (v19 ^ 1)) == 1 && (v26 & 0x3FD) == 0x3E5)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_10039798C();
        }
        goto LABEL_116;
      }

      LOBYTE(v100) = -[NIServerHomeDeviceSession _biasCorrectionRequirementFromModelString:]( self,  "_biasCorrectionRequirementFromModelString:",  v16);
      DWORD1(v100) = -[NIServerHomeDeviceSession _magneticFieldStrengthCheckOptionFromModelString:]( self,  "_magneticFieldStrengthCheckOptionFromModelString:",  v16);
      unsigned int v93 = sub_100320A0C(v27);
      LODWORD(v101) = -[NIServerHomeDeviceSession _intentPredictorConfigFromModelString:]( self,  "_intentPredictorConfigFromModelString:",  v16);
      if ((id)-[NIServerHomeDeviceSession _regionCategoryFromModelString:]( self,  "_regionCategoryFromModelString:",  v16) == (id)10)
      {
        int64_t regionSizeCategory = 10LL;
      }

      else
      {
        int64_t regionSizeCategory = self->_recommendedProcessingOptions.regionSizeCategory;
        if (regionSizeCategory != 10) {
          int64_t regionSizeCategory = 0LL;
        }
      }

      *((void *)&v100 + 1) = regionSizeCategory;
      v29 = (void *)objc_claimAutoreleasedReturnValue([v11 lifecycleSupervisor]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 discoveryToken]);
      v112 = v30;
      char v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v112, 1LL));
      [v29 startedDiscoveringPeersWithTokens:v31];
    }

    else
    {
      char v20 = (void *)objc_claimAutoreleasedReturnValue([v4 discoveryToken]);
      LOBYTE(v100) = -[NIServerHomeDeviceSession _biasCorrectionRequirementFromDiscoveryToken:]( self,  "_biasCorrectionRequirementFromDiscoveryToken:",  v20);

      objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v4 discoveryToken]);
      DWORD1(v100) = -[NIServerHomeDeviceSession _magneticFieldStrengthCheckOptionFromDiscoveryToken:]( self,  "_magneticFieldStrengthCheckOptionFromDiscoveryToken:",  v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue([v4 discoveryToken]);
      unsigned int v93 = -[NIServerHomeDeviceSession _homeAnchorVariantFromDiscoveryToken:]( self,  "_homeAnchorVariantFromDiscoveryToken:",  v22);

      id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 discoveryToken]);
      LODWORD(v101) = -[NIServerHomeDeviceSession _intentPredictorConfigFromDiscoveryToken:]( self,  "_intentPredictorConfigFromDiscoveryToken:",  v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue([v4 discoveryToken]);
      int64_t v25 = -[NIServerHomeDeviceSession _regionCategoryFromDiscoveryToken:]( self,  "_regionCategoryFromDiscoveryToken:",  v24);

      if (v25 == 10 || self->_recommendedProcessingOptions.regionSizeCategory == 10) {
        *((void *)&v100 + 1) = 10LL;
      }
      else {
        *((void *)&v100 + 1) = 0LL;
      }
    }

    unsigned int v32 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      sub_100045754((uint64_t)buf);
      int v33 = sub_100046B94(&buf[16], (uint64_t)"require bias correction: ", 25LL);
      if ((_BYTE)v100) {
        int64_t v34 = "yes";
      }
      else {
        int64_t v34 = "no";
      }
      if ((_BYTE)v100) {
        uint64_t v35 = 3LL;
      }
      else {
        uint64_t v35 = 2LL;
      }
      BOOL v36 = sub_100046B94(v33, (uint64_t)v34, v35);
      std::ios_base::getloc((const std::ios_base *)((char *)v36 + *(void *)(*v36 - 24LL)));
      id v37 = std::locale::use_facet(&v103, &std::ctype<char>::id);
      uint64_t v38 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v37->__vftable[2].~facet_0)(v37, 10LL);
      std::locale::~locale(&v103);
      std::ostream::put(v36, v38);
      std::ostream::flush(v36);
      id v39 = sub_100046B94(&buf[16], (uint64_t)"magnetic field strength check options: ", 39LL);
      objc_super v40 = (void *)std::ostream::operator<<(v39, DWORD1(v100));
      std::ios_base::getloc((const std::ios_base *)((char *)v40 + *(void *)(*v40 - 24LL)));
      uint64_t v41 = std::locale::use_facet(&v103, &std::ctype<char>::id);
      uint64_t v42 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v41->__vftable[2].~facet_0)(v41, 10LL);
      std::locale::~locale(&v103);
      std::ostream::put(v40, v42);
      std::ostream::flush(v40);
      uint64_t v43 = sub_100046B94(&buf[16], (uint64_t)"region size category: ", 22LL);
      objc_super v44 = (void *)std::ostream::operator<<(v43, DWORD2(v100));
      std::ios_base::getloc((const std::ios_base *)((char *)v44 + *(void *)(*v44 - 24LL)));
      int v45 = std::locale::use_facet(&v103, &std::ctype<char>::id);
      uint64_t v46 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v45->__vftable[2].~facet_0)(v45, 10LL);
      std::locale::~locale(&v103);
      std::ostream::put(v44, v46);
      std::ostream::flush(v44);
      v47 = sub_100046B94(&buf[16], (uint64_t)"intent predictor config: ", 25LL);
      v48 = (void *)std::ostream::operator<<(v47, v101);
      std::ios_base::getloc((const std::ios_base *)((char *)v48 + *(void *)(*v48 - 24LL)));
      __int128 v49 = std::locale::use_facet(&v103, &std::ctype<char>::id);
      uint64_t v50 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v49->__vftable[2].~facet_0)(v49, 10LL);
      std::locale::~locale(&v103);
      std::ostream::put(v48, v50);
      std::ostream::flush(v48);
      std::stringbuf::str(&v104, &v110);
      *(void *)&uint8_t buf[16] = v51;
      std::streambuf::~streambuf(&v110);
      std::ios::~ios(v111);
      __int128 v52 = &v104;
      if ((v104.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        __int128 v52 = (std::stringbuf::string_type *)v104.__r_.__value_.__r.__words[0];
      }
      LODWORD(v108) = 136315138;
      *(void *)((char *)&v108 + 4) = v52;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#ses-home,processing options are %s",  (uint8_t *)&v108,  0xCu);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NINearbyObject objectFromBluetoothDevice:]( &OBJC_CLASS___NINearbyObject,  "objectFromBluetoothDevice:",  v4));
    if (!v16)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_1003979EC();
      }
      goto LABEL_116;
    }

    v53 = (void *)objc_claimAutoreleasedReturnValue([v11 remote]);
    [v53 didDiscoverNearbyObject:v16];

    if (self->_pbLogger.__ptr_)
    {
      double v54 = sub_100023CC4();
      ptr = self->_pbLogger.__ptr_;
      id v56 = [v4 u64Identifier];
      sub_100230924(v16, (uint64_t)buf);
      sub_100239E68((uint64_t)ptr, (uint64_t)v56, (uint64_t)buf, v54);
      if (*(void *)buf)
      {
        *(void *)&buf[8] = *(void *)buf;
        operator delete(*(void **)buf);
      }
    }

    if (!-[NIServerHomeDeviceSession _shouldRespondToDevice:](self, "_shouldRespondToDevice:", v4))
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100397B30();
      }
      goto LABEL_116;
    }

    if (uwbSystemAvailable)
    {
      if (!self->_currentSessionRole) {
        goto LABEL_116;
      }
      if (self->_currentSessionRole != 1) {
        __assert_rtn( "-[NIServerHomeDeviceSession deviceDiscovered:]",  "NIServerHomeDeviceSession.mm",  1314,  "_currentSessionRole == Role::Responder");
      }
      if (([v14 BOOLForKey:@"NIHomeAllowMobileAsAnchor"] & 1) == 0
        && [v4 isMobilePhoneModel])
      {
        objc_super v57 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__n128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v4;
          v58 = "#ses-home,No uwb responding to another mobile: %@";
LABEL_109:
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, v58, buf, 0xCu);
          goto LABEL_116;
        }

        goto LABEL_116;
      }

      -[NIServerHomeDeviceSession _prepareServiceRequestWithConfig:](self, "_prepareServiceRequestWithConfig:", v93);
      if (!v111[376]) {
        goto LABEL_116;
      }
      -[NIServerHomeDeviceSession _buildRoseSession:](self, "_buildRoseSession:", buf);
      if ((void)v108)
      {
        id v99 = [v4 u64Identifier];
        char v63 = sub_100046FEC(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v99);
        if (v63)
        {
          NSErrorUserInfoKey v64 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v104.__r_.__value_.__l.__data_) = 134217984;
            *(std::string::size_type *)((char *)v104.__r_.__value_.__r.__words + 4) = (std::string::size_type)v99;
            _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Evicting previous UWB session with same identitifer: 0x%llx",  (uint8_t *)&v104,  0xCu);
          }

          uint64_t v65 = v63[3];
          std::string::size_type v66 = v63[4];
          v104.__r_.__value_.__r.__words[0] = v65;
          v104.__r_.__value_.__l.__size_ = v66;
          if (v66)
          {
            v67 = (unint64_t *)(v66 + 8);
            do
              unint64_t v68 = __ldxr(v67);
            while (__stxr(v68 + 1, v67));
          }

          if (v65) {
            sub_10026FAA8(v65);
          }
          sub_1001B3554(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, v63);
          sub_100012390((uint64_t)&v104);
        }

        v69 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession objectFromIdentifier:](self, "objectFromIdentifier:", v99));
        v97 = (void *)objc_claimAutoreleasedReturnValue([v69 discoveryToken]);

        if (v97)
        {
          double v70 = sub_100023CC4();
          sub_1001E0338( (uint64_t)&self->_handoffCAManager,  (unint64_t)[v97 hash],  (int)-[NIServerHomeDeviceSession nominalCycleRate](self, "nominalCycleRate"),  v70);
        }

        v103.__locale_ = (std::locale::__imp *)&v99;
        v104.__r_.__value_.__r.__words[0] = (std::string::size_type)&v108;
        v104.__r_.__value_.__l.__size_ = (std::string::size_type)&v100;
        sub_1001B9BB8( (uint64_t)&self->_responderSessions,  (uint64_t *)&v99,  (uint64_t)&unk_1004242F8,  &v103,  (uint64_t)&v104);
        if (!v71 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100397AA4();
        }
        v72 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          id v73 = [v4 u64Identifier];
          if ((_BYTE)v100) {
            v74 = "YES";
          }
          else {
            v74 = "NO";
          }
          v75 = sub_1002307E0(*((uint64_t *)&v100 + 1));
          id v76 = objc_claimAutoreleasedReturnValue(v75);
          id v77 = [v76 UTF8String];
          LODWORD(v104.__r_.__value_.__l.__data_) = 134218754;
          *(std::string::size_type *)((char *)v104.__r_.__value_.__r.__words + 4) = (std::string::size_type)v73;
          WORD2(v104.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&v104.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v74;
          HIWORD(v104.__r_.__value_.__r.__words[2]) = 2080;
          id v105 = v77;
          __int16 v106 = 1024;
          int v107 = DWORD1(v100);
          _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "#ses-home,recorded mac addr 0x%llx needs bias correction: %s, regionCategory: %s, magnetic field strength check option: %d",  (uint8_t *)&v104,  0x26u);
        }

        __int128 v98 = v108;
        if (*((void *)&v108 + 1))
        {
          v78 = (unint64_t *)(*((void *)&v108 + 1) + 8LL);
          do
            unint64_t v79 = __ldxr(v78);
          while (__stxr(v79 + 1, v78));
        }

        v80 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerHomeDeviceSession _triggerResponderRangingForSession:initiatorDevice:]( self,  "_triggerResponderRangingForSession:initiatorDevice:",  &v98,  v4));
        sub_100012390((uint64_t)&v98);
        if (v80)
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_100397A44();
          }
          v81 = (void *)objc_claimAutoreleasedReturnValue([v11 remote]);
          [v81 uwbSessionDidFailWithError:v80];
        }

        sub_100012390((uint64_t)&v108);
        goto LABEL_116;
      }

      sub_100012390((uint64_t)&v108);
    }

    else
    {
      if ((v94 & v95) == 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100397B04();
        }
        goto LABEL_116;
      }

      NSErrorUserInfoKey v59 = (void *)objc_claimAutoreleasedReturnValue([v4 cbDevice]);
      v60 = (void *)objc_claimAutoreleasedReturnValue([v59 model]);
      if ([v60 hasPrefix:@"AudioAccessory"])
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configuration](self, "configuration"));
        unsigned int v62 = [v61 isAnchor];

        if (v62)
        {
          objc_super v57 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__n128 buf = 138412290;
            *(void *)&uint8_t buf[4] = v4;
            v58 = "#ses-home,No wifi responding to another anchor: %@";
            goto LABEL_109;
          }

- (void)bluetoothAdvertisingAddressChanged:(unint64_t)a3
{
  unint64_t v5 = a3;
  unsigned __int8 v3 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", &v5, 6LL);
  id v4 = sub_1000141DC();
  sub_100014270((uint64_t)v4, v3);
}

- (void)device:(id)a3 rediscovered:(id)a4
{
  id v86 = a3;
  id v87 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v92 = [v86 u64Identifier];
  unint64_t v6 = (unint64_t)sub_100046FEC( &self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_,  (unint64_t *)&v92);
  p_wifiSessions = &self->_wifiSessions;
  unint64_t v7 = (unint64_t)sub_100046FEC( &self->_wifiSessions.__table_.__bucket_list_.__ptr_.__value_,  (unint64_t *)&v92);
  if (v6 | v7)
  {
    v91.receiver = self;
    v91.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
    BOOL v8 = -[NIServerBaseSession resourcesManager](&v91, "resourcesManager");
    v85 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v84 = (void *)objc_claimAutoreleasedReturnValue([v86 discoveryToken]);
    if (!v84) {
      goto LABEL_12;
    }
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v85 lifecycleSupervisor]);
    if (([v9 isTrackingPeer:v84] & 1) == 0)
    {
      unsigned int v10 = [v87 systemKeyRelationship];

      if (!v10) {
        goto LABEL_12;
      }
      uint64_t v11 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__n128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v84;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Re-discovered peer has systemKeyRelationship but isn't being tracked, retracking peer with token: %@",  buf,  0xCu);
      }

      double v9 = (void *)objc_claimAutoreleasedReturnValue([v85 lifecycleSupervisor]);
      v97 = v84;
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v97, 1LL));
      [v9 startedDiscoveringPeersWithTokens:v12];
    }

LABEL_12:
    if (self->_pbLogger.__ptr_)
    {
      double v13 = sub_100023CC4();
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NINearbyObject objectFromBluetoothDevice:]( &OBJC_CLASS___NINearbyObject,  "objectFromBluetoothDevice:",  v87));
      if (v14)
      {
        ptr = self->_pbLogger.__ptr_;
        id v16 = [v87 u64Identifier];
        sub_100230924(v14, (uint64_t)buf);
        sub_100239E68((uint64_t)ptr, (uint64_t)v16, (uint64_t)buf, v13);
        if (*(void *)buf)
        {
          *(void *)&buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT))
      {
        sub_1003979EC();
      }
    }

    id v90 = [v87 u64Identifier];
    id v17 = [v87 u64Identifier];
    id v18 = [v86 u64Identifier];
    unsigned int v19 = [v87 isWifiRangingCapable];
    unsigned int v20 = [v86 isWifiRangingCapable];
    int currentSessionRole = self->_currentSessionRole;
    v22 = (os_log_s *)qword_1008000A0;
    if (v17 != v18 && currentSessionRole == 1 && v6)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__n128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Device rediscovered decision: restarting UWB session since address is change, role == responder and there's active UWB session.",  buf,  2u);
      }

      uint64_t v23 = *(void *)(v6 + 32);
      *(void *)__n128 buf = *(void *)(v6 + 24);
      *(void *)&buf[8] = v23;
      if (v23)
      {
        v24 = (unint64_t *)(v23 + 8);
        do
          unint64_t v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }

      *(_OWORD *)&uint8_t buf[16] = *(_OWORD *)(v6 + 40);
      uint64_t v96 = *(void *)(v6 + 56);
      sub_1001BA180(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)(v6 + 16));
      *(void *)unsigned int v93 = &v90;
      *(void *)unsigned int v94 = buf;
      *(void *)&v94[8] = &buf[16];
      sub_1001B9BB8( (uint64_t)&self->_responderSessions,  (uint64_t *)&v90,  (uint64_t)&unk_1004242F8,  (void **)v93,  (uint64_t)v94);
      int v26 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unsigned int v94 = 134218240;
        *(void *)&v94[4] = v92;
        *(_WORD *)&v94[12] = 2048;
        *(void *)&v94[14] = v90;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "#ses-home,updated mac addr 0x%llx -> 0x%llx in processing info dictionary",  v94,  0x16u);
      }

      uint64_t v88 = *(void *)buf;
      int v89 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        int v27 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v28 = __ldxr(v27);
        while (__stxr(v28 + 1, v27));
      }

      uint64_t v29 = objc_claimAutoreleasedReturnValue( -[NIServerHomeDeviceSession _triggerResponderRangingForSession:initiatorDevice:]( self,  "_triggerResponderRangingForSession:initiatorDevice:",  &v88,  v87));
      id v30 = (void *)v29;
      char v31 = v89;
      if (!v89) {
        goto LABEL_36;
      }
      p_shared_owners = (unint64_t *)&v89->__shared_owners_;
      do
        unint64_t v33 = __ldaxr(p_shared_owners);
      while (__stlxr(v33 - 1, p_shared_owners));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
        if (!v30) {
          goto LABEL_40;
        }
      }

      else
      {
LABEL_36:
        if (!v29) {
          goto LABEL_40;
        }
      }

      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100397C64();
      }
      int64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v85 remote]);
      [v34 uwbSessionDidFailWithError:v30];

LABEL_40:
      uint64_t v35 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        BOOL v36 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v37 = __ldaxr(v36);
        while (__stlxr(v37 - 1, v36));
LABEL_43:
        if (!v37)
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }

        goto LABEL_116;
      }

      goto LABEL_116;
    }

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__n128 buf = 67109632;
      *(_DWORD *)&uint8_t buf[4] = v17 != v18;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = currentSessionRole == 1;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&uint8_t buf[16] = v6 != 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "#ses-home,Device rediscovered decision: Not restarting UWB session since addressChange?: %d, role == responder?: %d and active UWB session?:%d",  buf,  0x14u);
    }

    uint64_t v38 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      containerUniqueIdentifier = self->_containerUniqueIdentifier;
      *(_DWORD *)__n128 buf = 138412802;
      *(void *)&uint8_t buf[4] = containerUniqueIdentifier;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v87;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&_BYTE buf[24] = v86;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Device re-discovered. Session Identifier: %@. New Device: %@, cached device: %@",  buf,  0x20u);
    }

    int v40 = v19 ^ v20;
    if (v17 == v18)
    {
      if ((v40 & 1) != 0) {
        goto LABEL_57;
      }
    }

    else
    {
      if (v7) {
        char v41 = 1;
      }
      else {
        char v41 = v40;
      }
      if ((v41 & 1) != 0) {
        goto LABEL_57;
      }
    }

    if (([v86 isWifiRangingCapable] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
        sub_100397CC4();
      }
      goto LABEL_116;
    }

- (void)deviceLost:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v17 = [v4 u64Identifier];
  p_wifiSessions = &self->_wifiSessions;
  unint64_t v6 = sub_100046FEC(p_wifiSessions, (unint64_t *)&v17);
  unint64_t v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [v4 isWifiRangingCapable];
    *(_DWORD *)__n128 buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-home,device lost, current wifi capabilities from cached device: %d",  buf,  8u);
  }

  if (v6)
  {
    double v9 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#ses-home,stopping wifi ranging session due to lost device",  buf,  2u);
    }

    unsigned int v10 = v6 + 2;
    uint64_t v12 = v6[3];
    uint64_t v11 = (std::__shared_weak_count *)v6[4];
    *(void *)__n128 buf = v12;
    unsigned int v19 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        unint64_t v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }

    sub_1001BA180(p_wifiSessions, v10);
    sub_100024A6C(v12);
    if (v11)
    {
      objc_super v15 = (unint64_t *)&v11->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
}

- (void)didReceiveNewSolution:(const void *)a3
{
  if ((*((_DWORD *)a3 + 8) - 1) >= 3)
  {
    objc_super v15 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_100397E48((int *)a3 + 8, v15);
    }
  }

  else
  {
    if (*((_BYTE *)a3 + 24))
    {
      double v5 = *((double *)a3 + 2);
      unint64_t v6 = *((void *)a3 + 5);
      v20.receiver = self;
      v20.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
      unint64_t v21 = v6;
      id v7 = -[NIServerBaseSession discoveryTokenFromIdentifier:](&v20, "discoveryTokenFromIdentifier:", v6);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      if (!v8)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100397D28();
        }
        goto LABEL_19;
      }

      v19.receiver = self;
      v19.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
      double v9 = -[NIServerBaseSession resourcesManager](&v19, "resourcesManager");
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lifecycleSupervisor]);
      unsigned __int8 v12 = [v11 isTrackingPeer:v8];

      if ((v12 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100397DE8();
        }
        goto LABEL_18;
      }

      if (self->_currentSessionRole == 1)
      {
        double v13 = sub_100046FEC(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, &v21);
        if (!v13)
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_100397D88();
          }
          goto LABEL_18;
        }

        p_recommendedProcessingOptions = (AlgorithmProcessingOptions *)(v13 + 5);
      }

      else
      {
        p_recommendedProcessingOptions = &self->_recommendedProcessingOptions;
      }

      __int128 v17 = *(_OWORD *)&p_recommendedProcessingOptions->requiresBiasCorrection;
      uint64_t v18 = *(void *)&p_recommendedProcessingOptions->intentPredictorConfiguration;
      -[NINearbyUpdatesEngine acceptRoseSolution:withProcessingOptions:]( self->_updatesEngine,  "acceptRoseSolution:withProcessingOptions:",  a3,  &v17);
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 lifecycleSupervisor]);
      [v16 measurementReceivedForToken:v8 contTimestamp:v5];

LABEL_18:
LABEL_19:

      return;
    }

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100397CFC();
    }
  }

- (void)didReceiveDeviceMotion:(const void *)a3
{
}

- (void)didReceiveRemoteData:(const void *)a3
{
  id v4 = (char *)a3 + 8;
  unsigned __int8 v3 = (_BYTE *)*((void *)a3 + 1);
  double v5 = (char *)a3 + 16;
  if (*((void *)a3 + 2) - (void)v3 > 0xFuLL)
  {
    if (*v3 == 2)
    {
      if (v3[1])
      {
        double v9 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = *((void *)a3 + 5);
          int v11 = 134283521;
          uint64_t v12 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#ses-home,#hangup Received hangup from 0x%{private}llx.",  (uint8_t *)&v11,  0xCu);
        }

        -[NIServerHomeDeviceSession _peerHungUp:](self, "_peerHungUp:", *((void *)a3 + 5));
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_100397F4C();
    }
  }

  else
  {
    unint64_t v6 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100397EBC(v5, v4, v6);
    }
  }

- (void)_roseSession:(shared_ptr<rose:(int)a4 :(float)a5 objects:(float)a6 :(int)a7 RoseBaseSession>)a3 didChangeRangingUpdateRate:newThrottleRate:prevThrottleRate:effectiveSinceCycleInde:
{
  int var1 = (int)a3.var1;
  var0 = a3.var0;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  double v13 = -[NIServerBaseSession resourcesManager]( &v32,  "resourcesManager",  a3.var0,  a3.var1,  *(void *)&a4,  *(void *)&a7);
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (var1)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100397FA4();
    }
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    int64_t v34 = @"Failed to adjust ranging rate.";
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v15));

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 remote]);
    [v17 uwbSessionDidFailWithError:v16];
  }

  else
  {
    next = self->_responderSessions.__table_.__p1_.__value_.__next_;
    if (!next) {
      goto LABEL_29;
    }
    int v19 = 0;
    uint64_t v20 = 0LL;
    do
    {
      uint64_t v21 = next[3];
      v22 = (std::__shared_weak_count *)next[4];
      if (v22)
      {
        p_shared_owners = (unint64_t *)&v22->__shared_owners_;
        do
          unint64_t v24 = __ldxr(p_shared_owners);
        while (__stxr(v24 + 1, p_shared_owners));
        BOOL v25 = v21 == *(void *)var0;
        if (v25) {
          uint64_t v20 = next[2];
        }
        v19 |= v25;
        do
          unint64_t v26 = __ldaxr(p_shared_owners);
        while (__stlxr(v26 - 1, p_shared_owners));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }

      else
      {
        if (v21 == *(void *)var0) {
          uint64_t v20 = next[2];
        }
        v19 |= v21 == *(void *)var0;
      }

      next = (void *)*next;
    }

    while (next);
    if ((v19 & 1) != 0)
    {
      int v27 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession objectFromIdentifier:](self, "objectFromIdentifier:", v20));
      unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 discoveryToken]);
      v29.__rep_ = (int64_t)-[NIServerHomeDeviceSession nominalCycleRate](self, "nominalCycleRate");
      *(float *)&double v30 = a5;
      -[NIServerHomeDeviceSession _updateAnalyticsAboutRangingRateForDevice:responseSkipRatio:cycleRate:]( self,  "_updateAnalyticsAboutRangingRateForDevice:responseSkipRatio:cycleRate:",  v28,  v29.__rep_,  v30);

      char v31 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__n128 buf = 138413058;
        BOOL v36 = v27;
        __int16 v37 = 2048;
        double v38 = a5;
        __int16 v39 = 2048;
        double v40 = a6;
        __int16 v41 = 1024;
        int v42 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "#ses-home,#throttle Adjusting throttle rate succeeded for object %@. New rate %0.2f, old rate: %0.2f, cycle index: %d",  buf,  0x26u);
      }
    }

    else
    {
LABEL_29:
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100397F78();
      }
    }
  }
}

- (BOOL)supportsDevicePresence
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v3 = [v2 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"];

  id v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#ses-home,#supportsDevicePresence homeDeviceSessionBTLeechingEnabled: %d",  (uint8_t *)v6,  8u);
  }

  return v3;
}

- (id)getQueueForInputingData
{
  return self->_clientQueue;
}

- (BOOL)isInterestedInSamplesForDevice:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v6 = [v5 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"];

  if ((v6 & 1) == 0) {
    goto LABEL_3;
  }
  if ((-[NIHomeDeviceConfiguration allowedDevices](self->_configuration, "allowedDevices") | 4) == 4) {
    goto LABEL_3;
  }
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceID]);

  if (!v9) {
    goto LABEL_3;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 idsDeviceID]);
  if (v10)
  {
  }

  else if ((id)-[NIHomeDeviceConfiguration allowedDevices](self->_configuration, "allowedDevices") == (id)2)
  {
    goto LABEL_3;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
  if (!v7) {
    goto LABEL_4;
  }
  int v11 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);
  unsigned __int8 v12 = [v11 isEqualToString:@"NONE"];

  if ((v12 & 1) == 0)
  {
    LOBYTE(v7) = ((unint64_t)[v4 deviceFlags] & 0x380) != 0;
    goto LABEL_4;
  }

- (void)consumeBluetoothSample:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v6 = [v5 BOOLForKey:@"HomeDeviceSessionBTLeechingEnabled"];

  if ((v6 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

    if (v7)
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 model]);

      if (!v8 && os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_100398030();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_100397FD0();
    }
  }
}

- (id)printableState
{
  unsigned int v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"["));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"["));
  ptr = self->_initiatorSession.__ptr_;
  if (ptr)
  {
    if (*((_BYTE *)ptr + 682)) {
      uint64_t v7 = *((unsigned __int16 *)ptr + 340);
    }
    else {
      uint64_t v7 = 0LL;
    }
    objc_msgSend(v4, "appendFormat:", @"%d", v7);
  }

  next = (char *)self->_responderSessions.__table_.__p1_.__value_.__next_;
  if (next)
  {
    int v9 = 1;
    do
    {
      uint64_t v10 = *((void *)next + 3);
      __p[0] = *((void **)next + 2);
      __p[1] = (void *)v10;
      int v11 = (std::__shared_weak_count *)*((void *)next + 4);
      double v30 = v11;
      if (v11)
      {
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          unint64_t v13 = __ldxr(p_shared_owners);
        while (__stxr(v13 + 1, p_shared_owners));
      }

      __int128 v31 = *(_OWORD *)(next + 40);
      uint64_t v32 = *((void *)next + 7);
      if (v10)
      {
        if (*(_BYTE *)(v10 + 682)) {
          uint64_t v14 = *(unsigned __int16 *)(v10 + 680);
        }
        else {
          uint64_t v14 = 0LL;
        }
        if (v9) {
          objc_super v15 = @"%d";
        }
        else {
          objc_super v15 = @", %d";
        }
        objc_msgSend(v5, "appendFormat:", v15, v14);
        int v9 = 0;
      }

      if (v11)
      {
        unint64_t v16 = (unint64_t *)&v11->__shared_owners_;
        do
          unint64_t v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }

      next = *(char **)next;
    }

    while (next);
  }

  [v4 appendString:@"]"];
  [v5 appendString:@"]"];
  int currentSessionRole = self->_currentSessionRole;
  if (currentSessionRole == 100)
  {
    int v19 = "Unspecified";
  }

  else if (currentSessionRole == 1)
  {
    int v19 = "Responder";
  }

  else
  {
    int v19 = "Initiator";
  }

  sub_1000065CC(__p, v19);
  int v20 = SHIBYTE(v30);
  uint64_t v21 = (void **)__p[0];
  BOOL isRunning = self->_isRunning;
  BOOL uwbSystemAvailable = self->_uwbSystemAvailable;
  unint64_t v24 = +[NIInternalUtils NINearbyObjectUpdateRateToString:]( &OBJC_CLASS___NIInternalUtils,  "NINearbyObjectUpdateRateToString:",  self->_minimumPreferredUpdateRate);
  BOOL v25 = __p;
  if (v20 < 0) {
    BOOL v25 = v21;
  }
  unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Role: %s. Running: %d. UWB available: %d. Min upd rate: %s",  v25,  isRunning,  uwbSystemAvailable,  v24));
  -[NSMutableArray addObject:](v3, "addObject:", v26);

  if (SHIBYTE(v30) < 0) {
    operator delete(__p[0]);
  }
  int v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UWB ranging: initiator tickets %@, responder tickets %@. WiFi ranging: %d sessions",  v4,  v5,  self->_wifiSessions.__table_.__p2_.__value_));
  -[NSMutableArray addObject:](v3, "addObject:", v27);

  return v3;
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  if ((a3 - 1) < 2)
  {
    -[NIServerHomeDeviceSession _handleUWBSystemStateReadinessUpdate:]( self,  "_handleUWBSystemStateReadinessUpdate:",  1LL,  *(void *)&a4);
  }

  else if ((a3 - 3) >= 2)
  {
    if (!a3) {
      sub_100398090();
    }
  }

  else
  {
    -[NIServerHomeDeviceSession _handleUWBSystemStateReadinessUpdate:]( self,  "_handleUWBSystemStateReadinessUpdate:",  0LL,  *(void *)&a4);
  }

- (void)_handleUWBSystemStateReadinessUpdate:(BOOL)a3
{
  int v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (self->_shouldHandleUWBStateReadinessUpdates)
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
    double v5 = -[NIServerBaseSession resourcesManager](&v16, "resourcesManager");
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int uwbSystemAvailable = self->_uwbSystemAvailable;
    unsigned int v8 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = "Y";
      if (uwbSystemAvailable) {
        uint64_t v10 = "Y";
      }
      else {
        uint64_t v10 = "N";
      }
      if (!v3) {
        int v9 = "N";
      }
      *(_DWORD *)__n128 buf = 136315394;
      uint64_t v18 = v10;
      __int16 v19 = 2080;
      int v20 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-home,UWB system readiness update. Previously ready? %s. Now ready? %s",  buf,  0x16u);
    }

    if (uwbSystemAvailable == v3) {
      goto LABEL_25;
    }
    self->_int uwbSystemAvailable = v3;
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 remote]);
    [v11 didUpdateHomeDeviceUWBRangingAvailability:self->_uwbSystemAvailable];

    if (!self->_isRunning) {
      goto LABEL_25;
    }
    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession pauseWithSource:](self, "pauseWithSource:", 2LL));
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003981A4();
      }
    }

    else
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession configure](self, "configure"));
      if (v12)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100398144();
        }
      }

      else
      {
        uint64_t v13 = objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession run](self, "run"));
        uint64_t v14 = (os_log_s *)qword_1008000A0;
        if (!v13)
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__n128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Successfully re-configured and re-ran session to handle UWB state change",  buf,  2u);
          }

          goto LABEL_25;
        }

        unsigned __int8 v12 = (void *)v13;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_1003980E4();
        }
      }
    }

    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v6 remote]);
    [v15 uwbSessionDidFailWithError:v12];

LABEL_25:
    return;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_1003980B8();
  }
}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequestWithConfig:(SEL)a3
{
  uint64_t v48 = *(void *)&a4.var0;
  if (!self->_configuration) {
    sub_100398204();
  }
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  if ([v6 BOOLForKey:@"HomeDeviceEnableSensorFusion"])
  {
    uint64_t v7 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#ses-home,sensor fusion is turned on for handoff from defaults write",  buf,  2u);
    }

    int v8 = 4;
  }

  else
  {
    int v8 = 2;
  }

  unsigned int v9 = objc_msgSend(v6, "BOOLForKey:", @"HomeDeviceWantsChannelDiversity", v48);
  char v10 = v9;
  if (v9)
  {
    int v11 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ses-home,* Channel diversity turned ON from default writes.",  buf,  2u);
    }
  }

  unsigned int v12 = -[NIHomeDeviceConfiguration isAnchor](self->_configuration, "isAnchor");
  uint64_t v13 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = @"No";
    if (v12) {
      uint64_t v14 = @"Yes";
    }
    *(_DWORD *)__n128 buf = 138412290;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Should initiate (is anchor): %@.",  buf,  0xCu);
  }

  if (v12)
  {
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"NIHomeAnchorForceAntennaDiversity"]);

    if (v15) {
      unsigned int v16 = [v6 BOOLForKey:@"NIHomeAnchorForceAntennaDiversity"];
    }
    else {
      unsigned int v16 = 0;
    }
    int64_t v18 = -[NIHomeDeviceConfiguration antennaDiversityOverride](self->_configuration, "antennaDiversityOverride");
    if (v18 == 1)
    {
      unsigned int v16 = 1;
    }

    else if (v18 == 2)
    {
      unsigned int v16 = 0;
    }

    else if (!v15)
    {
      __int16 v17 = 0;
      goto LABEL_29;
    }

    __int16 v19 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = "enabled";
      if (!v16) {
        int v20 = "disabled";
      }
      *(_DWORD *)__n128 buf = 136315138;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Override antenna diversity to %s",  buf,  0xCu);
    }

    __int16 v17 = 1;
  }

  else
  {
    __int16 v17 = 0;
    LOWORD(v16) = 0;
  }

- (shared_ptr<WiFiRanging::Session>)_buildWifiSession
{
  int v3 = v2;
  id v4 = self;
  v38.receiver = v4;
  v38.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  double v5 = -[NIServerBaseSession resourcesManager](&v38, "resourcesManager");
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 serverSessionIdentifier]);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

  id v9 = v8;
  sub_1000065CC(__p, (char *)[v9 UTF8String]);
  char v10 = operator new(0x1B0uLL);
  v10[1] = 0LL;
  v10[2] = 0LL;
  *char v10 = off_1007B4B00;
  uint64_t v11 = (uint64_t)(v10 + 3);
  unsigned int v12 = v4;
  v47[0] = off_1007B4B50;
  v47[1] = v12;
  uint64_t v48 = v47;
  uint64_t v13 = v12;
  v45[0] = off_1007B4C08;
  v45[1] = v13;
  unint64_t v46 = v45;
  uint64_t v14 = v13;
  v43[0] = off_1007B4C88;
  v43[1] = v14;
  unsigned int v44 = v43;
  clientQueue = v4->_clientQueue;
  ptr = v4->_pbLogger.__ptr_;
  cntrl = v4->_pbLogger.__cntrl_;
  int v42 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    __int16 v17 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }

  __int16 v39 = v4->_wifiCAManager.__ptr_;
  __int16 v19 = v4->_wifiCAManager.__cntrl_;
  BOOL v40 = (std::__shared_weak_count *)v19;
  if (v19)
  {
    int v20 = (unint64_t *)((char *)v19 + 8);
    do
      unint64_t v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }

  sub_100024764(v11, (__int128 *)__p, (uint64_t)v47, (uint64_t)v45, (uint64_t)v43, clientQueue, &ptr, &v39);
  unsigned int v22 = v40;
  if (v40)
  {
    p_shared_owners = (unint64_t *)&v40->__shared_owners_;
    do
      unint64_t v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  unsigned __int8 v25 = v42;
  if (v42)
  {
    __int128 v26 = (unint64_t *)&v42->__shared_owners_;
    do
      unint64_t v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

  uint64_t v28 = v44;
  if (v44 == v43)
  {
    uint64_t v29 = 4LL;
    uint64_t v28 = v43;
  }

  else
  {
    if (!v44) {
      goto LABEL_22;
    }
    uint64_t v29 = 5LL;
  }

  (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_22:
  double v30 = v46;
  if (v46 == v45)
  {
    uint64_t v31 = 4LL;
    double v30 = v45;
  }

  else
  {
    if (!v46) {
      goto LABEL_27;
    }
    uint64_t v31 = 5LL;
  }

  (*(void (**)(void))(*v30 + 8 * v31))();
LABEL_27:
  uint64_t v32 = v48;
  if (v48 == v47)
  {
    uint64_t v33 = 4LL;
    uint64_t v32 = v47;
  }

  else
  {
    if (!v48) {
      goto LABEL_32;
    }
    uint64_t v33 = 5LL;
  }

  (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_32:
  uint64_t *v3 = v11;
  v3[1] = (uint64_t)v10;
  if (v37 < 0) {
    operator delete(__p[0]);
  }

  result.__cntrl_ = v35;
  result.__ptr_ = v34;
  return result;
}

- (shared_ptr<rose::objects::GRSession>)_buildRoseSession:(const void *)a3
{
  double v5 = v3;
  unsigned __int8 v6 = self;
  sub_1000065CC(__p, (char *)-[NSString UTF8String](v6->_containerUniqueIdentifier, "UTF8String"));
  uint64_t v7 = (std::__shared_weak_count *)operator new(0x5D8uLL);
  v7->__shared_owners_ = 0LL;
  v7->__shared_weak_owners_ = 0LL;
  v7->__vftable = (std::__shared_weak_count_vtbl *)off_1007B39C8;
  uint64_t v8 = (uint64_t)&v7[1];
  id v9 = v6;
  *(void *)__n128 buf = off_1007B4D08;
  id v73 = v9;
  v74 = buf;
  char v10 = v9;
  v70[0] = off_1007B4D88;
  v70[1] = v10;
  char v71 = v70;
  uint64_t v11 = v10;
  v68[0] = off_1007B4E08;
  v68[1] = v11;
  char v69 = v68;
  unsigned int v12 = v11;
  v66[0] = off_1007B4E88;
  v66[1] = v12;
  __int16 v67 = v66;
  char v65 = 0LL;
  uint64_t v13 = v12;
  v62[0] = off_1007B4F40;
  v62[1] = v13;
  __int16 v63 = v62;
  int v61 = 0LL;
  int v59 = 0LL;
  uint64_t v14 = v13;
  v56[0] = off_1007B4FF8;
  v56[1] = v14;
  char v57 = v56;
  ptr = v6->_pbLogger.__ptr_;
  cntrl = v6->_pbLogger.__cntrl_;
  char v55 = (std::__shared_weak_count *)cntrl;
  if (cntrl)
  {
    unsigned int v16 = (unint64_t *)((char *)cntrl + 8);
    do
      unint64_t v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }

  sub_10026F104( v8,  (__int128 *)__p,  (void *)a3,  (uint64_t)buf,  (uint64_t)v70,  (uint64_t)v68,  (uint64_t)v66,  (uint64_t)v64,  (uint64_t)v62,  (uint64_t)v60,  (uint64_t)v58,  (uint64_t)v56,  &ptr);
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)off_1007B3D38;
  v7[1].__shared_owners_ = (uint64_t)off_1007B3E00;
  unint64_t v18 = v55;
  if (v55)
  {
    p_shared_owners = (unint64_t *)&v55->__shared_owners_;
    do
      unint64_t v20 = __ldaxr(p_shared_owners);
    while (__stlxr(v20 - 1, p_shared_owners));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  unint64_t v21 = v57;
  if (v57 == v56)
  {
    uint64_t v22 = 4LL;
    unint64_t v21 = v56;
  }

  else
  {
    if (!v57) {
      goto LABEL_14;
    }
    uint64_t v22 = 5LL;
  }

  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_14:
  char v23 = v59;
  if (v59 == v58)
  {
    uint64_t v24 = 4LL;
    char v23 = v58;
  }

  else
  {
    if (!v59) {
      goto LABEL_19;
    }
    uint64_t v24 = 5LL;
  }

  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_19:
  unsigned __int8 v25 = v61;
  if (v61 == v60)
  {
    uint64_t v26 = 4LL;
    unsigned __int8 v25 = v60;
  }

  else
  {
    if (!v61) {
      goto LABEL_24;
    }
    uint64_t v26 = 5LL;
  }

  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_24:
  unint64_t v27 = v63;
  if (v63 == v62)
  {
    uint64_t v28 = 4LL;
    unint64_t v27 = v62;
  }

  else
  {
    if (!v63) {
      goto LABEL_29;
    }
    uint64_t v28 = 5LL;
  }

  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_29:
  uint64_t v29 = v65;
  if (v65 == v64)
  {
    uint64_t v30 = 4LL;
    uint64_t v29 = v64;
  }

  else
  {
    if (!v65) {
      goto LABEL_34;
    }
    uint64_t v30 = 5LL;
  }

  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_34:
  uint64_t v31 = v67;
  if (v67 == v66)
  {
    uint64_t v32 = 4LL;
    uint64_t v31 = v66;
  }

  else
  {
    if (!v67) {
      goto LABEL_39;
    }
    uint64_t v32 = 5LL;
  }

  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_39:
  uint64_t v33 = v69;
  if (v69 == v68)
  {
    uint64_t v34 = 4LL;
    uint64_t v33 = v68;
  }

  else
  {
    if (!v69) {
      goto LABEL_44;
    }
    uint64_t v34 = 5LL;
  }

  (*(void (**)(void))(*v33 + 8 * v34))();
LABEL_44:
  int v35 = v71;
  if (v71 == v70)
  {
    uint64_t v36 = 4LL;
    int v35 = v70;
  }

  else
  {
    if (!v71) {
      goto LABEL_49;
    }
    uint64_t v36 = 5LL;
  }

  (*(void (**)(void))(*v35 + 8 * v36))();
LABEL_49:
  char v37 = v74;
  if (v74 == buf)
  {
    uint64_t v38 = 4LL;
    char v37 = buf;
  }

  else
  {
    if (!v74) {
      goto LABEL_54;
    }
    uint64_t v38 = 5LL;
  }

  (*(void (**)(void))(*(void *)v37 + 8 * v38))();
LABEL_54:
  uint64_t v50 = &v7[1].__vftable;
  unint64_t v51 = v7;
  sub_100012538((uint64_t)&v50, &v7[1].__shared_weak_owners_, v8);
  __int16 v39 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__n128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Registering for UWB service.",  buf,  2u);
  }

  int v40 = sub_10026FF14((uint64_t)v50);
  if (v40)
  {
    __int16 v41 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      sub_100275DD0(v40, buf);
      sub_100398330();
    }

    void *v5 = 0LL;
    v5[1] = 0LL;
  }

  else
  {
    int v42 = v51;
    void *v5 = v50;
    v5[1] = v42;
    if (!v42) {
      goto LABEL_68;
    }
    unsigned int v43 = (unint64_t *)&v42->__shared_owners_;
    do
      unint64_t v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
  }

  unsigned __int8 v45 = v51;
  if (v51)
  {
    unint64_t v46 = (unint64_t *)&v51->__shared_owners_;
    do
      unint64_t v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }

- (void)_stopWiFiSessionsWithReason:(id)a3
{
  id v4 = a3;
  double v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Stop WiFi sessions with reason: [%@]",  (uint8_t *)&v8,  0xCu);
  }

  p_wifiSessions = &self->_wifiSessions;
  if (p_wifiSessions->__table_.__p2_.__value_)
  {
    for (i = &p_wifiSessions->__table_.__p1_; ; sub_100024930((const std::string *)i[3].__value_.__next_))
    {
      i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, std::shared_ptr<WiFiRanging::Session>>, void *>>> *)i->__value_.__next_;
      if (!i) {
        break;
      }
    }

    sub_1001BC224((uint64_t)p_wifiSessions);
  }
}

- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3
{
  BOOL v3 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  id v5 = -[NIServerBaseSession disableAllServices](&v29, "disableAllServices");
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10016300C((uint64_t)&self->_cachedRegionUpdateEvent);
  -[NINearbyUpdatesEngine invalidate](self->_updatesEngine, "invalidate");
  updatesEngine = self->_updatesEngine;
  self->_updatesEngine = 0LL;

  if (self->_initiatorSession.__ptr_)
  {
    if (v3)
    {
      cntrl = self->_initiatorSession.__cntrl_;
      ptr = self->_initiatorSession.__ptr_;
      uint64_t v28 = cntrl;
      if (cntrl)
      {
        id v9 = (unint64_t *)((char *)cntrl + 8);
        do
          unint64_t v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }

      -[NIServerHomeDeviceSession _sendHangupSignalForSession:](self, "_sendHangupSignalForSession:", &ptr);
      uint64_t v11 = (std::__shared_weak_count *)v28;
      if (v28)
      {
        unsigned int v12 = (unint64_t *)((char *)v28 + 8);
        do
          unint64_t v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
    }

    sub_10026FAA8((uint64_t)self->_initiatorSession.__ptr_);
    sub_10015D394(&self->_initiatorSession.__ptr_);
  }

  if (self->_responderSessions.__table_.__p2_.__value_)
  {
    uint64_t v14 = (os_log_s *)qword_1008000A0;
    if (v3)
    {
      objc_super v15 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v16 = self->_responderSessions.__table_.__p2_.__value_
            * (void)-[NIServerHomeDeviceSession nominalCycleRate](self, "nominalCycleRate");
        *(_DWORD *)__n128 buf = 134217984;
        unint64_t v31 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Cleaning responder sessions. sendHangupSignal = YES. This will take (%llu ms).",  buf,  0xCu);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Cleaning responder sessions.",  buf,  2u);
    }

    for (i = &self->_responderSessions.__table_.__p1_; ; sub_10026FAA8((uint64_t)i[3].__value_.__next_))
    {
      i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, UWBResponderInformation>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, UWBResponderInformation>, void *>>> *)i->__value_.__next_;
      if (!i) {
        break;
      }
      if (v3)
      {
        next = (std::__shared_weak_count *)i[4].__value_.__next_;
        unsigned __int8 v25 = i[3].__value_.__next_;
        uint64_t v26 = next;
        if (next)
        {
          p_shared_owners = (unint64_t *)&next->__shared_owners_;
          do
            unint64_t v20 = __ldxr(p_shared_owners);
          while (__stxr(v20 + 1, p_shared_owners));
        }

        -[NIServerHomeDeviceSession _sendHangupSignalForSession:](self, "_sendHangupSignalForSession:", &v25);
        unint64_t v21 = v26;
        if (v26)
        {
          uint64_t v22 = (unint64_t *)&v26->__shared_owners_;
          do
            unint64_t v23 = __ldaxr(v22);
          while (__stlxr(v23 - 1, v22));
          if (!v23)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }
      }
    }

    sub_1001BC224((uint64_t)&self->_responderSessions);
  }

  -[NIServerHomeDeviceSession _stopWiFiSessionsWithReason:]( self,  "_stopWiFiSessionsWithReason:",  @"_disableAllServices",  v25);
  return v6;
}

- (void)_peerHungUp:(unint64_t)a3
{
  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__n128 buf = 134283521;
    unint64_t v16 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-home,#hangup from address 0x%{private}llx.",  buf,  0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  id v6 = -[NIServerBaseSession discoveryTokenFromIdentifier:](&v14, "discoveryTokenFromIdentifier:", a3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
    int v8 = -[NIServerBaseSession resourcesManager](&v13, "resourcesManager");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lifecycleSupervisor]);
    unsigned __int8 v11 = [v10 isTrackingPeer:v7];

    if ((v11 & 1) != 0)
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v9 lifecycleSupervisor]);
      [v12 peerHangupReceived:v7];

      -[NIServerHomeDeviceSession _removePeerObject:uwbIdentifier:withReason:]( self,  "_removePeerObject:uwbIdentifier:withReason:",  v7,  a3,  1LL);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_100398380();
  }
}

- (void)_sendHangupSignalForSession:(shared_ptr<rose::objects::GRSession>)a3
{
  if (*(void *)a3.__ptr_)
  {
    ptr = (uint64_t *)a3.__ptr_;
    id v5 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      if ((*(_DWORD *)(*ptr + 680) & 0xFF0000) != 0) {
        int v6 = (unsigned __int16)*(_DWORD *)(*ptr + 680);
      }
      else {
        int v6 = 0xFFFF;
      }
      *(_DWORD *)__n128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-home,#hangup Sending hangup signal for session with ticket ID: %d",  buf,  8u);
    }

    LOBYTE(__ns.__rep_) = 0;
    sub_10016C2CC(buf, 0x10uLL, &__ns);
    uint64_t v7 = *(void **)buf;
    **(_WORD **)__n128 buf = 258;
    *(void *)((char *)v7 + 2) = 0LL;
    v7[1] = 0LL;
    sub_1002732D0(*ptr, (uint64_t)buf);
    v8.__rep_ = (int64_t)-[NIServerHomeDeviceSession nominalCycleRate](self, "nominalCycleRate");
    if (v8.__rep_ >= 1)
    {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9 = 1000000 * v8.__rep_;
      __ns.__rep_ = v9;
      std::this_thread::sleep_for (&__ns);
    }

    if (*(void *)buf)
    {
      unsigned int v12 = *(void **)buf;
      operator delete(*(void **)buf);
    }
  }

- (id)_addPeers:(id)a3
{
  id v27 = a3;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  id v4 = -[NIServerBaseSession resourcesManager](&v33, "resourcesManager");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v5 btResource]);

  if (-[NIHomeDeviceConfiguration isAnchor](self->_configuration, "isAnchor")) {
    goto LABEL_8;
  }
  int v6 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__n128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Not an anchor session, verifying responder limit hasn't been reached.",  buf,  2u);
  }

  if ((uint64_t)[v28 currentPeerCount] < 4)
  {
LABEL_8:
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKey:@"NIHomeDisableAllowListPolicy"]);
    BOOL v10 = v9 == 0LL;

    if (v10) {
      unsigned __int8 v11 = 0;
    }
    else {
      unsigned __int8 v11 = [v26 BOOLForKey:@"NIHomeDisableAllowListPolicy"];
    }
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v12 = v27;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v13)
    {
      uint64_t v15 = *(void *)v30;
      *(void *)&__int128 v14 = 67109378LL;
      __int128 v25 = v14;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          unint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          unsigned int v18 = -[NIServerHomeDeviceSession _homeAnchorVariantFromDiscoveryToken:]( self,  "_homeAnchorVariantFromDiscoveryToken:",  v17,  v25);
          __int16 v19 = (os_log_s *)qword_1008000A0;
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__n128 buf = 67109120;
            unsigned int v35 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#ses-home,#allow-list anchor variant from discovery token: %u",  buf,  8u);
          }

          if (v18 < 0x3E7) {
            char v20 = 1;
          }
          else {
            char v20 = v11;
          }
          if ((v20 & 1) != 0)
          {
            unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 rawToken]);
            duration<long long, std::ratio<1, 1000>> v8 = (void *)objc_claimAutoreleasedReturnValue([v28 addPeerDiscoveryToken:v21]);

            if (v8) {
              goto LABEL_30;
            }
          }

          else
          {
            uint64_t v22 = (os_log_s *)(id)qword_1008000A0;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v17 descriptionInternal]);
              *(_DWORD *)__n128 buf = v25;
              unsigned int v35 = v18;
              __int16 v36 = 2112;
              char v37 = v23;
              _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "#ses-home,#allow-list peer device anchor variant (%u) not supported. Will not attempt to range with %@",  buf,  0x12u);
            }
          }
        }

        id v13 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }

      while (v13);
    }

    duration<long long, std::ratio<1, 1000>> v8 = 0LL;
LABEL_30:
  }

  else
  {
    uint64_t v7 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003983E0(v7);
    }
    duration<long long, std::ratio<1, 1000>> v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5885LL,  0LL));
  }

  return v8;
}

- (void)_roseSession:(shared_ptr<rose:(int)a4 :objects::RoseBaseSession>)a3 invalidatedWithReason:
{
  int var1 = (int)a3.var1;
  int v6 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100275E00(var1, v11);
    sub_100398458();
  }

  -[NIServerHomeDeviceSession invalidate](self, "invalidate");
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  id v7 = -[NIServerBaseSession invalidationHandler](&v10, "invalidationHandler");
  duration<long long, std::ratio<1, 1000>> v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(v7);
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
  ((void (**)(void, void *))v8)[2](v8, v9);
}

- (BOOL)_shouldRespondToDevice:(id)a3
{
  return self->_responderSessions.__table_.__p2_.__value_ < 5;
}

- (id)_triggerInitiatorRanging
{
  ptr = self->_initiatorSession.__ptr_;
  if (!ptr) {
    sub_1003984A8();
  }
  LOBYTE(v5) = 0;
  char v6 = 0;
  uint64_t v7 = 0LL;
  char v8 = 0;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  int v12 = 0;
  if (sub_100272BA0((uint64_t)ptr, &v5)) {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
  }
  else {
    BOOL v3 = 0LL;
  }
  return v3;
}

- (id)_triggerResponderRangingForSession:(shared_ptr<rose:(id)a4 :objects::GRSession>)a3 initiatorDevice:
{
  ptr = (uint64_t *)a3.__ptr_;
  char v6 = a3.__cntrl_;
  uint64_t v7 = v6;
  if (!*ptr)
  {
    id v13 = "session";
    int v14 = 2704;
    goto LABEL_11;
  }

  if (self->_currentSessionRole != 1)
  {
    id v13 = "_currentSessionRole == Role::Responder";
    int v14 = 2705;
LABEL_11:
    __assert_rtn( "-[NIServerHomeDeviceSession _triggerResponderRangingForSession:initiatorDevice:]",  "NIServerHomeDeviceSession.mm",  v14,  v13);
  }

  id v8 = -[__shared_weak_count btAdvertisingAddress](v6, "btAdvertisingAddress");
  int v19 = (int)v8;
  __int16 v20 = WORD2(v8);
  LODWORD(v16) = 2;
  BYTE4(v16) = 0;
  __int16 v17 = 0;
  char v18 = 0;
  char v21 = 1;
  char v22 = 1;
  uint64_t v23 = 0LL;
  char v24 = 0;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  int v28 = 0;
  int v9 = sub_100272BA0(*ptr, &v16);
  if (v9)
  {
    __int128 v10 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_100275DD0(v9, v15);
      sub_1003984D0();
    }

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
  }

  else
  {
    __int128 v11 = 0LL;
  }

  return v11;
}

- (void)_notifyPeerRemoval:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  uint64_t v7 = -[NIServerBaseSession resourcesManager](&v16, "resourcesManager");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 remote]);
  id v23 = v6;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
  [v9 didRemoveNearbyObjects:v10 withReason:a4];

  double v11 = sub_100023CC4();
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 discoveryToken]);
  sub_1001E0640((uint64_t)&self->_handoffCAManager, (unint64_t)[v12 hash], v11);

  if (a4 >= 3) {
    id v13 = &stru_1007C41E0;
  }
  else {
    id v13 = *(&off_1007B5180 + a4);
  }
  int v14 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)__n128 buf = 138412802;
    id v18 = v6;
    __int16 v19 = 2112;
    __int16 v20 = v13;
    __int16 v21 = 2112;
    char v22 = containerUniqueIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ses-home,_notifyPeerRemoval: %@ with reason: %@ for session identifier: %@",  buf,  0x20u);
  }
}

- (void)_removePeerObject:(id)a3 uwbIdentifier:(unint64_t)a4 withReason:(unint64_t)a5
{
  id v8 = a3;
  unint64_t v40 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  int v9 = -[NIServerBaseSession resourcesManager](&v39, "resourcesManager");
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (self->_currentSessionRole != 1)
  {
LABEL_21:
    char v23 = 1;
    goto LABEL_22;
  }

  double v11 = sub_100046FEC(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, &v40);
  int v12 = v11;
  if (v11)
  {
    id v13 = v11 + 3;
    if (v11[3])
    {
      int v14 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        if ((*(_DWORD *)(*v13 + 680) & 0xFF0000) != 0) {
          int v15 = (unsigned __int16)*(_DWORD *)(*v13 + 680);
        }
        else {
          int v15 = 0xFFFF;
        }
        *(_DWORD *)__n128 buf = 67109376;
        LODWORD(v42[0]) = v15;
        WORD2(v42[0]) = 1024;
        *(_DWORD *)((char *)v42 + 6) = a5 != 1;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Invalidating session with ticket ID: %d. Send hangup signal: %d",  buf,  0xEu);
      }

      if (a5 != 1)
      {
        objc_super v16 = (std::__shared_weak_count *)v12[4];
        uint64_t v37 = v12[3];
        uint64_t v38 = v16;
        if (v16)
        {
          p_shared_owners = (unint64_t *)&v16->__shared_owners_;
          do
            unint64_t v18 = __ldxr(p_shared_owners);
          while (__stxr(v18 + 1, p_shared_owners));
        }

        -[NIServerHomeDeviceSession _sendHangupSignalForSession:](self, "_sendHangupSignalForSession:", &v37);
        __int16 v19 = v38;
        if (v38)
        {
          __int16 v20 = (unint64_t *)&v38->__shared_owners_;
          do
            unint64_t v21 = __ldaxr(v20);
          while (__stlxr(v21 - 1, v20));
          if (!v21)
          {
            ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
            std::__shared_weak_count::__release_weak(v19);
          }
        }
      }

      sub_10026FAA8(*v13);
      sub_10015D394(v12 + 3);
    }

    sub_100021814(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, v12, (uint64_t)buf);
    sub_1001B9B74((uint64_t)buf, 0LL);
    char v22 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__n128 buf = 134217984;
      v42[0] = v40;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#ses-home,removing 0x%llx from tracked devices",  buf,  0xCu);
    }

    goto LABEL_21;
  }

  char v23 = 0;
LABEL_22:
  char v24 = sub_100046FEC(&self->_wifiSessions.__table_.__bucket_list_.__ptr_.__value_, &v40);
  __int128 v25 = v24;
  if (v24)
  {
    __int128 v26 = (const std::string *)v24[3];
    if (v26) {
      sub_100024930(v26);
    }
    sub_100021814(&self->_wifiSessions.__table_.__bucket_list_.__ptr_.__value_, v25, (uint64_t)buf);
    sub_1001B9B74((uint64_t)buf, 0LL);
  }

  else if ((v23 & 1) == 0)
  {
    __int128 v27 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__n128 buf = 138412290;
      v42[0] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Did not find a UWB or WiFi ToF session for token: %@",  buf,  0xCu);
    }
  }

  -[NINearbyUpdatesEngine clearStateForToken:](self->_updatesEngine, "clearStateForToken:", v8);
  int v28 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerHomeDeviceSession objectFromIdentifier:](self, "objectFromIdentifier:", v40));
  if (v28)
  {
    -[NIServerHomeDeviceSession _notifyPeerRemoval:withReason:](self, "_notifyPeerRemoval:withReason:", v28, a5);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_100398580();
  }

  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v10 btResource]);
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v8 rawToken]);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v29 removePeerDiscoveryToken:v30]);

  if (v31)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_100398520();
    }
  }

  else
  {
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v10 btResource]);
    objc_super v33 = (void *)objc_claimAutoreleasedReturnValue([v32 deviceCache]);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v8 rawToken]);
    unsigned __int8 v35 = [v33 uncacheDeviceByTokenData:v34];

    if ((v35 & 1) == 0)
    {
      __int16 v36 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__n128 buf = 138412290;
        v42[0] = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "#ses-home,Peer discovery token wasn't cached, so nothing to uncache. Peer likely hadn't been discovered yet. Token: %@",  buf,  0xCu);
      }
    }
  }
}

- (void)_handleWifiRangingAvailableUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__n128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-home,wifi ranging availability update",  buf,  2u);
  }

  atomic_store(v3, (unsigned __int8 *)&self->_wifiServiceAllowsRanging);
  id v6 = (os_log_s *)qword_1008000A0;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#ses-home,wifi is now available, so wifi ranging is resuming",  v9,  2u);
    }

    -[NIServerHomeDeviceSession _resumeWifiRanging](self, "_resumeWifiRanging");
  }

  else
  {
    if (v7)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#ses-home,wifi is no longer available, so pausing wifi ranging",  v8,  2u);
    }

    -[NIServerHomeDeviceSession _pauseWifiRanging](self, "_pauseWifiRanging");
  }

- (BOOL)_biasCorrectionRequirementFromModelString:(id)a3
{
  return [a3 hasPrefix:@"AudioAccessory6,1"];
}

- (int64_t)_regionCategoryFromModelString:(id)a3
{
  else {
    return 0LL;
  }
}

- (int)_magneticFieldStrengthCheckOptionFromModelString:(id)a3
{
  else {
    return 1;
  }
}

- (int)_intentPredictorConfigFromModelString:(id)a3
{
  else {
    return 1;
  }
}

- (BOOL)_validateDiscoveryTokenDict:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:&off_1007D24C0]);
    if (v6 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:&off_1007D24D8]);
      if (v9 && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSData, v8), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
      {
        BOOL v11 = 1;
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100398604();
        }
        BOOL v11 = 0;
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003985D8();
      }
      BOOL v11 = 0;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003985AC();
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (unsigned)_flagsFromDiscoveryToken:(id)a3
{
  id v4 = sub_100252128(a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[NIServerHomeDeviceSession _validateDiscoveryTokenDict:](self, "_validateDiscoveryTokenDict:", v5))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:&off_1007D24F0]);
    if (v7 && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v6), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)) {
      unsigned int v9 = [v7 unsignedIntValue];
    }
    else {
      unsigned int v9 = 0;
    }
  }

  else
  {
    unsigned int v9 = 0;
  }

  return v9;
}

- (BOOL)_biasCorrectionRequirementFromDiscoveryToken:(id)a3
{
  return (-[NIServerHomeDeviceSession _flagsFromDiscoveryToken:](self, "_flagsFromDiscoveryToken:", a3) >> 1) & 1;
}

- (int)_magneticFieldStrengthCheckOptionFromDiscoveryToken:(id)a3
{
  if (-[NIServerHomeDeviceSession _homeAnchorVariantFromDiscoveryToken:]( self,  "_homeAnchorVariantFromDiscoveryToken:",  a3) == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)_regionCategoryFromDiscoveryToken:(id)a3
{
  if ((-[NIServerHomeDeviceSession _flagsFromDiscoveryToken:](self, "_flagsFromDiscoveryToken:", a3) & 4) != 0) {
    return 10LL;
  }
  else {
    return 0LL;
  }
}

- (int64_t)_regionCategoryFromBluetoothDevice:(id)a3
{
  return 0LL;
}

- (unsigned)_homeAnchorVariantFromDiscoveryToken:(id)a3
{
  id v4 = sub_100252128(a3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[NIServerHomeDeviceSession _validateDiscoveryTokenDict:](self, "_validateDiscoveryTokenDict:", v5))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:&off_1007D2508]);
    if (v7)
    {
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v6);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        unsigned int v9 = sub_100320A34((uint64_t)[v7 unsignedIntValue]);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_100398630();
        }
        unsigned int v9 = 999;
      }
    }

    else
    {
      uint64_t v10 = (os_log_s *)qword_1008000A0;
      unsigned int v9 = 0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#ses-home,nil value for HomeAnchorVariant",  v12,  2u);
        unsigned int v9 = 0;
      }
    }
  }

  else
  {
    unsigned int v9 = 999;
  }

  return v9;
}

- (int)_intentPredictorConfigFromDiscoveryToken:(id)a3
{
  if (-[NIServerHomeDeviceSession _homeAnchorVariantFromDiscoveryToken:]( self,  "_homeAnchorVariantFromDiscoveryToken:",  a3) == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  uint64_t v6 = (NINearbyUpdatesEngine *)a3;
  id v7 = a4;
  if (self->_updatesEngine != v6) {
    __assert_rtn( "-[NIServerHomeDeviceSession updatesEngine:didUpdateNearbyObjects:]",  "NIServerHomeDeviceSession.mm",  3187,  "engine == _updatesEngine");
  }
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001B86F4;
  v10[3] = &unk_1007A2248;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(clientQueue, v10);
}

- (void)updatesEngine:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6 regionTransitionSuppressed:(BOOL)a7
{
  BOOL v7 = a7;
  int v12 = (NINearbyUpdatesEngine *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (self->_updatesEngine != v12) {
    __assert_rtn( "-[NIServerHomeDeviceSession updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:]",  "NIServerHomeDeviceSession.mm",  3242,  "engine == _updatesEngine");
  }
  objc_super v16 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__n128 buf = 138412802;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 1024;
    BOOL v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#ses-home,#regions, updatesEngine didUpdateRegion: %@, previousRegion: %@, suppressed: %d",  buf,  0x1Cu);
  }

  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001B8B30;
  block[3] = &unk_1007B4A50;
  void block[4] = self;
  id v22 = v14;
  id v23 = v13;
  id v24 = v15;
  BOOL v25 = v7;
  id v18 = v15;
  id v19 = v13;
  id v20 = v14;
  dispatch_async(clientQueue, block);
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  unint64_t v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  id v5 = -[NIServerBaseSession objectFromIdentifier:](&v12, "objectFromIdentifier:", a3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = v6;
  if (v6)
  {
    id v8 = v6;
LABEL_5:
    uint64_t v10 = v8;
    goto LABEL_6;
  }

  id v9 = sub_100046FEC(&self->_btIdentifierHashToObjectMap.__table_.__bucket_list_.__ptr_.__value_, &v13);
  if (v9)
  {
    id v8 = (id)v9[3];
    goto LABEL_5;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_10039865C();
  }
  uint64_t v10 = 0LL;
LABEL_6:

  return v10;
}

- (float)prewarmStateRegionThreshold
{
  return 0.0;
}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
  id v5 = -[NIServerBaseSession identifierFromDiscoveryToken:](&v8, "identifierFromDiscoveryToken:", v4);
  if (v6)
  {
    -[NIServerHomeDeviceSession _removePeerObject:uwbIdentifier:withReason:]( self,  "_removePeerObject:uwbIdentifier:withReason:",  v4,  v5,  0LL);
  }

  else
  {
    BOOL v7 = -[NINearbyObject initWithToken:](objc_alloc(&OBJC_CLASS___NINearbyObject), "initWithToken:", v4);
    -[NIServerHomeDeviceSession _notifyPeerRemoval:withReason:](self, "_notifyPeerRemoval:withReason:", v7, 0LL);
  }
}

- (void)didUpdateMinimumPreferredUpdateRate:(int64_t)a3
{
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1001B8EAC;
  v4[3] = &unk_1007B14E0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(clientQueue, v4);
}

- (void)adjustResponderThrottleRateIfNeeded:(id)a3 object:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if (self->_currentSessionRole == 1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 discoveryToken]);
    v32.receiver = self;
    v32.super_class = (Class)&OBJC_CLASS___NIServerHomeDeviceSession;
    id v33 = -[NIServerBaseSession identifierFromDiscoveryToken:](&v32, "identifierFromDiscoveryToken:", v9);
    uint64_t v34 = v10;

    if ((_BYTE)v34)
    {
      id v11 = sub_100046FEC(&self->_responderSessions.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v33);
      if (v11)
      {
        uint64_t v13 = v11[3];
        objc_super v12 = (std::__shared_weak_count *)v11[4];
        if (v12)
        {
          p_shared_owners = (unint64_t *)&v12->__shared_owners_;
          do
            unint64_t v15 = __ldxr(p_shared_owners);
          while (__stxr(v15 + 1, p_shared_owners));
        }

        if (v13)
        {
          objc_super v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults",  v13,  v12));
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"NIHomeForceThrottleRate"]);

          if (v17 && (uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSNumber, v18), (objc_opt_isKindOfClass(v17, v19) & 1) != 0))
          {
            [v17 doubleValue];
            float v21 = v20;
            id v22 = (os_log_s *)qword_1008000A0;
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__n128 buf = 134218242;
              double v37 = v21;
              __int16 v38 = 2112;
              *(void *)objc_super v39 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#ses-home,#throttle adjustResponderThrottleRateIfNeeded. Force throttle rate: %0.2f. Object: %@",  buf,  0x16u);
            }
          }

          else
          {
            if (v6) {
              id minimumPreferredUpdateRate = [v6 preferredUpdateRate];
            }
            else {
              id minimumPreferredUpdateRate = 0LL;
            }
            if (+[NIInternalUtils nearbyObjectUpdateRate:isGreaterThan:]( &OBJC_CLASS___NIInternalUtils,  "nearbyObjectUpdateRate:isGreaterThan:",  self->_minimumPreferredUpdateRate,  minimumPreferredUpdateRate))
            {
              id minimumPreferredUpdateRate = (id)self->_minimumPreferredUpdateRate;
            }

            if (minimumPreferredUpdateRate)
            {
              if (minimumPreferredUpdateRate == (id)1)
              {
                float v21 = 0.38;
              }

              else
              {
                float v21 = 0.0;
                if (minimumPreferredUpdateRate == (id)3)
                {
                  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
                    sub_100398848();
                  }
                  id v24 = (os_log_s *)qword_1008000A0;
                  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)__n128 buf = 136315650;
                    double v37 = COERCE_DOUBLE( "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NI ServerHomeDeviceSession.mm");
                    __int16 v38 = 1024;
                    *(_DWORD *)objc_super v39 = 3493;
                    *(_WORD *)&v39[4] = 2080;
                    *(void *)&v39[6] = "-[NIServerHomeDeviceSession adjustResponderThrottleRateIfNeeded:object:]";
                    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "#ses-home,%s:%d: assertion failure in %s",  buf,  0x1Cu);
                  }

                  abort();
                }
              }
            }

            else
            {
              float v21 = 0.75;
            }

            BOOL v25 = (os_log_s *)(id)qword_1008000A0;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v26 = +[NIInternalUtils NINearbyObjectUpdateRateToString:]( &OBJC_CLASS___NIInternalUtils,  "NINearbyObjectUpdateRateToString:",  minimumPreferredUpdateRate);
              *(_DWORD *)__n128 buf = 136315906;
              double v37 = *(double *)&v26;
              __int16 v38 = 2048;
              *(double *)objc_super v39 = v21;
              *(_WORD *)&v39[8] = 2112;
              *(void *)&v39[10] = v6;
              __int16 v40 = 2112;
              __int16 v41 = v8;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "#ses-home,#throttle adjustResponderThrottleRateIfNeeded. Update rate: %s. Throttle rate: %0.2f. Region: %@. Object: %@",  buf,  0x2Au);
            }
          }

          int v27 = sub_100272D90(v13, v21);
          __int16 v28 = (os_log_s *)qword_1008000A0;
          if (v27)
          {
            id v29 = (os_log_s *)(id)qword_1008000A0;
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              sub_100275DD0(v27, buf);
              sub_1003987DC((uint64_t *)buf, (uint64_t)v35, v29, v21);
            }
          }

          else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__n128 buf = 134217984;
            double v37 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "#ses-home,#throttle success scheduling throttling request for rate %0.2f",  buf,  0xCu);
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
        {
          sub_10039877C();
        }

        if (v12)
        {
          __int16 v30 = (unint64_t *)&v12->__shared_owners_;
          do
            unint64_t v31 = __ldaxr(v30);
          while (__stlxr(v31 - 1, v30));
          if (!v31)
          {
            ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
            std::__shared_weak_count::__release_weak(v12);
          }
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
      {
        sub_10039871C();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_1003986BC();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_1003988B4();
  }
}

- (void)_updateAnalyticsAboutRangingRateForDevice:(id)a3 responseSkipRatio:(float)a4 cycleRate:(duration<long)long
{
  id v10 = a3;
  id v8 = [v10 hash];
  double v9 = sub_100023CC4();
  sub_1001E00C4( (uint64_t)&self->_handoffCAManager,  (unint64_t)v8,  (int)((a4 * 19.0 + 1.0) * (double)a5.__rep_),  v9);
}

- (NIHomeDeviceConfiguration)configuration
{
  return (NIHomeDeviceConfiguration *)objc_getProperty(self, a2, 480LL, 1);
}

- (void).cxx_destruct
{
  sub_1001B98DC( (uint64_t)&self->_handoffCAManager.fHandoffCADeviceManagerMap,  (void *)self->_handoffCAManager.fHandoffCADeviceManagerMap.__tree_.__pair1_.__value_.__left_);
  sub_100034A98( (uint64_t)&self->_handoffCAManager,  (void *)self->_handoffCAManager.fTimeSpentInSecondsRangingWithkDevices.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_uwbResource, 0LL);
  sub_1001BC2B4((uint64_t)&self->_wifiSessions);
  sub_1001BC2B4((uint64_t)&self->_responderSessions);
  sub_100012390((uint64_t)&self->_initiatorSession);
  objc_storeStrong((id *)&self->_containerUniqueIdentifier, 0LL);
  objc_storeStrong((id *)&self->_clientQueue, 0LL);
  objc_storeStrong((id *)&self->_updatesEngine, 0LL);
  sub_100012390((uint64_t)&self->_pbLogger);
}

- (id).cxx_construct
{
  self->_pbLogger.__ptr_ = 0LL;
  self->_pbLogger.__cntrl_ = 0LL;
  self->_initiatorSession.__ptr_ = 0LL;
  self->_initiatorSession.__cntrl_ = 0LL;
  self->_responderSessions.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_responderSessions.__table_.__p1_.__value_.__next_ = 0u;
  self->_responderSessions.__table_.__p3_.__value_ = 1.0;
  self->_wifiSessions.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_wifiSessions.__table_.__p1_.__value_.__next_ = 0u;
  self->_wifiSessions.__table_.__p3_.__value_ = 1.0;
  sub_1001E00C0(&self->_handoffCAManager, a2);
  self->_wifiCAManager.__ptr_ = 0LL;
  self->_wifiCAManager.__cntrl_ = 0LL;
  self->_cachedRegionUpdateEvent.var0.__null_state_ = 0;
  self->_cachedRegionUpdateEvent.__engaged_ = 0;
  self->_btIdentifierHashToObjectMap.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_btIdentifierHashToObjectMap.__table_.__p1_.__value_.__next_ = 0u;
  self->_btIdentifierHashToObjectMap.__table_.__p3_.__value_ = 1.0;
  return self;
}

@end