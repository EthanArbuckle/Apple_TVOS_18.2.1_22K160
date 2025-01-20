@interface MCMContainerManager
+ (id)defaultManager;
- (BOOL)replaceContainer:(id)a3 withContainer:(id)a4 error:(id *)a5;
- (BOOL)replaceContainer:(id)a3 withContainer:(id)a4 error:(id *)a5 withCompletion:(id)a6;
- (MCMContainerManager)init;
- (id)_containersWithClass:(int64_t)a3 temporary:(BOOL)a4 error:(id *)a5;
- (id)containerWithContentClass:(int64_t)a3 identifier:(id)a4 createIfNecessary:(BOOL)a5 existed:(BOOL *)a6 error:(id *)a7;
- (id)containerWithContentClass:(int64_t)a3 identifier:(id)a4 error:(id *)a5;
- (id)containersWithClass:(int64_t)a3 error:(id *)a4;
- (id)deleteContainers:(id)a3 withCompletion:(id)a4;
- (id)temporaryContainerWithContentClass:(int64_t)a3 identifier:(id)a4 existed:(BOOL *)a5 error:(id *)a6;
- (id)temporaryContainersWithClass:(int64_t)a3 error:(id *)a4;
@end

@implementation MCMContainerManager

- (MCMContainerManager)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  container_log_handle_for_category();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl( &dword_1883D9000,  v2,  OS_LOG_TYPE_FAULT,  "Aborting because you tried to init MobileContainerManager singleton!",  v3,  2u);
  }

  abort();
}

- (id)containerWithContentClass:(int64_t)a3 identifier:(id)a4 error:(id *)a5
{
  id v7 = a4;
  [_containerClassForContentClass(a3) containerWithIdentifier:v7 error:a5];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)containerWithContentClass:(int64_t)a3 identifier:(id)a4 createIfNecessary:(BOOL)a5 existed:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v11 = a4;
  [_containerClassForContentClass(a3) containerWithIdentifier:v11 createIfNecessary:v9 existed:a6 error:a7];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)temporaryContainerWithContentClass:(int64_t)a3 identifier:(id)a4 existed:(BOOL *)a5 error:(id *)a6
{
  id v9 = a4;
  [_containerClassForContentClass(a3) temporaryContainerWithIdentifier:v9 existed:a5 error:a6];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)containersWithClass:(int64_t)a3 error:(id *)a4
{
  return -[MCMContainerManager _containersWithClass:temporary:error:]( self,  "_containersWithClass:temporary:error:",  a3,  0LL,  a4);
}

- (id)temporaryContainersWithClass:(int64_t)a3 error:(id *)a4
{
  return -[MCMContainerManager _containersWithClass:temporary:error:]( self,  "_containersWithClass:temporary:error:",  a3,  1LL,  a4);
}

- (id)deleteContainers:(id)a3 withCompletion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  size_t v7 = [v5 count];
  size_t v8 = v7;
  if (v7 <= 1) {
    size_t v7 = 1LL;
  }
  id v9 = calloc(v7, 8uLL);
  __s = v9;
  if (v8)
  {
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      [v5 objectAtIndex:i];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9[i] = [v11 getLowLevelContainerObject];
    }
  }

  uint64_t v21 = MEMORY[0x1895F87A8];
  id v12 = v6;
  uint64_t v13 = container_delete_array_of_containers();
  if (v13 != 1)
  {
    objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  @"MCMErrorDomain",  v13,  0,  v21,  3221225472,  __55__MCMContainerManager_deleteContainers_withCompletion___block_invoke,  &unk_18A234968,  v12,  __s);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9) {
      goto LABEL_18;
    }
LABEL_17:
    free(v9);
    memset_s(&__s, 8uLL, 0, 8uLL);
    goto LABEL_18;
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v14 = v5;
  uint64_t v15 = objc_msgSend( v14,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16,  v21,  3221225472,  __55__MCMContainerManager_deleteContainers_withCompletion___block_invoke,  &unk_18A234968,  v12,  __s);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t j = 0LL; j != v16; ++j)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * j) markDeleted];
      }

      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v24 count:16];
    }

    while (v16);
  }

  v19 = 0LL;
  if (v9) {
    goto LABEL_17;
  }
LABEL_18:

  return v19;
}

- (BOOL)replaceContainer:(id)a3 withContainer:(id)a4 error:(id *)a5
{
  return -[MCMContainerManager replaceContainer:withContainer:error:withCompletion:]( self,  "replaceContainer:withContainer:error:withCompletion:",  a3,  a4,  a5,  0LL);
}

- (BOOL)replaceContainer:(id)a3 withContainer:(id)a4 error:(id *)a5 withCompletion:(id)a6
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  [v9 getLowLevelContainerObject];
  [v11 getLowLevelContainerObject];

  uint64_t v17 = MEMORY[0x1895F87A8];
  id v18 = v10;
  id v12 = v10;
  uint64_t v13 = container_replace();
  if (v13 == 1)
  {
    objc_msgSend( v9,  "markDeleted",  v17,  3221225472,  __75__MCMContainerManager_replaceContainer_withContainer_error_withCompletion___block_invoke,  &unk_18A234968,  v18,  v20);
    id v14 = 0LL;
  }

  else
  {
    objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  @"MCMErrorDomain",  v13,  0,  v17,  3221225472,  __75__MCMContainerManager_replaceContainer_withContainer_error_withCompletion___block_invoke,  &unk_18A234968,  v18,  v20);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v15;
    if (a5 && v15)
    {
      id v14 = v15;
      *a5 = v14;
    }
  }

  return v14 == 0LL;
}

void __75__MCMContainerManager_replaceContainer_withContainer_error_withCompletion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = 0LL;
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:a2 userInfo:0];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }
}

void __55__MCMContainerManager_deleteContainers_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    v3 = 0LL;
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:a2 userInfo:0];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = v3;
    (*(void (**)(void))(v4 + 16))();
    v3 = v5;
  }
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_83);
  }
  return (id)defaultManager_sharedInstance;
}

void __37__MCMContainerManager_defaultManager__block_invoke()
{
  v0 = objc_alloc(&OBJC_CLASS___MCMContainerManager);
  v1 = (void *)defaultManager_sharedInstance;
  defaultManager_sharedInstance = (uint64_t)v0;
}

- (id)_containersWithClass:(int64_t)a3 temporary:(BOOL)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  uint64_t v42 = 1LL;
  uint64_t all_with_class_for_current_user = container_get_all_with_class_for_current_user();
  uint64_t v7 = objc_opt_new();
  size_t v8 = (void *)v7;
  if (v41)
  {
    v32 = a5;
    id v9 = 0LL;
    unint64_t v10 = 0LL;
    unint64_t v11 = 0x18C70B000uLL;
    unint64_t v12 = 0x189607000uLL;
    v34 = (void *)v7;
    do
    {
      unint64_t v13 = container_get_class();
      if (*(void *)(v11 + 3912) != -1LL) {
        dispatch_once(&MCMGetMCMContainerClassForContainerClass_onceToken, &__block_literal_global);
      }
      if (v13 > 0xE) {
        uint64_t v14 = 0LL;
      }
      else {
        uint64_t v14 = MCMGetMCMContainerClassForContainerClass_containerClassReverseMap[v13];
      }
      uint64_t v15 = (objc_class *)_containerClassForContentClass(v14);
      if (*(void *)(all_with_class_for_current_user + 8 * v10))
      {
        uint64_t v16 = v15;
        uunsigned int uid = (const unsigned __int8 *)container_object_get_uuid();
        if (!uuid_is_null(uuid)
          && container_object_get_identifier()
          && (unint64_t)(container_object_get_class() - 1) <= 0xD)
        {
          if (*(void *)(all_with_class_for_current_user + 8 * v10))
          {
            id v18 = (const unsigned __int8 *)container_object_get_uuid();
            uuid_copy(dst, v18);
          }

          else
          {
            uuid_clear(dst);
          }

          uint64_t identifier = container_get_identifier();
          __s = (void *)container_copy_path();
          uint64_t v20 = MEMORY[0x1895C4338](*(void *)(all_with_class_for_current_user + 8 * v10));
          uint64_t persona_unique_string = container_get_persona_unique_string();
          v38 = v9;
          if (persona_unique_string)
          {
            uint64_t v22 = [*(id *)(v12 + 2600) stringWithUTF8String:persona_unique_string];
          }

          else
          {
            uint64_t v22 = 0LL;
          }

          unsigned int uid = container_get_uid();
          id v23 = objc_alloc(v16);
          uint64_t v33 = identifier;
          [*(id *)(v12 + 2600) stringWithUTF8String:identifier];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(v12 + 2600) stringWithUTF8String:__s];
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(v12 + 2600) stringWithUTF8String:v20];
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v27 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:dst];
          id v39 = v38;
          v37 = (void *)v22;
          __int128 v28 = (void *)[v23 initWithIdentifier:v24 path:v25 uniquePathComponent:v26 uuid:v27 personaUniqueString:v22 uid:uid error:&v39];
          id v36 = v39;

          if (__s)
          {
            free(__s);
            memset_s(&__s, 8uLL, 0, 8uLL);
          }

          size_t v8 = v34;
          if (v28)
          {
            [v34 addObject:v28];
            unint64_t v12 = 0x189607000LL;
            uint64_t v29 = v37;
          }

          else
          {
            container_log_handle_for_category();
            v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            unint64_t v12 = 0x189607000LL;
            uint64_t v29 = v37;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v44 = v33;
              __int16 v45 = 2080;
              v46 = dst;
              __int16 v47 = 2048;
              uint64_t v48 = v14;
              _os_log_fault_impl( &dword_1883D9000,  v30,  OS_LOG_TYPE_FAULT,  "Failed to init container: %s:%s:%ld",  buf,  0x20u);
            }
          }

          id v9 = v36;
          unint64_t v11 = 0x18C70B000LL;
        }
      }

      ++v10;
    }

    while (v10 < v41);
    a5 = v32;
  }

  else
  {
    id v9 = 0LL;
  }

  container_free_array_of_containers();
  if (a5 && v9) {
    *a5 = v9;
  }

  return v8;
}

@end