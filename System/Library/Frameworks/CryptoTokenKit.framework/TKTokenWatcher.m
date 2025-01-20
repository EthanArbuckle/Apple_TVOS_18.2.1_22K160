@interface TKTokenWatcher
- (NSArray)tokenIDs;
- (NSXPCListenerEndpoint)endpoint;
- (TKClientToken)client;
- (TKTokenWatcher)init;
- (TKTokenWatcher)initWithClient:(id)a3;
- (TKTokenWatcher)initWithEndpoint:(id)a3;
- (TKTokenWatcher)initWithInsertionHandler:(void *)insertionHandler;
- (TKTokenWatcherTokenInfo)tokenInfoForTokenID:(NSString *)tokenID;
- (void)addRemovalHandler:(void *)removalHandler forTokenID:(NSString *)tokenID;
- (void)dealloc;
- (void)insertedToken:(id)a3;
- (void)removeAllTokens;
- (void)removedToken:(id)a3;
- (void)setInsertionHandler:(void *)insertionHandler;
- (void)startWatching;
@end

@implementation TKTokenWatcher

- (void)startWatching
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl( &dword_186E58000,  log,  OS_LOG_TYPE_ERROR,  "Failed to get TKTokenWatcher endpoint, watcher will be mute.",  v1,  2u);
  OUTLINED_FUNCTION_8();
}

void __31__TKTokenWatcher_startWatching__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((void *)WeakRetained + 2);
    *((void *)WeakRetained + 2) = 0LL;

    [v2 removeAllTokens];
  }

  TK_LOG_watcher();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __31__TKTokenWatcher_startWatching__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

void __31__TKTokenWatcher_startWatching__block_invoke_39(uint64_t a1, void *a2)
{
  id v2 = a2;
  TK_LOG_watcher();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __31__TKTokenWatcher_startWatching__block_invoke_39_cold_1((uint64_t)v2, v3);
  }
}

void __31__TKTokenWatcher_startWatching__block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "firstObject", (void)v14);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 24LL);
          [v9 firstObject];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 objectForKeyedSubscript:v12];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v11) = v13 == 0LL;

          if ((_DWORD)v11) {
            [*(id *)(a1 + 32) insertedToken:v9];
          }
        }
      }

      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v6);
  }

  objc_sync_exit(v4);
}

- (TKTokenWatcher)initWithClient:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TKTokenWatcher;
  id v5 = -[TKTokenWatcher init](&v20, sel_init);
  if (v5)
  {
    if (v4) {
      uint64_t v6 = (TKClientToken *)v4;
    }
    else {
      uint64_t v6 = -[TKClientToken initWithTokenID:]( objc_alloc(&OBJC_CLASS___TKClientToken),  "initWithTokenID:",  &stru_189F8C1A8);
    }
    client = v5->_client;
    v5->_client = v6;

    uint64_t v8 = [MEMORY[0x189603FC8] dictionary];
    removalHandlers = v5->_removalHandlers;
    v5->_removalHandlers = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x189604A60] mutableCopy];
    tokenInfos = v5->_tokenInfos;
    v5->_tokenInfos = (NSMutableDictionary *)v10;

    -[TKTokenWatcher startWatching](v5, "startWatching");
    objc_initWeak(&location, v5);
    v12 = (const char *)[@"com.apple.ctkd.watcher-started" UTF8String];
    v13 = dispatch_queue_create("server-start-notify-q", 0LL);
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __33__TKTokenWatcher_initWithClient___block_invoke;
    v17[3] = &unk_189F8BC80;
    objc_copyWeak(&v18, &location);
    uint32_t v14 = notify_register_dispatch(v12, &v5->_notifyToken, v13, v17);

    if (v14)
    {
      TK_LOG_watcher();
      __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[TKTokenWatcher initWithClient:].cold.1(v14, v15);
      }
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __33__TKTokenWatcher_initWithClient___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained startWatching];
}

- (TKTokenWatcher)init
{
  return -[TKTokenWatcher initWithClient:](self, "initWithClient:", 0LL);
}

- (TKTokenWatcher)initWithEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = -[TKClientToken initWithTokenID:serverEndpoint:targetUID:]( objc_alloc(&OBJC_CLASS___TKClientToken),  "initWithTokenID:serverEndpoint:targetUID:",  &stru_189F8C1A8,  v4,  0LL);

  uint64_t v6 = -[TKTokenWatcher initWithClient:](self, "initWithClient:", v5);
  return v6;
}

- (NSXPCListenerEndpoint)endpoint
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 endpoint];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKTokenWatcher;
  -[TKTokenWatcher dealloc](&v3, sel_dealloc);
}

- (TKTokenWatcher)initWithInsertionHandler:(void *)insertionHandler
{
  id v4 = insertionHandler;
  id v5 = -[TKTokenWatcher init](self, "init");
  uint64_t v6 = v5;
  if (v5)
  {
    -[NSXPCConnection _queue](v5->_connection, "_queue");
    uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __43__TKTokenWatcher_initWithInsertionHandler___block_invoke;
    v9[3] = &unk_189F8A5B0;
    uint64_t v10 = v6;
    id v11 = v4;
    dispatch_async(v7, v9);
  }

  return v6;
}

uint64_t __43__TKTokenWatcher_initWithInsertionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInsertionHandler:*(void *)(a1 + 40)];
}

- (void)setInsertionHandler:(void *)insertionHandler
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = insertionHandler;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = MEMORY[0x18959C69C](v4);
  id v7 = v5->_insertionHandler;
  v5->_insertionHandler = (id)v6;

  if (v5->_insertionHandler)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    uint64_t v8 = v5->_tokenInfos;
    uint64_t v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          (*((void (**)(id))v5->_insertionHandler + 2))(v5->_insertionHandler);
          ++v11;
        }

        while (v9 != v11);
        uint64_t v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v9);
    }
  }

  objc_sync_exit(v5);
}

- (void)addRemovalHandler:(void *)removalHandler forTokenID:(NSString *)tokenID
{
  uint64_t v11 = removalHandler;
  uint64_t v6 = tokenID;
  id v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_tokenInfos, "objectForKeyedSubscript:", v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    removalHandlers = v7->_removalHandlers;
    uint64_t v10 = (void *)MEMORY[0x18959C69C](v11);
    -[NSMutableDictionary setObject:forKey:](removalHandlers, "setObject:forKey:", v10, v6);
  }

  else
  {
    v11[2](v11, v6);
  }

  objc_sync_exit(v7);
}

- (void)insertedToken:(id)a3
{
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = -[TKTokenWatcherTokenInfo initWithTokenInfo:]( objc_alloc(&OBJC_CLASS___TKTokenWatcherTokenInfo),  "initWithTokenInfo:",  v12);
  NSStringFromSelector(sel_tokenIDs);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenWatcher willChangeValueForKey:](v4, "willChangeValueForKey:", v6);

  tokenInfos = v4->_tokenInfos;
  -[TKTokenWatcherTokenInfo tokenID](v5, "tokenID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](tokenInfos, "setObject:forKeyedSubscript:", v5, v8);

  NSStringFromSelector(sel_tokenIDs);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenWatcher didChangeValueForKey:](v4, "didChangeValueForKey:", v9);

  insertionHandler = (void (**)(id, void *))v4->_insertionHandler;
  if (insertionHandler)
  {
    -[TKTokenWatcherTokenInfo tokenID](v5, "tokenID");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    insertionHandler[2](insertionHandler, v11);
  }

  objc_sync_exit(v4);
}

- (void)removedToken:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](v4->_tokenInfos, "objectForKeyedSubscript:", v10);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    NSStringFromSelector(sel_tokenIDs);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenWatcher willChangeValueForKey:](v4, "willChangeValueForKey:", v6);

    -[NSMutableDictionary removeObjectForKey:](v4->_tokenInfos, "removeObjectForKey:", v10);
    NSStringFromSelector(sel_tokenIDs);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenWatcher didChangeValueForKey:](v4, "didChangeValueForKey:", v7);

    uint64_t v8 = -[NSMutableDictionary objectForKey:](v4->_removalHandlers, "objectForKey:", v10);
    uint64_t v9 = (void *)v8;
    if (v8)
    {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
      -[NSMutableDictionary removeObjectForKey:](v4->_removalHandlers, "removeObjectForKey:", v10);
    }
  }

  objc_sync_exit(v4);
}

- (void)removeAllTokens
{
}

- (NSArray)tokenIDs
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_tokenInfos, "allKeys");
}

- (TKTokenWatcherTokenInfo)tokenInfoForTokenID:(NSString *)tokenID
{
  id v4 = tokenID;
  id v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_tokenInfos, "objectForKeyedSubscript:", v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return (TKTokenWatcherTokenInfo *)v6;
}

- (TKClientToken)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

void __31__TKTokenWatcher_startWatching__block_invoke_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __31__TKTokenWatcher_startWatching__block_invoke_39_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_ERROR,  "failed to register TKTokenWatcher, error %{public}@",  (uint8_t *)&v2,  0xCu);
}

- (void)initWithClient:(int)a1 .cold.1(int a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 138412546;
  uint64_t v3 = @"com.apple.ctkd.watcher-started";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_ERROR,  "registering notification '%@' failed with status %u",  (uint8_t *)&v2,  0x12u);
}

@end