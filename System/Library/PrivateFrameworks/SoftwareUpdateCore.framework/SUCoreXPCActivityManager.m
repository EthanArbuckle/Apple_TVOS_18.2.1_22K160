@interface SUCoreXPCActivityManager
+ (id)sharedInstance;
- (BOOL)_isActivityTrackedButUnsheduledInternal:(id)a3;
- (BOOL)addActivityInfoToPersistedState:(id)a3;
- (BOOL)isActivityScheduled:(id)a3;
- (BOOL)isActivityScheduledInternal:(id)a3;
- (BOOL)isActivityTrackedButUnsheduled:(id)a3;
- (BOOL)removeActivityFromPersistedState:(id)a3;
- (NSMutableArray)activities;
- (NSString)managerName;
- (OS_dispatch_queue)activityQueue;
- (OS_dispatch_queue)managerQueue;
- (OS_dispatch_queue)persistedStateDispatchQueue;
- (SUCoreLog)logger;
- (SUCorePersistedState)persistedState;
- (SUCoreXPCActivityManager)initWithNameAndPersistedStateFilePath:(id)a3 persistedStateFilePath:(id)a4;
- (id)_getActivityForNameInternal:(id)a3;
- (id)copyOptionsForActivity:(id)a3;
- (id)description;
- (id)getActivityForName:(id)a3;
- (id)getExpectedRunDateForActivity:(id)a3;
- (int)scheduleActivity:(id)a3;
- (int)unscheduleActivity:(id)a3;
- (void)eventHandler:(id)a3;
- (void)setActivities:(id)a3;
- (void)setActivityQueue:(id)a3;
- (void)setLogger:(id)a3;
- (void)setManagerQueue:(id)a3;
- (void)setPersistedState:(id)a3;
- (void)setPersistedStateDispatchQueue:(id)a3;
@end

@implementation SUCoreXPCActivityManager

- (void)eventHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  id v22 = 0LL;
  uint64_t v5 = xpc_activity_copy_identifier();
  if (v5)
  {
    -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = MEMORY[0x1895F87A8];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __41__SUCoreXPCActivityManager_eventHandler___block_invoke;
    block[3] = &unk_18A0F05C0;
    block[4] = self;
    block[5] = &v17;
    block[6] = v5;
    dispatch_sync(v6, block);

    if (v18[5])
    {
      -[SUCoreXPCActivityManager activityQueue](self, "activityQueue");
      v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      v13[1] = 3221225472LL;
      v13[2] = __41__SUCoreXPCActivityManager_eventHandler___block_invoke_44;
      v13[3] = &unk_18A0EF998;
      v15 = &v17;
      v14 = (os_log_s *)v4;
      dispatch_sync(v8, v13);

      v9 = v14;
    }

    else
    {
      v12 = -[SUCoreXPCActivityManager logger](self, "logger");
      [v12 oslog];
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v24 = v5;
        _os_log_impl(&dword_187A54000, v9, OS_LOG_TYPE_DEFAULT, "No registered activity found for event %s", buf, 0xCu);
      }
    }
  }

  else
  {
    v10 = -[SUCoreXPCActivityManager logger](self, "logger");
    [v10 oslog];
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "Event handler failed to copy identifier for event. Not invoking any callbacks",  buf,  2u);
    }
  }

  _Block_object_dispose(&v17, 8);
}

void __41__SUCoreXPCActivityManager_eventHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "activities", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v7 activityName];
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        [NSString stringWithUTF8String:*(void *)(a1 + 48)];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        int v10 = [v8 isEqualToString:v9];

        if (v10)
        {
          [*(id *)(a1 + 32) logger];
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 oslog];
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            [v7 activityName];
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            id v22 = v13;
            _os_log_impl(&dword_187A54000, v12, OS_LOG_TYPE_DEFAULT, "Invoking activity handler for %@", buf, 0xCu);
          }

          uint64_t v14 = [v7 handler];
          uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
          v16 = *(void **)(v15 + 40);
          *(void *)(v15 + 40) = v14;

          goto LABEL_13;
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

uint64_t __41__SUCoreXPCActivityManager_eventHandler___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) + 16LL))();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  }
  return (id)sharedInstance___instance_0;
}

void __42__SUCoreXPCActivityManager_sharedInstance__block_invoke()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 bundleIdentifier];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    [v1 componentsSeparatedByString:@"."];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 lastObject];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3
      || (id v4 = (id)[objc_alloc(NSString) initWithFormat:@"%@%@.SUCoreXPCActivity.state", @"/var/mobile/Library/SoftwareUpdateCore/", v3]) == 0)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 oslog];
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_2(v6);
      }

      id v4 = v1;
    }

    uint64_t v7 = v4;
  }

  else
  {
    [MEMORY[0x1896077F8] mainBundle];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 executablePath];
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      && ([v9 componentsSeparatedByString:@"/"],
          int v10 = (void *)objc_claimAutoreleasedReturnValue(),
          [v10 lastObject],
          uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v3))
    {
      uint64_t v7 = (void *)[objc_alloc(NSString) initWithFormat:@"%@%@.SUCoreXPCActivity.state", @"/var/mobile/Library/SoftwareUpdateCore/", v3];

      if (v7) {
        goto LABEL_14;
      }
    }

    else
    {

      uint64_t v3 = 0LL;
    }

    uint64_t v7 = (void *)[objc_alloc(NSString) initWithFormat:@"%@%@", @"/var/mobile/Library/SoftwareUpdateCore/", @"SUCoreXPCActivitySchedulerDefaultSharedState.state"];
    [MEMORY[0x189612778] sharedDiag];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithFormat:@"Failed to create a file path from bundleIdentifier, falling back to the default of %@", v7];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 trackAnomaly:@"SUCoreXPCActivityScheduler" forReason:v12 withResult:8116 withError:0];
  }

- (SUCoreXPCActivityManager)initWithNameAndPersistedStateFilePath:(id)a3 persistedStateFilePath:(id)a4
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  id v40 = a3;
  id v39 = a4;
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___SUCoreXPCActivityManager;
  uint64_t v7 = -[SUCoreXPCActivityManager init](&v54, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_managerName, a3);
    v9 = (void *)[objc_alloc(MEMORY[0x1896127A0]) initWithCategory:@"SUCoreXPCActivityManager"];
    -[SUCoreXPCActivityManager setLogger:](v8, "setLogger:", v9);

    memset(v72, 0, sizeof(v72));
    __int128 v71 = 0u;
    __int128 v70 = 0u;
    __int128 v69 = 0u;
    __int128 v68 = 0u;
    __int128 v67 = 0u;
    __int128 v66 = 0u;
    __int128 v65 = 0u;
    __int128 v64 = 0u;
    __int128 v63 = 0u;
    __int128 v62 = 0u;
    __int128 v61 = 0u;
    __int128 v60 = 0u;
    __int128 v59 = 0u;
    *(_OWORD *)label = 0u;
    [NSString stringWithFormat:@"%s.%@", "com.apple.sucore.sucoreactivitymanagerqueue", v40];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 getCString:label maxLength:254 encoding:4];
    dispatch_queue_t v11 = dispatch_queue_create(label, 0LL);
    managerQueue = v8->_managerQueue;
    v8->_managerQueue = (OS_dispatch_queue *)v11;

    memset(v72, 0, sizeof(v72));
    __int128 v71 = 0u;
    __int128 v70 = 0u;
    __int128 v69 = 0u;
    __int128 v68 = 0u;
    __int128 v67 = 0u;
    __int128 v66 = 0u;
    __int128 v65 = 0u;
    __int128 v64 = 0u;
    __int128 v63 = 0u;
    __int128 v62 = 0u;
    __int128 v61 = 0u;
    __int128 v60 = 0u;
    __int128 v59 = 0u;
    *(_OWORD *)label = 0u;
    [NSString stringWithFormat:@"%s.%@", "com.apple.sucorexpcactivitymanager.persistedStateQueue", v40];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    [v13 getCString:label maxLength:254 encoding:4];
    dispatch_queue_t v14 = dispatch_queue_create(label, 0LL);
    persistedStateDispatchQueue = v8->_persistedStateDispatchQueue;
    v8->_persistedStateDispatchQueue = (OS_dispatch_queue *)v14;

    memset(v72, 0, sizeof(v72));
    __int128 v71 = 0u;
    __int128 v70 = 0u;
    __int128 v69 = 0u;
    __int128 v68 = 0u;
    __int128 v67 = 0u;
    __int128 v66 = 0u;
    __int128 v65 = 0u;
    __int128 v64 = 0u;
    __int128 v63 = 0u;
    __int128 v62 = 0u;
    __int128 v61 = 0u;
    __int128 v60 = 0u;
    __int128 v59 = 0u;
    *(_OWORD *)label = 0u;
    [NSString stringWithFormat:@"%s.%@", "com.apple.sucorexpcactivitymanager.activityQueue", v40];
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    [v38 getCString:label maxLength:254 encoding:4];
    dispatch_queue_t v16 = dispatch_queue_create(label, 0LL);
    activityQueue = v8->_activityQueue;
    v8->_activityQueue = (OS_dispatch_queue *)v16;

    __int128 v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    activities = v8->_activities;
    v8->_activities = v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1896127B0]) initWithDispatchQueue:v8->_persistedStateDispatchQueue withPersistencePath:v39 forPolicyVersion:@"1.0"];
    persistedState = v8->_persistedState;
    v8->_persistedState = (SUCorePersistedState *)v20;

    uint64_t v48 = 0LL;
    v49 = &v48;
    uint64_t v50 = 0x3032000000LL;
    v51 = __Block_byref_object_copy__75;
    v52 = __Block_byref_object_dispose__76;
    id v53 = 0LL;
    -[SUCoreXPCActivityManager persistedStateDispatchQueue](v8, "persistedStateDispatchQueue");
    id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __89__SUCoreXPCActivityManager_initWithNameAndPersistedStateFilePath_persistedStateFilePath___block_invoke;
    block[3] = &unk_18A0EF948;
    v23 = v8;
    v46 = v23;
    v47 = &v48;
    dispatch_sync(v22, block);

    if (v49[5])
    {
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      id v24 = (id)v49[5];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v57 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v42;
        do
        {
          for (uint64_t i = 0LL; i != v25; ++i)
          {
            if (*(void *)v42 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = *(SUCorePersistedState **)(*((void *)&v41 + 1) + 8 * i);
            [v23[2] oslog];
            v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v28;
              _os_log_impl( &dword_187A54000,  v29,  OS_LOG_TYPE_DEFAULT,  "Found perisistedActivity %@. Unregistering from XPC",  buf,  0xCu);
            }

            v30 = objc_alloc_init(&OBJC_CLASS___SUCoreXPCActivity);
            v31 = -[SUCorePersistedState activityOptions](v28, "activityOptions");
            -[SUCoreXPCActivity setActivityOptions:](v30, "setActivityOptions:", v31);
            v32 = -[SUCorePersistedState activityName](v28, "activityName");
            -[SUCoreXPCActivity setActivityName:](v30, "setActivityName:", v32);

            -[SUCoreXPCActivity setHandler:](v30, "setHandler:", 0LL);
            -[SUCoreXPCActivity setIsRegisteredWithXPC:](v30, "setIsRegisteredWithXPC:", 0LL);
            bzero(buf, 0x400uLL);
            v33 = -[SUCorePersistedState activityName](v28, "activityName");
            [v33 getCString:buf maxLength:1023 encoding:4];

            xpc_activity_unregister((const char *)buf);
            -[NSMutableArray addObject:](v8->_activities, "addObject:", v30);
          }

          uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v57 count:16];
        }

        while (v25);
      }
    }

    [v23 logger];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 oslog];
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v8->_persistedState;
      *(_DWORD *)buf = 138412290;
      v56 = v36;
      _os_log_impl(&dword_187A54000, v35, OS_LOG_TYPE_DEFAULT, "Loaded persisted State: %@", buf, 0xCu);
    }

    _Block_object_dispose(&v48, 8);
  }

  return v8;
}

void __89__SUCoreXPCActivityManager_initWithNameAndPersistedStateFilePath_persistedStateFilePath___block_invoke( uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v13 = (id)objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 56) secureCodedObjectForKey:@"ActivityArray" ofClass:objc_opt_class() encodeClasses:v13];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (BOOL)_isActivityTrackedButUnsheduledInternal:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v6 = self->_activities;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x189612760];
        objc_msgSend(v12, "activityName", (void)v17);
        dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v13 stringIsEqual:v14 to:v4])
        {
          char v15 = [v12 isRegisteredWithXPC];

          v9 |= v15 ^ 1;
        }

        else
        {
        }
      }

      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v8);
  }

  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (BOOL)isActivityTrackedButUnsheduled:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__SUCoreXPCActivityManager_isActivityTrackedButUnsheduled___block_invoke;
  block[3] = &unk_18A0F0608;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __59__SUCoreXPCActivityManager_isActivityTrackedButUnsheduled___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isActivityTrackedButUnsheduledInternal:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)isActivityScheduledInternal:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = self->_activities;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "activityName", (void)v16);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v13 isEqualToString:v4])
        {
          char v14 = [v12 isRegisteredWithXPC];

          v9 |= v14;
        }

        else
        {
        }
      }

      uint64_t v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v8);
  }

  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (BOOL)isActivityScheduled:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__SUCoreXPCActivityManager_isActivityScheduled___block_invoke;
  block[3] = &unk_18A0F0608;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __48__SUCoreXPCActivityManager_isActivityScheduled___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isActivityScheduledInternal:*(void *)(a1 + 40)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

- (BOOL)addActivityInfoToPersistedState:(id)a3
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 0;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x3032000000LL;
  v33[3] = __Block_byref_object_copy__75;
  v33[4] = __Block_byref_object_dispose__76;
  id v34 = 0LL;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = __Block_byref_object_copy__75;
  v31 = __Block_byref_object_dispose__76;
  id v32 = 0LL;
  id v6 = objc_alloc_init(&OBJC_CLASS___SUCorePersistedActivity);
  [v4 activityOptions];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedActivity setActivityOptions:](v6, "setActivityOptions:", v7);

  [v4 activityName];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedActivity setActivityName:](v6, "setActivityName:", v8);

  -[SUCoreXPCActivityManager persistedStateDispatchQueue](self, "persistedStateDispatchQueue");
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke;
  block[3] = &unk_18A0F0630;
  void block[4] = self;
  void block[5] = v33;
  block[6] = &v27;
  dispatch_sync(v9, block);

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v11 = (id)v28[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v16 isEqual:v6])
        {
          id v17 = v16;

          uint64_t v13 = v17;
        }
      }

      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v39 count:16];
    }

    while (v12);

    if (v13) {
      [(id)v28[5] removeObject:v13];
    }
  }

  else
  {

    uint64_t v13 = 0LL;
  }

  [(id)v28[5] addObject:v6];
  -[SUCoreXPCActivityManager persistedStateDispatchQueue](self, "persistedStateDispatchQueue");
  __int128 v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472LL;
  v21[2] = __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke_2;
  v21[3] = &unk_18A0F0658;
  v21[4] = self;
  v21[5] = &v27;
  v21[6] = &v35;
  dispatch_sync(v18, v21);

  BOOL v19 = *((_BYTE *)v36 + 24) != 0;
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);

  return v19;
}

void __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x189604010];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [*(id *)(a1[4] + 56) secureCodedObjectForKey:@"ActivityArray" ofClass:objc_opt_class() encodeClasses:v10];
  uint64_t v5 = *(void *)(a1[5] + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(a1[5] + 8LL) + 40LL) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v7 = (id)[*(id *)(*(void *)(a1[5] + 8) + 40) mutableCopy];
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
  }
  uint64_t v8 = *(void *)(a1[6] + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

uint64_t __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke_2(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 56) persistSecureCodedObject:*(void *)(*(void *)(a1[5] + 8) + 40) forKey:@"ActivityArray" shouldPersist:1];
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  return result;
}

- (BOOL)removeActivityFromPersistedState:(id)a3
{
  id v4 = a3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  uint64_t v15 = 0LL;
  __int128 v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = __Block_byref_object_copy__75;
  void v13[4] = __Block_byref_object_dispose__76;
  id v14 = 0LL;
  -[SUCoreXPCActivityManager persistedStateDispatchQueue](self, "persistedStateDispatchQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __61__SUCoreXPCActivityManager_removeActivityFromPersistedState___block_invoke;
  v9[3] = &unk_18A0F0680;
  id v11 = v13;
  uint64_t v12 = &v15;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  dispatch_sync(v6, v9);

  LOBYTE(v4) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);
  return (char)v4;
}

void __61__SUCoreXPCActivityManager_removeActivityFromPersistedState___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v2 = (void *)MEMORY[0x189604010];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 56) secureCodedObjectForKey:@"ActivityArray" ofClass:objc_opt_class() encodeClasses:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = objc_alloc_init(&OBJC_CLASS___SUCorePersistedActivity);
    [*(id *)(a1 + 40) activityOptions];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedActivity setActivityOptions:](v8, "setActivityOptions:", v9);

    [*(id *)(a1 + 40) activityName];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedActivity setActivityName:](v8, "setActivityName:", v10);

    id v11 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) mutableCopy];
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = 0LL;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v12);
          }
          char v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v18 isEqual:v8])
          {
            id v19 = v18;

            uint64_t v15 = v19;
          }
        }

        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v14);
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    [v12 removeObject:v15];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }

  else
  {
    [*(id *)(a1 + 32) logger];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 oslog];
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_187A54000, v21, OS_LOG_TYPE_DEFAULT, "No persisted activities found", buf, 2u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
  }
}

- (int)scheduleActivity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = 3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke;
  block[3] = &unk_18A0F06D0;
  id v9 = v4;
  id v10 = self;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return (int)v4;
}

void __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([*(id *)(a1 + 32) handler], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) == 0)
    || (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 32) activityName],
        id v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    [*(id *)(a1 + 40) logger];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        uint64_t v14 = @"OK";
      }
      else {
        uint64_t v14 = @"Invalid";
      }
      [*(id *)(a1 + 32) handler];
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15) {
        uint64_t v16 = @"OK";
      }
      else {
        uint64_t v16 = @"Invalid";
      }
      [*(id *)(a1 + 32) activityName];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      if (v17) {
        char v18 = @"OK";
      }
      else {
        char v18 = @"Invalid";
      }
      __int128 v71 = v14;
      __int16 v72 = 2112;
      uint64_t v73 = v16;
      __int16 v74 = 2112;
      v75 = v18;
      _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "The activity object passed to scheduleActivity is invalid : Class : %@ Handler: %@ Name: %@",  buf,  0x20u);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
    int v11 = 4;
    goto LABEL_20;
  }

  uint64_t v5 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) activityName];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = [v5 isActivityScheduledInternal:v6];

  if ((_DWORD)v5)
  {
    [*(id *)(a1 + 40) logger];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) activityName];
      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      __int128 v71 = v9;
      _os_log_impl(&dword_187A54000, v8, OS_LOG_TYPE_DEFAULT, "The activity named %@ is already scheduled", buf, 0xCu);
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
    int v11 = 5;
LABEL_20:
    *(_DWORD *)(v10 + 24) = v11;
    return;
  }

  xpc_object_t v19 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x1895F8690], 0LL);
  [*(id *)(a1 + 32) activityOptions];
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
  int v21 = [v20 priority];
  __int128 v22 = (const char **)MEMORY[0x1895F86D0];
  if (!v21)
  {

    goto LABEL_25;
  }

  [*(id *)(a1 + 32) activityOptions];
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue();
  int v24 = [v23 priority];

  if (v24 == 2) {
LABEL_25:
  }
    xpc_dictionary_set_string(v19, *v22, (const char *)*MEMORY[0x1895F86E0]);
  [*(id *)(a1 + 32) activityOptions];
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
  int v26 = [v25 priority];

  if (v26 == 1) {
    xpc_dictionary_set_string(v19, *v22, (const char *)*MEMORY[0x1895F86D8]);
  }
  [*(id *)(a1 + 32) activityOptions];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [v27 batteryLevelGreaterThan];
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    [*(id *)(a1 + 32) activityOptions];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 batteryLevelGreaterThan];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_32;
    }
    v33 = (const char *)*MEMORY[0x1895F86F0];
    [*(id *)(a1 + 32) activityOptions];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 batteryLevelGreaterThan];
    id v34 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v19, v33, [v34 integerValue]);
  }

LABEL_32:
  [*(id *)(a1 + 32) activityOptions];
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  int v36 = [v35 plugInState];

  if (v36)
  {
    [*(id *)(a1 + 32) activityOptions];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v38 = [v37 plugInState] == 2;

    xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1895F8670], v38);
  }

  [*(id *)(a1 + 32) activityOptions];
  id v39 = (void *)objc_claimAutoreleasedReturnValue();
  int v40 = [v39 networkState];

  if (v40)
  {
    [*(id *)(a1 + 32) activityOptions];
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v42 = [v41 networkState] == 2;

    xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1895F86F8], v42);
  }

  [*(id *)(a1 + 32) activityOptions];
  __int128 v43 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v44 = [v43 runDate];
  if (v44)
  {
    v45 = (void *)v44;
    [*(id *)(a1 + 32) activityOptions];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 runDate];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v48 = objc_opt_isKindOfClass();

    double v49 = 0.0;
    if ((v48 & 1) == 0) {
      goto LABEL_42;
    }
    [*(id *)(a1 + 32) activityOptions];
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    [v50 runDate];
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 timeIntervalSinceNow];
    double v49 = v52;

    if (v49 >= 0.0) {
      goto LABEL_42;
    }
    [*(id *)(a1 + 40) logger];
    id v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v53 oslog];
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) activityName];
      objc_super v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) activityOptions];
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      [v55 runDate];
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      __int128 v71 = v54;
      __int16 v72 = 2112;
      uint64_t v73 = v56;
      _os_log_impl( &dword_187A54000,  (os_log_t)v43,  OS_LOG_TYPE_DEFAULT,  "The activity named %@ has a requested run date which is in the past(%@). Scheduling to run immediately",  buf,  0x16u);
    }
  }

  double v49 = 0.0;
LABEL_42:
  xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x1895F8688], (uint64_t)v49);
  bzero(buf, 0x400uLL);
  [*(id *)(a1 + 32) activityName];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  [v57 getCString:buf maxLength:1023 encoding:4];

  int v58 = buf[0];
  [*(id *)(a1 + 40) logger];
  __int128 v59 = (void *)objc_claimAutoreleasedReturnValue();
  [v59 oslog];
  __int128 v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
  if (v58)
  {
    if (v61)
    {
      [*(id *)(a1 + 32) activityName];
      __int128 v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 v68 = 138412290;
      __int128 v69 = v62;
      _os_log_impl(&dword_187A54000, v60, OS_LOG_TYPE_DEFAULT, "Registering Activity %@", v68, 0xCu);
    }

    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke_89;
    handler[3] = &unk_18A0F06A8;
    handler[4] = *(void *)(a1 + 40);
    xpc_activity_register((const char *)buf, v19, handler);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    [*(id *)(*(void *)(a1 + 40) + 48) addObject:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) addActivityInfoToPersistedState:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setIsRegisteredWithXPC:1];
    [*(id *)(a1 + 40) logger];
    __int128 v63 = (void *)objc_claimAutoreleasedReturnValue();
    [v63 oslog];
    __int128 v64 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v65 = *(void **)(a1 + 32);
      *(_DWORD *)__int128 v68 = 138412290;
      __int128 v69 = v65;
      _os_log_impl(&dword_187A54000, v64, OS_LOG_TYPE_DEFAULT, "Activity successfully registered : {%@}", v68, 0xCu);
    }
  }

  else
  {
    if (v61)
    {
      __int128 v66 = *(void **)(a1 + 32);
      *(_DWORD *)__int128 v68 = 138412290;
      __int128 v69 = v66;
      _os_log_impl( &dword_187A54000,  v60,  OS_LOG_TYPE_DEFAULT,  "Failed to register activity since we could not extract its name: {%@}",  v68,  0xCu);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 4;
  }
}

uint64_t __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke_89(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) eventHandler:a2];
}

- (int)unscheduleActivity:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 6;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__SUCoreXPCActivityManager_unscheduleActivity___block_invoke;
  block[3] = &unk_18A0F06D0;
  void block[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

void __47__SUCoreXPCActivityManager_unscheduleActivity___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (([*(id *)(a1 + 32) isActivityScheduledInternal:*(void *)(a1 + 40)] & 1) != 0
    || [*(id *)(a1 + 32) _isActivityTrackedButUnsheduledInternal:*(void *)(a1 + 40)])
  {
    bzero(identifier, 0x400uLL);
    [*(id *)(a1 + 40) getCString:identifier maxLength:1023 encoding:4];
    if (identifier[0])
    {
      xpc_activity_unregister(identifier);
      [*(id *)(a1 + 32) _getActivityForNameInternal:*(void *)(a1 + 40)];
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v3 = v2;
      if (v2)
      {
        [v2 setIsRegisteredWithXPC:0];
        [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v3];
      }

      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
      [*(id *)(a1 + 32) removeActivityFromPersistedState:v3];
    }
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }

- (id)getActivityForName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  int v15 = __Block_byref_object_copy__75;
  uint64_t v16 = __Block_byref_object_dispose__76;
  id v17 = 0LL;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__SUCoreXPCActivityManager_getActivityForName___block_invoke;
  block[3] = &unk_18A0F0608;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__SUCoreXPCActivityManager_getActivityForName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getActivityForNameInternal:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_getActivityForNameInternal:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = self->_activities;
  id v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        uint64_t v11 = (void *)MEMORY[0x189612760];
        objc_msgSend(v10, "activityName", (void)v14);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = [v11 stringIsEqual:v12 to:v4];

        if ((v11 & 1) != 0)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)copyOptionsForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  __int128 v15 = __Block_byref_object_copy__75;
  __int128 v16 = __Block_byref_object_dispose__76;
  id v17 = 0LL;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__SUCoreXPCActivityManager_copyOptionsForActivity___block_invoke;
  block[3] = &unk_18A0F06D0;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__SUCoreXPCActivityManager_copyOptionsForActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v7 = v2;
    [v2 activityOptions];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 copy];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v2 = v7;
  }
}

- (id)getExpectedRunDateForActivity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  __int128 v15 = __Block_byref_object_copy__75;
  __int128 v16 = __Block_byref_object_dispose__76;
  id v17 = 0LL;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__SUCoreXPCActivityManager_getExpectedRunDateForActivity___block_invoke;
  block[3] = &unk_18A0F06D0;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__SUCoreXPCActivityManager_getExpectedRunDateForActivity___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) _getActivityForNameInternal:*(void *)(a1 + 40)];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 activityOptions];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 runDate];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(a1 + 32) logger];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "Activity '%@' has a predicted run date of %@",  (uint8_t *)&v12,  0x16u);
    }
  }
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  [NSString stringWithFormat:@"Name: %@ NumActivicies: %lu {\n", self->_managerName, -[NSMutableArray count](self->_activities, "count")];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = self->_activities;
  uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0LL;
      id v9 = v3;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        [NSString stringWithFormat:@"{\n\t%@\n}", *(void *)(*((void *)&v13 + 1) + 8 * v8)];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 stringByAppendingString:v10];
        uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        id v9 = v3;
      }

      while (v6 != v8);
      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  [v3 stringByAppendingString:@"}"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)managerName
{
  return self->_managerName;
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (OS_dispatch_queue)managerQueue
{
  return self->_managerQueue;
}

- (void)setManagerQueue:(id)a3
{
}

- (OS_dispatch_queue)persistedStateDispatchQueue
{
  return self->_persistedStateDispatchQueue;
}

- (void)setPersistedStateDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (SUCorePersistedState)persistedState
{
  return self->_persistedState;
}

- (void)setPersistedState:(id)a3
{
}

- (void).cxx_destruct
{
}

void __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_187A54000,  log,  OS_LOG_TYPE_ERROR,  "Persisted state file path for manager %@ is %@",  (uint8_t *)&v3,  0x16u);
}

void __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_187A54000,  log,  OS_LOG_TYPE_ERROR,  "Failed to create failPath. Creating failPath with filename set to bundleIdentifier",  v1,  2u);
}

@end