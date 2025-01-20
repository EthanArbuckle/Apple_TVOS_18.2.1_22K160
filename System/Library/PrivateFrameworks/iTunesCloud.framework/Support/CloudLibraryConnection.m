@interface CloudLibraryConnection
- (CloudLibraryConnection)initWithConfiguration:(id)a3;
- (ICConnectionConfiguration)configuration;
- (ICUserIdentity)userIdentity;
- (ICUserIdentityStore)userIdentityStore;
- (OS_dispatch_queue)queue;
- (int64_t)connectionState;
- (unsigned)databaseID;
- (void)_onQueue_sendRequest:(id)a3 withInternalResponseHandler:(id)a4;
- (void)connectWithCompletionHandler:(id)a3;
- (void)disconnect;
- (void)sendRequest:(id)a3 withResponseHandler:(id)a4;
- (void)setConfiguration:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CloudLibraryConnection

- (CloudLibraryConnection)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CloudLibraryConnection;
  v6 = -[CloudLibraryConnection init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.itunescloudd.CloudLibraryConnection.serial", 0LL);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }

  return v7;
}

- (ICUserIdentity)userIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryConnection configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userIdentity]);

  return (ICUserIdentity *)v3;
}

- (ICUserIdentityStore)userIdentityStore
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryConnection configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 userIdentityStore]);

  return (ICUserIdentityStore *)v3;
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudLibraryConnection queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D58D0;
  block[3] = &unk_1001A6C08;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_onQueue_sendRequest:(id)a3 withInternalResponseHandler:(id)a4
{
  id v6 = a3;
  id v65 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration baseURL](self->_configuration, "baseURL"));
  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 requestURLForBaseURL:v7 sessionID:0]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 bodyData]);
  id v11 = [v10 length];

  if (v11)
  {
    [v9 setHTTPMethod:@"POST"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 bodyData]);
    [v9 setHTTPBody:v12];

    [v9 setValue:@"application/x-dmap-tagged" forHTTPHeaderField:@"Content-Type"];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration buildIdentifier](self->_configuration, "buildIdentifier"));
  [v9 setValue:v13 forHTTPHeaderField:@"Client-Cloud-Daap-Version"];

  v14 = (void *)objc_claimAutoreleasedReturnValue( -[ICConnectionConfiguration purchaseClientIdentifier]( self->_configuration,  "purchaseClientIdentifier"));
  [v9 setValue:v14 forHTTPHeaderField:@"Client-Cloud-Purchase-DAAP-Version"];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration familyMemberStoreID](self->_configuration, "familyMemberStoreID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringValue]);
  [v9 setValue:v16 forHTTPHeaderField:@"X-FM-Dsid"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v17 deviceGUID]);

  if ([v68 length]) {
    [v9 setValue:v68 forHTTPHeaderField:ICStoreHTTPHeaderKeyXGUID];
  }
  id v18 = [v6 reason];
  if (v18 || (id v18 = -[ICConnectionConfiguration requestReason](self->_configuration, "requestReason")) != 0LL)
  {
    if (v18 == (id)1000)
    {
      uint64_t v19 = 2LL;
    }

    else if (v18 == (id)1001)
    {
      uint64_t v19 = 1LL;
    }

    else
    {
      uint64_t v19 = (uint64_t)v18;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%li", v19));
    [v9 setValue:v20 forHTTPHeaderField:@"Client-Cloud-DAAP-Request-Reason"];
  }

  v67 = (void *)objc_claimAutoreleasedReturnValue([v6 requestingBundleID]);
  if ([v67 length]) {
    [v9 setValue:v67 forHTTPHeaderField:ICStoreHTTPHeaderKeyXAppleRequestingBundleID];
  }
  uint64_t v78 = 0LL;
  v79 = &v78;
  uint64_t v80 = 0x2050000000LL;
  v21 = (void *)qword_1001DB7C8;
  uint64_t v81 = qword_1001DB7C8;
  if (!qword_1001DB7C8)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_1000D4964;
    v83 = (const __CFString *)&unk_1001A6978;
    *(void *)v84 = &v78;
    sub_1000D4964((uint64_t)buf);
    v21 = (void *)v79[3];
  }

  id v22 = v21;
  _Block_object_dispose(&v78, 8);
  v66 = (void *)objc_claimAutoreleasedReturnValue([v22 standardUserDefaults]);
  v69 = (void *)objc_claimAutoreleasedReturnValue([v66 isPrivateListeningEnabled]);
  if (v69)
  {
    else {
      v23 = @"false";
    }
    [v9 setValue:v23 forHTTPHeaderField:ICStoreHTTPHeaderKeyXApplePrivateListening];
  }

  if (_os_feature_enabled_impl("MediaPlayer", "Favoriting"))
  {
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 sagaClientFeaturesVersion]);
    if (-[__CFString length](v24, "length")) {
      v25 = v24;
    }
    else {
      v25 = &stru_1001A7960;
    }
    [v9 setValue:v25 forHTTPHeaderField:ICStoreHTTPHeaderKeyXDAAPClientFeaturesVersion];

    unsigned int v26 = 3;
  }

  else
  {
    unsigned int v26 = 1;
  }

  else {
    uint64_t quot = v26;
  }
  v28 = &v83;
  do
  {
    ldiv_t v29 = ldiv(quot, 10LL);
    uint64_t quot = v29.quot;
    if (v29.rem >= 0) {
      LOBYTE(v30) = v29.rem;
    }
    else {
      uint64_t v30 = -v29.rem;
    }
    *((_BYTE *)v28 - 1) = v30 + 48;
    v28 = (const __CFString **)((char *)v28 - 1);
  }

  while (v29.quot);
  v31 = (__CFString *)CFStringCreateWithBytes(0LL, (const UInt8 *)v28, (char *)&v83 - (char *)v28, 0x8000100u, 0);
  [v9 setValue:v31 forHTTPHeaderField:ICStoreHTTPHeaderKeyXDAAPSupportedFeatures];

  if (MSVDeviceOSIsInternalInstall([v9 setTimeoutInterval:120.0]))
  {
    if ([v6 includeCloudLibraryDAAPDebugFeature])
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
      unsigned int v33 = [v32 shouldForceServerToUseDAAPDebugFeatureAlwaysPerformResetSync];

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
      unsigned int v35 = [v34 shouldForceServerToUseDAAPDebugFeatureAlwaysBackoff];

      uint64_t v36 = v35 ? v33 | 2LL : v33;
      if (v36)
      {
        uint64_t v37 = v36;
        v38 = &v83;
        do
        {
          ldiv_t v39 = ldiv(v37, 10LL);
          uint64_t v37 = v39.quot;
          if (v39.rem >= 0) {
            LOBYTE(v40) = v39.rem;
          }
          else {
            uint64_t v40 = -v39.rem;
          }
          *((_BYTE *)v38 - 1) = v40 + 48;
          v38 = (const __CFString **)((char *)v38 - 1);
        }

        while (v39.quot);
        v41 = (__CFString *)CFStringCreateWithBytes(0LL, (const UInt8 *)v38, (char *)&v83 - (char *)v38, 0x8000100u, 0);
        [v9 setValue:v41 forHTTPHeaderField:ICStoreHTTPHeaderKeyXDAAPClientDebugFeatures];

        v42 = os_log_create("com.apple.amp.itunescloudd", "Connections");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Setting debugFeaturesValue=%d for header DAAP-debug-features",  buf,  8u);
        }
      }
    }

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
    [v43 clearShouldForceServerToUseDAAPDebugFeatures];
  }

  v44 = os_log_create("com.apple.amp.itunescloudd", "Connections");
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v46 = (objc_class *)objc_opt_class(v6, v45);
    v47 = NSStringFromClass(v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    if ([v6 method]) {
      v49 = @"POST";
    }
    else {
      v49 = @"GET";
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue([v6 action]);
    *(_DWORD *)buf = 138544386;
    *(void *)&buf[4] = v48;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v83 = v49;
    *(_WORD *)v84 = 2114;
    *(void *)&v84[2] = v50;
    __int16 v85 = 2114;
    v86 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "Sending request: <%{public}@: %p method=%{public}@ action=%{public}@> to URL: %{public}@",  buf,  0x34u);
  }

  v51 = os_log_create("com.apple.amp.itunescloudd", "Connections_Oversize");
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue([v9 allHTTPHeaderFields]);
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v52;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Request headers: %{public}@", buf, 0xCu);
  }

  v53 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_1000D4B00;
  v76[3] = &unk_1001A6AA8;
  v76[4] = self;
  id v54 = v6;
  id v77 = v54;
  v55 = -[ICStoreRequestContext initWithBlock:](v53, "initWithBlock:", v76);
  v56 = -[ICStoreURLRequest initWithURLRequest:requestContext:]( objc_alloc(&OBJC_CLASS___ICStoreURLRequest),  "initWithURLRequest:requestContext:",  v9,  v55);
  -[ICStoreURLRequest setCancelOnHTTPErrors:](v56, "setCancelOnHTTPErrors:", 0LL);
  v57 = (void *)objc_claimAutoreleasedReturnValue([v54 responseDataDestinationFileURL]);
  if (v57)
  {
    v58 = os_log_create("com.apple.amp.itunescloudd", "Connections");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v57;
      _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "Downloading response to: %{public}@",  buf,  0xCu);
    }
  }

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLSessionManager sharedSessionManager](&OBJC_CLASS___ICURLSessionManager, "sharedSessionManager"));
  v60 = (void *)objc_claimAutoreleasedReturnValue( [v59 sessionWithIdentifier:@"com.apple.itunescloudd.CloudLibraryConnection" creationBlock:&stru_1001A5808]);

  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_1000D4C2C;
  v70[3] = &unk_1001A5830;
  id v71 = v8;
  id v72 = v57;
  v74 = self;
  id v75 = v65;
  id v73 = v54;
  id v61 = v65;
  id v62 = v54;
  id v63 = v57;
  id v64 = v8;
  [v60 enqueueDataRequest:v56 withCompletionHandler:v70];
}

- (void)connectWithCompletionHandler:(id)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000D4268;
  v10[3] = &unk_1001A5880;
  id v11 = a3;
  id v4 = v11;
  id v5 = objc_retainBlock(v10);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudLibraryConnection queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D431C;
  block[3] = &unk_1001A6BB8;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)disconnect
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudLibraryConnection queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000D425C;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_async(v3, block);
}

- (unsigned)databaseID
{
  return self->_databaseID;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end