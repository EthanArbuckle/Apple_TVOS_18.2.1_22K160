@interface MCMChildParentMapCache
- (MCMChildParentMapCache)initWithDB:(id)a3 queue:(id)a4;
- (MCMSQLiteDB)db;
- (NSMutableDictionary)cache;
- (OS_dispatch_queue)queue;
- (id)childBundleIdentifiersForParentIdentifier:(id)a3;
- (id)parentIdentifierForChildIdentifier:(id)a3;
- (void)codeSigningDB:(id)a3 addChildIdentifier:(id)a4 forParentIdentifier:(id)a5;
- (void)codeSigningDB:(id)a3 removeParentIdentifier:(id)a4;
@end

@implementation MCMChildParentMapCache

- (MCMChildParentMapCache)initWithDB:(id)a3 queue:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v8 = (dispatch_queue_s *)a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMChildParentMapCache;
  v9 = -[MCMChildParentMapCache init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_db, a3);
    [v7 setPeerageDelegate:v10];
    objc_storeStrong((id *)&v10->_queue, a4);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __43__MCMChildParentMapCache_initWithDB_queue___block_invoke;
    block[3] = &unk_18A29E238;
    v13 = v10;
    id v14 = v7;
    dispatch_sync(v8, block);
  }

  return v10;
}

- (id)childBundleIdentifiersForParentIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_opt_new();
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  -[MCMChildParentMapCache cache](v5, "cache");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        v12 = -[MCMChildParentMapCache cache](v5, "cache");
        [v12 objectForKeyedSubscript:v11];
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }

    while (v8);
  }

  id v14 = (void *)[v6 copy];
  objc_sync_exit(v5);

  return v14;
}

- (id)parentIdentifierForChildIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[MCMChildParentMapCache cache](v5, "cache");
  [v6 objectForKeyedSubscript:v4];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)codeSigningDB:(id)a3 addChildIdentifier:(id)a4 forParentIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  -[MCMChildParentMapCache cache](self, "cache");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 setObject:v7 forKeyedSubscript:v8];
}

- (void)codeSigningDB:(id)a3 removeParentIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  v6 = (void *)objc_opt_new();
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  -[MCMChildParentMapCache cache](self, "cache");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
        v13 = -[MCMChildParentMapCache cache](self, "cache");
        [v13 objectForKeyedSubscript:v12];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }

    while (v9);
  }

  -[MCMChildParentMapCache cache](self, "cache");
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 allObjects];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 removeObjectsForKeys:v16];
}

- (MCMSQLiteDB)db
{
  return self->_db;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
}

void __43__MCMChildParentMapCache_initWithDB_queue___block_invoke(uint64_t a1)
{
  v8[1] = *(id *)MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 40);
  v8[0] = 0LL;
  [v2 childParentMapWithError:v8];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v8[0];
  uint64_t v5 = [v3 mutableCopy];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;
}

@end