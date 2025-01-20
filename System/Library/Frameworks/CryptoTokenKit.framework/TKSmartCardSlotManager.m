@interface TKSmartCardSlotManager
+ (TKSmartCardSlotManager)defaultManager;
- (BOOL)setupConnection;
- (NSArray)slotNames;
- (TKSmartCardSlot)slotNamed:(NSString *)name;
- (TKSmartCardSlotManager)init;
- (TKSmartCardSlotManager)initWithServer:(id)a3;
- (void)dealloc;
- (void)getSlotWithName:(NSString *)name reply:(void *)reply;
- (void)setSlotWithName:(id)a3 endpoint:(id)a4 type:(id)a5 reply:(id)a6;
@end

@implementation TKSmartCardSlotManager

+ (TKSmartCardSlotManager)defaultManager
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!defaultManager_manager)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TKSmartCardSlotManager);
    v4 = (void *)defaultManager_manager;
    defaultManager_manager = (uint64_t)v3;
  }

  objc_sync_exit(v2);

  return (TKSmartCardSlotManager *)(id)defaultManager_manager;
}

- (TKSmartCardSlotManager)init
{
  return -[TKSmartCardSlotManager initWithServer:](self, "initWithServer:", &__block_literal_global_2);
}

id __30__TKSmartCardSlotManager_init__block_invoke()
{
  return (id)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.ctkd.slot-client" options:4096];
}

- (TKSmartCardSlotManager)initWithServer:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TKSmartCardSlotManager;
  v5 = -[TKSmartCardSlotManager init](&v13, sel_init);
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x189603FC8] dictionary];
    endpoints = v5->_endpoints;
    v5->_endpoints = (NSMutableDictionary *)v6;

    dispatch_queue_t v8 = dispatch_queue_create(0LL, 0LL);
    slotNamesQueue = v5->_slotNamesQueue;
    v5->_slotNamesQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = MEMORY[0x18959C69C](v4);
    id connectionToServer = v5->_connectionToServer;
    v5->_id connectionToServer = (id)v10;

    if (!-[TKSmartCardSlotManager setupConnection](v5, "setupConnection"))
    {

      v5 = 0LL;
    }
  }

  return v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TKSmartCardSlotManager;
  -[TKSmartCardSlotManager dealloc](&v4, sel_dealloc);
}

- (BOOL)setupConnection
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B7660];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setRemoteObjectInterface:v4];

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B0788];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setExportedInterface:v5];

  [v3 setExportedObject:self];
  [v3 resume];
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  uint64_t v6 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke;
  v15[3] = &unk_189F8A320;
  id v7 = v3;
  id v16 = v7;
  [v7 synchronousRemoteObjectProxyWithErrorHandler:v15];
  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472LL;
  v14[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_14;
  v14[3] = &unk_189F8A348;
  v14[4] = &v17;
  [v8 reportChangesForSlotType:@"smartcard" reply:v14];

  objc_initWeak(&location, self);
  v11[0] = v6;
  v11[1] = 3221225472LL;
  v11[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_2;
  v11[3] = &unk_189F8A398;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  [v7 setInterruptionHandler:v11];
  if (*((_BYTE *)v18 + 24))
  {
    objc_storeWeak((id *)&self->_connection, v7);
    BOOL v9 = *((_BYTE *)v18 + 24) != 0;
  }

  else
  {
    BOOL v9 = 0;
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  TK_LOG_smartcard();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __41__TKSmartCardSlotManager_setupConnection__block_invoke_cold_1(a1);
  }

  [*(id *)(a1 + 32) invalidate];
}

uint64_t __41__TKSmartCardSlotManager_setupConnection__block_invoke_14(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v4 = (id *)WeakRetained;
    objc_sync_enter(v4);
    NSStringFromSelector(sel_slotNames);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 willChangeValueForKey:v5];

    [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = MEMORY[0x1895F87A8];
    dispatch_queue_t v8 = *(dispatch_queue_s **)(v6 + 32);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_3;
    block[3] = &unk_189F8A290;
    block[4] = v6;
    dispatch_sync(v8, block);
    NSStringFromSelector(sel_slotNames);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 didChangeValueForKey:v9];

    id v10 = objc_loadWeakRetained(v4 + 1);
    [v10 invalidate];

    objc_storeWeak(v4 + 1, 0LL);
    v11 = (const char *)[@"com.apple.ctkd.slot-server-started" UTF8String];
    id v12 = (int *)(*(void *)(a1 + 32) + 48LL);
    objc_super v13 = dispatch_queue_create("server-start-notify-q", 0LL);
    handler[0] = v7;
    handler[1] = 3221225472LL;
    handler[2] = __41__TKSmartCardSlotManager_setupConnection__block_invoke_4;
    handler[3] = &unk_189F8A370;
    v14 = v4;
    uint64_t v15 = *(void *)(a1 + 32);
    v27 = v14;
    uint64_t v28 = v15;
    uint32_t v16 = notify_register_dispatch(v11, v12, v13, handler);

    if (v16)
    {
      TK_LOG_smartcard();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_2(v16, v17);
      }
    }

    objc_sync_exit(v14);
  }

  TK_LOG_smartcard();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
  }
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0LL;
}

uint64_t __41__TKSmartCardSlotManager_setupConnection__block_invoke_4(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(*(void *)(a1 + 40) + 48LL));
}

- (NSArray)slotNames
{
  id v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_connection);

  if (!WeakRetained) {
    -[TKSmartCardSlotManager setupConnection](v2, "setupConnection");
  }
  objc_sync_exit(v2);

  uint64_t v8 = 0LL;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0LL;
  slotNamesQueue = (dispatch_queue_s *)v2->_slotNamesQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __35__TKSmartCardSlotManager_slotNames__block_invoke;
  v7[3] = &unk_189F8A3C0;
  v7[4] = v2;
  v7[5] = &v8;
  dispatch_sync(slotNamesQueue, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __35__TKSmartCardSlotManager_slotNames__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(*(id *)(v2 + 16), "count"));
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 16LL);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "addObject:", *(void *)(*((void *)&v13 + 1) + 8 * v9++), (void)v13);
        }

        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v7);
    }

    uint64_t v10 = [MEMORY[0x189603F18] arrayWithArray:v4];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v10;

    id v3 = *(void **)(*(void *)(a1 + 32) + 24LL);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v3);
}

- (void)setSlotWithName:(id)a3 endpoint:(id)a4 type:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int128 v13 = (void (**)(void))a6;
  TK_LOG_smartcard();
  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCardSlotManager setSlotWithName:endpoint:type:reply:].cold.1((uint64_t)v10);
  }

  __int128 v15 = self;
  objc_sync_enter(v15);
  NSStringFromSelector(sel_slotNames);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSmartCardSlotManager willChangeValueForKey:](v15, "willChangeValueForKey:", v16);

  endpoints = v15->_endpoints;
  if (v11) {
    -[NSMutableDictionary setObject:forKey:](endpoints, "setObject:forKey:", v11, v10);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](endpoints, "removeObjectForKey:", v10);
  }
  slotNamesQueue = (dispatch_queue_s *)v15->_slotNamesQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __62__TKSmartCardSlotManager_setSlotWithName_endpoint_type_reply___block_invoke;
  block[3] = &unk_189F8A290;
  block[4] = v15;
  dispatch_sync(slotNamesQueue, block);
  NSStringFromSelector(sel_slotNames);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSmartCardSlotManager didChangeValueForKey:](v15, "didChangeValueForKey:", v19);

  objc_sync_exit(v15);
  v13[2](v13);
}

void __62__TKSmartCardSlotManager_setSlotWithName_endpoint_type_reply___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0LL;
}

- (void)getSlotWithName:(NSString *)name reply:(void *)reply
{
  uint64_t v6 = name;
  uint64_t v7 = reply;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_connection);

  if (!WeakRetained) {
    -[TKSmartCardSlotManager setupConnection](v8, "setupConnection");
  }
  objc_sync_exit(v8);

  id v10 = objc_loadWeakRetained((id *)&v8->_connection);
  [v10 _queue];
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke;
  block[3] = &unk_189F8A410;
  block[4] = v8;
  __int128 v15 = v6;
  id v16 = v7;
  id v12 = v7;
  __int128 v13 = v6;
  dispatch_async(v11, block);
}

void __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___TKSmartCardSlot);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke_2;
    v6[3] = &unk_189F8A3E8;
    id v4 = *(id *)(a1 + 48);
    uint64_t v7 = v3;
    id v8 = v4;
    id v5 = v3;
    -[TKSmartCardSlot connectToEndpoint:synchronous:reply:](v5, "connectToEndpoint:synchronous:reply:", v2, 0LL, v6);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

uint64_t __48__TKSmartCardSlotManager_getSlotWithName_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (TKSmartCardSlot)slotNamed:(NSString *)name
{
  uint64_t v4 = name;
  id v5 = self;
  objc_sync_enter(v5);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_connection);

  if (!WeakRetained) {
    -[TKSmartCardSlotManager setupConnection](v5, "setupConnection");
  }
  objc_sync_exit(v5);

  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0LL;
  id v7 = objc_loadWeakRetained((id *)&v5->_connection);
  [v7 _queue];
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __36__TKSmartCardSlotManager_slotNamed___block_invoke;
  block[3] = &unk_189F8A438;
  __int128 v15 = &v16;
  block[4] = v5;
  uint64_t v9 = v4;
  __int128 v14 = v9;
  dispatch_sync(v8, block);

  if (v17[5])
  {
    id v10 = objc_alloc(&OBJC_CLASS___TKSmartCardSlot);
    id v11 = -[TKSmartCardSlot initWithEndpoint:error:](v10, "initWithEndpoint:error:", v17[5], 0LL);
  }

  else
  {
    id v11 = 0LL;
  }

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __36__TKSmartCardSlotManager_slotNamed___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void).cxx_destruct
{
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = 138543618;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_10_0();
  _os_log_error_impl( &dword_186E58000,  v2,  OS_LOG_TYPE_ERROR,  "ctk: connecting to slot registration server (%{public}@) failed, error %{public}@",  (uint8_t *)&v3,  0x16u);
  OUTLINED_FUNCTION_4();
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __41__TKSmartCardSlotManager_setupConnection__block_invoke_2_cold_2(int a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 138412546;
  int v3 = @"com.apple.ctkd.slot-server-started";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_ERROR,  "registering notification '%@' failed with status %u",  (uint8_t *)&v2,  0x12u);
  OUTLINED_FUNCTION_4();
}

- (void)setSlotWithName:(uint64_t)a1 endpoint:type:reply:.cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543618;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_6( &dword_186E58000,  v1,  (uint64_t)v1,  "got notification for new slot: name=%{public}@, ep=%{public}@",  (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

@end