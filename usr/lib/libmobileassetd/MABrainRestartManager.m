@interface MABrainRestartManager
+ (id)sharedInstance;
- (MABrainRestartManager)init;
- (OS_dispatch_queue)operationsQueue;
- (SUCoreLog)logger;
- (void)handleSignal:(int)a3;
- (void)quiesceAndRestartMobileAsset;
- (void)quiesceMobileAsset;
- (void)setOperationsQueue:(id)a3;
- (void)setupSignalHandlers;
@end

@implementation MABrainRestartManager

- (MABrainRestartManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MABrainRestartManager;
  v2 = -[MABrainRestartManager init](&v8, "init");
  if (v2)
  {
    v3 = -[SUCoreLog initWithCategory:](objc_alloc(&OBJC_CLASS___SUCoreLog), "initWithCategory:", @"MAB-RESTART");
    logger = v2->_logger;
    v2->_logger = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MobileAsset.MABrain.restartmanager", 0LL);
    operationsQueue = v2->_operationsQueue;
    v2->_operationsQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_14);
  }
  return (id)sharedInstance_singleton;
}

void __39__MABrainRestartManager_sharedInstance__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MABrainRestartManager);
  v2 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v1;
}

- (void)handleSignal:(int)a3
{
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MABrainRestartManager operationsQueue](self, "operationsQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __38__MABrainRestartManager_handleSignal___block_invoke;
  v6[3] = &unk_34E950;
  int v7 = a3;
  v6[4] = self;
  dispatch_sync(v5, v6);
}

void __38__MABrainRestartManager_handleSignal___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2 == 15)
  {
    if (v5)
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[MAB]: Received SIGTERM", (uint8_t *)v7, 2u);
    }

    [*(id *)(a1 + 32) quiesceMobileAsset];
    exit(0);
  }

  if (v5)
  {
    int v6 = *(_DWORD *)(a1 + 40);
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "[MAB]: Signal(%d) is not currently handled. Nothing to do",  (uint8_t *)v7,  8u);
  }
}

- (void)quiesceMobileAsset
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MABrainRestartManager operationsQueue](self, "operationsQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MABrainRestartManager logger](self, "logger"));
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 oslog]);

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[MAB]: Asking autoControlManager to terminate", v6, 2u);
  }

  +[MADAutoAssetControlManager shutdown](&OBJC_CLASS___MADAutoAssetControlManager, "shutdown");
}

- (void)setupSignalHandlers
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MABrainRestartManager operationsQueue](self, "operationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __44__MABrainRestartManager_setupSignalHandlers__block_invoke;
  block[3] = &unk_34DBC0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __44__MABrainRestartManager_setupSignalHandlers__block_invoke(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __44__MABrainRestartManager_setupSignalHandlers__block_invoke_2;
  block[3] = &unk_34DBC0;
  block[4] = *(void *)(a1 + 32);
  if (PALLAS_PRE_SOFTWARE_UPDATE_ASSET_STAGING_POLICY_OPTIONAL_VALUE_block_invoke_setupSignalHandlersDispatchOnce != -1) {
    dispatch_once( &PALLAS_PRE_SOFTWARE_UPDATE_ASSET_STAGING_POLICY_OPTIONAL_VALUE_block_invoke_setupSignalHandlersDispatchOnce,  block);
  }
}

void __44__MABrainRestartManager_setupSignalHandlers__block_invoke_2(uint64_t a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  for (uint64_t i = 0LL; i != 3; ++i)
  {
    int v5 = PALLAS_PRE_SOFTWARE_UPDATE_ASSET_STAGING_POLICY_OPTIONAL_VALUE_block_invoke_2_signals[i];
    int v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v5, 0LL, v3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __44__MABrainRestartManager_setupSignalHandlers__block_invoke_3;
    v9[3] = &unk_34E950;
    v9[4] = *(void *)(a1 + 32);
    int v10 = v5;
    dispatch_source_set_event_handler(v6, v9);
    dispatch_resume(v6);
    int v7 = (void *)PALLAS_PRE_SOFTWARE_UPDATE_ASSET_STAGING_POLICY_OPTIONAL_VALUE_block_invoke_2_signalSources[i];
    PALLAS_PRE_SOFTWARE_UPDATE_ASSET_STAGING_POLICY_OPTIONAL_VALUE_block_invoke_2_signalSources[i] = v6;
    objc_super v8 = v6;

    signal(v5, (void (__cdecl *)(int))((char *)&dword_0 + 1));
  }
}

id __44__MABrainRestartManager_setupSignalHandlers__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSignal:*(unsigned int *)(a1 + 40)];
}

- (void)quiesceAndRestartMobileAsset
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MABrainRestartManager operationsQueue](self, "operationsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __53__MABrainRestartManager_quiesceAndRestartMobileAsset__block_invoke;
  block[3] = &unk_34DBC0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __53__MABrainRestartManager_quiesceAndRestartMobileAsset__block_invoke(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 oslog]);

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[MAB]: Attempting to quiesce MobileAsset", buf, 2u);
  }

  [*(id *)(a1 + 32) quiesceMobileAsset];
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 oslog]);

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[MAB]: Done with quiesce. Restarting mobileassetd", v6, 2u);
  }

  exit(0);
}

- (OS_dispatch_queue)operationsQueue
{
  return self->_operationsQueue;
}

- (void)setOperationsQueue:(id)a3
{
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
}

@end