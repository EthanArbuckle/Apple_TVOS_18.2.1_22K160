@interface NIServerNearbyPeerSession
- (BOOL)_longRangeEnabled;
- (BOOL)_peerSupportsLongRange;
- (BOOL)_shouldBypassBluetoothDiscovery;
- (BOOL)isExtendedDistanceMeasurementEnabled;
- (BOOL)isLegacyDiscoveryToken:(id)a3;
- (BOOL)shouldInitiate:(id)a3 peerDiscoveryToken:(id)a4 error:(id *)a5;
- (BOOL)supportsBackgroundedClients;
- (BOOL)supportsCameraAssistance;
- (NINearbyPeerConfiguration)configuration;
- (NIServerNearbyPeerSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)_addPeers:(id)a3;
- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3;
- (id)configure;
- (id)disableAllServices;
- (id)discoveryTokenFromIdentifier:(unint64_t)a3;
- (id)getContainerUniqueIdentifier;
- (id)getNIConfiguration;
- (id)getQueueForInputingData;
- (id)getResourcesManager;
- (id)lastConfiguration;
- (id)objectFromIdentifier:(unint64_t)a3;
- (id)pauseWithSource:(int64_t)a3;
- (id)run;
- (id)setDataFrame:(const void *)a3 forPeer:(id)a4;
- (optional<unsigned)identifierFromDiscoveryToken:(id)a3;
- (unint64_t)requiresNarrowbandToRun;
- (unint64_t)requiresSpatialInteractionBluetoothResource;
- (unint64_t)requiresUWBToRun;
- (void)_activateSensors;
- (void)_deactivateSensors;
- (void)_peerHungUp:(id)a3;
- (void)_removePeerObject:(id)a3 withReason:(unint64_t)a4;
- (void)device:(id)a3 rediscovered:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)deviceLost:(id)a3;
- (void)didInvalidateUWBSession;
- (void)didReceiveNewSolution:(const void *)a3;
- (void)didReceiveRemoteData:(const void *)a3;
- (void)didReceiveUnsuccessfulSolution:(const void *)a3;
- (void)didServiceRequestUpdateStatus:(ServiceRequestStatusUpdate)a3;
- (void)invalidate;
- (void)peerInactivityPeriodExceeded:(id)a3;
- (void)processVisionInput:(id)a3;
- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5;
- (void)updatesEngine:(id)a3 didUpdateFindeeData:(const void *)a4 forToken:(id)a5;
- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4;
@end

@implementation NIServerNearbyPeerSession

- (NIServerNearbyPeerSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v48 = a4;
  uint64_t v11 = objc_opt_class(v48, v10);
  if (v11 != objc_opt_class(&OBJC_CLASS___NINearbyPeerConfiguration, v12))
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v46 handleFailureInMethod:a2 object:self file:@"NIServerNearbyPeerSession.mm" lineNumber:109 description:@"NIServerNearbyPeerSession given invalid configuration."];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);

  if (!v13)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v47 handleFailureInMethod:a2, self, @"NIServerNearbyPeerSession.mm", 110, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }

  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
  v14 = -[NIServerBaseSession initWithResourcesManager:configuration:error:]( &v51,  "initWithResourcesManager:configuration:error:",  v9,  v48,  a5);
  v15 = v14;
  if (!v14) {
    goto LABEL_19;
  }
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v9 clientConnectionQueue]);
  clientQueue = v14->_clientQueue;
  v14->_clientQueue = (OS_dispatch_queue *)v16;

  v18 = (NINearbyPeerConfiguration *)[v48 copy];
  configuration = v14->_configuration;
  v14->_configuration = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue([v9 serverSessionIdentifier]);
  uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 UUIDString]);
  containerUniqueIdentifier = v14->_containerUniqueIdentifier;
  v14->_containerUniqueIdentifier = (NSString *)v21;

  -[NIConfiguration setSupportsCameraAssistance:]( v14->_configuration,  "setSupportsCameraAssistance:",  +[NIPlatformInfo supportsSyntheticAperture](&OBJC_CLASS___NIPlatformInfo, "supportsSyntheticAperture"));
  v23 = objc_alloc(&OBJC_CLASS___NINearbyUpdatesEngine);
  v24 = v14->_configuration;
  v25 = v14->_clientQueue;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v9 analytics]);
  if (v9)
  {
    [v9 protobufLogger];
  }

  else
  {
    uint64_t v49 = 0LL;
    v50 = 0LL;
  }

  v27 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:]( v23,  "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:",  v24,  v25,  v14,  v14,  v26,  &v49,  a5);
  updatesEngine = v14->_updatesEngine;
  v14->_updatesEngine = v27;

  v29 = v50;
  if (v50)
  {
    p_shared_owners = (unint64_t *)&v50->__shared_owners_;
    do
      unint64_t v31 = __ldaxr(p_shared_owners);
    while (__stlxr(v31 - 1, p_shared_owners));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }

  if (!v14->_updatesEngine)
  {
    v32 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,Failed to create updates engine, cannot create session.",  buf,  2u);
    }

- (id)lastConfiguration
{
  return self->_configuration;
}

- (BOOL)supportsCameraAssistance
{
  return +[NIPlatformInfo supportsSyntheticAperture](&OBJC_CLASS___NIPlatformInfo, "supportsSyntheticAperture");
}

- (BOOL)supportsBackgroundedClients
{
  return self->_backgroundedClientsSupported;
}

- (unint64_t)requiresUWBToRun
{
  return 2LL;
}

- (unint64_t)requiresNarrowbandToRun
{
  if (!self->_subspecializedPeerSession) {
    sub_10039E20C();
  }
  if (-[NIServerNearbyPeerSession isExtendedDistanceMeasurementEnabled](self, "isExtendedDistanceMeasurementEnabled")) {
    return 2LL;
  }
  else {
    return 0LL;
  }
}

- (unint64_t)requiresSpatialInteractionBluetoothResource
{
  return 2LL;
}

- (id)getQueueForInputingData
{
  return self->_clientQueue;
}

- (id)configure
{
  configuration = self->_configuration;
  if (!configuration) {
    sub_10039E234();
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](configuration, "peerDiscoveryToken"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rawToken]);
    id v7 = [v6 length];

    if ((unint64_t)v7 > 0xF)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
      id v11 = sub_100252128(v10);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = v12;
      if (v12)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:&off_1007D2580]);
        if (v15 && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSData, v14), (objc_opt_isKindOfClass(v15, v16) & 1) != 0))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:&off_1007D2598]);
          if (v18 && (uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSData, v17), (objc_opt_isKindOfClass(v18, v19) & 1) != 0))
          {
            v20 = (os_log_s *)qword_1008000A0;
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,Discovery token is valid.",  buf,  2u);
            }

            uint64_t v21 = v13;
            id v22 = 0LL;
          }

          else
          {
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
              sub_10039E36C();
            }
            id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
            uint64_t v21 = 0LL;
          }
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_10039E340();
          }
          id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
          uint64_t v21 = 0LL;
        }
      }

      else
      {
        id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
        uint64_t v21 = 0LL;
      }

      id v8 = v22;
      peerTokenDict = self->_peerTokenDict;
      self->_peerTokenDict = v21;

      if (v8)
      {
        v24 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_10039E2DC((uint64_t)v8, v24, v25, v26, v27, v28, v29, v30);
        }
        id v9 = v8;
        id v8 = v9;
        goto LABEL_26;
      }

      if (!self->_peerTokenDict) {
        sub_10039E25C();
      }
      if (-[NIServerNearbyPeerSession _peerSupportsLongRange](self, "_peerSupportsLongRange"))
      {
        v33 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,Peer supports long range.",  buf,  2u);
        }
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerNearbyPeerSubspecializationProtocol configure]( self->_subspecializedPeerSession,  "configure"));
      v35 = v34;
      if (v34)
      {
        id v36 = v34;
      }

      else
      {
        v37 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          int v38 = +[NIInternalUtils NISessionBackgroundModeToString:]( &OBJC_CLASS___NIInternalUtils,  "NISessionBackgroundModeToString:",  -[NINearbyPeerConfiguration backgroundMode](self->_configuration, "backgroundMode"));
          *(_DWORD *)buf = 136315138;
          v44 = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,Configuration background mode: %s",  buf,  0xCu);
        }

        int64_t v39 = -[NINearbyPeerConfiguration backgroundMode](self->_configuration, "backgroundMode");
        if (v39 == 2)
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
            sub_10039E2B0();
          }
        }

        else
        {
          if (v39 != 1)
          {
            if (!v39)
            {
              self->_backgroundedClientsSupported = 0;
              v42.receiver = self;
              v42.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
              id v40 = -[NIServerBaseSession backgroundSupportUpdateHandler](&v42, "backgroundSupportUpdateHandler");
              v41 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(v40);
              ((void (**)(void, BOOL))v41)[2](v41, self->_backgroundedClientsSupported);
            }

            unint64_t v31 = 0LL;
            goto LABEL_35;
          }

          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
            sub_10039E284();
          }
        }

        id v36 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
      }

      unint64_t v31 = v36;
LABEL_35:

      goto LABEL_27;
    }
  }

  NSErrorUserInfoKey v45 = NSLocalizedFailureReasonErrorKey;
  v46 = @"Peer discovery token nil or invalid.";
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v8));
LABEL_26:
  unint64_t v31 = v9;
LABEL_27:

  return v31;
}

- (id)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
  uint64_t v12 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession _addPeers:](self, "_addPeers:", v4));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession getResourcesManager](self, "getResourcesManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lifecycleSupervisor]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
    id v11 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    [v7 startedDiscoveringPeersWithTokens:v9];

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSubspecializationProtocol run](self->_subspecializedPeerSession, "run"));
    if (!v5) {
      self->_shouldDeliverUpdates = 1;
    }
  }

  return v5;
}

- (id)pauseWithSource:(int64_t)a3
{
  self->_shouldDeliverUpdates = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerNearbyPeerSession _disableAllServicesAndSendHangupSignal:]( self,  "_disableAllServicesAndSendHangupSignal:",  0LL));
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
  v5 = -[NIServerBaseSession resourcesManager](&v9, "resourcesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lifecycleSupervisor]);
  [v7 pauseCalled];

  return v4;
}

- (id)disableAllServices
{
  return -[NIServerNearbyPeerSession _disableAllServicesAndSendHangupSignal:]( self,  "_disableAllServicesAndSendHangupSignal:",  1LL);
}

- (void)invalidate
{
  id v3 = -[NIServerNearbyPeerSession disableAllServices](self, "disableAllServices");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
  -[NIServerBaseSession invalidate](&v4, "invalidate");
  self->_shouldDeliverUpdates = 0;
}

- (void)deviceDiscovered:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!-[NIServerNearbyPeerSession _shouldBypassBluetoothDiscovery](self, "_shouldBypassBluetoothDiscovery")
    && (objc_opt_respondsToSelector(self->_subspecializedPeerSession, "deviceDiscovered:") & 1) != 0)
  {
    -[NIServerNearbyPeerSubspecializationProtocol deviceDiscovered:]( self->_subspecializedPeerSession,  "deviceDiscovered:",  v4);
  }
}

- (void)device:(id)a3 rediscovered:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v8 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138478083;
    id v10 = v7;
    __int16 v11 = 2113;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,discoveredDevice:didUpdate: new: %{private}@, cached: %{private}@",  (uint8_t *)&v9,  0x16u);
  }

  if (!-[NIServerNearbyPeerSession _shouldBypassBluetoothDiscovery](self, "_shouldBypassBluetoothDiscovery")
    && (objc_opt_respondsToSelector(self->_subspecializedPeerSession, "device:rediscovered:") & 1) != 0)
  {
    -[NIServerNearbyPeerSubspecializationProtocol device:rediscovered:]( self->_subspecializedPeerSession,  "device:rediscovered:",  v6,  v7);
  }
}

- (void)deviceLost:(id)a3
{
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)150LL;
}

- (BOOL)isExtendedDistanceMeasurementEnabled
{
  subspecializedPeerSession = self->_subspecializedPeerSession;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NIServerNearbyPeerNbammsSession, a2);
  return objc_opt_isKindOfClass(subspecializedPeerSession, v3) & 1;
}

- (id)getContainerUniqueIdentifier
{
  return self->_containerUniqueIdentifier;
}

- (id)getNIConfiguration
{
  return self->_configuration;
}

- (id)getResourcesManager
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
  v2 = -[NIServerBaseSession resourcesManager](&v4, "resourcesManager");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)isLegacyDiscoveryToken:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectInRawTokenOPACKDictForKey:&off_1007D2550]);
  BOOL v4 = v3 == 0LL;

  return v4;
}

- (BOOL)shouldInitiate:(id)a3 peerDiscoveryToken:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
  if (!v10) {
    goto LABEL_6;
  }
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"role"]);

  if (!v12) {
    goto LABEL_6;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"role"]);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v15);
  char isKindOfClass = objc_opt_isKindOfClass(v14, v16);

  if ((isKindOfClass & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"role"]);
    unsigned int v20 = [v19 intValue];

    BOOL v21 = v20 == 0;
    if (v20 >= 2)
    {
      NSErrorUserInfoKey v61 = NSLocalizedFailureReasonErrorKey;
      v62 = @"Invalid debugParameters role";
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v22));

      goto LABEL_26;
    }
  }

  else
  {
LABEL_6:
    v23 = (void *)objc_claimAutoreleasedReturnValue([v8 rawToken]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v9 rawToken]);
    unsigned int v25 = [v23 isEqualToData:v24];

    if (v25)
    {
      NSErrorUserInfoKey v59 = NSLocalizedFailureReasonErrorKey;
      v60 = @"Peer and local discovery token are identical";
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10012LL,  v26));

      goto LABEL_26;
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v8 objectInRawTokenOPACKDictForKey:&off_1007D2550]);
    if (!v27
      || (uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v9 objectInRawTokenOPACKDictForKey:&off_1007D2550]),
          v28,
          v27,
          !v28))
    {
      v32 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,shouldInitiate using legacy initiator selection logic",  buf,  2u);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue([v8 rawToken]);
      if ((unint64_t)[v33 length] <= 7)
      {
      }

      else
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue([v9 rawToken]);
        BOOL v35 = (unint64_t)[v34 length] < 8;

        if (!v35)
        {
          id v36 = objc_claimAutoreleasedReturnValue([v8 rawToken]);
          unint64_t v37 = *(void *)[v36 bytes];

          id v38 = objc_claimAutoreleasedReturnValue([v9 rawToken]);
          unint64_t v39 = *(void *)[v38 bytes];

          if (v37 == v39)
          {
            id v40 = (void *)objc_claimAutoreleasedReturnValue([v8 rawToken]);
            v41 = (void *)objc_claimAutoreleasedReturnValue([v40 _reverse]);

            objc_super v42 = (void *)objc_claimAutoreleasedReturnValue([v9 rawToken]);
            v43 = (void *)objc_claimAutoreleasedReturnValue([v42 _reverse]);

            id v44 = v41;
            unint64_t v37 = *(void *)[v44 bytes];
            id v45 = v43;
            unint64_t v39 = *(void *)[v45 bytes];
            if (v37 == v39)
            {
              NSErrorUserInfoKey v55 = NSLocalizedFailureReasonErrorKey;
              v56 = @"Relevant parts of discovery token are identical to local token";
              v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
              *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10012LL,  v46));

              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
                sub_10039E398();
              }

              goto LABEL_26;
            }
          }

          BOOL v21 = v37 > v39;
          goto LABEL_27;
        }
      }

      NSErrorUserInfoKey v57 = NSLocalizedFailureReasonErrorKey;
      v58 = @"Discovery token are too short";
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10012LL,  v47));

LABEL_26:
      BOOL v21 = 0;
      goto LABEL_27;
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v8 getIRK]);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v9 getIRK]);
    if ([v29 length] == (id)16
      && [v30 length] == (id)16
      && ![v29 isEqualToData:v30])
    {
      objc_msgSend(v29, "getBytes:range:", &v51, 0, 8);
      objc_msgSend(v29, "getBytes:range:", buf, 8, 8);
      objc_msgSend(v30, "getBytes:range:", &v49, 0, 8);
      objc_msgSend(v30, "getBytes:range:", &v50, 8, 8);
      if (*(void *)buf == v50) {
        BOOL v21 = v51 > v49;
      }
      else {
        BOOL v21 = *(void *)buf > v50;
      }
    }

    else
    {
      NSErrorUserInfoKey v53 = NSLocalizedFailureReasonErrorKey;
      v54 = @"Peer and local discovery token IRKs are identical or invalid";
      unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  v31));

      BOOL v21 = 0;
    }
  }

- (void)didReceiveNewSolution:(const void *)a3
{
  if (*((_BYTE *)a3 + 24))
  {
    double v5 = *((double *)a3 + 2);
    p_cachedSolutionMacAddr = (uint64_t *)&self->_cachedSolutionMacAddr;
    self->_cachedSolutionMacAddr = *((void *)a3 + 5);
    id v7 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_10039E3F0(p_cachedSolutionMacAddr, v7);
    }
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerNearbyPeerSession discoveryTokenFromIdentifier:]( self,  "discoveryTokenFromIdentifier:",  *p_cachedSolutionMacAddr));
    if (v8)
    {
      v22.receiver = self;
      v22.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
      id v9 = -[NIServerBaseSession resourcesManager](&v22, "resourcesManager");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lifecycleSupervisor]);
      unsigned __int8 v12 = [v11 isTrackingPeer:v8];

      if ((v12 & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
        if (!v13) {
          goto LABEL_13;
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"enableAdditionalUWBSignalFeatures"]);

        if (!v15) {
          goto LABEL_13;
        }
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration debugParameters](self->_configuration, "debugParameters"));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKey:@"enableAdditionalUWBSignalFeatures"]);

        if (v17 && (unsigned __int8 v18 = [v17 BOOLValue], v17, (v18 & 1) != 0))
        {
          __int128 v20 = xmmword_100428898;
          uint64_t v21 = 1LL;
          -[NINearbyUpdatesEngine acceptRoseSolution:withProcessingOptions:]( self->_updatesEngine,  "acceptRoseSolution:withProcessingOptions:",  a3,  &v20);
        }

        else
        {
LABEL_13:
          -[NINearbyUpdatesEngine acceptRoseSolution:](self->_updatesEngine, "acceptRoseSolution:", a3);
        }

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v10 lifecycleSupervisor]);
        [v19 measurementReceivedForToken:v8 contTimestamp:v5];
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039E3C4();
  }

- (void)didReceiveUnsuccessfulSolution:(const void *)a3
{
  if (*((_BYTE *)a3 + 24))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerNearbyPeerSession discoveryTokenFromIdentifier:]( self,  "discoveryTokenFromIdentifier:",  *((void *)a3 + 5)));
    if (v5)
    {
      v10.receiver = self;
      v10.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
      id v6 = -[NIServerBaseSession resourcesManager](&v10, "resourcesManager");
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lifecycleSupervisor]);
      unsigned __int8 v9 = [v8 isTrackingPeer:v5];

      if ((v9 & 1) != 0) {
        -[NINearbyUpdatesEngine acceptUnsuccessfulRoseSolution:]( self->_updatesEngine,  "acceptUnsuccessfulRoseSolution:",  a3);
      }
    }
  }

- (void)didReceiveRemoteData:(const void *)a3
{
  if (self->_configuration)
  {
    if (-[NIServerNearbyPeerSession isExtendedDistanceMeasurementEnabled](self, "isExtendedDistanceMeasurementEnabled"))
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
        sub_10039E4F8();
      }
      double v5 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerNearbyPeerSession discoveryTokenFromIdentifier:]( self,  "discoveryTokenFromIdentifier:",  *((void *)a3 + 5)));
      if (v5)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
        unsigned __int8 v7 = [v5 isEqual:v6];

        if ((v7 & 1) != 0)
        {
          sub_1000065CC(__p, "Receive");
          sub_1001E2CC0((uint64_t **)__p, (unsigned __int8 **)a3 + 1);
          if (v39 < 0) {
            operator delete(*(void **)__p);
          }
          __p[0] = 0;
          BYTE2(v38) = 0;
          char v40 = 0;
          char v41 = 0;
          char v42 = 0;
          char v43 = 0;
          char v47 = 0;
          __int16 v48 = 0;
          uint64_t v44 = 0LL;
          uint64_t v45 = 0LL;
          char v46 = 0;
          id v8 = sub_100005150();
          BOOL v9 = sub_100320824(v8[144]);
          uint64_t v34 = 0LL;
          BOOL v35 = v9;
          if ((sub_1001E2534((uint64_t)a3 + 8, (uint64_t)__p, (uint64_t)&v34) & 1) != 0)
          {
            uint64_t v44 = *((void *)a3 + 4);
            LOBYTE(v45) = 1;
            -[NINearbyUpdatesEngine acceptPeerData:fromPeer:](self->_updatesEngine, "acceptPeerData:fromPeer:", __p, v5);
            if (BYTE1(v34) && (_BYTE)v34)
            {
              objc_super v10 = (os_log_s *)qword_1008000A0;
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v33 = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,Received hangup signal",  v33,  2u);
              }

              -[NIServerNearbyPeerSession _peerHungUp:](self, "_peerHungUp:", v5);
            }
          }

          else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
          {
            sub_10039E4CC();
          }
        }
      }

      else
      {
        uint64_t v19 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_10039E464((uint64_t)a3 + 40, v19, v20, v21, v22, v23, v24, v25);
        }
      }
    }

    else
    {
      __int16 v11 = (_BYTE *)*((void *)a3 + 1);
      if (*((void *)a3 + 2) - (void)v11 > 0xFuLL)
      {
        if (*v11 == 2)
        {
          int v13 = v11[1];
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
            sub_10039E4F8();
          }
          uint64_t v15 = *((void *)a3 + 5);
          uint64_t v14 = (uint64_t *)((char *)a3 + 40);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerNearbyPeerSession discoveryTokenFromIdentifier:]( self,  "discoveryTokenFromIdentifier:",  v15));
          if (v16)
          {
            if (v13)
            {
              uint64_t v17 = (os_log_s *)qword_1008000A0;
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v18 = *v14;
                *(_DWORD *)__p = 134283779;
                *(void *)&__p[4] = v18;
                __int16 v37 = 2113;
                id v38 = v16;
                _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,#hangup Received hangup from 0x%{private}llx. Token: %{private}@",  __p,  0x16u);
              }

              -[NIServerNearbyPeerSession _peerHungUp:](self, "_peerHungUp:", v16);
            }
          }

          else
          {
            uint64_t v26 = (os_log_s *)qword_1008000A0;
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
              sub_10039E464((uint64_t)v14, v26, v27, v28, v29, v30, v31, v32);
            }
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
        {
          sub_10039E5B4();
        }
      }

      else
      {
        unsigned __int8 v12 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_10039E524((_DWORD *)a3 + 4, (_DWORD *)a3 + 2, v12);
        }
      }
    }
  }

- (void)didServiceRequestUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  int var2 = a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
  id v6 = -[NIServerBaseSession resourcesManager](&v22, "resourcesManager");
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lifecycleSupervisor]);

  BOOL v9 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000065CC(v20, off_1007B6E90[v4 >> 32]);
    int v10 = v21;
    __int16 v11 = (void **)v20[0];
    sub_1000065CC(__p, off_1007B6F08[var2]);
    unsigned __int8 v12 = v20;
    if (v10 < 0) {
      unsigned __int8 v12 = v11;
    }
    if (v19 >= 0) {
      int v13 = __p;
    }
    else {
      int v13 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = v12;
    __int16 v26 = 2080;
    uint64_t v27 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,serviceRequestDidUpdateStatus - update: %s, reason: %s",  buf,  0x16u);
    if (v19 < 0) {
      operator delete(__p[0]);
    }
    if (v21 < 0) {
      operator delete(v20[0]);
    }
  }

  if (HIDWORD(v4) == 3)
  {
    [v8 positioningSensorSessionStopped];
  }

  else if (HIDWORD(v4) == 1)
  {
    [v8 positioningSensorSessionStarted];
    if (-[NIServerNearbyPeerSession isExtendedDistanceMeasurementEnabled](self, "isExtendedDistanceMeasurementEnabled")) {
      -[NIServerNearbyPeerSession _activateSensors](self, "_activateSensors");
    }
  }

  if (var2 == 8)
  {
    configuration = self->_configuration;
    if (configuration)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](configuration, "peerDiscoveryToken"));
      uint64_t v23 = v15;
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
      [v8 stoppedDiscoveringPeersWithTokens:v16];

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
      -[NIServerNearbyPeerSession peerInactivityPeriodExceeded:](self, "peerInactivityPeriodExceeded:", v17);
    }
  }
}

- (void)didInvalidateUWBSession
{
  uint64_t v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,Invalidating ni peer session",  buf,  2u);
  }

  -[NIServerNearbyPeerSession invalidate](self, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
  id v4 = -[NIServerBaseSession invalidationHandler](&v7, "invalidationHandler");
  double v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
  ((void (**)(void, void *))v5)[2](v5, v6);
}

- (BOOL)_longRangeEnabled
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerBaseSession resourcesManager](self, "resourcesManager"));
  unsigned int v4 = [v3 longRangeEnabled];

  unsigned int v5 = -[NINearbyPeerConfiguration isLongRangeEnabled](self->_configuration, "isLongRangeEnabled");
  unsigned int v6 = -[NIServerNearbyPeerSession _peerSupportsLongRange](self, "_peerSupportsLongRange");
  unsigned int v7 = v6;
  if ((v4 & v5 & 1) == 0)
  {
    if (v6)
    {
      id v8 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,WARNING: longRange is disabled locally, but the peer supports it.",  buf,  2u);
      }
    }
  }

  if (((v4 & v5 ^ 1 | v7) & 1) == 0)
  {
    BOOL v9 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,longRange is supported locally, but the peer does NOT support it.",  v11,  2u);
    }
  }

  return v4 & v7 & v5;
}

- (BOOL)_peerSupportsLongRange
{
  if (self->_configuration)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_peerTokenDict,  "objectForKeyedSubscript:",  &off_1007D2568));
    if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber, v2), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)) {
      unint64_t v5 = (unint64_t)[v3 unsignedIntValue] & 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_disableAllServicesAndSendHangupSignal:(BOOL)a3
{
  if (!self->_configuration) {
    return 0LL;
  }
  BOOL v3 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
  id v5 = -[NIServerBaseSession disableAllServices](&v25, "disableAllServices");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (-[NIServerNearbyPeerSession isExtendedDistanceMeasurementEnabled](self, "isExtendedDistanceMeasurementEnabled"))
  {
    if (v3)
    {
      if (!self->_currentFindeeData.__engaged_)
      {
        memset(&buf[7], 0, 17);
        self->_currentFindeeData.var0.__null_state_ = 0;
        self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_ = 0;
        self->_currentFindeeData.var0.__val_.measured_displacement.var0.__null_state_ = 0;
        self->_currentFindeeData.var0.__val_.measured_displacement.__engaged_ = 0;
        self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
        self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ = 0;
        *(_OWORD *)(&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ + 1) = *(_OWORD *)buf;
        *(void *)(&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ + 1) = *(void *)&buf[16];
        self->_currentFindeeData.var0.__val_.location_data.__engaged_ = 0;
        self->_currentFindeeData.var0.__val_.good_gnss_conditions_detected = 0;
        self->_currentFindeeData.__engaged_ = 1;
      }

      p_currentSignallingData = &self->_currentSignallingData;
      if (!self->_currentSignallingData.__engaged_)
      {
        id v8 = sub_100005150();
        BOOL v9 = sub_100320824(v8[144]);
        BOOL engaged = self->_currentSignallingData.__engaged_;
        *(void *)&p_currentSignallingData->var0.__null_state_ = 0LL;
        self->_currentSignallingData.var0.__val_.isPhone = v9;
        if (!engaged) {
          self->_currentSignallingData.__engaged_ = 1;
        }
      }

      *(_WORD *)&p_currentSignallingData->var0.__null_state_ = 257;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
        sub_10039E5E0();
      }
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned int v12 = [v11 BOOLForKey:@"FindingDisableHangup"];

      if (v12)
      {
        int v13 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,Would set hangup bit, but it's disabled in defaults writes",  buf,  2u);
        }

        if (!self->_currentSignallingData.__engaged_) {
          sub_100006080();
        }
        *(_WORD *)&p_currentSignallingData->var0.__null_state_ = 256;
      }

      if (!self->_currentFindeeData.__engaged_) {
        sub_100006080();
      }
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
      id v15 =  -[NIServerNearbyPeerSession setDataFrame:forPeer:]( self,  "setDataFrame:forPeer:",  &self->_currentFindeeData,  v14);

      v16.__rep_ = (int64_t)-[NIServerNearbyPeerSession nominalCycleRate](self, "nominalCycleRate");
      if (v16.__rep_ >= 1)
      {
        uint64_t v17 = 1000000 * v16.__rep_;
        *(void *)buf = v17;
        std::this_thread::sleep_for ((const std::chrono::nanoseconds *)buf);
      }
    }

    if (self->_currentFindeeData.__engaged_) {
      self->_currentFindeeData.__engaged_ = 0;
    }
    if (self->_currentSignallingData.__engaged_) {
      self->_currentSignallingData.__engaged_ = 0;
    }
    -[NIServerNearbyPeerSession _deactivateSensors](self, "_deactivateSensors");
  }

  else if (!-[NIServerNearbyPeerSession _longRangeEnabled](self, "_longRangeEnabled") && v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_10039E5E0();
    }
    LOBYTE(__ns.__rep_) = 0;
    sub_10016C2CC(buf, 0x10uLL, &__ns);
    uint64_t v19 = *(void *)buf;
    **(_WORD **)buf = 258;
    *(void *)(v19 + 2) = 0LL;
    *(void *)(v19 + 8) = 0LL;
    subspecializedPeerSession = self->_subspecializedPeerSession;
    if (subspecializedPeerSession)
    {
      -[NIServerNearbyPeerSubspecializationProtocol updatePeerData:](subspecializedPeerSession, "updatePeerData:", buf);
      v21.__rep_ = (int64_t)-[NIServerNearbyPeerSession nominalCycleRate](self, "nominalCycleRate");
      if (v21.__rep_ >= 1)
      {
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v22 = 1000000 * v21.__rep_;
        __ns.__rep_ = v22;
        std::this_thread::sleep_for (&__ns);
      }
    }

    if (*(void *)buf)
    {
      *(void *)&uint8_t buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }
  }

  uint64_t v23 = self->_subspecializedPeerSession;
  if (v23) {
    -[NIServerNearbyPeerSubspecializationProtocol invalidate](v23, "invalidate");
  }
  configuration = self->_configuration;
  self->_configuration = 0LL;

  self->_cachedSolutionMacAddr = 0LL;
  return v6;
}

- (id)_addPeers:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
  id v5 = -[NIServerBaseSession resourcesManager](&v20, "resourcesManager");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v7);
      }
      __int16 v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btResource", (void)v16));
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 rawToken]);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 addPeerDiscoveryToken:v13]);

      if (v14) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    uint64_t v14 = 0LL;
  }

  return v14;
}

- (void)_peerHungUp:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
  id v5 = -[NIServerBaseSession resourcesManager](&v12, "resourcesManager");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 btResource]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 deviceCache]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 rawToken]);
  unsigned __int8 v10 = [v8 isCachedByTokenData:v9];

  if ((v10 & 1) != 0)
  {
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 lifecycleSupervisor]);
    [v11 peerHangupReceived:v4];

    -[NIServerNearbyPeerSession _removePeerObject:withReason:](self, "_removePeerObject:withReason:", v4, 1LL);
  }
}

- (void)_removePeerObject:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  -[NINearbyUpdatesEngine clearStateForToken:](self->_updatesEngine, "clearStateForToken:", v6);
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerSession;
  id v7 = -[NIServerBaseSession resourcesManager](&v37, "resourcesManager");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 btResource]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 deviceCache]);
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 rawToken]);
  unsigned __int8 v12 = [v10 uncacheDeviceByTokenData:v11];

  if ((v12 & 1) == 0)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 lifecycleSupervisor]);
    unsigned int v14 = [v13 isTracking];

    if (v14)
    {
      id v15 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039E69C((uint64_t)v6, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }

  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v22 = -[NINearbyObject initWithToken:](objc_alloc(&OBJC_CLASS___NINearbyObject), "initWithToken:", v6);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 remote]);
  char v42 = v22;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
  [v23 didRemoveNearbyObjects:v24 withReason:a4];

  if (a4)
  {
    if (a4 == 1)
    {
      objc_super v25 = @"Hangup";
    }

    else
    {
      if (a4 == 2)
      {
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
          sub_10039E670();
        }
        id v36 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          char v39 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Daemon/Services/NearbyInteraction/Session/NIServerNearbyPeerSession.mm";
          __int16 v40 = 1024;
          *(_DWORD *)char v41 = 837;
          *(_WORD *)&v41[4] = 2080;
          *(void *)&v41[6] = "-[NIServerNearbyPeerSession _removePeerObject:withReason:]";
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "#ses-nrby-peer,%s:%d: assertion failure in %s",  buf,  0x1Cu);
        }

        abort();
      }

      objc_super v25 = &stru_1007C41E0;
    }
  }

  else
  {
    objc_super v25 = @"Timeout";
  }

  __int16 v26 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    containerUniqueIdentifier = self->_containerUniqueIdentifier;
    *(_DWORD *)buf = 138412802;
    char v39 = (const char *)v22;
    __int16 v40 = 2112;
    *(void *)char v41 = v25;
    *(_WORD *)&v41[8] = 2112;
    *(void *)&v41[10] = containerUniqueIdentifier;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,_removePeerObject: %@ with reason: %@ for session identifier: %@",  buf,  0x20u);
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerNearbyPeerSession _disableAllServicesAndSendHangupSignal:]( self,  "_disableAllServicesAndSendHangupSignal:",  a4 != 1));
  if (v28)
  {
    uint64_t v29 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039E60C((uint64_t)v28, v29, v30, v31, v32, v33, v34, v35);
    }
  }
}

- (BOOL)_shouldBypassBluetoothDiscovery
{
  unsigned int v2 = -[NIServerNearbyPeerSubspecializationProtocol shouldBypassBleDiscovery]( self->_subspecializedPeerSession,  "shouldBypassBleDiscovery");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v4 = v2 | [v3 BOOLForKey:@"FindingBypassDiscovery"];

  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,Should bypass Ble discovery %d",  (uint8_t *)v7,  8u);
  }

  return v4;
}

- (id)setDataFrame:(const void *)a3 forPeer:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken"));
  unsigned __int8 v8 = [v6 isEqual:v7];

  if ((v8 & 1) != 0)
  {
    p_currentFindeeData = &self->_currentFindeeData;
    __int128 v10 = *(_OWORD *)a3;
    __int128 v11 = *((_OWORD *)a3 + 2);
    if (self->_currentFindeeData.__engaged_)
    {
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v11;
      *(_OWORD *)&p_currentFindeeData->var0.__null_state_ = v10;
      __int128 v12 = *((_OWORD *)a3 + 3);
      __int128 v13 = *((_OWORD *)a3 + 4);
      __int128 v14 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1 = v14;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = v12;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementV = v13;
      __int128 v15 = *((_OWORD *)a3 + 7);
      __int128 v16 = *((_OWORD *)a3 + 8);
      __int128 v17 = *((_OWORD *)a3 + 9);
      *(_OWORD *)((char *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.uncertainty + 2) = *(_OWORD *)((char *)a3 + 154);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = v16;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.easterlyOffsetM = v17;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ = v15;
    }

    else
    {
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v11;
      *(_OWORD *)&p_currentFindeeData->var0.__null_state_ = v10;
      __int128 v20 = *((_OWORD *)a3 + 3);
      __int128 v21 = *((_OWORD *)a3 + 4);
      __int128 v22 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1 = v22;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = v20;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementV = v21;
      __int128 v23 = *((_OWORD *)a3 + 7);
      __int128 v24 = *((_OWORD *)a3 + 8);
      __int128 v25 = *((_OWORD *)a3 + 10);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.easterlyOffsetM = *((_OWORD *)a3 + 9);
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.__engaged_ = v25;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_ = v23;
      *(_OWORD *)&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = v24;
      self->_currentFindeeData.__engaged_ = 1;
    }

    __int16 v48 = 0LL;
    unint64_t v49 = 0LL;
    uint64_t v50 = 0LL;
    __int128 v26 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.easterlyOffsetM;
    __int128 v46 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_;
    v47[0] = v26;
    *(_OWORD *)((char *)v47 + 10) = *(_OWORD *)((char *)&self->_currentFindeeData.var0.__val_.location_data.var0.__val_.uncertainty
                                              + 2);
    __int128 v27 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__null_state_;
    __int128 v42 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementV;
    __int128 v43 = v27;
    __int128 v28 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.__engaged_;
    __int128 v44 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1;
    __int128 v45 = v28;
    __int128 v29 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.bounded_displacement.__engaged_;
    *(_OWORD *)__p = *(_OWORD *)&p_currentFindeeData->var0.__null_state_;
    __int128 v39 = v29;
    __int128 v30 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.displacementH1;
    __int128 v40 = *(_OWORD *)&self->_currentFindeeData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp;
    __int128 v41 = v30;
    if (self->_currentSignallingData.__engaged_)
    {
      uint64_t v36 = *(void *)&self->_currentSignallingData.var0.__null_state_;
      LOBYTE(v37) = self->_currentSignallingData.var0.__val_.isPhone;
    }

    else
    {
      uint64_t v31 = sub_100005150();
      BOOL v32 = sub_100320824(v31[144]);
      uint64_t v36 = 0LL;
      LOBYTE(v37) = v32;
    }

    if (sub_1001E1B20((uint64_t)&v48, (uint64_t)__p, (unsigned __int8 *)&v36))
    {
      sub_1000065CC(__p, "Send");
      sub_1001E2CC0((uint64_t **)__p, &v48);
      if (SBYTE7(v39) < 0) {
        operator delete(__p[0]);
      }
      subspecializedPeerSession = self->_subspecializedPeerSession;
      if (subspecializedPeerSession) {
        -[NIServerNearbyPeerSubspecializationProtocol updatePeerData:]( subspecializedPeerSession,  "updatePeerData:",  &v48,  v36,  v37);
      }
      uint64_t v19 = 0LL;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039E700();
      }
      NSErrorUserInfoKey v51 = NSLocalizedFailureReasonErrorKey;
      v52 = @"FindingDataFrameFormat::encode failed";
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL,  v36,  v37,  __p[0],  __p[1],  v39,  v40,  v41,  v42,  v43,  v44,  v45,  v46,  v47[0],  *(void *)&v47[1],  *((void *)&v47[1] + 1)));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v34));
    }

    if (v48)
    {
      unint64_t v49 = v48;
      operator delete(v48);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039E72C();
    }
    NSErrorUserInfoKey v53 = NSLocalizedFailureReasonErrorKey;
    v54 = @"Not Ranging with specified peer";
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v18));
  }

  return v19;
}

- (void)_activateSensors
{
  BOOL v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,turning on sensors for peer algorithms.",  buf,  2u);
  }

  if (self->_sensorsOn)
  {
    unsigned int v4 = (os_log_s *)qword_1008000A0;
    if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v8 = 0;
    id v5 = "#ses-nrby-peer,sensors already ON";
    id v6 = (uint8_t *)&v8;
  }

  else
  {
    self->_sensorsOn = 1;
    unsigned int v4 = (os_log_s *)qword_1008000A0;
    if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v7 = 0;
    id v5 = "#ses-nrby-peer,turned on sensors for peer algorithms.";
    id v6 = (uint8_t *)&v7;
  }

  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
}

- (void)_deactivateSensors
{
  BOOL v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,turning off sensors for findee algorithms.  ",  v4,  2u);
  }

  if (self->_sensorsOn) {
    self->_sensorsOn = 0;
  }
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  -[NINearbyUpdatesEngine acceptVisionInput:](self->_updatesEngine, "acceptVisionInput:", v4);
}

- (void)updatesEngine:(id)a3 didUpdateNearbyObjects:(id)a4
{
  id v6 = (NINearbyUpdatesEngine *)a3;
  id v7 = a4;
  if (self->_updatesEngine != v6) {
    __assert_rtn( "-[NIServerNearbyPeerSession updatesEngine:didUpdateNearbyObjects:]",  "NIServerNearbyPeerSession.mm",  1275,  "engine == _updatesEngine");
  }
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10021CB84;
  v10[3] = &unk_1007A2248;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(clientQueue, v10);
}

- (void)updatesEngine:(id)a3 didUpdateAlgorithmConvergenceState:(id)a4 forObject:(id)a5
{
  __int16 v8 = (NINearbyUpdatesEngine *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_updatesEngine != v8) {
    __assert_rtn( "-[NIServerNearbyPeerSession updatesEngine:didUpdateAlgorithmConvergenceState:forObject:]",  "NIServerNearbyPeerSession.mm",  1319,  "engine == _updatesEngine");
  }
  clientQueue = (dispatch_queue_s *)self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10021CD3C;
  block[3] = &unk_1007B14B8;
  block[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(clientQueue, block);
}

- (void)updatesEngine:(id)a3 didUpdateFindeeData:(const void *)a4 forToken:(id)a5
{
  id v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_10039E758();
  }
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerSession setDataFrame:forPeer:](self, "setDataFrame:forPeer:", a4, v7));
  if (v8)
  {
    id v9 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_claimAutoreleasedReturnValue([v8 description]);
      int v11 = 136315138;
      id v12 = [v10 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#ses-nrby-peer,sent peer data to ranging provider with error: %s",  (uint8_t *)&v11,  0xCu);
    }
  }
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken", a3));
  if (v3) {
    id v4 = -[NINearbyObject initWithToken:](objc_alloc(&OBJC_CLASS___NINearbyObject), "initWithToken:", v3);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  return -[NINearbyPeerConfiguration peerDiscoveryToken](self->_configuration, "peerDiscoveryToken", a3);
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  unint64_t cachedSolutionMacAddr = self->_cachedSolutionMacAddr;
  BOOL v4 = 1LL;
  result.__engaged_ = v4;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)cachedSolutionMacAddr;
  return result;
}

- (void)peerInactivityPeriodExceeded:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  -[NIServerNearbyPeerSession _removePeerObject:withReason:](self, "_removePeerObject:withReason:", v4, 0LL);
}

- (NINearbyPeerConfiguration)configuration
{
  return (NINearbyPeerConfiguration *)objc_getProperty(self, a2, 336LL, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0LL;
  *((void *)self + 12) = 0LL;
  *((_BYTE *)self + 136) = 0;
  *((_BYTE *)self + 312) = 0;
  *((_BYTE *)self + 320) = 0;
  *((_BYTE *)self + 329) = 0;
  return self;
}

@end