@interface ICDMusicUserSocialProfileProvider
- (BOOL)_errorIsRecoverable:(id)a3;
- (ICDMusicUserSocialProfileProvider)initWithDelegate:(id)a3;
- (id)_cacheContainerPath;
- (id)_getCachedResponseForContext:(id)a3;
- (void)_cacheResponse:(id)a3 forContext:(id)a4;
- (void)_clearCacheForContext:(id)a3;
- (void)_onQueue_retryPendingUpdateAttempt:(unsigned int)a3;
- (void)_onQueue_setupRetrySourceForAttempt:(unsigned int)a3;
- (void)_onQueue_teardownRetrySource;
- (void)_performMusicKitRequestWithURL:(id)a3 storeRequestContext:(id)a4 ignoreCache:(BOOL)a5 completion:(id)a6;
- (void)_performMusicUserProfileRequestWithUserProfileContext:(id)a3 ignoreCache:(BOOL)a4 completion:(id)a5;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)fetchMusicUserProfileWithStoreRequestContext:(id)a3 ignoreCache:(BOOL)a4 completion:(id)a5;
@end

@implementation ICDMusicUserSocialProfileProvider

- (ICDMusicUserSocialProfileProvider)initWithDelegate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ICDMusicUserSocialProfileProvider;
  v6 = -[ICDMusicUserSocialProfileProvider init](&v12, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    contextsPendingUserProfileUpdate = v6->_contextsPendingUserProfileUpdate;
    v6->_contextsPendingUserProfileUpdate = (NSMutableSet *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.iTunesCloud.ICDMusicUserSocialProfileProvider", 0LL);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v6;
}

- (void)fetchMusicUserProfileWithStoreRequestContext:(id)a3 ignoreCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v25 = self;
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 1024;
    BOOL v29 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "<ICDMusicUserSocialProfileProvider: %p> fetchMusicUserProfileWithStoreRequestContext storeRequestContext=%{public} @ ignoreCache=%{BOOL}u",  buf,  0x1Cu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
  unsigned __int8 v12 = [v11 socialProfileSupported];

  if ((v12 & 1) != 0)
  {
    if (v8)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:]( &OBJC_CLASS___ICPrivacyInfo,  "sharedPrivacyInfoForUserIdentity:",  v13));

      if (v14 && ![v14 privacyAcknowledgementRequiredForMusic])
      {
        id v16 = [[ICMusicSubscriptionStatusRequest alloc] initWithStoreRequestContext:v8];
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472LL;
        v20[2] = sub_1000C97BC;
        v20[3] = &unk_1001A5400;
        v20[4] = self;
        id v21 = v8;
        id v22 = v9;
        BOOL v23 = v6;
        [v19 performSubscriptionStatusRequest:v16 withCompletionHandler:v20];
      }

      else
      {
        v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v25 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "<ICDMusicUserSocialProfileProvider: %p> Privacy acknowledgement required. Returning nil profile.",  buf,  0xCu);
        }

        id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7007LL,  0LL));
        (*((void (**)(id, void, id))v9 + 2))(v9, 0LL, v16);
      }
    }

    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7101LL,  0LL));
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v18);
    }
  }

  else
  {
    v17 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "<ICDMusicUserSocialProfileProvider: %p> Social Profiles are not supported. Returning nil profile.",  buf,  0xCu);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
  }
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C96E8;
  v7[3] = &unk_1001A6C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

- (id)_cacheContainerPath
{
  v5[0] = CPSharedResourcesDirectory(self, a2);
  v5[1] = @"Library";
  v5[2] = @"com.apple.iTunesCloud";
  v5[3] = @"ICMusicUserProfileResponsesCache";
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 4LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v2));

  return v3;
}

- (id)_getCachedResponseForContext:(id)a3
{
  id v4 = a3;
  __int16 v28 = self;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[ICDMusicUserSocialProfileProvider _cacheContainerPath](self, "_cacheContainerPath"));
  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v30 = (void *)v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v29 enumeratorAtPath:v5]);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v7)
  {
    id v9 = v7;
    id v10 = 0LL;
    uint64_t v11 = *(void *)v34;
    *(void *)&__int128 v8 = 134218242LL;
    __int128 v27 = v8;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hashedDSID", v27));
        unsigned int v15 = [v13 hasPrefix:v14];

        if (v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 cacheKey]);
          unsigned int v17 = [v13 isEqualToString:v16];

          if (v17)
          {
            v18 = v10;
            id v10 = v13;
          }

          else
          {
            v19 = os_log_create("com.apple.amp.itunescloudd", "UserState");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v27;
              v38 = v28;
              __int16 v39 = 2112;
              v40 = (os_log_s *)v13;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "<ICDMusicUserSocialProfileProvider: %p> Cache response %@ is stale. Removing.",  buf,  0x16u);
            }

            v18 = (void *)objc_claimAutoreleasedReturnValue([v30 stringByAppendingPathComponent:v13]);
            [v29 removeItemAtPath:v18 error:0];
          }
        }
      }

      id v9 = [v6 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }

    while (v9);
    if (v10)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v30 stringByAppendingPathComponent:v10]);
      id v32 = 0LL;
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v20,  0LL,  &v32));
      id v22 = (os_log_s *)v32;

      if (v22)
      {
        BOOL v23 = os_log_create("com.apple.amp.itunescloudd", "UserState");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v27;
          v38 = v28;
          __int16 v39 = 2114;
          v40 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "<ICDMusicUserSocialProfileProvider: %p> Error reading cache file. error=%{public}@",  buf,  0x16u);
        }
      }

      else
      {
        id v31 = 0LL;
        BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v21,  0LL,  &v31));
        id v22 = (os_log_s *)v31;
        if (!v22)
        {
          BOOL v23 = v23;
          v24 = v23;
          goto LABEL_27;
        }

        v25 = os_log_create("com.apple.amp.itunescloudd", "UserState");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v27;
          v38 = v28;
          __int16 v39 = 2114;
          v40 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "<ICDMusicUserSocialProfileProvider: %p> Error deserializing cached response error=%{public}@",  buf,  0x16u);
        }
      }

      v24 = 0LL;
LABEL_27:

      goto LABEL_28;
    }
  }

  id v22 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v38 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "<ICDMusicUserSocialProfileProvider: %p> Cache is empty.",  buf,  0xCu);
  }

  id v10 = 0LL;
  v24 = 0LL;
LABEL_28:

  return v24;
}

- (void)_cacheResponse:(id)a3 forContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMusicUserSocialProfileProvider _cacheContainerPath](self, "_cacheContainerPath"));
  else {
    [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];
  }
  id v21 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v7,  0LL,  &v21));

  id v11 = v21;
  if (!v11)
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 cacheKey]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v13]);
    id v20 = 0LL;
    [v10 writeToFile:v14 options:1 error:&v20];
    id v12 = v20;
    unsigned int v15 = os_log_create("com.apple.amp.itunescloudd", "UserState");
    id v16 = v15;
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        BOOL v23 = self;
        __int16 v24 = 2114;
        id v25 = v12;
        unsigned int v17 = "<ICDMusicUserSocialProfileProvider: %p> failed to write JSON cache. error=%{public}@";
        v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, buf, 0x16u);
      }
    }

    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218243;
      BOOL v23 = self;
      __int16 v24 = 2113;
      id v25 = v14;
      unsigned int v17 = "<ICDMusicUserSocialProfileProvider: %p> saved JSON response to cache at path %{private}@";
      v18 = v16;
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_12;
    }

    goto LABEL_14;
  }

  id v12 = v11;
  v13 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    BOOL v23 = self;
    __int16 v24 = 2114;
    id v25 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "<ICDMusicUserSocialProfileProvider: %p> failed to serializ data. error=%{public}@",  buf,  0x16u);
  }

- (void)_clearCacheForContext:(id)a3
{
  id v26 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v25 = self;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDMusicUserSocialProfileProvider _cacheContainerPath](self, "_cacheContainerPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 enumeratorAtPath:v5]);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v29;
    *(void *)&__int128 v8 = 134218498LL;
    __int128 v24 = v8;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v11);
        if (!MSVDeviceSupportsMultipleLibraries(v7)
          || (v13 = (void *)objc_claimAutoreleasedReturnValue([v26 hashedDSID]),
              unsigned int v14 = [v12 hasPrefix:v13],
              v13,
              v14))
        {
          unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v12, v24));
          id v27 = 0LL;
          unsigned int v16 = [v4 removeItemAtPath:v15 error:&v27];
          id v17 = v27;

          v18 = os_log_create("com.apple.amp.itunescloudd", "UserState");
          os_log_type_t v19 = v18;
          if (v16)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              __int128 v33 = v25;
              __int16 v34 = 2112;
              __int128 v35 = v12;
              id v20 = v19;
              os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
              id v22 = "<ICDMusicUserSocialProfileProvider: %p> Clearing cache response %@.";
              uint32_t v23 = 22;
              goto LABEL_13;
            }
          }

          else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            __int128 v33 = v25;
            __int16 v34 = 2112;
            __int128 v35 = v12;
            __int16 v36 = 2114;
            id v37 = v17;
            id v20 = v19;
            os_log_type_t v21 = OS_LOG_TYPE_ERROR;
            id v22 = "<ICDMusicUserSocialProfileProvider: %p> Could not clear cache response %@. error=%{public}@";
            uint32_t v23 = 32;
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v20, v21, v22, buf, v23);
          }
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v7 = [v6 countByEnumeratingWithState:&v28 objects:v38 count:16];
      id v9 = v7;
    }

    while (v7);
  }
}

- (void)_performMusicUserProfileRequestWithUserProfileContext:(id)a3 ignoreCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICMusicUserProfile mediaAPIRequestURL](&OBJC_CLASS___ICMusicUserProfile, "mediaAPIRequestURL"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 storeRequestContext]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000C9408;
  v14[3] = &unk_1001A5428;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  -[ICDMusicUserSocialProfileProvider _performMusicKitRequestWithURL:storeRequestContext:ignoreCache:completion:]( self,  "_performMusicKitRequestWithURL:storeRequestContext:ignoreCache:completion:",  v10,  v11,  v6,  v14);
}

- (BOOL)_errorIsRecoverable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  unsigned int v6 = [v5 isEqualToString:ICErrorDomain];

  if (!v6 || (id v7 = [v4 code], v8 = 1, v7 != (id)-7103) && v7 != (id)-7100 && v7 != (id)-7003)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    unsigned int v10 = [v9 isEqualToString:NSURLErrorDomain];

    if (v10 && (unint64_t v11 = (unint64_t)[v4 code] + 1009, v11 <= 8) && ((1 << v11) & 0x111) != 0)
    {
      BOOL v8 = 1;
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      if (v13) {
        BOOL v8 = -[ICDMusicUserSocialProfileProvider _errorIsRecoverable:](self, "_errorIsRecoverable:", v13);
      }
      else {
        BOOL v8 = 0;
      }
    }
  }

  return v8;
}

- (void)_performMusicKitRequestWithURL:(id)a3 storeRequestContext:(id)a4 ignoreCache:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc(&OBJC_CLASS___ICMusicKitRequestContext);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000C915C;
  v26[3] = &unk_1001A5450;
  id v14 = v11;
  id v27 = v14;
  id v15 = [v13 initWithBlock:v26];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v10));
  id v17 = v16;
  if (v7) {
    [v16 setCachePolicy:1];
  }
  id v18 = [[ICMusicKitURLRequest alloc] initWithURLRequest:v17 requestContext:v15 resumeData:0];
  os_log_type_t v19 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    __int128 v29 = self;
    __int16 v30 = 2114;
    id v31 = v18;
    __int16 v32 = 2114;
    id v33 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "<ICDMusicUserSocialProfileProvider: %p> Performing MusicKit request %{public}@ with URL: %{public}@",  buf,  0x20u);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLSessionManager defaultSession](&OBJC_CLASS___ICURLSessionManager, "defaultSession"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000C925C;
  v23[3] = &unk_1001A5428;
  v23[4] = self;
  id v24 = v18;
  id v25 = v12;
  id v21 = v12;
  id v22 = v18;
  [v20 enqueueDataRequest:v22 withCompletionHandler:v23];
}

- (void)_onQueue_setupRetrySourceForAttempt:(unsigned int)a3
{
  uint64_t v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_serialQueue);
  retryTimer = self->_retryTimer;
  self->_retryTimer = v5;

  double v7 = exp2((double)a3);
  dispatch_time_t v8 = dispatch_time(0LL, 1000000000LL * v7);
  dispatch_source_set_timer((dispatch_source_t)self->_retryTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  objc_initWeak(&location, self);
  id v9 = self->_retryTimer;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000C9030;
  v10[3] = &unk_1001A5478;
  objc_copyWeak(&v11, &location);
  unsigned int v12 = a3;
  v10[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v9, v10);
  dispatch_resume((dispatch_object_t)self->_retryTimer);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_onQueue_teardownRetrySource
{
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)retryTimer);
    id v4 = self->_retryTimer;
    self->_retryTimer = 0LL;
  }

- (void)_onQueue_retryPendingUpdateAttempt:(unsigned int)a3
{
  uint64_t v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unsigned int v12 = self;
    __int16 v13 = 1024;
    unsigned int v14 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "<ICDMusicUserSocialProfileProvider: %p> Retrying attempt %u",  buf,  0x12u);
  }

  contextsPendingUserProfileUpdate = self->_contextsPendingUserProfileUpdate;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000C8C4C;
  v9[3] = &unk_1001A54F0;
  v9[4] = self;
  unsigned int v10 = a3;
  -[NSMutableSet enumerateObjectsUsingBlock:](contextsPendingUserProfileUpdate, "enumerateObjectsUsingBlock:", v9);
  double v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  dispatch_time_t v8 = self->_contextsPendingUserProfileUpdate;
  self->_contextsPendingUserProfileUpdate = v7;
}

- (void).cxx_destruct
{
}

@end