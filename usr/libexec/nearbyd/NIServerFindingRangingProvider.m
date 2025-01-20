@interface NIServerFindingRangingProvider
- (BOOL)_doesWantTriggeredDutyCycledAcquisition;
- (BOOL)canRangeWithPeer:(id)a3 technology:(int)a4;
- (NIServerFindingRangingProvider)initWithIdentifier:(const void *)a3 isFinder:(BOOL)a4 consumer:(id)a5 queue:(id)a6 pbLogger:(shared_ptr<rose::protobuf::Logger>)a7;
- (NSArray)rangingPeers;
- (float)_adjustDutyCycleForInterfaceDelays:(float)a3 schedulingInterval:(unsigned int)a4;
- (float)_getDutyCycleForTriggeredDutyCycledAcquisition;
- (id).cxx_construct;
- (id)_getDefaultNbammsRangingConfigParameters;
- (id)_triggerRanging:(RoseServiceRequest *)a3 peerDiscoveryToken:(id)a4 technology:(int)a5 sharedProtocol:(int)a6;
- (id)clientQueue;
- (id)printableState;
- (id)startRangingWithPeer:(id)a3 technology:(int)a4 peerAdvertisement:(id)a5 OOBRangingParameters:(const OOBRangingParameters *)a6;
- (id)stopRangingWithPeer:(id)a3;
- (int)rangingAcquisitionType;
- (int)rangingTriggerType;
- (optional<SecondarySchedulingParameters>)_getFindingSecondarySchedulingParameters;
- (optional<rose::RoseServiceRequest>)_prepareNbammsServiceRequestForDiscoveryToken:(SEL)a3 technology:(id)a4 useCase:(int)a5 nbMask:(int)a6 nbUwbAcquisitionBandChannel:(unsigned __int8)a7 mmsSlotSizeMsec:(unsigned __int16)a8;
- (optional<rose::RoseServiceRequest>)_prepareServiceRequestForDiscoveryToken:(SEL)a3 technology:(id)a4 useCase:(int)a5 nbMask:(int)a6 nbUwbAcquisitionBandChannel:(unsigned __int8)a7 mmsSlotSizeMsec:(unsigned __int16)a8;
- (optional<unsigned)_getDitherConst;
- (unint64_t)_macAddressForIRK:(id)a3;
- (unsigned)_getSchedulingIntervalForTriggeredDutyCycledAcquisition;
- (vector<rose::finding::Technology,)supportedTechnologies;
- (void)_assignDebugParametersIfAvailable:(id)a3;
- (void)_resetRangingStateForToken:(id)a3;
- (void)_sendHangup:(BOOL)a3 finderGone:(BOOL)a4 findeeGone:(BOOL)a5 token:(id)a6;
- (void)_setInitiator;
- (void)activate;
- (void)dealloc;
- (void)didFailCryptoWithToken:(id)a3;
- (void)didFailMutualAuthWithToken:(id)a3;
- (void)didInvalidateNbammsSessionWithReason:(int)a3 token:(id)a4;
- (void)didReceiveNbammsPeerAlgorithmAidingData:(const void *)a3 signallingData:(const void *)a4 token:(id)a5;
- (void)didReceiveNbammsSessionStatusUpdate:(const ServiceRequestStatusUpdate *)a3 token:(id)a4;
- (void)didReceiveNewNbammsSolution:(const void *)a3 token:(id)a4;
- (void)didReceiveUnsuccessfulNbammsSolution:(const void *)a3 token:(id)a4;
- (void)invalidate;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
- (void)setAlgorithmAidingData:(const void *)a3 forPeer:(id)a4;
- (void)setDebugParameters:(id)a3;
- (void)setSignallingData:(const void *)a3 forPeer:(id)a4;
@end

@implementation NIServerFindingRangingProvider

- (NIServerFindingRangingProvider)initWithIdentifier:(const void *)a3 isFinder:(BOOL)a4 consumer:(id)a5 queue:(id)a6 pbLogger:(shared_ptr<rose::protobuf::Logger>)a7
{
  ptr = (uint64_t *)a7.__ptr_;
  BOOL v9 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12) {
    __assert_rtn( "-[NIServerFindingRangingProvider initWithIdentifier:isFinder:consumer:queue:pbLogger:]",  "NIServerFindingRanging.mm",  3368,  "consumer");
  }
  v14 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = sub_100277A54(v9);
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] init", buf, 0xCu);
  }

  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___NIServerFindingRangingProvider;
  v15 = -[NIServerFindingRangingProvider init](&v31, "init");
  v16 = (id *)v15;
  v17 = (NIServerFindingRangingProvider *)v15;
  if (v15)
  {
    std::string::operator=((std::string *)(v15 + 8), (const std::string *)a3);
    LOBYTE(v17->_identifier.__r_.var0) = v9;
    BYTE1(v17->_identifier.__r_.var0) = 0;
    objc_storeWeak(v16 + 5, v12);
    objc_storeStrong(v16 + 6, a6);
    sub_100018E60(v16 + 7, ptr);
    LOBYTE(v17->_pbLogger.__ptr_) = 0;
    v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    v19 = v17->_uwbSystemListener.__ptr_;
    v17->_uwbSystemListener.__ptr_ = (PRRangingManagerClient *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v21 = [v20 BOOLForKey:@"UseTestNbammsMode"];

    v22 = (os_log_s *)qword_1008000A0;
    BOOL v23 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#find-range,Using Test Nbamms MAC mode",  buf,  2u);
      }

      char v24 = 1;
    }

    else
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#find-range,Using POR Nbamms MAC mode",  buf,  2u);
      }

      char v24 = 0;
    }

    LOBYTE(v17->_uwbSystemListener.__cntrl_) = v24;
    -[NIServerFindingRangingProvider _setInitiator](v17, "_setInitiator");
    v25 = sub_100005150();
    if (sub_1003552C4((uint64_t)v25))
    {
      uint64_t v26 = objc_claimAutoreleasedReturnValue( -[NIServerFindingRangingProvider _getDefaultNbammsRangingConfigParameters]( v17,  "_getDefaultNbammsRangingConfigParameters"));
      v27 = v17->_uwbSystemListener.__ptr_;
      v17->_uwbSystemListener.__ptr_ = (PRRangingManagerClient *)v26;
    }

    v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    debugParameters = v17->_debugParameters;
    v17->_debugParameters = &v28->super;
  }

  return v17;
}

- (void)activate
{
  uint64_t v26 = self;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!LOBYTE(self->_pbLogger.__ptr_))
  {
    v3 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-range,[%s] activate", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    if ((objc_opt_respondsToSelector(WeakRetained, "rangingBecameAvailable") & 1) != 0
      && (objc_opt_respondsToSelector(WeakRetained, "rangingBecameUnavailable") & 1) != 0)
    {
      v6 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#find-range,Consumer is listening for ranging availability",  buf,  2u);
      }

      sub_1001FD5B4(&v26, buf);
      sub_10000EE54((uint64_t)&v26->_pbLogger.__cntrl_, (__int128 *)buf);
      v7 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8])
      {
        v8 = (unint64_t *)(*(void *)&buf[8] + 8LL);
        do
          unint64_t v9 = __ldaxr(v8);
        while (__stlxr(v9 - 1, v8));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }

      v10 = sub_100288340();
      v11 = *(std::__shared_weak_count **)&v26->_activated;
      cntrl = v26->_pbLogger.__cntrl_;
      v25 = v11;
      if (v11)
      {
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          unint64_t v13 = __ldxr(p_shared_owners);
        while (__stxr(v13 + 1, p_shared_owners));
      }

      sub_10028CA60((uint64_t)v10, (unint64_t *)&cntrl);
      v14 = v25;
      if (v25)
      {
        v15 = (unint64_t *)&v25->__shared_owners_;
        do
          unint64_t v16 = __ldaxr(v15);
        while (__stlxr(v16 - 1, v15));
        if (!v16)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }

      v17 = sub_100288340();
      v18 = *(std::__shared_weak_count **)&v26->_activated;
      v22 = v26->_pbLogger.__cntrl_;
      BOOL v23 = v18;
      if (v18)
      {
        p_shared_weak_owners = (unint64_t *)&v18->__shared_weak_owners_;
        do
          unint64_t v20 = __ldxr(p_shared_weak_owners);
        while (__stxr(v20 + 1, p_shared_weak_owners));
      }

      sub_1002889DC((uint64_t)v17, (uint64_t *)&v22);
      if (v23) {
        std::__shared_weak_count::__release_weak(v23);
      }
    }

    else if ((objc_opt_respondsToSelector(WeakRetained, "rangingBecameAvailable") & 1) != 0 {
           || (objc_opt_respondsToSelector(WeakRetained, "rangingBecameUnavailable") & 1) != 0)
    }
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_10039DD30();
      }
    }

    else
    {
      unsigned int v21 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "#find-range,Consumer is NOT listening for ranging availability",  buf,  2u);
      }
    }

    LOBYTE(v26->_pbLogger.__ptr_) = 1;
  }

- (void)invalidate
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#find-range,invalidate", buf, 2u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_debugParameters, "allKeys"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v19 + 1) + 8LL * (void)v8);
        -[NIServerFindingRangingProvider _sendHangup:finderGone:findeeGone:token:]( self,  "_sendHangup:finderGone:findeeGone:token:",  1LL);
        -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v9);

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v6);
  }

  if (self->_pbLogger.__cntrl_)
  {
    v10 = sub_100288340();
    v11 = *(std::__shared_weak_count **)&self->_activated;
    cntrl = self->_pbLogger.__cntrl_;
    v18 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        unint64_t v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }

    sub_10028CB38((uint64_t)v10, (unint64_t *)&cntrl);
    v14 = v18;
    if (v18)
    {
      v15 = (unint64_t *)&v18->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }

    sub_10015D394(&self->_pbLogger.__cntrl_);
  }

  LOBYTE(self->_pbLogger.__ptr_) = 0;
}

- (void)dealloc
{
  p_cntrl = &self->_pbLogger.__cntrl_;
  if (self->_pbLogger.__cntrl_)
  {
    v4 = sub_100288340();
    id v5 = *(std::__shared_weak_count **)&self->_activated;
    cntrl = self->_pbLogger.__cntrl_;
    unint64_t v13 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        unint64_t v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }

    sub_10028CB38((uint64_t)v4, (unint64_t *)&cntrl);
    v8 = v13;
    if (v13)
    {
      id v9 = (unint64_t *)&v13->__shared_owners_;
      do
        unint64_t v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }

    sub_10015D394(p_cntrl);
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NIServerFindingRangingProvider;
  -[NIServerFindingRangingProvider dealloc](&v11, "dealloc");
}

- (BOOL)canRangeWithPeer:(id)a3 technology:(int)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v6) {
    __assert_rtn( "-[NIServerFindingRangingProvider canRangeWithPeer:technology:]",  "NIServerFindingRanging.mm",  3468,  "token");
  }
  if (!LOBYTE(self->_pbLogger.__ptr_)) {
    goto LABEL_16;
  }
  if (a4 != 1)
  {
    unint64_t v13 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      int v21 = 136315138;
      __int128 v22 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#find-range,[%s] Do not support UWB only based finding",  (uint8_t *)&v21,  0xCu);
    }

    goto LABEL_16;
  }

  unint64_t v7 = sub_100005150();
  BOOL v8 = sub_1003552C4((uint64_t)v7);
  id v9 = (void **)sub_100288340();
  uint64_t v10 = (*(unsigned int (**)(void *))(*v9[808] + 72LL))(v9[808]);
  if (v10 != 1 || !v8)
  {
    v15 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v16 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
      int v21 = 136315650;
      __int128 v22 = v16;
      __int16 v23 = 1024;
      BOOL v24 = v8;
      __int16 v25 = 1024;
      BOOL v26 = v10 == 1;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#find-range,[%s] Can't range yet, UWB system not ready. Supports NMI: %d, state: %d",  (uint8_t *)&v21,  0x18u);
    }

LABEL_16:
    BOOL v12 = 0;
    goto LABEL_17;
  }

  if (-[NSDictionary count](self->_debugParameters, "count") >= 2)
  {
    if (!LOBYTE(self->_identifier.__r_.var0))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));

      if (!v18)
      {
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingNBAMMSSessionManager sharedInstance]( &OBJC_CLASS___NIServerFindingNBAMMSSessionManager,  "sharedInstance"));
        [v19 logUnservableRangingRequestWithToken:v6 isFinder:LOBYTE(self->_identifier.__r_.var0)];
      }
    }

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));
    BOOL v12 = v20 != 0LL;
  }

  else
  {
    BOOL v12 = 1;
  }

- (id)startRangingWithPeer:(id)a3 technology:(int)a4 peerAdvertisement:(id)a5 OOBRangingParameters:(const OOBRangingParameters *)a6
{
  id v10 = a3;
  id v11 = a5;
  BOOL v12 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v13 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
    *(_DWORD *)buf = 136315651;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&uint8_t buf[24] = sub_100278458(a4);
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#find-range,[%s] startRangingWithPeer: %{private}@. Technology: %s",  buf,  0x20u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v10) {
    __assert_rtn( "-[NIServerFindingRangingProvider startRangingWithPeer:technology:peerAdvertisement:OOBRangingParameters:]",  "NIServerFindingRanging.mm",  3507,  "token");
  }
  if (!LOBYTE(self->_pbLogger.__ptr_))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039DD68();
    }
    NSErrorUserInfoKey v49 = NSLocalizedFailureReasonErrorKey;
    v50 = @"Ranging not activated";
    BOOL v26 = (NIServerFindingRangingProviderPeerInfo *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v26));
    goto LABEL_14;
  }

  if (a4 != 1)
  {
    NSErrorUserInfoKey v47 = NSLocalizedFailureReasonErrorKey;
    v48 = @"Specified technology not supported";
    BOOL v26 = (NIServerFindingRangingProviderPeerInfo *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v26));
LABEL_14:
    v28 = (void *)v27;
    goto LABEL_15;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
  BOOL v15 = v14 == 0LL;

  if (v15)
  {
    BOOL v26 = -[NIServerFindingRangingProviderPeerInfo initWithAdvertisement:]( objc_alloc(&OBJC_CLASS___NIServerFindingRangingProviderPeerInfo),  "initWithAdvertisement:",  v11);
    -[NSDictionary setObject:forKey:](self->_debugParameters, "setObject:forKey:", v26, v10);
    if (LOBYTE(self->_uwbSystemListener.__cntrl_))
    {
      uint64_t var1 = 0LL;
      int var0 = 5;
    }

    else if ((sub_100278598() & 1) != 0)
    {
      uint64_t var1 = 1LL;
      int var0 = 2;
    }

    else
    {
      int var0 = a6->var0;
      uint64_t var1 = a6->var1;
    }

    if (LOBYTE(self->_uwbSystemListener.__cntrl_)) {
      uint8_t v33 = 1;
    }
    else {
      uint8_t v33 = 6;
    }
    buf[0] = v33;
    *(_WORD *)&buf[1] = 0;
    *(_WORD *)&uint8_t buf[4] = var0;
    buf[6] = 1;
    unsigned int v42 = sub_10032BD2C(buf);
    unsigned int v34 = [v11 protocolVersion];
    v35 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v41 = var1;
      int var0_low = LOBYTE(self->_identifier.__r_.var0);
      unsigned int v37 = [v11 protocolVersion];
      *(_DWORD *)buf = 67110400;
      *(_DWORD *)&uint8_t buf[4] = var0_low;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = var0;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v42;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = 1;
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v37;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v34 != 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "#find-range,startRangingWithPeer: isFinder = %d, NapChIdx = %d, NapBch = %d, selfProtoVer: %d, peerProtoVer: %d, sharedProtoVer: %d",  buf,  0x26u);
      uint64_t var1 = v41;
    }

    id v38 = [v11 useCase];
    if (v34) {
      uint64_t v39 = 30LL;
    }
    else {
      uint64_t v39 = 49LL;
    }
    -[NIServerFindingRangingProvider _prepareServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:]( self,  "_prepareServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:",  v10,  1LL,  v38,  var1,  v42,  v39);
    if (!buf[504])
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039DD94();
      }
      NSErrorUserInfoKey v44 = NSLocalizedFailureReasonErrorKey;
      v45 = @"Could not build ranging service request";
      v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v40));

      goto LABEL_15;
    }

    memcpy(__dst, buf, sizeof(__dst));
    uint64_t v27 = objc_claimAutoreleasedReturnValue( -[NIServerFindingRangingProvider _triggerRanging:peerDiscoveryToken:technology:sharedProtocol:]( self,  "_triggerRanging:peerDiscoveryToken:technology:sharedProtocol:",  __dst,  v10,  1LL,  v34 != 0));
    goto LABEL_14;
  }

  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 advertisement]);
  unsigned __int8 v18 = [v17 isEqual:v11];

  if ((v18 & 1) != 0) {
    goto LABEL_24;
  }
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
  if (v19)
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v11 uniqueIdentifier]);
    int v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 advertisement]);
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueIdentifier]);
    unsigned int v24 = [v20 isEqualToData:v23];

    int v25 = v24 ^ 1;
  }

  else
  {
    int v25 = 0;
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
  [v32 setAdvertisement:v11];

  if (!v25)
  {
LABEL_24:
    v28 = 0LL;
    goto LABEL_16;
  }

  BOOL v26 = (NIServerFindingRangingProviderPeerInfo *)objc_claimAutoreleasedReturnValue( +[NIServerFindingNBAMMSSessionManager sharedInstance]( &OBJC_CLASS___NIServerFindingNBAMMSSessionManager,  "sharedInstance"));
  -[NIServerFindingRangingProviderPeerInfo refreshRangingForToken:](v26, "refreshRangingForToken:", v10);
  v28 = 0LL;
LABEL_15:

LABEL_16:
  return v28;
}

- (id)stopRangingWithPeer:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
    *(_DWORD *)buf = 136315395;
    v17 = v6;
    __int16 v18 = 2113;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-range,[%s] stopRangingWithPeer: %{private}@.",  buf,  0x16u);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (!v4) {
    __assert_rtn("-[NIServerFindingRangingProvider stopRangingWithPeer:]", "NIServerFindingRanging.mm", 3604, "token");
  }
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v4));
    BOOL v8 = v7 == 0LL;

    if (!v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v4));
      BOOL v10 = v9 == 0LL;

      if (!v10)
      {
        -[NIServerFindingRangingProvider _sendHangup:finderGone:findeeGone:token:]( self,  "_sendHangup:finderGone:findeeGone:token:",  1LL);
        -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v4);
      }
    }

    id v11 = 0LL;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039DDC0();
    }
    NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
    BOOL v15 = @"Ranging not activated";
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v12));
  }

  return v11;
}

- (void)setAlgorithmAidingData:(const void *)a3 forPeer:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));

    if (v7)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));
      [v8 setAlgorithmAidingData:a3];

      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingNBAMMSSessionManager sharedInstance]( &OBJC_CLASS___NIServerFindingNBAMMSSessionManager,  "sharedInstance"));
      [v9 updateAlgorithmAidingData:a3 token:v6];
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_10039DE18();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039DDEC();
  }
}

- (void)setSignallingData:(const void *)a3 forPeer:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));

    if (v7)
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v6));
      [v8 setSignallingData:a3];

      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingNBAMMSSessionManager sharedInstance]( &OBJC_CLASS___NIServerFindingNBAMMSSessionManager,  "sharedInstance"));
      [v9 updateSignallingData:a3 token:v6];
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_10039DE70();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039DE44();
  }
}

- (void)_resetRangingStateForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 descriptionInternal]);
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-range,Reset ranging state for token %@",  (uint8_t *)&v8,  0xCu);
    }

    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingNBAMMSSessionManager sharedInstance]( &OBJC_CLASS___NIServerFindingNBAMMSSessionManager,  "sharedInstance"));
    [v7 unregisterNBAMMSSessionForToken:v4];

    -[NSDictionary removeObjectForKey:](self->_debugParameters, "removeObjectForKey:", v4);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039DE9C();
  }
}

- (void)_sendHangup:(BOOL)a3 finderGone:(BOOL)a4 findeeGone:(BOOL)a5 token:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v12 = [v11 BOOLForKey:@"FindingDisableHangup"];

  if (!v12)
  {
    if (!v8 && !v7 && !v6) {
      goto LABEL_25;
    }
    NSErrorUserInfoKey v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));

    if (!v14)
    {
LABEL_24:
      *(void *)buf = 250000000LL;
      std::this_thread::sleep_for ((const std::chrono::nanoseconds *)buf);
      goto LABEL_25;
    }

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
    *(void *)buf = [v15 getSignallingData];
    __int16 v25 = v16;
    char v26 = v17;
    if ((v16 & 0xFF00) == 0)
    {
      __int16 v18 = sub_100005150();
      BOOL v19 = sub_100320824(v18[144]);
      *(void *)buf = 0LL;
      LOBYTE(v25) = v19;
      HIBYTE(v25) = 1;
    }

    if (v8)
    {
      __int128 v20 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#find-range,Setting hangup bit", v23, 2u);
      }

      *(_WORD *)buf = 257;
      if (!v7)
      {
LABEL_12:
        if (!v6)
        {
LABEL_23:
          -[NIServerFindingRangingProvider setSignallingData:forPeer:](self, "setSignallingData:forPeer:", buf, v10);

          goto LABEL_24;
        }

- (vector<rose::finding::Technology,)supportedTechnologies
{
  retstr->__begin_ = 0LL;
  retstr->__end_ = 0LL;
  retstr->__end_cap_.__value_ = 0LL;
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    BOOL v6 = sub_100005150();
    result = (vector<rose::finding::Technology, std::allocator<rose::finding::Technology>> *)sub_1003552C4((uint64_t)v6);
    if ((_DWORD)result)
    {
      BOOL v7 = (int *)sub_100031724((uint64_t)&retstr->__end_cap_, 1uLL);
      result = (vector<rose::finding::Technology, std::allocator<rose::finding::Technology>> *)retstr->__begin_;
      end = retstr->__end_;
      id v10 = &v7[v9];
      int *v7 = 1;
      id v11 = v7 + 1;
      while (end != (int *)result)
      {
        int v12 = *--end;
        *--BOOL v7 = v12;
      }

      retstr->__begin_ = v7;
      retstr->__end_ = v11;
      retstr->__end_cap_.__value_ = v10;
      if (result) {
        operator delete(result);
      }
      retstr->__end_ = v11;
    }
  }

  return result;
}

- (NSArray)rangingPeers
{
  if (LOBYTE(self->_pbLogger.__ptr_)) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_debugParameters, "allKeys"));
  }
  else {
    v3 = 0LL;
  }
  return (NSArray *)v3;
}

- (void)setDebugParameters:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"useTestNbammsMode"]);

    if (v6)
    {
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"useTestNbammsMode"]);
      LOBYTE(self->_uwbSystemListener.__cntrl_) = [v7 BOOLValue];

      BOOL v8 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        if (LOBYTE(self->_uwbSystemListener.__cntrl_)) {
          uint64_t v9 = "Y";
        }
        else {
          uint64_t v9 = "N";
        }
        int v11 = 136315138;
        int v12 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#find-range,Overriding value in _useTestNbammsMode with value provided by client = %s",  (uint8_t *)&v11,  0xCu);
      }

      -[NIServerFindingRangingProvider _setInitiator](self, "_setInitiator");
    }

    -[NIServerFindingRangingProvider _assignDebugParametersIfAvailable:](self, "_assignDebugParametersIfAvailable:", v5);
    id v10 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#find-range,Set debug config params",  (uint8_t *)&v11,  2u);
    }
  }
}

- (int)rangingTriggerType
{
  return sub_100278598() ^ 1;
}

- (int)rangingAcquisitionType
{
  if ((sub_100278598() & 1) != 0) {
    return 0;
  }
  else {
    return !-[NIServerFindingRangingProvider _doesWantTriggeredDutyCycledAcquisition]( self,  "_doesWantTriggeredDutyCycledAcquisition");
  }
}

- (id)printableState
{
  uint64_t v80 = 0LL;
  v81 = &v80;
  uint64_t v82 = 0x3032000000LL;
  v83 = sub_1001F3BE0;
  v84 = sub_1001F3BF0;
  v85 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v2 = (void *)v81[5];
  v3 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
  uint64_t ptr_low = LOBYTE(self->_pbLogger.__ptr_);
  uint64_t v5 = BYTE1(self->_identifier.__r_.var0);
  uint64_t cntrl_low = LOBYTE(self->_uwbSystemListener.__cntrl_);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Ranging provider (%s). Activated: %d. Initiator: %d. Test-NBAMMS: %d. FC3: %d",  v3,  ptr_low,  v5,  cntrl_low,  [v7 BOOLForKey:@"FindingUseFC3"]));
  [v2 addObject:v8];

  uint64_t v9 = (void *)v81[5];
  uint64_t v10 = -[NIServerFindingRangingProvider rangingTriggerType](self, "rangingTriggerType");
  uint64_t v11 = -[NIServerFindingRangingProvider rangingAcquisitionType](self, "rangingAcquisitionType");
  BOOL v12 = -[NIServerFindingRangingProvider _doesWantTriggeredDutyCycledAcquisition]( self,  "_doesWantTriggeredDutyCycledAcquisition");
  uint64_t v13 = -[NIServerFindingRangingProvider _getSchedulingIntervalForTriggeredDutyCycledAcquisition]( self,  "_getSchedulingIntervalForTriggeredDutyCycledAcquisition");
  -[NIServerFindingRangingProvider _getDutyCycleForTriggeredDutyCycledAcquisition]( self,  "_getDutyCycleForTriggeredDutyCycledAcquisition");
  float v15 = v14;
  if ((unsigned __int16)-[NIServerFindingRangingProvider _getDitherConst](self, "_getDitherConst") >= 0x100u)
  {
    unsigned __int16 v17 = (unsigned __int16)-[NIServerFindingRangingProvider _getDitherConst](self, "_getDitherConst");
    if (v17 <= 0xFFu) {
      sub_100006080();
    }
    uint64_t v16 = v17;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Trigger type: %d. Acquisition type: %d. Duty cycle: wants %d, interval %d us, listening %0.1f%%, ditherConst: %d",  v10,  v11,  v12,  v13,  v15,  v16));
  [v9 addObject:v18];

  BOOL v19 = (void *)v81[5];
  LODWORD(v18) = sub_100277944(@"FindingUWBTotalTimeoutSecondsOverride", 0x708u);
  __int128 v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Ranging watchdogs: total %d s, event %d ms",  v18,  sub_100277944(@"FindingUWBEventWatchdogTimeoutMillisecondsOverride", 0x7D0u));
  int v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v19 addObject:v21];

  __int128 v22 = (void *)v81[5];
  BOOL v23 = self->_pbLogger.__cntrl_ != 0LL;
  unsigned int v24 = (void **)sub_100288340();
  int v25 = (*(uint64_t (**)(void *))(*v24[808] + 72LL))(v24[808]);
  char v26 = v63;
  sub_1000065CC(v63, off_1007B6D48[v25]);
  if (SBYTE7(v64) < 0) {
    char v26 = (void **)v63[0];
  }
  uint64_t v27 = (void **)sub_100288340();
  uint64_t v28 = (*(uint64_t (**)(void *))(*v27[808] + 72LL))(v27[808]);
  sub_1000065CC(&__p, off_1007B6D70[v28 >> 32]);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    System listener: %d. State: %s. Cause: %s",  v23,  v26,  p_p));
  [v22 addObject:v30];

  if (SBYTE7(v64) < 0) {
    operator delete(v63[0]);
  }
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  obj = self->_debugParameters;
  id v58 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v75,  v86,  16LL);
  if (v58)
  {
    uint64_t v56 = *(void *)v76;
    do
    {
      for (i = 0LL; i != v58; i = (char *)i + 1)
      {
        if (*(void *)v76 != v56) {
          objc_enumerationMutation(obj);
        }
        id v32 = *(id *)(*((void *)&v75 + 1) + 8LL * (void)i);
        uint8_t v33 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_debugParameters,  "objectForKeyedSubscript:",  v32));
        unsigned int v34 = v33;
        if (v33)
        {
          [v33 getAlgorithmAidingData];
        }

        else
        {
          uint64_t v74 = 0LL;
          __int128 v72 = 0u;
          __int128 v73 = 0u;
          __int128 v70 = 0u;
          __int128 v71 = 0u;
          __int128 v68 = 0u;
          __int128 v69 = 0u;
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          *(_OWORD *)v63 = 0u;
        }

        id v60 = [v34 getSignallingData];
        __int16 v61 = v35;
        char v62 = v36;
        unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue([v34 advertisement]);
        id v38 = [v34 getRangingActive];
        uint64_t v39 = (void *)v81[5];
        v40 = (void *)objc_claimAutoreleasedReturnValue([v32 descriptionInternal]);
        uint64_t v41 = v74;
        int v42 = HIBYTE(v61);
        if (HIBYTE(v61))
        {
          sub_1001EDD1C(&v60, &__p);
          v43 = &__p;
          if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
            v43 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
        }

        else
        {
          v43 = (std::string *)"0";
        }

        NSErrorUserInfoKey v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Peer: %@. NBAMMS active: %d. Aiding: %d. Signalling: %s",  v40,  v38,  v41,  v43));
        [v39 addObject:v44];

        v45 = (void *)v81[5];
        v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Adv: %@",  v37));
        [v45 addObject:v46];
      }

      id v58 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v75,  v86,  16LL);
    }

    while (v58);
  }

  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    NSErrorUserInfoKey v47 = (void *)v81[5];
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Debug params (%d)",  -[PRRangingManagerClient count](self->_uwbSystemListener.__ptr_, "count")));
    [v47 addObject:v48];

    ptr = self->_uwbSystemListener.__ptr_;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_1001F812C;
    v59[3] = &unk_1007B6690;
    v59[4] = &v80;
    -[PRRangingManagerClient enumerateKeysAndObjectsUsingBlock:](ptr, "enumerateKeysAndObjectsUsingBlock:", v59);
  }

  v50 = (void *)v81[5];
  v51 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingNBAMMSSessionManager sharedInstance]( &OBJC_CLASS___NIServerFindingNBAMMSSessionManager,  "sharedInstance"));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v51 printableState]);
  [v50 addObjectsFromArray:v52];

  id v53 = (id)v81[5];
  _Block_object_dispose(&v80, 8);

  return v53;
}

- (id)clientQueue
{
  return *(id *)&self->_isFinder;
}

- (void)didReceiveNewNbammsSolution:(const void *)a3 token:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained didRangeWithPeer:v6 newSolution:a3];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039DEC8();
  }
}

- (void)didReceiveUnsuccessfulNbammsSolution:(const void *)a3 token:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained didAttemptRangingWithPeer:v6 unsuccessfulSolution:a3];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039DEF4();
  }
}

- (void)didReceiveNbammsSessionStatusUpdate:(const ServiceRequestStatusUpdate *)a3 token:(id)a4
{
  id v6 = a4;
  BOOL v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
    sub_1000065CC(v16, off_1007B6C30[a3->var1]);
    int v9 = v17;
    uint64_t v10 = (void **)v16[0];
    sub_1000065CC(__p, off_1007B6CA8[a3->var2]);
    uint64_t v11 = v16;
    if (v9 < 0) {
      uint64_t v11 = v10;
    }
    if (v15 >= 0) {
      BOOL v12 = __p;
    }
    else {
      BOOL v12 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315650;
    BOOL v19 = v8;
    __int16 v20 = 2080;
    int v21 = v11;
    __int16 v22 = 2080;
    BOOL v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#find-range,[%s] serviceRequestDidUpdateStatus. Type: %s. Reason: %s",  buf,  0x20u);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
    if (v17 < 0) {
      operator delete(v16[0]);
    }
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    if (a3->var2 == 8)
    {
      -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v6);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
      [WeakRetained didStopRangingWithPeer:v6];
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039DF20();
  }
}

- (void)didReceiveNbammsPeerAlgorithmAidingData:(const void *)a3 signallingData:(const void *)a4 token:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
  uint64_t v10 = WeakRetained;
  if (WeakRetained)
  {
    if (LOBYTE(self->_pbLogger.__ptr_))
    {
      [WeakRetained didReceiveRangingDataForPeer:v8 algorithmAidingData:a3 signallingData:a4];
      if (!LOBYTE(self->_identifier.__r_.var0)) {
        goto LABEL_21;
      }
      if (*((_BYTE *)a4 + 5) && *((_BYTE *)a4 + 4))
      {
        uint64_t v11 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v8 descriptionInternal]);
          int v15 = 138412290;
          uint64_t v16 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#find-range,Received findee_gone signal for token %@",  (uint8_t *)&v15,  0xCu);
        }

        -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v8);
        [v10 didStopRangingWithPeer:v8];
        if (!LOBYTE(self->_identifier.__r_.var0))
        {
LABEL_21:
          if (*((_BYTE *)a4 + 3) && *((_BYTE *)a4 + 2))
          {
            uint64_t v13 = (os_log_s *)(id)qword_1008000A0;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              float v14 = (void *)objc_claimAutoreleasedReturnValue([v8 descriptionInternal]);
              int v15 = 138412290;
              uint64_t v16 = v14;
              _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#find-range,Received finder_gone signal for token %@",  (uint8_t *)&v15,  0xCu);
            }

            -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v8);
            [v10 didStopRangingWithPeer:v8];
          }
        }
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      sub_10039DF78();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039DF4C();
  }
}

- (void)didInvalidateNbammsSessionWithReason:(int)a3 token:(id)a4
{
  id v6 = a4;
  BOOL v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
    sub_100275E00(a3, v9);
    sub_10039DFD0();
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v6);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained didStopRangingWithPeer:v6];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039DFA4();
  }
}

- (void)didFailCryptoWithToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
    sub_10039E040((uint64_t)v6, (uint64_t)&v8, v5);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v4);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained didRangingAuthorizationFailForPeer:v4];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039E014();
  }
}

- (void)didFailMutualAuthWithToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
    sub_10039E0A8((uint64_t)v6, (uint64_t)&v8, v5);
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->_isFinder);
  if (LOBYTE(self->_pbLogger.__ptr_))
  {
    -[NIServerFindingRangingProvider _resetRangingStateForToken:](self, "_resetRangingStateForToken:", v4);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
    [WeakRetained didRangingAuthorizationFailForPeer:v4];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039E07C();
  }
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  BOOL v7 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = sub_100277A54(LOBYTE(self->_identifier.__r_.var0));
    sub_1000065CC(v23, off_1007B6D48[a3]);
    int v9 = v24;
    uint64_t v10 = (void **)v23[0];
    sub_1000065CC(__p, off_1007B6D70[a4]);
    uint64_t v11 = v23;
    if (v9 < 0) {
      uint64_t v11 = v10;
    }
    if (v22 >= 0) {
      BOOL v12 = __p;
    }
    else {
      BOOL v12 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315650;
    char v26 = v8;
    __int16 v27 = 2080;
    uint64_t v28 = v11;
    __int16 v29 = 2080;
    v30 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#find-range,[%s] Ranging service updated state: %s. Cause: %s",  buf,  0x20u);
    if (v22 < 0) {
      operator delete(__p[0]);
    }
    if (v24 < 0) {
      operator delete(v23[0]);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_identifier.var0);
  float v14 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector(WeakRetained, "rangingBecameAvailable") & 1) != 0)
    {
      if ((objc_opt_respondsToSelector(v14, "rangingBecameUnavailable") & 1) != 0)
      {
        int v15 = *(dispatch_queue_s **)&self->_isFinder;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1001F8D7C;
        block[3] = &unk_1007B6578;
        block[4] = self;
        int v20 = a3;
        id v19 = v14;
        dispatch_async(v15, block);

        goto LABEL_17;
      }

      uint64_t v16 = "[sConsumer respondsToSelector:@selector(rangingBecameUnavailable)]";
      int v17 = 4015;
    }

    else
    {
      uint64_t v16 = "[sConsumer respondsToSelector:@selector(rangingBecameAvailable)]";
      int v17 = 4014;
    }

    __assert_rtn( "-[NIServerFindingRangingProvider rangingServiceDidUpdateState:cause:]",  "NIServerFindingRanging.mm",  v17,  v16);
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_10039DF4C();
  }
LABEL_17:
}

- (optional<rose::RoseServiceRequest>)_prepareServiceRequestForDiscoveryToken:(SEL)a3 technology:(id)a4 useCase:(int)a5 nbMask:(int)a6 nbUwbAcquisitionBandChannel:(unsigned __int8)a7 mmsSlotSizeMsec:(unsigned __int16)a8
{
  uint64_t v9 = *(void *)&a9;
  uint64_t v10 = a8;
  uint64_t v11 = a7;
  uint64_t v12 = *(void *)&a6;
  id v19 = a4;
  if (!v19) {
    __assert_rtn( "-[NIServerFindingRangingProvider _prepareServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitio nBandChannel:mmsSlotSizeMsec:]",  "NIServerFindingRanging.mm",  4061,  "token");
  }
  uint64_t v16 = sub_100005150();
  BOOL v17 = !sub_1003552C4((uint64_t)v16);
  if (a5 != 1) {
    LOBYTE(v17) = 1;
  }
  if (v17)
  {
    retstr->var0.__null_state_ = 0;
    retstr->var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  }

  else
  {
    -[NIServerFindingRangingProvider _prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:]( self,  "_prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:",  v19,  1LL,  v12,  v11,  v10,  v9);
  }

  return result;
}

- (optional<rose::RoseServiceRequest>)_prepareNbammsServiceRequestForDiscoveryToken:(SEL)a3 technology:(id)a4 useCase:(int)a5 nbMask:(int)a6 nbUwbAcquisitionBandChannel:(unsigned __int8)a7 mmsSlotSizeMsec:(unsigned __int16)a8
{
  char v9 = a9;
  __int16 v11 = a7;
  __dst = retstr;
  id v103 = a4;
  if (!v103) {
    __assert_rtn( "-[NIServerFindingRangingProvider _prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcqu isitionBandChannel:mmsSlotSizeMsec:]",  "NIServerFindingRanging.mm",  4084,  "token");
  }
  char v109 = 0;
  LOBYTE(v114) = 0;
  char v115 = 0;
  char v117 = 0;
  int v107 = 0;
  LOBYTE(v108) = 0;
  LODWORD(v112) = 0;
  *(_DWORD *)((char *)&v112 + 3) = 0;
  LODWORD(v116) = 0;
  *(_DWORD *)((char *)&v116 + 3) = 0x10000;
  memset(v118, 0, sizeof(v118));
  unsigned __int8 v119 = 1;
  LOBYTE(v122) = 0;
  char v123 = 0;
  int v120 = 0;
  char v121 = 0;
  int v124 = 0;
  unsigned __int8 v126 = 1;
  LOBYTE(v127) = 0;
  char v128 = 0;
  LOBYTE(v129) = 0;
  char v130 = 0;
  LOBYTE(v131) = 0;
  char v132 = 0;
  __int128 v133 = 0uLL;
  __int16 v125 = v11 | 0x100;
  HIWORD(v112) = 1796;
  char v113 = 1;
  unsigned __int16 v110 = a8;
  char v111 = 1;
  BYTE4(v116) = 4 * v9;
  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", @"nbTxAntenna"));

    if (v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"nbTxAntenna"));
      LOWORD(v107) = [v16 intValue] | 0x100;
    }

    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"nbRxAntenna",  __dst));

    if (v17)
    {
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"nbRxAntenna"));
      HIWORD(v107) = [v18 intValue] | 0x100;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"nbPacketType"));

    if (v19)
    {
      int v20 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"nbPacketType"));
      unsigned __int16 v108 = (unsigned __int16)[v20 intValue];
      char v109 = 1;
    }

    int v21 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"nbBandChannel"));

    if (v21)
    {
      char v22 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"nbBandChannel"));
      unsigned __int16 v110 = (unsigned __int16)[v22 intValue];
      char v111 = 1;
    }

    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsTxAntenna"));

    if (v23)
    {
      char v24 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsTxAntenna"));
      LOWORD(v112) = [v24 intValue] | 0x100;
    }

    int v25 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsRxAntenna"));

    if (v25)
    {
      char v26 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsRxAntenna"));
      WORD1(v112) = [v26 intValue] | 0x100;
    }

    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsRxSyncAntenna"));

    if (v27)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsRxSyncAntenna"));
      WORD2(v112) = [v28 intValue] | 0x100;
    }

    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsPacketType"));

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsPacketType"));
      HIWORD(v112) = (unsigned __int16)[v30 intValue];
      char v113 = 1;
    }

    objc_super v31 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsBandChannel"));

    if (v31)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsBandChannel"));
      unsigned __int16 v114 = (unsigned __int16)[v32 intValue];
      char v115 = 1;
    }

    uint8_t v33 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"nbSlotSize"));

    if (v33)
    {
      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"nbSlotSize"));
      WORD1(v116) = [v34 intValue] | 0x100;
    }

    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsSlotSize"));

    if (v35)
    {
      char v36 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsSlotSize"));
      WORD2(v116) = [v36 intValue] | 0x100;
    }

    unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsNumFragments"));

    if (v37)
    {
      id v38 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsNumFragments"));
      LOWORD(v116) = [v38 intValue] | 0x100;
    }

    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"interval"));

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"interval"));
      HIWORD(v116) = (unsigned __int16)[v40 intValue];
      char v117 = 1;
    }

    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"enableNonInterlacedMMS"));

    if (v41)
    {
      int v42 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"enableNonInterlacedMMS"));
      v118[6] = [v42 BOOLValue];
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"enableAntennaDiversity"));

    if (v43)
    {
      NSErrorUserInfoKey v44 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"enableAntennaDiversity"));
      unsigned __int8 v119 = [v44 BOOLValue];
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"useDedicatedAntennas"));

    if (v45)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"useDedicatedAntennas"));
      BYTE1(v120) = [v46 BOOLValue];
    }

    NSErrorUserInfoKey v47 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"overrideDefaultAntenna"));

    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"overrideDefaultAntenna"));
      BYTE2(v120) = [v48 BOOLValue];
    }

    NSErrorUserInfoKey v49 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"nbChannelSelectionMask"));

    if (v49)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"nbChannelSelectionMask"));
      char v123 = 1;
      unsigned __int16 v122 = (unsigned __int16)[v50 intValue];
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"napSlotSize"));

    if (v51)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"napSlotSize"));
      BYTE1(v124) = 1;
      LOBYTE(v124) = [v52 intValue];
    }

    id v53 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"dataSlotSize"));

    if (v53)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"dataSlotSize"));
      HIBYTE(v124) = 1;
      BYTE2(v124) = [v54 intValue];
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"useType2Addr"));

    if (v55)
    {
      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"useType2Addr"));
      unsigned __int8 v126 = [v56 BOOLValue];
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"antennaDiversityMask"));

    if (v57)
    {
      id v58 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"antennaDiversityMask"));
      HIBYTE(v120) = [v58 intValue];
    }

    v59 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsPSR"));

    if (v59)
    {
      id v60 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsPSR"));
      *(_WORD *)v118 = [v60 intValue] | 0x100;
    }

    __int16 v61 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsGap"));

    if (v61)
    {
      char v62 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsGap"));
      *(_WORD *)&v118[2] = [v62 intValue] | 0x100;
    }

    v63 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsSeqIdx"));

    if (v63)
    {
      __int128 v64 = (void *)objc_claimAutoreleasedReturnValue( -[PRRangingManagerClient objectForKey:]( self->_uwbSystemListener.__ptr_,  "objectForKey:",  @"mmsSeqIdx"));
      *(_WORD *)&v118[4] = [v64 intValue] | 0x100;
    }
  }

  __int128 v65 = sub_100005150();
  LOBYTE(v120) = sub_1003552E4((uint64_t)v65);
  __int128 v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v67 = [v66 BOOLForKey:@"DisableDualRxChain"];

  if (v67) {
    LOBYTE(v120) = 0;
  }
  __int128 v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "getIRK", __dst));
  __int128 v69 = v68;
  if (v68)
  {
    if ([v68 length] != (id)16) {
      __assert_rtn( "-[NIServerFindingRangingProvider _prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAc quisitionBandChannel:mmsSlotSizeMsec:]",  "NIServerFindingRanging.mm",  4215,  "[IRK length] == kNbammsIRKLengthBytes");
    }
    id v70 = v69;
    __int128 v133 = *(_OWORD *)[v70 bytes];
    unint64_t v131 = -[NIServerFindingRangingProvider _macAddressForIRK:](self, "_macAddressForIRK:", v70);
    char v132 = 1;
    int cntrl_low = LOBYTE(self->_uwbSystemListener.__cntrl_);
    __int128 v72 = (os_log_s *)(id)qword_1008000A0;
    BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT);
    if (cntrl_low)
    {
      if (v73)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "#find-range,UseTestNbammsMode enabled",  buf,  2u);
      }

      char v121 = 1;
      if (!v130) {
        char v130 = 1;
      }
      __int16 v129 = 4864;
LABEL_89:
      uint64_t v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      v83 = (void *)objc_claimAutoreleasedReturnValue([v82 objectForKey:@"FindingMMSPacketTypeConfigIndex"]);

      if (v83)
      {
        uint64_t v85 = objc_opt_class(&OBJC_CLASS___NSNumber, v84);
        if ((objc_opt_isKindOfClass(v83, v85) & 1) != 0)
        {
          unsigned int v127 = [v83 intValue];
          char v128 = 1;
        }
      }

      if (a6) {
        int v86 = 10;
      }
      else {
        int v86 = 9;
      }
      int v134 = v86;
      sub_100141F88((char *)&v107, BYTE1(self->_identifier.__r_.var0) ^ 1, (uint64_t)buf);
      v87 = (char *)operator new(0x1F8uLL);
      memcpy(v87, buf, 0x1F8uLL);
      if (self->_consumer)
      {
        v88 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v88,  OS_LOG_TYPE_DEFAULT,  "#find-range,Logging nbamms range enable command params.",  buf,  2u);
        }

        sub_10023494C((uint64_t)self->_consumer, (unsigned __int8 *)v87 + 96);
      }

      int v89 = sub_100277910(a6);
      int v90 = sub_100277A04(a6);
      int v91 = sub_100277944(@"FindingUWBTotalTimeoutSecondsOverride", 0x708u);
      int v92 = sub_100277944(@"FindingUWBEventWatchdogTimeoutMillisecondsOverride", 0x7D0u);
      v93 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&uint8_t buf[4] = v89;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = v90;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&buf[16] = v91;
        *(_WORD *)&buf[20] = 1024;
        *(_DWORD *)&buf[22] = v92;
        _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "#find-range,Ranging timeouts: discovery %d s, reacquisition %d s, total %d s, event watchdog %d ms",  buf,  0x1Au);
      }

      *((_DWORD *)v87 + 17) |= 5u;
      v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned int v95 = [v94 BOOLForKey:@"FindingEnableSBR"];

      if (v95) {
        *((_DWORD *)v87 + 17) |= 8u;
      }
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned int v97 = [v96 BOOLForKey:@"FindingEnableHPXODuringSleep"];

      if (v97)
      {
        v98 = sub_100005150();
      }

      *((_WORD *)v87 + 36) = v89;
      *((_WORD *)v87 + 37) = v90;
      *((_WORD *)v87 + 38) = -1;
      *((_WORD *)v87 + 39) = v91;
      *((_WORD *)v87 + 40) = -1;
      v87[82] = 0;
      *(_WORD *)(v87 + 83) = v92;
      v99 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_DEFAULT,  "#find-range,Created NBAMMS service request for finding session",  buf,  2u);
      }

      memcpy(__dsta, v87, 0x1F8uLL);
      __dsta[504] = 1;
      operator delete(v87);

      goto LABEL_109;
    }

    if (v73)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "#find-range,UseTestNbammsMode NOT enabled",  buf,  2u);
    }

    char v121 = 0;
    unsigned int v75 = -[NIServerFindingRangingProvider rangingAcquisitionType](self, "rangingAcquisitionType");
    __int128 v76 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v77 = v75 ? "BTAidedAcquisition" : "DirectAcquisition";
      sub_1000065CC(buf, v77);
      __int128 v78 = (buf[23] & 0x80u) == 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)v105 = 136315138;
      v106 = v78;
      _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "#find-range,ranging acquisition type = %s",  v105,  0xCu);
    }

    if (v75 == 1)
    {
      int v79 = sub_100277758(0);
      if (v79 == 19)
      {
        __int16 v80 = 4865;
        if (v130) {
          goto LABEL_84;
        }
        goto LABEL_83;
      }

      if (v79 != 26)
      {
LABEL_85:
        v81 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          if (!v130) {
            sub_100006080();
          }
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v129;
          _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "#find-range,Host config usesBLEAdvToTriggerRanging %d",  buf,  8u);
        }

        goto LABEL_89;
      }
    }

    else if (v75)
    {
      goto LABEL_85;
    }

    __int16 v80 = 4864;
    if (v130)
    {
LABEL_84:
      __int16 v129 = v80;
      goto LABEL_85;
    }

- (id)_triggerRanging:(RoseServiceRequest *)a3 peerDiscoveryToken:(id)a4 technology:(int)a5 sharedProtocol:(int)a6
{
  id v10 = a4;
  if (!v10) {
    __assert_rtn( "-[NIServerFindingRangingProvider _triggerRanging:peerDiscoveryToken:technology:sharedProtocol:]",  "NIServerFindingRanging.mm",  4310,  "token");
  }
  if (a5 == 1)
  {
    __int16 v11 = sub_100005150();
    if (sub_1003552C4((uint64_t)v11))
    {
      unsigned int v58 = 10000000;
      ptr = self->_uwbSystemListener.__ptr_;
      if (ptr)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", @"startTimeUncertainty"));
        float v14 = v13;
        if (v13) {
          unsigned int v58 = [v13 intValue];
        }
      }

      uint64_t v15 = -[NIServerFindingRangingProvider _getSchedulingIntervalForTriggeredDutyCycledAcquisition]( self,  "_getSchedulingIntervalForTriggeredDutyCycledAcquisition");
      -[NIServerFindingRangingProvider _getDutyCycleForTriggeredDutyCycledAcquisition]( self,  "_getDutyCycleForTriggeredDutyCycledAcquisition");
      float v17 = v16;
      id v55 = -[NIServerFindingRangingProvider _getFindingSecondarySchedulingParameters]( self,  "_getFindingSecondarySchedulingParameters");
      float v57 = v19;
      float v20 = v19;
      int v22 = v21;
      if ((_DWORD)v15)
      {
        if (v17 <= 1.0)
        {
          *(float *)&double v18 = v17;
          -[NIServerFindingRangingProvider _adjustDutyCycleForInterfaceDelays:schedulingInterval:]( self,  "_adjustDutyCycleForInterfaceDelays:schedulingInterval:",  v15,  v18);
          float v17 = v23;
          if (v22)
          {
            char v24 = (os_log_s *)qword_1008000A0;
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "#find-range,Requested backoff acquisition policy, processing secondary scheduling parameters",  buf,  2u);
            }

            if (v17 >= v20)
            {
              int v22 = 1;
            }

            else
            {
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
                sub_10039E138();
              }
              int v22 = 0;
            }
          }
        }
      }

      if (BYTE1(self->_identifier.__r_.var0))
      {
        unsigned __int16 v28 = (unsigned __int16)-[NIServerFindingRangingProvider _getDitherConst](self, "_getDitherConst");
        int v29 = HIBYTE(v28);
      }

      else
      {
        LOBYTE(v28) = 0;
        int v29 = 0;
      }

      v30 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        if (v29) {
          unsigned __int8 v31 = v28;
        }
        else {
          unsigned __int8 v31 = 0;
        }
        int v84 = v15;
        __int16 v85 = 2048;
        *(double *)int v86 = v17;
        *(_WORD *)&v86[8] = 1024;
        *(_DWORD *)&v86[10] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "#find-range,Primary scheduling params: Interval(us)=%d, Duty Cycle=%f, Dither const=%d",  buf,  0x18u);
      }

      if (v22)
      {
        id v32 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109632;
          int v84 = (int)v55;
          __int16 v85 = 1024;
          *(_DWORD *)int v86 = HIDWORD(v55);
          *(_WORD *)&v86[4] = 2048;
          *(double *)&v86[6] = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#find-range,Secondary scheduling params: Delay(us)=%d, Interval(us)=%d, Duty Cycle=%f",  buf,  0x18u);
        }
      }

      buf[0] = 0;
      char v87 = 0;
      __int16 v33 = v28 | (unsigned __int16)((_WORD)v29 << 8);
      uint64_t v88 = 17000LL;
      char v89 = 1;
      unsigned int v90 = v58;
      int v91 = v15;
      float v92 = v17;
      uint64_t v93 = 0LL;
      __int16 v94 = v33;
      uint64_t v95 = 0LL;
      memset(v97, 0, sizeof(v97));
      uint64_t v96 = 0LL;
      if (!BYTE2(a3->range_enable_params.fira.local_addr.var0.__val_)) {
        __assert_rtn( "-[NIServerFindingRangingProvider _triggerRanging:peerDiscoveryToken:technology:sharedProtocol:]",  "NIServerFindingRanging.mm",  4375,  "serviceRequest.range_enable_params.nbamms.nb_bch.has_value()");
      }
      int v34 = LOWORD(a3->range_enable_params.fira.local_addr.var0.__val_) | 0x10000;
      __int16 v70 = 0;
      int v69 = 0;
      int v65 = 2;
      char v66 = 0;
      __int16 v67 = 0;
      char v68 = 0;
      char v71 = 1;
      char v72 = 1;
      uint64_t v73 = 17000LL;
      char v74 = 1;
      unsigned int v75 = v58;
      int v76 = v15;
      float v77 = v17;
      uint64_t v78 = 0LL;
      __int16 v79 = v33;
      int v54 = v34;
      int v80 = v34;
      memset(v81, 0, sizeof(v81));
      __int16 v82 = 0;
      unsigned int v35 = -[NIServerFindingRangingProvider rangingAcquisitionType](self, "rangingAcquisitionType");
      unsigned int v56 = a6;
      char v36 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v37 = v35 ? "BTAidedAcquisition" : "DirectAcquisition";
        sub_1000065CC(__p, v37);
        id v38 = v60 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)v63 = 136315138;
        __int128 v64 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "#find-range,ranging acquisition type = %s",  v63,  0xCu);
        if (v60 < 0) {
          operator delete(__p[0]);
        }
      }

      if (v35 == 1)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
        uint64_t v41 = v40;
        if (!v40)
        {
          NSErrorUserInfoKey v61 = NSLocalizedFailureReasonErrorKey;
          char v62 = @"Advertisement is missing for specified token";
          id v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
          char v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v53));

          goto LABEL_57;
        }

        int v42 = (void *)objc_claimAutoreleasedReturnValue([v40 advertisement]);
        id v43 = [v42 address];
        int v65 = 2;
        char v66 = 0;
        __int16 v67 = 0;
        char v68 = 0;
        int v69 = (int)v43;
        __int16 v70 = WORD2(v43);
        char v71 = 1;
        char v72 = 1;
        uint64_t v73 = 17000LL;
        char v74 = 1;
        unsigned int v75 = v58;
        int v76 = v15;
        float v77 = v17;
        uint64_t v78 = 0LL;
        __int16 v79 = v33;
        int v80 = v54;
        memset(v81, 0, sizeof(v81));
        __int16 v82 = 0;
      }

      else if (!v35 && v22)
      {
        uint64_t v39 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(__p[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "#find-range,Resetting NBAMMSStartOptions",  (uint8_t *)__p,  2u);
        }

        __int16 v70 = 0;
        int v69 = 0;
        int v65 = 2;
        char v66 = 0;
        __int16 v67 = 0;
        char v68 = 0;
        char v71 = 1;
        char v72 = 1;
        uint64_t v73 = 17000LL;
        char v74 = 1;
        unsigned int v75 = v58;
        int v76 = v15;
        float v77 = v17;
        uint64_t v78 = 0LL;
        __int16 v79 = v33;
        int v80 = v54;
        v81[0] = 0;
        *(void *)&v81[1] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000LL | v55;
        *(void *)&v81[5] = (unint64_t)&_mh_execute_header & 0xFFFFFFFF00000000LL | HIDWORD(v55);
        *(float *)&v81[9] = v57;
        LOBYTE(v81[11]) = 1;
      }

      objc_initWeak(__p, self);
      NSErrorUserInfoKey v44 = (void *)objc_claimAutoreleasedReturnValue( +[NIServerFindingNBAMMSSessionManager sharedInstance]( &OBJC_CLASS___NIServerFindingNBAMMSSessionManager,  "sharedInstance"));
      BOOL v45 = LOBYTE(self->_identifier.__r_.var0) != 0;
      id WeakRetained = objc_loadWeakRetained(__p);
      if (LOBYTE(self->_uwbSystemListener.__cntrl_)) {
        NSErrorUserInfoKey v47 = buf;
      }
      else {
        NSErrorUserInfoKey v47 = (uint8_t *)&v65;
      }
      char v26 = (void *)objc_claimAutoreleasedReturnValue( [v44 registerNBAMMSSessionWithToken:v10 isFinder:v45 client:WeakRetained serviceRequest:a3 startRangingOptions:v47 sharedProtocol:v56]);

      debugParameters = self->_debugParameters;
      if (v26)
      {
        -[NSDictionary removeObjectForKey:](debugParameters, "removeObjectForKey:", v10);
        id v49 = v26;
      }

      else
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](debugParameters, "objectForKey:", v10));
        if (!v50) {
          __assert_rtn( "-[NIServerFindingRangingProvider _triggerRanging:peerDiscoveryToken:technology:sharedProtocol:]",  "NIServerFindingRanging.mm",  4423,  "[_trackingPeers objectForKey:token] != nil");
        }

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_debugParameters, "objectForKey:", v10));
        [v51 setRangingActive:1];
      }

      objc_destroyWeak(__p);
    }

    else
    {
      NSErrorUserInfoKey v98 = NSLocalizedFailureReasonErrorKey;
      v99 = @"Device does not support specified technology";
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v99,  &v98,  1LL));
      char v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v27));
    }
  }

  else
  {
    NSErrorUserInfoKey v100 = NSLocalizedFailureReasonErrorKey;
    v101 = @"Specified technology not supported";
    int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1LL));
    char v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v25));
  }

- (BOOL)_doesWantTriggeredDutyCycledAcquisition
{
  unsigned int v3 = -[NIServerFindingRangingProvider _getSchedulingIntervalForTriggeredDutyCycledAcquisition]( self,  "_getSchedulingIntervalForTriggeredDutyCycledAcquisition");
  -[NIServerFindingRangingProvider _getDutyCycleForTriggeredDutyCycledAcquisition]( self,  "_getDutyCycleForTriggeredDutyCycledAcquisition");
  return v4 <= 1.0 && v3 != 0;
}

- (unsigned)_getSchedulingIntervalForTriggeredDutyCycledAcquisition
{
  int v3 = BYTE1(self->_identifier.__r_.var0);
  float v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v5 = [v4 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];
  if (v3) {
    int v6 = 30000;
  }
  else {
    int v6 = 29000;
  }

  if (v5) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  char v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"FindingSchedulingInterval"]);

  if (v9)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
      unsigned int v7 = [v9 intValue];
    }
  }

  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", @"schedulingInterval"));
    float v14 = v13;
    if (v13) {
      unsigned int v7 = [v13 intValue];
    }
  }

  return v7;
}

- (float)_getDutyCycleForTriggeredDutyCycledAcquisition
{
  int v3 = BYTE1(self->_identifier.__r_.var0);
  float v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v5 = [v4 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];
  float v6 = 0.0;
  if (v3) {
    float v7 = 0.0;
  }
  else {
    float v7 = 0.1034;
  }

  if (!v5) {
    float v6 = v7;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  char v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"FindingDutyCycle"]);

  if (v9)
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {
      [v9 floatValue];
      float v6 = v12;
    }
  }

  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    float v14 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", @"dutyCycle"));
    uint64_t v15 = v14;
    if (v14)
    {
      [v14 floatValue];
      float v6 = v16;
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
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "#find-range,Provided duty cycle leads to scan window > scheduling interval - (start time offset + interface dela ys), using entire available scan window",  v8,  2u);
    }
  }

  return a3;
}

- (optional<unsigned)_getDitherConst
{
  if (BYTE1(self->_identifier.__r_.var0))
  {
    int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v4 = [v3 BOOLForKey:@"FindingDisableDitheredAcq"];

    if (v4)
    {
      float v5 = (os_log_s *)qword_1008000A0;
      BOOL v6 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
      __int16 v7 = 0;
      unsigned __int8 v8 = 0;
      if (v6)
      {
        __int16 v20 = 0;
        char v9 = "#find-range,Dithered duty cycled acquisition is disabled using defaults write";
        uint64_t v10 = (uint8_t *)&v20;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
        __int16 v7 = 0;
        unsigned __int8 v8 = 0;
      }
    }

    else
    {
      float v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"FindingDitherConst"]);

      if (v13 && (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber, v14), (objc_opt_isKindOfClass(v13, v15) & 1) != 0)) {
        unsigned __int8 v8 = [v13 intValue];
      }
      else {
        unsigned __int8 v8 = 10;
      }
      ptr = self->_uwbSystemListener.__ptr_;
      if (ptr)
      {
        float v17 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", @"ditherConst"));
        double v18 = v17;
        if (v17) {
          unsigned __int8 v8 = [v17 intValue];
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
      char v9 = "#find-range,Dithered duty cycled acquisition not valid for responder";
      uint64_t v10 = buf;
      goto LABEL_7;
    }
  }

  return (optional<unsigned char>)(v8 | (unsigned __int16)(v7 << 8));
}

- (optional<SecondarySchedulingParameters>)_getFindingSecondarySchedulingParameters
{
  if (BYTE1(self->_identifier.__r_.var0))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_10039E164();
    }
    goto LABEL_5;
  }

  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v4 = [v3 BOOLForKey:@"FindingDisableDutyCycledAcquisition"];

  if ((v4 & 1) != 0)
  {
LABEL_5:
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    __int16 v7 = 0LL;
    int v8 = 0;
    unsigned int v9 = 0;
    goto LABEL_6;
  }

  float v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"FindingSecondarySchedulingDelay"]);

  if (v13 && (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber, v14), (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
  {
    unsigned int v16 = [v13 intValue];
    int v17 = 1;
  }

  else
  {
    unsigned int v16 = 0;
    int v17 = 0;
  }

  ptr = self->_uwbSystemListener.__ptr_;
  if (ptr)
  {
    float v19 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](ptr, "objectForKey:", @"secondarySchedulingDelay"));
    __int16 v20 = v19;
    if (v19)
    {
      unsigned int v16 = [v19 intValue];
      int v17 = 1;
    }
  }

  if (v16) {
    BOOL v21 = v17 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21) {
    int v22 = 30000000;
  }
  else {
    int v22 = v16;
  }
  float v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  char v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:@"FindingSecondarySchedulingInterval"]);

  if (v24 && (uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSNumber, v25), (objc_opt_isKindOfClass(v24, v26) & 1) != 0))
  {
    unsigned int v27 = [v24 intValue];
    int v28 = 1;
  }

  else
  {
    unsigned int v27 = 0;
    int v28 = 0;
  }

  int v29 = self->_uwbSystemListener.__ptr_;
  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](v29, "objectForKey:", @"secondarySchedulingInterval"));
    unsigned __int8 v31 = v30;
    if (v30)
    {
      unsigned int v27 = [v30 intValue];
      int v28 = 1;
    }
  }

  if (v27) {
    BOOL v32 = v28 == 0;
  }
  else {
    BOOL v32 = 1;
  }
  if (v32) {
    uint64_t v33 = 59000LL;
  }
  else {
    uint64_t v33 = v27;
  }
  int v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"FindingSecondaryDutyCycle"]);

  float v38 = 0.0;
  if (v35 && (uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSNumber, v36), (objc_opt_isKindOfClass(v35, v39) & 1) != 0))
  {
    [v35 floatValue];
    float v38 = *(float *)&v37;
    int v40 = 1;
  }

  else
  {
    int v40 = 0;
  }

  uint64_t v41 = self->_uwbSystemListener.__ptr_;
  if (v41)
  {
    int v42 = (void *)objc_claimAutoreleasedReturnValue(-[PRRangingManagerClient objectForKey:](v41, "objectForKey:", @"secondaryDutyCycle"));
    id v43 = v42;
    if (v42)
    {
      [v42 floatValue];
      float v38 = v44;
      int v40 = 1;
    }
  }

  BOOL v46 = v38 > 1.0 || v38 <= 0.0 || v40 == 0;
  LODWORD(v37) = 1028658089;
  if (!v46) {
    *(float *)&double v37 = v38;
  }
  -[NIServerFindingRangingProvider _adjustDutyCycleForInterfaceDelays:schedulingInterval:]( self,  "_adjustDutyCycleForInterfaceDelays:schedulingInterval:",  v33,  v37);
  unsigned int v48 = v47;
  unsigned int v9 = v22 & 0xFFFFFF00;

  int v8 = v22;
  uint64_t v5 = v33 << 32;
  uint64_t v6 = v48;
  __int16 v7 = &_mh_execute_header;
LABEL_6:
  uint64_t v10 = v5 | v9 | v8;
  unint64_t v11 = (unint64_t)v7 | v6;
  *(void *)&result.var0.var1.var2 = v11;
  *(void *)&result.var0.int var0 = v10;
  return result;
}

- (unint64_t)_macAddressForIRK:(id)a3
{
  id v3 = a3;
  unint64_t v4 = SipHash([v3 bytes], &unk_100428290, 8);

  return v4;
}

- (id)_getDefaultNbammsRangingConfigParameters
{
  int cntrl_low = LOBYTE(self->_uwbSystemListener.__cntrl_);
  unint64_t v4 = (os_log_s *)qword_1008000A0;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
  if (cntrl_low)
  {
    if (!v5) {
      goto LABEL_7;
    }
    __int16 v35 = 0;
    uint64_t v6 = "#find-range,Setting default ranging params for Test Nbamms MAC Mode";
    __int16 v7 = (uint8_t *)&v35;
  }

  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    LOWORD(v34) = 0;
    uint64_t v6 = "#find-range,Setting default ranging params for POR Nbamms MAC Mode";
    __int16 v7 = (uint8_t *)&v34;
  }

  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
LABEL_7:
  int v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v9 = sub_100005150();
  if (sub_1003552C4((uint64_t)v9))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, @"nbTxAntenna");

    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v11, @"nbRxAntenna");

    float v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 4097LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, @"nbPacketType");

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 9LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v13,  @"mmsBandChannel");

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 4LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, @"nbSlotSize");

    if (LOBYTE(self->_uwbSystemListener.__cntrl_))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 72LL));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, @"mmsSlotSize");
    }

    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 16LL, v34));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v16,  @"mmsNumFragments");

    int v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 10000000LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v17,  @"startTimeUncertainty");

    double v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 99LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v18, @"interval");

    float v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v19,  @"enableNonInterlacedMMS");

    __int16 v20 = sub_100005150();
    BOOL v21 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", sub_1003552E4((uint64_t)v20));
    int v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v22,  @"enableAntennaDiversity");

    float v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v23,  @"overrideDefaultAntenna");

    char v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v24,  @"useDedicatedAntennas");

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 6LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v25, @"napSlotSize");

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 10LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v26, @"dataSlotSize");

    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v27, @"useType2Addr");

    int v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"enforceNBBandChannel"]);

    if (v29)
    {
      uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSNumber, v30);
      if ((objc_opt_isKindOfClass(v29, v31) & 1) != 0)
      {
        BOOL v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  (unsigned __int16)[v29 intValue]));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v32,  @"nbBandChannel");
      }
    }
  }

  return v8;
}

- (void)_setInitiator
{
  id v3 = sub_100005150();
  if (!sub_1003552C4((uint64_t)v3))
  {
    char var0 = self->_identifier.__r_.var0;
LABEL_5:
    var0 ^= 1u;
    goto LABEL_6;
  }

  char var0 = self->_identifier.__r_.var0;
  if (!LOBYTE(self->_uwbSystemListener.__cntrl_)) {
    goto LABEL_5;
  }
LABEL_6:
  BYTE1(self->_identifier.__r_.var0) = var0;
}

- (void)_assignDebugParametersIfAvailable:(id)a3
{
  id v69 = a3;
  if (!v69) {
    __assert_rtn( "-[NIServerFindingRangingProvider _assignDebugParametersIfAvailable:]",  "NIServerFindingRanging.mm",  4751,  "debugParameters != nil");
  }
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerFindingRangingProvider _getDefaultNbammsRangingConfigParameters]( self,  "_getDefaultNbammsRangingConfigParameters"));
  BOOL v5 = (PRRangingManagerClient *)[v4 mutableCopy];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbTxAntenna"]);
  if (v6)
  {
    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbTxAntenna"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, @"nbTxAntenna");
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbRxAntenna"]);

  if (v8)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbRxAntenna"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, @"nbRxAntenna");
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbPacketType"]);

  if (v10)
  {
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbPacketType"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v11,  @"nbPacketType");
  }

  float v12 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbBandChannel"]);

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbBandChannel"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v13,  @"nbBandChannel");
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsTxAntenna"]);

  if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsTxAntenna"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v15,  @"mmsTxAntenna");
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsRxAntenna"]);

  if (v16)
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsRxAntenna"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v17,  @"mmsRxAntenna");
  }

  double v18 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsRxSyncAntenna"]);

  if (v18)
  {
    float v19 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsRxSyncAntenna"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v19,  @"mmsRxSyncAntenna");
  }

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsPacketType"]);

  if (v20)
  {
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsPacketType"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v21,  @"mmsPacketType");
  }

  int v22 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsPSR"]);

  if (v22)
  {
    float v23 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsPSR"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, @"mmsPSR");
  }

  char v24 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsGap"]);

  if (v24)
  {
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsGap"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v25, @"mmsGap");
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsSeqIdx"]);

  if (v26)
  {
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsSeqIdx"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v27, @"mmsSeqIdx");
  }

  int v28 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsBandChannel"]);

  if (v28)
  {
    int v29 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsBandChannel"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v29,  @"mmsBandChannel");
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbSlotSize"]);

  if (v30)
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbSlotSize"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v31, @"nbSlotSize");
  }

  BOOL v32 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsSlotSize"]);

  if (v32)
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsSlotSize"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v33,  @"mmsSlotSize");
  }

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsNumFragments"]);

  if (v34)
  {
    __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"mmsNumFragments"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v35,  @"mmsNumFragments");
  }

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"interval"]);

  if (v36)
  {
    double v37 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"interval"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v37, @"interval");
  }

  float v38 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"enableNonInterlacedMMS"]);

  if (v38)
  {
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"enableNonInterlacedMMS"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v39,  @"enableNonInterlacedMMS");
  }

  int v40 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"enableAntennaDiversity"]);

  if (v40)
  {
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"enableAntennaDiversity"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v41,  @"enableAntennaDiversity");
  }

  int v42 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"useDedicatedAntennas"]);

  if (v42)
  {
    id v43 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"useDedicatedAntennas"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v43,  @"useDedicatedAntennas");
  }

  float v44 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"overrideDefaultAntenna"]);

  if (v44)
  {
    BOOL v45 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"overrideDefaultAntenna"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v45,  @"overrideDefaultAntenna");
  }

  BOOL v46 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbChannelSelectionMask"]);

  if (v46)
  {
    unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"nbChannelSelectionMask"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v47,  @"nbChannelSelectionMask");
  }

  unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"napSlotSize"]);

  if (v48)
  {
    id v49 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"napSlotSize"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v49,  @"napSlotSize");
  }

  v50 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"dataSlotSize"]);

  if (v50)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"dataSlotSize"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v51,  @"dataSlotSize");
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"useType2Addr"]);

  if (v52)
  {
    id v53 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"useType2Addr"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v53,  @"useType2Addr");
  }

  int v54 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"schedulingInterval"]);

  if (v54)
  {
    id v55 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"schedulingInterval"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v55,  @"schedulingInterval");
  }

  unsigned int v56 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"dutyCycle"]);

  if (v56)
  {
    float v57 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"dutyCycle"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v57, @"dutyCycle");
  }

  unsigned int v58 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"antennaDiversityMask"]);

  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"antennaDiversityMask"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v59,  @"antennaDiversityMask");
  }

  char v60 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"ditherConst"]);

  if (v60)
  {
    NSErrorUserInfoKey v61 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"ditherConst"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v61,  @"ditherConst");
  }

  char v62 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"secondarySchedulingDelay"]);

  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"secondarySchedulingDelay"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v63,  @"secondarySchedulingDelay");
  }

  __int128 v64 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"secondarySchedulingInterval"]);

  if (v64)
  {
    int v65 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"secondarySchedulingInterval"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v65,  @"secondarySchedulingInterval");
  }

  char v66 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"secondaryDutyCycle"]);

  if (v66)
  {
    __int16 v67 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"secondaryDutyCycle"]);
    -[PRRangingManagerClient setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v67,  @"secondaryDutyCycle");
  }

  ptr = self->_uwbSystemListener.__ptr_;
  self->_uwbSystemListener.__ptr_ = v5;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((void *)self + 3) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 8) = 0LL;
  *((void *)self + 10) = 0LL;
  *((void *)self + 11) = 0LL;
  return self;
}

@end