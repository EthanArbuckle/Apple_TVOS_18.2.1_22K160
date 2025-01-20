@interface NEAppInfoCache
+ (id)sharedAppInfoCache;
- (NEAppInfoCache)init;
- (id)bundleIDWithoutTeamID:(void *)a1;
- (uint64_t)appInfo:(void *)a3 mismatchedWithUUID:(void *)a4 andBundleID:;
- (void)addAppInfoToCache:(void *)a1;
- (void)appInfoForPid:(void *)a3 UUID:(void *)a4 bundleID:(void *)a5 completionHandler:;
- (void)performCustomLookupIfNecessaryForPid:(void *)a3 UUID:(void *)a4 bundleID:(void *)a5 completionHandler:;
@end

@implementation NEAppInfoCache

- (NEAppInfoCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEAppInfoCache;
  v2 = -[NEAppInfoCache init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    cachedSourceAppInfo = v2->_cachedSourceAppInfo;
    v2->_cachedSourceAppInfo = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v6 = dispatch_queue_create("NEAppInfoCache queue", v5);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v6;
  }

  return v2;
}

- (void).cxx_destruct
{
}

+ (id)sharedAppInfoCache
{
  if (sharedAppInfoCache_onceToken != -1) {
    dispatch_once(&sharedAppInfoCache_onceToken, &__block_literal_global);
  }
  return (id)sharedAppInfoCache_sharedAppInfoCache;
}

void __36__NEAppInfoCache_sharedAppInfoCache__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___NEAppInfoCache);
  v1 = (void *)sharedAppInfoCache_sharedAppInfoCache;
  sharedAppInfoCache_sharedAppInfoCache = (uint64_t)v0;
}

- (void)appInfoForPid:(void *)a3 UUID:(void *)a4 bundleID:(void *)a5 completionHandler:
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  v12 = a5;
  if (a1)
  {
    if (a2 < 0)
    {
      ne_log_obj();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[NEAppInfoCache appInfoForPid:UUID:bundleID:completionHandler:]";
        __int16 v23 = 1024;
        int v24 = a2;
        _os_log_fault_impl(&dword_1876B1000, v14, OS_LOG_TYPE_FAULT, "%s got invalid pid: %d", buf, 0x12u);
      }

      v12[2](v12, 0LL);
    }

    else
    {
      Property = (dispatch_queue_s *)objc_getProperty(a1, v11, 24LL, 1);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke;
      block[3] = &unk_18A08D8E8;
      int v20 = a2;
      id v16 = v9;
      id v17 = v10;
      v18 = a1;
      v19 = v12;
      dispatch_async(Property, block);
    }
  }
}

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  id v40 = 0LL;
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v22 = *(_DWORD *)(a1 + 64);
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67109634;
    int v42 = v22;
    __int16 v43 = 2112;
    uint64_t v44 = v23;
    __int16 v45 = 2112;
    uint64_t v46 = v24;
    _os_log_debug_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEBUG,  "Fetching appInfo from cache for pid: %d uuid: %@ bundle id: %@",  buf,  0x1Cu);
  }

  id v4 = *(id *)(a1 + 32);
  if (v4)
  {
    id Property = *(id *)(a1 + 48);
    if (Property) {
      id Property = objc_getProperty(Property, v3, 16LL, 1);
    }
    id v6 = Property;
    uint64_t v7 = [v6 objectForKeyedSubscript:v4];
    v8 = (void *)v36[5];
    v36[5] = v7;
  }

  uint64_t v9 = v36[5];
  if (!v9)
  {
    v11 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v12 = *(unsigned int *)(a1 + 64);
    v13 = *(void **)(a1 + 32);
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_2;
    v25[3] = &unk_18A08B120;
    v28[1] = &v35;
    v25[4] = v10;
    id v26 = v13;
    id v27 = *(id *)(a1 + 40);
    v28[0] = *(id *)(a1 + 56);
    int v29 = *(_DWORD *)(a1 + 64);
    -[NEAppInfoCache performCustomLookupIfNecessaryForPid:UUID:bundleID:completionHandler:](v10, v12, v26, v11, v25);
    v14 = &v26;
    v15 = &v27;
    id v16 = (id *)v28;
LABEL_13:

    goto LABEL_14;
  }

  if (!*(void *)(v9 + 40))
  {
    uint64_t v17 = *(unsigned int *)(a1 + 64);
    if ((int)v17 >= 1)
    {
      v18 = *(void **)(a1 + 32);
      v19 = *(void **)(a1 + 40);
      v30[0] = MEMORY[0x1895F87A8];
      v30[1] = 3221225472LL;
      v30[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_46;
      v30[3] = &unk_18A08B120;
      uint64_t v21 = *(void *)(a1 + 48);
      int v20 = *(void **)(a1 + 56);
      v33[1] = &v35;
      v30[4] = v21;
      v33[0] = v20;
      id v31 = *(id *)(a1 + 32);
      id v32 = *(id *)(a1 + 40);
      int v34 = *(_DWORD *)(a1 + 64);
      -[NEAppInfoCache performCustomLookupIfNecessaryForPid:UUID:bundleID:completionHandler:](v21, v17, v18, v19, v30);
      v14 = (id *)v33;
      v15 = &v31;
      id v16 = &v32;
      goto LABEL_13;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
LABEL_14:

  _Block_object_dispose(&v35, 8);
}

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_46( uint64_t a1,  void *a2)
{
  id v4 = a2;
  id v8 = v4;
  if (v4)
  {
    if (!-[NEAppInfoCache appInfo:mismatchedWithUUID:andBundleID:]( *(void *)(a1 + 32),  v4,  *(void **)(a1 + 40),  *(void **)(a1 + 48)))
    {
      uint64_t v7 = *(void *)(a1 + 64);
      uint64_t v6 = a1 + 64;
      objc_storeStrong((id *)(*(void *)(v7 + 8) + 40LL), a2);
      -[NEAppInfoCache addAppInfoToCache:](*(void **)(v6 - 32), *(void **)(*(void *)(*(void *)v6 + 8LL) + 40LL));
      uint64_t v5 = *(void *)(v6 - 8);
      goto LABEL_6;
    }

    -[NEAppInfoCache addAppInfoToCache:](*(void **)(a1 + 32), v8);
  }

  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = a1 + 64;
LABEL_6:
  (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(*(void *)(*(void *)v6 + 8LL) + 40LL));
}

- (void)performCustomLookupIfNecessaryForPid:(void *)a3 UUID:(void *)a4 bundleID:(void *)a5 completionHandler:
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      ne_log_obj();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)length = 67109634;
        *(_DWORD *)&length[4] = a2;
        *(_WORD *)&length[8] = 2112;
        *(void *)&length[10] = v9;
        __int16 v43 = 2112;
        id v44 = v10;
        _os_log_debug_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_DEBUG,  "Calling delegate lookup handler with pid: %d, uuid: %@, bundleID: %@",  length,  0x1Cu);
      }

      v40[0] = MEMORY[0x1895F87A8];
      v40[1] = 3221225472LL;
      v40[2] = __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke;
      v40[3] = &unk_18A08B148;
      v40[4] = a1;
      id v41 = v11;
      [WeakRetained fetchAppInfoForPID:a2 UUID:v9 bundleID:v10 completionHandler:v40];

LABEL_39:
      goto LABEL_40;
    }

    id v14 = v10;
    ne_log_obj();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)length = 67109378;
      *(_DWORD *)&length[4] = a2;
      *(_WORD *)&length[8] = 2112;
      *(void *)&length[10] = v14;
      _os_log_debug_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_DEBUG,  "Origin lookup for pid %d, bundle id: %@",  length,  0x12u);
    }

    v39 = v14;
    if (v14)
    {
      id v16 = (void *)[v14 length];
      if (v16)
      {
        -[NEAppInfoCache bundleIDWithoutTeamID:](v14);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

    else
    {
      id v16 = 0LL;
    }

    id v38 = v16;
    [v38 UTF8String];
    uint64_t v17 = (void *)NEHelperCopyAppInfo();
    v18 = v17;
    id v37 = v9;
    if (v17)
    {
      uuid = xpc_dictionary_get_uuid(v17, "app-euuid");
      if (uuid) {
        uint64_t v20 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
      }
      else {
        uint64_t v20 = 0LL;
      }
      string = xpc_dictionary_get_string(v18, "app-identifier");
      if (string) {
        uint64_t v23 = (void *)[objc_alloc(NSString) initWithUTF8String:string];
      }
      else {
        uint64_t v23 = 0LL;
      }
      uint64_t v25 = xpc_dictionary_get_string(v18, "version-string");
      if (v25) {
        uint64_t v21 = (void *)[objc_alloc(NSString) initWithUTF8String:v25];
      }
      else {
        uint64_t v21 = 0LL;
      }
      *(void *)length = 0LL;
      data = xpc_dictionary_get_data(v18, "app-cd-hash", (size_t *)length);
      if (*(void *)length)
      {
        id v27 = data;
        id v28 = objc_alloc(MEMORY[0x189603F48]);
        int v22 = (void *)[v28 initWithBytes:v27 length:*(void *)length];
      }

      else
      {
        int v22 = 0LL;
      }
    }

    else
    {
      uint64_t v21 = 0LL;
      int v22 = 0LL;
      uint64_t v23 = 0LL;
      uint64_t v20 = 0LL;
    }

    int v29 = (void *)v20;
    if (!v20 && !v23 && !v21 && !v22)
    {
      v30 = 0LL;
LABEL_36:
      ne_log_large_obj();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)length = 138412290;
        *(void *)&length[4] = v30;
        _os_log_debug_impl(&dword_1876B1000, v36, OS_LOG_TYPE_DEBUG, "Origin lookup created appInfo:\n%@", length, 0xCu);
      }

      (*((void (**)(id, NEAppInfo *))v11 + 2))(v11, v30);
      id v9 = v37;
      goto LABEL_39;
    }

    id v31 = objc_alloc_init(&OBJC_CLASS___NEAppInfo);
    v30 = v31;
    if ((int)a2 < 1)
    {
      if (!v31) {
        goto LABEL_36;
      }
    }

    else
    {
      if (!v31) {
        goto LABEL_36;
      }
      v31->_pid = a2;
    }

    objc_setProperty_nonatomic_copy(v31, v32, v29, 16LL);
    objc_setProperty_nonatomic_copy(v30, v33, v23, 24LL);
    objc_setProperty_nonatomic_copy(v30, v34, v21, 32LL);
    objc_setProperty_nonatomic_copy(v30, v35, v22, 40LL);
    goto LABEL_36;
  }

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL), a2);
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
  if (!v5)
  {
    ne_log_obj();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = *(_DWORD *)(a1 + 72);
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 67109634;
      int v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      _os_log_debug_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEBUG,  "Could not look up appInfo for pid: %d bundle id: %@ uuid: %@",  buf,  0x1Cu);
    }

    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16LL);
    goto LABEL_8;
  }

  int v6 = -[NEAppInfoCache appInfo:mismatchedWithUUID:andBundleID:]( *(void *)(a1 + 32),  v5,  *(void **)(a1 + 40),  *(void **)(a1 + 48));
  -[NEAppInfoCache addAppInfoToCache:](*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL));
  if (!v6)
  {
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16LL);
LABEL_8:
    v12();
    goto LABEL_9;
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_3;
  v17[3] = &unk_18A08B0F8;
  v17[4] = v7;
  __int128 v16 = *(_OWORD *)(a1 + 56);
  id v10 = (id)v16;
  __int128 v18 = v16;
  -[NEAppInfoCache performCustomLookupIfNecessaryForPid:UUID:bundleID:completionHandler:](v7, 0LL, v8, v9, v17);

LABEL_9:
}

- (uint64_t)appInfo:(void *)a3 mismatchedWithUUID:(void *)a4 andBundleID:
{
  uint64_t v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (!v9) {
      goto LABEL_6;
    }
    id v10 = v7[3];
    id v11 = v9;
    -[NEAppInfoCache bundleIDWithoutTeamID:](v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAppInfoCache bundleIDWithoutTeamID:](v11);
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = [v12 isEqual:v13];

    if (!v14) {
LABEL_7:
    }
      a1 = 1LL;
    else {
LABEL_6:
    }
      a1 = 0LL;
  }

  return a1;
}

- (void)addAppInfoToCache:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3)
    {
      uint64_t v5 = (void *)v3[2];
      if (v5)
      {
        int v6 = v3;
        id v7 = v5;
        objc_msgSend(objc_getProperty(a1, v8, 16, 1), "objectForKeyedSubscript:", v7);
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          id v11 = v6;
          uint64_t v12 = v10;
          int v13 = v12;
          if (!v11[5] && v12[5])
          {
            id v14 = v12[2];
            uint64_t v15 = v14;
            if (v14) {
              BOOL v16 = v4[2] == 0LL;
            }
            else {
              BOOL v16 = 1;
            }
            if (!v16)
            {
              char v17 = objc_msgSend(v14, "isEqual:");

              if ((v17 & 1) != 0) {
                goto LABEL_15;
              }
              goto LABEL_14;
            }
          }
        }

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_3( uint64_t a1,  void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  if (v4) {
    -[NEAppInfoCache addAppInfoToCache:](*(void **)(a1 + 32), v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (id)bundleIDWithoutTeamID:(void *)a1
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  v2 = v1;
  if (!v1)
  {
    ne_log_obj();
    SEL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315138;
      id v11 = "-[NEAppInfoCache bundleIDWithoutTeamID:]";
      _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "%s called with null bundleID", (uint8_t *)&v10, 0xCu);
    }

    goto LABEL_10;
  }

  uint64_t v3 = [v1 rangeOfString:@"." options:1];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4 == 1)
    {
      uint64_t v7 = v3 + 1;
      if (v3 + 1 < (unint64_t)[v2 length])
      {
        uint64_t v5 = [v2 substringFromIndex:v7];
        goto LABEL_4;
      }
    }

    ne_log_obj();
    SEL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = (const char *)v2;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "found invalid . in bundle id: %@",  (uint8_t *)&v10,  0xCu);
    }

void __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {
    id Property = (dispatch_queue_s *)objc_getProperty(v5, v3, 24LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke_2;
  v9[3] = &unk_18A0908C8;
  id v7 = *(id *)(a1 + 40);
  id v10 = v4;
  id v11 = v7;
  id v8 = v4;
  dispatch_async(Property, v9);
}

uint64_t __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

@end