@interface LSSettingsStore
+ (id)sharedInstance;
- (BOOL)resetUserElectionsWithError:(id *)a3;
- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5;
- (NSMutableSet)observerSet;
- (OS_dispatch_queue)observerQueue;
- (id)_init;
- (id)addChangeObserver:(id)a3;
- (id)settingsStoreConfigurationForProcessWithAuditToken:(id *)a3;
- (unsigned)userElectionForExtensionKey:(id)a3;
- (void)removeChangeObserver:(id)a3;
@end

@implementation LSSettingsStore

+ (id)sharedInstance
{
  if (+[LSSettingsStore sharedInstance]::onceToken != -1) {
    dispatch_once(&+[LSSettingsStore sharedInstance]::onceToken, &__block_literal_global_38);
  }
  return (id)+[LSSettingsStore sharedInstance]::store;
}

void __33__LSSettingsStore_sharedInstance__block_invoke()
{
  int v0 = [(id)__LSDefaultsGetSharedInstance() isServer];
  v1 = off_189D70A38;
  if (!v0) {
    v1 = off_189D709E8;
  }
  id v2 = objc_alloc_init(*v1);
  v3 = (void *)+[LSSettingsStore sharedInstance]::store;
  +[LSSettingsStore sharedInstance]::store = (uint64_t)v2;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSSettingsStore;
  id v2 = -[LSSettingsStore init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.launchservices._LSSettingsInProcessStore.notification", v3);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    observerSet = v2->_observerSet;
    v2->_observerSet = (NSMutableSet *)v6;
  }

  return v2;
}

- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5
{
  if (a5)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[LSSettingsStore setUserElection:forExtensionKey:error:]",  204LL,  0LL);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)resetUserElectionsWithError:(id *)a3
{
  if (a3)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[LSSettingsStore resetUserElectionsWithError:]",  211LL,  0LL);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (id)addChangeObserver:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_opt_new();
  uint64_t v6 = MEMORY[0x186E2A7B8](v4);
  v7 = (void *)v5[1];
  v5[1] = v6;

  SharedInstance = (void *)__LSDefaultsGetSharedInstance();
  [SharedInstance settingsUpdateNotificationNameForUserID:geteuid()];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  observerQueue = self->_observerQueue;
  uint64_t v11 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __37__LSSettingsStore_addChangeObserver___block_invoke;
  v21[3] = &unk_189D74BF8;
  id v12 = v9;
  id v22 = v12;
  v13 = v5;
  id v23 = v13;
  LaunchServices::notifyd::NotifyToken::RegisterDispatch(v12, observerQueue, v21, &v24);
  LaunchServices::notifyd::NotifyToken::operator=( (LaunchServices::notifyd::NotifyToken *)(v13 + 2),  (LaunchServices::notifyd::NotifyToken *)&v24);
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&v24);
  v14 = (dispatch_queue_s *)self->_observerQueue;
  block[0] = v11;
  block[1] = 3221225472LL;
  block[2] = __37__LSSettingsStore_addChangeObserver___block_invoke_36;
  block[3] = &unk_189D74BF8;
  block[4] = self;
  v15 = v13;
  id v20 = v15;
  dispatch_sync(v14, block);
  v16 = v20;
  v17 = v15;

  return v17;
}

uint64_t __37__LSSettingsStore_addChangeObserver___block_invoke(uint64_t a1)
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __37__LSSettingsStore_addChangeObserver___block_invoke_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 8LL) + 16LL))();
}

uint64_t __37__LSSettingsStore_addChangeObserver___block_invoke_36(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)removeChangeObserver:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInMethod:a2, self, @"LSSettingsStore.mm", 238, @"Unexpected class %@", v9 object file lineNumber description];
  }

  observerQueue = (dispatch_queue_s *)self->_observerQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __40__LSSettingsStore_removeChangeObserver___block_invoke;
  block[3] = &unk_189D741C8;
  id v12 = v5;
  id v10 = v5;
  dispatch_sync(observerQueue, block);
}

uint64_t __40__LSSettingsStore_removeChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0LL;

  return LaunchServices::notifyd::NotifyToken::cancel((LaunchServices::notifyd::NotifyToken *)(*(void *)(a1 + 32)
                                                                                             + 16LL));
}

- (OS_dispatch_queue)observerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSMutableSet)observerSet
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

- (unsigned)userElectionForExtensionKey:(id)a3
{
  return 0;
}

- (id)settingsStoreConfigurationForProcessWithAuditToken:(id *)a3
{
  return 0LL;
}

void __37__LSSettingsStore_addChangeObserver___block_invoke_cold_1()
{
  int v3 = 138543362;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_4_3(&dword_183E58000, v1, v2, "NotifyToken::Received(%{public}@)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end