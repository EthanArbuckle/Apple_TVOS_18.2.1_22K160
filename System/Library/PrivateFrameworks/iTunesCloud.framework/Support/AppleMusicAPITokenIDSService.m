@interface AppleMusicAPITokenIDSService
+ (AppleMusicAPITokenIDSService)sharedService;
- (id)_init;
- (void)_performTokenRequest:(id)a3 completionHandler:(id)a4;
- (void)_start;
- (void)_stop;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)start;
- (void)stop;
@end

@implementation AppleMusicAPITokenIDSService

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AppleMusicAPITokenIDSService;
  v2 = -[AppleMusicAPITokenIDSService init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloudd.AppleMusicAPITokenIDSService.accessQueue", 0LL);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.private.alloy.itunescloudd"));
    serviceName = v2->_serviceName;
    v2->_serviceName = (NSString *)v5;

    v7 = -[IDSService initWithService:](objc_alloc(&OBJC_CLASS___IDSService), "initWithService:", v2->_serviceName);
    service = v2->_service;
    v2->_service = v7;
  }

  return v2;
}

- (void)dealloc
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F4E6C;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AppleMusicAPITokenIDSService;
  -[AppleMusicAPITokenIDSService dealloc](&v4, "dealloc");
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v10 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  unsigned int v11 = [v9 type];
  v12 = os_log_create("com.apple.amp.itunescloudd", "Connections");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    v13 = "requestTokens";
    v19 = self;
    __int16 v20 = 2048;
    if (v11 != 1000) {
      v13 = 0LL;
    }
    uint64_t v21 = v11;
    __int16 v22 = 2082;
    v23 = v13;
    __int16 v24 = 2114;
    id v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%{public}@ Received IDS message %lu:'%{public}s' from ID %{public}@",  buf,  0x2Au);
  }

  if (v11 == 1000)
  {
    v14 = objc_alloc(&OBJC_CLASS___ICAppleMusicAPITokenRequest);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v9 data]);
    v16 = -[ICAppleMusicAPITokenRequest initWithData:](v14, "initWithData:", v15);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000F4C04;
    v17[3] = &unk_1001A62D8;
    v17[4] = self;
    -[AppleMusicAPITokenIDSService _performTokenRequest:completionHandler:]( self,  "_performTokenRequest:completionHandler:",  v16,  v17);
  }

  else
  {
    v16 = os_log_create("com.apple.amp.itunescloudd", "Connections");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v19 = self;
      __int16 v20 = 2048;
      uint64_t v21 = v11;
      __int16 v22 = 2082;
      v23 = 0LL;
      __int16 v24 = 2114;
      id v25 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@ Received IDS message of unknown type %lu:'%{public}s' from ID %{public}@",  buf,  0x2Au);
    }
  }
}

- (void)start
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F4BFC;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)stop
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000F4BF4;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_performTokenRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 clientIdentifier]);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 clientVersion]);
  if (v9 | v10)
  {
    unsigned int v11 = (void *)v10;
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[ICClientInfo _clientInfoForCloudDaemonOriginatedMusicKitRequestWithRequestingBundleIdentifier:]( &OBJC_CLASS___ICClientInfo,  "_clientInfoForCloudDaemonOriginatedMusicKitRequestWithRequestingBundleIdentifier:",  v8));
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v12 clientIdentifier]);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v12 clientVersion]);
    v13 = os_log_create("com.apple.amp.itunescloudd", "Connections");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      v35 = self;
      __int16 v36 = 2114;
      uint64_t v37 = v9;
      __int16 v38 = 2114;
      id v39 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%{public}@ No client identifier or version was specified in the ICAppleMusicAPITokenRequest instance. Falling ba ck to default client identifier for daemon: %{public}@/%{public}@.",  buf,  0x20u);
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[ICMutableClientInfo clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:bundleIdentifier:]( &OBJC_CLASS___ICMutableClientInfo,  "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:bundleIdentifier:",  v9,  v11,  v8,  v8));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 bagProfile]);
  [v14 setBagProfile:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 bagProfileVersion]);
  [v14 setBagProfileVersion:v16];

  id v17 = [v14 copy];
  v18 = os_log_create("com.apple.amp.itunescloudd", "Connections");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v35 = self;
    __int16 v36 = 2114;
    uint64_t v37 = (uint64_t)v6;
    __int16 v38 = 2114;
    id v39 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "%{public}@ Performing token request %{public}@ and %{public}@.",  buf,  0x20u);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000F4780;
  v31[3] = &unk_1001A6300;
  v31[4] = self;
  id v19 = v6;
  id v32 = v19;
  id v33 = v7;
  id v20 = v7;
  uint64_t v21 = objc_retainBlock(v31);
  id v22 = objc_msgSend( [ICDeveloperTokenFetchRequest alloc],  "initWithClientInfo:options:",  v17,  objc_msgSend(v19, "shouldIgnoreDeveloperTokenCache"));
  [v22 setClientType:0];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000F48F8;
  v27[3] = &unk_1001A6350;
  v27[4] = self;
  id v28 = v19;
  id v29 = v17;
  id v30 = v21;
  id v23 = v17;
  id v24 = v19;
  id v25 = v21;
  [v22 performRequestWithResponseHandler:v27];
}

- (void)_start
{
  dispatch_queue_t v3 = os_log_create("com.apple.amp.itunescloudd", "Connections");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    serviceName = self->_serviceName;
    int v5 = 138543618;
    id v6 = self;
    __int16 v7 = 2114;
    uint64_t v8 = serviceName;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%{public}@ Started IDS service with name %{public}@.",  (uint8_t *)&v5,  0x16u);
  }
}

- (void)_stop
{
  dispatch_queue_t v3 = os_log_create("com.apple.amp.itunescloudd", "Connections");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    serviceName = self->_serviceName;
    int v5 = 138543618;
    id v6 = self;
    __int16 v7 = 2114;
    uint64_t v8 = serviceName;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%{public}@ Stopped IDS service with name %{public}@.",  (uint8_t *)&v5,  0x16u);
  }
}

- (void).cxx_destruct
{
}

+ (AppleMusicAPITokenIDSService)sharedService
{
  if (qword_1001DB830 != -1) {
    dispatch_once(&qword_1001DB830, &stru_1001A62B0);
  }
  return (AppleMusicAPITokenIDSService *)(id)qword_1001DB828;
}

@end