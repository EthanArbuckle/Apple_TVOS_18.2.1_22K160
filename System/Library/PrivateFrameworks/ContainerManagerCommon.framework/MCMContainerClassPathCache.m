@interface MCMContainerClassPathCache
- (MCMContainerClassPathCache)initWithUserIdentityCache:(id)a3;
- (MCMUserIdentityCache)userIdentityCache;
- (id)_lock_containerClassPathForUserIdentity:(id)a3 containerConfig:(id)a4 typeClass:(Class)a5;
- (id)containerClassPathForContainerIdentity:(id)a3 typeClass:(Class)a4;
- (id)containerClassPathForUserIdentity:(id)a3 containerConfig:(id)a4 typeClass:(Class)a5;
- (id)containerClassPathWithURL:(id)a3 reference:(id)a4;
- (id)referenceForPOSIXUser:(id)a3;
- (void)_lock_flush;
- (void)flush;
- (void)userIdentityCache:(id)a3 didAddUserIdentity:(id)a4;
- (void)userIdentityCache:(id)a3 didInvalidateUserIdentity:(id)a4;
@end

@implementation MCMContainerClassPathCache

- (MCMContainerClassPathCache)initWithUserIdentityCache:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCMContainerClassPathCache;
  v6 = -[MCMContainerClassPathCache init](&v10, sel_init);
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x189603FC8] dictionaryWithCapacity:1];
    lookup = v6->_lookup;
    v6->_lookup = (NSMutableDictionary *)v7;

    v6->_lookupLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_userIdentityCache, a3);
  }

  return v6;
}

- (id)containerClassPathForContainerIdentity:(id)a3 typeClass:(Class)a4
{
  id v6 = a3;
  [v6 userIdentity];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 containerConfig];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MCMContainerClassPathCache containerClassPathForUserIdentity:containerConfig:typeClass:]( self,  "containerClassPathForUserIdentity:containerConfig:typeClass:",  v7,  v8,  a4);
  return v9;
}

- (id)containerClassPathForUserIdentity:(id)a3 containerConfig:(id)a4 typeClass:(Class)a5
{
  id v8 = a4;
  id v9 = a3;
  -[MCMContainerClassPathCache userIdentityCache](self, "userIdentityCache");
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 userIdentityForContainerConfig:v8 originatorUserIdentity:v9];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_lookupLock);
  v12 = -[MCMContainerClassPathCache _lock_containerClassPathForUserIdentity:containerConfig:typeClass:]( self,  "_lock_containerClassPathForUserIdentity:containerConfig:typeClass:",  v11,  v8,  a5);
  os_unfair_lock_unlock(&self->_lookupLock);
  return v12;
}

- (void)flush
{
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  -[MCMContainerClassPathCache _lock_flush](self, "_lock_flush");
  os_unfair_lock_unlock(p_lookupLock);
}

- (id)referenceForPOSIXUser:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189603FC8] dictionaryWithCapacity:30];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerClassPathCache userIdentityCache](self, "userIdentityCache");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = MEMORY[0x1895F87A8];
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke;
  v24[3] = &unk_18A29D250;
  id v25 = v4;
  id v9 = v6;
  id v26 = v9;
  id v10 = v4;
  [v7 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v24];

  id v11 = containermanager_copy_global_configuration();
  [v11 classIterator];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v8;
  uint64_t v18 = 3221225472LL;
  v19 = __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke_2;
  v20 = &unk_18A29D278;
  id v21 = v9;
  v22 = self;
  id v23 = v5;
  id v13 = v5;
  id v14 = v9;
  [v12 selectWithIterator:&v17];

  v15 = (void *)objc_msgSend(v13, "copy", v17, v18, v19, v20);
  return v15;
}

- (id)containerClassPathWithURL:(id)a3 reference:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  [a3 path];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v5;
  uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        if ([v6 hasPrefix:v11])
        {
          [v7 objectForKeyedSubscript:v11];
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }

      uint64_t v8 = (void *)[v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

- (void)userIdentityCache:(id)a3 didInvalidateUserIdentity:(id)a4
{
}

- (void)userIdentityCache:(id)a3 didAddUserIdentity:(id)a4
{
}

- (id)_lock_containerClassPathForUserIdentity:(id)a3 containerConfig:(id)a4 typeClass:(Class)a5
{
  v31  = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_owner(&self->_lookupLock);
  uint64_t v10 = [v9 containerClass];

  NSStringFromClass(a5);
  uint64_t v11 = (char *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_lookup, "objectForKeyedSubscript:", v11);
    if (!v12)
    {
      id v13 = (void *)MEMORY[0x189603FC8];
      +[MCMContainerClassPath containerPathTypeClasses](&OBJC_CLASS___MCMContainerClassPath, "containerPathTypeClasses");
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v12  = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lookup, "setObject:forKeyedSubscript:", v12, v11);
    }

    [v12 objectForKeyedSubscript:v8];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      [MEMORY[0x189603FC8] dictionaryWithCapacity:15];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setObject:v15 forKeyedSubscript:v8];
    }

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v10];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 objectForKeyedSubscript:v16];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[objc_class containerPathForUserIdentity:containerClass:]( a5,  "containerPathForUserIdentity:containerClass:",  v8,  v10);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 138413058;
        v24  = v11;
        __int16 v25 = 2112;
        id v26 = v8;
        __int16 v27 = 2048;
        v28  = v10;
        v29  = 2112;
        v30  = v17;
        _os_log_debug_impl( &dword_188846000,  v18,  OS_LOG_TYPE_DEBUG,  "Container class path cache miss, creating type  = [%@], userIdentity  = [%@], class  = %llu: %@",  (uint8_t *)&v23,  0x2Au);
      }

      if (v17)
      {
        [MEMORY[0x189607968] numberWithUnsignedLongLong:v10];
        v19  = (void *)objc_claimAutoreleasedReturnValue();
        [v15 setObject:v17 forKeyedSubscript:v19];
      }
    }

    v20  = v17;

    id v21 = v20;
  }

  else
  {
    container_log_handle_for_category();
    v20  = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      int v23 = 136315138;
      v24  = "-[MCMContainerClassPathCache _lock_containerClassPathForUserIdentity:containerConfig:typeClass:]";
      _os_log_fault_impl( &dword_188846000,  v20,  OS_LOG_TYPE_FAULT,  "Cannot call %s with a nil user identity.",  (uint8_t *)&v23,  0xCu);
    }

    id v21 = 0LL;
  }

  return v21;
}

- (void)_lock_flush
{
  v3  = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  lookup  = self->_lookup;
  self->_lookup  = v3;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
}

void __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke(uint64_t a1, void *a2)
{
  v3  = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:");
}

void __52__MCMContainerClassPathCache_referenceForPOSIXUser___block_invoke_2(id *a1, void *a2)
{
  v57[1]  = *MEMORY[0x1895F89C0];
  v3  = a2;
  +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 defaultUserIdentity];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0]  = v5;
  [MEMORY[0x189603F18] arrayWithObjects:v57 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  v37  = v3;
  if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:]( MCMUserIdentity,  "isUserIdentityRequiredForContainerClass:",  [v3 containerClass]))
  {
    id v7 = a1[4];
LABEL_11:

    id v6 = v7;
    goto LABEL_12;
  }

  unint64_t v8 = [v3 containerClass];
  if (v8 <= 8 && ((1LL << v8) & 0x12A) != 0)
  {
    id v9 = containermanager_copy_global_configuration();
    int v10 = [v9 bundleContainerMode];

    if (v10 == 1)
    {
      +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 globalBundleUserIdentity];
      v12  = (void *)objc_claimAutoreleasedReturnValue();
      v56  = v12;
      id v13 = (void *)MEMORY[0x189603F18];
      __int128 v14 = &v56;
LABEL_10:
      [v13 arrayWithObjects:v14 count:1];
      id v7 = (id)objc_claimAutoreleasedReturnValue();

      v3  = v37;
      id v6 = v11;
      goto LABEL_11;
    }
  }

  if (([v3 containerClass] & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    id v15 = containermanager_copy_global_configuration();
    int v16 = [v15 systemContainerMode];

    if (v16 == 1)
    {
      +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 globalSystemUserIdentity];
      v12  = (void *)objc_claimAutoreleasedReturnValue();
      v55  = v12;
      id v13 = (void *)MEMORY[0x189603F18];
      __int128 v14 = &v55;
      goto LABEL_10;
    }
  }

@end