@interface AMSDDaemonRunLoop
- (AMSDDaemonRunLoop)init;
- (BOOL)_performStartup;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableSet)connections;
- (id)_previousBuildVersion;
- (os_unfair_lock_s)connectionsLock;
- (void)_clearDanglingCookieDatabasesWithCompletion:(id)a3;
- (void)_handleBiometricsProvisioningNotification;
- (void)_handleCachedDataUpdate;
- (void)_handleDeviceLanguageChangeNotification:(id)a3;
- (void)_setupAccountDataSync;
- (void)_setupMultiUser;
- (void)_setupNotifications;
- (void)_setupSignalHandlers;
- (void)_startXPC;
- (void)_tearDownMultiUser;
- (void)_updateRegulatoryEligibility;
- (void)dealloc;
- (void)runUntilIdleExit;
- (void)setConnections:(id)a3;
@end

@implementation AMSDDaemonRunLoop

- (AMSDDaemonRunLoop)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AMSDDaemonRunLoop;
  v2 = -[AMSDDaemonRunLoop init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    connections = v2->_connections;
    v2->_connections = v3;

    v2->_connectionsLock._os_unfair_lock_opaque = 0;
    -[AMSDDaemonRunLoop _setupSignalHandlers](v2, "_setupSignalHandlers");
  }

  return v2;
}

- (void)dealloc
{
  sigTermSource = self->_sigTermSource;
  if (sigTermSource)
  {
    dispatch_source_cancel((dispatch_source_t)sigTermSource);
    v4 = self->_sigTermSource;
    self->_sigTermSource = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AMSDDaemonRunLoop;
  -[AMSDDaemonRunLoop dealloc](&v5, "dealloc");
}

- (void)runUntilIdleExit
{
  if (-[AMSDDaemonRunLoop _performStartup](self, "_performStartup"))
  {
    v3 = objc_autoreleasePoolPush();
    id v4 = (id)AMSSetLogKey(0LL);
    if ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 15.0, 0) - 1) >= 2)
    {
      do
      {
        objc_autoreleasePoolPop(v3);
        v3 = objc_autoreleasePoolPush();
        id v5 = (id)AMSSetLogKey(0LL);
      }

      while ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 15.0, 0) - 1) > 1);
    }

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
    if (!v6) {
      objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class(self, v8);
      uint64_t v11 = AMSLogKey(v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      int v13 = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Idle-exit",  (uint8_t *)&v13,  0x16u);
    }

    objc_autoreleasePoolPop(v3);
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (id)AMSSetLogKey(0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v7) {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class(self, v9);
    uint64_t v12 = AMSLogKey(v10, v11);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    unsigned int v14 = [v5 processIdentifier];
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "amsd_processName"));
    *(_DWORD *)buf = 138544386;
    uint64_t v49 = v10;
    __int16 v50 = 2114;
    v51 = v13;
    __int16 v52 = 1024;
    unsigned int v53 = v14;
    __int16 v54 = 2114;
    v55 = v15;
    __int16 v56 = 2114;
    id v57 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Received a new XPC connection. processID = %d | processName = %{public}@ | connection = %{public}@",  buf,  0x30u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDServiceConnection machServiceName](&OBJC_CLASS___AMSDServiceConnection, "machServiceName"));
  unsigned int v18 = [v16 isEqualToString:v17];

  if (!v18)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMultiUserService machServiceName](&OBJC_CLASS___AMSMultiUserService, "machServiceName"));
    unsigned int v28 = [v26 isEqualToString:v27];

    if (v28)
    {
      if ((+[AMSMultiUserService isConnectionEntitled:]( &OBJC_CLASS___AMSMultiUserService,  "isConnectionEntitled:",  v5) & 1) != 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMultiUserService serviceInterface](&OBJC_CLASS___AMSMultiUserService, "serviceInterface"));
        [v5 setExportedInterface:v29];

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDMultiUserService sharedService](&OBJC_CLASS___AMSDMultiUserService, "sharedService"));
        [v5 setExportedObject:v30];

        [v5 resume];
        goto LABEL_10;
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsDaemonConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsDaemonConfig"));
      if (!v32) {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 OSLogObject]);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = objc_opt_class(self, v34);
        uint64_t v37 = AMSLogKey(v35, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = v35;
        __int16 v50 = 2114;
        v51 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Connection interrupted (entitlements)",  buf,  0x16u);
      }
    }

    BOOL v31 = 0;
    goto LABEL_17;
  }

  v19 = -[AMSDServiceConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___AMSDServiceConnection),  "initWithConnection:",  v5);
  uint64_t v21 = AMSLogKey(v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  -[AMSDServiceConnection setLogKey:](v19, "setLogKey:", v22);

  os_unfair_lock_lock_with_options(&self->_connectionsLock, 0x10000LL);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDDaemonRunLoop connections](self, "connections"));
  [v23 addObject:v19];

  os_unfair_lock_unlock(&self->_connectionsLock);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_100011710;
  v46[3] = &unk_1000D60B0;
  v46[4] = self;
  v24 = v19;
  v47 = v24;
  [v5 setInterruptionHandler:v46];
  v40 = _NSConcreteStackBlock;
  uint64_t v41 = 3221225472LL;
  v42 = sub_100011760;
  v43 = &unk_1000D60B0;
  v44 = self;
  v45 = v24;
  v25 = v24;
  [v5 setInvalidationHandler:&v40];
  objc_msgSend(v5, "resume", v40, v41, v42, v43, v44);

LABEL_10:
  BOOL v31 = 1;
LABEL_17:

  return v31;
}

- (void)_clearDanglingCookieDatabasesWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    uint64_t v10 = AMSLogKey(v8, v9);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v13 = objc_opt_class(self, v12);
    uint64_t v15 = v13;
    if (v11)
    {
      uint64_t v16 = AMSLogKey(v13, v14);
      uint64_t v3 = objc_claimAutoreleasedReturnValue(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v15,  v3));
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v13));
    }

    *(_DWORD *)buf = 138543362;
    v23 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@Clearing dangling cookie databases",  buf,  0xCu);
    if (v11)
    {

      v17 = (void *)v3;
    }
  }

  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSCookieService sharedService](&OBJC_CLASS___AMSCookieService, "sharedService"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100011988;
  v20[3] = &unk_1000D60D8;
  v20[4] = self;
  id v21 = v5;
  id v19 = v5;
  [v18 clearDanglingCookieDatabasesWithCompletion:v20];
}

- (BOOL)_performStartup
{
  id v3 = (id)AMSSetLogKey(0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedAccountsDaemonConfig](&OBJC_CLASS___AMSLogConfig, "sharedAccountsDaemonConfig"));
  if (!v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class(self, v6);
    uint64_t v9 = AMSLogKey(v7, v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Starting daemon",  buf,  0x16u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100011D7C;
  v12[3] = &unk_1000D5AB0;
  v12[4] = self;
  +[AMSDTransactionStore takeKeepAliveTransaction:whilePerformingBlock:]( &OBJC_CLASS___AMSDTransactionStore,  "takeKeepAliveTransaction:whilePerformingBlock:",  @"com.apple.amsaccountsd.performStartup",  v12);
  return 1;
}

- (void)_handleBiometricsProvisioningNotification
{
  id v2 = AMSAccountMediaTypeProduction;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStoreForMediaType:]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStoreForMediaType:",  v2));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_activeiTunesAccountForMediaType:", v2));

  id v4 = [v3 thenWithBlock:&stru_1000D6118];
  [v3 waitUntilFinished];
}

- (void)_handleDeviceLanguageChangeNotification:(id)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___AMSDUpdateDeviceLanguageTask);
  id v3 = -[AMSDUpdateDeviceLanguageTask perform](v4, "perform");
}

- (id)_previousBuildVersion
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"SBLastSystemVersion", @"com.apple.springboard");
  if (!v2)
  {
    CFPreferencesAppSynchronize(@"com.apple.migration");
    id v2 = (void *)CFPreferencesCopyAppValue(@"LastSystemVersion", @"com.apple.migration");
  }

  return v2;
}

- (void)_tearDownMultiUser
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = objc_opt_class(self, v5);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Multi-User is shutting down",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDMultiUserController sharedController](&OBJC_CLASS___AMSDMultiUserController, "sharedController"));
  [v6 teardownMultiUser];
}

- (void)_setupMultiUser
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  uint64_t v8 = &OBJC_CLASS___AMSMultiUserService_ptr;
  if (v6)
  {
    uint64_t v9 = AMSLogKey(v6, v7);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v12 = objc_opt_class(self, v11);
    uint64_t v14 = v12;
    if (v10)
    {
      uint64_t v15 = AMSLogKey(v12, v13);
      uint64_t v2 = objc_claimAutoreleasedReturnValue(v15);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v14,  v2));
    }

    else
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v12));
    }

    *(_DWORD *)buf = 138543362;
    v48 = v16;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Setting up multi-user.", buf, 0xCu);
    if (v10)
    {

      uint64_t v16 = (void *)v2;
    }

    uint64_t v8 = &OBJC_CLASS___AMSMultiUserService_ptr;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDMultiUserController sharedController](&OBJC_CLASS___AMSDMultiUserController, "sharedController"));
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 cloudContainer]);

  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDMultiUserController sharedController]( &OBJC_CLASS___AMSDMultiUserController,  "sharedController"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 homeManager]);
    v51 = v18;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v51, 1LL));
    [v20 registerToAcceptCloudSharesForContainers:v21];
  }

  id v22 = +[AMSDMultiUserService sharedService](&OBJC_CLASS___AMSDMultiUserService, "sharedService");
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedAccountsMultiUserConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedAccountsMultiUserConfig"));
  if (!v23) {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    uint64_t v27 = AMSLogKey(v25, v26);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v30 = objc_opt_class(self, v29);
    uint64_t v32 = v30;
    if (v28)
    {
      uint64_t v33 = AMSLogKey(v30, v31);
      uint64_t v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v33);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v32,  v8));
    }

    else
    {
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: ", v30));
    }

    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMultiUserService machServiceName](&OBJC_CLASS___AMSMultiUserService, "machServiceName"));
    *(_DWORD *)buf = 138543618;
    v48 = v34;
    __int16 v49 = 2114;
    __int16 v50 = v35;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@Registering service for name: %{public}@",  buf,  0x16u);

    if (v28)
    {

      uint64_t v34 = v8;
    }
  }

  uint64_t v36 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[AMSMultiUserService machServiceName](&OBJC_CLASS___AMSMultiUserService, "machServiceName"));
  v38 = -[NSXPCListener initWithMachServiceName:](v36, "initWithMachServiceName:", v37);

  -[NSXPCListener setDelegate:](v38, "setDelegate:", self);
  -[NSXPCListener resume](v38, "resume");
  if (+[AMSDMultiUserController deviceSupportsMultipleUsers]( &OBJC_CLASS___AMSDMultiUserController,  "deviceSupportsMultipleUsers"))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDMultiUserController sharedController]( &OBJC_CLASS___AMSDMultiUserController,  "sharedController"));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 cloudContainer]);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 privateDatabase]);
    v42 = (void *)objc_claimAutoreleasedReturnValue( [v41 subscribeWithIdentifier:@"com.apple.amsaccountsd.multiuser.privateDatabaseSubscription"]);
    [v42 addSuccessBlock:&stru_1000D6198];

    v43 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDMultiUserController sharedController]( &OBJC_CLASS___AMSDMultiUserController,  "sharedController"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 cloudContainer]);
    v45 = (void *)objc_claimAutoreleasedReturnValue([v44 sharedDatabase]);
    v46 = (void *)objc_claimAutoreleasedReturnValue( [v45 subscribeWithIdentifier:@"com.apple.amsaccountsd.multiuser.sharedDatabaseSubscription"]);
    [v46 addSuccessBlock:&stru_1000D61B8];
  }
}

- (void)_setupNotifications
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000129D0;
  handler[3] = &unk_1000D61E0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v4, handler);
}

- (void)_setupAccountDataSync
{
  if (_os_feature_enabled_impl("AppleMediaServices", "AccountFlagsV2PolusEngine"))
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue( +[CachedServerDataService sharedService]( &OBJC_CLASS____TtC12amsaccountsd23CachedServerDataService,  "sharedService"));
    [v2 performOnStartup];
  }

- (void)_setupSignalHandlers
{
  id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  0LL);
  sigTermSource = self->_sigTermSource;
  self->_sigTermSource = v3;

  uint64_t v5 = self->_sigTermSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000132BC;
  handler[3] = &unk_1000D5AB0;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v5, handler);
  dispatch_resume((dispatch_object_t)self->_sigTermSource);
}

- (void)_handleCachedDataUpdate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[AMSRegulatoryEligibilityTask sharedInstance]( &OBJC_CLASS___AMSRegulatoryEligibilityTask,  "sharedInstance"));
  [v2 handleCachedDataUpdate];
}

- (void)_updateRegulatoryEligibility
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedRegulatoryEligibilityConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedRegulatoryEligibilityConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    uint64_t v7 = AMSLogKey(v5, v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v10 = objc_opt_class(self, v9);
    uint64_t v12 = v10;
    if (v8)
    {
      uint64_t v13 = AMSLogKey(v10, v11);
      self = (AMSDDaemonRunLoop *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v14 = (AMSDDaemonRunLoop *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [%@] ",  v12,  self));
    }

    else
    {
      uint64_t v14 = (AMSDDaemonRunLoop *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: ",  v10));
    }

    *(_DWORD *)buf = 138543362;
    unsigned int v18 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Updating regulatory eligibility",  buf,  0xCu);
    if (v8)
    {

      uint64_t v14 = self;
    }
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[AMSRegulatoryEligibilityTask sharedInstance]( &OBJC_CLASS___AMSRegulatoryEligibilityTask,  "sharedInstance"));
  id v16 = [v15 update];
}

- (void)_startXPC
{
  id v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDServiceConnection machServiceName](&OBJC_CLASS___AMSDServiceConnection, "machServiceName"));
  BOOL v5 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", v4);

  -[NSXPCListener setDelegate:](v5, "setDelegate:", self);
  -[NSXPCListener resume](v5, "resume");
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (os_unfair_lock_s)connectionsLock
{
  return self->_connectionsLock;
}

- (void).cxx_destruct
{
}

@end