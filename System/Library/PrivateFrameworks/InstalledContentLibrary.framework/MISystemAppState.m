@interface MISystemAppState
+ (id)_systemAppStateFromURL:(id)a3;
+ (id)sharedList;
- (MISystemAppState)init;
- (NSMutableDictionary)systemAppStateList;
- (OS_dispatch_queue)appStateQueue;
- (id)_onQueue_retrieveSystemAppStateRestoringBackedUpState:(BOOL)a3;
- (id)_onQueue_systemAppStateList;
- (id)systemAppStateDictionaryRestoringBackedUpState:(BOOL)a3;
- (void)_onQueue_setSystemAppStateList:(id)a3;
- (void)addIdentifier:(id)a3 withState:(int)a4;
- (void)removeIdentifiers:(id)a3;
- (void)setSystemAppStateList:(id)a3;
@end

@implementation MISystemAppState

- (MISystemAppState)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MISystemAppState;
  v2 = -[MISystemAppState init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MobileInstallation.SystemAppStateQueue", v3);
    appStateQueue = v2->_appStateQueue;
    v2->_appStateQueue = (OS_dispatch_queue *)v4;
  }

  return v2;
}

+ (id)_systemAppStateFromURL:(id)a3
{
  id v3 = a3;
  id v15 = 0LL;
  objc_msgSend(MEMORY[0x189603FC8], "MI_dictionaryWithContentsOfURL:options:error:", v3, 1, &v15);
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v15;
  v6 = v5;
  if (!v4)
  {
    [v5 domain];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v10 isEqualToString:*MEMORY[0x189607460]])
    {
      uint64_t v11 = [v6 code];

      if (v11 == 260) {
        goto LABEL_14;
      }
    }

    else
    {
    }

+ (id)sharedList
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__MISystemAppState_sharedList__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedList_onceToken != -1) {
    dispatch_once(&sharedList_onceToken, block);
  }
  return (id)sharedList_sharedList;
}

void __30__MISystemAppState_sharedList__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedList_sharedList;
  sharedList_sharedList = (uint64_t)v0;
}

- (id)_onQueue_systemAppStateList
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MISystemAppState systemAppStateList](self, "systemAppStateList");
  dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 systemAppInstallStateFilePath];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    [(id)objc_opt_class() _systemAppStateFromURL:v6];
    dispatch_queue_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MISystemAppState setSystemAppStateList:](self, "setSystemAppStateList:", v4);
  }

  return v4;
}

- (id)_onQueue_retrieveSystemAppStateRestoringBackedUpState:(BOOL)a3
{
  BOOL v3 = a3;
  -[MISystemAppState appStateQueue](self, "appStateQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v3)
  {
    v6 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
    [v6 backupSystemAppInstallStateFilePath];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    [(id)objc_opt_class() _systemAppStateFromURL:v7];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      uint64_t v11 = v8;
      MOLogWrite();
    }

    -[MISystemAppState _onQueue_setSystemAppStateList:](self, "_onQueue_setSystemAppStateList:", v8, v11);
    -[MISystemAppState systemAppStateList](self, "systemAppStateList");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[MISystemAppState _onQueue_systemAppStateList](self, "_onQueue_systemAppStateList");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_onQueue_setSystemAppStateList:(id)a3
{
  id v4 = a3;
  -[MISystemAppState appStateQueue](self, "appStateQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MISystemAppState setSystemAppStateList:](self, "setSystemAppStateList:", v4);
  v6 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  [v6 systemAppInstallStateFilePath];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && [v4 count])
  {
    -[MISystemAppState systemAppStateList](self, "systemAppStateList");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = 0LL;
    char v9 = objc_msgSend(v8, "MI_writeToURL:format:options:error:", v7, 200, 268435457, &v14);
    id v10 = v14;

    if ((v9 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      [v7 path];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else
  {
    +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = 0LL;
    char v12 = [v11 removeItemAtURL:v7 error:&v15];
    id v10 = v15;
  }
}

- (id)systemAppStateDictionaryRestoringBackedUpState:(BOOL)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  v13 = __Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  id v15 = 0LL;
  -[MISystemAppState appStateQueue](self, "appStateQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__MISystemAppState_systemAppStateDictionaryRestoringBackedUpState___block_invoke;
  block[3] = &unk_189D48898;
  BOOL v9 = a3;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __67__MISystemAppState_systemAppStateDictionaryRestoringBackedUpState___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addIdentifier:(id)a3 withState:(int)a4
{
  id v6 = a3;
  -[MISystemAppState appStateQueue](self, "appStateQueue");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__MISystemAppState_addIdentifier_withState___block_invoke;
  block[3] = &unk_189D488C0;
  block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

void __44__MISystemAppState_addIdentifier_withState___block_invoke(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = [v2 unsignedIntegerValue];
  int v4 = *(_DWORD *)(a1 + 48);

  if (v4 != v3)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_setSystemAppStateList:", v6);
  }
}

- (void)removeIdentifiers:(id)a3
{
  id v4 = a3;
  -[MISystemAppState appStateQueue](self, "appStateQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__MISystemAppState_removeIdentifiers___block_invoke;
  block[3] = &unk_189D488E8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __38__MISystemAppState_removeIdentifiers___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v3 count];
  [v3 removeObjectsForKeys:*(void *)(a1 + 40)];
  if (v2 != [v3 count]) {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_setSystemAppStateList:", v3);
  }
}

- (OS_dispatch_queue)appStateQueue
{
  return self->_appStateQueue;
}

- (NSMutableDictionary)systemAppStateList
{
  return self->_systemAppStateList;
}

- (void)setSystemAppStateList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end