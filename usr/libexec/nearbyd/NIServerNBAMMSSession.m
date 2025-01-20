@interface NIServerNBAMMSSession
- (BOOL)_encryptAndUpdateAidingAndSignallingPayload;
- (BOOL)_encryptAndUpdateMutualAuthPayload;
- (BOOL)_isCryptoDisabled;
- (BOOL)_shouldEncodeSignallingDataInMessageID;
- (BOOL)_shouldSendMutualAuthMessage;
- (BOOL)_shouldUseFinderToken:(id)a3 findeeToken:(id)a4;
- (BOOL)_validateTokensAndRangingParameters;
- (BOOL)sessionRegistered;
- (NIServerNBAMMSSession)initWithQueue:(id)a3 identityString:(id)a4 stateUpdateHandler:(id)a5 mutualAuthHandler:(id)a6;
- (SessionClientsStatus)sessionClientsStatus;
- (id).cxx_construct;
- (id)_decrypt:(id)a3;
- (id)_encrypt:(id)a3;
- (id)_getState;
- (id)identityString;
- (id)printableState;
- (id)registerNBAMMSSessionWithToken:(id)a3 isFinder:(BOOL)a4 client:(id)a5 serviceRequest:(const void *)a6 startRangingOptions:(const void *)a7 sharedProtocol:(int)a8;
- (id)sessionClientForFinder:(BOOL)a3;
- (id)sessionTokenForFinder:(BOOL)a3;
- (int)sessionState;
- (int)sharedProtocol;
- (optional<rose::RoseServiceRequest>)sessionServiceRequestForFinder:(SEL)a3;
- (optional<rose::RoseStartRangingOptions>)sessionStartRangingOptionsForFinder:(SEL)a3;
- (shared_ptr<rose::objects::NBAMMSSession>)_buildNbammsSession:(const void *)a3;
- (unsigned)_encodeSignallingDataInMessageID:(unsigned __int8)a3;
- (vector<NMISessionRole,)attachedRoles;
- (void)_armMutualAuthTimerForFinder:(BOOL)a3;
- (void)_didReceiveInvalidation:(int)a3;
- (void)_didReceiveNewSolution:(const void *)a3;
- (void)_didReceivePeerData:(const void *)a3;
- (void)_didReceiveUnsuccessfulSolution:(const void *)a3;
- (void)_handleCryptoFailure;
- (void)_handleNonMutualAuthMessage;
- (void)_initializeEncryptionSessionIfNecessary;
- (void)_logStatisticsIfNecessary;
- (void)_processNonMutualAuthMessageForFinder:(BOOL)a3;
- (void)_processPeerMessage:(void *)a3 machAbsTimestamp:(double)a4 wasEncrypted:(BOOL)a5;
- (void)_processPeerMutualAuthState:(const MutualAuthState *)a3 peerIsFinder:(BOOL)a4;
- (void)_receivedAidingAndSignallingMessage:(const void *)a3 machAbsTimestamp:(double)a4;
- (void)_receivedCryptoSessionConfigMessage:(const void *)a3;
- (void)_receivedMutualAuthMessage:(const void *)a3;
- (void)_reportMutualAuthStates;
- (void)_resetCryptoStateIncludingFailures:(BOOL)a3;
- (void)_resetStatistics;
- (void)_serviceRequestStatusUpdate:(const ServiceRequestStatusUpdate *)a3;
- (void)_updateCryptoSessionConfigPayload;
- (void)_updateSessionPayload;
- (void)informMutualAuthFailuresToClients;
- (void)refreshRangingForToken:(id)a3;
- (void)setSharedProtocol:(int)a3;
- (void)unregisterNBAMMSSessionForToken:(id)a3;
- (void)updateAlgorithmAidingData:(const void *)a3 token:(id)a4;
- (void)updateSignallingData:(const void *)a3 token:(id)a4;
@end

@implementation NIServerNBAMMSSession

- (NIServerNBAMMSSession)initWithQueue:(id)a3 identityString:(id)a4 stateUpdateHandler:(id)a5 mutualAuthHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___NIServerNBAMMSSession;
  v15 = -[NIServerNBAMMSSession init](&v42, "init");
  v16 = v15;
  v17 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_internalQueue, a3);
    objc_storeStrong((id *)&v16->_identityString, a4);
    __int128 v41 = 0uLL;
    sub_10000EE54((uint64_t)&v16->_nbammsSession, &v41);
    v18 = (std::__shared_weak_count *)*((void *)&v41 + 1);
    if (*((void *)&v41 + 1))
    {
      v19 = (unint64_t *)(*((void *)&v41 + 1) + 8LL);
      do
        unint64_t v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }

    v17->_sessionState = 0;
    sessionToken = v17->_sessionToken;
    v17->_sessionToken = 0LL;

    if (v17->_sessionStartRangingOptions.__engaged_) {
      v17->_sessionStartRangingOptions.__engaged_ = 0;
    }
    v17->_sharedProtocol = -1;
    v22 = sub_100288340();
    uint64_t v23 = v22[21];
    *(void *)&__int128 v41 = v22[20];
    *((void *)&v41 + 1) = v23;
    if (v23)
    {
      v24 = (unint64_t *)(v23 + 8);
      do
        unint64_t v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
    }

    sub_10000EE54((uint64_t)&v16->_pbLogger, &v41);
    v26 = (std::__shared_weak_count *)*((void *)&v41 + 1);
    if (*((void *)&v41 + 1))
    {
      v27 = (unint64_t *)(*((void *)&v41 + 1) + 8LL);
      do
        unint64_t v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }

    v17->_measurementsReceived = 0;
    selfEncryptionSession = v17->_selfEncryptionSession;
    v17->_selfEncryptionSession = 0LL;

    peerDecryptionSession = v17->_peerDecryptionSession;
    v17->_peerDecryptionSession = 0LL;

    if (-[NIServerNBAMMSSession _isCryptoDisabled](v17, "_isCryptoDisabled", (void)v41)) {
      char v31 = 3;
    }
    else {
      char v31 = 0;
    }
    v17->_cryptoSessionState = v31;
    v17->_cryptoFailures = 0;
    v17->_finderAttached = 0;
    objc_storeWeak((id *)&v16->_finderClient, 0LL);
    sub_1001EAC44((uint64_t)&v16->_finderMutualAuthState);
    secondary_scheduling_delay_usec = (void *)v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = 0LL;

    v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
    finderToken = v17->_finderToken;
    v17->_finderToken = 0LL;

    if (v17->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_) {
      v17->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    }
    if (v17->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_) {
      v17->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_ = 0;
    }
    HIBYTE(v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
    objc_storeWeak((id *)&v16->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle, 0LL);
    sub_1001EAC44((uint64_t)&v16->_finderStartRangingOptions.__engaged_);
    double velocityChangeH2 = v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.double velocityChangeH2 = 0.0;

    v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 0;
    outboundChallenge = v17->_findeeMutualAuthState.outboundChallenge;
    v17->_findeeMutualAuthState.outboundChallenge = 0LL;

    if (v17->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_) {
      v17->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 0;
    }
    if (v17->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12]) {
      v17->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 0;
    }
    if (v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_) {
      v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
    }
    if (BYTE1(v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1)) {
      BYTE1(v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = 0;
    }
    if (*(&v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2)) {
      *(&v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2) = 0;
    }
    id v36 = objc_retainBlock(v13);
    double val = v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
    *(void *)&v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_ = v36;

    id v38 = objc_retainBlock(v14);
    v39 = *(void **)&v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_;
    *(void *)&v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = v38;

    *(_DWORD *)&v17->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_ = 0;
    *(void *)&v17->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty = 0LL;
    *(_OWORD *)&v16->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__null_state_ = 0u;
  }

  return v17;
}

- (id)registerNBAMMSSessionWithToken:(id)a3 isFinder:(BOOL)a4 client:(id)a5 serviceRequest:(const void *)a6 startRangingOptions:(const void *)a7 sharedProtocol:(int)a8
{
  v98 = (void *)a7;
  BOOL v11 = a4;
  id v99 = a3;
  id v14 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v15 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v14;
    identityString = self->_identityString;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v99 descriptionInternal]);
    *(_DWORD *)buf = 138412802;
    v112 = identityString;
    __int16 v113 = 2112;
    v114 = v18;
    __int16 v115 = 2080;
    v116 = sub_100277A54(v11);
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#find-range,Registering %@ with token %@, role %s",  buf,  0x20u);

    id v14 = v16;
  }

  if (!v99)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039D1A0();
    }
LABEL_14:
    p_nbammsSession = (shared_ptr<rose::objects::NBAMMSSession> *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10012LL,  0LL,  v98));
    goto LABEL_95;
  }

  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039D1CC();
    }
    NSErrorUserInfoKey v109 = NSLocalizedFailureReasonErrorKey;
    v110 = @"Client is nil";
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v110,  &v109,  1LL,  v98));
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.NearbyInteraction",  -10020LL,  v21));
    goto LABEL_26;
  }

  p_nbammsSession = &self->_nbammsSession;
  if (self->_nbammsSession.__ptr_)
  {
    p_sharedProtocol = &self->_sharedProtocol;
    if (self->_sharedProtocol == a8)
    {
      if (!self->_finderAttached && !self->_finderToken && v11)
      {
        self->_finderAttached = 1;
        objc_storeWeak((id *)&self->_finderClient, v14);
        sub_1001EAC44((uint64_t)&self->_finderMutualAuthState);
        self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 1;
        objc_storeStrong((id *)&self->_finderToken, a3);
        id v28 = v14;
        BOOL engaged = self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_;
        memcpy(&self->_finderRoseServiceRequest, a6, 0x1F8uLL);
        if (!engaged) {
          self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
        }
        int scheduling_interval_usec_low = LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec);
        __int128 v32 = *((_OWORD *)v98 + 1);
        __int128 v31 = *((_OWORD *)v98 + 2);
        *(_OWORD *)&self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = *(_OWORD *)v98;
        *(_OWORD *)self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.irk = v32;
        *(_OWORD *)&self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = v31;
        __int128 v33 = *((_OWORD *)v98 + 6);
        __int128 v35 = *((_OWORD *)v98 + 3);
        $25E378AB494A1B43CDE6C204EF466DCF v34 = *(($25E378AB494A1B43CDE6C204EF466DCF *)v98 + 4);
        *(_OWORD *)&self->_finderStartRangingOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)v98 + 5);
        *(_OWORD *)&self->_finderStartRangingOptions.var0.__val_.start_time_or_offset_usec = v33;
        *(_OWORD *)&self->_finderStartRangingOptions.var0.__null_state_ = v35;
        *($25E378AB494A1B43CDE6C204EF466DCF *)((char *)&self->_finderStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0
                                             + 12) = v34;
        id v14 = v28;
        if (self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_)
        {
          p_BOOL engaged = &self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
LABEL_53:
          *p_BOOL engaged = 0;
          goto LABEL_54;
        }

        goto LABEL_54;
      }

      if (!HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
        && !self->_findeeMutualAuthState.outboundChallenge
        && !v11)
      {
        HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 1;
        objc_storeWeak((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle, v14);
        sub_1001EAC44((uint64_t)&self->_finderStartRangingOptions.__engaged_);
        if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2)) {
          *(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2) = 0;
        }
        self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 1;
        objc_storeStrong((id *)&self->_findeeMutualAuthState.outboundChallenge, a3);
        id v37 = v14;
        BOOL v38 = self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_;
        memcpy(&self->_findeeMutualAuthState.outboundResponse, a6, 0x1F8uLL);
        if (!v38) {
          self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 1;
        }
        int v39 = self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12];
        __int128 v41 = *((_OWORD *)v98 + 1);
        __int128 v40 = *((_OWORD *)v98 + 2);
        self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.peer_addr = *(optional<unsigned long long> *)v98;
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.contention_based_ranging_type.var0.__null_state_ = v41;
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.nb_bch.var0.__null_state_ = v40;
        __int128 v42 = *((_OWORD *)v98 + 6);
        __int128 v44 = *((_OWORD *)v98 + 3);
        __int128 v43 = *((_OWORD *)v98 + 4);
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = *((_OWORD *)v98 + 5);
        *(_OWORD *)&self->_findeeStartRangingOptions.var0.__null_state_ = v42;
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = v44;
        *(_OWORD *)self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.irk = v43;
        if (!v39) {
          self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 1;
        }
        id v14 = v37;
        if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_) {
          self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
        }
        if (BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1))
        {
          p_BOOL engaged = (BOOL *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1
                    + 1;
          goto LABEL_53;
        }

- (void)unregisterNBAMMSSessionForToken:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    identityString = self->_identityString;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 descriptionInternal]);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = identityString;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-range,Unregistering session %@ with token %@",  buf,  0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if ([v4 isEqual:self->_finderToken])
  {
    finderToken = self->_finderToken;
    self->_finderToken = 0LL;

    objc_storeWeak((id *)&self->_finderClient, 0LL);
    self->_BOOL finderAttached = 0;
    sub_1001EAC44((uint64_t)&self->_finderMutualAuthState);
    self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
    secondary_scheduling_delay_usec = (dispatch_source_s *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    if (secondary_scheduling_delay_usec)
    {
      dispatch_source_cancel(secondary_scheduling_delay_usec);
      v10 = (void *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
      self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = 0LL;
    }

    if (self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_) {
      self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    }
    if (self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_) {
      self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_ = 0;
    }
    BOOL v11 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      id v12 = "#find-range,Finder role with token %@ is detached";
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }
  }

  else
  {
    if (![v4 isEqual:self->_findeeMutualAuthState.outboundChallenge])
    {
      v18 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v4 descriptionInternal]);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#find-range,Not ranging with token %@, return",  buf,  0xCu);
      }

      goto LABEL_82;
    }

    outboundChallenge = self->_findeeMutualAuthState.outboundChallenge;
    self->_findeeMutualAuthState.outboundChallenge = 0LL;

    objc_storeWeak((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle, 0LL);
    HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
    sub_1001EAC44((uint64_t)&self->_finderStartRangingOptions.__engaged_);
    if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2)) {
      *(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2) = 0;
    }
    self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 0;
    double velocityChangeH2 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    if (velocityChangeH2 != 0.0)
    {
      dispatch_source_cancel(*(dispatch_source_t *)&velocityChangeH2);
      double v15 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
      self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.double velocityChangeH2 = 0.0;
    }

    if (self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_) {
      self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 0;
    }
    if (self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12]) {
      self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 0;
    }
    if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_) {
      self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
    }
    if (BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1)) {
      BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = 0;
    }
    BOOL v11 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      id v12 = "#find-range,Findee role is detached with token %@ is detached";
      goto LABEL_31;
    }
  }

  BOOL finderAttached = self->_finderAttached;
  if (!self->_finderAttached
    && !HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    self->_measurementsReceived = 0;
    self->_sessionState = 0;
    self->_sharedProtocol = -1;
    double val = self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
    if (val != 0.0) {
      (*(void (**)(double, NIServerNBAMMSSession *, void))(*(void *)&val + 16LL))( COERCE_DOUBLE(*(void *)&val),  self,  0LL);
    }
    ptr = self->_nbammsSession.__ptr_;
    if (ptr)
    {
      sub_10026FAA8((uint64_t)ptr);
      sub_10015D394(&self->_nbammsSession.__ptr_);
      sessionToken = self->_sessionToken;
      self->_sessionToken = 0LL;

      if (self->_sessionStartRangingOptions.__engaged_) {
        self->_sessionStartRangingOptions.__engaged_ = 0;
      }
      -[NIServerNBAMMSSession _resetStatistics](self, "_resetStatistics");
      -[NIServerNBAMMSSession _resetCryptoStateIncludingFailures:](self, "_resetCryptoStateIncludingFailures:", 1LL);
    }

    goto LABEL_80;
  }

  if (self->_measurementsReceived)
  {
    v17 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "#find-range,Reciprocal -> one-way, measurements already received, do nothing",  buf,  2u);
    }

- (void)refreshRangingForToken:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_nbammsSession.__ptr_
    && self->_sessionStartRangingOptions.__engaged_
    && -[NIDiscoveryToken isEqual:](self->_sessionToken, "isEqual:", v4))
  {
    if (!self->_sessionStartRangingOptions.__engaged_) {
      sub_100006080();
    }
    int v5 = sub_100272BA0( (uint64_t)self->_nbammsSession.__ptr_,  (__int128 *)&self->_sessionStartRangingOptions.var0.__null_state_);
    v6 = (os_log_s *)(id)qword_1008000A0;
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        identityString = self->_identityString;
        id v9 = (id)objc_claimAutoreleasedReturnValue([v4 descriptionInternal]);
        sub_100275DD0(v5, __p);
        if (v14 >= 0) {
          v10 = __p;
        }
        else {
          v10 = (void **)__p[0];
        }
        *(_DWORD *)buf = 138412802;
        id v16 = identityString;
        __int16 v17 = 2112;
        id v18 = v9;
        __int16 v19 = 2080;
        unint64_t v20 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "#find-range,refreshRanging for %@ with token %@: Failed to refresh ranging. Return code: %s",  buf,  0x20u);
        if (v14 < 0) {
          operator delete(__p[0]);
        }
      }
    }

    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = self->_identityString;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 descriptionInternal]);
      *(_DWORD *)buf = 138412546;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#find-range,refreshRanging: Success for %@, token: %@!",  buf,  0x16u);
    }
  }
}

- (BOOL)sessionRegistered
{
  return self->_nbammsSession.__ptr_ != 0LL;
}

- (vector<NMISessionRole,)attachedRoles
{
  retstr->var0 = 0LL;
  retstr->var1 = 0LL;
  retstr->var2.var0 = 0LL;
  if (self->_finderAttached && self->_finderToken)
  {
    v6 = (int *)sub_100031724((uint64_t)&retstr->var2, 1uLL);
    result = (vector<NMISessionRole, std::allocator<NMISessionRole>> *)retstr->var0;
    var1 = retstr->var1;
    id v9 = &v6[v8];
    int *v6 = 0;
    v10 = v6 + 1;
    while (var1 != (int *)result)
    {
      int v11 = *--var1;
      *--v6 = v11;
    }

    retstr->var0 = v6;
    retstr->var1 = v10;
    retstr->var2.var0 = v9;
    if (result) {
      operator delete(result);
    }
    retstr->var1 = v10;
  }

  else
  {
    v10 = 0LL;
  }

  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
    && self->_findeeMutualAuthState.outboundChallenge)
  {
    var0 = retstr->var2.var0;
    if (v10 >= var0)
    {
      result = (vector<NMISessionRole, std::allocator<NMISessionRole>> *)retstr->var0;
      uint64_t v14 = v10 - retstr->var0;
      unint64_t v15 = v14 + 1;
      uint64_t v16 = (char *)var0 - (char *)result;
      if (v16 >> 1 > v15) {
        unint64_t v15 = v16 >> 1;
      }
      else {
        unint64_t v17 = v15;
      }
      if (v17)
      {
        id v18 = (char *)sub_100031724((uint64_t)&retstr->var2, v17);
        result = (vector<NMISessionRole, std::allocator<NMISessionRole>> *)retstr->var0;
        v10 = retstr->var1;
      }

      else
      {
        id v18 = 0LL;
      }

      __int16 v19 = (int *)&v18[4 * v14];
      unint64_t v20 = (int *)&v18[4 * v17];
      int *v19 = 1;
      id v13 = v19 + 1;
      while (v10 != (int *)result)
      {
        int v21 = *--v10;
        *--__int16 v19 = v21;
      }

      retstr->var0 = v19;
      retstr->var1 = v13;
      retstr->var2.var0 = v20;
      if (result) {
        operator delete(result);
      }
    }

    else
    {
      int *v10 = 1;
      id v13 = v10 + 1;
    }

    retstr->var1 = v13;
  }

  return result;
}

- (int)sessionState
{
  return self->_sessionState;
}

- (int)sharedProtocol
{
  return self->_sharedProtocol;
}

- (void)setSharedProtocol:(int)a3
{
  self->_sharedProtocol = a3;
}

- (id)sessionTokenForFinder:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v5 = 130LL;
  if (v3) {
    uint64_t v5 = 38LL;
  }
  return (&self->super.isa)[v5];
}

- (id)sessionClientForFinder:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v5 = 122LL;
  if (v3) {
    uint64_t v5 = 30LL;
  }
  return objc_loadWeakRetained((id *)&(&self->super.isa)[v5]);
}

- (optional<rose::RoseServiceRequest>)sessionServiceRequestForFinder:(SEL)a3
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v7 = 1048LL;
  if (v4) {
    uint64_t v7 = 312LL;
  }
  return (optional<rose::RoseServiceRequest> *)memcpy(retstr, (char *)self + v7, 0x200uLL);
}

- (optional<rose::RoseStartRangingOptions>)sessionStartRangingOptionsForFinder:(SEL)a3
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v8 = 1560LL;
  if (v4) {
    uint64_t v8 = 824LL;
  }
  id v9 = (char *)self + v8;
  __int128 v10 = *((_OWORD *)v9 + 5);
  *(_OWORD *)&retstr->var0.__val_.scheduling_interval_usec = *((_OWORD *)v9 + 4);
  *(_OWORD *)&retstr->var0.__val_.dither_constant_msec.var0.__null_state_ = v10;
  *(_OWORD *)&retstr->var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = *((_OWORD *)v9 + 6);
  *(void *)&retstr->__engaged_ = *((void *)v9 + 14);
  $25E378AB494A1B43CDE6C204EF466DCF v11 = *(($25E378AB494A1B43CDE6C204EF466DCF *)v9 + 1);
  *(_OWORD *)&retstr->var0.__null_state_ = *(_OWORD *)v9;
  *($25E378AB494A1B43CDE6C204EF466DCF *)((char *)&retstr->var0.__val_.peer.var0.__val_.uuid.var0 + 12) = v11;
  __int128 v12 = *((_OWORD *)v9 + 3);
  *(_OWORD *)&retstr->var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->var0.__val_.start_time_or_offset_usec = v12;
  return result;
}

- (void)informMutualAuthFailuresToClients
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
  BOOL v4 = WeakRetained;
  if ((self->_finderMutualAuthState.outboundAuthState - 5 < 2
     || self->_finderMutualAuthState.inboundAuthState == 2)
    && WeakRetained)
  {
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained clientQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001EC950;
    block[3] = &unk_1007A2248;
    id v12 = v4;
    id v13 = self;
    dispatch_async(v5, block);
  }

  id v6 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

  if (self->_finderStartRangingOptions.__engaged_ - 5 < 2 || LOBYTE(self->_finderMutualAuthTimer) == 2)
  {
    if (v6)
    {
      uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 clientQueue]);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1001EC960;
      v8[3] = &unk_1007A2248;
      id v9 = v6;
      __int128 v10 = self;
      dispatch_async(v7, v8);
    }
  }
}

- (id)identityString
{
  return self->_identityString;
}

- (SessionClientsStatus)sessionClientsStatus
{
  int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
  if (outboundAuthState == 1) {
    goto LABEL_4;
  }
  if (outboundAuthState == 4)
  {
    int inboundAuthState = self->_finderMutualAuthState.inboundAuthState;
    if (inboundAuthState == 1)
    {
LABEL_4:
      uint64_t v5 = 0LL;
      goto LABEL_10;
    }
  }

  else
  {
    if ((outboundAuthState - 5) < 2)
    {
LABEL_8:
      uint64_t v5 = (uint64_t)&_mh_execute_header;
      goto LABEL_10;
    }

    int inboundAuthState = self->_finderMutualAuthState.inboundAuthState;
  }

  if (inboundAuthState == 2) {
    goto LABEL_8;
  }
  uint64_t v5 = 0x200000000LL;
LABEL_10:
  int engaged = self->_finderStartRangingOptions.__engaged_;
  if (engaged != 1)
  {
    if (engaged == 4)
    {
      int finderMutualAuthTimer_low = LOBYTE(self->_finderMutualAuthTimer);
      if (finderMutualAuthTimer_low == 1) {
        goto LABEL_13;
      }
    }

    else
    {
      if ((engaged - 5) < 2)
      {
LABEL_17:
        uint64_t v8 = (uint64_t)&_mh_execute_header;
        goto LABEL_19;
      }

      int finderMutualAuthTimer_low = LOBYTE(self->_finderMutualAuthTimer);
    }

    if (finderMutualAuthTimer_low != 2)
    {
      uint64_t v8 = 0x200000000LL;
      goto LABEL_19;
    }

    goto LABEL_17;
  }

- (void)updateAlgorithmAidingData:(const void *)a3 token:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if ([v6 isEqual:self->_finderToken])
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039D350();
    }
  }

  else if ([v6 isEqual:self->_findeeMutualAuthState.outboundChallenge])
  {
    uint64_t v7 = (_OWORD *)((char *)&self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.rose_mac_address.var0 + 3);
    __int128 v8 = *(_OWORD *)a3;
    __int128 v9 = *((_OWORD *)a3 + 2);
    if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_)
    {
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.start_time_type = v9;
      _OWORD *v7 = v8;
      __int128 v10 = *((_OWORD *)a3 + 3);
      __int128 v11 = *((_OWORD *)a3 + 4);
      __int128 v12 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_duty_cycle.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__null_state_ = v12;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_ = v10;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ = v11;
      __int128 v13 = *((_OWORD *)a3 + 7);
      __int128 v14 = *((_OWORD *)a3 + 8);
      __int128 v15 = *((_OWORD *)a3 + 9);
      *(_OWORD *)((char *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH2
                + 2) = *(_OWORD *)((char *)a3 + 154);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v14;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = v15;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.bounded_displacement.__engaged_ = v13;
    }

    else
    {
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.start_time_type = v9;
      _OWORD *v7 = v8;
      __int128 v16 = *((_OWORD *)a3 + 3);
      __int128 v17 = *((_OWORD *)a3 + 4);
      __int128 v18 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_duty_cycle.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__null_state_ = v18;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_ = v16;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ = v17;
      __int128 v19 = *((_OWORD *)a3 + 7);
      __int128 v20 = *((_OWORD *)a3 + 8);
      __int128 v21 = *((_OWORD *)a3 + 10);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = *((_OWORD *)a3 + 9);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementV = v21;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.bounded_displacement.__engaged_ = v19;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v20;
      self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 1;
    }

    -[NIServerNBAMMSSession _updateSessionPayload](self, "_updateSessionPayload");
  }
}

- (void)updateSignallingData:(const void *)a3 token:(id)a4
{
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if ([v11 isEqual:self->_finderToken])
  {
    BOOL engaged = self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
    char v7 = *((_BYTE *)a3 + 8);
    self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc = *(optional<rose::ConnectionEventTriggerDescriptor> *)a3;
    self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.var0.__null_state_ = v7;
    if (!engaged)
    {
      p_BOOL engaged = &self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
LABEL_7:
      *p_BOOL engaged = 1;
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  if ([v11 isEqual:self->_findeeMutualAuthState.outboundChallenge])
  {
    int v9 = BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1);
    char v10 = *((_BYTE *)a3 + 8);
    self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp = *(double *)a3;
    LOBYTE(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = v10;
    if (!v9)
    {
      p_BOOL engaged = (BOOL *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1
                + 1;
      goto LABEL_7;
    }

- (void)_updateSessionPayload
{
  if (!self->_nbammsSession.__ptr_) {
    return;
  }
  unsigned int cryptoSessionState = self->_cryptoSessionState;
  if (cryptoSessionState - 1 < 2)
  {
LABEL_6:
    -[NIServerNBAMMSSession _updateCryptoSessionConfigPayload](self, "_updateCryptoSessionConfigPayload");
    goto LABEL_7;
  }

  if (cryptoSessionState != 3)
  {
    if (self->_cryptoSessionState) {
      goto LABEL_7;
    }
    -[NIServerNBAMMSSession _initializeEncryptionSessionIfNecessary](self, "_initializeEncryptionSessionIfNecessary");
    goto LABEL_6;
  }

  if (-[NIServerNBAMMSSession _shouldSendMutualAuthMessage](self, "_shouldSendMutualAuthMessage"))
  {
    if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_) {
      -[NIServerNBAMMSSession _armMutualAuthTimerForFinder:](self, "_armMutualAuthTimerForFinder:", 0LL);
    }
    if (-[NIServerNBAMMSSession _encryptAndUpdateMutualAuthPayload](self, "_encryptAndUpdateMutualAuthPayload")) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }

  if (!-[NIServerNBAMMSSession _encryptAndUpdateAidingAndSignallingPayload]( self,  "_encryptAndUpdateAidingAndSignallingPayload"))
  {
LABEL_20:
    char v10 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
      sub_10039D3B4();
    }

    -[NIServerNBAMMSSession _handleCryptoFailure](self, "_handleCryptoFailure");
  }

- (BOOL)_encryptAndUpdateAidingAndSignallingPayload
{
  if (!self->_nbammsSession.__ptr_) {
    return 0;
  }
  if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_)
  {
    __int128 v3 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.bounded_displacement.__engaged_;
    __int128 v4 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH1;
    __int128 v34 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp;
    __int128 v35 = v4;
    __int128 v36 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementV;
    __int128 v5 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_;
    __int128 v6 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_duty_cycle.var0.__null_state_;
    __int128 v30 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_;
    __int128 v31 = v6;
    __int128 v32 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__null_state_;
    __int128 v33 = v3;
    __int128 v7 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.__engaged_;
    __int128 v26 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.rose_mac_address.var0.__val_.__elems_[3];
    __int128 v27 = v7;
    __int128 v28 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.start_time_type;
    __int128 v29 = v5;
  }

  else
  {
    LOBYTE(v26) = 0;
    LOBYTE(v27) = 0;
    BYTE8(v27) = 0;
    BYTE8(v30) = 0;
    LOBYTE(v31) = 0;
    LOBYTE(v33) = 0;
    LOBYTE(v36) = 0;
    WORD4(v36) = 0;
    *((void *)&v33 + 1) = 0LL;
    *(void *)&__int128 v34 = 0LL;
    BYTE8(v34) = 0;
  }

  int v9 = sub_100005150();
  sub_100320824(v9[144]);
  uint64_t v23 = 0LL;
  unint64_t v24 = sub_1001ED1E4( (uint64_t)&self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc,  (uint64_t)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp);
  char v25 = v10;
  __int128 v21 = 0LL;
  uint64_t v22 = 0LL;
  if (sub_1001E1B20((uint64_t)&v21, (uint64_t)&v26, (unsigned __int8 *)&v24))
  {
    sub_1000065CC(&__p, "Send");
    sub_1001E2CC0((uint64_t **)&__p, (unsigned __int8 **)&v21);
    if (v20 < 0) {
      operator delete(__p);
    }
    unsigned __int8 v17 = 2;
    if (-[NIServerNBAMMSSession _shouldEncodeSignallingDataInMessageID](self, "_shouldEncodeSignallingDataInMessageID")) {
      unsigned __int8 v17 = -[NIServerNBAMMSSession _encodeSignallingDataInMessageID:](self, "_encodeSignallingDataInMessageID:", v17);
    }
    sub_10016C2CC(&__p, 1uLL, &v17);
    sub_1001FC3C0((uint64_t)&__p, (char *)__dst, (char *)v21, v22, v22 - (_BYTE *)v21);
    int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  __p,  (_BYTE *)__dst - (_BYTE *)__p));
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession _encrypt:](self, "_encrypt:", v11));
    __int16 v13 = v12;
    if (v12 && [v12 length])
    {
      char v15 = 0;
      sub_10016C2CC(v16, (size_t)[v13 length], &v15);
      objc_msgSend(v13, "getBytes:length:", v16[0], objc_msgSend(v13, "length"));
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
        sub_10039D41C();
      }
      sub_1002732D0((uint64_t)self->_nbammsSession.__ptr_, (uint64_t)v16);
      if (v16[0])
      {
        v16[1] = v16[0];
        operator delete(v16[0]);
      }

      BOOL v8 = 1;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039D3F0();
      }
      BOOL v8 = 0;
    }

    if (__p)
    {
      __dst = __p;
      operator delete(__p);
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039D448();
    }
    BOOL v8 = 0;
  }

  if (v21)
  {
    uint64_t v22 = (char *)v21;
    operator delete(v21);
  }

  return v8;
}

- (void)_receivedAidingAndSignallingMessage:(const void *)a3 machAbsTimestamp:(double)a4
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_10039D4A0();
  }
  ++*(_DWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_;
  -[NIServerNBAMMSSession _logStatisticsIfNecessary](self, "_logStatisticsIfNecessary");
  -[NIServerNBAMMSSession _handleNonMutualAuthMessage](self, "_handleNonMutualAuthMessage");
  uint64_t v7 = *((void *)a3 + 1);
  BOOL v8 = (const void *)(*(void *)a3 + 1LL);
  $25E378AB494A1B43CDE6C204EF466DCF v67 = 0LL;
  uint64_t v68 = 0LL;
  __int128 v66 = 0LL;
  sub_1001FC59C(&v66, v8, v7, v7 - (void)v8);
  sub_1000065CC(&__p, "Receive");
  sub_1001E2CC0((uint64_t **)&__p, &v66);
  if (SBYTE7(v56) < 0) {
    operator delete((void *)__p);
  }
  LOBYTE(__p) = 0;
  LOBYTE(v56) = 0;
  BYTE8(v56) = 0;
  BYTE8(v59) = 0;
  LOBYTE(v60) = 0;
  LOBYTE(v62) = 0;
  LOBYTE(v65) = 0;
  WORD4(v65) = 0;
  *(void *)&__int128 v63 = 0LL;
  *((void *)&v62 + 1) = 0LL;
  BYTE8(v63) = 0;
  int v9 = sub_100005150();
  BOOL v10 = sub_100320824(v9[144]);
  uint64_t v53 = 0LL;
  BOOL v54 = v10;
  if ((sub_1001E2534((uint64_t)&v66, (uint64_t)&__p, (uint64_t)&v53) & 1) != 0)
  {
    *((double *)&v62 + 1) = a4;
    BOOL v11 = 1;
    LOBYTE(v63) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    __int16 v13 = WeakRetained;
    int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (outboundAuthState != 1)
    {
      if (outboundAuthState != 4) {
        goto LABEL_12;
      }
      BOOL v11 = self->_finderMutualAuthState.inboundAuthState == 1;
    }

    if (v11 && WeakRetained)
    {
      char v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained clientQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001ED6C0;
      block[3] = &unk_1007B64F0;
      id v16 = v13;
      uint64_t v51 = v53;
      BOOL v52 = v54;
      __int128 v48 = v63;
      __int128 v49 = v64;
      __int128 v50 = v65;
      __int128 v44 = v59;
      __int128 v45 = v60;
      __int128 v47 = v62;
      __int128 v46 = v61;
      __int128 v40 = __p;
      __int128 v41 = v56;
      __int128 v43 = v58;
      __int128 v42 = v57;
      id v38 = v16;
      $25E378AB494A1B43CDE6C204EF466DCF v39 = self;
      dispatch_async(v15, block);
    }

- (id)printableState
{
  __int128 v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  identityString = self->_identityString;
  ptr = self->_nbammsSession.__ptr_;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_sessionToken, "descriptionInternal"));
  uint64_t v7 = (void *)v6;
  BOOL v8 = "NO";
  if (ptr) {
    BOOL v8 = "YES";
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Name: %@. Created: %s. Creation token: %@",  identityString,  v8,  v6));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  if (self->_finderAttached) {
    BOOL v10 = "YES";
  }
  else {
    BOOL v10 = "NO";
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
  if (WeakRetained) {
    __int128 v12 = "YES";
  }
  else {
    __int128 v12 = "NO";
  }
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_finderToken, "descriptionInternal"));
  BOOL engaged = self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
  if (self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_)
  {
    sub_1001EDD1C(&self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc, &__p);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
  }

  else
  {
    p_p = (std::string *)"0";
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Finder attached: %s, client: %s, token: %@, signalling: %s",  v10,  v12,  v13,  p_p));
  -[NSMutableArray addObject:](v3, "addObject:", v16);

  else {
    id v17 = "NO";
  }
  id v18 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);
  if (v18) {
    __int128 v19 = "YES";
  }
  else {
    __int128 v19 = "NO";
  }
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSData descriptionInternal](self->_findeeMutualAuthState.outboundChallenge, "descriptionInternal"));
  int v21 = BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1);
  if (BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1))
  {
    sub_1001EDD1C( &self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp,  &v59);
    if ((v59.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      id v22 = &v59;
    }
    else {
      id v22 = (std::string *)v59.__r_.__value_.__r.__words[0];
    }
  }

  else
  {
    id v22 = (std::string *)"0";
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Findee attached: %s, client: %s, token: %@, signalling: %s, aiding: %d",  v17,  v19,  v20,  v22,  self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_));
  -[NSMutableArray addObject:](v3, "addObject:", v23);

  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Shared protocol: %d",  self->_sharedProtocol));
  -[NSMutableArray addObject:](v3, "addObject:", v24);

  int sessionState = self->_sessionState;
  __int128 v26 = "IDLE";
  if (sessionState == 1) {
    __int128 v26 = "ACQ";
  }
  if (sessionState == 2) {
    __int128 v27 = "RNG";
  }
  else {
    __int128 v27 = v26;
  }
  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Session state: %s",  v27));
  -[NSMutableArray addObject:](v3, "addObject:", v28);

  __int128 v29 = "NO";
  if (self->_measurementsReceived) {
    __int128 v29 = "YES";
  }
  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Measurements received: %s",  v29));
  -[NSMutableArray addObject:](v3, "addObject:", v30);

  id v31 = sub_1001ECE40(self->_cryptoSessionState);
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
  uint64_t v35 = CUPrintNSObjectMasked(v33, v34);
  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  double v37 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_peerDecryptionSession, "sessionIdentifier"));
  uint64_t v39 = CUPrintNSObjectMasked(v37, v38);
  __int128 v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Crypto state: %@. Self: %@. Peer: %@. Failures: %d",  v32,  v36,  v40,  self->_cryptoFailures));
  -[NSMutableArray addObject:](v3, "addObject:", v41);

  id v43 = sub_1001EE274(&self->_finderMutualAuthState.outboundAuthState, v42);
  uint64_t v44 = objc_claimAutoreleasedReturnValue(v43);
  __int128 v45 = (void *)v44;
  if (BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    else {
      __int128 v46 = "F";
    }
  }

  else
  {
    __int128 v46 = "N/A";
  }

  __int128 v47 = "NO";
  __int128 v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Finder mutual auth: %@, last reported state: %s, should arm timer: %s",  v44,  v46,  v47));
  -[NSMutableArray addObject:](v3, "addObject:", v48);

  id v50 = sub_1001EE274((unsigned __int8 *)&self->_finderStartRangingOptions.__engaged_, v49);
  uint64_t v51 = objc_claimAutoreleasedReturnValue(v50);
  BOOL v52 = (void *)v51;
  if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2))
  {
    if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 1)) {
      uint64_t v53 = "S";
    }
    else {
      uint64_t v53 = "F";
    }
  }

  else
  {
    uint64_t v53 = "N/A";
  }

  BOOL v54 = "NO";
  if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_) {
    BOOL v54 = "YES";
  }
  char v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Findee mutual auth: %@, last reported state: %s, should arm timer: %s",  v51,  v53,  v54));
  -[NSMutableArray addObject:](v3, "addObject:", v55);

  __int128 v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Solution count: %d successful, %d unsuccessful",  LODWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM),  HIDWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM)));
  -[NSMutableArray addObject:](v3, "addObject:", v56);

  __int128 v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"    Message count: %d crypto, %d mutual auth, %d aiding/signalling",  self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty,  *(&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty + 1),  *(unsigned int *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_));
  -[NSMutableArray addObject:](v3, "addObject:", v57);

  return v3;
}

- (void)_serviceRequestStatusUpdate:(const ServiceRequestStatusUpdate *)a3
{
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    uint64_t v21 = *(void *)&a3->var0;
    int var2 = a3->var2;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    uint64_t v6 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained clientQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001EE634;
      block[3] = &unk_1007B6518;
      id v18 = self;
      uint64_t v19 = v21;
      int v20 = var2;
      id v17 = v6;
      dispatch_async(v7, block);
    }

    id v8 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    if (v8)
    {
      int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 clientQueue]);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1001EE648;
      v11[3] = &unk_1007B6518;
      id v10 = v8;
      __int16 v13 = self;
      uint64_t v14 = v21;
      int v15 = var2;
      id v12 = v10;
      dispatch_async(v9, v11);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039D4CC();
  }

- (void)_didReceiveNewSolution:(const void *)a3
{
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    if (!self->_measurementsReceived)
    {
      __int128 v5 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        identityString = self->_identityString;
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = identityString;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-range,First NBAMMS measurement received for %@",  buf,  0xCu);
      }

      self->_measurementsReceived = 1;
      self->_int sessionState = 2;
      double val = self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
      if (val != 0.0) {
        (*(void (**)(double, NIServerNBAMMSSession *, uint64_t))(*(void *)&val + 16LL))( COERCE_DOUBLE(*(void *)&val),  self,  2LL);
      }
    }

    ++LODWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM);
    -[NIServerNBAMMSSession _logStatisticsIfNecessary](self, "_logStatisticsIfNecessary");
    __int128 v8 = *((_OWORD *)a3 + 1);
    *(_OWORD *)buf = *(_OWORD *)a3;
    __int128 v47 = v8;
    __int128 v48 = *((_OWORD *)a3 + 2);
    sub_1001376C0(v49, (uint64_t)a3 + 48);
    sub_1001317DC(v50, (uint64_t)a3 + 608);
    sub_100137714(v53, (__n128 *)((char *)a3 + 760));
    memcpy(v57, (char *)a3 + 880, sizeof(v57));
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    id v10 = WeakRetained;
    int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (outboundAuthState != 1)
    {
      if (outboundAuthState != 4) {
        goto LABEL_19;
      }
      int outboundAuthState = self->_finderMutualAuthState.inboundAuthState == 1;
    }

    if (outboundAuthState && WeakRetained)
    {
      id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained clientQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3321888768LL;
      block[2] = sub_1001EEBA0;
      block[3] = &unk_1007B6540;
      id v32 = v10;
      __int128 v34 = *(_OWORD *)buf;
      __int128 v35 = v47;
      __int128 v36 = v48;
      sub_1001376C0(v37, (uint64_t)v49);
      sub_1001317DC(v38, (uint64_t)v50);
      sub_100137714(v41, v53);
      memcpy(v45, v57, sizeof(v45));
      __int128 v33 = self;
      dispatch_async(v12, block);

      if (v44 && __p)
      {
        id v43 = __p;
        operator delete(__p);
      }

      if (v40) {
        sub_100034A98((uint64_t)v39, v39[1]);
      }
      sub_100124BFC((uint64_t)v37);
    }

- (void)_didReceiveUnsuccessfulSolution:(const void *)a3
{
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    ++HIDWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM);
    -[NIServerNBAMMSSession _logStatisticsIfNecessary](self, "_logStatisticsIfNecessary");
    __int128 v5 = *((_OWORD *)a3 + 1);
    __int128 v43 = *(_OWORD *)a3;
    __int128 v44 = v5;
    __int128 v45 = *((_OWORD *)a3 + 2);
    sub_1001376C0(v46, (uint64_t)a3 + 48);
    sub_1001317DC(v47, (uint64_t)a3 + 608);
    sub_100137714(v50, (__n128 *)((char *)a3 + 760));
    memcpy(v54, (char *)a3 + 880, sizeof(v54));
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    uint64_t v7 = WeakRetained;
    int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (outboundAuthState != 1)
    {
      if (outboundAuthState != 4) {
        goto LABEL_14;
      }
      int outboundAuthState = self->_finderMutualAuthState.inboundAuthState == 1;
    }

    if (outboundAuthState && WeakRetained)
    {
      int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained clientQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3321888768LL;
      block[2] = sub_1001EF168;
      block[3] = &unk_1007B6540;
      id v29 = v7;
      __int128 v31 = v43;
      __int128 v32 = v44;
      __int128 v33 = v45;
      sub_1001376C0(v34, (uint64_t)v46);
      sub_1001317DC(v35, (uint64_t)v47);
      sub_100137714(v38, v50);
      memcpy(v42, v54, sizeof(v42));
      __int128 v30 = self;
      dispatch_async(v9, block);

      if (v41 && __p)
      {
        char v40 = __p;
        operator delete(__p);
      }

      if (v37) {
        sub_100034A98((uint64_t)v36, v36[1]);
      }
      sub_100124BFC((uint64_t)v34);
    }

- (void)_didReceivePeerData:(const void *)a3
{
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    __int128 v5 = (_BYTE *)*((void *)a3 + 1);
    uint64_t v6 = *((void *)a3 + 2);
    if ((_BYTE *)v6 == v5)
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
        sub_10039D698();
      }
    }

    else if (*v5)
    {
      unsigned int cryptoSessionState = self->_cryptoSessionState;
      switch(self->_cryptoSessionState)
      {
        case 0u:
          -[NIServerNBAMMSSession _initializeEncryptionSessionIfNecessary]( self,  "_initializeEncryptionSessionIfNecessary");
          goto LABEL_7;
        case 1u:
LABEL_7:
          -[NIServerNBAMMSSession _updateCryptoSessionConfigPayload](self, "_updateCryptoSessionConfigPayload");
          break;
        case 2u:
          self->_unsigned int cryptoSessionState = 3;
          goto LABEL_15;
        case 3u:
LABEL_15:
          __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:"));
          int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession _decrypt:](self, "_decrypt:", v8));
          id v10 = v9;
          if (v9 && [v9 length])
          {
            v19[0] = 0;
            sub_10016C2CC(__p, (size_t)[v10 length], v19);
            objc_msgSend(v10, "getBytes:length:", __p[0], objc_msgSend(v10, "length"));
            -[NIServerNBAMMSSession _processPeerMessage:machAbsTimestamp:wasEncrypted:]( self,  "_processPeerMessage:machAbsTimestamp:wasEncrypted:",  __p,  1LL,  *((double *)a3 + 4));
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }

          else
          {
            BOOL v11 = (os_log_s *)(id)qword_1008000A0;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_peerDecryptionSession, "sessionIdentifier"));
              sub_10039D6F8();
            }

            -[NIServerNBAMMSSession _handleCryptoFailure](self, "_handleCryptoFailure");
          }

          break;
        default:
          break;
      }

      if (self->_cryptoSessionState != cryptoSessionState)
      {
        id v12 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = sub_1001ECE40(cryptoSessionState);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          id v15 = sub_1001ECE40(self->_cryptoSessionState);
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          identityString = self->_identityString;
          LODWORD(__p[0]) = 138478339;
          *(void **)((char *)__p + 4) = v14;
          WORD2(__p[1]) = 2113;
          *(void **)((char *)&__p[1] + 6) = v16;
          HIWORD(__p[2]) = 2112;
          __p[3] = identityString;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#find-range,#crypto Session state update while receiving data. %{private}@ -> %{private}@. %@",  (uint8_t *)__p,  0x20u);
        }
      }
    }

    else
    {
      memset(__p, 0, 24);
      sub_1001FC59C(__p, v5 + 1, v6, v6 - (void)(v5 + 1));
      -[NIServerNBAMMSSession _processPeerMessage:machAbsTimestamp:wasEncrypted:]( self,  "_processPeerMessage:machAbsTimestamp:wasEncrypted:",  __p,  0LL,  *((double *)a3 + 4));
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039D634();
  }

- (void)_processPeerMessage:(void *)a3 machAbsTimestamp:(double)a4 wasEncrypted:(BOOL)a5
{
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    BOOL v6 = a5;
    int v9 = **(unsigned __int8 **)a3;
    memset(&v64[7], 0, 17);
    id v10 = sub_100005150();
    BOOL v11 = sub_100320824(v10[144]);
    if ((v9 & 0x10) != 0)
    {
      uint64_t v12 = 0x10100000000LL;
    }

    else
    {
      if ((v9 & 0x18) == 0) {
        goto LABEL_21;
      }
      uint64_t v12 = 0LL;
    }

    uint64_t v13 = (v9 << 28 >> 31) & 0x101;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    id v15 = WeakRetained;
    int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (outboundAuthState != 1)
    {
      if (outboundAuthState != 4) {
        goto LABEL_14;
      }
      int outboundAuthState = self->_finderMutualAuthState.inboundAuthState == 1;
    }

    if (outboundAuthState && WeakRetained)
    {
      __int128 v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained clientQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001EF90C;
      block[3] = &unk_1007B64F0;
      uint64_t v53 = *(void *)&v64[16];
      uint64_t v56 = v12 | (v13 << 16);
      char v46 = 0;
      char v47 = 0;
      char v48 = 0;
      char v49 = 0;
      char v50 = 0;
      char v51 = 0;
      __int128 v52 = *(_OWORD *)v64;
      char v54 = 0;
      __int16 v55 = 0;
      BOOL v57 = v11;
      id v44 = v15;
      __int128 v45 = self;
      dispatch_async(v17, block);
    }

- (void)_didReceiveInvalidation:(int)a3
{
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    BOOL v6 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained clientQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001EFAA8;
      block[3] = &unk_1007B6578;
      int v17 = a3;
      id v15 = v6;
      __int128 v16 = self;
      dispatch_async(v7, block);
    }

    id v8 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    if (v8)
    {
      int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 clientQueue]);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_1001EFABC;
      v10[3] = &unk_1007B6578;
      int v13 = a3;
      id v11 = v8;
      uint64_t v12 = self;
      dispatch_async(v9, v10);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039D794();
  }

- (BOOL)_validateTokensAndRangingParameters
{
  finderToken = self->_finderToken;
  if (finderToken && self->_findeeMutualAuthState.outboundChallenge)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken getIRK](finderToken, "getIRK"));
    __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSData getIRK](self->_findeeMutualAuthState.outboundChallenge, "getIRK"));
    if ([v4 length] == (id)16
      && [v5 length] == (id)16
      && ![v4 isEqualToData:v5])
    {
      if (self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_
        && self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_)
      {
        if (LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec)
          && self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12])
        {
          BOOL v7 = 1;
          goto LABEL_10;
        }

        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
          sub_10039D8A0();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
      {
        sub_10039D7F8();
      }
    }

    else
    {
      BOOL v6 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        identityString = self->_identityString;
        int v13 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_finderToken, "descriptionInternal"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSData descriptionInternal]( self->_findeeMutualAuthState.outboundChallenge,  "descriptionInternal"));
        int v15 = 138412802;
        __int128 v16 = identityString;
        __int16 v17 = 2112;
        id v18 = v13;
        __int16 v19 = 2112;
        __int128 v20 = v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "#find-range,Finder or findee token of %@ has invalid length or they have equal IRKs, finder: %@, findee: %@",  (uint8_t *)&v15,  0x20u);
      }
    }

    BOOL v7 = 0;
LABEL_10:

    goto LABEL_14;
  }

  id v4 = (id)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    int v9 = self->_identityString;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_finderToken, "descriptionInternal"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSData descriptionInternal](self->_findeeMutualAuthState.outboundChallenge, "descriptionInternal"));
    int v15 = 138412802;
    __int128 v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    __int128 v20 = v11;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_ERROR,  "#find-range,One or both tokens for %@ are nil - finder: %@, findee: %@",  (uint8_t *)&v15,  0x20u);
  }

  BOOL v7 = 0;
LABEL_14:

  return v7;
}

- (BOOL)_shouldUseFinderToken:(id)a3 findeeToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (!v5)
  {
    uint64_t v12 = "finderToken != nil";
    int v13 = 1961;
    goto LABEL_9;
  }

  if (!v6)
  {
    uint64_t v12 = "findeeToken != nil";
    int v13 = 1962;
LABEL_9:
    __assert_rtn("-[NIServerNBAMMSSession _shouldUseFinderToken:findeeToken:]", "NIServerFindingRanging.mm", v13, v12);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 getIRK]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 getIRK]);
  objc_msgSend(v8, "getBytes:range:", &v16, 0, 8);
  objc_msgSend(v8, "getBytes:range:", &v17, 8, 8);
  objc_msgSend(v9, "getBytes:range:", &v14, 0, 8);
  objc_msgSend(v9, "getBytes:range:", &v15, 8, 8);
  if (v17 == v15) {
    BOOL v10 = v16 > v14;
  }
  else {
    BOOL v10 = v17 > v15;
  }

  return v10;
}

- (shared_ptr<rose::objects::NBAMMSSession>)_buildNbammsSession:(const void *)a3
{
  id v6 = v3;
  BOOL v7 = (std::string *)sub_1000065CC(&buf, (char *)-[NSString UTF8String](self->_identityString, "UTF8String"));
  id v8 = std::string::insert(v7, 0LL, "Finding.");
  __int128 v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  std::string::size_type cap = v8->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v9;
  v8->__r_.__value_.__l.__size_ = 0LL;
  v8->__r_.__value_.__l.__cap_ = 0LL;
  v8->__r_.__value_.__r.__words[0] = 0LL;
  if (v75 < 0) {
    operator delete((void *)buf);
  }
  BOOL v10 = self;
  id v11 = operator new(0x5D8uLL);
  v11[1] = 0LL;
  v11[2] = 0LL;
  *id v11 = off_1007B66E0;
  uint64_t v12 = (uint64_t)(v11 + 3);
  int v13 = v10;
  *(void *)&__int128 buf = off_1007B6730;
  *((void *)&buf + 1) = v13;
  p___int128 buf = &buf;
  v71 = off_1007B67B0;
  v72 = v13;
  unint64_t v73 = &v71;
  uint64_t v68 = off_1007B6830;
  __int128 v69 = v72;
  __int128 v70 = &v68;
  __int128 v65 = off_1007B68B0;
  __int128 v66 = v69;
  $25E378AB494A1B43CDE6C204EF466DCF v67 = &v65;
  unint64_t v14 = v66;
  v63[0] = off_1007B6930;
  v63[1] = v14;
  __int128 v64 = v63;
  __int16 v62 = 0LL;
  __int16 v60 = 0LL;
  __int128 v58 = 0LL;
  uint64_t v56 = 0LL;
  cntrl = (std::__shared_weak_count *)v14->_pbLogger.__cntrl_;
  ptr = v10->_pbLogger.__ptr_;
  char v54 = cntrl;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      unint64_t v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }

  sub_10026F104( v12,  (__int128 *)__p,  (void *)a3,  (uint64_t)&buf,  (uint64_t)&v71,  (uint64_t)&v68,  (uint64_t)&v65,  (uint64_t)v63,  (uint64_t)v61,  (uint64_t)v59,  (uint64_t)v57,  (uint64_t)v55,  &ptr);
  v11[3] = &off_1007B69B0;
  void v11[4] = off_1007B6A78;
  id v18 = v54;
  if (v54)
  {
    __int16 v19 = (unint64_t *)&v54->__shared_owners_;
    do
      unint64_t v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  id v21 = v56;
  if (v56 == v55)
  {
    uint64_t v22 = 4LL;
    id v21 = v55;
  }

  else
  {
    if (!v56) {
      goto LABEL_16;
    }
    uint64_t v22 = 5LL;
  }

  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_16:
  int v23 = v58;
  if (v58 == v57)
  {
    uint64_t v24 = 4LL;
    int v23 = v57;
  }

  else
  {
    if (!v58) {
      goto LABEL_21;
    }
    uint64_t v24 = 5LL;
  }

  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_21:
  char v25 = v60;
  if (v60 == v59)
  {
    uint64_t v26 = 4LL;
    char v25 = v59;
  }

  else
  {
    if (!v60) {
      goto LABEL_26;
    }
    uint64_t v26 = 5LL;
  }

  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_26:
  __int128 v27 = v62;
  if (v62 == v61)
  {
    uint64_t v28 = 4LL;
    __int128 v27 = v61;
  }

  else
  {
    if (!v62) {
      goto LABEL_31;
    }
    uint64_t v28 = 5LL;
  }

  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_31:
  id v29 = v64;
  if (v64 == v63)
  {
    uint64_t v30 = 4LL;
    id v29 = v63;
  }

  else
  {
    if (!v64) {
      goto LABEL_36;
    }
    uint64_t v30 = 5LL;
  }

  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_36:
  char v31 = v67;
  if (v67 == &v65)
  {
    uint64_t v32 = 4LL;
    char v31 = &v65;
  }

  else
  {
    if (!v67) {
      goto LABEL_41;
    }
    uint64_t v32 = 5LL;
  }

  (*v31)[v32]();
LABEL_41:
  char v33 = v70;
  if (v70 == &v68)
  {
    uint64_t v34 = 4LL;
    char v33 = &v68;
  }

  else
  {
    if (!v70) {
      goto LABEL_46;
    }
    uint64_t v34 = 5LL;
  }

  (*v33)[v34]();
LABEL_46:
  char v35 = v73;
  if (v73 == &v71)
  {
    uint64_t v36 = 4LL;
    char v35 = &v71;
  }

  else
  {
    if (!v73) {
      goto LABEL_51;
    }
    uint64_t v36 = 5LL;
  }

  (*v35)[v36]();
LABEL_51:
  __int128 v37 = p_buf;
  if (p_buf == &buf)
  {
    uint64_t v38 = 4LL;
    __int128 v37 = &buf;
  }

  else
  {
    if (!p_buf) {
      goto LABEL_56;
    }
    uint64_t v38 = 5LL;
  }

  (*(void (**)(void))(*(void *)v37 + 8 * v38))();
LABEL_56:
  *(void *)&__int128 v50 = v11 + 3;
  *((void *)&v50 + 1) = v11;
  sub_100012538((uint64_t)&v50, v11 + 5, v12);
  char v39 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    identityString = self->_identityString;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = identityString;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "#find-range,Initialize NBAMMS session for %@.",  (uint8_t *)&buf,  0xCu);
  }

  if ((void)v50)
  {
    int v41 = sub_10026FF14(v50);
    if (v41)
    {
      BOOL v42 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        sub_100275DD0(v41, &buf);
        sub_10039D94C();
      }
    }

    else
    {
      __int128 *v6 = v50;
      id v6 = &v50;
    }
  }

  else
  {
    __int128 v43 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = self->_identityString;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "#find-range,Failed to create a NBAMMS session for %@.",  (uint8_t *)&buf,  0xCu);
    }
  }

  *(void *)id v6 = 0LL;
  *((void *)v6 + 1) = 0LL;
  __int128 v45 = (std::__shared_weak_count *)*((void *)&v50 + 1);
  if (*((void *)&v50 + 1))
  {
    char v46 = (unint64_t *)(*((void *)&v50 + 1) + 8LL);
    do
      unint64_t v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }

  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
  result.__cntrl_ = v49;
  result.__ptr_ = v48;
  return result;
}

- (id)_getState
{
  identityString = self->_identityString;
  id v4 = "NO";
  if (self->_nbammsSession.__ptr_) {
    id v5 = "YES";
  }
  else {
    id v5 = "NO";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_sessionToken, "descriptionInternal"));
  if (self->_finderAttached) {
    BOOL v7 = "YES";
  }
  else {
    BOOL v7 = "NO";
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_finderToken, "descriptionInternal"));
  id v10 = sub_1001EE274(&self->_finderMutualAuthState.outboundAuthState, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSData descriptionInternal](self->_findeeMutualAuthState.outboundChallenge, "descriptionInternal"));
  id v14 = sub_1001EE274((unsigned __int8 *)&self->_finderStartRangingOptions.__engaged_, v13);
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %s, token: %@. Finder: %s, token: %@, authState: %@. Findee: %s, token: %@, authState: %@",  identityString,  v5,  v6,  v7,  v8,  v11,  v4,  v12,  v15));

  return v16;
}

- (void)_logStatisticsIfNecessary
{
  double v3 = sub_100023CC4();
  if (v3 - self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.northerlyOffsetM > 5.0)
  {
    id v4 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      identityString = self->_identityString;
      int easterlyOffsetM_low = LODWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM);
      int easterlyOffsetM_high = HIDWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM);
      unsigned int uncertainty = self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty;
      int v9 = *(&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty + 1);
      int v10 = *(_DWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_;
      int v11 = 138413570;
      uint64_t v12 = identityString;
      __int16 v13 = 1024;
      int v14 = easterlyOffsetM_low;
      __int16 v15 = 1024;
      int v16 = easterlyOffsetM_high;
      __int16 v17 = 1024;
      unsigned int v18 = uncertainty;
      __int16 v19 = 1024;
      int v20 = v9;
      __int16 v21 = 1024;
      int v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "#find-range,%@, Solution count: %d successful, %d unsuccessful. Message count: %d crypto, %d mutual auth, %d aiding/signalling",  (uint8_t *)&v11,  0x2Au);
    }

    self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.northerlyOffsetM = v3;
  }

- (void)_resetStatistics
{
  *(_DWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_ = 0;
  *(void *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.unsigned int uncertainty = 0LL;
  *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__null_state_ = 0u;
}

- (BOOL)_shouldEncodeSignallingDataInMessageID
{
  return self->_sharedProtocol > 0;
}

- (unsigned)_encodeSignallingDataInMessageID:(unsigned __int8)a3
{
  id v5 = sub_100005150();
  sub_100320824(v5[144]);
  unint64_t v6 = sub_1001ED1E4( (uint64_t)&self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc,  (uint64_t)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp);
  BOOL v7 = (v6 & 0xFF0000) == 0 || (v6 & 0xFF000000) == 0;
  unsigned __int8 v8 = a3 | 8;
  if (v7) {
    unsigned __int8 v8 = a3;
  }
  if ((v6 & 0xFF00000000LL) == 0 || (v6 & 0xFF0000000000LL) == 0) {
    return v8;
  }
  else {
    return v8 | 0x10;
  }
}

- (void)_updateCryptoSessionConfigPayload
{
  if (self->_nbammsSession.__ptr_)
  {
    -[NIServerNBAMMSSession _initializeEncryptionSessionIfNecessary](self, "_initializeEncryptionSessionIfNecessary");
    unsigned __int8 cryptoSessionState = self->_cryptoSessionState;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
    unsigned __int8 v5 = [v4 length];

    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
    char v15 = 0;
    sub_10016C2CC(&__p, (size_t)[v6 length] + 8, &v15);

    *(_BYTE *)std::string __p = 0;
    BOOL v7 = __p;
    *((_BYTE *)__p + 1) = 0;
    v7[2] = cryptoSessionState;
    v7[3] = v5;
    *((_DWORD *)v7 + 1) = 0;
    unsigned __int8 v8 = (char *)__p;
    id v9 = objc_claimAutoreleasedReturnValue( -[NIServerCryptoSession sessionIdentifier]( self->_selfEncryptionSession, "sessionIdentifier"));
    id v10 = [v9 bytes];
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
    memcpy(v8 + 8, v10, (size_t)[v11 length]);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_selfEncryptionSession, "sessionIdentifier"));
    __int16 v13 = (char *)[v12 length] + 8;

    if (v13 != (char *)(v17 - (_BYTE *)__p)) {
      __assert_rtn( "-[NIServerNBAMMSSession _updateCryptoSessionConfigPayload]",  "NIServerFindingRanging.mm",  2128,  "byteOffset == payload.size()");
    }
    if (*((_BYTE *)__p + 1)) {
      __assert_rtn( "-[NIServerNBAMMSSession _updateCryptoSessionConfigPayload]",  "NIServerFindingRanging.mm",  2132,  "payload[kMessageIDIndex] == static_cast<uint8_t>(FindingMessageID::CryptoSessionConfig)");
    }
    if (-[NIServerNBAMMSSession _shouldEncodeSignallingDataInMessageID](self, "_shouldEncodeSignallingDataInMessageID"))
    {
      unsigned __int8 v14 = -[NIServerNBAMMSSession _encodeSignallingDataInMessageID:]( self,  "_encodeSignallingDataInMessageID:",  *((unsigned __int8 *)__p + 1));
      *((_BYTE *)__p + 1) = v14;
    }

    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_10039D990();
    }
    sub_1002732D0((uint64_t)self->_nbammsSession.__ptr_, (uint64_t)&__p);
    if (__p)
    {
      __int16 v17 = __p;
      operator delete(__p);
    }
  }

- (void)_receivedCryptoSessionConfigMessage:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_10039D9BC();
  }
  ++self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty;
  -[NIServerNBAMMSSession _logStatisticsIfNecessary](self, "_logStatisticsIfNecessary");
  uint64_t v5 = *(void *)a3;
  unint64_t v6 = *((void *)a3 + 1) - *(void *)a3;
  if (v6 <= 6)
  {
    uint64_t v7 = qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
    {
      int v8 = *((_DWORD *)a3 + 2) - *(_DWORD *)a3;
      identityString = self->_identityString;
      int v46 = 67109378;
      *(_DWORD *)unint64_t v47 = v8;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = identityString;
      id v10 = "#find-range,#crypto Invalid peer session config message size %d, %@";
      int v11 = (os_log_s *)v7;
      uint32_t v12 = 18;
LABEL_12:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v46, v12);
      return;
    }

    return;
  }

  uint64_t v13 = *(unsigned __int8 *)(v5 + 2);
  if (*(_BYTE *)(v5 + 2)) {
    BOOL v14 = v6 >= v13 + 7;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    unsigned int v18 = *(unsigned __int8 *)(v5 + 1);
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v5 + 7,  *(unsigned __int8 *)(v5 + 2)));
    int v20 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_peerDecryptionSession, "sessionIdentifier"));
    unsigned __int8 v21 = [v19 isEqualToData:v20];

    if ((v21 & 1) == 0)
    {
      int v22 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession sessionIdentifier](self->_peerDecryptionSession, "sessionIdentifier"));
        uint64_t v25 = CUPrintNSObjectMasked(v23, v24);
        id v26 = (id)objc_claimAutoreleasedReturnValue(v25);
        uint64_t v28 = CUPrintNSObjectMasked(v19, v27);
        id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_sessionToken, "descriptionInternal"));
        char v31 = self->_identityString;
        int v46 = 138478595;
        *(void *)unint64_t v47 = v26;
        *(_WORD *)&v47[8] = 2113;
        *(void *)&v47[10] = v29;
        *(_WORD *)&v47[18] = 2113;
        char v48 = v30;
        __int16 v49 = 2112;
        __int128 v50 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#find-range,#crypto Init peer session. Old ID: %{private}@. New ID: %{private}@. Token: %{private}@, %@",  (uint8_t *)&v46,  0x2Au);
      }

      uint64_t v32 = objc_alloc(&OBJC_CLASS___NIServerCryptoSession);
      char v33 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken getIRK](self->_sessionToken, "getIRK"));
      uint64_t v34 = -[NIServerCryptoSession initWithKeyDerivationKey:sessionIdentifier:encrypt:]( v32,  "initWithKeyDerivationKey:sessionIdentifier:encrypt:",  v33,  v19,  0LL);
      peerDecryptionSession = self->_peerDecryptionSession;
      self->_peerDecryptionSession = v34;
    }

    unsigned int cryptoSessionState = self->_cryptoSessionState;
    -[NIServerNBAMMSSession _initializeEncryptionSessionIfNecessary](self, "_initializeEncryptionSessionIfNecessary");
    int v37 = 2;
    self->_unsigned int cryptoSessionState = 2;
    if (v18 == 2)
    {
      if (!cryptoSessionState) {
        goto LABEL_20;
      }
    }

    else if (v18 != 3)
    {
LABEL_20:
      if (v37 != cryptoSessionState)
      {
        uint64_t v38 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          id v39 = sub_1001ECE40(v18);
          id v40 = (id)objc_claimAutoreleasedReturnValue(v39);
          id v41 = sub_1001ECE40(cryptoSessionState);
          BOOL v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          id v43 = sub_1001ECE40(self->_cryptoSessionState);
          id v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
          __int128 v45 = self->_identityString;
          int v46 = 138478595;
          *(void *)unint64_t v47 = v40;
          *(_WORD *)&v47[8] = 2113;
          *(void *)&v47[10] = v42;
          *(_WORD *)&v47[18] = 2113;
          char v48 = v44;
          __int16 v49 = 2112;
          __int128 v50 = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "#find-range,#crypto Session state update while receiving peer config [peer state %{private}@]. %{private}@ - > %{private}@. %@",  (uint8_t *)&v46,  0x2Au);
        }
      }

      return;
    }

    int v37 = 3;
    self->_unsigned int cryptoSessionState = 3;
    goto LABEL_20;
  }

  uint64_t v15 = qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    int v16 = *((_DWORD *)a3 + 2) - *(_DWORD *)a3;
    __int16 v17 = self->_identityString;
    int v46 = 67109634;
    *(_DWORD *)unint64_t v47 = v13;
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)&v47[6] = v16;
    *(_WORD *)&v47[10] = 2112;
    *(void *)&v47[12] = v17;
    id v10 = "#find-range,#crypto Invalid peer session ID size %d (config message size %d), %@";
    int v11 = (os_log_s *)v15;
    uint32_t v12 = 24;
    goto LABEL_12;
  }

- (void)_initializeEncryptionSessionIfNecessary
{
  if (!self->_cryptoSessionState)
  {
    uint64_t v3 = NSRandomData(8LL, 0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    uint64_t v5 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = CUPrintNSObjectMasked(v4, v6);
      int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](self->_sessionToken, "descriptionInternal"));
      identityString = self->_identityString;
      int v15 = 138478339;
      int v16 = v8;
      __int16 v17 = 2113;
      unsigned int v18 = v9;
      __int16 v19 = 2112;
      int v20 = identityString;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-range,#crypto Init self session. ID: %{private}@. Token: %{private}@. %@",  (uint8_t *)&v15,  0x20u);
    }

    int v11 = objc_alloc(&OBJC_CLASS___NIServerCryptoSession);
    uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken getIRK](self->_sessionToken, "getIRK"));
    uint64_t v13 = -[NIServerCryptoSession initWithKeyDerivationKey:sessionIdentifier:encrypt:]( v11,  "initWithKeyDerivationKey:sessionIdentifier:encrypt:",  v12,  v4,  1LL);
    selfEncryptionSession = self->_selfEncryptionSession;
    self->_selfEncryptionSession = v13;

    self->_unsigned int cryptoSessionState = 1;
  }

- (id)_encrypt:(id)a3
{
  id v4 = a3;
  if (-[NIServerNBAMMSSession _isCryptoDisabled](self, "_isCryptoDisabled")) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession encrypt:](self->_selfEncryptionSession, "encrypt:", v4));
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)_decrypt:(id)a3
{
  id v4 = a3;
  if (-[NIServerNBAMMSSession _isCryptoDisabled](self, "_isCryptoDisabled")) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[NIServerCryptoSession decrypt:](self->_peerDecryptionSession, "decrypt:", v4));
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)_resetCryptoStateIncludingFailures:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int cryptoFailures = self->_cryptoFailures;
    identityString = self->_identityString;
    v11[0] = 67240706;
    v11[1] = cryptoFailures;
    __int16 v12 = 1026;
    BOOL v13 = v3;
    __int16 v14 = 2112;
    int v15 = identityString;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-range,#crypto Reset state. Failures: %{public}d. Reset: %{public}d, %@",  (uint8_t *)v11,  0x18u);
  }

  selfEncryptionSession = self->_selfEncryptionSession;
  self->_selfEncryptionSession = 0LL;

  peerDecryptionSession = self->_peerDecryptionSession;
  self->_peerDecryptionSession = 0LL;

  if (-[NIServerNBAMMSSession _isCryptoDisabled](self, "_isCryptoDisabled")) {
    unsigned __int8 v10 = 3;
  }
  else {
    unsigned __int8 v10 = 0;
  }
  self->_unsigned int cryptoSessionState = v10;
  if (v3) {
    self->_int cryptoFailures = 0;
  }
}

- (void)_handleCryptoFailure
{
  int cryptoFailures = self->_cryptoFailures;
  self->_int cryptoFailures = cryptoFailures + 1;
  if (cryptoFailures >= 10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained clientQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1001F14F8;
      block[3] = &unk_1007A2248;
      id v13 = v5;
      __int16 v14 = self;
      dispatch_async(v6, block);
    }

    id v7 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    if (v7)
    {
      int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 clientQueue]);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1001F1508;
      v9[3] = &unk_1007A2248;
      id v10 = v7;
      int v11 = self;
      dispatch_async(v8, v9);
    }
  }

- (BOOL)_isCryptoDisabled
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001F158C;
  block[3] = &unk_1007A3000;
  void block[4] = self;
  if (qword_1007F9EC8 != -1) {
    dispatch_once(&qword_1007F9EC8, block);
  }
  return byte_1007F9ED0;
}

- (BOOL)_shouldSendMutualAuthMessage
{
  BOOL finderAttached = self->_finderAttached;
  if (finderAttached)
  {
    int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    BOOL finderAttached = outboundAuthState != 1
                  && (outboundAuthState != 4 || self->_finderMutualAuthState.inboundAuthState != 1);
  }

  char val_high = HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_);
  if (val_high)
  {
    int engaged = self->_finderStartRangingOptions.__engaged_;
    char val_high = engaged != 1 && (engaged != 4 || LOBYTE(self->_finderMutualAuthTimer) != 1);
  }

  return finderAttached | val_high;
}

- (void)_handleNonMutualAuthMessage
{
}

- (void)_processNonMutualAuthMessageForFinder:(BOOL)a3
{
  uint64_t v3 = 971LL;
  if (a3) {
    uint64_t v3 = 232LL;
  }
  if (*((_BYTE *)&self->super.isa + v3))
  {
    BOOL v4 = a3;
    uint64_t v6 = 123LL;
    if (a3) {
      uint64_t v6 = 31LL;
    }
    id v7 = (char *)self + v6 * 8;
    int v8 = LOBYTE((&self->super.isa)[v6]);
    if (v8 != 1)
    {
      if (v8 == 4)
      {
        int v9 = v7[24];
        if (v9 == 1) {
          return;
        }
      }

      else if (v8 == 3)
      {
        int v9 = v7[24];
        if (v9 == 1)
        {
          id v10 = (os_log_s *)(id)qword_1008000A0;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = sub_100277A54(v4);
            identityString = self->_identityString;
            int v20 = 136315394;
            unsigned __int8 v21 = v11;
            __int16 v22 = 2112;
            int v23 = identityString;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#find-range,#auth Non-auth message. Self [%s] outbound response accepted. %@",  (uint8_t *)&v20,  0x16u);
          }

          char *v7 = 4;
          return;
        }
      }

      else
      {
        int v9 = v7[24];
      }

      if (v9 != 2)
      {
        int v13 = *((_DWORD *)v7 + 12);
        *((_DWORD *)v7 + 12) = v13 + 1;
        if (v13 >= 50) {
          char *v7 = 6;
        }
        __int16 v14 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = sub_100277A54(v4);
          id v17 = sub_1001EE274((unsigned __int8 *)v7, v16);
          unsigned int v18 = (NSString *)objc_claimAutoreleasedReturnValue(v17);
          __int16 v19 = self->_identityString;
          int v20 = 136315650;
          unsigned __int8 v21 = v15;
          __int16 v22 = 2112;
          int v23 = v18;
          __int16 v24 = 2112;
          uint64_t v25 = v19;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "#find-range,#auth Non-auth message. Self [%s] missed attempt %@. %@",  (uint8_t *)&v20,  0x20u);
        }
      }
    }
  }

- (void)_reportMutualAuthStates
{
  uint64_t v3 = (__int16 *)((char *)&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec + 1);
  if (self->_finderAttached
    && *(void *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_)
  {
    int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (((outboundAuthState - 5) < 2 || self->_finderMutualAuthState.inboundAuthState == 2)
      && (!BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
       || *(_BYTE *)v3))
    {
      id v5 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        identityString = self->_identityString;
        int v20 = 138412290;
        unsigned __int8 v21 = identityString;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#find-range,#auth Mutual-auth for finder failed, report to session manager, %@",  (uint8_t *)&v20,  0xCu);
      }

      (*(void (**)(void))(*(void *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_
                        + 16LL))();
      __int16 v7 = 256;
LABEL_10:
      *uint64_t v3 = v7;
      goto LABEL_15;
    }

    if (outboundAuthState == 4
      && self->_finderMutualAuthState.inboundAuthState == 1
      && (!BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
       || !*(_BYTE *)v3))
    {
      __int16 v12 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = self->_identityString;
        int v20 = 138412290;
        unsigned __int8 v21 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#find-range,#auth Mutual-auth for finder succeeded, cancel timer and report to session manager, %@",  (uint8_t *)&v20,  0xCu);
      }

      secondary_scheduling_delay_usec = (dispatch_source_s *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
      if (secondary_scheduling_delay_usec)
      {
        dispatch_source_cancel(secondary_scheduling_delay_usec);
        int v15 = (void *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
        self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = 0LL;

        self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
      }

      (*(void (**)(void))(*(void *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_
                        + 16LL))();
      __int16 v7 = 257;
      goto LABEL_10;
    }
  }

- (BOOL)_encryptAndUpdateMutualAuthPayload
{
  if (!self->_nbammsSession.__ptr_) {
    return 0;
  }
  if (self->_finderAttached)
  {
    p_finderMutualAuthState = &self->_finderMutualAuthState;
    unsigned int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    BOOL v5 = outboundAuthState > 0xB;
    int v6 = (1 << outboundAuthState) & 0xC02;
    BOOL v7 = v5 || v6 == 0;
    if (v7 && !self->_finderMutualAuthState.outboundChallenge)
    {
      int v23 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        identityString = self->_identityString;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = identityString;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "#find-range,#auth Self [Finder] start mutual auth (generate outbound challenge), %@",  (uint8_t *)&buf,  0xCu);
      }

      sub_1001F210C((uint64_t)&self->_finderMutualAuthState);
      p_finderMutualAuthState->unsigned int outboundAuthState = 2;
    }
  }

  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    unsigned int engaged = self->_finderStartRangingOptions.__engaged_;
    BOOL v5 = engaged > 0xB;
    int v9 = (1 << engaged) & 0xC02;
    BOOL v10 = v5 || v9 == 0;
    if (v10 && !*(void *)&self->_finderSignallingData.var0.__null_state_)
    {
      uint64_t v25 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = self->_identityString;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "#find-range,#auth Self [Findee] start mutual auth (generate outbound challenge), %@",  (uint8_t *)&buf,  0xCu);
      }

      sub_1001F210C((uint64_t)&self->_finderStartRangingOptions.__engaged_);
      self->_finderStartRangingOptions.__engaged_ = 2;
    }
  }

  v29[0] = 1;
  memset(&v29[2], 0, 19);
  unsigned int v11 = self->_finderMutualAuthState.outboundAuthState;
  if (v11 >= 0x10) {
    sub_10039D9E8();
  }
  unsigned int inboundAuthState = self->_finderMutualAuthState.inboundAuthState;
  if (inboundAuthState >= 0x10) {
    sub_10039DA10();
  }
  v29[1] = inboundAuthState | (16 * v11);
  if ((id)-[NSData length](self->_finderMutualAuthState.outboundChallenge, "length") == (id)3) {
    -[NSData getBytes:length:](self->_finderMutualAuthState.outboundChallenge, "getBytes:length:", &v29[2], 3LL);
  }
  if ((id)-[NSData length](self->_finderMutualAuthState.outboundResponse, "length") == (id)6) {
    -[NSData getBytes:length:](self->_finderMutualAuthState.outboundResponse, "getBytes:length:", &v29[5], 6LL);
  }
  unsigned int v13 = self->_finderStartRangingOptions.__engaged_;
  if (v13 >= 0x10) {
    sub_10039DA38();
  }
  unsigned int finderMutualAuthTimer_low = LOBYTE(self->_finderMutualAuthTimer);
  if (finderMutualAuthTimer_low >= 0x10) {
    sub_10039DA60();
  }
  v29[11] = finderMutualAuthTimer_low | (16 * v13);
  if ([*(id *)&self->_finderSignallingData.var0.__null_state_ length] == (id)3) {
    [*(id *)&self->_finderSignallingData.var0.__null_state_ getBytes:&v29[12] length:3];
  }
  if ([*(id *)&self->_finderSignallingData.var0.__val_.isPhone length] == (id)6) {
    [*(id *)&self->_finderSignallingData.var0.__val_.isPhone getBytes:&v29[15] length:6];
  }
  LOBYTE(__p[0]) = 0;
  sub_10016C2CC(&buf, 0x15uLL, __p);
  int v15 = (_OWORD *)buf;
  __int128 v16 = *(_OWORD *)v29;
  *(void *)(buf + 13) = *(void *)&v29[13];
  _OWORD *v15 = v16;
  if (-[NIServerNBAMMSSession _shouldEncodeSignallingDataInMessageID](self, "_shouldEncodeSignallingDataInMessageID"))
  {
    unsigned __int8 v17 = -[NIServerNBAMMSSession _encodeSignallingDataInMessageID:]( self,  "_encodeSignallingDataInMessageID:",  *(unsigned __int8 *)buf);
    *(_BYTE *)__int128 buf = v17;
  }

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  (void)buf,  *((void *)&buf + 1) - (void)buf));
  double v19 = (void *)objc_claimAutoreleasedReturnValue(-[NIServerNBAMMSSession _encrypt:](self, "_encrypt:", v18));
  int v20 = v19;
  if (v19 && [v19 length])
  {
    char v27 = 0;
    sub_10016C2CC(__p, (size_t)[v20 length], &v27);
    objc_msgSend(v20, "getBytes:length:", __p[0], objc_msgSend(v20, "length"));
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_10039DAEC();
    }
    sub_1002732D0((uint64_t)self->_nbammsSession.__ptr_, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    BOOL v21 = 1;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_10039DA88();
    }
    BOOL v21 = 0;
  }

  if ((void)buf)
  {
    *((void *)&buf + 1) = buf;
    operator delete((void *)buf);
  }

  return v21;
}

- (void)_receivedMutualAuthMessage:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_10039DBBC();
  }
  ++*(&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty + 1);
  -[NIServerNBAMMSSession _logStatisticsIfNecessary](self, "_logStatisticsIfNecessary");
  BOOL v5 = *(__int128 **)a3;
  if (*((void *)a3 + 1) - *(void *)a3 > 0x14uLL)
  {
    __int128 v6 = *v5;
    *(void *)&v14[13] = *(void *)((char *)v5 + 13);
    *(_OWORD *)__int16 v14 = v6;
    sub_1001F230C((uint64_t)v14, 1, (uint64_t)v12);
    sub_1001F230C((uint64_t)v14, 0, (uint64_t)v10);
    int v7 = v13;
    if (v13 && v11)
    {
      -[NIServerNBAMMSSession _processPeerMutualAuthState:peerIsFinder:]( self,  "_processPeerMutualAuthState:peerIsFinder:",  v12,  1LL);
      if (!v11) {
        sub_100006080();
      }
      -[NIServerNBAMMSSession _processPeerMutualAuthState:peerIsFinder:]( self,  "_processPeerMutualAuthState:peerIsFinder:",  v10,  0LL);
      -[NIServerNBAMMSSession _reportMutualAuthStates](self, "_reportMutualAuthStates");
    }

    else
    {
      int v8 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v9 = sub_100277A54(v7 == 0);
        sub_10039DB78((uint64_t)v9, buf, v8);
      }
    }

    sub_1001FC378((uint64_t)v10);
    sub_1001FC378((uint64_t)v12);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_10039DB18();
  }

- (void)_processPeerMutualAuthState:(const MutualAuthState *)a3 peerIsFinder:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = 232LL;
  if (a4) {
    uint64_t v6 = 971LL;
  }
  if (*((_BYTE *)&self->super.isa + v6))
  {
    uint64_t v8 = 38LL;
    if (a4) {
      uint64_t v8 = 130LL;
    }
    Class v9 = (&self->super.isa)[v8];
    if (a4) {
      uint64_t v10 = 984LL;
    }
    else {
      uint64_t v10 = 248LL;
    }
    char v11 = v9;
    __int16 v12 = (char *)self + v10;
    v42[0] = *v12;
    id v43 = *((id *)v12 + 1);
    id v44 = *((id *)v12 + 2);
    char v45 = v12[24];
    unsigned __int8 v13 = (id *)(v12 + 32);
    id v46 = *((id *)v12 + 4);
    id v47 = *((id *)v12 + 5);
    int v48 = *((_DWORD *)v12 + 12);
    *((_DWORD *)v12 + 12) = 0;
    unsigned int outboundAuthState = a3->outboundAuthState;
    if (outboundAuthState == 1) {
      goto LABEL_14;
    }
    if ((*v12 & 0xFE) != 0xA)
    {
      if ((outboundAuthState & 0xFE) != 0xA)
      {
        if (a3->outboundResponse && !-[NSData isEqualToData:](a3->outboundChallenge, "isEqualToData:", *v13))
        {
          sub_1001F2990((uint64_t)v12, 0xAu);
          goto LABEL_14;
        }

        if (*((void *)v12 + 1))
        {
          if (a3->outboundChallenge && (objc_msgSend(*v13, "isEqualToData:") & 1) == 0)
          {
            objc_storeStrong((id *)v12 + 4, a3->outboundChallenge);
            sub_1001F2A28(v12, v11);
            *__int16 v12 = 3;
          }

          if (a3->outboundResponse && (objc_msgSend(*((id *)v12 + 5), "isEqualToData:") & 1) == 0)
          {
            objc_storeStrong((id *)v12 + 5, a3->outboundResponse);
            else {
              char v35 = 2;
            }
            v12[24] = v35;
          }

          int inboundAuthState = a3->inboundAuthState;
          if (inboundAuthState == 1)
          {
            char v37 = 4;
          }

          else
          {
            if (inboundAuthState != 2) {
              goto LABEL_14;
            }
            char v37 = 5;
          }
        }

        else
        {
          sub_1001F210C((uint64_t)v12);
          char v37 = 2;
        }

        *__int16 v12 = v37;
        goto LABEL_14;
      }

      sub_1001F2990((uint64_t)v12, outboundAuthState);
    }

    sub_1001F2918(v12);
LABEL_14:
    if (!sub_1001F2C6C((unsigned __int8 *)v12, (unsigned __int8 *)v42))
    {
      int v15 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v16 = sub_100277A54(v4);
        id v18 = sub_1001EE274(&a3->outboundAuthState, v17);
        double v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        int v38 = 136315394;
        id v39 = v16;
        __int16 v40 = 2112;
        id v41 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "#find-range,#auth Received peer [%s] mutual auth:     %@",  (uint8_t *)&v38,  0x16u);
      }

      int v20 = !v4;
      BOOL v21 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = sub_100277A54(v20);
        id v24 = sub_1001EE274((unsigned __int8 *)v42, v23);
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        int v38 = 136315394;
        id v39 = v22;
        __int16 v40 = 2112;
        id v41 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "#find-range,#auth     Self [%s] mutual auth (BEFORE): %@",  (uint8_t *)&v38,  0x16u);
      }

      id v26 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        char v27 = sub_100277A54(v20);
        id v29 = sub_1001EE274((unsigned __int8 *)v12, v28);
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        int v38 = 136315394;
        id v39 = v27;
        __int16 v40 = 2112;
        id v41 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "#find-range,#auth     Self [%s] mutual auth (AFTER):  %@",  (uint8_t *)&v38,  0x16u);
      }
    }

LABEL_23:
    return;
  }

  if (a3->outboundAuthState)
  {
    char v11 = (objc_class *)(id)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      char v31 = sub_100277A54(v4);
      id v33 = sub_1001EE274(&a3->outboundAuthState, v32);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      sub_10039DBE8((uint64_t)v31, v34, (uint64_t)v42, (os_log_s *)v11);
    }

    goto LABEL_23;
  }

- (void)_armMutualAuthTimerForFinder:(BOOL)a3
{
  if (a3)
  {
    secondary_scheduling_delay_usec = (dispatch_source_s *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    if (secondary_scheduling_delay_usec) {
      dispatch_source_cancel(secondary_scheduling_delay_usec);
    }
    dispatch_source_t v6 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_internalQueue);
    int v7 = (void *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = (optional<unsigned int>)v6;

    uint64_t v8 = (dispatch_source_s *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(&location, self);
    uint64_t v10 = (dispatch_source_s *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1001F3044;
    handler[3] = &unk_1007B65A0;
    char v11 = &v26;
    objc_copyWeak(&v26, &location);
    handler[4] = self;
    BOOL v27 = a3;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume(*(dispatch_object_t *)&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec);
    self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
    __int16 v12 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      identityString = self->_identityString;
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v30 = identityString;
      __int16 v14 = "#find-range,Armed finder mutual-auth timer, session %@";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    }
  }

  else
  {
    double velocityChangeH2 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    if (velocityChangeH2 != 0.0) {
      dispatch_source_cancel(*(dispatch_source_t *)&velocityChangeH2);
    }
    dispatch_source_t v16 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_internalQueue);
    double v17 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    *(void *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.double velocityChangeH2 = v16;

    double v18 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    dispatch_time_t v19 = dispatch_time(0LL, 5000000000LL);
    dispatch_source_set_timer(*(dispatch_source_t *)&v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(&location, self);
    double v20 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1001F3170;
    v22[3] = &unk_1007B65A0;
    char v11 = &v23;
    objc_copyWeak(&v23, &location);
    v22[4] = self;
    BOOL v24 = a3;
    dispatch_source_set_event_handler(*(dispatch_source_t *)&v20, v22);
    dispatch_resume(*(dispatch_object_t *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2);
    self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 0;
    __int16 v12 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v21 = self->_identityString;
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v30 = v21;
      __int16 v14 = "#find-range,Armed findee mutual-auth timer, session %@";
      goto LABEL_10;
    }
  }

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);
  objc_storeStrong((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec, 0LL);
  objc_storeStrong((id *)&self->_finderToken, 0LL);

  objc_destroyWeak((id *)&self->_finderClient);
  objc_storeStrong((id *)&self->_peerDecryptionSession, 0LL);
  objc_storeStrong((id *)&self->_selfEncryptionSession, 0LL);
  sub_100012390((uint64_t)&self->_pbLogger);
  objc_storeStrong((id *)&self->_sessionToken, 0LL);
  sub_100012390((uint64_t)&self->_nbammsSession);
  objc_storeStrong((id *)&self->_identityString, 0LL);
  objc_storeStrong((id *)&self->_internalQueue, 0LL);
}

- (id).cxx_construct
{
  self->_nbammsSession = 0u;
  self->_sessionStartRangingOptions.var0.__null_state_ = 0;
  self->_sessionStartRangingOptions.__engaged_ = 0;
  self->_pbLogger = 0u;
  *(_OWORD *)&self->_finderMutualAuthState.outboundChallenge = 0u;
  *(_OWORD *)&self->_finderMutualAuthState.inboundChallenge = 0u;
  sub_1001EAC44((uint64_t)&self->_finderMutualAuthState);
  self->_finderRoseServiceRequest.var0.__null_state_ = 0;
  self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = 0;
  LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec) = 0;
  self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_ = 0;
  self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_ = 0;
  *(_WORD *)(&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ + 1) = 0;
  *(_OWORD *)&self->_finderSignallingData.var0.__null_state_ = 0u;
  *(_OWORD *)&self->_finderShouldArmMutualAuthTimer = 0u;
  sub_1001EAC44((uint64_t)&self->_finderStartRangingOptions.__engaged_);
  LOBYTE(self->_findeeMutualAuthState.outboundResponse) = 0;
  self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 0;
  self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.peer_addr.var0.__null_state_ = 0;
  self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 0;
  self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.rose_mac_address.var0.__val_.__elems_[3] = 0;
  self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
  LOBYTE(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp) = 0;
  BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = 0;
  *(_WORD *)(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 1) = 0;
  return self;
}

@end