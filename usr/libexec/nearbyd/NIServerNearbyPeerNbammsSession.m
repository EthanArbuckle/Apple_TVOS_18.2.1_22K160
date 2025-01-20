@interface NIServerNearbyPeerNbammsSession
- (BOOL)_doesWantTriggeredDutyCycledAcquisition;
- (BOOL)shouldBypassBleDiscovery;
- (NIServerNearbyPeerNbammsSession)initWithDataSource:(id)a3 delegate:(id)a4 clientQueue:(id)a5;
- (float)_adjustDutyCycleForInterfaceDelays:(float)a3 schedulingInterval:(unsigned int)a4;
- (float)_getDutyCycleForTriggeredDutyCycledAcquisition;
- (id).cxx_construct;
- (id)_triggerRanging:(id)a3;
- (id)configure;
- (id)run;
- (int)_getRangingAcquisitionType;
- (int)_getRangingTriggerType;
- (optional<SecondarySchedulingParameters>)_getSecondarySchedulingParameters;
- (optional<rose::RoseServiceRequest>)_prepareServiceRequestForDiscoveryToken:(SEL)a3 nbUwbAcquisitionBandChannel:(id)a4;
- (optional<unsigned)_getDitherConst;
- (shared_ptr<rose::objects::NBAMMSSession>)_buildRoseSession:(const void *)a3;
- (unsigned)_getNbUwbAcquisitionBandChannel:(id)a3;
- (unsigned)_getRangingTimeoutWithKey:(id)a3 timeoutIfNoOverride:(unsigned __int16)a4;
- (unsigned)_getSchedulingIntervalForTriggeredDutyCycledAcquisition;
- (void)_nbammsSessionInvalidatedWithReason:(int)a3;
- (void)device:(id)a3 rediscovered:(id)a4;
- (void)deviceDiscovered:(id)a3;
- (void)didReceiveNewSolution:(const void *)a3;
- (void)didReceiveRemoteData:(const void *)a3;
- (void)didReceiveUnsuccessfulSolution:(const void *)a3;
- (void)invalidate;
- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3;
- (void)updatePeerData:(const void *)a3;
@end

@implementation NIServerNearbyPeerNbammsSession

- (NIServerNearbyPeerNbammsSession)initWithDataSource:(id)a3 delegate:(id)a4 clientQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NIServerNearbyPeerNbammsSession;
  v11 = -[NIServerNearbyPeerNbammsSession init](&v21, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_clientQueue, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 getResourcesManager]);
    v14 = v13;
    if (v13) {
      [v13 protobufLogger];
    }
    else {
      __int128 v20 = 0uLL;
    }
    sub_10000EE54((uint64_t)&v12->_pbLogger, &v20);
    v15 = (std::__shared_weak_count *)*((void *)&v20 + 1);
    if (*((void *)&v20 + 1))
    {
      v16 = (unint64_t *)(*((void *)&v20 + 1) + 8LL);
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }

    *(_WORD *)&v12->_useTestNbammsMode = 0;
    v18 = v12;
  }

  return v12;
}

- (id)configure
{
  if (!self->_nbammsSession.__ptr_)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getNIConfiguration]);
    id v6 = [v5 copy];

    if (([v6 isExtendedDistanceMeasurementEnabled] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A0C98();
      }
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
      goto LABEL_34;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 debugParameters]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"useTestNbammsMode"]);

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 debugParameters]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"useTestNbammsMode"]);
      self->_useTestNbammsMode = [v10 BOOLValue];

      v11 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_useTestNbammsMode) {
          v12 = "Y";
        }
        else {
          v12 = "N";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,NBAMMS test mode used: %s",  buf,  0xCu);
      }
    }

    v13 = sub_100005150();
    BOOL v14 = sub_1003552C4((uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v16 = [v15 BOOLForKey:@"DisableNIPeerExtendedDistanceOverride"];

    if (v16)
    {
      unint64_t v17 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,* disable extended distance measurement through default writes.",  buf,  2u);
      }

      goto LABEL_31;
    }

    if (!v14)
    {
LABEL_31:
      v33 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Invalidating NBAMMS session configuration - device does not support NBAMMS",  buf,  2u);
      }

      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5889LL,  0LL));
      goto LABEL_34;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v6 peerDiscoveryToken]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceCapabilities]);
    unsigned int v21 = [v20 supportsExtendedDistanceMeasurement];

    v22 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "N";
      if (v21) {
        v23 = "Y";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Peer supports NBAMMS %s",  buf,  0xCu);
    }

    if ((v21 & 1) != 0 || self->_useTestNbammsMode)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v6 peerDiscoveryToken]);
      BOOL v25 = v24 == 0LL;

      if (!v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getResourcesManager]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 discoveryToken]);

        if (!v27)
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_1003A0C14();
          }
          v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
          goto LABEL_61;
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue([v6 peerDiscoveryToken]);
        id v44 = 0LL;
        unsigned __int8 v29 = [WeakRetained shouldInitiate:v27 peerDiscoveryToken:v28 error:&v44];
        id v30 = v44;
        self->_BOOL isInitiator = v29;

        if (v30)
        {
          v31 = (os_log_s *)(id)qword_1008000A0;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            id v42 = objc_claimAutoreleasedReturnValue([v30 description]);
            id v43 = [v42 UTF8String];
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v43;
            _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "#peer-nba,Unable to determine initiator: %s",  buf,  0xCu);
          }

          uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
        }

        else
        {
          BOOL isInitiator = self->_isInitiator;
          v39 = v27;
          if (!self->_isInitiator) {
            v39 = (void *)objc_claimAutoreleasedReturnValue([v6 peerDiscoveryToken]);
          }
          uint64_t v40 = -[NIServerNearbyPeerNbammsSession _getNbUwbAcquisitionBandChannel:]( self,  "_getNbUwbAcquisitionBandChannel:",  v39);
          if (!isInitiator) {

          }
          v41 = (void *)objc_claimAutoreleasedReturnValue([v6 peerDiscoveryToken]);
          -[NIServerNearbyPeerNbammsSession _prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:]( self,  "_prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:",  v41,  v40);
          memcpy(buf, __src, 0x1F9uLL);

          if (buf[504])
          {
            -[NIServerNearbyPeerNbammsSession _buildRoseSession:](self, "_buildRoseSession:", buf);
            sub_10000EE54((uint64_t)&self->_nbammsSession, __src);
            sub_100012390((uint64_t)__src);
            if (self->_nbammsSession.__ptr_)
            {
              v34 = 0LL;
LABEL_60:

LABEL_61:
              goto LABEL_35;
            }

            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
              sub_1003A0C6C();
            }
          }

          else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT))
          {
            sub_1003A0C40();
          }

          uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
        }

        v34 = (void *)v32;
        goto LABEL_60;
      }

      uint64_t v35 = -5888LL;
    }

    else
    {
      v36 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        if (self->_useTestNbammsMode) {
          v37 = "Y";
        }
        else {
          v37 = "N";
        }
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Invalidating NBAMMS session configuration - peer does not support NBAMMS; testNbammsMode = %s",
          buf,
          0xCu);
      }

      uint64_t v35 = -5881LL;
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  v35,  0LL));
LABEL_34:
    v34 = (void *)v18;
LABEL_35:

    return v34;
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_1003A0CC4();
  }
  return (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5880LL,  0LL));
}

- (id)run
{
  if (!self->_nbammsSession.__ptr_)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003A0CF0();
    }
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5888LL,  0LL));
    goto LABEL_9;
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  BOOL useTestNbammsMode = self->_useTestNbammsMode;
  v4 = (os_log_s *)qword_1008000A0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
  if (useTestNbammsMode)
  {
    if (v5)
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Test Nbamms mode not gated by BT, start ranging immediately",  (uint8_t *)__p,  2u);
    }

    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerNbammsSession _triggerRanging:](self, "_triggerRanging:", 0LL));
LABEL_9:
    v7 = (void *)v6;
    return v7;
  }

  if (v5)
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#peer-nba,POR MAC mode", (uint8_t *)__p, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getResourcesManager]);
  unsigned int v11 = -[NIServerNearbyPeerNbammsSession _getRangingTriggerType](self, "_getRangingTriggerType");
  v12 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v11 ? "TriggerRequired" : "NoTriggerRequired";
    sub_1000065CC(__p, v13);
    BOOL v14 = v20 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#peer-nba,ranging trigger type %s", buf, 0xCu);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
  }

  if (!v11)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNearbyPeerNbammsSession _triggerRanging:](self, "_triggerRanging:", 0LL));
    if (v7)
    {

      return v7;
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v10 btResource]);
  [v15 setBleRSSIThresholdHint:4294967176];

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v10 btResource]);
  [v16 startAdvertising];

  if ([v10 isBackgroundOperationAllowed])
  {
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 btResource]);
    [v17 allowScreenOffOperation:1];
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v10 btResource]);
  [v18 startScanning];

  return 0LL;
}

- (BOOL)shouldBypassBleDiscovery
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"FindingUseDiscovery"];

  return v3 ^ 1;
}

- (void)deviceDiscovered:(id)a3
{
  id v4 = a3;
  BOOL v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Device discovered",  (uint8_t *)__p,  2u);
  }

  if (self->_pbLogger.__ptr_)
  {
    double v6 = sub_100023CC4();
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NINearbyObject objectFromBluetoothDevice:]( &OBJC_CLASS___NINearbyObject,  "objectFromBluetoothDevice:",  v4));
    if (v7)
    {
      ptr = self->_pbLogger.__ptr_;
      id v9 = [v4 u64Identifier];
      sub_100230924(v7, (uint64_t)__p);
      sub_100239E68((uint64_t)ptr, (uint64_t)v9, (uint64_t)__p, v6);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }

  if (-[NIServerNearbyPeerNbammsSession _getRangingTriggerType](self, "_getRangingTriggerType")) {
    id v10 = -[NIServerNearbyPeerNbammsSession _triggerRanging:](self, "_triggerRanging:", v4);
  }
}

- (void)device:(id)a3 rediscovered:(id)a4
{
  id v4 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#peer-nba,Device rediscovered", v5, 2u);
  }

- (void)updatePeerData:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003A0D1C();
  }
  ptr = self->_nbammsSession.__ptr_;
  if (ptr)
  {
    if (!self->_useTestNbammsMode) {
      sub_1002732D0((uint64_t)ptr, (uint64_t)a3);
    }
  }

- (void)didReceiveNewSolution:(const void *)a3
{
  unsigned __int8 v3 = (int *)((char *)a3 + 32);
  if (((*((_DWORD *)a3 + 8) - 1) & 0xFFFFFFFD) != 0)
  {
    id v4 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003A0D48(v3, v4);
    }
  }

  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didReceiveNewSolution:a3];
  }

- (void)didReceiveUnsuccessfulSolution:(const void *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didReceiveUnsuccessfulSolution:a3];
}

- (void)didReceiveRemoteData:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003A0DBC();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didReceiveRemoteData:a3];
}

- (void)serviceRequestDidUpdateStatus:(ServiceRequestStatusUpdate)a3
{
  unsigned int var2 = a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didServiceRequestUpdateStatus:", v4, var2);
}

- (void)invalidate
{
  ptr = self->_nbammsSession.__ptr_;
  p_nbammsSession = &self->_nbammsSession;
  uint64_t v3 = (uint64_t)ptr;
  if (ptr)
  {
    sub_10026FAA8(v3);
    sub_10015D394(p_nbammsSession);
  }

- (id)_triggerRanging:(id)a3
{
  id v4 = a3;
  if (self->_nbammsSession.__ptr_)
  {
    unsigned int v5 = -[NIServerNearbyPeerNbammsSession _getRangingAcquisitionType](self, "_getRangingAcquisitionType");
    double v6 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v5 ? "BTAidedAcquisition" : "DirectAcquisition";
      sub_1000065CC(&__p, v7);
      id v8 = v67[13] >= 0 ? &__p : (void **)__p;
      *(_DWORD *)buf = 136315138;
      v50 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,ranging acquisition type = %s",  buf,  0xCu);
      if ((v67[13] & 0x80000000) != 0) {
        operator delete(__p);
      }
    }

    if (v4 || v5 != 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getNIConfiguration]);
      id v12 = [v11 copy];

      v45 = v12;
      dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 debugParameters]);
      BOOL v14 = v13 == 0LL;

      unsigned int v47 = 10000000;
      if (!v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v12 debugParameters]);
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"startTimeUncertainty"]);

        if (v16) {
          unsigned int v47 = [v16 intValue];
        }
      }

      uint64_t v17 = -[NIServerNearbyPeerNbammsSession _getSchedulingIntervalForTriggeredDutyCycledAcquisition]( self,  "_getSchedulingIntervalForTriggeredDutyCycledAcquisition");
      -[NIServerNearbyPeerNbammsSession _getDutyCycleForTriggeredDutyCycledAcquisition]( self,  "_getDutyCycleForTriggeredDutyCycledAcquisition");
      float v19 = v18;
      id v44 = -[NIServerNearbyPeerNbammsSession _getSecondarySchedulingParameters]( self,  "_getSecondarySchedulingParameters");
      float v22 = v21;
      float v23 = v21;
      int v25 = v24;
      if ((_DWORD)v17)
      {
        if (v19 <= 1.0)
        {
          *(float *)&double v20 = v19;
          -[NIServerNearbyPeerNbammsSession _adjustDutyCycleForInterfaceDelays:schedulingInterval:]( self,  "_adjustDutyCycleForInterfaceDelays:schedulingInterval:",  v17,  v20);
          float v19 = v26;
          if (v25)
          {
            v27 = (os_log_s *)qword_1008000A0;
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(__p) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Requested backoff acquisition policy, processing secondary scheduling parameters",  (uint8_t *)&__p,  2u);
            }

            if (v19 >= v23)
            {
              int v25 = 1;
            }

            else
            {
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                sub_1003A0E60();
              }
              int v25 = 0;
            }
          }
        }
      }

      if (self->_isInitiator)
      {
        unsigned __int16 v28 = (unsigned __int16)-[NIServerNearbyPeerNbammsSession _getDitherConst](self, "_getDitherConst");
        int v29 = HIBYTE(v28);
      }

      else
      {
        LOBYTE(v28) = 0;
        int v29 = 0;
      }

      id v30 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(__p) = 67109632;
        if (v29) {
          unsigned __int8 v31 = v28;
        }
        else {
          unsigned __int8 v31 = 0;
        }
        HIDWORD(__p) = v17;
        __int16 v66 = 2048;
        *(double *)v67 = v19;
        *(_WORD *)&v67[8] = 1024;
        *(_DWORD *)&v67[10] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Primary scheduling params: Interval(us)=%d, Duty Cycle=%f, Dither const=%d",  (uint8_t *)&__p,  0x18u);
      }

      if (v25)
      {
        uint64_t v32 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(__p) = 67109632;
          HIDWORD(__p) = (_DWORD)v44;
          __int16 v66 = 1024;
          *(_DWORD *)v67 = HIDWORD(v44);
          *(_WORD *)&v67[4] = 2048;
          *(double *)&v67[6] = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Secondary scheduling params: Delay(us)=%d, Interval(us)=%d, Duty Cycle=%f",  (uint8_t *)&__p,  0x18u);
        }
      }

      LOBYTE(__p) = 0;
      char v68 = 0;
      uint64_t v69 = 17000LL;
      char v70 = 1;
      unsigned int v71 = v47;
      int v72 = v17;
      float v73 = v19;
      uint64_t v74 = 0LL;
      __int16 v75 = v28 | (unsigned __int16)((_WORD)v29 << 8);
      uint64_t v76 = 0LL;
      memset(v78, 0, sizeof(v78));
      uint64_t v77 = 0LL;
      __int16 v54 = 0;
      int v53 = 0;
      *(_DWORD *)buf = 2;
      LOBYTE(v50) = 0;
      __int16 v51 = 0;
      char v52 = 0;
      char v55 = 1;
      char v56 = 1;
      uint64_t v57 = 17000LL;
      char v58 = 1;
      unsigned int v59 = v47;
      int v60 = v17;
      float v61 = v19;
      uint64_t v62 = 0LL;
      __int16 v63 = v75;
      memset(v64, 0, sizeof(v64));
      if (v5 == 1)
      {
        id v34 = [v4 btAdvertisingAddress];
        *(_DWORD *)buf = 2;
        LOBYTE(v50) = 0;
        __int16 v51 = 0;
        char v52 = 0;
        int v53 = (int)v34;
        __int16 v54 = WORD2(v34);
        char v55 = 1;
        char v56 = 1;
        uint64_t v57 = 17000LL;
        char v58 = 1;
        unsigned int v59 = v47;
        int v60 = v17;
        float v61 = v19;
        uint64_t v62 = 0LL;
        __int16 v63 = v28 | (unsigned __int16)((_WORD)v29 << 8);
        memset(v64, 0, sizeof(v64));
      }

      else if (!v5 && v25)
      {
        v33 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v48 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Resetting NBAMMSStartOptions",  v48,  2u);
        }

        __int16 v54 = 0;
        int v53 = 0;
        *(_DWORD *)buf = 2;
        LOBYTE(v50) = 0;
        __int16 v51 = 0;
        char v52 = 0;
        char v55 = 1;
        char v56 = 1;
        uint64_t v57 = 17000LL;
        char v58 = 1;
        unsigned int v59 = v47;
        int v60 = v17;
        float v61 = v19;
        uint64_t v62 = 0LL;
        __int16 v63 = v28 | (unsigned __int16)((_WORD)v29 << 8);
        *(_DWORD *)v64 = 0;
        *(_WORD *)&v64[4] = 0;
        *(void *)&v64[6] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000LL | v44;
        *(void *)&v64[14] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000LL | HIDWORD(v44);
        *(float *)&v64[22] = v22;
        v64[26] = 1;
      }

      BOOL useTestNbammsMode = self->_useTestNbammsMode;
      v36 = (os_log_s *)qword_1008000A0;
      BOOL v37 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
      if (useTestNbammsMode)
      {
        if (v37)
        {
          if (v29) {
            unsigned __int8 v38 = v28;
          }
          else {
            unsigned __int8 v38 = 0;
          }
          *(_DWORD *)v48 = 67109120;
          *(_DWORD *)&v48[4] = v38;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,startRanging dither = %d",  v48,  8u);
        }

        p_p = (__int128 *)&__p;
      }

      else
      {
        if (v37)
        {
          if (HIBYTE(v63)) {
            unsigned __int8 v40 = v63;
          }
          else {
            unsigned __int8 v40 = 0;
          }
          *(_DWORD *)v48 = 67109120;
          *(_DWORD *)&v48[4] = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,startRanging dither = %d",  v48,  8u);
        }

        p_p = (__int128 *)buf;
      }

      id v9 = WeakRetained;
      int v41 = sub_100272BA0((uint64_t)self->_nbammsSession.__ptr_, p_p);
      if (v41)
      {
        id v42 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          sub_100275DD0(v41, v48);
          sub_1003A0E14();
        }

        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
      }

      else
      {
        id v10 = 0LL;
      }
    }

    else
    {
      NSErrorUserInfoKey v79 = NSLocalizedFailureReasonErrorKey;
      v80 = @"Didnt receive BT discovered device info";
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v80,  &v79,  1LL));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  v9));
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003A0DE8();
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -5887LL,  0LL));
  }

  return v10;
}

- (void)_nbammsSessionInvalidatedWithReason:(int)a3
{
  unsigned int v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100275E00(a3, v7);
    sub_1003A0E8C();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didInvalidateUWBSession];
}

- (shared_ptr<rose::objects::NBAMMSSession>)_buildRoseSession:(const void *)a3
{
  unsigned int v5 = v3;
  double v6 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)v6->_clientQueue);
  id v8 = objc_claimAutoreleasedReturnValue([WeakRetained getContainerUniqueIdentifier]);
  sub_1000065CC(__p, (char *)[v8 UTF8String]);

  id v9 = operator new(0x5D8uLL);
  v9[1] = 0LL;
  v9[2] = 0LL;
  *id v9 = off_1007B66E0;
  uint64_t v10 = (uint64_t)(v9 + 3);
  unsigned int v11 = v6;
  *(void *)buf = off_1007B7EF8;
  char v70 = v11;
  unsigned int v71 = buf;
  id v12 = v11;
  v67[0] = off_1007B7F78;
  v67[1] = v12;
  char v68 = v67;
  v13 = v12;
  v65[0] = off_1007B7FF8;
  v65[1] = v13;
  __int16 v66 = v65;
  BOOL v14 = v13;
  v63[0] = off_1007B8078;
  v63[1] = v14;
  v64 = v63;
  v15 = v14;
  v61[0] = off_1007B80F8;
  v61[1] = v15;
  uint64_t v62 = v61;
  int v60 = 0LL;
  char v58 = 0LL;
  char v56 = 0LL;
  __int16 v54 = 0LL;
  cntrl = (std::__shared_weak_count *)v15->_pbLogger.__cntrl_;
  ptr = v6->_pbLogger.__ptr_;
  char v52 = cntrl;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      unint64_t v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }

  sub_10026F104( v10,  (__int128 *)__p,  (void *)a3,  (uint64_t)buf,  (uint64_t)v67,  (uint64_t)v65,  (uint64_t)v63,  (uint64_t)v61,  (uint64_t)v59,  (uint64_t)v57,  (uint64_t)v55,  (uint64_t)v53,  &ptr);
  v9[3] = &off_1007B69B0;
  v9[4] = off_1007B6A78;
  float v19 = v52;
  if (v52)
  {
    double v20 = (unint64_t *)&v52->__shared_owners_;
    do
      unint64_t v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  float v22 = v54;
  if (v54 == v53)
  {
    uint64_t v23 = 4LL;
    float v22 = v53;
  }

  else
  {
    if (!v54) {
      goto LABEL_14;
    }
    uint64_t v23 = 5LL;
  }

  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_14:
  unsigned __int8 v24 = v56;
  if (v56 == v55)
  {
    uint64_t v25 = 4LL;
    unsigned __int8 v24 = v55;
  }

  else
  {
    if (!v56) {
      goto LABEL_19;
    }
    uint64_t v25 = 5LL;
  }

  (*(void (**)(void))(*v24 + 8 * v25))();
LABEL_19:
  float v26 = v58;
  if (v58 == v57)
  {
    uint64_t v27 = 4LL;
    float v26 = v57;
  }

  else
  {
    if (!v58) {
      goto LABEL_24;
    }
    uint64_t v27 = 5LL;
  }

  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_24:
  unsigned __int16 v28 = v60;
  if (v60 == v59)
  {
    uint64_t v29 = 4LL;
    unsigned __int16 v28 = v59;
  }

  else
  {
    if (!v60) {
      goto LABEL_29;
    }
    uint64_t v29 = 5LL;
  }

  (*(void (**)(void))(*v28 + 8 * v29))();
LABEL_29:
  id v30 = v62;
  if (v62 == v61)
  {
    uint64_t v31 = 4LL;
    id v30 = v61;
  }

  else
  {
    if (!v62) {
      goto LABEL_34;
    }
    uint64_t v31 = 5LL;
  }

  (*(void (**)(void))(*v30 + 8 * v31))();
LABEL_34:
  uint64_t v32 = v64;
  if (v64 == v63)
  {
    uint64_t v33 = 4LL;
    uint64_t v32 = v63;
  }

  else
  {
    if (!v64) {
      goto LABEL_39;
    }
    uint64_t v33 = 5LL;
  }

  (*(void (**)(void))(*v32 + 8 * v33))();
LABEL_39:
  id v34 = v66;
  if (v66 == v65)
  {
    uint64_t v35 = 4LL;
    id v34 = v65;
  }

  else
  {
    if (!v66) {
      goto LABEL_44;
    }
    uint64_t v35 = 5LL;
  }

  (*(void (**)(void))(*v34 + 8 * v35))();
LABEL_44:
  v36 = v68;
  if (v68 == v67)
  {
    uint64_t v37 = 4LL;
    v36 = v67;
  }

  else
  {
    if (!v68) {
      goto LABEL_49;
    }
    uint64_t v37 = 5LL;
  }

  (*(void (**)(void))(*v36 + 8 * v37))();
LABEL_49:
  unsigned __int8 v38 = v71;
  if (v71 == buf)
  {
    uint64_t v39 = 4LL;
    unsigned __int8 v38 = buf;
  }

  else
  {
    if (!v71) {
      goto LABEL_54;
    }
    uint64_t v39 = 5LL;
  }

  (*(void (**)(void))(*(void *)v38 + 8 * v39))();
LABEL_54:
  *(void *)&__int128 v48 = v9 + 3;
  *((void *)&v48 + 1) = v9;
  sub_100012538((uint64_t)&v48, v9 + 5, v10);
  unsigned __int8 v40 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Registering for UWB service.",  buf,  2u);
  }

  int v41 = sub_10026FF14(v48);
  if (v41)
  {
    id v42 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      sub_100275DD0(v41, buf);
      sub_1003A0ED8();
    }

    void *v5 = 0LL;
    v5[1] = 0LL;
    id v43 = (std::__shared_weak_count *)*((void *)&v48 + 1);
    if (*((void *)&v48 + 1))
    {
      id v44 = (unint64_t *)(*((void *)&v48 + 1) + 8LL);
      do
        unint64_t v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
  }

  else
  {
    *(_OWORD *)unsigned int v5 = v48;
  }

  if (v50 < 0) {
    operator delete(__p[0]);
  }

  result.__cntrl_ = v47;
  result.__ptr_ = v46;
  return result;
}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequestForDiscoveryToken:(SEL)a3 nbUwbAcquisitionBandChannel:(id)a4
{
  id v200 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getNIConfiguration]);
  id v8 = [v7 copy];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getResourcesManager]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 discoveryToken]);

  v199 = (void *)v10;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003A0C14();
    }
    goto LABEL_131;
  }

  char v207 = 0;
  char v211 = 0;
  LOBYTE(v212) = 0;
  char v213 = 0;
  char v215 = 0;
  int v205 = 0;
  LOBYTE(v206) = 0;
  LODWORD(v210) = 0;
  *(_DWORD *)((char *)&v210 + 3) = 0;
  LODWORD(v214) = 0;
  *(_DWORD *)((char *)&v214 + 3) = 0;
  memset(v216, 0, sizeof(v216));
  LOBYTE(v220) = 0;
  char v221 = 0;
  unsigned __int8 v219 = 0;
  int v218 = 0;
  __int16 v223 = 0;
  int v222 = 0;
  BOOL v224 = 1;
  char v225 = 0;
  char v226 = 0;
  LOBYTE(v227) = 0;
  char v228 = 0;
  LOBYTE(v229) = 0;
  char v230 = 0;
  __int128 v231 = 0uLL;
  unsigned __int16 v208 = a5;
  char v209 = 1;
  unsigned int v11 = sub_100005150();
  unsigned __int8 v217 = sub_1003552E4((uint64_t)v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"nbTxAntenna"]);

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"nbTxAntenna"]);
      LOWORD(v205) = [v16 intValue] | 0x100;
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v17)
  {
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    float v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"nbRxAntenna"]);

    if (v19)
    {
      double v20 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"nbRxAntenna"]);
      HIWORD(v205) = [v21 intValue] | 0x100;
    }
  }

  float v22 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v22)
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"nbPacketType"]);

    if (v24)
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      float v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKey:@"nbPacketType"]);
      unsigned __int16 v206 = (unsigned __int16)[v26 intValue];
      char v207 = 1;
    }
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v27)
  {
    unsigned __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"nbBandChannel"]);

    if (v29)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"nbBandChannel"]);
      unsigned __int16 v208 = (unsigned __int16)[v31 intValue];
      char v209 = 1;
    }
  }

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v32)
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKey:@"mmsTxAntenna"]);

    if (v34)
    {
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKey:@"mmsTxAntenna"]);
      LOWORD(v210) = [v36 intValue] | 0x100;
    }
  }

  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v37)
  {
    unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:@"mmsRxAntenna"]);

    if (v39)
    {
      unsigned __int8 v40 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      int v41 = (void *)objc_claimAutoreleasedReturnValue([v40 objectForKey:@"mmsRxAntenna"]);
      WORD1(v210) = [v41 intValue] | 0x100;
    }
  }

  id v42 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v42)
  {
    id v43 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:@"mmsRxSyncAntenna"]);

    if (v44)
    {
      unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v46 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKey:@"mmsRxSyncAntenna"]);
      WORD2(v210) = [v46 intValue] | 0x100;
    }
  }

  unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v47)
  {
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKey:@"mmsPacketType"]);

    if (v49)
    {
      char v50 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      __int16 v51 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKey:@"mmsPacketType"]);
      HIWORD(v210) = (unsigned __int16)[v51 intValue];
      char v211 = 1;
    }
  }

  char v52 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v52)
  {
    int v53 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    __int16 v54 = (void *)objc_claimAutoreleasedReturnValue([v53 objectForKey:@"mmsPSR"]);

    if (v54)
    {
      char v55 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      char v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKey:@"mmsPSR"]);
      *(_WORD *)v216 = [v56 intValue] | 0x100;
    }
  }

  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v57)
  {
    char v58 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    unsigned int v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKey:@"mmsGap"]);

    if (v59)
    {
      int v60 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      float v61 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKey:@"mmsGap"]);
      *(_WORD *)&v216[2] = [v61 intValue] | 0x100;
    }
  }

  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v62)
  {
    __int16 v63 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v64 = (void *)objc_claimAutoreleasedReturnValue([v63 objectForKey:@"mmsSeqIdx"]);

    if (v64)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      __int16 v66 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKey:@"mmsSeqIdx"]);
      *(_WORD *)&v216[4] = [v66 intValue] | 0x100;
    }
  }

  v67 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v67)
  {
    char v68 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKey:@"mmsBandChannel"]);

    if (v69)
    {
      char v70 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      unsigned int v71 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKey:@"mmsBandChannel"]);
      unsigned __int16 v212 = (unsigned __int16)[v71 intValue];
      char v213 = 1;
    }
  }

  int v72 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v72)
  {
    float v73 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue([v73 objectForKey:@"nbSlotSize"]);

    if (v74)
    {
      __int16 v75 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue([v75 objectForKey:@"nbSlotSize"]);
      WORD1(v214) = [v76 intValue] | 0x100;
    }
  }

  uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v77)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    NSErrorUserInfoKey v79 = (void *)objc_claimAutoreleasedReturnValue([v78 objectForKey:@"mmsSlotSize"]);

    if (v79)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v81 = (void *)objc_claimAutoreleasedReturnValue([v80 objectForKey:@"mmsSlotSize"]);
      WORD2(v214) = [v81 intValue] | 0x100;
    }
  }

  v82 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v82)
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v84 = (void *)objc_claimAutoreleasedReturnValue([v83 objectForKey:@"mmsNumFragments"]);

    if (v84)
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v86 = (void *)objc_claimAutoreleasedReturnValue([v85 objectForKey:@"mmsNumFragments"]);
      LOWORD(v214) = [v86 intValue] | 0x100;
    }
  }

  v87 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v87)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v89 = (void *)objc_claimAutoreleasedReturnValue([v88 objectForKey:@"interval"]);

    if (v89)
    {
      v90 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v91 = (void *)objc_claimAutoreleasedReturnValue([v90 objectForKey:@"interval"]);
      HIWORD(v214) = (unsigned __int16)[v91 intValue];
      char v215 = 1;
    }
  }

  v92 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v92)
  {
    v93 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v94 = (void *)objc_claimAutoreleasedReturnValue([v93 objectForKey:@"enableNonInterlacedMMS"]);

    if (v94)
    {
      v95 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v96 = (void *)objc_claimAutoreleasedReturnValue([v95 objectForKey:@"enableNonInterlacedMMS"]);
      v216[6] = [v96 BOOLValue];
    }
  }

  v97 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v97)
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v99 = (void *)objc_claimAutoreleasedReturnValue([v98 objectForKey:@"enableAntennaDiversity"]);

    if (v99)
    {
      v100 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v101 = (void *)objc_claimAutoreleasedReturnValue([v100 objectForKey:@"enableAntennaDiversity"]);
      unsigned __int8 v217 = [v101 BOOLValue];
    }
  }

  v102 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v102)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v104 = (void *)objc_claimAutoreleasedReturnValue([v103 objectForKey:@"useDedicatedAntennas"]);

    if (v104)
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v106 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKey:@"useDedicatedAntennas"]);
      BYTE1(v218) = [v106 BOOLValue];
    }
  }

  v107 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v107)
  {
    v108 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v109 = (void *)objc_claimAutoreleasedReturnValue([v108 objectForKey:@"overrideDefaultAntenna"]);

    if (v109)
    {
      v110 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v111 = (void *)objc_claimAutoreleasedReturnValue([v110 objectForKey:@"overrideDefaultAntenna"]);
      BYTE2(v218) = [v111 BOOLValue];
    }
  }

  v112 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v112)
  {
    v113 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v114 = (void *)objc_claimAutoreleasedReturnValue([v113 objectForKey:@"useTestNbammsMode"]);

    if (v114)
    {
      v115 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v116 = (void *)objc_claimAutoreleasedReturnValue([v115 objectForKey:@"useTestNbammsMode"]);
      unsigned __int8 v219 = [v116 BOOLValue];
    }
  }

  v117 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v117)
  {
    v118 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v119 = (void *)objc_claimAutoreleasedReturnValue([v118 objectForKey:@"antennaDiversityMask"]);

    if (v119)
    {
      v120 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v121 = (void *)objc_claimAutoreleasedReturnValue([v120 objectForKey:@"antennaDiversityMask"]);
      HIBYTE(v218) = [v121 intValue];
    }
  }

  v122 = sub_100005150();
  LOBYTE(v218) = sub_1003552E4((uint64_t)v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v124 = [v123 BOOLForKey:@"DisableDualRxChain"];

  if (v124) {
    LOBYTE(v218) = 0;
  }
  BOOL useTestNbammsMode = self->_useTestNbammsMode;
  v126 = (os_log_s *)(id)qword_1008000A0;
  BOOL v127 = os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT);
  if (useTestNbammsMode)
  {
    if (v127)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v126,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Test NBAMMS mode enabled",  buf,  2u);
    }

    unsigned __int8 v219 = 1;
    uint64_t v229 = 0x1010101010101010LL;
    char v230 = 1;
    v128 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    if (v128)
    {
      v129 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v130 = (void *)objc_claimAutoreleasedReturnValue([v129 objectForKey:@"baseMacAddress"]);
      BOOL v131 = v130 == 0LL;

      if (!v131)
      {
        v132 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
        v133 = (void *)objc_claimAutoreleasedReturnValue([v132 objectForKey:@"baseMacAddress"]);

        if (v133)
        {
          uint64_t v229 = (uint64_t)[v133 longLongValue];
          char v230 = 1;
        }
      }
    }

    if (!v228) {
      char v228 = 1;
    }
    __int16 v227 = 4864;
LABEL_81:
    int v232 = 6;
    sub_100141F88((char *)&v205, !self->_isInitiator, (uint64_t)buf);
    v134 = (char *)operator new(0x1F8uLL);
    memcpy(v134, buf, 0x1F8uLL);
    unsigned __int16 v135 = -[NIServerNearbyPeerNbammsSession _getRangingTimeoutWithKey:timeoutIfNoOverride:]( self,  "_getRangingTimeoutWithKey:timeoutIfNoOverride:",  @"PeerDiscoveryTimeoutSecondsOverride",  60LL);
    unsigned __int16 v136 = -[NIServerNearbyPeerNbammsSession _getRangingTimeoutWithKey:timeoutIfNoOverride:]( self,  "_getRangingTimeoutWithKey:timeoutIfNoOverride:",  @"PeerReacquisitionTimeoutSecondsOverride",  60LL);
    unsigned __int16 v137 = -[NIServerNearbyPeerNbammsSession _getRangingTimeoutWithKey:timeoutIfNoOverride:]( self,  "_getRangingTimeoutWithKey:timeoutIfNoOverride:",  @"PeerEventWatchdogTimeoutMillisecondsOverride",  2000LL);
    v138 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v139 = [v138 BOOLForKey:@"FindingEnableSBR"];

    if (v139) {
      *((_DWORD *)v134 + 17) |= 8u;
    }
    v140 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults", v196));
    unsigned int v141 = [v140 BOOLForKey:@"FindingEnableHPXODuringSleep"];

    if (v141)
    {
      v142 = sub_100005150();
    }

    *((_WORD *)v134 + 36) = v135;
    *((_WORD *)v134 + 37) = v136;
    *((_DWORD *)v134 + 19) = -1;
    *((_WORD *)v134 + 40) = -1;
    v134[82] = 0;
    *(_WORD *)(v134 + 83) = v137;
    if (!self->_pbLogger.__ptr_) {
      goto LABEL_127;
    }
    BOOL v143 = self->_useTestNbammsMode;
    v144 = (os_log_s *)(id)qword_1008000A0;
    BOOL v145 = os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT);
    if (v143)
    {
      if (v145)
      {
        *(_WORD *)buf = 0;
        v146 = "#peer-nba,Logging test nbamms range enable command params.";
LABEL_125:
        _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, v146, buf, 2u);
      }
    }

    else if (v145)
    {
      *(_WORD *)buf = 0;
      v146 = "#peer-nba,Logging POR nbamms range enable command params.";
      goto LABEL_125;
    }

    sub_10023494C((uint64_t)self->_pbLogger.__ptr_, (unsigned __int8 *)v134 + 96);
LABEL_127:
    memcpy(retstr, v134, 0x1F8uLL);
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
    operator delete(v134);
    goto LABEL_132;
  }

  if (v127)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "#peer-nba,POR NBAMMS mode enabled", buf, 2u);
  }

  unsigned __int8 v219 = 0;
  v147 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v147)
  {
    v148 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v149 = (void *)objc_claimAutoreleasedReturnValue([v148 objectForKey:@"nbChannelSelectionMask"]);
    BOOL v150 = v149 == 0LL;

    if (!v150)
    {
      v151 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v152 = (void *)objc_claimAutoreleasedReturnValue([v151 objectForKey:@"nbChannelSelectionMask"]);
      unsigned __int16 v153 = (unsigned __int16)[v152 intValue];
      if (!v221) {
        char v221 = 1;
      }
      unsigned __int16 v220 = v153;
    }
  }

  v154 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v154)
  {
    v155 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v156 = (void *)objc_claimAutoreleasedReturnValue([v155 objectForKey:@"napSlotSize"]);
    BOOL v157 = v156 == 0LL;

    if (!v157)
    {
      v158 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v159 = (void *)objc_claimAutoreleasedReturnValue([v158 objectForKey:@"napSlotSize"]);
      unsigned __int8 v160 = [v159 intValue];
      if (!BYTE1(v222)) {
        BYTE1(v222) = 1;
      }
      LOBYTE(v222) = v160;
    }
  }

  v161 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v161)
  {
    v162 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v163 = (void *)objc_claimAutoreleasedReturnValue([v162 objectForKey:@"dataSlotSize"]);
    BOOL v164 = v163 == 0LL;

    if (!v164)
    {
      v165 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v166 = (void *)objc_claimAutoreleasedReturnValue([v165 objectForKey:@"dataSlotSize"]);
      unsigned __int8 v167 = [v166 intValue];
      if (!HIBYTE(v222)) {
        HIBYTE(v222) = 1;
      }
      BYTE2(v222) = v167;
    }
  }

  v168 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
  if (v168)
  {
    v169 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
    v170 = (void *)objc_claimAutoreleasedReturnValue([v169 objectForKey:@"useType2Addr"]);
    BOOL v171 = v170 == 0LL;

    if (!v171)
    {
      v172 = (void *)objc_claimAutoreleasedReturnValue([v8 debugParameters]);
      v173 = (void *)objc_claimAutoreleasedReturnValue([v172 objectForKey:@"useType2Addr"]);
      BOOL v224 = [v173 intValue] != 0;
    }
  }

  if (!v200) {
    __assert_rtn( "-[NIServerNearbyPeerNbammsSession _prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:]",  "NIServerNearbyPeerNbammsSession.mm",  683,  "token != nil");
  }
  v174 = (void *)objc_claimAutoreleasedReturnValue([v200 getIRK]);
  v175 = v174;
  if (!v174)
  {
    v184 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR)) {
      sub_1003A0F24();
    }

LABEL_131:
    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    goto LABEL_132;
  }

  if ([v174 length] != (id)16) {
    __assert_rtn( "-[NIServerNearbyPeerNbammsSession _prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:]",  "NIServerNearbyPeerNbammsSession.mm",  691,  "[peerIRK length] == kNbammsIRKLengthBytes");
  }
  v176 = (void *)objc_claimAutoreleasedReturnValue([v199 getIRK]);
  v177 = v176;
  if (v176)
  {
    if ([v176 length] != (id)16) {
      __assert_rtn( "-[NIServerNearbyPeerNbammsSession _prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:]",  "NIServerNearbyPeerNbammsSession.mm",  698,  "[selfIRK length] == kNbammsIRKLengthBytes");
    }
    id v178 = v177;
    id v179 = v175;
    id v197 = v178;
    if ([v178 length] == (id)16 && objc_msgSend(v179, "length") == (id)16)
    {
      v180 = [v178 bytes];
      v181 = [v179 bytes];
      v182 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      for (uint64_t i = 0LL; i != 16; ++i)
      {
        buf[0] = v181[i] ^ v180[i];
        -[NSMutableData appendBytes:length:](v182, "appendBytes:length:", buf, 1LL);
      }

      if ((id)-[NSMutableData length](v182, "length") != (id)16) {
        __assert_rtn( "generateCombinedIRK",  "NIServerNearbyPeerNbammsSession.mm",  1112,  "[xorIRK length] == kNbammsIRKLengthBytes");
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A0F7C();
      }
      v182 = 0LL;
    }

    if (v182)
    {
      v186 = v182;
      __int128 v231 = *(_OWORD *)-[NSMutableData bytes](v186, "bytes");
      v187 = v186;
      uint64_t v188 = SipHash(-[NSMutableData bytes](v187, "bytes"), &unk_100429B68, 8LL);

      uint64_t v229 = v188;
      char v230 = 1;
      unsigned int v189 = -[NIServerNearbyPeerNbammsSession _getRangingAcquisitionType](self, "_getRangingAcquisitionType");
      v190 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
      {
        id v196 = v179;
        v191 = v189 ? "BTAidedAcquisition" : "DirectAcquisition";
        sub_1000065CC(buf, v191);
        v192 = (buf[23] & 0x80u) == 0 ? buf : *(uint8_t **)buf;
        *(_DWORD *)v203 = 136315138;
        v204 = v192;
        _os_log_impl( (void *)&_mh_execute_header,  v190,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,ranging acquisition type = %s",  v203,  0xCu);
      }

      if (v189 == 1)
      {
        __int16 v193 = 4865;
        if (v228) {
          goto LABEL_150;
        }
      }

      else
      {
        if (v189)
        {
LABEL_151:

          goto LABEL_81;
        }

        __int16 v193 = 4864;
        if (v228)
        {
LABEL_150:
          __int16 v227 = v193;
          goto LABEL_151;
        }
      }

      char v228 = 1;
      goto LABEL_150;
    }

    v195 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR)) {
      sub_1003A0F50();
    }

    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  }

  else
  {
    v194 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR)) {
      sub_1003A0F24();
    }

    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  }

- (unsigned)_getRangingTimeoutWithKey:(id)a3 timeoutIfNoOverride:(unsigned __int16)a4
{
  int v4 = a4;
  id v5 = a3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v5]);

  if (v7 && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8), (objc_opt_isKindOfClass(v7, v9) & 1) != 0))
  {
    int v10 = [v7 intValue];
    unsigned int v11 = (os_log_s *)qword_1008000A0;
    BOOL v12 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
    if (v10 < 0x10000)
    {
      if (v12)
      {
        int v18 = 138412546;
        id v19 = v5;
        __int16 v20 = 1024;
        int v21 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Timeout override found for key %@. Returning %d",  (uint8_t *)&v18,  0x12u);
      }

      LOWORD(v4) = v10;
    }

    else
    {
      LOWORD(v4) = -1;
      if (v12)
      {
        int v18 = 138412802;
        id v19 = v5;
        __int16 v20 = 1024;
        int v21 = v10;
        __int16 v22 = 1024;
        int v23 = 0xFFFF;
        v13 = "#peer-nba,Timeout override found for key %@. Override value %d exceeds max value %d. Returning max value.";
        BOOL v14 = v11;
        uint32_t v15 = 24;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, v15);
      }
    }
  }

  else
  {
    uint64_t v16 = qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      id v19 = v5;
      __int16 v20 = 1024;
      int v21 = v4;
      v13 = "#peer-nba,No timeout override found for key %@. Returning timeout %d";
      BOOL v14 = (os_log_s *)v16;
      uint32_t v15 = 18;
      goto LABEL_8;
    }
  }

  return v4;
}

- (int)_getRangingTriggerType
{
  if (-[NIServerNearbyPeerNbammsSession shouldBypassBleDiscovery](self, "shouldBypassBleDiscovery")) {
    return 0;
  }
  if (self->_useTestNbammsMode) {
    sub_1003A0FA8();
  }
  return 1;
}

- (int)_getRangingAcquisitionType
{
  if (-[NIServerNearbyPeerNbammsSession shouldBypassBleDiscovery](self, "shouldBypassBleDiscovery")) {
    return 0;
  }
  if (self->_useTestNbammsMode) {
    sub_1003A0FD0();
  }
  return !-[NIServerNearbyPeerNbammsSession _doesWantTriggeredDutyCycledAcquisition]( self,  "_doesWantTriggeredDutyCycledAcquisition");
}

- (BOOL)_doesWantTriggeredDutyCycledAcquisition
{
  unsigned int v3 = -[NIServerNearbyPeerNbammsSession _getSchedulingIntervalForTriggeredDutyCycledAcquisition]( self,  "_getSchedulingIntervalForTriggeredDutyCycledAcquisition");
  -[NIServerNearbyPeerNbammsSession _getDutyCycleForTriggeredDutyCycledAcquisition]( self,  "_getDutyCycleForTriggeredDutyCycledAcquisition");
  return v4 <= 1.0 && v3 != 0;
}

- (unsigned)_getSchedulingIntervalForTriggeredDutyCycledAcquisition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getNIConfiguration]);
  id v5 = [v4 copy];

  if (self->_isInitiator) {
    int v6 = 30000;
  }
  else {
    int v6 = 29000;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v8 = [v7 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];

  if (v8) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = v6;
  }
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"FindingSchedulingInterval"]);

  if (v11)
  {
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0) {
      unsigned int v9 = [v11 intValue];
    }
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v5 debugParameters]);

  if (v14)
  {
    uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 debugParameters]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"schedulingInterval"]);

    if (v16) {
      unsigned int v9 = [v16 intValue];
    }
  }

  return v9;
}

- (float)_getDutyCycleForTriggeredDutyCycledAcquisition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  float v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getNIConfiguration]);
  id v5 = [v4 copy];

  if (self->_isInitiator) {
    float v6 = 0.0;
  }
  else {
    float v6 = 0.1034;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v8 = [v7 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];

  if (v8) {
    float v6 = 0.0;
  }
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"FindingDutyCycle"]);

  if (v10)
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    {
      [v10 floatValue];
      float v6 = v13;
    }
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v5 debugParameters]);

  if (v14)
  {
    uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue([v5 debugParameters]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"dutyCycle"]);

    if (v16)
    {
      [v16 floatValue];
      float v6 = v17;
    }
  }

  return v6;
}

- (float)_adjustDutyCycleForInterfaceDelays:(float)a3 schedulingInterval:(unsigned int)a4
{
  float v5 = (float)((unint64_t)(a4 - 17000) - 2000);
  if ((float)((float)a4 * a3) > v5)
  {
    float v6 = (os_log_s *)qword_1008000A0;
    a3 = v5 / (float)a4;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,Provided duty cycle leads to scan window > scheduling interval - (start time offset + interface delays), using entire available scan window",  v8,  2u);
    }
  }

  return a3;
}

- (optional<unsigned)_getDitherConst
{
  if (self->_isInitiator)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v4 = [v3 BOOLForKey:@"FindingDisableDitheredAcq"];

    if (v4)
    {
      float v5 = (os_log_s *)qword_1008000A0;
      BOOL v6 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
      __int16 v7 = 0;
      unsigned __int8 v8 = 0;
      if (v6)
      {
        __int16 v23 = 0;
        unsigned int v9 = "#peer-nba,Dithered duty cycled acquisition is disabled using defaults write";
        int v10 = (uint8_t *)&v23;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
        __int16 v7 = 0;
        unsigned __int8 v8 = 0;
      }
    }

    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      float v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getNIConfiguration]);
      id v14 = [v13 copy];

      uint32_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"FindingDitherConst"]);

      if (v16 && (uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber, v17), (objc_opt_isKindOfClass(v16, v18) & 1) != 0)) {
        unsigned __int8 v8 = [v16 intValue];
      }
      else {
        unsigned __int8 v8 = 10;
      }
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 debugParameters]);

      if (v19)
      {
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v14 debugParameters]);
        int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"ditherConst"]);

        if (v21) {
          unsigned __int8 v8 = [v21 intValue];
        }
      }

      __int16 v7 = 1;
    }
  }

  else
  {
    float v5 = (os_log_s *)qword_1008000A0;
    BOOL v11 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
    __int16 v7 = 0;
    unsigned __int8 v8 = 0;
    if (v11)
    {
      *(_WORD *)buf = 0;
      unsigned int v9 = "#peer-nba,Dithered duty cycled acquisition not valid for responder";
      int v10 = buf;
      goto LABEL_7;
    }
  }

  return (optional<unsigned char>)(v8 | (unsigned __int16)(v7 << 8));
}

- (optional<SecondarySchedulingParameters>)_getSecondarySchedulingParameters
{
  if (self->_isInitiator)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_1003A0FF8();
    }
    unsigned int v4 = 0LL;
    LOBYTE(v5) = 0;
    unsigned int v6 = 0;
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained getNIConfiguration]);
    id v10 = [v9 copy];

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned __int8 v12 = [v11 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];

    if ((v12 & 1) != 0)
    {
      unsigned int v4 = 0LL;
      LOBYTE(v5) = 0;
      unsigned int v6 = 0;
    }

    else
    {
      float v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"FindingSecondarySchedulingDelay"]);

      v49 = v14;
      if (v14 && (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber, v15), (objc_opt_isKindOfClass(v14, v16) & 1) != 0))
      {
        unsigned int v17 = objc_msgSend(v14, "intValue", v14);
        int v18 = 1;
      }

      else
      {
        unsigned int v17 = 0;
        int v18 = 0;
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "debugParameters", v49));

      if (v19)
      {
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v10 debugParameters]);
        int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"secondarySchedulingDelay"]);

        if (v21)
        {
          unsigned int v17 = [v21 intValue];
          int v18 = 1;
        }
      }

      if (v17) {
        BOOL v22 = v18 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (v22) {
        int v5 = 30000000;
      }
      else {
        int v5 = v17;
      }
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"FindingSecondarySchedulingInterval"]);

      if (v24 && (uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSNumber, v25), (objc_opt_isKindOfClass(v24, v26) & 1) != 0))
      {
        LODWORD(v2) = [v24 intValue];
        int v27 = 1;
      }

      else
      {
        LODWORD(v2) = 0;
        int v27 = 0;
      }

      unsigned __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v10 debugParameters]);

      if (v28)
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v10 debugParameters]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKey:@"secondarySchedulingInterval"]);

        if (v30)
        {
          LODWORD(v2) = [v30 intValue];
          int v27 = 1;
        }
      }

      if ((_DWORD)v2) {
        BOOL v31 = v27 == 0;
      }
      else {
        BOOL v31 = 1;
      }
      if (v31) {
        uint64_t v2 = 59000LL;
      }
      else {
        uint64_t v2 = v2;
      }
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:@"FindingSecondaryDutyCycle"]);

      float v35 = 0.0;
      if (v33)
      {
        uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSNumber, v34);
        if ((objc_opt_isKindOfClass(v33, v36) & 1) != 0)
        {
          [v33 floatValue];
          float v35 = v37;
          int v38 = 1;
        }

        else
        {
          int v38 = 0;
        }
      }

      else
      {
        int v38 = 0;
      }

      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v10 debugParameters]);

      if (v39)
      {
        int v41 = (void *)objc_claimAutoreleasedReturnValue([v10 debugParameters]);
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKey:@"secondaryDutyCycle"]);

        if (v42)
        {
          [v42 floatValue];
          float v35 = v43;
          int v38 = 1;
        }
      }

      BOOL v45 = v35 > 1.0 || v35 <= 0.0 || v38 == 0;
      LODWORD(v40) = 1028658089;
      if (!v45) {
        *(float *)&double v40 = v35;
      }
      -[NIServerNearbyPeerNbammsSession _adjustDutyCycleForInterfaceDelays:schedulingInterval:]( self,  "_adjustDutyCycleForInterfaceDelays:schedulingInterval:",  v2,  v40);
      unsigned int v3 = v46;
      unsigned int v6 = v5 & 0xFFFFFF00;

      unsigned int v4 = &_mh_execute_header;
    }
  }

  unint64_t v47 = v6 & 0xFFFFFF00 | v5 | (unint64_t)(v2 << 32);
  unint64_t v48 = (unint64_t)v4 & (unint64_t)&_mh_execute_header | v3;
  *(void *)&result.var0.var1.unsigned int var2 = v48;
  *(void *)&result.var0.var0 = v47;
  return result;
}

- (unsigned)_getNbUwbAcquisitionBandChannel:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (self->_useTestNbammsMode)
  {
    unsigned __int8 v6 = 5;
  }

  else
  {
    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectInRawTokenOPACKDictForKey:&off_1007D25B0]);

    if (v7)
    {
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectInRawTokenOPACKDictForKey:&off_1007D25B0]);
      unsigned __int8 v6 = [v8 integerValue];
    }

    else
    {
      unsigned int v9 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_1003A1024(v9);
      }
      unsigned __int8 v6 = 2;
    }
  }

  if (self->_useTestNbammsMode) {
    char v10 = 1;
  }
  else {
    char v10 = 6;
  }
  LOBYTE(v16) = v10;
  *(_WORD *)((char *)&v16 + 1) = 0;
  LOWORD(v17) = v6;
  BYTE2(v17) = 1;
  int v11 = sub_10032BD2C((unsigned __int8 *)&v16);
  unsigned __int8 v12 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    BOOL useTestNbammsMode = self->_useTestNbammsMode;
    BOOL isInitiator = self->_isInitiator;
    int v16 = 67109888;
    int v17 = useTestNbammsMode;
    __int16 v18 = 1024;
    BOOL v19 = isInitiator;
    __int16 v20 = 1024;
    int v21 = v6;
    __int16 v22 = 1024;
    int v23 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#peer-nba,startRangingWithPeer: testMode: %d, isInitiator: %d, NapChIdx: %d, NapBch: %d",  (uint8_t *)&v16,  0x1Au);
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end