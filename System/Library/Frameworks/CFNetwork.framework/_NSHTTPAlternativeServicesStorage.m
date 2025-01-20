@interface _NSHTTPAlternativeServicesStorage
+ (id)sharedPersistentStore;
- (BOOL)canSuspendLocked;
- (NSURL)path;
- (_NSHTTPAlternativeServiceEntry)_onqueue_convertSqlRowToHTTPAlternativeServiceEntry:(uint64_t)a1;
- (_NSHTTPAlternativeServicesStorage)init;
- (id)HTTPServiceEntriesWithFilter:(id)a3;
- (id)HTTPServiceEntriesWithRegistrableDomain:(id)a3;
- (id)entries;
- (id)initInMemoryStore;
- (id)initPersistentStoreWithURL:(id)a3;
- (uint64_t)_createDBSchemaForPath:(uint64_t)a1;
- (uint64_t)_onqueue_garbageCollect;
- (uint64_t)_onqueue_initializeDatabaseIfNotEmpty:(uint64_t)a1;
- (void)dealloc;
- (void)removeHTTPAlternativeServiceEntriesCreatedAfterDate:(id)a3;
- (void)removeHTTPAlternativeServiceEntriesWithHost:(id)a3 port:(int64_t)a4;
- (void)removeHTTPAlternativeServiceEntriesWithRegistrableDomain:(id)a3;
- (void)setCanSuspendLocked:(BOOL)a3;
- (void)storeHTTPServiceEntry:(id)a3;
@end

@implementation _NSHTTPAlternativeServicesStorage

- (id)HTTPServiceEntriesWithFilter:(id)a3
{
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy__2695;
  v17 = __Block_byref_object_dispose__2696;
  id v18 = (id)MEMORY[0x189604A58];
  id v4 = a3;
  v5 = (void *)[v4 copy];
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66___NSHTTPAlternativeServicesStorage_HTTPServiceEntriesWithFilter___block_invoke;
  block[3] = &unk_189C19500;
  block[4] = self;
  id v11 = v5;
  v12 = &v13;
  id v7 = v5;
  dispatch_sync(workQueue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (uint64_t)_onqueue_initializeDatabaseIfNotEmpty:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (*(_BYTE *)(a1 + 25)) {
    return 1LL;
  }
  if (*(_BYTE *)(a1 + 26) && (a2 & 1) != 0) {
    return 0LL;
  }
  id v4 = *(void **)(a1 + 8);
  if (!*(_BYTE *)(a1 + 26) && !v4)
  {
    [MEMORY[0x1896077F8] mainBundle];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 bundleIdentifier];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      [NSString stringWithCString:*(void *)_CFGetProgname() encoding:4];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [MEMORY[0x1896078A8] defaultManager];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 URLsForDirectory:5 inDomains:1];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 firstObject];
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    id v26 = 0LL;
    uint64_t v10 = *MEMORY[0x189603DF8];
    id v25 = 0LL;
    int v11 = [v9 getResourceValue:&v26 forKey:v10 error:&v25];
    id v12 = v26;
    id v13 = v25;
    if (v11 && [v12 BOOLValue])
    {
      [v9 URLByAppendingPathComponent:@"HTTPStorages" isDirectory:1];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 URLByAppendingPathComponent:v6 isDirectory:1];
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x1896078A8] defaultManager];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:0];

      [v15 setResourceValue:MEMORY[0x189604A88] forKey:*MEMORY[0x189603C50] error:0];
      uint64_t v17 = [v15 URLByAppendingPathComponent:@"httpstorages.sqlite" isDirectory:0];
      id v18 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v17;
    }

    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      id v15 = (id)CFNLog::logger;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v9;
        __int16 v29 = 2112;
        id v30 = v13;
        _os_log_impl( &dword_18298D000,  (os_log_t)v15,  OS_LOG_TYPE_INFO,  "Volume of %@ is not local, falling back to in memory alt-svc storage: %@",  buf,  0x16u);
      }
    }

    if (!*(void *)(a1 + 8)) {
      *(_BYTE *)(a1 + 26) = 1;
    }

    id v4 = *(void **)(a1 + 8);
  }

  if ((-[_NSHTTPAlternativeServicesStorage _createDBSchemaForPath:](a1, v4) & 1) == 0)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v19 = (os_log_s *)(id)CFNLog::logger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v23 = *(void **)(a1 + 8);
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      _os_log_debug_impl( &dword_18298D000,  v19,  OS_LOG_TYPE_DEBUG,  "Unable to create the Alternative Storage at location %@. Falling back to memory storage",  buf,  0xCu);
    }

    -[_NSHTTPAlternativeServicesStorage _createDBSchemaForPath:](a1, 0LL);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 28));
  uint64_t v3 = 1LL;
  *(_BYTE *)(a1 + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 28));
  v20 = *(dispatch_queue_s **)(a1 + 16);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __75___NSHTTPAlternativeServicesStorage__onqueue_initializeDatabaseIfNotEmpty___block_invoke;
  block[3] = &unk_189C1A548;
  block[4] = a1;
  dispatch_block_t v21 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v20, v21);

  *(_BYTE *)(a1 + 25) = 1;
  return v3;
}

+ (id)sharedPersistentStore
{
  v2 = (void *)sAltServiceSharedInstance;
  if (!sAltServiceSharedInstance)
  {
    if (+[_NSHTTPAlternativeServicesStorage sharedPersistentStore]::sOnce != -1) {
      dispatch_once(&+[_NSHTTPAlternativeServicesStorage sharedPersistentStore]::sOnce, &__block_literal_global_2711);
    }
    v2 = (void *)sAltServiceSharedInstance;
  }

  return v2;
}

- (_NSHTTPAlternativeServicesStorage)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____NSHTTPAlternativeServicesStorage;
  v2 = -[_NSHTTPAlternativeServicesStorage init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.cfnetwork.altservicesstorage", 0LL);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    memoryEntries = v2->memoryEntries;
    v2->memoryEntries = v5;

    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    clearEntries = v2->clearEntries;
    v2->clearEntries = v7;

    v2->lock._os_unfair_lock_opaque = 0;
    v2->_canSuspendLocked = 1;
  }

  return v2;
}

- (id)initPersistentStoreWithURL:(id)a3
{
  id v5 = a3;
  v6 = -[_NSHTTPAlternativeServicesStorage init](self, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_path, a3);
  }

  return v7;
}

- (id)initInMemoryStore
{
  id result = -[_NSHTTPAlternativeServicesStorage init](self, "init");
  if (result) {
    *((_BYTE *)result + 26) = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSHTTPAlternativeServicesStorage;
  -[_NSHTTPAlternativeServicesStorage dealloc](&v3, sel_dealloc);
}

- (NSURL)path
{
  return self->_path;
}

- (id)HTTPServiceEntriesWithRegistrableDomain:(id)a3
{
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy__2695;
  uint64_t v17 = __Block_byref_object_dispose__2696;
  id v18 = (id)MEMORY[0x189604A58];
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __77___NSHTTPAlternativeServicesStorage_HTTPServiceEntriesWithRegistrableDomain___block_invoke;
  block[3] = &unk_189C19500;
  block[4] = self;
  id v11 = v5;
  id v12 = &v13;
  id v7 = v5;
  dispatch_sync(workQueue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)entries
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __44___NSHTTPAlternativeServicesStorage_entries__block_invoke;
  v9[3] = &unk_189C1A270;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(workQueue, v9);
  v6 = v10;
  id v7 = v5;

  return v7;
}

- (void)storeHTTPServiceEntry:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->lock);
  -[NSMutableSet member:](self->memoryEntries, "member:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    goto LABEL_10;
  }
  [v4 expirationDate];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 timeIntervalSinceNow];
  if (v7 <= 0.0)
  {

    goto LABEL_10;
  }

  [v4 expirationDate];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 expirationDate];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;

  if (v11 >= 30.0)
  {
LABEL_10:
    CFSetSetValue((CFMutableSetRef)self->memoryEntries, v4);
    if ((unint64_t)-[NSMutableSet count](self->memoryEntries, "count") < 0x1F5
      || self->_garbageCollectionDispatched)
    {
      char v14 = 0;
      int v13 = 0;
    }

    else
    {
      char v14 = 0;
      int v13 = 1;
      self->_garbageCollectionDispatched = 1;
    }

    goto LABEL_13;
  }

  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  id v12 = (os_log_s *)(id)CFNLog::logger;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18298D000, v12, OS_LOG_TYPE_DEBUG, "Ignoring alt-svc entry", buf, 2u);
  }

  int v13 = 0;
  char v14 = 1;
LABEL_13:
  clearEntries = self->clearEntries;
  v16 = (void *)MEMORY[0x1896079C8];
  uint64_t v17 = MEMORY[0x1895F87A8];
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke;
  v27[3] = &unk_189C04718;
  id v18 = v4;
  id v28 = v18;
  [v16 predicateWithBlock:v27];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet filterUsingPredicate:](clearEntries, "filterUsingPredicate:", v19);

  os_unfair_lock_unlock(&self->lock);
  if ((v14 & 1) == 0)
  {
    workQueue = (dispatch_queue_s *)self->_workQueue;
    block[0] = v17;
    block[1] = 3221225472LL;
    block[2] = __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_2;
    block[3] = &unk_189C1A270;
    block[4] = self;
    id v26 = v18;
    dispatch_block_t v21 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, QOS_CLASS_UTILITY, 0, block);
    dispatch_async(workQueue, v21);
  }

  if (v13)
  {
    v22 = (dispatch_queue_s *)self->_workQueue;
    v24[0] = v17;
    v24[1] = 3221225472LL;
    v24[2] = __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_4;
    v24[3] = &unk_189C1A548;
    v24[4] = self;
    dispatch_block_t v23 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, QOS_CLASS_UTILITY, 0, v24);
    dispatch_async(v22, v23);
  }
}

- (void)removeHTTPAlternativeServiceEntriesWithHost:(id)a3 port:(int64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    os_unfair_lock_lock(&self->lock);
    id v8 = objc_alloc_init(&OBJC_CLASS____NSHTTPAlternativeServicesClearEntry);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_host, a3);
      v9->_port = a4;
    }

    -[NSMutableSet member:](self->clearEntries, "member:", v9);
    double v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      double v11 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18298D000, v11, OS_LOG_TYPE_DEBUG, "Ignoring alt-svc clear", buf, 2u);
      }
    }

    else
    {
      -[NSMutableSet addObject:](self->clearEntries, "addObject:", v9);
    }

    memoryEntries = self->memoryEntries;
    int v13 = (void *)MEMORY[0x1896079C8];
    uint64_t v14 = MEMORY[0x1895F87A8];
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke;
    v22[3] = &unk_189C04740;
    id v15 = v7;
    id v23 = v15;
    int64_t v24 = a4;
    [v13 predicateWithBlock:v22];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet filterUsingPredicate:](memoryEntries, "filterUsingPredicate:", v16);

    os_unfair_lock_unlock(&self->lock);
    if (!v10)
    {
      workQueue = (dispatch_queue_s *)self->_workQueue;
      block[0] = v14;
      block[1] = 3221225472LL;
      block[2] = __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke_2;
      block[3] = &unk_189C194B0;
      block[4] = self;
      id v20 = v15;
      int64_t v21 = a4;
      dispatch_block_t v18 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0LL, QOS_CLASS_UTILITY, 0, block);
      dispatch_async(workQueue, v18);
    }
  }
}

- (void)removeHTTPAlternativeServiceEntriesWithRegistrableDomain:(id)a3
{
  id v7 = a3;
  id v4 = (void *)[v7 copy];
  os_unfair_lock_lock(&self->lock);
  -[NSMutableSet removeAllObjects](self->memoryEntries, "removeAllObjects");
  os_unfair_lock_unlock(&self->lock);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __94___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithRegistrableDomain___block_invoke;
  block[3] = &unk_189C1A270;
  block[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, block);
}

- (void)removeHTTPAlternativeServiceEntriesCreatedAfterDate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->lock);
  -[NSMutableSet removeAllObjects](self->memoryEntries, "removeAllObjects");
  os_unfair_lock_unlock(&self->lock);
  workQueue = (dispatch_queue_s *)self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __89___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesCreatedAfterDate___block_invoke;
  block[3] = &unk_189C1A270;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, block);
}

- (BOOL)canSuspendLocked
{
  return self->_canSuspendLocked;
}

- (void)setCanSuspendLocked:(BOOL)a3
{
  self->_canSuspendLocked = a3;
}

- (void).cxx_destruct
{
}

- (uint64_t)_createDBSchemaForPath:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = [v3 fileSystemRepresentation];
  if (v4) {
    id v5 = (const char *)v4;
  }
  else {
    id v5 = ":memory:";
  }
  if (!*(_BYTE *)(a1 + 26)) {
    __retainStorageAssertion(*(void **)(a1 + 16));
  }
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  dispatch_block_t v18 = __60___NSHTTPAlternativeServicesStorage__createDBSchemaForPath___block_invoke;
  v19 = &unk_189C1A548;
  uint64_t v20 = a1;
  else {
    int v6 = 6;
  }
  id v7 = (sqlite3 **)(a1 + 48);
  if (!sqlite3_open_v2(v5, (sqlite3 **)(a1 + 48), v6, 0LL))
  {
    int v8 = [(id)a1 canSuspendLocked] ^ 1;
    if (!v3) {
      LOBYTE(v8) = 1;
    }
    if ((v8 & 1) == 0)
    {
      char value = -1;
      if (setxattr(v5, "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0) < 0)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        id v9 = (os_log_s *)(id)CFNLog::logger;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v14 = *__error();
          *(_DWORD *)buf = 136315394;
          v22 = v5;
          __int16 v23 = 1024;
          int v24 = v14;
          _os_log_error_impl( &dword_18298D000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to set can-suspend-locked at %s: %{errno}d",  buf,  0x12u);
        }
      }
    }

    sqlite3_busy_timeout(*v7, 1000);
    if (sqlite3_exec(*v7, "PRAGMA auto_vacuum = 2;", 0LL, 0LL, &errmsg))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      double v10 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      double v11 = "Failed to set auto_vacuum to incremental";
    }

    else if (sqlite3_exec(*v7, "PRAGMA journal_mode=WAL;", 0LL, 0LL, &errmsg))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      double v10 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      double v11 = "Failed to set journal mode";
    }

    else
    {
      if (!sqlite3_exec( *v7,  "CREATE TABLE IF NOT EXISTS alt_services(       partition text NOT NULL,        host text NOT NULL, alternateHost text NOT NULL,        port int NOT NULL,        alternatePort int NOT NULL,        type in t NOT NULL,        creation_time int,        expires_time int,        UNIQUE(partition, host, port, type)       );",
              0LL,
              0LL,
              &errmsg))
      {
        uint64_t v12 = 1LL;
        goto LABEL_38;
      }

      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      double v10 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      double v11 = "Failed to create schema";
    }

    _os_log_error_impl(&dword_18298D000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
LABEL_36:

    goto LABEL_37;
  }

  sqlite3_close(*v7);
LABEL_37:
  uint64_t v12 = 0LL;
LABEL_38:
  ((void (*)(void *))v18)(v17);

  return v12;
}

- (uint64_t)_onqueue_garbageCollect
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    v2 = (os_log_s *)(id)CFNLog::logger;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18298D000, v2, OS_LOG_TYPE_DEFAULT, "Garbage collection for alternative services", buf, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 28));
    [*(id *)(v1 + 32) removeAllObjects];
    *(_BYTE *)(v1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 28));
    if (!*(_BYTE *)(v1 + 26)) {
      __retainStorageAssertion(*(void **)(v1 + 16));
    }
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    uint64_t v17 = __60___NSHTTPAlternativeServicesStorage__onqueue_garbageCollect__block_invoke;
    dispatch_block_t v18 = &unk_189C1A548;
    uint64_t v19 = v1;
    uint64_t v4 = (sqlite3_stmt **)(v1 + 120);
    id v3 = *(sqlite3_stmt **)(v1 + 120);
    if (!v3)
    {
      if (sqlite3_prepare_v2( *(sqlite3 **)(v1 + 48),  "DELETE FROM alt_services WHERE expires_time < strftime('%s','now')",  -1,  (sqlite3_stmt **)(v1 + 120),  0LL))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        double v10 = (os_log_s *)(id)CFNLog::logger;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_18298D000,  v10,  OS_LOG_TYPE_ERROR,  "Failed to init the deleteExpiredEntriesStmt statement for alt_services",  buf,  2u);
        }

        goto LABEL_39;
      }

      id v3 = *v4;
    }

    if (sqlite3_step(v3) != 101)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      id v5 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v13 = sqlite3_errmsg(*(sqlite3 **)(v1 + 48));
        *(_DWORD *)buf = 136315138;
        int64_t v21 = v13;
        _os_log_error_impl( &dword_18298D000,  v5,  OS_LOG_TYPE_ERROR,  "Failed to delete expired entries from alt_service db. Error= %s",  buf,  0xCu);
      }
    }

    sqlite3_reset(*v4);
    id v7 = (sqlite3_stmt **)(v1 + 128);
    int v6 = *(sqlite3_stmt **)(v1 + 128);
    if (v6) {
      goto LABEL_16;
    }
    id v11 = objc_msgSend( NSString,  "stringWithFormat:",  @"DELETE FROM alt_services WHERE ROWID in (SELECT ROWID FROM alt_services ORDER BY ROWID DESC LIMIT -1 OFFSET %ld)",  1500);
    uint64_t v12 = (const char *)[v11 UTF8String];

    if (!sqlite3_prepare_v2(*(sqlite3 **)(v1 + 48), v12, -1, (sqlite3_stmt **)(v1 + 128), 0LL))
    {
      int v6 = *v7;
LABEL_16:
      if (sqlite3_step(v6) != 101)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        int v8 = (os_log_s *)(id)CFNLog::logger;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v14 = sqlite3_errmsg(*(sqlite3 **)(v1 + 48));
          *(_DWORD *)buf = 136315138;
          int64_t v21 = v14;
          _os_log_error_impl( &dword_18298D000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to trim entries from alt_service db. Error= %s",  buf,  0xCu);
        }
      }

      sqlite3_reset(*v7);
      if (sqlite3_exec(*(sqlite3 **)(v1 + 48), "PRAGMA incremental_vacuum(10);", 0LL, 0LL, (char **)buf))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        id v9 = (os_log_s *)(id)CFNLog::logger;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v15 = 0;
          _os_log_error_impl( &dword_18298D000,  v9,  OS_LOG_TYPE_ERROR,  "Failed to auto vacuum when garbage collecting alternative storages",  v15,  2u);
        }
      }

      return ((uint64_t (*)(void *))v17)(v16);
    }

    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    double v10 = (os_log_s *)(id)CFNLog::logger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_18298D000,  v10,  OS_LOG_TYPE_ERROR,  "Failed to init the trimDbStmt statement for alt_services",  buf,  2u);
    }

- (_NSHTTPAlternativeServiceEntry)_onqueue_convertSqlRowToHTTPAlternativeServiceEntry:(uint64_t)a1
{
  v2 = 0LL;
  if (a1 && a2)
  {
    v2 = objc_alloc_init(&OBJC_CLASS____NSHTTPAlternativeServiceEntry);
    objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 0));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NSHTTPAlternativeServiceEntry setPartition:](v2, "setPartition:", v4);

    objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 1));
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NSHTTPAlternativeServiceEntry setHost:](v2, "setHost:", v5);

    objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a2, 2));
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NSHTTPAlternativeServiceEntry setAlternateHost:](v2, "setAlternateHost:", v6);

    -[_NSHTTPAlternativeServiceEntry setPort:](v2, "setPort:", sqlite3_column_int(a2, 3));
    -[_NSHTTPAlternativeServiceEntry setAlternatePort:](v2, "setAlternatePort:", sqlite3_column_int(a2, 4));
    -[_NSHTTPAlternativeServiceEntry setServiceType:](v2, "setServiceType:", sqlite3_column_int(a2, 5));
    objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(a2, 7));
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_NSHTTPAlternativeServiceEntry setExpirationDate:](v2, "setExpirationDate:", v7);
  }

  return v2;
}

@end