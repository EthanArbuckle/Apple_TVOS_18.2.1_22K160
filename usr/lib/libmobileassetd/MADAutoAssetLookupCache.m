@interface MADAutoAssetLookupCache
+ (id)_newBySelectorKey:(id)a3 forAssetAudience:(id)a4;
+ (id)_newBySetConfigurationKey:(id)a3 forAssetAudience:(id)a4;
+ (id)_setConfigurationAssetType:(id)a3;
+ (id)autoAssetLookupCache;
+ (id)cachedLookupResultForSelector:(id)a3 forStaging:(BOOL)a4;
+ (id)cachedLookupResultForSetConfiguration:(id)a3 forStaging:(BOOL)a4;
+ (void)clearLookupResultsForSetConfiguration:(id)a3;
+ (void)recordLookupResult:(id)a3 forSelector:(id)a4 forStaging:(BOOL)a5;
+ (void)recordLookupResult:(id)a3 forSetConfiguration:(id)a4 forStaging:(BOOL)a5;
- (MADAutoAssetLookupCache)init;
- (NSMutableDictionary)lookupResultsByAssetSelector;
- (NSMutableDictionary)lookupResultsByAssetSelectorForStaging;
- (NSMutableDictionary)lookupResultsBySetConfiguration;
- (NSMutableDictionary)lookupResultsBySetConfigurationForStaging;
- (OS_dispatch_queue)lookupCacheQueue;
- (void)setLookupResultsByAssetSelector:(id)a3;
- (void)setLookupResultsByAssetSelectorForStaging:(id)a3;
- (void)setLookupResultsBySetConfiguration:(id)a3;
- (void)setLookupResultsBySetConfigurationForStaging:(id)a3;
@end

@implementation MADAutoAssetLookupCache

- (MADAutoAssetLookupCache)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MADAutoAssetLookupCache;
  v2 = -[MADAutoAssetLookupCache init](&v17, "init");
  if (v2)
  {
    v3 = (const char *)[@"com.apple.MobileAsset.daemon.autoassetlookupcache" UTF8String];
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create(v3, v5);
    lookupCacheQueue = v2->_lookupCacheQueue;
    v2->_lookupCacheQueue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lookupResultsByAssetSelector = v2->_lookupResultsByAssetSelector;
    v2->_lookupResultsByAssetSelector = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lookupResultsByAssetSelectorForStaging = v2->_lookupResultsByAssetSelectorForStaging;
    v2->_lookupResultsByAssetSelectorForStaging = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lookupResultsBySetConfiguration = v2->_lookupResultsBySetConfiguration;
    v2->_lookupResultsBySetConfiguration = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lookupResultsBySetConfigurationForStaging = v2->_lookupResultsBySetConfigurationForStaging;
    v2->_lookupResultsBySetConfigurationForStaging = v14;
  }

  return v2;
}

+ (id)autoAssetLookupCache
{
  if (autoAssetLookupCache_dispatchOnceAutoAssetLookupCache != -1) {
    dispatch_once(&autoAssetLookupCache_dispatchOnceAutoAssetLookupCache, &__block_literal_global_12);
  }
  return (id)autoAssetLookupCache___autoAssetLookupCache;
}

void __47__MADAutoAssetLookupCache_autoAssetLookupCache__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MADAutoAssetLookupCache);
  v2 = (void *)autoAssetLookupCache___autoAssetLookupCache;
  autoAssetLookupCache___autoAssetLookupCache = (uint64_t)v1;
}

+ (void)recordLookupResult:(id)a3 forSelector:(id)a4 forStaging:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetLookupCache autoAssetLookupCache]( &OBJC_CLASS___MADAutoAssetLookupCache,  "autoAssetLookupCache"));
  id DownloadManager = getDownloadManager();
  v11 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
  uint64_t IsInternalAllowed = _MAPreferencesIsInternalAllowed();
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 assetType]);
  id v14 = [v11 newAssetAudience:IsInternalAllowed assetType:v13];

  id v15 = +[MADAutoAssetLookupCache _newBySelectorKey:forAssetAudience:]( &OBJC_CLASS___MADAutoAssetLookupCache,  "_newBySelectorKey:forAssetAudience:",  v8,  v14);
  int64_t v16 = +[MADAutoAssetControlManager preferenceLookupCacheAssetSelectorValidSecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceLookupCacheAssetSelectorValidSecs");
  objc_super v17 = @"CLIENT";
  if (v5) {
    objc_super v17 = @"STAGING";
  }
  v18 = v17;
  if (!v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
    *(_DWORD *)buf = 138543874;
    v35 = v18;
    __int16 v36 = 2114;
    v37 = v22;
    __int16 v38 = 2114;
    id v39 = v14;
    v23 = "{AUTO-LOOKUP-CACHE[%{public}@]:recordLookupResult:forSelector:} | unable to locate auto-asset-lookup-cache | s"
          "elector:%{public}@ | assetAudience:%{public}@";
LABEL_11:
    _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, v23, buf, 0x20u);
LABEL_14:

    goto LABEL_15;
  }

  if (!v15)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
    *(_DWORD *)buf = 138543874;
    v35 = v18;
    __int16 v36 = 2114;
    v37 = v22;
    __int16 v38 = 2114;
    id v39 = v14;
    v23 = "{AUTO-LOOKUP-CACHE[%{public}@]:recordLookupResult:forSelector:} | unable to determine by-asset-selector lookup"
          "-cache key | selector:%{public}@ | assetAudience:%{public}@";
    goto LABEL_11;
  }

  if (!v16)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
      *(_DWORD *)buf = 138543874;
      v35 = v18;
      __int16 v36 = 2114;
      v37 = v22;
      __int16 v38 = 2114;
      id v39 = v14;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[%{public}@]:recordLookupResult:forSelector:} | by-asset-selector lookup-cache disabled | sele ctor:%{public}@ | assetAudience:%{public}@",  buf,  0x20u);
      goto LABEL_14;
    }

void __69__MADAutoAssetLookupCache_recordLookupResult_forSelector_forStaging___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 80);
  v2 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 lookupResultsByAssetSelectorForStaging]);
  }
  else {
    uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 lookupResultsByAssetSelector]);
  }
  dispatch_queue_attr_t v4 = (void *)v3;
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  dispatch_queue_t v6 = -[MADAutoAssetLookupResult initWithAssetCatalog:forAssetSelector:forAssetAudience:]( objc_alloc(&OBJC_CLASS___MADAutoAssetLookupResult),  "initWithAssetCatalog:forAssetSelector:forAssetAudience:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) assetVersion]);

    if (!v7) {
      goto LABEL_35;
    }
    v45 = v6;
    v47 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    v46 = v4;
    id v8 = v4;
    v9 = &MobileAssetKeyManager__metaData.ivars;
    id v52 = [v8 countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (!v52) {
      goto LABEL_25;
    }
    uint64_t v10 = *(void *)v61;
    v11 = &MobileAssetKeyManager__metaData.ivars;
    id v51 = v8;
    uint64_t v49 = *(void *)v61;
    while (1)
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v61 != v10) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)v12);
        v55 = objc_autoreleasePoolPush();
        v53 = v13;
        id v14 = [v8 safeObjectForKey:v13 ofClass:objc_opt_class(p_ivars[253])];
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        if (!v15)
        {
          id v28 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_ivar_list sharedLogger](v9[175], "sharedLogger"));
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 oslog]);

          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = *(void *)(a1 + 64);
            *(_DWORD *)buf = 138543618;
            uint64_t v67 = v30;
            __int16 v68 = 2114;
            v69 = v53;
            _os_log_error_impl( &dword_0,  v29,  OS_LOG_TYPE_ERROR,  "{AUTO-LOOKUP-CACHE[%{public}@]:recordLookupResult:forSelector:} | unable to load cached entry | bySelector ConsiderKey:%{public}@",  buf,  0x16u);
          }

          goto LABEL_20;
        }

        int64_t v16 = v11[155];
        objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) assetType]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v15 assetSelector]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 assetType]);
        if ((-[__objc2_ivar_list stringIsEqual:to:](v16, "stringIsEqual:to:", v17, v19) & 1) == 0)
        {

          id v8 = v51;
LABEL_20:
          id v27 = v55;
          goto LABEL_21;
        }

        v20 = v11[155];
        v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) assetSpecifier]);
        v22 = (void *)objc_claimAutoreleasedReturnValue([v15 assetSelector]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 assetSpecifier]);
        v50 = v21;
        if (-[__objc2_ivar_list stringIsEqual:to:](v20, "stringIsEqual:to:", v21, v23))
        {
          v48 = v11[155];
          v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) assetVersion]);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v15 assetSelector]);
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 assetVersion]);
          LOBYTE(v48) = -[__objc2_ivar_list stringIsEqual:to:](v48, "stringIsEqual:to:", v24, v26);

          v9 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          id v8 = v51;
          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          uint64_t v10 = v49;
          v11 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          id v27 = v55;
        }

        else
        {

          id v8 = v51;
          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          uint64_t v10 = v49;
          id v27 = v55;
          v9 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
        }

+ (void)recordLookupResult:(id)a3 forSetConfiguration:(id)a4 forStaging:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetLookupCache autoAssetLookupCache]( &OBJC_CLASS___MADAutoAssetLookupCache,  "autoAssetLookupCache"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetLookupCache _setConfigurationAssetType:]( &OBJC_CLASS___MADAutoAssetLookupCache,  "_setConfigurationAssetType:",  v8));
  if (v10)
  {
    id DownloadManager = getDownloadManager();
    v12 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
    id v13 = [v12 newAssetAudience:_MAPreferencesIsInternalAllowed() assetType:v10];
  }

  else
  {
    id v13 = 0LL;
  }

  id v14 = +[MADAutoAssetLookupCache _newBySetConfigurationKey:forAssetAudience:]( &OBJC_CLASS___MADAutoAssetLookupCache,  "_newBySetConfigurationKey:forAssetAudience:",  v8,  v13);
  int64_t v15 = +[MADAutoAssetControlManager preferenceLookupCacheSetConfigurationValidSecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceLookupCacheSetConfigurationValidSecs");
  int64_t v16 = @"CLIENT";
  if (v5) {
    int64_t v16 = @"STAGING";
  }
  objc_super v17 = v16;
  if (!v9)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetLookupCache recordLookupResult:forSetConfiguration:forStaging:].cold.1((uint64_t)v17, v8, v20);
    }
    goto LABEL_25;
  }

  if (!v14)
  {
    if (v10)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

      if (v13)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
          *(_DWORD *)buf = 138544130;
          v37 = v17;
          __int16 v38 = 2114;
          uint64_t v39 = v22;
          __int16 v40 = 2114;
          id v41 = v10;
          __int16 v42 = 2114;
          id v43 = v13;
          _os_log_error_impl( &dword_0,  v20,  OS_LOG_TYPE_ERROR,  "{AUTO-LOOKUP-CACHE[%{public}@]:recordLookupResult:forSetConfiguration:} | unable to determine by-set-configu ration lookup-cache key | setConfiguration:%{public}@ | setAssetType:%{public}@ | assetAudience:%{public}@",  buf,  0x2Au);
LABEL_24:
        }
      }

      else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
        *(_DWORD *)buf = 138543874;
        v37 = v17;
        __int16 v38 = 2114;
        uint64_t v39 = v22;
        __int16 v40 = 2114;
        id v41 = v10;
        v24 = "{AUTO-LOOKUP-CACHE[%{public}@]:recordLookupResult:forSetConfiguration:} | unable to determine by-set-confi"
              "guration lookup-cache key (no asset-audience) | setConfiguration:%{public}@ | setAssetType:%{public}@";
        goto LABEL_22;
      }
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
        *(_DWORD *)buf = 138543618;
        v37 = v17;
        __int16 v38 = 2114;
        uint64_t v39 = v22;
        v24 = "{AUTO-LOOKUP-CACHE[%{public}@]:recordLookupResult:forSetConfiguration:} | unable to determine by-set-confi"
              "guration lookup-cache key (no asset-type from set-configuration) | setConfiguration:%{public}@";
        v26 = v20;
        uint32_t v27 = 22;
LABEL_23:
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v24, buf, v27);
        goto LABEL_24;
      }
    }

void __77__MADAutoAssetLookupCache_recordLookupResult_forSetConfiguration_forStaging___block_invoke( uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 lookupResultsBySetConfigurationForStaging]);
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 lookupResultsBySetConfiguration]);
  }
  BOOL v5 = (void *)v4;
  dispatch_queue_t v6 = -[MADAutoAssetLookupResult initWithAssetCatalog:forSetConfiguration:forAssetAudience:]( objc_alloc(&OBJC_CLASS___MADAutoAssetLookupResult),  "initWithAssetCatalog:forSetConfiguration:forAssetAudience:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56));
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
    uint64_t v14 = *(void *)(a1 + 56);
    int v15 = 138543874;
    uint64_t v16 = v13;
    __int16 v17 = 2114;
    v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v14;
    _os_log_error_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "{AUTO-LOOKUP-CACHE[%{public}@]:recordLookupResult:forSetConfiguration:} | unable to create lookup-result | setConf iguration:%{public}@ | assetAudience:%{public}@",  (uint8_t *)&v15,  0x20u);
    goto LABEL_7;
  }

  [v5 setSafeObject:v6 forKey:*(void *)(a1 + 72)];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) summary]);
    uint64_t v11 = *(void *)(a1 + 56);
    int v15 = 138543874;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    v18 = v10;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[%{public}@]:recordLookupResult:forSetConfiguration:} | updated auto-asset-lookup-cache | set-co nfiguration:%{public}@ | assetAudience:%{public}@",  (uint8_t *)&v15,  0x20u);
LABEL_7:
  }

+ (void)clearLookupResultsForSetConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetLookupCache autoAssetLookupCache]( &OBJC_CLASS___MADAutoAssetLookupCache,  "autoAssetLookupCache"));
  BOOL v5 = v4;
  if (v4)
  {
    dispatch_queue_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 lookupCacheQueue]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __65__MADAutoAssetLookupCache_clearLookupResultsForSetConfiguration___block_invoke;
    v9[3] = &unk_34DB98;
    id v10 = v5;
    id v11 = v3;
    dispatch_sync(v6, v9);
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MADAutoAssetLookupCache clearLookupResultsForSetConfiguration:].cold.1(v3, v8);
    }
  }
}

void __65__MADAutoAssetLookupCache_clearLookupResultsForSetConfiguration___block_invoke(uint64_t a1)
{
  id v31 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v33 = a1;
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lookupResultsBySetConfiguration]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 oslog]);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) summary]);
    *(_DWORD *)buf = 138543362;
    v46 = v5;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[CLIENT]:clearLookupResultsForSetConfiguration} | clearing auto-asset-lookup-cache | set-configu ration:%{public}@",  buf,  0xCu);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v6 = v2;
  uint64_t v7 = v33;
  id v34 = v6;
  id v36 = [v6 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v42;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    do
    {
      for (i = 0LL; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)i);
        id v11 = [v6 safeObjectForKey:v10 ofClass:objc_opt_class(MADAutoAssetLookupResult)];
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        uint64_t v13 = v12;
        if (v10)
        {
          uint64_t v14 = p_ivars[155];
          int v15 = (void *)objc_claimAutoreleasedReturnValue([v12 setConfiguration]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 clientDomainName]);
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v7 + 40) clientDomainName]);
          if ((-[__objc2_ivar_list stringIsEqual:to:](v14, "stringIsEqual:to:", v16, v17) & 1) != 0)
          {
            v18 = p_ivars[155];
            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v13 setConfiguration]);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetSetIdentifier]);
            v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v7 + 40) assetSetIdentifier]);
            unsigned int v32 = -[__objc2_ivar_list stringIsEqual:to:](v18, "stringIsEqual:to:", v20, v21);

            uint64_t v7 = v33;
            id v6 = v34;

            p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
            if (v32) {
              -[NSMutableArray addObject:](v31, "addObject:", v10);
            }
          }

          else
          {
          }
        }
      }

      id v36 = [v6 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }

    while (v36);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v22 = v31;
  id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v37,  v49,  16LL);
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      for (j = 0LL; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        uint32_t v27 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)j);
        if (v27)
        {
          [v6 removeObjectForKey:*(void *)(*((void *)&v37 + 1) + 8 * (void)j)];
          id v28 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 oslog]);

          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v33 + 40) summary]);
            *(_DWORD *)buf = 138543618;
            v46 = v27;
            __int16 v47 = 2114;
            v48 = v30;
            _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[CLIENT]:clearLookupResultsForSetConfiguration} | removed stale auto-asset-lookup-cache entry | lookupCacheKey:%{public}@ | set-configuration:%{public}@",  buf,  0x16u);
          }

          id v6 = v34;
        }
      }

      id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v37,  v49,  16LL);
    }

    while (v24);
  }
}

+ (id)cachedLookupResultForSelector:(id)a3 forStaging:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetLookupCache autoAssetLookupCache]( &OBJC_CLASS___MADAutoAssetLookupCache,  "autoAssetLookupCache"));
  id DownloadManager = getDownloadManager();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
  uint64_t IsInternalAllowed = _MAPreferencesIsInternalAllowed();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
  id v11 = [v8 newAssetAudience:IsInternalAllowed assetType:v10];

  id v12 = +[MADAutoAssetLookupCache _newBySelectorKey:forAssetAudience:]( &OBJC_CLASS___MADAutoAssetLookupCache,  "_newBySelectorKey:forAssetAudience:",  v5,  v11);
  uint64_t v13 = @"CLIENT";
  if (v4) {
    uint64_t v13 = @"STAGING";
  }
  uint64_t v14 = v13;
  uint64_t v40 = 0LL;
  __int128 v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  int64_t v43 = +[MADAutoAssetControlManager preferenceLookupCacheAssetSelectorValidSecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceLookupCacheAssetSelectorValidSecs");
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  __int128 v37 = __Block_byref_object_copy__9;
  __int128 v38 = __Block_byref_object_dispose__9;
  id v39 = 0LL;
  if (v6)
  {
    if (v12)
    {
      if (v41[3])
      {
        int v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 lookupCacheQueue]);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472LL;
        v25[2] = __68__MADAutoAssetLookupCache_cachedLookupResultForSelector_forStaging___block_invoke;
        v25[3] = &unk_34E8E8;
        BOOL v33 = v4;
        v26 = v6;
        id v27 = v12;
        id v28 = v14;
        id v29 = v5;
        id v30 = v11;
        id v31 = &v40;
        unsigned int v32 = &v34;
        dispatch_sync(v15, v25);

        uint64_t v16 = v26;
      }

      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
          *(_DWORD *)buf = 138543874;
          v45 = v14;
          __int16 v46 = 2114;
          __int16 v47 = v22;
          __int16 v48 = 2114;
          id v49 = v11;
          _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSelector} | by-asset-selector lookup-cache disabled | se lector:%{public}@ | assetAudience:%{public}@",  buf,  0x20u);
        }
      }
    }

    else
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
        *(_DWORD *)buf = 138543874;
        v45 = v14;
        __int16 v46 = 2114;
        __int16 v47 = v20;
        __int16 v48 = 2114;
        id v49 = v11;
        _os_log_error_impl( &dword_0,  v16,  OS_LOG_TYPE_ERROR,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSelector} | unable to determine by-asset-selector lookup-c ache key | selector:%{public}@ | assetAudience:%{public}@",  buf,  0x20u);
      }
    }
  }

  else
  {
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
      *(_DWORD *)buf = 138543874;
      v45 = v14;
      __int16 v46 = 2114;
      __int16 v47 = v18;
      __int16 v48 = 2114;
      id v49 = v11;
      _os_log_error_impl( &dword_0,  v16,  OS_LOG_TYPE_ERROR,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSelector} | unable to locate auto-asset-lookup-cache | selec tor:%{public}@ | assetAudience:%{public}@",  buf,  0x20u);
    }
  }

  id v23 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v23;
}

void __68__MADAutoAssetLookupCache_cachedLookupResultForSelector_forStaging___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 88);
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lookupResultsByAssetSelectorForStaging]);
  }
  else {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lookupResultsByAssetSelector]);
  }
  id v5 = v4;
  id v6 = [v4 safeObjectForKey:*(void *)(a1 + 40) ofClass:objc_opt_class(MADAutoAssetLookupResult)];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___NSDate);
    if (v8
      && (uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 recordedTimestamp]), v9, v9))
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 recordedTimestamp]);
      -[NSDate timeIntervalSinceDate:](v8, "timeIntervalSinceDate:", v10);
      double v12 = v11;

      if (v12 >= 0.0)
      {
        uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8LL);
        uint64_t v20 = *(void *)(v19 + 24);
        if (v20 < 0)
        {
          *(void *)(v19 + 24) = 1800LL;
          uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
        }

        if (v20 >= (uint64_t)v12)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 oslog]);

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
            uint64_t v29 = *(void *)(a1 + 48);
            id v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) summary]);
            uint64_t v31 = *(void *)(a1 + 64);
            int v34 = 138544386;
            uint64_t v35 = v29;
            __int16 v36 = 2048;
            uint64_t v37 = (uint64_t)v12;
            __int16 v38 = 2048;
            uint64_t v39 = v28;
            __int16 v40 = 2114;
            __int128 v41 = v30;
            __int16 v42 = 2114;
            uint64_t v43 = v31;
            _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSelector} | cached secs(%ld) <= max-valid secs(%ld) | using entry | selector:%{public}@ | assetAudience:%{public}@",  (uint8_t *)&v34,  0x34u);
          }

          uint64_t v32 = objc_claimAutoreleasedReturnValue([v7 autoAssetCatalog]);
          uint64_t v33 = *(void *)(*(void *)(a1 + 80) + 8LL);
          uint64_t v14 = *(os_log_s **)(v33 + 40);
          *(void *)(v33 + 40) = v32;
        }

        else
        {
          [v5 removeObjectForKey:*(void *)(a1 + 40)];
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
            uint64_t v23 = *(void *)(a1 + 48);
            id v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) summary]);
            uint64_t v25 = *(void *)(a1 + 64);
            int v34 = 138544386;
            uint64_t v35 = v23;
            __int16 v36 = 2048;
            uint64_t v37 = (uint64_t)v12;
            __int16 v38 = 2048;
            uint64_t v39 = v22;
            __int16 v40 = 2114;
            __int128 v41 = v24;
            __int16 v42 = 2114;
            uint64_t v43 = v25;
            _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSelector} | cached secs(%ld) > max-valid secs(%ld) | r emoved entry | selector:%{public}@ | assetAudience:%{public}@",  (uint8_t *)&v34,  0x34u);
          }
        }
      }

      else
      {
        [v5 removeObjectForKey:*(void *)(a1 + 40)];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __68__MADAutoAssetLookupCache_cachedLookupResultForSelector_forStaging___block_invoke_cold_2(a1);
        }
      }
    }

    else
    {
      [v5 removeObjectForKey:*(void *)(a1 + 40)];
      int v15 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __68__MADAutoAssetLookupCache_cachedLookupResultForSelector_forStaging___block_invoke_cold_1(a1);
      }
    }

    goto LABEL_22;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  id v8 = (NSDate *)objc_claimAutoreleasedReturnValue([v16 oslog]);

  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) summary]);
    uint64_t v18 = *(void *)(a1 + 64);
    int v34 = 138543874;
    uint64_t v35 = v17;
    __int16 v36 = 2114;
    uint64_t v37 = (uint64_t)v14;
    __int16 v38 = 2114;
    uint64_t v39 = v18;
    _os_log_impl( &dword_0,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSelector} | no cached entry | selector:%{public}@ | assetAudience:%{public}@",  (uint8_t *)&v34,  0x20u);
LABEL_22:
  }
}

+ (id)cachedLookupResultForSetConfiguration:(id)a3 forStaging:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetLookupCache autoAssetLookupCache]( &OBJC_CLASS___MADAutoAssetLookupCache,  "autoAssetLookupCache"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetLookupCache _setConfigurationAssetType:]( &OBJC_CLASS___MADAutoAssetLookupCache,  "_setConfigurationAssetType:",  v5));
  if (v7)
  {
    id DownloadManager = getDownloadManager();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
    id v10 = [v9 newAssetAudience:_MAPreferencesIsInternalAllowed() assetType:v7];
  }

  else
  {
    id v10 = 0LL;
  }

  id v11 = +[MADAutoAssetLookupCache _newBySetConfigurationKey:forAssetAudience:]( &OBJC_CLASS___MADAutoAssetLookupCache,  "_newBySetConfigurationKey:forAssetAudience:",  v5,  v10);
  double v12 = @"CLIENT";
  if (v4) {
    double v12 = @"STAGING";
  }
  uint64_t v13 = v12;
  uint64_t v43 = 0LL;
  __int128 v44 = &v43;
  uint64_t v45 = 0x2020000000LL;
  int64_t v46 = +[MADAutoAssetControlManager preferenceLookupCacheSetConfigurationValidSecs]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceLookupCacheSetConfigurationValidSecs");
  uint64_t v37 = 0LL;
  __int16 v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  __int16 v40 = __Block_byref_object_copy__9;
  __int128 v41 = __Block_byref_object_dispose__9;
  id v42 = 0LL;
  if (v6)
  {
    if (v11)
    {
      if (v44[3])
      {
        uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 lookupCacheQueue]);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = __76__MADAutoAssetLookupCache_cachedLookupResultForSetConfiguration_forStaging___block_invoke;
        v28[3] = &unk_34E8E8;
        BOOL v36 = v4;
        uint64_t v29 = v6;
        id v30 = v11;
        uint64_t v31 = v13;
        id v32 = v5;
        id v33 = v10;
        int v34 = &v43;
        uint64_t v35 = &v37;
        dispatch_sync(v14, v28);

        int v15 = v29;
      }

      else
      {
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
          *(_DWORD *)buf = 138543874;
          __int16 v48 = v13;
          __int16 v49 = 2114;
          v50 = v21;
          __int16 v51 = 2114;
          id v52 = v10;
          _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSetConfiguration} | by-set-configuration lookup-cache di sabled | set-configuration:%{public}@ | assetAudience:%{public}@",  buf,  0x20u);
        }
      }
    }

    else if (v7)
    {
      if (v10)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
          *(_DWORD *)buf = 138544130;
          __int16 v48 = v13;
          __int16 v49 = 2114;
          v50 = v19;
          __int16 v51 = 2114;
          id v52 = v7;
          __int16 v53 = 2114;
          id v54 = v10;
          _os_log_error_impl( &dword_0,  v15,  OS_LOG_TYPE_ERROR,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSetConfiguration} | unable to determine by-set-configura tion lookup-cache key | setConfiguration:%{public}@ | setAssetType:%{public}@ | assetAudience:%{public}@",  buf,  0x2Au);
        }
      }

      else
      {
        id v24 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
          *(_DWORD *)buf = 138543874;
          __int16 v48 = v13;
          __int16 v49 = 2114;
          v50 = v25;
          __int16 v51 = 2114;
          id v52 = v7;
          _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSetConfiguration} | unable to determine by-set-configura tion lookup-cache key (no asset-audience) | setConfiguration:%{public}@ | setAssetType:%{public}@",  buf,  0x20u);
        }
      }
    }

    else
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
        *(_DWORD *)buf = 138543618;
        __int16 v48 = v13;
        __int16 v49 = 2114;
        v50 = v23;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSetConfiguration} | unable to determine by-set-configurati on lookup-cache key (no asset-type from set-configuration) | setConfiguration:%{public}@",  buf,  0x16u);
      }
    }
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
      +[MADAutoAssetLookupCache cachedLookupResultForSetConfiguration:forStaging:].cold.1( (uint64_t)v13,  v17,  (uint64_t)buf,  v15);
    }
  }

  id v26 = (id)v38[5];
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  return v26;
}

void __76__MADAutoAssetLookupCache_cachedLookupResultForSetConfiguration_forStaging___block_invoke( uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 88);
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lookupResultsBySetConfigurationForStaging]);
  }
  else {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lookupResultsBySetConfiguration]);
  }
  id v5 = v4;
  id v6 = [v4 safeObjectForKey:*(void *)(a1 + 40) ofClass:objc_opt_class(MADAutoAssetLookupResult)];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (!v7)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) summary]);
    uint64_t v21 = *(void *)(a1 + 64);
    int v42 = 138543874;
    uint64_t v43 = v19;
    __int16 v44 = 2114;
    uint64_t v45 = (uint64_t)v20;
    __int16 v46 = 2114;
    uint64_t v47 = v21;
    uint64_t v22 = "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSetConfiguration} | no cached entry | set-configuration:%{"
          "public}@ | assetAudience:%{public}@";
LABEL_15:
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v42, 0x20u);

    goto LABEL_19;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 setConfiguration]);
  unsigned int v10 = [v9 isEqual:*(void *)(a1 + 56)];

  if (!v10)
  {
    [v5 removeObjectForKey:*(void *)(a1 + 40)];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    uint64_t v24 = *(void *)(a1 + 48);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) summary]);
    uint64_t v25 = *(void *)(a1 + 64);
    int v42 = 138543874;
    uint64_t v43 = v24;
    __int16 v44 = 2114;
    uint64_t v45 = (uint64_t)v20;
    __int16 v46 = 2114;
    uint64_t v47 = v25;
    uint64_t v22 = "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSetConfiguration} | cached entry config mismatch | removed"
          " entry | set-configuration:%{public}@ | assetAudience:%{public}@";
    goto LABEL_15;
  }

  id v11 = objc_alloc_init(&OBJC_CLASS___NSDate);
  if (v11
    && (double v12 = (void *)objc_claimAutoreleasedReturnValue([v8 recordedTimestamp]), v12, v12))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 recordedTimestamp]);
    -[os_log_s timeIntervalSinceDate:](v11, "timeIntervalSinceDate:", v13);
    double v15 = v14;

    if (v15 >= 0.0)
    {
      uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8LL);
      uint64_t v28 = *(void *)(v27 + 24);
      if (v28 < 0)
      {
        *(void *)(v27 + 24) = 1800LL;
        uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
      }

      if (v28 >= (uint64_t)v15)
      {
        int v34 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 oslog]);

        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
          uint64_t v37 = *(void *)(a1 + 48);
          __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) summary]);
          uint64_t v39 = *(void *)(a1 + 64);
          int v42 = 138544386;
          uint64_t v43 = v37;
          __int16 v44 = 2048;
          uint64_t v45 = (uint64_t)v15;
          __int16 v46 = 2048;
          uint64_t v47 = v36;
          __int16 v48 = 2114;
          __int16 v49 = v38;
          __int16 v50 = 2114;
          uint64_t v51 = v39;
          _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSetConfiguration} | cached secs(%ld) <= max-valid secs(% ld) | using entry | set-configuration:%{public}@ | assetAudience:%{public}@",  (uint8_t *)&v42,  0x34u);
        }

        uint64_t v40 = objc_claimAutoreleasedReturnValue([v8 autoAssetCatalog]);
        uint64_t v41 = *(void *)(*(void *)(a1 + 80) + 8LL);
        uint64_t v17 = *(os_log_s **)(v41 + 40);
        *(void *)(v41 + 40) = v40;
      }

      else
      {
        [v5 removeObjectForKey:*(void *)(a1 + 40)];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v29 oslog]);

        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
          uint64_t v31 = *(void *)(a1 + 48);
          id v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) summary]);
          uint64_t v33 = *(void *)(a1 + 64);
          int v42 = 138544386;
          uint64_t v43 = v31;
          __int16 v44 = 2048;
          uint64_t v45 = (uint64_t)v15;
          __int16 v46 = 2048;
          uint64_t v47 = v30;
          __int16 v48 = 2114;
          __int16 v49 = v32;
          __int16 v50 = 2114;
          uint64_t v51 = v33;
          _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSetConfiguration} | cached secs(%ld) > max-valid secs(%l d) | removed entry | set-configuration:%{public}@ | assetAudience:%{public}@",  (uint8_t *)&v42,  0x34u);
        }
      }
    }

    else
    {
      [v5 removeObjectForKey:*(void *)(a1 + 40)];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __76__MADAutoAssetLookupCache_cachedLookupResultForSetConfiguration_forStaging___block_invoke_cold_2( a1,  (id *)(a1 + 56));
      }
    }
  }

  else
  {
    [v5 removeObjectForKey:*(void *)(a1 + 40)];
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 oslog]);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __76__MADAutoAssetLookupCache_cachedLookupResultForSetConfiguration_forStaging___block_invoke_cold_1( a1,  (id *)(a1 + 56));
    }
  }

LABEL_19:
}

+ (id)_newBySelectorKey:(id)a3 forAssetAudience:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a3 persistedEntryID]);
  uint64_t v7 = (void *)v6;
  id v8 = 0LL;
  if (v5 && v6) {
    id v8 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@_%@", v6, v5);
  }

  return v8;
}

+ (id)_setConfigurationAssetType:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 autoAssetEntries]);
  id v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 autoAssetEntries]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:0]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSelector]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assetType]);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

+ (id)_newBySetConfigurationKey:(id)a3 forAssetAudience:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a3 persistedEntryID]);
  uint64_t v7 = (void *)v6;
  id v8 = 0LL;
  if (v5 && v6) {
    id v8 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@_%@", v6, v5);
  }

  return v8;
}

- (OS_dispatch_queue)lookupCacheQueue
{
  return self->_lookupCacheQueue;
}

- (NSMutableDictionary)lookupResultsByAssetSelector
{
  return self->_lookupResultsByAssetSelector;
}

- (void)setLookupResultsByAssetSelector:(id)a3
{
}

- (NSMutableDictionary)lookupResultsByAssetSelectorForStaging
{
  return self->_lookupResultsByAssetSelectorForStaging;
}

- (void)setLookupResultsByAssetSelectorForStaging:(id)a3
{
}

- (NSMutableDictionary)lookupResultsBySetConfiguration
{
  return self->_lookupResultsBySetConfiguration;
}

- (void)setLookupResultsBySetConfiguration:(id)a3
{
}

- (NSMutableDictionary)lookupResultsBySetConfigurationForStaging
{
  return self->_lookupResultsBySetConfigurationForStaging;
}

- (void)setLookupResultsBySetConfigurationForStaging:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

+ (void)recordLookupResult:(uint64_t)a1 forSetConfiguration:(void *)a2 forStaging:(os_log_s *)a3 .cold.1( uint64_t a1,  void *a2,  os_log_s *a3)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a2 summary]);
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  unsigned int v10 = v5;
  OUTLINED_FUNCTION_3_1( &dword_0,  a3,  v6,  "{AUTO-LOOKUP-CACHE[%{public}@]:recordLookupResult:forSetConfiguration:} | unable to locate auto-asset-lookup-cache | set-configuration:%{public}@",  (uint8_t *)&v7);
}

+ (void)clearLookupResultsForSetConfiguration:(void *)a1 .cold.1(void *a1, os_log_s *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "{AUTO-LOOKUP-CACHE[CLIENT]:clearLookupResultsForSetConfiguration} | unable to locate auto-asset-lookup-cache | set-c onfiguration:%{public}@",  (uint8_t *)&v4,  0xCu);
}

void __68__MADAutoAssetLookupCache_cachedLookupResultForSelector_forStaging___block_invoke_cold_1( uint64_t a1)
{
  OUTLINED_FUNCTION_7();
}

void __68__MADAutoAssetLookupCache_cachedLookupResultForSelector_forStaging___block_invoke_cold_2( uint64_t a1)
{
  OUTLINED_FUNCTION_7();
}

+ (void)cachedLookupResultForSetConfiguration:(uint64_t)a3 forStaging:(os_log_s *)a4 .cold.1( uint64_t a1,  void *a2,  uint64_t a3,  os_log_s *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3_1( &dword_0,  a4,  a3,  "{AUTO-LOOKUP-CACHE[%{public}@]:cachedLookupResultForSetConfiguration} | unable to locate auto-asset-lookup-cache | s et-configuration:%{public}@",  (uint8_t *)a3);
}

void __76__MADAutoAssetLookupCache_cachedLookupResultForSetConfiguration_forStaging___block_invoke_cold_1( uint64_t a1,  id *a2)
{
  OUTLINED_FUNCTION_7();
}

void __76__MADAutoAssetLookupCache_cachedLookupResultForSetConfiguration_forStaging___block_invoke_cold_2( uint64_t a1,  id *a2)
{
  OUTLINED_FUNCTION_7();
}

@end