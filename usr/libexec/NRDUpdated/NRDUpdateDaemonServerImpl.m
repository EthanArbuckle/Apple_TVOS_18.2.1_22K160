@interface NRDUpdateDaemonServerImpl
+ (id)sharedInstance;
- (BOOL)_isBrainRelaunchRequired:(id)a3;
- (BOOL)allowBackgroundActivity;
- (BOOL)isConnectionEntitled:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NRDUpdateDCore)core;
- (NRDUpdateDaemonServerImpl)init;
- (NSError)completedWithError;
- (NSError)needsRelaunchError;
- (OS_dispatch_queue)updateQueue;
- (void)getNRDUpdateBrainEndpoint:(id)a3;
- (void)requestExit:(int)a3 reason:(id)a4;
- (void)requestExit:(int)a3 reason:(id)a4 relaunchError:(id)a5;
- (void)runUntilExit;
- (void)setCompletedWithError:(id)a3;
- (void)setCore:(id)a3;
- (void)setNeedsRelaunchError:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)update:(id)a3;
- (void)updateCompleted:(id)a3;
- (void)updateHelper:(id)a3 callback:(id)a4;
@end

@implementation NRDUpdateDaemonServerImpl

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_1);
  }
  return (id)sharedInstance___instance;
}

void __43__NRDUpdateDaemonServerImpl_sharedInstance__block_invoke(id a1)
{
  v1 = objc_autoreleasePoolPush();
  v2 = objc_alloc_init(&OBJC_CLASS___NRDUpdateDaemonServerImpl);
  v3 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v2;

  objc_autoreleasePoolPop(v1);
}

- (BOOL)allowBackgroundActivity
{
  return 1;
}

- (void)runUntilExit
{
  unsigned int v3 = -[NRDUpdateDaemonServerImpl allowBackgroundActivity](self, "allowBackgroundActivity");
  v4 = objc_autoreleasePoolPush();
  +[NSXPCListener enableTransactions](&OBJC_CLASS___NSXPCListener, "enableTransactions");
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.NRDUpdated.connectionQueue", &_dispatch_queue_attr_concurrent);
  v6 = (void *)__connectionQueue;
  __connectionQueue = (uint64_t)v5;

  v7 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.mobile.NRDUpdated");
  v8 = (void *)__listener;
  __listener = (uint64_t)v7;

  [(id)__listener setDelegate:self];
  [(id)__listener _setQueue:__connectionQueue];
  v9 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  @"com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download");
  -[NSBackgroundActivityScheduler setPreregistered:](v9, "setPreregistered:", 1LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler description](v9, "description"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke;
  v28[3] = &unk_100014818;
  char v29 = v3;
  v28[4] = self;
  v11 = objc_retainBlock(v28);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_199;
  v25[3] = &unk_100014840;
  id v12 = v10;
  id v26 = v12;
  v27 = @"com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download";
  -[NSBackgroundActivityScheduler setCheckInHandler:](v9, "setCheckInHandler:", v25);
  if (v3)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_200;
    v21[3] = &unk_100014868;
    id v22 = v12;
    v23 = @"com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download";
    v24 = v11;
    -[NSBackgroundActivityScheduler scheduleWithBlock:](v9, "scheduleWithBlock:", v21);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
  v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_202;
  v19 = &unk_100014890;
  id v20 = v11;
  v15 = v11;
  dispatch_async(v14, &v16);

  objc_autoreleasePoolPop(v4);
  -[NRDUpdateDaemonServerImpl _run](self, "_run", v16, v17, v18, v19);
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472LL;
  v1[2] = __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_2;
  v1[3] = &unk_100014818;
  char v2 = *(_BYTE *)(a1 + 40);
  v1[4] = *(void *)(a1 + 32);
  if (__listener_block_invoke_onceToken != -1) {
    dispatch_once(&__listener_block_invoke_onceToken, v1);
  }
}

id __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_2(uint64_t a1)
{
  char v2 = (const __CFBoolean *)MGCopyAnswer(@"SigningFuse", 0LL);
  if (v2 != kCFBooleanFalse) {
    goto LABEL_3;
  }
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  *(_OWORD *)buf = 0u;
  __int128 v24 = 0u;
  size_t v22 = 256LL;
  if (sysctlbyname("kern.bootargs", buf, &v22, 0LL, 0LL))
  {
LABEL_3:
    CFRelease(v2);
    unsigned int v3 = (_BYTE *)(a1 + 40);
    if (*(_BYTE *)(a1 + 40)) {
      goto LABEL_4;
    }
LABEL_18:
    id v18 = nrdSharedLogger();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Skipping RecoveryOSUpdateBrain launch on startup because background activity is not allowed.";
      goto LABEL_20;
    }

    goto LABEL_21;
  }

  v16 = strstr((const char *)buf, "msu_nrd_brain_no_launch=1");
  CFRelease(v2);
  unsigned int v3 = (_BYTE *)(a1 + 40);
  if (!*(_BYTE *)(a1 + 40)) {
    goto LABEL_18;
  }
  if (v16)
  {
    id v17 = nrdSharedLogger();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Skipping RecoveryOSUpdateBrain launch on startup due to nvram boot-arg msu_nrd_brain_no_launch=1";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_196(id a1, NSError *a2)
{
  char v2 = a2;
  id v3 = nrdSharedLogger();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_196_cold_1((uint64_t)v2, v5, v6, v7, v8, v9, v10, v11);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "RecoveryOSUpdateBrain launch completed successfully",  v12,  2u);
  }
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_199(uint64_t a1)
{
  id v2 = nrdSharedLogger();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ check-in.",  (uint8_t *)&v10,  0x16u);
  }

  id v6 = nrdSharedLogger();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ check-in complete.",  (uint8_t *)&v10,  0x16u);
  }
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_200(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = nrdSharedLogger();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v12 = 138543618;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ fired.",  (uint8_t *)&v12,  0x16u);
  }

  (*(void (**)(void))(a1[6] + 16LL))();
  id v8 = nrdSharedLogger();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[4];
    uint64_t v11 = a1[5];
    int v12 = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ completed.",  (uint8_t *)&v12,  0x16u);
  }

  v3[2](v3, 1LL);
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_202(uint64_t a1)
{
  id v2 = nrdSharedLogger();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Startup task executing", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  id v4 = nrdSharedLogger();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Startup task execution complete.", v6, 2u);
  }
}

- (NRDUpdateDaemonServerImpl)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NRDUpdateDaemonServerImpl;
  id v2 = -[NRDUpdateDaemonServerImpl init](&v8, "init");
  if (v2)
  {
    id v3 = -[NRDUpdateDCore initWithDelegate:](objc_opt_new(&OBJC_CLASS___NRDUpdateDCore), "initWithDelegate:", v2);
    -[NRDUpdateDaemonServerImpl setCore:](v2, "setCore:", v3);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NRDUpdateDServer.update", 0LL);
    -[NRDUpdateDaemonServerImpl setUpdateQueue:](v2, "setUpdateQueue:", v4);

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
    updateSemaphore = v2->_updateSemaphore;
    v2->_updateSemaphore = (OS_dispatch_semaphore *)v5;
  }

  return v2;
}

- (void)updateHelper:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDaemonServerImpl updateQueue](self, "updateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __51__NRDUpdateDaemonServerImpl_updateHelper_callback___block_invoke;
  block[3] = &unk_1000148B8;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __51__NRDUpdateDaemonServerImpl_updateHelper_callback___block_invoke(uint64_t a1)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) needsRelaunchError]);
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) core]);
    [v3 setUpdateOptions:v2];

    dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) core]);
    [v4 performUpdate:0];

    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8LL), 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completedWithError]);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (void)update:(id)a3
{
}

- (BOOL)_isBrainRelaunchRequired:(id)a3
{
  id v3 = a3;
  if (!v3) {
    return 0;
  }
  dispatch_queue_t v4 = v3;
  do
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    if ([v5 isEqualToString:@"NRDUpdateErrorDomain"])
    {
      id v6 = [v4 code];

      if (v6 == (id)112)
      {
        BOOL v9 = 1;
        goto LABEL_10;
      }
    }

    else
    {
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    dispatch_queue_t v4 = (void *)v8;
  }

  while (v8);
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (void)updateCompleted:(id)a3
{
  id v4 = a3;
  -[NRDUpdateDaemonServerImpl setCompletedWithError:](self, "setCompletedWithError:", v4);
  id v5 = nrdSharedLogger();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDaemonServerImpl updateCompleted:].cold.1((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "update completed successfully", v14, 2u);
  }

  if (-[NRDUpdateDaemonServerImpl _isBrainRelaunchRequired:](self, "_isBrainRelaunchRequired:", v4)) {
    -[NRDUpdateDaemonServerImpl requestExit:reason:relaunchError:]( self,  "requestExit:reason:relaunchError:",  0LL,  @"NRD brain has downloaded a new brain (via NSError)",  v4);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_updateSemaphore);
}

- (void)requestExit:(int)a3 reason:(id)a4
{
}

- (void)requestExit:(int)a3 reason:(id)a4 relaunchError:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = nrdSharedLogger();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Daemon exit requested for reason: %{public}@",  buf,  0xCu);
  }

  if (v9) {
    -[NRDUpdateDaemonServerImpl setNeedsRelaunchError:](self, "setNeedsRelaunchError:", v9);
  }
  uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDaemonServerImpl updateQueue](self, "updateQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __62__NRDUpdateDaemonServerImpl_requestExit_reason_relaunchError___block_invoke;
  v14[3] = &unk_1000148E0;
  int v16 = a3;
  id v15 = v8;
  id v13 = v8;
  dispatch_async(v12, v14);
}

void __62__NRDUpdateDaemonServerImpl_requestExit_reason_relaunchError___block_invoke(uint64_t a1)
{
  id v2 = nrdSharedLogger();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v4;
    __int16 v7 = 2114;
    uint64_t v8 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Exiting with status:%d for reason:%{public}@",  (uint8_t *)v6,  0x12u);
  }

  exit(*(_DWORD *)(a1 + 40));
}

- (void)getNRDUpdateBrainEndpoint:(id)a3
{
  int v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDaemonServerImpl core](self, "core"));

  if (!v5)
  {
    NSErrorUserInfoKey v15 = NSDebugDescriptionErrorKey;
    int v16 = @"core is not initialized";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    uint64_t v11 = 604LL;
LABEL_6:
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdatedDomain",  v11,  v10));
    v4[2](v4, 0LL, v12);

    goto LABEL_7;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDaemonServerImpl core](self, "core"));
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 runningBrain]);

  if (!v7)
  {
    NSErrorUserInfoKey v13 = NSDebugDescriptionErrorKey;
    __int16 v14 = @"no running brain";
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    uint64_t v11 = 605LL;
    goto LABEL_6;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDaemonServerImpl core](self, "core"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 runningBrain]);
  [v9 getListenerEndpoint:v4];

LABEL_7:
}

- (BOOL)isConnectionEntitled:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.allow-NRDUpdated"]);
  if (!v3)
  {
    id v6 = nrdSharedLogger();
    __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDaemonServerImpl isConnectionEntitled:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_11;
  }

  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {
    id v15 = nrdSharedLogger();
    __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDaemonServerImpl isConnectionEntitled:].cold.3(v7, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_11;
  }

  if (([v3 BOOLValue] & 1) == 0)
  {
    id v23 = nrdSharedLogger();
    __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDaemonServerImpl isConnectionEntitled:].cold.2(v7, v24, v25, v26, v27, v28, v29, v30);
    }
LABEL_11:

    BOOL v5 = 0;
    goto LABEL_12;
  }

  BOOL v5 = 1;
LABEL_12:

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = nrdSharedLogger();
  __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection", buf, 2u);
  }

  BOOL v8 = -[NRDUpdateDaemonServerImpl isConnectionEntitled:](self, "isConnectionEntitled:", v5);
  if (v8)
  {
    [v5 _setQueue:__connectionQueue];
    [v5 setInterruptionHandler:&__block_literal_global_220];
    [v5 setInvalidationHandler:&__block_literal_global_222];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___NRDUpdatedProtocol));
    [v5 setExportedInterface:v9];
    [v5 setExportedObject:self];
    [v5 resume];
    id v10 = nrdSharedLogger();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection resumed", v22, 2u);
    }
  }

  else
  {
    id v12 = nrdSharedLogger();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDaemonServerImpl listener:shouldAcceptNewConnection:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    [v5 invalidate];
  }

  return v8;
}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke(id a1)
{
  id v1 = nrdSharedLogger();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_cold_1( v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9);
  }
}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_221(id a1)
{
  id v1 = nrdSharedLogger();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_221_cold_1( v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9);
  }
}

- (NRDUpdateDCore)core
{
  return self->_core;
}

- (void)setCore:(id)a3
{
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (NSError)completedWithError
{
  return self->_completedWithError;
}

- (void)setCompletedWithError:(id)a3
{
}

- (NSError)needsRelaunchError
{
  return self->_needsRelaunchError;
}

- (void)setNeedsRelaunchError:(id)a3
{
}

- (void).cxx_destruct
{
}

void __41__NRDUpdateDaemonServerImpl_runUntilExit__block_invoke_196_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)updateCompleted:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)isConnectionEntitled:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)isConnectionEntitled:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)isConnectionEntitled:(uint64_t)a3 .cold.3( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __64__NRDUpdateDaemonServerImpl_listener_shouldAcceptNewConnection___block_invoke_221_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end