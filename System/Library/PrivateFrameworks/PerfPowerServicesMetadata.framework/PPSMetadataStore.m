@interface PPSMetadataStore
+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5;
+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6;
+ (id)plistMetricsFromDir:(id)a3;
+ (id)plistMetricsFromDir:(id)a3 forSubsystem:(id)a4;
+ (id)sharedStore;
- (NSMutableDictionary)metricsByID;
- (PPSMetadataStore)init;
- (id)getAllFrameworkSubsystem;
- (id)getAllSubsystem;
- (id)getMetadataForSubsystem:(id)a3;
- (id)getMetadataForSubsystem:(id)a3 category:(id)a4;
- (id)getMetadataForSubsystem:(id)a3 category:(id)a4 name:(id)a5;
- (void)addMetricsToCache:(id)a3;
- (void)buildDeviceMetadata;
- (void)cacheFrameworkMetrics;
- (void)cacheFrameworkMetricsForSubsystem:(id)a3;
- (void)cachePlistMetrics;
- (void)cachePlistMetricsForSubsystem:(id)a3;
- (void)loadMetricsForSubsystem:(id)a3;
- (void)setMetricsByID:(id)a3;
@end

@implementation PPSMetadataStore

+ (id)sharedStore
{
  if (sharedStore_onceToken != -1) {
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_4);
  }
  return (id)sharedStore__sharedStore;
}

void __31__PPSMetadataStore_sharedStore__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___PPSMetadataStore);
  v1 = (void *)sharedStore__sharedStore;
  sharedStore__sharedStore = (uint64_t)v0;
}

- (PPSMetadataStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PPSMetadataStore;
  v2 = -[PPSMetadataStore init](&v5, sel_init);
  if (v2)
  {
    [MEMORY[0x189603FC8] dictionary];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSMetadataStore setMetricsByID:](v2, "setMetricsByID:", v3);
  }

  return v2;
}

- (void)buildDeviceMetadata
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__PPSMetadataStore_buildDeviceMetadata__block_invoke;
  block[3] = &unk_18A291190;
  block[4] = self;
  if (buildDeviceMetadata_onceToken != -1) {
    dispatch_once(&buildDeviceMetadata_onceToken, block);
  }
}

uint64_t __39__PPSMetadataStore_buildDeviceMetadata__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cachePlistMetrics];
}

- (id)getAllSubsystem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allKeys];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getAllFrameworkSubsystem
{
  return +[PPSMetricManager allDeclSubsystem](&OBJC_CLASS___PPSMetricManager, "allDeclSubsystem");
}

- (id)getMetadataForSubsystem:(id)a3
{
  id v4 = a3;
  objc_sync_enter(@"++metricsByIDSync++");
  -[PPSMetadataStore metricsByID](self, "metricsByID");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[PPSMetadataStore loadMetricsForSubsystem:](self, "loadMetricsForSubsystem:", v4),
    v9 = -[PPSMetadataStore metricsByID](self, "metricsByID"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:v4],
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    -[PPSMetadataStore metricsByID](self, "metricsByID");
    [v9 objectForKeyedSubscript:v4];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v10 = 0LL;
  }

  objc_sync_exit(@"++metricsByIDSync++");

  return v10;
}

- (id)getMetadataForSubsystem:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_sync_enter(@"++metricsByIDSync++");
  v8 = -[PPSMetadataStore metricsByID](self, "metricsByID");
  [v8 objectForKeyedSubscript:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[PPSMetadataStore metricsByID](self, "metricsByID");
    [v10 objectForKeyedSubscript:v6];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectForKeyedSubscript:v7];
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12) {
      goto LABEL_7;
    }
  }

  else
  {
  }

  -[PPSMetadataStore loadMetricsForSubsystem:](self, "loadMetricsForSubsystem:", v6);
  v13 = -[PPSMetadataStore metricsByID](self, "metricsByID");
  [v13 objectForKeyedSubscript:v6];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14) {
    goto LABEL_8;
  }
  v15 = -[PPSMetadataStore metricsByID](self, "metricsByID");
  [v15 objectForKeyedSubscript:v6];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 objectForKeyedSubscript:v7];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_8:
    v20 = 0LL;
    goto LABEL_9;
  }

- (id)getMetadataForSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_sync_enter(@"++metricsByIDSync++");
  v11 = -[PPSMetadataStore metricsByID](self, "metricsByID");
  [v11 objectForKeyedSubscript:v8];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = -[PPSMetadataStore metricsByID](self, "metricsByID");
    [v13 objectForKeyedSubscript:v8];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKeyedSubscript:v9];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15) {
      goto LABEL_7;
    }
  }

  else
  {
  }

  -[PPSMetadataStore loadMetricsForSubsystem:](self, "loadMetricsForSubsystem:", v8);
  v16 = -[PPSMetadataStore metricsByID](self, "metricsByID");
  [v16 objectForKeyedSubscript:v8];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17) {
    goto LABEL_8;
  }
  v18 = -[PPSMetadataStore metricsByID](self, "metricsByID");
  [v18 objectForKeyedSubscript:v8];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 objectForKeyedSubscript:v9];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_8:
    v24 = 0LL;
    goto LABEL_9;
  }

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v32 = a5;
  v33 = v10;
  id v31 = a6;
  v11 = +[PPSSQLMetadataStore queryMetadataHistoryForFilepath:subsystem:category:name:]( &OBJC_CLASS___PPSSQLMetadataStore,  "queryMetadataHistoryForFilepath:subsystem:category:name:",  v9,  v10,  v32);
  v12 = v11;
  if (v11)
  {
    id v30 = v9;
    objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    v29 = v12;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
      do
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1895CD158]();
          [v18 allKeys];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 firstObject];
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21
            && ([v18 objectForKeyedSubscript:v21],
                v22 = (void *)objc_claimAutoreleasedReturnValue(),
                v22,
                v22))
          {
            v23 = objc_alloc(&OBJC_CLASS___PPSPBMetric);
            [v18 objectForKeyedSubscript:v21];
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[PBCodable initWithData:](v23, "initWithData:", v24);
            v26 = +[PPSMetric metricWithProto:withBuild:](&OBJC_CLASS___PPSMetric, "metricWithProto:withBuild:", v25, v21);
            if (v26)
            {
              [v34 addObject:v26];
            }

            else
            {
              PPSStoreLog();
              v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413058;
                v40 = v33;
                __int16 v41 = 2112;
                id v42 = v32;
                __int16 v43 = 2112;
                id v44 = v31;
                __int16 v45 = 2112;
                v46 = v21;
                _os_log_error_impl( &dword_188807000,  v27,  OS_LOG_TYPE_ERROR,  "Failed to decode metric: %@_%@_%@ for build: %@",  buf,  0x2Au);
              }
            }
          }

          else
          {
            PPSStoreLog();
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138413058;
              v40 = v33;
              __int16 v41 = 2112;
              id v42 = v32;
              __int16 v43 = 2112;
              id v44 = v31;
              __int16 v45 = 2112;
              v46 = v21;
              _os_log_error_impl( &dword_188807000,  v25,  OS_LOG_TYPE_ERROR,  "Failed to decode metric: %@_%@_%@ for build: %@",  buf,  0x2Au);
            }
          }

          objc_autoreleasePoolPop(v19);
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }

      while (v15);
    }

    v12 = v29;
    id v9 = v30;
  }

  else
  {
    id v34 = 0LL;
  }

  return v34;
}

+ (id)getMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v38 = a5;
  v39 = v8;
  +[PPSSQLMetadataStore queryMetadataHistoryForFilepath:subsystem:category:]( &OBJC_CLASS___PPSSQLMetadataStore,  "queryMetadataHistoryForFilepath:subsystem:category:",  v7,  v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v9)
  {
    id v31 = v7;
    objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    id v30 = v10;
    id obj = v10;
    uint64_t v34 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v46;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v46 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = v11;
          uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * v11);
          context = (void *)MEMORY[0x1895CD158]();
          uint64_t v40 = v12;
          [obj objectForKeyedSubscript:v12];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          id v15 = v13;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v57 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v42;
            do
            {
              for (uint64_t i = 0LL; i != v17; ++i)
              {
                if (*(void *)v42 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                objc_msgSend(v20, "allKeys", v30);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                [v21 firstObject];
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22
                  && ([v20 objectForKeyedSubscript:v22],
                      v23 = (void *)objc_claimAutoreleasedReturnValue(),
                      v23,
                      v23))
                {
                  v24 = objc_alloc(&OBJC_CLASS___PPSPBMetric);
                  [v20 objectForKeyedSubscript:v22];
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = -[PBCodable initWithData:](v24, "initWithData:", v25);
                  v27 = +[PPSMetric metricWithProto:withBuild:]( &OBJC_CLASS___PPSMetric,  "metricWithProto:withBuild:",  v26,  v22);
                  if (v27)
                  {
                    [v14 addObject:v27];
                  }

                  else
                  {
                    PPSStoreLog();
                    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138413058;
                      v50 = v39;
                      __int16 v51 = 2112;
                      id v52 = v38;
                      __int16 v53 = 2112;
                      uint64_t v54 = v40;
                      __int16 v55 = 2112;
                      v56 = v22;
                      _os_log_error_impl( &dword_188807000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to decode metric: %@_%@_%@ for build: %@",  buf,  0x2Au);
                    }
                  }
                }

                else
                {
                  PPSStoreLog();
                  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138413058;
                    v50 = v39;
                    __int16 v51 = 2112;
                    id v52 = v38;
                    __int16 v53 = 2112;
                    uint64_t v54 = v40;
                    __int16 v55 = 2112;
                    v56 = v22;
                    _os_log_error_impl( &dword_188807000,  v26,  OS_LOG_TYPE_ERROR,  "Failed to decode metric: %@_%@_%@ for build: %@",  buf,  0x2Au);
                  }
                }
              }

              uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v57 count:16];
            }

            while (v17);
          }

          [v33 setObject:v14 forKeyedSubscript:v40];
          objc_autoreleasePoolPop(context);
          uint64_t v11 = v37 + 1;
        }

        while (v37 + 1 != v34);
        uint64_t v34 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
      }

      while (v34);
    }

    id v10 = v30;
    id v7 = v31;
  }

  else
  {
    id v33 = 0LL;
  }

  return v33;
}

- (void)cacheFrameworkMetrics
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__PPSMetadataStore_cacheFrameworkMetrics__block_invoke;
  block[3] = &unk_18A291190;
  block[4] = self;
  if (cacheFrameworkMetrics_onceToken != -1) {
    dispatch_once(&cacheFrameworkMetrics_onceToken, block);
  }
}

void __41__PPSMetadataStore_cacheFrameworkMetrics__block_invoke(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_188807000, v2, OS_LOG_TYPE_INFO, "Constructing all framework metrics", v4, 2u);
  }
  v3 = +[PPSMetricManager allDeclMetrics](&OBJC_CLASS___PPSMetricManager, "allDeclMetrics");
  [*(id *)(a1 + 32) addMetricsToCache:v3];
}

- (void)cachePlistMetrics
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__PPSMetadataStore_cachePlistMetrics__block_invoke;
  block[3] = &unk_18A291190;
  block[4] = self;
  if (cachePlistMetrics_onceToken != -1) {
    dispatch_once(&cachePlistMetrics_onceToken, block);
  }
}

void __37__PPSMetadataStore_cachePlistMetrics__block_invoke(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_188807000, v2, OS_LOG_TYPE_INFO, "Constructing all client plist metrics", v4, 2u);
  }
  v3 = +[PPSMetadataStore plistMetricsFromDir:]( &OBJC_CLASS___PPSMetadataStore,  "plistMetricsFromDir:",  @"/System/Library/PerfPowerTelemetry/MetadataReports/");
  [*(id *)(a1 + 32) addMetricsToCache:v3];
}

- (void)cacheFrameworkMetricsForSubsystem:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  PPSStoreLog();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( &dword_188807000,  v5,  OS_LOG_TYPE_INFO,  "Constructing all framework metrics for subsystem: %@",  (uint8_t *)&v7,  0xCu);
  }

  +[PPSMetricManager allDeclMetricsForSubsystem:](&OBJC_CLASS___PPSMetricManager, "allDeclMetricsForSubsystem:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetadataStore addMetricsToCache:](self, "addMetricsToCache:", v6);
}

- (void)cachePlistMetricsForSubsystem:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  PPSStoreLog();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl( &dword_188807000,  v5,  OS_LOG_TYPE_INFO,  "Constructing all client plist metrics for subsystem: %@",  (uint8_t *)&v7,  0xCu);
  }

  +[PPSMetadataStore plistMetricsFromDir:forSubsystem:]( &OBJC_CLASS___PPSMetadataStore,  "plistMetricsFromDir:forSubsystem:",  @"/System/Library/PerfPowerTelemetry/MetadataReports/",  v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetadataStore addMetricsToCache:](self, "addMetricsToCache:", v6);
}

+ (id)plistMetricsFromDir:(id)a3
{
  return +[PPSMetadataStore plistMetricsFromDir:forSubsystem:]( &OBJC_CLASS___PPSMetadataStore,  "plistMetricsFromDir:forSubsystem:",  a3,  0LL);
}

+ (id)plistMetricsFromDir:(id)a3 forSubsystem:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v23 = a4;
  [MEMORY[0x1896078A8] defaultManager];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0LL;
  }

  else
  {
    [MEMORY[0x189603FA8] array];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v6;
    [v6 contentsOfDirectoryAtPath:v5 error:0];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    PPSStoreLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[PPSMetadataStore plistMetricsFromDir:forSubsystem:].cold.1((uint64_t)v9, v10);
    }

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id obj = v9;
    uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(obj);
          }
          [v5 stringByAppendingString:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          id v16 = v5;
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189604030] fileURLWithPath:v17 isDirectory:0];
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = +[PPSMetric metricsWithPlist:subsystem:](&OBJC_CLASS___PPSMetric, "metricsWithPlist:subsystem:", v18, v23);
          [v8 addObjectsFromArray:v19];

          id v5 = v16;
        }

        uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }

      while (v13);
    }

    id v6 = v21;
  }

  return v8;
}

- (void)addMetricsToCache:(id)a3
{
  id v4 = a3;
  objc_sync_enter(@"++metricsByIDSync++");
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __38__PPSMetadataStore_addMetricsToCache___block_invoke;
  v5[3] = &unk_18A290E58;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
  objc_sync_exit(@"++metricsByIDSync++");
}

void __38__PPSMetadataStore_addMetricsToCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [v3 subsystem];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 category];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) metricsByID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKey:v4];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    [MEMORY[0x189603FC8] dictionary];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) metricsByID];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v8 forKeyedSubscript:v4];
  }

  [*(id *)(a1 + 32) metricsByID];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKeyedSubscript:v4];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKey:v5];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) metricsByID];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKeyedSubscript:v4];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v13 forKeyedSubscript:v5];
  }

  [*(id *)(a1 + 32) metricsByID];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 objectForKeyedSubscript:v4];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 objectForKeyedSubscript:v5];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 name];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 objectForKey:v19];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    [*(id *)(a1 + 32) metricsByID];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 objectForKeyedSubscript:v4];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 objectForKeyedSubscript:v5];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 name];
    __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 setObject:v3 forKeyedSubscript:v24];

    goto LABEL_9;
  }

  PPSStoreLog();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
  {
    [v3 name];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v25 = 138412802;
    __int128 v26 = v4;
    __int16 v27 = 2112;
    char v28 = v5;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    _os_log_error_impl( &dword_188807000,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "Duplicate metric found with subsystem:%@, category:%@, name:%@",  (uint8_t *)&v25,  0x20u);
LABEL_9:
  }
}

- (void)loadMetricsForSubsystem:(id)a3
{
  id v4 = a3;
  -[PPSMetadataStore cacheFrameworkMetricsForSubsystem:](self, "cacheFrameworkMetricsForSubsystem:", v4);
  -[PPSMetadataStore cachePlistMetricsForSubsystem:](self, "cachePlistMetricsForSubsystem:", v4);
}

- (NSMutableDictionary)metricsByID
{
  return self->_metricsByID;
}

- (void)setMetricsByID:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)plistMetricsFromDir:(uint64_t)a1 forSubsystem:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_188807000,  a2,  OS_LOG_TYPE_DEBUG,  "Found following metadata reports: %@",  (uint8_t *)&v2,  0xCu);
}

@end