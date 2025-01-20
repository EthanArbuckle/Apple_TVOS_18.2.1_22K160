@interface AKNativeAnisetteService
- (AKNativeAnisetteService)initWithClient:(id)a3;
- (BOOL)_shouldAddBAAHeaders;
- (id)_tq_anisetteDataForDSID:(unint64_t)a3 withError:(id *)a4;
- (id)_tq_anisetteDataWithRoutingInfoForLastKnownDSIDWithError:(id *)a3;
- (void)_cleanUpCPIMBytes:(char *)a3 provisioningContext:(unsigned int)a4;
- (void)_createProvisioningEndURLRequestWithCPIM:(id)a3 withPreviousTransactionID:(id)a4 completion:(id)a5;
- (void)_createProvisioningStartURLRequestWithPreviousTXID:(id)a3 completion:(id)a4;
- (void)_createSyncURLRequestWithMID:(id)a3 SRM:(id)a4 routingInfo:(unint64_t)a5 completion:(id)a6;
- (void)_endProvisioningWithPreviousTransactionId:(id)a3 cpimData:(id)a4 cpimBytes:(char *)a5 provisioningContext:(unsigned int)a6 completion:(id)a7;
- (void)_invokeTrafficRequest:(id)a3;
- (void)_processEndProvisioningData:(id)a3 withResponse:(id)a4 error:(id)a5 previousTransactionId:(id)a6 cpimBytes:(char *)a7 provisioningContext:(unsigned int)a8 completion:(id)a9;
- (void)_processPendingRequests;
- (void)_processStartProvisioningData:(id)a3 withResponse:(id)a4 error:(id)a5 previousTransactionId:(id)a6 completion:(id)a7;
- (void)_processSyncAnisetteResponse:(id)a3 completion:(id)a4;
- (void)_signRequestWithProvisioningHeaders:(id)a3 forUrlKey:(id)a4;
- (void)_signWithBAAHeadersIfNeededForKey:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)_startProvisioningWithPreviousTransactionId:(id)a3 completion:(id)a4;
- (void)_syncAnisetteWithMIDData:(id)a3 srmData:(id)a4 routingInfo:(unint64_t)a5 completion:(id)a6;
- (void)_tq_activateAndExecuteRequest:(id)a3;
- (void)_tq_eraseAnisetteWithCompletion:(id)a3;
- (void)_tq_invokeAnisetteTrafficRequest:(id)a3 withCompletion:(id)a4;
- (void)_tq_legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)_tq_processEndProvisioningResponse:(id)a3 error:(id)a4 cpimBytes:(char *)a5 provisioningContext:(unsigned int)a6 completion:(id)a7;
- (void)_tq_processStartProvisioningResponse:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_tq_provisionAnisetteWithCompletion:(id)a3;
- (void)_tq_syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)fetchAttestationDataForRequestData:(id)a3 completion:(id)a4;
- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)resetDeviceIdentityWithCompletion:(id)a3;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation AKNativeAnisetteService

- (AKNativeAnisetteService)initWithClient:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AKNativeAnisetteService;
  v6 = -[AKNativeAnisetteService init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[AKMIDValidator sharedValidator](&OBJC_CLASS___AKMIDValidator, "sharedValidator"));
    midValidator = v7->_midValidator;
    v7->_midValidator = (AKMIDValidator *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[AKStrongDeviceIdentitySigner sharedSigner](&OBJC_CLASS___AKStrongDeviceIdentitySigner, "sharedSigner"));
    strongDeviceIdentitySigner = v7->_strongDeviceIdentitySigner;
    v7->_strongDeviceIdentitySigner = (AKStrongDeviceIdentitySigner *)v10;
  }

  return v7;
}

- (void)fetchAttestationDataForRequestData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v49[0] = 0LL;
  v49[1] = v49;
  v49[2] = 0x3032000000LL;
  v49[3] = sub_100026B78;
  v49[4] = sub_100026B88;
  id v50 = 0LL;
  v47[0] = 0LL;
  v47[1] = v47;
  v47[2] = 0x3032000000LL;
  v47[3] = sub_100026B78;
  v47[4] = sub_100026B88;
  id v48 = 0LL;
  uint64_t v8 = _AKSignpostLogSystem(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  os_signpost_id_t v10 = _AKSignpostCreate();
  uint64_t v12 = v11;

  uint64_t v14 = _AKSignpostLogSystem(v13);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_BEGIN,  v10,  "SignAndAttestation",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
  }

  uint64_t v18 = _AKSignpostLogSystem(v17);
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: SignAndAttestation  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v52 = 0x3032000000LL;
  v53 = sub_100026B78;
  v54 = sub_100026B88;
  id v55 = 0LL;
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x3032000000LL;
  v45[3] = sub_100026B78;
  v45[4] = sub_100026B88;
  id v46 = 0LL;
  v20 = dispatch_group_create();
  dispatch_group_enter(v20);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100026B90;
  v41[3] = &unk_1001C7398;
  p___int128 buf = &buf;
  v44 = v49;
  v21 = v20;
  v42 = v21;
  -[AKNativeAnisetteService fetchAnisetteDataAndProvisionIfNecessary:withCompletion:]( self,  "fetchAnisetteDataAndProvisionIfNecessary:withCompletion:",  1LL,  v41);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (-[AKNativeAnisetteService _shouldAddBAAHeaders](self, "_shouldAddBAAHeaders"))
  {
    dispatch_group_enter(v21);
    strongDeviceIdentitySigner = self->_strongDeviceIdentitySigner;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_100026C4C;
    v37[3] = &unk_1001C6D20;
    v39 = v45;
    v40 = v47;
    v38 = v21;
    -[AKStrongDeviceIdentitySigner baaV1HeadersForRequestData:completion:]( strongDeviceIdentitySigner,  "baaV1HeadersForRequestData:completion:",  v6,  v37);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v24 trafficQueue]);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100026CFC;
  v28[3] = &unk_1001C73C0;
  v31 = v49;
  v32 = v47;
  v33 = &buf;
  v34 = v45;
  os_signpost_id_t v35 = v10;
  uint64_t v36 = v12;
  id v29 = v22;
  id v30 = v7;
  id v26 = v7;
  id v27 = v22;
  dispatch_group_notify(v21, v25, v28);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
}

- (BOOL)_shouldAddBAAHeaders
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AKFeatureManager sharedManager](&OBJC_CLASS___AKFeatureManager, "sharedManager"));
  unsigned int v3 = [v2 isBAASupportedForVirtualMachines];

  uint64_t v4 = _AKTrafficLogSubsystem();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (!v3)
  {
    if (v6) {
      sub_10012EAB8();
    }
    goto LABEL_15;
  }

  if (v6) {
    sub_10012EA8C();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v8 = [v7 isVirtualMachine];

  if ((v8 & 1) == 0)
  {
    uint64_t v14 = _AKTrafficLogSubsystem();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10012EA60();
    }
    goto LABEL_15;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v10 = [v9 isStrongDeviceIdentitySupported];

  uint64_t v11 = _AKTrafficLogSubsystem();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v12 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if ((v10 & 1) == 0)
  {
    if (v12) {
      sub_10012EA34();
    }
LABEL_15:
    BOOL v13 = 0;
    goto LABEL_16;
  }

  if (v12) {
    sub_10012EA08();
  }
  BOOL v13 = 1;
LABEL_16:

  return v13;
}

- (void)resetDeviceIdentityWithCompletion:(id)a3
{
}

- (void)_invokeTrafficRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKTrafficLogSubsystem();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10012EAE4();
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  unsigned __int8 v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 trafficQueue]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100027130;
  v10[3] = &unk_1001C6538;
  id v11 = v4;
  BOOL v12 = self;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (void)_processPendingRequests
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 trafficQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027278;
  block[3] = &unk_1001C7300;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_tq_activateAndExecuteRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  BOOL v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 trafficQueue]);
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = _AKTrafficLogSubsystem();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10012EC6C();
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  [v9 setActiveSigningRequest:v4];

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v4 signingBlock]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000274DC;
  v13[3] = &unk_1001C6538;
  id v14 = v4;
  v15 = self;
  id v11 = (void (*)(void *, id, void *))v10[2];
  id v12 = v4;
  v11(v10, v12, v13);
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)os_transaction_create("com.apple.authkit.anisette-native-fetch-provision");
  unsigned __int8 v8 = objc_alloc(&OBJC_CLASS___AKSigningTrafficClearanceRequest);
  client = self->_client;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100027618;
  v13[3] = &unk_1001C7410;
  void v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = -[AKSigningTrafficClearanceRequest initWithClient:signingBlock:]( v8,  "initWithClient:signingBlock:",  client,  v13);
  -[AKSigningTrafficClearanceRequest setShouldProvisionIfNeccessary:](v12, "setShouldProvisionIfNeccessary:", v4);
  -[AKNativeAnisetteService _invokeTrafficRequest:](self, "_invokeTrafficRequest:", v12);
}

- (void)_tq_invokeAnisetteTrafficRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, id))a4;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 trafficQueue]);
  dispatch_assert_queue_V2(v9);

  id v26 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[AKNativeAnisetteService _tq_anisetteDataWithRoutingInfoForLastKnownDSIDWithError:]( self,  "_tq_anisetteDataWithRoutingInfoForLastKnownDSIDWithError:",  &v26));
  id v11 = v26;
  if (!v10)
  {
    uint64_t v12 = ((uint64_t (*)(void))_AKTrafficLogSubsystem)();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10012EE28();
    }

    id v25 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[AKNativeAnisetteService _tq_anisetteDataWithRoutingInfoForLastKnownDSIDWithError:]( self,  "_tq_anisetteDataWithRoutingInfoForLastKnownDSIDWithError:",  &v25));
    id v11 = v25;
    if (v10)
    {
      uint64_t v14 = ((uint64_t (*)(void))_AKTrafficLogSubsystem)();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10012EDFC();
      }
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  if (v10 || ![v17 isAccountNotProvisioned])
  {
    -[AKMIDValidator validateMID:anisetteFetchError:](self->_midValidator, "validateMID:anisetteFetchError:", v10, v11);
    if (v7) {
      v7[2](v7, v10, v11);
    }
  }

  else if ([v6 shouldProvisionIfNeccessary])
  {
    uint64_t v18 = _AKTrafficLogSubsystem( -[AKMIDValidator validateMID:anisetteFetchError:]( self->_midValidator,  "validateMID:anisetteFetchError:",  0LL,  v11));
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10012EDA4();
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBagService sharedBagService](&OBJC_CLASS___AKURLBagService, "sharedBagService"));
    [v20 clearCache];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100027984;
    v23[3] = &unk_1001C7460;
    v23[4] = self;
    v24 = v7;
    -[AKNativeAnisetteService _tq_provisionAnisetteWithCompletion:](self, "_tq_provisionAnisetteWithCompletion:", v23);
  }

  else
  {
    uint64_t v21 = ((uint64_t (*)(void))_AKTrafficLogSubsystem)();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10012EDD0();
    }

    if (v7) {
      v7[2](v7, 0LL, v11);
    }
  }
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = objc_alloc(&OBJC_CLASS___AKSigningTrafficClearanceRequest);
  client = self->_client;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100027C28;
  v13[3] = &unk_1001C7410;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = -[AKSigningTrafficClearanceRequest initWithClient:signingBlock:]( v8,  "initWithClient:signingBlock:",  client,  v13);
  -[AKNativeAnisetteService _invokeTrafficRequest:](self, "_invokeTrafficRequest:", v12);
}

- (void)_tq_legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 trafficQueue]);
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v7));
  uint64_t v14 = 0LL;
  if ([v10 scanUnsignedLongLong:&v14])
  {
    id v13 = 0LL;
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[AKNativeAnisetteService _tq_anisetteDataForDSID:withError:]( self,  "_tq_anisetteDataForDSID:withError:",  v14,  &v13));
    id v12 = v13;
    v6[2](v6, v11, v12);

    id v6 = (void (**)(id, uint64_t, id))v11;
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8003LL,  0LL));
    v6[2](v6, 0LL, v12);
  }
}

- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Fetching peer attestation data for request (%@)",  (uint8_t *)&v11,  0x16u);
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___AKAppleIDSigningController);
  [v10 setIsProxy:1];
  [v10 attestationDataForRequest:v6 completion:v7];
}

- (id)_tq_anisetteDataWithRoutingInfoForLastKnownDSIDWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 trafficQueue]);
  dispatch_assert_queue_V2(v6);

  unint64_t v7 = +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromLastKnownIDMSEnvironment]( &OBJC_CLASS___AKActiveAnisetteDSIDFetcher,  "activeAnisettDSIDFromLastKnownIDMSEnvironment");
  uint64_t v8 = +[AKADIProxy getIDMSRoutingInfo:forDSID:](&OBJC_CLASS___AKADIProxy, "getIDMSRoutingInfo:forDSID:", &v14, v7);
  if ((_DWORD)v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = _AKTrafficLogSubsystem(v8);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10012EF80();
    }

    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError ak_wrappedAnisetteError:underlyingADIErrorCode:]( &OBJC_CLASS___NSError,  "ak_wrappedAnisetteError:underlyingADIErrorCode:",  -8025LL,  v9));
    }
    return 0LL;
  }

  else
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( -[AKNativeAnisetteService _tq_anisetteDataForDSID:withError:]( self,  "_tq_anisetteDataForDSID:withError:",  v7,  a3));
    [v13 setRoutingInfo:v14];
    return v13;
  }

- (id)_tq_anisetteDataForDSID:(unint64_t)a3 withError:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  unint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 trafficQueue]);
  dispatch_assert_queue_V2(v7);

  uint64_t v9 = _AKTrafficLogSubsystem(v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10012F220();
  }

  uint64_t v27 = 0LL;
  uint64_t v11 = +[AKADIProxy requestOTPForDSID:outMID:outMIDSize:outOTP:outOTPSize:]( &OBJC_CLASS___AKADIProxy,  "requestOTPForDSID:outMID:outMIDSize:outOTP:outOTPSize:",  a3,  &v29,  (char *)&v27 + 4,  &v28,  &v27);
  if ((_DWORD)v11)
  {
    id v12 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSError ak_wrappedAnisetteError:](&OBJC_CLASS___NSError, "ak_wrappedAnisetteError:", v11));
    id v13 = -[NSData isAccountNotProvisioned](v12, "isAccountNotProvisioned");
    int v14 = (int)v13;
    uint64_t v15 = _AKTrafficLogSubsystem(v13);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v17) {
        sub_10012F10C(a3, v16);
      }
    }

    else if (v17)
    {
      sub_10012F198();
    }

    if (a4)
    {
      id v12 = v12;
      id v25 = 0LL;
      *a4 = v12;
    }

    else
    {
      id v25 = 0LL;
    }
  }

  else
  {
    uint64_t v18 = objc_alloc(&OBJC_CLASS___NSData);
    id v12 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v18,  "initWithBytesNoCopy:length:freeWhenDone:",  v29,  HIDWORD(v27),  0LL);
    v19 = objc_alloc(&OBJC_CLASS___NSData);
    v20 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v19,  "initWithBytesNoCopy:length:freeWhenDone:",  v28,  v27,  0LL);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](v12, "base64EncodedStringWithOptions:", 0LL));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](v20, "base64EncodedStringWithOptions:", 0LL));
    uint64_t v23 = _AKTrafficLogSubsystem(v22);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_10012F008((uint64_t)v21, (uint64_t)v22, v24);
    }

    if (v29) {
      +[AKADIProxy dispose:](&OBJC_CLASS___AKADIProxy, "dispose:");
    }
    if (v28) {
      +[AKADIProxy dispose:](&OBJC_CLASS___AKADIProxy, "dispose:");
    }
    id v25 = objc_alloc_init(&OBJC_CLASS___AKAnisetteData);
    [v25 setMachineID:v21];
    [v25 setOneTimePassword:v22];
  }

  return v25;
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___AKSigningTrafficClearanceRequest);
  client = self->_client;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_100028314;
  id v12 = &unk_1001C74D8;
  id v13 = self;
  id v14 = v4;
  id v7 = v4;
  uint64_t v8 = -[AKSigningTrafficClearanceRequest initWithClient:signingBlock:](v5, "initWithClient:signingBlock:", client, &v9);
  -[AKNativeAnisetteService _invokeTrafficRequest:](self, "_invokeTrafficRequest:", v8, v9, v10, v11, v12, v13);
}

- (void)_startProvisioningWithPreviousTransactionId:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100028488;
  v8[3] = &unk_1001C7528;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  -[AKNativeAnisetteService _createProvisioningStartURLRequestWithPreviousTXID:completion:]( self,  "_createProvisioningStartURLRequestWithPreviousTXID:completion:",  v6,  v8);
}

- (void)_processStartProvisioningData:(id)a3 withResponse:(id)a4 error:(id)a5 previousTransactionId:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v18 = (void (**)(void, void, void, void, void, void))v16;
  if (v14)
  {
    uint64_t v19 = _AKLogSystem(v16);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10012F35C();
    }

    if (v18) {
      ((void (**)(void, void, id, void, void, void))v18)[2](v18, 0LL, v14, 0LL, 0LL, 0LL);
    }
    goto LABEL_29;
  }

  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v17);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v13, v21);
  if ((isKindOfClass & 1) != 0)
  {
    id v23 = [v13 statusCode];
    uint64_t v24 = _AKLogSystem(v23);
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v23));
      *(_DWORD *)__int128 buf = 138412290;
      id v46 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Start provisioning response code: %@",  buf,  0xCu);
    }

    if (!v12 || v23 == (id)200)
    {
      if (!v12)
      {
        v33 = 0LL;
        if (!v15)
        {
LABEL_20:
          if (v23 == (id)436)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"Response"]);
            os_signpost_id_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"txid"]);

            if (v35)
            {
              uint64_t v37 = _AKLogSystem(v36);
              v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Attempting provisioning again...",  buf,  2u);
              }

              -[AKNativeAnisetteService _startProvisioningWithPreviousTransactionId:completion:]( self,  "_startProvisioningWithPreviousTransactionId:completion:",  0LL,  v18);
            }

            goto LABEL_29;
          }
        }

- (void)_tq_processStartProvisioningResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 trafficQueue]);
  dispatch_assert_queue_V2(v10);

  unint64_t v11 = +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment]( &OBJC_CLASS___AKActiveAnisetteDSIDFetcher,  "activeAnisettDSIDFromCurrentIDMSEnvironment");
  if (v7)
  {
    unint64_t v12 = v11;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"Response"]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"spim"]);

    if (!v14)
    {
      uint64_t v25 = _AKLogSystem(v15);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10012F3EC();
      }

      id v16 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8008LL,  0LL));
      (*((void (**)(id, void, NSData *, void, void, void))v8 + 2))(v8, 0LL, v16, 0LL, 0LL, 0LL);
      goto LABEL_21;
    }

    id v16 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData), "initWithBase64EncodedString:options:", v14, 0LL);
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    uint64_t v17 = +[AKADIProxy startProvisioningWithDSID:SPIM:SPIMLength:outCPIM:outCPIMLength:outSession:]( &OBJC_CLASS___AKADIProxy,  "startProvisioningWithDSID:SPIM:SPIMLength:outCPIM:outCPIMLength:outSession:",  v12,  -[NSData bytes](v16, "bytes"),  -[NSData length](v16, "length"),  &v29,  (char *)&v28 + 4,  &v28);
    uint64_t v18 = v29;
    uint64_t v19 = _AKLogSystem(v17);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = v20;
    if ((_DWORD)v17 || !v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10012F418();
      }

      -[AKNativeAnisetteService _cleanUpCPIMBytes:provisioningContext:]( self,  "_cleanUpCPIMBytes:provisioningContext:",  v29,  v28);
      if (!v8) {
        goto LABEL_21;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_wrappedAnisetteError:](&OBJC_CLASS___NSError, "ak_wrappedAnisetteError:", v17));
      (*((void (**)(id, void, void *, void, void, uint64_t))v8 + 2))( v8,  0LL,  v22,  0LL,  v28,  v29);
    }

    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "ADIProvisioningStart succeeded!", v27, 2u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v29, HIDWORD(v28)));
      if (v8) {
        (*((void (**)(id, uint64_t, void, void *, void, uint64_t))v8 + 2))( v8,  1LL,  0LL,  v22,  v28,  v29);
      }
    }

LABEL_21:
    goto LABEL_22;
  }

  uint64_t v23 = _AKLogSystem(v11);
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_10012F3C0();
  }

  if (v8)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8007LL,  0LL));
    (*((void (**)(id, void, void *, void, void, void))v8 + 2))(v8, 0LL, v14, 0LL, 0LL, 0LL);
LABEL_22:
  }
}

- (void)_endProvisioningWithPreviousTransactionId:(id)a3 cpimData:(id)a4 cpimBytes:(char *)a5 provisioningContext:(unsigned int)a6 completion:(id)a7
{
  id v12 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100028E10;
  v15[3] = &unk_1001C7578;
  unsigned int v19 = a6;
  id v17 = a7;
  uint64_t v18 = a5;
  v15[4] = self;
  id v16 = v12;
  id v13 = v12;
  id v14 = v17;
  -[AKNativeAnisetteService _createProvisioningEndURLRequestWithCPIM:withPreviousTransactionID:completion:]( self,  "_createProvisioningEndURLRequestWithCPIM:withPreviousTransactionID:completion:",  a4,  v13,  v15);
}

- (void)_processEndProvisioningData:(id)a3 withResponse:(id)a4 error:(id)a5 previousTransactionId:(id)a6 cpimBytes:(char *)a7 provisioningContext:(unsigned int)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  uint64_t v21 = (void (**)(void, void, void))v19;
  if (v17)
  {
    uint64_t v22 = _AKLogSystem(v19);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10012F54C();
    }

    if (v21) {
      ((void (**)(void, void, id))v21)[2](v21, 0LL, v17);
    }
    goto LABEL_27;
  }

  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v20);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v16, v24);
  if ((isKindOfClass & 1) != 0)
  {
    id v26 = [v16 statusCode];
    id v27 = v26;
    if (!v15 || v26 == (id)200)
    {
      if (!v15)
      {
        v33 = 0LL;
        if (!v18)
        {
LABEL_18:
          if (v27 == (id)436)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"Response"]);
            os_signpost_id_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"txid"]);

            if (v35)
            {
              uint64_t v37 = _AKLogSystem(v36);
              v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)__int128 buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Attempting provisioning again...",  buf,  2u);
              }

              v48[0] = _NSConcreteStackBlock;
              v48[1] = 3221225472LL;
              v48[2] = sub_1000293B0;
              v48[3] = &unk_1001C75A0;
              v48[4] = self;
              id v49 = 0LL;
              id v50 = v21;
              -[AKNativeAnisetteService _startProvisioningWithPreviousTransactionId:completion:]( self,  "_startProvisioningWithPreviousTransactionId:completion:",  0LL,  v48);
            }

            goto LABEL_27;
          }
        }

- (void)_tq_processEndProvisioningResponse:(id)a3 error:(id)a4 cpimBytes:(char *)a5 provisioningContext:(unsigned int)a6 completion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v11 = a3;
  id v12 = (void (**)(id, void, void *))a7;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 trafficQueue]);
  dispatch_assert_queue_V2(v14);

  unint64_t v15 = +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment]( &OBJC_CLASS___AKActiveAnisetteDSIDFetcher,  "activeAnisettDSIDFromCurrentIDMSEnvironment");
  if (v11)
  {
    unint64_t v16 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Response"]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"ptm"]);

    if (!v18)
    {
      uint64_t v20 = _AKLogSystem(v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10012F744();
      }
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Response"]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"tk"]);

    if (!v23)
    {
      uint64_t v25 = _AKLogSystem(v24);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10012F718();
      }
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"Response"]);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"X-Apple-I-MD-RINFO"]);

    if (v28)
    {
      if (v18 && v23)
      {
        uint64_t v30 = +[AKADIProxy setIDMSRoutingInfo:forDSID:]( AKADIProxy,  "setIDMSRoutingInfo:forDSID:",  [v28 integerValue],  v16);
        if (!(_DWORD)v30)
        {
          v40 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v18,  0LL);
          v41 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v23,  0LL);
          v39 = v40;
          id v49 = -[NSData bytes](v39, "bytes");
          id v48 = -[NSData length](v39, "length");
          v51 = v41;
          uint64_t v42 = +[AKADIProxy endProvisioningWithSession:PTM:PTMLength:TK:TKLength:]( &OBJC_CLASS___AKADIProxy,  "endProvisioningWithSession:PTM:PTMLength:TK:TKLength:",  v8,  v49,  v48,  -[NSData bytes](v51, "bytes"),  -[NSData length](v51, "length"));
          if ((_DWORD)v42)
          {
            unsigned int v50 = v42;
            uint64_t v43 = _AKLogSystem(v42);
            id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              sub_10012F608();
            }

            -[AKNativeAnisetteService _cleanUpCPIMBytes:provisioningContext:]( self,  "_cleanUpCPIMBytes:provisioningContext:",  a5,  v8);
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_wrappedAnisetteError:](&OBJC_CLASS___NSError, "ak_wrappedAnisetteError:", v50));
            v12[2](v12, 0LL, v45);
          }

          else
          {
            uint64_t v46 = _AKLogSystem( -[AKNativeAnisetteService _cleanUpCPIMBytes:provisioningContext:]( self,  "_cleanUpCPIMBytes:provisioningContext:",  a5,  v8));
            unsigned int v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int128 buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "ADIProvisioningEnd succeeded!",  buf,  2u);
            }

            v12[2](v12, 1LL, 0LL);
          }

          goto LABEL_25;
        }

        uint64_t v31 = v30;
        uint64_t v32 = _AKLogSystem(v30);
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_10012F690();
        }

        -[AKNativeAnisetteService _cleanUpCPIMBytes:provisioningContext:]( self,  "_cleanUpCPIMBytes:provisioningContext:",  a5,  v8);
        uint64_t v34 = objc_claimAutoreleasedReturnValue(+[NSError ak_wrappedAnisetteError:](&OBJC_CLASS___NSError, "ak_wrappedAnisetteError:", v31));
LABEL_24:
        v39 = (NSData *)v34;
        v12[2](v12, 0LL, (void *)v34);
LABEL_25:

        goto LABEL_26;
      }
    }

    else
    {
      uint64_t v37 = _AKLogSystem(v29);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_10012F5DC();
      }
    }

    -[AKNativeAnisetteService _cleanUpCPIMBytes:provisioningContext:]( self,  "_cleanUpCPIMBytes:provisioningContext:",  a5,  v8);
    uint64_t v34 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8008LL,  0LL));
    goto LABEL_24;
  }

  uint64_t v35 = _AKLogSystem( -[AKNativeAnisetteService _cleanUpCPIMBytes:provisioningContext:]( self,  "_cleanUpCPIMBytes:provisioningContext:",  a5,  v8));
  uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_10012F5B0();
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8007LL,  0LL));
  v12[2](v12, 0LL, v18);
LABEL_26:
}

- (void)_cleanUpCPIMBytes:(char *)a3 provisioningContext:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3) {
    self = (AKNativeAnisetteService *)+[AKADIProxy dispose:](&OBJC_CLASS___AKADIProxy, "dispose:");
  }
  if ((_DWORD)v4)
  {
    uint64_t v5 = _AKLogSystem(self);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Destroying provisioning context.", v7, 2u);
    }

    +[AKADIProxy destroyProvisioningSession:](&OBJC_CLASS___AKADIProxy, "destroyProvisioningSession:", v4);
  }

- (void)_tq_provisionAnisetteWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 trafficQueue]);
  dispatch_assert_queue_V2(v6);

  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Kicking off Anisette provisioning....", buf, 2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ak_wrappedAnisetteError:]( &OBJC_CLASS___NSError,  "ak_wrappedAnisetteError:",  +[AKADIProxy isMachineProvisioned:]( &OBJC_CLASS___AKADIProxy,  "isMachineProvisioned:",  +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment]( &OBJC_CLASS___AKActiveAnisetteDSIDFetcher,  "activeAnisettDSIDFromCurrentIDMSEnvironment"))));
  id v11 = [v10 isAccountNotProvisioned];
  if ((v11 & 1) != 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100029AB0;
    v15[3] = &unk_1001C75F0;
    v15[4] = self;
    id v16 = v4;
    -[AKNativeAnisetteService _startProvisioningWithPreviousTransactionId:completion:]( self,  "_startProvisioningWithPreviousTransactionId:completion:",  0LL,  v15);
  }

  else
  {
    uint64_t v12 = _AKLogSystem(v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10012F770();
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8006LL,  0LL));
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v14);
  }
}

- (void)_signWithBAAHeadersIfNeededForKey:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  unsigned int v11 = [v10 isBaaEnabledForKey:v7];

  if (v11)
  {
    uint64_t v13 = _AKLogSystem(v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Signing with BAA headers for urlKey: %@",  buf,  0xCu);
    }

    id v15 = objc_alloc_init(&OBJC_CLASS___AKAppleIDSigningController);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100029C6C;
    v16[3] = &unk_1001C7640;
    id v17 = v8;
    id v18 = v9;
    [v15 signWithBAAHeaders:v17 completion:v16];
  }

  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
  }
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(&OBJC_CLASS___AKSigningTrafficClearanceRequest);
  client = self->_client;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100029E40;
  v13[3] = &unk_1001C7410;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = -[AKSigningTrafficClearanceRequest initWithClient:signingBlock:]( v8,  "initWithClient:signingBlock:",  client,  v13);
  -[AKNativeAnisetteService _invokeTrafficRequest:](self, "_invokeTrafficRequest:", v12);
}

- (void)_syncAnisetteWithMIDData:(id)a3 srmData:(id)a4 routingInfo:(unint64_t)a5 completion:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100029FB0;
  v10[3] = &unk_1001C7690;
  id v11 = self;
  id v12 = a6;
  id v9 = v12;
  -[AKNativeAnisetteService _createSyncURLRequestWithMID:SRM:routingInfo:completion:]( v11,  "_createSyncURLRequestWithMID:SRM:routingInfo:completion:",  a3,  a4,  a5,  v10);
}

- (void)_processSyncAnisetteResponse:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  unint64_t v7 = +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment]( &OBJC_CLASS___AKActiveAnisetteDSIDFetcher,  "activeAnisettDSIDFromCurrentIDMSEnvironment");
  if (v5)
  {
    unint64_t v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Response"]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Status"]);

    uint64_t v12 = _AKLogSystem(v11);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10012F9D4();
    }

    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14);
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v10, v15);
    if ((isKindOfClass & 1) != 0)
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:AKErrorStatusCodeKey]);
      uint64_t v19 = (void *)v17;
      if (v17)
      {
        uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber, v18);
        uint64_t v17 = objc_opt_isKindOfClass(v19, v20);
        if ((v17 & 1) != 0)
        {
          uint64_t v17 = (uint64_t)[v19 integerValue];
          if (v17)
          {
            uint64_t v21 = _AKLogSystem(v17);
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_10012F944();
            }

            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8011LL,  0LL));
            v6[2](v6, 0LL, v23);
LABEL_29:

            goto LABEL_30;
          }
        }
      }

      uint64_t v27 = _AKLogSystem(v17);
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Server sync looks like it succeeded.",  buf,  2u);
      }
    }

    else
    {
      uint64_t v26 = _AKLogSystem(isKindOfClass);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
        sub_10012F9A8();
      }
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"Response"]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:@"X-Apple-I-MD-RINFO"]);

    if (!v23) {
      goto LABEL_26;
    }
    uint64_t v31 = _AKLogSystem(v30);
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "We've been given new R-Info.", v40, 2u);
    }

    uint64_t v30 = +[AKADIProxy setIDMSRoutingInfo:forDSID:]( AKADIProxy,  "setIDMSRoutingInfo:forDSID:",  [v23 integerValue],  v8);
    if ((_DWORD)v30)
    {
      uint64_t v33 = v30;
      uint64_t v34 = _AKLogSystem(v30);
      uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10012F8BC();
      }

      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_wrappedAnisetteError:](&OBJC_CLASS___NSError, "ak_wrappedAnisetteError:", v33));
      v6[2](v6, 0LL, v36);
    }

    else
    {
LABEL_26:
      uint64_t v37 = _AKLogSystem(v30);
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Anisette sync is complete!",  (uint8_t *)v39,  2u);
      }

      v6[2](v6, 1LL, 0LL);
    }

    goto LABEL_29;
  }

  uint64_t v24 = _AKLogSystem(v7);
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_10012F890();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8007LL,  0LL));
  v6[2](v6, 0LL, v10);
LABEL_30:
}

- (void)_tq_syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 trafficQueue]);
  dispatch_assert_queue_V2(v9);

  if (v6 && (id v10 = [v6 length]) != 0)
  {
    uint64_t v11 = _AKLogSystem(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Resyncing Anisette provisioning data...",  buf,  2u);
    }

    unint64_t v13 = +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment]( &OBJC_CLASS___AKActiveAnisetteDSIDFetcher,  "activeAnisettDSIDFromCurrentIDMSEnvironment");
    uint64_t v38 = 0LL;
    *(void *)__int128 buf = 0LL;
    unsigned int v37 = 0;
    unsigned int v36 = 0;
    id v14 = v6;
    uint64_t v15 = +[AKADIProxy synchronizeWithDSID:SIM:SIMLength:outMID:outMIDLength:outSRM:outSRMLength:]( AKADIProxy,  "synchronizeWithDSID:SIM:SIMLength:outMID:outMIDLength:outSRM:outSRMLength:",  v13,  [v14 bytes],  objc_msgSend(v14, "length"),  buf,  &v37,  &v38,  &v36);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10002AA94;
    v35[3] = &unk_1001C76B0;
    v35[4] = v38;
    v35[5] = *(void *)buf;
    id v16 = objc_retainBlock(v35);
    uint64_t v17 = v38;
    uint64_t v18 = *(void *)buf;
    uint64_t v19 = _AKLogSystem(v16);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v21 = v20;
    if (!(_DWORD)v15 && v17 && v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "ADISynchronize succeeded!", v34, 2u);
      }

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  *(void *)buf,  v37));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v38, v36));
      *(void *)uint64_t v34 = 0LL;
      uint64_t v24 = +[AKADIProxy getIDMSRoutingInfo:forDSID:](&OBJC_CLASS___AKADIProxy, "getIDMSRoutingInfo:forDSID:", v34, v13);
      if ((_DWORD)v24)
      {
        uint64_t v25 = _AKLogSystem(v24);
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_10012FAEC();
        }
      }

      uint64_t v27 = *(void *)v34;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_10002AB20;
      v31[3] = &unk_1001C74B0;
      uint64_t v32 = v16;
      id v33 = v7;
      -[AKNativeAnisetteService _syncAnisetteWithMIDData:srmData:routingInfo:completion:]( self,  "_syncAnisetteWithMIDData:srmData:routingInfo:completion:",  v22,  v23,  v27,  v31);
    }

    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10012FA64();
      }

      ((void (*)(void *))v16[2])(v16);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_wrappedAnisetteError:](&OBJC_CLASS___NSError, "ak_wrappedAnisetteError:", v15));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v22);
    }
  }

  else
  {
    uint64_t v28 = _AKLogSystem(v10);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10012FA38();
    }

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8010LL,  0LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v30);
  }
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___AKSigningTrafficClearanceRequest);
  client = self->_client;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_10002AC34;
  uint64_t v12 = &unk_1001C74D8;
  unint64_t v13 = self;
  id v14 = v4;
  id v7 = v4;
  unint64_t v8 = -[AKSigningTrafficClearanceRequest initWithClient:signingBlock:](v5, "initWithClient:signingBlock:", client, &v9);
  -[AKNativeAnisetteService _invokeTrafficRequest:](self, "_invokeTrafficRequest:", v8, v9, v10, v11, v12, v13);
}

- (void)_tq_eraseAnisetteWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKNativeAnisetteServiceTrafficManager sharedSigningService]( &OBJC_CLASS___AKNativeAnisetteServiceTrafficManager,  "sharedSigningService"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 trafficQueue]);
  dispatch_assert_queue_V2(v6);

  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Erasing Anisette provisioning data...", buf, 2u);
  }

  uint64_t v10 = +[AKADIProxy eraseProvisioningForDSID:]( &OBJC_CLASS___AKADIProxy,  "eraseProvisioningForDSID:",  +[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromCurrentIDMSEnvironment]( &OBJC_CLASS___AKActiveAnisetteDSIDFetcher,  "activeAnisettDSIDFromCurrentIDMSEnvironment"));
  uint64_t v11 = _AKLogSystem(v10);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  unint64_t v13 = v12;
  if ((_DWORD)v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10012FBD8();
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ak_wrappedAnisetteError:](&OBJC_CLASS___NSError, "ak_wrappedAnisetteError:", v10));
    v4[2](v4, 0LL, v14);
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Erasing Anisette data succeeded!", v21, 2u);
    }

    midValidator = self->_midValidator;
    id v20 = 0LL;
    unsigned __int8 v16 = -[AKMIDValidator resetKeychainCacheWithError:](midValidator, "resetKeychainCacheWithError:", &v20);
    id v17 = v20;
    id v14 = v17;
    if ((v16 & 1) == 0)
    {
      uint64_t v18 = _AKLogSystem(v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10012FB74();
      }
    }

    v4[2](v4, 1LL, 0LL);
  }
}

- (void)_createProvisioningStartURLRequestWithPreviousTXID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  uint64_t v9 = AKURLBagKeyStartProvisioning;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002AF98;
  v12[3] = &unk_1001C7700;
  id v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v8 urlForKey:v9 completion:v12];
}

- (void)_createProvisioningEndURLRequestWithCPIM:(id)a3 withPreviousTransactionID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  uint64_t v12 = AKURLBagKeyEndProvisioning;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10002B304;
  v16[3] = &unk_1001C7728;
  id v17 = v8;
  id v18 = v9;
  uint64_t v19 = self;
  id v20 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  [v11 urlForKey:v12 completion:v16];
}

- (void)_createSyncURLRequestWithMID:(id)a3 SRM:(id)a4 routingInfo:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  uint64_t v14 = AKURLBagKeySyncAnisette;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10002B644;
  v18[3] = &unk_1001C7750;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  unint64_t v22 = a5;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  [v13 urlForKey:v14 completion:v18];
}

- (void)_signRequestWithProvisioningHeaders:(id)a3 forUrlKey:(id)a4
{
  id v9 = a3;
  objc_msgSend(v9, "ak_addClientInfoHeader");
  objc_msgSend(v9, "ak_addClientTimeHeader");
  objc_msgSend(v9, "ak_addDeviceMLBHeader");
  objc_msgSend(v9, "ak_addDeviceROMHeader");
  objc_msgSend(v9, "ak_addDeviceSerialNumberHeader");
  objc_msgSend(v9, "ak_addDeviceUDIDHeader");
  objc_msgSend(v9, "ak_addLocalUserUUIDHashHeader");
  objc_msgSend(v9, "ak_addInternalBuildHeader");
  objc_msgSend(v9, "ak_addSeedBuildHeader");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient fullName](self->_client, "fullName"));
  id v6 = [v5 length];

  id v7 = v9;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient fullName](self->_client, "fullName"));
    objc_msgSend(v9, "ak_addClientApp:", v8);

    id v7 = v9;
  }
}

- (void).cxx_destruct
{
}

@end