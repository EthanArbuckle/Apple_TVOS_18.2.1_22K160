@interface TVCacheDeleteServiceConnection
- (NSString)connectionBundleIdentifier;
- (NSXPCConnection)remoteConnection;
- (OS_dispatch_queue)workQueue;
- (TVAppCachePolicyManager)policyManager;
- (TVCacheDeleteServiceConnection)initWithConnection:(id)a3 bundleIdentifier:(id)a4;
- (id)invalidationHandler;
- (void)_handleRemoteConnectionInterruption;
- (void)_handleRemoteConnectionInvalidation;
- (void)addAppCachePurgeRequest:(id)a3 reply:(id)a4;
- (void)fetchApplicationStateWithReply:(id)a3;
- (void)removeAllAppCachePurgeRequestsWithReply:(id)a3;
- (void)removeAppCachePurgeRequestWithURL:(id)a3 reply:(id)a4;
- (void)resume;
- (void)setConnectionBundleIdentifier:(id)a3;
- (void)setDoNotPurge:(BOOL)a3 withReply:(id)a4;
- (void)setInvalidationHandler:(id)a3;
- (void)setPolicyManager:(id)a3;
@end

@implementation TVCacheDeleteServiceConnection

- (TVCacheDeleteServiceConnection)initWithConnection:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVCacheDeleteServiceConnection;
  v9 = -[TVCacheDeleteServiceConnection init](&v26, "init");
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    connectionBundleIdentifier = v9->_connectionBundleIdentifier;
    v9->_connectionBundleIdentifier = v10;

    objc_storeStrong((id *)&v9->_remoteConnection, a3);
    -[NSXPCConnection setExportedObject:](v9->_remoteConnection, "setExportedObject:", v9);
    remoteConnection = v9->_remoteConnection;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TVCacheDeleteServiceInterface));
    -[NSXPCConnection setExportedInterface:](remoteConnection, "setExportedInterface:", v13);

    objc_initWeak(&location, v9);
    v14 = v9->_remoteConnection;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100004E74;
    v23[3] = &unk_10000C378;
    objc_copyWeak(&v24, &location);
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", v23);
    v15 = v9->_remoteConnection;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100004EA0;
    v21[3] = &unk_10000C378;
    objc_copyWeak(&v22, &location);
    -[NSXPCConnection setInterruptionHandler:](v15, "setInterruptionHandler:", v21);
    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, -14);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.atvcached.TVCacheDeleteServiceConnection.workQueue", v17);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)resume
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection remoteConnection](self, "remoteConnection"));
  [v2 resume];
}

- (void)_handleRemoteConnectionInvalidation
{
  id v3 = sub_100007290();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection remoteConnection](self, "remoteConnection"));
    int v15 = 138543362;
    dispatch_queue_attr_t v16 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Connection invalidated: %{public}@",  (uint8_t *)&v15,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
  if (v6)
  {
    id v7 = sub_100007290();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection remoteConnection](self, "remoteConnection"));
      int v15 = 138543618;
      dispatch_queue_attr_t v16 = v9;
      __int16 v17 = 2114;
      dispatch_queue_t v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Disabling 'Do Not Purge' for %{public}@ on %{public}@",  (uint8_t *)&v15,  0x16u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection policyManager](self, "policyManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
    [v11 setDoNotPurge:0 forApplication:v12];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection invalidationHandler](self, "invalidationHandler"));

  if (v13)
  {
    v14 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection invalidationHandler](self, "invalidationHandler"));
    v14[2]();
  }

- (void)_handleRemoteConnectionInterruption
{
  id v3 = sub_100007290();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection remoteConnection](self, "remoteConnection"));
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Connection interrupted: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection remoteConnection](self, "remoteConnection"));
  [v6 invalidate];
}

- (void)setDoNotPurge:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, void))a4;
  id v7 = sub_100007290();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
    v10 = (void *)v9;
    v11 = @"disabling";
    if (v4) {
      v11 = @"enabling";
    }
    int v14 = 138543618;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    __int16 v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Application %{public}@ %{public}@ 'Do Not Purge' from CacheDelete.",  (uint8_t *)&v14,  0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection policyManager](self, "policyManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
  [v12 setDoNotPurge:v4 forApplication:v13];

  if (v6) {
    v6[2](v6, 0LL);
  }
}

- (void)addAppCachePurgeRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = sub_100007290();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 cacheURL]);
    int v14 = 138543874;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Application %{public}@ adding app cache purge request: %{public}@ URL %{public}@",  (uint8_t *)&v14,  0x20u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection policyManager](self, "policyManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
  [v12 addPurgeRequest:v6 forApplication:v13];

  if (v7) {
    v7[2](v7, 0LL);
  }
}

- (void)removeAppCachePurgeRequestWithURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = sub_100007290();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
    int v13 = 138543618;
    int v14 = v10;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Application %{public}@ remove app cache purge request with URL: %{public}@",  (uint8_t *)&v13,  0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection policyManager](self, "policyManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
  [v11 removePurgeRequestWithURL:v6 forApplication:v12];

  if (v7) {
    v7[2](v7, 0LL);
  }
}

- (void)removeAllAppCachePurgeRequestsWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  id v5 = sub_100007290();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
    int v10 = 138543362;
    v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Application %{public}@ removing all app cache purge requests.",  (uint8_t *)&v10,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection policyManager](self, "policyManager"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
  [v8 removeAllPurgeRequestsForApplication:v9];

  if (v4) {
    v4[2](v4, 0LL);
  }
}

- (void)fetchApplicationStateWithReply:(id)a3
{
  id v4 = a3;
  id v5 = sub_100007290();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVCacheDeleteServiceConnection connectionBundleIdentifier](self, "connectionBundleIdentifier"));
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Application %{public}@ querying applications state.",  buf,  0xCu);
  }

  if (v4)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100005788;
    block[3] = &unk_10000C590;
    id v10 = v4;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (NSXPCConnection)remoteConnection
{
  return self->_remoteConnection;
}

- (TVAppCachePolicyManager)policyManager
{
  return self->_policyManager;
}

- (void)setPolicyManager:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)connectionBundleIdentifier
{
  return self->_connectionBundleIdentifier;
}

- (void)setConnectionBundleIdentifier:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
}

@end