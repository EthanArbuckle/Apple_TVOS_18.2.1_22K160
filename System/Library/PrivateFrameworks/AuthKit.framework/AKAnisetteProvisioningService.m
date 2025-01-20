@interface AKAnisetteProvisioningService
- (AKAbsintheSigner)absintheSigner;
- (AKAnisetteProvisioningService)initWithClient:(id)a3;
- (AKAnisetteProvisioningService)initWithClient:(id)a3 authenticationContext:(id)a4;
- (AKAnisetteProvisioningService)initWithClient:(id)a3 context:(id)a4;
- (AKAttestationSigner)attestationSigner;
- (id)_clientAnisetteService;
- (id)_helperServiceForDevice:(id)a3;
- (id)_nativeAnisetteService;
- (id)_pairedDeviceAnisetteService;
- (id)anisetteDataForDevice:(id)a3 provisionIfNecessary:(BOOL)a4;
- (void)_attestationDataForRequestData:(id)a3 completion:(id)a4;
- (void)_fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 device:(id)a4 completion:(id)a5;
- (void)absintheSignatureForData:(id)a3 completion:(id)a4;
- (void)attestationDataForDevice:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)attestationDataForRequestData:(id)a3 completion:(id)a4;
- (void)eraseAnisetteForDevice:(id)a3 completion:(id)a4;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 device:(id)a4 completion:(id)a5;
- (void)legacyAnisetteDataForDSID:(id)a3 device:(id)a4 completion:(id)a5;
- (void)postAttestationAnalyticsWithData:(id)a3 completion:(id)a4;
- (void)provisionAnisetteForDevice:(id)a3 completion:(id)a4;
- (void)resetDeviceIdentityWithCompletion:(id)a3;
- (void)setAbsintheSigner:(id)a3;
- (void)setAttestationSigner:(id)a3;
- (void)setTimeAdjustmentWithServerTime:(id)a3 completion:(id)a4;
- (void)signaturesForData:(id)a3 options:(id)a4 completion:(id)a5;
- (void)syncAnisetteWithSIMData:(id)a3 device:(id)a4 completion:(id)a5;
@end

@implementation AKAnisetteProvisioningService

- (AKAnisetteProvisioningService)initWithClient:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___AKAnisetteProvisioningService;
  v6 = -[AKAnisetteProvisioningService init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[AKAbsintheSigner sharedSigner](&OBJC_CLASS___AKAbsintheSigner, "sharedSigner"));
    absintheSigner = v7->_absintheSigner;
    v7->_absintheSigner = (AKAbsintheSigner *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[AKAttestationSigner sharedSigner](&OBJC_CLASS___AKAttestationSigner, "sharedSigner"));
    attestationSigner = v7->_attestationSigner;
    v7->_attestationSigner = (AKAttestationSigner *)v10;
  }

  return v7;
}

- (AKAnisetteProvisioningService)initWithClient:(id)a3 context:(id)a4
{
  id v7 = a4;
  uint64_t v8 = -[AKAnisetteProvisioningService initWithClient:](self, "initWithClient:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v9;
}

- (AKAnisetteProvisioningService)initWithClient:(id)a3 authenticationContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[AKAppleIDAuthenticationContext initWithContext:]( objc_alloc(&OBJC_CLASS___AKAppleIDAuthenticationContext),  "initWithContext:",  v6);

  v9 = -[AKAnisetteProvisioningService initWithClient:context:](self, "initWithClient:context:", v7, v8);
  return v9;
}

- (id)anisetteDataForDevice:(id)a3 provisionIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10005A934;
  v20 = sub_10005A944;
  id v21 = 0LL;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10005A94C;
  v12[3] = &unk_1001C8D80;
  id v8 = v6;
  id v13 = v8;
  v15 = &v16;
  v9 = v7;
  v14 = v9;
  -[AKAnisetteProvisioningService fetchAnisetteDataAndProvisionIfNecessary:device:completion:]( self,  "fetchAnisetteDataAndProvisionIfNecessary:device:completion:",  v4,  v8,  v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)attestationDataForDevice:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = _AKLogSystem(v10);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412802;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%@: Fetching attestation data for device (%@) with request (%@)",  (uint8_t *)&v20,  0x20u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService _helperServiceForDevice:](self, "_helperServiceForDevice:", v8));
  uint64_t v14 = objc_opt_respondsToSelector(v13, "fetchPeerAttestationDataForRequest:completion:");
  char v15 = v14;
  uint64_t v16 = _AKLogSystem(v14);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = v17;
  if ((v15 & 1) != 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = self;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@: Calling anisette service (%@) for peer attestation data",  (uint8_t *)&v20,  0x16u);
    }

    [v13 fetchPeerAttestationDataForRequest:v9 completion:v10];
  }

  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138413058;
      id v21 = self;
      __int16 v22 = 2112;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%@: Unable to grab attestation data for device (%@) with request (%@) using anisette service (%@)",  (uint8_t *)&v20,  0x2Au);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8009LL,  0LL));
    v10[2](v10, 0LL, v19);
  }
}

- (void)attestationDataForRequestData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    -[AKAnisetteProvisioningService _attestationDataForRequestData:completion:]( self,  "_attestationDataForRequestData:completion:",  v6,  v7);
  }

  else
  {
    uint64_t v9 = _AKTrafficLogSubsystem(v8);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001362A4();
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8002LL,  0LL));
    v7[2](v7, 0LL, v11);
  }
}

- (void)_attestationDataForRequestData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService _nativeAnisetteService](self, "_nativeAnisetteService"));
  [v8 fetchAttestationDataForRequestData:v7 completion:v6];
}

- (void)setTimeAdjustmentWithServerTime:(id)a3 completion:(id)a4
{
  id v6 = a3;
  client = self->_client;
  id v8 = (void (**)(id, void))a4;
  BOOL v9 = -[AKClient hasInternalPrivateAccess](client, "hasInternalPrivateAccess");
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKBAATimeProvider sharedInstance](&OBJC_CLASS___AKBAATimeProvider, "sharedInstance"));
    [v10 addServerAdjustment:v6];

    v8[2](v8, 0LL);
  }

  else
  {
    uint64_t v11 = _AKTrafficLogSubsystem(v9);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001362D0();
    }

    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8002LL,  0LL));
    v8[2](v8, v13);

    id v8 = (void (**)(id, void))v13;
  }
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 device:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  BOOL v9 = (void (**)(id, void, void *))a5;
  BOOL v10 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v10)
  {
    -[AKAnisetteProvisioningService _fetchAnisetteDataAndProvisionIfNecessary:device:completion:]( self,  "_fetchAnisetteDataAndProvisionIfNecessary:device:completion:",  v6,  v8,  v9);
  }

  else
  {
    uint64_t v11 = _AKTrafficLogSubsystem(v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001362A4();
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8002LL,  0LL));
    v9[2](v9, 0LL, v13);
  }
}

- (void)resetDeviceIdentityWithCompletion:(id)a3
{
  client = self->_client;
  id v5 = a3;
  BOOL v6 = -[AKClient hasInternalPrivateAccess](client, "hasInternalPrivateAccess");
  if (v6)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService _nativeAnisetteService](self, "_nativeAnisetteService"));
    [v10 resetDeviceIdentityWithCompletion:v5];
  }

  else
  {
    uint64_t v7 = _AKTrafficLogSubsystem(v6);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001362FC();
    }

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8002LL,  0LL));
    (*((void (**)(id, void *))v5 + 2))(v5, v9);
  }

- (void)postAttestationAnalyticsWithData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (!v8)
  {
    uint64_t v16 = _AKTrafficLogSubsystem(v8);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1001363F0();
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8002LL,  0LL));
    v7[2](v7, v18);
    goto LABEL_12;
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  if (([v9 isInternalBuild] & 1) == 0)
  {
LABEL_7:

    goto LABEL_8;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v11 = [v10 isVirtualMachine];

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
    id v13 = [v12 lastKnownIDMSEnvironment];

    if (v13)
    {
      uint64_t v15 = _AKLogSystem(v14);
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
        sub_1001363B8();
      }
      goto LABEL_7;
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithEventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithEventName:error:",  @"com.apple.authkit.baa.stats",  0LL));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient name](self->_client, "name"));
    [v18 setObject:v19 forKeyedSubscript:@"processName"];

    int v20 = (void *)objc_claimAutoreleasedReturnValue([v6 endPointVIP]);
    id v21 = [v20 length];

    if (v21)
    {
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v6 endPointVIP]);
      [v18 setObject:v22 forKeyedSubscript:@"endPointVIP"];
    }

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 requestMethod]);
    id v24 = [v23 length];

    if (v24)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v6 requestMethod]);
      [v18 setObject:v25 forKeyedSubscript:@"requestMethod"];
    }

    id v26 = [v6 headerSize];
    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 headerSize]));
      id v28 = objc_msgSend(v27, "ak_bucketWithSize:", 500);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v28));
      [v18 setObject:v29 forKeyedSubscript:@"headerSize"];
    }

    if ([v6 bodySize])
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 bodySize]));
      id v31 = objc_msgSend(v30, "ak_bucketWithSize:", 1000);

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v31));
      [v18 setObject:v32 forKeyedSubscript:@"bodySize"];
    }

    else if ((uint64_t)[v6 errorCode] <= 0)
    {
      if (!v26)
      {
LABEL_31:
        v7[2](v7, 0LL);
LABEL_12:

        goto LABEL_13;
      }

      goto LABEL_28;
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue([v6 errorDomain]);
    if (v33)
    {

LABEL_27:
      v34 = (void *)objc_claimAutoreleasedReturnValue([v6 errorDomain]);
      v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v34,  [v6 errorCode],  0));

      [v18 populateUnderlyingErrorsStartingWithRootError:v35];
      goto LABEL_28;
    }

    if ([v6 errorCode]) {
      goto LABEL_27;
    }
LABEL_28:
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
    uint64_t v37 = _AKLogSystem([v36 sendEvent:v18]);
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      sub_100136328(v18, v38);
    }

    goto LABEL_31;
  }

- (void)_fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 device:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  BOOL v9 = (void (**)(id, void, void *))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService _helperServiceForDevice:](self, "_helperServiceForDevice:", v8));
  unsigned __int8 v11 = v10;
  if (v10)
  {
    [v10 fetchAnisetteDataAndProvisionIfNecessary:v6 withCompletion:v9];
  }

  else
  {
    uint64_t v12 = _AKTrafficLogSubsystem(0LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10013641C();
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8013LL,  0LL));
    v9[2](v9, 0LL, v14);
  }
}

- (void)legacyAnisetteDataForDSID:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  BOOL v11 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService _helperServiceForDevice:](self, "_helperServiceForDevice:", v9));
    id v13 = v12;
    if (v12)
    {
      [v12 legacyAnisetteDataForDSID:v8 withCompletion:v10];
    }

    else
    {
      uint64_t v16 = _AKLogSystem(0LL);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10013647C();
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8013LL,  0LL));
      v10[2](v10, 0LL, v18);
    }
  }

  else
  {
    uint64_t v14 = _AKLogSystem(v11);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001362A4();
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8002LL,  0LL));
    v10[2](v10, 0LL, v13);
  }
}

- (void)provisionAnisetteForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService _helperServiceForDevice:](self, "_helperServiceForDevice:", v6));
    id v10 = v9;
    if (v9)
    {
      [v9 provisionAnisetteWithCompletion:v7];
    }

    else
    {
      uint64_t v13 = _AKLogSystem(0LL);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1001364DC();
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8013LL,  0LL));
      v7[2](v7, 0LL, v15);
    }
  }

  else
  {
    uint64_t v11 = _AKLogSystem(v8);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10013653C();
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8002LL,  0LL));
    v7[2](v7, 0LL, v10);
  }
}

- (void)syncAnisetteWithSIMData:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  BOOL v11 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService _helperServiceForDevice:](self, "_helperServiceForDevice:", v9));
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 syncAnisetteWithSIMData:v8 completion:v10];
    }

    else
    {
      uint64_t v16 = _AKLogSystem(0LL);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100136568();
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8013LL,  0LL));
      v10[2](v10, 0LL, v18);
    }
  }

  else
  {
    uint64_t v14 = _AKLogSystem(v11);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001365C8();
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8002LL,  0LL));
    v10[2](v10, 0LL, v13);
  }
}

- (void)eraseAnisetteForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = -[AKClient hasInternalPrivateAccess](self->_client, "hasInternalPrivateAccess");
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService _helperServiceForDevice:](self, "_helperServiceForDevice:", v6));
    id v10 = v9;
    if (v9)
    {
      [v9 eraseAnisetteWithCompletion:v7];
    }

    else
    {
      uint64_t v13 = _AKLogSystem(0LL);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1001365F4();
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8013LL,  0LL));
      v7[2](v7, 0LL, v15);
    }
  }

  else
  {
    uint64_t v11 = _AKLogSystem(v8);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100136654();
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8002LL,  0LL));
    v7[2](v7, 0LL, v10);
  }
}

- (id)_helperServiceForDevice:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 linkType] != (id)1)
  {
    if ([v5 linkType] == (id)2)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService _pairedDeviceAnisetteService](self, "_pairedDeviceAnisetteService"));
    }

    else
    {
      if ([v5 linkType] != (id)3)
      {
        uint64_t v7 = 0LL;
        goto LABEL_5;
      }

      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService _clientAnisetteService](self, "_clientAnisetteService"));
    }
  }

  else
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService _nativeAnisetteService](self, "_nativeAnisetteService"));
  }

  uint64_t v7 = (void *)v6;
LABEL_5:

  return v7;
}

- (id)_nativeAnisetteService
{
  nativeAnisetteService = self->_nativeAnisetteService;
  if (!nativeAnisetteService)
  {
    id v4 = -[AKNativeAnisetteService initWithClient:]( objc_alloc(&OBJC_CLASS___AKNativeAnisetteService),  "initWithClient:",  self->_client);
    id v5 = self->_nativeAnisetteService;
    self->_nativeAnisetteService = v4;

    nativeAnisetteService = self->_nativeAnisetteService;
  }

  return nativeAnisetteService;
}

- (id)_pairedDeviceAnisetteService
{
  return +[AKPeerIDSAnisetteService sharedService](&OBJC_CLASS___AKPeerIDSAnisetteService, "sharedService");
}

- (id)_clientAnisetteService
{
  return  -[AKClientAnisetteService initWithClient:context:]( objc_alloc(&OBJC_CLASS___AKClientAnisetteService),  "initWithClient:context:",  self->_client,  self->_context);
}

- (AKAbsintheSigner)absintheSigner
{
  return self->_absintheSigner;
}

- (void)setAbsintheSigner:(id)a3
{
}

- (AKAttestationSigner)attestationSigner
{
  return self->_attestationSigner;
}

- (void)setAttestationSigner:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)absintheSignatureForData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  client = self->_client;
  id v8 = a4;
  BOOL v9 = -[AKClient hasInternalPrivateAccess](client, "hasInternalPrivateAccess");
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"https://www.apple.com"));
    uint64_t v11 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v10);
    -[NSMutableURLRequest setHTTPBody:](v11, "setHTTPBody:", v6);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService absintheSigner](self, "absintheSigner"));
    [v12 signatureForURLRequest:v11 completionHandler:v8];
  }

  else
  {
    uint64_t v13 = _AKLogSystem(v9);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100136680();
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8002LL,  0LL));
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v15);
  }
}

- (void)signaturesForData:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  client = self->_client;
  id v11 = a5;
  BOOL v12 = -[AKClient hasInternalPrivateAccess](client, "hasInternalPrivateAccess");
  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKAnisetteProvisioningService attestationSigner](self, "attestationSigner"));
    [v13 signaturesForData:v8 options:v9 completion:v11];
  }

  else
  {
    uint64_t v14 = _AKLogSystem(v12);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100136680();
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAnisetteErrorDomain,  -8002LL,  0LL));
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0LL, 0LL, v13);
  }
}

@end