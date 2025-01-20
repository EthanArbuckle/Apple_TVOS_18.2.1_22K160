@interface MCMSystemChangeMonitor
- (MCMSystemChangeMonitor)initWithQueue:(id)a3 flushables:(id)a4;
- (NSArray)flushables;
- (OS_dispatch_queue)queue;
- (void)userIdentityCache:(id)a3 didAddUserIdentity:(id)a4;
- (void)userIdentityCache:(id)a3 didInvalidateUserIdentity:(id)a4;
@end

@implementation MCMSystemChangeMonitor

- (MCMSystemChangeMonitor)initWithQueue:(id)a3 flushables:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCMSystemChangeMonitor;
  v9 = -[MCMSystemChangeMonitor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_flushables, a4);
  }

  return v10;
}

- (void)userIdentityCache:(id)a3 didInvalidateUserIdentity:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  -[MCMSystemChangeMonitor queue](self, "queue");
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __70__MCMSystemChangeMonitor_userIdentityCache_didInvalidateUserIdentity___block_invoke;
  block[3] = &unk_18A29E238;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)userIdentityCache:(id)a3 didAddUserIdentity:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[MCMSystemChangeMonitor queue](self, "queue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __63__MCMSystemChangeMonitor_userIdentityCache_didAddUserIdentity___block_invoke;
  v11[3] = &unk_18A29DDB8;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSArray)flushables
{
  return self->_flushables;
}

- (void).cxx_destruct
{
}

void __63__MCMSystemChangeMonitor_userIdentityCache_didAddUserIdentity___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  [*(id *)(a1 + 32) flushables];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        else {
          [v7 flush];
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v18 count:16];
    }

    while (v4);
  }

  [*(id *)(a1 + 48) libraryRepairForUserIdentity:*(void *)(a1 + 40)];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = 0LL;
  char v9 = [v8 createPathsIfNecessaryWithError:&v13];
  id v10 = v13;
  if ((v9 & 1) == 0)
  {
    container_log_handle_for_category();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_error_impl( &dword_188846000,  v11,  OS_LOG_TYPE_ERROR,  "Failed creating working directories for %@: %{public}@",  buf,  0x16u);
    }
  }
}

void __70__MCMSystemChangeMonitor_userIdentityCache_didInvalidateUserIdentity___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  [*(id *)(a1 + 32) flushables];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        else {
          [v7 flush];
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }

    while (v4);
  }
}

@end