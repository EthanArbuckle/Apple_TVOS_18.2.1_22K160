@interface TransparencyLogSession
+ (BOOL)enablePinning;
+ (id)createErrorFromURLResonse:(id)a3 data:(id)a4 allowEmptyData:(BOOL)a5 error:(id)a6;
+ (void)dispatchToQueue:(id)a3 block:(id)a4;
- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6;
- (NSURLSession)backgroundSession;
- (NSURLSession)foregroundSession;
- (OS_dispatch_workloop)callbackWorkloop;
- (OS_dispatch_workloop)networkingWorkloop;
- (TransparencyAuthentication)auth;
- (TransparencyLogSession)initWithWorkloop:(id)a3 sessionDelegate:(id)a4;
- (TransparencyLogSessionDelegate)delegate;
- (id)createAuthenticatedBackgroundSession:(id)a3 delegateQueue:(id)a4;
- (id)createAuthenticatedForegroundSession;
- (unint64_t)fetchCount;
- (void)setAuth:(id)a3;
- (void)setBackgroundSession:(id)a3;
- (void)setCallbackWorkloop:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFetchCount:(unint64_t)a3;
- (void)setForegroundSession:(id)a3;
- (void)setNetworkingWorkloop:(id)a3;
@end

@implementation TransparencyLogSession

- (TransparencyLogSession)initWithWorkloop:(id)a3 sessionDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TransparencyLogSession;
  v8 = -[TransparencyLogSession init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    -[TransparencyLogSession setCallbackWorkloop:](v8, "setCallbackWorkloop:", v6);
    dispatch_workloop_t v10 = dispatch_workloop_create("com.apple.transparencyd.networking");
    -[TransparencyLogSession setNetworkingWorkloop:](v9, "setNetworkingWorkloop:", v10);

    -[TransparencyLogSession setDelegate:](v9, "setDelegate:", v7);
    v11 = objc_alloc(&OBJC_CLASS___TransparencyAuthentication);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession networkingWorkloop](v9, "networkingWorkloop"));
    v13 = -[TransparencyAuthentication initWithWorkloop:](v11, "initWithWorkloop:", v12);
    -[TransparencyLogSession setAuth:](v9, "setAuth:", v13);
  }

  return v9;
}

+ (BOOL)enablePinning
{
  if (qword_1002EEF78 != -1) {
    dispatch_once(&qword_1002EEF78, &stru_10028A450);
  }
  return (byte_1002EEF70 & 1) == 0;
}

- (id)createAuthenticatedBackgroundSession:(id)a3 delegateQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:]( &OBJC_CLASS___NSURLSessionConfiguration,  "backgroundSessionConfigurationWithIdentifier:",  @"com.apple.transparencyd"));
  [v8 setDiscretionary:1];
  if (+[TransparencyLogSession enablePinning](&OBJC_CLASS___TransparencyLogSession, "enablePinning")) {
    objc_msgSend(v8, "set_tlsTrustPinningPolicyName:", kSecPolicyNameAppleIDSService);
  }
  v18 = off_1002E6238;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings deviceUserAgent](&OBJC_CLASS___TransparencySettings, "deviceUserAgent"));
  v19 = v9;
  dispatch_workloop_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  id v11 = [v10 mutableCopy];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings automatedDeviceGroup]( &OBJC_CLASS___TransparencySettings,  "automatedDeviceGroup"));
  [v11 setObject:v12 forKeyedSubscript:off_1002E6258];

  uint64_t v13 = objc_claimAutoreleasedReturnValue(+[TransparencySettings transparencyVersionStr](&OBJC_CLASS___TransparencySettings, "transparencyVersionStr"));
  [v11 setObject:v13 forKeyedSubscript:off_1002E6260];

  [v8 setHTTPAdditionalHeaders:v11];
  [v8 setTimeoutIntervalForResource:(double)kTransparencyMaxmimumDownloadRecordLifetime];
  [v8 setHTTPCookieStorage:0];
  [v8 setURLCache:0];
  objc_msgSend(v8, "set_alternativeServicesStorage:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession auth](self, "auth"));
  LOBYTE(v13) = [v14 isSupported];

  if ((v13 & 1) == 0)
  {
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAccount createAuthkitSession]( &OBJC_CLASS___TransparencyAccount,  "createAuthkitSession"));
    objc_msgSend(v8, "set_appleIDContext:", v15);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v8,  v6,  v7));

  return v16;
}

- (id)createAuthenticatedForegroundSession
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  [v3 setDiscretionary:0];
  if (+[TransparencyLogSession enablePinning](&OBJC_CLASS___TransparencyLogSession, "enablePinning")) {
    objc_msgSend(v3, "set_tlsTrustPinningPolicyName:", kSecPolicyNameAppleIDSService);
  }
  v17 = off_1002E6238;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings deviceUserAgent](&OBJC_CLASS___TransparencySettings, "deviceUserAgent"));
  v18 = v4;
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  id v6 = [(id)v5 mutableCopy];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings automatedDeviceGroup]( &OBJC_CLASS___TransparencySettings,  "automatedDeviceGroup"));
  [v6 setObject:v7 forKeyedSubscript:off_1002E6258];

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencySettings transparencyVersionStr]( &OBJC_CLASS___TransparencySettings,  "transparencyVersionStr"));
  [v6 setObject:v8 forKeyedSubscript:off_1002E6260];

  [v3 setHTTPAdditionalHeaders:v6];
  [v3 setHTTPCookieStorage:0];
  [v3 setURLCache:0];
  objc_msgSend(v3, "set_alternativeServicesStorage:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession auth](self, "auth"));
  LOBYTE(v5) = [v9 isSupported];

  if ((v5 & 1) == 0)
  {
    dispatch_workloop_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAccount createAuthkitSession]( &OBJC_CLASS___TransparencyAccount,  "createAuthkitSession"));
    objc_msgSend(v3, "set_appleIDContext:", v10);
  }

  id v11 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession backgroundSession](self, "backgroundSession"));

  if (v12) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[TransparencyLogSession networkingWorkloop](self, "networkingWorkloop"));
  }
  else {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[TransparencyLogSession callbackWorkloop](self, "callbackWorkloop"));
  }
  v14 = (void *)v13;
  -[NSOperationQueue setUnderlyingQueue:](v11, "setUnderlyingQueue:", v13);

  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v3,  0LL,  v11));
  return v15;
}

+ (id)createErrorFromURLResonse:(id)a3 data:(id)a4 allowEmptyData:(BOOL)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v9 requiresAuthorization])
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorNetwork,  -174LL,  v11,  @"HTTP request requires authorization code (401)"));
    if (qword_1002EEF80 != -1) {
      dispatch_once(&qword_1002EEF80, &stru_10028A470);
    }
    uint64_t v13 = qword_1002EEF88;
    if (os_log_type_enabled((os_log_t)qword_1002EEF88, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "HTTP request requires authorization code (401)";
LABEL_6:
      objc_super v15 = (os_log_s *)v13;
      uint32_t v16 = 2;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    }
  }

  else if ([v9 successful])
  {
    if (v11)
    {
      id v12 = v11;
    }

    else
    {
      if (a5 || v10 && [v10 length])
      {
        id v12 = 0LL;
        goto LABEL_17;
      }

      id v12 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorNetwork,  -145LL,  0LL,  @"HTTP response contains nil or empty data"));
      if (qword_1002EEF80 != -1) {
        dispatch_once(&qword_1002EEF80, &stru_10028A4B0);
      }
      uint64_t v13 = qword_1002EEF88;
      if (os_log_type_enabled((os_log_t)qword_1002EEF88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v14 = "HTTP response contains nil or empty data";
        goto LABEL_6;
      }
    }
  }

  else
  {
    id v12 = v11;
    if (!v12) {
      id v12 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorNetwork,  [v9 responseCode],  @"Unsuccessful HTTP response code: %llu",  objc_msgSend(v9, "responseCode")));
    }
    if (qword_1002EEF80 != -1) {
      dispatch_once(&qword_1002EEF80, &stru_10028A490);
    }
    uint64_t v17 = qword_1002EEF88;
    if (os_log_type_enabled((os_log_t)qword_1002EEF88, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v12;
      v14 = "Unsuccessful HTTP response: %@";
      objc_super v15 = (os_log_s *)v17;
      uint32_t v16 = 12;
      goto LABEL_16;
    }
  }

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = self;
  objc_sync_enter(v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession foregroundSession](v12, "foregroundSession"));

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[TransparencyLogSession createAuthenticatedForegroundSession]( v12,  "createAuthenticatedForegroundSession"));
    -[TransparencyLogSession setForegroundSession:](v12, "setForegroundSession:", v14);
  }

  objc_sync_exit(v12);

  -[TransparencyLogSession setFetchCount:]( v12,  "setFetchCount:",  (char *)-[TransparencyLogSession fetchCount](v12, "fetchCount") + 1);
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x3032000000LL;
  v31[3] = sub_1001D1314;
  v31[4] = sub_1001D1324;
  id v32 = 0LL;
  id v32 = (id)os_transaction_create("com.apple.transparencyd.fetch");
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession foregroundSession](v12, "foregroundSession"));
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  v25 = sub_1001D132C;
  v26 = &unk_10028A500;
  BOOL v30 = a4;
  v27 = v12;
  id v16 = v11;
  id v28 = v16;
  v29 = v31;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 dataTaskWithRequest:v10 completionHandler:&v23]);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "kt_requestId", v23, v24, v25, v26, v27));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 UUIDString]);
  [v17 setTaskDescription:v19];

  if (v7) {
    objc_msgSend(v17, "set_APSRelayTopic:", @"com.apple.private.alloy.kt.webtunnel");
  }
  [v17 resume];
  if (qword_1002EEF80 != -1) {
    dispatch_once(&qword_1002EEF80, &stru_10028A520);
  }
  id v20 = (os_log_s *)(id)qword_1002EEF88;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "kt_requestId"));
    *(_DWORD *)buf = 138543362;
    v34 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Starting fetch for fetchId %{public}@",  buf,  0xCu);
  }

  _Block_object_dispose(v31, 8);
  return 1;
}

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 completionHandler:(id)a5
{
  return -[TransparencyLogSession fetch:allowEmptyData:useReversePush:completionHandler:]( self,  "fetch:allowEmptyData:useReversePush:completionHandler:",  a3,  a4,  0LL,  a5);
}

+ (void)dispatchToQueue:(id)a3 block:(id)a4
{
  uint64_t v5 = (dispatch_queue_s *)a3;
  id v6 = (void (**)(void))a4;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_1001D1314;
  objc_super v15 = sub_1001D1324;
  id v16 = 0LL;
  id v16 = (id)os_transaction_create("com.apple.transparencyd.networking");
  if (+[TransparencySettings getBool:]( &OBJC_CLASS___TransparencySettings,  "getBool:",  kTransparencyFlagSwitchAsyncToSync))
  {
    v6[2](v6);
    BOOL v7 = (void *)v12[5];
    v12[5] = 0LL;
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001D1650;
    v8[3] = &unk_10027A918;
    id v9 = v6;
    id v10 = &v11;
    dispatch_async(v5, v8);
    BOOL v7 = v9;
  }

  _Block_object_dispose(&v11, 8);
}

- (unint64_t)fetchCount
{
  return self->_fetchCount;
}

- (void)setFetchCount:(unint64_t)a3
{
  self->_fetchCount = a3;
}

- (TransparencyLogSessionDelegate)delegate
{
  return (TransparencyLogSessionDelegate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDelegate:(id)a3
{
}

- (TransparencyAuthentication)auth
{
  return (TransparencyAuthentication *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAuth:(id)a3
{
}

- (NSURLSession)backgroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setBackgroundSession:(id)a3
{
}

- (NSURLSession)foregroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setForegroundSession:(id)a3
{
}

- (OS_dispatch_workloop)callbackWorkloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCallbackWorkloop:(id)a3
{
}

- (OS_dispatch_workloop)networkingWorkloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setNetworkingWorkloop:(id)a3
{
}

- (void).cxx_destruct
{
}

@end