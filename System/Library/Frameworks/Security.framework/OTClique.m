@interface OTClique
+ (BOOL)clearCliqueFromAccount:(id)a3 error:(id *)a4;
+ (BOOL)isCloudServicesAvailable;
+ (BOOL)performCKServerUnreadableDataRemoval:(id)a3 error:(id *)a4;
+ (BOOL)platformSupportsSOS;
+ (BOOL)setCDPEnabled:(id)a3 error:(id *)a4;
+ (id)fetchEscrowRecordsInternal:(id)a3 error:(id *)a4;
+ (id)findOptimalBottleIDsWithContextData:(id)a3 error:(id *)a4;
+ (id)newFriendsWithContextData:(id)a3 error:(id *)a4;
+ (id)newFriendsWithContextData:(id)a3 resetReason:(int64_t)a4 error:(id *)a5;
+ (id)performEscrowRecoveryWithContextData:(id)a3 escrowArguments:(id)a4 error:(id *)a5;
+ (id)recoverWithContextData:(id)a3 bottleID:(id)a4 escrowedEntropy:(id)a5 error:(id *)a6;
+ (id)resetProtectedData:(id)a3 error:(id *)a4;
+ (id)resetProtectedData:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 error:(id *)a7;
+ (int64_t)getCDPStatus:(id)a3 error:(id *)a4;
+ (void)checkCustodianRecoveryKey:(id)a3 custodianRecoveryKeyUUID:(id)a4 reply:(id)a5;
+ (void)checkInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 reply:(id)a5;
+ (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
+ (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7;
+ (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
+ (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
+ (void)preflightRecoverOctagonUsingCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
+ (void)preflightRecoverOctagonUsingInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
+ (void)recoverOctagonUsingCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
+ (void)recoverOctagonUsingInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
+ (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6;
+ (void)removeCustodianRecoveryKey:(id)a3 custodianRecoveryKeyUUID:(id)a4 reply:(id)a5;
+ (void)removeInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 reply:(id)a5;
+ (void)setNewRecoveryKeyWithData:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
+ (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5;
- (BOOL)accountUserKeyAvailable;
- (BOOL)establish:(id *)a3;
- (BOOL)fetchUserControllableViewsSyncingEnabled:(id *)a3;
- (BOOL)joinAfterRestore:(id *)a3;
- (BOOL)leaveClique:(id *)a3;
- (BOOL)peersHaveViewsEnabled:(id)a3 error:(id *)a4;
- (BOOL)removeFriendsInClique:(id)a3 error:(id *)a4;
- (BOOL)requestToJoinCircle:(id *)a3;
- (BOOL)resetAndEstablish:(int64_t)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 accountSettings:(id)a7 isGuitarfish:(BOOL)a8 error:(id *)a9;
- (BOOL)setOctagonUserControllableViewsSyncEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setUserCredentialsAndDSID:(id)a3 password:(id)a4 error:(id *)a5;
- (BOOL)setUserCredentialsWithLabel:(id)a3 password:(id)a4 dsid:(id)a5 error:(id *)a6;
- (BOOL)tryUserCredentialsAndDSID:(id)a3 password:(id)a4 error:(id *)a5;
- (BOOL)tryUserCredentialsWithLabel:(id)a3 password:(id)a4 dsid:(id)a5 error:(id *)a6;
- (BOOL)waitForInitialSync:(id *)a3;
- (BOOL)waitForOctagonUpgrade:(id *)a3;
- (NSString)cliqueMemberIdentifier;
- (OTClique)initWithContextData:(id)a3;
- (OTConfigurationContext)ctx;
- (id)cliqueMemberIdentifier:(id *)a3;
- (id)copyPeerPeerInfo:(id *)a3;
- (id)copyViewUnawarePeerInfo:(id *)a3;
- (id)description;
- (id)makeOTControl:(id *)a3;
- (id)peerDeviceNamesByPeerID:(id *)a3;
- (id)setupPairingChannelAsAcceptor:(id)a3;
- (id)setupPairingChannelAsAcceptor:(id)a3 error:(id *)a4;
- (id)setupPairingChannelAsInitator:(id)a3 error:(id *)a4;
- (id)setupPairingChannelAsInitiator:(id)a3;
- (int64_t)_fetchCliqueStatus:(id)a3 error:(id *)a4;
- (int64_t)cachedCliqueStatus:(BOOL)a3 error:(id *)a4;
- (int64_t)fetchCliqueStatus:(id *)a3;
- (void)fetchEscrowContents:(id)a3;
- (void)fetchUserControllableViewsSyncingEnabledAsync:(id)a3;
- (void)performedCDPStateMachineRun:(id)a3 success:(BOOL)a4 error:(id)a5 reply:(id)a6;
- (void)performedFailureCDPStateMachineRun:(id)a3 error:(id)a4 reply:(id)a5;
- (void)performedSuccessfulCDPStateMachineRun:(id)a3 reply:(id)a4;
- (void)setCliqueMemberIdentifier:(id)a3;
@end

@implementation OTClique

- (OTClique)initWithContextData:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___OTClique;
  v5 = -[OTClique init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___OTConfigurationContext);
    ctx = v5->_ctx;
    v5->_ctx = v6;

    uint64_t v8 = [v4 context];
    v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = OTDefaultContext;
    }
    -[OTConfigurationContext setContext:](v5->_ctx, "setContext:", v10);

    [v4 containerName];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTConfigurationContext setContainerName:](v5->_ctx, "setContainerName:", v11);

    [v4 dsid];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)[v12 copy];
    -[OTConfigurationContext setDsid:](v5->_ctx, "setDsid:", v13);

    [v4 altDSID];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)[v14 copy];
    -[OTConfigurationContext setAltDSID:](v5->_ctx, "setAltDSID:", v15);

    [v4 otControl];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTConfigurationContext setOtControl:](v5->_ctx, "setOtControl:", v16);

    [v4 ckksControl];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTConfigurationContext setCkksControl:](v5->_ctx, "setCkksControl:", v17);

    -[OTConfigurationContext setEscrowFetchSource:]( v5->_ctx,  "setEscrowFetchSource:",  [v4 escrowFetchSource]);
    -[OTConfigurationContext setOverrideForSetupAccountScript:]( v5->_ctx,  "setOverrideForSetupAccountScript:",  [v4 overrideForSetupAccountScript]);
    [v4 sbd];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTConfigurationContext setSbd:](v5->_ctx, "setSbd:", v18);
  }

  return v5;
}

- (id)description
{
  v3 = (void *)NSString;
  -[OTClique ctx](self, "ctx");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 altDSID];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[OTClique ctx](self, "ctx");
  [v6 context];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTClique cliqueMemberIdentifier](self, "cliqueMemberIdentifier");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<OTClique: altDSID:%@ contextID:%@ memberID:%@>", v5, v7, v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)cliqueMemberIdentifier
{
  return (NSString *)-[OTClique cliqueMemberIdentifier:](self, "cliqueMemberIdentifier:", 0LL);
}

- (id)cliqueMemberIdentifier:(id *)a3
{
  v74[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v58 = 0LL;
  v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  v61 = __Block_byref_object_copy__4755;
  v62 = __Block_byref_object_dispose__4756;
  id v63 = 0LL;
  _OctagonSignpostLogSystem();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t spid = os_signpost_id_generate(v4);
  uint64_t v48 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  unint64_t v47 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "FetchEgoPeer",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = spid;
    _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: FetchEgoPeer  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  id v49 = objc_alloc((Class)getAAFAnalyticsEventSecurityClass());
  v51 = -[OTClique ctx](self, "ctx");
  [v51 altDSID];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[OTClique ctx](self, "ctx");
  [v9 flowID];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[OTClique ctx](self, "ctx");
  [v11 deviceSessionID];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v71 = 0x2020000000LL;
  v13 = (id *)getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr;
  v72 = (uint64_t (*)(uint64_t, uint64_t))getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr;
  if (!getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr)
  {
    v14 = KeychainCircleLibrary();
    v13 = (id *)dlsym(v14, "kSecurityRTCEventNameCliqueMemberIdentifier");
    *(void *)(*((void *)&buf + 1) + 24LL) = v13;
    getkSecurityRTCEventNameCliqueMemberIdentifierSymbolLoc_ptr = (uint64_t)v13;
  }

  _Block_object_dispose(&buf, 8);
  if (!v13)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"NSString *getkSecurityRTCEventNameCliqueMemberIdentifier(void)"];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v43,  "handleFailureInFunction:file:lineNumber:description:",  v44,  @"OTClique.m",  73,  @"%s",  dlerror());

    __break(1u);
  }

  id v15 = *v13;
  v16 = -[OTClique ctx](self, "ctx");
  uint64_t v17 = [v16 testsEnabled];
  getkSecurityRTCEventCategoryAccountDataAccessRecovery();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v45) = 1;
  v50 = (void *)[v49 initWithKeychainCircleMetrics:0 altDSID:v8 flowID:v10 deviceSessionID:v12 eventName:v15 testsAreEnabled:v17 canSendMetrics:v45 category:v18];

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v71 = 0x3032000000LL;
  v72 = __Block_byref_object_copy__4755;
  v73 = __Block_byref_object_dispose__4756;
  v74[0] = 0LL;
  id obj = 0LL;
  v19 = -[OTClique makeOTControl:](self, "makeOTControl:", &obj);
  objc_storeStrong(v74, obj);
  if (v19)
  {
    objc_super v20 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    v21 = -[OTClique ctx](self, "ctx");
    v22 = -[OTControlArguments initWithConfiguration:](v20, "initWithConfiguration:", v21);
    v53[0] = MEMORY[0x1895F87A8];
    v53[1] = 3221225472LL;
    v53[2] = __35__OTClique_cliqueMemberIdentifier___block_invoke;
    v53[3] = &unk_189667808;
    p___int128 buf = &buf;
    id v54 = v50;
    v56 = &v58;
    [v19 fetchEgoPeerID:v22 reply:v53];

    v23 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (v23)
    {
      if (a3) {
        *a3 = v23;
      }
      unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(spid, v48);
      _OctagonSignpostLogSystem();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_DWORD *)v64 = 67240192;
        LODWORD(v65) = 0;
        _os_signpost_emit_with_name_impl( &dword_1804F4000,  v26,  OS_SIGNPOST_INTERVAL_END,  spid,  "FetchEgoPeer",  " OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ",  v64,  8u);
      }

      _OctagonSignpostLogSystem();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v64 = 134218496;
        os_signpost_id_t v65 = spid;
        __int16 v66 = 2048;
        double v67 = (double)Nanoseconds / 1000000000.0;
        __int16 v68 = 1026;
        BOOL v69 = 0;
        _os_log_impl( &dword_1804F4000,  v27,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: FetchEgoPeer  OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=Octagon SignpostNameFetchEgoPeer}d ",  v64,  0x1Cu);
      }

      id v28 = 0LL;
    }

    else
    {
      secLogObjForScope("clique");
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        os_signpost_id_t v36 = v59[5];
        *(_DWORD *)v64 = 138412290;
        os_signpost_id_t v65 = v36;
        _os_log_impl(&dword_1804F4000, v35, OS_LOG_TYPE_DEFAULT, "cliqueMemberIdentifier complete: %@", v64, 0xCu);
      }

      uint64_t v37 = v59[5];
      unint64_t v38 = _OctagonSignpostGetNanoseconds(spid, v48);
      _OctagonSignpostLogSystem();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_DWORD *)v64 = 67240192;
        LODWORD(v65) = v37 != 0;
        _os_signpost_emit_with_name_impl( &dword_1804F4000,  v40,  OS_SIGNPOST_INTERVAL_END,  spid,  "FetchEgoPeer",  " OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ",  v64,  8u);
      }

      _OctagonSignpostLogSystem();
      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v64 = 134218496;
        os_signpost_id_t v65 = spid;
        __int16 v66 = 2048;
        double v67 = (double)v38 / 1000000000.0;
        __int16 v68 = 1026;
        BOOL v69 = v37 != 0;
        _os_log_impl( &dword_1804F4000,  v41,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: FetchEgoPeer  OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=Octagon SignpostNameFetchEgoPeer}d ",  v64,  0x1Cu);
      }

      id v28 = (id)v59[5];
    }
  }

  else
  {
    secLogObjForScope("SecError");
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v30 = *(void *)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)v64 = 138412290;
      os_signpost_id_t v65 = v30;
      _os_log_impl(&dword_1804F4000, v29, OS_LOG_TYPE_DEFAULT, "octagon: Failed to create OTControl: %@", v64, 0xCu);
    }

    unint64_t v31 = _OctagonSignpostGetNanoseconds(spid, v48);
    _OctagonSignpostLogSystem();
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)v64 = 67240192;
      LODWORD(v65) = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v33,  OS_SIGNPOST_INTERVAL_END,  spid,  "FetchEgoPeer",  " OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEgoPeer}d ",  v64,  8u);
    }

    _OctagonSignpostLogSystem();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v64 = 134218496;
      os_signpost_id_t v65 = spid;
      __int16 v66 = 2048;
      double v67 = (double)v31 / 1000000000.0;
      __int16 v68 = 1026;
      BOOL v69 = 0;
      _os_log_impl( &dword_1804F4000,  v34,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: FetchEgoPeer  OctagonSignpostNameFetchEgoPeer=%{public,signpost.telemetry:number1,name=OctagonSi gnpostNameFetchEgoPeer}d ",  v64,  0x1Cu);
    }

    [getSecurityAnalyticsReporterRTCClass() sendMetricWithEvent:v50 success:0 error:*(void *)(*((void *)&buf + 1) + 40)];
    id v28 = 0LL;
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v58, 8);

  return v28;
}

- (id)makeOTControl:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 makeOTControl:a3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)establish:(id *)a3
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  uint64_t v46 = 0LL;
  unint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  char v49 = 0;
  secLogObjForScope("clique-establish");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEFAULT, "establish started", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  uint64_t v8 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  unint64_t v11 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "Establish",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&buf[4] = v7;
    _os_log_impl(&dword_1804F4000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: Establish  enableTelemetry=YES ", buf, 0xCu);
  }
  v13 = -[OTClique makeOTControl:](self, "makeOTControl:", a3);
  if (!v13)
  {
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v7, v8);
    _OctagonSignpostLogSystem();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v7,  "Establish",  " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)Nanoseconds / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v57) = 0;
      _os_log_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpost NameEstablish}d ",  buf,  0x1Cu);
    }

    goto LABEL_25;
  }

  id v45 = 0LL;
  int64_t v14 = -[OTClique fetchCliqueStatus:](self, "fetchCliqueStatus:", &v45);
  id v15 = (os_log_s *)v45;
  if (v15)
  {
    v16 = v15;
    secLogObjForScope("clique-establish");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&buf[4] = v16;
      _os_log_impl(&dword_1804F4000, v17, OS_LOG_TYPE_DEFAULT, "fetching clique status failed: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v16;
    }
    unint64_t v18 = _OctagonSignpostGetNanoseconds(v7, v8);
    _OctagonSignpostLogSystem();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    objc_super v20 = v19;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v20,  OS_SIGNPOST_INTERVAL_END,  v7,  "Establish",  " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v18 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v57) = 0;
      _os_log_impl( &dword_1804F4000,  v21,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpost NameEstablish}d ",  buf,  0x1Cu);
    }

LABEL_25:
    BOOL v25 = 0;
    goto LABEL_26;
  }

  if (v14 == 3)
  {
    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v57 = __Block_byref_object_copy__4755;
    uint64_t v58 = __Block_byref_object_dispose__4756;
    id v59 = 0LL;
    v27 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    -[OTClique ctx](self, "ctx");
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[OTControlArguments initWithConfiguration:](v27, "initWithConfiguration:", v28);
    v44[0] = MEMORY[0x1895F87A8];
    v44[1] = 3221225472LL;
    v44[2] = __22__OTClique_establish___block_invoke;
    v44[3] = &unk_189667830;
    v44[4] = &v46;
    v44[5] = buf;
    [v13 establish:v29 reply:v44];

    if (a3)
    {
      os_signpost_id_t v30 = *(void **)(*(void *)&buf[8] + 40LL);
      if (v30) {
        *a3 = v30;
      }
    }

    secLogObjForScope("clique-establish");
    unint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = *((unsigned __int8 *)v47 + 24);
      *(_DWORD *)v50 = 67109120;
      LODWORD(v51) = v32;
      _os_log_impl(&dword_1804F4000, v31, OS_LOG_TYPE_DEFAULT, "establish complete: %{BOOL}d", v50, 8u);
    }

    int v33 = *((unsigned __int8 *)v47 + 24);
    unint64_t v34 = _OctagonSignpostGetNanoseconds(v7, v8);
    _OctagonSignpostLogSystem();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v36 = v35;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      *(_DWORD *)v50 = 67240192;
      LODWORD(v51) = v33;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v36,  OS_SIGNPOST_INTERVAL_END,  v7,  "Establish",  " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ",  v50,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v50 = 134218496;
      os_signpost_id_t v51 = v7;
      __int16 v52 = 2048;
      double v53 = (double)v34 / 1000000000.0;
      __int16 v54 = 1026;
      int v55 = v33;
      _os_log_impl( &dword_1804F4000,  v37,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpost NameEstablish}d ",  v50,  0x1Cu);
    }

    BOOL v25 = *((_BYTE *)v47 + 24) != 0;
    _Block_object_dispose(buf, 8);

    v16 = 0LL;
  }

  else
  {
    secLogObjForScope("clique-establish");
    unint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      else {
        v39 = off_189667B70[v14 + 1];
      }
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&buf[4] = v39;
      _os_log_impl( &dword_1804F4000,  v38,  OS_LOG_TYPE_DEFAULT,  "clique status is %@; performing no Octagon actions",
        buf,
        0xCu);
    }

    unint64_t v40 = _OctagonSignpostGetNanoseconds(v7, v8);
    _OctagonSignpostLogSystem();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v42,  OS_SIGNPOST_INTERVAL_END,  v7,  "Establish",  " OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameEstablish}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v40 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v57) = 0;
      _os_log_impl( &dword_1804F4000,  v43,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: Establish  OctagonSignpostNameEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpost NameEstablish}d ",  buf,  0x1Cu);
    }

    v16 = 0LL;
    BOOL v25 = 1;
  }

- (BOOL)resetAndEstablish:(int64_t)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 accountSettings:(id)a7 isGuitarfish:(BOOL)a8 error:(id *)a9
{
  BOOL v11 = a6;
  uint64_t v60 = *MEMORY[0x1895F89C0];
  id v42 = a4;
  id v43 = a5;
  id v44 = a7;
  secLogObjForScope("clique-resetandestablish");
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_1804F4000, v15, OS_LOG_TYPE_DEFAULT, "resetAndEstablish started", buf, 2u);
  }

  _OctagonSignpostLogSystem();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);
  uint64_t v18 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  objc_super v20 = v19;
  unint64_t v21 = v17 - 1;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v20,  OS_SIGNPOST_INTERVAL_BEGIN,  v17,  "ResetAndEstablish",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&buf[4] = v17;
    _os_log_impl( &dword_1804F4000,  v22,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: ResetAndEstablish  enableTelemetry=YES ",  buf,  0xCu);
  }
  v23 = -[OTClique makeOTControl:](self, "makeOTControl:", a9);
  if (v23)
  {
    uint64_t v46 = 0LL;
    unint64_t v47 = &v46;
    uint64_t v48 = 0x2020000000LL;
    char v49 = 0;
    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v57 = __Block_byref_object_copy__4755;
    uint64_t v58 = __Block_byref_object_dispose__4756;
    id v59 = 0LL;
    v24 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    -[OTClique ctx](self, "ctx");
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[OTControlArguments initWithConfiguration:](v24, "initWithConfiguration:", v25);
    v45[0] = MEMORY[0x1895F87A8];
    v45[1] = 3221225472LL;
    v45[2] = __117__OTClique_resetAndEstablish_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_error___block_invoke;
    v45[3] = &unk_189667830;
    v45[4] = &v46;
    v45[5] = buf;
    LOBYTE(v41) = a8;
    [v23 resetAndEstablish:v26 resetReason:a3 idmsTargetContext:v42 idmsCuttlefishPassword:v43 notifyIdMS:v11 accountSettings:v44 isGuitarfish:v41 reply:v45];

    if (a9)
    {
      v27 = *(void **)(*(void *)&buf[8] + 40LL);
      if (v27) {
        *a9 = v27;
      }
    }

    secLogObjForScope("clique-resetandestablish");
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = *((unsigned __int8 *)v47 + 24);
      *(_DWORD *)v50 = 67109120;
      LODWORD(v51) = v29;
      _os_log_impl(&dword_1804F4000, v28, OS_LOG_TYPE_DEFAULT, "establish complete: %{BOOL}d", v50, 8u);
    }

    int v30 = *((unsigned __int8 *)v47 + 24);
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v17, v18);
    _OctagonSignpostLogSystem();
    int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v33 = v32;
    if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)v50 = 67240192;
      LODWORD(v51) = v30;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v33,  OS_SIGNPOST_INTERVAL_END,  v17,  "ResetAndEstablish",  " OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameResetAndEstablish}d ",  v50,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v50 = 134218496;
      os_signpost_id_t v51 = v17;
      __int16 v52 = 2048;
      double v53 = (double)Nanoseconds / 1000000000.0;
      __int16 v54 = 1026;
      int v55 = v30;
      _os_log_impl( &dword_1804F4000,  v34,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: ResetAndEstablish  OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name =OctagonSignpostNameResetAndEstablish}d ",  v50,  0x1Cu);
    }

    BOOL v35 = *((_BYTE *)v47 + 24) != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v46, 8);
  }

  else
  {
    unint64_t v36 = _OctagonSignpostGetNanoseconds(v17, v18);
    _OctagonSignpostLogSystem();
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v38 = v37;
    if (v21 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v37))
    {
      *(void *)__int128 buf = 67240192LL;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v38,  OS_SIGNPOST_INTERVAL_END,  v17,  "ResetAndEstablish",  " OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name=OctagonSignpostNameResetAndEstablish}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)v36 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v57) = 0;
      _os_log_impl( &dword_1804F4000,  v39,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: ResetAndEstablish  OctagonSignpostNameResetAndEstablish=%{public,signpost.telemetry:number1,name =OctagonSignpostNameResetAndEstablish}d ",  buf,  0x1Cu);
    }

    BOOL v35 = 0;
  }

  return v35;
}

- (id)setupPairingChannelAsInitiator:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 altDSID];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
  }

  else
  {
    -[OTClique ctx](self, "ctx");
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 altDSID];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      secLogObjForScope("octagon-account");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[OTClique ctx](self, "ctx");
        os_signpost_id_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 altDSID];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v24 = 138412290;
        BOOL v25 = v18;
        _os_log_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEFAULT,  "Configuring pairing channel with configured altDSID: %@",  (uint8_t *)&v24,  0xCu);
      }

      -[OTClique ctx](self, "ctx");
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 altDSID];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setAltDSID:v13];
      goto LABEL_11;
    }
  }

  [v4 altDSID];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v4 altDSID];
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 altDSID];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = [v7 isEqualToString:v9];

    secLogObjForScope("octagon-account");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT);
    if (!v10)
    {
      if (v12)
      {
        [v4 altDSID];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTClique ctx](self, "ctx");
        objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 altDSID];
        unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        int v24 = 138412546;
        BOOL v25 = v19;
        __int16 v26 = 2112;
        v27 = v21;
        _os_log_impl( &dword_1804F4000,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "Pairing channel context configured with altDSID (%@) which does not match Clique altDSID (%@), possible issues ahead",  (uint8_t *)&v24,  0x16u);
      }

      goto LABEL_14;
    }

    if (!v12)
    {
LABEL_14:

      goto LABEL_15;
    }

    [v4 altDSID];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v24 = 138412290;
    BOOL v25 = v13;
    _os_log_impl( &dword_1804F4000,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "Pairing channel context already configured with altDSID: %@",  (uint8_t *)&v24,  0xCu);
LABEL_11:

    goto LABEL_14;
  }

- (id)setupPairingChannelAsInitator:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  return -[OTClique setupPairingChannelAsInitiator:](self, "setupPairingChannelAsInitiator:", a3);
}

- (id)setupPairingChannelAsAcceptor:(id)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 altDSID];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
  }

  else
  {
    -[OTClique ctx](self, "ctx");
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 altDSID];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      secLogObjForScope("octagon-account");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[OTClique ctx](self, "ctx");
        os_signpost_id_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 altDSID];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v24 = 138412290;
        BOOL v25 = v18;
        _os_log_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEFAULT,  "Configuring pairing channel with configured altDSID: %@",  (uint8_t *)&v24,  0xCu);
      }

      -[OTClique ctx](self, "ctx");
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 altDSID];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 setAltDSID:v13];
      goto LABEL_11;
    }
  }

  [v4 altDSID];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v4 altDSID];
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 altDSID];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = [v7 isEqualToString:v9];

    secLogObjForScope("octagon-account");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT);
    if (!v10)
    {
      if (v12)
      {
        [v4 altDSID];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTClique ctx](self, "ctx");
        objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 altDSID];
        unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        int v24 = 138412546;
        BOOL v25 = v19;
        __int16 v26 = 2112;
        v27 = v21;
        _os_log_impl( &dword_1804F4000,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "Pairing channel context configured with altDSID (%@) which does not match Clique altDSID (%@), possible issues ahead",  (uint8_t *)&v24,  0x16u);
      }

      goto LABEL_14;
    }

    if (!v12)
    {
LABEL_14:

      goto LABEL_15;
    }

    [v4 altDSID];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v24 = 138412290;
    BOOL v25 = v13;
    _os_log_impl( &dword_1804F4000,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "Pairing channel context already configured with altDSID: %@",  (uint8_t *)&v24,  0xCu);
LABEL_11:

    goto LABEL_14;
  }

- (id)setupPairingChannelAsAcceptor:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0LL;
  }
  return -[OTClique setupPairingChannelAsAcceptor:](self, "setupPairingChannelAsAcceptor:", a3);
}

- (int64_t)_fetchCliqueStatus:(id)a3 error:(id *)a4
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  id v50 = a3;
  uint64_t v63 = 0LL;
  v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  uint64_t v66 = -1LL;
  _OctagonSignpostLogSystem();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  uint64_t v49 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  unint64_t v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "FetchCliqueStatus",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&buf[4] = v7;
    _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: FetchCliqueStatus  enableTelemetry=YES ",  buf,  0xCu);
  }

  -[OTClique makeOTControl:](self, "makeOTControl:", a4);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    uint64_t v57 = 0LL;
    uint64_t v58 = &v57;
    uint64_t v59 = 0x3032000000LL;
    uint64_t v60 = __Block_byref_object_copy__4755;
    v61 = __Block_byref_object_dispose__4756;
    id v62 = 0LL;
    v13 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    -[OTClique ctx](self, "ctx");
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = -[OTControlArguments initWithConfiguration:](v13, "initWithConfiguration:", v14);
    uint64_t v16 = MEMORY[0x1895F87A8];
    v56[0] = MEMORY[0x1895F87A8];
    v56[1] = 3221225472LL;
    v56[2] = __37__OTClique__fetchCliqueStatus_error___block_invoke;
    v56[3] = &unk_189667878;
    v56[4] = &v63;
    v56[5] = &v57;
    [v12 fetchCliqueStatus:v15 configuration:v50 reply:v56];

    if (_fetchCliqueStatus_error__onceToken != -1) {
      dispatch_once(&_fetchCliqueStatus_error__onceToken, &__block_literal_global_249);
    }
    uint64_t v52 = 0LL;
    double v53 = &v52;
    uint64_t v54 = 0x2020000000LL;
    char v55 = 0;
    block[0] = v16;
    block[1] = 3221225472LL;
    block[2] = __37__OTClique__fetchCliqueStatus_error___block_invoke_2;
    block[3] = &unk_1896678C0;
    block[4] = self;
    block[5] = &v52;
    block[6] = &v63;
    dispatch_sync((dispatch_queue_t)_fetchCliqueStatus_error__statusReturnsQueue, block);
    if (v58[5] || ![v50 useCachedAccountStatus] || *((_BYTE *)v53 + 24))
    {
      secLogObjForScope("clique-status");
      os_signpost_id_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        else {
          uint64_t v18 = "non-";
        }
        v19 = -[OTClique ctx](self, "ctx");
        [v19 context];
        objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTClique ctx](self, "ctx");
        unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = [v21 altDSID];
        v23 = (void *)v22;
        unint64_t v24 = v64[3] + 1;
        if (v24 > 5) {
          BOOL v25 = @"CliqueStatusIn";
        }
        else {
          BOOL v25 = off_189667B40[v24];
        }
        uint64_t v32 = v58[5];
        *(_DWORD *)__int128 buf = 136447234;
        *(void *)&buf[4] = v18;
        __int16 v68 = 2112;
        double v69 = *(double *)&v20;
        __int16 v70 = 2112;
        uint64_t v71 = v22;
        __int16 v72 = 2112;
        v73 = v25;
        __int16 v74 = 2112;
        uint64_t v75 = v32;
        _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "cliqueStatus(%{public}scached)(context:%@, altDSID:%@) returning %@ (error: %@)",  buf,  0x34u);
      }
    }

    else
    {
      secLogObjForScope("clique-status");
      os_signpost_id_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        else {
          unint64_t v40 = "non-";
        }
        -[OTClique ctx](self, "ctx");
        uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
        [v41 context];
        id v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[OTClique ctx](self, "ctx");
        id v43 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v44 = [v43 altDSID];
        id v45 = (void *)v44;
        unint64_t v46 = v64[3] + 1;
        if (v46 > 5) {
          unint64_t v47 = @"CliqueStatusIn";
        }
        else {
          unint64_t v47 = off_189667B40[v46];
        }
        uint64_t v48 = v58[5];
        *(_DWORD *)__int128 buf = 136447234;
        *(void *)&buf[4] = v40;
        __int16 v68 = 2112;
        double v69 = *(double *)&v42;
        __int16 v70 = 2112;
        uint64_t v71 = v44;
        __int16 v72 = 2112;
        v73 = v47;
        __int16 v74 = 2112;
        uint64_t v75 = v48;
        _os_log_debug_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEBUG,  "cliqueStatus(%{public}scached)(context:%@, altDSID:%@) returning %@ (error: %@)",  buf,  0x34u);
      }
    }

    _Block_object_dispose(&v52, 8);
    int v33 = 1;
    if (a4)
    {
      unint64_t v34 = (void *)v58[5];
      if (v34)
      {
        int v33 = 0;
        *a4 = v34;
      }
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v7, v49);
    _OctagonSignpostLogSystem();
    unint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = v36;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&buf[4] = v33;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v37,  OS_SIGNPOST_INTERVAL_END,  v7,  "FetchCliqueStatus",  " OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchCliqueStatus}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&buf[4] = v7;
      __int16 v68 = 2048;
      double v69 = (double)Nanoseconds / 1000000000.0;
      __int16 v70 = 1026;
      LODWORD(v71) = v33;
      _os_log_impl( &dword_1804F4000,  v38,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: FetchCliqueStatus  OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name =OctagonSignpostNameFetchCliqueStatus}d ",  buf,  0x1Cu);
    }

    int64_t v31 = v64[3];
    _Block_object_dispose(&v57, 8);
  }

  else
  {
    secLogObjForScope("clique-status");
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_1804F4000, v26, OS_LOG_TYPE_DEFAULT, "cliqueStatus noOTControl", buf, 2u);
    }

    unint64_t v27 = _OctagonSignpostGetNanoseconds(v7, v49);
    _OctagonSignpostLogSystem();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v29 = v28;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(void *)__int128 buf = 67240192LL;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v29,  OS_SIGNPOST_INTERVAL_END,  v7,  "FetchCliqueStatus",  " OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchCliqueStatus}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&buf[4] = v7;
      __int16 v68 = 2048;
      double v69 = (double)v27 / 1000000000.0;
      __int16 v70 = 1026;
      LODWORD(v71) = 0;
      _os_log_impl( &dword_1804F4000,  v30,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: FetchCliqueStatus  OctagonSignpostNameFetchCliqueStatus=%{public,signpost.telemetry:number1,name =OctagonSignpostNameFetchCliqueStatus}d ",  buf,  0x1Cu);
    }

    int64_t v31 = -1LL;
  }

  _Block_object_dispose(&v63, 8);
  return v31;
}

- (int64_t)fetchCliqueStatus:(id *)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  int64_t v6 = -[OTClique _fetchCliqueStatus:error:](self, "_fetchCliqueStatus:error:", v5, a3);

  return v6;
}

- (int64_t)cachedCliqueStatus:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  os_signpost_id_t v7 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  uint64_t v8 = v7;
  if (v5) {
    -[OTOperationConfiguration setUseCachedAccountStatus:](v7, "setUseCachedAccountStatus:", 1LL);
  }
  int64_t v9 = -[OTClique _fetchCliqueStatus:error:](self, "_fetchCliqueStatus:error:", v8, a4);

  return v9;
}

- (BOOL)removeFriendsInClique:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope("clique-removefriends");
  int64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 context];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 altDSID];
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&buf[4] = v8;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "removeFriendsInClique invoked using context:%@, altdsid:%@",  buf,  0x16u);
  }

  _OctagonSignpostLogSystem();
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  uint64_t v42 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int64_t v14 = v13;
  unint64_t v41 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "RemoveFriendsInClique",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&buf[4] = v12;
    _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RemoveFriendsInClique  enableTelemetry=YES ",  buf,  0xCu);
  }

  [MEMORY[0x189603FA8] array];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  os_signpost_id_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v18 = v5;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v48;
    do
    {
      for (uint64_t i = 0LL; i != v19; ++i)
      {
        if (*(void *)v48 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        else {
          v23 = v17;
        }
        [v23 addObject:v22];
      }

      uint64_t v19 = [v18 countByEnumeratingWithState:&v47 objects:v61 count:16];
    }

    while (v19);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v58 = __Block_byref_object_copy__4755;
  uint64_t v59 = __Block_byref_object_dispose__4756;
  id v60 = 0LL;
  if (![v16 count]) {
    goto LABEL_23;
  }
  -[OTClique makeOTControl:](self, "makeOTControl:", a4);
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    secLogObjForScope("clique-removefriends");
    BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v51 = 138412290;
      os_signpost_id_t v52 = (os_signpost_id_t)v16;
      _os_log_impl(&dword_1804F4000, v25, OS_LOG_TYPE_DEFAULT, "octagon: removing octagon friends: %@", v51, 0xCu);
    }

    __int16 v26 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    -[OTClique ctx](self, "ctx");
    unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = -[OTControlArguments initWithConfiguration:](v26, "initWithConfiguration:", v27);
    v44[0] = MEMORY[0x1895F87A8];
    v44[1] = 3221225472LL;
    v44[2] = __40__OTClique_removeFriendsInClique_error___block_invoke;
    v44[3] = &unk_1896678E8;
    unint64_t v46 = buf;
    id v45 = v16;
    [v24 removeFriendsInClique:v28 peerIDs:v45 reply:v44];

LABEL_23:
    if (a4)
    {
      int v29 = *(void **)(*(void *)&buf[8] + 40LL);
      if (v29) {
        *a4 = v29;
      }
    }

    secLogObjForScope("clique-removefriends");
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v51 = 67109120;
      LODWORD(v52) = 1;
      _os_log_impl(&dword_1804F4000, v30, OS_LOG_TYPE_DEFAULT, "removeFriendsInClique complete: %d", v51, 8u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v12, v42);
    _OctagonSignpostLogSystem();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v33 = v32;
    if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)os_signpost_id_t v51 = 67240192;
      LODWORD(v52) = 1;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v33,  OS_SIGNPOST_INTERVAL_END,  v12,  "RemoveFriendsInClique",  " OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveFriendsInClique}d ",  v51,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v51 = 134218496;
      os_signpost_id_t v52 = v12;
      __int16 v53 = 2048;
      double v54 = (double)Nanoseconds / 1000000000.0;
      __int16 v55 = 1026;
      int v56 = 1;
      _os_log_impl( &dword_1804F4000,  v34,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RemoveFriendsInClique  OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:numb er1,name=OctagonSignpostNameRemoveFriendsInClique}d ",  v51,  0x1Cu);
    }

    BOOL v35 = *(void *)(*(void *)&buf[8] + 40LL) == 0LL;
    goto LABEL_40;
  }

  unint64_t v36 = _OctagonSignpostGetNanoseconds(v12, v42);
  _OctagonSignpostLogSystem();
  uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v38 = v37;
  if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_DWORD *)os_signpost_id_t v51 = 67240192;
    LODWORD(v52) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v38,  OS_SIGNPOST_INTERVAL_END,  v12,  "RemoveFriendsInClique",  " OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveFriendsInClique}d ",  v51,  8u);
  }

  _OctagonSignpostLogSystem();
  v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_signpost_id_t v51 = 134218496;
    os_signpost_id_t v52 = v12;
    __int16 v53 = 2048;
    double v54 = (double)v36 / 1000000000.0;
    __int16 v55 = 1026;
    int v56 = 0;
    _os_log_impl( &dword_1804F4000,  v39,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RemoveFriendsInClique  OctagonSignpostNameRemoveFriendsInClique=%{public,signpost.telemetry:number 1,name=OctagonSignpostNameRemoveFriendsInClique}d ",  v51,  0x1Cu);
  }

  BOOL v35 = 0;
LABEL_40:
  _Block_object_dispose(buf, 8);

  return v35;
}

- (BOOL)leaveClique:(id *)a3
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  secLogObjForScope("clique-leaveClique");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 context];
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 altDSID];
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&buf[4] = v7;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "leaveClique invoked using context:%@, altdsid:%@",  buf,  0x16u);
  }

  _OctagonSignpostLogSystem();
  unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "LeaveClique",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&buf[4] = v11;
    _os_log_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: LeaveClique  enableTelemetry=YES ",  buf,  0xCu);
  }

  -[OTClique makeOTControl:](self, "makeOTControl:", a3);
  os_signpost_id_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    double v54 = __Block_byref_object_copy__4755;
    __int16 v55 = __Block_byref_object_dispose__4756;
    id v56 = 0LL;
    id v18 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
    uint64_t v19 = (id *)(*(void *)&buf[8] + 40LL);
    id obj = *(id *)(*(void *)&buf[8] + 40LL);
    int64_t v20 = -[OTClique fetchCliqueStatus:error:](self, "fetchCliqueStatus:error:", v18, &obj);
    objc_storeStrong(v19, obj);

    if (*(void *)(*(void *)&buf[8] + 40LL))
    {
      secLogObjForScope("clique-leaveClique");
      unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        os_signpost_id_t v22 = *(void *)(*(void *)&buf[8] + 40LL);
        *(_DWORD *)__int128 v47 = 138412290;
        os_signpost_id_t v48 = v22;
        _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, "fetching current status errored: %@", v47, 0xCu);
      }

      if (a3) {
        *a3 = *(id *)(*(void *)&buf[8] + 40LL);
      }
      unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
      _OctagonSignpostLogSystem();
      unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v25 = v24;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_DWORD *)__int128 v47 = 67240192;
        LODWORD(v48) = 0;
        _os_signpost_emit_with_name_impl( &dword_1804F4000,  v25,  OS_SIGNPOST_INTERVAL_END,  v11,  "LeaveClique",  " OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ",  v47,  8u);
      }

      _OctagonSignpostLogSystem();
      __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 v47 = 134218496;
        os_signpost_id_t v48 = v11;
        __int16 v49 = 2048;
        double v50 = (double)Nanoseconds / 1000000000.0;
        __int16 v51 = 1026;
        BOOL v52 = 0;
        _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: LeaveClique  OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSi gnpostNameLeaveClique}d ",  v47,  0x1Cu);
      }

      BOOL v27 = 0;
    }

    else
    {
      if (v20 == 1)
      {
        secLogObjForScope("clique-leaveClique");
        uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 v47 = 0;
          _os_log_impl( &dword_1804F4000,  v32,  OS_LOG_TYPE_DEFAULT,  "current status is Not In; no need to leave",
            v47,
            2u);
        }

        unint64_t v33 = _OctagonSignpostGetNanoseconds(v11, v12);
        _OctagonSignpostLogSystem();
        unint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        BOOL v35 = v34;
        if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
        {
          *(_DWORD *)__int128 v47 = 67240192;
          LODWORD(v48) = 1;
          _os_signpost_emit_with_name_impl( &dword_1804F4000,  v35,  OS_SIGNPOST_INTERVAL_END,  v11,  "LeaveClique",  " OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ",  v47,  8u);
        }

        _OctagonSignpostLogSystem();
        __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        BOOL v27 = 1;
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        *(_DWORD *)__int128 v47 = 134218496;
        os_signpost_id_t v48 = v11;
        __int16 v49 = 2048;
        double v50 = (double)v33 / 1000000000.0;
        __int16 v51 = 1026;
        BOOL v52 = 1;
      }

      else
      {
        unint64_t v36 = objc_alloc(&OBJC_CLASS___OTControlArguments);
        -[OTClique ctx](self, "ctx");
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v38 = -[OTControlArguments initWithConfiguration:](v36, "initWithConfiguration:", v37);
        v45[0] = MEMORY[0x1895F87A8];
        v45[1] = 3221225472LL;
        v45[2] = __24__OTClique_leaveClique___block_invoke;
        v45[3] = &unk_189672C48;
        v45[4] = buf;
        [v17 leaveClique:v38 reply:v45];

        if (a3) {
          *a3 = *(id *)(*(void *)&buf[8] + 40LL);
        }
        uint64_t v39 = *(void *)(*(void *)&buf[8] + 40LL);
        BOOL v27 = v39 == 0;
        secLogObjForScope("clique-leaveClique");
        unint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 v47 = 67109120;
          LODWORD(v48) = v39 == 0;
          _os_log_impl(&dword_1804F4000, v40, OS_LOG_TYPE_DEFAULT, "leaveClique complete: %d", v47, 8u);
        }

        unint64_t v41 = _OctagonSignpostGetNanoseconds(v11, v12);
        _OctagonSignpostLogSystem();
        uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v43 = v42;
        if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          *(_DWORD *)__int128 v47 = 67240192;
          LODWORD(v48) = v39 == 0;
          _os_signpost_emit_with_name_impl( &dword_1804F4000,  v43,  OS_SIGNPOST_INTERVAL_END,  v11,  "LeaveClique",  " OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSignpostNameLeaveClique}d ",  v47,  8u);
        }

        _OctagonSignpostLogSystem();
        __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        *(_DWORD *)__int128 v47 = 134218496;
        os_signpost_id_t v48 = v11;
        __int16 v49 = 2048;
        double v50 = (double)v41 / 1000000000.0;
        __int16 v51 = 1026;
        BOOL v52 = v39 == 0;
      }

      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: LeaveClique  OctagonSignpostNameLeaveClique=%{public,signpost.telemetry:number1,name=OctagonSign postNameLeaveClique}d ",  v47,  0x1Cu);
    }

- (id)peerDeviceNamesByPeerID:(id *)a3
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  secLogObjForScope("clique");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 context];
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 altDSID];
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&buf[4] = v7;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "peerDeviceNamesByPeerID invoked using context:%@, altdsid:%@",  buf,  0x16u);
  }

  _OctagonSignpostLogSystem();
  unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "PeerDeviceNamesByPeerID",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&buf[4] = v11;
    _os_log_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PeerDeviceNamesByPeerID  enableTelemetry=YES ",  buf,  0xCu);
  }

  [MEMORY[0x189603FC8] dictionary];
  os_signpost_id_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[OTClique makeOTControl:](self, "makeOTControl:", a3);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    double v54 = __Block_byref_object_copy__4755;
    __int16 v55 = __Block_byref_object_dispose__4756;
    id v56 = 0LL;
    uint64_t v41 = 0LL;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x3032000000LL;
    uint64_t v44 = __Block_byref_object_copy__4755;
    id v45 = __Block_byref_object_dispose__4756;
    id v46 = 0LL;
    uint64_t v19 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    -[OTClique ctx](self, "ctx");
    int64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v21 = -[OTControlArguments initWithConfiguration:](v19, "initWithConfiguration:", v20);
    v40[0] = MEMORY[0x1895F87A8];
    v40[1] = 3221225472LL;
    v40[2] = __36__OTClique_peerDeviceNamesByPeerID___block_invoke;
    v40[3] = &unk_189667910;
    v40[4] = buf;
    v40[5] = &v41;
    [v18 peerDeviceNamesByPeerID:v21 reply:v40];

    uint64_t v22 = *(void *)&buf[8];
    if (a3)
    {
      v23 = *(void **)(*(void *)&buf[8] + 40LL);
      if (v23)
      {
        *a3 = v23;
        uint64_t v22 = *(void *)&buf[8];
      }
    }

    if (*(void *)(v22 + 40))
    {
      unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
      _OctagonSignpostLogSystem();
      BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      __int16 v26 = v25;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_DWORD *)__int128 v47 = 67240192;
        LODWORD(v48) = 0;
        _os_signpost_emit_with_name_impl( &dword_1804F4000,  v26,  OS_SIGNPOST_INTERVAL_END,  v11,  "PeerDeviceNamesByPeerID",  " OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDe viceNamesByPeerID}d ",  v47,  8u);
      }

      _OctagonSignpostLogSystem();
      BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 v47 = 134218496;
        os_signpost_id_t v48 = v11;
        __int16 v49 = 2048;
        double v50 = (double)Nanoseconds / 1000000000.0;
        __int16 v51 = 1026;
        int v52 = 0;
        _os_log_impl( &dword_1804F4000,  v27,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PeerDeviceNamesByPeerID  OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetr y:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ",  v47,  0x1Cu);
      }

      id v28 = 0LL;
    }

    else
    {
      [v17 addEntriesFromDictionary:v42[5]];
      secLogObjForScope("clique");
      unint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = [(id)v42[5] count];
        *(_DWORD *)__int128 v47 = 134217984;
        os_signpost_id_t v48 = v34;
        _os_log_impl(&dword_1804F4000, v33, OS_LOG_TYPE_DEFAULT, "Received %lu Octagon peers", v47, 0xCu);
      }

      unint64_t v35 = _OctagonSignpostGetNanoseconds(v11, v12);
      _OctagonSignpostLogSystem();
      unint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = v36;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_DWORD *)__int128 v47 = 67240192;
        LODWORD(v48) = 0;
        _os_signpost_emit_with_name_impl( &dword_1804F4000,  v37,  OS_SIGNPOST_INTERVAL_END,  v11,  "PeerDeviceNamesByPeerID",  " OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDe viceNamesByPeerID}d ",  v47,  8u);
      }

      _OctagonSignpostLogSystem();
      unint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 v47 = 134218496;
        os_signpost_id_t v48 = v11;
        __int16 v49 = 2048;
        double v50 = (double)v35 / 1000000000.0;
        __int16 v51 = 1026;
        int v52 = 0;
        _os_log_impl( &dword_1804F4000,  v38,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PeerDeviceNamesByPeerID  OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetr y:number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ",  v47,  0x1Cu);
      }

      id v28 = v17;
    }

    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(buf, 8);
  }

  else
  {
    unint64_t v29 = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int64_t v31 = v30;
    if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&buf[4] = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v31,  OS_SIGNPOST_INTERVAL_END,  v11,  "PeerDeviceNamesByPeerID",  " OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeerDevi ceNamesByPeerID}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&buf[4] = v11;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(double *)&buf[14] = (double)v29 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v54) = 0;
      _os_log_impl( &dword_1804F4000,  v32,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PeerDeviceNamesByPeerID  OctagonSignpostNamePeerDeviceNamesByPeerID=%{public,signpost.telemetry: number1,name=OctagonSignpostNamePeerDeviceNamesByPeerID}d ",  buf,  0x1Cu);
    }

    id v28 = 0LL;
  }

  return v28;
}

- (BOOL)joinAfterRestore:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  secLogObjForScope("clique-recovery");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 context];
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 altDSID];
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)uint64_t v37 = v7;
    *(_WORD *)&v37[8] = 2112;
    *(void *)&v37[10] = v9;
    _os_log_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEFAULT, "joinAfterRestore for context:%@, altdsid:%@", buf, 0x16u);
  }

  _OctagonSignpostLogSystem();
  unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "JoinAfterRestore",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)uint64_t v37 = v11;
    _os_log_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: JoinAfterRestore  enableTelemetry=YES ",  buf,  0xCu);
  }

  if (+[OTClique platformSupportsSOS](&OBJC_CLASS___OTClique, "platformSupportsSOS"))
  {
    id v33 = 0LL;
    int v17 = SOSCCRequestToJoinCircleAfterRestore((CFTypeRef *)&v33);
    if (a3) {
      *a3 = v33;
    }
    else {

    }
    secLogObjForScope("clique-recovery");
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        BOOL v27 = (const __CFString *)*a3;
      }
      else {
        BOOL v27 = @"no error pointer provided";
      }
      *(_DWORD *)__int128 buf = 67109378;
      *(_DWORD *)uint64_t v37 = v17;
      *(_WORD *)&v37[4] = 2112;
      *(void *)&v37[6] = v27;
      _os_log_impl(&dword_1804F4000, v26, OS_LOG_TYPE_DEFAULT, "joinAfterRestore complete: %d %@", buf, 0x12u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    unint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v30 = v29;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)uint64_t v37 = v17;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v30,  OS_SIGNPOST_INTERVAL_END,  v11,  "JoinAfterRestore",  " OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=OctagonSignpostNameJoinAfterRestore}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    int64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)uint64_t v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v17;
      _os_log_impl( &dword_1804F4000,  v31,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: JoinAfterRestore  OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=O ctagonSignpostNameJoinAfterRestore}d ",  buf,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("clique-recovery");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_1804F4000, v18, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a3)
    {
      uint64_t v19 = (void *)MEMORY[0x189607870];
      uint64_t v20 = *MEMORY[0x189607670];
      uint64_t v34 = *MEMORY[0x1896075E0];
      unint64_t v35 = @"join after restore unimplemented";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 errorWithDomain:v20 code:-4 userInfo:v21];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    unint64_t v22 = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v24 = v23;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)uint64_t v37 = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v11,  "JoinAfterRestore",  " OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=OctagonSignpostNameJoinAfterRestore}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)uint64_t v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)v22 / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = 0;
      _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: JoinAfterRestore  OctagonSignpostNameJoinAfterRestore=%{public,signpost.telemetry:number1,name=O ctagonSignpostNameJoinAfterRestore}d ",  buf,  0x1Cu);
    }

    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)setOctagonUserControllableViewsSyncEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  -[OTClique makeOTControl:](self, "makeOTControl:", a4);
  os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    unint64_t v21 = __Block_byref_object_copy__4755;
    unint64_t v22 = __Block_byref_object_dispose__4756;
    id v23 = 0LL;
    secLogObjForScope("clique-user-sync");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v9 = @"paused";
      if (v5) {
        int64_t v9 = @"enabled";
      }
      *(_DWORD *)__int128 buf = 138412290;
      BOOL v25 = v9;
      _os_log_impl(&dword_1804F4000, v8, OS_LOG_TYPE_DEFAULT, "setting user-controllable-sync status to %@", buf, 0xCu);
    }

    unint64_t v10 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    -[OTClique ctx](self, "ctx");
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = -[OTControlArguments initWithConfiguration:](v10, "initWithConfiguration:", v11);
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __61__OTClique_setOctagonUserControllableViewsSyncEnabled_error___block_invoke;
    v17[3] = &unk_189667938;
    v17[4] = &v18;
    [v7 setUserControllableViewsSyncStatus:v12 enabled:v5 reply:v17];

    v13 = v19;
    if (a4)
    {
      int64_t v14 = (void *)v19[5];
      if (v14)
      {
        *a4 = v14;
        v13 = v19;
      }
    }

    BOOL v15 = v13[5] == 0;
    _Block_object_dispose(&v18, 8);
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)fetchUserControllableViewsSyncingEnabled:(id *)a3
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  uint64_t v13 = 0LL;
  int64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy__4755;
  int v17 = __Block_byref_object_dispose__4756;
  id v18 = 0LL;
  -[OTClique makeOTControl:](self, "makeOTControl:");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    int64_t v6 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    -[OTClique ctx](self, "ctx");
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = -[OTControlArguments initWithConfiguration:](v6, "initWithConfiguration:", v7);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __53__OTClique_fetchUserControllableViewsSyncingEnabled___block_invoke;
    v12[3] = &unk_189667960;
    v12[4] = &v19;
    v12[5] = &v13;
    [v5 fetchUserControllableViewsSyncStatus:v8 reply:v12];

    int64_t v9 = (void *)v14[5];
    if (v9 && a3) {
      *a3 = v9;
    }
    BOOL v10 = *((_BYTE *)v20 + 24) != 0;
  }

  else
  {
    BOOL v10 = 0;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)fetchUserControllableViewsSyncingEnabledAsync:(id)a3
{
  id v4 = a3;
  id v12 = 0LL;
  -[OTClique makeOTControl:](self, "makeOTControl:", &v12);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v12;
  if (v5)
  {
    os_signpost_id_t v7 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    -[OTClique ctx](self, "ctx");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v9 = -[OTControlArguments initWithConfiguration:](v7, "initWithConfiguration:", v8);
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __58__OTClique_fetchUserControllableViewsSyncingEnabledAsync___block_invoke;
    v10[3] = &unk_189670568;
    id v11 = v4;
    [v5 fetchUserControllableViewsSyncStatusAsync:v9 reply:v10];
  }

  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0LL, v6);
  }
}

- (BOOL)waitForInitialSync:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  secLogObjForScope("clique-legacy");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 context];
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 altDSID];
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)uint64_t v37 = v7;
    *(_WORD *)&v37[8] = 2112;
    *(void *)&v37[10] = v9;
    _os_log_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEFAULT, "waitForInitialSync for context:%@, altdsid:%@", buf, 0x16u);
  }

  _OctagonSignpostLogSystem();
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "WaitForInitialSync",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)uint64_t v37 = v11;
    _os_log_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: WaitForInitialSync  enableTelemetry=YES ",  buf,  0xCu);
  }

  if (+[OTClique platformSupportsSOS](&OBJC_CLASS___OTClique, "platformSupportsSOS"))
  {
    id v33 = 0LL;
    int v17 = SOSCCWaitForInitialSync((CFTypeRef *)&v33);
    if (a3) {
      *a3 = v33;
    }
    else {

    }
    secLogObjForScope("clique-legacy");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        BOOL v27 = (const __CFString *)*a3;
      }
      else {
        BOOL v27 = @"no error pointer provided";
      }
      *(_DWORD *)__int128 buf = 67109378;
      *(_DWORD *)uint64_t v37 = v17;
      *(_WORD *)&v37[4] = 2112;
      *(void *)&v37[6] = v27;
      _os_log_impl(&dword_1804F4000, v26, OS_LOG_TYPE_DEFAULT, "waitForInitialSync waited: %d %@", buf, 0x12u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    unint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v30 = v29;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)uint64_t v37 = v17;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v30,  OS_SIGNPOST_INTERVAL_END,  v11,  "WaitForInitialSync",  " OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForInitialSync}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    int64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)uint64_t v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v17;
      _os_log_impl( &dword_1804F4000,  v31,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: WaitForInitialSync  OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,na me=OctagonSignpostNameWaitForInitialSync}d ",  buf,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("clique-legacy");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_1804F4000, v18, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a3)
    {
      uint64_t v19 = (void *)MEMORY[0x189607870];
      uint64_t v20 = *MEMORY[0x189607670];
      uint64_t v34 = *MEMORY[0x1896075E0];
      unint64_t v35 = @"wait for initial sync unimplemented";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 errorWithDomain:v20 code:-4 userInfo:v21];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    unint64_t v22 = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v24 = v23;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)uint64_t v37 = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v11,  "WaitForInitialSync",  " OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForInitialSync}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)uint64_t v37 = v11;
      *(_WORD *)&v37[8] = 2048;
      *(double *)&v37[10] = (double)v22 / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = 0;
      _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: WaitForInitialSync  OctagonSignpostNameWaitForInitialSync=%{public,signpost.telemetry:number1,na me=OctagonSignpostNameWaitForInitialSync}d ",  buf,  0x1Cu);
    }

    LOBYTE(v17) = 0;
  }

  return v17;
}

- (id)copyViewUnawarePeerInfo:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  secLogObjForScope("clique-legacy");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 context];
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 altDSID];
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    os_signpost_id_t v35 = (os_signpost_id_t)v7;
    __int16 v36 = 2112;
    double v37 = *(double *)&v9;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "copyViewUnawarePeerInfo for context:%@, altdsid:%@",  buf,  0x16u);
  }

  _OctagonSignpostLogSystem();
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "CopyViewUnawarePeerInfo",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v35 = v11;
    _os_log_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: CopyViewUnawarePeerInfo  enableTelemetry=YES ",  buf,  0xCu);
  }

  if (+[OTClique platformSupportsSOS](&OBJC_CLASS___OTClique, "platformSupportsSOS"))
  {
    id v31 = 0LL;
    int v17 = (void *)SOSCCCopyViewUnawarePeerInfo((CFTypeRef *)&v31);
    if (a3) {
      *a3 = v31;
    }
    else {

    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v28 = v27;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_DWORD *)__int128 buf = 67240192;
      LODWORD(v35) = v17 != 0LL;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v28,  OS_SIGNPOST_INTERVAL_END,  v11,  "CopyViewUnawarePeerInfo",  " OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyView UnawarePeerInfo}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      os_signpost_id_t v35 = v11;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      BOOL v39 = v17 != 0LL;
      _os_log_impl( &dword_1804F4000,  v29,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CopyViewUnawarePeerInfo  OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry: number1,name=OctagonSignpostNameCopyViewUnawarePeerInfo}d ",  buf,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("clique-legacy");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_1804F4000,  v18,  OS_LOG_TYPE_DEFAULT,  "SOS disabled for this platform, returning NULL",  buf,  2u);
    }

    if (a3)
    {
      uint64_t v19 = (void *)MEMORY[0x189607870];
      uint64_t v20 = *MEMORY[0x189607670];
      uint64_t v32 = *MEMORY[0x1896075E0];
      id v33 = @"copy view unaware peer info unimplemented";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 errorWithDomain:v20 code:-4 userInfo:v21];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    unint64_t v22 = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v24 = v23;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)__int128 buf = 67240192;
      LODWORD(v35) = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v11,  "CopyViewUnawarePeerInfo",  " OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyView UnawarePeerInfo}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      os_signpost_id_t v35 = v11;
      __int16 v36 = 2048;
      double v37 = (double)v22 / 1000000000.0;
      __int16 v38 = 1026;
      BOOL v39 = 0;
      _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CopyViewUnawarePeerInfo  OctagonSignpostNameCopyViewUnawarePeerInfo=%{public,signpost.telemetry: number1,name=OctagonSignpostNameCopyViewUnawarePeerInfo}d ",  buf,  0x1Cu);
    }

    return 0LL;
  }

  return v17;
}

- (BOOL)setUserCredentialsWithLabel:(id)a3 password:(id)a4 dsid:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  BOOL v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  secLogObjForScope("clique-legacy");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 context];
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 altDSID];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)uint64_t v44 = v15;
    *(_WORD *)&v44[8] = 2112;
    *(void *)&v44[10] = v17;
    _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "setUserCredentialsAndDSID for context:%@, altdsid:%@",  buf,  0x16u);
  }

  _OctagonSignpostLogSystem();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);
  uint64_t v20 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v22 = v21;
  unint64_t v23 = v19 - 1;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "SetUserCredentialsAndDSID",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)uint64_t v44 = v19;
    _os_log_impl( &dword_1804F4000,  v24,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: SetUserCredentialsAndDSID  enableTelemetry=YES ",  buf,  0xCu);
  }

  if (+[OTClique platformSupportsSOS](&OBJC_CLASS___OTClique, "platformSupportsSOS"))
  {
    id v40 = 0LL;
    int v25 = SOSCCSetUserCredentialsAndDSID(v10, (uint64_t)v11, (uint64_t)v12, (CFTypeRef *)&v40);
    secLogObjForScope("clique-legacy");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109378;
      *(_DWORD *)uint64_t v44 = v25;
      *(_WORD *)&void v44[4] = 2112;
      *(void *)&void v44[6] = v40;
      _os_log_impl(&dword_1804F4000, v26, OS_LOG_TYPE_DEFAULT, "setUserCredentialsAndDSID results: %d %@", buf, 0x12u);
    }

    if (a6) {
      *a6 = v40;
    }
    else {

    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v19, v20);
    _OctagonSignpostLogSystem();
    __int16 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    double v37 = v36;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)uint64_t v44 = v25;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v37,  OS_SIGNPOST_INTERVAL_END,  v19,  "SetUserCredentialsAndDSID",  " OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetUse rCredentialsAndDSID}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)uint64_t v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)Nanoseconds / 1000000000.0;
      __int16 v45 = 1026;
      int v46 = v25;
      _os_log_impl( &dword_1804F4000,  v38,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: SetUserCredentialsAndDSID  OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.teleme try:number1,name=OctagonSignpostNameSetUserCredentialsAndDSID}d ",  buf,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("clique-legacy");
    BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_1804F4000, v27, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a6)
    {
      id v28 = (void *)MEMORY[0x189607870];
      uint64_t v29 = *MEMORY[0x189607670];
      uint64_t v41 = *MEMORY[0x1896075E0];
      uint64_t v42 = @"set user credentials unimplemented";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      int v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 errorWithDomain:v29 code:-4 userInfo:v30];
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    unint64_t v31 = _OctagonSignpostGetNanoseconds(v19, v20);
    _OctagonSignpostLogSystem();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v33 = v32;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)uint64_t v44 = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v33,  OS_SIGNPOST_INTERVAL_END,  v19,  "SetUserCredentialsAndDSID",  " OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetUse rCredentialsAndDSID}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)uint64_t v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)v31 / 1000000000.0;
      __int16 v45 = 1026;
      int v46 = 0;
      _os_log_impl( &dword_1804F4000,  v34,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: SetUserCredentialsAndDSID  OctagonSignpostNameSetUserCredentialsAndDSID=%{public,signpost.teleme try:number1,name=OctagonSignpostNameSetUserCredentialsAndDSID}d ",  buf,  0x1Cu);
    }

    LOBYTE(v25) = 0;
  }

  return v25;
}

- (BOOL)setUserCredentialsAndDSID:(id)a3 password:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  -[OTClique ctx](self, "ctx");
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 dsid];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[OTClique setUserCredentialsWithLabel:password:dsid:error:]( self,  "setUserCredentialsWithLabel:password:dsid:error:",  v9,  v8,  v11,  a5);

  return (char)a5;
}

- (BOOL)tryUserCredentialsWithLabel:(id)a3 password:(id)a4 dsid:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = (__CFString *)a5;
  secLogObjForScope("clique-legacy");
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 context];
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 altDSID];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)uint64_t v44 = v15;
    *(_WORD *)&v44[8] = 2112;
    *(void *)&v44[10] = v17;
    _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "tryUserCredentialsAndDSID for context:%@, altdsid:%@",  buf,  0x16u);
  }

  _OctagonSignpostLogSystem();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);
  uint64_t v20 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v22 = v21;
  unint64_t v23 = v19 - 1;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v19,  "TryUserCredentialsAndDSID",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)uint64_t v44 = v19;
    _os_log_impl( &dword_1804F4000,  v24,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: TryUserCredentialsAndDSID  enableTelemetry=YES ",  buf,  0xCu);
  }

  if (+[OTClique platformSupportsSOS](&OBJC_CLASS___OTClique, "platformSupportsSOS"))
  {
    id v40 = 0LL;
    int v25 = SOSCCTryUserCredentialsAndDSID((uint64_t)v10, (uint64_t)v11, v12, (CFTypeRef *)&v40);
    secLogObjForScope("clique-legacy");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109378;
      *(_DWORD *)uint64_t v44 = v25;
      *(_WORD *)&void v44[4] = 2112;
      *(void *)&void v44[6] = v40;
      _os_log_impl(&dword_1804F4000, v26, OS_LOG_TYPE_DEFAULT, "tryUserCredentialsAndDSID results: %d %@", buf, 0x12u);
    }

    if (a6) {
      *a6 = v40;
    }
    else {

    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v19, v20);
    _OctagonSignpostLogSystem();
    __int16 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    double v37 = v36;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)uint64_t v44 = v25;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v37,  OS_SIGNPOST_INTERVAL_END,  v19,  "TryUserCredentialsAndDSID",  " OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameTryUse rCredentialsAndDSID}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)uint64_t v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)Nanoseconds / 1000000000.0;
      __int16 v45 = 1026;
      int v46 = v25;
      _os_log_impl( &dword_1804F4000,  v38,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: TryUserCredentialsAndDSID  OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.teleme try:number1,name=OctagonSignpostNameTryUserCredentialsAndDSID}d ",  buf,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("clique-legacy");
    BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_1804F4000, v27, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a6)
    {
      id v28 = (void *)MEMORY[0x189607870];
      uint64_t v29 = *MEMORY[0x189607670];
      uint64_t v41 = *MEMORY[0x1896075E0];
      uint64_t v42 = @"try user credentials unimplemented";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      int v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 errorWithDomain:v29 code:-4 userInfo:v30];
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    unint64_t v31 = _OctagonSignpostGetNanoseconds(v19, v20);
    _OctagonSignpostLogSystem();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v33 = v32;
    if (v23 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)uint64_t v44 = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v33,  OS_SIGNPOST_INTERVAL_END,  v19,  "TryUserCredentialsAndDSID",  " OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.telemetry:number1,name=OctagonSignpostNameTryUse rCredentialsAndDSID}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)uint64_t v44 = v19;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = (double)v31 / 1000000000.0;
      __int16 v45 = 1026;
      int v46 = 0;
      _os_log_impl( &dword_1804F4000,  v34,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: TryUserCredentialsAndDSID  OctagonSignpostNameTryUserCredentialsAndDSID=%{public,signpost.teleme try:number1,name=OctagonSignpostNameTryUserCredentialsAndDSID}d ",  buf,  0x1Cu);
    }

    LOBYTE(v25) = 0;
  }

  return v25;
}

- (BOOL)tryUserCredentialsAndDSID:(id)a3 password:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  -[OTClique ctx](self, "ctx");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 dsid];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[OTClique tryUserCredentialsWithLabel:password:dsid:error:]( self,  "tryUserCredentialsWithLabel:password:dsid:error:",  v9,  v8,  v11,  a5);

  return (char)a5;
}

- (id)copyPeerPeerInfo:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  secLogObjForScope("clique-legacy");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 context];
    os_signpost_id_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 altDSID];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    os_signpost_id_t v36 = (os_signpost_id_t)v7;
    __int16 v37 = 2112;
    double v38 = *(double *)&v9;
    _os_log_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEFAULT, "copyPeerPeerInfo for context:%@, altdsid:%@", buf, 0x16u);
  }

  _OctagonSignpostLogSystem();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int64_t v14 = v13;
  unint64_t v15 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "CopyPeerPeerInfo",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v36 = v11;
    _os_log_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: CopyPeerPeerInfo  enableTelemetry=YES ",  buf,  0xCu);
  }

  if (+[OTClique platformSupportsSOS](&OBJC_CLASS___OTClique, "platformSupportsSOS"))
  {
    id v32 = 0LL;
    int v17 = (void *)SOSCCCopyPeerPeerInfo((CFTypeRef *)&v32);
    secLogObjForScope("clique-legacy");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      os_signpost_id_t v36 = (os_signpost_id_t)v17;
      __int16 v37 = 2112;
      double v38 = *(double *)&v32;
      _os_log_impl(&dword_1804F4000, v18, OS_LOG_TYPE_DEFAULT, "copyPeerPeerInfo results: %@ (%@)", buf, 0x16u);
    }

    if (a3) {
      *a3 = v32;
    }
    else {

    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = v28;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_DWORD *)__int128 buf = 67240192;
      LODWORD(v36) = v17 != 0LL;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v29,  OS_SIGNPOST_INTERVAL_END,  v11,  "CopyPeerPeerInfo",  " OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyPeerPeerInfo}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      os_signpost_id_t v36 = v11;
      __int16 v37 = 2048;
      double v38 = (double)Nanoseconds / 1000000000.0;
      __int16 v39 = 1026;
      BOOL v40 = v17 != 0LL;
      _os_log_impl( &dword_1804F4000,  v30,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CopyPeerPeerInfo  OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=O ctagonSignpostNameCopyPeerPeerInfo}d ",  buf,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("clique-legacy");
    os_signpost_id_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_1804F4000, v19, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a3)
    {
      uint64_t v20 = (void *)MEMORY[0x189607870];
      uint64_t v21 = *MEMORY[0x189607670];
      uint64_t v33 = *MEMORY[0x1896075E0];
      uint64_t v34 = @"copy peer peer info unimplemented";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 errorWithDomain:v21 code:-4 userInfo:v22];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    unint64_t v23 = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v25 = v24;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)__int128 buf = 67240192;
      LODWORD(v36) = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v25,  OS_SIGNPOST_INTERVAL_END,  v11,  "CopyPeerPeerInfo",  " OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCopyPeerPeerInfo}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      os_signpost_id_t v36 = v11;
      __int16 v37 = 2048;
      double v38 = (double)v23 / 1000000000.0;
      __int16 v39 = 1026;
      BOOL v40 = 0;
      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CopyPeerPeerInfo  OctagonSignpostNameCopyPeerPeerInfo=%{public,signpost.telemetry:number1,name=O ctagonSignpostNameCopyPeerPeerInfo}d ",  buf,  0x1Cu);
    }

    return 0LL;
  }

  return v17;
}

- (BOOL)peersHaveViewsEnabled:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope("clique-legacy");
  os_signpost_id_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 context];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 altDSID];
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)__int16 v39 = v9;
    *(_WORD *)&v39[8] = 2112;
    *(void *)&v39[10] = v11;
    _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "peersHaveViewsEnabled for context:%@, altdsid:%@",  buf,  0x16u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v15;
  unint64_t v17 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "PeersHaveViewsEnabled",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)__int16 v39 = v13;
    _os_log_impl( &dword_1804F4000,  v18,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PeersHaveViewsEnabled  enableTelemetry=YES ",  buf,  0xCu);
  }

  if (+[OTClique platformSupportsSOS](&OBJC_CLASS___OTClique, "platformSupportsSOS"))
  {
    id v35 = 0LL;
    HaveViewsEnabled = (const __CFBoolean *)SOSCCPeersHaveViewsEnabled((uint64_t)v6, (CFTypeRef *)&v35);
    if (HaveViewsEnabled) {
      BOOL v20 = CFBooleanGetValue(HaveViewsEnabled) != 0;
    }
    else {
      BOOL v20 = 0;
    }
    secLogObjForScope("clique-legacy");
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109378;
      *(_DWORD *)__int16 v39 = v20;
      *(_WORD *)&v39[4] = 2112;
      *(void *)&v39[6] = v35;
      _os_log_impl( &dword_1804F4000,  v29,  OS_LOG_TYPE_DEFAULT,  "peersHaveViewsEnabled results: %{BOOL}d (%@)",  buf,  0x12u);
    }

    if (a4) {
      *a4 = v35;
    }
    else {

    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    unint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v32 = v31;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)__int16 v39 = v20;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v32,  OS_SIGNPOST_INTERVAL_END,  v13,  "PeersHaveViewsEnabled",  " OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)__int16 v39 = v13;
      *(_WORD *)&v39[8] = 2048;
      *(double *)&v39[10] = (double)Nanoseconds / 1000000000.0;
      __int16 v40 = 1026;
      BOOL v41 = v20;
      _os_log_impl( &dword_1804F4000,  v33,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PeersHaveViewsEnabled  OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:numb er1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ",  buf,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("clique-legacy");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, "SOS disabled for this platform, returning NO", buf, 2u);
    }

    if (a4)
    {
      unint64_t v22 = (void *)MEMORY[0x189607870];
      uint64_t v23 = *MEMORY[0x189607670];
      uint64_t v36 = *MEMORY[0x1896075E0];
      __int16 v37 = @"peers have views enabled unimplemented";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 errorWithDomain:v23 code:-4 userInfo:v24];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    unint64_t v25 = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v27 = v26;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)__int16 v39 = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v27,  OS_SIGNPOST_INTERVAL_END,  v13,  "PeersHaveViewsEnabled",  " OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)__int16 v39 = v13;
      *(_WORD *)&v39[8] = 2048;
      *(double *)&v39[10] = (double)v25 / 1000000000.0;
      __int16 v40 = 1026;
      BOOL v41 = 0;
      _os_log_impl( &dword_1804F4000,  v28,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PeersHaveViewsEnabled  OctagonSignpostNamePeersHaveViewsEnabled=%{public,signpost.telemetry:numb er1,name=OctagonSignpostNamePeersHaveViewsEnabled}d ",  buf,  0x1Cu);
    }

    LOBYTE(v20) = 0;
  }

  return v20;
}

- (BOOL)requestToJoinCircle:(id *)a3
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  _OctagonSignpostLogSystem();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  uint64_t v7 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  unint64_t v10 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "RequestToJoinCircle",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)os_signpost_id_t v48 = v6;
    _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RequestToJoinCircle  enableTelemetry=YES ",  buf,  0xCu);
  }

  secLogObjForScope("clique-legacy");
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    os_signpost_id_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 context];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 altDSID];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)os_signpost_id_t v48 = v14;
    *(_WORD *)&v48[8] = 2112;
    *(void *)&v48[10] = v16;
    _os_log_impl( &dword_1804F4000,  v12,  OS_LOG_TYPE_DEFAULT,  "requestToJoinCircle for context:%@, altdsid:%@",  buf,  0x16u);
  }

  id v46 = 0LL;
  int64_t v17 = -[OTClique fetchCliqueStatus:](self, "fetchCliqueStatus:", &v46);
  id v18 = v46;
  if (v18)
  {
    os_signpost_id_t v19 = v18;
    secLogObjForScope("clique-legacy");
    BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)os_signpost_id_t v48 = v19;
      _os_log_impl(&dword_1804F4000, v20, OS_LOG_TYPE_DEFAULT, "fetching clique status failed: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v19;
    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v6, v7);
    _OctagonSignpostLogSystem();
    unint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = v22;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)os_signpost_id_t v48 = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v23,  OS_SIGNPOST_INTERVAL_END,  v6,  "RequestToJoinCircle",  " OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  secLogObjForScope("clique-legacy");
  BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v17 != 3)
  {
    if (!v28) {
      goto LABEL_39;
    }
    else {
      id v32 = off_189667B70[v17 + 1];
    }
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)os_signpost_id_t v48 = v32;
    uint64_t v33 = "clique status is %@; performing no Octagon actions";
    uint64_t v34 = v27;
    uint32_t v35 = 12;
    goto LABEL_38;
  }

  if (v28)
  {
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)os_signpost_id_t v48 = @"CliqueStatusAbsent";
    _os_log_impl(&dword_1804F4000, v27, OS_LOG_TYPE_DEFAULT, "clique status is %@; beginning an establish", buf, 0xCu);
  }

  id v45 = 0LL;
  -[OTClique establish:](self, "establish:", &v45);
  id v29 = v45;
  if (v29)
  {
    os_signpost_id_t v19 = v29;
    if (a3) {
      *a3 = v29;
    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v6, v7);
    _OctagonSignpostLogSystem();
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v31 = v30;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)os_signpost_id_t v48 = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v31,  OS_SIGNPOST_INTERVAL_END,  v6,  "RequestToJoinCircle",  " OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRequestToJoinCircle}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
LABEL_17:
    *(_DWORD *)__int128 buf = 134218496;
    *(void *)os_signpost_id_t v48 = v6;
    *(_WORD *)&v48[8] = 2048;
    *(double *)&v48[10] = (double)Nanoseconds / 1000000000.0;
    __int16 v49 = 1026;
    int v50 = 0;
    _os_log_impl( &dword_1804F4000,  v24,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RequestToJoinCircle  OctagonSignpostNameRequestToJoinCircle=%{public,signpost.telemetry:number1,na me=OctagonSignpostNameRequestToJoinCircle}d ",  buf,  0x1Cu);
LABEL_18:

    LOBYTE(v25) = 0;
    goto LABEL_19;
  }

  secLogObjForScope("clique-legacy");
  BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    uint64_t v33 = "establish succeeded";
    uint64_t v34 = v27;
    uint32_t v35 = 2;
LABEL_38:
    _os_log_impl(&dword_1804F4000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
  }

- (BOOL)accountUserKeyAvailable
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  secLogObjForScope("clique-legacy");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 context];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    os_signpost_id_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 altDSID];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v26 = 138412546;
    os_signpost_id_t v27 = (os_signpost_id_t)v5;
    __int16 v28 = 2112;
    double v29 = *(double *)&v7;
    _os_log_impl( &dword_1804F4000,  v3,  OS_LOG_TYPE_DEFAULT,  "accountUserKeyAvailable for context:%@, altdsid:%@",  (uint8_t *)&v26,  0x16u);
  }

  _OctagonSignpostLogSystem();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  uint64_t v10 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  os_signpost_id_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  unint64_t v13 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v9,  "AccountUserKeyAvailable",  " enableTelemetry=YES ",  (uint8_t *)&v26,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 134217984;
    os_signpost_id_t v27 = v9;
    _os_log_impl( &dword_1804F4000,  v14,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: AccountUserKeyAvailable  enableTelemetry=YES ",  (uint8_t *)&v26,  0xCu);
  }

  if (+[OTClique platformSupportsSOS](&OBJC_CLASS___OTClique, "platformSupportsSOS"))
  {
    int v15 = SOSCCCanAuthenticate(0LL);
    if ((v15 & 1) == 0)
    {
      secLogObjForScope("clique-legacy");
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEFAULT,  "Security requires credentials...",  (uint8_t *)&v26,  2u);
      }
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v9, v10);
    _OctagonSignpostLogSystem();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v19 = v18;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      int v26 = 67240192;
      LODWORD(v27) = v15;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v19,  OS_SIGNPOST_INTERVAL_END,  v9,  "AccountUserKeyAvailable",  " OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry:number1,name=OctagonSignpostNameAccountU serKeyAvailable}d ",  (uint8_t *)&v26,  8u);
    }

    _OctagonSignpostLogSystem();
    BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134218496;
      os_signpost_id_t v27 = v9;
      __int16 v28 = 2048;
      double v29 = (double)Nanoseconds / 1000000000.0;
      __int16 v30 = 1026;
      int v31 = v15;
      _os_log_impl( &dword_1804F4000,  v20,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: AccountUserKeyAvailable  OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry: number1,name=OctagonSignpostNameAccountUserKeyAvailable}d ",  (uint8_t *)&v26,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("clique-legacy");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl( &dword_1804F4000,  v21,  OS_LOG_TYPE_DEFAULT,  "SOS disabled for this platform, returning NO",  (uint8_t *)&v26,  2u);
    }

    unint64_t v22 = _OctagonSignpostGetNanoseconds(v9, v10);
    _OctagonSignpostLogSystem();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v24 = v23;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v26 = 67240192;
      LODWORD(v27) = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v9,  "AccountUserKeyAvailable",  " OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry:number1,name=OctagonSignpostNameAccountU serKeyAvailable}d ",  (uint8_t *)&v26,  8u);
    }

    _OctagonSignpostLogSystem();
    BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134218496;
      os_signpost_id_t v27 = v9;
      __int16 v28 = 2048;
      double v29 = (double)v22 / 1000000000.0;
      __int16 v30 = 1026;
      int v31 = 0;
      _os_log_impl( &dword_1804F4000,  v20,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: AccountUserKeyAvailable  OctagonSignpostNameAccountUserKeyAvailable=%{public,signpost.telemetry: number1,name=OctagonSignpostNameAccountUserKeyAvailable}d ",  (uint8_t *)&v26,  0x1Cu);
    }

    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)fetchEscrowContents:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  secLogObjForScope("clique-fetchescrow");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[OTClique ctx](self, "ctx");
    os_signpost_id_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 context];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OTClique ctx](self, "ctx");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 altDSID];
    os_signpost_id_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "fetching entropy for bottling for context:%@, altdsid:%@",  buf,  0x16u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "FetchEscrowContents",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: FetchEscrowContents  enableTelemetry=YES ",  buf,  0xCu);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v40 = 0;
  id v32 = 0LL;
  -[OTClique makeOTControl:](self, "makeOTControl:", &v32);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v32;
  if (v16)
  {
    id v18 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    -[OTClique ctx](self, "ctx");
    os_signpost_id_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v20 = -[OTControlArguments initWithConfiguration:](v18, "initWithConfiguration:", v19);
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __32__OTClique_fetchEscrowContents___block_invoke;
    v27[3] = &unk_1896679D8;
    double v29 = buf;
    os_signpost_id_t v30 = v11;
    uint64_t v31 = v12;
    id v28 = v4;
    [v16 fetchEscrowContents:v20 reply:v27];
  }

  else
  {
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    unint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v24 = *(unsigned __int8 *)(*(void *)&buf[8] + 24LL);
      *(_DWORD *)uint64_t v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v23,  OS_SIGNPOST_INTERVAL_END,  v11,  "FetchEscrowContents",  " OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowContents}d ",  v33,  8u);
    }

    _OctagonSignpostLogSystem();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v33 = 134218496;
      int v26 = *(unsigned __int8 *)(*(void *)&buf[8] + 24LL);
      os_signpost_id_t v34 = v11;
      __int16 v35 = 2048;
      double v36 = (double)Nanoseconds / 1000000000.0;
      __int16 v37 = 1026;
      int v38 = v26;
      _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: FetchEscrowContents  OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1, name=OctagonSignpostNameFetchEscrowContents}d ",  v33,  0x1Cu);
    }

    (*((void (**)(id, void, void, void, id))v4 + 2))(v4, 0LL, 0LL, 0LL, v17);
  }

  _Block_object_dispose(buf, 8);
}

- (void)performedCDPStateMachineRun:(id)a3 success:(BOOL)a4 error:(id)a5 reply:(id)a6
{
  BOOL v8 = a4;
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v30 = a3;
  id v10 = a5;
  id v11 = a6;
  _OctagonSignpostLogSystem();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "PerformedCDPStateMachineRun",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PerformedCDPStateMachineRun  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x2020000000LL;
  char v48 = 0;
  id v39 = 0LL;
  -[OTClique makeOTControl:](self, "makeOTControl:", &v39);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v39;
  if (v18)
  {
    BOOL v20 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    -[OTClique ctx](self, "ctx");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v22 = -[OTControlArguments initWithConfiguration:](v20, "initWithConfiguration:", v21);
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __60__OTClique_performedCDPStateMachineRun_success_error_reply___block_invoke;
    v31[3] = &unk_189667AC8;
    os_signpost_id_t v36 = v13;
    uint64_t v37 = v14;
    id v32 = v30;
    p___int128 buf = &buf;
    id v34 = v11;
    BOOL v38 = v8;
    id v33 = v10;
    [v18 postCDPFollowupResult:v22 success:v8 type:v32 error:v33 reply:v31];
  }

  else
  {
    secLogObjForScope("clique-cdp-sm");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v40 = 138412290;
      os_signpost_id_t v41 = (os_signpost_id_t)v19;
      _os_log_impl( &dword_1804F4000,  v23,  OS_LOG_TYPE_DEFAULT,  "octagon, failed to fetch OTControl object: %@",  v40,  0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v26 = v25;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)char v40 = 67240192;
      LODWORD(v41) = v27;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v26,  OS_SIGNPOST_INTERVAL_END,  v13,  "PerformedCDPStateMachineRun",  " OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerf ormedCDPStateMachineRun}d ",  v40,  8u);
    }

    _OctagonSignpostLogSystem();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v40 = 134218496;
      int v29 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v41 = v13;
      __int16 v42 = 2048;
      double v43 = (double)Nanoseconds / 1000000000.0;
      __int16 v44 = 1026;
      int v45 = v29;
      _os_log_impl( &dword_1804F4000,  v28,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformedCDPStateMachineRun  OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.te lemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ",  v40,  0x1Cu);
    }

    (*((void (**)(id, id))v11 + 2))(v11, v19);
  }

  _Block_object_dispose(&buf, 8);
}

- (BOOL)waitForOctagonUpgrade:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  _OctagonSignpostLogSystem();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  uint64_t v7 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = v8;
  unint64_t v10 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "WaitForOctagonUpgrade",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: WaitForOctagonUpgrade  enableTelemetry=YES ",  buf,  0xCu);
  }

  id v35 = 0LL;
  -[OTClique makeOTControl:](self, "makeOTControl:", &v35);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v35;
  if (v12)
  {
    uint64_t v31 = 0LL;
    id v32 = &v31;
    uint64_t v33 = 0x2020000000LL;
    char v34 = 0;
    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    double v43 = __Block_byref_object_copy__4755;
    __int16 v44 = __Block_byref_object_dispose__4756;
    id v45 = 0LL;
    uint64_t v14 = objc_alloc(&OBJC_CLASS___OTControlArguments);
    -[OTClique ctx](self, "ctx");
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = -[OTControlArguments initWithConfiguration:](v14, "initWithConfiguration:", v15);
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __34__OTClique_waitForOctagonUpgrade___block_invoke;
    v30[3] = &unk_189667830;
    v30[4] = buf;
    v30[5] = &v31;
    [v12 waitForOctagonUpgrade:v16 reply:v30];

    if (a3)
    {
      id v17 = *(void **)(*(void *)&buf[8] + 40LL);
      if (v17) {
        *a3 = v17;
      }
    }

    int v18 = *((unsigned __int8 *)v32 + 24);
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v6, v7);
    _OctagonSignpostLogSystem();
    BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = v20;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_DWORD *)os_signpost_id_t v36 = 67240192;
      LODWORD(v37) = v18;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v21,  OS_SIGNPOST_INTERVAL_END,  v6,  "WaitForOctagonUpgrade",  " OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ",  v36,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v36 = 134218496;
      os_signpost_id_t v37 = v6;
      __int16 v38 = 2048;
      double v39 = (double)Nanoseconds / 1000000000.0;
      __int16 v40 = 1026;
      int v41 = v18;
      _os_log_impl( &dword_1804F4000,  v22,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: WaitForOctagonUpgrade  OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:numb er1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ",  v36,  0x1Cu);
    }

    BOOL v23 = *((_BYTE *)v32 + 24) != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v31, 8);
  }

  else
  {
    secLogObjForScope("clique-waitforoctagonupgrade");
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl( &dword_1804F4000,  v24,  OS_LOG_TYPE_DEFAULT,  "octagon, failed to fetch OTControl object: %@",  buf,  0xCu);
    }

    if (a3) {
      *a3 = v13;
    }
    unint64_t v25 = _OctagonSignpostGetNanoseconds(v6, v7);
    _OctagonSignpostLogSystem();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v27 = v26;
    if (v10 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v26))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v27,  OS_SIGNPOST_INTERVAL_END,  v6,  "WaitForOctagonUpgrade",  " OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:number1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(double *)&buf[14] = (double)v25 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v43) = 0;
      _os_log_impl( &dword_1804F4000,  v28,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: WaitForOctagonUpgrade  OctagonSignpostNameWaitForOctagonUpgrade=%{public,signpost.telemetry:numb er1,name=OctagonSignpostNameWaitForOctagonUpgrade}d ",  buf,  0x1Cu);
    }

    BOOL v23 = 0;
  }

  return v23;
}

- (void)performedFailureCDPStateMachineRun:(id)a3 error:(id)a4 reply:(id)a5
{
}

- (void)performedSuccessfulCDPStateMachineRun:(id)a3 reply:(id)a4
{
}

- (void)setCliqueMemberIdentifier:(id)a3
{
}

- (OTConfigurationContext)ctx
{
  return self->_ctx;
}

- (void).cxx_destruct
{
}

void __34__OTClique_waitForOctagonUpgrade___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("clique-waitforoctagonupgrade");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "error from control: %@", (uint8_t *)&v9, 0xCu);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v7 = v3;
    char v8 = 0;
    id v4 = *(os_log_s **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }

  else
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "successfully upgraded to octagon", (uint8_t *)&v9, 2u);
    }

    char v8 = 1;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v8;
}

void __60__OTClique_performedCDPStateMachineRun_success_error_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  double v3 = COERCE_DOUBLE(a2);
  if (v3 != 0.0)
  {
    secLogObjForScope("clique-cdp-sm");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v28 = 138412546;
      uint64_t v29 = v5;
      __int16 v30 = 2112;
      double v31 = v3;
      _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "failed to post %@ result: %@ ", (uint8_t *)&v28, 0x16u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(*(void *)(a1 + 64), *(void *)(a1 + 72));
    _OctagonSignpostLogSystem();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    char v8 = v7;
    os_signpost_id_t v9 = *(void *)(a1 + 64);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      int v28 = 67240192;
      LODWORD(v29) = v10;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "PerformedCDPStateMachineRun",  " OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerf ormedCDPStateMachineRun}d ",  (uint8_t *)&v28,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      uint64_t v29 = *(void *)(a1 + 64);
      __int16 v30 = 2048;
      double v31 = (double)Nanoseconds / 1000000000.0;
      __int16 v32 = 1026;
      int v33 = v12;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformedCDPStateMachineRun  OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.te lemetry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ",  (uint8_t *)&v28,  0x1Cu);
    }

    goto LABEL_21;
  }

  int v13 = *(unsigned __int8 *)(a1 + 80);
  secLogObjForScope("clique-cdp-sm");
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (!v15) {
      goto LABEL_16;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    int v28 = 138412290;
    uint64_t v29 = v16;
    id v17 = "posted success: %@";
    int v18 = v14;
    uint32_t v19 = 12;
  }

  else
  {
    if (!v15) {
      goto LABEL_16;
    }
    uint64_t v20 = *(void *)(a1 + 32);
    double v21 = *(double *)(a1 + 40);
    int v28 = 138412546;
    uint64_t v29 = v20;
    __int16 v30 = 2112;
    double v31 = v21;
    id v17 = "posted error: %@:  %@";
    int v18 = v14;
    uint32_t v19 = 22;
  }

  _os_log_impl(&dword_1804F4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v28, v19);
LABEL_16:

  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = *(_BYTE *)(a1 + 80);
  unint64_t v22 = _OctagonSignpostGetNanoseconds(*(void *)(a1 + 64), *(void *)(a1 + 72));
  _OctagonSignpostLogSystem();
  BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v24 = v23;
  os_signpost_id_t v25 = *(void *)(a1 + 64);
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    int v26 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    int v28 = 67240192;
    LODWORD(v29) = v26;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v25,  "PerformedCDPStateMachineRun",  " OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerfor medCDPStateMachineRun}d ",  (uint8_t *)&v28,  8u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 134218496;
    int v27 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    uint64_t v29 = *(void *)(a1 + 64);
    __int16 v30 = 2048;
    double v31 = (double)v22 / 1000000000.0;
    __int16 v32 = 1026;
    int v33 = v27;
    _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformedCDPStateMachineRun  OctagonSignpostNamePerformedCDPStateMachineRun=%{public,signpost.tele metry:number1,name=OctagonSignpostNamePerformedCDPStateMachineRun}d ",  (uint8_t *)&v28,  0x1Cu);
  }

void __32__OTClique_fetchEscrowContents___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  secLogObjForScope("clique-fetchescrow");
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      int v25 = 138412290;
      id v26 = v12;
      BOOL v15 = "fetchEscrowContents errored: %@";
      uint64_t v16 = v13;
      uint32_t v17 = 12;
LABEL_6:
      _os_log_impl(&dword_1804F4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v25, v17);
    }
  }

  else if (v14)
  {
    LOWORD(v25) = 0;
    BOOL v15 = "fetchEscrowContents succeeded";
    uint64_t v16 = v13;
    uint32_t v17 = 2;
    goto LABEL_6;
  }

  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = v12 == 0LL;
  unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
  _OctagonSignpostLogSystem();
  uint32_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v19;
  os_signpost_id_t v21 = a1[6];
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    int v22 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
    int v25 = 67240192;
    LODWORD(v26) = v22;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v20,  OS_SIGNPOST_INTERVAL_END,  v21,  "FetchEscrowContents",  " OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowContents}d ",  (uint8_t *)&v25,  8u);
  }

  _OctagonSignpostLogSystem();
  BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 134218496;
    int v24 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
    id v26 = (id)a1[6];
    __int16 v27 = 2048;
    double v28 = (double)Nanoseconds / 1000000000.0;
    __int16 v29 = 1026;
    int v30 = v24;
    _os_log_impl( &dword_1804F4000,  v23,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: FetchEscrowContents  OctagonSignpostNameFetchEscrowContents=%{public,signpost.telemetry:number1,na me=OctagonSignpostNameFetchEscrowContents}d ",  (uint8_t *)&v25,  0x1Cu);
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __58__OTClique_fetchUserControllableViewsSyncingEnabledAsync___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a3;
  secLogObjForScope("clique-user-sync-async");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = v5;
      char v8 = "fetching user-controllable-sync-async status errored: %@";
LABEL_8:
      _os_log_impl(&dword_1804F4000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
    }
  }

  else if (v7)
  {
    id v9 = @"paused";
    if ((_DWORD)a2) {
      id v9 = @"enabled";
    }
    int v10 = 138412290;
    id v11 = v9;
    char v8 = "fetched user-controllable-sync-async status as : %@";
    goto LABEL_8;
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2);
}

void __53__OTClique_fetchUserControllableViewsSyncingEnabled___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a3;
  secLogObjForScope("clique-user-sync");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v12 = 138412290;
      int v13 = v5;
      char v8 = "fetching user-controllable-sync status errored: %@";
LABEL_8:
      _os_log_impl(&dword_1804F4000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);
    }
  }

  else if (v7)
  {
    id v9 = @"paused";
    if (a2) {
      id v9 = @"enabled";
    }
    int v12 = 138412290;
    int v13 = v9;
    char v8 = "fetched user-controllable-sync status as : %@";
    goto LABEL_8;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

void __61__OTClique_setOctagonUserControllableViewsSyncEnabled_error___block_invoke( uint64_t a1,  int a2,  void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a3;
  secLogObjForScope("clique-user-sync");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v11 = 138412290;
      int v12 = v5;
      _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "setting user-controllable-sync status errored: %@",  (uint8_t *)&v11,  0xCu);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v9 = v5;
    uint64_t v6 = *(os_log_s **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }

  else if (v7)
  {
    uint64_t v10 = @"paused";
    if (a2) {
      uint64_t v10 = @"enabled";
    }
    int v11 = 138412290;
    int v12 = v10;
    _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "setting user-controllable-sync status succeeded, now : %@",  (uint8_t *)&v11,  0xCu);
  }
}

void __36__OTClique_peerDeviceNamesByPeerID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  secLogObjForScope("clique");
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v15 = 138412290;
      id v16 = v6;
      id v9 = "peerDeviceNamesByPeerID errored: %@";
LABEL_6:
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 0xCu);
    }
  }

  else if (v8)
  {
    int v15 = 138412290;
    id v16 = v5;
    id v9 = "peerDeviceNamesByPeerID succeeded: %@";
    goto LABEL_6;
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
}

void __24__OTClique_leaveClique___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("clique-leaveClique");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "leaveClique errored: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v7 = v3;
    id v4 = *(os_log_s **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }

  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "leaveClique success.", (uint8_t *)&v8, 2u);
  }
}

void __40__OTClique_removeFriendsInClique_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("clique-removefriends");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "removeFriendsInClique failed: unable to remove friends: %@",  (uint8_t *)&v9,  0xCu);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v7 = v3;
    id v4 = *(os_log_s **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }

  else if (v5)
  {
    int v8 = *(void **)(a1 + 32);
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "octagon: friends removed: %@", (uint8_t *)&v9, 0xCu);
  }
}

void __37__OTClique__fetchCliqueStatus_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (v6)
  {
    *(void *)(v7 + 24) = -1LL;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    secLogObjForScope("clique-status");
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_debug_impl( &dword_1804F4000,  v8,  OS_LOG_TYPE_DEBUG,  "octagon clique status errored: %@",  (uint8_t *)&v9,  0xCu);
    }
  }

  else
  {
    *(void *)(v7 + 24) = a2;
  }
}

void __37__OTClique__fetchCliqueStatus_error___block_invoke_2(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v2 context];

  id v3 = (void *)v9;
  if (v9)
  {
    objc_msgSend((id)_fetchCliqueStatus_error__statusReturns, "objectForKeyedSubscript:");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 integerValue];
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      if (v6 == v7) {
        goto LABEL_8;
      }
    }

    else
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    }

    [MEMORY[0x189607968] numberWithInteger:v7];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [(id)_fetchCliqueStatus_error__statusReturns setObject:v8 forKeyedSubscript:v9];

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
LABEL_8:

    id v3 = (void *)v9;
    goto LABEL_9;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
LABEL_9:
}

void __37__OTClique__fetchCliqueStatus_error___block_invoke_248()
{
  dispatch_queue_t v0 = dispatch_queue_create("status_returns", 0LL);
  v1 = (void *)_fetchCliqueStatus_error__statusReturnsQueue;
  _fetchCliqueStatus_error__statusReturnsQueue = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x189603FC8] dictionary];
  id v3 = (void *)_fetchCliqueStatus_error__statusReturns;
  _fetchCliqueStatus_error__statusReturns = v2;
}

void __117__OTClique_resetAndEstablish_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_accountSettings_isGuitarfish_error___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    secLogObjForScope("clique-resetandestablish");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "resetAndEstablish returned an error: %@",  (uint8_t *)&v7,  0xCu);
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3 == 0LL;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __22__OTClique_establish___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    secLogObjForScope("clique-establish");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "establish returned an error: %@", (uint8_t *)&v7, 0xCu);
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3 == 0LL;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __35__OTClique_cliqueMemberIdentifier___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    secLogObjForScope("SecError");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl( &dword_1804F4000,  v8,  OS_LOG_TYPE_DEFAULT,  "octagon: Failed to fetch octagon peer ID: %@",  (uint8_t *)&v13,  0xCu);
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a3);
    id SecurityAnalyticsReporterRTCClass = getSecurityAnalyticsReporterRTCClass();
    uint64_t v10 = a1[4];
    BOOL v11 = 0LL;
    id v12 = v7;
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a2);
    id SecurityAnalyticsReporterRTCClass = getSecurityAnalyticsReporterRTCClass();
    uint64_t v10 = a1[4];
    BOOL v11 = v6 != 0LL;
    id v12 = 0LL;
  }

  [SecurityAnalyticsReporterRTCClass sendMetricWithEvent:v10 success:v11 error:v12];
}

+ (BOOL)platformSupportsSOS
{
  int IsSOSFeatureEnabled = OctagonIsSOSFeatureEnabled();
  if (IsSOSFeatureEnabled) {
    LOBYTE(IsSOSFeatureEnabled) = !SOSCompatibilityModeEnabled();
  }
  return IsSOSFeatureEnabled;
}

+ (id)newFriendsWithContextData:(id)a3 error:(id *)a4
{
  return +[OTClique newFriendsWithContextData:resetReason:error:]( &OBJC_CLASS___OTClique,  "newFriendsWithContextData:resetReason:error:",  a3,  1LL,  a4);
}

+ (id)newFriendsWithContextData:(id)a3 resetReason:(int64_t)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  secLogObjForScope("clique-newfriends");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [v7 context];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 altDSID];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    os_signpost_id_t v35 = (os_signpost_id_t)v9;
    __int16 v36 = 2112;
    double v37 = *(double *)&v10;
    _os_log_impl( &dword_1804F4000,  v8,  OS_LOG_TYPE_DEFAULT,  "makeNewFriends invoked using context: %@, altdsid: %@",  buf,  0x16u);
  }

  _OctagonSignpostLogSystem();
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  uint64_t v13 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v14;
  unint64_t v16 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "MakeNewFriends",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v35 = v12;
    _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: MakeNewFriends  enableTelemetry=YES ",  buf,  0xCu);
  }

  int v18 = -[OTClique initWithContextData:](objc_alloc(&OBJC_CLASS___OTClique), "initWithContextData:", v7);
  id v33 = 0LL;
  -[OTClique resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:]( v18,  "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:",  a4,  0,  0,  0,  0,  [v7 isGuitarfish],  &v33);
  id v19 = v33;
  secLogObjForScope("clique-newfriends");
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      *(_DWORD *)__int128 buf = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_1804F4000, v20, OS_LOG_TYPE_DEFAULT, "account reset failed: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v19;
    }
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v12, v13);
    _OctagonSignpostLogSystem();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v24 = v23;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)__int128 buf = 67240192;
      LODWORD(v35) = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v12,  "MakeNewFriends",  " OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=OctagonSignpostNameMakeNewFriends}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      os_signpost_id_t v35 = v12;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = 0;
      _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: MakeNewFriends  OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=Octag onSignpostNameMakeNewFriends}d ",  buf,  0x1Cu);
    }

    id v26 = 0LL;
  }

  else
  {
    if (v21)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_1804F4000, v20, OS_LOG_TYPE_DEFAULT, "Octagon account reset succeeded", buf, 2u);
    }

    secLogObjForScope("clique-newfriends");
    __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_1804F4000, v27, OS_LOG_TYPE_DEFAULT, "makeNewFriends complete", buf, 2u);
    }

    unint64_t v28 = _OctagonSignpostGetNanoseconds(v12, v13);
    _OctagonSignpostLogSystem();
    __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v30 = v29;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_DWORD *)__int128 buf = 67240192;
      LODWORD(v35) = 1;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v30,  OS_SIGNPOST_INTERVAL_END,  v12,  "MakeNewFriends",  " OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=OctagonSignpostNameMakeNewFriends}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      os_signpost_id_t v35 = v12;
      __int16 v36 = 2048;
      double v37 = (double)v28 / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = 1;
      _os_log_impl( &dword_1804F4000,  v31,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: MakeNewFriends  OctagonSignpostNameMakeNewFriends=%{public,signpost.telemetry:number1,name=Octag onSignpostNameMakeNewFriends}d ",  buf,  0x1Cu);
    }

    id v26 = v18;
  }

  return v26;
}

+ (BOOL)isCloudServicesAvailable
{
  if (!CloudServicesLibraryCore_frameworkLibrary) {
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = CloudServicesLibraryCore_frameworkLibrary;
  if (__PAIR128__(CloudServicesLibraryCore_frameworkLibrary, isCloudServicesAvailable_onceToken) < 0xFFFFFFFFFFFFFFFFLL) {
    dispatch_once(&isCloudServicesAvailable_onceToken, &__block_literal_global_4813);
  }
  return v2 != 0;
}

+ (id)performEscrowRecoveryWithContextData:(id)a3 escrowArguments:(id)a4 error:(id *)a5
{
  uint64_t v128 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (+[OTClique isCloudServicesAvailable](&OBJC_CLASS___OTClique, "isCloudServicesAvailable"))
  {
    _OctagonSignpostLogSystem();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);
    uint64_t v107 = mach_continuous_time();

    _OctagonSignpostLogSystem();
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v12 = v11;
    unint64_t v108 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "PerformEscrowRecovery",  " enableTelemetry=YES ",  buf,  2u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PerformEscrowRecovery  enableTelemetry=YES ",  buf,  0xCu);
    }

    v112 = -[OTClique initWithContextData:](objc_alloc(&OBJC_CLASS___OTClique), "initWithContextData:", v7);
    secLogObjForScope("clique-recovery");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      [v7 context];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 altDSID];
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&_BYTE buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl( &dword_1804F4000,  v14,  OS_LOG_TYPE_DEFAULT,  "attempting an escrow recovery for context:%@, altdsid:%@",  buf,  0x16u);
    }

    [v7 sbd];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = v17;
    if (v17) {
      id v111 = v17;
    }
    else {
      id v111 = objc_alloc_init((Class)getSecureBackupClass());
    }

    _OctagonSignpostLogSystem();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v21 = os_signpost_id_generate(v20);
    uint64_t v22 = mach_continuous_time();

    _OctagonSignpostLogSystem();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v24 = v23;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_BEGIN,  v21,  "PerformRecoveryFromSBD",  " enableTelemetry=YES ",  buf,  2u);
    }

    _OctagonSignpostLogSystem();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PerformRecoveryFromSBD  enableTelemetry=YES ",  buf,  0xCu);
    }

    id v117 = 0LL;
    [v111 recoverWithInfo:v8 results:&v117];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    id v110 = v117;
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v21, v22);
    _OctagonSignpostLogSystem();
    unint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    __int16 v29 = v28;
    if (v21 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v28))
    {
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v26 == 0LL;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v29,  OS_SIGNPOST_INTERVAL_END,  v21,  "PerformRecoveryFromSBD",  " OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRe coveryFromSBD}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(double *)&buf[14] = (double)Nanoseconds / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v125) = v26 == 0LL;
      _os_log_impl( &dword_1804F4000,  v30,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformRecoveryFromSBD  OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:nu mber1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ",  buf,  0x1Cu);
    }

    if (v26)
    {
      secLogObjForScope("clique-recovery");
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v26;
        _os_log_impl(&dword_1804F4000, v31, OS_LOG_TYPE_DEFAULT, "sbd escrow recovery failed: %@", buf, 0xCu);
      }

      if (a5) {
        *a5 = v26;
      }
      unint64_t v32 = _OctagonSignpostGetNanoseconds(v10, v107);
      _OctagonSignpostLogSystem();
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v34 = v33;
      if (v108 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v33))
      {
        *(void *)__int128 buf = 67240192LL;
        _os_signpost_emit_with_name_impl( &dword_1804F4000,  v34,  OS_SIGNPOST_INTERVAL_END,  v10,  "PerformEscrowRecovery",  " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformE scrowRecovery}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      os_signpost_id_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(double *)&buf[14] = (double)v32 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v125) = 0;
        _os_log_impl( &dword_1804F4000,  v35,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:nu mber1,name=OctagonSignpostNamePerformEscrowRecovery}d ",  buf,  0x1Cu);
      }

      id v19 = 0LL;
      id v109 = 0LL;
      goto LABEL_131;
    }

    *(void *)__int128 buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    __int16 v36 = (void *)getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
    v125 = (uint64_t (*)(uint64_t, uint64_t))getkSecureBackupRecoveryKeyKeySymbolLoc_ptr;
    if (!getkSecureBackupRecoveryKeyKeySymbolLoc_ptr)
    {
      double v37 = CloudServicesLibrary();
      __int16 v36 = dlsym(v37, "kSecureBackupRecoveryKeyKey");
      *(void *)(*(void *)&buf[8] + 24LL) = v36;
      getkSecureBackupRecoveryKeyKeySymbolLoc_ptr = (uint64_t)v36;
    }

    _Block_object_dispose(buf, 8);
    if (v36)
    {
      uint64_t v106 = [v8 objectForKeyedSubscript:*v36];
      *(void *)__int128 buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      __int16 v38 = (void *)getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
      v125 = (uint64_t (*)(uint64_t, uint64_t))getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr;
      if (!getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr)
      {
        int v39 = CloudServicesLibrary();
        __int16 v38 = dlsym(v39, "kSecureBackupUsesRecoveryKeyKey");
        *(void *)(*(void *)&buf[8] + 24LL) = v38;
        getkSecureBackupUsesRecoveryKeyKeySymbolLoc_ptr = (uint64_t)v38;
      }

      _Block_object_dispose(buf, 8);
      if (v38)
      {
        [v8 objectForKeyedSubscript:*v38];
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        if (v106 || [v105 BOOLValue])
        {
          id v116 = 0LL;
          uint64_t v40 = -[OTClique fetchCliqueStatus:](v112, "fetchCliqueStatus:", &v116);
          id v41 = v116;
          if (!v40)
          {
            id v109 = v41;
            secLogObjForScope("clique-recovery");
            double v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( &dword_1804F4000,  v43,  OS_LOG_TYPE_DEFAULT,  "recovery key used during secure backup recovery, skipping bottle check",  buf,  2u);
            }

            secLogObjForScope("clique-recovery");
            __int16 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138412290;
              *(void *)&uint8_t buf[4] = v112;
              _os_log_impl(&dword_1804F4000, v44, OS_LOG_TYPE_DEFAULT, "recovery complete: %@", buf, 0xCu);
            }

            unint64_t v45 = _OctagonSignpostGetNanoseconds(v10, v107);
            _OctagonSignpostLogSystem();
            uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            uint64_t v47 = v46;
            if (v108 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v46))
            {
              *(_DWORD *)__int128 buf = 67240192;
              *(_DWORD *)&uint8_t buf[4] = v112 != 0LL;
              _os_signpost_emit_with_name_impl( &dword_1804F4000,  v47,  OS_SIGNPOST_INTERVAL_END,  v10,  "PerformEscrowRecovery",  " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePe rformEscrowRecovery}d ",  buf,  8u);
            }

            _OctagonSignpostLogSystem();
            char v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 134218496;
              *(void *)&uint8_t buf[4] = v10;
              *(_WORD *)&_BYTE buf[12] = 2048;
              *(double *)&buf[14] = (double)v45 / 1000000000.0;
              *(_WORD *)&buf[22] = 1026;
              LODWORD(v125) = v112 != 0LL;
              _os_log_impl( &dword_1804F4000,  v48,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.teleme try:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ",  buf,  0x1Cu);
            }

            id v19 = v112;
            goto LABEL_130;
          }

          __int16 v42 = v41;
        }

        else
        {
          __int16 v42 = 0LL;
        }

        id v115 = v42;
        v104 = -[OTClique makeOTControl:](v112, "makeOTControl:", &v115);
        id v109 = v115;

        if (!v104)
        {
          secLogObjForScope("clique-recovery");
          v86 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = v109;
            _os_log_impl(&dword_1804F4000, v86, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", buf, 0xCu);
          }

          if (a5) {
            *a5 = v109;
          }
          unint64_t v87 = _OctagonSignpostGetNanoseconds(v10, v107);
          _OctagonSignpostLogSystem();
          v88 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v89 = v88;
          if (v108 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v88))
          {
            *(void *)__int128 buf = 67240192LL;
            _os_signpost_emit_with_name_impl( &dword_1804F4000,  v89,  OS_SIGNPOST_INTERVAL_END,  v10,  "PerformEscrowRecovery",  " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerf ormEscrowRecovery}d ",  buf,  8u);
          }

          _OctagonSignpostLogSystem();
          v90 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 134218496;
            *(void *)&uint8_t buf[4] = v10;
            *(_WORD *)&_BYTE buf[12] = 2048;
            *(double *)&buf[14] = (double)v87 / 1000000000.0;
            *(_WORD *)&buf[22] = 1026;
            LODWORD(v125) = 0;
            _os_log_impl( &dword_1804F4000,  v90,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetr y:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ",  buf,  0x1Cu);
          }

          id v19 = 0LL;
          goto LABEL_129;
        }

        uint64_t v103 = [v110 objectForKeyedSubscript:@"bottleID"];
        [v110 objectForKeyedSubscript:@"bottleValid"];
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        [v110 objectForKeyedSubscript:@"EscrowServiceEscrowData"];
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
        [v49 objectForKeyedSubscript:@"BottledPeerEntropy"];
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        if (v102 && v103 && [v101 isEqualToString:@"valid"])
        {
          secLogObjForScope("clique-recovery");
          int v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = v103;
            _os_log_impl(&dword_1804F4000, v50, OS_LOG_TYPE_DEFAULT, "recovering from bottle: %@", buf, 0xCu);
          }

          *(void *)__int128 buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          v125 = __Block_byref_object_copy__4755;
          v126 = __Block_byref_object_dispose__4756;
          id v127 = 0LL;
          _OctagonSignpostLogSystem();
          uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_signpost_id_t v52 = os_signpost_id_generate(v51);
          uint64_t v53 = mach_continuous_time();

          _OctagonSignpostLogSystem();
          double v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          __int16 v55 = v54;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
          {
            *(_WORD *)v118 = 0;
            _os_signpost_emit_with_name_impl( &dword_1804F4000,  v55,  OS_SIGNPOST_INTERVAL_BEGIN,  v52,  "PerformOctagonJoin",  " enableTelemetry=YES ",  v118,  2u);
          }

          _OctagonSignpostLogSystem();
          id v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v118 = 134217984;
            os_signpost_id_t v119 = v52;
            _os_log_impl( &dword_1804F4000,  v56,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PerformOctagonJoin  enableTelemetry=YES ",  v118,  0xCu);
          }

          uint64_t v57 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
          v114[0] = MEMORY[0x1895F87A8];
          v114[1] = 3221225472LL;
          v114[2] = __71__OTClique_performEscrowRecoveryWithContextData_escrowArguments_error___block_invoke;
          v114[3] = &unk_189672C48;
          v114[4] = buf;
          [v104 restoreFromBottle:v57 entropy:v102 bottleID:v103 reply:v114];

          uint64_t v58 = *(void *)(*(void *)&buf[8] + 40LL);
          unint64_t v59 = _OctagonSignpostGetNanoseconds(v52, v53);
          _OctagonSignpostLogSystem();
          id v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v61 = v60;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
          {
            *(_DWORD *)v118 = 67240192;
            LODWORD(v119) = v58 == 0;
            _os_signpost_emit_with_name_impl( &dword_1804F4000,  v61,  OS_SIGNPOST_INTERVAL_END,  v52,  "PerformOctagonJoin",  " OctagonSignpostNamePerformOctagonJoin=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoin}d ",  v118,  8u);
          }

          _OctagonSignpostLogSystem();
          uint64_t v62 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v118 = 134218496;
            os_signpost_id_t v119 = v52;
            __int16 v120 = 2048;
            double v121 = (double)v59 / 1000000000.0;
            __int16 v122 = 1026;
            BOOL v123 = v58 == 0;
            _os_log_impl( &dword_1804F4000,  v62,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformOctagonJoin  OctagonSignpostNamePerformOctagonJoin=%{public,signpost.telemetry:numb er1,name=OctagonSignpostNamePerformOctagonJoin}d ",  v118,  0x1Cu);
          }

          uint64_t v63 = *(void **)(*(void *)&buf[8] + 40LL);
          if (v63)
          {
            if (a5) {
              *a5 = v63;
            }
            unint64_t v64 = _OctagonSignpostGetNanoseconds(v10, v107);
            _OctagonSignpostLogSystem();
            uint64_t v65 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            uint64_t v66 = v65;
            if (v108 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
            {
              *(_DWORD *)v118 = 67240192;
              LODWORD(v119) = 0;
              _os_signpost_emit_with_name_impl( &dword_1804F4000,  v66,  OS_SIGNPOST_INTERVAL_END,  v10,  "PerformEscrowRecovery",  " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePe rformEscrowRecovery}d ",  v118,  8u);
            }

            _OctagonSignpostLogSystem();
            double v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v118 = 134218496;
              os_signpost_id_t v119 = v10;
              __int16 v120 = 2048;
              double v121 = (double)v64 / 1000000000.0;
              __int16 v122 = 1026;
              BOOL v123 = 0;
              _os_log_impl( &dword_1804F4000,  v67,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.teleme try:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ",  v118,  0x1Cu);
            }

            _Block_object_dispose(buf, 8);
LABEL_105:
            id v19 = 0LL;
LABEL_128:

            v90 = (os_log_s *)v103;
LABEL_129:

LABEL_130:
            os_signpost_id_t v35 = (os_log_s *)v106;
LABEL_131:

            goto LABEL_132;
          }

          _Block_object_dispose(buf, 8);
        }

        else
        {
          secLogObjForScope("clique-recovery");
          __int16 v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = v103;
            _os_log_impl( &dword_1804F4000,  v68,  OS_LOG_TYPE_DEFAULT,  "bottle %@ is not valid, resetting octagon",  buf,  0xCu);
          }

          _OctagonSignpostLogSystem();
          double v69 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_signpost_id_t v70 = os_signpost_id_generate(v69);
          uint64_t v71 = mach_continuous_time();

          _OctagonSignpostLogSystem();
          __int16 v72 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v73 = v72;
          if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
          {
            *(_WORD *)__int128 buf = 0;
            _os_signpost_emit_with_name_impl( &dword_1804F4000,  v73,  OS_SIGNPOST_INTERVAL_BEGIN,  v70,  "PerformResetAndEstablishAfterFailedBottle",  " enableTelemetry=YES ",  buf,  2u);
          }

          _OctagonSignpostLogSystem();
          __int16 v74 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 134217984;
            *(void *)&uint8_t buf[4] = v70;
            _os_log_impl( &dword_1804F4000,  v74,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PerformResetAndEstablishAfterFailedBottle  enableTelemetry=YES ",  buf,  0xCu);
          }

          id v113 = 0LL;
          -[OTClique resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:]( v112,  "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:",  3,  0,  0,  0,  0,  [v7 isGuitarfish],  &v113);
          id v75 = v113;
          unint64_t v76 = _OctagonSignpostGetNanoseconds(v70, v71);
          _OctagonSignpostLogSystem();
          v77 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          v78 = v77;
          if (v70 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v77))
          {
            *(_DWORD *)__int128 buf = 67240192;
            *(_DWORD *)&uint8_t buf[4] = v75 == 0LL;
            _os_signpost_emit_with_name_impl( &dword_1804F4000,  v78,  OS_SIGNPOST_INTERVAL_END,  v70,  "PerformResetAndEstablishAfterFailedBottle",  " OctagonSignpostNamePerformResetAndEstablishAfterFailedBottle=%{public,signpost.telemetry:number1,name=Oct agonSignpostNamePerformResetAndEstablishAfterFailedBottle}d ",  buf,  8u);
          }

          _OctagonSignpostLogSystem();
          v79 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 134218496;
            *(void *)&uint8_t buf[4] = v70;
            *(_WORD *)&_BYTE buf[12] = 2048;
            *(double *)&buf[14] = (double)v76 / 1000000000.0;
            *(_WORD *)&buf[22] = 1026;
            LODWORD(v125) = v75 == 0LL;
            _os_log_impl( &dword_1804F4000,  v79,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformResetAndEstablishAfterFailedBottle  OctagonSignpostNamePerformResetAndEstablishAfte rFailedBottle=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformResetAndEstablishAfterFailedBottle}d ",  buf,  0x1Cu);
          }

          secLogObjForScope("clique-recovery");
          v80 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          BOOL v81 = os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT);
          if (v75)
          {
            if (v81)
            {
              *(_DWORD *)__int128 buf = 138412290;
              *(void *)&uint8_t buf[4] = v75;
              _os_log_impl(&dword_1804F4000, v80, OS_LOG_TYPE_DEFAULT, "failed to reset octagon: %@", buf, 0xCu);
            }

            if (a5) {
              *a5 = v75;
            }
            unint64_t v82 = _OctagonSignpostGetNanoseconds(v10, v107);
            _OctagonSignpostLogSystem();
            v83 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            v84 = v83;
            if (v108 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v83))
            {
              *(void *)__int128 buf = 67240192LL;
              _os_signpost_emit_with_name_impl( &dword_1804F4000,  v84,  OS_SIGNPOST_INTERVAL_END,  v10,  "PerformEscrowRecovery",  " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePe rformEscrowRecovery}d ",  buf,  8u);
            }

            _OctagonSignpostLogSystem();
            v85 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 134218496;
              *(void *)&uint8_t buf[4] = v10;
              *(_WORD *)&_BYTE buf[12] = 2048;
              *(double *)&buf[14] = (double)v82 / 1000000000.0;
              *(_WORD *)&buf[22] = 1026;
              LODWORD(v125) = 0;
              _os_log_impl( &dword_1804F4000,  v85,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.teleme try:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ",  buf,  0x1Cu);
            }

            goto LABEL_105;
          }

          if (v81)
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl(&dword_1804F4000, v80, OS_LOG_TYPE_DEFAULT, "reset octagon succeeded", buf, 2u);
          }
        }

        secLogObjForScope("clique-recovery");
        v91 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v112;
          _os_log_impl(&dword_1804F4000, v91, OS_LOG_TYPE_DEFAULT, "recovery complete: %@", buf, 0xCu);
        }

        unint64_t v92 = _OctagonSignpostGetNanoseconds(v10, v107);
        _OctagonSignpostLogSystem();
        v93 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        v94 = v93;
        if (v108 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v93))
        {
          *(_DWORD *)__int128 buf = 67240192;
          *(_DWORD *)&uint8_t buf[4] = v112 != 0LL;
          _os_signpost_emit_with_name_impl( &dword_1804F4000,  v94,  OS_SIGNPOST_INTERVAL_END,  v10,  "PerformEscrowRecovery",  " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerfor mEscrowRecovery}d ",  buf,  8u);
        }

        _OctagonSignpostLogSystem();
        v95 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 134218496;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&_BYTE buf[12] = 2048;
          *(double *)&buf[14] = (double)v92 / 1000000000.0;
          *(_WORD *)&buf[22] = 1026;
          LODWORD(v125) = v112 != 0LL;
          _os_log_impl( &dword_1804F4000,  v95,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry: number1,name=OctagonSignpostNamePerformEscrowRecovery}d ",  buf,  0x1Cu);
        }

        id v19 = v112;
        goto LABEL_128;
      }

      [MEMORY[0x1896077D8] currentHandler];
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:"NSString *getkSecureBackupUsesRecoveryKeyKey(void)"];
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v99,  "handleFailureInFunction:file:lineNumber:description:",  v100,  @"OTClique.m",  83,  @"%s",  dlerror());
    }

    else
    {
      [MEMORY[0x1896077D8] currentHandler];
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:"NSString *getkSecureBackupRecoveryKeyKey(void)"];
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v97,  "handleFailureInFunction:file:lineNumber:description:",  v98,  @"OTClique.m",  82,  @"%s",  dlerror());
    }

    __break(1u);
  }

  if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-4 userInfo:0];
    id v19 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v19 = 0LL;
  }

+ (id)fetchEscrowRecordsInternal:(id)a3 error:(id *)a4
{
  v31[2] = *(id *)MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope("clique-fetchrecords");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [v5 context];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 altDSID];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "fetching escrow records for context:%@, altdsid:%@",  buf,  0x16u);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  __int16 v29 = __Block_byref_object_copy__4755;
  int v30 = __Block_byref_object_dispose__4756;
  v31[0] = 0LL;
  uint64_t v20 = 0LL;
  os_signpost_id_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  BOOL v23 = __Block_byref_object_copy__4755;
  int v24 = __Block_byref_object_dispose__4756;
  id v25 = 0LL;
  id obj = 0LL;
  [v5 makeOTControl:&obj];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v31, obj);
  if (v9)
  {
    os_signpost_id_t v10 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v5);
    uint64_t v11 = [v5 escrowFetchSource];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __45__OTClique_fetchEscrowRecordsInternal_error___block_invoke;
    v18[3] = &unk_189667988;
    v18[4] = buf;
    v18[5] = &v20;
    [v9 fetchEscrowRecords:v10 source:v11 reply:v18];

    if (a4)
    {
      os_signpost_id_t v12 = *(void **)(*(void *)&buf[8] + 40LL);
      if (v12) {
        *a4 = v12;
      }
    }

    secLogObjForScope("clique-fetchrecords");
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v26 = 0;
      _os_log_impl(&dword_1804F4000, v13, OS_LOG_TYPE_DEFAULT, "fetchEscrowRecords complete", v26, 2u);
    }

    id v14 = (id)v21[5];
  }

  else
  {
    secLogObjForScope("clique-fetchrecords");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)&buf[8] + 40LL);
      *(_DWORD *)id v26 = 138412290;
      uint64_t v27 = v16;
      _os_log_impl(&dword_1804F4000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v26, 0xCu);
    }

    id v14 = 0LL;
    if (a4) {
      *a4 = *(id *)(*(void *)&buf[8] + 40LL);
    }
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(buf, 8);

  return v14;
}

+ (id)findOptimalBottleIDsWithContextData:(id)a3 error:(id *)a4
{
  v56[2] = *(id *)MEMORY[0x1895F89C0];
  id v5 = a3;
  secLogObjForScope("clique-findbottle");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [v5 context];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 altDSID];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "finding optimal bottles for context:%@, altdsid:%@",  buf,  0x16u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  uint64_t v11 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  os_signpost_id_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = v12;
  unint64_t v14 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "FindOptimalBottleIDsWithContextData",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: FindOptimalBottleIDsWithContextData  enableTelemetry=YES ",  buf,  0xCu);
  }

  *(void *)__int128 buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  double v54 = __Block_byref_object_copy__4755;
  __int16 v55 = __Block_byref_object_dispose__4756;
  v56[0] = 0LL;
  uint64_t v41 = 0LL;
  __int16 v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  __int16 v44 = __Block_byref_object_copy__4755;
  unint64_t v45 = __Block_byref_object_dispose__4756;
  id v46 = 0LL;
  uint64_t v35 = 0LL;
  __int16 v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  __int16 v38 = __Block_byref_object_copy__4755;
  int v39 = __Block_byref_object_dispose__4756;
  id v40 = 0LL;
  id obj = 0LL;
  [v5 makeOTControl:&obj];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v56, obj);
  if (v16)
  {
    uint64_t v17 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v5);
    uint64_t v18 = [v5 escrowFetchSource];
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = __54__OTClique_findOptimalBottleIDsWithContextData_error___block_invoke;
    v33[3] = &unk_1896679B0;
    uint8_t v33[4] = buf;
    v33[5] = &v41;
    v33[6] = &v35;
    [v16 fetchAllViableBottles:v17 source:v18 reply:v33];

    if (a4)
    {
      id v19 = *(void **)(*(void *)&buf[8] + 40LL);
      if (v19) {
        *a4 = v19;
      }
    }

    uint64_t v20 = objc_alloc_init(&OBJC_CLASS___OTBottleIDs);
    -[OTBottleIDs setPreferredBottleIDs:](v20, "setPreferredBottleIDs:", v42[5]);
    -[OTBottleIDs setPartialRecoveryBottleIDs:](v20, "setPartialRecoveryBottleIDs:", v36[5]);
    secLogObjForScope("clique-findbottle");
    os_signpost_id_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, "findOptimalBottleIDsWithContextData complete", v47, 2u);
    }

    uint64_t v22 = *(void *)(*(void *)&buf[8] + 40LL);
    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v10, v11);
    _OctagonSignpostLogSystem();
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v25 = v24;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_DWORD *)uint64_t v47 = 67240192;
      LODWORD(v48) = v22 == 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v25,  OS_SIGNPOST_INTERVAL_END,  v10,  "FindOptimalBottleIDsWithContextData",  " OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{public,signpost.telemetry:number1,name=OctagonSignpost NameFindOptimalBottleIDsWithContextData}d ",  v47,  8u);
    }

    _OctagonSignpostLogSystem();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v47 = 134218496;
      os_signpost_id_t v48 = v10;
      __int16 v49 = 2048;
      double v50 = (double)Nanoseconds / 1000000000.0;
      __int16 v51 = 1026;
      BOOL v52 = v22 == 0;
      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: FindOptimalBottleIDsWithContextData  OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{pu blic,signpost.telemetry:number1,name=OctagonSignpostNameFindOptimalBottleIDsWithContextData}d ",  v47,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("clique-findbottle");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v28 = *(void *)(*(void *)&buf[8] + 40LL);
      *(_DWORD *)uint64_t v47 = 138412290;
      os_signpost_id_t v48 = v28;
      _os_log_impl(&dword_1804F4000, v27, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v47, 0xCu);
    }

    if (a4) {
      *a4 = *(id *)(*(void *)&buf[8] + 40LL);
    }
    unint64_t v29 = _OctagonSignpostGetNanoseconds(v10, v11);
    _OctagonSignpostLogSystem();
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = v30;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_DWORD *)uint64_t v47 = 67240192;
      LODWORD(v48) = 0;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v31,  OS_SIGNPOST_INTERVAL_END,  v10,  "FindOptimalBottleIDsWithContextData",  " OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{public,signpost.telemetry:number1,name=OctagonSignpost NameFindOptimalBottleIDsWithContextData}d ",  v47,  8u);
    }

    _OctagonSignpostLogSystem();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v47 = 134218496;
      os_signpost_id_t v48 = v10;
      __int16 v49 = 2048;
      double v50 = (double)v29 / 1000000000.0;
      __int16 v51 = 1026;
      BOOL v52 = 0;
      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: FindOptimalBottleIDsWithContextData  OctagonSignpostNameFindOptimalBottleIDsWithContextData=%{pu blic,signpost.telemetry:number1,name=OctagonSignpostNameFindOptimalBottleIDsWithContextData}d ",  v47,  0x1Cu);
    }

    uint64_t v20 = 0LL;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(buf, 8);
  return v20;
}

+ (id)recoverWithContextData:(id)a3 bottleID:(id)a4 escrowedEntropy:(id)a5 error:(id *)a6
{
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "replaced by performEscrowRecoveryWithContextData:escrowArguments:error: remove call",  v8,  2u);
  }

  return 0LL;
}

+ (void)setNewRecoveryKeyWithData:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v46 = a3;
  id v45 = a4;
  id v7 = a5;
  secLogObjForScope("octagon-setrecoverykey");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [v46 context];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412290;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl( &dword_1804F4000,  v8,  OS_LOG_TYPE_DEFAULT,  "setNewRecoveryKeyWithData invoked for context: %@",  buf,  0xCu);
  }

  os_signpost_id_t v10 = (void *)objc_opt_new();
  _OctagonSignpostLogSystem();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  uint64_t v13 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  unint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v14;
  unint64_t v16 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  v12,  "SetNewRecoveryKeyWithData",  " enableTelemetry=YES ",  buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    *(void *)&uint8_t buf[4] = v12;
    _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: SetNewRecoveryKeyWithData  enableTelemetry=YES ",  buf,  0xCu);
  }

  uint64_t v55 = 0LL;
  id v56 = &v55;
  uint64_t v57 = 0x2020000000LL;
  char v58 = 0;
  id v54 = 0LL;
  SecRKCreateRecoveryKeyWithError(v45, &v54);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v54;
  if (v18)
  {
    id v53 = 0LL;
    [v46 makeOTControl:&v53];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = v53;
    if (v20)
    {
      uint64_t v22 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v46);
      v47[0] = MEMORY[0x1895F87A8];
      v47[1] = 3221225472LL;
      v47[2] = __56__OTClique_setNewRecoveryKeyWithData_recoveryKey_reply___block_invoke;
      v47[3] = &unk_189667A00;
      os_signpost_id_t v51 = v12;
      uint64_t v52 = v13;
      double v50 = &v55;
      id v49 = v7;
      id v48 = v18;
      [v20 createRecoveryKey:v22 recoveryKey:v45 reply:v47];
    }

    else
    {
      secLogObjForScope("octagon-setrecoverykey");
      int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl(&dword_1804F4000, v30, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", buf, 0xCu);
      }

      unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v12, v13);
      _OctagonSignpostLogSystem();
      unint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      id v33 = v32;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        int v34 = *((unsigned __int8 *)v56 + 24);
        *(_DWORD *)__int128 buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v34;
        _os_signpost_emit_with_name_impl( &dword_1804F4000,  v33,  OS_SIGNPOST_INTERVAL_END,  v12,  "SetNewRecoveryKeyWithData",  " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetN ewRecoveryKeyWithData}d ",  buf,  8u);
      }

      _OctagonSignpostLogSystem();
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        int v36 = *((unsigned __int8 *)v56 + 24);
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(double *)&buf[14] = (double)Nanoseconds / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v60) = v36;
        _os_log_impl( &dword_1804F4000,  v35,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.tele metry:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ",  buf,  0x1Cu);
      }

      (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v21);
    }

    unint64_t v29 = 0LL;
  }

  else
  {
    secLogObjForScope("SecError");
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_impl( &dword_1804F4000,  v23,  OS_LOG_TYPE_DEFAULT,  "octagon-setrecoverykey, SecRKCreateRecoveryKeyWithError() failed: %@",  buf,  0xCu);
    }

    [v10 setObject:@"SecRKCreateRecoveryKeyWithError() failed" forKeyedSubscript:*MEMORY[0x1896075E0]];
    [v10 setObject:v19 forKeyedSubscript:*MEMORY[0x189607798]];
    BOOL v24 = +[OTClique isCloudServicesAvailable](&OBJC_CLASS___OTClique, "isCloudServicesAvailable");
    id v25 = (void *)MEMORY[0x189607870];
    if (v24)
    {
      *(void *)__int128 buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      id v26 = (id *)getkSecureBackupErrorDomainSymbolLoc_ptr;
      uint64_t v60 = getkSecureBackupErrorDomainSymbolLoc_ptr;
      if (!getkSecureBackupErrorDomainSymbolLoc_ptr)
      {
        uint64_t v27 = CloudServicesLibrary();
        id v26 = (id *)dlsym(v27, "kSecureBackupErrorDomain");
        *(void *)(*(void *)&buf[8] + 24LL) = v26;
        getkSecureBackupErrorDomainSymbolLoc_ptr = (uint64_t)v26;
      }

      _Block_object_dispose(buf, 8);
      if (!v26)
      {
        [MEMORY[0x1896077D8] currentHandler];
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
        [NSString stringWithUTF8String:"NSErrorDomain getkSecureBackupErrorDomain(void)"];
        __int16 v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( v43,  "handleFailureInFunction:file:lineNumber:description:",  v44,  @"OTClique.m",  77,  @"%s",  dlerror());

        __break(1u);
      }

      id v28 = *v26;
      [v25 errorWithDomain:v28 code:24 userInfo:v10];
      unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-4 userInfo:v10];
      unint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    }

    unint64_t v37 = _OctagonSignpostGetNanoseconds(v12, v13);
    _OctagonSignpostLogSystem();
    __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v39 = v38;
    if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      int v40 = *((unsigned __int8 *)v56 + 24);
      *(_DWORD *)__int128 buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = v40;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v39,  OS_SIGNPOST_INTERVAL_END,  v12,  "SetNewRecoveryKeyWithData",  " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNew RecoveryKeyWithData}d ",  buf,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218496;
      int v42 = *((unsigned __int8 *)v56 + 24);
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(double *)&buf[14] = (double)v37 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v60) = v42;
      _os_log_impl( &dword_1804F4000,  v41,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.teleme try:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ",  buf,  0x1Cu);
    }

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v29);
  }

  _Block_object_dispose(&v55, 8);
}

+ (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  secLogObjForScope("octagon-createcustodianrecoverykey");
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v7 context];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "createCustodianRecoveryKey invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  _OctagonSignpostLogSystem();
  os_signpost_id_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "CreateCustodianRecoveryKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: CreateCustodianRecoveryKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  id v33 = 0LL;
  [v7 makeOTControl:&v33];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v33;
  if (v18)
  {
    uint64_t v20 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __50__OTClique_createCustodianRecoveryKey_uuid_reply___block_invoke;
    v28[3] = &unk_189667A28;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p___int128 buf = &buf;
    id v29 = v9;
    [v18 createCustodianRecoveryKey:v20 uuid:v8 reply:v28];
  }

  else
  {
    secLogObjForScope("octagon-createcustodianrecoverykey");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)int v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v13,  "CreateCustodianRecoveryKey",  " OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreat eCustodianRecoveryKey}d ",  v34,  8u);
    }

    _OctagonSignpostLogSystem();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CreateCustodianRecoveryKey  OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.tele metry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ",  v34,  0x1Cu);
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0LL, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)recoverOctagonUsingCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  _OctagonSignpostLogSystem();
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "RecoverOctagonUsingCustodianRecoveryKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RecoverOctagonUsingCustodianRecoveryKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 0;
  id v32 = 0LL;
  [v7 makeOTControl:&v32];
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v32;
  secLogObjForScope("clique-custodianrecoverykey");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v33 = 0;
    _os_log_impl(&dword_1804F4000, v18, OS_LOG_TYPE_DEFAULT, "join using custodian recovery key", v33, 2u);
  }

  if (v16)
  {
    id v19 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __79__OTClique_recoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
    v27[3] = &unk_189667A50;
    os_signpost_id_t v30 = v11;
    uint64_t v31 = v12;
    p___int128 buf = &buf;
    id v28 = v9;
    [v16 joinWithCustodianRecoveryKey:v19 custodianRecoveryKey:v8 reply:v27];
  }

  else
  {
    secLogObjForScope("clique-custodianrecoverykey");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 138412290;
      os_signpost_id_t v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_1804F4000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v24 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)id v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v23,  OS_SIGNPOST_INTERVAL_END,  v11,  "RecoverOctagonUsingCustodianRecoveryKey",  " OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSign postNameRecoverOctagonUsingCustodianRecoveryKey}d ",  v33,  8u);
    }

    _OctagonSignpostLogSystem();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 134218496;
      int v26 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v34 = v11;
      __int16 v35 = 2048;
      double v36 = (double)Nanoseconds / 1000000000.0;
      __int16 v37 = 1026;
      int v38 = v26;
      _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNameRecoverOctagonUsingCustodianRecovery Key=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ",  v33,  0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)preflightRecoverOctagonUsingCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  _OctagonSignpostLogSystem();
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "PreflightRecoverOctagonUsingCustodianRecoveryKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PreflightRecoverOctagonUsingCustodianRecoveryKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 0;
  id v32 = 0LL;
  [v7 makeOTControl:&v32];
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v32;
  secLogObjForScope("clique-custodianrecoverykey");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v33 = 0;
    _os_log_impl(&dword_1804F4000, v18, OS_LOG_TYPE_DEFAULT, "preflight join using custodian recovery key", v33, 2u);
  }

  if (v16)
  {
    id v19 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __88__OTClique_preflightRecoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke;
    v27[3] = &unk_189667A50;
    os_signpost_id_t v30 = v11;
    uint64_t v31 = v12;
    p___int128 buf = &buf;
    id v28 = v9;
    [v16 preflightJoinWithCustodianRecoveryKey:v19 custodianRecoveryKey:v8 reply:v27];
  }

  else
  {
    secLogObjForScope("clique-custodianrecoverykey");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 138412290;
      os_signpost_id_t v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_1804F4000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v24 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)id v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v23,  OS_SIGNPOST_INTERVAL_END,  v11,  "PreflightRecoverOctagonUsingCustodianRecoveryKey",  " OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=Oc tagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ",  v33,  8u);
    }

    _OctagonSignpostLogSystem();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 134218496;
      int v26 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v34 = v11;
      __int16 v35 = 2048;
      double v36 = (double)Nanoseconds / 1000000000.0;
      __int16 v37 = 1026;
      int v38 = v26;
      _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PreflightRecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNamePreflightRecoverOctagonUsin gCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCu stodianRecoveryKey}d ",  v33,  0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)removeCustodianRecoveryKey:(id)a3 custodianRecoveryKeyUUID:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  secLogObjForScope("octagon-removecustodianrecoverykey");
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v7 context];
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "removeCustodianRecoveryKey invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  _OctagonSignpostLogSystem();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "RemoveCustodianRecoveryKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RemoveCustodianRecoveryKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  id v33 = 0LL;
  [v7 makeOTControl:&v33];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v33;
  if (v18)
  {
    uint64_t v20 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __70__OTClique_removeCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke;
    v28[3] = &unk_189667A50;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p___int128 buf = &buf;
    id v29 = v9;
    [v18 removeCustodianRecoveryKey:v20 uuid:v8 reply:v28];
  }

  else
  {
    secLogObjForScope("octagon-removecustodianrecoverykey");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v13,  "RemoveCustodianRecoveryKey",  " OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemov eCustodianRecoveryKey}d ",  v34,  8u);
    }

    _OctagonSignpostLogSystem();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RemoveCustodianRecoveryKey  OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.tele metry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ",  v34,  0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)checkCustodianRecoveryKey:(id)a3 custodianRecoveryKeyUUID:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  secLogObjForScope("octagon-checkcustodianrecoverykey");
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v7 context];
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "checkCustodianRecoveryKey invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  _OctagonSignpostLogSystem();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "CheckCustodianRecoveryKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: CheckCustodianRecoveryKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  id v33 = 0LL;
  [v7 makeOTControl:&v33];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v33;
  if (v18)
  {
    uint64_t v20 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __69__OTClique_checkCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke;
    v28[3] = &unk_189667A78;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p___int128 buf = &buf;
    id v29 = v9;
    [v18 checkCustodianRecoveryKey:v20 uuid:v8 reply:v28];
  }

  else
  {
    secLogObjForScope("octagon-checkcustodianrecoverykey");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v13,  "CheckCustodianRecoveryKey",  " OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckC ustodianRecoveryKey}d ",  v34,  8u);
    }

    _OctagonSignpostLogSystem();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CheckCustodianRecoveryKey  OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.teleme try:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ",  v34,  0x1Cu);
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0LL, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  secLogObjForScope("octagon-createinheritancekey");
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v7 context];
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "createInheritanceKey invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  _OctagonSignpostLogSystem();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "CreateInheritanceKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: CreateInheritanceKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  id v33 = 0LL;
  [v7 makeOTControl:&v33];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v33;
  if (v18)
  {
    uint64_t v20 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __44__OTClique_createInheritanceKey_uuid_reply___block_invoke;
    v28[3] = &unk_189667AA0;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p___int128 buf = &buf;
    id v29 = v9;
    [v18 createInheritanceKey:v20 uuid:v8 reply:v28];
  }

  else
  {
    secLogObjForScope("octagon-createinheritancekey");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v13,  "CreateInheritanceKey",  " OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ",  v34,  8u);
    }

    _OctagonSignpostLogSystem();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CreateInheritanceKey  OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number 1,name=OctagonSignpostNameCreateInheritanceKey}d ",  v34,  0x1Cu);
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0LL, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  secLogObjForScope("octagon-generateinheritancekey");
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v7 context];
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "generateInheritanceKey invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  _OctagonSignpostLogSystem();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "GenerateInheritanceKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: GenerateInheritanceKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  id v33 = 0LL;
  [v7 makeOTControl:&v33];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v33;
  if (v18)
  {
    uint64_t v20 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __46__OTClique_generateInheritanceKey_uuid_reply___block_invoke;
    v28[3] = &unk_189667AA0;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p___int128 buf = &buf;
    id v29 = v9;
    [v18 generateInheritanceKey:v20 uuid:v8 reply:v28];
  }

  else
  {
    secLogObjForScope("octagon-generateinheritancekey");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v13,  "GenerateInheritanceKey",  " OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateI nheritanceKey}d ",  v34,  8u);
    }

    _OctagonSignpostLogSystem();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: GenerateInheritanceKey  OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:nu mber1,name=OctagonSignpostNameGenerateInheritanceKey}d ",  v34,  0x1Cu);
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0LL, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  secLogObjForScope("octagon-storeinheritancekey");
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v7 context];
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "storeInheritanceKey invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  _OctagonSignpostLogSystem();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "StoreInheritanceKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: StoreInheritanceKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  id v33 = 0LL;
  [v7 makeOTControl:&v33];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v33;
  if (v18)
  {
    uint64_t v20 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __41__OTClique_storeInheritanceKey_ik_reply___block_invoke;
    v28[3] = &unk_189667A50;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p___int128 buf = &buf;
    id v29 = v9;
    [v18 storeInheritanceKey:v20 ik:v8 reply:v28];
  }

  else
  {
    secLogObjForScope("octagon-storeinheritancekey");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v13,  "StoreInheritanceKey",  " OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ",  v34,  8u);
    }

    _OctagonSignpostLogSystem();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: StoreInheritanceKey  OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1, name=OctagonSignpostNameStoreInheritanceKey}d ",  v34,  0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)recoverOctagonUsingInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  _OctagonSignpostLogSystem();
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "RecoverOctagonUsingInheritanceKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RecoverOctagonUsingInheritanceKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 0;
  id v32 = 0LL;
  [v7 makeOTControl:&v32];
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v32;
  secLogObjForScope("clique-inheritancekey");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v33 = 0;
    _os_log_impl(&dword_1804F4000, v18, OS_LOG_TYPE_DEFAULT, "join using inheritance key", v33, 2u);
  }

  if (v16)
  {
    id v19 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __67__OTClique_recoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke;
    v27[3] = &unk_189667A50;
    os_signpost_id_t v30 = v11;
    uint64_t v31 = v12;
    p___int128 buf = &buf;
    id v28 = v9;
    [v16 joinWithInheritanceKey:v19 inheritanceKey:v8 reply:v27];
  }

  else
  {
    secLogObjForScope("clique-inheritancekey");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 138412290;
      os_signpost_id_t v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_1804F4000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v24 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)id v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v23,  OS_SIGNPOST_INTERVAL_END,  v11,  "RecoverOctagonUsingInheritanceKey",  " OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNa meRecoverOctagonUsingInheritanceKey}d ",  v33,  8u);
    }

    _OctagonSignpostLogSystem();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 134218496;
      int v26 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v34 = v11;
      __int16 v35 = 2048;
      double v36 = (double)Nanoseconds / 1000000000.0;
      __int16 v37 = 1026;
      int v38 = v26;
      _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverOctagonUsingInheritanceKey  OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public ,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ",  v33,  0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)preflightRecoverOctagonUsingInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  _OctagonSignpostLogSystem();
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  os_signpost_id_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v13;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  v11,  "PreflightRecoverOctagonUsingInheritanceKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PreflightRecoverOctagonUsingInheritanceKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 0;
  id v32 = 0LL;
  [v7 makeOTControl:&v32];
  unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v32;
  secLogObjForScope("clique-inheritancekey");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v33 = 0;
    _os_log_impl(&dword_1804F4000, v18, OS_LOG_TYPE_DEFAULT, "preflight join using inheritance key", v33, 2u);
  }

  if (v16)
  {
    id v19 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __76__OTClique_preflightRecoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke;
    v27[3] = &unk_189667A50;
    os_signpost_id_t v30 = v11;
    uint64_t v31 = v12;
    p___int128 buf = &buf;
    id v28 = v9;
    [v16 preflightJoinWithInheritanceKey:v19 inheritanceKey:v8 reply:v27];
  }

  else
  {
    secLogObjForScope("clique-inheritancekey");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 138412290;
      os_signpost_id_t v34 = (os_signpost_id_t)v17;
      _os_log_impl(&dword_1804F4000, v20, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v33, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v11, v12);
    _OctagonSignpostLogSystem();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v23 = v22;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      int v24 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)id v33 = 67240192;
      LODWORD(v34) = v24;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v23,  OS_SIGNPOST_INTERVAL_END,  v11,  "PreflightRecoverOctagonUsingInheritanceKey",  " OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonS ignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ",  v33,  8u);
    }

    _OctagonSignpostLogSystem();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v33 = 134218496;
      int v26 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v34 = v11;
      __int16 v35 = 2048;
      double v36 = (double)Nanoseconds / 1000000000.0;
      __int16 v37 = 1026;
      int v38 = v26;
      _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PreflightRecoverOctagonUsingInheritanceKey  OctagonSignpostNamePreflightRecoverOctagonUsingInher itanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ",  v33,  0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v17);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)removeInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  secLogObjForScope("octagon-removeinheritancekey");
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v7 context];
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "removeInheritanceKey invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  _OctagonSignpostLogSystem();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "RemoveInheritanceKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RemoveInheritanceKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  id v33 = 0LL;
  [v7 makeOTControl:&v33];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v33;
  if (v18)
  {
    uint64_t v20 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __58__OTClique_removeInheritanceKey_inheritanceKeyUUID_reply___block_invoke;
    v28[3] = &unk_189667A50;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p___int128 buf = &buf;
    id v29 = v9;
    [v18 removeInheritanceKey:v20 uuid:v8 reply:v28];
  }

  else
  {
    secLogObjForScope("octagon-removeinheritancekey");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v13,  "RemoveInheritanceKey",  " OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ",  v34,  8u);
    }

    _OctagonSignpostLogSystem();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RemoveInheritanceKey  OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number 1,name=OctagonSignpostNameRemoveInheritanceKey}d ",  v34,  0x1Cu);
    }

    (*((void (**)(id, id))v9 + 2))(v9, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)checkInheritanceKey:(id)a3 inheritanceKeyUUID:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  secLogObjForScope("octagon-checkinheritancekey");
  os_signpost_id_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v7 context];
    os_signpost_id_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "checkInheritanceKey invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  _OctagonSignpostLogSystem();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  uint64_t v14 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unint64_t v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v13,  "CheckInheritanceKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl( &dword_1804F4000,  v17,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: CheckInheritanceKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000LL;
  char v42 = 0;
  id v33 = 0LL;
  [v7 makeOTControl:&v33];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = v33;
  if (v18)
  {
    uint64_t v20 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v7);
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __57__OTClique_checkInheritanceKey_inheritanceKeyUUID_reply___block_invoke;
    v28[3] = &unk_189667A78;
    os_signpost_id_t v31 = v13;
    uint64_t v32 = v14;
    p___int128 buf = &buf;
    id v29 = v9;
    [v18 checkInheritanceKey:v20 uuid:v8 reply:v28];
  }

  else
  {
    secLogObjForScope("octagon-checkinheritancekey");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 138412290;
      os_signpost_id_t v35 = (os_signpost_id_t)v19;
      _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v34, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v13, v14);
    _OctagonSignpostLogSystem();
    BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v24 = v23;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      int v25 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)os_signpost_id_t v34 = 67240192;
      LODWORD(v35) = v25;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v24,  OS_SIGNPOST_INTERVAL_END,  v13,  "CheckInheritanceKey",  " OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ",  v34,  8u);
    }

    _OctagonSignpostLogSystem();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_signpost_id_t v34 = 134218496;
      int v27 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v35 = v13;
      __int16 v36 = 2048;
      double v37 = (double)Nanoseconds / 1000000000.0;
      __int16 v38 = 1026;
      int v39 = v27;
      _os_log_impl( &dword_1804F4000,  v26,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CheckInheritanceKey  OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1, name=OctagonSignpostNameCheckInheritanceKey}d ",  v34,  0x1Cu);
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0LL, v19);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  secLogObjForScope("octagon-recreateinheritancekey");
  os_signpost_id_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [v9 context];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "recreateInheritanceKey invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  _OctagonSignpostLogSystem();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  uint64_t v17 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v19 = v18;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  v16,  "RecreateInheritanceKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl( &dword_1804F4000,  v20,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: RecreateInheritanceKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x2020000000LL;
  char v45 = 0;
  id v36 = 0LL;
  [v9 makeOTControl:&v36];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = v36;
  if (v21)
  {
    BOOL v23 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v9);
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __52__OTClique_recreateInheritanceKey_uuid_oldIK_reply___block_invoke;
    id v31[3] = &unk_189667AA0;
    os_signpost_id_t v34 = v16;
    uint64_t v35 = v17;
    p___int128 buf = &buf;
    id v32 = v12;
    [v21 recreateInheritanceKey:v23 uuid:v10 oldIK:v11 reply:v31];
  }

  else
  {
    secLogObjForScope("octagon-recreateinheritancekey");
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)double v37 = 138412290;
      os_signpost_id_t v38 = (os_signpost_id_t)v22;
      _os_log_impl(&dword_1804F4000, v24, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v37, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v16, v17);
    _OctagonSignpostLogSystem();
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v27 = v26;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      int v28 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)double v37 = 67240192;
      LODWORD(v38) = v28;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v27,  OS_SIGNPOST_INTERVAL_END,  v16,  "RecreateInheritanceKey",  " OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateI nheritanceKey}d ",  v37,  8u);
    }

    _OctagonSignpostLogSystem();
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)double v37 = 134218496;
      int v30 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v38 = v16;
      __int16 v39 = 2048;
      double v40 = (double)Nanoseconds / 1000000000.0;
      __int16 v41 = 1026;
      int v42 = v30;
      _os_log_impl( &dword_1804F4000,  v29,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecreateInheritanceKey  OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:nu mber1,name=OctagonSignpostNameRecreateInheritanceKey}d ",  v37,  0x1Cu);
    }

    (*((void (**)(id, void, id))v12 + 2))(v12, 0LL, v22);
  }

  _Block_object_dispose(&buf, 8);
}

+ (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v33 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  secLogObjForScope("octagon-createinheritancekeyclaimtokenwrappingkey");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    [v11 context];
    os_signpost_id_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "createInheritanceKey w/claimToken+wrappingKey invoked for context: %@",  (uint8_t *)&buf,  0xCu);
  }

  _OctagonSignpostLogSystem();
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v18 = os_signpost_id_generate(v17);
  uint64_t v19 = mach_continuous_time();

  _OctagonSignpostLogSystem();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v21 = v20;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( &dword_1804F4000,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v18,  "CreateInheritanceKeyWithClaimTokenAndWrappingKey",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  _OctagonSignpostLogSystem();
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v18;
    _os_log_impl( &dword_1804F4000,  v22,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: CreateInheritanceKeyWithClaimTokenAndWrappingKey  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x2020000000LL;
  char v48 = 0;
  id v39 = 0LL;
  [v11 makeOTControl:&v39];
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = v39;
  if (v23)
  {
    int v25 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v11);
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __75__OTClique_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke;
    v34[3] = &unk_189667AA0;
    os_signpost_id_t v37 = v18;
    uint64_t v38 = v19;
    p___int128 buf = &buf;
    id v35 = v14;
    [v23 createInheritanceKey:v25 uuid:v33 claimTokenData:v12 wrappingKeyData:v13 reply:v34];
  }

  else
  {
    secLogObjForScope("octagon-createinheritancekeyclaimtokenwrappingkey");
    int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)double v40 = 138412290;
      os_signpost_id_t v41 = (os_signpost_id_t)v24;
      _os_log_impl(&dword_1804F4000, v26, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", v40, 0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(v18, v19);
    _OctagonSignpostLogSystem();
    int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v29 = v28;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      int v30 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      *(_DWORD *)double v40 = 67240192;
      LODWORD(v41) = v30;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v29,  OS_SIGNPOST_INTERVAL_END,  v18,  "CreateInheritanceKeyWithClaimTokenAndWrappingKey",  " OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=Oc tagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ",  v40,  8u);
    }

    _OctagonSignpostLogSystem();
    os_signpost_id_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)double v40 = 134218496;
      int v32 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
      os_signpost_id_t v41 = v18;
      __int16 v42 = 2048;
      double v43 = (double)Nanoseconds / 1000000000.0;
      __int16 v44 = 1026;
      int v45 = v32;
      _os_log_impl( &dword_1804F4000,  v31,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CreateInheritanceKeyWithClaimTokenAndWrappingKey  OctagonSignpostNameCreateInheritanceKeyWithCla imTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimT okenAndWrappingKey}d ",  v40,  0x1Cu);
    }

    (*((void (**)(id, void, id))v14 + 2))(v14, 0LL, v24);
  }

  _Block_object_dispose(&buf, 8);
}

+ (BOOL)setCDPEnabled:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v14 = 0LL;
  [v5 makeOTControl:&v14];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v14;
  if (v6)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3032000000LL;
    uint64_t v17 = __Block_byref_object_copy__4755;
    os_signpost_id_t v18 = __Block_byref_object_dispose__4756;
    id v19 = 0LL;
    id v8 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v5);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __32__OTClique_setCDPEnabled_error___block_invoke;
    v13[3] = &unk_189672C48;
    v13[4] = &buf;
    [v6 setCDPEnabled:v8 reply:v13];

    id v9 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (a4 && v9)
    {
      *a4 = v9;
      id v9 = *(void **)(*((void *)&buf + 1) + 40LL);
    }

    BOOL v10 = v9 == 0LL;
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    secLogObjForScope("SecError");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "octagon-setcdpenabled: failed to fetch OTControl object: %@",  (uint8_t *)&buf,  0xCu);
    }

    BOOL v10 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v10;
}

+ (int64_t)getCDPStatus:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v18 = 0LL;
  [v5 makeOTControl:&v18];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v18;
  if (v6)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x3032000000LL;
    id v21 = __Block_byref_object_copy__4755;
    id v22 = __Block_byref_object_dispose__4756;
    id v23 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000LL;
    uint64_t v17 = 0LL;
    id v8 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v5);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __31__OTClique_getCDPStatus_error___block_invoke;
    v13[3] = &unk_189667878;
    v13[4] = &buf;
    void v13[5] = &v14;
    [v6 getCDPStatus:v8 reply:v13];

    if (a4)
    {
      id v9 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v9) {
        *a4 = v9;
      }
    }

    int64_t v10 = v15[3];
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    secLogObjForScope("SecError");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "octagon-cdp-status: failed to fetch OTControl object: %@",  (uint8_t *)&buf,  0xCu);
    }

    int64_t v10 = 0LL;
    if (a4) {
      *a4 = v7;
    }
  }

  return v10;
}

+ (id)resetProtectedData:(id)a3 error:(id *)a4
{
  return +[OTClique resetProtectedData:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:error:]( &OBJC_CLASS___OTClique,  "resetProtectedData:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:error:",  a3,  0LL,  0LL,  0LL,  a4);
}

+ (id)resetProtectedData:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 error:(id *)a7
{
  BOOL v61 = a6;
  uint64_t v79 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v64 = a4;
  id v11 = a5;
  if (+[OTClique isCloudServicesAvailable](&OBJC_CLASS___OTClique, "isCloudServicesAvailable"))
  {
    id v68 = 0LL;
    [v10 makeOTControl:&v68];
    uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
    id v62 = v68;
    if (!v63)
    {
      secLogObjForScope("SecError");
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v62;
        _os_log_impl( &dword_1804F4000,  v16,  OS_LOG_TYPE_DEFAULT,  "clique-reset-protected-data: unable to create otcontrol: %@",  (uint8_t *)&buf,  0xCu);
      }

      uint64_t v15 = 0LL;
      if (a7) {
        *a7 = v62;
      }
      goto LABEL_59;
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v72 = 0x3032000000LL;
    v73 = __Block_byref_object_copy__4755;
    __int16 v74 = __Block_byref_object_dispose__4756;
    id v75 = 0LL;
    id v12 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v10);
    v67[0] = MEMORY[0x1895F87A8];
    v67[1] = 3221225472LL;
    v67[2] = __89__OTClique_resetProtectedData_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_error___block_invoke;
    v67[3] = &unk_189667AF0;
    v67[4] = &buf;
    [v63 fetchAccountWideSettingsWithForceFetch:1 arguments:v12 reply:v67];

    [v10 sbd];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = v13;
    if (v13) {
      id v60 = v13;
    }
    else {
      id v60 = objc_alloc_init((Class)getSecureBackupClass());
    }

    [v10 authenticationAppleID];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v18 = v17 == 0LL;

    if (v18)
    {
      secLogObjForScope("SecError");
      os_signpost_id_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v59 = v41;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v76) = 0;
        __int16 v42 = "clique-reset-protected-data: authenticationAppleID not set on configuration context";
LABEL_28:
        _os_log_impl(&dword_1804F4000, v41, OS_LOG_TYPE_DEFAULT, v42, (uint8_t *)&v76, 2u);
      }
    }

    else
    {
      [v10 passwordEquivalentToken];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v20 = v19 == 0LL;

      if (!v20)
      {
        id v21 = objc_alloc((Class)getAAFAnalyticsEventSecurityClass());
        [v10 altDSID];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 flowID];
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 deviceSessionID];
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(void *)&__int128 v76 = 0LL;
        *((void *)&v76 + 1) = &v76;
        uint64_t v77 = 0x2020000000LL;
        int v25 = (id *)getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr;
        uint64_t v78 = getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr;
        if (!getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr)
        {
          int v26 = KeychainCircleLibrary();
          int v25 = (id *)dlsym(v26, "kSecurityRTCEventNameRPDDeleteAllRecords");
          *(void *)(*((void *)&v76 + 1) + 24LL) = v25;
          getkSecurityRTCEventNameRPDDeleteAllRecordsSymbolLoc_ptr = (uint64_t)v25;
        }

        _Block_object_dispose(&v76, 8);
        if (!v25)
        {
          [MEMORY[0x1896077D8] currentHandler];
          id v56 = (void *)objc_claimAutoreleasedReturnValue();
          [NSString stringWithUTF8String:"NSString *getkSecurityRTCEventNameRPDDeleteAllRecords(void)"];
          uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend( v56,  "handleFailureInFunction:file:lineNumber:description:",  v57,  @"OTClique.m",  75,  @"%s",  dlerror());

          __break(1u);
        }

        id v27 = *v25;
        uint64_t v28 = [v10 testsEnabled];
        getkSecurityRTCEventCategoryAccountDataAccessRecovery();
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v58) = 1;
        unint64_t v59 = (os_log_s *)[v21 initWithKeychainCircleMetrics:0 altDSID:v22 flowID:v23 deviceSessionID:v24 eventName:v27 testsAreEnabled:v28 canSe ndMetrics:v58 category:v29];

        getkSecureBackupAuthenticationAppleID();
        int v30 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = v30;
        [v10 authenticationAppleID];
        os_signpost_id_t v31 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = v31;
        getkSecureBackupAuthenticationPassword();
        int v32 = (void *)objc_claimAutoreleasedReturnValue();
        v69[1] = v32;
        [v10 passwordEquivalentToken];
        id v33 = (void *)objc_claimAutoreleasedReturnValue();
        v70[1] = v33;
        getkSecureBackupiCloudDataProtectionDeleteAllRecordsKey();
        os_signpost_id_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        v69[2] = v34;
        uint64_t v35 = MEMORY[0x189604A88];
        v70[2] = MEMORY[0x189604A88];
        getkSecureBackupContainsiCDPDataKey();
        id v36 = (void *)objc_claimAutoreleasedReturnValue();
        v69[3] = v36;
        v70[3] = v35;
        [MEMORY[0x189603F68] dictionaryWithObjects:v70 forKeys:v69 count:4];
        os_signpost_id_t v37 = (void *)objc_claimAutoreleasedReturnValue();

        [v60 disableWithInfo:v37];
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          secLogObjForScope("SecError");
          id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v76) = 138412290;
            *(void *)((char *)&v76 + 4) = v38;
            _os_log_impl( &dword_1804F4000,  v39,  OS_LOG_TYPE_DEFAULT,  "clique-reset-protected-data: secure backup escrow record deletion failed: %@",  (uint8_t *)&v76,  0xCu);
          }

          if (a7) {
            *a7 = v38;
          }
          [getSecurityAnalyticsReporterRTCClass() sendMetricWithEvent:v59 success:0 error:v38];
          id v40 = 0LL;
          uint64_t v15 = 0LL;
        }

        else
        {
          secLogObjForScope("clique-reset-protected-data");
          double v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v76) = 0;
            _os_log_impl( &dword_1804F4000,  v43,  OS_LOG_TYPE_DEFAULT,  "sbd disableWithInfo succeeded",  (uint8_t *)&v76,  2u);
          }

          [getSecurityAnalyticsReporterRTCClass() sendMetricWithEvent:v59 success:1 error:0];
          if (SOSCCIsSOSTrustAndSyncingEnabledCachedValue())
          {
            CFTypeRef cf = 0LL;
            char v44 = SOSCCResetToOffering(&cf);
            if (cf) {
              char v45 = 0;
            }
            else {
              char v45 = v44;
            }
            if ((v45 & 1) != 0)
            {
              secLogObjForScope("clique-reset-protected-data");
              uint64_t v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v76) = 0;
                _os_log_impl(&dword_1804F4000, v46, OS_LOG_TYPE_DEFAULT, "sos reset succeeded", (uint8_t *)&v76, 2u);
              }
            }

            else
            {
              secLogObjForScope("SecError");
              char v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(v76) = 138412290;
                *(void *)((char *)&v76 + 4) = cf;
                _os_log_impl( &dword_1804F4000,  v48,  OS_LOG_TYPE_DEFAULT,  "clique-reset-protected-data: sos reset failed: %@, ignoring error and continuing with reset",  (uint8_t *)&v76,  0xCu);
              }

              CFTypeRef v49 = cf;
              if (cf)
              {
                CFTypeRef cf = 0LL;
                CFRelease(v49);
              }
            }
          }

          else
          {
            secLogObjForScope("clique-reset-protected-data");
            uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v76) = 0;
              _os_log_impl( &dword_1804F4000,  v47,  OS_LOG_TYPE_DEFAULT,  "platform does not support sos",  (uint8_t *)&v76,  2u);
            }
          }

          double v50 = -[OTClique initWithContextData:](objc_alloc(&OBJC_CLASS___OTClique), "initWithContextData:", v10);
          uint64_t v51 = *(void *)(*((void *)&buf + 1) + 40LL);
          id v65 = 0LL;
          -[OTClique resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:]( v50,  "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:",  1,  v64,  v11,  v61,  v51,  [v10 isGuitarfish],  &v65);
          id v40 = v65;
          if (v40)
          {
            secLogObjForScope("SecError");
            uint64_t v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v76) = 138412290;
              *(void *)((char *)&v76 + 4) = v40;
              _os_log_impl( &dword_1804F4000,  v52,  OS_LOG_TYPE_DEFAULT,  "clique-reset-protected-data: account reset failed: %@",  (uint8_t *)&v76,  0xCu);
            }

            uint64_t v15 = 0LL;
            if (a7) {
              *a7 = v40;
            }
          }

          else
          {
            secLogObjForScope("clique-reset-protected-data");
            id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v76) = 0;
              _os_log_impl( &dword_1804F4000,  v53,  OS_LOG_TYPE_DEFAULT,  "Octagon account reset succeeded",  (uint8_t *)&v76,  2u);
            }

            [MEMORY[0x189607860] defaultCenter];
            id v54 = (void *)objc_claimAutoreleasedReturnValue();
            [v54 postNotificationName:@"com.apple.security.resetprotecteddata.complete" object:0 userInfo:0 deliverImmediately:1];

            uint64_t v15 = v50;
          }
        }

        goto LABEL_58;
      }

      secLogObjForScope("SecError");
      os_signpost_id_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      unint64_t v59 = v41;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v76) = 0;
        __int16 v42 = "clique-reset-protected-data: passwordEquivalentToken not set on configuration context";
        goto LABEL_28;
      }
    }

    id v40 = 0LL;
    uint64_t v15 = 0LL;
LABEL_58:

    _Block_object_dispose(&buf, 8);
LABEL_59:

    goto LABEL_60;
  }

  if (a7)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-4 userInfo:0];
    uint64_t v15 = 0LL;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v15 = 0LL;
  }

+ (BOOL)clearCliqueFromAccount:(id)a3 error:(id *)a4
{
  v45[4] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (+[OTClique isCloudServicesAvailable](&OBJC_CLASS___OTClique, "isCloudServicesAvailable"))
  {
    id v36 = 0LL;
    [v5 makeOTControl:&v36];
    os_signpost_id_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = v36;
    if (!v34)
    {
      secLogObjForScope("SecError");
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v33;
        _os_log_impl( &dword_1804F4000,  v9,  OS_LOG_TYPE_DEFAULT,  "clique-reset-account-data: unable to create otcontrol: %@",  (uint8_t *)&buf,  0xCu);
      }

      BOOL v8 = 0;
      if (a4) {
        *a4 = v33;
      }
      goto LABEL_37;
    }

    [v5 sbd];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v6;
    if (v6) {
      id v32 = v6;
    }
    else {
      id v32 = objc_alloc_init((Class)getSecureBackupClass());
    }

    [v5 authenticationAppleID];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v11 = v10 == 0LL;

    if (v11)
    {
      secLogObjForScope("SecError");
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        uint64_t v24 = "clique-reset-account-data: authenticationAppleID not set on configuration context";
LABEL_24:
        _os_log_impl(&dword_1804F4000, v21, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&buf, 2u);
      }
    }

    else
    {
      [v5 passwordEquivalentToken];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v13 = v12 == 0LL;

      if (!v13)
      {
        getkSecureBackupAuthenticationAppleID();
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v14;
        [v5 authenticationAppleID];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v15;
        getkSecureBackupAuthenticationPassword();
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        v44[1] = v16;
        [v5 passwordEquivalentToken];
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v17;
        getkSecureBackupiCloudDataProtectionDeleteAllRecordsKey();
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue();
        v44[2] = v18;
        uint64_t v19 = MEMORY[0x189604A88];
        v45[2] = MEMORY[0x189604A88];
        getkSecureBackupContainsiCDPDataKey();
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44[3] = v20;
        v45[3] = v19;
        [MEMORY[0x189603F68] dictionaryWithObjects:v45 forKeys:v44 count:4];
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        [v32 disableWithInfo:v21];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          secLogObjForScope("SecError");
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v22;
            _os_log_impl( &dword_1804F4000,  v23,  OS_LOG_TYPE_DEFAULT,  "clique-reset-account-data: secure backup escrow record deletion failed: %@",  (uint8_t *)&buf,  0xCu);
          }

          BOOL v8 = 0;
          if (a4) {
            *a4 = v22;
          }
        }

        else
        {
          secLogObjForScope("clique-reset-account-data");
          int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl( &dword_1804F4000,  v25,  OS_LOG_TYPE_DEFAULT,  "sbd disableWithInfo succeeded",  (uint8_t *)&buf,  2u);
          }

          *(void *)&__int128 buf = 0LL;
          *((void *)&buf + 1) = &buf;
          uint64_t v40 = 0x3032000000LL;
          os_signpost_id_t v41 = __Block_byref_object_copy__4755;
          __int16 v42 = __Block_byref_object_dispose__4756;
          id v43 = 0LL;
          int v26 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v5);
          uint64_t v27 = [v5 isGuitarfish];
          v35[0] = MEMORY[0x1895F87A8];
          v35[1] = 3221225472LL;
          v35[2] = __41__OTClique_clearCliqueFromAccount_error___block_invoke;
          v35[3] = &unk_189672C48;
          v35[4] = &buf;
          [v34 clearCliqueFromAccount:v26 resetReason:1 isGuitarfish:v27 reply:v35];

          uint64_t v28 = *(void *)(*((void *)&buf + 1) + 40LL);
          BOOL v8 = v28 == 0;
          if (v28)
          {
            secLogObjForScope("SecError");
            id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v30 = *(void *)(*((void *)&buf + 1) + 40LL);
              *(_DWORD *)os_signpost_id_t v37 = 138412290;
              uint64_t v38 = v30;
              _os_log_impl( &dword_1804F4000,  v29,  OS_LOG_TYPE_DEFAULT,  "clique-reset-account-data: account reset failed: %@",  v37,  0xCu);
            }

            if (a4) {
              *a4 = *(id *)(*((void *)&buf + 1) + 40LL);
            }
          }

          _Block_object_dispose(&buf, 8);
        }

        goto LABEL_36;
      }

      secLogObjForScope("SecError");
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        uint64_t v24 = "clique-reset-account-data: passwordEquivalentToken not set on configuration context";
        goto LABEL_24;
      }
    }

    BOOL v8 = 0;
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }

  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-4 userInfo:0];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v8 = 0;
  }

+ (BOOL)performCKServerUnreadableDataRemoval:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v16 = 0LL;
  [v5 makeOTControl:&v16];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v16;
  if (v6)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x3032000000LL;
    uint64_t v19 = __Block_byref_object_copy__4755;
    BOOL v20 = __Block_byref_object_dispose__4756;
    id v21 = 0LL;
    BOOL v8 = -[OTControlArguments initWithConfiguration:]( objc_alloc(&OBJC_CLASS___OTControlArguments),  "initWithConfiguration:",  v5);
    uint64_t v9 = [v5 isGuitarfish];
    [v5 altDSID];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __55__OTClique_performCKServerUnreadableDataRemoval_error___block_invoke;
    v15[3] = &unk_189672C48;
    v15[4] = &buf;
    [v6 performCKServerUnreadableDataRemoval:v8 isGuitarfish:v9 altDSID:v10 reply:v15];

    BOOL v11 = *(void **)(*((void *)&buf + 1) + 40LL);
    BOOL v12 = v11 == 0LL;
    if (a4 && v11) {
      *a4 = v11;
    }
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    secLogObjForScope("SecError");
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "clique-perform-ckserver-unreadable-data-removal: unable to create otcontrol: %@",  (uint8_t *)&buf,  0xCu);
    }

    BOOL v12 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v12;
}

void __55__OTClique_performCKServerUnreadableDataRemoval_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "clique-perform-ckserver-unreadable-data-removal: failed to remove data from ckserver: %@",  (uint8_t *)&v8,  0xCu);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v6 = v3;
    id v7 = *(os_log_s **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }

  else
  {
    secLogObjForScope("clique-perform-ckserver-unreadable-data-removal");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "removed unreadable data from ckserver",  (uint8_t *)&v8,  2u);
    }
  }
}

void __41__OTClique_clearCliqueFromAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "clique-reset-account-data: failed to reset: %@",  (uint8_t *)&v8,  0xCu);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v6 = v3;
    id v7 = *(os_log_s **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }

  else
  {
    secLogObjForScope("clique-reset-account-data");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, "reset octagon", (uint8_t *)&v8, 2u);
    }
  }
}

void __89__OTClique_resetProtectedData_idmsTargetContext_idmsCuttlefishPassword_notifyIdMS_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "clique-reset-protected-data: failed to fetch account settings: %@",  (uint8_t *)&v11,  0xCu);
    }
  }

  else
  {
    secLogObjForScope("clique-reset-protected-data");
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1804F4000, v8, OS_LOG_TYPE_DEFAULT, "fetched account settings: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v10 = v5;
    id v7 = *(os_log_s **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
}

void __31__OTClique_getCDPStatus_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  secLogObjForScope("octagon-cdp-status");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, "failed to fetch CDP status: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
  }

  else
  {
    if (v8)
    {
      uint64_t v9 = @"unknown";
      if (a2 == 1) {
        uint64_t v9 = @"disabled";
      }
      if (a2 == 2) {
        uint64_t v9 = @"enabled";
      }
      id v10 = v9;
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "successfully fetched CDP status as %@",  (uint8_t *)&v11,  0xCu);
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  }
}

void __32__OTClique_setCDPEnabled_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("octagon-setcdpenabled");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "failed to set CDP bit: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v7 = v3;
    id v4 = *(os_log_s **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }

  else if (v5)
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1804F4000, v4, OS_LOG_TYPE_DEFAULT, "successfully set CDP bit", (uint8_t *)&v8, 2u);
  }
}

void __75__OTClique_createInheritanceKey_uuid_claimTokenData_wrappingKeyData_reply___block_invoke( void *a1,  void *a2,  void *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "octagon-createinheritancekeyclaimtokenwrappingkey, failed to create octagon inheritance recovery key (w/claim+wrappingkey)",  (uint8_t *)&v22,  2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = v9;
    os_signpost_id_t v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "CreateInheritanceKeyWithClaimTokenAndWrappingKey",  " OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=Oc tagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v14;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CreateInheritanceKeyWithClaimTokenAndWrappingKey  OctagonSignpostNameCreateInheritanceKeyWithCla imTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimT okenAndWrappingKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("octagon-createinheritancekeyclaimtokenwrappingkey");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "successfully created octagon inheritance recovery key (w/claim+wrappingkey)",  (uint8_t *)&v22,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v17;
    os_signpost_id_t v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v20 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v18,  OS_SIGNPOST_INTERVAL_END,  v19,  "CreateInheritanceKeyWithClaimTokenAndWrappingKey",  " OctagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=Oc tagonSignpostNameCreateInheritanceKeyWithClaimTokenAndWrappingKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v16 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CreateInheritanceKeyWithClaimTokenAndWrappingKey  OctagonSignpostNameCreateInheritanceKeyWithCla imTokenAndWrappingKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKeyWithClaimT okenAndWrappingKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __52__OTClique_recreateInheritanceKey_uuid_oldIK_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "octagon-recreateinheritancekey, failed to recreate octagon inheritance recovery key",  (uint8_t *)&v22,  2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = v9;
    os_signpost_id_t v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "RecreateInheritanceKey",  " OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateI nheritanceKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v14;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecreateInheritanceKey  OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:nu mber1,name=OctagonSignpostNameRecreateInheritanceKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("octagon-recreateinheritancekey");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "successfully recreated octagon inheritance recovery key",  (uint8_t *)&v22,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v17;
    os_signpost_id_t v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v20 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v18,  OS_SIGNPOST_INTERVAL_END,  v19,  "RecreateInheritanceKey",  " OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecreateI nheritanceKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v16 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecreateInheritanceKey  OctagonSignpostNameRecreateInheritanceKey=%{public,signpost.telemetry:nu mber1,name=OctagonSignpostNameRecreateInheritanceKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __57__OTClique_checkInheritanceKey_inheritanceKeyUUID_reply___block_invoke( void *a1,  uint64_t a2,  void *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    secLogObjForScope("SecError");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "octagon-checkinheritancekey, failed to check inheritance key",  (uint8_t *)&v22,  2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v10;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "CheckInheritanceKey",  " OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    os_signpost_id_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v12;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CheckInheritanceKey  OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1, name=OctagonSignpostNameCheckInheritanceKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }

    uint64_t v13 = *(void (**)(void))(a1[4] + 16LL);
  }

  else
  {
    secLogObjForScope("octagon-checkinheritancekey");
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v14,  OS_LOG_TYPE_DEFAULT,  "successfully checked inerhitance key",  (uint8_t *)&v22,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v15 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    unint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = v16;
    os_signpost_id_t v18 = a1[6];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      int v19 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v19;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v17,  OS_SIGNPOST_INTERVAL_END,  v18,  "CheckInheritanceKey",  " OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckInheritanceKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v15 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl( &dword_1804F4000,  v20,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CheckInheritanceKey  OctagonSignpostNameCheckInheritanceKey=%{public,signpost.telemetry:number1, name=OctagonSignpostNameCheckInheritanceKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }

    uint64_t v13 = *(void (**)(void))(a1[4] + 16LL);
  }

  v13();
}

void __58__OTClique_removeInheritanceKey_inheritanceKeyUUID_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "octagon-removeinheritancekey, failed to remove inheritance key",  (uint8_t *)&v19,  2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v7 = v6;
    os_signpost_id_t v8 = a1[6];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v9 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v7,  OS_SIGNPOST_INTERVAL_END,  v8,  "RemoveInheritanceKey",  " OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v11 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v11;
      _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RemoveInheritanceKey  OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number 1,name=OctagonSignpostNameRemoveInheritanceKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("octagon-removeinheritancekey");
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v12,  OS_LOG_TYPE_DEFAULT,  "successfully removed inerhitance key",  (uint8_t *)&v19,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v15,  OS_SIGNPOST_INTERVAL_END,  v16,  "RemoveInheritanceKey",  " OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemoveInheritanceKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RemoveInheritanceKey  OctagonSignpostNameRemoveInheritanceKey=%{public,signpost.telemetry:number 1,name=OctagonSignpostNameRemoveInheritanceKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __76__OTClique_preflightRecoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke( void *a1,  void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("clique-inheritancekey");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "failed to preflight join using inheritance key: %@",  (uint8_t *)&v19,  0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "PreflightRecoverOctagonUsingInheritanceKey",  " OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonS ignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v12;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PreflightRecoverOctagonUsingInheritanceKey  OctagonSignpostNamePreflightRecoverOctagonUsingInher itanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "successful preflight join using inheritance key",  (uint8_t *)&v19,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v15,  OS_SIGNPOST_INTERVAL_END,  v16,  "PreflightRecoverOctagonUsingInheritanceKey",  " OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonS ignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PreflightRecoverOctagonUsingInheritanceKey  OctagonSignpostNamePreflightRecoverOctagonUsingInher itanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingInheritanceKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __67__OTClique_recoverOctagonUsingInheritanceKey_inheritanceKey_reply___block_invoke( void *a1,  void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("clique-inheritancekey");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "failed to join using inheritance key: %@",  (uint8_t *)&v19,  0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "RecoverOctagonUsingInheritanceKey",  " OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNa meRecoverOctagonUsingInheritanceKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v12;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverOctagonUsingInheritanceKey  OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public ,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "successfully joined using inheritance key",  (uint8_t *)&v19,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v15,  OS_SIGNPOST_INTERVAL_END,  v16,  "RecoverOctagonUsingInheritanceKey",  " OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNa meRecoverOctagonUsingInheritanceKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverOctagonUsingInheritanceKey  OctagonSignpostNameRecoverOctagonUsingInheritanceKey=%{public ,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingInheritanceKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __41__OTClique_storeInheritanceKey_ik_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "octagon-storeinheritancekey, failed to store octagon inheritance recovery key",  (uint8_t *)&v19,  2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v7 = v6;
    os_signpost_id_t v8 = a1[6];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v9 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v7,  OS_SIGNPOST_INTERVAL_END,  v8,  "StoreInheritanceKey",  " OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v11 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v11;
      _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: StoreInheritanceKey  OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1, name=OctagonSignpostNameStoreInheritanceKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("octagon-storeinheritancekey");
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v12,  OS_LOG_TYPE_DEFAULT,  "successfully stored octagon inheritance recovery key",  (uint8_t *)&v19,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v15,  OS_SIGNPOST_INTERVAL_END,  v16,  "StoreInheritanceKey",  " OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameStoreInheritanceKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: StoreInheritanceKey  OctagonSignpostNameStoreInheritanceKey=%{public,signpost.telemetry:number1, name=OctagonSignpostNameStoreInheritanceKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __46__OTClique_generateInheritanceKey_uuid_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "octagon-generateinheritancekey, failed to generate octagon inheritance recovery key",  (uint8_t *)&v22,  2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v10 = v9;
    os_signpost_id_t v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "GenerateInheritanceKey",  " OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateI nheritanceKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v14;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: GenerateInheritanceKey  OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:nu mber1,name=OctagonSignpostNameGenerateInheritanceKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("octagon-generateinheritancekey");
    unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "successfully generated octagon inheritance recovery key",  (uint8_t *)&v22,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v18 = v17;
    os_signpost_id_t v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v20 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v18,  OS_SIGNPOST_INTERVAL_END,  v19,  "GenerateInheritanceKey",  " OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameGenerateI nheritanceKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v16 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: GenerateInheritanceKey  OctagonSignpostNameGenerateInheritanceKey=%{public,signpost.telemetry:nu mber1,name=OctagonSignpostNameGenerateInheritanceKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __44__OTClique_createInheritanceKey_uuid_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "octagon-createinheritancekey, failed to create octagon inheritance recovery key",  (uint8_t *)&v22,  2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v10 = v9;
    os_signpost_id_t v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "CreateInheritanceKey",  " OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v14;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CreateInheritanceKey  OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number 1,name=OctagonSignpostNameCreateInheritanceKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("octagon-createinheritancekey");
    unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "successfully created octagon inheritance recovery key",  (uint8_t *)&v22,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v18 = v17;
    os_signpost_id_t v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v20 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v18,  OS_SIGNPOST_INTERVAL_END,  v19,  "CreateInheritanceKey",  " OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreateInheritanceKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v16 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CreateInheritanceKey  OctagonSignpostNameCreateInheritanceKey=%{public,signpost.telemetry:number 1,name=OctagonSignpostNameCreateInheritanceKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __69__OTClique_checkCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke( void *a1,  uint64_t a2,  void *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    secLogObjForScope("SecError");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "octagon-checkcustodianrecoverykey, failed to check custodian recovery key",  (uint8_t *)&v22,  2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v10;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "CheckCustodianRecoveryKey",  " OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckC ustodianRecoveryKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    os_signpost_id_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v12;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CheckCustodianRecoveryKey  OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.teleme try:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }

    unint64_t v13 = *(void (**)(void))(a1[4] + 16LL);
  }

  else
  {
    secLogObjForScope("octagon-checkcheckcustodianrecoverykey");
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v14,  OS_LOG_TYPE_DEFAULT,  "successfully checked custodian recovery key",  (uint8_t *)&v22,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v15 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    unint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v17 = v16;
    os_signpost_id_t v18 = a1[6];
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      int v19 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v19;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v17,  OS_SIGNPOST_INTERVAL_END,  v18,  "CheckCustodianRecoveryKey",  " OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCheckC ustodianRecoveryKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v15 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl( &dword_1804F4000,  v20,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CheckCustodianRecoveryKey  OctagonSignpostNameCheckCustodianRecoveryKey=%{public,signpost.teleme try:number1,name=OctagonSignpostNameCheckCustodianRecoveryKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }

    unint64_t v13 = *(void (**)(void))(a1[4] + 16LL);
  }

  v13();
}

void __70__OTClique_removeCustodianRecoveryKey_custodianRecoveryKeyUUID_reply___block_invoke( void *a1,  void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "octagon-removecustodianrecoverykey, failed to remove custodian recovery key",  (uint8_t *)&v19,  2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v7 = v6;
    os_signpost_id_t v8 = a1[6];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v9 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v7,  OS_SIGNPOST_INTERVAL_END,  v8,  "RemoveCustodianRecoveryKey",  " OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemov eCustodianRecoveryKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v11 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v11;
      _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RemoveCustodianRecoveryKey  OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.tele metry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("octagon-removecustodianrecoverykey");
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v12,  OS_LOG_TYPE_DEFAULT,  "successfully removed custodian recovery key",  (uint8_t *)&v19,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v15,  OS_SIGNPOST_INTERVAL_END,  v16,  "RemoveCustodianRecoveryKey",  " OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRemov eCustodianRecoveryKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v20 = a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RemoveCustodianRecoveryKey  OctagonSignpostNameRemoveCustodianRecoveryKey=%{public,signpost.tele metry:number1,name=OctagonSignpostNameRemoveCustodianRecoveryKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __88__OTClique_preflightRecoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke( void *a1,  void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("clique-custodianrecoverykey");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "failed to preflight join using custodian recovery key: %@",  (uint8_t *)&v19,  0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "PreflightRecoverOctagonUsingCustodianRecoveryKey",  " OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=Oc tagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v12;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PreflightRecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNamePreflightRecoverOctagonUsin gCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCu stodianRecoveryKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "successful preflight join using custodian recovery key",  (uint8_t *)&v19,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v15,  OS_SIGNPOST_INTERVAL_END,  v16,  "PreflightRecoverOctagonUsingCustodianRecoveryKey",  " OctagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=Oc tagonSignpostNamePreflightRecoverOctagonUsingCustodianRecoveryKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: PreflightRecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNamePreflightRecoverOctagonUsin gCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePreflightRecoverOctagonUsingCu stodianRecoveryKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __79__OTClique_recoverOctagonUsingCustodianRecoveryKey_custodianRecoveryKey_reply___block_invoke( void *a1,  void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("clique-custodianrecoverykey");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "failed to join using custodian recovery key: %@",  (uint8_t *)&v19,  0xCu);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v8 = v7;
    os_signpost_id_t v9 = a1[6];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v10;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v8,  OS_SIGNPOST_INTERVAL_END,  v9,  "RecoverOctagonUsingCustodianRecoveryKey",  " OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSign postNameRecoverOctagonUsingCustodianRecoveryKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v12;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNameRecoverOctagonUsingCustodianRecovery Key=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  else
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "successfully joined using custodian recovery key",  (uint8_t *)&v19,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[6];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v15,  OS_SIGNPOST_INTERVAL_END,  v16,  "RecoverOctagonUsingCustodianRecoveryKey",  " OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSign postNameRecoverOctagonUsingCustodianRecoveryKey}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      id v20 = (id)a1[6];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: RecoverOctagonUsingCustodianRecoveryKey  OctagonSignpostNameRecoverOctagonUsingCustodianRecovery Key=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverOctagonUsingCustodianRecoveryKey}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __50__OTClique_createCustodianRecoveryKey_uuid_reply___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    secLogObjForScope("SecError");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "octagon-createcustodianrecoverykey, failed to create octagon custodian recovery key",  (uint8_t *)&v22,  2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    os_signpost_id_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v10 = v9;
    os_signpost_id_t v11 = a1[6];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v12;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v10,  OS_SIGNPOST_INTERVAL_END,  v11,  "CreateCustodianRecoveryKey",  " OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreat eCustodianRecoveryKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v14 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)Nanoseconds / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v14;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CreateCustodianRecoveryKey  OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.tele metry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("octagon-createcustodianrecoverykey");
    unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl( &dword_1804F4000,  v15,  OS_LOG_TYPE_DEFAULT,  "successfully created octagon custodian recovery key",  (uint8_t *)&v22,  2u);
    }

    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v16 = _OctagonSignpostGetNanoseconds(a1[6], a1[7]);
    _OctagonSignpostLogSystem();
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int v18 = v17;
    os_signpost_id_t v19 = a1[6];
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v20 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      int v22 = 67240192;
      LODWORD(v23) = v20;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v18,  OS_SIGNPOST_INTERVAL_END,  v19,  "CreateCustodianRecoveryKey",  " OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.telemetry:number1,name=OctagonSignpostNameCreat eCustodianRecoveryKey}d ",  (uint8_t *)&v22,  8u);
    }

    _OctagonSignpostLogSystem();
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218496;
      int v21 = *(unsigned __int8 *)(*(void *)(a1[5] + 8LL) + 24LL);
      uint64_t v23 = a1[6];
      __int16 v24 = 2048;
      double v25 = (double)v16 / 1000000000.0;
      __int16 v26 = 1026;
      int v27 = v21;
      _os_log_impl( &dword_1804F4000,  v13,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: CreateCustodianRecoveryKey  OctagonSignpostNameCreateCustodianRecoveryKey=%{public,signpost.tele metry:number1,name=OctagonSignpostNameCreateCustodianRecoveryKey}d ",  (uint8_t *)&v22,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[4] + 16LL))();
}

void __56__OTClique_setNewRecoveryKeyWithData_recoveryKey_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    secLogObjForScope("SecError");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "octagon-setrecoverykey, failed to create octagon recovery key",  (uint8_t *)&v19,  2u);
    }

    unint64_t Nanoseconds = _OctagonSignpostGetNanoseconds(a1[7], a1[8]);
    _OctagonSignpostLogSystem();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v7 = v6;
    os_signpost_id_t v8 = a1[7];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      int v9 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v9;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v7,  OS_SIGNPOST_INTERVAL_END,  v8,  "SetNewRecoveryKeyWithData",  " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNew RecoveryKeyWithData}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v11 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
      uint64_t v20 = a1[7];
      __int16 v21 = 2048;
      double v22 = (double)Nanoseconds / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v11;
      _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.teleme try:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  else
  {
    secLogObjForScope("octagon-setrecoverykey");
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( &dword_1804F4000,  v12,  OS_LOG_TYPE_DEFAULT,  "successfully set octagon recovery key",  (uint8_t *)&v19,  2u);
    }

    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    unint64_t v13 = _OctagonSignpostGetNanoseconds(a1[7], a1[8]);
    _OctagonSignpostLogSystem();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = v14;
    os_signpost_id_t v16 = a1[7];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v17 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
      int v19 = 67240192;
      LODWORD(v20) = v17;
      _os_signpost_emit_with_name_impl( &dword_1804F4000,  v15,  OS_SIGNPOST_INTERVAL_END,  v16,  "SetNewRecoveryKeyWithData",  " OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.telemetry:number1,name=OctagonSignpostNameSetNew RecoveryKeyWithData}d ",  (uint8_t *)&v19,  8u);
    }

    _OctagonSignpostLogSystem();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218496;
      int v18 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL);
      uint64_t v20 = a1[7];
      __int16 v21 = 2048;
      double v22 = (double)v13 / 1000000000.0;
      __int16 v23 = 1026;
      int v24 = v18;
      _os_log_impl( &dword_1804F4000,  v10,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs: SetNewRecoveryKeyWithData  OctagonSignpostNameSetNewRecoveryKeyWithData=%{public,signpost.teleme try:number1,name=OctagonSignpostNameSetNewRecoveryKeyWithData}d ",  (uint8_t *)&v19,  0x1Cu);
    }
  }

  (*(void (**)(void))(a1[5] + 16LL))();
}

void __54__OTClique_findOptimalBottleIDsWithContextData_error___block_invoke( void *a1,  void *a2,  void *a3,  void *a4)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  secLogObjForScope("clique-findbottle");
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v23 = 138412290;
      id v24 = v9;
      int v12 = "findOptimalBottleIDsWithContextData errored: %@";
      unint64_t v13 = v10;
      uint32_t v14 = 12;
LABEL_6:
      _os_log_impl(&dword_1804F4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v23, v14);
    }
  }

  else if (v11)
  {
    int v23 = 138412546;
    id v24 = v7;
    __int16 v25 = 2112;
    id v26 = v8;
    int v12 = "findOptimalBottleIDsWithContextData succeeded: %@, %@";
    unint64_t v13 = v10;
    uint32_t v14 = 22;
    goto LABEL_6;
  }

  uint64_t v15 = *(void *)(a1[4] + 8LL);
  os_signpost_id_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  uint64_t v18 = *(void *)(a1[5] + 8LL);
  int v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v7;
  id v20 = v7;

  uint64_t v21 = *(void *)(a1[6] + 8LL);
  double v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v8;
}

void __45__OTClique_fetchEscrowRecordsInternal_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  secLogObjForScope("clique-fetchrecords");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v15 = 138412290;
      id v16 = v6;
      id v9 = "fetchEscrowRecords errored: %@";
LABEL_6:
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 0xCu);
    }
  }

  else if (v8)
  {
    int v15 = 138412290;
    id v16 = v5;
    id v9 = "fetchEscrowRecords succeeded: %@";
    goto LABEL_6;
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
  id v12 = v6;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint32_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v5;
}

void __71__OTClique_performEscrowRecoveryWithContextData_escrowArguments_error___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("clique-recovery");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v11 = 138412290;
      id v12 = v3;
      id v6 = "restore bottle errored: %@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v11) = 0;
    id v6 = "restoring bottle succeeded";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;
}

void __36__OTClique_isCloudServicesAvailable__block_invoke()
{
  dispatch_queue_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1804F4000, v0, OS_LOG_TYPE_DEFAULT, "CloudServices is unavailable on this platform", v1, 2u);
  }
}

@end