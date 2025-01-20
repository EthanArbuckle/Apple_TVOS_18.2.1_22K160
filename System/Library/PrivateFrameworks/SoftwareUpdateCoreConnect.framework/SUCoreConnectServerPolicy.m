@interface SUCoreConnectServerPolicy
+ (id)_getAllowlistedClassesForKey:(id)a3;
+ (id)_getSharedServerAccessQueue;
+ (id)_getSharedServerAllowlistedClasses;
+ (id)getAllowlistedClassesForKey:(id)a3;
+ (void)clearAllowlistedClasses;
+ (void)setAllowlistedClass:(Class)a3 forKey:(id)a4;
+ (void)setAllowlistedClasses:(id)a3 forKey:(id)a4;
+ (void)setAllowlistedClasses:(id)a3 forKeys:(id)a4;
- (NSSet)entitlements;
- (NSString)description;
- (NSString)serviceName;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_queue)delegateQueue;
- (SUCoreConnectServerDelegate)serverDelegate;
- (SUCoreConnectServerPolicy)initWithServiceName:(id)a3 entitlements:(id)a4 serverDelegate:(id)a5;
@end

@implementation SUCoreConnectServerPolicy

- (SUCoreConnectServerPolicy)initWithServiceName:(id)a3 entitlements:(id)a4 serverDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SUCoreConnectServerPolicy;
  v12 = -[SUCoreConnectServerPolicy init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeStrong((id *)&v13->_entitlements, a4);
    objc_storeWeak((id *)&v13->_serverDelegate, v11);
    v14 = (const char *)[@"com.apple.SUCoreConnect.ConnectionQueue" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    connectionQueue = v13->_connectionQueue;
    v13->_connectionQueue = (OS_dispatch_queue *)v16;

    v18 = (const char *)[@"com.apple.SUCoreConnect.ServerDelegateQueue" UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    delegateQueue = v13->_delegateQueue;
    v13->_delegateQueue = (OS_dispatch_queue *)v20;
  }

  return v13;
}

+ (id)_getSharedServerAccessQueue
{
  if (_getSharedServerAccessQueue_sharedServerAccessQueueOnceToken != -1) {
    dispatch_once(&_getSharedServerAccessQueue_sharedServerAccessQueueOnceToken, &__block_literal_global_0);
  }
  return (id)_getSharedServerAccessQueue_sharedServerAccessQueue;
}

void __56__SUCoreConnectServerPolicy__getSharedServerAccessQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.SUCoreConnect.ServerAllowlistAccessQueue" UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)_getSharedServerAccessQueue_sharedServerAccessQueue;
  _getSharedServerAccessQueue_sharedServerAccessQueue = (uint64_t)v1;
}

+ (id)_getSharedServerAllowlistedClasses
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (_getSharedServerAllowlistedClasses_sharedServerAllowlistedClassesOnceToken != -1) {
    dispatch_once( &_getSharedServerAllowlistedClasses_sharedServerAllowlistedClassesOnceToken,  &__block_literal_global_6);
  }
  return (id)_getSharedServerAllowlistedClasses_sharedServerAllowlistedClasses;
}

void __63__SUCoreConnectServerPolicy__getSharedServerAllowlistedClasses__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
  dispatch_queue_t v1 = (void *)_getSharedServerAllowlistedClasses_sharedServerAllowlistedClasses;
  _getSharedServerAllowlistedClasses_sharedServerAllowlistedClasses = (uint64_t)v0;
}

+ (id)_getAllowlistedClassesForKey:(id)a3
{
  id v3 = a3;
  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "_getSharedServerAccessQueue");
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    v5 = +[SUCoreConnectServerPolicy _getSharedServerAllowlistedClasses]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "_getSharedServerAllowlistedClasses");
    [v5 safeObjectForKey:v3 ofClass:objc_opt_class()];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( &dword_18733E000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConnectServerPolicy] Cannot get allowlisted for a nil key, returning no allowlisted classes",  v10,  2u);
    }

    v6 = 0LL;
  }

  return v6;
}

+ (id)getAllowlistedClassesForKey:(id)a3
{
  id v3 = a3;
  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "_getSharedServerAccessQueue");
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = __Block_byref_object_copy__1;
  dispatch_queue_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0LL;
  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "_getSharedServerAccessQueue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __57__SUCoreConnectServerPolicy_getAllowlistedClassesForKey___block_invoke;
  v9[3] = &unk_18A02A7D8;
  id v10 = v3;
  id v11 = &v12;
  id v6 = v3;
  dispatch_sync(v5, v9);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__SUCoreConnectServerPolicy_getAllowlistedClassesForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SUCoreConnectServerPolicy _getAllowlistedClassesForKey:]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "_getAllowlistedClassesForKey:",  *(void *)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (void)setAllowlistedClass:(Class)a3 forKey:(id)a4
{
  v5 = (void *)MEMORY[0x189604010];
  id v6 = a4;
  [v5 setWithObject:a3];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604010] setWithObject:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUCoreConnectServerPolicy setAllowlistedClasses:forKeys:]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "setAllowlistedClasses:forKeys:",  v8,  v7);
}

+ (void)setAllowlistedClasses:(id)a3 forKey:(id)a4
{
  v5 = (void *)MEMORY[0x189604010];
  id v6 = a3;
  [v5 setWithObject:a4];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SUCoreConnectServerPolicy setAllowlistedClasses:forKeys:]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "setAllowlistedClasses:forKeys:",  v6,  v7);
}

+ (void)setAllowlistedClasses:(id)a3 forKeys:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "_getSharedServerAccessQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  if (v5 && [v5 count])
  {
    if (v10 && [v10 count])
    {
      +[SUCoreConnectServerPolicy _getSharedServerAccessQueue]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "_getSharedServerAccessQueue");
      id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __59__SUCoreConnectServerPolicy_setAllowlistedClasses_forKeys___block_invoke;
      block[3] = &unk_18A02A800;
      id v12 = v5;
      id v13 = v10;
      dispatch_sync(v7, block);

      id v8 = v12;
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithFormat:@"Cannot set nil/empty NSSet of classes for keys %@", v5];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 trackAnomaly:@"SUCoreConnectServerPolicy" forReason:v9 withResult:8102 withError:0];
    }
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 trackAnomaly:@"SUCoreConnectServerPolicy" forReason:@"Cannot set allowlisted classes for a nil/empty NSSet of keys" withResult:8102 withError:0];
  }
}

void __59__SUCoreConnectServerPolicy_setAllowlistedClasses_forKeys___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x1895A2D90]();
        id v8 = (void *)MEMORY[0x189604010];
        +[SUCoreConnectConstants defaultClasses](&OBJC_CLASS___SUCoreConnectConstants, "defaultClasses");
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setWithArray:v9];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();

        +[SUCoreConnectServerPolicy _getAllowlistedClassesForKey:]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "_getAllowlistedClassesForKey:",  v6);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          uint64_t v12 = [v10 setByAddingObjectsFromSet:v11];

          id v10 = (void *)v12;
        }

        [v10 setByAddingObjectsFromSet:*(void *)(a1 + 40)];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[SUCoreConnectServerPolicy _getSharedServerAllowlistedClasses]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "_getSharedServerAllowlistedClasses");
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 setSafeObject:v13 forKey:v6];

        objc_autoreleasePoolPop(v7);
        ++v5;
      }

      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v3);
  }
}

+ (void)clearAllowlistedClasses
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v2);

  +[SUCoreConnectServerPolicy _getSharedServerAccessQueue]( &OBJC_CLASS___SUCoreConnectServerPolicy,  "_getSharedServerAccessQueue");
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_sync(v3, &__block_literal_global_19);
}

void __52__SUCoreConnectServerPolicy_clearAllowlistedClasses__block_invoke()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 removeAllObjects];

  [MEMORY[0x1896127A0] sharedLogger];
  dispatch_queue_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 oslog];
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( &dword_18733E000,  v2,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConnectServerPolicy] All entries removed from allowlisted classes dictionary",  v3,  2u);
  }
}

- (NSString)description
{
  uint64_t v2 = (void *)NSString;
  -[SUCoreConnectServerPolicy serviceName](self, "serviceName");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"SUCoreConnectServerPolicy(serviceName:%@)", v3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSSet)entitlements
{
  return self->_entitlements;
}

- (SUCoreConnectServerDelegate)serverDelegate
{
  return (SUCoreConnectServerDelegate *)objc_loadWeakRetained((id *)&self->_serverDelegate);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
}

@end