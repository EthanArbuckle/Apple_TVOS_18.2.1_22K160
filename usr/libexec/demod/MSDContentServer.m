@interface MSDContentServer
- (BOOL)localHubReachable;
- (BOOL)shouldTryLocalHub:(id)a3;
- (MSDContentServer)init;
- (MSDContentServer)initWithCellularAccess:(BOOL)a3;
- (MSDContentServerObserver)observer;
- (MSDDownloadFileRequest)cachingHubRequest;
- (NSDictionary)cachedFDC;
- (NSMapTable)sessionTable;
- (NSMutableArray)pendingRequests;
- (NSString)localHubURLSchema;
- (double)cachingHubRetryInterval;
- (double)nextRetryTime;
- (double)reachabilityLastUpdatedTime;
- (id)getSessionForRequest:(id)a3;
- (id)getSessionWithMinRequestLoad;
- (int64_t)concurrentSession;
- (int64_t)maxConcurrentRequests;
- (int64_t)numConcurrentRequests;
- (int64_t)requestPerSession;
- (os_unfair_lock_s)cachingHubRetryLock;
- (os_unfair_lock_s)requestDispatchLock;
- (unint64_t)signpostId;
- (void)allocateRequest:(id)a3 forSession:(id)a4;
- (void)downloadFile:(id)a3;
- (void)freeRequest:(id)a3 forSession:(id)a4;
- (void)handleCompletionForDownloadRequest:(id)a3 withResponse:(id)a4 forSession:(id)a5;
- (void)initServer;
- (void)launchRequest:(id)a3 toSession:(id)a4;
- (void)limitConcurrentRequests;
- (void)setCachedFDC:(id)a3;
- (void)setCachingHubRequest:(id)a3;
- (void)setCachingHubRetryInterval:(double)a3;
- (void)setCachingHubRetryLock:(os_unfair_lock_s)a3;
- (void)setConcurrentSession:(int64_t)a3;
- (void)setLocalHubReachable:(BOOL)a3;
- (void)setLocalHubURLSchema:(id)a3;
- (void)setMaxConcurrentRequests:(int64_t)a3;
- (void)setNextRetryTime:(double)a3;
- (void)setNumConcurrentRequests:(int64_t)a3;
- (void)setObserver:(id)a3;
- (void)setPendingRequests:(id)a3;
- (void)setReachabilityLastUpdatedTime:(double)a3;
- (void)setRequestDispatchLock:(os_unfair_lock_s)a3;
- (void)setRequestPerSession:(int64_t)a3;
- (void)setSessionTable:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)updateLocalHubReachability:(BOOL)a3 withRequest:(id)a4 andResponse:(id)a5;
@end

@implementation MSDContentServer

- (MSDContentServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MSDContentServer;
  v2 = -[MSDContentServer init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDContentServer initServer](v2, "initServer");
    if (-[MSDContentServer concurrentSession](v3, "concurrentSession") >= 1)
    {
      uint64_t v4 = 0LL;
      do
      {
        v5 = objc_alloc_init(&OBJC_CLASS___MSDCDNSession);
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](v3, "sessionTable"));
        v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        [v6 setObject:v7 forKey:v5];

        ++v4;
      }

      while (v4 < -[MSDContentServer concurrentSession](v3, "concurrentSession"));
    }

    v8 = v3;
  }

  return v3;
}

- (MSDContentServer)initWithCellularAccess:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MSDContentServer;
  uint64_t v4 = -[MSDContentServer init](&v12, "init");
  v5 = v4;
  if (v4)
  {
    -[MSDContentServer initServer](v4, "initServer");
    if (-[MSDContentServer concurrentSession](v5, "concurrentSession") >= 1)
    {
      uint64_t v6 = 0LL;
      do
      {
        v7 = -[MSDSession initWithCellularAccess:]( objc_alloc(&OBJC_CLASS___MSDCDNSession),  "initWithCellularAccess:",  v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](v5, "sessionTable"));
        v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        [v8 setObject:v9 forKey:v7];

        ++v6;
      }

      while (v6 < -[MSDContentServer concurrentSession](v5, "concurrentSession"));
    }

    objc_super v10 = v5;
  }

  return v5;
}

- (void)downloadFile:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer getSessionForRequest:](self, "getSessionForRequest:"));
  if (v4) {
    -[MSDContentServer launchRequest:toSession:](self, "launchRequest:toSession:", v5, v4);
  }
}

- (void)launchRequest:(id)a3 toSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v44[0] = 0LL;
  v44[1] = v44;
  v44[2] = 0x3032000000LL;
  v44[3] = sub_10001E8F8;
  v44[4] = sub_10001E908;
  id v45 = 0LL;
  v42[0] = 0LL;
  v42[1] = v42;
  v42[2] = 0x3032000000LL;
  v42[3] = sub_10001E8F8;
  v42[4] = sub_10001E908;
  id v43 = 0LL;
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x3032000000LL;
  v40[3] = sub_10001E8F8;
  v40[4] = sub_10001E908;
  id v41 = 0LL;
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x3032000000LL;
  v38[3] = sub_10001E8F8;
  v38[4] = sub_10001E908;
  id v39 = 0LL;
  v8 = objc_alloc_init(&OBJC_CLASS___MSDServerRetryPolicyContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadCredentials]);
  -[MSDServerRetryPolicyContext setFdc:](v8, "setFdc:", v9);

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v6 originServer]);
  -[MSDServerRetryPolicyContext setOriginServer:](v8, "setOriginServer:", v10);

  -[MSDServerRetryPolicyContext setTryCachingHub:]( v8,  "setTryCachingHub:",  -[MSDContentServer shouldTryLocalHub:](self, "shouldTryLocalHub:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer localHubURLSchema](self, "localHubURLSchema"));
  -[MSDServerRetryPolicyContext setCachedLocalURL:](v8, "setCachedLocalURL:", v11);

  objc_super v12 = objc_alloc_init(&OBJC_CLASS___MSDCDNSessionTaskInfo);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 fileInfo]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 fileHash]);
  -[MSDCDNSessionTaskInfo setFileHash:](v12, "setFileHash:", v14);

  -[MSDSessionTaskInfo setMaxRetry:](v12, "setMaxRetry:", 3LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 savePath]);
  -[MSDSessionTaskInfo setSavePath:](v12, "setSavePath:", v15);

  v16 = -[MSDContentServerURLRetryPolicy initWithContext:]( objc_alloc(&OBJC_CLASS___MSDContentServerURLRetryPolicy),  "initWithContext:",  v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v17 timeIntervalSince1970];
  objc_msgSend(v6, "setDispatchTime:");

  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472LL;
  v26 = sub_10001E910;
  v27 = &unk_1000F9940;
  v34 = v44;
  v28 = self;
  id v18 = v6;
  id v29 = v18;
  v35 = v40;
  v36 = v42;
  v19 = v16;
  v30 = v19;
  v20 = v12;
  v31 = v20;
  id v21 = v7;
  id v32 = v21;
  v37 = v38;
  v22 = v8;
  v33 = v22;
  v23 = objc_retainBlock(&v24);
  -[MSDSessionTaskInfo setHandler:](v20, "setHandler:", v23, v24, v25, v26, v27, v28);
  ((void (*)(void ***, void, void))v23[2])(v23, 0LL, 0LL);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
}

- (void)initServer
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[MSDContentServer setPendingRequests:](self, "setPendingRequests:", v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToStrongObjectsMapTable"));
  -[MSDContentServer setSessionTable:](self, "setSessionTable:", v4);

  id v5 = sub_10003AAAC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  -[MSDContentServer setSignpostId:](self, "setSignpostId:", os_signpost_id_generate(v6));

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    uint64_t v8 = (uint64_t)[v7 concurrentSession];

    if (v8 >= 1)
    {
      id v9 = sub_10003A95C();
      objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 134217984;
        double v21 = *(double *)&v8;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Override default number of concurrent download session: %ld",  (uint8_t *)&v20,  0xCu);
      }

      -[MSDContentServer setConcurrentSession:](self, "setConcurrentSession:", v8);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    uint64_t v12 = (uint64_t)[v11 concurrentDownloadRequest];

    if (v12 >= 1)
    {
      id v13 = sub_10003A95C();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 134217984;
        double v21 = *(double *)&v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Override default number of concurrent requests per session: %ld",  (uint8_t *)&v20,  0xCu);
      }

      -[MSDContentServer setRequestPerSession:](self, "setRequestPerSession:", v12);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
    [v15 cachingHubRetryInterval];
    double v17 = v16;

    if (v17 > 0.0)
    {
      id v18 = sub_10003A95C();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 134217984;
        double v21 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Override default caching hub retry interval: %lf",  (uint8_t *)&v20,  0xCu);
      }

      -[MSDContentServer setCachingHubRetryInterval:](self, "setCachingHubRetryInterval:", v17);
    }
  }

  -[MSDContentServer setMaxConcurrentRequests:]( self,  "setMaxConcurrentRequests:",  -[MSDContentServer requestPerSession](self, "requestPerSession")
  * -[MSDContentServer concurrentSession](self, "concurrentSession"));
}

- (void)handleCompletionForDownloadRequest:(id)a3 withResponse:(id)a4 forSession:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_requestDispatchLock);
  -[MSDContentServer freeRequest:forSession:](self, "freeRequest:forSession:", v17, v9);
  uint64_t v10 = -[MSDContentServer numConcurrentRequests](self, "numConcurrentRequests");
  if (v10 < -[MSDContentServer maxConcurrentRequests](self, "maxConcurrentRequests")
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer pendingRequests](self, "pendingRequests")),
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]),
        v11,
        v12))
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer pendingRequests](self, "pendingRequests"));
    [v13 removeObjectAtIndex:0];

    -[MSDContentServer allocateRequest:forSession:](self, "allocateRequest:forSession:", v12, v9);
    os_unfair_lock_unlock(&self->_requestDispatchLock);
    -[MSDContentServer launchRequest:toSession:](self, "launchRequest:toSession:", v12, v9);
  }

  else
  {
    os_unfair_lock_unlock(&self->_requestDispatchLock);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer observer](self, "observer"));

  if (v14)
  {
    v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[MSDContentServer observer](self, "observer"));
    [v15 requestComplete:v17 withResponse:v8];
LABEL_9:

    goto LABEL_10;
  }

  double v16 = (void *)objc_claimAutoreleasedReturnValue([v17 completion]);

  if (v16)
  {
    v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v17 completion]);
    ((void (**)(void, id))v15)[2](v15, v8);
    goto LABEL_9;
  }

- (id)getSessionForRequest:(id)a3
{
  p_requestDispatchLock = &self->_requestDispatchLock;
  id v5 = a3;
  os_unfair_lock_lock(p_requestDispatchLock);
  uint64_t v6 = -[MSDContentServer numConcurrentRequests](self, "numConcurrentRequests");
  if (v6 >= -[MSDContentServer maxConcurrentRequests](self, "maxConcurrentRequests"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer pendingRequests](self, "pendingRequests"));
    [v8 addObject:v5];

    id v7 = 0LL;
    id v5 = v8;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer getSessionWithMinRequestLoad](self, "getSessionWithMinRequestLoad"));
    -[MSDContentServer allocateRequest:forSession:](self, "allocateRequest:forSession:", v5, v7);
  }

  os_unfair_lock_unlock(p_requestDispatchLock);
  return v7;
}

- (void)allocateRequest:(id)a3 forSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](self, "sessionTable"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

  [v9 addObject:v7];
  -[MSDContentServer setNumConcurrentRequests:]( self,  "setNumConcurrentRequests:",  (char *)-[MSDContentServer numConcurrentRequests](self, "numConcurrentRequests") + 1);
}

- (void)freeRequest:(id)a3 forSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](self, "sessionTable"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

  [v9 removeObject:v7];
  -[MSDContentServer setNumConcurrentRequests:]( self,  "setNumConcurrentRequests:",  (char *)-[MSDContentServer numConcurrentRequests](self, "numConcurrentRequests") - 1);
}

- (id)getSessionWithMinRequestLoad
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](self, "sessionTable", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0LL;
    uint64_t v7 = *(void *)v16;
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer sessionTable](self, "sessionTable"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);

        if ((unint64_t)[v12 count] < v8)
        {
          unint64_t v8 = (unint64_t)[v12 count];
          id v13 = v10;

          id v6 = v13;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v5);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)limitConcurrentRequests
{
  p_requestDispatchLock = &self->_requestDispatchLock;
  os_unfair_lock_lock(&self->_requestDispatchLock);
  if (-[MSDContentServer requestPerSession](self, "requestPerSession") >= 2)
  {
    -[MSDContentServer setRequestPerSession:]( self,  "setRequestPerSession:",  (char *)-[MSDContentServer requestPerSession](self, "requestPerSession") - 1);
    -[MSDContentServer setMaxConcurrentRequests:]( self,  "setMaxConcurrentRequests:",  -[MSDContentServer requestPerSession](self, "requestPerSession")
    * -[MSDContentServer concurrentSession](self, "concurrentSession"));
    id v4 = sub_10003A95C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000934F4(self, v5);
    }
  }

  os_unfair_lock_unlock(p_requestDispatchLock);
}

- (BOOL)shouldTryLocalHub:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 downloadCredentials]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 originServer]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localCredentialForOriginServer:v6]);

  os_unfair_lock_lock(&self->_cachingHubRetryLock);
  unsigned int v8 = -[MSDContentServer localHubReachable](self, "localHubReachable");
  BOOL v9 = v8;
  if (v7 && (v8 & 1) == 0)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer cachingHubRequest](self, "cachingHubRequest"));

    if (v10)
    {
LABEL_4:
      LOBYTE(v9) = 0;
      goto LABEL_18;
    }

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[MSDContentServer cachedFDC](self, "cachedFDC"));
    if (v11
      && (uint64_t v12 = (void *)v11,
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentServer cachedFDC](self, "cachedFDC")),
          unsigned __int8 v14 = [v7 isEqualToDictionary:v13],
          v13,
          v12,
          (v14 & 1) != 0))
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v15 timeIntervalSince1970];
      double v17 = v16;
      -[MSDContentServer nextRetryTime](self, "nextRetryTime");
      double v19 = v18;

      if (v17 <= v19) {
        goto LABEL_4;
      }
      id v20 = sub_10003A95C();
      double v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v22 timeIntervalSince1970];
        v24 = v23;
        -[MSDContentServer cachingHubRetryInterval](self, "cachingHubRetryInterval");
        int v30 = 134218240;
        id v31 = v24;
        __int16 v32 = 2048;
        uint64_t v33 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Trying local caching hub at %lf after %lf s",  (uint8_t *)&v30,  0x16u);
      }
    }

    else
    {
      id v26 = sub_10003A95C();
      double v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Request local FDC is new, retrying local caching hub",  (uint8_t *)&v30,  2u);
      }
    }

    -[MSDContentServer setCachingHubRequest:](self, "setCachingHubRequest:", v4);
    id v27 = sub_10003A95C();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138543362;
      id v31 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Launching request %{public}@ to retry caching hub",  (uint8_t *)&v30,  0xCu);
    }

    BOOL v9 = 1;
  }

  if (v7 && v9) {
    -[MSDContentServer setCachedFDC:](self, "setCachedFDC:", v7);
  }
LABEL_18:
  os_unfair_lock_unlock(&self->_cachingHubRetryLock);

  return v9;
}

- (void)updateLocalHubReachability:(BOOL)a3 withRequest:(id)a4 andResponse:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_cachingHubRetryLock);
  [v8 dispatchTime];
  double v11 = v10;
  -[MSDContentServer reachabilityLastUpdatedTime](self, "reachabilityLastUpdatedTime");
  double v13 = v12;
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[MSDContentServer cachingHubRequest](self, "cachingHubRequest"));
  if (v14
    && (__int128 v15 = (void *)v14,
        id v16 = (id)objc_claimAutoreleasedReturnValue(-[MSDContentServer cachingHubRequest](self, "cachingHubRequest")),
        v16,
        v15,
        v16 == v8))
  {
    id v18 = sub_10003A95C();
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 138543618;
      id v35 = v8;
      __int16 v36 = 1024;
      LODWORD(v37) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Request %{public}@ complete with local hub reachability=%d",  (uint8_t *)&v34,  0x12u);
    }

    -[MSDContentServer setCachingHubRequest:](self, "setCachingHubRequest:", 0LL);
    BOOL v17 = v6;
  }

  else
  {
    BOOL v17 = !v6;
  }

  if (v11 > v13 && v17)
  {
    id v21 = sub_10003A95C();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[MSDContentServer reachabilityLastUpdatedTime](self, "reachabilityLastUpdatedTime");
      v24 = v23;
      [v8 dispatchTime];
      int v34 = 134218754;
      id v35 = v24;
      __int16 v36 = 2114;
      id v37 = v8;
      __int16 v38 = 2048;
      uint64_t v39 = v25;
      __int16 v40 = 1024;
      BOOL v41 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Reachability last updated by request dispatched at: %lf; request %{public}@ dispatched at %lf changing local hub"
        " reachability={public}%d",
        (uint8_t *)&v34,
        0x26u);
    }

    -[MSDContentServer setLocalHubReachable:](self, "setLocalHubReachable:", v6);
    [v8 dispatchTime];
    -[MSDContentServer setReachabilityLastUpdatedTime:](self, "setReachabilityLastUpdatedTime:");
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v9 localHubError]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 localizedDescription]);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
    [v28 setLocalHubFailureReason:v27];

    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](&OBJC_CLASS___MSDMailProcessor, "sharedInstance"));
    [v29 reportCachingHubFailed];
  }

  if (!-[MSDContentServer localHubReachable](self, "localHubReachable"))
  {
    int v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v30 timeIntervalSince1970];
    double v32 = v31;
    -[MSDContentServer cachingHubRetryInterval](self, "cachingHubRetryInterval");
    -[MSDContentServer setNextRetryTime:](self, "setNextRetryTime:", v32 + v33);
  }

  os_unfair_lock_unlock(&self->_cachingHubRetryLock);
}

- (MSDContentServerObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (NSString)localHubURLSchema
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLocalHubURLSchema:(id)a3
{
}

- (BOOL)localHubReachable
{
  return self->_localHubReachable;
}

- (void)setLocalHubReachable:(BOOL)a3
{
  self->_localHubReachable = a3;
}

- (NSDictionary)cachedFDC
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCachedFDC:(id)a3
{
}

- (double)nextRetryTime
{
  return self->_nextRetryTime;
}

- (void)setNextRetryTime:(double)a3
{
  self->_nextRetryTime = a3;
}

- (double)reachabilityLastUpdatedTime
{
  return self->_reachabilityLastUpdatedTime;
}

- (void)setReachabilityLastUpdatedTime:(double)a3
{
  self->_reachabilityLastUpdatedTime = a3;
}

- (double)cachingHubRetryInterval
{
  return self->_cachingHubRetryInterval;
}

- (void)setCachingHubRetryInterval:(double)a3
{
  self->_cachingHubRetryInterval = a3;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (MSDDownloadFileRequest)cachingHubRequest
{
  return self->_cachingHubRequest;
}

- (void)setCachingHubRequest:(id)a3
{
}

- (os_unfair_lock_s)cachingHubRetryLock
{
  return self->_cachingHubRetryLock;
}

- (void)setCachingHubRetryLock:(os_unfair_lock_s)a3
{
  self->_cachingHubRetryLock = a3;
}

- (os_unfair_lock_s)requestDispatchLock
{
  return self->_requestDispatchLock;
}

- (void)setRequestDispatchLock:(os_unfair_lock_s)a3
{
  self->_requestDispatchLock = a3;
}

- (int64_t)requestPerSession
{
  return self->_requestPerSession;
}

- (void)setRequestPerSession:(int64_t)a3
{
  self->_requestPerSession = a3;
}

- (int64_t)concurrentSession
{
  return self->_concurrentSession;
}

- (void)setConcurrentSession:(int64_t)a3
{
  self->_concurrentSession = a3;
}

- (int64_t)maxConcurrentRequests
{
  return self->_maxConcurrentRequests;
}

- (void)setMaxConcurrentRequests:(int64_t)a3
{
  self->_maxConcurrentRequests = a3;
}

- (int64_t)numConcurrentRequests
{
  return self->_numConcurrentRequests;
}

- (void)setNumConcurrentRequests:(int64_t)a3
{
  self->_numConcurrentRequests = a3;
}

- (NSMapTable)sessionTable
{
  return self->_sessionTable;
}

- (void)setSessionTable:(id)a3
{
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end