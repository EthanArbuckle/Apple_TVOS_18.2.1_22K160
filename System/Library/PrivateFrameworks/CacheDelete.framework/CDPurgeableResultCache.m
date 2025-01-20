@interface CDPurgeableResultCache
+ (id)fetchVolumeWithPath:(id)a3;
+ (id)sharedPurgeableResultsCache;
- (BOOL)hasInvalids;
- (BOOL)hasSnapshotForVolume:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isInvalidForVolume:(id)a3;
- (BOOL)isStale;
- (BOOL)isStaleForVolume:(id)a3;
- (CDRecentInfo)recentPurgeableResults;
- (OS_dispatch_queue)queue;
- (id)_recentPurgeableTotals:(int)a3 validateResults:(BOOL)a4;
- (id)bsdDiskForVolume:(id)a3;
- (id)dictionaryByMerging:(id)a3 with:(id)a4;
- (id)initEmpty;
- (id)recentInfoForVolume:(id)a3 atUrgency:(int)a4;
- (id)recentInfoForVolume:(id)a3 atUrgency:(int)a4 validateResults:(BOOL)a5;
- (id)recentInfoForVolumes:(id)a3 atUrgency:(int)a4;
- (id)recentInfoForVolumes:(id)a3 atUrgency:(int)a4 validateResults:(BOOL)a5 targetVolume:(id)a6;
- (id)recentPurgeableTotals:(int)a3;
- (id)servicesForVolume:(id)a3;
- (id)thresholdsForVolume:(id)a3;
- (int64_t)recentStateForVolume:(id)a3;
- (void)absorbRecentInfo:(id)a3;
- (void)invalidateAllForgettingPushers:(BOOL)a3;
- (void)log;
- (void)setQueue:(id)a3;
- (void)setRecentPurgeableResults:(id)a3;
- (void)updateRecentVolumeInfo:(id)a3;
@end

@implementation CDPurgeableResultCache

- (id)initEmpty
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CDPurgeableResultCache;
  v2 = -[CDPurgeableResultCache init](&v9, sel_init);
  if (v2)
  {
    v3 = +[CDRecentInfo recentInfoForVolumes:](&OBJC_CLASS___CDRecentInfo, "recentInfoForVolumes:", MEMORY[0x189604A60]);
    -[CDPurgeableResultCache setRecentPurgeableResults:](v2, "setRecentPurgeableResults:", v3);

    v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);
    -[CDPurgeableResultCache setQueue:](v2, "setQueue:", v6);

    v7 = v2;
  }

  return v2;
}

+ (id)sharedPurgeableResultsCache
{
  if (qword_18C4C41D0 != -1) {
    dispatch_once(&qword_18C4C41D0, &__block_literal_global_3);
  }
  return (id)_MergedGlobals_3;
}

void __53__CDPurgeableResultCache_sharedPurgeableResultsCache__block_invoke()
{
  id v0 = -[CDPurgeableResultCache initEmpty](objc_alloc(&OBJC_CLASS___CDPurgeableResultCache), "initEmpty");
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;
}

+ (id)fetchVolumeWithPath:(id)a3
{
  return +[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", a3);
}

- (id)_recentPurgeableTotals:(int)a3 validateResults:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v60 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3) {
    int v8 = a3;
  }
  else {
    int v8 = 3;
  }
  int v41 = v8;
  if (!-[CDPurgeableResultCache isStale](self, "isStale"))
  {
    v44 = v7;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    getLocalVolumes();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
    if (!v10) {
      goto LABEL_34;
    }
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v46;
    *(void *)&__int128 v11 = 67109378LL;
    __int128 v39 = v11;
    uint64_t v40 = *(void *)v46;
    while (1)
    {
      uint64_t v14 = 0LL;
      uint64_t v42 = v12;
      do
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v45 + 1) + 8 * v14);
        [(id)objc_opt_class() fetchVolumeWithPath:v15];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 mountPoint];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v18 = -[CDPurgeableResultCache isInvalidForVolume:](self, "isInvalidForVolume:", v17);

        if (v18)
        {
          CDGetLogHandle((uint64_t)"client");
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v50 = v15;
            _os_log_debug_impl( &dword_1874E4000,  v19,  OS_LOG_TYPE_DEBUG,  "_recentPurgeableTotals - Ignoring invalid volume: %@",  buf,  0xCu);
          }

          goto LABEL_32;
        }

        uint64_t v20 = v41;
        if (v41 < 1) {
          goto LABEL_28;
        }
        while (1)
        {
          v21 = -[CDPurgeableResultCache recentInfoForVolume:atUrgency:validateResults:]( self,  "recentInfoForVolume:atUrgency:validateResults:",  v16,  v20,  v4,  v39);
          v22 = v21;
          if (v21) {
            break;
          }
LABEL_19:

          BOOL v27 = __OFSUB__((_DWORD)v20, 1);
          uint64_t v20 = (v20 - 1);
        }

        [v21 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        evaluateNumberProperty(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        [v22 objectForKeyedSubscript:@"CACHE_DELETE_SHARED_PURGEABLE"];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        evaluateNumberProperty(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {

          goto LABEL_19;
        }

        if (v26)
        {
          v57[0] = @"CACHE_DELETE_SHARED_PURGEABLE";
          v57[1] = @"CACHE_DELETE_AMOUNT";
          v58[0] = v26;
          v58[1] = v24;
          v28 = (void *)MEMORY[0x189603F68];
          v29 = (void **)v58;
          v30 = (const __CFString **)v57;
          uint64_t v31 = 2LL;
        }

        else
        {
          v55 = @"CACHE_DELETE_AMOUNT";
          v56 = v24;
          v28 = (void *)MEMORY[0x189603F68];
          v29 = &v56;
          v30 = &v55;
          uint64_t v31 = 1LL;
        }

        [v28 dictionaryWithObjects:v29 forKeys:v30 count:v31];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v44 setObject:v32 forKeyedSubscript:v15];

        CDGetLogHandle((uint64_t)"client");
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = [v44 objectForKeyedSubscript:v15];
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v50 = 108;
          *(_WORD *)&v50[4] = 2112;
          *(void *)&v50[6] = v15;
          __int16 v51 = 1024;
          int v52 = v20;
          __int16 v53 = 2112;
          uint64_t v54 = v34;
          v35 = (void *)v34;
          _os_log_impl( &dword_1874E4000,  v33,  OS_LOG_TYPE_DEFAULT,  "%d CDPurgeableResultCache _recentPurgeableTotals volume: %@, urgency: %d, result: %@",  buf,  0x22u);
        }

LABEL_28:
        objc_msgSend(v44, "objectForKeyedSubscript:", v15, v39);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v12 = v42;
        uint64_t v13 = v40;
        if (!v36)
        {
          CDGetLogHandle((uint64_t)"client");
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v39;
            *(_DWORD *)v50 = 114;
            *(_WORD *)&v50[4] = 2112;
            *(void *)&v50[6] = v15;
            _os_log_error_impl( &dword_1874E4000,  v37,  OS_LOG_TYPE_ERROR,  "%d CDPurgeableResultCache _recentPurgeableTotals no result for %@, setting to zero",  buf,  0x12u);
          }

          [v44 setObject:&unk_18A06C4F8 forKeyedSubscript:v15];
        }

- (id)recentPurgeableTotals:(int)a3
{
  return -[CDPurgeableResultCache _recentPurgeableTotals:validateResults:]( self,  "_recentPurgeableTotals:validateResults:",  *(void *)&a3,  1LL);
}

- (id)recentInfoForVolume:(id)a3 atUrgency:(int)a4
{
  return -[CDPurgeableResultCache recentInfoForVolume:atUrgency:validateResults:]( self,  "recentInfoForVolume:atUrgency:validateResults:",  a3,  *(void *)&a4,  1LL);
}

- (id)recentInfoForVolume:(id)a3 atUrgency:(int)a4 validateResults:(BOOL)a5
{
  id v8 = a3;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0LL;
  -[CDPurgeableResultCache queue](self, "queue");
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __72__CDPurgeableResultCache_recentInfoForVolume_atUrgency_validateResults___block_invoke;
  v13[3] = &unk_18A0660D8;
  id v14 = v8;
  uint64_t v15 = &v18;
  v13[4] = self;
  int v16 = a4;
  BOOL v17 = a5;
  id v10 = v8;
  dispatch_sync(v9, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __72__CDPurgeableResultCache_recentInfoForVolume_atUrgency_validateResults___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 _recentInfoForVolume:*(void *)(a1 + 40) atUrgency:*(unsigned int *)(a1 + 56) validateResults:*(unsigned __int8 *)(a1 + 60)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)dictionaryByMerging:(id)a3 with:(id)a4
{
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x189603FC8];
  id v8 = a4;
  id v9 = (void *)[[v7 alloc] initWithDictionary:v6];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __51__CDPurgeableResultCache_dictionaryByMerging_with___block_invoke;
  v14[3] = &unk_18A066100;
  id v10 = v9;
  id v15 = v10;
  id v16 = v6;
  BOOL v17 = self;
  id v11 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];

  id v12 = v10;
  return v12;
}

void __51__CDPurgeableResultCache_dictionaryByMerging_with___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (![v5 isEqual:@"CACHE_DELETE_NAME_MAP"])
  {
    [a1[5] objectForKey:v5];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [a1[5] objectForKey:v5];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          CDGetLogHandle((uint64_t)"client");
          id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            [a1[5] objectForKey:v5];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v21 = 138412802;
            *(void *)&v21[4] = v6;
            *(_WORD *)&v21[12] = 2112;
            *(void *)&v21[14] = v20;
            *(_WORD *)&v21[22] = 2112;
            id v22 = v5;
            _os_log_debug_impl(&dword_1874E4000, v9, OS_LOG_TYPE_DEBUG, "invoking again %@ and %@ %@", v21, 0x20u);
          }

          [a1[6] dictionaryByMerging:v8 with:v6];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v10 count]) {
            id v11 = v10;
          }
          else {
            id v11 = v8;
          }
          id v12 = a1[4];
          goto LABEL_26;
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          CDGetLogHandle((uint64_t)"client");
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v21 = 138412802;
            *(void *)&v21[4] = v6;
            *(_WORD *)&v21[12] = 2112;
            *(void *)&v21[14] = v8;
            *(_WORD *)&v21[22] = 2112;
            id v22 = v5;
            _os_log_debug_impl(&dword_1874E4000, v13, OS_LOG_TYPE_DEBUG, "adding %@ and %@ %@", v21, 0x20u);
          }

          evaluateNumberProperty(v6);
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = [v14 unsignedLongLongValue];
          evaluateNumberProperty(v8);
          id v16 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = [v16 unsignedLongLongValue] + v15;

          id v18 = a1[4];
          [MEMORY[0x189607968] numberWithUnsignedLongLong:v17];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          id v12 = v18;
          goto LABEL_25;
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v10 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v8];
        [v10 setObject:v6 forKey:v5];
        CDGetLogHandle((uint64_t)"client");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
        {
LABEL_24:

          id v12 = a1[4];
LABEL_25:
          id v11 = v10;
LABEL_26:
          objc_msgSend(v12, "setObject:forKey:", v11, v5, *(_OWORD *)v21, *(void *)&v21[16]);

LABEL_27:
          goto LABEL_28;
        }
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_27;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_27;
        }
        id v10 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v6];
        [v10 setObject:v8 forKey:v5];
        CDGetLogHandle((uint64_t)"client");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_24;
        }
      }

      *(_DWORD *)v21 = 138412546;
      *(void *)&v21[4] = v10;
      *(_WORD *)&v21[12] = 2112;
      *(void *)&v21[14] = v5;
      _os_log_debug_impl(&dword_1874E4000, (os_log_t)v19, OS_LOG_TYPE_DEBUG, "setting %@ for %@", v21, 0x16u);
      goto LABEL_24;
    }
  }

  [a1[4] setObject:v6 forKey:v5];
LABEL_28:
}

- (id)recentInfoForVolumes:(id)a3 atUrgency:(int)a4 validateResults:(BOOL)a5 targetVolume:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x189603FC8]);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = v10;
  uint64_t v37 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v39;
    *(void *)&__int128 v13 = 138412290LL;
    __int128 v33 = v13;
    uint64_t v34 = self;
    do
    {
      for (uint64_t i = 0LL; i != v37; ++i)
      {
        if (*(void *)v39 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        -[CDPurgeableResultCache recentInfoForVolume:atUrgency:validateResults:]( self,  "recentInfoForVolume:atUrgency:validateResults:",  v15,  v8,  v7,  v33);
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          CDGetLogHandle((uint64_t)"client");
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            [v15 mountPoint];
            id v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v33;
            v43 = v18;
            _os_log_impl(&dword_1874E4000, v17, OS_LOG_TYPE_DEFAULT, "got volinfo for %@ ", buf, 0xCu);
          }

          [v12 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          evaluateNumberProperty(v19);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            uint64_t v21 = v8;
            BOOL v22 = v7;
            [v15 mountPoint];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            id v24 = v11;
            int v25 = [v23 isEqualToString:v11];

            v26 = @"CACHE_DELETE_SHARED_PURGEABLE";
            if (v25)
            {
              [v12 addEntriesFromDictionary:v16];
              v26 = @"CACHE_DELETE_TOTAL_AVAILABLE";
            }

            [v16 objectForKeyedSubscript:v26];
            BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();
            evaluateNumberProperty(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  objc_msgSend(v28, "unsignedLongLongValue") + objc_msgSend(v20, "unsignedLongLongValue"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            [v12 setObject:v29 forKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"];

            id v11 = v24;
            BOOL v7 = v22;
            uint64_t v8 = v21;
            self = v34;
          }

          else
          {
            -[CDPurgeableResultCache dictionaryByMerging:with:](self, "dictionaryByMerging:with:", v12, v16);
            v28 = v12;
            id v12 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
      }

      uint64_t v37 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }

    while (v37);
  }

  if ([v12 count])
  {
    [v12 objectForKeyedSubscript:@"com.apple.deleted_helper"];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v30 forKeyedSubscript:@"CACHE_DELETE_TOTAL_FSPURGEABLE"];

    [v12 removeObjectForKey:@"com.apple.deleted_helper"];
    id v31 = v12;
  }

  else
  {
    id v31 = 0LL;
  }

  return v31;
}

- (id)recentInfoForVolumes:(id)a3 atUrgency:(int)a4
{
  return -[CDPurgeableResultCache recentInfoForVolumes:atUrgency:validateResults:targetVolume:]( self,  "recentInfoForVolumes:atUrgency:validateResults:targetVolume:",  a3,  *(void *)&a4,  1LL,  0LL);
}

- (int64_t)recentStateForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  if (v4)
  {
    -[CDPurgeableResultCache queue](self, "queue");
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __47__CDPurgeableResultCache_recentStateForVolume___block_invoke;
    block[3] = &unk_18A066178;
    id v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);

    int64_t v6 = v12[3];
  }

  else
  {
    int64_t v6 = 0LL;
  }

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __47__CDPurgeableResultCache_recentStateForVolume___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) mountPoint];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 recentStateForVolume:v2];
}

- (void)updateRecentVolumeInfo:(id)a3
{
  id v4 = a3;
  -[CDPurgeableResultCache recentPurgeableResults](self, "recentPurgeableResults");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 volumes];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 volume];
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v4 forKeyedSubscript:v6];
}

- (void)invalidateAllForgettingPushers:(BOOL)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __57__CDPurgeableResultCache_invalidateAllForgettingPushers___block_invoke;
  v6[3] = &unk_18A066128;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __57__CDPurgeableResultCache_invalidateAllForgettingPushers___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  [*(id *)(a1 + 32) recentPurgeableResults];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 volumes];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        [*(id *)(a1 + 32) recentPurgeableResults];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 invalidateForVolume:v9];
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }

    while (v6);
  }

  if (*(_BYTE *)(a1 + 40))
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults", 0);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = (void *)[v11 copyPushingServices];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0LL; j != v14; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * j);
          [*(id *)(a1 + 32) recentPurgeableResults];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 pushingServices];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 removeObject:v17];
        }

        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }

      while (v14);
    }
  }

- (BOOL)isEmpty
{
  uint64_t v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __33__CDPurgeableResultCache_isEmpty__block_invoke;
  v5[3] = &unk_18A066150;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __33__CDPurgeableResultCache_isEmpty__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isEmpty];
}

- (BOOL)isStale
{
  id v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __33__CDPurgeableResultCache_isStale__block_invoke;
  v5[3] = &unk_18A066150;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __33__CDPurgeableResultCache_isStale__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isStale];
}

- (BOOL)hasInvalids
{
  id v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __37__CDPurgeableResultCache_hasInvalids__block_invoke;
  v5[3] = &unk_18A066150;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __37__CDPurgeableResultCache_hasInvalids__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 hasInvalids];
}

- (id)bsdDiskForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0LL;
  -[CDPurgeableResultCache queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__CDPurgeableResultCache_bsdDiskForVolume___block_invoke;
  block[3] = &unk_18A066178;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __43__CDPurgeableResultCache_bsdDiskForVolume___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 bsdDiskForVolume:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)thresholdsForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0LL;
  -[CDPurgeableResultCache queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__CDPurgeableResultCache_thresholdsForVolume___block_invoke;
  block[3] = &unk_18A066178;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__CDPurgeableResultCache_thresholdsForVolume___block_invoke(uint64_t a1)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) mountPoint];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v6 thresholdsForVolume:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)servicesForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0LL;
  -[CDPurgeableResultCache queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__CDPurgeableResultCache_servicesForVolume___block_invoke;
  block[3] = &unk_18A066178;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__CDPurgeableResultCache_servicesForVolume___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 servicesForVolume:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasSnapshotForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__CDPurgeableResultCache_hasSnapshotForVolume___block_invoke;
  block[3] = &unk_18A066178;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __47__CDPurgeableResultCache_hasSnapshotForVolume___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 hasSnapshotForVolume:*(void *)(a1 + 40)];
}

- (BOOL)isStaleForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__CDPurgeableResultCache_isStaleForVolume___block_invoke;
  block[3] = &unk_18A066178;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __43__CDPurgeableResultCache_isStaleForVolume___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 isStaleForVolume:*(void *)(a1 + 40)];
}

- (BOOL)isInvalidForVolume:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__CDPurgeableResultCache_isInvalidForVolume___block_invoke;
  block[3] = &unk_18A066178;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __45__CDPurgeableResultCache_isInvalidForVolume___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 isInvalidForVolume:*(void *)(a1 + 40)];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v3;
}

- (void)absorbRecentInfo:(id)a3
{
  id v4 = a3;
  -[CDPurgeableResultCache queue](self, "queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__CDPurgeableResultCache_absorbRecentInfo___block_invoke;
  block[3] = &unk_18A0661A0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

uint64_t __43__CDPurgeableResultCache_absorbRecentInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRecentPurgeableResults:*(void *)(a1 + 40)];
}

- (void)log
{
  char v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__CDPurgeableResultCache_log__block_invoke;
  block[3] = &unk_18A0661C8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __29__CDPurgeableResultCache_log__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 log];
}

- (CDRecentInfo)recentPurgeableResults
{
  return self->_recentPurgeableResults;
}

- (void)setRecentPurgeableResults:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end