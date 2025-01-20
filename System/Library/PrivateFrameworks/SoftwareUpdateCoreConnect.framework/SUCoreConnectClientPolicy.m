@interface SUCoreConnectClientPolicy
+ (id)_getAllowlistedClassesForKey:(id)a3;
+ (id)_getSharedClientAccessQueue;
+ (id)_getSharedClientAllowlistedClasses;
+ (id)getAllowlistedClassesForKey:(id)a3;
+ (void)clearAllowlistedClasses;
+ (void)setAllowlistedClass:(Class)a3 forKey:(id)a4;
+ (void)setAllowlistedClasses:(id)a3 forKey:(id)a4;
+ (void)setAllowlistedClasses:(id)a3 forKeys:(id)a4;
- (BOOL)usesPersistentXPCConnections;
- (NSSet)proxyObjectClasses;
- (NSString)clientID;
- (NSString)clientIDRaw;
- (NSString)description;
- (NSString)serviceName;
- (SUCoreConnectClientDelegate)clientDelegate;
- (id)initForServiceName:(id)a3 delegate:(id)a4;
- (id)initForServiceName:(id)a3 delegate:(id)a4 clientID:(id)a5;
- (int)clientProcessIdentifier;
- (void)setProxyObjectClasses:(id)a3;
- (void)setUsesPersistentXPCConnections:(BOOL)a3;
@end

@implementation SUCoreConnectClientPolicy

- (id)initForServiceName:(id)a3 delegate:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v5,  "trackAnomaly:forReason:withResult:withError:",  @"SUCoreConnectClientPolicy",  @"initForServiceName:delegate: is deprecated, use initForServiceName:delegate:clientID instead",  8123,  0);

  return 0LL;
}

- (id)initForServiceName:(id)a3 delegate:(id)a4 clientID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SUCoreConnectClientPolicy;
  v12 = -[SUCoreConnectClientPolicy init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeWeak((id *)&v13->_clientDelegate, v10);
    v14 = (void *)NSString;
    [MEMORY[0x1896079D8] processInfo];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v14 stringWithFormat:@"%@.<%d>", v11, objc_msgSend(v15, "processIdentifier")];
    clientID = v13->_clientID;
    v13->_clientID = (NSString *)v16;

    objc_storeStrong((id *)&v13->_clientIDRaw, a5);
    [MEMORY[0x1896079D8] processInfo];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_clientProcessIdentifier = [v18 processIdentifier];

    v13->_usesPersistentXPCConnections = 0;
  }

  return v13;
}

- (void)setProxyObjectClasses:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v4 = (NSSet *)a3;
  [MEMORY[0x1896127A0] sharedLogger];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl( &dword_18733E000,  v6,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConnectClientPolicy] Setting proxy object classes: %{public}@",  (uint8_t *)&v8,  0xCu);
  }

  proxyObjectClasses = self->_proxyObjectClasses;
  self->_proxyObjectClasses = v4;
}

+ (id)_getSharedClientAccessQueue
{
  if (_getSharedClientAccessQueue_sharedClientAccessQueueOnceToken != -1) {
    dispatch_once(&_getSharedClientAccessQueue_sharedClientAccessQueueOnceToken, &__block_literal_global);
  }
  return (id)_getSharedClientAccessQueue_sharedClientAccessQueue;
}

void __56__SUCoreConnectClientPolicy__getSharedClientAccessQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.SUCoreConnect.ClientAllowlistAccessQueue" UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  v2 = (void *)_getSharedClientAccessQueue_sharedClientAccessQueue;
  _getSharedClientAccessQueue_sharedClientAccessQueue = (uint64_t)v1;
}

+ (id)_getSharedClientAllowlistedClasses
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (_getSharedClientAllowlistedClasses_sharedClientAllowlistedClassesOnceToken != -1) {
    dispatch_once( &_getSharedClientAllowlistedClasses_sharedClientAllowlistedClassesOnceToken,  &__block_literal_global_12);
  }
  return (id)_getSharedClientAllowlistedClasses_sharedClientAllowlistedClasses;
}

void __63__SUCoreConnectClientPolicy__getSharedClientAllowlistedClasses__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
  dispatch_queue_t v1 = (void *)_getSharedClientAllowlistedClasses_sharedClientAllowlistedClasses;
  _getSharedClientAllowlistedClasses_sharedClientAllowlistedClasses = (uint64_t)v0;
}

+ (id)_getAllowlistedClassesForKey:(id)a3
{
  id v3 = a3;
  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "_getSharedClientAccessQueue");
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    v5 = +[SUCoreConnectClientPolicy _getSharedClientAllowlistedClasses]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "_getSharedClientAllowlistedClasses");
    [v5 safeObjectForKey:v3 ofClass:objc_opt_class()];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SUCoreConnectClientPolicy _getAllowlistedClassesForKey:].cold.1(v8);
    }

    v6 = 0LL;
  }

  return v6;
}

+ (id)getAllowlistedClassesForKey:(id)a3
{
  id v3 = a3;
  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "_getSharedClientAccessQueue");
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v4);

  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "_getSharedClientAccessQueue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __57__SUCoreConnectClientPolicy_getAllowlistedClassesForKey___block_invoke;
  v9[3] = &unk_18A02A7D8;
  id v10 = v3;
  id v11 = &v12;
  id v6 = v3;
  dispatch_sync(v5, v9);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__SUCoreConnectClientPolicy_getAllowlistedClassesForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SUCoreConnectClientPolicy _getAllowlistedClassesForKey:]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "_getAllowlistedClassesForKey:",  *(void *)(a1 + 32));
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

  +[SUCoreConnectClientPolicy setAllowlistedClasses:forKeys:]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "setAllowlistedClasses:forKeys:",  v8,  v7);
}

+ (void)setAllowlistedClasses:(id)a3 forKey:(id)a4
{
  v5 = (void *)MEMORY[0x189604010];
  id v6 = a3;
  [v5 setWithObject:a4];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SUCoreConnectClientPolicy setAllowlistedClasses:forKeys:]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "setAllowlistedClasses:forKeys:",  v6,  v7);
}

+ (void)setAllowlistedClasses:(id)a3 forKeys:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "_getSharedClientAccessQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v6);

  if (v5 && [v5 count])
  {
    if (v10 && [v10 count])
    {
      +[SUCoreConnectClientPolicy _getSharedClientAccessQueue]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "_getSharedClientAccessQueue");
      id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __59__SUCoreConnectClientPolicy_setAllowlistedClasses_forKeys___block_invoke;
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
      [v8 trackAnomaly:@"SUCoreConnectClientPolicy" forReason:v9 withResult:8102 withError:0];
    }
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 trackAnomaly:@"SUCoreConnectClientPolicy" forReason:@"Cannot set allowlisted classes for a nil/empty NSSet of keys" withResult:8102 withError:0];
  }
}

void __59__SUCoreConnectClientPolicy_setAllowlistedClasses_forKeys___block_invoke(uint64_t a1)
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

        +[SUCoreConnectClientPolicy _getAllowlistedClassesForKey:]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "_getAllowlistedClassesForKey:",  v6);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          uint64_t v12 = [v10 setByAddingObjectsFromSet:v11];

          id v10 = (void *)v12;
        }

        [v10 setByAddingObjectsFromSet:*(void *)(a1 + 40)];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[SUCoreConnectClientPolicy _getSharedClientAllowlistedClasses]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "_getSharedClientAllowlistedClasses");
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

  +[SUCoreConnectClientPolicy _getSharedClientAccessQueue]( &OBJC_CLASS___SUCoreConnectClientPolicy,  "_getSharedClientAccessQueue");
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_sync(v3, &__block_literal_global_20);
}

void __52__SUCoreConnectClientPolicy_clearAllowlistedClasses__block_invoke()
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
    _os_log_impl( &dword_18733E000,  v2,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConnectClientPolicy] All entries removed from allowlisted classes dictionary",  v3,  2u);
  }
}

- (NSString)description
{
  uint64_t v3 = (void *)NSString;
  -[SUCoreConnectClientPolicy serviceName](self, "serviceName");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConnectClientPolicy clientID](self, "clientID");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"SUCoreConnectClientPolicy(serviceName:%@|clientID:%@)", v4, v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (SUCoreConnectClientDelegate)clientDelegate
{
  return (SUCoreConnectClientDelegate *)objc_loadWeakRetained((id *)&self->_clientDelegate);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)clientIDRaw
{
  return self->_clientIDRaw;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (NSSet)proxyObjectClasses
{
  return self->_proxyObjectClasses;
}

- (BOOL)usesPersistentXPCConnections
{
  return self->_usesPersistentXPCConnections;
}

- (void)setUsesPersistentXPCConnections:(BOOL)a3
{
  self->_usesPersistentXPCConnections = a3;
}

- (void).cxx_destruct
{
}

+ (void)_getAllowlistedClassesForKey:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)dispatch_queue_t v1 = 0;
  _os_log_error_impl( &dword_18733E000,  log,  OS_LOG_TYPE_ERROR,  "[SUCoreConnectClientPolicy] Cannot get allowlisted for a nil key, returning no allowlisted classes",  v1,  2u);
}

@end