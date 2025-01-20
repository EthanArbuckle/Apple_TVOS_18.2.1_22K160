@interface MCMGroupManager
+ (id)defaultManager;
- (MCMGroupManager)initWithUserIdentityCache:(id)a3;
- (MCMUserIdentityCache)userIdentityCache;
- (id)groupContainerIdentifiersForOwnerIdentifier:(id)a3 groupContainerClass:(unint64_t)a4 codeSignInfo:(id)a5 withError:(id *)a6;
- (void)_cleanupUnreferencedGroupContainersForUserIdentity:(id)a3 containerClass:(unint64_t)a4 referenceCounts:(id)a5 context:(id)a6;
- (void)reconcileGroupContainersForContainerClass:(unint64_t)a3 context:(id)a4;
@end

@implementation MCMGroupManager

- (MCMGroupManager)initWithUserIdentityCache:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCMGroupManager;
  v6 = -[MCMGroupManager init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userIdentityCache, a3);
  }

  return v7;
}

- (void)reconcileGroupContainersForContainerClass:(unint64_t)a3 context:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  v7 = (void *)[(id)gCodeSigningMapping copyReferenceCountSetForContainerClass:a3];
  if (v7)
  {
    if (a3 == 7)
    {
      v11 = -[MCMGroupManager userIdentityCache](self, "userIdentityCache");
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __69__MCMGroupManager_reconcileGroupContainersForContainerClass_context___block_invoke;
      v12[3] = &unk_18A29DC50;
      v12[4] = self;
      uint64_t v15 = 7LL;
      id v13 = v7;
      id v14 = v6;
      [v11 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v12];
    }

    else if (a3 == 13)
    {
      v8 = -[MCMGroupManager userIdentityCache](self, "userIdentityCache");
      [v8 globalSystemUserIdentity];
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[MCMGroupManager _cleanupUnreferencedGroupContainersForUserIdentity:containerClass:referenceCounts:context:]( self,  "_cleanupUnreferencedGroupContainersForUserIdentity:containerClass:referenceCounts:context:",  v9,  13LL,  v7,  v6);
    }
  }

  else
  {
    container_log_handle_for_category();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v17 = a3;
      _os_log_error_impl( &dword_188846000,  v10,  OS_LOG_TYPE_ERROR,  "Failed to get reference count information for group type: %llu",  buf,  0xCu);
    }
  }
}

- (void)_cleanupUnreferencedGroupContainersForUserIdentity:(id)a3 containerClass:(unint64_t)a4 referenceCounts:(id)a5 context:(id)a6
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v42 = (void *)objc_opt_new();
  [v11 containerCache];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v9;
  [MEMORY[0x189604010] setWithObject:v9];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v43 = 0LL;
  [v12 entriesForUserIdentities:v13 contentClass:a4 transient:0 error:&v43];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v43;

  if (v14)
  {
    id v39 = v15;
    id v40 = v11;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    v38 = v14;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v50 count:16];
    uint64_t v18 = v42;
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v20 = *(void *)v52;
      do
      {
        uint64_t v21 = 0LL;
        do
        {
          if (*(void *)v52 != v20) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * v21) metadataMinimal];
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 identifier];
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v24 = [v10 countForObject:v23];
          if (v24)
          {
            uint64_t v25 = v24;
            container_log_handle_for_category();
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v45 = v23;
              __int16 v46 = 2048;
              uint64_t v47 = v25;
              _os_log_impl( &dword_188846000,  v26,  OS_LOG_TYPE_DEFAULT,  "Reference count for [%{public}@] is %lu",  buf,  0x16u);
            }
          }

          else
          {
            [v22 containerIdentity];
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            [v18 addObject:v27];

            container_log_handle_for_category();
            v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              [v41 shortDescription];
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              [v22 containerPath];
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v45 = v23;
              __int16 v46 = 2112;
              uint64_t v47 = (uint64_t)v28;
              __int16 v48 = 2112;
              v49 = v29;
              _os_log_error_impl( &dword_188846000,  v26,  OS_LOG_TYPE_ERROR,  "Removing group container [%@] for %@ at %@",  buf,  0x20u);

              uint64_t v18 = v42;
            }
          }

          ++v21;
        }

        while (v19 != v21);
        uint64_t v19 = [v16 countByEnumeratingWithState:&v51 objects:v50 count:16];
      }

      while (v19);
    }

    v30 = v18;
    v31 = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
    if ([v30 count])
    {
      [v30 allObjects];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      id v11 = v40;
      v33 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:]( &OBJC_CLASS___MCMCommandOperationDelete,  "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:",  v32,  0LL,  v40,  v31);
      [v33 execute];
      v34 = -[MCMResultPromise result](v31, "result");
      [v34 error];
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      id v14 = v38;
      if (v35)
      {
        container_log_handle_for_category();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v35;
          _os_log_error_impl( &dword_188846000,  v36,  OS_LOG_TYPE_ERROR,  "Failed to destroy group container(s) during reconciliation; error = %@",
            buf,
            0xCu);
        }
      }

      id v15 = v39;
    }

    else
    {
      id v15 = v39;
      id v11 = v40;
      id v14 = v38;
    }
  }

  else
  {
    container_log_handle_for_category();
    v31 = (MCMResultPromise *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
    {
      [v41 shortDescription];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v37;
      __int16 v46 = 2112;
      uint64_t v47 = (uint64_t)v15;
      _os_log_error_impl( &dword_188846000,  (os_log_t)v31,  OS_LOG_TYPE_ERROR,  "Failed to fetch group container list for %@: %@",  buf,  0x16u);
    }
  }
}

- (id)groupContainerIdentifiersForOwnerIdentifier:(id)a3 groupContainerClass:(unint64_t)a4 codeSignInfo:(id)a5 withError:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a5;
  [v10 identifier];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  char v12 = [v9 isEqualToString:v11];

  objc_opt_class();
  id v13 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v14 = v13;
  }
  else {
    id v14 = 0LL;
  }

  if (v14)
  {
    if (v10) {
      char v15 = v12;
    }
    else {
      char v15 = 0;
    }
    if ((v15 & 1) != 0)
    {
      [v10 entitlements];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = v16;
      if (a4 == 13) {
        [v16 systemGroupIdentifiers];
      }
      else {
        [v16 appGroupIdentifiers];
      }
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (a4 == 13) {
        [(id)gCodeSigningMapping systemGroupIdentifiersForIdentifier:v13];
      }
      else {
        [(id)gCodeSigningMapping appGroupIdentifiersForIdentifier:v13];
      }
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!v20)
    {
      [MEMORY[0x189604010] set];
      id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
      uint64_t v19 = 0LL;
      goto LABEL_33;
    }

    objc_opt_class();
    id v21 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v22 = v21;
    }
    else {
      id v22 = 0LL;
    }

    if (v22) {
      goto LABEL_26;
    }
    container_log_handle_for_category();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138412546;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v21;
      _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Wrong group id obj type for ID: %@ : %@",  (uint8_t *)&v25,  0x16u);
    }

    uint64_t v19 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  11LL,  3LL);
  }

  else
  {
    container_log_handle_for_category();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138412290;
      id v26 = v13;
      _os_log_error_impl( &dword_188846000,  v18,  OS_LOG_TYPE_ERROR,  "Can't act on an invalid object: ID: %@",  (uint8_t *)&v25,  0xCu);
    }

    uint64_t v19 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  11LL,  3LL);
  }

  id v21 = 0LL;
  if (a6 && v19)
  {
    uint64_t v19 = v19;
    id v21 = 0LL;
    *a6 = v19;
  }

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
}

void __69__MCMGroupManager_reconcileGroupContainersForContainerClass_context___block_invoke( uint64_t a1,  void *a2)
{
  id v6 = a2;
  if ([v6 homeDirectoryExists])
  {
    uint64_t v3 = *(void *)(a1 + 56);
    v4 = *(void **)(a1 + 32);
    id v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v4 _cleanupUnreferencedGroupContainersForUserIdentity:v6 containerClass:v3 referenceCounts:v5 context:*(void *)(a1 + 48)];
  }
}

+ (id)defaultManager
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __33__MCMGroupManager_defaultManager__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  if (defaultManager_onceToken_8235 != -1) {
    dispatch_once(&defaultManager_onceToken_8235, v3);
  }
  return (id)defaultManager_sharedInstance;
}

void __33__MCMGroupManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  +[MCMUserIdentitySharedCache sharedInstance](&OBJC_CLASS___MCMUserIdentitySharedCache, "sharedInstance");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend(v1, "initWithUserIdentityCache:");
  uint64_t v3 = (void *)defaultManager_sharedInstance;
  defaultManager_sharedInstance = v2;
}

@end