@interface IDSKeyTransparencyVerifier
+ (BOOL)isKeyTransparencyEnabled;
+ (IDSKeyTransparencyVerifier)sharedInstance;
+ (id)keyTransparencyApplicationForServiceIdentifier:(id)a3;
+ (id)keyTransparencyServiceIdentifierForTransparencyApplication:(id)a3;
+ (id)keyTransparencyURIPrefixForServiceIdentifier:(id)a3;
+ (id)keyTransparencyVersionNumberForServiceType:(id)a3;
+ (id)strippedURIFromKeyTransparencyURI:(id)a3;
- (BOOL)_isTrustedCandidate:(id)a3 index:(id)a4 givenTrustedDevices:(id)a5;
- (BOOL)isDeviceAccountStateKeyTransparencyEligible;
- (BOOL)isKeyInKVS:(id)a3;
- (BOOL)isOptedInForServiceIdentifier:(id)a3;
- (BOOL)ktShouldClearCacheOnOptInOut;
- (CUTMetricLogger)internalMetricLogger;
- (CUTMetricLogger)productionMetricLogger;
- (IDSCloudKitKeyTransparencyStore)keyTransparencyStore;
- (IDSCurrentServerTime)serverTime;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSKeyTransparencyPolicy)policy;
- (IDSKeyTransparencyRegistrationDataSource)registrationDataSource;
- (IDSKeyTransparencyVerifier)init;
- (IDSKeyTransparencyVerifier)initWithPolicy:(id)a3 serviceToVerifier:(id)a4 keyManager:(id)a5 store:(id)a6 registrationDataSource:(id)a7 internalMetricLogger:(id)a8 productionMetricLogger:(id)a9 serviceToKTOptInManager:(id)a10;
- (IDSPeerIDManager)peerIDManager;
- (IDSPushHandler)pushHandler;
- (IDSRateLimiter)registerUpdateRateLimiter;
- (IDSRateLimiter)selfHealRateLimiter;
- (IDSRegistrationKeyManager)keyManager;
- (IDSRegistrationReasonTracker)registrationReasonTracker;
- (KTVerifier)KTVerifier;
- (NSDate)kickPeerVerificationDate;
- (NSDictionary)optInEligibleKTApplicationToIDSServiceIdentifier;
- (NSDictionary)serviceToOptInManager;
- (NSDictionary)serviceToVerifier;
- (NSMutableDictionary)cacheClearRateLimiterByService;
- (double)keyTransparencyCKContainerExpiryTime;
- (double)keyTransparencyPeerUpdateLastResortFetchInterval;
- (double)ktCacheClearRequestLimitTime;
- (double)ktRegisterUpdateLimitTime;
- (id)SHA256HashForKeyTransparencyTrustedDevice:(id)a3;
- (id)SHA256HashForKeyTransparencyTrustedService:(id)a3;
- (id)SHA256HashForKeyTransparencyTrustedServices:(id)a3;
- (id)_IDSEndpointTransparencyStatesForKTLoggableDatas:(id)a3 index:(id)a4;
- (id)_IDSProtoKeyTransparencyTrustedDeviceForKeyTransparencyIndex:(id)a3 entry:(id)a4;
- (id)_KTDataForIDSKeyTransparencyEntry:(id)a3;
- (id)_KTDatasForIDSKeyTransparencyEntries:(id)a3;
- (id)_KTDatasForIDSProtoKeyTransparencyTrustedDevices:(id)a3 serviceIdentifier:(id)a4;
- (id)_clientErrorForKTResult:(unint64_t)a3 underlyingError:(id)a4;
- (id)_clientErrorWithCode:(int64_t)a3 debugDescription:(id)a4 underlyingError:(id)a5;
- (id)_currentPeerVerificationResultsForQueriedIndex:(id)a3 ticket:(id)a4;
- (id)_currentVerificationResultsForRegisteredIndex:(id)a3 ticket:(id)a4;
- (id)_fetchCurrentKVS;
- (id)_fetchExpiredEntriesFromKVS;
- (id)_keyTransparencyVerifierForServiceIdentifier:(id)a3;
- (id)_mergeCloudKitTrustedDevices:(id)a3 accountKeyTrustedDevices:(id)a4;
- (id)_pruneTrustedDevice:(id)a3 givenEligibleServiceIdentifiers:(id)a4;
- (id)_transparencyTicketForQueryResultsWithIndex:(id)a3 verificationState:(id)a4 entries:(id)a5;
- (id)_verifyKeyTransparencyOfRegisteredIndex:(id)a3 verificationState:(id)a4 entry:(id)a5;
- (id)currentPeerVerificationResultsForQueriedIndex:(id)a3 ticket:(id)a4;
- (id)currentVerificationResultsForRegisteredIndex:(id)a3 ticket:(id)a4;
- (id)fetchKTEligibleServices;
- (id)fetchTrustedDevicesFromKVS;
- (id)forceSyncKVS;
- (id)transparencyTicketForQueryResultsWithIndex:(id)a3 verificationState:(id)a4 entries:(id)a5 localURI:(id)a6;
- (id)transparencyTicketForRegistrationWithIndex:(id)a3 verificationState:(id)a4 entry:(id)a5;
- (int64_t)_IDSEndpointTransparencyVerificationStateForKTResult:(unint64_t)a3;
- (int64_t)_IDSKTAccountStatusForKTAccountStatus:(unint64_t)a3;
- (int64_t)mostRecentKTCDPAccountStatus;
- (unint64_t)_numberOfMatchesForCandidates:(id)a3 index:(id)a4 trustedDevices:(id)a5;
- (unint64_t)ktCacheClearRequestLimit;
- (unint64_t)ktRegisterUpdateRequestLimit;
- (void)_fetchVerificationInfoForService:(id)a3 forURIs:(id)a4 localURI:(id)a5 withCompletion:(id)a6;
- (void)_forceVerificationWithIndex:(id)a3 ticket:(id)a4 completion:(id)a5;
- (void)_fulfillOrFailPromiseSeal:(id)a3 basedOnIndex:(id)a4 KTResult:(unint64_t)a5 ktLoggableDatas:(id)a6 optedIn:(BOOL)a7 error:(id)a8;
- (void)_handleKTCDPStatusUpdate:(id)a3;
- (void)_insertTrustedDeviceToKVS:(id)a3 withMetadata:(id)a4;
- (void)_kickPeerVerificationForURIs:(id)a3 localURI:(id)a4 service:(id)a5 fetchNow:(BOOL)a6 withCompletion:(id)a7;
- (void)_mutateSuccessfulSyncIndicatorOnKTLoggableDatas:(id)a3 forIndex:(id)a4;
- (void)_notifyClientOfKTVerifierResults:(id)a3 forService:(id)a4;
- (void)_presentInternalVerificationAlertWithText:(id)a3;
- (void)_removeObjectsForKeysFromKVS:(id)a3;
- (void)_submitMetricForTrustedDeviceEnrollmentWithKVSResult:(id)a3 kvsSyncTimeInterval:(double)a4;
- (void)_submitMetricsForTrustedDeviceEnrollmentWithCloudKitResult:(id)a3 cloudKitOperationTimeInterval:(double)a4 accountKeyResult:(id)a5 accountKeyOperationTimeInterval:(double)a6;
- (void)_submitMetricsForTrustedDeviceVerificationWithCloudKitResult:(id)a3 cloudKitOperationTimeInterval:(double)a4 accountKeyResult:(id)a5 accountKeyOperationTimeInterval:(double)a6 index:(id)a7 entries:(id)a8;
- (void)cacheClearRequest:(id)a3;
- (void)checkOptInEligibilityForApplication:(id)a3 andFetchSelfVerificationRequestIDWithCompletion:(id)a4;
- (void)clearCacheAndUpdatePeersForService:(id)a3;
- (void)clearTransparencyCacheForService:(id)a3 peerURI:(id)a4;
- (void)currentPeerVerificationResultsForURIVerificationMap:(id)a3 forService:(id)a4 withCompletion:(id)a5;
- (void)fetchCurrentDeviceKVSKey:(id)a3;
- (void)fetchKTCDPStatus:(id)a3;
- (void)fetchKTRegistrationStatusWithCompletion:(id)a3;
- (void)fetchLocalDeviceTrustCircleEligibilityWithCompletion:(id)a3;
- (void)fetchLocalDeviceTrustCircleEligibleServiceIdentifiersWithCompletion:(id)a3;
- (void)fetchPeerVerificationInfoForApplication:(id)a3 forURIs:(id)a4 withCompletion:(id)a5;
- (void)fetchSelfVerificationInfoForApplication:(id)a3 withCompletion:(id)a4;
- (void)forceVerificationWithIndex:(id)a3 ticket:(id)a4 completion:(id)a5;
- (void)getCurrentRegistrationStateWithCompletion:(id)a3;
- (void)getOptInStatesForKTApplications:(id)a3 withCompletion:(id)a4;
- (void)healSelfForApplication:(id)a3 withHealableErrors:(id)a4 withCompletion:(id)a5;
- (void)initiateKTQueryForUris:(id)a3 service:(id)a4 withCompletion:(id)a5;
- (void)kickPeerVerificationForURIs:(id)a3 service:(id)a4 localURI:(id)a5 fetchNow:(BOOL)a6 withCompletion:(id)a7;
- (void)nukeKeyTransparencyStateWithCompletion:(id)a3;
- (void)peerVerificationFinishedWithResults:(id)a3;
- (void)registrationDataNeedsUpdate;
- (void)removeAllKVSEntries;
- (void)repairKVSDeviceEntryIfNeeded;
- (void)reportAccountKeyFetchMetricForService:(id)a3 withSuccess:(BOOL)a4 isAccountMismatch:(BOOL)a5 withError:(id)a6;
- (void)sendOptInUpdateForApplications:(id)a3 withCompletion:(id)a4;
- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4;
- (void)setCacheClearRateLimiterByService:(id)a3;
- (void)setKickPeerVerificationDate:(id)a3;
- (void)setMostRecentKTCDPAccountStatus:(int64_t)a3;
- (void)setRegisterUpdateRateLimiter:(id)a3;
- (void)setSelfHealRateLimiter:(id)a3;
- (void)updateCurrentDeviceInKVS:(id)a3;
- (void)updateKVSWithTrustedDevices:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSKeyTransparencyVerifier

+ (IDSKeyTransparencyVerifier)sharedInstance
{
  if (qword_1009C0D88 != -1) {
    dispatch_once(&qword_1009C0D88, &stru_100904460);
  }
  return (IDSKeyTransparencyVerifier *)(id)qword_1009C0D90;
}

- (IDSKeyTransparencyVerifier)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___IDSKeyTransparencyPolicy);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSRegistrationKeyManager sharedInstance](&OBJC_CLASS___IDSRegistrationKeyManager, "sharedInstance"));
  v5 = objc_alloc_init(&OBJC_CLASS___IDSKeyTransparencyRegistrationDataSource);
  uint64_t v6 = -[IDSKeyTransparencyPolicy isKeyTransparencyEnabled](v3, "isKeyTransparencyEnabled");
  if ((_DWORD)v6)
  {
    v37 = self;
    v38 = v5;
    v39 = v4;
    v8 = objc_alloc(&OBJC_CLASS___KTVerifier);
    uint64_t v9 = kKTApplicationIdentifierIDS;
    v10 = -[KTVerifier initWithApplication:](v8, "initWithApplication:", kKTApplicationIdentifierIDS);
    v11 = objc_alloc(&OBJC_CLASS___KTVerifier);
    uint64_t v12 = kKTApplicationIdentifierIDSFaceTime;
    v13 = -[KTVerifier initWithApplication:](v11, "initWithApplication:", kKTApplicationIdentifierIDSFaceTime);
    v14 = objc_alloc(&OBJC_CLASS___KTVerifier);
    uint64_t v15 = kKTApplicationIdentifierIDSMultiplex;
    v16 = -[KTVerifier initWithApplication:](v14, "initWithApplication:", kKTApplicationIdentifierIDSMultiplex);
    uint64_t v17 = IDSiMessageKeyTransparencyService;
    uint64_t v18 = IDSFaceTimeMultiKeyTransparencyService;
    v44[0] = IDSiMessageKeyTransparencyService;
    v44[1] = IDSFaceTimeMultiKeyTransparencyService;
    v36 = v10;
    v45[0] = v10;
    v45[1] = v13;
    v40 = v16;
    v41 = v13;
    uint64_t v19 = IDSMultiplex1KeyTransparencyService;
    v44[2] = IDSMultiplex1KeyTransparencyService;
    v45[2] = v16;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  3LL));
    v21 = objc_alloc(&OBJC_CLASS___IDSCloudKitKeyTransparencyStore);
    uint64_t v23 = im_primary_queue(v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = -[IDSCloudKitKeyTransparencyStore initWithQueue:](v21, "initWithQueue:", v24);

    v42[0] = v17;
    id v26 = [[KTOptInManager alloc] initWithApplication:v9];
    v43[0] = v26;
    v42[1] = v18;
    id v27 = [[KTOptInManager alloc] initWithApplication:v12];
    v43[1] = v27;
    v42[2] = v19;
    id v28 = [[KTOptInManager alloc] initWithApplication:v15];
    v43[2] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  3LL));

    uint64_t v6 = _os_feature_enabled_impl("IDS", "IDSKTDelayRegistration");
    if ((_DWORD)v6)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      self = v37;
      [v30 addObserver:v37 selector:"_handleKTCDPStatusUpdate:" name:@"TransparencyAccountStatusChanged" object:0];

      v5 = v38;
      v4 = v39;
    }

    else
    {
      v5 = v38;
      v4 = v39;
      self = v37;
    }

    v31 = v36;
  }

  else
  {
    v31 = 0LL;
    v40 = 0LL;
    v41 = 0LL;
    v20 = 0LL;
    v29 = 0LL;
    v25 = 0LL;
  }

  else {
    v32 = 0LL;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[IDSKTAnalyticsLogger logger](&OBJC_CLASS___IDSKTAnalyticsLogger, "logger"));
  v34 = -[IDSKeyTransparencyVerifier initWithPolicy:serviceToVerifier:keyManager:store:registrationDataSource:internalMetricLogger:productionMetricLogger:serviceToKTOptInManager:]( self,  "initWithPolicy:serviceToVerifier:keyManager:store:registrationDataSource:internalMetricLogger:productionMetric Logger:serviceToKTOptInManager:",  v3,  v20,  v4,  v25,  v5,  v32,  v33,  v29);

  return v34;
}

- (IDSKeyTransparencyVerifier)initWithPolicy:(id)a3 serviceToVerifier:(id)a4 keyManager:(id)a5 store:(id)a6 registrationDataSource:(id)a7 internalMetricLogger:(id)a8 productionMetricLogger:(id)a9 serviceToKTOptInManager:(id)a10
{
  id v30 = a3;
  id v31 = a4;
  id v32 = a5;
  id v33 = a6;
  id v34 = a7;
  id v35 = a8;
  id v36 = a9;
  id v17 = a10;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___IDSKeyTransparencyVerifier;
  uint64_t v18 = -[IDSKeyTransparencyVerifier init](&v40, "init");
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_policy, a3);
    objc_storeStrong((id *)&v19->_keyManager, a5);
    objc_storeStrong((id *)&v19->_serviceToVerifier, a4);
    objc_storeStrong((id *)&v19->_serviceToOptInManager, a10);
    objc_storeStrong((id *)&v19->_keyTransparencyStore, a6);
    objc_storeStrong((id *)&v19->_registrationDataSource, a7);
    objc_storeStrong((id *)&v19->_internalMetricLogger, a8);
    objc_storeStrong((id *)&v19->_productionMetricLogger, a9);
    kickPeerVerificationDate = v19->_kickPeerVerificationDate;
    v19->_kickPeerVerificationDate = 0LL;

    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      KTVerifier = v19->_KTVerifier;
      keyTransparencyStore = v19->_keyTransparencyStore;
      internalMetricLogger = v19->_internalMetricLogger;
      productionMetricLogger = v19->_productionMetricLogger;
      *(_DWORD *)buf = 138413570;
      *(void *)&buf[4] = KTVerifier;
      __int16 v42 = 2112;
      v43 = @"com.apple.ids";
      __int16 v44 = 2112;
      uint64_t v45 = IDSiMessageKeyTransparencyService;
      __int16 v46 = 2112;
      v47 = keyTransparencyStore;
      __int16 v48 = 2112;
      v49 = internalMetricLogger;
      __int16 v50 = 2112;
      v51 = productionMetricLogger;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Initialized IDSKeyTransparencyVerifier { KTVerifier: %@, application: %@, service: %@, keyTransparencyStore: %@, internalMetricLogger: %@, productionMetricLogger: %@ }",  buf,  0x3Eu);
    }

    -[IDSKeyTransparencyVerifier _presentInternalVerificationAlertWithText:]( v19,  "_presentInternalVerificationAlertWithText:",  @"🔐 KT initialized");
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v19);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1003D9618;
    v37[3] = &unk_1008F6058;
    objc_copyWeak(&v39, (id *)buf);
    v38 = v19;
    uint64_t v27 = im_primary_queue(v38, v26);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    sub_100301AD8(v37, (uint64_t)@"IDS-KT-List", (uint64_t)v28);

    objc_destroyWeak(&v39);
    objc_destroyWeak((id *)buf);
  }

  return v19;
}

- (IDSPeerIDManager)peerIDManager
{
  return +[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance");
}

- (IDSDAccountController)accountController
{
  return +[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance");
}

- (IDSDServiceController)serviceController
{
  return +[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance");
}

- (IDSCurrentServerTime)serverTime
{
  return +[IDSCurrentServerTime sharedInstance](&OBJC_CLASS___IDSCurrentServerTime, "sharedInstance");
}

- (IDSPushHandler)pushHandler
{
  return +[IDSPushHandler sharedInstance](&OBJC_CLASS___IDSPushHandler, "sharedInstance");
}

- (IDSRateLimiter)selfHealRateLimiter
{
  selfHealRateLimiter = self->_selfHealRateLimiter;
  if (!selfHealRateLimiter)
  {
    v4 = -[IDSRateLimiter initWithLimit:timeLimit:]( objc_alloc(&OBJC_CLASS___IDSRateLimiter),  "initWithLimit:timeLimit:",  3LL,  18000.0);
    v5 = self->_selfHealRateLimiter;
    self->_selfHealRateLimiter = v4;

    selfHealRateLimiter = self->_selfHealRateLimiter;
  }

  return selfHealRateLimiter;
}

- (IDSRateLimiter)registerUpdateRateLimiter
{
  registerUpdateRateLimiter = self->_registerUpdateRateLimiter;
  if (!registerUpdateRateLimiter)
  {
    v4 = objc_alloc(&OBJC_CLASS___IDSRateLimiter);
    unint64_t v5 = -[IDSKeyTransparencyVerifier ktRegisterUpdateRequestLimit](self, "ktRegisterUpdateRequestLimit");
    -[IDSKeyTransparencyVerifier ktRegisterUpdateLimitTime](self, "ktRegisterUpdateLimitTime");
    uint64_t v6 = -[IDSRateLimiter initWithLimit:timeLimit:](v4, "initWithLimit:timeLimit:", v5);
    uint64_t v7 = self->_registerUpdateRateLimiter;
    self->_registerUpdateRateLimiter = v6;

    registerUpdateRateLimiter = self->_registerUpdateRateLimiter;
  }

  return registerUpdateRateLimiter;
}

- (IDSRegistrationReasonTracker)registrationReasonTracker
{
  return +[IDSRegistrationReasonTracker sharedInstance](&OBJC_CLASS___IDSRegistrationReasonTracker, "sharedInstance");
}

+ (BOOL)isKeyTransparencyEnabled
{
  v2 = objc_alloc_init(&OBJC_CLASS___IDSKeyTransparencyPolicy);
  unsigned __int8 v3 = -[IDSKeyTransparencyPolicy isKeyTransparencyEnabled](v2, "isKeyTransparencyEnabled");

  return v3;
}

+ (id)keyTransparencyVersionNumberForServiceType:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___IDSKeyTransparencyPolicy);
  unsigned int v5 = -[IDSKeyTransparencyPolicy isKeyTransparencyEnabledForServiceType:]( v4,  "isKeyTransparencyEnabledForServiceType:",  v3);

  if (v5)
  {
    uint64_t v11 = _IDSKeyTransparencyVersionNumber(v6, v7, v8, v9, v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

- (BOOL)isDeviceAccountStateKeyTransparencyEligible
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned int v4 = [v3 isKeyTransparencyEnabled];

  if (!v4) {
    return 0;
  }
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier registrationDataSource](self, "registrationDataSource"));
  unsigned __int8 v6 = [v5 isiCloudSignedIn];

  return v6;
}

- (void)fetchLocalDeviceTrustCircleEligibilityWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v6 = [v5 isKeyTransparencyEnabled];

  if ((v6 & 1) != 0)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier keyTransparencyStore](self, "keyTransparencyStore"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1003D9D50;
    v9[3] = &unk_1009044E8;
    v9[4] = self;
    id v10 = v4;
    [v7 fetchAccountEligibilityForDeviceToDeviceEncryptionWithCompletion:v9];
  }

  else if (v4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -1000LL,  @"Key transparency is not enabled",  0LL));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v8);
  }
}

- (void)fetchLocalDeviceTrustCircleEligibleServiceIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v6 = [v5 isKeyTransparencyEnabled];

  if ((v6 & 1) != 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1003D9EC0;
    v8[3] = &unk_1008F85F8;
    v8[4] = self;
    id v9 = v4;
    -[IDSKeyTransparencyVerifier fetchLocalDeviceTrustCircleEligibilityWithCompletion:]( self,  "fetchLocalDeviceTrustCircleEligibilityWithCompletion:",  v8);
  }

  else if (v4)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -1000LL,  @"Key transparency is not enabled",  0LL));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v7);
  }
}

- (id)fetchKTEligibleServices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier registrationDataSource](self, "registrationDataSource"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentLocalKeyTransparencyEligibleServiceIdentifiers]);

  return v3;
}

- (id)transparencyTicketForQueryResultsWithIndex:(id)a3 verificationState:(id)a4 entries:(id)a5 localURI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = im_primary_base_queue(v13);
  uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v14);
  dispatch_assert_queue_V2(v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceIdentifier]);
  unsigned __int8 v18 = [v16 isKeyTransparencyEnabledForServiceIdentifier:v17];

  if ((v18 & 1) == 0)
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_1006ACAD0(v10);
    }
    goto LABEL_9;
  }

  if (!-[IDSKeyTransparencyVerifier isDeviceAccountStateKeyTransparencyEligible]( self,  "isDeviceAccountStateKeyTransparencyEligible"))
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_1006ACAA4();
    }
    goto LABEL_9;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier registrationDataSource](self, "registrationDataSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceIdentifier]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v19 currentLocalKeyTransparencyEnrolledURIsForServiceIdentifier:v20]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v13 prefixedURI]);
  if (([v21 containsObject:v22] & 1) == 0)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
    unsigned __int8 v35 = [v26 isKeyTransparencyPeerVerificationAllowedWithoutEnrollment];

    if ((v35 & 1) != 0) {
      goto LABEL_12;
    }
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceIdentifier]);
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v13 prefixedURI]);
      *(_DWORD *)buf = 138412546;
      v37 = v33;
      __int16 v38 = 2112;
      id v39 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Local URI is not enrolled in key transparency -- not not requesting transparency ticket { serviceIdentifier: %@, localURI: %@ }",  buf,  0x16u);
    }

- (void)kickPeerVerificationForURIs:(id)a3 service:(id)a4 localURI:(id)a5 fetchNow:(BOOL)a6 withCompletion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (void (**)(id, void *, void *))a7;
  uint64_t v16 = im_primary_base_queue(v15);
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
  dispatch_assert_queue_V2(v17);

  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v19 = [v18 isKeyTransparencyEnabledForServiceIdentifier:v13];

  if ((v19 & 1) != 0)
  {
    if (!-[IDSKeyTransparencyVerifier isDeviceAccountStateKeyTransparencyEligible]( self,  "isDeviceAccountStateKeyTransparencyEligible"))
    {
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        sub_1006ACB48();
      }

      v24 = self;
      uint64_t v25 = -1100LL;
      goto LABEL_11;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier registrationDataSource](self, "registrationDataSource"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currentLocalKeyTransparencyEnrolledURIsForServiceIdentifier:v13]);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v14 prefixedURI]);
    if ([v21 containsObject:v22])
    {

LABEL_14:
      -[IDSKeyTransparencyVerifier _kickPeerVerificationForURIs:localURI:service:fetchNow:withCompletion:]( self,  "_kickPeerVerificationForURIs:localURI:service:fetchNow:withCompletion:",  v12,  v14,  v13,  v8,  v15);
      goto LABEL_12;
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
    unsigned __int8 v29 = [v28 isKeyTransparencyPeerVerificationAllowedWithoutEnrollment];

    if ((v29 & 1) != 0) {
      goto LABEL_14;
    }
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v13;
      __int16 v32 = 2112;
      id v33 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Local URI is not enrolled in key transparency -- not kicking peer verification { service: %@, localURI: %@ }",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_1006ACB74();
    }
  }

  v24 = self;
  uint64_t v25 = -1000LL;
LABEL_11:
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( v24,  "_clientErrorWithCode:debugDescription:underlyingError:",  v25,  @"Key transparency is not enabled",  0LL));
  v15[2](v15, &__NSArray0__struct, v27);

LABEL_12:
}

- (void)_kickPeerVerificationForURIs:(id)a3 localURI:(id)a4 service:(id)a5 fetchNow:(BOOL)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([v12 count])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1003DA750;
    v17[3] = &unk_100904510;
    id v20 = v15;
    v17[4] = self;
    id v18 = v12;
    id v19 = v14;
    BOOL v21 = a6;
    -[IDSKeyTransparencyVerifier _fetchVerificationInfoForService:forURIs:localURI:withCompletion:]( self,  "_fetchVerificationInfoForService:forURIs:localURI:withCompletion:",  v19,  v18,  v13,  v17);
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -1300LL,  @"Empty uris for _kickPeerVerificationForURIs.",  0LL));
    (*((void (**)(id, void *, void *))v15 + 2))(v15, &__NSArray0__struct, v16);
  }
}

- (void)initiateKTQueryForUris:(id)a3 service:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = im_primary_base_queue(v10);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  dispatch_assert_queue_V2(v12);

  if ([v8 count])
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v15 = objc_msgSend((id)objc_opt_class(self, v14), "keyTransparencyURIPrefixForServiceIdentifier:", v9);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if (v16)
    {
      id v26 = v10;
      id v27 = v9;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v17 = v8;
      id v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          BOOL v21 = 0LL;
          do
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingString:v22]);

            -[NSMutableArray addObject:](v13, "addObject:", v23);
            BOOL v21 = (char *)v21 + 1;
          }

          while (v19 != v21);
          id v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }

        while (v19);
      }

      id v10 = v26;
      id v9 = v27;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _keyTransparencyVerifierForServiceIdentifier:]( self,  "_keyTransparencyVerifierForServiceIdentifier:",  v9));
    if (v24)
    {
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v35 = v8;
        __int16 v36 = 2112;
        id v37 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Calling in to start Transparency query { uris: %@ service: %@ }",  buf,  0x16u);
      }

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_1003DAC0C;
      v28[3] = &unk_1008F98D0;
      id v29 = v10;
      [v24 initiateQueryForUris:v13 completionBlock:v28];
    }
  }

  else
  {
    id v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -1200LL,  @"Empty uris for initiateKTQueryForUris.",  0LL));
    (*((void (**)(id, NSMutableArray *))v10 + 2))(v10, v13);
  }
}

- (id)transparencyTicketForRegistrationWithIndex:(id)a3 verificationState:(id)a4 entry:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = im_primary_base_queue(v10);
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceIdentifier]);
  unsigned __int8 v15 = [v13 isKeyTransparencyEnabledForServiceIdentifier:v14];

  if ((v15 & 1) == 0)
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_1006ACAD0(v8);
    }
    goto LABEL_11;
  }

  if (!-[IDSKeyTransparencyVerifier isDeviceAccountStateKeyTransparencyEligible]( self,  "isDeviceAccountStateKeyTransparencyEligible"))
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_1006ACAA4();
    }
LABEL_11:

    uint64_t v22 = 0LL;
    goto LABEL_12;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 transparencyStatus]);
  id v17 = [v16 integerValue];

  if (v17) {
    id v18 = @"☠️";
  }
  else {
    id v18 = @"✅";
  }
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 URI]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 transparencyStatus]);
  BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"✏️ 🔓 %@\nKT registration\n{ %@, %@ }",  v18,  v19,  v20));
  -[IDSKeyTransparencyVerifier _presentInternalVerificationAlertWithText:]( self,  "_presentInternalVerificationAlertWithText:",  v21);

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _verifyKeyTransparencyOfRegisteredIndex:verificationState:entry:]( self,  "_verifyKeyTransparencyOfRegisteredIndex:verificationState:entry:",  v8,  v9,  v10));
LABEL_12:

  return v22;
}

- (id)_pruneTrustedDevice:(id)a3 givenEligibleServiceIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedDevice);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 data]);
  id v9 = -[IDSProtoKeyTransparencyTrustedDevice initWithData:](v7, "initWithData:", v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 trustedServices]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003DAF04;
  v15[3] = &unk_100904538;
  id v16 = v5;
  id v11 = v5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "__imArrayByFilteringWithBlock:", v15));
  id v13 = [v12 mutableCopy];

  -[IDSProtoKeyTransparencyTrustedDevice setTrustedServices:](v9, "setTrustedServices:", v13);
  return v9;
}

- (id)currentPeerVerificationResultsForQueriedIndex:(id)a3 ticket:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = im_primary_base_queue(v7);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
  unsigned __int8 v12 = [v10 isKeyTransparencyEnabledForServiceIdentifier:v11];

  if ((v12 & 1) == 0)
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1006ACC68(v6);
    }

    unsigned __int8 v15 = @"Key transparency is not enabled";
    id v16 = self;
    uint64_t v17 = -1000LL;
    goto LABEL_10;
  }

  if (!-[IDSKeyTransparencyVerifier isDeviceAccountStateKeyTransparencyEligible]( self,  "isDeviceAccountStateKeyTransparencyEligible"))
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1006ACC3C();
    }

    unsigned __int8 v15 = @"The local device is not eligible for key transparency due to account status";
    id v16 = self;
    uint64_t v17 = -1100LL;
LABEL_10:
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( v16,  "_clientErrorWithCode:debugDescription:underlyingError:",  v17,  v15,  0LL));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise failedPromiseWithError:]( &OBJC_CLASS___CUTUnsafePromise,  "failedPromiseWithError:",  v19));

    goto LABEL_11;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _currentPeerVerificationResultsForQueriedIndex:ticket:]( self,  "_currentPeerVerificationResultsForQueriedIndex:ticket:",  v6,  v7));
LABEL_11:

  return v13;
}

- (id)currentVerificationResultsForRegisteredIndex:(id)a3 ticket:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = im_primary_base_queue(v7);
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
  unsigned __int8 v12 = [v10 isKeyTransparencyEnabledForServiceIdentifier:v11];

  if ((v12 & 1) == 0)
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1006ACD0C(v6);
    }

    unsigned __int8 v15 = @"Key transparency is not enabled";
    id v16 = self;
    uint64_t v17 = -1000LL;
    goto LABEL_10;
  }

  if (!-[IDSKeyTransparencyVerifier isDeviceAccountStateKeyTransparencyEligible]( self,  "isDeviceAccountStateKeyTransparencyEligible"))
  {
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1006ACCE0();
    }

    unsigned __int8 v15 = @"The local device is not eligible for key transparency due to account status";
    id v16 = self;
    uint64_t v17 = -1100LL;
LABEL_10:
    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( v16,  "_clientErrorWithCode:debugDescription:underlyingError:",  v17,  v15,  0LL));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise failedPromiseWithError:]( &OBJC_CLASS___CUTUnsafePromise,  "failedPromiseWithError:",  v19));

    goto LABEL_11;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _currentVerificationResultsForRegisteredIndex:ticket:]( self,  "_currentVerificationResultsForRegisteredIndex:ticket:",  v6,  v7));
LABEL_11:

  return v13;
}

- (void)forceVerificationWithIndex:(id)a3 ticket:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  uint64_t v11 = im_primary_base_queue(v10);
  unsigned __int8 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceIdentifier]);
  unsigned __int8 v15 = [v13 isKeyTransparencyEnabledForServiceIdentifier:v14];

  if ((v15 & 1) != 0)
  {
    -[IDSKeyTransparencyVerifier _forceVerificationWithIndex:ticket:completion:]( self,  "_forceVerificationWithIndex:ticket:completion:",  v8,  v9,  v10);
  }

  else
  {
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1006ACD84(v8);
    }

    if (v10)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -1000LL,  @"Key transparency is not enabled",  0LL));
      v10[2](v10, v17);
    }
  }
}

- (void)nukeKeyTransparencyStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Nuking KT verification state", buf, 2u);
  }

  uint64_t v7 = im_primary_base_queue(v6);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_assert_queue_V2(v8);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceToVerifier](self, "serviceToVerifier"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allValues]);

  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        unsigned __int8 v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v14);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_1003DB590;
        v17[3] = &unk_100900AF0;
        id v16 = v4;
        v17[4] = self;
        id v18 = v16;
        [v15 clearState:v17];

        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v12);
  }
}

- (void)currentPeerVerificationResultsForURIVerificationMap:(id)a3 forService:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v13 = [v12 isKeyTransparencyEnabledForServiceIdentifier:v9];

  if ((v13 & 1) != 0)
  {
    id v37 = v11;
    id v34 = v10;
    group = dispatch_group_create();
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v35 = v8;
    id v14 = v8;
    id v39 = [v14 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v48;
      do
      {
        for (i = 0LL; i != v39; i = (char *)i + 1)
        {
          if (*(void *)v48 != v38) {
            objc_enumerationMutation(v14);
          }
          uint64_t v17 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
          id v18 = objc_msgSend((id)objc_opt_class(self, v15), "keyTransparencyURIPrefixForServiceIdentifier:", v9);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          __int128 v20 = v19;
          if (v19)
          {
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingString:v17]);
            __int128 v22 = self;
            id v23 = v9;
            v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _keyTransparencyVerifierForServiceIdentifier:]( self,  "_keyTransparencyVerifierForServiceIdentifier:",  v9));
            uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              id v26 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v17]);
              *(_DWORD *)buf = 138412546;
              id v52 = v21;
              __int16 v53 = 2112;
              v54 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Fetching verification status. { uri: %@, UUID: %@ }",  buf,  0x16u);
            }

            dispatch_group_enter(group);
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v17]);
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472LL;
            v43[2] = sub_1003DBA98;
            void v43[3] = &unk_100904560;
            __int16 v44 = v37;
            uint64_t v45 = v17;
            __int16 v46 = group;
            [v24 getValidatePeerResult:v21 uuid:v27 completionBlock:v43];

            id v9 = v23;
            self = v22;
          }
        }

        id v39 = [v14 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }

      while (v39);
    }

    uint64_t v30 = im_primary_queue(v28, v29);
    __int128 v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v30);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1003DBC88;
    block[3] = &unk_1008F6358;
    id v10 = v34;
    id v42 = v34;
    id v11 = v37;
    v41 = v37;
    __int128 v32 = group;
    dispatch_group_notify(group, v31, block);

    id v8 = v35;
  }

  else
  {
    __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Key Transparency is disabled for service, not fetching peer verification results. { serviceIdentifier: %@ }",  buf,  0xCu);
    }

    __int128 v32 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -1000LL,  @"Key Transparency is not enabled.",  0LL));
    (*((void (**)(id, NSMutableDictionary *, dispatch_group_s *))v10 + 2))(v10, v11, v32);
  }
}

- (id)_transparencyTicketForQueryResultsWithIndex:(id)a3 verificationState:(id)a4 entries:(id)a5
{
  id v8 = (os_log_s *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v43 = v8;
    __int16 v44 = 2112;
    id v45 = v9;
    __int16 v46 = 2112;
    id v47 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Performing KT verification of query { index: %@, state: %@, entries: %@ }",  buf,  0x20u);
  }

  uint64_t v13 = im_primary_base_queue(v12);
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _KTDatasForIDSKeyTransparencyEntries:]( self,  "_KTDatasForIDSKeyTransparencyEntries:",  v10));
  uint64_t v17 = (void *)objc_opt_class(self, v16);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s serviceIdentifier](v8, "serviceIdentifier"));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v17 keyTransparencyURIPrefixForServiceIdentifier:v18]);

  objc_super v40 = v15;
  if (v19)
  {
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s URI](v8, "URI"));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 prefixedURI]);
    id v35 = v19;
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 stringByAppendingString:v21]);

    uint64_t v23 = objc_claimAutoreleasedReturnValue(-[os_log_s accountKey](v8, "accountKey"));
    id v39 = v9;
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v9 transparencyBlob]);
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_1006ACE7C((uint64_t)v22, v15);
    }
    id v38 = v10;

    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s serviceIdentifier](v8, "serviceIdentifier"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _keyTransparencyVerifierForServiceIdentifier:]( self,  "_keyTransparencyVerifierForServiceIdentifier:",  v26));

    id v41 = 0LL;
    __int16 v36 = (void *)v24;
    id v37 = (void *)v23;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( [v27 validatePeerUri:v22 accountKey:v23 loggableDatas:v15 queryResponse:v24 error:&v41]);
    id v29 = v41;
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v43 = v22;
      __int16 v44 = 2112;
      id v45 = v29;
      __int16 v46 = 2112;
      id v47 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Finished requesting KT ticket for query { KTURI: %@, error: %@, ticket: %@ }",  buf,  0x20u);
    }

    if (v29) {
      __int128 v31 = @"☠️";
    }
    else {
      __int128 v31 = @"✅";
    }
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v29 code]));
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"🔍 🔐 %@\nKT peer-verify ticket\n{ %@, %@ }",  v31,  v22,  v32));
    -[IDSKeyTransparencyVerifier _presentInternalVerificationAlertWithText:]( self,  "_presentInternalVerificationAlertWithText:",  v33);

    id v10 = v38;
    id v9 = v39;
    __int128 v19 = v35;
  }

  else
  {
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1006ACDFC(v8, v22);
    }
    uint64_t v28 = 0LL;
  }

  return v28;
}

- (id)_currentPeerVerificationResultsForQueriedIndex:(id)a3 ticket:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v36 = v6;
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Requesting KT verification results of query { index: %@, ticket: %@ }",  buf,  0x16u);
  }

  uint64_t v10 = im_primary_base_queue(v9);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  dispatch_assert_queue_V2(v11);

  id v12 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
  id v14 = (void *)objc_opt_class(self, v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 keyTransparencyURIPrefixForServiceIdentifier:v15]);

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 URI]);
  if (!v7 || !v17)
  {
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1006ACF08(v6, (uint64_t)v7, v24);
    }

    uint64_t v25 = @"Peer verification requires non-nil URI and ticket";
    goto LABEL_13;
  }

  if (!v16)
  {
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1006ACF94(v6, v26);
    }

    uint64_t v25 = @"Invalid index provided (unrecognized service identifier)";
LABEL_13:
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -7000LL,  v25,  0LL));
    [v12 failWithError:v22];
    goto LABEL_14;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 URI]);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 prefixedURI]);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingString:v19]);

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _keyTransparencyVerifierForServiceIdentifier:]( self,  "_keyTransparencyVerifierForServiceIdentifier:",  v21));

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1003DC360;
  v29[3] = &unk_1009045C8;
  id v30 = v20;
  id v31 = v7;
  __int128 v32 = self;
  id v33 = v12;
  id v34 = v6;
  id v23 = v20;
  [v22 getValidatePeerResult:v23 uuid:v31 completionBlock:v29];

LABEL_14:
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v12 promise]);

  return v27;
}

- (void)_forceVerificationWithIndex:(id)a3 ticket:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Forcing KT verification results of trusted devices results { index: %@, ticket: %@ }",  buf,  0x16u);
  }

  uint64_t v13 = im_primary_base_queue(v12);
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v13);
  dispatch_assert_queue_V2(v14);

  uint64_t v16 = (void *)objc_opt_class(self, v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceIdentifier]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 keyTransparencyURIPrefixForServiceIdentifier:v17]);

  if (v18)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 URI]);
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 prefixedURI]);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingString:v20]);

    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Calling in to force KT validation { KTURI: %@ }",  buf,  0xCu);
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceIdentifier]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _keyTransparencyVerifierForServiceIdentifier:]( self,  "_keyTransparencyVerifierForServiceIdentifier:",  v23));

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1003DC7EC;
    v27[3] = &unk_1009045F0;
    id v28 = v21;
    id v29 = v9;
    id v30 = self;
    id v31 = v10;
    id v25 = v21;
    [v24 forceValidateUUID:v29 uri:v25 completionBlock:v27];

    goto LABEL_11;
  }

  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_1006AD014(v8, v26);
  }

  if (v10)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -7000LL,  @"Invalid index provided (unrecognized service identifier)",  0LL));
    (*((void (**)(id, void *))v10 + 2))(v10, v24);
LABEL_11:
  }
}

- (id)_verifyKeyTransparencyOfRegisteredIndex:(id)a3 verificationState:(id)a4 entry:(id)a5
{
  id v8 = (os_log_s *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = im_primary_base_queue(v10);
  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v11);
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v42 = v8;
    __int16 v43 = 2112;
    id v44 = v9;
    __int16 v45 = 2112;
    id v46 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Performing KT verification of registration { index: %@, state: %@, entry: %@ }",  buf,  0x20u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _KTDataForIDSKeyTransparencyEntry:]( self,  "_KTDataForIDSKeyTransparencyEntry:",  v10));
  uint64_t v16 = (void *)objc_opt_class(self, v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s serviceIdentifier](v8, "serviceIdentifier"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 keyTransparencyURIPrefixForServiceIdentifier:v17]);

  id v39 = v14;
  if (v18)
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s URI](v8, "URI"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 prefixedURI]);
    __int16 v34 = v18;
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingString:v20]);

    uint64_t v22 = objc_claimAutoreleasedReturnValue(-[os_log_s accountKey](v8, "accountKey"));
    id v38 = v9;
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v9 transparencyBlob]);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_1006AD114((uint64_t)v21, v14);
    }
    id v37 = v10;

    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s serviceIdentifier](v8, "serviceIdentifier"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _keyTransparencyVerifierForServiceIdentifier:]( self,  "_keyTransparencyVerifierForServiceIdentifier:",  v25));

    id v40 = 0LL;
    id v35 = (void *)v23;
    id v36 = (void *)v22;
    id v27 = (void *)objc_claimAutoreleasedReturnValue( [v26 validateEnrollmentUri:v21 accountKey:v22 loggableData:v14 insertResponse:v23 error:&v40]);
    id v28 = v40;
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v42 = v21;
      __int16 v43 = 2112;
      id v44 = v28;
      __int16 v45 = 2112;
      id v46 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Finished requesting KT ticket for registration { KTURI: %@, error: %@, ticket: %@ }",  buf,  0x20u);
    }

    if (v28) {
      id v30 = @"☠️";
    }
    else {
      id v30 = @"✅";
    }
    id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v28 code]));
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"✏️ 🔐 %@\nKT enroll ticket\n{ %@, %@ }",  v30,  v21,  v31));
    -[IDSKeyTransparencyVerifier _presentInternalVerificationAlertWithText:]( self,  "_presentInternalVerificationAlertWithText:",  v32);

    id v10 = v37;
    id v9 = v38;
    id v18 = v34;
  }

  else
  {
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1006AD094(v8, v21);
    }
    id v27 = 0LL;
  }

  return v27;
}

- (id)_currentVerificationResultsForRegisteredIndex:(id)a3 ticket:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v6;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Requesting KT verification results of registration { index: %@, ticket: %@ }",  buf,  0x16u);
  }

  uint64_t v10 = im_primary_base_queue(v9);
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
  dispatch_assert_queue_V2(v11);

  id v12 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
  id v14 = (void *)objc_opt_class(self, v13);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 keyTransparencyURIPrefixForServiceIdentifier:v15]);

  if (v16)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 URI]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 prefixedURI]);
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingString:v18]);

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _keyTransparencyVerifierForServiceIdentifier:]( self,  "_keyTransparencyVerifierForServiceIdentifier:",  v20));

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1003DCFB0;
    v26[3] = &unk_100904618;
    id v27 = v19;
    id v28 = v7;
    id v29 = self;
    id v30 = v12;
    id v31 = v6;
    id v22 = v19;
    [v21 validateEnrollmentResult:v22 uuid:v28 completionBlock:v26];
  }

  else
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1006AD094(v6, v23);
    }

    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -7000LL,  @"Invalid index provided (unrecognized service identifier)",  0LL));
    [v12 failWithError:v21];
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v12 promise]);
  return v24;
}

- (void)_fulfillOrFailPromiseSeal:(id)a3 basedOnIndex:(id)a4 KTResult:(unint64_t)a5 ktLoggableDatas:(id)a6 optedIn:(BOOL)a7 error:(id)a8
{
  BOOL v9 = a7;
  id v19 = a3;
  id v14 = a4;
  id v15 = a6;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorForKTResult:underlyingError:]( self,  "_clientErrorForKTResult:underlyingError:",  a5,  a8));
  if (v16)
  {
    [v19 failWithError:v16];
  }

  else
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___IDSKTVerificationResult);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _IDSEndpointTransparencyStatesForKTLoggableDatas:index:]( self,  "_IDSEndpointTransparencyStatesForKTLoggableDatas:index:",  v15,  v14));
    [v17 setEndpointTransparencyStates:v18];
    [v17 setOptedIn:v9];
    [v19 fulfillWithValue:v17];
  }
}

- (void)_mutateSuccessfulSyncIndicatorOnKTLoggableDatas:(id)a3 forIndex:(id)a4
{
  id v5 = a3;
  id v32 = a4;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id obj = v5;
  id v30 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v42;
    do
    {
      for (i = 0LL; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v32 URI]);
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier peerIDManager](self, "peerIDManager"));
        id v47 = v8;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v32 serviceIdentifier]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 endpointsForURIs:v10 service:v11 fromURI:v8]);

        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v8]);
        id v14 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v38;
          while (2)
          {
            for (j = 0LL; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v38 != v15) {
                objc_enumerationMutation(v13);
              }
              id v17 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)j);
              if ([v17 mismatchedAccountFlag])
              {
                LODWORD(v14) = [v17 mismatchedAccountFlag];
                goto LABEL_16;
              }
            }

            id v14 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

- (id)_clientErrorForKTResult:(unint64_t)a3 underlyingError:(id)a4
{
  id v6 = a4;
  id v7 = 0LL;
  switch(a3)
  {
    case 0uLL:
      id v8 = @"Transparency verification resulted in a failure";
      goto LABEL_6;
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
      id v8 = @"Transparency results are currently pending";
      BOOL v9 = self;
      uint64_t v10 = -6100LL;
      goto LABEL_7;
    case 3uLL:
      id v8 = @"Transparency verification resulted in a failure which was ignored";
      goto LABEL_6;
    default:
      id v8 = @"Received unknown verification result";
LABEL_6:
      BOOL v9 = self;
      uint64_t v10 = -6000LL;
LABEL_7:
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( v9,  "_clientErrorWithCode:debugDescription:underlyingError:",  v10,  v8,  v6));
LABEL_8:

      return v7;
  }

- (void)checkOptInEligibilityForApplication:(id)a3 andFetchSelfVerificationRequestIDWithCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v9 = [v8 isKeyTransparencyEnabled];

  if ((v9 & 1) == 0)
  {
    __int128 v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100694A58();
    }

    uint64_t v37 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  -1000LL,  0LL));
    goto LABEL_22;
  }

  if (![v6 isEqualToString:kKTApplicationIdentifierIDS]
    || (id v10 = IDSiMessageKeyTransparencyService) == 0LL)
  {
    __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_1006AD198();
    }

    uint64_t v37 = objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -8001LL,  @"Invalid Service for Opt in",  0LL));
LABEL_22:
    uint64_t v11 = (void *)v37;
    (*((void (**)(id, void, void, uint64_t))v7 + 2))(v7, 0LL, 0LL, v37);
    goto LABEL_23;
  }

  uint64_t v11 = v10;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyRegistrationDataSource currentLocalKeyTransparencyEligibleServiceIdentifiers]( self->_registrationDataSource,  "currentLocalKeyTransparencyEligibleServiceIdentifiers"));
  unsigned int v13 = [v12 containsObject:v11];

  if (v13)
  {
    __int128 v43 = (void (**)(void, void, void, void))v7;
    id v44 = v6;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self, "accountController"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self, "serviceController"));
    __int128 v42 = v11;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceWithIdentifier:v11]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 accountsOnService:v16]);

    id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id v19 = v17;
    id v20 = [v19 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v49 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v48 + 1) + 8 * (void)i) registration]);
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 uris]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "__imArrayByApplyingBlock:", &stru_100904638));

          -[NSMutableSet addObjectsFromArray:](v18, "addObjectsFromArray:", v26);
        }

        id v21 = [v19 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }

      while (v21);
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v18, "allObjects"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQueryUtilities accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:]( &OBJC_CLASS___IDSQueryUtilities,  "accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:",  v19,  0LL,  v27,  0LL));

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQueryUtilities URIToQueryFrom:withPreferredFromURI:]( &OBJC_CLASS___IDSQueryUtilities,  "URIToQueryFrom:withPreferredFromURI:",  v28,  0LL));
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    id v31 = v30;
    if (v29)
    {
      id v7 = v43;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Performing hard query for KT opt in.",  buf,  2u);
      }

      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier peerIDManager](self, "peerIDManager"));
      __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v18, "allObjects"));
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v28 _registrationCert]);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_1003DDBC8;
      void v45[3] = &unk_100904660;
      id v46 = v43;
      LOBYTE(v41) = 0;
      uint64_t v11 = v42;
      [v32 startQueryForURIs:v33 fromIdentity:v34 fromURI:v29 fromService:v42 forSending:0 forRefresh:1 isForced:v41 reason:@"KTOptIn" completionBlock:v45];

      __int128 v35 = v46;
    }

    else
    {
      id v7 = v43;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1006AD1FC();
      }

      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  -8002LL,  0LL));
      ((void (**)(void, void, void, void *))v43)[2](v43, 0LL, 0LL, v35);
      uint64_t v11 = v42;
    }

    id v6 = v44;
  }

  else
  {
    __int128 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1006AD228();
    }

    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -8003LL,  @"Mismatched Account",  0LL));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v40);
  }

- (void)sendOptInUpdateForApplications:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v9 = [v8 isKeyTransparencyEnabled];

  if ((v9 & 1) == 0)
  {
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100694A58();
    }

    id v17 = objc_alloc(&OBJC_CLASS___IDSKTOptInResult);
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  -1000LL,  0LL));
    id v18 = [v17 initWithSuccess:0 optedInOutURIs:0 serverSMTByURI:0 error:v14];
    goto LABEL_12;
  }

  if (![v6 count])
  {
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1006AD254();
    }

    id v20 = objc_alloc(&OBJC_CLASS___IDSKTOptInResult);
    id v14 = (id)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -8000LL,  @"No kt applications provided for opt in status update.",  0LL));
    id v18 = [v20 initWithSuccess:0 serverProvidedSMT:0 error:v14];
LABEL_12:
    id v13 = v18;
    v7[2](v7, v18);
    goto LABEL_18;
  }

  uint64_t v10 = kKTApplicationIdentifierIDS;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kKTApplicationIdentifierIDS]);

  if (v11)
  {
    id v12 = IDSiMessageKeyTransparencyService;
    id v13 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:v10]);
    if (!v12)
    {
      id v14 = 0LL;
      goto LABEL_18;
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1003DDED8;
    v24[3] = &unk_1009046B0;
    id v14 = v12;
    id v25 = v14;
    id v28 = v7;
    id v26 = self;
    id v13 = v13;
    id v27 = v13;
    -[IDSKeyTransparencyVerifier fetchLocalDeviceTrustCircleEligibleServiceIdentifiersWithCompletion:]( self,  "fetchLocalDeviceTrustCircleEligibleServiceIdentifiersWithCompletion:",  v24);

    uint64_t v15 = v25;
  }

  else
  {
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1006AD280();
    }

    id v22 = objc_alloc(&OBJC_CLASS___IDSKTOptInResult);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -8000LL,  @"No kt applications provided for opt in status update.",  0LL));
    id v23 = [v22 initWithSuccess:0 serverProvidedSMT:0 error:v15];
    v7[2](v7, v23);

    id v14 = 0LL;
    id v13 = 0LL;
  }

LABEL_18:
}

- (void)sendOptInUpdateRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationsToOptInStatusData]);

  if (v8)
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationsToOptInStatusData]);
    uint64_t v10 = kKTApplicationIdentifierIDS;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kKTApplicationIdentifierIDS]);

    if (!v11)
    {
      __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1006AD280();
      }

      id v34 = objc_alloc(&OBJC_CLASS___IDSKTOptInResult);
      id v30 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -8000LL,  @"No kt applications provided for opt in status update.",  0LL));
      id v35 = [v34 initWithSuccess:0 serverProvidedSMT:0 error:v30];
      v7[2](v7, v35);

      id v26 = 0LL;
      id v13 = 0LL;
      goto LABEL_27;
    }

    id v46 = v7;
    id v45 = IDSiMessageKeyTransparencyService;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationsToOptInStatusData]);
    id v13 = (id)objc_claimAutoreleasedReturnValue([v12 objectForKey:v10]);

    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v56 = 0u;
    __int128 v55 = 0u;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationsToOptInStatusData]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);

    id v16 = [v15 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v56;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v56 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8LL * (void)i);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationsToOptInStatusData]);
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:v20]);

          id v24 = objc_msgSend( (id)objc_opt_class(self, v23),  "keyTransparencyServiceIdentifierForTransparencyApplication:",  v20);
          id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          [v22 setServiceIdentifier:v25];
        }

        id v17 = [v15 countByEnumeratingWithState:&v55 objects:v63 count:16];
      }

      while (v17);
    }

    id v26 = v45;
    if (v45)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v13 optInStatus]);
      unsigned int v28 = [v27 BOOLValue];

      id v7 = v46;
      if (v28)
      {
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v60 = v45;
          __int16 v61 = 2112;
          id v62 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Trying to send opt in. {serviceIdentifier: %@, optInOutStatusData: %@}",  buf,  0x16u);
        }

        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472LL;
        v50[2] = sub_1003DE820;
        v50[3] = &unk_1009046B0;
        id v26 = v45;
        id v51 = v26;
        v54 = v46;
        id v52 = self;
        id v53 = v6;
        -[IDSKeyTransparencyVerifier fetchLocalDeviceTrustCircleEligibleServiceIdentifiersWithCompletion:]( self,  "fetchLocalDeviceTrustCircleEligibleServiceIdentifiersWithCompletion:",  v50);

        id v30 = v51;
      }

      else
      {
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self, "accountController"));
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self, "serviceController"));
        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 serviceWithIdentifier:v45]);
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v36 appleIDAccountOnService:v38]);

        if (!v30
          || (int)[v30 registrationStatus] < 3
          || (__int128 v39 = (void *)objc_claimAutoreleasedReturnValue([v30 primaryRegistration]),
              __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 registrationCert]),
              v40,
              v39,
              !v40))
        {
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self, "accountController"));
          __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self, "serviceController"));
          __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v42 serviceWithIdentifier:IDSMultiplex1KeyTransparencyService]);
          uint64_t v44 = objc_claimAutoreleasedReturnValue([v41 appleIDAccountOnService:v43]);

          id v30 = (void *)v44;
        }

        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_1003DEBA8;
        v47[3] = &unk_100904688;
        v47[4] = self;
        id v26 = v45;
        id v48 = v26;
        __int128 v49 = v46;
        [v30 updateKTOptInStatusWithRequest:v6 withCompletion:v47];
      }

- (BOOL)isOptedInForServiceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v6 = [v5 isKeyTransparencyEnabledForServiceIdentifier:v4];

  if ((v6 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceToOptInManager](self, "serviceToOptInManager"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);

    if (v8)
    {
      unsigned int v9 = [v8 getOptInState];
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = @"NO";
        if (v9) {
          uint64_t v11 = @"YES";
        }
        int v13 = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        id v16 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Found opt in manager for service. { serviceIdentifier: %@, optInState: %@ }",  (uint8_t *)&v13,  0x16u);
      }
    }

    else
    {
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "No valid opt in manager found for service { serviceIdentifier: %@ }",  (uint8_t *)&v13,  0xCu);
      }

      LOBYTE(v9) = 0;
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "Key Transparency is not enabled for service { serviceIdentifier: %@ }",  (uint8_t *)&v13,  0xCu);
    }

    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)getOptInStatesForKTApplications:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = im_primary_base_queue(v7);
  unsigned int v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  dispatch_assert_queue_V2(v9);

  if (![v6 count])
  {
LABEL_16:
    v7[2](v7, &__NSDictionary0__struct);
    goto LABEL_17;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v11 = [v10 isKeyTransparencyEnabled];

  if ((v11 & 1) == 0)
  {
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1006AD2D8();
    }

    goto LABEL_16;
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  int v13 = dispatch_group_create();
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v27 = v6;
  id obj = v6;
  id v14 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        dispatch_group_enter(v13);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v40 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Calling into Transparency to get opt in state for application: %@",  buf,  0xCu);
        }

        id v20 = [[KTOptInStateRequest alloc] initWithApplication:v18];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_1003DF290;
        v32[3] = &unk_1009046D8;
        v32[4] = v18;
        __int128 v33 = v12;
        id v34 = v13;
        +[KTOptInManager getOptInState:completion:](&OBJC_CLASS___KTOptInManager, "getOptInState:completion:", v20, v32);
      }

      id v15 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v15);
  }

  uint64_t v23 = im_primary_queue(v21, v22);
  id v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1003DF428;
  block[3] = &unk_1008F6358;
  id v30 = v12;
  id v31 = v7;
  id v25 = v12;
  dispatch_group_notify(v13, v24, block);

  id v6 = v27;
LABEL_17:
}

- (void)clearCacheAndUpdatePeersForService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self, "accountController"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self, "serviceController"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceWithIdentifier:v5]);
    id v46 = (void *)objc_claimAutoreleasedReturnValue([v6 appleIDAccountOnService:v8]);

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self, "accountController"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self, "serviceController"));
    id v48 = v5;
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceWithIdentifier:v5]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 accountsOnService:v11]);

    int v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v57 objects:v64 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v58;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v58 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v57 + 1) + 8 * (void)i) registration]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 uris]);

          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "__imArrayByApplyingBlock:", &stru_1009046F8));
          -[NSMutableSet addObjectsFromArray:](v13, "addObjectsFromArray:", v21);
        }

        id v16 = [v14 countByEnumeratingWithState:&v57 objects:v64 count:16];
      }

      while (v16);
    }

    id v47 = self;
    id v45 = v14;

    uint64_t v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    uint64_t v23 = v13;
    id v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v53,  v63,  16LL);
    id v4 = v48;
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v54;
      do
      {
        for (j = 0LL; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v54 != v26) {
            objc_enumerationMutation(v23);
          }
          unsigned int v28 = *(const void **)(*((void *)&v53 + 1) + 8LL * (void)j);
          uint64_t v29 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier peerIDManager](v47, "peerIDManager", v45));
          id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 activeURIsFromURI:v28 service:v4]);
          id v32 = [v31 mutableCopy];

          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v23, "allObjects"));
          [v32 removeObjectsInArray:v33];

          -[NSMutableSet addObjectsFromArray:](v29, "addObjectsFromArray:", v32);
          if (v29) {
            CFDictionarySetValue((CFMutableDictionaryRef)v22, v28, v29);
          }

          id v4 = v48;
        }

        id v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v53,  v63,  16LL);
      }

      while (v25);
    }

    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v22, "allKeys"));
    id v35 = [v34 countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v50;
      do
      {
        for (k = 0LL; k != v36; k = (char *)k + 1)
        {
          if (*(void *)v50 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)k);
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v39, v45));
          uint64_t v41 = v40;
          if (v40 && [v40 count])
          {
            __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 allObjects]);
            [v46 askPeersToClearCacheWithURIs:v42 fromURI:v39 forService:v4];
          }
        }

        id v36 = [v34 countByEnumeratingWithState:&v49 objects:v62 count:16];
      }

      while (v36);
    }

    if (-[IDSKeyTransparencyVerifier ktShouldClearCacheOnOptInOut](v47, "ktShouldClearCacheOnOptInOut"))
    {
      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier peerIDManager](v47, "peerIDManager"));
      [v43 forgetPeerTokensForService:v4];
    }

    uint64_t v44 = (os_log_s *)v46;
  }

  else
  {
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Cannot clearCacheAndUpdatePeersForService if service is nil -- returning",  buf,  2u);
    }
  }
}

- (void)clearTransparencyCacheForService:(id)a3 peerURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _keyTransparencyVerifierForServiceIdentifier:]( self,  "_keyTransparencyVerifierForServiceIdentifier:",  v6));
    id v11 = objc_msgSend((id)objc_opt_class(self, v10), "keyTransparencyURIPrefixForServiceIdentifier:", v6);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 prefixedURI]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingString:v13]);

    if (v9 && [v14 length])
    {
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Calling into Transparency to clear Transparency cache for peerURI: %@",  buf,  0xCu);
      }

      uint64_t v22 = v14;
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
      id v21 = 0LL;
      unsigned int v17 = [v9 clearPeerCache:v16 error:&v21];
      uint64_t v18 = (os_log_s *)v21;

      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      id v20 = v19;
      if (!v17 || v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1006AD304();
        }
      }

      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Success clearing Transparency cache for peerURI: %@",  buf,  0xCu);
        }

        uint64_t v18 = 0LL;
      }
    }

    else
    {
      uint64_t v18 = 0LL;
    }
  }

  else
  {
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "clearTransparencyCacheForService needs a service and peerURI -- returning",  buf,  2u);
    }
  }
}

- (void)fetchPeerVerificationInfoForApplication:(id)a3 forURIs:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v12 = [v11 isKeyTransparencyEnabled];

  if ((v12 & 1) != 0)
  {
    id v14 = objc_msgSend((id)objc_opt_class(self, v13), "keyTransparencyServiceIdentifierForTransparencyApplication:", v8);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = v15;
    if (v15 && ![v15 isEqualToString:&stru_100912B50])
    {
      -[IDSKeyTransparencyVerifier _fetchVerificationInfoForService:forURIs:localURI:withCompletion:]( self,  "_fetchVerificationInfoForService:forURIs:localURI:withCompletion:",  v16,  v9,  0LL,  v10);
    }

    else
    {
      unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1006AD370();
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  -1100LL,  0LL));
      v10[2](v10, &__NSDictionary0__struct, v18);
    }
  }

  else
  {
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100694A58();
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  -1000LL,  0LL));
    v10[2](v10, &__NSDictionary0__struct, v16);
  }
}

- (void)_fetchVerificationInfoForService:(id)a3 forURIs:(id)a4 localURI:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self, "serviceController"));
  id v15 = v10;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 serviceWithIdentifier:v10]);

  unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self, "accountController"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 appleIDAccountOnService:v16]);

  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self, "accountController"));
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 accountsOnService:v16]);

    id v31 = (void *)v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQueryUtilities accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:]( &OBJC_CLASS___IDSQueryUtilities,  "accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:",  v20,  v12,  v11,  0LL));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQueryUtilities URIToQueryFrom:withPreferredFromURI:]( &OBJC_CLASS___IDSQueryUtilities,  "URIToQueryFrom:withPreferredFromURI:",  v21,  v12));
    if (v22)
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier peerIDManager](self, "peerIDManager"));
      id v30 = v21;
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 _registrationCert]);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_1003E0098;
      v32[3] = &unk_1008F65A8;
      v32[4] = self;
      id v33 = v11;
      id v34 = v22;
      id v35 = v13;
      LOBYTE(v29) = 0;
      objc_msgSend( v23,  "startQueryForURIs:fromIdentity:fromURI:fromService:forSending:forRefresh:isForced:reason:completionBlock:",  v33,  v24,  v34,  v29,  @"KTFetch",  v32);

      id v21 = v30;
    }

    else
    {
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1006AD1FC();
      }

      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  -1100LL,  0LL));
      (*((void (**)(id, void *, void *))v13 + 2))(v13, &__NSDictionary0__struct, v28);
    }

    uint64_t v26 = v31;
  }

  else
  {
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1006AD3D4();
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  -1100LL,  0LL));
    (*((void (**)(id, void *, void *))v13 + 2))(v13, &__NSDictionary0__struct, v26);
  }
}

- (void)fetchSelfVerificationInfoForApplication:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Performing fetch for self verification info.",  buf,  2u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v10 = [v9 isKeyTransparencyEnabled];

  if ((v10 & 1) != 0)
  {
    id v12 = objc_msgSend((id)objc_opt_class(self, v11), "keyTransparencyServiceIdentifierForTransparencyApplication:", v6);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = v13;
    if (v13 && ![v13 isEqualToString:&stru_100912B50])
    {
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
      unsigned __int8 v21 = [v20 isKeyTransparencyEnabledForServiceIdentifier:v14];

      if ((v21 & 1) != 0)
      {
        __int128 v42 = (void (**)(void, void, void))v7;
        id v43 = v6;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self, "accountController"));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self, "serviceController"));
        uint64_t v41 = v14;
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 serviceWithIdentifier:v14]);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v22 accountsOnService:v24]);

        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        id v16 = v25;
        id v26 = [v16 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v50;
          do
          {
            for (i = 0LL; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v50 != v28) {
                objc_enumerationMutation(v16);
              }
              id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 uris]);
              id v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "__imArrayByApplyingBlock:", &stru_100904738));

              -[NSMutableSet addObjectsFromArray:](v18, "addObjectsFromArray:", v32);
            }

            id v27 = [v16 countByEnumeratingWithState:&v49 objects:v54 count:16];
          }

          while (v27);
        }

        id v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v18, "allObjects"));
        id v34 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQueryUtilities accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:]( &OBJC_CLASS___IDSQueryUtilities,  "accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:",  v16,  0LL,  v33,  0LL));

        id v35 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQueryUtilities URIToQueryFrom:withPreferredFromURI:]( &OBJC_CLASS___IDSQueryUtilities,  "URIToQueryFrom:withPreferredFromURI:",  v34,  0LL));
        if (v35)
        {
          -[IDSKeyTransparencyVerifier repairKVSDeviceEntryIfNeeded](self, "repairKVSDeviceEntryIfNeeded");
          id v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v18, "allObjects"));
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472LL;
          v44[2] = sub_1003E0B0C;
          void v44[3] = &unk_1009047C8;
          id v7 = v42;
          id v48 = v42;
          v44[4] = self;
          id v14 = v41;
          id v45 = v41;
          id v46 = v35;
          id v47 = v34;
          -[IDSKeyTransparencyVerifier _fetchVerificationInfoForService:forURIs:localURI:withCompletion:]( self,  "_fetchVerificationInfoForService:forURIs:localURI:withCompletion:",  v45,  v36,  0LL,  v44);

          id v37 = v48;
        }

        else
        {
          uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
          id v14 = v41;
          id v7 = v42;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            sub_1006AD1FC();
          }

          id v37 = [[KTSelfVerificationInfo alloc] initWithSyncedLoggableDatas:&__NSArray0__struct uriToServerLoggableDatas:&__NSDictionary0__struct];
          uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  -9001LL,  @"No account registered for service.",  0LL));
          ((void (**)(void, id, void *))v42)[2](v42, v37, v40);
        }

        id v6 = v43;
        goto LABEL_10;
      }

      __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_1006AD464();
      }

      id v16 = objc_alloc_init(&OBJC_CLASS___KTSelfVerificationInfo);
      uint64_t v17 = -1000LL;
    }

    else
    {
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1006AD370();
      }

      id v16 = [[KTSelfVerificationInfo alloc] initWithSyncedLoggableDatas:&__NSArray0__struct uriToServerLoggableDatas:&__NSDictionary0__struct];
      uint64_t v17 = -9003LL;
    }

    uint64_t v18 = (NSMutableSet *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  v17,  0LL));
    (*((void (**)(id, id, NSMutableSet *))v7 + 2))(v7, v16, v18);
LABEL_10:

    goto LABEL_14;
  }

  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_100694A58();
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___KTSelfVerificationInfo);
  id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  -1000LL,  0LL));
  (*((void (**)(id, id, id))v7 + 2))(v7, v14, v16);
LABEL_14:
}

- (void)healSelfForApplication:(id)a3 withHealableErrors:(id)a4 withCompletion:(id)a5
{
  id v5 = (void (**)(id, void))a5;
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "This is not a supported flow.", v7, 2u);
  }

  v5[2](v5, 0LL);
}

- (void)fetchKTRegistrationStatusWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v6 = [v5 isKeyTransparencyEnabled];

  if ((v6 & 1) != 0)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager fetchRegistrationStatusProvider]( self->_keyManager,  "fetchRegistrationStatusProvider"));
    v4[2](v4, v9);
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100694A58();
    }

    id v8 = objc_alloc_init(&OBJC_CLASS___IDSKTRegistrationStatusProvider);
    v4[2](v4, v8);
  }

- (void)registrationDataNeedsUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v4 = [v3 isKeyTransparencyEnabled];

  if ((v4 & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier registerUpdateRateLimiter](self, "registerUpdateRateLimiter"));
    unsigned int v6 = [v5 underLimitForItem:@"RegisterUpdateLimitKey"];

    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier registerUpdateRateLimiter](self, "registerUpdateRateLimiter"));
      [v7 noteItem:@"RegisterUpdateLimitKey"];

      -[IDSRegistrationKeyManager _ktDataNeedsUpdate:](self->_keyManager, "_ktDataNeedsUpdate:", 0LL);
      return;
    }

    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "KT registration data update is rate limited.",  v9,  2u);
    }
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100694A58();
    }
  }
}

- (int64_t)_IDSKTAccountStatusForKTAccountStatus:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    return 0LL;
  }
  else {
    return a3;
  }
}

- (void)fetchKTCDPStatus:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, int64_t))a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Fetching KT account status from transparency",  buf,  2u);
  }

  if (CUTIsInternalInstall(v6, v7)
    && +[IMUserDefaults useKeyTransparencyAccountStatusDefault]( &OBJC_CLASS___IMUserDefaults,  "useKeyTransparencyAccountStatusDefault"))
  {
    int64_t v8 = +[IMUserDefaults keyTransparencyAccountStatusDefault]( &OBJC_CLASS___IMUserDefaults,  "keyTransparencyAccountStatusDefault");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Default is set to return KT account status instead of calling transparency. { accountStatus: %ld }",  buf,  0xCu);
    }

    -[IDSKeyTransparencyVerifier setMostRecentKTCDPAccountStatus:](self, "setMostRecentKTCDPAccountStatus:", v8);
    v4[2](v4, v8);
  }

  else
  {
    id v10 = [[KTStatus alloc] initWithApplication:@"IDS"];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1003E1848;
    v11[3] = &unk_100904818;
    objc_copyWeak(&v13, (id *)buf);
    v11[4] = self;
    id v12 = v4;
    [v10 getStatus:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_handleKTCDPStatusUpdate:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Received notification of update to KT CDP status.",  buf,  2u);
  }

  if (_os_feature_enabled_impl("IDS", "IDSKTDelayRegistration"))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier accountController](self, "accountController"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self, "serviceController"));
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceWithIdentifier:@"com.apple.madrid"]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 accountsOnService:v8]);

    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          if ([v16 registrationError] == (id)47
            || [v16 registrationError] == (id)48
            || [v16 registrationError] == (id)49)
          {
            -[NSMutableArray addObject:](v10, "addObject:", v16);
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }

      while (v13);
    }

    if (-[NSMutableArray count](v10, "count"))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"accountStatus"]);
      uint64_t v19 = [v18 unsignedIntValue];

      int64_t v20 = -[IDSKeyTransparencyVerifier _IDSKTAccountStatusForKTAccountStatus:]( self,  "_IDSKTAccountStatusForKTAccountStatus:",  v19);
      unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v19));
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Received account status update from KT. { KTAccountStatus: %@ }",  buf,  0xCu);
      }

      if ((unint64_t)(v20 - 2) >= 3)
      {
        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Received account status that we have no update for.",  buf,  2u);
        }
      }

      else
      {
        id v23 = (id)qword_100718170[v20 - 2];
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        id v24 = v10;
        id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v32;
          do
          {
            for (j = 0LL; j != v26; j = (char *)j + 1)
            {
              if (*(void *)v32 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)j);
              if (objc_msgSend(v29, "registrationError", (void)v31) != v23) {
                [v29 _updateRegistrationStatusWithError:v23 info:0];
              }
            }

            id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v24,  "countByEnumeratingWithState:objects:count:",  &v31,  v39,  16LL);
          }

          while (v26);
        }
      }
    }

    else
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "No accounts need updating.",  buf,  2u);
      }
    }
  }
}

- (void)peerVerificationFinishedWithResults:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  log = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  BOOL v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      id v62 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Received peer verification finished with results: %@",  buf,  0xCu);
    }

    if (self->_kickPeerVerificationDate)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v7 timeIntervalSince1970];
      double v9 = v8;
      -[NSDate timeIntervalSince1970](self->_kickPeerVerificationDate, "timeIntervalSince1970");
      double v11 = v9 - v10;

      if (v11 > 0.0)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v11));
        [v12 logMetric:v13 withName:@"IDSKTTimeToReceivePeerVerificationResults"];

        kickPeerVerificationDate = self->_kickPeerVerificationDate;
        self->_kickPeerVerificationDate = 0LL;
      }
    }

    __int128 v50 = self;
    log = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v47 = v4;
    id obj = v4;
    id v16 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v56;
      uint64_t v19 = kKTApplicationIdentifierIDS;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v56 != v18) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v21 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
          uint64_t v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "application", v47));
          if (v22)
          {
            id v23 = (void *)v22;
            id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 application]);
            unsigned int v25 = [v24 isEqualToString:v19];

            if (v25)
            {
              uint64_t v27 = v15;
              uint64_t v28 = (void *)objc_opt_class(v50, v26);
              uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v21 uri]);
              id v30 = (void *)objc_claimAutoreleasedReturnValue([v28 strippedURIFromKeyTransparencyURI:v29]);

              if ([v30 length])
              {
                __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](&OBJC_CLASS___IDSURI, "URIWithPrefixedURI:", v30));
                -[os_log_s setObject:forKey:](log, "setObject:forKey:", v21, v32);
              }

              __int128 v33 = (void *)objc_opt_class(v50, v31);
              __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v21 application]);
              __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v33 keyTransparencyServiceIdentifierForTransparencyApplication:v34]);

              id v15 = v27;
              if ([v35 length])
              {
                __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v35]);

                if (!v36)
                {
                  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
                  [v27 setObject:v37 forKeyedSubscript:v35];
                }

                __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v35]);
                [v38 addObject:v21];
              }
            }
          }
        }

        id v17 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
      }

      while (v17);
    }

    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier peerIDManager](v50, "peerIDManager"));
    [v39 updateCachedVerifierResultsWithResults:log];

    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    id v40 = v15;
    id v41 = [v40 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v52;
      do
      {
        for (j = 0LL; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v52 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)j);
          id v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", v45, v47));
          -[IDSKeyTransparencyVerifier _notifyClientOfKTVerifierResults:forService:]( v50,  "_notifyClientOfKTVerifierResults:forService:",  v46,  v45);
        }

        id v42 = [v40 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }

      while (v42);
    }

    id v4 = v47;
  }

  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "Received peerVerificationFinishedWithResults but results are empty -- returning",  buf,  2u);
  }
}

- (void)_notifyClientOfKTVerifierResults:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (v7 && v8)
  {
    double v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v29 = v6;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v11)
    {
      id v13 = v11;
      uint64_t v14 = *(void *)v32;
      do
      {
        id v15 = 0LL;
        do
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v10);
          }
          id v16 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v15);
          id v17 = (void *)objc_opt_class(self, v12);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 uri]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 strippedURIFromKeyTransparencyURI:v18]);

          if ([v19 length]) {
            -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v16, v19);
          }

          id v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v10 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }

      while (v13);
    }

    int64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = -[NSMutableDictionary count](v9, "count");
      *(_DWORD *)buf = 138412546;
      id v36 = v7;
      __int16 v37 = 2048;
      id v38 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Need to notify client of uriToVerifierResult { service: %@ count: %lu }",  buf,  0x16u);
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
    id v23 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 broadcasterForTopic:v7 messageContext:v23]);

    id v30 = 0LL;
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v9,  1LL,  &v30));
    id v26 = v30;
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Error archiving uriToVerifierResult -- dropping { archiveError: %@ }",  buf,  0xCu);
      }
    }

    else
    {
      if (v28)
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Successfully archived uriToVerifierResultData: %@",  buf,  0xCu);
      }

      [v24 ktPeerVerificationResultsUpdated:v25 forService:v7];
    }

    id v6 = v29;
  }
}

- (void)cacheClearRequest:(id)a3
{
  id v35 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v5 = [v4 isKeyTransparencyEnabled];

  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  id v7 = v6;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received request from transparency to clear cache. { CacheClearRequest: %@ }",  buf,  0xCu);
    }

    if (!self->_cacheClearRateLimiterByService)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      cacheClearRateLimiterByService = self->_cacheClearRateLimiterByService;
      self->_cacheClearRateLimiterByService = Mutable;
    }

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 requestContexts]);
    id v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v44,  v55,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v45;
      uint64_t v36 = *(void *)v45;
      __int16 v37 = v7;
      do
      {
        uint64_t v13 = 0LL;
        id v38 = v11;
        do
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v39 = v13;
          uint64_t v14 = *(void **)(*((void *)&v44 + 1) + 8 * v13);
          uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 service]);
          if (v15
            && (id v16 = (void *)v15,
                id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 service]),
                unsigned __int8 v18 = [v17 isEqualToString:@"com.apple.madrid"],
                v17,
                v16,
                (v18 & 1) != 0))
          {
            uint64_t v19 = self->_cacheClearRateLimiterByService;
            int64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
            id v21 = (IDSRateLimiter *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v19,  "objectForKeyedSubscript:",  v20));

            if (!v21)
            {
              uint64_t v22 = objc_alloc(&OBJC_CLASS___IDSRateLimiter);
              unint64_t v23 = -[IDSKeyTransparencyVerifier ktCacheClearRequestLimit](self, "ktCacheClearRequestLimit");
              -[IDSKeyTransparencyVerifier ktCacheClearRequestLimitTime](self, "ktCacheClearRequestLimitTime");
              id v21 = -[IDSRateLimiter initWithLimit:timeLimit:](v22, "initWithLimit:timeLimit:", v23);
              id v24 = self->_cacheClearRateLimiterByService;
              unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v21, v25);
            }

            __int128 v42 = 0u;
            __int128 v43 = 0u;
            __int128 v40 = 0u;
            __int128 v41 = 0u;
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v14 uris]);
            id v27 = [v26 countByEnumeratingWithState:&v40 objects:v52 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v41;
              do
              {
                id v30 = 0LL;
                do
                {
                  if (*(void *)v41 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  __int128 v31 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v30);
                  if (-[IDSRateLimiter underLimitForItem:](v21, "underLimitForItem:", v31))
                  {
                    -[IDSRateLimiter noteItem:](v21, "noteItem:", v31);
                    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier peerIDManager](self, "peerIDManager"));
                    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
                    [v32 forgetPeerTokensForURI:v31 service:v33];
LABEL_22:

                    goto LABEL_24;
                  }

                  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
                  if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
                  {
                    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
                    *(_DWORD *)buf = 138412546;
                    id v49 = v31;
                    __int16 v50 = 2112;
                    __int128 v51 = v33;
                    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v32,  OS_LOG_TYPE_ERROR,  "Reached rate limit for clearing query cache. { URI: %@, Service: %@ }",  buf,  0x16u);
                    goto LABEL_22;
                  }

- (void)updateKVSWithTrustedDevices:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v55 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Uploading trusted devices to KVS. { trustedDevices: %@ }",  buf,  0xCu);
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v10 = [v9 isKeyTransparencyEnabled];

  if ((v10 & 1) == 0)
  {
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      sub_1006AD630();
    }

    goto LABEL_32;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned __int8 v12 = [v11 isKeyTransparencyTrustCircleEnabled];

  if ((v12 & 1) == 0)
  {
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Key transparency trust circle is not enabled -- not enrolling trusted device",  buf,  2u);
    }

LABEL_32:
    v7[2](v7, 0LL);
    goto LABEL_37;
  }

  uint64_t v39 = v7;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier registrationDataSource](self, "registrationDataSource"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentLocalKeyTransparencyEligibleServiceIdentifiers]);

  id v40 = v6;
  __int128 v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        int64_t v20 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _pruneTrustedDevice:givenEligibleServiceIdentifiers:]( self,  "_pruneTrustedDevice:givenEligibleServiceIdentifiers:",  *(void *)(*((void *)&v48 + 1) + 8LL * (void)i),  v14));
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 trustedServices]);
        id v22 = [v21 count];

        if (v22)
        {
          -[NSMutableArray addObject:](v41, "addObject:", v20);
        }

        else
        {
          unint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Trusted Device info has no services with data to insert into KVS.",  buf,  2u);
          }
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }

    while (v17);
  }

  id v24 = v41;
  if (-[NSMutableArray count](v41, "count"))
  {
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier _fetchExpiredEntriesFromKVS](self, "_fetchExpiredEntriesFromKVS"));
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v38 allKeys]);
    -[IDSKeyTransparencyVerifier _removeObjectsForKeysFromKVS:](self, "_removeObjectsForKeysFromKVS:", v25);

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v26 = v41;
    id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v44,  v52,  16LL);
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v45;
      do
      {
        for (j = 0LL; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)j);
          __int128 v32 = objc_alloc_init(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedDeviceMetadata);
          __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serverTime](self, "serverTime"));
          [v33 currentServerTimeInterval];
          -[IDSProtoKeyTransparencyTrustedDeviceMetadata setTimestamp:](v32, "setTimestamp:");

          -[IDSKeyTransparencyVerifier _insertTrustedDeviceToKVS:withMetadata:]( self,  "_insertTrustedDeviceToKVS:withMetadata:",  v31,  v32);
        }

        id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v44,  v52,  16LL);
      }

      while (v28);
    }

    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier forceSyncKVS](self, "forceSyncKVS"));
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1003E2F90;
    void v42[3] = &unk_1008F8760;
    id v7 = v39;
    __int128 v43 = v39;
    [v34 registerResultBlock:v42];

    id v6 = v40;
    id v24 = v41;
  }

  else
  {
    __int16 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    id v6 = v40;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_1006AD604();
    }

    id v7 = v39;
    v39[2](v39, 0LL);
  }

LABEL_37:
}

- (id)_fetchCurrentKVS
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier keyTransparencyStore](self, "keyTransparencyStore"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fetchAllEntries]);

  return v3;
}

- (void)_insertTrustedDeviceToKVS:(id)a3 withMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Inserting trusted device with metadata. {trustedDevice: %@, metadata: %@}",  buf,  0x16u);
  }

  double v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data", IDSKTKVSTrustedDeviceKey));
  v16[0] = v9;
  v15[1] = IDSKTKVSTrustedDeviceMetadataKey;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v7 data]);
  v16[1] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier SHA256HashForKeyTransparencyTrustedDevice:]( self,  "SHA256HashForKeyTransparencyTrustedDevice:",  v6));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "__imHexString"));

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier keyTransparencyStore](self, "keyTransparencyStore"));
  [v14 insertDictionary:v11 forKey:v13];
}

- (void)_removeObjectsForKeysFromKVS:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Removing entries from KVS. {keys: %@}",  buf,  0xCu);
  }

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      unsigned __int8 v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier keyTransparencyStore](self, "keyTransparencyStore", (void)v13));
        [v12 removeEntryForKey:v11];

        unsigned __int8 v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }
}

- (id)fetchTrustedDevicesFromKVS
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier _fetchCurrentKVS](self, "_fetchCurrentKVS"));
  unsigned int v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v28;
    uint64_t v24 = IDSKTKVSTrustedDeviceKey;
    id v8 = &IMInsertBoolsToXPCDictionary_ptr;
    *(void *)&__int128 v5 = 138412290LL;
    __int128 v23 = v5;
    do
    {
      uint64_t v9 = 0LL;
      id v26 = v6;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v10, v23));
        uint64_t v13 = objc_opt_class(v8[479], v12);
        if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
        {
          uint64_t v14 = v7;
          __int128 v15 = v8;
          __int128 v16 = objc_alloc(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedDevice);
          id v17 = v3;
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v10]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v24]);
          id v20 = -[IDSProtoKeyTransparencyTrustedDevice initWithData:](v16, "initWithData:", v19);

          if (!v20)
          {
            id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              uint64_t v32 = v10;
              _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to create trusted device from KVS entry. {kvsKey: %@}",  buf,  0xCu);
            }
          }

          -[NSMutableArray addObject:](v25, "addObject:", v20);
          id v8 = v15;
          uint64_t v7 = v14;
          id v6 = v26;
          id v3 = v17;
        }

        else
        {
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            uint64_t v32 = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "KVS entry not of expected type, skipping. {kvsKey: %@}",  buf,  0xCu);
          }
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v6 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }

    while (v6);
  }

  return v25;
}

- (id)_fetchExpiredEntriesFromKVS
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Fetching expired entries from KVS.", buf, 2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier _fetchCurrentKVS](self, "_fetchCurrentKVS"));
  __int128 v41 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serverTime](self, "serverTime"));
  [v4 currentServerTimeInterval];
  double v6 = v5;

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v44;
    uint64_t v12 = IDSKTKVSTrustedDeviceMetadataKey;
    *(void *)&__int128 v9 = 134218498LL;
    __int128 v40 = v9;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(const __CFString **)(*((void *)&v43 + 1) + 8LL * (void)v13);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v14, v40));
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSDictionary, v16);
        if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
        {
          id v18 = objc_alloc(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedDeviceMetadata);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v12]);
          id v20 = -[IDSProtoKeyTransparencyTrustedDeviceMetadata initWithData:](v18, "initWithData:", v19);

          if (v20)
          {
            -[IDSProtoKeyTransparencyTrustedDeviceMetadata timestamp](v20, "timestamp");
            if (v21 > 0.0)
            {
              -[IDSProtoKeyTransparencyTrustedDeviceMetadata timestamp](v20, "timestamp");
              double v23 = v6 - v22;
              -[IDSKeyTransparencyVerifier keyTransparencyCKContainerExpiryTime]( self,  "keyTransparencyCKContainerExpiryTime");
              if (v23 <= v24) {
                goto LABEL_23;
              }
              unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                -[IDSProtoKeyTransparencyTrustedDeviceMetadata timestamp](v20, "timestamp");
                *(_DWORD *)buf = v40;
                __int128 v48 = *(const __CFString **)&v6;
                __int16 v49 = 2048;
                __int128 v50 = v26;
                __int16 v51 = 2112;
                __int128 v52 = v14;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Found expired entry. {currentTime: %f, trustedDeviceTimestamp: %f, entryKey: %@",  buf,  0x20u);
              }

              __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v14]);
              -[NSMutableDictionary setObject:forKey:](v41, "setObject:forKey:", v27, v14);

              -[IDSProtoKeyTransparencyTrustedDeviceMetadata timestamp](v20, "timestamp");
              double v29 = v6 - v28;
              __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v29));
                *(_DWORD *)buf = 138412546;
                __int128 v48 = @"ktKVSExpiredEntryTime";
                __int16 v49 = 2112;
                __int128 v50 = v31;
                _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Reporting KT Metric. {metricName: %@, timeInterval: %@}",  buf,  0x16u);
              }

              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
              __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v29));
              [v32 logMetric:v33 withName:@"ktKVSExpiredEntryTime"];

              goto LABEL_22;
            }

            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
            if (!os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
            {
LABEL_22:

              goto LABEL_23;
            }

            -[IDSProtoKeyTransparencyTrustedDeviceMetadata timestamp](v20, "timestamp");
            *(_DWORD *)buf = 138412546;
            __int128 v48 = v14;
            __int16 v49 = 2048;
            __int128 v50 = v37;
            id v34 = (os_log_s *)v32;
            id v35 = "Timestamp value for KVS entry is not valid. {kvsKey: %@, timestamp: %f}";
            uint32_t v36 = 22;
          }

          else
          {
            uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
            if (!os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR)) {
              goto LABEL_22;
            }
            *(_DWORD *)buf = 138412290;
            __int128 v48 = v14;
            id v34 = (os_log_s *)v32;
            id v35 = "Failed to create device metadata object from KVS entry. {kvsKey: %@}";
            uint32_t v36 = 12;
          }

          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v35, buf, v36);
          goto LABEL_22;
        }

        id v20 = (IDSProtoKeyTransparencyTrustedDeviceMetadata *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog KeyTransparency]( &OBJC_CLASS___IDSFoundationLog,  "KeyTransparency"));
        if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          __int128 v48 = v14;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_ERROR,  "KVS entry not of expected type, skipping. {kvsKey: %@}",  buf,  0xCu);
        }

- (id)forceSyncKVS
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Trying to sync KVS.", buf, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier keyTransparencyStore](self, "keyTransparencyStore"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 forceKVSSync]);

  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_1003E3BBC;
  __int128 v15 = &unk_1008F7700;
  id v16 = v4;
  id v17 = v5;
  id v8 = v5;
  id v9 = v4;
  [v7 registerResultBlock:&v12];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "promise", v12, v13, v14, v15));

  return v10;
}

- (void)removeAllKVSEntries
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier keyTransparencyStore](self, "keyTransparencyStore"));
  [v2 removeAllEntries];
}

- (void)fetchCurrentDeviceKVSKey:(id)a3
{
  __int128 v15 = (void (**)(id, NSMutableDictionary *, void))a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier keyManager](self, "keyManager"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 kvsTrustedDevices]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier SHA256HashForKeyTransparencyTrustedDevice:]( self,  "SHA256HashForKeyTransparencyTrustedDevice:",  v12));
        if (v13)
        {
          if (!v12) {
            goto LABEL_12;
          }
          id v14 = v12;
          CFDictionarySetValue((CFMutableDictionaryRef)v4, objc_msgSend(v13, "__imHexString"), v14);
        }

        else
        {
          id v14 = (id)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
          if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            double v21 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "Couldn't create hash for trusted device. { trustedDevice: %@ }",  buf,  0xCu);
          }
        }

LABEL_12:
      }

      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v9);
  }

  v15[2](v15, v4, 0LL);
}

- (void)repairKVSDeviceEntryIfNeeded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1003E4124;
  v2[3] = &unk_100904840;
  v2[4] = self;
  -[IDSKeyTransparencyVerifier fetchCurrentDeviceKVSKey:](self, "fetchCurrentDeviceKVSKey:", v2);
}

- (void)updateCurrentDeviceInKVS:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier keyManager](self, "keyManager"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 kvsTrustedDevices]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1003E4330;
  v8[3] = &unk_1008FE788;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  -[IDSKeyTransparencyVerifier updateKVSWithTrustedDevices:withCompletion:]( self,  "updateKVSWithTrustedDevices:withCompletion:",  v6,  v8);
}

- (BOOL)isKeyInKVS:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier keyTransparencyStore](self, "keyTransparencyStore"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchEntryForKey:v4]);

  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v11 = 138412290;
      id v12 = v4;
      id v9 = "Key found in KVS. { kvsKey: %@ }";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
    }
  }

  else if (v8)
  {
    int v11 = 138412290;
    id v12 = v4;
    id v9 = "Key not found in KVS. { kvsKey: %@ }";
    goto LABEL_6;
  }

  return v6 != 0LL;
}

- (void)reportAccountKeyFetchMetricForService:(id)a3 withSuccess:(BOOL)a4 isAccountMismatch:(BOOL)a5 withError:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserDefaults keyTransparencyAccountKeyFetchMetricDeviceID]( &OBJC_CLASS___IMUserDefaults,  "keyTransparencyAccountKeyFetchMetricDeviceID"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[IDSRegistrationReasonTracker sharedInstance]( &OBJC_CLASS___IDSRegistrationReasonTracker,  "sharedInstance"));
  id v15 = [v14 getMostRecentIDSRegistrationReason];

  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)v12, @"IDSKTAccountKeyFetchService", v10);
  }
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  if (v16) {
    CFDictionarySetValue((CFMutableDictionaryRef)v12, @"IDSKTAccountKeyFetchSuccess", v16);
  }

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  if (v17) {
    CFDictionarySetValue((CFMutableDictionaryRef)v12, @"IDSKTAccountKeyFetchIsMismatchAccount", v17);
  }

  uint64_t v23 = _IDSKeyTransparencyVersionNumber(v18, v19, v20, v21, v22);
  double v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  if (v24) {
    CFDictionarySetValue((CFMutableDictionaryRef)v12, @"KTVersion", v24);
  }

  unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
  if (v25) {
    CFDictionarySetValue((CFMutableDictionaryRef)v12, @"akRegRes", v25);
  }

  if (v13) {
    CFDictionarySetValue((CFMutableDictionaryRef)v12, @"akFetchDID", v13);
  }
  if (CUTIsInternalInstall(v26, v27))
  {
    id v28 = v10;
    double v29 = v13;
    id v30 = v11;
    id v31 = v15;
    BOOL v32 = v7;
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier pushHandler](self, "pushHandler"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 pushToken]);
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 base64EncodedStringWithOptions:0]);

    if (v35) {
      CFDictionarySetValue((CFMutableDictionaryRef)v12, @"akFetchPT", v35);
    }

    LODWORD(v7) = v32;
    id v15 = v31;
    id v11 = v30;
    uint64_t v13 = v29;
    id v10 = v28;
  }

  if (!v8)
  {
    uint32_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v11 code]));
    if (v36) {
      CFDictionarySetValue((CFMutableDictionaryRef)v12, @"akFetchErr", v36);
    }

    __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:NSUnderlyingErrorKey]);

    if (v38)
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 domain]);
      if (v39) {
        CFDictionarySetValue((CFMutableDictionaryRef)v12, @"akUnderlyingErrorDomain", v39);
      }

      __int128 v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v38 code]));
      if (v40) {
        CFDictionarySetValue((CFMutableDictionaryRef)v12, @"akUnderlyingErr", v40);
      }
    }
  }

  __int128 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      __int128 v42 = @"YES";
    }
    else {
      __int128 v42 = @"NO";
    }
    if (v7) {
      __int128 v43 = @"YES";
    }
    else {
      __int128 v43 = @"NO";
    }
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v15));
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v11 code]));
    int v47 = 138413570;
    id v48 = v10;
    __int16 v49 = 2112;
    __int128 v50 = v42;
    __int16 v51 = 2112;
    __int128 v52 = v43;
    __int16 v53 = 2112;
    uint64_t v54 = v44;
    __int16 v55 = 2112;
    __int128 v56 = v45;
    __int16 v57 = 2112;
    __int128 v58 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Reporting IDSKTAccountKeyFetchMetric {service: %@, success: %@, isMismatchAccount: %@, regReason: %@, error: %@, m etricAttributes: %@}",  (uint8_t *)&v47,  0x3Eu);
  }

  __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  [v46 logHardFailureForEventNamed:@"IDSKTAccountKeyFetch" withAttributes:v12];
}

- (void)_submitMetricForTrustedDeviceEnrollmentWithKVSResult:(id)a3 kvsSyncTimeInterval:(double)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned int v8 = [v7 isKeyTransparencyAnalyticsEnabled];

  if (!v8) {
    goto LABEL_15;
  }
  if ([v6 state] != (id)1)
  {
    id v9 = 0LL;
LABEL_7:
    id v11 = 0LL;
    goto LABEL_8;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (!v9)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  0LL,  @"KVS sync error unknown.",  0LL));
    if (!v9) {
      goto LABEL_7;
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:NSUnderlyingErrorKey]);

LABEL_8:
  id v12 = objc_alloc(&OBJC_CLASS___IDSKeyTransparencyTrustedDeviceEnrollmentMetric);
  uint64_t v17 = _IDSKeyTransparencyVersionNumber(v12, v13, v14, v15, v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = [v18 unsignedIntegerValue];
  BOOL v20 = [v6 state] == 0;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
  id v22 = [v9 code];
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v11 domain]);
  double v24 = v11;
  unsigned int v25 = (void *)v23;
  id v34 = v24;
  id v26 = objc_msgSend( v12,  "initWithKeyTransparencyVersion:kvsSuccess:kvsErrorDomain:kvsErrorCode:kvsSyncTimeInterval:kvsUnderlyingErrorDo main:kvsUnderlyingErrorCode:",  v19,  v20,  v21,  v22,  v23,  objc_msgSend(v24, "code"),  a4);

  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v26;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Logging KT enrollment metric { metric: %@ }",  buf,  0xCu);
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned int v29 = [v28 isKeyTransparencyRTCAnalyticsEnabled];

  if (v29)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier internalMetricLogger](self, "internalMetricLogger"));
    [v30 logMetric:v26];
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned int v32 = [v31 isKeyTransparencySFAnalyticsEnabled];

  if (v32)
  {
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier productionMetricLogger](self, "productionMetricLogger"));
    [v33 logMetric:v26];
  }

LABEL_15:
}

- (void)_submitMetricsForTrustedDeviceEnrollmentWithCloudKitResult:(id)a3 cloudKitOperationTimeInterval:(double)a4 accountKeyResult:(id)a5 accountKeyOperationTimeInterval:(double)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  unsigned int v13 = [v12 isKeyTransparencyAnalyticsEnabled];

  if (v13)
  {
    if ([v10 state] == (id)1)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 error]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 userInfo]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:NSUnderlyingErrorKey]);
      uint64_t v17 = v16;
      if (v16) {
        id v18 = v16;
      }
      else {
        id v18 = (id)objc_claimAutoreleasedReturnValue([v10 error]);
      }
      id v19 = v18;

      if (!v19) {
        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  0LL,  0LL,  0LL));
      }
    }

    else
    {
      id v19 = 0LL;
    }

    v64 = self;
    if ([v11 state] == (id)1)
    {
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v11 error]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 userInfo]);
      NSErrorUserInfoKey v22 = NSUnderlyingErrorKey;
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:NSUnderlyingErrorKey]);
      double v24 = v23;
      if (v23) {
        id v25 = v23;
      }
      else {
        id v25 = (id)objc_claimAutoreleasedReturnValue([v11 error]);
      }
      id v27 = v25;

      if (v27) {
        id v26 = v27;
      }
      else {
        id v26 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  0LL,  0LL,  0LL));
      }
    }

    else
    {
      id v26 = 0LL;
      NSErrorUserInfoKey v22 = NSUnderlyingErrorKey;
    }

    id v58 = objc_alloc(&OBJC_CLASS___IDSKeyTransparencyTrustedDeviceEnrollmentMetric);
    uint64_t v32 = _IDSKeyTransparencyVersionNumber(v58, v28, v29, v30, v31);
    __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(v32);
    id v56 = [v61 unsignedIntegerValue];
    id v66 = v10;
    BOOL v55 = [v10 state] == 0;
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue([v19 domain]);
    id v53 = [v19 code];
    __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v19 userInfo]);
    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:v22]);
    __int128 v52 = (void *)objc_claimAutoreleasedReturnValue([v59 domain]);
    v63 = v19;
    __int16 v57 = (void *)objc_claimAutoreleasedReturnValue([v19 userInfo]);
    __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:v22]);
    id v34 = [v33 code];
    id v65 = v11;
    BOOL v35 = [v11 state] == 0;
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v26 domain]);
    id v37 = [v26 code];
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v26 userInfo]);
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v22]);
    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue([v39 domain]);
    id v62 = v26;
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v26 userInfo]);
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:v22]);
    LOBYTE(v51) = v35;
    id v43 = objc_msgSend( v58,  "initWithKeyTransparencyVersion:cloudKitSuccess:cloudKitErrorDomain:cloudKitErrorCode:cloudKitUnderlyingError Domain:cloudKitUnderlyingErrorCode:cloudKitOperationTimeInterval:accountKeySuccess:accountKeyErrorDomain:acc ountKeyErrorCode:accountKeyUnderlyingErrorDomain:accountKeyUnderlyingErrorCode:accountKeyOperationTimeInterval:",  v56,  v55,  v54,  v53,  v52,  v34,  a4,  a6,  v51,  v36,  v37,  v40,  objc_msgSend(v42, "code"));

    __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v68 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Logging KT enrollment metric { metric: %@ }",  buf,  0xCu);
    }

    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](v64, "policy"));
    unsigned int v46 = [v45 isKeyTransparencyRTCAnalyticsEnabled];

    if (v46)
    {
      int v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier internalMetricLogger](v64, "internalMetricLogger"));
      [v47 logMetric:v43];
    }

    id v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](v64, "policy"));
    unsigned int v49 = [v48 isKeyTransparencySFAnalyticsEnabled];

    id v10 = v66;
    id v11 = v65;
    if (v49)
    {
      __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier productionMetricLogger](v64, "productionMetricLogger"));
      [v50 logMetric:v43];
    }
  }
}

- (void)_submitMetricsForTrustedDeviceVerificationWithCloudKitResult:(id)a3 cloudKitOperationTimeInterval:(double)a4 accountKeyResult:(id)a5 accountKeyOperationTimeInterval:(double)a6 index:(id)a7 entries:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  LODWORD(a7) = [v18 isKeyTransparencyAnalyticsEnabled];

  if (!(_DWORD)a7) {
    goto LABEL_31;
  }
  id v72 = [v17 count];
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_1003E587C;
  v82[3] = &unk_100904868;
  v82[4] = self;
  id v76 = v16;
  id v79 = v16;
  id v83 = v79;
  id v75 = v17;
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "__imArrayByFilteringWithBlock:", v82));
  id v71 = [v81 count];
  if ([v14 state] == (id)1)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 error]);
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 userInfo]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:NSUnderlyingErrorKey]);
    NSErrorUserInfoKey v22 = v21;
    if (v21) {
      id v23 = v21;
    }
    else {
      id v23 = (id)objc_claimAutoreleasedReturnValue([v14 error]);
    }
    double v24 = v23;

    if (!v24) {
      double v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  0LL,  0LL,  0LL));
    }
  }

  else
  {
    double v24 = 0LL;
  }

  if ([v15 state] == (id)1)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v15 error]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 userInfo]);
    NSErrorUserInfoKey v27 = NSUnderlyingErrorKey;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:NSUnderlyingErrorKey]);
    uint64_t v29 = v28;
    if (v28) {
      id v30 = v28;
    }
    else {
      id v30 = (id)objc_claimAutoreleasedReturnValue([v15 error]);
    }
    uint64_t v31 = v30;

    if (!v31) {
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _clientErrorWithCode:debugDescription:underlyingError:]( self,  "_clientErrorWithCode:debugDescription:underlyingError:",  0LL,  0LL,  0LL));
    }
  }

  else
  {
    uint64_t v31 = 0LL;
    NSErrorUserInfoKey v27 = NSUnderlyingErrorKey;
  }

  id v63 = objc_alloc(&OBJC_CLASS___IDSKeyTransparencyTrustedDeviceVerificationMetric);
  uint64_t v36 = _IDSKeyTransparencyVersionNumber(v63, v32, v33, v34, v35);
  v70 = (void *)objc_claimAutoreleasedReturnValue(v36);
  id v62 = [v70 unsignedIntegerValue];
  id v58 = [v14 state];
  uint64_t v37 = objc_claimAutoreleasedReturnValue([v24 domain]);
  id v61 = [v24 code];
  id v68 = (void *)objc_claimAutoreleasedReturnValue([v24 userInfo]);
  v67 = (void *)objc_claimAutoreleasedReturnValue([v68 objectForKeyedSubscript:v27]);
  id v66 = (void *)objc_claimAutoreleasedReturnValue([v67 domain]);
  v74 = v24;
  id v65 = (void *)objc_claimAutoreleasedReturnValue([v24 userInfo]);
  v64 = (void *)objc_claimAutoreleasedReturnValue([v65 objectForKeyedSubscript:v27]);
  id v57 = [v64 code];
  id v55 = [v15 state];
  v78 = (void *)objc_claimAutoreleasedReturnValue([v31 domain]);
  id v56 = [v31 code];
  __int128 v60 = (void *)objc_claimAutoreleasedReturnValue([v31 userInfo]);
  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKeyedSubscript:v27]);
  v77 = (void *)objc_claimAutoreleasedReturnValue([v59 domain]);
  v73 = v31;
  id v38 = (void *)objc_claimAutoreleasedReturnValue([v31 userInfo]);
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKeyedSubscript:v27]);
  id v40 = [v39 code];
  id v41 = [v14 state];
  v69 = (void *)v37;
  if (v41) {
    __int128 v42 = &__NSArray0__struct;
  }
  else {
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v14 value]);
  }
  v80 = self;
  unint64_t v43 = -[IDSKeyTransparencyVerifier _numberOfMatchesForCandidates:index:trustedDevices:]( self,  "_numberOfMatchesForCandidates:index:trustedDevices:",  v81,  v79,  v42);
  id v44 = [v15 state];
  if (v44) {
    __int128 v45 = &__NSArray0__struct;
  }
  else {
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v15 value]);
  }
  LOBYTE(v54) = v55 == 0LL;
  id v46 = objc_msgSend( v63,  "initWithKeyTransparencyVersion:cloudKitSuccess:cloudKitErrorDomain:cloudKitErrorCode:cloudKitUnderlyingErrorDo main:cloudKitUnderlyingErrorCode:cloudKitOperationTimeInterval:accountKeySuccess:accountKeyErrorDomain:account KeyErrorCode:accountKeyUnderlyingErrorDomain:accountKeyUnderlyingErrorCode:accountKeyOperationTimeInterval:num berOfTotalDevices:numberOfCandidateDevices:numberOfMatchesFromCloudKit:numberOfMatchesFromAccountKey:",  v62,  v58 == 0,  v69,  v61,  v66,  v57,  a4,  a6,  v54,  v78,  v56,  v77,  v40,  v72,  v71,  v43,  -[IDSKeyTransparencyVerifier _numberOfMatchesForCandidates:index:trustedDevices:]( v80,  "_numberOfMatchesForCandidates:index:trustedDevices:",  v81,  v79,  v45));
  if (!v44)
  {

    if (v41) {
      goto LABEL_24;
    }
LABEL_33:

    goto LABEL_24;
  }

  if (!v41) {
    goto LABEL_33;
  }
LABEL_24:

  int v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  id v17 = v75;
  id v16 = v76;
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v85 = v46;
    _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Logging KT verification metric { metric: %@ }",  buf,  0xCu);
  }

  id v48 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](v80, "policy"));
  unsigned int v49 = [v48 isKeyTransparencyRTCAnalyticsEnabled];

  if (v49)
  {
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier internalMetricLogger](v80, "internalMetricLogger"));
    [v50 logMetric:v46];
  }

  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](v80, "policy"));
  unsigned int v52 = [v51 isKeyTransparencySFAnalyticsEnabled];

  if (v52)
  {
    id v53 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier productionMetricLogger](v80, "productionMetricLogger"));
    [v53 logMetric:v46];
  }

LABEL_31:
}

- (unint64_t)_numberOfMatchesForCandidates:(id)a3 index:(id)a4 trustedDevices:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1003E59C8;
  v12[3] = &unk_100904890;
  v12[4] = self;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "__imArrayByFilteringWithBlock:", v12));
  id v10 = [v9 count];

  return (unint64_t)v10;
}

- (BOOL)_isTrustedCandidate:(id)a3 index:(id)a4 givenTrustedDevices:(id)a5
{
  id v7 = a3;
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_1003E5A9C;
  id v16 = &unk_100904900;
  id v17 = a4;
  id v18 = v7;
  id v8 = v7;
  id v9 = v17;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "__imArrayByFilteringWithBlock:", &v13));
  BOOL v11 = objc_msgSend(v10, "count", v13, v14, v15, v16) != 0;

  return v11;
}

- (id)_mergeCloudKitTrustedDevices:(id)a3 accountKeyTrustedDevices:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v8 = v7;
  if (v5) {
    -[NSMutableSet addObjectsFromArray:](v7, "addObjectsFromArray:", v5);
  }
  if (v6) {
    -[NSMutableSet addObjectsFromArray:](v8, "addObjectsFromArray:", v6);
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v8, "allObjects"));

  return v9;
}

- (id)_KTDataForIDSKeyTransparencyEntry:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___KTLoggableData);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 loggableData]);
  id v6 = -[KTLoggableData initWithClientData:](v4, "initWithClientData:", v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 pushToken]);
  -[KTLoggableData setDeviceID:](v6, "setDeviceID:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 signedData]);
  -[KTLoggableData setSignature:](v6, "setSignature:", v8);

  -[KTLoggableData setKtCapable:](v6, "setKtCapable:", [v3 ktCapable]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 buildVersion]);
  -[KTLoggableData setBuild:](v6, "setBuild:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 productName]);
  -[KTLoggableData setProduct:](v6, "setProduct:", v10);

  id v11 = [v3 transparencyVersion];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11));
  -[KTLoggableData setVersion:](v6, "setVersion:", v12);

  return v6;
}

- (id)_KTDatasForIDSKeyTransparencyEntries:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _KTDataForIDSKeyTransparencyEntry:]( self,  "_KTDataForIDSKeyTransparencyEntry:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v10),  (void)v13));
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)_IDSProtoKeyTransparencyTrustedDeviceForKeyTransparencyIndex:(id)a3 entry:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 pushToken]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 URI]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 prefixedURI]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceIdentifier]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 loggableData]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 signedData]);

  if (v11) {
    __int128 v13 = -[IDSProtoKeyTransparencyLoggableData initWithData:]( objc_alloc(&OBJC_CLASS___IDSProtoKeyTransparencyLoggableData),  "initWithData:",  v11);
  }
  else {
    __int128 v13 = 0LL;
  }
  __int128 v14 = 0LL;
  if (v7 && v9 && v10 && v13 && v12)
  {
    __int128 v14 = objc_alloc_init(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedDevice);
    -[IDSProtoKeyTransparencyTrustedDevice setPushToken:](v14, "setPushToken:", v7);
    __int128 v15 = objc_alloc_init(&OBJC_CLASS___IDSProtoKeyTransparencyTrustedService);
    -[IDSProtoKeyTransparencyTrustedService setServiceIdentifier:](v15, "setServiceIdentifier:", v10);
    -[IDSProtoKeyTransparencyTrustedService setKtLoggableData:](v15, "setKtLoggableData:", v13);
    -[IDSProtoKeyTransparencyTrustedService setDeviceSignature:](v15, "setDeviceSignature:", v12);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v9));
    -[IDSProtoKeyTransparencyTrustedService setUris:](v15, "setUris:", v16);

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v15));
    -[IDSProtoKeyTransparencyTrustedDevice setTrustedServices:](v14, "setTrustedServices:", v17);
  }

  return v14;
}

- (id)_KTDatasForIDSProtoKeyTransparencyTrustedDevices:(id)a3 serviceIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceController](self, "serviceController"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serviceWithIdentifier:v6]);

  __int128 v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1003E62BC;
  id v18 = &unk_100904928;
  id v19 = v6;
  id v20 = v9;
  id v10 = v9;
  id v11 = v6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__imArrayByApplyingBlock:", &v15));

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier _KTDatasForIDSKeyTransparencyEntries:]( self,  "_KTDatasForIDSKeyTransparencyEntries:",  v12,  v15,  v16,  v17,  v18));
  return v13;
}

- (id)_IDSEndpointTransparencyStatesForKTLoggableDatas:(id)a3 index:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v11);
        id v13 = objc_alloc(&OBJC_CLASS___IDSEndpointTransparencyState);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceID", (void)v17));
        id v15 = objc_msgSend( v13,  "initWithPushToken:verificationState:",  v14,  -[IDSKeyTransparencyVerifier _IDSEndpointTransparencyVerificationStateForKTResult:]( self,  "_IDSEndpointTransparencyVerificationStateForKTResult:",  objc_msgSend(v12, "result")));

        -[NSMutableArray addObject:](v6, "addObject:", v15);
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  return v6;
}

- (int64_t)_IDSEndpointTransparencyVerificationStateForKTResult:(unint64_t)a3
{
  if (a3 > 2) {
    return -1LL;
  }
  else {
    return qword_100718188[a3];
  }
}

- (id)_keyTransparencyVerifierForServiceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier serviceToVerifier](self, "serviceToVerifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (!v6)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1006AD65C();
    }
  }

  return v6;
}

- (id)SHA256HashForKeyTransparencyTrustedDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || (uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 pushToken])) == 0
    || (id v7 = (void *)v6,
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 trustedServices]),
        v8,
        v7,
        !v8))
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "No push token or trusted services. Cannot create a hash.",  buf,  2u);
    }

    goto LABEL_8;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 trustedServices]);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier SHA256HashForKeyTransparencyTrustedServices:]( self,  "SHA256HashForKeyTransparencyTrustedServices:",  v9));

  if (!v10)
  {
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Didn't receive trusted services hash.",  v16,  2u);
    }

LABEL_8:
    id v13 = 0LL;
    goto LABEL_9;
  }

  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 pushToken]);
  -[NSMutableData appendData:](v11, "appendData:", v12);

  -[NSMutableData appendData:](v11, "appendData:", v10);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableData SHA256Data](v11, "SHA256Data"));

LABEL_9:
  return v13;
}

- (id)SHA256HashForKeyTransparencyTrustedServices:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeyTransparencyVerifier SHA256HashForKeyTransparencyTrustedService:]( self,  "SHA256HashForKeyTransparencyTrustedService:",  *(void *)(*((void *)&v27 + 1) + 8LL * (void)v12)));
          if (v13) {
            -[NSMutableSet addObject:](v6, "addObject:", v13);
          }

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }

      while (v10);
    }

    if (-[NSMutableSet count](v6, "count"))
    {
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v6, "allObjects", 0LL));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sortedArrayUsingComparator:&stru_100904948]);

      id v16 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v24;
        do
        {
          __int128 v19 = 0LL;
          do
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            -[NSMutableData appendData:](v7, "appendData:", *(void *)(*((void *)&v23 + 1) + 8LL * (void)v19));
            __int128 v19 = (char *)v19 + 1;
          }

          while (v17 != v19);
          id v17 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
        }

        while (v17);
      }

      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableData SHA256Data](v7, "SHA256Data"));
    }

    else
    {
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No trusted service hashes found, cannot create a hash.",  buf,  2u);
      }

      __int128 v20 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "No trusted services, cannot create a hash.",  buf,  2u);
    }

    __int128 v20 = 0LL;
  }

  return v20;
}

- (id)SHA256HashForKeyTransparencyTrustedService:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 ktLoggableData]);
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceIdentifier]);
    if (v6)
    {

LABEL_5:
      id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 ktLoggableData]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 data]);
      -[NSMutableData appendData:](v8, "appendData:", v10);

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceIdentifier]);
      if (v11)
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceIdentifier]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dataUsingEncoding:4]);
        -[NSMutableData appendData:](v8, "appendData:", v13);
      }

      if ([v3 keyIndex])
      {
        id v14 = [v3 keyIndex];
        if (v14 >= 4) {
          id v15 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v14));
        }
        else {
          id v15 = off_1009049A8[(int)v14];
        }
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataUsingEncoding:](v15, "dataUsingEncoding:", 4LL));
        -[NSMutableData appendData:](v8, "appendData:", v18);
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableData SHA256Data](v8, "SHA256Data"));

      goto LABEL_16;
    }

    unsigned int v7 = [v3 keyIndex];

    if (v7) {
      goto LABEL_5;
    }
  }

  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1006AD6C0();
  }

  id v17 = 0LL;
LABEL_16:

  return v17;
}

+ (id)keyTransparencyServiceIdentifierForTransparencyApplication:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kKTApplicationIdentifierIDS])
  {
    uint64_t v4 = (id *)&IDSiMessageKeyTransparencyService;
  }

  else if ([v3 isEqualToString:kKTApplicationIdentifierIDSFaceTime])
  {
    uint64_t v4 = (id *)&IDSFaceTimeMultiKeyTransparencyService;
  }

  else
  {
    if (![v3 isEqualToString:kKTApplicationIdentifierIDSMultiplex])
    {
      id v5 = &stru_100912B50;
      goto LABEL_8;
    }

    uint64_t v4 = (id *)&IDSMultiplex1KeyTransparencyService;
  }

  id v5 = (__CFString *)*v4;
LABEL_8:

  return v5;
}

+ (id)keyTransparencyApplicationForServiceIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:IDSiMessageKeyTransparencyService])
  {
    uint64_t v4 = (id *)&kKTApplicationIdentifierIDS;
  }

  else if ([v3 isEqualToString:IDSFaceTimeMultiKeyTransparencyService])
  {
    uint64_t v4 = (id *)&kKTApplicationIdentifierIDSFaceTime;
  }

  else
  {
    if (![v3 isEqualToString:IDSMultiplex1KeyTransparencyService])
    {
      id v5 = &stru_100912B50;
      goto LABEL_8;
    }

    uint64_t v4 = (id *)&kKTApplicationIdentifierIDSMultiplex;
  }

  id v5 = (__CFString *)*v4;
LABEL_8:

  return v5;
}

+ (id)keyTransparencyURIPrefixForServiceIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (qword_1009C0DA8 == -1)
  {
    if (v3) {
      goto LABEL_3;
    }
  }

  else
  {
    dispatch_once(&qword_1009C0DA8, &stru_100904968);
    if (v4)
    {
LABEL_3:
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)qword_1009C0DA0 objectForKeyedSubscript:v4]);
      uint64_t v6 = v5;
      if (v5) {
        goto LABEL_7;
      }
    }
  }

  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog KeyTransparency](&OBJC_CLASS___IDSFoundationLog, "KeyTransparency"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1006AD6EC();
  }

  uint64_t v6 = 0LL;
  id v5 = &stru_100912B50;
LABEL_7:
  id v8 = v5;

  return v8;
}

+ (id)strippedURIFromKeyTransparencyURI:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  id v5 = &stru_100912B50;
  if (v3)
  {
    uint64_t v6 = @"im://";
    if (([v3 hasPrefix:@"im://"] & 1) == 0)
    {
      uint64_t v6 = @"mp1://";
      if (([v4 hasPrefix:@"mp1://"] & 1) == 0)
      {
        uint64_t v6 = @"ftm://";
      }
    }

    id v5 = (__CFString *)[v4 copy];
    if ([v4 hasPrefix:v6])
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", -[__CFString length](v6, "length")));

      id v5 = (__CFString *)v7;
    }
  }

  return v5;
}

- (void)_presentInternalVerificationAlertWithText:(id)a3
{
  id v9 = a3;
  uint64_t v4 = im_primary_base_queue(v9);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKeyTransparencyVerifier policy](self, "policy"));
  LODWORD(v5) = [v6 isKeyTransparencyUIEnabled];

  if ((_DWORD)v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMUserNotification userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:]( &OBJC_CLASS___IMUserNotification,  "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:",  @"IDSKeyTransparencyVerifier",  @"Key Transparency",  v9,  @"OK",  0LL,  0LL));
    [v7 setUsesNotificationCenter:1];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserNotificationCenter sharedInstance](&OBJC_CLASS___IMUserNotificationCenter, "sharedInstance"));
    [v8 addUserNotification:v7 listener:0];
  }
}

- (id)_clientErrorWithCode:(int64_t)a3 debugDescription:(id)a4 underlyingError:(id)a5
{
  unint64_t v7 = (unint64_t)a4;
  unint64_t v8 = (unint64_t)a5;
  if (v7 | v8)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v10 = v9;
    if (v7) {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v7,  NSDebugDescriptionErrorKey);
    }
    if (v8) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v8, NSUnderlyingErrorKey);
    }
  }

  else
  {
    id v10 = 0LL;
  }

  uint64_t v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"IDSKeyTransparencyVerifierErrorDomain",  a3,  v10);

  return v11;
}

- (double)keyTransparencyCKContainerExpiryTime
{
  uint64_t v2 = +[IMUserDefaults keyTransparencyCKContainerExpiryOverride]( &OBJC_CLASS___IMUserDefaults,  "keyTransparencyCKContainerExpiryOverride");
  double v4 = 4320000.0;
  if (v2 >= 1 && CUTIsInternalInstall(v2, v3)) {
    return (double)+[IMUserDefaults keyTransparencyCKContainerExpiryOverride]( &OBJC_CLASS___IMUserDefaults,  "keyTransparencyCKContainerExpiryOverride");
  }
  return v4;
}

- (double)keyTransparencyPeerUpdateLastResortFetchInterval
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-peer-update-last-resort-fetch-interval"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    double v6 = (double)(uint64_t)[v3 integerValue];
  }
  else {
    double v6 = 604800.0;
  }

  return v6;
}

- (unint64_t)ktCacheClearRequestLimit
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-clear-cache-request-limit"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unint64_t v6 = (unint64_t)[v3 integerValue];
  }
  else {
    unint64_t v6 = 2LL;
  }

  return v6;
}

- (double)ktCacheClearRequestLimitTime
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-clear-cache-request-limit-time"]);

  double v5 = 1800.0;
  if (v3)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      [v3 doubleValue];
      double v5 = v7;
    }
  }

  return v5;
}

- (unint64_t)ktRegisterUpdateRequestLimit
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-register-update-limit"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unint64_t v6 = (unint64_t)[v3 integerValue];
  }
  else {
    unint64_t v6 = 3LL;
  }

  return v6;
}

- (double)ktRegisterUpdateLimitTime
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-register-update-limit-time"]);

  double v5 = 3600.0;
  if (v3)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      [v3 doubleValue];
      double v5 = v7;
    }
  }

  return v5;
}

- (BOOL)ktShouldClearCacheOnOptInOut
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-clear-cache-opt-in-enabled"]);

  if (v3 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4), (objc_opt_isKindOfClass(v3, v5) & 1) != 0)) {
    unsigned __int8 v6 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)getCurrentRegistrationStateWithCompletion:(id)a3
{
  id v17 = (void (**)(id, NSMutableArray *))a3;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceWithIdentifier:IDSiMessageKeyTransparencyService]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 accountsOnService:v5]);

  double v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v12);
        id v14 = objc_alloc_init(&OBJC_CLASS___IDSKTState);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 registration]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 userID]);
        [v14 setUserID:v16];

        objc_msgSend(v14, "setStatus:", objc_msgSend(v13, "registrationStatus"));
        objc_msgSend(v14, "setOptedIn:", objc_msgSend(v15, "optedIntoKT"));
        objc_msgSend(v14, "setContainsAccountKey:", objc_msgSend(v15, "didRegisterWithKTAccountKey"));
        objc_msgSend(v14, "setContainsDeviceSignature:", objc_msgSend(v15, "didRegisterWithDeviceSignature"));
        -[NSMutableArray addObject:](v7, "addObject:", v14);

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }

  v17[2](v17, v7);
}

- (IDSCloudKitKeyTransparencyStore)keyTransparencyStore
{
  return self->_keyTransparencyStore;
}

- (IDSKeyTransparencyPolicy)policy
{
  return self->_policy;
}

- (IDSKeyTransparencyRegistrationDataSource)registrationDataSource
{
  return self->_registrationDataSource;
}

- (int64_t)mostRecentKTCDPAccountStatus
{
  return self->_mostRecentKTCDPAccountStatus;
}

- (void)setMostRecentKTCDPAccountStatus:(int64_t)a3
{
  self->_mostRecentKTCDPAccountStatus = a3;
}

- (KTVerifier)KTVerifier
{
  return self->_KTVerifier;
}

- (NSDictionary)serviceToVerifier
{
  return self->_serviceToVerifier;
}

- (NSDictionary)optInEligibleKTApplicationToIDSServiceIdentifier
{
  return self->_optInEligibleKTApplicationToIDSServiceIdentifier;
}

- (NSDictionary)serviceToOptInManager
{
  return self->_serviceToOptInManager;
}

- (IDSRegistrationKeyManager)keyManager
{
  return self->_keyManager;
}

- (CUTMetricLogger)internalMetricLogger
{
  return self->_internalMetricLogger;
}

- (CUTMetricLogger)productionMetricLogger
{
  return self->_productionMetricLogger;
}

- (void)setSelfHealRateLimiter:(id)a3
{
}

- (void)setRegisterUpdateRateLimiter:(id)a3
{
}

- (NSMutableDictionary)cacheClearRateLimiterByService
{
  return self->_cacheClearRateLimiterByService;
}

- (void)setCacheClearRateLimiterByService:(id)a3
{
}

- (NSDate)kickPeerVerificationDate
{
  return self->_kickPeerVerificationDate;
}

- (void)setKickPeerVerificationDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end