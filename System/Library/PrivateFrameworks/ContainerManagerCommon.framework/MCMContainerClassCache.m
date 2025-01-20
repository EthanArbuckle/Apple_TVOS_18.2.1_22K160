@interface MCMContainerClassCache
- (BOOL)_checkExistanceOfCacheEntry:(id)a3 libraryRepair:(id)a4;
- (BOOL)_identifier:(id)a3 isEqualToOtherIdentifier:(id)a4 caseSensitive:(BOOL)a5;
- (BOOL)_isEntryA:(id)a3 olderThanEntryB:(id)a4;
- (BOOL)_queue_consumeResyncRequired;
- (BOOL)enumerateCacheEntriesWithEnumerator:(id)a3;
- (BOOL)writeThroughEnabled;
- (Class)cacheEntryClass;
- (MCMContainerClassCache)initWithContainerClassPath:(id)a3 cacheEntryClass:(Class)a4 targetQueue:(id)a5 userIdentityCache:(id)a6;
- (MCMContainerClassPath)containerClassPath;
- (MCMUserIdentityCache)userIdentityCache;
- (NSMutableDictionary)lock_cache;
- (NSUUID)lastCompletedDiskScanUUID;
- (NSUUID)targetDiskScanUUID;
- (OS_dispatch_queue)fsScanQueue;
- (id)_concurrent_generateCacheEntryWithURL:(id)a3 identifier:(id)a4 containerPath:(id)a5 schemaVersion:(id)a6 uuid:(id)a7 metadata:(id)a8;
- (id)_concurrent_slowGenerateCacheEntryWithFileHandle:(id)a3 URL:(id)a4 identifier:(id)a5 uuid:(id)a6 schemaVersion:(id)a7 containerPath:(id)a8;
- (id)_lock_rootEntryByResortingFromRootEntry:(id)a3 insertEntry:(id)a4;
- (id)_lock_rootEntryFromRootEntry:(id)a3 afterRemovingEntryForContainerPath:(id)a4;
- (id)_setEntry:(id)a3 forIdentifier:(id)a4 containerPath:(id)a5 writeThrough:(BOOL)a6 replace:(BOOL)a7;
- (id)cacheEntryForIdentifier:(id)a3;
- (id)concurrentWriteThroughHandler;
- (id)setCacheEntry:(id)a3 forIdentifier:(id)a4;
- (id)setCacheEntry:(id)a3 forIdentifier:(id)a4 writeThrough:(BOOL)a5;
- (unint64_t)containerClass;
- (void)_concurrent_processCorruptEntry:(id)a3 handler:(id)a4;
- (void)_concurrent_processURL:(id)a3 handler:(id)a4;
- (void)_handleUnrecoverableCorruptContainerPath:(id)a3;
- (void)_processCorruptEntries:(id)a3 handler:(id)a4;
- (void)_processURLs:(id)a3 handler:(id)a4;
- (void)_queue_syncWithDisk;
- (void)asyncStartSynchronization;
- (void)forceWriteThrough;
- (void)resyncRequired;
- (void)setConcurrentWriteThroughHandler:(id)a3;
- (void)setLastCompletedDiskScanUUID:(id)a3;
- (void)setTargetDiskScanUUID:(id)a3;
- (void)setWriteThroughEnabled:(BOOL)a3;
- (void)waitForSynchronizationToComplete;
@end

@implementation MCMContainerClassCache

- (MCMContainerClassCache)initWithContainerClassPath:(id)a3 cacheEntryClass:(Class)a4 targetQueue:(id)a5 userIdentityCache:(id)a6
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  v12 = (dispatch_queue_s *)a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___MCMContainerClassCache;
  v14 = -[MCMContainerClassCache init](&v32, sel_init);
  v15 = v14;
  if (!v14)
  {
LABEL_10:
    v28 = v15;
    goto LABEL_11;
  }

  v14->_lock_resyncRequired = 1;
  id lock_concurrentWriteThroughHandler = v14->_lock_concurrentWriteThroughHandler;
  v14->_id lock_concurrentWriteThroughHandler = 0LL;
  *(void *)&v14->_cacheLock._os_unfair_lock_opaque = 0LL;

  objc_storeStrong((id *)&v15->_cacheEntryClass, a4);
  v15->_unint64_t containerClass = [v11 containerClass];
  id v17 = containermanager_copy_global_configuration();
  int v18 = [v17 dispositionForContainerClass:v15->_containerClass];

  if (v18 == 1)
  {
    uint64_t v19 = [MEMORY[0x189607AB8] UUID];
    targetDiskScanUUID = v15->_targetDiskScanUUID;
    v15->_targetDiskScanUUID = (NSUUID *)v19;

    lastCompletedDiskScanUUID = v15->_lastCompletedDiskScanUUID;
    v15->_lastCompletedDiskScanUUID = 0LL;

    objc_storeStrong((id *)&v15->_containerClassPath, a3);
    uint64_t v22 = [MEMORY[0x189603FC8] dictionary];
    lock_cache = v15->_lock_cache;
    v15->_lock_cache = (NSMutableDictionary *)v22;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_BACKGROUND, 0);
    v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

    if (v12) {
      dispatch_queue_t v26 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.fsScan", v25, v12);
    }
    else {
      dispatch_queue_t v26 = dispatch_queue_create("com.apple.containermanagerd.fsScan", v25);
    }
    fsScanQueue = v15->_fsScanQueue;
    v15->_fsScanQueue = (OS_dispatch_queue *)v26;

    objc_storeStrong((id *)&v15->_userIdentityCache, a6);
    goto LABEL_10;
  }

  container_log_handle_for_category();
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    unint64_t containerClass = v15->_containerClass;
    *(_DWORD *)buf = 134217984;
    unint64_t v34 = containerClass;
    _os_log_fault_impl( &dword_188846000,  v27,  OS_LOG_TYPE_FAULT,  "Attempting to build cache for class not supported by this daemon: %llu",  buf,  0xCu);
  }

  v28 = 0LL;
LABEL_11:

  return v28;
}

- (id)cacheEntryForIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[MCMContainerClassCache waitForSynchronizationToComplete](self, "waitForSynchronizationToComplete");
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  v6 = -[MCMContainerClassCache lock_cache](self, "lock_cache");
  [v6 objectForKeyedSubscript:v4];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (([v7 corrupt] & 1) != 0 || objc_msgSend(v7, "ignore"))
  {

    v7 = 0LL;
  }

  os_unfair_lock_unlock(p_cacheLock);
  container_log_handle_for_category();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_debug_impl( &dword_188846000,  v8,  OS_LOG_TYPE_DEBUG,  "Retrieving cache entry; identifier = %@, cache entry = %@",
      (uint8_t *)&v10,
      0x16u);
  }

  return v7;
}

- (id)setCacheEntry:(id)a3 forIdentifier:(id)a4
{
  return -[MCMContainerClassCache setCacheEntry:forIdentifier:writeThrough:]( self,  "setCacheEntry:forIdentifier:writeThrough:",  a3,  a4,  1LL);
}

- (id)setCacheEntry:(id)a3 forIdentifier:(id)a4 writeThrough:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8) {
    [v8 setXattrs];
  }
  [v8 containerPath];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerClassCache _setEntry:forIdentifier:containerPath:writeThrough:replace:]( self,  "_setEntry:forIdentifier:containerPath:writeThrough:replace:",  v8,  v9,  v10,  v5,  1LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)enumerateCacheEntriesWithEnumerator:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = (uint64_t (**)(id, void *))a3;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  v6 = -[MCMContainerClassCache lock_cache](self, "lock_cache");
  v7 = (void *)[v6 copy];

  os_unfair_lock_unlock(p_cacheLock);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        [v8 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (([v14 corrupt] & 1) == 0 && (objc_msgSend(v14, "ignore") & 1) == 0)
        {
          if ((v4[2](v4, v14) & 1) == 0)
          {

            goto LABEL_14;
          }

          char v11 = 1;
        }
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  else
  {
LABEL_14:
    char v11 = 0;
  }

  return v11 & 1;
}

- (void)waitForSynchronizationToComplete
{
  v3[5] = *MEMORY[0x1895F89C0];
  fsScanQueue = (dispatch_queue_s *)self->_fsScanQueue;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __58__MCMContainerClassCache_waitForSynchronizationToComplete__block_invoke;
  v3[3] = &unk_18A29E378;
  v3[4] = self;
  dispatch_async_and_wait(fsScanQueue, v3);
}

- (void)asyncStartSynchronization
{
  v3[5] = *MEMORY[0x1895F89C0];
  fsScanQueue = (dispatch_queue_s *)self->_fsScanQueue;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __51__MCMContainerClassCache_asyncStartSynchronization__block_invoke;
  v3[3] = &unk_18A29E378;
  v3[4] = self;
  dispatch_async(fsScanQueue, v3);
}

- (void)resyncRequired
{
  p_resyncRequiredLock = &self->_resyncRequiredLock;
  os_unfair_lock_lock(&self->_resyncRequiredLock);
  self->_lock_resyncRequired = 1;
  os_unfair_lock_unlock(p_resyncRequiredLock);
}

- (void)forceWriteThrough
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  id v4 = (void *)MEMORY[0x1895CE54C](self->_lock_concurrentWriteThroughHandler);
  -[MCMContainerClassCache lock_cache](self, "lock_cache");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 copy];

  os_unfair_lock_unlock(p_cacheLock);
  if (v4)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __43__MCMContainerClassCache_forceWriteThrough__block_invoke;
    v7[3] = &unk_18A29D1B0;
    id v8 = v4;
    [v6 enumerateKeysAndObjectsWithOptions:1 usingBlock:v7];
  }
}

- (void)setConcurrentWriteThroughHandler:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  id v6 = (void *)MEMORY[0x1895CE54C](v5);

  id lock_concurrentWriteThroughHandler = self->_lock_concurrentWriteThroughHandler;
  self->_id lock_concurrentWriteThroughHandler = v6;

  os_unfair_lock_unlock(p_cacheLock);
}

- (id)concurrentWriteThroughHandler
{
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  id v4 = (void *)MEMORY[0x1895CE54C](self->_lock_concurrentWriteThroughHandler);
  os_unfair_lock_unlock(p_cacheLock);
  id v5 = (void *)MEMORY[0x1895CE54C](v4);

  return v5;
}

- (BOOL)_queue_consumeResyncRequired
{
  BOOL lock_resyncRequired = self->_lock_resyncRequired;
  self->_BOOL lock_resyncRequired = 0;
  os_unfair_lock_unlock(&self->_resyncRequiredLock);
  return lock_resyncRequired;
}

- (BOOL)_checkExistanceOfCacheEntry:(id)a3 libraryRepair:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 classURL];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = 0LL;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __68__MCMContainerClassCache__checkExistanceOfCacheEntry_libraryRepair___block_invoke;
  v12[3] = &unk_18A29E660;
  v12[4] = &v14;
  [v7 fixAndRetryIfPermissionsErrorWithURL:v9 error:&v13 duringBlock:v12];
  id v10 = v13;

  LODWORD(v8) = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (_DWORD)v8 != 0;
}

- (void)_queue_syncWithDisk
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fsScanQueue);
  v3 = -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
  container_log_handle_for_category();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v71 = (uint64_t)v3;
    _os_log_impl(&dword_188846000, v4, OS_LOG_TYPE_DEFAULT, "Resyncing container class cache: %@", buf, 0xCu);
  }

  container_log_handle_for_category();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

  container_log_handle_for_category();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  unint64_t v56 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v9 = [v3 containerClass];
    *(_DWORD *)buf = 134349056;
    uint64_t v71 = v9;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "ResyncingCache",  " class=%{public, signpost.description:attribute}llu ",  buf,  0xCu);
  }

  os_signpost_id_t spid = v6;

  -[MCMContainerClassCache userIdentityCache](self, "userIdentityCache");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 userIdentity];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 libraryRepairForUserIdentity:v11];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603FE0] set];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v3;
  [v3 classURL];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v69 = 0LL;
  v67[0] = MEMORY[0x1895F87A8];
  v67[1] = 3221225472LL;
  v67[2] = __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke;
  v67[3] = &unk_18A29E688;
  id v15 = v13;
  id v68 = v15;
  v57 = v12;
  LODWORD(v13) = [v12 fixAndRetryIfPermissionsErrorWithURL:v14 error:&v69 duringBlock:v67];
  id v55 = v69;

  if ((_DWORD)v13)
  {
    -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 setExists:1];
  }

  [MEMORY[0x189603FA8] array];
  char v17 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_cacheLock);
  -[MCMContainerClassCache lock_cache](self, "lock_cache");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189603FE0], "setWithCapacity:", objc_msgSend(v18, "count"));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  obuint64_t j = v18;
  uint64_t v60 = [obj countByEnumeratingWithState:&v84 objects:v83 count:16];
  if (v60)
  {
    uint64_t v59 = *(void *)v85;
    do
    {
      for (uint64_t i = 0LL; i != v60; ++i)
      {
        if (*(void *)v85 != v59) {
          objc_enumerationMutation(obj);
        }
        [obj objectForKeyedSubscript:*(void *)(*((void *)&v84 + 1) + 8 * i)];
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        v62 = v21;
        do
        {
          [v21 containerPath];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 containerRootURL];
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if ([v15 containsObject:v23])
          {
            int v24 = [v21 corrupt];
            container_log_handle_for_category();
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
            if (v24)
            {
              if (v26)
              {
                [v23 path];
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                uint64_t v71 = (uint64_t)v31;
                _os_log_debug_impl( &dword_188846000,  v25,  OS_LOG_TYPE_DEBUG,  "Disk sync knows about corrupt [%@]",  buf,  0xCu);
              }

              [v63 addObject:v21];
            }

            else
            {
              if (v26)
              {
                [v23 path];
                objc_super v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                uint64_t v71 = (uint64_t)v32;
                _os_log_debug_impl(&dword_188846000, v25, OS_LOG_TYPE_DEBUG, "Disk sync knows about [%@]", buf, 0xCu);
              }
            }

            [v19 addObject:v23];
          }

          else
          {
            container_log_handle_for_category();
            v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              [v23 path];
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              uint64_t v71 = (uint64_t)v28;
              _os_log_impl(&dword_188846000, v27, OS_LOG_TYPE_DEFAULT, "Disk sync has stale entry for [%@]", buf, 0xCu);
            }

            [v17 addObject:v21];
            v29 = -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
            [v29 setExists:0];
          }

          uint64_t v30 = [v21 next];

          id v21 = (id)v30;
        }

        while (v30);
      }

      uint64_t v60 = [obj countByEnumeratingWithState:&v84 objects:v83 count:16];
    }

    while (v60);
  }

  os_unfair_lock_unlock(&self->_cacheLock);
  [v15 minusSet:v19];
  __int128 v81 = 0u;
  __int128 v82 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  id v64 = v17;
  uint64_t v33 = [v64 countByEnumeratingWithState:&v79 objects:v78 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v80;
    do
    {
      for (uint64_t j = 0LL; j != v34; ++j)
      {
        if (*(void *)v80 != v35) {
          objc_enumerationMutation(v64);
        }
        v37 = *(void **)(*((void *)&v79 + 1) + 8 * j);
        container_log_handle_for_category();
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v71 = (uint64_t)v37;
          _os_log_impl(&dword_188846000, v38, OS_LOG_TYPE_DEFAULT, "Disk sync evicting stale entry: %@", buf, 0xCu);
        }

        [v37 identifier];
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v37 containerPath];
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        id v41 =  -[MCMContainerClassCache _setEntry:forIdentifier:containerPath:writeThrough:replace:]( self,  "_setEntry:forIdentifier:containerPath:writeThrough:replace:",  0LL,  v39,  v40,  1LL,  0LL);
      }

      uint64_t v34 = [v64 countByEnumeratingWithState:&v79 objects:v78 count:16];
    }

    while (v34);
  }

  [v15 allObjects];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = MEMORY[0x1895F87A8];
  v66[0] = MEMORY[0x1895F87A8];
  v66[1] = 3221225472LL;
  v66[2] = __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_8;
  v66[3] = &unk_18A29D1D8;
  v66[4] = self;
  -[MCMContainerClassCache _processURLs:handler:](self, "_processURLs:handler:", v42, v66);

  v65[0] = v43;
  v65[1] = 3221225472LL;
  v65[2] = __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_10;
  v65[3] = &unk_18A29D1D8;
  v65[4] = self;
  -[MCMContainerClassCache _processCorruptEntries:handler:](self, "_processCorruptEntries:handler:", v63, v65);
  uint64_t v44 = [v19 count];
  uint64_t v45 = [v15 count];
  uint64_t v46 = [v64 count];
  container_log_handle_for_category();
  v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v48 = v45 + v44 - v46;
    uint64_t v49 = [v15 count];
    uint64_t v50 = [v64 count];
    *(_DWORD *)buf = 138413058;
    uint64_t v71 = (uint64_t)v58;
    __int16 v72 = 2048;
    uint64_t v73 = v49;
    __int16 v74 = 2048;
    uint64_t v75 = v50;
    __int16 v76 = 2048;
    uint64_t v77 = v48;
    _os_log_impl( &dword_188846000,  v47,  OS_LOG_TYPE_DEFAULT,  "Finished resyncing container class cache: %@, added = %lu, removed = %lu, total = %lu",  buf,  0x2Au);
  }

  container_log_handle_for_category();
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v56 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    uint64_t v53 = [v58 containerClass];
    *(_DWORD *)buf = 134349056;
    uint64_t v71 = v53;
    _os_signpost_emit_with_name_impl( &dword_188846000,  v52,  OS_SIGNPOST_INTERVAL_END,  spid,  "ResyncingCache",  " class=%{public, signpost.description:attribute}llu ",  buf,  0xCu);
  }
}

- (void)_processURLs:(id)a3 handler:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __47__MCMContainerClassCache__processURLs_handler___block_invoke;
  v8[3] = &unk_18A29D200;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsWithOptions:0 usingBlock:v8];
}

- (void)_processCorruptEntries:(id)a3 handler:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __57__MCMContainerClassCache__processCorruptEntries_handler___block_invoke;
  v8[3] = &unk_18A29D200;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsWithOptions:0 usingBlock:v8];
}

- (void)_concurrent_processURL:(id)a3 handler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v26 = a4;
  uint64_t v7 = -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
  [v6 lastPathComponent];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v7;
  +[MCMContainerPath containerPathForContainerClassPath:containerPathIdentifier:]( &OBJC_CLASS___MCMContainerPath,  "containerPathForContainerClassPath:containerPathIdentifier:",  v7,  v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_alloc(&OBJC_CLASS___MCMFileHandle);
  [v6 path];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = 0;
  uint64_t v12 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:]( v10,  "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:",  v11,  0LL,  9LL,  0LL,  0LL,  0LL,  v24);

  id v27 = 0LL;
  LOBYTE(v10) = -[MCMFileHandle openWithError:](v12, "openWithError:", &v27);
  id v13 = v27;
  if ((v10 & 1) == 0)
  {
    container_log_handle_for_category();
    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      [v6 path];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_error_impl( &dword_188846000,  v19,  OS_LOG_TYPE_ERROR,  "Failed to open [%@] for container scan, skipping; error = %@",
        buf,
        0x16u);
    }

    char v17 = 0LL;
    id v15 = 0LL;
    uint64_t v14 = 0LL;
    __int128 v20 = 0LL;
    goto LABEL_15;
  }

  +[MCMContainerCacheEntry identifierForFileHandle:]( &OBJC_CLASS___MCMContainerCacheEntry,  "identifierForFileHandle:",  v12);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerCacheEntry UUIDForFileHandle:](&OBJC_CLASS___MCMContainerCacheEntry, "UUIDForFileHandle:", v12);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = +[MCMContainerCacheEntry schemaVersionForFileHandle:]( &OBJC_CLASS___MCMContainerCacheEntry,  "schemaVersionForFileHandle:",  v12);
  char v17 = (void *)v16;
  if (v14 && v15 && v16)
  {
    uint64_t v18 = -[MCMContainerClassCache _concurrent_generateCacheEntryWithURL:identifier:containerPath:schemaVersion:uuid:metadata:]( self,  "_concurrent_generateCacheEntryWithURL:identifier:containerPath:schemaVersion:uuid:metadata:",  v6,  v14,  v9,  v16,  v15,  0LL);
  }

  else
  {
    container_log_handle_for_category();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v29 = v14;
      __int16 v30 = 2112;
      id v31 = v15;
      __int16 v32 = 2112;
      uint64_t v33 = v17;
      __int16 v34 = 2112;
      uint64_t v35 = v9;
      _os_log_impl( &dword_188846000,  v21,  OS_LOG_TYPE_INFO,  "Container did not have xattr (%@|%@|%@), reading plist (slow); path = %@",
        buf,
        0x2Au);
    }

    uint64_t v18 = -[MCMContainerClassCache _concurrent_slowGenerateCacheEntryWithFileHandle:URL:identifier:uuid:schemaVersion:containerPath:]( self,  "_concurrent_slowGenerateCacheEntryWithFileHandle:URL:identifier:uuid:schemaVersion:containerPath:",  v12,  v6,  v14,  v15,  v17,  v9);
  }

  __int128 v20 = (void *)v18;
  if (!v18)
  {
    -[MCMContainerClassCache _handleUnrecoverableCorruptContainerPath:]( self,  "_handleUnrecoverableCorruptContainerPath:",  v9);
LABEL_15:
    uint64_t v22 = v26;
    goto LABEL_16;
  }

  uint64_t v22 = v26;
  (*((void (**)(id, uint64_t))v26 + 2))(v26, v18);
LABEL_16:
}

- (void)_concurrent_processCorruptEntry:(id)a3 handler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void (**)(void, os_log_s *))a4;
  [v6 containerPath];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 containerRootURL];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_alloc(&OBJC_CLASS___MCMFileHandle);
  [v9 path];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = 0;
  uint64_t v12 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:]( v10,  "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:",  v11,  0LL,  9LL,  0LL,  0LL,  0LL,  v22);

  id v24 = 0LL;
  BOOL v13 = -[MCMFileHandle openWithError:](v12, "openWithError:", &v24);
  id v14 = v24;
  container_log_handle_for_category();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v15;
  if (v13)
  {
    v23 = v7;
    char v17 = self;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl( &dword_188846000,  v16,  OS_LOG_TYPE_INFO,  "Attempting to repair corrupt container (slow); path = %@",
        buf,
        0xCu);
    }

    [v6 identifier];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 uuid];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 schemaVersion];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerClassCache _concurrent_slowGenerateCacheEntryWithFileHandle:URL:identifier:uuid:schemaVersion:containerPath:]( v17,  "_concurrent_slowGenerateCacheEntryWithFileHandle:URL:identifier:uuid:schemaVersion:containerPath:",  v12,  v9,  v18,  v19,  v20,  v8);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      -[MCMContainerClassCache _handleUnrecoverableCorruptContainerPath:]( v17,  "_handleUnrecoverableCorruptContainerPath:",  v8);
      uint64_t v7 = v23;
      goto LABEL_9;
    }

    uint64_t v7 = v23;
    v23[2](v23, v16);
  }

  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    [v9 path];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v26 = v21;
    __int16 v27 = 2112;
    id v28 = v14;
    _os_log_error_impl( &dword_188846000,  v16,  OS_LOG_TYPE_ERROR,  "Failed to open [%@] for container scan, skipping; error = %@",
      buf,
      0x16u);
  }

LABEL_9:
}

- (id)_concurrent_slowGenerateCacheEntryWithFileHandle:(id)a3 URL:(id)a4 identifier:(id)a5 uuid:(id)a6 schemaVersion:(id)a7 containerPath:(id)a8
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v38 = a5;
  id v16 = a6;
  id v40 = a7;
  id v17 = a8;
  -[MCMContainerClassCache containerClassPath](self, "containerClassPath");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 containerClass];
  uint64_t v20 = [v18 userIdentity];
  id v21 = objc_alloc(&OBJC_CLASS___MCMMetadata);
  -[MCMContainerClassCache userIdentityCache](self, "userIdentityCache");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  id v41 = 0LL;
  v37 = (void *)v20;
  id v23 = -[MCMMetadataMinimal initByReadingAndValidatingMetadataAtContainerPath:userIdentity:containerClass:userIdentityCache:error:]( v21,  "initByReadingAndValidatingMetadataAtContainerPath:userIdentity:containerClass:userIdentityCache:error:",  v17,  v20,  v19,  v22,  &v41);
  id v39 = v41;

  if (v23)
  {
    [v23 identifier];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 schemaVersion];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 uuid];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerClassCache _concurrent_generateCacheEntryWithURL:identifier:containerPath:schemaVersion:uuid:metadata:]( self,  "_concurrent_generateCacheEntryWithURL:identifier:containerPath:schemaVersion:uuid:metadata:",  v15,  v24,  v17,  v25,  v26,  v23);
    id v27 = (id)objc_claimAutoreleasedReturnValue();

    [v27 setXattrsWithFileHandle:v14];
    id v28 = v38;
    goto LABEL_16;
  }

  id v29 = containermanager_copy_global_configuration();
  [v29 staticConfig];
  __int16 v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v30 attemptMetadataReconstructionIfMissing])
  {
  }

  else
  {
    int v31 = [v39 POSIXerrno];

    if (v31 == 2)
    {
      container_log_handle_for_category();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      id v28 = v38;
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413570;
        id v43 = v38;
        __int16 v44 = 2112;
        id v45 = v17;
        __int16 v46 = 2112;
        id v47 = v38;
        __int16 v48 = 2112;
        id v49 = v16;
        __int16 v50 = 2112;
        id v51 = v40;
        __int16 v52 = 2112;
        id v53 = v39;
        _os_log_error_impl( &dword_188846000,  (os_log_t)v27,  OS_LOG_TYPE_ERROR,  "Could not read metadata for [(%@) %@]; identifier = [%@], uuid = %@, schemaVersion = %@, error = %@",
          buf,
          0x3Eu);
      }

      goto LABEL_15;
    }
  }

  container_log_handle_for_category();
  __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v28 = v38;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413570;
    id v43 = v38;
    __int16 v44 = 2112;
    id v45 = v17;
    __int16 v46 = 2112;
    id v47 = v38;
    __int16 v48 = 2112;
    id v49 = v16;
    __int16 v50 = 2112;
    id v51 = v40;
    __int16 v52 = 2112;
    id v53 = v39;
    _os_log_error_impl( &dword_188846000,  v32,  OS_LOG_TYPE_ERROR,  "Could not read metadata for [(%@) %@], attempting recovery; identifier = [%@], uuid = %@, schemaVersion = %@, error = %@",
      buf,
      0x3Eu);
  }

  uint64_t v33 = objc_alloc(&OBJC_CLASS___MCMContainerCacheEntry);
  -[MCMContainerClassCache userIdentityCache](self, "userIdentityCache");
  __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
  id v27 = -[MCMContainerCacheEntry initFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:]( v33,  "initFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:",  v17,  v38,  v16,  v40,  v34);

  if (v27 && ([v27 verify] & 1) == 0)
  {
    container_log_handle_for_category();
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v43 = v38;
      __int16 v44 = 2112;
      id v45 = v16;
      __int16 v46 = 2112;
      id v47 = v40;
      _os_log_error_impl( &dword_188846000,  v35,  OS_LOG_TYPE_ERROR,  "Attempted to recover, but verification failed; identifier = [%@], uuid = %@, schemaVersion = %@",
        buf,
        0x20u);
    }

LABEL_15:
    id v27 = 0LL;
  }

- (id)_concurrent_generateCacheEntryWithURL:(id)a3 identifier:(id)a4 containerPath:(id)a5 schemaVersion:(id)a6 uuid:(id)a7 metadata:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = objc_alloc(-[MCMContainerClassCache cacheEntryClass](self, "cacheEntryClass"));
  -[MCMContainerClassCache userIdentityCache](self, "userIdentityCache");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = (void *)[v18 initWithIdentifier:v17 containerPath:v16 schemaVersion:v15 uuid:v14 metadata:v13 userIdentityCache:v19];

  return v20;
}

  ;
}

- (BOOL)_identifier:(id)a3 isEqualToOtherIdentifier:(id)a4 caseSensitive:(BOOL)a5
{
  if (a5) {
    return [a3 isEqualToString:a4];
  }
  else {
    return [a3 compare:a4 options:1] == 0;
  }
}

- (id)_setEntry:(id)a3 forIdentifier:(id)a4 containerPath:(id)a5 writeThrough:(BOOL)a6 replace:(BOOL)a7
{
  BOOL v8 = a6;
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = v12;
  if (v15) {
    -[MCMContainerClassCache _lightweightAnnotateEntry:](self, "_lightweightAnnotateEntry:", v15);
  }
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  -[MCMContainerClassCache lock_cache](self, "lock_cache");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  id v18 = v17;
  if (v17)
  {
    [v17 objectForKeyedSubscript:v13];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      goto LABEL_5;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
    if (v8)
    {
LABEL_5:
      uint64_t v20 = (void (**)(void, void, void, void))MEMORY[0x1895CE54C](self->_lock_concurrentWriteThroughHandler);
      if (v15) {
        goto LABEL_6;
      }
LABEL_11:
      if (v14) {
        -[MCMContainerClassCache _lock_rootEntryFromRootEntry:afterRemovingEntryForContainerPath:]( self,  "_lock_rootEntryFromRootEntry:afterRemovingEntryForContainerPath:",  v19,  v14);
      }
      else {
        [v19 next];
      }
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 setObject:v23 forKeyedSubscript:v13];

      id v21 = 0LL;
      goto LABEL_17;
    }
  }

  uint64_t v20 = 0LL;
  if (!v15) {
    goto LABEL_11;
  }
LABEL_6:
  id v21 = (void *)[v15 copyWithZone:0];

  [v21 setCache:self];
  if (!v19 || a7)
  {
    [v19 next];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 setNext:v22];
  }

  else
  {
    -[MCMContainerClassCache _lock_rootEntryByResortingFromRootEntry:insertEntry:]( self,  "_lock_rootEntryByResortingFromRootEntry:insertEntry:",  v19,  v15);
    uint64_t v22 = v21;
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v18 setObject:v21 forKeyedSubscript:v13];
LABEL_17:
  container_log_handle_for_category();
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    [v21 next];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    int v27 = 138412802;
    id v28 = v13;
    __int16 v29 = 2112;
    __int16 v30 = v21;
    __int16 v31 = 2112;
    __int16 v32 = v26;
    _os_log_debug_impl( &dword_188846000,  v24,  OS_LOG_TYPE_DEBUG,  "Setting cache entry; identifier = %@, cache entry = %@, next = %@",
      (uint8_t *)&v27,
      0x20u);
  }

  os_unfair_lock_unlock(p_cacheLock);
  if (v20) {
    ((void (**)(void, id, void *, id))v20)[2](v20, v13, v19, v15);
  }

  return v21;
}

- (id)_lock_rootEntryFromRootEntry:(id)a3 afterRemovingEntryForContainerPath:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  BOOL v8 = 0LL;
  id v9 = v7;
  while (1)
  {
    [v9 containerPath];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = [v10 isEqual:v6];

    if (v11) {
      break;
    }
    id v12 = v9;

    [v12 next];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    BOOL v8 = v12;
    if (!v9)
    {
      BOOL v8 = v12;
      goto LABEL_11;
    }
  }

  uint64_t v13 = [v9 next];
  id v14 = (void *)v13;
  if (v8)
  {
    [v8 setNext:v13];
    id v15 = v14;
  }

  else
  {
    id v15 = v7;
    id v7 = (id)v13;
  }

  container_log_handle_for_category();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412546;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_debug_impl( &dword_188846000,  v16,  OS_LOG_TYPE_DEBUG,  "Removing entry %@, new root is %@",  (uint8_t *)&v19,  0x16u);
  }

LABEL_11:
  id v17 = v7;

  return v17;
}

- (id)_lock_rootEntryByResortingFromRootEntry:(id)a3 insertEntry:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8)
  {
    id v9 = v8;
    if ([v7 ignore]
      || !-[MCMContainerClassCache _isEntryA:olderThanEntryB:](self, "_isEntryA:olderThanEntryB:", v7, v9))
    {
      id v12 = 0LL;
      id v14 = v9;
      while (1)
      {
        id v15 = v12;
        id v12 = v14;

        if (([v7 ignore] & 1) == 0)
        {
          uint64_t v16 = [v12 next];
          if (!v16) {
            break;
          }
          id v17 = (void *)v16;
          BOOL v18 = -[MCMContainerClassCache _isEntryA:olderThanEntryB:](self, "_isEntryA:olderThanEntryB:", v12, v7);

          if (v18) {
            break;
          }
        }

        [v12 next];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          [v12 setNext:v7];
          container_log_handle_for_category();
          int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            int v26 = 138412546;
            id v27 = v7;
            __int16 v28 = 2112;
            id v29 = v12;
            _os_log_debug_impl( &dword_188846000,  v19,  OS_LOG_TYPE_DEBUG,  "Inserting entry %@ after entry %@",  (uint8_t *)&v26,  0x16u);
          }

          uint64_t v13 = 0LL;
          goto LABEL_19;
        }
      }

      container_log_handle_for_category();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        [v12 next];
        id v24 = (void *)objc_claimAutoreleasedReturnValue();
        int v26 = 138412802;
        id v27 = v7;
        __int16 v28 = 2112;
        id v29 = v12;
        __int16 v30 = 2112;
        __int16 v31 = v24;
        _os_log_debug_impl( &dword_188846000,  v20,  OS_LOG_TYPE_DEBUG,  "Inserting entry %@ after entry %@ but before entry %@",  (uint8_t *)&v26,  0x20u);
      }

      [v12 next];
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setNext:v21];

      [v12 setNext:v7];
      uint64_t v13 = v12;
LABEL_19:
      id v10 = v9;
    }

    else
    {
      [v7 setNext:v9];
      id v10 = v7;

      container_log_handle_for_category();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        [v10 next];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        int v26 = 138412546;
        id v27 = v10;
        __int16 v28 = 2112;
        id v29 = v25;
        _os_log_debug_impl( &dword_188846000,  v11,  OS_LOG_TYPE_DEBUG,  "Inserting entry %@ as root entry; next = %@",
          (uint8_t *)&v26,
          0x16u);
      }

      id v12 = 0LL;
      uint64_t v13 = v9;
    }
  }

  else
  {
    id v10 = v7;
    id v12 = 0LL;
    uint64_t v13 = 0LL;
  }

  id v22 = v10;

  return v22;
}

- (BOOL)_isEntryA:(id)a3 olderThanEntryB:(id)a4
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  id v24 = 0LL;
  uint64_t v7 = [v5 birthtimeWithError:&v24];
  uint64_t v9 = v8;
  id v10 = v24;
  id v23 = 0LL;
  uint64_t v11 = [v6 birthtimeWithError:&v23];
  uint64_t v13 = v12;
  id v14 = v23;
  if (!(v7 | v9))
  {
    container_log_handle_for_category();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v5;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_error_impl( &dword_188846000,  v15,  OS_LOG_TYPE_ERROR,  "Unpredicatable resolution for conflicting container paths since birthtime not available on A; entry = %@, error = %@",
        buf,
        0x16u);
    }
  }

  if (!(v11 | v13))
  {
    container_log_handle_for_category();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_error_impl( &dword_188846000,  v16,  OS_LOG_TYPE_ERROR,  "Unpredicatable resolution for conflicting container paths since birthtime not available on B; entry = %@, error = %@",
        buf,
        0x16u);
    }
  }

  BOOL v17 = v7 < v11;
  if (v7 == v11 && (BOOL v17 = v9 < v13, v9 == v13))
  {
    container_log_handle_for_category();
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v5;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_error_impl( &dword_188846000,  v18,  OS_LOG_TYPE_ERROR,  "Unpredicatable resolution for conflicting container paths since birthtime is the same; entryA = %@, entryB = %@",
        buf,
        0x16u);
    }

    BOOL v19 = 0;
  }

  else
  {
    BOOL v19 = v17;
  }

  container_log_handle_for_category();
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    id v22 = @"NO";
    *(_DWORD *)buf = 138413826;
    id v26 = v5;
    if (v19) {
      id v22 = @"YES";
    }
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    __int16 v30 = v22;
    __int16 v31 = 2048;
    uint64_t v32 = v7;
    __int16 v33 = 2048;
    uint64_t v34 = v9;
    __int16 v35 = 2048;
    uint64_t v36 = v11;
    __int16 v37 = 2048;
    uint64_t v38 = v13;
    _os_log_debug_impl( &dword_188846000,  v20,  OS_LOG_TYPE_DEBUG,  "entryA %@ is older than entryB %@: %@; birthtimeA = %ld.%09ld, birthtimeB = %ld.%09ld",
      buf,
      0x48u);
  }

  return v19;
}

- (void)_handleUnrecoverableCorruptContainerPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [v3 containerRootURL];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 userIdentity];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v3 containerClass];
  [v3 containerPathIdentifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = 0LL;
  LODWORD(v6) = +[MCMCommandOperationDelete deleteContainerRootURL:userIdentity:containerClass:containerPathIdentifier:preferDirectDelete:error:]( &OBJC_CLASS___MCMCommandOperationDelete,  "deleteContainerRootURL:userIdentity:containerClass:containerPathIdentifier:preferDirectDelete:error:",  v4,  v5,  v6,  v7,  0LL,  &v11);
  id v8 = v11;

  container_log_handle_for_category();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if ((_DWORD)v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_188846000, v10, OS_LOG_TYPE_DEFAULT, "DELETED: [%@] (corrupt container)", buf, 0xCu);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_error_impl( &dword_188846000,  v10,  OS_LOG_TYPE_ERROR,  "Could not delete corrupt container; path = %@, error = %@",
      buf,
      0x16u);
  }
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (MCMContainerClassPath)containerClassPath
{
  return self->_containerClassPath;
}

- (NSUUID)lastCompletedDiskScanUUID
{
  return self->_lastCompletedDiskScanUUID;
}

- (void)setLastCompletedDiskScanUUID:(id)a3
{
}

- (NSUUID)targetDiskScanUUID
{
  return self->_targetDiskScanUUID;
}

- (void)setTargetDiskScanUUID:(id)a3
{
}

- (NSMutableDictionary)lock_cache
{
  return self->_lock_cache;
}

- (OS_dispatch_queue)fsScanQueue
{
  return self->_fsScanQueue;
}

- (BOOL)writeThroughEnabled
{
  return self->_writeThroughEnabled;
}

- (void)setWriteThroughEnabled:(BOOL)a3
{
  self->_writeThroughEnabled = a3;
}

- (Class)cacheEntryClass
{
  return self->_cacheEntryClass;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
}

void __57__MCMContainerClassCache__processCorruptEntries_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)MEMORY[0x1895CE3A8]();
  objc_msgSend(*(id *)(a1 + 32), "_concurrent_processCorruptEntry:handler:", v4, *(void *)(a1 + 40));
  objc_autoreleasePoolPop(v3);
}

void __47__MCMContainerClassCache__processURLs_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)MEMORY[0x1895CE3A8]();
  objc_msgSend(*(id *)(a1 + 32), "_concurrent_processURL:handler:", v4, *(void *)(a1 + 40));
  objc_autoreleasePoolPop(v3);
}

BOOL __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 urlsForItemsInDirectoryAtURL:v5 error:a3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObjectsFromArray:v7];
  return v7 != 0LL;
}

void __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  container_log_handle_for_category();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl( &dword_188846000,  v4,  OS_LOG_TYPE_DEFAULT,  "Disk sync reporting on new entry: %@",  (uint8_t *)&v9,  0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  [v3 identifier];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 containerPath];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v5 _setEntry:v3 forIdentifier:v6 containerPath:v7 writeThrough:1 replace:0];
}

void __45__MCMContainerClassCache__queue_syncWithDisk__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  container_log_handle_for_category();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl( &dword_188846000,  v4,  OS_LOG_TYPE_DEFAULT,  "Disk sync reporting on repaired entry: %@",  (uint8_t *)&v9,  0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  [v3 identifier];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 containerPath];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v5 _setEntry:v3 forIdentifier:v6 containerPath:v7 writeThrough:1 replace:1];
}

uint64_t __68__MCMContainerClassCache__checkExistanceOfCacheEntry_libraryRepair___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = a2;
  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 itemAtURL:v5 exists:*(void *)(*(void *)(a1 + 32) + 8) + 24 error:a3];

  return v7;
}

uint64_t __43__MCMContainerClassCache_forceWriteThrough__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  a2,  0LL,  a3);
}

uint64_t __51__MCMContainerClassCache_asyncStartSynchronization__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_consumeResyncRequired");
  if ((_DWORD)result) {
    return objc_msgSend(*(id *)(a1 + 32), "_queue_syncWithDisk");
  }
  return result;
}

uint64_t __58__MCMContainerClassCache_waitForSynchronizationToComplete__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_consumeResyncRequired");
  if ((_DWORD)result) {
    return objc_msgSend(*(id *)(a1 + 32), "_queue_syncWithDisk");
  }
  return result;
}

@end