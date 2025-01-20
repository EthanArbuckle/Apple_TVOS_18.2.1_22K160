@interface KCPairingChannel
+ (BOOL)_isRetryableNSURLError:(id)a3;
+ (BOOL)isSupportedPlatform;
+ (BOOL)retryable:(id)a3;
+ (id)pairingChannelAcceptor:(id)a3;
+ (id)pairingChannelCompressData:(id)a3;
+ (id)pairingChannelDecompressData:(id)a3;
+ (id)pairingChannelInitiator:(id)a3;
- (BOOL)acceptorWillSendInitialSyncCredentials;
- (BOOL)acceptorWillSendPCSData;
- (BOOL)createTempPacketAndCheckSize:(id)a3 pcsItem:(id)a4 octagonData:(id)a5 keyForItem:(id)a6 error:(id *)a7;
- (BOOL)ensureControlChannel;
- (BOOL)fetchEpoch:(id)a3 error:(id *)a4;
- (BOOL)fetchPrepare:(id *)a3 application:(id)a4 error:(id *)a5;
- (BOOL)fetchVoucher:(id)a3 prepare:(id)a4 eventS:(id)a5 finishedPairing:(BOOL *)a6 maxCapability:(id)a7 error:(id *)a8;
- (BOOL)grabbedLockAssertion;
- (BOOL)initiator;
- (BOOL)initiatorExpectPCSData;
- (BOOL)isPacketSizeAcceptable:(id)a3 error:(id *)a4;
- (BOOL)join:(id *)a3 voucher:(id)a4 eventS:(id)a5 setupPairingChannelSignPost:(octagon_signpost_s)a6 finishPairing:(BOOL *)a7 error:(id *)a8;
- (BOOL)needInitialSync;
- (BOOL)populateKeychainForTestingWithNumberOfKeychainItems:(int)a3;
- (BOOL)populateKeychainWithLargeItemsForTestingWithCount:(int)a3;
- (BOOL)populateKeychainWithMixedLargeItemsForTestingWithCount:(int)a3;
- (BOOL)populateKeychainWithTooLargeItemsForTestingWithCount:(int)a3;
- (BOOL)sessionSupportsOctagon;
- (BOOL)sessionSupportsSOS;
- (BOOL)testFailOctagon;
- (BOOL)testFailSOS;
- (KCPairingChannelContext)peerVersionContext;
- (NSArray)allPCSItems;
- (NSNumber)ackNumber;
- (NSNumber)countOfReceivedItems;
- (NSNumber)countOfSentItems;
- (NSNumber)sizeOfPacket;
- (NSString)altDSID;
- (NSString)dsidForTest;
- (NSXPCConnection)connection;
- (OTControl)otControl;
- (OTControlArguments)controlArguments;
- (OTJoiningConfiguration)joiningConfiguration;
- (id)copySubsetFrom:(id)a3 begin:(unint64_t)a4 end:(unint64_t)a5;
- (id)createPacket:(id)a3 results:(id)a4 endSession:(BOOL)a5;
- (id)createTempPacket:(id)a3 pcsItem:(id)a4 octagonData:(id)a5 keyForItem:(id)a6;
- (id)evaluateResults:(void *)a3;
- (id)exchangePacket:(id)a3 complete:(BOOL *)a4 error:(id *)a5;
- (id)formNextPacket;
- (id)initAsInitiator:(BOOL)a3 version:(id)a4;
- (id)nextOctagonState;
- (id)nextState;
- (id)updateItem:(id)a3;
- (int)fetchCountOfReceivedItemsForTesting;
- (int)fetchCountOfSentItemsForTesting;
- (int)fetchPCSItems:(const void *)a3;
- (unint64_t)fetchNumberOfPCSKeychainItems;
- (unint64_t)fetchSizeOfPacketForTesting;
- (unint64_t)itemIndex;
- (unsigned)acceptorInitialSyncCredentialsFlags;
- (unsigned)counter;
- (void)acceptorFirstOctagonPacket:(id)a3 reply:(id)a4 complete:(id)a5;
- (void)acceptorFirstPacket:(id)a3 complete:(id)a4;
- (void)acceptorPCSDataPacket:(id)a3 complete:(id)a4;
- (void)acceptorSecondOctagonPacket:(id)a3 reply:(id)a4 complete:(id)a5;
- (void)acceptorSecondPacket:(id)a3 complete:(id)a4;
- (void)acceptorThirdPacket:(id)a3 complete:(id)a4;
- (void)acceptorWaitForAck:(id)a3 complete:(id)a4;
- (void)exchangePacket:(id)a3 complete:(id)a4;
- (void)initiatorCompleteSecondPacketOctagon:(id)a3 application:(id)a4 complete:(id)a5;
- (void)initiatorCompleteSecondPacketWithSOS:(id)a3 complete:(id)a4;
- (void)initiatorFirstPacket:(id)a3 complete:(id)a4;
- (void)initiatorFourthPacket:(id)a3 complete:(id)a4;
- (void)initiatorPCSDataPacket:(id)a3 complete:(id)a4;
- (void)initiatorSecondPacket:(id)a3 complete:(id)a4;
- (void)initiatorThirdPacket:(id)a3 complete:(id)a4;
- (void)oneStepTooMany:(id)a3 complete:(id)a4;
- (void)setAcceptorInitialSyncCredentialsFlags:(unsigned int)a3;
- (void)setAcceptorWillSendInitialSyncCredentials:(BOOL)a3;
- (void)setAcceptorWillSendPCSData:(BOOL)a3;
- (void)setAckNumber:(id)a3;
- (void)setAllPCSItems:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setControlArguments:(id)a3;
- (void)setCountOfReceivedItems:(id)a3;
- (void)setCountOfSentItems:(id)a3;
- (void)setCounter:(unsigned int)a3;
- (void)setDsidForTest:(id)a3;
- (void)setGrabbedLockAssertion:(BOOL)a3;
- (void)setInitiator:(BOOL)a3;
- (void)setInitiatorExpectPCSData:(BOOL)a3;
- (void)setItemIndex:(unint64_t)a3;
- (void)setJoiningConfiguration:(id)a3;
- (void)setNextOctagonState:(id)a3;
- (void)setNextState:(id)a3;
- (void)setNextStateError:(id)a3 complete:(id)a4;
- (void)setOtControl:(id)a3;
- (void)setPeerVersionContext:(id)a3;
- (void)setSessionSupportsOctagon:(BOOL)a3;
- (void)setSessionSupportsSOS:(BOOL)a3;
- (void)setSizeOfPacket:(id)a3;
- (void)setTestFailOctagon:(BOOL)a3;
- (void)setTestFailSOS:(BOOL)a3;
- (void)validateStart:(id)a3;
- (void)waitForOctagonUpgrade;
@end

@implementation KCPairingChannel

- (id)initAsInitiator:(BOOL)a3 version:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  if (+[KCPairingChannel isSupportedPlatform](&OBJC_CLASS___KCPairingChannel, "isSupportedPlatform"))
  {
    v42.receiver = self;
    v42.super_class = (Class)&OBJC_CLASS___KCPairingChannel;
    v8 = -[KCPairingChannel init](&v42, sel_init);
    if (v8)
    {
      location[0] = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(location, v8);
      v8->_initiator = v5;
      objc_storeStrong((id *)&v8->_peerVersionContext, a4);
      if (v8->_initiator)
      {
        v9 = (id *)&v40;
        uint64_t v39 = MEMORY[0x1895F87A8];
        v10 = __44__KCPairingChannel_initAsInitiator_version___block_invoke;
        v11 = &v39;
      }

      else
      {
        v9 = (id *)&v38;
        uint64_t v37 = MEMORY[0x1895F87A8];
        v10 = __44__KCPairingChannel_initAsInitiator_version___block_invoke_2;
        v11 = &v37;
      }

      v11[1] = 3221225472LL;
      v11[2] = (uint64_t)v10;
      v11[3] = (uint64_t)&unk_18A134950;
      objc_copyWeak(v9, location);
      uint64_t v14 = MEMORY[0x1895B6598](v11);
      id nextState = v8->_nextState;
      v8->_id nextState = (id)v14;

      objc_destroyWeak(v9);
      v8->_needInitialSync = 1;
      v8->_testFailSOS = 0;
      v8->_sessionSupportsSOS = SOSCCIsSOSTrustAndSyncingEnabled();
      v8->_sessionSupportsOctagon = 1;
      id v36 = 0LL;
      uint64_t v16 = [MEMORY[0x18960AF98] controlObject:1 error:&v36];
      id v17 = v36;
      otControl = v8->_otControl;
      v8->_otControl = (OTControl *)v16;

      if (v17)
      {
        secLogObjForScope("SecError");
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v35 = 0;
          _os_log_impl(&dword_187D59000, v19, OS_LOG_TYPE_DEFAULT, "could not stand up otcontrol connection", v35, 2u);
        }
      }

      id v20 = objc_alloc(MEMORY[0x18960AFA8]);
      uint64_t v21 = *MEMORY[0x18960AFD8];
      [v7 uniqueDeviceID];
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 uniqueClientID];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607AB8] UUID];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 UUIDString];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v20 initWithProtocolType:v21 uniqueDeviceID:v22 uniqueClientID:v23 pairingUUID:v25 epoch:0 isInitiator:v5];
      joiningConfiguration = v8->_joiningConfiguration;
      v8->_joiningConfiguration = (OTJoiningConfiguration *)v26;

      id v28 = objc_alloc(MEMORY[0x18960AFA0]);
      [v7 altDSID];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 flowID];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 deviceSessionID];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = [v28 initWithAltDSID:v29 flowID:v30 deviceSessionID:v31];
      controlArguments = v8->_controlArguments;
      v8->_controlArguments = (OTControlArguments *)v32;

      objc_destroyWeak(location);
    }

    self = v8;
    v13 = self;
  }

  else
  {
    secLogObjForScope("SecError");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( &dword_187D59000,  v12,  OS_LOG_TYPE_DEFAULT,  "platform not supported for pairing",  (uint8_t *)location,  2u);
    }

    v13 = 0LL;
  }

  return v13;
}

- (void)oneStepTooMany:(id)a3 complete:(id)a4
{
  id v4 = a4;
  secLogObjForScope("SecError");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_187D59000, v5, OS_LOG_TYPE_DEFAULT, "pairingchannel: one step too many", v7, 2u);
  }

  [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:2 userInfo:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0LL, 0LL, v6);
}

- (void)setNextStateError:(id)a3 complete:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __47__KCPairingChannel_setNextStateError_complete___block_invoke;
  v9[3] = &unk_18A134950;
  objc_copyWeak(&v10, &location);
  -[KCPairingChannel setNextState:](self, "setNextState:", v9);
  if (v7)
  {
    if (v6)
    {
      secLogObjForScope("SecError");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_187D59000, v8, OS_LOG_TYPE_DEFAULT, "pairingchannel: failed pairing with: %@", buf, 0xCu);
      }
    }

    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0LL, 0LL, v6);
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)waitForOctagonUpgrade
{
  v3 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 altDSID];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 flowID];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  [v8 deviceSessionID];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = 1;
  id v10 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v3,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v5,  v7,  v9,  @"com.apple.security.initiatorWaitsForUpgrade",  metricsAreEnabled,  v14,  &unk_18A13BFB0);
  v11 = -[KCPairingChannel otControl](self, "otControl");
  v12 = -[KCPairingChannel controlArguments](self, "controlArguments");
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __41__KCPairingChannel_waitForOctagonUpgrade__block_invoke;
  v15[3] = &unk_18A1349B8;
  uint64_t v16 = v10;
  id v13 = v10;
  [v11 waitForOctagonUpgrade:v12 reply:v15];
}

- (void)initiatorFirstPacket:(id)a3 complete:(id)a4
{
  v81[1] = *MEMORY[0x1895F89C0];
  id v49 = a3;
  id v51 = a4;
  secLogObjForScope("pairing");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187D59000, v6, OS_LOG_TYPE_DEFAULT, "initiator packet 1", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t spid = _OctagonSignpostCreate();

  _OctagonSignpostLogSystem();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  unint64_t v50 = spid - 1;
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "PairingChannelInitiatorMessage1",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = spid;
    _os_log_impl( &dword_187D59000,  v10,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelInitiatorMessage1  enableTelemetry=YES ",  buf,  0xCu);
  }

  if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS")
    && -[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    uint64_t v11 = 3LL;
  }

  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    uint64_t v11 = 2LL;
  }

  else
  {
    uint64_t v11 = -[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS");
  }

  v12 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  v80 = @"supportedTrustSystem";
  [MEMORY[0x189607968] numberWithInteger:v11];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:v81 forKeys:&v80 count:1];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  [v15 altDSID];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 flowID];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  [v19 deviceSessionID];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v48) = 1;
  uint64_t v21 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v12,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  v14,  v16,  v18,  v20,  @"com.apple.security.initiatorCreatesPacket1",  metricsAreEnabled,  v48,  &unk_18A13BFB0);

  if (SOSCCIsSOSTrustAndSyncingEnabled()
    && !-[KCPairingChannel ensureControlChannel](self, "ensureControlChannel"))
  {
    [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:1 userInfo:0];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v31, v51);
    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v50 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v33))
    {
      *(void *)buf = 67240192LL;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v34,  OS_SIGNPOST_INTERVAL_END,  spid,  "PairingChannelInitiatorMessage1",  " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostName PairingChannelInitiatorMessage1}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      int v79 = 0;
      _os_log_impl( &dword_187D59000,  v35,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ",  buf,  0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v21,  0LL,  v31);
  }

  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon") {
         && -[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS")
  }
         && !-[KCPairingChannel testFailOctagon](self, "testFailOctagon"))
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v57[0] = MEMORY[0x1895F87A8];
    v57[1] = 3221225472LL;
    v57[2] = __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke;
    v57[3] = &unk_18A134950;
    objc_copyWeak(&v58, &location);
    -[KCPairingChannel setNextState:](self, "setNextState:", v57);
    uint64_t v42 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = 1;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v44,  OS_SIGNPOST_INTERVAL_END,  spid,  "PairingChannelInitiatorMessage1",  " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostName PairingChannelInitiatorMessage1}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v42 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      int v79 = 1;
      _os_log_impl( &dword_187D59000,  v45,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ",  buf,  0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v21,  1LL,  0LL);
    if (!CloudServicesLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_18A134D20;
      *(void *)&buf[16] = 0LL;
      CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    }

    if (CloudServicesLibraryCore_frameworkLibrary
      && getSecureBackupIsGuitarfishEnabledSymbolLoc()
      && soft_SecureBackupIsGuitarfishEnabled())
    {
      v76[1] = @"o";
      v77[0] = MEMORY[0x189604A88];
      v75[1] = MEMORY[0x189604A88];
      v76[0] = @"d";
      v74[0] = @"v";
      v74[1] = @"s";
      v75[0] = @"O";
      [MEMORY[0x189603F68] dictionaryWithObjects:v75 forKeys:v74 count:2];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v77[1] = v46;
      [MEMORY[0x189603F68] dictionaryWithObjects:v77 forKeys:v76 count:2];
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *, void))v51 + 2))(v51, 0LL, v47, 0LL);
    }

    else
    {
      v72[0] = @"d";
      v72[1] = @"o";
      v73[0] = MEMORY[0x189604A88];
      v70 = @"v";
      v71 = @"O";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v73[1] = v46;
      [MEMORY[0x189603F68] dictionaryWithObjects:v73 forKeys:v72 count:2];
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *, void))v51 + 2))(v51, 0LL, v47, 0LL);
    }

    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);
  }

  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon") {
         && -[KCPairingChannel testFailOctagon](self, "testFailOctagon"))
  }
  {
    uint64_t v22 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v50 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v23))
    {
      *(void *)buf = 67240192LL;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v24,  OS_SIGNPOST_INTERVAL_END,  spid,  "PairingChannelInitiatorMessage1",  " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostName PairingChannelInitiatorMessage1}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v22 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      int v79 = 0;
      _os_log_impl( &dword_187D59000,  v25,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ",  buf,  0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v21,  1LL,  0LL);
    (*((void (**)(id, uint64_t, void, void))v51 + 2))(v51, 1LL, 0LL, 0LL);
  }

  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon") {
         && !-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS"))
  }
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v55[0] = MEMORY[0x1895F87A8];
    v55[1] = 3221225472LL;
    v55[2] = __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_170;
    v55[3] = &unk_18A134950;
    objc_copyWeak(&v56, &location);
    -[KCPairingChannel setNextState:](self, "setNextState:", v55);
    uint64_t v36 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = v37;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = 1;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v38,  OS_SIGNPOST_INTERVAL_END,  spid,  "PairingChannelInitiatorMessage1",  " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostName PairingChannelInitiatorMessage1}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v36 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      int v79 = 1;
      _os_log_impl( &dword_187D59000,  v39,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ",  buf,  0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v21,  1LL,  0LL);
    if (!CloudServicesLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_18A134D20;
      *(void *)&buf[16] = 0LL;
      CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    }

    if (CloudServicesLibraryCore_frameworkLibrary
      && getSecureBackupIsGuitarfishEnabledSymbolLoc()
      && soft_SecureBackupIsGuitarfishEnabled())
    {
      v68 = @"o";
      v66[0] = @"v";
      v66[1] = @"s";
      v67[0] = @"O";
      v67[1] = MEMORY[0x189604A88];
      [MEMORY[0x189603F68] dictionaryWithObjects:v67 forKeys:v66 count:2];
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v40;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *, void))v51 + 2))(v51, 0LL, v41, 0LL);
    }

    else
    {
      v62 = @"v";
      v63 = @"O";
      v64 = @"o";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v40;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *, void))v51 + 2))(v51, 0LL, v41, 0LL);
    }

    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }

  else
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v53[0] = MEMORY[0x1895F87A8];
    v53[1] = 3221225472LL;
    v53[2] = __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_171;
    v53[3] = &unk_18A134950;
    objc_copyWeak(&v54, &location);
    -[KCPairingChannel setNextState:](self, "setNextState:", v53);
    uint64_t v26 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v28 = v27;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = 1;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v28,  OS_SIGNPOST_INTERVAL_END,  spid,  "PairingChannelInitiatorMessage1",  " OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostName PairingChannelInitiatorMessage1}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v26 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      int v79 = 1;
      _os_log_impl( &dword_187D59000,  v29,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage1  OctagonSignpostNamePairingChannelInitiatorMessage1=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage1}d ",  buf,  0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v21,  1LL,  0LL);
    v60 = @"d";
    uint64_t v61 = MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, void *, void))v51 + 2))(v51, 0LL, v30, 0LL);

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
  }
}

- (void)initiatorSecondPacket:(id)a3 complete:(id)a4
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v55 = a3;
  id v52 = a4;
  secLogObjForScope("pairing");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187D59000, v6, OS_LOG_TYPE_DEFAULT, "initiator packet 2", buf, 2u);
  }

  *(void *)buf = 0LL;
  v82 = buf;
  uint64_t v83 = 0x2020000000LL;
  char v84 = 0;
  _OctagonSignpostLogSystem();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = _OctagonSignpostCreate();
  uint64_t v50 = v9;
  os_signpost_id_t v10 = v8;

  _OctagonSignpostLogSystem();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v87) = 0;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "PairingChannelInitiatorMessage2",  " enableTelemetry=YES ",  (uint8_t *)&v87,  2u);
  }

  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v87) = 134217984;
    *(void *)((char *)&v87 + 4) = v10;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelInitiatorMessage2  enableTelemetry=YES ",  (uint8_t *)&v87,  0xCu);
  }

  os_signpost_id_t v54 = v10;
  uint64_t v14 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  v15 = -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  [v15 altDSID];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 flowID];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  [v19 deviceSessionID];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v45) = 1;
  id v51 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v14,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v16,  v18,  v20,  @"com.apple.security.initiatorCreatesPacket3",  metricsAreEnabled,  v45,  &unk_18A13BFB0);

  [v55 objectForKeyedSubscript:@"o"];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53)
  {
    secLogObjForScope("pairing");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v87) = 0;
      _os_log_impl( &dword_187D59000,  v21,  OS_LOG_TYPE_DEFAULT,  "acceptor didn't send a octagon packet, so skipping all octagon flows",  (uint8_t *)&v87,  2u);
    }

    -[KCPairingChannel setSessionSupportsOctagon:](self, "setSessionSupportsOctagon:", 0LL);
  }

  [v55 objectForKeyedSubscript:@"c"];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    [v55 objectForKeyedSubscript:@"d"];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v24 = v23 == 0LL;

    if (!v24)
    {
      secLogObjForScope("pairing");
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v87) = 0;
        _os_log_impl( &dword_187D59000,  v25,  OS_LOG_TYPE_DEFAULT,  "acceptor will send initial credentials",  (uint8_t *)&v87,  2u);
      }

      -[KCPairingChannel setAcceptorWillSendInitialSyncCredentials:]( self,  "setAcceptorWillSendInitialSyncCredentials:",  1LL);
    }
  }

  if (!CloudServicesLibraryCore_frameworkLibrary)
  {
    __int128 v87 = xmmword_18A134D20;
    uint64_t v88 = 0LL;
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (CloudServicesLibraryCore_frameworkLibrary)
  {
    if (getSecureBackupIsGuitarfishEnabledSymbolLoc())
    {
      if (soft_SecureBackupIsGuitarfishEnabled())
      {
        [v55 objectForKeyedSubscript:@"y"];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          [v55 objectForKeyedSubscript:@"y"];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          int v28 = [v27 isEqualToNumber:MEMORY[0x189604A88]];

          if (v28)
          {
            secLogObjForScope("pairing");
            v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v87) = 0;
              _os_log_impl( &dword_187D59000,  v29,  OS_LOG_TYPE_DEFAULT,  "acceptor will send PCS data",  (uint8_t *)&v87,  2u);
            }

            -[KCPairingChannel setInitiatorExpectPCSData:](self, "setInitiatorExpectPCSData:", 1LL);
          }
        }
      }
    }
  }

  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    *(void *)&__int128 v87 = 0LL;
    *((void *)&v87 + 1) = &v87;
    uint64_t v88 = 0x2020000000LL;
    char v89 = 0;
    _OctagonSignpostLogSystem();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = _OctagonSignpostCreate();
    uint64_t v49 = v32;
    os_signpost_id_t v33 = v31;

    _OctagonSignpostLogSystem();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)v85 = 0;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v35,  OS_SIGNPOST_INTERVAL_BEGIN,  v33,  "PairingChannelInitiatorStashAccountCredential",  " enableTelemetry=YES ",  v85,  2u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v85 = 134217984;
      os_signpost_id_t v86 = v33;
      _os_log_impl( &dword_187D59000,  v36,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelInitiatorStashAccountCredential  enableTelemetry=YES ",  v85,  0xCu);
    }

    uint64_t v48 = v22;
    v47 = -[KCPairingChannel connection](self, "connection");
    v72[0] = MEMORY[0x1895F87A8];
    v72[1] = 3221225472LL;
    void v72[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke;
    v72[3] = &unk_18A1349E0;
    os_signpost_id_t v77 = v33;
    uint64_t v78 = v49;
    os_signpost_id_t v79 = v54;
    uint64_t v80 = v50;
    v75 = &v87;
    v76 = buf;
    uint64_t v37 = v51;
    v73 = v37;
    id v38 = v52;
    id v74 = v38;
    [v47 remoteObjectProxyWithErrorHandler:v72];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 altDSID];
    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    [v41 flowID];
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    [v43 deviceSessionID];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x1895F87A8];
    v62[1] = 3221225472LL;
    v62[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_172;
    v62[3] = &unk_18A134A30;
    v66 = &v87;
    v62[4] = self;
    uint64_t v69 = v49;
    os_signpost_id_t v70 = v54;
    uint64_t v71 = v50;
    v67 = buf;
    os_signpost_id_t v68 = v33;
    v63 = v37;
    id v65 = v38;
    id v64 = v55;
    [v46 stashAccountCredential:v48 altDSID:v40 flowID:v42 deviceSessionID:v44 canSendMetrics:1 complete:v62];

    uint64_t v22 = v48;
    _Block_object_dispose(&v87, 8);
  }

  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    v56[0] = MEMORY[0x1895F87A8];
    v56[1] = 3221225472LL;
    v56[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_177;
    v56[3] = &unk_18A134A08;
    v59 = buf;
    os_signpost_id_t v60 = v54;
    uint64_t v61 = v50;
    v57 = v51;
    id v58 = v52;
    -[KCPairingChannel initiatorCompleteSecondPacketOctagon:application:complete:]( self,  "initiatorCompleteSecondPacketOctagon:application:complete:",  v55,  0LL,  v56);
  }

  _Block_object_dispose(buf, 8);
}

- (void)initiatorCompleteSecondPacketWithSOS:(id)a3 complete:(id)a4
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  secLogObjForScope("pairing");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187D59000, v8, OS_LOG_TYPE_DEFAULT, "initiator complete second packet 2", buf, 2u);
  }

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", 0LL, 0LL);
  *(void *)buf = 0LL;
  uint64_t v40 = buf;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  _OctagonSignpostLogSystem();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = _OctagonSignpostCreate();
  int v28 = v11;
  v12 = (char *)v10;

  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v44 = 0;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v12,  "PairingChannelInitiatorMakeSOSPeer",  " enableTelemetry=YES ",  v44,  2u);
  }

  _OctagonSignpostLogSystem();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v44 = 134217984;
    uint64_t v45 = v12;
    _os_log_impl( &dword_187D59000,  v15,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelInitiatorMakeSOSPeer  enableTelemetry=YES ",  v44,  0xCu);
  }

  uint64_t v26 = v6;
  v27 = -[KCPairingChannel connection](self, "connection");
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke;
  v34[3] = &unk_18A134A58;
  uint64_t v37 = v12;
  id v38 = v28;
  uint64_t v36 = buf;
  id v16 = v7;
  id v35 = v16;
  [v27 remoteObjectProxyWithErrorHandler:v34];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  [v18 altDSID];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 flowID];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 deviceSessionID];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_178;
  v29[3] = &unk_18A134A80;
  v33[1] = v12;
  v33[2] = v28;
  uint64_t v32 = buf;
  v29[4] = self;
  id v24 = v26;
  id v30 = v24;
  id v25 = v16;
  id v31 = v25;
  objc_copyWeak(v33, &location);
  [v17 myPeerInfo:v19 flowID:v21 deviceSessionID:v23 canSendMetrics:1 complete:v29];

  objc_destroyWeak(v33);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);
}

- (BOOL)fetchPrepare:(id *)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 0;
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = __Block_byref_object_copy_;
  os_signpost_id_t v33 = __Block_byref_object_dispose_;
  id v34 = 0LL;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0LL;
  -[KCPairingChannel otControl](self, "otControl");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel controlArguments](self, "controlArguments");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel joiningConfiguration](self, "joiningConfiguration");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __51__KCPairingChannel_fetchPrepare_application_error___block_invoke;
  v17[3] = &unk_18A134AA8;
  v17[4] = self;
  v19 = &v29;
  id v20 = &v35;
  id v12 = v8;
  id v18 = v12;
  uint64_t v21 = &v23;
  objc_copyWeak(&v22, &location);
  [v9 rpcPrepareIdentityAsApplicantWithArguments:v10 configuration:v11 reply:v17];

  if (a3)
  {
    id v13 = (void *)v24[5];
    if (v13) {
      *a3 = v13;
    }
  }

  if (a5)
  {
    uint64_t v14 = (void *)v30[5];
    if (v14) {
      *a5 = v14;
    }
  }

  char v15 = *((_BYTE *)v36 + 24);
  objc_destroyWeak(&v22);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  objc_destroyWeak(&location);

  return v15;
}

- (void)initiatorCompleteSecondPacketOctagon:(id)a3 application:(id)a4 complete:(id)a5
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void, id))a5;
  secLogObjForScope("pairing");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187D59000, v11, OS_LOG_TYPE_DEFAULT, "initiator complete second packet 2 with octagon", buf, 2u);
  }

  [v8 objectForKeyedSubscript:@"o"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v13 = 0LL;
    int v14 = 0;
    while (1)
    {

      [MEMORY[0x189603FC8] dictionary];
      char v15 = (void *)objc_claimAutoreleasedReturnValue();
      secLogObjForScope((const char *)pairingScope);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v26) = v14 + 1;
        _os_log_impl(&dword_187D59000, v16, OS_LOG_TYPE_DEFAULT, "Attempt %d, calling fetchPrepare", buf, 8u);
      }

      id v23 = 0LL;
      id v24 = v15;
      BOOL v17 = -[KCPairingChannel fetchPrepare:application:error:](self, "fetchPrepare:application:error:", &v24, v9, &v23);
      id v18 = v24;

      id v13 = v23;
      if (v17) {
        break;
      }
      if (!+[KCPairingChannel retryable:](&OBJC_CLASS___KCPairingChannel, "retryable:", v13))
      {
        secLogObjForScope("SecError");
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v26 = pairingScope;
          __int16 v27 = 1024;
          int v28 = v14 + 1;
          __int16 v29 = 2112;
          id v30 = v13;
          _os_log_impl( &dword_187D59000,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: Attempt %d, failed fetching prepare %@",  buf,  0x1Cu);
        }

        v10[2](v10, 1LL, 0LL, v13);
        goto LABEL_22;
      }

      secLogObjForScope((const char *)pairingScope);
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v26) = v14 + 2;
        _os_log_impl(&dword_187D59000, v19, OS_LOG_TYPE_DEFAULT, "Attempt %d, retrying fetching prepare", buf, 8u);
      }

      ++v14;

      if (v14 >= prepareMaxRetry)
      {
        secLogObjForScope("SecError");
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v26) = prepareMaxRetry;
          _os_log_impl( &dword_187D59000,  v20,  OS_LOG_TYPE_DEFAULT,  "pairing: failed to fetch prepare %d times, bailing.",  buf,  8u);
        }

        v10[2](v10, 1LL, 0LL, v13);
        goto LABEL_23;
      }
    }

    ((void (**)(id, uint64_t, id, id))v10)[2](v10, 0LL, v18, 0LL);
LABEL_22:

    goto LABEL_23;
  }

  secLogObjForScope((const char *)pairingScope);
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187D59000,  v21,  OS_LOG_TYPE_DEFAULT,  "initiatorCompleteSecondPacketOctagon octagonData missing or wrong class",  buf,  2u);
  }

  [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v13, v10);
LABEL_23:
}

- (BOOL)join:(id *)a3 voucher:(id)a4 eventS:(id)a5 setupPairingChannelSignPost:(octagon_signpost_s)a6 finishPairing:(BOOL *)a7 error:(id *)a8
{
  var1 = (void *)a6.var1;
  var0 = (void *)a6.var0;
  id v12 = a4;
  id v13 = a5;
  uint64_t v47 = 0LL;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  char v50 = 0;
  uint64_t v41 = 0LL;
  char v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = __Block_byref_object_copy_;
  uint64_t v45 = __Block_byref_object_dispose_;
  id v46 = 0LL;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x2020000000LL;
  char v40 = 0;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  uint64_t v36 = __Block_byref_object_copy_;
  uint64_t v37 = __Block_byref_object_dispose_;
  id v38 = 0LL;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[KCPairingChannel otControl](self, "otControl");
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel controlArguments](self, "controlArguments");
  char v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel joiningConfiguration](self, "joiningConfiguration");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 voucher];
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 voucherSignature];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke;
  v25[3] = &unk_18A134AD0;
  v31[1] = var0;
  v31[2] = var1;
  v25[4] = self;
  __int16 v27 = v39;
  id v19 = v13;
  id v26 = v19;
  int v28 = &v41;
  __int16 v29 = &v47;
  objc_copyWeak(v31, &location);
  id v30 = &v33;
  v31[3] = a7;
  [v14 rpcJoinWithArguments:v15 configuration:v16 vouchData:v17 vouchSig:v18 reply:v25];

  if (a8)
  {
    id v20 = (void *)v42[5];
    if (v20) {
      *a8 = v20;
    }
  }

  if (a3) {
    *a3 = (id) v34[5];
  }
  char v21 = *((_BYTE *)v48 + 24);
  objc_destroyWeak(v31);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v21;
}

- (void)initiatorThirdPacket:(id)a3 complete:(id)a4
{
  uint64_t v109 = *MEMORY[0x1895F89C0];
  id v82 = a3;
  uint64_t v80 = (void (**)(id, uint64_t, void, void *))a4;
  secLogObjForScope("pairing");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_187D59000, v6, OS_LOG_TYPE_DEFAULT, "initiator packet 3", (uint8_t *)&buf, 2u);
  }

  _OctagonSignpostLogSystem();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = _OctagonSignpostCreate();
  v81 = v9;
  uint64_t v10 = (char *)v8;

  _OctagonSignpostLogSystem();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v12 = v11;
  unint64_t v77 = (unint64_t)(v10 - 1);
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v10,  "PairingChannelInitiatorMessage3",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelInitiatorMessage3  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  int v14 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  char v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 altDSID];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 flowID];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 deviceSessionID];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v72) = 1;
  char v84 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v14,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v16,  v18,  v20,  @"com.apple.security.initiatorJoinsTrustSystems",  metricsAreEnabled,  v72,  &unk_18A13BFB0);

  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", 0LL, 0LL);
  [v82 objectForKeyedSubscript:@"b"];
  uint64_t v83 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v107 = 0x2020000000LL;
  char v108 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (v83 && SOSCCIsSOSTrustAndSyncingEnabled())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      id v56 = v55;
      if (v77 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        int v57 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
        *(_DWORD *)v105 = 67240192;
        *(_DWORD *)&v105[4] = v57;
        _os_signpost_emit_with_name_impl( &dword_187D59000,  v56,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v10,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNa mePairingChannelInitiatorMessage3}d ",  v105,  8u);
      }

      _OctagonSignpostLogSystem();
      id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 134218496;
        int v59 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
        *(void *)&v105[4] = v10;
        *(_WORD *)&v105[12] = 2048;
        *(double *)&v105[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
        *(_WORD *)&v105[22] = 1026;
        *(_DWORD *)&v105[24] = v59;
        _os_log_impl( &dword_187D59000,  v58,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,s ignpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  v105,  0x1Cu);
      }

      [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:5 userInfo:0];
      os_signpost_id_t v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v84,  0LL,  v60);
      v80[2](v80, 1LL, 0LL, v60);
      goto LABEL_61;
    }

    *(void *)v105 = 0LL;
    *(void *)&v105[8] = v105;
    *(void *)&v105[16] = 0x2020000000LL;
    v105[24] = 0;
    _OctagonSignpostLogSystem();
    char v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = _OctagonSignpostCreate();
    uint64_t v78 = v23;
    id v24 = (char *)v22;

    _OctagonSignpostLogSystem();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v26 = v25;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)v103 = 0;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v26,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v24,  "PairingChannelInitiatorJoinSOS",  " enableTelemetry=YES ",  v103,  2u);
    }

    _OctagonSignpostLogSystem();
    __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v103 = 134217984;
      v104 = v24;
      _os_log_impl( &dword_187D59000,  v27,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelInitiatorJoinSOS  enableTelemetry=YES ",  v103,  0xCu);
    }
    v75 = -[KCPairingChannel connection](self, "connection");
    v93[0] = MEMORY[0x1895F87A8];
    v93[1] = 3221225472LL;
    v93[2] = __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke;
    v93[3] = &unk_18A1349E0;
    v98 = v24;
    v99 = v78;
    v100 = v10;
    v101 = v81;
    v96 = v105;
    p___int128 buf = &buf;
    int v28 = v84;
    v94 = v28;
    __int16 v29 = v80;
    id v95 = v29;
    [v75 remoteObjectProxyWithErrorHandler:v93];
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    id v74 = (void *)objc_claimAutoreleasedReturnValue();
    [v74 altDSID];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 flowID];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 deviceSessionID];
    id v34 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = MEMORY[0x1895F87A8];
    v87[1] = 3221225472LL;
    v87[2] = __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_191;
    v87[3] = &unk_18A134AF8;
    uint64_t v90 = v105;
    v87[4] = self;
    v92[2] = v78;
    v92[3] = v10;
    v92[4] = v81;
    v92[1] = v24;
    v91 = &buf;
    uint64_t v88 = v28;
    char v89 = v29;
    objc_copyWeak(v92, &location);
    [v73 joinCircleWithBlob:v83 altDSID:v30 flowID:v32 deviceSessionID:v34 canSendMetrics:1 version:1 complete:v87];

    objc_destroyWeak(v92);
    _Block_object_dispose(v105, 8);
  }

  if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    uint64_t v79 = [v82 objectForKeyedSubscript:@"o"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      secLogObjForScope((const char *)pairingScope);
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v105 = 0;
        _os_log_impl( &dword_187D59000,  v44,  OS_LOG_TYPE_DEFAULT,  "initiatorThirdPacket octagonData missing or wrong class",  v105,  2u);
      }

      uint64_t v45 = [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
      -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v45, v80);
      id v46 = (OTPairingMessage *)v45;
      uint64_t v47 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v49 = v48;
      if (v77 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        int v50 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
        *(_DWORD *)v105 = 67240192;
        *(_DWORD *)&v105[4] = v50;
        _os_signpost_emit_with_name_impl( &dword_187D59000,  v49,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v10,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNa mePairingChannelInitiatorMessage3}d ",  v105,  8u);
      }

      _OctagonSignpostLogSystem();
      id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 134218496;
        int v52 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
        *(void *)&v105[4] = v10;
        *(_WORD *)&v105[12] = 2048;
        *(double *)&v105[14] = (double)(unint64_t)v47 / 1000000000.0;
        *(_WORD *)&v105[22] = 1026;
        *(_DWORD *)&v105[24] = v52;
        _os_log_impl( &dword_187D59000,  v51,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,s ignpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  v105,  0x1Cu);
      }

      v53 = v46;
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v84,  0LL,  v46);
      goto LABEL_60;
    }

    v76 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___OTPairingMessage), "initWithData:", v79);
    if (!-[OTPairingMessage hasVoucher](v76, "hasVoucher"))
    {
      secLogObjForScope((const char *)pairingScope);
      uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v105 = 0;
        _os_log_impl( &dword_187D59000,  v61,  OS_LOG_TYPE_DEFAULT,  "initiatorThirdPacket pairingMessage has no voucher",  v105,  2u);
      }

      [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v35, v80);
      uint64_t v62 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      id v64 = v63;
      if (v77 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
      {
        int v65 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
        *(_DWORD *)v105 = 67240192;
        *(_DWORD *)&v105[4] = v65;
        _os_signpost_emit_with_name_impl( &dword_187D59000,  v64,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v10,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNa mePairingChannelInitiatorMessage3}d ",  v105,  8u);
      }

      _OctagonSignpostLogSystem();
      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 134218496;
        int v67 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
        *(void *)&v105[4] = v10;
        *(_WORD *)&v105[12] = 2048;
        *(double *)&v105[14] = (double)(unint64_t)v62 / 1000000000.0;
        *(_WORD *)&v105[22] = 1026;
        *(_DWORD *)&v105[24] = v67;
        _os_log_impl( &dword_187D59000,  v66,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,s ignpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  v105,  0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v84,  0LL,  v35);
      goto LABEL_59;
    }

    -[OTPairingMessage voucher](v76, "voucher");
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = 0LL;
    id v37 = 0LL;
    int v38 = 0;
    v103[0] = 0;
    while (1)
    {
      secLogObjForScope((const char *)pairingScope);
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[4] = v38 + 1;
        _os_log_impl(&dword_187D59000, v39, OS_LOG_TYPE_DEFAULT, "Attempt %d, calling join", v105, 8u);
      }

      id v85 = 0LL;
      id v86 = v36;
      BOOL v40 = -[KCPairingChannel join:voucher:eventS:setupPairingChannelSignPost:finishPairing:error:]( self,  "join:voucher:eventS:setupPairingChannelSignPost:finishPairing:error:",  &v86,  v35,  v84,  v10,  v81,  v103,  &v85);
      id v41 = v86;

      id v37 = v85;
      if (v40) {
        break;
      }
      if (!+[KCPairingChannel retryable:](&OBJC_CLASS___KCPairingChannel, "retryable:", v37))
      {
        secLogObjForScope("SecError");
        uint64_t v71 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v105 = 136315650;
          *(void *)&v105[4] = pairingScope;
          *(_WORD *)&v105[12] = 1024;
          *(_DWORD *)&v105[14] = v38 + 1;
          *(_WORD *)&v105[18] = 2112;
          *(void *)&v105[20] = v37;
          _os_log_impl(&dword_187D59000, v71, OS_LOG_TYPE_DEFAULT, "%s: Attempt %d failed join: %@", v105, 0x1Cu);
        }

        id v70 = 0LL;
        BOOL v69 = 1LL;
        id v68 = v37;
        goto LABEL_57;
      }

      secLogObjForScope((const char *)pairingScope);
      char v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[4] = v38 + 2;
        _os_log_impl(&dword_187D59000, v42, OS_LOG_TYPE_DEFAULT, "Attempt %d retrying join", v105, 8u);
      }

      ++v38;
      uint64_t v36 = v41;
      if (v38 >= joinMaxRetry)
      {
        secLogObjForScope("SecError");
        uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v105 = 67109120;
          *(_DWORD *)&v105[4] = joinMaxRetry;
          _os_log_impl( &dword_187D59000,  v43,  OS_LOG_TYPE_DEFAULT,  "pairing: failed to join %d times, bailing.",  v105,  8u);
        }

        v80[2](v80, 1LL, 0LL, v37);
LABEL_58:

LABEL_59:
        v53 = v76;
LABEL_60:

        os_signpost_id_t v60 = (void *)v79;
LABEL_61:

        goto LABEL_62;
      }
    }

    id v68 = 0LL;
    BOOL v69 = v103[0] != 0;
    id v70 = v41;
LABEL_57:
    ((void (**)(id, uint64_t, id, void *))v80)[2](v80, v69, v70, v68);
    goto LABEL_58;
  }

- (void)initiatorFourthPacket:(id)a3 complete:(id)a4
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v43 = a3;
  id v42 = a4;
  secLogObjForScope("pairing");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_187D59000, v5, OS_LOG_TYPE_DEFAULT, "initiator packet 4", buf, 2u);
  }

  *(void *)__int128 buf = 0LL;
  uint64_t v61 = buf;
  uint64_t v62 = 0x2020000000LL;
  char v63 = 0;
  _OctagonSignpostLogSystem();
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v7 = _OctagonSignpostCreate();
  uint64_t v9 = v8;

  _OctagonSignpostLogSystem();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v66 = 0;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "PairingChannelInitiatorMessage4",  " enableTelemetry=YES ",  v66,  2u);
  }

  _OctagonSignpostLogSystem();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v66 = 134217984;
    *(void *)&v66[4] = v7;
    _os_log_impl( &dword_187D59000,  v12,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelInitiatorMessage4  enableTelemetry=YES ",  v66,  0xCu);
  }

  id v13 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 altDSID];
  char v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 flowID];
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 deviceSessionID];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v41) = 1;
  id v20 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v13,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v15,  v17,  v19,  @"com.apple.security.initiatorImportsInitialSyncData",  metricsAreEnabled,  v41,  &unk_18A13BFB0);

  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", 0LL, 0LL);
  [v43 objectForKeyedSubscript:@"d"];
  char v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v64 = @"numberOfKeychainItemsAdded";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v65 = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAFAnalyticsEventSecurity addMetrics:](v20, "addMetrics:", v23);

    secLogObjForScope("pairing");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v21 count];
      *(_DWORD *)v66 = 134217984;
      *(void *)&v66[4] = v25;
      _os_log_impl(&dword_187D59000, v24, OS_LOG_TYPE_DEFAULT, "importing %lu items", v66, 0xCu);
    }

    -[KCPairingChannel connection](self, "connection");
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = MEMORY[0x1895F87A8];
    v51[0] = MEMORY[0x1895F87A8];
    v51[1] = 3221225472LL;
    v51[2] = __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_195;
    v51[3] = &unk_18A134B20;
    os_signpost_id_t v55 = v7;
    uint64_t v56 = v9;
    os_signpost_id_t v54 = buf;
    int v28 = v20;
    int v52 = v28;
    id v29 = v42;
    id v53 = v29;
    [v26 remoteObjectProxyWithErrorHandler:v51];
    id v30 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v27;
    v45[1] = 3221225472LL;
    v45[2] = __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_196;
    v45[3] = &unk_18A134B48;
    v45[4] = self;
    uint64_t v48 = buf;
    os_signpost_id_t v49 = v7;
    uint64_t v50 = v9;
    id v46 = v28;
    id v47 = v29;
    [v30 importInitialSyncCredentials:v21 complete:v45];
  }

  else
  {
    secLogObjForScope("pairing");
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v66 = 0;
      _os_log_impl(&dword_187D59000, v31, OS_LOG_TYPE_DEFAULT, "initiator no items to import", v66, 2u);
    }

    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v34 = v33;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      int v35 = v61[24];
      *(_DWORD *)v66 = 67240192;
      *(_DWORD *)&v66[4] = v35;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v34,  OS_SIGNPOST_INTERVAL_END,  v7,  "PairingChannelInitiatorMessage4",  " OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostName PairingChannelInitiatorMessage4}d ",  v66,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v66 = 134218496;
      int v37 = v61[24];
      *(void *)&v66[4] = v7;
      *(_WORD *)&v66[12] = 2048;
      *(double *)&v66[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
      *(_WORD *)&v66[22] = 1026;
      int v67 = v37;
      _os_log_impl( &dword_187D59000,  v36,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage4  OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ",  v66,  0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v20,  1LL,  0LL);
    if (!CloudServicesLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)v66 = xmmword_18A134D20;
      *(void *)&v66[16] = 0LL;
      CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    }

    if (CloudServicesLibraryCore_frameworkLibrary
      && getSecureBackupIsGuitarfishEnabledSymbolLoc()
      && soft_SecureBackupIsGuitarfishEnabled()
      && -[KCPairingChannel initiatorExpectPCSData](self, "initiatorExpectPCSData"))
    {
      secLogObjForScope("pairing");
      int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v66 = 0;
        _os_log_impl(&dword_187D59000, v38, OS_LOG_TYPE_DEFAULT, "initiator will wait for PCS data", v66, 2u);
      }

      CFTypeRef v59 = 0LL;
      if (SecAKSKeybagHoldLockAssertion(0, 600LL, &v59))
      {
        -[KCPairingChannel setGrabbedLockAssertion:](self, "setGrabbedLockAssertion:", 1LL);
      }

      else
      {
        secLogObjForScope("SecError");
        uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v66 = 138412290;
          *(void *)&v66[4] = v59;
          _os_log_impl( &dword_187D59000,  v39,  OS_LOG_TYPE_DEFAULT,  "pairing: Unable to acquire AKS lock assertion: %@",  v66,  0xCu);
        }
      }

      CFTypeRef v40 = v59;
      if (v59)
      {
        CFTypeRef v59 = 0LL;
        CFRelease(v40);
      }

      *(void *)v66 = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)v66, self);
      v57[0] = MEMORY[0x1895F87A8];
      v57[1] = 3221225472LL;
      v57[2] = __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke;
      v57[3] = &unk_18A134950;
      objc_copyWeak(&v58, (id *)v66);
      -[KCPairingChannel setNextState:](self, "setNextState:", v57);
      objc_destroyWeak(&v58);
      objc_destroyWeak((id *)v66);
    }

    else
    {
      (*((void (**)(id, uint64_t, void, void))v42 + 2))(v42, 1LL, 0LL, 0LL);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)initiatorPCSDataPacket:(id)a3 complete:(id)a4
{
  uint64_t v123 = *MEMORY[0x1895F89C0];
  id v82 = a3;
  id v81 = a4;
  secLogObjForScope("pairing");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_187D59000, v5, OS_LOG_TYPE_DEFAULT, "initiator will import PCS data", buf, 2u);
  }

  -[KCPairingChannel setCountOfReceivedItems:](self, "setCountOfReceivedItems:", &unk_18A13BF68);
  [v82 objectForKeyedSubscript:@"o"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = v6 == 0LL;

  if (v7)
  {
    secLogObjForScope("SecError");
    os_signpost_id_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_187D59000, v49, OS_LOG_TYPE_DEFAULT, "pairing: no octagon data, ending session", buf, 2u);
    }

    if (-[KCPairingChannel grabbedLockAssertion](self, "grabbedLockAssertion"))
    {
      CFTypeRef result = 0LL;
      if (!SecAKSKeybagDropLockAssertion(0, &result))
      {
        secLogObjForScope("SecError");
        uint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          CFTypeRef v122 = result;
          _os_log_impl( &dword_187D59000,  v50,  OS_LOG_TYPE_DEFAULT,  "pairing: Failed to drop AKS lock assertion: %@",  buf,  0xCu);
        }
      }

      CFTypeRef v51 = result;
      if (result)
      {
        CFTypeRef result = 0LL;
        CFRelease(v51);
      }

      -[KCPairingChannel setGrabbedLockAssertion:](self, "setGrabbedLockAssertion:", 0LL);
    }

    int v52 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    id v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v53 altDSID];
    os_signpost_id_t v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    os_signpost_id_t v55 = (void *)objc_claimAutoreleasedReturnValue();
    [v55 flowID];
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    int v57 = (void *)objc_claimAutoreleasedReturnValue();
    [v57 deviceSessionID];
    id v58 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v78) = 1;
    uint64_t v83 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v52,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v54,  v56,  v58,  @"com.apple.security.pairingDidNotReceivePCSData",  metricsAreEnabled,  v78,  &unk_18A13BFB0);

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v83,  0LL,  0LL);
    (*((void (**)(id, uint64_t, void, void))v81 + 2))(v81, 1LL, 0LL, 0LL);
  }

  else
  {
    [v82 objectForKeyedSubscript:@"o"];
    uint64_t v83 = (AAFAnalyticsEventSecurity *)objc_claimAutoreleasedReturnValue();
    -[AAFAnalyticsEventSecurity objectForKeyedSubscript:](v83, "objectForKeyedSubscript:", @"e");
    uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = -[AAFAnalyticsEventSecurity objectForKeyedSubscript:](v83, "objectForKeyedSubscript:", @"a");
    -[AAFAnalyticsEventSecurity objectForKeyedSubscript:](v83, "objectForKeyedSubscript:", @"n");
    uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v96, "count"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel setCountOfReceivedItems:](self, "setCountOfReceivedItems:", v8);

    __int128 v107 = 0u;
    __int128 v108 = 0u;
    __int128 v105 = 0u;
    __int128 v106 = 0u;
    [v96 allKeys];
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v97 = [obj countByEnumeratingWithState:&v105 objects:v120 count:16];
    if (v97)
    {
      unsigned int v93 = 0;
      unsigned int v98 = 0;
      uint64_t v95 = *(void *)v106;
      uint64_t v94 = *MEMORY[0x18960BB38];
      uint64_t v91 = *MEMORY[0x18960BAA0];
      uint64_t v92 = *MEMORY[0x18960BAA8];
      uint64_t v89 = *MEMORY[0x18960B870];
      uint64_t v90 = *MEMORY[0x18960B820];
      uint64_t v88 = *MEMORY[0x18960BA80];
      uint64_t v87 = *MEMORY[0x18960BA10];
      uint64_t v86 = *MEMORY[0x18960BE68];
      uint64_t v85 = *MEMORY[0x189607670];
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v106 != v95)
          {
            uint64_t v10 = v9;
            objc_enumerationMutation(obj);
            uint64_t v9 = v10;
          }

          uint64_t v101 = v9;
          uint64_t v11 = *(const void **)(*((void *)&v105 + 1) + 8 * v9);
          context = (void *)MEMORY[0x1895B6424]();
          secLogObjForScope("pairing");
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            CFTypeRef v122 = v11;
            _os_log_impl(&dword_187D59000, v12, OS_LOG_TYPE_DEFAULT, "adding keychain entry key: %@", buf, 0xCu);
          }

          [v96 objectForKeyedSubscript:v11];
          id v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CFTypeRef result = 0LL;
          secLogObjForScope("pairing");
          int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            CFTypeRef v122 = v13;
            _os_log_impl(&dword_187D59000, v14, OS_LOG_TYPE_DEFAULT, "adding keychain entry data %@", buf, 0xCu);
          }

          OSStatus v15 = SecItemAdd(v13, &result);
          OSStatus v16 = v15;
          if (v15 == -25299)
          {
            id v18 = objc_alloc_init(MEMORY[0x189603FC8]);
            -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v94);
            id v19 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 setObject:v19 forKeyedSubscript:v94];

            -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v92);
            id v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 setObject:v20 forKeyedSubscript:v92];

            -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v91);
            char v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 setObject:v21 forKeyedSubscript:v91];

            -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v90);
            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 setObject:v22 forKeyedSubscript:v90];

            -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v89);
            id v23 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 setObject:v23 forKeyedSubscript:v89];

            -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v88);
            id v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 setObject:v24 forKeyedSubscript:v88];

            -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v87);
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 setObject:v25 forKeyedSubscript:v87];

            -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v86);
            id v26 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 setObject:v26 forKeyedSubscript:v86];

            CFDictionaryRef attributesToUpdate = (CFDictionaryRef)-[__CFDictionary mutableCopy](v13, "mutableCopy");
            -[__CFDictionary setObject:forKeyedSubscript:](attributesToUpdate, "setObject:forKeyedSubscript:", 0LL, v94);
            OSStatus v27 = SecItemUpdate((CFDictionaryRef)v18, attributesToUpdate);
            if (v27)
            {
              int v28 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
              -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
              id v29 = (void *)objc_claimAutoreleasedReturnValue();
              [v29 altDSID];
              id v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              [v31 flowID];
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
              [v33 deviceSessionID];
              id v34 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v78) = 1;
              int v35 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v28,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v30,  v32,  v34,  @"com.apple.security.pairingFailedToUpdateItemInKeychain",  metricsAreEnabled,  v78,  &unk_18A13BFB0);

              [MEMORY[0x189607870] errorWithDomain:v85 code:v27 description:@"SecItemUpdate: failed to update PCS item in the keychain"];
              uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
              +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v35,  0LL,  v36);

              secLogObjForScope("SecError");
              int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 67109120;
                LODWORD(v122) = v27;
                _os_log_impl(&dword_187D59000, v37, OS_LOG_TYPE_DEFAULT, "pairing, SecItemUpdate failed %d", buf, 8u);
              }

              ++v98;
            }

            else
            {
              secLogObjForScope("pairing");
              uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 138412290;
                CFTypeRef v122 = v13;
                _os_log_impl(&dword_187D59000, v48, OS_LOG_TYPE_DEFAULT, "successfully updated pcs item: %@", buf, 0xCu);
              }

              ++v93;
            }
          }

          else if (v15)
          {
            int v38 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
            -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
            uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
            [v39 altDSID];
            CFTypeRef v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
            uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
            [v41 flowID];
            id v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
            id v43 = (void *)objc_claimAutoreleasedReturnValue();
            [v43 deviceSessionID];
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v78) = 1;
            uint64_t v45 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v38,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v40,  v42,  v44,  @"com.apple.security.pairingFailedToAddItemToKeychain",  metricsAreEnabled,  v78,  &unk_18A13BFB0);

            [MEMORY[0x189607870] errorWithDomain:v85 code:v16 description:@"SecItemAdd: failed to add PCS item to the keychain"];
            id v46 = (void *)objc_claimAutoreleasedReturnValue();
            +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v45,  0LL,  v46);

            secLogObjForScope("SecError");
            id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 67109120;
              LODWORD(v122) = v16;
              _os_log_impl(&dword_187D59000, v47, OS_LOG_TYPE_DEFAULT, "pairing: failed to add PCS item: %d", buf, 8u);
            }

            ++v98;
          }

          else
          {
            secLogObjForScope("pairing");
            BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138412290;
              CFTypeRef v122 = v13;
              _os_log_impl(&dword_187D59000, v17, OS_LOG_TYPE_DEFAULT, "successfully added pcs item: %@", buf, 0xCu);
            }

            ++v93;
          }

          objc_autoreleasePoolPop(context);
          uint64_t v9 = v101 + 1;
        }

        while (v97 != v101 + 1);
        uint64_t v97 = [obj countByEnumeratingWithState:&v105 objects:v120 count:16];
      }

      while (v97);
    }

    else
    {
      unsigned int v93 = 0;
      unsigned int v98 = 0;
    }

    CFTypeRef v59 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    v118[0] = @"pairingSuccessfulImportCount";
    [MEMORY[0x189607968] numberWithInt:v93];
    os_signpost_id_t v60 = (void *)objc_claimAutoreleasedReturnValue();
    v118[1] = @"pairingFailedImportCount";
    v119[0] = v60;
    [MEMORY[0x189607968] numberWithInt:v98];
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    v119[1] = v61;
    [MEMORY[0x189603F68] dictionaryWithObjects:v119 forKeys:v118 count:2];
    uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    char v63 = (void *)objc_claimAutoreleasedReturnValue();
    [v63 altDSID];
    id v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    int v65 = (void *)objc_claimAutoreleasedReturnValue();
    [v65 flowID];
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    int v67 = (void *)objc_claimAutoreleasedReturnValue();
    [v67 deviceSessionID];
    uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v78) = 1;
    BOOL v69 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v59,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  v62,  v64,  v66,  v68,  @"com.apple.security.pairingImportKeychainResults",  metricsAreEnabled,  v78,  &unk_18A13BFB0);

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v69,  v98 != 0,  0LL);
    if ([v79 isEqualToNumber:MEMORY[0x189604A88]])
    {
      if (-[KCPairingChannel grabbedLockAssertion](self, "grabbedLockAssertion"))
      {
        CFTypeRef result = 0LL;
        if (!SecAKSKeybagDropLockAssertion(0, &result))
        {
          secLogObjForScope("SecError");
          id v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            CFTypeRef v122 = result;
            _os_log_impl( &dword_187D59000,  v70,  OS_LOG_TYPE_DEFAULT,  "pairing: Failed to drop AKS lock assertion: %@",  buf,  0xCu);
          }
        }

        CFTypeRef v71 = result;
        if (result)
        {
          CFTypeRef result = 0LL;
          CFRelease(v71);
        }

        -[KCPairingChannel setGrabbedLockAssertion:](self, "setGrabbedLockAssertion:", 0LL);
      }

      secLogObjForScope("pairing");
      uint64_t v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        CFTypeRef v122 = v80;
        _os_log_impl(&dword_187D59000, v72, OS_LOG_TYPE_DEFAULT, "Sending ack %@", buf, 0xCu);
      }

      v114 = @"k";
      v115 = v80;
      v116 = @"o";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v73;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      id v74 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *, void))v81 + 2))(v81, 1LL, v74, 0LL);
    }

    else
    {
      CFTypeRef result = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)&result, self);
      v103[0] = MEMORY[0x1895F87A8];
      v103[1] = 3221225472LL;
      v103[2] = __52__KCPairingChannel_initiatorPCSDataPacket_complete___block_invoke;
      v103[3] = &unk_18A134950;
      objc_copyWeak(&v104, (id *)&result);
      -[KCPairingChannel setNextState:](self, "setNextState:", v103);
      secLogObjForScope("pairing");
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        CFTypeRef v122 = v80;
        _os_log_impl(&dword_187D59000, v75, OS_LOG_TYPE_DEFAULT, "Sending ack %@", buf, 0xCu);
      }

      v110 = @"k";
      v111 = v80;
      v112 = @"o";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v76;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
      unint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *, void))v81 + 2))(v81, 0LL, v77, 0LL);

      objc_destroyWeak(&v104);
      objc_destroyWeak((id *)&result);
    }
  }
}

- (void)acceptorFirstPacket:(id)a3 complete:(id)a4
{
  v124[1] = *MEMORY[0x1895F89C0];
  id v82 = a3;
  id v81 = (void (**)(id, uint64_t, void, void *))a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  secLogObjForScope("pairing");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_187D59000, v6, OS_LOG_TYPE_DEFAULT, "acceptor packet 1", buf, 2u);
  }

  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", 0LL, 0LL);
  if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS")
    && -[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    uint64_t v7 = 3LL;
  }

  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    uint64_t v7 = 2LL;
  }

  else
  {
    uint64_t v7 = -[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS");
  }

  uint64_t v8 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  uint64_t v123 = @"supportedTrustSystem";
  [MEMORY[0x189607968] numberWithInteger:v7];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = v9;
  [MEMORY[0x189603F68] dictionaryWithObjects:v124 forKeys:&v123 count:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 altDSID];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 flowID];
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  OSStatus v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 deviceSessionID];
  OSStatus v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v71) = 1;
  BOOL v17 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v8,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  v10,  v12,  v14,  v16,  @"com.apple.security.acceptorCreatesPacket2",  metricsAreEnabled,  v71,  &unk_18A13BFB0);

  uint64_t v112 = 0LL;
  v113 = &v112;
  uint64_t v114 = 0x2020000000LL;
  char v115 = 0;
  _OctagonSignpostLogSystem();
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = (char *)_OctagonSignpostCreate();
  char v21 = v20;

  _OctagonSignpostLogSystem();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v23 = v22;
  unint64_t v24 = (unint64_t)(v19 - 1);
  if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v23,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v19,  "PairingChannelAcceptorMessage1",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&uint8_t buf[4] = v19;
    _os_log_impl( &dword_187D59000,  v25,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelAcceptorMessage1  enableTelemetry=YES ",  buf,  0xCu);
  }

  if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS")
    && !-[KCPairingChannel ensureControlChannel](self, "ensureControlChannel"))
  {
    secLogObjForScope("pairing");
    id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_187D59000, v43, OS_LOG_TYPE_DEFAULT, "unable to establish a channel to sos control", buf, 2u);
    }

    [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:1 userInfo:0];
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v31, v81);
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v17,  0LL,  v31);
    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v46 = v45;
    if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      int v47 = *((unsigned __int8 *)v113 + 24);
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v47;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v46,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v19,  "PairingChannelAcceptorMessage1",  " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNameP airingChannelAcceptorMessage1}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      int v48 = *((unsigned __int8 *)v113 + 24);
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v120) = v48;
      _os_log_impl( &dword_187D59000,  v36,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signp ost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ",  buf,  0x1Cu);
    }
  }

  else
  {
    if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS"))
    {
      [v82 objectForKeyedSubscript:@"d"];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v27 = v26 == 0LL;

      if (!v27)
      {
        secLogObjForScope("pairing");
        int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl(&dword_187D59000, v28, OS_LOG_TYPE_DEFAULT, "acceptor initialSyncCredentials requested", buf, 2u);
        }

        -[KCPairingChannel setAcceptorWillSendInitialSyncCredentials:]( self,  "setAcceptorWillSendInitialSyncCredentials:",  1LL);
        -[KCPairingChannel setAcceptorInitialSyncCredentialsFlags:]( self,  "setAcceptorInitialSyncCredentialsFlags:",  11LL);
      }
    }

    [v82 objectForKeyedSubscript:@"o"];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v30 = v29 == 0LL;

    if (v30)
    {
      secLogObjForScope("pairing");
      int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( &dword_187D59000,  v35,  OS_LOG_TYPE_DEFAULT,  "initiator didn't send a octagon packet, so skipping all octagon flows",  buf,  2u);
      }

      -[KCPairingChannel setSessionSupportsOctagon:](self, "setSessionSupportsOctagon:", 0LL);
      goto LABEL_35;
    }

    [v82 objectForKeyedSubscript:@"o"];
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!CloudServicesLibraryCore_frameworkLibrary)
      {
        *(_OWORD *)__int128 buf = xmmword_18A134D20;
        *(void *)&buf[16] = 0LL;
        CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
      }

      if (CloudServicesLibraryCore_frameworkLibrary)
      {
        if (getSecureBackupIsGuitarfishEnabledSymbolLoc())
        {
          if (soft_SecureBackupIsGuitarfishEnabled())
          {
            [v31 objectForKeyedSubscript:@"s"];
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              [v31 objectForKeyedSubscript:@"s"];
              uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
              int v34 = [v33 isEqualToNumber:MEMORY[0x189604A88]];

              if (v34) {
                -[KCPairingChannel setAcceptorWillSendPCSData:](self, "setAcceptorWillSendPCSData:", 1LL);
              }
            }
          }
        }
      }

LABEL_35:
      id v31 = objc_alloc_init(MEMORY[0x18960AFB0]);
      [MEMORY[0x189603FC8] dictionary];
      uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!CloudServicesLibraryCore_frameworkLibrary)
      {
        *(_OWORD *)__int128 buf = xmmword_18A134D20;
        *(void *)&buf[16] = 0LL;
        CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
      }

      if (CloudServicesLibraryCore_frameworkLibrary
        && getSecureBackupIsGuitarfishEnabledSymbolLoc()
        && soft_SecureBackupIsGuitarfishEnabled()
        && -[KCPairingChannel acceptorWillSendPCSData](self, "acceptorWillSendPCSData"))
      {
        -[os_log_s setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", MEMORY[0x189604A88], @"y");
      }

      uint64_t v108 = 0LL;
      uint64_t v109 = &v108;
      uint64_t v110 = 0x2020000000LL;
      uint64_t v111 = 1LL;
      *(void *)__int128 buf = 0LL;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v120 = __Block_byref_object_copy_;
      v121 = __Block_byref_object_dispose_;
      id v122 = 0LL;
      -[KCPairingChannel otControl](self, "otControl");
      int v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel controlArguments](self, "controlArguments");
      int v38 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v39 = MEMORY[0x1895F87A8];
      v107[0] = MEMORY[0x1895F87A8];
      v107[1] = 3221225472LL;
      v107[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke;
      v107[3] = &unk_18A134B70;
      v107[4] = &v108;
      v107[5] = buf;
      [v37 fetchTrustStatus:v38 configuration:v31 reply:v107];

      if (v109[3])
      {
        secLogObjForScope("SecError");
        CFTypeRef v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v117 = 0;
          _os_log_impl( &dword_187D59000,  v40,  OS_LOG_TYPE_DEFAULT,  "pairing: device is not trusted, stopping the pairing flow",  v117,  2u);
        }

        uint64_t v41 = *(void **)(*(void *)&buf[8] + 40LL);
        id v42 = v41;
        if (!v41)
        {
          objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:description:",  kKCPairingChannelErrorDomain,  8,  @"device cannot support pairing, not trusted in Octagon");
          id v42 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v81[2](v81, 1LL, 0LL, v42);
        if (!v41) {
      }
        }

      else if (*(void *)(*(void *)&buf[8] + 40LL))
      {
        secLogObjForScope("SecError");
        CFTypeRef v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v52 = *(void *)(*(void *)&buf[8] + 40LL);
          *(_DWORD *)v117 = 138412290;
          *(void *)&v117[4] = v52;
          _os_log_impl( &dword_187D59000,  v51,  OS_LOG_TYPE_DEFAULT,  "pairing: failed to check trust status: %@",  v117,  0xCu);
        }

        v81[2](v81, 1LL, 0LL, *(void **)(*(void *)&buf[8] + 40LL));
      }

      else if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS"))
      {
        _OctagonSignpostLogSystem();
        id v53 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v54 = _OctagonSignpostCreate();
        uint64_t v80 = v55;
        os_signpost_id_t v56 = v54;

        _OctagonSignpostLogSystem();
        int v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v58 = v57;
        if (v56 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
        {
          *(_WORD *)v117 = 0;
          _os_signpost_emit_with_name_impl( &dword_187D59000,  v58,  OS_SIGNPOST_INTERVAL_BEGIN,  v56,  "PairingChannelAcceptorFetchStashCredential",  " enableTelemetry=YES ",  v117,  2u);
        }

        _OctagonSignpostLogSystem();
        CFTypeRef v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v117 = 134217984;
          *(void *)&v117[4] = v56;
          _os_log_impl( &dword_187D59000,  v59,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelAcceptorFetchStashCredential  enableTelemetry=YES ",  v117,  0xCu);
        }

        os_signpost_id_t v60 = (void *)v56;
        *(void *)v117 = 0LL;
        *(void *)&v117[8] = v117;
        *(void *)&v117[16] = 0x2020000000LL;
        LOBYTE(v118) = 0;
        -[KCPairingChannel connection](self, "connection");
        uint64_t v79 = (void *)objc_claimAutoreleasedReturnValue();
        v98[0] = v39;
        v98[1] = 3221225472LL;
        v98[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_216;
        v98[3] = &unk_18A1349E0;
        os_signpost_id_t v103 = v56;
        id v104 = v80;
        __int128 v105 = v19;
        __int128 v106 = v21;
        uint64_t v101 = v117;
        v102 = &v112;
        v75 = v17;
        v99 = v75;
        id v74 = v81;
        id v100 = v74;
        [v79 remoteObjectProxyWithErrorHandler:v98];
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
        uint64_t v78 = (void *)objc_claimAutoreleasedReturnValue();
        [v78 altDSID];
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
        unint64_t v77 = (void *)objc_claimAutoreleasedReturnValue();
        [v77 flowID];
        uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
        uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
        [v61 deviceSessionID];
        uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = v39;
        v89[1] = 3221225472LL;
        v89[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_217;
        v89[3] = &unk_18A134B98;
        uint64_t v95 = v117;
        v97[1] = v60;
        v97[2] = v80;
        uint64_t v90 = v36;
        uint64_t v91 = self;
        id v92 = v82;
        v96 = &v112;
        v97[3] = v19;
        v97[4] = v21;
        unsigned int v93 = v75;
        uint64_t v94 = v74;
        objc_copyWeak(v97, &location);
        [v76 validatedStashedAccountCredential:v73 flowID:v72 deviceSessionID:v62 canSendMetrics:1 complete:v89];

        objc_destroyWeak(v97);
        _Block_object_dispose(v117, 8);
      }

      else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
      {
        v83[0] = v39;
        v83[1] = 3221225472LL;
        v83[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_221;
        v83[3] = &unk_18A134A08;
        uint64_t v86 = &v112;
        uint64_t v87 = v19;
        uint64_t v88 = v21;
        char v84 = v17;
        uint64_t v85 = v81;
        -[KCPairingChannel acceptorFirstOctagonPacket:reply:complete:]( self,  "acceptorFirstOctagonPacket:reply:complete:",  v82,  v36,  v83);
      }

      else
      {
        secLogObjForScope("pairing");
        char v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v117 = 0;
          _os_log_impl(&dword_187D59000, v63, OS_LOG_TYPE_DEFAULT, "acceptor neither of octagon nor SOS", v117, 2u);
        }

        [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:6 userInfo:0];
        id v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v64, v81);
        uint64_t v65 = _OctagonSignpostGetNanoseconds();
        _OctagonSignpostLogSystem();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        int v67 = v66;
        if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
        {
          int v68 = *((unsigned __int8 *)v113 + 24);
          *(_DWORD *)v117 = 67240192;
          *(_DWORD *)&v117[4] = v68;
          _os_signpost_emit_with_name_impl( &dword_187D59000,  v67,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)v19,  "PairingChannelAcceptorMessage1",  " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostN amePairingChannelAcceptorMessage1}d ",  v117,  8u);
        }

        _OctagonSignpostLogSystem();
        BOOL v69 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v117 = 134218496;
          int v70 = *((unsigned __int8 *)v113 + 24);
          *(void *)&v117[4] = v19;
          *(_WORD *)&v117[12] = 2048;
          *(double *)&v117[14] = (double)(unint64_t)v65 / 1000000000.0;
          *(_WORD *)&v117[22] = 1026;
          int v118 = v70;
          _os_log_impl( &dword_187D59000,  v69,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,s ignpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ",  v117,  0x1Cu);
        }

        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v17,  0LL,  v64);
      }

      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v108, 8);
      goto LABEL_83;
    }

    secLogObjForScope((const char *)pairingScope);
    os_signpost_id_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_187D59000,  v49,  OS_LOG_TYPE_DEFAULT,  "acceptorFirstPacket: expected NSDictionary type",  buf,  2u);
    }

    if (_os_feature_enabled_impl())
    {
      uint64_t v50 = (void *)[objc_alloc(MEMORY[0x18960AFC8]) initTapToRadar:@"Encountered unexpected packet format while proximity pairing" description:@"The source device expected an NSDictionary payload but received an unexpected packet format. Please include a sysdiagnose of both this device and the device signing in." radar:@"137694941"];
      [v50 trigger];
    }

    [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:9 userInfo:0];
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v36, v81);
  }

- (BOOL)fetchEpoch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0LL;
  BOOL v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = __Block_byref_object_copy_;
  unint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0LL;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[KCPairingChannel otControl](self, "otControl");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel controlArguments](self, "controlArguments");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel joiningConfiguration](self, "joiningConfiguration");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __37__KCPairingChannel_fetchEpoch_error___block_invoke;
  v14[3] = &unk_18A134BC0;
  v14[4] = self;
  OSStatus v16 = &v20;
  objc_copyWeak(&v18, &location);
  id v10 = v6;
  id v15 = v10;
  BOOL v17 = &v26;
  [v7 rpcEpochWithArguments:v8 configuration:v9 reply:v14];

  if (a4)
  {
    uint64_t v11 = (void *)v21[5];
    if (v11) {
      *a4 = v11;
    }
  }

  char v12 = *((_BYTE *)v27 + 24);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

- (void)acceptorFirstOctagonPacket:(id)a3 reply:(id)a4 complete:(id)a5
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  [a3 objectForKeyedSubscript:@"o"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    secLogObjForScope((const char *)pairingScope);
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      id v23 = "acceptorFirstOctagonPacket octagon data missing";
LABEL_17:
      _os_log_impl(&dword_187D59000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
    }

- (void)acceptorSecondPacket:(id)a3 complete:(id)a4
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  id v45 = a3;
  id v44 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", 0LL, 0LL);
  v71[0] = 0LL;
  v71[1] = v71;
  v71[2] = 0x2020000000LL;
  char v72 = 0;
  _OctagonSignpostLogSystem();
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = _OctagonSignpostCreate();
  id v42 = v8;
  id v9 = (char *)v7;

  _OctagonSignpostLogSystem();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v11,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v9,  "PairingChannelAcceptorMessage2",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl( &dword_187D59000,  v12,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelAcceptorMessage2  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  int v13 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 altDSID];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 flowID];
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 deviceSessionID];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v36) = 1;
  id v43 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v13,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v15,  v17,  v19,  @"com.apple.security.acceptorCreatesPacket4",  metricsAreEnabled,  v36,  &unk_18A13BFB0);

  secLogObjForScope("pairing");
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_187D59000, v20, OS_LOG_TYPE_DEFAULT, "acceptor packet 2", (uint8_t *)&buf, 2u);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v77 = 0x3032000000LL;
  uint64_t v78 = __Block_byref_object_copy_;
  uint64_t v79 = __Block_byref_object_dispose_;
  id v80 = (id)0xAAAAAAAAAAAAAAAALL;
  [MEMORY[0x189603FC8] dictionary];
  id v80 = (id)objc_claimAutoreleasedReturnValue();
  [v45 objectForKeyedSubscript:@"p"];
  uint32_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[KCPairingChannel sessionSupportsSOS](self, "sessionSupportsSOS")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v69[0] = 0LL;
    v69[1] = v69;
    v69[2] = 0x2020000000LL;
    char v70 = 0;
    _OctagonSignpostLogSystem();
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = _OctagonSignpostCreate();
    uint64_t v41 = v24;
    id v25 = (char *)v23;

    _OctagonSignpostLogSystem();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    __int16 v27 = v26;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)id v74 = 0;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v27,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v25,  "PairingChannelAcceptorCircleJoiningBlob",  " enableTelemetry=YES ",  v74,  2u);
    }

    _OctagonSignpostLogSystem();
    int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v74 = 134217984;
      v75 = v25;
      _os_log_impl( &dword_187D59000,  v28,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelAcceptorCircleJoiningBlob  enableTelemetry=YES ",  v74,  0xCu);
    }

    -[KCPairingChannel connection](self, "connection");
    CFTypeRef v40 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x1895F87A8];
    v60[1] = 3221225472LL;
    v60[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke;
    v60[3] = &unk_18A1349E0;
    uint64_t v65 = v25;
    v66 = v41;
    int v67 = v9;
    int v68 = v42;
    char v63 = v69;
    id v64 = v71;
    __int16 v29 = v43;
    uint64_t v61 = v29;
    id v30 = v44;
    id v62 = v30;
    [v40 remoteObjectProxyWithErrorHandler:v60];
    int v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 altDSID];
    int v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 flowID];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 deviceSessionID];
    int v34 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1895F87A8];
    v52[1] = 3221225472LL;
    v52[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_225;
    v52[3] = &unk_18A134BE8;
    v59[1] = v25;
    v59[2] = v41;
    os_signpost_id_t v56 = v69;
    v52[4] = self;
    p___int128 buf = &buf;
    id v53 = v45;
    id v58 = v71;
    v59[3] = v9;
    v59[4] = v42;
    uint64_t v54 = v29;
    id v55 = v30;
    objc_copyWeak(v59, &location);
    [v38 circleJoiningBlob:v37 flowID:v32 deviceSessionID:v34 canSendMetrics:1 applicant:v21 complete:v52];

    objc_destroyWeak(v59);
    _Block_object_dispose(v69, 8);
  }

  else if (-[KCPairingChannel sessionSupportsOctagon](self, "sessionSupportsOctagon"))
  {
    uint64_t v35 = *(void *)(*((void *)&buf + 1) + 40LL);
    v46[0] = MEMORY[0x1895F87A8];
    v46[1] = 3221225472LL;
    v46[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_228;
    v46[3] = &unk_18A134A08;
    os_signpost_id_t v49 = v71;
    uint64_t v50 = v9;
    CFTypeRef v51 = v42;
    int v47 = v43;
    id v48 = v44;
    -[KCPairingChannel acceptorSecondOctagonPacket:reply:complete:]( self,  "acceptorSecondOctagonPacket:reply:complete:",  v45,  v35,  v46);
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v71, 8);
  objc_destroyWeak(&location);
}

- (BOOL)fetchVoucher:(id)a3 prepare:(id)a4 eventS:(id)a5 finishedPairing:(BOOL *)a6 maxCapability:(id)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v30 = a7;
  uint64_t v44 = 0LL;
  id v45 = &v44;
  uint64_t v46 = 0x2020000000LL;
  char v47 = 0;
  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  uint64_t v41 = __Block_byref_object_copy_;
  id v42 = __Block_byref_object_dispose_;
  id v43 = 0LL;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[KCPairingChannel otControl](self, "otControl");
  int v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel controlArguments](self, "controlArguments");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel joiningConfiguration](self, "joiningConfiguration");
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 peerID];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 permanentInfo];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 permanentInfoSig];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 stableInfo];
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 stableInfoSig];
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1895F87A8];
  v31[1] = 3221225472LL;
  v31[2] = __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke;
  v31[3] = &unk_18A134C10;
  id v31[4] = self;
  id v22 = v14;
  id v32 = v22;
  int v34 = &v38;
  objc_copyWeak(v36, &location);
  id v21 = v12;
  id v33 = v21;
  uint64_t v35 = &v44;
  v36[1] = a6;
  [v28 rpcVoucherWithArguments:v26 configuration:v25 peerID:v24 permanentInfo:v23 permanentInfoSig:v15 stableInfo:v16 stableInfoSig:v17 maxCapability:v30 reply:v31];

  if (a8)
  {
    id v18 = (void *)v39[5];
    if (v18) {
      *a8 = v18;
    }
  }

  char v19 = *((_BYTE *)v45 + 24);

  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v19;
}

- (void)acceptorSecondOctagonPacket:(id)a3 reply:(id)a4 complete:(id)a5
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v41 = a4;
  id v9 = a5;
  id v10 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 altDSID];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 flowID];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 deviceSessionID];
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v37) = 1;
  BOOL v17 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v10,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v12,  v14,  v16,  @"com.apple.security.acceptorCreatesVoucher",  metricsAreEnabled,  v37,  &unk_18A13BFB0);

  [v8 objectForKeyedSubscript:@"o"];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    char v19 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___OTPairingMessage), "initWithData:", v18);
    if (-[OTPairingMessage hasPrepare](v19, "hasPrepare"))
    {
      uint64_t v38 = v18;
      -[OTPairingMessage prepare](v19, "prepare");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned __int8 v43 = 0;
      -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 capability];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 capability];
        id v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v24 = @"full";
      }

      id v39 = v9;
      id v40 = v8;
      secLogObjForScope((const char *)pairingScope);
      __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v45 = (uint64_t)v24;
        _os_log_impl(&dword_187D59000, v27, OS_LOG_TYPE_DEFAULT, "acceptor channel max capability set to %@", buf, 0xCu);
      }

      id v28 = 0LL;
      int v29 = 0;
      while (1)
      {
        secLogObjForScope((const char *)pairingScope);
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 67109120;
          LODWORD(v45) = v29 + 1;
          _os_log_impl(&dword_187D59000, v30, OS_LOG_TYPE_DEFAULT, "Attempt %d fetching voucher", buf, 8u);
        }

        id v42 = 0LL;
        BOOL v31 = -[KCPairingChannel fetchVoucher:prepare:eventS:finishedPairing:maxCapability:error:]( self,  "fetchVoucher:prepare:eventS:finishedPairing:maxCapability:error:",  v41,  v20,  v17,  &v43,  v24,  &v42);
        id v28 = v42;
        if (v31)
        {
          id v9 = v39;
          (*((void (**)(id, void, id, void))v39 + 2))(v39, v43, v41, 0LL);
          goto LABEL_29;
        }

        if (!+[KCPairingChannel retryable:](&OBJC_CLASS___KCPairingChannel, "retryable:", v28)) {
          break;
        }
        secLogObjForScope((const char *)pairingScope);
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 67109120;
          LODWORD(v45) = v29 + 2;
          _os_log_impl(&dword_187D59000, v32, OS_LOG_TYPE_DEFAULT, "Attempt %d retrying fetching voucher", buf, 8u);
        }

        ++v29;

        if (v29 >= vouchMaxRetry)
        {
          secLogObjForScope("SecError");
          id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          *(_DWORD *)__int128 buf = 67109120;
          LODWORD(v45) = vouchMaxRetry;
          int v34 = "pairing: failed to fetch voucher %d times, bailing.";
          uint64_t v35 = v33;
          uint32_t v36 = 8;
          goto LABEL_27;
        }
      }

      secLogObjForScope("SecError");
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_DWORD *)__int128 buf = 136315650;
      uint64_t v45 = pairingScope;
      __int16 v46 = 1024;
      int v47 = v29 + 1;
      __int16 v48 = 2112;
      id v49 = v28;
      int v34 = "%s Attempt %d failed fetching voucher: %@";
      uint64_t v35 = v33;
      uint32_t v36 = 28;
LABEL_27:
      _os_log_impl(&dword_187D59000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
LABEL_28:

      id v9 = v39;
      (*((void (**)(id, uint64_t, void, id))v39 + 2))(v39, 1LL, 0LL, v28);
LABEL_29:
      id v18 = v38;

      id v8 = v40;
    }

    else
    {
      secLogObjForScope("SecError");
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( &dword_187D59000,  v26,  OS_LOG_TYPE_DEFAULT,  "ot-pairing: acceptorSecondOctagonPacket: no octagon message",  buf,  2u);
      }

      [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v20, v9);
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v17,  0LL,  v20);
    }
  }

  else
  {
    secLogObjForScope((const char *)pairingScope);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_187D59000,  v25,  OS_LOG_TYPE_DEFAULT,  "acceptorSecondOctagonPacket octagon data missing",  buf,  2u);
    }

    [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
    char v19 = (OTPairingMessage *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v19, v9);
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v17,  0LL,  v19);
  }
}

- (void)acceptorThirdPacket:(id)a3 complete:(id)a4
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v35 = a3;
  id v6 = a4;
  secLogObjForScope("pairing");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_187D59000, v7, OS_LOG_TYPE_DEFAULT, "acceptor packet 3", buf, 2u);
  }

  *(void *)__int128 buf = 0LL;
  id v53 = buf;
  uint64_t v54 = 0x2020000000LL;
  char v55 = 0;
  _OctagonSignpostLogSystem();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = _OctagonSignpostCreate();
  uint64_t v38 = v10;
  os_signpost_id_t v11 = v9;

  _OctagonSignpostLogSystem();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)os_signpost_id_t v56 = 0;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "PairingChannelAcceptorMessage3",  " enableTelemetry=YES ",  v56,  2u);
  }

  _OctagonSignpostLogSystem();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_signpost_id_t v56 = 134217984;
    os_signpost_id_t v57 = v11;
    _os_log_impl( &dword_187D59000,  v14,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelAcceptorMessage3  enableTelemetry=YES ",  v56,  0xCu);
  }

  id v15 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 altDSID];
  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 flowID];
  char v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 deviceSessionID];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = 1;
  id v22 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v15,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v17,  v19,  v21,  @"com.apple.security.acceptorCreatesPacket5",  metricsAreEnabled,  v33,  &unk_18A13BFB0);

  unsigned int v34 = -[KCPairingChannel acceptorInitialSyncCredentialsFlags](self, "acceptorInitialSyncCredentialsFlags");
  -[KCPairingChannel connection](self, "connection");
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1895F87A8];
  v46[1] = 3221225472LL;
  v46[2] = __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke;
  v46[3] = &unk_18A134B20;
  os_signpost_id_t v50 = v11;
  uint64_t v51 = v38;
  id v49 = buf;
  uint64_t v23 = v22;
  int v47 = v23;
  id v24 = v6;
  id v48 = v24;
  [v37 remoteObjectProxyWithErrorHandler:v46];
  uint32_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 altDSID];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 flowID];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
  int v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 deviceSessionID];
  id v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1895F87A8];
  v39[1] = 3221225472LL;
  v39[2] = __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_233;
  void v39[3] = &unk_18A134C38;
  unsigned __int8 v43 = buf;
  os_signpost_id_t v44 = v11;
  uint64_t v45 = v38;
  BOOL v31 = v23;
  id v40 = v31;
  id v41 = self;
  id v32 = v24;
  id v42 = v32;
  [v36 initialSyncCredentials:v34 altDSID:v26 flowID:v28 deviceSessionID:v30 canSendMetrics:1 complete:v39];

  _Block_object_dispose(buf, 8);
}

- (id)updateItem:(id)a3
{
  id v3 = a3;
  [v3 setObject:0 forKeyedSubscript:*MEMORY[0x18960B818]];
  [v3 setObject:*MEMORY[0x18960BB58] forKeyedSubscript:*MEMORY[0x18960BB38]];
  return v3;
}

- (BOOL)isPacketSizeAcceptable:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v15 = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:a3 format:200 options:0 error:&v15];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v15;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    [(id)objc_opt_class() pairingChannelCompressData:v6];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)[v12 length] > 0x320C8)
    {
      BOOL v11 = 0;
    }

    else
    {
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel setSizeOfPacket:](self, "setSizeOfPacket:", v13);

      BOOL v11 = 1;
    }
  }

  else
  {
    secLogObjForScope("SecError");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      BOOL v17 = v8;
      _os_log_impl( &dword_187D59000,  v10,  OS_LOG_TYPE_DEFAULT,  "pairing: failed to serialize temp packet: %@",  buf,  0xCu);
    }

    BOOL v11 = 0;
    id v12 = 0LL;
    if (a4) {
      *a4 = v8;
    }
  }

  return v11;
}

- (id)createTempPacket:(id)a3 pcsItem:(id)a4 octagonData:(id)a5 keyForItem:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = (void *)[a3 mutableCopy];
  [v12 setObject:v11 forKeyedSubscript:v9];

  id v13 = (void *)[v10 mutableCopy];
  [v13 setObject:v12 forKeyedSubscript:@"a"];
  [MEMORY[0x189603FC8] dictionary];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setObject:v13 forKeyedSubscript:@"o"];

  return v14;
}

- (BOOL)createTempPacketAndCheckSize:(id)a3 pcsItem:(id)a4 octagonData:(id)a5 keyForItem:(id)a6 error:(id *)a7
{
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = -[KCPairingChannel isPacketSizeAcceptable:error:](self, "isPacketSizeAcceptable:error:", v9, a7);

  return (char)a7;
}

- (id)createPacket:(id)a3 results:(id)a4 endSession:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v42 = self;
  -[KCPairingChannel setCountOfSentItems:](self, "setCountOfSentItems:", &unk_18A13BF68);
  [MEMORY[0x189603FC8] dictionary];
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionary];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  if (v5) {
    [v10 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"e"];
  }
  id v39 = v8;
  -[KCPairingChannel setAckNumber:](self, "setAckNumber:", v8);
  -[KCPairingChannel ackNumber](self, "ackNumber");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setObject:v12 forKeyedSubscript:@"n"];

  [MEMORY[0x189603FC8] dictionary];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v9;
  uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (!v14)
  {
    uint64_t v43 = 0LL;
    goto LABEL_33;
  }

  uint64_t v15 = v14;
  uint64_t v43 = 0LL;
  uint64_t v40 = *(void *)v46;
  while (2)
  {
    for (uint64_t i = 0LL; i != v15; ++i)
    {
      if (*(void *)v46 != v40) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = v43 + i;
      uint64_t v18 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      char v19 = (void *)MEMORY[0x1895B6424]();
      [NSString stringWithFormat:@"%@+%ld", @"pcsdata", v43 + i];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      id v21 = (void *)[v18 mutableCopy];
      -[KCPairingChannel updateItem:](v42, "updateItem:", v21);
      id v22 = (void *)objc_claimAutoreleasedReturnValue();

      id v44 = 0LL;
      uint64_t v23 = v11;
      BOOL v24 = -[KCPairingChannel createTempPacketAndCheckSize:pcsItem:octagonData:keyForItem:error:]( v42,  "createTempPacketAndCheckSize:pcsItem:octagonData:keyForItem:error:",  v13,  v22,  v11,  v20,  &v44);
      id v25 = v44;
      uint64_t v26 = v25;
      if (v24 && v25 == 0LL)
      {
        [v13 setObject:v22 forKeyedSubscript:v20];
        goto LABEL_21;
      }

      if (v24)
      {
        secLogObjForScope("SecError");
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v50 = (uint64_t)v26;
          BOOL v31 = "pairing: failed to compress packet. will not add anymore items, error: %@";
          id v32 = v30;
          uint32_t v33 = 12;
LABEL_29:
          _os_log_impl(&dword_187D59000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
        }

- (id)copySubsetFrom:(id)a3 begin:(unint64_t)a4 end:(unint64_t)a5
{
  id v7 = a3;
  [MEMORY[0x189603FA8] array];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = a4 - a5;
  if (a4 < a5)
  {
    uint64_t v10 = 0LL;
    do
    {
      [v7 objectAtIndexedSubscript:a4 + v10];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 setObject:v11 atIndexedSubscript:v10];

      ++v10;
    }

    while (v9 + v10);
  }

  return v8;
}

- (id)evaluateResults:(void *)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  CFTypeID v5 = CFGetTypeID(a3);
  if (v5 == CFArrayGetTypeID())
  {
    id v6 = a3;
    -[KCPairingChannel setAllPCSItems:](self, "setAllPCSItems:", v6);
    if ((unint64_t)[v6 count] < 0xC9)
    {
      -[KCPairingChannel createPacket:results:endSession:]( self,  "createPacket:results:endSession:",  &unk_18A13BF80,  v6,  1LL);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      return v11;
    }

    else
    {
      id v7 = -[KCPairingChannel copySubsetFrom:begin:end:](self, "copySubsetFrom:begin:end:", v6, 0LL, 200LL);

      -[KCPairingChannel createPacket:results:endSession:]( self,  "createPacket:results:endSession:",  &unk_18A13BF80,  v7,  0LL);
      id v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }
  }

  else
  {
    secLogObjForScope("SecError");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      CFTypeID v13 = CFGetTypeID(a3);
      _os_log_impl( &dword_187D59000,  v10,  OS_LOG_TYPE_DEFAULT,  "acceptorPCSDataPacket: received unexpected return type from SecItemCopyMatching, typeID: %lu",  (uint8_t *)&v12,  0xCu);
    }

    -[KCPairingChannel createPacket:results:endSession:]( self,  "createPacket:results:endSession:",  &unk_18A13BF80,  0LL,  1LL);
    return (id)objc_claimAutoreleasedReturnValue();
  }

- (int)fetchPCSItems:(const void *)a3
{
  v26[8] = *MEMORY[0x1895F89C0];
  -[KCPairingChannel dsidForTest](self, "dsidForTest");
  CFTypeID v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[KCPairingChannel dsidForTest](self, "dsidForTest");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v21 = 0LL;
    id v22 = &v21;
    uint64_t v23 = 0x2050000000LL;
    id v7 = (void *)getACAccountStoreClass_softClass;
    uint64_t v24 = getACAccountStoreClass_softClass;
    if (!getACAccountStoreClass_softClass)
    {
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __getACAccountStoreClass_block_invoke;
      v20[3] = &unk_18A135408;
      v20[4] = &v21;
      __getACAccountStoreClass_block_invoke((uint64_t)v20);
      id v7 = (void *)v22[3];
    }

    id v8 = v7;
    _Block_object_dispose(&v21, 8);
    [v8 defaultStore];
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aa_primaryAppleAccount");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "aa_personID");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v11 = *MEMORY[0x18960BB58];
  uint64_t v12 = *MEMORY[0x18960BE68];
  v25[0] = *MEMORY[0x18960BB38];
  v25[1] = v12;
  v26[0] = v11;
  v26[1] = MEMORY[0x189604A88];
  uint64_t v13 = *MEMORY[0x18960B820];
  v25[2] = *MEMORY[0x18960BAA8];
  v25[3] = v13;
  v26[2] = MEMORY[0x189604A88];
  v26[3] = @"com.apple.ProtectedCloudStorage";
  uint64_t v14 = *MEMORY[0x18960BDA0];
  v25[4] = *MEMORY[0x18960BA80];
  void v25[5] = v14;
  uint64_t v15 = *MEMORY[0x18960BDA8];
  v26[4] = v6;
  v26[5] = v15;
  uint64_t v16 = *MEMORY[0x18960BE20];
  v25[6] = *MEMORY[0x18960BE18];
  v25[7] = v16;
  v26[6] = MEMORY[0x189604A88];
  v26[7] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:8];
  uint64_t v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  OSStatus v18 = SecItemCopyMatching(v17, a3);

  return v18;
}

- (void)acceptorPCSDataPacket:(id)a3 complete:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  secLogObjForScope("pairing");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_187D59000, v7, OS_LOG_TYPE_DEFAULT, "acceptor packet will include pcs data", buf, 2u);
  }

  *(void *)__int128 buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = __51__KCPairingChannel_acceptorPCSDataPacket_complete___block_invoke;
  v29[3] = &unk_18A134950;
  id location = &v30;
  objc_copyWeak(&v30, (id *)buf);
  -[KCPairingChannel setNextState:](self, "setNextState:", v29);
  CFTypeRef cf = 0LL;
  int v8 = -[KCPairingChannel fetchPCSItems:](self, "fetchPCSItems:", &cf);
  if (v8 || !cf)
  {
    secLogObjForScope("SecError");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v27 = 0;
      _os_log_impl(&dword_187D59000, v11, OS_LOG_TYPE_DEFAULT, "pairing: fetched no results, ending session", v27, 2u);
    }

    uint64_t v12 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 altDSID];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 flowID];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 deviceSessionID];
    OSStatus v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = 1;
    unint64_t v9 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v12,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v14,  v16,  v18,  @"com.apple.security.pairingFailedFetchPCSItems",  metricsAreEnabled,  v24,  &unk_18A13BFB0,  v25,  &v30);

    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:v8 description:@"SecItemCopyMatching: failed to fetch pcs data from the keychain"];
    char v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v9,  0LL,  v19);

    -[KCPairingChannel setAckNumber:](self, "setAckNumber:", &unk_18A13BF80);
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"e"];
    -[KCPairingChannel ackNumber](self, "ackNumber");
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setObject:v22 forKeyedSubscript:@"n"];

    [v20 setObject:v21 forKeyedSubscript:@"o"];
    CFTypeRef v23 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v23);
    }

    (*((void (**)(id, void, void *, void))v6 + 2))(v6, 0LL, v20, 0LL);
  }

  else
  {
    -[KCPairingChannel evaluateResults:](self, "evaluateResults:");
    unint64_t v9 = (AAFAnalyticsEventSecurity *)objc_claimAutoreleasedReturnValue();
    CFTypeRef v10 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v10);
    }

    (*((void (**)(id, void, AAFAnalyticsEventSecurity *, void))v6 + 2))(v6, 0LL, v9, 0LL);
  }

  objc_destroyWeak(location);
  objc_destroyWeak((id *)buf);
}

- (id)formNextPacket
{
  unint64_t v3 = -[KCPairingChannel itemIndex](self, "itemIndex") + 200;
  -[KCPairingChannel allPCSItems](self, "allPCSItems");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [v4 count];

  if (v3 < v5)
  {
    unint64_t v7 = -[KCPairingChannel itemIndex](self, "itemIndex") + 200;
  }

  else
  {
    -[KCPairingChannel allPCSItems](self, "allPCSItems");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v7 = [v6 count];
  }

  BOOL v8 = v3 >= v5;
  -[KCPairingChannel allPCSItems](self, "allPCSItems");
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = -[KCPairingChannel copySubsetFrom:begin:end:]( self,  "copySubsetFrom:begin:end:",  v9,  -[KCPairingChannel itemIndex](self, "itemIndex"),  v7);

  uint64_t v11 = (void *)MEMORY[0x189607968];
  -[KCPairingChannel ackNumber](self, "ackNumber");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "integerValue") + 1);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel createPacket:results:endSession:](self, "createPacket:results:endSession:", v13, v10, v8);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)acceptorWaitForAck:(id)a3 complete:(id)a4
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v36 = a3;
  id v6 = a4;
  secLogObjForScope("pairing");
  unint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_187D59000, v7, OS_LOG_TYPE_DEFAULT, "acceptor received ACK from initiator", buf, 2u);
  }

  [v36 objectForKeyedSubscript:@"o"];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = v8 == 0LL;

  if (v9)
  {
    secLogObjForScope("SecError");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_187D59000, v17, OS_LOG_TYPE_DEFAULT, "pairing: no octagon data, ending session", buf, 2u);
    }

    OSStatus v18 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    char v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 altDSID];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 flowID];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
    CFTypeRef v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 deviceSessionID];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v34) = 1;
    id v10 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v18,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v20,  v22,  v24,  @"com.apple.security.pairingEmptyOctagonPayload",  metricsAreEnabled,  v34,  &unk_18A13BFB0);

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v10,  0LL,  0LL);
    (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, 1LL, 0LL, 0LL);
  }

  else
  {
    [v36 objectForKeyedSubscript:@"o"];
    id v10 = (AAFAnalyticsEventSecurity *)objc_claimAutoreleasedReturnValue();
    -[AAFAnalyticsEventSecurity objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", @"k");
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    secLogObjForScope("pairing");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_impl(&dword_187D59000, v11, OS_LOG_TYPE_DEFAULT, "Received ack number: %@", buf, 0xCu);
    }

    -[KCPairingChannel ackNumber](self, "ackNumber");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v35 isEqualToNumber:v12];

    if (v13)
    {
      unint64_t v14 = -[KCPairingChannel itemIndex](self, "itemIndex");
      -[KCPairingChannel allPCSItems](self, "allPCSItems");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = v14 < [v15 count];

      if ((_DWORD)v14)
      {
        *(void *)__int128 buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        v37[0] = MEMORY[0x1895F87A8];
        v37[1] = 3221225472LL;
        v37[2] = __48__KCPairingChannel_acceptorWaitForAck_complete___block_invoke;
        v37[3] = &unk_18A134950;
        objc_copyWeak(&v38, (id *)buf);
        -[KCPairingChannel setNextState:](self, "setNextState:", v37);
        -[KCPairingChannel formNextPacket](self, "formNextPacket");
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void, void *, void))v6 + 2))(v6, 0LL, v16, 0LL);

        objc_destroyWeak(&v38);
        objc_destroyWeak((id *)buf);
      }

      else
      {
        -[KCPairingChannel setAllPCSItems:](self, "setAllPCSItems:", 0LL);
        (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, 1LL, 0LL, 0LL);
      }
    }

    else
    {
      secLogObjForScope("pairing");
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( &dword_187D59000,  v25,  OS_LOG_TYPE_DEFAULT,  "Did not receive expected ack number, re-attempting PCS key transfer",  buf,  2u);
      }

      uint64_t v26 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
      -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 altDSID];
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
      int v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 flowID];
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCPairingChannel peerVersionContext](self, "peerVersionContext");
      BOOL v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 deviceSessionID];
      id v32 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v34) = 1;
      uint32_t v33 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v26,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v28,  v30,  v32,  @"com.apple.security.pairingEmptyAckPayload",  metricsAreEnabled,  v34,  &unk_18A13BFB0);

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v33,  0LL,  0LL);
      -[KCPairingChannel acceptorPCSDataPacket:complete:]( self,  "acceptorPCSDataPacket:complete:",  MEMORY[0x189604A60],  v6);
    }
  }
}

- (BOOL)ensureControlChannel
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3) {
    return 1;
  }
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6F6910];
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.securityd.sos" options:0];
  -[KCPairingChannel setConnection:](self, "setConnection:", v6);

  -[KCPairingChannel connection](self, "connection");
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v7 != 0LL;

  if (v7)
  {
    -[KCPairingChannel connection](self, "connection");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setRemoteObjectInterface:v5];

    -[KCPairingChannel connection](self, "connection");
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 resume];
  }

  return v4;
}

- (void)validateStart:(id)a3
{
  id v4 = a3;
  if (-[KCPairingChannel initiator](self, "initiator"))
  {
    dispatch_get_global_queue(21LL, 0LL);
    unint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __34__KCPairingChannel_validateStart___block_invoke_3;
    block[3] = &unk_18A134CB0;
    id v6 = &v14;
    id v14 = v4;
    id v7 = v4;
    dispatch_async(v5, block);
  }

  else
  {
    -[KCPairingChannel connection](self, "connection");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = MEMORY[0x1895F87A8];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __34__KCPairingChannel_validateStart___block_invoke;
    v17[3] = &unk_18A134C60;
    id v6 = (id *)&v18;
    id v10 = (dispatch_queue_s *)v4;
    OSStatus v18 = v10;
    [v8 remoteObjectProxyWithErrorHandler:v17];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472LL;
    v15[2] = __34__KCPairingChannel_validateStart___block_invoke_2;
    v15[3] = &unk_18A134C88;
    uint64_t v16 = v10;
    uint64_t v12 = v10;
    [v11 stashedCredentialPublicKey:v15];

    unint64_t v5 = v16;
  }
}

- (void)exchangePacket:(id)a3 complete:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  secLogObjForScope("pairing");
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    unsigned int v21 = -[KCPairingChannel counter](self, "counter");
    _os_log_impl(&dword_187D59000, v8, OS_LOG_TYPE_DEFAULT, "Exchange packet: %u", buf, 8u);
  }

  -[KCPairingChannel setCounter:](self, "setCounter:", -[KCPairingChannel counter](self, "counter") + 1);
  if (!v6)
  {
    uint64_t v12 = 0LL;
    goto LABEL_8;
  }

  uint64_t v9 = [(id)objc_opt_class() pairingChannelDecompressData:v6];
  if (v9)
  {
    id v10 = (void *)v9;
    id v19 = 0LL;
    uint64_t v11 = [MEMORY[0x1896079E8] propertyListWithData:v9 options:512 format:0 error:&v19];
    if (v11)
    {
      uint64_t v12 = (void *)v11;

LABEL_8:
      -[KCPairingChannel nextState](self, "nextState");
      int v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __44__KCPairingChannel_exchangePacket_complete___block_invoke;
      v17[3] = &unk_18A134CD8;
      void v17[4] = self;
      id v18 = v7;
      ((void (**)(void, void *, void *))v13)[2](v13, v12, v17);

      goto LABEL_15;
    }

    id v15 = v19;
    secLogObjForScope("pairing");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_187D59000, v16, OS_LOG_TYPE_DEFAULT, "failed to deserialize", buf, 2u);
    }

    (*((void (**)(id, uint64_t, void, id))v7 + 2))(v7, 1LL, 0LL, v15);
  }

  else
  {
    secLogObjForScope("pairing");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_187D59000, v14, OS_LOG_TYPE_DEFAULT, "failed to decompress", buf, 2u);
    }

    (*((void (**)(id, uint64_t, void, void))v7 + 2))(v7, 1LL, 0LL, 0LL);
  }

- (id)exchangePacket:(id)a3 complete:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  __int16 v27 = __Block_byref_object_copy_;
  id v28 = __Block_byref_object_dispose_;
  id v29 = 0LL;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  unsigned int v21 = __Block_byref_object_copy_;
  uint64_t v22 = __Block_byref_object_dispose_;
  id v23 = 0LL;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __50__KCPairingChannel_exchangePacket_complete_error___block_invoke;
  v13[3] = &unk_18A134D00;
  uint64_t v16 = &v18;
  uint64_t v17 = a4;
  id v15 = &v24;
  id v10 = v9;
  id v14 = v10;
  -[KCPairingChannel exchangePacket:complete:](self, "exchangePacket:complete:", v8, v13);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = (id) v19[5];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (int)fetchCountOfReceivedItemsForTesting
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 intValue];

  return v3;
}

- (int)fetchCountOfSentItemsForTesting
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 intValue];

  return v3;
}

- (BOOL)populateKeychainForTestingWithNumberOfKeychainItems:(int)a3
{
  v24[7] = *MEMORY[0x1895F89C0];
  if (a3 < 1) {
    return 1;
  }
  uint64_t v4 = 0LL;
  uint64_t v21 = *MEMORY[0x18960BB38];
  uint64_t v20 = *MEMORY[0x18960BB58];
  uint64_t v19 = *MEMORY[0x18960BE68];
  uint64_t v18 = *MEMORY[0x18960BAA8];
  uint64_t v17 = *MEMORY[0x18960B820];
  uint64_t v16 = *MEMORY[0x18960BA80];
  char v5 = 1;
  uint64_t v15 = *MEMORY[0x18960B870];
  uint64_t v6 = *MEMORY[0x18960BE78];
  uint64_t v7 = MEMORY[0x189604A88];
  do
  {
    v23[0] = v21;
    v23[1] = v19;
    v24[0] = v20;
    v24[1] = v7;
    v23[2] = v18;
    v23[3] = v17;
    v24[2] = v7;
    v24[3] = @"com.apple.ProtectedCloudStorage";
    v24[4] = @"123456";
    v23[4] = v16;
    v23[5] = v15;
    id v8 = (void *)NSString;
    [MEMORY[0x189607AB8] UUID];
    dispatch_semaphore_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 UUIDString];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringWithFormat:@"%@-%d", v10, v4];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[5] = v11;
    v23[6] = v6;
    [@"zesty" dataUsingEncoding:4];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[6] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:7];
    int v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CFTypeRef result = 0LL;
    v5 &= SecItemAdd(v13, &result) == 0;

    uint64_t v4 = (v4 + 1);
  }

  while (a3 != (_DWORD)v4);
  return v5;
}

- (BOOL)populateKeychainWithLargeItemsForTestingWithCount:(int)a3
{
  v26[7] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:203161];
  char v5 = (const __SecRandom *)*MEMORY[0x18960BE08];
  id v6 = v4;
  if (SecRandomCopyBytes(v5, 0x31999uLL, (void *)[v6 mutableBytes]))
  {
    char v7 = 0;
  }

  else if (a3 < 1)
  {
    char v7 = 1;
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v23 = *MEMORY[0x18960BB38];
    uint64_t v22 = *MEMORY[0x18960BB58];
    uint64_t v21 = *MEMORY[0x18960BE68];
    uint64_t v20 = *MEMORY[0x18960BAA8];
    uint64_t v19 = *MEMORY[0x18960B820];
    uint64_t v18 = *MEMORY[0x18960BA80];
    char v7 = 1;
    uint64_t v17 = *MEMORY[0x18960B870];
    uint64_t v9 = *MEMORY[0x18960BE78];
    uint64_t v10 = MEMORY[0x189604A88];
    do
    {
      v25[0] = v23;
      v25[1] = v21;
      v26[0] = v22;
      v26[1] = v10;
      v25[2] = v20;
      v25[3] = v19;
      v26[2] = v10;
      v26[3] = @"com.apple.ProtectedCloudStorage";
      v26[4] = @"123456";
      v25[4] = v18;
      void v25[5] = v17;
      id v11 = (void *)NSString;
      [MEMORY[0x189607AB8] UUID];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 UUIDString];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 stringWithFormat:@"%@-%d", v13, v8];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[6] = v9;
      v26[5] = v14;
      v26[6] = v6;
      [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:7];
      uint64_t v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      CFTypeRef result = 0LL;
      v7 &= SecItemAdd(v15, &result) == 0;

      uint64_t v8 = (v8 + 1);
    }

    while (a3 != (_DWORD)v8);
  }

  return v7;
}

- (BOOL)populateKeychainWithTooLargeItemsForTestingWithCount:(int)a3
{
  v26[7] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:0x100000];
  char v5 = (const __SecRandom *)*MEMORY[0x18960BE08];
  id v6 = v4;
  if (SecRandomCopyBytes(v5, 0x100000uLL, (void *)[v6 mutableBytes]))
  {
    char v7 = 0;
  }

  else if (a3 < 1)
  {
    char v7 = 1;
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v23 = *MEMORY[0x18960BB38];
    uint64_t v22 = *MEMORY[0x18960BB58];
    uint64_t v21 = *MEMORY[0x18960BE68];
    uint64_t v20 = *MEMORY[0x18960BAA8];
    uint64_t v19 = *MEMORY[0x18960B820];
    uint64_t v18 = *MEMORY[0x18960BA80];
    char v7 = 1;
    uint64_t v17 = *MEMORY[0x18960B870];
    uint64_t v9 = *MEMORY[0x18960BE78];
    uint64_t v10 = MEMORY[0x189604A88];
    do
    {
      v25[0] = v23;
      v25[1] = v21;
      v26[0] = v22;
      v26[1] = v10;
      v25[2] = v20;
      v25[3] = v19;
      v26[2] = v10;
      v26[3] = @"com.apple.ProtectedCloudStorage";
      v26[4] = @"123456";
      v25[4] = v18;
      void v25[5] = v17;
      id v11 = (void *)NSString;
      [MEMORY[0x189607AB8] UUID];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 UUIDString];
      int v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 stringWithFormat:@"%@-%d", v13, v8];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[6] = v9;
      v26[5] = v14;
      v26[6] = v6;
      [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:7];
      uint64_t v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      CFTypeRef result = 0LL;
      v7 &= SecItemAdd(v15, &result) == 0;

      uint64_t v8 = (v8 + 1);
    }

    while (a3 != (_DWORD)v8);
  }

  return v7;
}

- (BOOL)populateKeychainWithMixedLargeItemsForTestingWithCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v29[7] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:196608];
  char v5 = (const __SecRandom *)*MEMORY[0x18960BE08];
  id v6 = v4;
  if (SecRandomCopyBytes(v5, 0x30000uLL, (void *)[v6 mutableBytes]))
  {
    char v7 = 0;
  }

  else
  {
    id v8 = [objc_alloc(MEMORY[0x189603FB8]) initWithLength:0x100000];
    if (SecRandomCopyBytes(v5, 0x100000uLL, (void *)[v8 mutableBytes]))
    {
      char v7 = 0;
    }

    else if ((int)v3 < 1)
    {
      char v7 = 1;
    }

    else
    {
      uint64_t v9 = 0LL;
      uint64_t v26 = *MEMORY[0x18960BB38];
      uint64_t v25 = *MEMORY[0x18960BB58];
      uint64_t v24 = *MEMORY[0x18960BE68];
      uint64_t v23 = *MEMORY[0x18960BAA8];
      uint64_t v22 = *MEMORY[0x18960B820];
      uint64_t v21 = *MEMORY[0x18960BA80];
      char v7 = 1;
      uint64_t v20 = *MEMORY[0x18960B870];
      uint64_t v19 = *MEMORY[0x18960BE78];
      do
      {
        if ((v9 & 1) != 0) {
          uint64_t v10 = v6;
        }
        else {
          uint64_t v10 = v8;
        }
        uint64_t v11 = v3;
        id v12 = v10;
        v28[0] = v26;
        v28[1] = v24;
        v29[0] = v25;
        v29[1] = MEMORY[0x189604A88];
        v29[2] = MEMORY[0x189604A88];
        v28[2] = v23;
        v28[3] = v22;
        v29[3] = @"com.apple.ProtectedCloudStorage";
        void v29[4] = @"123456";
        v28[4] = v21;
        v28[5] = v20;
        int v13 = (void *)NSString;
        [MEMORY[0x189607AB8] UUID];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 UUIDString];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 stringWithFormat:@"%@-%d", v15, v9];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        v28[6] = v19;
        void v29[5] = v16;
        v29[6] = v12;
        [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:v28 count:7];
        uint64_t v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        CFTypeRef result = 0LL;
        v7 &= SecItemAdd(v17, &result) == 0;

        uint64_t v3 = v11;
        uint64_t v9 = (v9 + 1);
      }

      while ((_DWORD)v11 != (_DWORD)v9);
    }
  }

  return v7;
}

- (unint64_t)fetchNumberOfPCSKeychainItems
{
  v13[8] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *MEMORY[0x18960BB58];
  uint64_t v3 = *MEMORY[0x18960BE68];
  v12[0] = *MEMORY[0x18960BB38];
  v12[1] = v3;
  v13[0] = v2;
  v13[1] = MEMORY[0x189604A88];
  uint64_t v4 = *MEMORY[0x18960B820];
  v12[2] = *MEMORY[0x18960BAA8];
  v12[3] = v4;
  v13[2] = MEMORY[0x189604A88];
  v13[3] = @"com.apple.ProtectedCloudStorage";
  uint64_t v5 = *MEMORY[0x18960BDA0];
  v12[4] = *MEMORY[0x18960BA80];
  v12[5] = v5;
  uint64_t v6 = *MEMORY[0x18960BDA8];
  void v13[4] = @"123456";
  v13[5] = v6;
  uint64_t v7 = *MEMORY[0x18960BE20];
  v12[6] = *MEMORY[0x18960BE18];
  v12[7] = v7;
  v13[6] = MEMORY[0x189604A88];
  v13[7] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:8];
  id v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = 0LL;
  SecItemCopyMatching(v8, (CFTypeRef *)&v11);
  unint64_t v9 = [v11 count];

  return v9;
}

- (unint64_t)fetchSizeOfPacketForTesting
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = (int)[v2 intValue];

  return v3;
}

- (BOOL)needInitialSync
{
  return self->_needInitialSync;
}

- (KCPairingChannelContext)peerVersionContext
{
  return self->_peerVersionContext;
}

- (void)setPeerVersionContext:(id)a3
{
}

- (BOOL)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(BOOL)a3
{
  self->_initiator = a3;
}

- (unsigned)counter
{
  return self->_counter;
}

- (void)setCounter:(unsigned int)a3
{
  self->_counter = a3;
}

- (BOOL)acceptorWillSendInitialSyncCredentials
{
  return self->_acceptorWillSendInitialSyncCredentials;
}

- (void)setAcceptorWillSendInitialSyncCredentials:(BOOL)a3
{
  self->_acceptorWillSendInitialSyncCredentials = a3;
}

- (unsigned)acceptorInitialSyncCredentialsFlags
{
  return self->_acceptorInitialSyncCredentialsFlags;
}

- (void)setAcceptorInitialSyncCredentialsFlags:(unsigned int)a3
{
  self->_acceptorInitialSyncCredentialsFlags = a3;
}

- (BOOL)acceptorWillSendPCSData
{
  return self->_acceptorWillSendPCSData;
}

- (void)setAcceptorWillSendPCSData:(BOOL)a3
{
  self->_acceptorWillSendPCSData = a3;
}

- (BOOL)initiatorExpectPCSData
{
  return self->_initiatorExpectPCSData;
}

- (void)setInitiatorExpectPCSData:(BOOL)a3
{
  self->_initiatorExpectPCSData = a3;
}

- (NSString)dsidForTest
{
  return self->_dsidForTest;
}

- (void)setDsidForTest:(id)a3
{
}

- (NSNumber)ackNumber
{
  return self->_ackNumber;
}

- (void)setAckNumber:(id)a3
{
}

- (NSArray)allPCSItems
{
  return self->_allPCSItems;
}

- (void)setAllPCSItems:(id)a3
{
}

- (unint64_t)itemIndex
{
  return self->_itemIndex;
}

- (void)setItemIndex:(unint64_t)a3
{
  self->_itemIndex = a3;
}

- (BOOL)grabbedLockAssertion
{
  return self->_grabbedLockAssertion;
}

- (void)setGrabbedLockAssertion:(BOOL)a3
{
  self->_grabbedLockAssertion = a3;
}

- (NSNumber)countOfReceivedItems
{
  return self->_countOfReceivedItems;
}

- (void)setCountOfReceivedItems:(id)a3
{
}

- (NSNumber)countOfSentItems
{
  return self->_countOfSentItems;
}

- (void)setCountOfSentItems:(id)a3
{
}

- (NSNumber)sizeOfPacket
{
  return self->_sizeOfPacket;
}

- (void)setSizeOfPacket:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (OTControl)otControl
{
  return (OTControl *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setOtControl:(id)a3
{
}

- (id)nextOctagonState
{
  return objc_getProperty(self, a2, 112LL, 1);
}

- (void)setNextOctagonState:(id)a3
{
}

- (id)nextState
{
  return objc_getProperty(self, a2, 120LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OTJoiningConfiguration)joiningConfiguration
{
  return self->_joiningConfiguration;
}

- (void)setJoiningConfiguration:(id)a3
{
}

- (OTControlArguments)controlArguments
{
  return self->_controlArguments;
}

- (void)setControlArguments:(id)a3
{
}

- (BOOL)testFailSOS
{
  return self->_testFailSOS;
}

- (void)setTestFailSOS:(BOOL)a3
{
  self->_testFailSOS = a3;
}

- (BOOL)testFailOctagon
{
  return self->_testFailOctagon;
}

- (void)setTestFailOctagon:(BOOL)a3
{
  self->_testFailOctagon = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (BOOL)sessionSupportsSOS
{
  return self->_sessionSupportsSOS;
}

- (void)setSessionSupportsSOS:(BOOL)a3
{
  self->_sessionSupportsSOS = a3;
}

- (BOOL)sessionSupportsOctagon
{
  return self->_sessionSupportsOctagon;
}

- (void)setSessionSupportsOctagon:(BOOL)a3
{
  self->_sessionSupportsOctagon = a3;
}

- (void).cxx_destruct
{
}

void __50__KCPairingChannel_exchangePacket_complete_error___block_invoke( uint64_t a1,  char a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  **(_BYTE **)(a1 + 56) = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44__KCPairingChannel_exchangePacket_complete___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v8 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_16;
  }

  id v21 = 0LL;
  [MEMORY[0x1896079E8] dataWithPropertyList:v6 format:200 options:0 error:&v21];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v21;
  uint64_t v10 = v9;
  if (v7 && !v8)
  {
    uint64_t v11 = 0LL;
    id v12 = v7;
    id v7 = v9;
LABEL_13:

    goto LABEL_15;
  }

  if (!v8)
  {
    uint64_t v11 = 0LL;
    goto LABEL_15;
  }

  [(id)objc_opt_class() pairingChannelCompressData:v8];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = "initiator";
    if (!*(_BYTE *)(v13 + 9)) {
      id v14 = "acceptor";
    }
    objc_msgSend( NSString,  "stringWithFormat:",  @"com.apple.ckks.pairing.packet-size.%s.%u",  v14,  *(unsigned int *)(v13 + 20));
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = (void *)MEMORY[0x18960AFB8];
    uint64_t v24 = *MEMORY[0x18960B378];
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 sendEvent:v12 event:v16];

    secLogObjForScope("pairing");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v11 length];
      *(_DWORD *)__int128 buf = 134217984;
      v23[0] = v18;
      _os_log_impl(&dword_187D59000, v17, OS_LOG_TYPE_DEFAULT, "pairing packet size %lu", buf, 0xCu);
    }

    goto LABEL_13;
  }

uint64_t __34__KCPairingChannel_validateStart___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __34__KCPairingChannel_validateStart___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2 != 0);
}

uint64_t __34__KCPairingChannel_validateStart___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __48__KCPairingChannel_acceptorWaitForAck_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorWaitForAck:v6 complete:v5];
}

void __51__KCPairingChannel_acceptorPCSDataPacket_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorWaitForAck:v6 complete:v5];
}

void __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  os_signpost_id_t v7 = a1[7];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v11 = 67240192;
    LODWORD(v12) = v8;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v6,  OS_SIGNPOST_INTERVAL_END,  v7,  "PairingChannelAcceptorMessage3",  " OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePai ringChannelAcceptorMessage3}d ",  (uint8_t *)&v11,  8u);
  }

  _OctagonSignpostLogSystem();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    int v10 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    uint64_t v12 = a1[7];
    __int16 v13 = 2048;
    double v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v15 = 1026;
    int v16 = v10;
    _os_log_impl( &dword_187D59000,  v9,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage3  OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpos t.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage3}d ",  (uint8_t *)&v11,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  0LL,  v3);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_233(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  [MEMORY[0x189603FC8] dictionary];
  os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  secLogObjForScope("pairing");
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = [v5 count];
    *(_WORD *)&uint8_t buf[8] = 2112;
    *(void *)&buf[10] = v6;
    _os_log_impl( &dword_187D59000,  v8,  OS_LOG_TYPE_DEFAULT,  "acceptor initialSyncCredentials complete: items %u: %@",  buf,  0x12u);
  }

  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:@"d"];
  }
  secLogObjForScope("pairing");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_187D59000, v9, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 3", buf, 2u);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 64);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    int v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    *(_DWORD *)__int128 buf = 67240192;
    *(_DWORD *)&uint8_t buf[4] = v14;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v12,  OS_SIGNPOST_INTERVAL_END,  v13,  "PairingChannelAcceptorMessage3",  " OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePai ringChannelAcceptorMessage3}d ",  buf,  8u);
  }

  _OctagonSignpostLogSystem();
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134218496;
    int v16 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    *(void *)&uint8_t buf[4] = *(void *)(a1 + 64);
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    *(_WORD *)&buf[22] = 1026;
    int v21 = v16;
    _os_log_impl( &dword_187D59000,  v15,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage3  OctagonSignpostNamePairingChannelAcceptorMessage3=%{public,signpos t.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage3}d ",  buf,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 32),  v6 != 0LL,  v6);
  if (!CloudServicesLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)__int128 buf = xmmword_18A134D20;
    *(void *)&buf[16] = 0LL;
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (CloudServicesLibraryCore_frameworkLibrary
    && getSecureBackupIsGuitarfishEnabledSymbolLoc()
    && soft_SecureBackupIsGuitarfishEnabled()
    && [*(id *)(a1 + 40) acceptorWillSendPCSData])
  {
    secLogObjForScope((const char *)pairingScope);
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_187D59000, v17, OS_LOG_TYPE_DEFAULT, "acceptor will send PCS data", buf, 2u);
    }

    *(void *)__int128 buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_234;
    v18[3] = &unk_18A134950;
    objc_copyWeak(&v19, (id *)buf);
    [*(id *)(a1 + 40) setNextState:v18];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_234(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorPCSDataPacket:v6 complete:v5];
}

void __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 || [*(id *)(a1 + 32) testFailOctagon])
  {
    secLogObjForScope("SecError");
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [*(id *)(a1 + 32) counter];
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v11;
      _os_log_impl(&dword_187D59000, v10, OS_LOG_TYPE_DEFAULT, "error acceptor handling octagon packet %d", buf, 8u);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  0LL,  v9);
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v13 = v9;
    int v14 = *(OTPairingMessage **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
    goto LABEL_6;
  }

  secLogObjForScope((const char *)pairingScope);
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [*(id *)(a1 + 32) counter];
    *(_DWORD *)__int128 buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v16;
    _os_log_impl(&dword_187D59000, v15, OS_LOG_TYPE_DEFAULT, "acceptor handled octagon packet %d", buf, 8u);
  }

  if (SOSCCIsSOSTrustAndSyncingEnabled()
    && [*(id *)(a1 + 32) acceptorWillSendInitialSyncCredentials])
  {
    v35[0] = MEMORY[0x1895F87A8];
    v35[1] = 3221225472LL;
    v35[2] = __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke_229;
    v35[3] = &unk_18A134950;
    uint64_t v17 = &v36;
    objc_copyWeak(&v36, (id *)(a1 + 72));
    [*(id *)(a1 + 32) setNextState:v35];
    char v18 = 0;
  }

  else
  {
    if (!CloudServicesLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)__int128 buf = xmmword_18A134D20;
      uint64_t v38 = 0LL;
      CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    }

    if (!CloudServicesLibraryCore_frameworkLibrary
      || !getSecureBackupIsGuitarfishEnabledSymbolLoc()
      || !soft_SecureBackupIsGuitarfishEnabled()
      || ![*(id *)(a1 + 32) acceptorWillSendPCSData])
    {
      char v18 = 1;
      goto LABEL_23;
    }

    secLogObjForScope((const char *)pairingScope);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_187D59000, v19, OS_LOG_TYPE_DEFAULT, "acceptor will send PCS data", buf, 2u);
    }

    uint64_t v30 = MEMORY[0x1895F87A8];
    uint64_t v31 = 3221225472LL;
    id v32 = __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke_230;
    uint32_t v33 = &unk_18A134950;
    uint64_t v17 = &v34;
    objc_copyWeak(&v34, (id *)(a1 + 72));
    [*(id *)(a1 + 32) setNextState:&v30];
    char v18 = 1;
  }

  objc_destroyWeak(v17);
LABEL_23:
  int v14 = objc_alloc_init(&OBJC_CLASS___OTPairingMessage);
  uint64_t v20 = objc_alloc_init(&OBJC_CLASS___OTSupportSOSMessage);
  -[OTPairingMessage setSupportsSOS:](v14, "setSupportsSOS:", v20);

  int v21 = objc_alloc_init(&OBJC_CLASS___OTSupportOctagonMessage);
  -[OTPairingMessage setSupportsOctagon:](v14, "setSupportsOctagon:", v21);

  uint64_t v22 = objc_alloc_init(&OBJC_CLASS___OTSponsorToApplicantRound2M2);
  -[OTPairingMessage setVoucher:](v14, "setVoucher:", v22);

  -[OTPairingMessage voucher](v14, "voucher");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 setVoucher:v7];

  -[OTPairingMessage voucher](v14, "voucher");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 setVoucherSignature:v8];

  else {
    uint64_t v25 = 2LL;
  }
  -[OTPairingMessage supportsSOS](v14, "supportsSOS", v30, v31, v32, v33);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setSupported:v25];

  -[OTPairingMessage supportsOctagon](v14, "supportsOctagon");
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 setSupported:1];

  if ([*(id *)(a1 + 32) acceptorWillSendInitialSyncCredentials]) {
    objc_msgSend( *(id *)(a1 + 32),  "setAcceptorInitialSyncCredentialsFlags:",  objc_msgSend(*(id *)(a1 + 32), "acceptorInitialSyncCredentialsFlags") & 0xFFFFFFFCLL);
  }
  -[PBCodable data](v14, "data");
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) setObject:v28 forKeyedSubscript:@"o"];

  secLogObjForScope("pairing");
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_187D59000, v29, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 2", buf, 2u);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  1LL,  0LL);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  if (!CloudServicesLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)__int128 buf = xmmword_18A134D20;
    uint64_t v38 = 0LL;
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (CloudServicesLibraryCore_frameworkLibrary
    && getSecureBackupIsGuitarfishEnabledSymbolLoc()
    && soft_SecureBackupIsGuitarfishEnabled()
    && [*(id *)(a1 + 32) acceptorWillSendPCSData])
  {
    **(_BYTE **)(a1 + 80) = 0;
  }

  else
  {
    **(_BYTE **)(a1 + 80) = v18;
  }

void __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke_229( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorThirdPacket:v6 complete:v5];
}

void __84__KCPairingChannel_fetchVoucher_prepare_eventS_finishedPairing_maxCapability_error___block_invoke_230( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorPCSDataPacket:v6 complete:v5];
}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  os_signpost_id_t v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v6,  OS_SIGNPOST_INTERVAL_END,  v7,  "PairingChannelAcceptorCircleJoiningBlob",  " OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob=%{public,signpost.telemetry:number1,name=OctagonSignpo stNamePairingChannelAcceptorCircleJoiningBlob}d ",  (uint8_t *)&v19,  8u);
  }

  _OctagonSignpostLogSystem();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[8];
    int v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v19 = 134218496;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v11;
    _os_log_impl( &dword_187D59000,  v9,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorCircleJoiningBlob  OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlo b=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob}d ",  (uint8_t *)&v19,  0x1Cu);
  }

  uint64_t v12 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v14 = v13;
  os_signpost_id_t v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v16 = *(unsigned __int8 *)(*(void *)(a1[7] + 8LL) + 24LL);
    int v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v14,  OS_SIGNPOST_INTERVAL_END,  v15,  "PairingChannelAcceptorMessage2",  " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePai ringChannelAcceptorMessage2}d ",  (uint8_t *)&v19,  8u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218496;
    int v18 = *(unsigned __int8 *)(*(void *)(a1[7] + 8LL) + 24LL);
    uint64_t v20 = a1[10];
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)v12 / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v18;
    _os_log_impl( &dword_187D59000,  v17,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpos t.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ",  (uint8_t *)&v19,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  0LL,  v3);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_225(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = v6;
  if (v5 && !v6) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  }
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 96);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    *(_DWORD *)__int128 buf = 67240192;
    *(_DWORD *)id v49 = v12;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelAcceptorCircleJoiningBlob",  " OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob=%{public,signpost.telemetry:number1,name=OctagonSignpo stNamePairingChannelAcceptorCircleJoiningBlob}d ",  buf,  8u);
  }

  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 96);
    int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    *(_DWORD *)__int128 buf = 134218496;
    *(void *)id v49 = v14;
    *(_WORD *)&v49[8] = 2048;
    *(double *)&v49[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v50 = 1026;
    int v51 = v15;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorCircleJoiningBlob  OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlo b=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorCircleJoiningBlob}d ",  buf,  0x1Cu);
  }

  if (v5)
  {
    secLogObjForScope("pairing");
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [*(id *)(a1 + 32) acceptorWillSendInitialSyncCredentials];
      *(_DWORD *)__int128 buf = 67109378;
      *(_DWORD *)id v49 = v17;
      *(_WORD *)&v49[4] = 2112;
      *(void *)&v49[6] = v7;
      _os_log_impl( &dword_187D59000,  v16,  OS_LOG_TYPE_DEFAULT,  "acceptor pairing complete (will send: %{BOOL}d): %@",  buf,  0x12u);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v5 forKeyedSubscript:@"b"];
  }

  if ([*(id *)(a1 + 32) sessionSupportsOctagon])
  {
    int v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 80);
    uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 40LL);
    v43[0] = MEMORY[0x1895F87A8];
    v43[1] = 3221225472LL;
    v43[2] = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_226;
    v43[3] = &unk_18A134A08;
    uint64_t v46 = v20;
    __int128 v47 = *(_OWORD *)(a1 + 112);
    id v44 = (os_log_s *)*(id *)(a1 + 48);
    id v45 = *(id *)(a1 + 56);
    [v18 acceptorSecondOctagonPacket:v19 reply:v21 complete:v43];

    double v22 = v44;
  }

  else
  {
    secLogObjForScope("pairing");
    __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_187D59000,  v23,  OS_LOG_TYPE_DEFAULT,  "posting kSOSCCCircleOctagonKeysChangedNotification",  buf,  2u);
    }

    notify_post((const char *)*MEMORY[0x18960B7B8]);
    if ([*(id *)(a1 + 32) acceptorWillSendInitialSyncCredentials])
    {
      uint64_t v38 = MEMORY[0x1895F87A8];
      uint64_t v39 = 3221225472LL;
      uint64_t v40 = __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_227;
      id v41 = &unk_18A134950;
      objc_copyWeak(&v42, (id *)(a1 + 88));
      [*(id *)(a1 + 32) setNextState:&v38];
      *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 1;
      uint64_t v24 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = v25;
      os_signpost_id_t v27 = *(void *)(a1 + 112);
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        int v28 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)id v49 = v28;
        _os_signpost_emit_with_name_impl( &dword_187D59000,  v26,  OS_SIGNPOST_INTERVAL_END,  v27,  "PairingChannelAcceptorMessage2",  " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNam ePairingChannelAcceptorMessage2}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        int v30 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
        *(void *)id v49 = *(void *)(a1 + 112);
        *(_WORD *)&v49[8] = 2048;
        *(double *)&v49[10] = (double)(unint64_t)v24 / 1000000000.0;
        __int16 v50 = 1026;
        int v51 = v30;
        _os_log_impl( &dword_187D59000,  v29,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ",  buf,  0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 48),  1LL,  0LL,  v38,  v39,  v40,  v41);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
      objc_destroyWeak(&v42);
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 1;
      uint64_t v31 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint32_t v33 = v32;
      os_signpost_id_t v34 = *(void *)(a1 + 112);
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        int v35 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)id v49 = v35;
        _os_signpost_emit_with_name_impl( &dword_187D59000,  v33,  OS_SIGNPOST_INTERVAL_END,  v34,  "PairingChannelAcceptorMessage2",  " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNam ePairingChannelAcceptorMessage2}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        int v37 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
        *(void *)id v49 = *(void *)(a1 + 112);
        *(_WORD *)&v49[8] = 2048;
        *(double *)&v49[10] = (double)(unint64_t)v31 / 1000000000.0;
        __int16 v50 = 1026;
        int v51 = v37;
        _os_log_impl( &dword_187D59000,  v36,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ",  buf,  0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 48),  1LL,  0LL);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    }

    secLogObjForScope("pairing");
    double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_187D59000, v22, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 2", buf, 2u);
    }
  }
}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_228( void *a1,  uint64_t a2,  void *a3,  void *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a4) {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelAcceptorMessage2",  " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePai ringChannelAcceptorMessage2}d ",  (uint8_t *)&v15,  8u);
  }

  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpos t.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ",  (uint8_t *)&v15,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL),  v6);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_226( void *a1,  uint64_t a2,  void *a3,  void *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a4) {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelAcceptorMessage2",  " OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePai ringChannelAcceptorMessage2}d ",  (uint8_t *)&v15,  8u);
  }

  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage2  OctagonSignpostNamePairingChannelAcceptorMessage2=%{public,signpos t.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage2}d ",  (uint8_t *)&v15,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL),  v6);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __50__KCPairingChannel_acceptorSecondPacket_complete___block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorThirdPacket:v6 complete:v5];
}

void __37__KCPairingChannel_fetchEpoch_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope("pairing");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134218242;
    uint64_t v26 = a2;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl(&dword_187D59000, v7, OS_LOG_TYPE_DEFAULT, "acceptor rpcEpochWithArguments: %ld (%@)", buf, 0x16u);
  }

  if (v6 || [*(id *)(a1 + 32) testFailOctagon])
  {
    secLogObjForScope("SecError");
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [*(id *)(a1 + 32) counter];
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v26) = v9;
      _os_log_impl(&dword_187D59000, v8, OS_LOG_TYPE_DEFAULT, "error acceptor handling packet %d", buf, 8u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a3);
  }

  else
  {
    secLogObjForScope((const char *)pairingScope);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [*(id *)(a1 + 32) counter];
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v26) = v11;
      _os_log_impl(&dword_187D59000, v10, OS_LOG_TYPE_DEFAULT, "acceptor handled packet %d", buf, 8u);
    }

    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    void v23[2] = __37__KCPairingChannel_fetchEpoch_error___block_invoke_222;
    v23[3] = &unk_18A134950;
    objc_copyWeak(&v24, (id *)(a1 + 64));
    [*(id *)(a1 + 32) setNextState:v23];
    int v12 = objc_alloc_init(&OBJC_CLASS___OTPairingMessage);
    id v13 = objc_alloc_init(&OBJC_CLASS___OTSupportSOSMessage);
    -[OTPairingMessage setSupportsSOS:](v12, "setSupportsSOS:", v13);

    int v14 = objc_alloc_init(&OBJC_CLASS___OTSupportOctagonMessage);
    -[OTPairingMessage setSupportsOctagon:](v12, "setSupportsOctagon:", v14);

    int v15 = objc_alloc_init(&OBJC_CLASS___OTSponsorToApplicantRound1M2);
    -[OTPairingMessage setEpoch:](v12, "setEpoch:", v15);

    -[OTPairingMessage epoch](v12, "epoch");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setEpoch:a2];

    LODWORD(v16) = SOSCCIsSOSTrustAndSyncingEnabled();
    -[OTPairingMessage supportsSOS](v12, "supportsSOS");
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
    double v18 = v17;
    if ((_DWORD)v16) {
      uint64_t v19 = 1LL;
    }
    else {
      uint64_t v19 = 2LL;
    }
    [v17 setSupported:v19];

    -[OTPairingMessage supportsOctagon](v12, "supportsOctagon");
    int v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 setSupported:1];

    -[PBCodable data](v12, "data");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) setObject:v21 forKeyedSubscript:@"o"];

    secLogObjForScope((const char *)pairingScope);
    double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_187D59000, v22, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 1", buf, 2u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    objc_destroyWeak(&v24);
  }
}

void __37__KCPairingChannel_fetchEpoch_error___block_invoke_222(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorSecondPacket:v6 complete:v5];
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke( uint64_t a1,  uint64_t a2,  int a3,  int a4,  int a5,  id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_216(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  os_signpost_id_t v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v6,  OS_SIGNPOST_INTERVAL_END,  v7,  "PairingChannelAcceptorFetchStashCredential",  " OctagonSignpostNamePairingChannelAcceptorFetchStashCredential=%{public,signpost.telemetry:number1,name=OctagonSig npostNamePairingChannelAcceptorFetchStashCredential}d ",  (uint8_t *)&v19,  8u);
  }

  _OctagonSignpostLogSystem();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[8];
    int v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v19 = 134218496;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v11;
    _os_log_impl( &dword_187D59000,  v9,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorFetchStashCredential  OctagonSignpostNamePairingChannelAcceptorFetchStashCre dential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorFetchStashCredential}d ",  (uint8_t *)&v19,  0x1Cu);
  }

  uint64_t v12 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v14 = v13;
  os_signpost_id_t v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v16 = *(unsigned __int8 *)(*(void *)(a1[7] + 8LL) + 24LL);
    int v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v14,  OS_SIGNPOST_INTERVAL_END,  v15,  "PairingChannelAcceptorMessage1",  " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePai ringChannelAcceptorMessage1}d ",  (uint8_t *)&v19,  8u);
  }

  _OctagonSignpostLogSystem();
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218496;
    int v18 = *(unsigned __int8 *)(*(void *)(a1[7] + 8LL) + 24LL);
    uint64_t v20 = a1[10];
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)v12 / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v18;
    _os_log_impl( &dword_187D59000,  v17,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpos t.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ",  (uint8_t *)&v19,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  0LL,  v3);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_217(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  secLogObjForScope("pairing");
  os_signpost_id_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109378;
    *(_DWORD *)uint64_t v52 = v5 != 0LL;
    *(_WORD *)&v52[4] = 2112;
    *(void *)&v52[6] = v6;
    _os_log_impl( &dword_187D59000,  v7,  OS_LOG_TYPE_DEFAULT,  "acceptor validatedStashedAccountCredential: %{BOOL}d (%@)",  buf,  0x12u);
  }

  if (v5 && !v6) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
  }
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 96);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
    *(_DWORD *)__int128 buf = 67240192;
    *(_DWORD *)uint64_t v52 = v12;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelAcceptorFetchStashCredential",  " OctagonSignpostNamePairingChannelAcceptorFetchStashCredential=%{public,signpost.telemetry:number1,name=OctagonSig npostNamePairingChannelAcceptorFetchStashCredential}d ",  buf,  8u);
  }

  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 96);
    int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
    *(_DWORD *)__int128 buf = 134218496;
    *(void *)uint64_t v52 = v14;
    *(_WORD *)&v52[8] = 2048;
    *(double *)&v52[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v53 = 1026;
    int v54 = v15;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorFetchStashCredential  OctagonSignpostNamePairingChannelAcceptorFetchStashCre dential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorFetchStashCredential}d ",  buf,  0x1Cu);
  }

  if (v5)
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"c"];
    if ([*(id *)(a1 + 40) sessionSupportsOctagon])
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v16 = *(void **)(a1 + 40);
      v46[0] = MEMORY[0x1895F87A8];
      v46[1] = 3221225472LL;
      v46[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_218;
      v46[3] = &unk_18A134A08;
      uint64_t v49 = *(void *)(a1 + 80);
      __int128 v50 = *(_OWORD *)(a1 + 112);
      uint64_t v18 = *(void *)(a1 + 48);
      id v47 = *(id *)(a1 + 56);
      id v48 = *(id *)(a1 + 64);
      [v16 acceptorFirstOctagonPacket:v18 reply:v17 complete:v46];
    }

    else
    {
      v44[0] = MEMORY[0x1895F87A8];
      v44[1] = 3221225472LL;
      v44[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_219;
      v44[3] = &unk_18A134950;
      objc_copyWeak(&v45, (id *)(a1 + 88));
      [*(id *)(a1 + 40) setNextState:v44];
      secLogObjForScope("pairing");
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_187D59000, v28, OS_LOG_TYPE_DEFAULT, "acceptor reply to packet 1", buf, 2u);
      }

      *(_BYTE *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = 1;
      uint64_t v29 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = v30;
      os_signpost_id_t v32 = *(void *)(a1 + 112);
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        int v33 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)uint64_t v52 = v33;
        _os_signpost_emit_with_name_impl( &dword_187D59000,  v31,  OS_SIGNPOST_INTERVAL_END,  v32,  "PairingChannelAcceptorMessage1",  " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNam ePairingChannelAcceptorMessage1}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      os_signpost_id_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        int v35 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
        *(void *)uint64_t v52 = *(void *)(a1 + 112);
        *(_WORD *)&v52[8] = 2048;
        *(double *)&v52[10] = (double)(unint64_t)v29 / 1000000000.0;
        __int16 v53 = 1026;
        int v54 = v35;
        _os_log_impl( &dword_187D59000,  v34,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ",  buf,  0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 56),  1LL,  0LL);
      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
      objc_destroyWeak(&v45);
    }
  }

  else if ([*(id *)(a1 + 40) sessionSupportsOctagon] {
         && ![*(id *)(a1 + 40) testFailSOS])
  }
  {
    if ([*(id *)(a1 + 40) sessionSupportsOctagon])
    {
      uint64_t v37 = *(void *)(a1 + 32);
      id v36 = *(void **)(a1 + 40);
      v39[0] = MEMORY[0x1895F87A8];
      v39[1] = 3221225472LL;
      v39[2] = __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_220;
      void v39[3] = &unk_18A134A08;
      uint64_t v42 = *(void *)(a1 + 80);
      __int128 v43 = *(_OWORD *)(a1 + 112);
      uint64_t v38 = *(void *)(a1 + 48);
      id v40 = *(id *)(a1 + 56);
      id v41 = *(id *)(a1 + 64);
      [v36 acceptorFirstOctagonPacket:v38 reply:v37 complete:v39];
    }
  }

  else
  {
    secLogObjForScope("pairing");
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)uint64_t v52 = v6;
      _os_log_impl( &dword_187D59000,  v19,  OS_LOG_TYPE_DEFAULT,  "acceptor doesn't have a stashed credential: %@",  buf,  0xCu);
    }

    [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:7 userInfo:0];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) setNextStateError:v20 complete:*(void *)(a1 + 64)];
    uint64_t v21 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    __int16 v23 = v22;
    os_signpost_id_t v24 = *(void *)(a1 + 112);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v25 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)uint64_t v52 = v25;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v23,  OS_SIGNPOST_INTERVAL_END,  v24,  "PairingChannelAcceptorMessage1",  " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNameP airingChannelAcceptorMessage1}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      int v27 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL);
      *(void *)uint64_t v52 = *(void *)(a1 + 112);
      *(_WORD *)&v52[8] = 2048;
      *(double *)&v52[10] = (double)(unint64_t)v21 / 1000000000.0;
      __int16 v53 = 1026;
      int v54 = v27;
      _os_log_impl( &dword_187D59000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signp ost.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ",  buf,  0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 56),  0LL,  v20);
  }
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_221( void *a1,  uint64_t a2,  void *a3,  void *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a4) {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelAcceptorMessage1",  " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePai ringChannelAcceptorMessage1}d ",  (uint8_t *)&v15,  8u);
  }

  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpos t.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ",  (uint8_t *)&v15,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL),  v6);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_218( void *a1,  uint64_t a2,  void *a3,  void *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a4) {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelAcceptorMessage1",  " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePai ringChannelAcceptorMessage1}d ",  (uint8_t *)&v15,  8u);
  }

  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpos t.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ",  (uint8_t *)&v15,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL),  v6);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_219(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorSecondPacket:v6 complete:v5];
}

void __49__KCPairingChannel_acceptorFirstPacket_complete___block_invoke_220( void *a1,  uint64_t a2,  void *a3,  void *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a4) {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelAcceptorMessage1",  " OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePai ringChannelAcceptorMessage1}d ",  (uint8_t *)&v15,  8u);
  }

  _OctagonSignpostLogSystem();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelAcceptorMessage1  OctagonSignpostNamePairingChannelAcceptorMessage1=%{public,signpos t.telemetry:number1,name=OctagonSignpostNamePairingChannelAcceptorMessage1}d ",  (uint8_t *)&v15,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL),  v6);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __52__KCPairingChannel_initiatorPCSDataPacket_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorPCSDataPacket:v6 complete:v5];
}

void __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorPCSDataPacket:v6 complete:v5];
}

void __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_195(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  os_signpost_id_t v7 = a1[7];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v11 = 67240192;
    LODWORD(v12) = v8;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v6,  OS_SIGNPOST_INTERVAL_END,  v7,  "PairingChannelInitiatorMessage4",  " OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePa iringChannelInitiatorMessage4}d ",  (uint8_t *)&v11,  8u);
  }

  _OctagonSignpostLogSystem();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    int v10 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    uint64_t v12 = a1[7];
    __int16 v13 = 2048;
    double v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v15 = 1026;
    int v16 = v10;
    _os_log_impl( &dword_187D59000,  v9,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage4  OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signp ost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ",  (uint8_t *)&v11,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  0LL,  v3);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_196( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope("pairing");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = a2;
    *(_WORD *)&uint8_t buf[8] = 2112;
    *(void *)&buf[10] = v5;
    _os_log_impl( &dword_187D59000,  v6,  OS_LOG_TYPE_DEFAULT,  "initiator importInitialSyncCredentials: %{BOOL}d: %@",  buf,  0x12u);
  }

  if ((_DWORD)a2) {
    *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 0;
  }
  if (!CloudServicesLibraryCore_frameworkLibrary)
  {
    *(_OWORD *)__int128 buf = xmmword_18A134D20;
    *(void *)&uint8_t buf[16] = 0LL;
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (CloudServicesLibraryCore_frameworkLibrary
    && getSecureBackupIsGuitarfishEnabledSymbolLoc()
    && soft_SecureBackupIsGuitarfishEnabled()
    && [*(id *)(a1 + 32) initiatorExpectPCSData])
  {
    secLogObjForScope("pairing");
    os_signpost_id_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_187D59000, v7, OS_LOG_TYPE_DEFAULT, "initiator will wait for PCS data", buf, 2u);
    }

    CFTypeRef cf = 0LL;
    if (SecAKSKeybagHoldLockAssertion(0, 600LL, &cf))
    {
      [*(id *)(a1 + 32) setGrabbedLockAssertion:1];
    }

    else
    {
      secLogObjForScope("SecError");
      __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = cf;
        _os_log_impl( &dword_187D59000,  v15,  OS_LOG_TYPE_DEFAULT,  "pairing: Unable to acquire AKS lock assertion: %@",  buf,  0xCu);
      }
    }

    CFTypeRef v16 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v16);
    }

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, *(id *)(a1 + 32));
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_197;
    v24[3] = &unk_18A134950;
    objc_copyWeak(&v25, &location);
    [*(id *)(a1 + 32) setNextState:v24];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    double v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    __int16 v19 = v18;
    os_signpost_id_t v20 = *(void *)(a1 + 64);
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      int v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v21;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v19,  OS_SIGNPOST_INTERVAL_END,  v20,  "PairingChannelInitiatorMessage4",  " OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostName PairingChannelInitiatorMessage4}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      int v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      *(void *)&uint8_t buf[4] = *(void *)(a1 + 64);
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      int v29 = v23;
      _os_log_impl( &dword_187D59000,  v22,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage4  OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ",  buf,  0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  a2,  v5);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    uint64_t v8 = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v10 = v9;
    os_signpost_id_t v11 = *(void *)(a1 + 64);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v12;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelInitiatorMessage4",  " OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,signpost.telemetry:number1,name=OctagonSignpostName PairingChannelInitiatorMessage4}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      *(void *)&uint8_t buf[4] = *(void *)(a1 + 64);
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v8 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      int v29 = v14;
      _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage4  OctagonSignpostNamePairingChannelInitiatorMessage4=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage4}d ",  buf,  0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  a2,  v5);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void __51__KCPairingChannel_initiatorFourthPacket_complete___block_invoke_197( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorPCSDataPacket:v6 complete:v5];
}

void __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  os_signpost_id_t v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v6,  OS_SIGNPOST_INTERVAL_END,  v7,  "PairingChannelInitiatorJoinSOS",  " OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePai ringChannelInitiatorJoinSOS}d ",  (uint8_t *)&v19,  8u);
  }

  _OctagonSignpostLogSystem();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[8];
    int v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v19 = 134218496;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v11;
    _os_log_impl( &dword_187D59000,  v9,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorJoinSOS  OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpos t.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorJoinSOS}d ",  (uint8_t *)&v19,  0x1Cu);
  }

  uint64_t v12 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v14 = v13;
  os_signpost_id_t v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v16 = *(unsigned __int8 *)(*(void *)(a1[7] + 8LL) + 24LL);
    int v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v14,  OS_SIGNPOST_INTERVAL_END,  v15,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePa iringChannelInitiatorMessage3}d ",  (uint8_t *)&v19,  8u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218496;
    int v18 = *(unsigned __int8 *)(*(void *)(a1[7] + 8LL) + 24LL);
    uint64_t v20 = a1[10];
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)v12 / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v18;
    _os_log_impl( &dword_187D59000,  v17,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signp ost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  (uint8_t *)&v19,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  0LL,  v3);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_191( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5 && (_DWORD)a2) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  os_signpost_id_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 80);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    *(_DWORD *)__int128 buf = 67240192;
    *(_DWORD *)&uint8_t buf[4] = v10;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "PairingChannelInitiatorJoinSOS",  " OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePai ringChannelInitiatorJoinSOS}d ",  buf,  8u);
  }

  _OctagonSignpostLogSystem();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 80);
    int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    *(_DWORD *)__int128 buf = 134218496;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    *(_WORD *)&buf[22] = 1026;
    int v58 = v13;
    _os_log_impl( &dword_187D59000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorJoinSOS  OctagonSignpostNamePairingChannelInitiatorJoinSOS=%{public,signpos t.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorJoinSOS}d ",  buf,  0x1Cu);
  }

  if (v5 || [*(id *)(a1 + 32) testFailSOS])
  {
    int v14 = [*(id *)(a1 + 32) sessionSupportsOctagon];
    secLogObjForScope("pairing");
    os_signpost_id_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( &dword_187D59000,  v15,  OS_LOG_TYPE_DEFAULT,  "failed to join circle with blob, continuing to handle octagon protocol",  buf,  2u);
      }
    }

    else
    {
      if (v16)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl(&dword_187D59000, v15, OS_LOG_TYPE_DEFAULT, "failed to join circle with blob", buf, 2u);
      }

      uint64_t v17 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      int v19 = v18;
      os_signpost_id_t v20 = *(void *)(a1 + 96);
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        int v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v21;
        _os_signpost_emit_with_name_impl( &dword_187D59000,  v19,  OS_SIGNPOST_INTERVAL_END,  v20,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNa mePairingChannelInitiatorMessage3}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        int v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
        *(void *)&uint8_t buf[4] = *(void *)(a1 + 96);
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)v17 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        int v58 = v23;
        _os_log_impl( &dword_187D59000,  v22,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,s ignpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  buf,  0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  0LL,  v5);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }

  else if ([*(id *)(a1 + 32) sessionSupportsOctagon])
  {
    secLogObjForScope("pairing");
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_187D59000, v24, OS_LOG_TYPE_DEFAULT, "initiator circle join complete", buf, 2u);
    }
  }

  else
  {
    if (([*(id *)(a1 + 32) sessionSupportsOctagon] & 1) == 0) {
      [*(id *)(a1 + 32) waitForOctagonUpgrade];
    }
    id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 72));
    secLogObjForScope("pairing");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = WeakRetained[10];
      *(_DWORD *)__int128 buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v27;
      *(_WORD *)&uint8_t buf[8] = 2112;
      *(void *)&buf[10] = 0LL;
      _os_log_impl( &dword_187D59000,  v26,  OS_LOG_TYPE_DEFAULT,  "initiator circle join complete, more data: %{BOOL}d: %@",  buf,  0x12u);
    }

    if (WeakRetained[10])
    {
      v55[0] = MEMORY[0x1895F87A8];
      v55[1] = 3221225472LL;
      v55[2] = __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_192;
      v55[3] = &unk_18A134950;
      objc_copyWeak(&v56, (id *)(a1 + 72));
      [WeakRetained setNextState:v55];
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
      uint64_t v28 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = v29;
      os_signpost_id_t v31 = *(void *)(a1 + 96);
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        int v32 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v32;
        _os_signpost_emit_with_name_impl( &dword_187D59000,  v30,  OS_SIGNPOST_INTERVAL_END,  v31,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNa mePairingChannelInitiatorMessage3}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        int v34 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
        *(void *)&uint8_t buf[4] = *(void *)(a1 + 96);
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)v28 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        int v58 = v34;
        _os_log_impl( &dword_187D59000,  v33,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,s ignpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  buf,  0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  1LL,  0LL);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      objc_destroyWeak(&v56);
    }

    else
    {
      if (!CloudServicesLibraryCore_frameworkLibrary)
      {
        *(_OWORD *)__int128 buf = xmmword_18A134D20;
        *(void *)&uint8_t buf[16] = 0LL;
        CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
      }

      if (CloudServicesLibraryCore_frameworkLibrary
        && getSecureBackupIsGuitarfishEnabledSymbolLoc()
        && soft_SecureBackupIsGuitarfishEnabled()
        && WeakRetained[12])
      {
        secLogObjForScope("pairing");
        int v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl(&dword_187D59000, v35, OS_LOG_TYPE_DEFAULT, "initiator will wait for PCS data", buf, 2u);
        }

        CFTypeRef cf = 0LL;
        if (SecAKSKeybagHoldLockAssertion(0, 600LL, &cf))
        {
          [*(id *)(a1 + 32) setGrabbedLockAssertion:1];
        }

        else
        {
          secLogObjForScope("SecError");
          __int128 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = cf;
            _os_log_impl( &dword_187D59000,  v43,  OS_LOG_TYPE_DEFAULT,  "pairing: Unable to acquire AKS lock assertion: %@",  buf,  0xCu);
          }
        }

        CFTypeRef v44 = cf;
        if (cf)
        {
          CFTypeRef cf = 0LL;
          CFRelease(v44);
        }

        v52[0] = MEMORY[0x1895F87A8];
        v52[1] = 3221225472LL;
        v52[2] = __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_193;
        v52[3] = &unk_18A134950;
        objc_copyWeak(&v53, (id *)(a1 + 72));
        [*(id *)(a1 + 32) setNextState:v52];
        *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
        uint64_t v45 = _OctagonSignpostGetNanoseconds();
        _OctagonSignpostLogSystem();
        uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v47 = v46;
        os_signpost_id_t v48 = *(void *)(a1 + 96);
        if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          int v49 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
          *(_DWORD *)__int128 buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = v49;
          _os_signpost_emit_with_name_impl( &dword_187D59000,  v47,  OS_SIGNPOST_INTERVAL_END,  v48,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpost NamePairingChannelInitiatorMessage3}d ",  buf,  8u);
        }

        _OctagonSignpostLogSystem();
        __int128 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 134218496;
          int v51 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
          *(void *)&uint8_t buf[4] = *(void *)(a1 + 96);
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (double)(unint64_t)v45 / 1000000000.0;
          *(_WORD *)&buf[22] = 1026;
          int v58 = v51;
          _os_log_impl( &dword_187D59000,  v50,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public ,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  buf,  0x1Cu);
        }

        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  a2,  0LL);
        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
        objc_destroyWeak(&v53);
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
        uint64_t v36 = _OctagonSignpostGetNanoseconds();
        _OctagonSignpostLogSystem();
        uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v38 = v37;
        os_signpost_id_t v39 = *(void *)(a1 + 96);
        if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          int v40 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
          *(_DWORD *)__int128 buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = v40;
          _os_signpost_emit_with_name_impl( &dword_187D59000,  v38,  OS_SIGNPOST_INTERVAL_END,  v39,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpost NamePairingChannelInitiatorMessage3}d ",  buf,  8u);
        }

        _OctagonSignpostLogSystem();
        id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 134218496;
          int v42 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
          *(void *)&uint8_t buf[4] = *(void *)(a1 + 96);
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (double)(unint64_t)v36 / 1000000000.0;
          *(_WORD *)&buf[22] = 1026;
          int v58 = v42;
          _os_log_impl( &dword_187D59000,  v41,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public ,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  buf,  0x1Cu);
        }

        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  1LL,  0LL);
        (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      }
    }
  }
}

void __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_192(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorFourthPacket:v6 complete:v5];
}

void __50__KCPairingChannel_initiatorThirdPacket_complete___block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorPCSDataPacket:v6 complete:v5];
}

void __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3 || [*(id *)(a1 + 32) testFailOctagon])
  {
    secLogObjForScope("SecError");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [*(id *)(a1 + 32) counter];
      *(_DWORD *)__int128 buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v5;
      *(_WORD *)&uint8_t buf[8] = 2112;
      *(void *)&buf[10] = v3;
      _os_log_impl(&dword_187D59000, v4, OS_LOG_TYPE_DEFAULT, "ot-pairing: failed to create %d message: %@", buf, 0x12u);
    }

    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    _OctagonSignpostLogSystem();
    os_signpost_id_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v8 = v7;
    os_signpost_id_t v9 = *(void *)(a1 + 88);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v10;
      _os_signpost_emit_with_name_impl( &dword_187D59000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostName PairingChannelInitiatorMessage3}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      *(void *)&uint8_t buf[4] = *(void *)(a1 + 88);
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      int v52 = v12;
      _os_log_impl( &dword_187D59000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,sig npost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  buf,  0x1Cu);
    }

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  0LL,  v3);
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v14 = v3;
    id WeakRetained = *(_BYTE **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }

  else
  {
    secLogObjForScope((const char *)pairingScope);
    BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_187D59000,  v16,  OS_LOG_TYPE_DEFAULT,  "initiatorThirdPacket successfully joined Octagon",  buf,  2u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    if (SOSCCIsSOSTrustAndSyncingEnabled() && WeakRetained[10])
    {
      v49[0] = MEMORY[0x1895F87A8];
      v49[1] = 3221225472LL;
      v49[2] = __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke_189;
      v49[3] = &unk_18A134950;
      objc_copyWeak(&v50, (id *)(a1 + 80));
      [WeakRetained setNextState:v49];
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      uint64_t v17 = _OctagonSignpostGetNanoseconds();
      _OctagonSignpostLogSystem();
      int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      int v19 = v18;
      os_signpost_id_t v20 = *(void *)(a1 + 88);
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        int v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v21;
        _os_signpost_emit_with_name_impl( &dword_187D59000,  v19,  OS_SIGNPOST_INTERVAL_END,  v20,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpostNa mePairingChannelInitiatorMessage3}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      double v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        int v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
        *(void *)&uint8_t buf[4] = *(void *)(a1 + 88);
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)v17 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        int v52 = v23;
        _os_log_impl( &dword_187D59000,  v22,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,s ignpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  buf,  0x1Cu);
      }

      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  1LL,  0LL);
      uint64_t v24 = [MEMORY[0x189604A60] mutableCopy];
      uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8LL);
      uint64_t v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      **(_BYTE **)(a1 + 104) = 0;
      objc_destroyWeak(&v50);
    }

    else
    {
      if (!CloudServicesLibraryCore_frameworkLibrary)
      {
        *(_OWORD *)__int128 buf = xmmword_18A134D20;
        *(void *)&uint8_t buf[16] = 0LL;
        CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
      }

      if (CloudServicesLibraryCore_frameworkLibrary
        && getSecureBackupIsGuitarfishEnabledSymbolLoc()
        && soft_SecureBackupIsGuitarfishEnabled()
        && WeakRetained[12])
      {
        CFTypeRef cf = 0LL;
        if (SecAKSKeybagHoldLockAssertion(0, 600LL, &cf))
        {
          [*(id *)(a1 + 32) setGrabbedLockAssertion:1];
        }

        else
        {
          secLogObjForScope("SecError");
          int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = cf;
            _os_log_impl( &dword_187D59000,  v34,  OS_LOG_TYPE_DEFAULT,  "pairing: Unable to acquire AKS lock assertion: %@",  buf,  0xCu);
          }
        }

        CFTypeRef v35 = cf;
        if (cf)
        {
          CFTypeRef cf = 0LL;
          CFRelease(v35);
        }

        v46[0] = MEMORY[0x1895F87A8];
        v46[1] = 3221225472LL;
        v46[2] = __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke_190;
        v46[3] = &unk_18A134950;
        objc_copyWeak(&v47, (id *)(a1 + 80));
        [WeakRetained setNextState:v46];
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
        uint64_t v36 = _OctagonSignpostGetNanoseconds();
        _OctagonSignpostLogSystem();
        uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v38 = v37;
        os_signpost_id_t v39 = *(void *)(a1 + 88);
        if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          int v40 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
          *(_DWORD *)__int128 buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = v40;
          _os_signpost_emit_with_name_impl( &dword_187D59000,  v38,  OS_SIGNPOST_INTERVAL_END,  v39,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpost NamePairingChannelInitiatorMessage3}d ",  buf,  8u);
        }

        _OctagonSignpostLogSystem();
        id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 134218496;
          int v42 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
          *(void *)&uint8_t buf[4] = *(void *)(a1 + 88);
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (double)(unint64_t)v36 / 1000000000.0;
          *(_WORD *)&buf[22] = 1026;
          int v52 = v42;
          _os_log_impl( &dword_187D59000,  v41,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public ,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  buf,  0x1Cu);
        }

        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  1LL,  0LL);
        uint64_t v43 = [MEMORY[0x189604A60] mutableCopy];
        uint64_t v44 = *(void *)(*(void *)(a1 + 72) + 8LL);
        uint64_t v45 = *(void **)(v44 + 40);
        *(void *)(v44 + 40) = v43;

        **(_BYTE **)(a1 + 104) = 0;
        objc_destroyWeak(&v47);
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
        uint64_t v27 = _OctagonSignpostGetNanoseconds();
        _OctagonSignpostLogSystem();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        int v29 = v28;
        os_signpost_id_t v30 = *(void *)(a1 + 88);
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
        {
          int v31 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
          *(_DWORD *)__int128 buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = v31;
          _os_signpost_emit_with_name_impl( &dword_187D59000,  v29,  OS_SIGNPOST_INTERVAL_END,  v30,  "PairingChannelInitiatorMessage3",  " OctagonSignpostNamePairingChannelInitiatorMessage3=%{public,signpost.telemetry:number1,name=OctagonSignpost NamePairingChannelInitiatorMessage3}d ",  buf,  8u);
        }

        _OctagonSignpostLogSystem();
        int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 134218496;
          int v33 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
          *(void *)&uint8_t buf[4] = *(void *)(a1 + 88);
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = (double)(unint64_t)v27 / 1000000000.0;
          *(_WORD *)&buf[22] = 1026;
          int v52 = v33;
          _os_log_impl( &dword_187D59000,  v32,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage3  OctagonSignpostNamePairingChannelInitiatorMessage3=%{public ,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage3}d ",  buf,  0x1Cu);
        }

        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  1LL,  0LL);
        **(_BYTE **)(a1 + 104) = 1;
      }
    }
  }
}

void __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke_189( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorFourthPacket:v6 complete:v5];
}

void __88__KCPairingChannel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error___block_invoke_190( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorPCSDataPacket:v6 complete:v5];
}

void __51__KCPairingChannel_fetchPrepare_application_error___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4,  void *a5,  void *a6,  void *a7)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v40 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v17 || [*(id *)(a1 + 32) testFailOctagon])
  {
    secLogObjForScope("SecError");
    int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [*(id *)(a1 + 32) counter];
      *(_DWORD *)__int128 buf = 67109378;
      int v48 = v19;
      __int16 v49 = 2112;
      id v50 = v17;
      _os_log_impl( &dword_187D59000,  v18,  OS_LOG_TYPE_DEFAULT,  "ot-pairing: failed to create %d message: %@",  buf,  0x12u);
    }

    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v21 = v17;
    double v22 = *(OTPairingMessage **)(v20 + 40);
    *(void *)(v20 + 40) = v21;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    double v22 = objc_alloc_init(&OBJC_CLASS___OTPairingMessage);
    int v23 = objc_alloc_init(&OBJC_CLASS___OTSupportSOSMessage);
    -[OTPairingMessage setSupportsSOS:](v22, "setSupportsSOS:", v23);

    uint64_t v24 = objc_alloc_init(&OBJC_CLASS___OTSupportOctagonMessage);
    -[OTPairingMessage setSupportsOctagon:](v22, "setSupportsOctagon:", v24);

    uint64_t v25 = objc_alloc_init(&OBJC_CLASS___OTApplicantToSponsorRound2M1);
    -[OTApplicantToSponsorRound2M1 setPeerID:](v25, "setPeerID:", v40);
    -[OTApplicantToSponsorRound2M1 setPermanentInfo:](v25, "setPermanentInfo:", v13);
    -[OTApplicantToSponsorRound2M1 setPermanentInfoSig:](v25, "setPermanentInfoSig:", v14);
    -[OTApplicantToSponsorRound2M1 setStableInfo:](v25, "setStableInfo:", v15);
    -[OTApplicantToSponsorRound2M1 setStableInfoSig:](v25, "setStableInfoSig:", v16);
    else {
      uint64_t v26 = 2LL;
    }
    -[OTPairingMessage supportsSOS](v22, "supportsSOS", v40);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 setSupported:v26];

    -[OTPairingMessage supportsOctagon](v22, "supportsOctagon");
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 setSupported:1];

    -[OTPairingMessage setPrepare:](v22, "setPrepare:", v25);
    uint64_t v29 = *(void *)(a1 + 40);
    secLogObjForScope((const char *)pairingScope);
    os_signpost_id_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( &dword_187D59000,  v30,  OS_LOG_TYPE_DEFAULT,  "initiatorCompleteSecondPacketOctagon returning octagon and sos data",  buf,  2u);
      }

      uint64_t v32 = *(void *)(a1 + 40);
      v45[0] = @"p";
      v45[1] = @"o";
      v46[0] = v32;
      -[PBCodable data](v22, "data");
      int v33 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v33;
      [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:v45 count:2];
      int v34 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v35 = [v34 mutableCopy];
    }

    else
    {
      if (v31)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( &dword_187D59000,  v30,  OS_LOG_TYPE_DEFAULT,  "initiatorCompleteSecondPacketOctagon returning octagon data",  buf,  2u);
      }

      uint64_t v43 = @"o";
      -[PBCodable data](v22, "data");
      int v33 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v44 = v33;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      int v34 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v35 = [v34 mutableCopy];
    }

    uint64_t v36 = *(void *)(*(void *)(a1 + 64) + 8LL);
    uint64_t v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = v35;

    v41[0] = MEMORY[0x1895F87A8];
    v41[1] = 3221225472LL;
    v41[2] = __51__KCPairingChannel_fetchPrepare_application_error___block_invoke_185;
    v41[3] = &unk_18A134950;
    uint64_t v38 = (id *)(a1 + 72);
    objc_copyWeak(&v42, v38);
    id WeakRetained = objc_loadWeakRetained(v38);
    [WeakRetained setNextState:v41];

    objc_destroyWeak(&v42);
  }
}

void __51__KCPairingChannel_fetchPrepare_application_error___block_invoke_185( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorThirdPacket:v6 complete:v5];
}

void __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke( void *a1,  void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  os_signpost_id_t v7 = a1[6];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
    int v11 = 67240192;
    LODWORD(v12) = v8;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v6,  OS_SIGNPOST_INTERVAL_END,  v7,  "PairingChannelInitiatorMakeSOSPeer",  " OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNam ePairingChannelInitiatorMakeSOSPeer}d ",  (uint8_t *)&v11,  8u);
  }

  _OctagonSignpostLogSystem();
  os_signpost_id_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
    uint64_t v12 = a1[6];
    __int16 v13 = 2048;
    double v14 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v15 = 1026;
    int v16 = v10;
    _os_log_impl( &dword_187D59000,  v9,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMakeSOSPeer  OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public ,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer}d ",  (uint8_t *)&v11,  0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_178( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = v6;
  if (v5 && !v6) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  os_signpost_id_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 72);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    *(_DWORD *)__int128 buf = 67240192;
    LODWORD(v25) = v12;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelInitiatorMakeSOSPeer",  " OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNam ePairingChannelInitiatorMakeSOSPeer}d ",  buf,  8u);
  }

  _OctagonSignpostLogSystem();
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    uint64_t v25 = *(void **)(a1 + 72);
    __int16 v26 = 2048;
    double v27 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v28 = 1026;
    int v29 = v14;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMakeSOSPeer  OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer=%{public ,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMakeSOSPeer}d ",  buf,  0x1Cu);
  }

  if (v5 && ([*(id *)(a1 + 32) testFailSOS] & 1) == 0)
  {
    if (![*(id *)(a1 + 32) sessionSupportsOctagon])
    {
      uint64_t v16 = *(void *)(a1 + 48);
      double v22 = @"p";
      id v23 = v5;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void *, void *))(v16 + 16))(v16, 0LL, v17, v7);

      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_179;
      v20[3] = &unk_18A134950;
      int v18 = (id *)(a1 + 64);
      objc_copyWeak(&v21, v18);
      id WeakRetained = objc_loadWeakRetained(v18);
      [WeakRetained setNextState:v20];

      objc_destroyWeak(&v21);
      goto LABEL_18;
    }

    goto LABEL_12;
  }

  if ([*(id *)(a1 + 32) sessionSupportsOctagon])
  {
LABEL_12:
    [*(id *)(a1 + 32) initiatorCompleteSecondPacketOctagon:*(void *)(a1 + 40) application:v5 complete:*(void *)(a1 + 48)];
    goto LABEL_18;
  }

  secLogObjForScope("pairing");
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v25 = v7;
    _os_log_impl(&dword_187D59000, v15, OS_LOG_TYPE_DEFAULT, "failed getting application: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
LABEL_18:
}

void __66__KCPairingChannel_initiatorCompleteSecondPacketWithSOS_complete___block_invoke_179( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorThirdPacket:v6 complete:v5];
}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  os_signpost_id_t v7 = a1[8];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v8 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v19 = 67240192;
    LODWORD(v20) = v8;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v6,  OS_SIGNPOST_INTERVAL_END,  v7,  "PairingChannelInitiatorStashAccountCredential",  " OctagonSignpostNamePairingChannelInitiatorStashAccountCredential=%{public,signpost.telemetry:number1,name=Octagon SignpostNamePairingChannelInitiatorStashAccountCredential}d ",  (uint8_t *)&v19,  8u);
  }

  _OctagonSignpostLogSystem();
  os_signpost_id_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[8];
    int v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v19 = 134218496;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v11;
    _os_log_impl( &dword_187D59000,  v9,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorStashAccountCredential  OctagonSignpostNamePairingChannelInitiatorStashAcco untCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorStashAccountCredential}d ",  (uint8_t *)&v19,  0x1Cu);
  }

  uint64_t v12 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v14 = v13;
  os_signpost_id_t v15 = a1[10];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    int v16 = *(unsigned __int8 *)(*(void *)(a1[7] + 8LL) + 24LL);
    int v19 = 67240192;
    LODWORD(v20) = v16;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v14,  OS_SIGNPOST_INTERVAL_END,  v15,  "PairingChannelInitiatorMessage2",  " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePa iringChannelInitiatorMessage2}d ",  (uint8_t *)&v19,  8u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218496;
    int v18 = *(unsigned __int8 *)(*(void *)(a1[7] + 8LL) + 24LL);
    uint64_t v20 = a1[10];
    __int16 v21 = 2048;
    double v22 = (double)(unint64_t)v12 / 1000000000.0;
    __int16 v23 = 1026;
    int v24 = v18;
    _os_log_impl( &dword_187D59000,  v17,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signp ost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ",  (uint8_t *)&v19,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  0LL,  v3);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_172(uint64_t a1, int a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (!v5 && a2) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  }
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  os_signpost_id_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 80);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    *(_DWORD *)__int128 buf = 67240192;
    LODWORD(v38) = v10;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "PairingChannelInitiatorStashAccountCredential",  " OctagonSignpostNamePairingChannelInitiatorStashAccountCredential=%{public,signpost.telemetry:number1,name=Octagon SignpostNamePairingChannelInitiatorStashAccountCredential}d ",  buf,  8u);
  }

  _OctagonSignpostLogSystem();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void **)(a1 + 80);
    int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    *(_DWORD *)__int128 buf = 134218496;
    id v38 = v12;
    __int16 v39 = 2048;
    double v40 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v41 = 1026;
    int v42 = v13;
    _os_log_impl( &dword_187D59000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorStashAccountCredential  OctagonSignpostNamePairingChannelInitiatorStashAcco untCredential=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorStashAccountCredential}d ",  buf,  0x1Cu);
  }

  [*(id *)(a1 + 32) setNextStateError:0 complete:0];
  if (a2 && ![*(id *)(a1 + 32) testFailSOS])
  {
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_175;
    v27[3] = &unk_18A134A08;
    uint64_t v30 = *(void *)(a1 + 72);
    __int128 v31 = *(_OWORD *)(a1 + 96);
    uint64_t v25 = *(void **)(a1 + 32);
    uint64_t v26 = *(void *)(a1 + 48);
    id v28 = *(id *)(a1 + 40);
    id v29 = *(id *)(a1 + 56);
    [v25 initiatorCompleteSecondPacketWithSOS:v26 complete:v27];

    uint64_t v17 = v28;
    goto LABEL_22;
  }

  secLogObjForScope("pairing");
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v38 = v5;
    _os_log_impl(&dword_187D59000, v14, OS_LOG_TYPE_DEFAULT, "failed stash credentials: %@", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) sessionSupportsOctagon])
  {
    v32[0] = MEMORY[0x1895F87A8];
    v32[1] = 3221225472LL;
    v32[2] = __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_173;
    v32[3] = &unk_18A134A08;
    uint64_t v35 = *(void *)(a1 + 72);
    __int128 v36 = *(_OWORD *)(a1 + 96);
    os_signpost_id_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 48);
    id v33 = *(id *)(a1 + 40);
    id v34 = *(id *)(a1 + 56);
    [v15 initiatorCompleteSecondPacketOctagon:v16 application:0 complete:v32];

    uint64_t v17 = v33;
LABEL_22:

    goto LABEL_23;
  }

  uint64_t v18 = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v19;
  os_signpost_id_t v21 = *(void *)(a1 + 96);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    int v22 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
    *(_DWORD *)__int128 buf = 67240192;
    LODWORD(v38) = v22;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v20,  OS_SIGNPOST_INTERVAL_END,  v21,  "PairingChannelInitiatorMessage2",  " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePa iringChannelInitiatorMessage2}d ",  buf,  8u);
  }

  _OctagonSignpostLogSystem();
  __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134218496;
    int v24 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
    id v38 = *(id *)(a1 + 96);
    __int16 v39 = 2048;
    double v40 = (double)(unint64_t)v18 / 1000000000.0;
    __int16 v41 = 1026;
    int v42 = v24;
    _os_log_impl( &dword_187D59000,  v23,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signp ost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ",  buf,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  *(void *)(a1 + 40),  0LL,  v5);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
LABEL_23:
}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_177( void *a1,  uint64_t a2,  void *a3,  void *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a4) {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  os_signpost_id_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelInitiatorMessage2",  " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePa iringChannelInitiatorMessage2}d ",  (uint8_t *)&v15,  8u);
  }

  _OctagonSignpostLogSystem();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signp ost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ",  (uint8_t *)&v15,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL),  v6);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_173( void *a1,  uint64_t a2,  void *a3,  void *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a4) {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  os_signpost_id_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelInitiatorMessage2",  " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePa iringChannelInitiatorMessage2}d ",  (uint8_t *)&v15,  8u);
  }

  _OctagonSignpostLogSystem();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signp ost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ",  (uint8_t *)&v15,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL),  v6);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __51__KCPairingChannel_initiatorSecondPacket_complete___block_invoke_175( void *a1,  uint64_t a2,  void *a3,  void *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a4) {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
  _OctagonSignpostLogSystem();
  os_signpost_id_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v10 = v9;
  os_signpost_id_t v11 = a1[7];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    int v15 = 67240192;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl( &dword_187D59000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "PairingChannelInitiatorMessage2",  " OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePa iringChannelInitiatorMessage2}d ",  (uint8_t *)&v15,  8u);
  }

  _OctagonSignpostLogSystem();
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218496;
    int v14 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
    uint64_t v16 = a1[7];
    __int16 v17 = 2048;
    double v18 = (double)(unint64_t)Nanoseconds / 1000000000.0;
    __int16 v19 = 1026;
    int v20 = v14;
    _os_log_impl( &dword_187D59000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PairingChannelInitiatorMessage2  OctagonSignpostNamePairingChannelInitiatorMessage2=%{public,signp ost.telemetry:number1,name=OctagonSignpostNamePairingChannelInitiatorMessage2}d ",  (uint8_t *)&v15,  0x1Cu);
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  a1[4],  *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL),  v6);
  (*(void (**)(void))(a1[5] + 16LL))();
}

void __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorSecondPacket:v6 complete:v5];
}

void __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_170(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorSecondPacket:v6 complete:v5];
}

void __50__KCPairingChannel_initiatorFirstPacket_complete___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorSecondPacket:v6 complete:v5];
}

void __41__KCPairingChannel_waitForOctagonUpgrade__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl( &dword_187D59000,  v4,  OS_LOG_TYPE_DEFAULT,  "pairing: failed to upgrade initiator into Octagon: %@",  (uint8_t *)&v8,  0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 0LL;
    id v7 = v3;
  }

  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = 1LL;
    id v7 = 0LL;
  }

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v5,  v6,  v7);
}

void __47__KCPairingChannel_setNextStateError_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained oneStepTooMany:v6 complete:v5];
}

void __44__KCPairingChannel_initAsInitiator_version___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained acceptorFirstPacket:v6 complete:v5];
}

void __44__KCPairingChannel_initAsInitiator_version___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained initiatorFirstPacket:v6 complete:v5];
}

+ (id)pairingChannelInitiator:(id)a3
{
  id v3 = a3;
  id v4 = -[KCPairingChannel initAsInitiator:version:]( objc_alloc(&OBJC_CLASS___KCPairingChannel),  "initAsInitiator:version:",  1LL,  v3);

  return v4;
}

+ (id)pairingChannelAcceptor:(id)a3
{
  id v3 = a3;
  id v4 = -[KCPairingChannel initAsInitiator:version:]( objc_alloc(&OBJC_CLASS___KCPairingChannel),  "initAsInitiator:version:",  0LL,  v3);

  return v4;
}

+ (BOOL)_isRetryableNSURLError:(id)a3
{
  id v3 = a3;
  [v3 domain];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isEqualToString:*MEMORY[0x189607740]];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    else {
      LOBYTE(v7) = 0;
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)retryable:(id)a3
{
  id v3 = a3;
  [v3 domain];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 isEqualToString:*MEMORY[0x189607460]] && objc_msgSend(v3, "code") == 4097)
  {
    BOOL v5 = 1;
  }

  else
  {
    [v3 domain];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 isEqualToString:*MEMORY[0x18960AFE0]] && objc_msgSend(v3, "code") == 56
      || +[KCPairingChannel _isRetryableNSURLError:](&OBJC_CLASS___KCPairingChannel, "_isRetryableNSURLError:", v3))
    {
      BOOL v5 = 1;
    }

    else
    {
      [v3 userInfo];
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectForKeyedSubscript:*MEMORY[0x189607798]];
      int v8 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v5 = +[KCPairingChannel _isRetryableNSURLError:](&OBJC_CLASS___KCPairingChannel, "_isRetryableNSURLError:", v8);
    }
  }

  return v5;
}

+ (BOOL)isSupportedPlatform
{
  return 1;
}

+ (id)pairingChannelCompressData:(id)a3
{
  id v3 = a3;
  if (pairingChannelCompressData__once != -1) {
    dispatch_once(&pairingChannelCompressData__once, &__block_literal_global);
  }
  unint64_t v4 = [v3 length];
  if (v4 <= 0xFFFFFFFFFFFFFF9BLL)
  {
    id v6 = [MEMORY[0x189603FB8] dataWithLength:v4 + 100];
    unsigned int v7 = (uint8_t *)[v6 mutableBytes];
    size_t v8 = [v6 length];
    id v9 = v3;
    uint64_t v10 = (const uint8_t *)[v9 bytes];
    size_t v11 = [v9 length];
    size_t v12 = compression_encode_buffer( v7,  v8,  v10,  v11,  (void *)[(id)pairingChannelCompressData__scratch mutableBytes],  COMPRESSION_LZFSE);
    if (v12)
    {
      [v6 setLength:v12];
      id v5 = v6;
    }

    else
    {
      id v5 = 0LL;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)pairingChannelDecompressData:(id)a3
{
  id v3 = a3;
  if (pairingChannelDecompressData__once != -1) {
    dispatch_once(&pairingChannelDecompressData__once, &__block_literal_global_161);
  }
  size_t v4 = [v3 length];
  id v5 = 0LL;
  while ((v4 & 0x8000000000000000LL) == 0)
  {
    v4 *= 2LL;
    [MEMORY[0x189603FB8] dataWithLength:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    id v5 = v6;
    unsigned int v7 = (uint8_t *)[v5 mutableBytes];
    id v8 = v3;
    id v9 = (const uint8_t *)[v8 bytes];
    size_t v10 = [v8 length];
    size_t v11 = compression_decode_buffer( v7,  v4,  v9,  v10,  (void *)[(id)pairingChannelDecompressData__scratch mutableBytes],  COMPRESSION_LZFSE);
    if (!v11) {
      break;
    }
    if (v11 != v4)
    {
      [v5 setLength:v11];
      id v5 = v5;
      size_t v12 = v5;
      goto LABEL_9;
    }
  }

  size_t v12 = 0LL;
LABEL_9:

  return v12;
}

void __49__KCPairingChannel_pairingChannelDecompressData___block_invoke()
{
  uint64_t v0 = [MEMORY[0x189603FB8] dataWithLength:compression_decode_scratch_buffer_size(COMPRESSION_LZFSE)];
  v1 = (void *)pairingChannelDecompressData__scratch;
  pairingChannelDecompressData__scratch = v0;
}

void __47__KCPairingChannel_pairingChannelCompressData___block_invoke()
{
  uint64_t v0 = [MEMORY[0x189603FB8] dataWithLength:compression_encode_scratch_buffer_size(COMPRESSION_LZFSE)];
  v1 = (void *)pairingChannelCompressData__scratch;
  pairingChannelCompressData__scratch = v0;
}

@end