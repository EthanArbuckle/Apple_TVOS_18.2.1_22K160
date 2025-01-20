@interface SFAnalyticsCollection
+ (id)parseVersion:(id)a3 platform:(id)a4;
- (BOOL)allowedVersionsWithSelf:(id)a3;
- (BOOL)excludedVersion;
- (BOOL)matchRuleWithSelf:(id)a3;
- (NSMutableDictionary)allowedEvents;
- (NSMutableDictionary)matchingRules;
- (NSString)processName;
- (OS_dispatch_queue)queue;
- (SECSFAVersion)selfVersion;
- (SFAnalyticsCollection)init;
- (SFAnalyticsCollection)initWithActionInterface:(id)a3 product:(id)a4 build:(id)a5;
- (SFAnalyticsCollectionAction)actions;
- (id)parseCollection:(id)a3 logger:(id)a4;
- (id)tearDownMetricsHook;
- (unsigned)match:(id)a3 eventClass:(int64_t)a4 attributes:(id)a5 bucket:(unsigned int)a6 logger:(id)a7;
- (void)dealloc;
- (void)drainSetupQueue;
- (void)loadCollection:(id)a3;
- (void)onQueue_stopMetricCollection;
- (void)setActions:(id)a3;
- (void)setAllowedEvents:(id)a3;
- (void)setExcludedVersion:(BOOL)a3;
- (void)setMatchingRules:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSelfVersion:(id)a3;
- (void)setTearDownMetricsHook:(id)a3;
- (void)setupMetricsHook:(id)a3;
- (void)stopMetricCollection;
- (void)storeCollection:(id)a3 logger:(id)a4;
@end

@implementation SFAnalyticsCollection

- (SFAnalyticsCollection)init
{
  v3 = (void *)_CFCopySystemVersionDictionary();
  [v3 objectForKeyedSubscript:*MEMORY[0x189604B60]];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:*MEMORY[0x189604B68]];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [MEMORY[0x1896079D8] processInfo];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 processName];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAnalyticsCollection setProcessName:](self, "setProcessName:", v7);

    v8 = objc_alloc_init(&OBJC_CLASS___DefaultCollectionActions);
    self =  -[SFAnalyticsCollection initWithActionInterface:product:build:]( self,  "initWithActionInterface:product:build:",  v8,  v5,  v4);

    v9 = self;
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (SFAnalyticsCollection)initWithActionInterface:(id)a3 product:(id)a4 build:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(id)objc_opt_class() parseVersion:v9 platform:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (v16.receiver = self,
        v16.super_class = (Class)&OBJC_CLASS___SFAnalyticsCollection,
        (self = -[SFAnalyticsCollection init](&v16, sel_init)) != 0LL))
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v13 = dispatch_queue_create("SFAnalyticsCollection", v12);
    -[SFAnalyticsCollection setQueue:](self, "setQueue:", v13);

    -[SFAnalyticsCollection setActions:](self, "setActions:", v8);
    -[SFAnalyticsCollection setSelfVersion:](self, "setSelfVersion:", v11);
    self = self;
    v14 = self;
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SFAnalyticsCollection;
  -[SFAnalyticsCollection dealloc](&v3, sel_dealloc);
}

- (BOOL)matchRuleWithSelf:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0 || ![v4 versionsCount])
  {
    BOOL v17 = 1;
  }

  else
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    objc_msgSend(v4, "versions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          int v11 = [v10 productName];
          v12 = -[SFAnalyticsCollection selfVersion](self, "selfVersion");
          int v13 = [v12 productName];

          if (v11 == v13)
          {
            uint64_t v14 = [v10 major];
            v15 = -[SFAnalyticsCollection selfVersion](self, "selfVersion");
            uint64_t v16 = [v15 major];

            if (v14 <= v16)
            {
              uint64_t v18 = [v10 minor];
              v19 = -[SFAnalyticsCollection selfVersion](self, "selfVersion");
              uint64_t v20 = [v19 minor];

              if (v18 == v20)
              {
                uint64_t v21 = [v10 build];
                v22 = -[SFAnalyticsCollection selfVersion](self, "selfVersion");
                BOOL v17 = v21 >= [v22 build];
              }

              else
              {
                uint64_t v23 = [v10 minor];
                v22 = -[SFAnalyticsCollection selfVersion](self, "selfVersion");
                BOOL v17 = v23 < [v22 minor];
              }

              goto LABEL_18;
            }
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    BOOL v17 = 0;
LABEL_18:
  }

  return v17;
}

- (BOOL)allowedVersionsWithSelf:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0 || ![v4 versionsCount])
  {
    BOOL v14 = 1;
  }

  else
  {
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    objc_msgSend(v4, "versions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          int v11 = [v10 productName];
          v12 = -[SFAnalyticsCollection selfVersion](self, "selfVersion");
          int v13 = [v12 productName];

          if (v11 == v13)
          {
            uint64_t v15 = [v10 major];
            -[SFAnalyticsCollection selfVersion](self, "selfVersion");
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v17 = [v16 major];

            if (v15 > v17
              && (uint64_t v18 = [v10 minor],
                  -[SFAnalyticsCollection selfVersion](self, "selfVersion"),
                  v19 = (void *)objc_claimAutoreleasedReturnValue(),
                  uint64_t v20 = [v19 minor],
                  v19,
                  v18 >= v20))
            {
              uint64_t v21 = [v10 minor];
              v22 = -[SFAnalyticsCollection selfVersion](self, "selfVersion");
              if (v21 == [v22 minor])
              {
                uint64_t v23 = [v10 build];
                v24 = -[SFAnalyticsCollection selfVersion](self, "selfVersion");
                BOOL v14 = v23 <= [v24 build];
              }

              else
              {
                BOOL v14 = 0;
              }
            }

            else
            {
              BOOL v14 = 1;
            }

            goto LABEL_20;
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    BOOL v14 = 0;
LABEL_20:
  }

  return v14;
}

- (id)parseCollection:(id)a3 logger:(id)a4
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v45 = a4;
  id v54 = 0LL;
  [a3 decompressedDataUsingAlgorithm:0 error:&v54];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v54;
  if (v6)
  {
    uint64_t v8 = -[PBCodable initWithData:](objc_alloc(&OBJC_CLASS___SECSFARules), "initWithData:", v6);
    id v9 = objc_alloc_init(&OBJC_CLASS___SecSFAParsedCollection);
    -[SECSFARules allowedBuilds](v8, "allowedBuilds");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecSFAParsedCollection setExcludedVersion:]( v9,  "setExcludedVersion:",  -[SFAnalyticsCollection allowedVersionsWithSelf:](self, "allowedVersionsWithSelf:", v10) ^ 1);

    if (!-[SecSFAParsedCollection excludedVersion](v9, "excludedVersion"))
    {
      id v41 = v7;
      v42 = v6;
      v44 = self;
      [MEMORY[0x189603FC8] dictionary];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SecSFAParsedCollection setAllowedEvents:](v9, "setAllowedEvents:", v11);

      __int128 v52 = 0u;
      __int128 v53 = 0u;
      __int128 v50 = 0u;
      __int128 v51 = 0u;
      v43 = v8;
      v12 = -[SECSFARules eventFilters](v8, "eventFilters");
      uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v51;
        do
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v51 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            if ([v17 dropRate])
            {
              if ([v17 dropRate] < 1 || objc_msgSend(v17, "dropRate") > 100)
              {
                uint64_t v18 = 0LL;
              }

              else
              {
                objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", objc_msgSend(v17, "dropRate"));
                uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }

            else
            {
              uint64_t v18 = &unk_18969C090;
            }
            v19 = -[SecSFAParsedCollection allowedEvents](v9, "allowedEvents");
            [v17 event];
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v19 setObject:v18 forKeyedSubscript:v20];
          }

          uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v56 count:16];
        }

        while (v14);
      }

      [MEMORY[0x189603FC8] dictionary];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SecSFAParsedCollection setMatchingRules:](v9, "setMatchingRules:", v21);

      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      v22 = -[SECSFARules eventRules](v43, "eventRules");
      uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v47;
        do
        {
          for (uint64_t j = 0LL; j != v24; ++j)
          {
            if (*(void *)v47 != v25) {
              objc_enumerationMutation(v22);
            }
            __int128 v27 = *(void **)(*((void *)&v46 + 1) + 8 * j);
            uint64_t v28 = [v27 versions];
            if (v28)
            {
              __int128 v29 = (void *)v28;
              [v27 versions];
              uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v31 = -[SFAnalyticsCollection matchRuleWithSelf:](v44, "matchRuleWithSelf:", v30);

              if (!v31) {
                continue;
              }
            }
            v32 = -[SecSFAParsedCollection matchingRules](v9, "matchingRules");
            [v27 eventType];
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v32 objectForKeyedSubscript:v33];
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v34)
            {
              [MEMORY[0x189603FE0] set];
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[SecSFAParsedCollection matchingRules](v9, "matchingRules");
              [v27 eventType];
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              [v35 setObject:v34 forKeyedSubscript:v36];
            }

            v37 = -[SFAnalyticsMatchingRule initWithSFARule:logger:]( objc_alloc(&OBJC_CLASS___SFAnalyticsMatchingRule),  "initWithSFARule:logger:",  v27,  v45);
            if (v37) {
              [v34 addObject:v37];
            }
            v38 = -[SecSFAParsedCollection allowedEvents](v9, "allowedEvents");
            [v27 eventType];
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            [v38 setObject:&unk_18969C090 forKeyedSubscript:v39];
          }

          uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v55 count:16];
        }

        while (v24);
      }

      id v7 = v41;
      uint64_t v6 = v42;
      uint64_t v8 = v43;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (void)setupMetricsHook:(id)a3
{
  id v4 = a3;
  -[SFAnalyticsCollection queue](self, "queue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42__SFAnalyticsCollection_setupMetricsHook___block_invoke;
  v7[3] = &unk_189667490;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)onQueue_stopMetricCollection
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = __Block_byref_object_copy__4090;
  int v11 = __Block_byref_object_dispose__4091;
  id v12 = 0LL;
  uint64_t v3 = -[SFAnalyticsCollection tearDownMetricsHook](self, "tearDownMetricsHook");
  id v4 = (void *)v8[5];
  v8[5] = v3;

  -[SFAnalyticsCollection setTearDownMetricsHook:](self, "setTearDownMetricsHook:", 0LL);
  if (v8[5])
  {
    dispatch_get_global_queue(17LL, 0LL);
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __53__SFAnalyticsCollection_onQueue_stopMetricCollection__block_invoke;
    block[3] = &unk_1896734F0;
    block[4] = &v7;
    dispatch_async(v5, block);
  }

  _Block_object_dispose(&v7, 8);
}

- (void)stopMetricCollection
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__SFAnalyticsCollection_stopMetricCollection__block_invoke;
  block[3] = &unk_189676638;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)loadCollection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 dataPropertyForKey:@"SFCollectionConfig"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalyticsCollection parseCollection:logger:](self, "parseCollection:logger:", v5, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalyticsCollection queue](self, "queue");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = MEMORY[0x1895F87A8];
  uint64_t v11 = 3221225472LL;
  id v12 = __40__SFAnalyticsCollection_loadCollection___block_invoke;
  uint64_t v13 = &unk_189667490;
  uint64_t v14 = self;
  id v8 = v6;
  id v15 = v8;
  dispatch_sync(v7, &v10);

  getOSLog();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v8;
    _os_log_impl(&dword_1804F4000, v9, OS_LOG_TYPE_DEFAULT, "Loading matching rules: %@", buf, 0xCu);
  }

  -[SFAnalyticsCollection setupMetricsHook:](self, "setupMetricsHook:", v4, v10, v11, v12, v13, v14);
}

- (void)storeCollection:(id)a3 logger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = -86;
  -[SFAnalyticsCollection parseCollection:logger:](self, "parseCollection:logger:", v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalyticsCollection queue](self, "queue");
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__SFAnalyticsCollection_storeCollection_logger___block_invoke;
  block[3] = &unk_1896674B8;
  uint64_t v16 = &v17;
  id v10 = v8;
  id v14 = v10;
  id v15 = self;
  dispatch_sync(v9, block);

  if (v7 && *((_BYTE *)v18 + 24))
  {
    getOSLog();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1804F4000, v11, OS_LOG_TYPE_DEFAULT, "Setting up new rules", v12, 2u);
    }

    [v7 setDataProperty:v6 forKey:@"SFCollectionConfig"];
    -[SFAnalyticsCollection setupMetricsHook:](self, "setupMetricsHook:", v7);
  }

  _Block_object_dispose(&v17, 8);
}

- (unsigned)match:(id)a3 eventClass:(int64_t)a4 attributes:(id)a5 bucket:(unsigned int)a6 logger:(id)a7
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  int v30 = 0;
  getOSLog();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v11;
    _os_log_debug_impl(&dword_1804F4000, v14, OS_LOG_TYPE_DEBUG, "matching rules %@", buf, 0xCu);
  }

  -[SFAnalyticsCollection queue](self, "queue");
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __67__SFAnalyticsCollection_match_eventClass_attributes_bucket_logger___block_invoke;
  v21[3] = &unk_1896674E0;
  v21[4] = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  uint64_t v25 = &v27;
  int64_t v26 = a4;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_sync(v15, v21);

  unsigned int v19 = *((_DWORD *)v28 + 6);
  _Block_object_dispose(&v27, 8);
  return v19;
}

- (void)drainSetupQueue
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_171);
}

- (BOOL)excludedVersion
{
  return self->_excludedVersion;
}

- (void)setExcludedVersion:(BOOL)a3
{
  self->_excludedVersion = a3;
}

- (NSMutableDictionary)matchingRules
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setMatchingRules:(id)a3
{
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setProcessName:(id)a3
{
}

- (NSMutableDictionary)allowedEvents
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAllowedEvents:(id)a3
{
}

- (id)tearDownMetricsHook
{
  return objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTearDownMetricsHook:(id)a3
{
}

- (SFAnalyticsCollectionAction)actions
{
  return (SFAnalyticsCollectionAction *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setActions:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (SECSFAVersion)selfVersion
{
  return (SECSFAVersion *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSelfVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

void __67__SFAnalyticsCollection_match_eventClass_attributes_bucket_logger___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) matchingRules];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && [v3 count])
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = *(void *)(a1 + 48);
          uint64_t v11 = *(void *)(a1 + 72);
          objc_msgSend(*(id *)(a1 + 32), "processName", (void)v15);
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v10) = [v9 matchAttributes:v10 eventClass:v11 processName:v12 logger:*(void *)(a1 + 56)];

          if ((_DWORD)v10)
          {
            [*(id *)(a1 + 32) actions];
            id v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= [v9 doAction:v13 attributes:*(void *)(a1 + 48) logger:*(void *)(a1 + 56)];
          }
        }

        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v6);
    }
  }

  else
  {
    getOSLog();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v14;
      _os_log_debug_impl(&dword_1804F4000, (os_log_t)v4, OS_LOG_TYPE_DEBUG, "no rules %@", buf, 0xCu);
    }
  }
}

void __48__SFAnalyticsCollection_storeCollection_logger___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) matchingRules];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
  {
    [*(id *)(a1 + 32) allowedEvents];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) allowedEvents];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v4 != v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

  [*(id *)(a1 + 32) matchingRules];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setMatchingRules:v6];

  objc_msgSend(*(id *)(a1 + 40), "setExcludedVersion:", objc_msgSend(*(id *)(a1 + 32), "excludedVersion"));
  [*(id *)(a1 + 32) allowedEvents];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setAllowedEvents:v7];
}

void __40__SFAnalyticsCollection_loadCollection___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setMatchingRules:v2];

  objc_msgSend(*(id *)(a1 + 32), "setExcludedVersion:", objc_msgSend(*(id *)(a1 + 40), "excludedVersion"));
  [*(id *)(a1 + 40) allowedEvents];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setAllowedEvents:v3];
}

uint64_t __45__SFAnalyticsCollection_stopMetricCollection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onQueue_stopMetricCollection");
}

uint64_t __53__SFAnalyticsCollection_onQueue_stopMetricCollection__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) + 16LL))();
}

void __42__SFAnalyticsCollection_setupMetricsHook___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, *(id *)(a1 + 40));
    id from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, *(id *)(a1 + 32));
    uint64_t v3 = MEMORY[0x1895F87A8];
    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 3221225472LL;
    aBlock[2] = __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_2;
    aBlock[3] = &unk_189667400;
    objc_copyWeak(&v14, &location);
    objc_copyWeak(&v15, &from);
    id v4 = _Block_copy(aBlock);
    if ([*(id *)(a1 + 32) excludedVersion]) {
      id v5 = (id)[*(id *)(a1 + 40) AddMultiSamplerForName:@"SFACollection" withTimeInterval:&__block_literal_global_4093 block:-1.0];
    }
    uint64_t v7 = v3;
    uint64_t v8 = 3221225472LL;
    uint64_t v9 = __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_4;
    uint64_t v10 = &unk_189667468;
    objc_copyWeak(&v12, &location);
    id v6 = v4;
    id v11 = v6;
    [*(id *)(a1 + 32) setTearDownMetricsHook:&v7];
    if (v6) {
      objc_msgSend(*(id *)(a1 + 40), "addMetricsHook:", v6, v7, v8, v9, v10);
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

uint64_t __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  void *a4,  uint64_t a5)
{
  id v9 = a2;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = v12;
  uint64_t v14 = 0LL;
  if (WeakRetained && v12)
  {
    if ([v12 excludedVersion])
    {
      uint64_t v14 = 1LL;
    }

    else
    {
      [v13 allowedEvents];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 objectForKeyedSubscript:v9];
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16
        && ([v16 integerValue] < 1
         || (uint64_t v17 = [v16 integerValue], v17 <= arc4random_uniform(0x64u))))
      {
        uint64_t v14 = [v13 match:v9 eventClass:a3 attributes:v10 bucket:a5 logger:WeakRetained];
      }

      else
      {
        uint64_t v14 = 1LL;
      }
    }
  }

  return v14;
}

void __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeMetricsHook:*(void *)(a1 + 32)];
}

void *__42__SFAnalyticsCollection_setupMetricsHook___block_invoke_3()
{
  return &unk_18969C1C8;
}

+ (id)parseVersion:(id)a3 platform:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___SECSFAVersion);
  if (([v6 isEqual:@"macOS"] & 1) != 0
    || ([v6 isEqual:@"Mac OS X"] & 1) != 0)
  {
    uint64_t v8 = 1LL;
  }

  else if ([v6 isEqual:@"iPhone OS"])
  {
    uint64_t v8 = 2LL;
  }

  else if ([v6 isEqual:@"Apple TVOS"])
  {
    uint64_t v8 = 5LL;
  }

  else if ([v6 isEqual:@"xrOS"])
  {
    uint64_t v8 = 3LL;
  }

  else
  {
    if (![v6 isEqual:@"Watch OS"])
    {
      id v13 = 0LL;
      goto LABEL_11;
    }

    uint64_t v8 = 4LL;
  }

  -[SECSFAVersion setProductName:](v7, "setProductName:", v8);
  uint64_t v24 = 0LL;
  [MEMORY[0x189607A00] regularExpressionWithPattern:@"^(\\d+)([A-Z])(\\d+)" options:0 error:&v24];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  if (v10 && [v10 count] == 1)
  {
    [v11 objectAtIndex:0];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = 0LL;
    if ([v12 numberOfRanges] == 4)
    {
      uint64_t v14 = [v12 rangeAtIndex:1];
      objc_msgSend(v5, "substringWithRange:", v14, v15);
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SECSFAVersion setMajor:](v7, "setMajor:", (int)[v16 intValue]);

      uint64_t v17 = [v12 rangeAtIndex:2];
      objc_msgSend(v5, "substringWithRange:", v17, v18);
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SECSFAVersion setMinor:](v7, "setMinor:", [v19 characterAtIndex:0] - 64);

      uint64_t v20 = [v12 rangeAtIndex:3];
      objc_msgSend(v5, "substringWithRange:", v20, v21);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SECSFAVersion setBuild:](v7, "setBuild:", (int)[v22 intValue]);

      id v13 = v7;
    }
  }

  else
  {
    id v13 = 0LL;
  }

LABEL_11:
  return v13;
}

@end