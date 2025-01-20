@interface PLClientLogger
+ (BOOL)isMessageOnDeviceDisabled;
+ (id)sharedInstance;
- (BOOL)batchDropMessages;
- (BOOL)batchedTimerInFlight;
- (BOOL)clientDebug;
- (BOOL)forceBatching;
- (BOOL)talkToPowerlogHelper;
- (NSMutableArray)batchedTaskCache;
- (NSMutableDictionary)dynamicCache;
- (NSMutableDictionary)eventFilterSaved;
- (NSMutableDictionary)pendingTaskCache;
- (NSMutableDictionary)permissionCache;
- (NSSet)batchingClientAllowlist;
- (NSSet)batchingKeysAllowlist;
- (NSSet)curatedBatchingList;
- (NSString)processName;
- (OS_dispatch_queue)adaptivePermissionWorkQueue;
- (OS_dispatch_queue)batchFlushQueue;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_queue)xpcConnectionHelperQueue;
- (OS_dispatch_queue)xpcConnectionQueue;
- (OS_xpc_object)xpcConnection;
- (OS_xpc_object)xpcConnectionHelper;
- (PLClientLogger)init;
- (id)buildMessageForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
- (id)cacheForKey:(id)a3;
- (id)pendingTasksForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5;
- (id)queryForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
- (id)xpcConnectionWithClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
- (id)xpcSendMessageWithReply:(id)a3 withClientID:(signed __int16)a4 withKey:(id)a5 withPayload:(id)a6;
- (int)batchMessagesSentCount;
- (int)batchSizeForClientID:(signed __int16)a3;
- (int)batchedDropMessageCount;
- (int)shouldLogNowForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5 withFilterInterval:(double)a6;
- (signed)blockedPermissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 withTimeout:(unint64_t)a6;
- (signed)cachedPermissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5;
- (void)addToBatchedTaskCacheForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5 withPayload:(id)a6;
- (void)addToPendingTaskCacheForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5 withPayload:(id)a6;
- (void)batchTasksCacheFlush;
- (void)clearBatchedTaskCache;
- (void)clearBatchedTaskCachePPS;
- (void)clearCache;
- (void)init;
- (void)logForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
- (void)logLaterForClientID:(signed __int16)a3 withKey:(id)a4 withFilterInterval:(double)a5;
- (void)logStateCaches;
- (void)logWithCurrentDateForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
- (void)permissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 completion:(id)a6;
- (void)powerlogStateChanged;
- (void)sendBatchToPPS;
- (void)setAdaptivePermissionWorkQueue:(id)a3;
- (void)setBatchDropMessages:(BOOL)a3;
- (void)setBatchFlushQueue:(id)a3;
- (void)setBatchMessagesSentCount:(int)a3;
- (void)setBatchedDropMessageCount:(int)a3;
- (void)setBatchedTaskCache:(id)a3;
- (void)setBatchedTimerInFlight:(BOOL)a3;
- (void)setCachePermission:(signed __int16)a3 ForClientID:(signed __int16)a4 withKey:(id)a5 withType:(id)a6;
- (void)setClientDebug:(BOOL)a3;
- (void)setDynamicCache:(id)a3;
- (void)setEventFilterSaved:(id)a3;
- (void)setForceBatching:(BOOL)a3;
- (void)setPendingTaskCache:(id)a3;
- (void)setPermissionCache:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setTalkToPowerlogHelper:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcConnectionHelper:(id)a3;
- (void)setXpcConnectionHelperQueue:(id)a3;
- (void)setXpcConnectionQueue:(id)a3;
- (void)xpcSendMessage:(id)a3 withClientID:(signed __int16)a4 withKey:(id)a5 withPayload:(id)a6;
- (void)xpcSendMessageWithRateLimitingforClient:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5;
@end

@implementation PLClientLogger

+ (BOOL)isMessageOnDeviceDisabled
{
  if (isMessageOnDeviceDisabled_onceToken != -1) {
    dispatch_once(&isMessageOnDeviceDisabled_onceToken, &__block_literal_global_3_0);
  }
  return disableMessageOnDevice;
}

void __43__PLClientLogger_isMessageOnDeviceDisabled__block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  int v1 = [v0 intValue];
  if (v0) {
    CFRelease(v0);
  }
  disableMessageOnDevice = v1 == -1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  }
  return (id)sharedInstance__clientLogger;
}

void __32__PLClientLogger_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x186E3D3CC]();
  int v1 = objc_alloc_init(&OBJC_CLASS___PLClientLogger);
  v2 = (void *)sharedInstance__clientLogger;
  sharedInstance__clientLogger = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (PLClientLogger)init
{
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___PLClientLogger;
  v2 = -[PLClientLogger init](&v54, sel_init);
  v3 = v2;
  if (v2)
  {
    disableMessageOnDevice = 0;
    v2->_talkToPowerlogHelper = 0;
    PLLogClientLogging();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v3->_clientDebug = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_t v7 = dispatch_queue_create("PLClientLoggingWorkQueue", v6);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v10 = dispatch_queue_create("PLClientLoggingAdaptivePermissionWorkQueue", v9);
    adaptivePermissionWorkQueue = v3->_adaptivePermissionWorkQueue;
    v3->_adaptivePermissionWorkQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("PLClientLoggingFlushQueue", v6);
    batchFlushQueue = v3->_batchFlushQueue;
    v3->_batchFlushQueue = (OS_dispatch_queue *)v12;

    [MEMORY[0x1896079D8] processInfo];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 processName];
    processName = v3->_processName;
    v3->_processName = (NSString *)v15;

    uint64_t v17 = objc_opt_new();
    permissionCache = v3->_permissionCache;
    v3->_permissionCache = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    pendingTaskCache = v3->_pendingTaskCache;
    v3->_pendingTaskCache = (NSMutableDictionary *)v19;

    uint64_t v21 = objc_opt_new();
    batchedTaskCache = v3->_batchedTaskCache;
    v3->_batchedTaskCache = (NSMutableArray *)v21;

    uint64_t v23 = objc_opt_new();
    dynamicCache = v3->_dynamicCache;
    v3->_dynamicCache = (NSMutableDictionary *)v23;

    v25 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3->_dynamicCache,  "setObject:forKeyedSubscript:",  v25,  @"kPLDefault");

    v26 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3->_dynamicCache,  "setObject:forKeyedSubscript:",  v26,  @"kPLCuratedBatchingListCache");

    uint64_t v27 = objc_opt_new();
    eventFilterSaved = v3->_eventFilterSaved;
    v3->_eventFilterSaved = (NSMutableDictionary *)v27;

    *(_WORD *)&v3->_batchedTimerInFlight = 0;
    v3->_batchedDropMessageCount = 0;
    v3->_batchDropMessages = 1;
    uint64_t v29 = objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  &unk_189EA45F8,  &unk_189EA4610,  &unk_189EA4628,  &unk_189EA4640,  &unk_189EA4658,  &unk_189EA4670,  &unk_189EA4688,  &unk_189EA46A0,  &unk_189EA46B8,  &unk_189EA46D0,  &unk_189EA46E8,  0);
    batchingClientAllowlist = v3->_batchingClientAllowlist;
    v3->_batchingClientAllowlist = (NSSet *)v29;

    uint64_t v31 = objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  @"BackgroundProcessing::FeatureCheckpoint",  @"BackgroundProcessing::SystemConditionsBattery",  @"BackgroundProcessing::SystemConditionsInUseOrMotion",  @"BackgroundProcessing::SystemConditionsNetwork",  @"BackgroundProcessing::SystemConditionsOther",  @"BackgroundProcessing::SystemConditionsPowerManagement",  @"BackgroundProcessing::TaskCheckpoint",  @"BackgroundProcessing::TaskWorkload",  @"GenerativeFunctionMetrics::SmartReplySession",  @"GenerativeFunctionMetrics::Summarization",  @"GenerativeFunctionMetrics::appleDiffusion",  @"GenerativeFunctionMetrics::assetLoad",  @"GenerativeFunctionMetrics::mmExecuteRequest",  @"GenerativeFunctionMetrics::tgiExecuteRequest",  @"BatteryIntelligence::BatteryHealthDelta",  @"XPCMetrics::OngoingRestore",  0);
    curatedBatchingList = v3->_curatedBatchingList;
    v3->_curatedBatchingList = (NSSet *)v31;

    v3->_batchMessagesSentCount = 0;
    uint64_t v33 = objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  @"ConfigMetrics::BuddyData",  @"ApplicationMetrics::RemoteControlSession",  @"Button::CaptureButtonAction",  @"Button::CaptureButtonConfig",  0);
    batchingKeysAllowlist = v3->_batchingKeysAllowlist;
    v3->_batchingKeysAllowlist = (NSSet *)v33;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v35 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v36 = dispatch_queue_create("PLCLientLoggingConnectionQueue", v35);
    xpcConnectionQueue = v3->_xpcConnectionQueue;
    v3->_xpcConnectionQueue = (OS_dispatch_queue *)v36;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v38 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v39 = dispatch_queue_create("PLCLientLoggingConnectionHelperQueue", v38);
    xpcConnectionHelperQueue = v3->_xpcConnectionHelperQueue;
    v3->_xpcConnectionHelperQueue = (OS_dispatch_queue *)v39;

    int out_token = -1;
    -[PLClientLogger workQueue](v3, "workQueue");
    v41 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = notify_register_dispatch( "com.apple.powerlog.state_changed",  &out_token,  v41,  &__block_literal_global_80);

    if ((_DWORD)v38 && -[PLClientLogger clientDebug](v3, "clientDebug"))
    {
      PLLogClientLogging();
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger init].cold.3();
      }
    }

    [NSString stringWithFormat:@"%@.ProcessName.%@", @"com.apple.powerlog.state_changed", v3->_processName];
    id v43 = v52 = -1;
    v44 = (const char *)[v43 UTF8String];
    -[PLClientLogger workQueue](v3, "workQueue");
    v45 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    LODWORD(v44) = notify_register_dispatch(v44, &v52, v45, &__block_literal_global_87_0);

    if ((_DWORD)v44 && -[PLClientLogger clientDebug](v3, "clientDebug"))
    {
      PLLogClientLogging();
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger init].cold.2();
      }
    }

    int v51 = -1;
    -[PLClientLogger workQueue](v3, "workQueue");
    v47 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint32_t v48 = notify_register_dispatch("com.apple.powerlog.clientPermissionState", &v51, v47, &__block_literal_global_90_0);

    if (v48 && -[PLClientLogger clientDebug](v3, "clientDebug"))
    {
      PLLogClientLogging();
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger init].cold.1();
      }
    }
  }

  return v3;
}

void __22__PLClientLogger_init__block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 powerlogStateChanged];
}

void __22__PLClientLogger_init__block_invoke_86()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 powerlogStateChanged];
}

void __22__PLClientLogger_init__block_invoke_89()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 logStateCaches];
}

- (void)logStateCaches
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 permissionCache];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 pendingTaskCache];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 batchedTaskCache];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_12_0( &dword_186654000,  v6,  v7,  "State:%@ ***\npermissionCache=%@\n\npendingTaskCache=%@\n\nbatchedTaskCache=%@\n",  v8,  v9,  v10,  v11,  v12);

  OUTLINED_FUNCTION_11_0();
}

- (void)powerlogStateChanged
{
}

void __38__PLClientLogger_powerlogStateChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x186E3D3CC]();
  if ([*(id *)(a1 + 32) clientDebug])
  {
    [NSString stringWithFormat:@"%@.ClientID.%@", @"com.apple.powerlog.state_changed", v3];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogClientLogging();
    uint8_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __38__PLClientLogger_powerlogStateChanged__block_invoke_cold_1();
    }
  }

  [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"PLClientPermissionToken"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 objectForKeyedSubscript:@"PLClientPermissionToken"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    notify_cancel([v10 intValue]);
  }

  objc_autoreleasePoolPop(v4);
}

- (id)buildMessageForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_sync_enter(@"___BuildMessageSync___");
  uint64_t v10 = (void *)objc_opt_new();
  [MEMORY[0x189607968] numberWithShort:v6];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setObject:v11 forKeyedSubscript:@"clientID"];

  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:@"event"];
  }
  if (v9) {
    [v10 setObject:v9 forKeyedSubscript:@"content"];
  }
  -[PLClientLogger processName](self, "processName");
  uint8_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setObject:v12 forKeyedSubscript:@"process-name"];

  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger buildMessageForClientID:withKey:withPayload:].cold.1();
    }
  }

  objc_sync_exit(@"___BuildMessageSync___");

  return v10;
}

- (void)setCachePermission:(signed __int16)a3 ForClientID:(signed __int16)a4 withKey:(id)a5 withType:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v10 = a5;
  id v11 = a6;
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    uint8_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v18[0] = 67109890;
      v18[1] = v8;
      __int16 v19 = 1024;
      int v20 = v7;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_debug_impl( &dword_186654000,  v12,  OS_LOG_TYPE_DEBUG,  "setCachePermission:%d ForClientID:%d withKey:%@ withType:%@",  (uint8_t *)v18,  0x22u);
    }
  }

  objc_sync_enter(@"___CacheSync___");
  [MEMORY[0x189607968] numberWithShort:v8];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLClientLogger permissionCache](self, "permissionCache");
  [v14 objectForKeyedSubscript:v11];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithShort:v7];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 objectForKeyedSubscript:v16];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setObject:v13 forKeyedSubscript:v10];

  objc_sync_exit(@"___CacheSync___");
}

- (signed)cachedPermissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  [MEMORY[0x189607968] numberWithShort:v6];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(@"___CacheSync___");
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[PLClientLogger permissionCache](self, "permissionCache");
      uint8_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLClientLogger cachedPermissionForClientID:withKey:withType:].cold.3(v12, (uint64_t)v61, v11);
    }
  }
  v13 = -[PLClientLogger permissionCache](self, "permissionCache");
  [v13 objectForKeyedSubscript:v9];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v15 = v14 == 0LL;

  if (v15)
  {
    v16 = (void *)objc_opt_new();
    -[PLClientLogger permissionCache](self, "permissionCache");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setObject:v16 forKeyedSubscript:v9];
  }
  v18 = -[PLClientLogger permissionCache](self, "permissionCache");
  [v18 objectForKeyedSubscript:v9];
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 objectForKeyedSubscript:v10];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v21 = v20 == 0LL;

  if (v21)
  {
    context = (void *)MEMORY[0x186E3D3CC]();
    [NSString stringWithFormat:@"%@.ClientID.%d", @"com.apple.powerlog.state_changed", (int)v6];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger cachedPermissionForClientID:withKey:withType:].cold.2();
      }
    }

    out_token[0] = -1;
    id v24 = v22;
    uint64_t v25 = (const char *)[v24 UTF8String];
    -[PLClientLogger workQueue](self, "workQueue");
    v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = notify_register_dispatch(v25, out_token, v26, &__block_literal_global_107);

    uint64_t v27 = (void *)objc_opt_new();
    v28 = -[PLClientLogger permissionCache](self, "permissionCache");
    [v28 objectForKeyedSubscript:v9];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 setObject:v27 forKeyedSubscript:v10];

    if ((_DWORD)v25)
    {
      if (!-[PLClientLogger clientDebug](self, "clientDebug"))
      {
LABEL_18:

        objc_autoreleasePoolPop(context);
        goto LABEL_19;
      }

      PLLogClientLogging();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger cachedPermissionForClientID:withKey:withType:].cold.1();
      }
    }

    else
    {
      [MEMORY[0x189607968] numberWithInt:out_token[0]];
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      -[PLClientLogger permissionCache](self, "permissionCache");
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 objectForKeyedSubscript:v9];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v32 objectForKeyedSubscript:v10];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 setObject:v30 forKeyedSubscript:@"PLClientPermissionToken"];
    }

    goto LABEL_18;
  }

void __63__PLClientLogger_cachedPermissionForClientID_withKey_withType___block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 powerlogStateChanged];
}

- (void)addToPendingTaskCacheForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5 withPayload:(id)a6
{
  uint64_t v8 = a4;
  v39[3] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_sync_enter(@"___CacheSync___");
  [MEMORY[0x189607968] numberWithShort:v8];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  [v14 objectForKeyedSubscript:v10];
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v16 = (void *)objc_opt_new();
    -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 setObject:v16 forKeyedSubscript:v10];
  }
  v18 = -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  [v18 objectForKeyedSubscript:v10];
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 objectForKeyedSubscript:v13];
  int v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    BOOL v21 = (void *)objc_opt_new();
    -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 objectForKeyedSubscript:v10];
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 setObject:v21 forKeyedSubscript:v13];
  }

  -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 objectForKeyedSubscript:v10];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 objectForKeyedSubscript:v13];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 objectForKeyedSubscript:v11];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    v28 = (void *)objc_opt_new();
    -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 objectForKeyedSubscript:v10];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 objectForKeyedSubscript:v13];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 setObject:v28 forKeyedSubscript:v11];
  }

  v32 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v12 copyItems:1];
  -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 objectForKeyedSubscript:v10];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v34 objectForKeyedSubscript:v13];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v35 objectForKeyedSubscript:v11];
  dispatch_queue_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v36 addObject:v32];

  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
      -[PLClientLogger addToPendingTaskCacheForType:forClientID:forKey:withPayload:].cold.1(v38, (uint64_t)v39, v37);
    }
  }

  objc_sync_exit(@"___CacheSync___");
}

- (int)batchSizeForClientID:(signed __int16)a3
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__PLClientLogger_batchSizeForClientID___block_invoke;
  block[3] = &__block_descriptor_34_e5_v8__0l;
  signed __int16 v5 = a3;
  if (batchSizeForClientID__onceToken != -1) {
    dispatch_once(&batchSizeForClientID__onceToken, block);
  }
  if (batchSizeForClientID__batchSize) {
    return 60;
  }
  else {
    return 20;
  }
}

uint64_t __39__PLClientLogger_batchSizeForClientID___block_invoke(uint64_t result)
{
  batchSizeForClientID__batchSize = *(unsigned __int16 *)(result + 32) == 28;
  return result;
}

- (id)cacheForKey:(id)a3
{
  id v4 = a3;
  objc_sync_enter(@"___BatchCacheSync___");
  -[PLClientLogger curatedBatchingList](self, "curatedBatchingList");
  signed __int16 v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 containsObject:v4];

  -[PLClientLogger dynamicCache](self, "dynamicCache");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    [v7 objectForKeyedSubscript:@"kPLCuratedBatchingListCache"];
  }
  else {
    [v7 objectForKeyedSubscript:@"kPLDefault"];
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(@"___BatchCacheSync___");
  return v8;
}

- (void)addToBatchedTaskCacheForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5 withPayload:(id)a6
{
  uint64_t v9 = a4;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  objc_sync_enter(@"___BatchCacheSync___");
  if ((_DWORD)v9 != 110)
  {
    v14 = -[PLClientLogger batchedTaskCache](self, "batchedTaskCache");
LABEL_5:
    int v15 = -[PLClientLogger batchSizeForClientID:](self, "batchSizeForClientID:", v9);
    if ((_DWORD)v9 != 110) {
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  v14 = -[PLClientLogger cacheForKey:](self, "cacheForKey:", v12);
  -[PLClientLogger curatedBatchingList](self, "curatedBatchingList");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v6 containsObject:v12] & 1) == 0) {
    goto LABEL_5;
  }
  int v15 = 30;
LABEL_6:
  v16 = -[PLClientLogger curatedBatchingList](self, "curatedBatchingList");
  int v17 = [v16 containsObject:v12];

  if (v17)
  {
    if (-[PLClientLogger batchDropMessages](self, "batchDropMessages")
      && [v14 count] >= (unint64_t)v15)
    {
      if (-[PLClientLogger batchMessagesSentCount](self, "batchMessagesSentCount") < 4)
      {
        PLLogClientLogging();
        __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v26) = 0;
          _os_log_impl( &dword_186654000,  v23,  OS_LOG_TYPE_INFO,  "Dynamic cache reached the limit, flushing cache now",  (uint8_t *)&v26,  2u);
        }

        -[PLClientLogger setBatchMessagesSentCount:]( self,  "setBatchMessagesSentCount:",  -[PLClientLogger batchMessagesSentCount](self, "batchMessagesSentCount") + 1);
        -[PLClientLogger sendBatchToPPS](self, "sendBatchToPPS");
        -[PLClientLogger clearBatchedTaskCachePPS](self, "clearBatchedTaskCachePPS");
        -[PLClientLogger cacheForKey:](self, "cacheForKey:", v12);
        v18 = v14;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        [v14 lastObject];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PLLogClientLogging();
        __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v26 = 138412290;
          uint64_t v27 = v18;
          _os_log_impl( &dword_186654000,  v19,  OS_LOG_TYPE_INFO,  "Dynamic cache reached the limit, unable to flush, dropping last event %@",  (uint8_t *)&v26,  0xCu);
        }

        [v14 removeLastObject];
      }
    }

    goto LABEL_27;
  }

void *__78__PLClientLogger_addToBatchedTaskCacheForType_forClientID_forKey_withPayload___block_invoke()
{
  return &unk_189EA4A60;
}

- (id)pendingTasksForType:(id)a3 forClientID:(signed __int16)a4 forKey:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_sync_enter(@"___CacheSync___");
  [MEMORY[0x189607968] numberWithShort:v6];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKeyedSubscript:v8];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectForKeyedSubscript:v10];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectForKeyedSubscript:v9];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLClientLogger pendingTaskCache](self, "pendingTaskCache");
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 objectForKeyedSubscript:v8];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 objectForKeyedSubscript:v10];
  int v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 removeObjectForKey:v9];

  objc_sync_exit(@"___CacheSync___");
  return v14;
}

- (id)xpcConnectionWithClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((v6 & 0xFFFFFFFD) == 0x30 || -[PLClientLogger talkToPowerlogHelper](self, "talkToPowerlogHelper"))
  {
    p_xpcConnectionHelper = &self->_xpcConnectionHelper;
    xpcConnectionHelper = self->_xpcConnectionHelper;
    BOOL v12 = -[PLClientLogger clientDebug](self, "clientDebug");
    if (xpcConnectionHelper)
    {
      if (v12)
      {
        PLLogClientLogging();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.3(v6, v13, v14, v15, v16, v17, v18, v19);
        }
LABEL_33:
      }
    }

    else
    {
      if (v12)
      {
        PLLogClientLogging();
        int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.2((uint64_t)self, v6, v20);
        }
      }

      mach_service = xpc_connection_create_mach_service( "com.apple.powerlogHelperd.XPCService.xpc",  (dispatch_queue_t)self->_xpcConnectionQueue,  0LL);
      uint64_t v22 = self->_xpcConnectionHelper;
      self->_xpcConnectionHelper = mach_service;

      __int16 v23 = self->_xpcConnectionHelper;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke;
      handler[3] = &unk_189E9EE40;
      handler[4] = self;
      __int16 v52 = v6;
      id v50 = v8;
      id v51 = v9;
      xpc_connection_set_event_handler(v23, handler);
      xpc_connection_activate(self->_xpcConnectionHelper);
      if (-[PLClientLogger clientDebug](self, "clientDebug"))
      {
        PLLogClientLogging();
        id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.1();
        }
      }
    }
  }

  else
  {
    p_xpcConnectionHelper = &self->_xpcConnection;
    xpcConnection = self->_xpcConnection;
    BOOL v26 = -[PLClientLogger clientDebug](self, "clientDebug");
    if (xpcConnection)
    {
      if (v26)
      {
        PLLogClientLogging();
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.7();
        }
      }
    }

    else
    {
      if (v26)
      {
        PLLogClientLogging();
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.6();
        }
      }

      uint64_t v29 = xpc_connection_create_mach_service( "com.apple.powerlog.plxpclogger.xpc",  (dispatch_queue_t)self->_xpcConnectionQueue,  0LL);
      v30 = self->_xpcConnection;
      self->_xpcConnection = v29;

      uint64_t v31 = self->_xpcConnection;
      uint64_t v41 = MEMORY[0x1895F87A8];
      uint64_t v42 = 3221225472LL;
      id v43 = __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_122;
      v44 = &unk_189E9EE40;
      v45 = self;
      __int16 v48 = v6;
      id v46 = v8;
      id v47 = v9;
      xpc_connection_set_event_handler(v31, &v41);
      xpc_connection_activate(self->_xpcConnection);
      if (-[PLClientLogger clientDebug](self, "clientDebug", v41, v42, v43, v44, v45))
      {
        PLLogClientLogging();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.5();
        }
      }
    }

    if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:].cold.4( (uint64_t)p_xpcConnectionHelper,  v13,  v33,  v34,  v35,  v36,  v37,  v38);
      }
      goto LABEL_33;
    }
  }

  BOOL v39 = *p_xpcConnectionHelper;

  return v39;
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if ([*(id *)(a1 + 32) clientDebug])
  {
    PLLogClientLogging();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) xpcConnectionWithClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
      id v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v12[0] = 67109378;
      v12[1] = xpc_connection_get_pid(v11);
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_debug_impl( &dword_186654000,  v4,  OS_LOG_TYPE_DEBUG,  "xpcConnectionWithClientID: Event handler fired peerPID=%d %@",  (uint8_t *)v12,  0x12u);
    }
  }

  uint64_t v5 = MEMORY[0x186E3D744](v3);
  uint64_t v6 = MEMORY[0x1895F9268];
  int v7 = [*(id *)(a1 + 32) clientDebug];
  if (v5 == v6)
  {
    if (v7)
    {
      PLLogClientLogging();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_2();
      }
    }

    if (v3 == (id)MEMORY[0x1895F91A0])
    {
      if ([*(id *)(a1 + 32) clientDebug])
      {
        PLLogClientLogging();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_1();
        }
      }

      disableMessageOnDevice = 1;
    }
  }

  else if (v7)
  {
    PLLogClientLogging();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_3();
    }
  }
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_122( uint64_t a1,  void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if ([*(id *)(a1 + 32) clientDebug])
  {
    PLLogClientLogging();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) xpcConnectionWithClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
      int v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v8[0] = 67109378;
      v8[1] = xpc_connection_get_pid(v7);
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_debug_impl( &dword_186654000,  v4,  OS_LOG_TYPE_DEBUG,  "xpcConnectionWithClientID: event handler fired peerPID=%d %@",  (uint8_t *)v8,  0x12u);
    }
  }

  if (MEMORY[0x186E3D744](v3) == MEMORY[0x1895F9268])
  {
    if (v3 == (id)MEMORY[0x1895F91A0])
    {
      if ([*(id *)(a1 + 32) clientDebug])
      {
        PLLogClientLogging();
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_1();
        }
      }

      disableMessageOnDevice = 1;
    }
  }

  else if ([*(id *)(a1 + 32) clientDebug])
  {
    PLLogClientLogging();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_122_cold_2();
    }
  }
}

- (void)xpcSendMessage:(id)a3 withClientID:(signed __int16)a4 withKey:(id)a5 withPayload:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger xpcSendMessage:withClientID:withKey:withPayload:].cold.2();
    }
  }

  id v14 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  if (v14)
  {
    -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:]( self,  "xpcConnectionWithClientID:withKey:withPayload:",  v8,  v11,  v12);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_notification();
LABEL_10:

    goto LABEL_11;
  }

  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger xpcSendMessage:withClientID:withKey:withPayload:].cold.1();
    }
    goto LABEL_10;
  }

- (id)xpcSendMessageWithReply:(id)a3 withClientID:(signed __int16)a4 withKey:(id)a5 withPayload:(id)a6
{
  uint64_t v8 = a4;
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:]( self,  "xpcConnectionWithClientID:withKey:withPayload:",  v8,  v11,  v12);
      BOOL v39 = (void *)objc_claimAutoreleasedReturnValue();
      int v41 = 138412546;
      id v42 = v10;
      __int16 v43 = 2112;
      v44 = v39;
      _os_log_debug_impl( &dword_186654000,  v13,  OS_LOG_TYPE_DEBUG,  "xpcSendMessageWithReply: waiting for replay to message %@, xpcConnection=%@",  (uint8_t *)&v41,  0x16u);
    }
  }

  id v14 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  if (v14)
  {
    -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:]( self,  "xpcConnectionWithClientID:withKey:withPayload:",  v8,  v11,  v12);
    uint64_t v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = xpc_connection_send_message_with_reply_sync(v15, v14);

    if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v40 = -[PLClientLogger xpcConnectionWithClientID:withKey:withPayload:]( self,  "xpcConnectionWithClientID:withKey:withPayload:",  v8,  v11,  v12);
        int v41 = 138412802;
        id v42 = v14;
        __int16 v43 = 2112;
        v44 = v16;
        __int16 v45 = 2112;
        id v46 = v40;
        _os_log_debug_impl( &dword_186654000,  v17,  OS_LOG_TYPE_DEBUG,  "xpcSendMessageWithReply: xpcMessage=%@, xpcResponse=%@, xpcConnection=%@",  (uint8_t *)&v41,  0x20u);
      }
    }

    BOOL v18 = -[PLClientLogger clientDebug](self, "clientDebug");
    if (v16)
    {
      if (v18)
      {
        PLLogClientLogging();
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.8();
        }
      }

      xpc_dictionary_get_value(v16, (const char *)[@"PLXPCConnectionReturnDict" UTF8String]);
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v21 = -[PLClientLogger clientDebug](self, "clientDebug");
      if (v20)
      {
        if (v21)
        {
          PLLogClientLogging();
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.7();
          }
        }

        id v23 = (id)_CFXPCCreateCFObjectFromXPCMessage();
        [v23 objectForKeyedSubscript:@"PLXPCClientDebug"];
        id v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          [v23 objectForKeyedSubscript:@"PLXPCClientDebug"];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v26 = [v25 BOOLValue];

          PLLogClientLogging();
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.6( v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33);
          }

          -[PLClientLogger setClientDebug:](self, "setClientDebug:", v26);
        }

        BOOL v34 = -[PLClientLogger clientDebug](self, "clientDebug");
        if (v23)
        {
          if (v34)
          {
            PLLogClientLogging();
            uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
              -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.5();
            }
          }

          id v23 = v23;
          uint64_t v36 = v23;
        }

        else
        {
          if (v34)
          {
            PLLogClientLogging();
            uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              -[PLClientLogger xpcSendMessageWithReply:withClientID:withKey:withPayload:].cold.4();
            }
          }

          uint64_t v36 = 0LL;
        }

- (void)permissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 completion:(id)a6
{
  uint64_t v8 = a3;
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = -[PLClientLogger cachedPermissionForClientID:withKey:withType:]( self,  "cachedPermissionForClientID:withKey:withType:",  v8,  v10,  v11);
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      int v29 = v8;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v11;
      __int16 v34 = 1024;
      int v35 = v13;
      _os_log_debug_impl( &dword_186654000,  v14,  OS_LOG_TYPE_DEBUG,  "permissionForClientID: permissionForClientId: %hd withKey:%@ withType:%@ returnValue=%hd",  buf,  0x22u);
    }
  }

  if ((_DWORD)v13 == 2)
  {
    -[PLClientLogger setCachePermission:ForClientID:withKey:withType:]( self,  "setCachePermission:ForClientID:withKey:withType:",  3LL,  v8,  v10,  v11);
    -[PLClientLogger adaptivePermissionWorkQueue](self, "adaptivePermissionWorkQueue");
    uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke;
    block[3] = &unk_189E9EE68;
    void block[4] = self;
    __int16 v27 = v8;
    id v24 = v10;
    id v25 = v11;
    id v26 = v12;
    dispatch_async(v15, block);
  }

  else
  {
    if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger permissionForClientID:withKey:withType:completion:].cold.1( v13,  v16,  v17,  v18,  v19,  v20,  v21,  v22);
      }
    }

    (*((void (**)(id, uint64_t))v12 + 2))(v12, v13);
  }
}

void __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) buildMessageForClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withPayload:0];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"shouldLog"];
  [*(id *)(a1 + 32) xpcSendMessageWithReply:v2 withClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withPayload:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(a1 + 32) clientDebug])
  {
    PLLogClientLogging();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_2();
    }
  }

  if (v3)
  {
    [v3 objectForKeyedSubscript:@"shouldLog"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 shortValue];

    [*(id *)(a1 + 32) setCachePermission:v6 ForClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withType:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    [*(id *)(a1 + 32) setCachePermission:2 ForClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withType:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    LODWORD(OUTLINED_FUNCTION_3(&dword_186654000, v0, v1, "powerlogStateChanged: Powerlog state changed", v2, v3, v4, v5, v6) = 3;
  }

  [*(id *)(a1 + 32) pendingTasksForType:*(void *)(a1 + 48) forClientID:*(__int16 *)(a1 + 64) forKey:*(void *)(a1 + 40)];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(a1 + 32) clientDebug])
  {
    PLLogClientLogging();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v16 = *(__int16 *)(a1 + 64);
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)__int16 v27 = v16;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      __int16 v30 = 2112;
      id v31 = v2;
      __int16 v32 = 2112;
      id v33 = v3;
      __int16 v34 = 2112;
      int v35 = v7;
      _os_log_debug_impl( &dword_186654000,  v8,  OS_LOG_TYPE_DEBUG,  "permissionForClientID:%d withKey:%@ withType:%@\nquery=%@\n\nresult=%@\n\npending=%@",  buf,  0x3Au);
    }
  }

  if ((_DWORD)v6 == 1)
  {
    if ([*(id *)(a1 + 48) isEqualToString:@"Post"])
    {
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v19 = v3;
        uint64_t v20 = v2;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t i = 0LL; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            if ([*(id *)(a1 + 32) clientDebug])
            {
              PLLogClientLogging();
              uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)__int16 v27 = v14;
                _os_log_debug_impl( &dword_186654000,  v15,  OS_LOG_TYPE_DEBUG,  "permissionForClientID: logging %@",  buf,  0xCu);
              }
            }

            [*(id *)(a1 + 32) logForClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withPayload:v14];
          }

          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }

        while (v11);
        id v3 = v19;
        uint64_t v2 = v20;
      }

- (signed)blockedPermissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 withTimeout:(unint64_t)a6
{
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  __int16 v22 = 3;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __76__PLClientLogger_blockedPermissionForClientID_withKey_withType_withTimeout___block_invoke;
  v16[3] = &unk_189E9EE90;
  uint64_t v18 = &v19;
  uint64_t v13 = v12;
  uint64_t v17 = v13;
  -[PLClientLogger permissionForClientID:withKey:withType:completion:]( self,  "permissionForClientID:withKey:withType:completion:",  v8,  v10,  v11,  v16);
  dispatch_time_t v14 = dispatch_time(0LL, a6);
  dispatch_semaphore_wait(v13, v14);
  LOWORD(a6) = *((_WORD *)v20 + 12);

  _Block_object_dispose(&v19, 8);
  return a6;
}

uint64_t __76__PLClientLogger_blockedPermissionForClientID_withKey_withType_withTimeout___block_invoke( uint64_t a1,  __int16 a2)
{
  *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)logWithCurrentDateForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  if (a4)
  {
    if (a5)
    {
      uint64_t v6 = a3;
      id v8 = a4;
      id v10 = (id)[a5 mutableCopy];
      [MEMORY[0x189603F50] date];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 setObject:v9 forKey:@"__pl_internal_timeSensitiveSystemDate"];

      -[PLClientLogger logForClientID:withKey:withPayload:](self, "logForClientID:withKey:withPayload:", v6, v8, v10);
    }
  }

- (void)logForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  objc_opt_class();
  if (v9 && (uint64_t v10 = [v9 count], v8) && v10 && objc_msgSend(v8, "length"))
  {
    if ((_DWORD)v6 == 110) {
      goto LABEL_29;
    }
    int v11 = -[PLClientLogger blockedPermissionForClientID:withKey:withType:withTimeout:]( self,  "blockedPermissionForClientID:withKey:withType:withTimeout:",  v6,  v8,  @"Post",  0LL);
    if (!v11) {
      goto LABEL_17;
    }
    int v12 = v11;
    if (v11 == 1)
    {
LABEL_29:
      if (-[PLClientLogger clientDebug](self, "clientDebug"))
      {
        PLLogClientLogging();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          int v17 = 67109634;
          int v18 = v6;
          __int16 v19 = 2112;
          *(void *)uint64_t v20 = v8;
          *(_WORD *)&v20[8] = 2112;
          *(void *)&v20[10] = v9;
          _os_log_debug_impl( &dword_186654000,  v15,  OS_LOG_TYPE_DEBUG,  "logForClientID: sending xpc message for client id: %d withKey:%@ withPayload:%@ dispatching...",  (uint8_t *)&v17,  0x1Cu);
        }
      }

      -[PLClientLogger xpcSendMessageWithRateLimitingforClient:withKey:withPayload:]( self,  "xpcSendMessageWithRateLimitingforClient:withKey:withPayload:",  v6,  v8,  v9);
    }

    else if (v11 == 3)
    {
      if (-[PLClientLogger clientDebug](self, "clientDebug"))
      {
        PLLogClientLogging();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v17 = 67109634;
          int v18 = v6;
          __int16 v19 = 2112;
          *(void *)uint64_t v20 = v8;
          *(_WORD *)&v20[8] = 2112;
          *(void *)&v20[10] = v9;
          _os_log_debug_impl( &dword_186654000,  v13,  OS_LOG_TYPE_DEBUG,  "logForClientID: %d withKey:%@ withPayload:%@ caching...",  (uint8_t *)&v17,  0x1Cu);
        }
      }

      -[PLClientLogger addToPendingTaskCacheForType:forClientID:forKey:withPayload:]( self,  "addToPendingTaskCacheForType:forClientID:forKey:withPayload:",  @"Post",  v6,  v8,  v9);
    }

    else if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 67109890;
        int v18 = v12;
        __int16 v19 = 1024;
        *(_DWORD *)uint64_t v20 = v6;
        *(_WORD *)&v20[4] = 2112;
        *(void *)&v20[6] = v8;
        *(_WORD *)&v20[14] = 2112;
        *(void *)&v20[16] = v9;
        _os_log_debug_impl( &dword_186654000,  v16,  OS_LOG_TYPE_DEBUG,  "logForClientID: Unknown Permission %d - for client id:%d withKey:%@ withPayload:%@",  (uint8_t *)&v17,  0x22u);
      }
    }
  }

  else
  {
    PLLogClientLogging();
    dispatch_time_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger logForClientID:withKey:withPayload:].cold.1();
    }
  }

- (int)shouldLogNowForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5 withFilterInterval:(double)a6
{
  int v43 = a3;
  uint64_t v53 = *MEMORY[0x1895F89C0];
  id v9 = a4;
  id v10 = a5;
  [MEMORY[0x189603F50] date];
  int v11 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"%d_%@", v43, v9];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(@"___sFilterByIntervalBufferSync___");
  -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectForKeyedSubscript:v12];
  dispatch_time_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    uint64_t v15 = (void *)objc_opt_new();
    -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
    int v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setObject:v15 forKeyedSubscript:v12];
  }

  -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
  int v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 objectForKeyedSubscript:v12];
  int v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 objectForKeyedSubscript:@"lastEventDate"];
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      int v46 = v43;
      __int16 v47 = 2112;
      id v48 = v9;
      __int16 v49 = 2112;
      id v50 = v11;
      __int16 v51 = 2112;
      id v52 = v10;
      _os_log_debug_impl( &dword_186654000,  v20,  OS_LOG_TYPE_DEBUG,  "shouldLogNowForClientID: (PLLogRegisteredEventFilterByInterval) Check(%d, %@ at %@) - %@\n",  buf,  0x26u);
    }

    if (!v19)
    {
      if (v10) {
        goto LABEL_20;
      }
LABEL_24:
      if (-[PLClientLogger clientDebug](self, "clientDebug"))
      {
        PLLogClientLogging();
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109890;
          int v46 = v43;
          __int16 v47 = 2112;
          id v48 = v9;
          __int16 v49 = 2112;
          id v50 = v11;
          __int16 v51 = 2112;
          id v52 = 0LL;
          _os_log_debug_impl( &dword_186654000,  v36,  OS_LOG_TYPE_DEBUG,  "(PLLogRegisteredEventFilterByInterval) Drop invalid(%d, %@ at %@) - %@\n",  buf,  0x26u);
        }

        int v29 = 3;
        goto LABEL_34;
      }

      int v29 = 3;
      goto LABEL_35;
    }

    PLLogClientLogging();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger shouldLogNowForClientID:withKey:withPayload:withFilterInterval:].cold.3();
    }

    PLLogClientLogging();
    __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger shouldLogNowForClientID:withKey:withPayload:withFilterInterval:].cold.2();
    }

    PLLogClientLogging();
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      [v11 timeIntervalSinceDate:v19];
      -[PLClientLogger shouldLogNowForClientID:withKey:withPayload:withFilterInterval:].cold.1(v44, v23, v24, a6);
    }
  }

  if (!v10) {
    goto LABEL_24;
  }
  if (v19)
  {
    [v11 timeIntervalSinceDate:v19];
    if (v25 < a6)
    {
      -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 objectForKeyedSubscript:v12];
      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 objectForKeyedSubscript:@"bufferedEventDictionary"];
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        int v29 = 2;
      }

      else
      {
        -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v37 objectForKeyedSubscript:v12];
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
        [v38 setObject:v11 forKeyedSubscript:@"bufferedEventDate"];

        int v29 = 1;
      }

      BOOL v39 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v10 copyItems:1];
      v40 = -[PLClientLogger eventFilterSaved](self, "eventFilterSaved");
      [v40 objectForKeyedSubscript:v12];
      int v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 setObject:v39 forKeyedSubscript:@"bufferedEventDictionary"];

      if (-[PLClientLogger clientDebug](self, "clientDebug"))
      {
        PLLogClientLogging();
        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109890;
          int v46 = v43;
          __int16 v47 = 2112;
          id v48 = v9;
          __int16 v49 = 2112;
          id v50 = v11;
          __int16 v51 = 2112;
          id v52 = v10;
          _os_log_debug_impl( &dword_186654000,  v36,  OS_LOG_TYPE_DEBUG,  "(PLLogRegisteredEventFilterByInterval) Buffer(%d, %@ at %@) - %@\n",  buf,  0x26u);
        }

- (void)logLaterForClientID:(signed __int16)a3 withKey:(id)a4 withFilterInterval:(double)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger logLaterForClientID:withKey:withFilterInterval:].cold.1(v9);
    }
  }

  dispatch_time_t v10 = dispatch_time(0LL, (uint64_t)(a5 * 1000000000.0));
  -[PLClientLogger getWorkQueueForClientID:](self, "getWorkQueueForClientID:", v6);
  int v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke;
  v13[3] = &unk_189E9EEB8;
  __int16 v16 = v6;
  v13[4] = self;
  id v14 = v8;
  double v15 = a5;
  id v12 = v8;
  dispatch_after(v10, v11, v13);
}

void __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) clientDebug])
  {
    PLLogClientLogging();
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke_cold_1(v2);
    }
  }

  [NSString stringWithFormat:@"%d_%@", *(__int16 *)(a1 + 56), *(void *)(a1 + 40)];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] date];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(@"___sFilterByIntervalBufferSync___");
  [*(id *)(a1 + 32) eventFilterSaved];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v3];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"bufferedEventDictionary"];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) eventFilterSaved];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:v3];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 objectForKeyedSubscript:@"bufferedEventDate"];
  dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v10)
  {
    [v4 timeIntervalSinceDate:v10];
    if (v11 >= *(double *)(a1 + 48))
    {
      [*(id *)(a1 + 32) eventFilterSaved];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 objectForKeyedSubscript:v3];
      double v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 removeObjectForKey:@"bufferedEventDictionary"];

      [*(id *)(a1 + 32) eventFilterSaved];
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 objectForKeyedSubscript:v3];
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 removeObjectForKey:@"bufferedEventDate"];

      [MEMORY[0x189603F50] date];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) eventFilterSaved];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 objectForKeyedSubscript:v3];
      int v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 setObject:v13 forKeyedSubscript:@"lastEventDate"];
    }

    else
    {
      id v12 = v7;
      uint64_t v13 = v10;
      dispatch_time_t v10 = 0LL;
      int v7 = 0LL;
    }
  }

  objc_sync_exit(@"___sFilterByIntervalBufferSync___");
  if (v7) {
    BOOL v19 = v10 == 0LL;
  }
  else {
    BOOL v19 = 1;
  }
  int v20 = !v19;
  int v21 = [*(id *)(a1 + 32) clientDebug];
  if (v20)
  {
    if (v21)
    {
      PLLogClientLogging();
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        int v24 = *(__int16 *)(a1 + 56);
        uint64_t v25 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 67109890;
        int v29 = v24;
        __int16 v30 = 2112;
        uint64_t v31 = v25;
        __int16 v32 = 2112;
        id v33 = v4;
        __int16 v34 = 2112;
        int v35 = v7;
        _os_log_debug_impl( &dword_186654000,  v22,  OS_LOG_TYPE_DEBUG,  "(PLLogRegisteredEventFilterByInterval) \t\t Log Buffered(%d, %@ at %@) - %@\n",  buf,  0x26u);
      }
    }

    [*(id *)(a1 + 32) logWithCurrentDateForClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:v7];
  }

  else if (v21)
  {
    PLLogClientLogging();
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      int v26 = *(__int16 *)(a1 + 56);
      uint64_t v27 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 67109634;
      int v29 = v26;
      __int16 v30 = 2112;
      uint64_t v31 = v27;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_debug_impl( &dword_186654000,  v23,  OS_LOG_TYPE_DEBUG,  "(PLLogRegisteredEventFilterByInterval) \t\t No Buffered Log(%d, %@ at %@)\n",  buf,  0x1Cu);
    }
  }
}

- (void)xpcSendMessageWithRateLimitingforClient:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  -[PLClientLogger batchingClientAllowlist](self, "batchingClientAllowlist");
  dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithShort:v6];
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v10 containsObject:v11];

  -[PLClientLogger batchingKeysAllowlist](self, "batchingKeysAllowlist");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v13 containsObject:v8];

  BOOL v15 = -[PLClientLogger talkToPowerlogHelper](self, "talkToPowerlogHelper");
  if (-[PLClientLogger forceBatching](self, "forceBatching") || !(v15 | v14 | v12))
  {
    if (-[PLClientLogger clientDebug](self, "clientDebug"))
    {
      PLLogClientLogging();
      int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger xpcSendMessageWithRateLimitingforClient:withKey:withPayload:].cold.1();
      }
    }

    objc_sync_enter(@"___BatchCacheSync___");
    if (!-[PLClientLogger batchedTimerInFlight](self, "batchedTimerInFlight"))
    {
      -[PLClientLogger setBatchedTimerInFlight:](self, "setBatchedTimerInFlight:", 1LL);
      dispatch_time_t v19 = dispatch_time(0LL, 5000000000LL);
      -[PLClientLogger batchFlushQueue](self, "batchFlushQueue");
      int v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_148;
      v22[3] = &unk_189E9E750;
      v22[4] = self;
      dispatch_after(v19, v20, v22);
    }

    objc_sync_exit(@"___BatchCacheSync___");
    -[PLClientLogger addToBatchedTaskCacheForType:forClientID:forKey:withPayload:]( self,  "addToBatchedTaskCacheForType:forClientID:forKey:withPayload:",  @"Post",  v6,  v8,  v9);
  }

  else
  {
    if ((_DWORD)v6 == 58)
    {
      -[PLClientLogger getWorkQueueForClientID:](self, "getWorkQueueForClientID:", 58LL);
      __int16 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke;
      block[3] = &unk_189E9EEE0;
      void block[4] = self;
      __int16 v30 = 58;
      id v28 = v8;
      id v29 = v9;
      dispatch_async_and_wait(v16, block);

      int v17 = v28;
    }

    else
    {
      -[PLClientLogger getWorkQueueForClientID:](self, "getWorkQueueForClientID:", v6);
      int v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_147;
      v23[3] = &unk_189E9EEE0;
      v23[4] = self;
      __int16 v26 = v6;
      id v24 = v8;
      id v25 = v9;
      dispatch_async(v21, v23);

      int v17 = v24;
    }
  }
}

void __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) buildMessageForClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"Post"];
  [*(id *)(a1 + 32) xpcSendMessage:v2 withClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) clientDebug])
  {
    PLLogClientLogging();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = *(__int16 *)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      v7[0] = 67109634;
      v7[1] = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_debug_impl( &dword_186654000,  v3,  OS_LOG_TYPE_DEBUG,  "xpcSendMessageWithRateLimitingforClient: client id:%d withKey:%@ withPayload:%@ sent!",  (uint8_t *)v7,  0x1Cu);
    }
  }
}

void __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_147( uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) buildMessageForClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"Post"];
  if ([*(id *)(a1 + 32) clientDebug])
  {
    PLLogClientLogging();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = *(__int16 *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 40);
      int v10 = 67109634;
      int v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      BOOL v15 = v2;
      _os_log_debug_impl( &dword_186654000,  v3,  OS_LOG_TYPE_DEBUG,  "XPC Send Message - not batched xpcSendMessageWithRateLimitingforClient: %d withKey:%@ message %@",  (uint8_t *)&v10,  0x1Cu);
    }
  }

  [*(id *)(a1 + 32) xpcSendMessage:v2 withClientID:*(__int16 *)(a1 + 56) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) clientDebug])
  {
    PLLogClientLogging();
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *(__int16 *)(a1 + 56);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void **)(a1 + 48);
      int v10 = 67109634;
      int v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      BOOL v15 = v9;
      _os_log_debug_impl( &dword_186654000,  v4,  OS_LOG_TYPE_DEBUG,  "xpcSendMessageWithRateLimitingforClient: %d withKey:%@ withPayload:%@ sent!",  (uint8_t *)&v10,  0x1Cu);
    }
  }
}

uint64_t __78__PLClientLogger_xpcSendMessageWithRateLimitingforClient_withKey_withPayload___block_invoke_148( uint64_t a1)
{
  return [*(id *)(a1 + 32) setBatchMessagesSentCount:0];
}

- (void)clearCache
{
}

- (void)clearBatchedTaskCache
{
  id v3 = (void *)objc_opt_new();
  -[PLClientLogger setBatchedTaskCache:](self, "setBatchedTaskCache:", v3);

  -[PLClientLogger setBatchedDropMessageCount:](self, "setBatchedDropMessageCount:", 0LL);
  objc_sync_exit(@"___BatchCacheSync___");
}

- (void)clearBatchedTaskCachePPS
{
  id v3 = (void *)objc_opt_new();
  -[PLClientLogger setDynamicCache:](self, "setDynamicCache:", v3);

  int v4 = (void *)objc_opt_new();
  -[PLClientLogger dynamicCache](self, "dynamicCache");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v4 forKeyedSubscript:@"kPLDefault"];

  uint64_t v6 = (void *)objc_opt_new();
  -[PLClientLogger dynamicCache](self, "dynamicCache");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v6 forKeyedSubscript:@"kPLCuratedBatchingListCache"];

  objc_sync_exit(@"___BatchCacheSync___");
}

- (void)batchTasksCacheFlush
{
  _DWORD v8[2] = *MEMORY[0x1895F89C0];
  objc_sync_enter(@"___BatchCacheSync___");
  v7[0] = @"PLXPCBatchedMessage";
  -[PLClientLogger batchedTaskCache](self, "batchedTaskCache");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = @"PLXPCBatchedMessageDropCounts";
  v8[0] = v3;
  objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[PLClientLogger batchedDropMessageCount](self, "batchedDropMessageCount"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:v8 forKeys:v7 count:2];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLClientLogger buildMessageForClientID:withKey:withPayload:]( self,  "buildMessageForClientID:withKey:withPayload:",  51LL,  @"MyEvent",  v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"Post"];
  -[PLClientLogger xpcSendMessage:withClientID:withKey:withPayload:]( self,  "xpcSendMessage:withClientID:withKey:withPayload:",  v6,  51LL,  @"MyEvent",  v5);

  objc_sync_exit(@"___BatchCacheSync___");
}

- (void)sendBatchToPPS
{
  v7[1] = *MEMORY[0x1895F89C0];
  objc_sync_enter(@"___BatchCacheSync___");
  uint64_t v6 = @"PLXPCBatchedMessage";
  -[PLClientLogger dynamicCache](self, "dynamicCache");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLClientLogger buildMessageForClientID:withKey:withPayload:]( self,  "buildMessageForClientID:withKey:withPayload:",  110LL,  @"PPSBatchedMessages",  v4);
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"Post"];
  -[PLClientLogger xpcSendMessage:withClientID:withKey:withPayload:]( self,  "xpcSendMessage:withClientID:withKey:withPayload:",  v5,  110LL,  @"PPSBatchedMessages",  v4);

  objc_sync_exit(@"___BatchCacheSync___");
}

- (id)queryForClientID:(signed __int16)a3 withKey:(id)a4 withPayload:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  objc_opt_class();
  if (-[PLClientLogger clientDebug](self, "clientDebug"))
  {
    PLLogClientLogging();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogger queryForClientID:withKey:withPayload:].cold.3();
    }
  }

  if (v8 && [v8 length])
  {
    if ((_DWORD)v6 == 50)
    {
      PLLogClientLogging();
      __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLClientLogger queryForClientID:withKey:withPayload:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }

    else
    {
      int v24 = 0;
      *(void *)&__int128 v11 = 67110146LL;
      __int128 v28 = v11;
      do
      {
        int v25 = -[PLClientLogger blockedPermissionForClientID:withKey:withType:withTimeout:]( self,  "blockedPermissionForClientID:withKey:withType:withTimeout:",  v6,  v8,  @"Query",  2000000000LL,  v28);
        int v26 = v25;
        if (!v25)
        {
          id v21 = &unk_189EA4A88;
          goto LABEL_15;
        }

        if (-[PLClientLogger clientDebug](self, "clientDebug"))
        {
          PLLogClientLogging();
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v28;
            *(_DWORD *)&uint8_t buf[4] = v6;
            *(_WORD *)int v35 = 2112;
            *(void *)&v35[2] = v8;
            *(_WORD *)&v35[10] = 2112;
            *(void *)&v35[12] = v9;
            *(_WORD *)&v35[20] = 1024;
            *(_DWORD *)&v35[22] = v26;
            *(_WORD *)&v35[26] = 1024;
            *(_DWORD *)&v35[28] = v24;
            _os_log_debug_impl( &dword_186654000,  v27,  OS_LOG_TYPE_DEBUG,  "queryForClientID:%d withKey:%@ withPayload%@ - keyPermission=%d, retry=%d",  buf,  0x28u);
          }
        }

        ++v24;
      }

      while (v24 != 5);
      if (v26 == 3)
      {
        id v21 = &unk_189EA4AB0;
        goto LABEL_15;
      }
    }

void __55__PLClientLogger_queryForClientID_withKey_withPayload___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) buildMessageForClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"Query"];
  uint64_t v3 = [*(id *)(a1 + 32) xpcSendMessageWithReply:v2 withClientID:*(__int16 *)(a1 + 64) withKey:*(void *)(a1 + 40) withPayload:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if ([*(id *)(a1 + 32) clientDebug])
  {
    PLLogClientLogging();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *(__int16 *)(a1 + 64);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
      v11[0] = 67110146;
      v11[1] = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v2;
      _os_log_debug_impl( &dword_186654000,  v6,  OS_LOG_TYPE_DEBUG,  "queryForClientID:%d withKey:%@ withPayload:%@ result=%@, message=%@",  (uint8_t *)v11,  0x30u);
    }
  }
}

- (BOOL)clientDebug
{
  return self->_clientDebug;
}

- (void)setClientDebug:(BOOL)a3
{
  self->_clientDebug = a3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)batchFlushQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setBatchFlushQueue:(id)a3
{
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setProcessName:(id)a3
{
}

- (NSMutableDictionary)permissionCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPermissionCache:(id)a3
{
}

- (NSMutableDictionary)pendingTaskCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPendingTaskCache:(id)a3
{
}

- (NSMutableArray)batchedTaskCache
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setBatchedTaskCache:(id)a3
{
}

- (NSMutableDictionary)dynamicCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setDynamicCache:(id)a3
{
}

- (NSMutableDictionary)eventFilterSaved
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setEventFilterSaved:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setXpcConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionHelperQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setXpcConnectionHelperQueue:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_xpc_object)xpcConnectionHelper
{
  return self->_xpcConnectionHelper;
}

- (void)setXpcConnectionHelper:(id)a3
{
}

- (BOOL)talkToPowerlogHelper
{
  return self->_talkToPowerlogHelper;
}

- (void)setTalkToPowerlogHelper:(BOOL)a3
{
  self->_talkToPowerlogHelper = a3;
}

- (BOOL)batchedTimerInFlight
{
  return self->_batchedTimerInFlight;
}

- (void)setBatchedTimerInFlight:(BOOL)a3
{
  self->_batchedTimerInFlight = a3;
}

- (BOOL)forceBatching
{
  return self->_forceBatching;
}

- (void)setForceBatching:(BOOL)a3
{
  self->_forceBatching = a3;
}

- (BOOL)batchDropMessages
{
  return self->_batchDropMessages;
}

- (void)setBatchDropMessages:(BOOL)a3
{
  self->_batchDropMessages = a3;
}

- (int)batchMessagesSentCount
{
  return self->_batchMessagesSentCount;
}

- (void)setBatchMessagesSentCount:(int)a3
{
  self->_batchMessagesSentCount = a3;
}

- (NSSet)batchingClientAllowlist
{
  return (NSSet *)objc_getProperty(self, a2, 120LL, 1);
}

- (NSSet)curatedBatchingList
{
  return (NSSet *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSSet)batchingKeysAllowlist
{
  return (NSSet *)objc_getProperty(self, a2, 136LL, 1);
}

- (int)batchedDropMessageCount
{
  return self->_batchedDropMessageCount;
}

- (void)setBatchedDropMessageCount:(int)a3
{
  self->_batchedDropMessageCount = a3;
}

- (OS_dispatch_queue)adaptivePermissionWorkQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setAdaptivePermissionWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8_0(&dword_186654000, v0, v1, "Notification %s registration failed : %d", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __38__PLClientLogger_powerlogStateChanged__block_invoke_cold_1()
{
}

- (void)buildMessageForClientID:withKey:withPayload:.cold.1()
{
}

- (void)cachedPermissionForClientID:withKey:withType:.cold.1()
{
}

- (void)cachedPermissionForClientID:withKey:withType:.cold.2()
{
}

- (void)cachedPermissionForClientID:(void *)a1 withKey:(uint64_t)a2 withType:(os_log_s *)a3 .cold.3( void *a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_186654000, a3, (uint64_t)a3, "permissionCache: %@", (uint8_t *)a2);
}

- (void)addToPendingTaskCacheForType:(os_log_s *)a3 forClientID:forKey:withPayload:.cold.1( void *a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0( &dword_186654000,  a3,  (uint64_t)a3,  "addToPendingTaskCacheForType: Current cached payloads = %@",  (uint8_t *)a2);
}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.1()
{
}

- (void)xpcConnectionWithClientID:(uint64_t)a1 withKey:(uint64_t)a2 withPayload:(os_log_s *)a3 .cold.2( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = *(void *)(a1 + 96);
  OUTLINED_FUNCTION_5_0( &dword_186654000,  a2,  a3,  "xpcConnectionWithClientID: Client (%d) is creating connection to powerlogHelperd, using queue %@!",  v3,  (void)v4,  WORD4(v4));
  OUTLINED_FUNCTION_1();
}

- (void)xpcConnectionWithClientID:(uint64_t)a3 withKey:(uint64_t)a4 withPayload:(uint64_t)a5 .cold.3( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)xpcConnectionWithClientID:(uint64_t)a3 withKey:(uint64_t)a4 withPayload:(uint64_t)a5 .cold.4( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_186654000, a2, a3, "xpcConnectionWithClientID: _xpcConnection=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.5()
{
}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.6()
{
}

- (void)xpcConnectionWithClientID:withKey:withPayload:.cold.7()
{
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_1()
{
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_2()
{
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_cold_3()
{
}

void __64__PLClientLogger_xpcConnectionWithClientID_withKey_withPayload___block_invoke_122_cold_2()
{
}

- (void)xpcSendMessage:withClientID:withKey:withPayload:.cold.1()
{
}

- (void)xpcSendMessage:withClientID:withKey:withPayload:.cold.2()
{
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.1()
{
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.2()
{
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.3()
{
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.4()
{
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.5()
{
  OUTLINED_FUNCTION_1_0(&dword_186654000, v0, v1, "xpcSendMessageWithReply: response=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)xpcSendMessageWithReply:(uint64_t)a3 withClientID:(uint64_t)a4 withKey:(uint64_t)a5 withPayload:(uint64_t)a6 .cold.6( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.7()
{
  OUTLINED_FUNCTION_1_0(&dword_186654000, v0, v1, "xpcSendMessageWithReply: xpcReturnDict=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)xpcSendMessageWithReply:withClientID:withKey:withPayload:.cold.8()
{
  OUTLINED_FUNCTION_1_0(&dword_186654000, v0, v1, "xpcSendMessageWithReply: xpcResponse=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)permissionForClientID:(uint64_t)a3 withKey:(uint64_t)a4 withType:(uint64_t)a5 completion:(uint64_t)a6 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_186654000, a2, a3, "permissionForClientID: returnValue=%hd", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_1()
{
}

void __68__PLClientLogger_permissionForClientID_withKey_withType_completion___block_invoke_cold_2()
{
}

- (void)logForClientID:withKey:withPayload:.cold.1()
{
}

- (void)shouldLogNowForClientID:(uint8_t *)buf withKey:(os_log_s *)a2 withPayload:(double)a3 withFilterInterval:(double)a4 .cold.1( uint8_t *buf,  os_log_s *a2,  double a3,  double a4)
{
  *(_DWORD *)buf = 134218240;
  *(double *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  _os_log_debug_impl( &dword_186654000,  a2,  OS_LOG_TYPE_DEBUG,  "(PLLogRegisteredEventFilterByInterval) \t interval = %f, minInterval = %f\n",  buf,  0x16u);
}

- (void)shouldLogNowForClientID:withKey:withPayload:withFilterInterval:.cold.2()
{
  OUTLINED_FUNCTION_1_0( &dword_186654000,  v0,  v1,  "(PLLogRegisteredEventFilterByInterval) \t lastEventDate = %@\n",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_1();
}

- (void)shouldLogNowForClientID:withKey:withPayload:withFilterInterval:.cold.3()
{
  OUTLINED_FUNCTION_1_0( &dword_186654000,  v0,  v1,  "(PLLogRegisteredEventFilterByInterval) \t currentEventDate = %@\n",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_1();
}

- (void)logLaterForClientID:(os_log_s *)a1 withKey:withFilterInterval:.cold.1(os_log_s *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] date];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, a1, v3, "(PLLogRegisteredEventFilterByInterval) \t Set Timer at %@\n", v4);

  OUTLINED_FUNCTION_14_0();
}

void __65__PLClientLogger_logLaterForClientID_withKey_withFilterInterval___block_invoke_cold_1(os_log_s *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] date];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, a1, v3, "(PLLogRegisteredEventFilterByInterval) \t Timer Fired at %@\n", v4);

  OUTLINED_FUNCTION_14_0();
}

- (void)xpcSendMessageWithRateLimitingforClient:withKey:withPayload:.cold.1()
{
}

- (void)queryForClientID:withKey:withPayload:.cold.1()
{
}

- (void)queryForClientID:(uint64_t)a3 withKey:(uint64_t)a4 withPayload:(uint64_t)a5 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)queryForClientID:withKey:withPayload:.cold.3()
{
}

@end