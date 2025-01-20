@interface AXMServiceInstance
- (AXMIdleManager)idleManager;
- (AXMServiceInstance)init;
- (AXMServiceXPCServer)xpcServer;
- (NSMutableDictionary)engineCache;
- (id)_cachedEngineForEngine:(id)a3;
- (void)_removeEngineFromCache:(id)a3;
- (void)prewarmVisionEngineService;
- (void)run;
- (void)setEngineCache:(id)a3;
- (void)setIdleManager:(id)a3;
- (void)setXpcServer:(id)a3;
- (void)visionEngine:(id)a3 evaluateSource:(id)a4 context:(id)a5 options:(int64_t)a6 result:(id)a7;
- (void)willBecomeIdle:(id)a3 completion:(id)a4;
@end

@implementation AXMServiceInstance

- (AXMServiceInstance)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AXMServiceInstance;
  v2 = -[AXMServiceInstance init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    -[AXMServiceInstance setEngineCache:](v2, "setEngineCache:", v3);

    v4 = objc_alloc_init(&OBJC_CLASS___AXMIdleManager);
    -[AXMServiceInstance setIdleManager:](v2, "setIdleManager:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXMServiceInstance idleManager](v2, "idleManager"));
    [v5 setDelegate:v2];
  }

  return v2;
}

- (void)run
{
  uint64_t v3 = AXMediaLogService(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "*** AXMediaUtilities service starting up ***",  buf,  2u);
  }

  v5 = objc_alloc_init(&OBJC_CLASS___AXMServiceXPCServer);
  -[AXMServiceInstance setXpcServer:](self, "setXpcServer:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AXMServiceInstance xpcServer](self, "xpcServer"));
  [v6 setDelegate:self];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXMServiceInstance xpcServer](self, "xpcServer"));
  [v7 run];

  uint64_t v9 = AXMediaLogService(v8);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "*** AXMediaUtilities service about to exit ***",  v11,  2u);
  }
}

- (id)_cachedEngineForEngine:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AXMServiceInstance engineCache](self, "engineCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (!v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXMServiceInstance engineCache](self, "engineCache"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    [v8 setObject:v4 forKey:v9];

    id v7 = v4;
  }

  return v7;
}

- (void)_removeEngineFromCache:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[AXMServiceInstance engineCache](self, "engineCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  [v6 removeObjectForKey:v5];
}

- (void)prewarmVisionEngineService
{
  uint64_t v2 = AXMediaLogService(self, a2);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Service did receive prewarm message", v4, 2u);
  }
}

- (void)visionEngine:(id)a3 evaluateSource:(id)a4 context:(id)a5 options:(int64_t)a6 result:(id)a7
{
  char v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = objc_autoreleasePoolPush();
  if ((v8 & 1) != 0) {
    -[AXMServiceInstance _removeEngineFromCache:](self, "_removeEngineFromCache:", v12);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AXMServiceInstance _cachedEngineForEngine:](self, "_cachedEngineForEngine:", v12));

  v18 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v17 sourceNodeWithIdentifier:v18]);

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v14 analysisOptions]);
    id v21 = [v20 clientID];

    if (v21 == (id)1)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[AXMServiceInstance idleManager](self, "idleManager"));
      [v22 voiceOverActivityOccurred];
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = __73__AXMServiceInstance_visionEngine_evaluateSource_context_options_result___block_invoke;
    v27[3] = &unk_100008240;
    id v28 = v15;
    [v19 triggerWithContext:v14 cacheKey:0 resultHandler:v27];
  }

  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([0 identifier]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
    uint64_t v23 = _AXMMakeError(0LL, @"No source found with identifier: %@. engineID:%@");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0LL, v24);
  }

  objc_autoreleasePoolPop(v16);
}

uint64_t __73__AXMServiceInstance_visionEngine_evaluateSource_context_options_result___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)willBecomeIdle:(id)a3 completion:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke;
  v5[3] = &unk_1000082B8;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async(&_dispatch_main_q, v5);
}

void __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = AXMediaLogService(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "notified that service will go idle. purging engine resources",  buf,  2u);
  }

  dispatch_group_t v4 = dispatch_group_create();
  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) engineCache]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_22;
  v10[3] = &unk_100008290;
  dispatch_group_t v11 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_3;
  block[3] = &unk_1000082B8;
  id v7 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v9 = v7;
  dispatch_group_notify(v6, &_dispatch_main_q, block);
}

void __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  dispatch_group_t v4 = *(dispatch_group_s **)(a1 + 32);
  id v5 = a3;
  dispatch_group_enter(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_2;
  v6[3] = &unk_100008268;
  id v7 = *(id *)(a1 + 32);
  [v5 purgeResources:v6];
}

void __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_2(uint64_t a1)
{
}

uint64_t __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = AXMediaLogService(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "did purge engine resources", v6, 2u);
  }

  AXMDeleteCoreImageContext();
  dispatch_group_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) engineCache]);
  [v4 removeAllObjects];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (AXMServiceXPCServer)xpcServer
{
  return self->_xpcServer;
}

- (void)setXpcServer:(id)a3
{
}

- (NSMutableDictionary)engineCache
{
  return self->_engineCache;
}

- (void)setEngineCache:(id)a3
{
}

- (AXMIdleManager)idleManager
{
  return self->_idleManager;
}

- (void)setIdleManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end