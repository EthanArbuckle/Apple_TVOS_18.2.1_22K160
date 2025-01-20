@interface CloudLibrary
+ (id)logCategory;
+ (id)oversizeLogCategory;
- (BOOL)_isEnabledWithURLBag:(id)a3;
- (BOOL)failedToConnect;
- (BOOL)loginRequestInFlight;
- (CloudLibrary)init;
- (CloudLibraryConnection)underlyingConnection;
- (CloudPendingChangesCoordinator)pendingChangesCoordinator;
- (ICConnectionConfiguration)configuration;
- (NSString)libraryIdentifier;
- (OS_dispatch_group)connectionGroup;
- (OS_dispatch_queue)asynchronousRequestsAccessQueue;
- (OS_dispatch_queue)connectionQueue;
- (id)_bagKey;
- (id)_initWithConfiguration:(id)a3 pendingChangesCoordinator:(id)a4;
- (id)_userIdentity;
- (id)connectionCompletionHandler;
- (void)_connectToLibraryWithCompletionHandler:(id)a3 allowRetry:(BOOL)a4 forceBagReload:(BOOL)a5;
- (void)_continueConnectingToLibraryWithCompletionHandler:(id)a3;
- (void)_enqueueFailedOperation:(id)a3;
- (void)_enqueuePendingOperation:(id)a3;
- (void)_ensureConnectionWithCompletionHandler:(id)a3;
- (void)_executeBlockForAllOperations:(id)a3;
- (void)_performPendingOperations;
- (void)addBackgroundOperation:(id)a3 priority:(int)a4;
- (void)addOperation:(id)a3 priority:(int)a4;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)decreasePriorityForAllOperations;
- (void)increasePriorityForAllOperations;
- (void)setAsynchronousRequestsAccessQueue:(id)a3;
- (void)setConnectionCompletionHandler:(id)a3;
- (void)setConnectionGroup:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setFailedToConnect:(BOOL)a3;
- (void)setLoginRequestInFlight:(BOOL)a3;
- (void)setUnderlyingConnection:(id)a3;
@end

@implementation CloudLibrary

- (CloudLibrary)init
{
  return 0LL;
}

- (id)_initWithConfiguration:(id)a3 pendingChangesCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___CloudLibrary;
  v8 = -[CloudLibrary init](&v37, "init");
  v10 = v8;
  if (v8)
  {
    v11 = (objc_class *)objc_opt_class(v8, v9);
    v12 = NSStringFromClass(v11);
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    libraryIdentifier = v10->_libraryIdentifier;
    v10->_libraryIdentifier = (NSString *)v13;

    v15 = (ICConnectionConfiguration *)[v6 copy];
    configuration = v10->_configuration;
    v10->_configuration = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](v10->_configuration, "userIdentity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](v10->_configuration, "userIdentityStore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary _bagKey](v10, "_bagKey"));
    -[ICConnectionConfiguration setLibraryBagKey:](v10->_configuration, "setLibraryBagKey:", v19);

    objc_storeStrong((id *)&v10->_pendingChangesCoordinator, a4);
    v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.itunescloudd.%@.connection",  objc_opt_class(v10, v20));
    id v22 = objc_claimAutoreleasedReturnValue(v21);
    dispatch_queue_t v23 = dispatch_queue_create((const char *)[v22 UTF8String], 0);
    -[CloudLibrary setConnectionQueue:](v10, "setConnectionQueue:", v23);

    dispatch_group_t v24 = dispatch_group_create();
    -[CloudLibrary setConnectionGroup:](v10, "setConnectionGroup:", v24);

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.itunescloudd.asyncrequests", 0LL);
    -[CloudLibrary setAsynchronousRequestsAccessQueue:](v10, "setAsynchronousRequestsAccessQueue:", v25);

    id v36 = 0LL;
    v26 = (void *)objc_claimAutoreleasedReturnValue([v18 getPropertiesForUserIdentity:v17 error:&v36]);
    id v28 = v36;
    if (v28)
    {
      v29 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "msv_description"));
        *(_DWORD *)buf = 138543874;
        v39 = v10;
        __int16 v40 = 2114;
        v41 = v17;
        __int16 v42 = 2114;
        v43 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%{public}@ Failed to load identity properties for %{public}@ error=%{public}@",  buf,  0x20u);
      }
    }

    if (!v26
      || (v31 = (void *)objc_claimAutoreleasedReturnValue([v26 DSID]),
          id v32 = [v31 longLongValue],
          v31,
          !v32))
    {
      id v33 = objc_msgSend((id)objc_opt_class(v10, v27), "logCategory");
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v39 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "CloudLibrary %p - No active account, returning nil library (which will suspend operation queue).",  buf,  0xCu);
      }

      v10 = 0LL;
    }
  }

  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CloudLibrary;
  -[CloudLibrary dealloc](&v2, "dealloc");
}

- (void)addOperation:(id)a3 priority:(int)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary libraryIdentifier](self, "libraryIdentifier"));
    [v6 setLibraryIdentifier:v7];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000712D0;
    v8[3] = &unk_1001A3B10;
    v8[4] = self;
    id v9 = v6;
    int v10 = a4;
    -[CloudLibrary _ensureConnectionWithCompletionHandler:](self, "_ensureConnectionWithCompletionHandler:", v8);
  }
}

- (void)addBackgroundOperation:(id)a3 priority:(int)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary libraryIdentifier](self, "libraryIdentifier"));
    [v6 setLibraryIdentifier:v7];

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100070E58;
    v8[3] = &unk_1001A3B10;
    v8[4] = self;
    id v9 = v6;
    int v10 = a4;
    -[CloudLibrary _ensureConnectionWithCompletionHandler:](self, "_ensureConnectionWithCompletionHandler:", v8);
  }
}

- (void)decreasePriorityForAllOperations
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "logCategory");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v9 = (id)objc_opt_class(self, v5);
    __int16 v10 = 2048;
    v11 = self;
    id v6 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %p -  decreasePriorityForAllOperations",  buf,  0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100070D3C;
  v7[3] = &unk_1001A3B38;
  v7[4] = self;
  -[CloudLibrary _executeBlockForAllOperations:](self, "_executeBlockForAllOperations:", v7);
}

- (void)increasePriorityForAllOperations
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "logCategory");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v9 = (id)objc_opt_class(self, v5);
    __int16 v10 = 2048;
    v11 = self;
    id v6 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %p -  increasePriorityForAllOperations",  buf,  0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100070C20;
  v7[3] = &unk_1001A3B38;
  v7[4] = self;
  -[CloudLibrary _executeBlockForAllOperations:](self, "_executeBlockForAllOperations:", v7);
}

- (void)cancelAllOperations
{
  id v3 = objc_msgSend((id)objc_opt_class(self, a2), "logCategory");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v9 = (id)objc_opt_class(self, v5);
    __int16 v10 = 2048;
    v11 = self;
    id v6 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %p - cancelAllOperations",  buf,  0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100070B04;
  v7[3] = &unk_1001A3B38;
  v7[4] = self;
  -[CloudLibrary _executeBlockForAllOperations:](self, "_executeBlockForAllOperations:", v7);
}

- (id)_userIdentity
{
  return +[ICUserIdentity autoupdatingActiveAccount](&OBJC_CLASS___ICUserIdentity, "autoupdatingActiveAccount");
}

- (id)_bagKey
{
  return 0LL;
}

- (BOOL)_isEnabledWithURLBag:(id)a3
{
  return 1;
}

- (void)_performPendingOperations
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary pendingChangesCoordinator](self, "pendingChangesCoordinator"));
  if (v4)
  {
    id v5 = objc_msgSend((id)objc_opt_class(self, v3), "logCategory");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218498;
      __int16 v10 = self;
      __int16 v11 = 2114;
      id v12 = (id)objc_opt_class(v4, v7);
      __int16 v13 = 2048;
      v14 = v4;
      id v8 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CloudLibrary %p - Performing pending changes with coordinator: <%{public}@ %p>",  (uint8_t *)&v9,  0x20u);
    }

    [v4 processPendingChangesUsingLibrary:self];
  }
}

- (void)_enqueueFailedOperation:(id)a3
{
  id v4 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary pendingChangesCoordinator](self, "pendingChangesCoordinator"));
  if (v6)
  {
    id v7 = objc_msgSend((id)objc_opt_class(self, v5), "logCategory");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = (objc_class *)objc_opt_class(v4, v9);
      __int16 v11 = NSStringFromClass(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      int v13 = 134218498;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v12;
      __int16 v17 = 2048;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CloudLibrary %p - Enqueuing failed operation to the pending changes coordinator: <%{public}@: %p>",  (uint8_t *)&v13,  0x20u);
    }

    [v6 addPendingChange:v4];
  }
}

- (void)_enqueuePendingOperation:(id)a3
{
  id v4 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary pendingChangesCoordinator](self, "pendingChangesCoordinator"));
  if (v6)
  {
    id v7 = objc_msgSend((id)objc_opt_class(self, v5), "logCategory");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = (objc_class *)objc_opt_class(v4, v9);
      __int16 v11 = NSStringFromClass(v10);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      int v23 = 134218498;
      dispatch_group_t v24 = self;
      __int16 v25 = 2114;
      v26 = v12;
      __int16 v27 = 2048;
      id v28 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CloudLibrary %p - Enqueuing unserviceable operation to the pending changes coordinator: <%{public}@: %p>",  (uint8_t *)&v23,  0x20u);
    }

    [v6 addPendingChange:v4];
  }

  [v4 cancel];
  [v4 setStatus:3];
  int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2003LL,  0LL));
  [v4 setError:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 completionBlock]);
  if (v14)
  {
    id v16 = objc_msgSend((id)objc_opt_class(self, v15), "logCategory");
    __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class(v4, v18);
      uint64_t v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      int v23 = 134218498;
      dispatch_group_t v24 = self;
      __int16 v25 = 2114;
      v26 = v21;
      __int16 v27 = 2048;
      id v28 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "CloudLibrary %p - Calling completion block on non-executing, cancelled operation: <%{public}@: %p>",  (uint8_t *)&v23,  0x20u);
    }

    id v22 = (void (**)(void))objc_claimAutoreleasedReturnValue([v4 completionBlock]);
    v22[2]();
  }
}

- (void)_ensureConnectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CloudLibrary connectionQueue](self, "connectionQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000706CC;
  v7[3] = &unk_1001A6BB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_connectToLibraryWithCompletionHandler:(id)a3 allowRetry:(BOOL)a4 forceBagReload:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v10 = objc_msgSend((id)objc_opt_class(self, v9), "logCategory");
  __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CloudLibrary %p - Loading URL bag...",  buf,  0xCu);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000701CC;
  v18[3] = &unk_1001A6640;
  v18[4] = self;
  id v12 = -[ICStoreRequestContext initWithBlock:](objc_alloc(&OBJC_CLASS___ICStoreRequestContext), "initWithBlock:", v18);
  int v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100070228;
  v15[3] = &unk_1001A3B88;
  v15[4] = self;
  id v16 = v8;
  BOOL v17 = a4;
  id v14 = v8;
  [v13 getBagForRequestContext:v12 forceRefetch:v5 withCompletionHandler:v15];
}

- (void)_continueConnectingToLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[CloudLibraryConnection initWithConfiguration:]( objc_alloc(&OBJC_CLASS___CloudLibraryConnection),  "initWithConfiguration:",  self->_configuration);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10006FEE8;
  v8[3] = &unk_1001A3BD8;
  uint64_t v9 = v5;
  id v10 = v4;
  v8[4] = self;
  id v6 = v5;
  id v7 = v4;
  -[CloudLibraryConnection connectWithCompletionHandler:](v6, "connectWithCompletionHandler:", v8);
}

- (void)_executeBlockForAllOperations:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_msgSend((id)objc_opt_class(self, v4), "logCategory");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = (id)objc_opt_class(self, v8);
      __int16 v19 = 2048;
      uint64_t v20 = self;
      id v9 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %p -  _executeBlockForAllOperations",  buf,  0x16u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICDServer server](&OBJC_CLASS___ICDServer, "server"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10006FAB0;
    v15[3] = &unk_1001A3C00;
    v15[4] = self;
    id v11 = v5;
    id v16 = v11;
    [v10 enumerateOperationsUsingBlock:v15];

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICDServer server](&OBJC_CLASS___ICDServer, "server"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10006FCCC;
    v13[3] = &unk_1001A3C00;
    v13[4] = self;
    id v14 = v11;
    [v12 enumerateBackgroundOperationsUsingBlock:v13];
  }
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (CloudLibraryConnection)underlyingConnection
{
  return self->_underlyingConnection;
}

- (void)setUnderlyingConnection:(id)a3
{
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (CloudPendingChangesCoordinator)pendingChangesCoordinator
{
  return self->_pendingChangesCoordinator;
}

- (BOOL)failedToConnect
{
  return self->_failedToConnect;
}

- (void)setFailedToConnect:(BOOL)a3
{
  self->_failedToConnect = a3;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (OS_dispatch_group)connectionGroup
{
  return self->_connectionGroup;
}

- (void)setConnectionGroup:(id)a3
{
}

- (BOOL)loginRequestInFlight
{
  return self->_loginRequestInFlight;
}

- (void)setLoginRequestInFlight:(BOOL)a3
{
  self->_loginRequestInFlight = a3;
}

- (OS_dispatch_queue)asynchronousRequestsAccessQueue
{
  return self->_asynchronousRequestsAccessQueue;
}

- (void)setAsynchronousRequestsAccessQueue:(id)a3
{
}

- (id)connectionCompletionHandler
{
  return self->_connectionCompletionHandler;
}

- (void)setConnectionCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)logCategory
{
  id v4 = +[CloudLibrary instanceMethodForSelector:](&OBJC_CLASS___CloudLibrary, "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(a1, v5), "instanceMethodForSelector:", a2))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v10 = (objc_class *)objc_opt_class(a1, v9);
    id v11 = NSStringFromClass(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = NSStringFromSelector(a2);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v8 handleFailureInMethod:a2, a1, @"CloudLibrary.m", 45, @"Subclass %@ must implement -%@ defined in %@.", v12, v14, @"CloudLibrary" object file lineNumber description];
  }

  id v6 = &_os_log_default;
  return &_os_log_default;
}

+ (id)oversizeLogCategory
{
  id v4 = +[CloudLibrary instanceMethodForSelector:](&OBJC_CLASS___CloudLibrary, "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(a1, v5), "instanceMethodForSelector:", a2))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v10 = (objc_class *)objc_opt_class(a1, v9);
    id v11 = NSStringFromClass(v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = NSStringFromSelector(a2);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v8 handleFailureInMethod:a2, a1, @"CloudLibrary.m", 50, @"Subclass %@ must implement -%@ defined in %@.", v12, v14, @"CloudLibrary" object file lineNumber description];
  }

  id v6 = &_os_log_default;
  return &_os_log_default;
}

@end