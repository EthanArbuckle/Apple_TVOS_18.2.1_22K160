@interface SFAnalytics
+ (BOOL)parseEventFilter:(id)a3 format:(id)a4 error:(id *)a5;
+ (BOOL)parseRules:(id)a3 format:(id)a4 error:(id *)a5;
+ (BOOL)parseVersions:(id)a3 format:(id)a4 error:(id *)a5;
+ (NSString)databasePath;
+ (id)defaultAnalyticsDatabasePath:(id)a3;
+ (id)defaultProtectedAnalyticsDatabasePath:(id)a3;
+ (id)defaultProtectedAnalyticsDatabasePath:(id)a3 uuid:(id)a4;
+ (id)encodeSFACollection:(id)a3 error:(id *)a4;
+ (id)fuzzyNumber:(id)a3;
+ (id)hwModelID;
+ (id)logger;
+ (id)parseAction:(id)a3 error:(id *)a4;
+ (id)treeOfUnderlyingErrors:(id)a3 depth:(int64_t)a4;
+ (id)underlyingErrors:(id)a3;
+ (int64_t)fuzzyDaysSinceDate:(id)a3;
+ (int64_t)fuzzyInteger:(int64_t)a3;
+ (void)addOSVersionToEvent:(id)a3;
+ (void)removeLegacyDefaultAnalyticsDatabasePath:(id)a3 usingDispatchToken:(int64_t *)a4;
- (NSMutableSet)metricsHooks;
- (SFAnalytics)init;
- (SFAnalyticsCollection)collection;
- (id)AddMultiSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5;
- (id)addMetricSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5;
- (id)coreAnalyticsKeyFilter:(id)a3;
- (id)dailyMetrics;
- (id)dataPropertyForKey:(id)a3;
- (id)database;
- (id)datePropertyForKey:(id)a3;
- (id)eventDictForEventName:(id)a3 withAttributes:(id)a4 eventClass:(int64_t)a5 timestampBucket:(double)a6;
- (id)existingMetricSamplerForName:(id)a3;
- (id)existingMultiSamplerForName:(id)a3;
- (id)logSystemMetricsForActivityNamed:(id)a3 withAction:(id)a4;
- (id)metricsAccountID;
- (id)numberPropertyForKey:(id)a3;
- (id)startLogSystemMetricsForActivityNamed:(id)a3;
- (void)addMetricsHook:(id)a3;
- (void)dailyCoreAnalyticsMetrics:(id)a3;
- (void)drainLogQueue;
- (void)incrementIntegerPropertyForKey:(id)a3;
- (void)loadCollectionConfiguration;
- (void)logEventNamed:(id)a3 class:(int64_t)a4 attributes:(id)a5;
- (void)logEventNamed:(id)a3 class:(int64_t)a4 attributes:(id)a5 timestampBucket:(unsigned int)a6;
- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4;
- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4 timestampBucket:(unsigned int)a5;
- (void)logMetric:(id)a3 withName:(id)a4;
- (void)logMetric:(id)a3 withName:(id)a4 oncePerReport:(BOOL)a5;
- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5;
- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 timestampBucket:(unsigned int)a6;
- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6;
- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6 timestampBucket:(unsigned int)a7;
- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4;
- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4 timestampBucket:(unsigned int)a5;
- (void)logSuccessForEventNamed:(id)a3;
- (void)logSuccessForEventNamed:(id)a3 timestampBucket:(unsigned int)a4;
- (void)noteEventNamed:(id)a3;
- (void)noteEventNamed:(id)a3 timestampBucket:(unsigned int)a4;
- (void)noteLaunchSequence:(id)a3;
- (void)removeMetricSamplerForName:(id)a3;
- (void)removeMetricsHook:(id)a3;
- (void)removeMultiSamplerForName:(id)a3;
- (void)removeState;
- (void)removeStateAndUnlinkFile:(BOOL)a3;
- (void)setCollection:(id)a3;
- (void)setDataProperty:(id)a3 forKey:(id)a4;
- (void)setDateProperty:(id)a3 forKey:(id)a4;
- (void)setMetricsAccountID:(id)a3;
- (void)setMetricsHooks:(id)a3;
- (void)setNumberProperty:(id)a3 forKey:(id)a4;
- (void)updateCollectionConfigurationWithData:(id)a3;
@end

@implementation SFAnalytics

+ (id)parseAction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___SECSFAAction);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v5 objectForKeyedSubscript:@"radarNumber"];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[SECSFAAction setRadarnumber:](v6, "setRadarnumber:", v7);
      [v5 objectForKeyedSubscript:@"actionType"];
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (![v8 isEqual:@"ttr"])
      {
        if ([v8 isEqual:@"abc"])
        {
          v9 = objc_alloc_init(&OBJC_CLASS___SECSFAActionAutomaticBugCapture);
          if (v7)
          {
            [v5 objectForKeyedSubscript:@"domain"];
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 objectForKeyedSubscript:@"type"];
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v5 objectForKeyedSubscript:@"subtype"];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  -[SECSFAActionAutomaticBugCapture setDomain:](v9, "setDomain:", v12);
                  -[SECSFAActionAutomaticBugCapture setType:](v9, "setType:", v13);
                  -[SECSFAActionAutomaticBugCapture setSubtype:](v9, "setSubtype:", v14);
                  -[SECSFAAction setAbc:](v6, "setAbc:", v9);

                  goto LABEL_29;
                }
              }
            }

            if (a4)
            {
              id v18 = [MEMORY[0x189607870] errorWithDomain:@"com.apple.SFAErrorDomain" code:10 description:@"abc invalid type"];
              *a4 = v18;
            }
          }
        }

        else
        {
          if ([v8 isEqual:@"drop"])
          {
            v9 = objc_alloc_init(&OBJC_CLASS___SECSFAActionDropEvent);
            [v5 objectForKeyedSubscript:@"event"];
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[SECSFAActionAutomaticBugCapture setExcludeEvent:](v9, "setExcludeEvent:", [v16 BOOLValue]);

            [v5 objectForKeyedSubscript:@"count"];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[SECSFAActionAutomaticBugCapture setExcludeCount:](v9, "setExcludeCount:", [v17 BOOLValue]);

            -[SECSFAAction setDrop:](v6, "setDrop:", v9);
            goto LABEL_29;
          }

          if (!a4)
          {
LABEL_37:
            v9 = 0LL;
            goto LABEL_38;
          }

          [NSString stringWithFormat:@"action unknown: %@", v8];
          v9 = (SECSFAActionAutomaticBugCapture *)objc_claimAutoreleasedReturnValue();
          id v19 = [MEMORY[0x189607870] errorWithDomain:@"com.apple.SFAErrorDomain" code:11 description:v9];
          *a4 = v19;
        }

+ (BOOL)parseRules:(id)a3 format:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v43 = a1;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v10 = v8;
    uint64_t v49 = [v10 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (!v49)
    {
      BOOL v33 = 1;
      goto LABEL_77;
    }

    uint64_t v50 = *(void *)v53;
    id v48 = v10;
    id v42 = v8;
    v44 = v9;
    v45 = a5;
    while (1)
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v53 != v50) {
          objc_enumerationMutation(v10);
        }
        v12 = *(void **)(*((void *)&v52 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [MEMORY[0x189607870] errorWithDomain:@"com.apple.SFAErrorDomain" code:3 description:@"rules type invalid"];
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          id v13 = v35;
          if (a5)
          {
            id v13 = v35;
            *a5 = v13;
          }

+ (BOOL)parseVersions:(id)a3 format:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___SECSFAVersionMatch);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id obj = v7;
    uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      id v28 = v8;
      id v29 = v7;
      while (2)
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [MEMORY[0x189607870] errorWithDomain:@"com.apple.SFAErrorDomain" code:3 description:@"versions type invalid"];
            id v24 = (void *)objc_claimAutoreleasedReturnValue();
            id v15 = v24;
            if (a5)
            {
              id v15 = v24;
              *a5 = v15;
            }

            goto LABEL_26;
          }

          [v14 objectForKeyedSubscript:@"version"];
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          [v14 objectForKeyedSubscript:@"platform"];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v23 = (void *)MEMORY[0x189607870];
            [NSString stringWithFormat:@"versions it string: %@", v14];
            goto LABEL_23;
          }

          uint64_t v17 = +[SFAnalyticsCollection parseVersion:platform:]( &OBJC_CLASS___SFAnalyticsCollection,  "parseVersion:platform:",  v15,  v16);
          if (!v17)
          {
            v23 = (void *)MEMORY[0x189607870];
            [NSString stringWithFormat:@"versions not parsing: %@", v14];
LABEL_23:
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v23 errorWithDomain:@"com.apple.SFAErrorDomain" code:3 description:v25];
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (a5) {
              *a5 = v26;
            }

LABEL_26:
            id v8 = v28;
            id v7 = v29;

            BOOL v21 = 0;
            goto LABEL_27;
          }

          id v18 = (void *)v17;
          -[SECSFAVersionMatch addVersions:](v9, "addVersions:", v17);
        }

        uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        id v8 = v28;
        id v7 = v29;
        if (v11) {
          continue;
        }
        break;
      }
    }

    -[SECSFAVersionMatch versions](v9, "versions");
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v19 count];

    if (v20) {
      [v8 setAllowedBuilds:v9];
    }
    BOOL v21 = 1;
LABEL_27:
  }

  else
  {
    if (a5)
    {
      id v22 = [MEMORY[0x189607870] errorWithDomain:@"com.apple.SFAErrorDomain" code:1 description:@"versions key missing"];
      *a5 = v22;
    }

    BOOL v21 = 0;
  }

  return v21;
}

+ (BOOL)parseEventFilter:(id)a3 format:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000LL;
    id v19 = __Block_byref_object_copy__807;
    uint64_t v20 = __Block_byref_object_dispose__808;
    id v21 = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __60__SFAnalytics_SFACollection__parseEventFilter_format_error___block_invoke;
    v13[3] = &unk_189665098;
    id v15 = &v16;
    id v14 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:v13];
    id v9 = (void *)v17[5];
    BOOL v10 = v9 == 0LL;
    if (a5 && v9) {
      *a5 = v9;
    }

    _Block_object_dispose(&v16, 8);
  }

  else
  {
    if (a5)
    {
      id v11 = [MEMORY[0x189607870] errorWithDomain:@"com.apple.SFAErrorDomain" code:1 description:@"events key missing"];
      *a5 = v11;
    }

    BOOL v10 = 0;
  }

  return v10;
}

+ (id)encodeSFACollection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___SECSFARules);
  if (v7)
  {
    [MEMORY[0x1896078D8] JSONObjectWithData:v6 options:0 error:a4];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v9 = 0LL;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v8 objectForKeyedSubscript:@"rules"];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && ![a1 parseRules:v10 format:v7 error:a4])
      {
        id v9 = 0LL;
      }

      else
      {
        [v8 objectForKeyedSubscript:@"versions"];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && ![a1 parseVersions:v11 format:v7 error:a4])
        {
          id v9 = 0LL;
        }

        else
        {
          [v8 objectForKeyedSubscript:@"eventFilter"];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 && ![a1 parseEventFilter:v12 format:v7 error:a4])
          {
            id v9 = 0LL;
          }

          else
          {
            -[PBCodable data](v7, "data");
            id v13 = (void *)objc_claimAutoreleasedReturnValue();
            id v14 = v13;
            if (v13)
            {
              [v13 compressedDataUsingAlgorithm:0 error:a4];
              id v9 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              id v9 = 0LL;
            }
          }
        }
      }
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

void __60__SFAnalytics_SFACollection__parseEventFilter_format_error___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v15 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = objc_alloc_init(&OBJC_CLASS___SECSFAEventFilter);
    -[SECSFAEventFilter setEvent:](v8, "setEvent:", v15);
    uint64_t v9 = [v7 integerValue];
    uint64_t v10 = 100 - v9;
    if (v9 >= 1) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 100LL;
    }
    -[SECSFAEventFilter setDropRate:](v8, "setDropRate:", v11);
    [*(id *)(a1 + 32) addEventFilter:v8];
  }

  else
  {
    uint64_t v12 = [MEMORY[0x189607870] errorWithDomain:@"com.apple.SFAErrorDomain" code:3 description:@"events type invalid"];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
}

- (void)addMetricsHook:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __30__SFAnalytics_addMetricsHook___block_invoke;
  block[3] = &unk_189665558;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)removeMetricsHook:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__SFAnalytics_removeMetricsHook___block_invoke;
  block[3] = &unk_189665558;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)loadCollectionConfiguration
{
  id obj = self;
  objc_sync_enter(obj);
  v2 = objc_alloc_init(&OBJC_CLASS___SFAnalyticsCollection);
  v3 = v2;
  if (v2)
  {
    -[SFAnalyticsCollection loadCollection:](v2, "loadCollection:", obj);
    -[SFAnalytics setCollection:](obj, "setCollection:", v3);
  }

  objc_sync_exit(obj);
}

- (void)updateCollectionConfigurationWithData:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[SFAnalytics collection](v4, "collection");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SFAnalyticsCollection);
    -[SFAnalytics setCollection:](v4, "setCollection:", v6);
  }

  -[SFAnalytics collection](v4, "collection");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 storeCollection:v8 logger:v4];

  objc_sync_exit(v4);
}

- (id)database
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  database = self->_database;
  if (!database)
  {
    [(id)objc_opt_class() databasePath];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFAnalyticsSQLiteStore storeWithPath:schema:]( &OBJC_CLASS___SFAnalyticsSQLiteStore,  "storeWithPath:schema:",  v4,  @"CREATE TABLE IF NOT EXISTS hard_failures (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_hard_failures;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_hard_failures_v2 AFTER INSERT ON hard_failures\nBEGIN\nDELETE FROM hard_failures WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS soft_failures (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_soft_failures;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_soft_failures_v2 AFTER INSERT ON soft_failures\nBEGIN\nDELETE FROM soft_failures WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS notes (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,data BLOB\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_notes;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_notes_v2 AFTER INSERT ON notes\nBEGIN\nDELETE FROM notes WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS samples (\nid INTEGER PRIMARY KEY AUTOINCREMENT,\ntimestamp REAL,\nname STRING,\nvalue REAL\n);\nDROP TRIGGER IF EXISTS maintain_ring_buffer_samples;\nCREATE TRIGGER IF NOT EXISTS maintain_ring_buffer_samples_v2 AFTER INSERT ON samples\nBEGIN\nDELETE FROM samples WHERE id <= NEW.id - 1000;\nEND;\nCREATE TABLE IF NOT EXISTS success_count (\nevent_type STRING PRIMARY KEY,\nsuccess_count INTEGER,\nhard_failure_count INTEGER,\nsoft_failure_count INTEGER\n);\nCREATE TABLE IF NOT EXISTS rockwell (\nevent_type STRING PRIMARY KEY,\ntimestamp REAL,data BLOB\n);\nDROP TABLE IF EXISTS all_events;\n");
    id v5 = (SFAnalyticsSQLiteStore *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_database;
    self->_database = v5;

    database = self->_database;
    if (!database)
    {
      secLogObjForScope("SecCritical");
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        int v11 = 138412290;
        uint64_t v12 = v9;
        _os_log_impl( &dword_1804F4000,  v7,  OS_LOG_TYPE_DEFAULT,  "Did not get a database! (Client %@)",  (uint8_t *)&v11,  0xCu);
      }

      database = self->_database;
    }
  }

  return database;
}

- (void)removeStateAndUnlinkFile:(BOOL)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __40__SFAnalytics_removeStateAndUnlinkFile___block_invoke;
  block[3] = &unk_189665580;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_sync((dispatch_queue_t)queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)removeState
{
}

- (void)setDateProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __38__SFAnalytics_setDateProperty_forKey___block_invoke;
  v11[3] = &unk_1896655A8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)datePropertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = __Block_byref_object_copy__2082;
  uint64_t v18 = __Block_byref_object_dispose__2083;
  id v19 = 0LL;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __34__SFAnalytics_datePropertyForKey___block_invoke;
  v9[3] = &unk_1896655F8;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  int v11 = &v14;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void)incrementIntegerPropertyForKey:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__SFAnalytics_incrementIntegerPropertyForKey___block_invoke;
  block[3] = &unk_1896655D0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setNumberProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __40__SFAnalytics_setNumberProperty_forKey___block_invoke;
  v11[3] = &unk_1896655A8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)numberPropertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = __Block_byref_object_copy__2082;
  uint64_t v18 = __Block_byref_object_dispose__2083;
  id v19 = 0LL;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __36__SFAnalytics_numberPropertyForKey___block_invoke;
  v9[3] = &unk_1896655F8;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  int v11 = &v14;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void)setDataProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __38__SFAnalytics_setDataProperty_forKey___block_invoke;
  v11[3] = &unk_1896655A8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)dataPropertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = __Block_byref_object_copy__2082;
  id v22 = __Block_byref_object_dispose__2083;
  id v23 = 0LL;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  uint64_t v10 = MEMORY[0x1895F87A8];
  uint64_t v11 = 3221225472LL;
  id v12 = __34__SFAnalytics_dataPropertyForKey___block_invoke;
  id v13 = &unk_1896655F8;
  objc_copyWeak(&v16, &location);
  id v15 = &v18;
  id v6 = v4;
  id v14 = v6;
  dispatch_sync((dispatch_queue_t)queue, &v10);
  if (v19[5])
  {
    id v7 = objc_alloc(MEMORY[0x189603F48]);
    id v8 = (void *)objc_msgSend(v7, "initWithBase64EncodedString:options:", v19[5], 0, v10, v11, v12, v13);
  }

  else
  {
    id v8 = 0LL;
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)metricsAccountID
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = __Block_byref_object_copy__2082;
  id v13 = __Block_byref_object_dispose__2083;
  id v14 = 0LL;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __31__SFAnalytics_metricsAccountID__block_invoke;
  block[3] = &unk_189665620;
  objc_copyWeak(&v7, &location);
  void block[4] = &v9;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)setMetricsAccountID:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__SFAnalytics_setMetricsAccountID___block_invoke;
  block[3] = &unk_1896655D0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (SFAnalytics)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SFAnalytics;
  v2 = -[SFAnalytics init](&v14, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("SFAnalytics data access queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    samplers = v2->_samplers;
    v2->_samplers = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    multisamplers = v2->_multisamplers;
    v2->_multisamplers = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x189603FE0] set];
    metricsHooks = v2->_metricsHooks;
    v2->_metricsHooks = (NSMutableSet *)v10;

    id v12 = -[SFAnalytics database](v2, "database");
  }

  return v2;
}

- (id)dailyMetrics
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy__2082;
  id v28 = __Block_byref_object_dispose__2083;
  id v29 = 0LL;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = __Block_byref_object_copy__2082;
  id v22 = __Block_byref_object_dispose__2083;
  id v23 = 0LL;
  queue = self->_queue;
  uint64_t v5 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__SFAnalytics_dailyMetrics__block_invoke;
  block[3] = &unk_1896678C0;
  void block[4] = self;
  void block[5] = &v24;
  block[6] = &v18;
  dispatch_sync((dispatch_queue_t)queue, block);
  uint64_t v6 = (void *)v25[5];
  v15[0] = v5;
  v15[1] = 3221225472LL;
  v15[2] = __27__SFAnalytics_dailyMetrics__block_invoke_2;
  v15[3] = &unk_189665668;
  id v7 = v3;
  id v16 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v15];
  uint64_t v8 = (void *)v19[5];
  v13[0] = v5;
  v13[1] = 3221225472LL;
  v13[2] = __27__SFAnalytics_dailyMetrics__block_invoke_3;
  v13[3] = &unk_189665690;
  id v9 = v7;
  id v14 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];
  uint64_t v10 = v14;
  id v11 = v9;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (id)coreAnalyticsKeyFilter:(id)a3
{
  v3 = (void *)MEMORY[0x189603FC8];
  id v4 = a3;
  [v3 dictionary];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __38__SFAnalytics_coreAnalyticsKeyFilter___block_invoke;
  v8[3] = &unk_1896656B8;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

- (void)dailyCoreAnalyticsMetrics:(id)a3
{
  id v4 = a3;
  -[SFAnalytics dailyMetrics](self, "dailyMetrics");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAnalytics coreAnalyticsKeyFilter:](self, "coreAnalyticsKeyFilter:", v6);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SecCoreAnalytics sendEvent:event:](&OBJC_CLASS___SecCoreAnalytics, "sendEvent:event:", v4, v5);
}

- (void)logSuccessForEventNamed:(id)a3 timestampBucket:(unsigned int)a4
{
}

- (void)logSuccessForEventNamed:(id)a3
{
}

- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4 timestampBucket:(unsigned int)a5
{
}

- (void)logHardFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
}

- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4 timestampBucket:(unsigned int)a5
{
}

- (void)logSoftFailureForEventNamed:(id)a3 withAttributes:(id)a4
{
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 timestampBucket:(unsigned int)a6
{
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5
{
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6 timestampBucket:(unsigned int)a7
{
  BOOL v9 = a4;
  id v20 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v11)
  {
    if (v12)
    {
      id v14 = (void *)[v12 mutableCopy];
    }

    else
    {
      [MEMORY[0x189603FC8] dictionary];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    id v15 = v14;
    [v14 objectForKeyedSubscript:@"errorChain"];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      [(id)objc_opt_class() underlyingErrors:v11];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setObject:v17 forKeyedSubscript:@"errorChain"];
    }

    [v11 domain];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v18 forKeyedSubscript:@"errorDomain"];

    objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v11, "code"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v19 forKeyedSubscript:@"errorCode"];

    if (v9) {
      -[SFAnalytics logHardFailureForEventNamed:withAttributes:]( self,  "logHardFailureForEventNamed:withAttributes:",  v20,  v15);
    }
    else {
      -[SFAnalytics logSoftFailureForEventNamed:withAttributes:]( self,  "logSoftFailureForEventNamed:withAttributes:",  v20,  v15);
    }
  }

  else
  {
    -[SFAnalytics logSuccessForEventNamed:](self, "logSuccessForEventNamed:", v20);
  }
}

- (void)logResultForEvent:(id)a3 hardFailure:(BOOL)a4 result:(id)a5 withAttributes:(id)a6
{
}

- (void)noteEventNamed:(id)a3 timestampBucket:(unsigned int)a4
{
}

- (void)noteEventNamed:(id)a3
{
}

- (void)logEventNamed:(id)a3 class:(int64_t)a4 attributes:(id)a5 timestampBucket:(unsigned int)a6
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    *(void *)buf = 0LL;
    __int128 v33 = buf;
    uint64_t v34 = 0x3032000000LL;
    v35 = __Block_byref_object_copy__2082;
    uint64_t v36 = __Block_byref_object_dispose__2083;
    id v37 = 0LL;
    queue = self->_queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke;
    block[3] = &unk_1896764A8;
    void block[4] = self;
    void block[5] = buf;
    dispatch_sync((dispatch_queue_t)queue, block);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v13 = *((id *)v33 + 5);
    int v14 = 0;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v28;
      do
      {
        uint64_t v17 = 0LL;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          v14 |= (*(uint64_t (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * v17++) + 16LL))();
        }

        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v38 count:16];
      }

      while (v15);
    }

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v18 = self->_queue;
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke_2;
    v20[3] = &unk_1896656E0;
    objc_copyWeak(v23, &location);
    v20[4] = self;
    id v21 = v10;
    id v22 = v11;
    v23[1] = (id)a4;
    unsigned int v24 = a6;
    int v25 = v14;
    dispatch_sync((dispatch_queue_t)v18, v20);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    secLogObjForScope("SecError");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_1804F4000,  v19,  OS_LOG_TYPE_DEFAULT,  "SFAnalytics: attempt to log an event with no name",  buf,  2u);
    }
  }
}

- (void)logEventNamed:(id)a3 class:(int64_t)a4 attributes:(id)a5
{
}

- (id)eventDictForEventName:(id)a3 withAttributes:(id)a4 eventClass:(int64_t)a5 timestampBucket:(double)a6
{
  if (a4)
  {
    id v10 = a3;
    id v11 = (void *)[a4 mutableCopy];
  }

  else
  {
    id v12 = (void *)MEMORY[0x189603FC8];
    id v13 = a3;
    [v12 dictionary];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  int v14 = v11;
  [v11 setObject:a3 forKeyedSubscript:@"eventType"];

  [MEMORY[0x189603F50] date];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 timeIntervalSince1970WithBucket:a6];
  double v17 = v16;

  [MEMORY[0x189607968] numberWithDouble:v17 * 1000.0];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setObject:v18 forKeyedSubscript:@"eventTime"];

  [MEMORY[0x189607968] numberWithInteger:a5];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setObject:v19 forKeyedSubscript:@"eventClass"];

  +[SFAnalytics addOSVersionToEvent:](&OBJC_CLASS___SFAnalytics, "addOSVersionToEvent:", v14);
  return v14;
}

- (id)addMetricSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (!v8)
  {
    secLogObjForScope("SecError");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      int v14 = "SFAnalytics: cannot add sampler without name";
LABEL_15:
      double v17 = v15;
      uint32_t v18 = 2;
LABEL_16:
      _os_log_impl(&dword_1804F4000, v17, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, v18);
    }

- (id)AddMultiSamplerForName:(id)a3 withTimeInterval:(double)a4 block:(id)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (!v8)
  {
    secLogObjForScope("SecError");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      int v14 = "SFAnalytics: cannot add sampler without name";
LABEL_15:
      double v17 = v15;
      uint32_t v18 = 2;
LABEL_16:
      _os_log_impl(&dword_1804F4000, v17, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, v18);
    }

- (id)existingMetricSamplerForName:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  double v17 = __Block_byref_object_copy__2082;
  uint32_t v18 = __Block_byref_object_dispose__2083;
  id v19 = 0LL;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __44__SFAnalytics_existingMetricSamplerForName___block_invoke;
  v9[3] = &unk_1896655F8;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  id v11 = &v14;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (id)existingMultiSamplerForName:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  double v17 = __Block_byref_object_copy__2082;
  uint32_t v18 = __Block_byref_object_dispose__2083;
  id v19 = 0LL;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __43__SFAnalytics_existingMultiSamplerForName___block_invoke;
  v9[3] = &unk_1896655F8;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  id v11 = &v14;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (void)removeMetricSamplerForName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    queue = self->_queue;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __42__SFAnalytics_removeMetricSamplerForName___block_invoke;
    v7[3] = &unk_1896655D0;
    objc_copyWeak(&v9, location);
    id v8 = v4;
    dispatch_async((dispatch_queue_t)queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }

  else
  {
    secLogObjForScope("SecError");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "Attempt to remove sampler without specifying samplerName",  (uint8_t *)location,  2u);
    }
  }
}

- (void)removeMultiSamplerForName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    queue = self->_queue;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __41__SFAnalytics_removeMultiSamplerForName___block_invoke;
    v7[3] = &unk_1896655D0;
    objc_copyWeak(&v9, location);
    id v8 = v4;
    dispatch_async((dispatch_queue_t)queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }

  else
  {
    secLogObjForScope("SecError");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "Attempt to remove multisampler without specifying samplerName",  (uint8_t *)location,  2u);
    }
  }
}

- (id)logSystemMetricsForActivityNamed:(id)a3 withAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v7 = -[SFAnalyticsActivityTracker initWithName:clientClass:]( objc_alloc(&OBJC_CLASS___SFAnalyticsActivityTracker),  "initWithName:clientClass:",  v5,  objc_opt_class());
    id v8 = v7;
    if (v6) {
      -[SFAnalyticsActivityTracker performAction:](v7, "performAction:", v6);
    }
  }

  else
  {
    secLogObjForScope("SecError");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1804F4000, v9, OS_LOG_TYPE_DEFAULT, "Cannot log system metrics without name", v11, 2u);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (id)startLogSystemMetricsForActivityNamed:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = -[SFAnalyticsActivityTracker initWithName:clientClass:]( objc_alloc(&OBJC_CLASS___SFAnalyticsActivityTracker),  "initWithName:clientClass:",  v3,  objc_opt_class());
    -[SFAnalyticsActivityTracker start](v4, "start");
  }

  else
  {
    secLogObjForScope("SecError");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEFAULT, "Cannot log system metrics without name", v7, 2u);
    }

    id v4 = 0LL;
  }

  return v4;
}

- (void)logMetric:(id)a3 withName:(id)a4
{
}

- (void)logMetric:(id)a3 withName:(id)a4 oncePerReport:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    queue = self->_queue;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __48__SFAnalytics_logMetric_withName_oncePerReport___block_invoke;
    v12[3] = &unk_189665730;
    objc_copyWeak(&v15, location);
    BOOL v16 = a5;
    id v13 = v9;
    id v14 = v8;
    dispatch_async((dispatch_queue_t)queue, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }

  else
  {
    secLogObjForScope("SecError");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( &dword_1804F4000,  v11,  OS_LOG_TYPE_DEFAULT,  "SFAnalytics: Need a valid result and name to log result",  (uint8_t *)location,  2u);
    }
  }
}

- (void)noteLaunchSequence:(id)a3
{
  id v8 = a3;
  [v8 metricsReport];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v5 = (void *)NSString;
    [v8 name];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 stringWithFormat:@"Launch-%@", v6];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAnalytics logEventNamed:class:attributes:timestampBucket:]( self,  "logEventNamed:class:attributes:timestampBucket:",  v7,  4LL,  v4,  0LL);
  }
}

- (void)drainLogQueue
{
}

- (NSMutableSet)metricsHooks
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setMetricsHooks:(id)a3
{
}

- (SFAnalyticsCollection)collection
{
  return (SFAnalyticsCollection *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCollection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __48__SFAnalytics_logMetric_withName_oncePerReport___block_invoke(uint64_t a1)
{
  v2 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained && (WeakRetained[40] & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      [WeakRetained database];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 removeAllSamplesForName:*(void *)(a1 + 32)];
    }

    [v6 database];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 addSample:*(void *)(a1 + 40) forName:*(void *)(a1 + 32)];
  }
}

void __41__SFAnalytics_removeMultiSamplerForName___block_invoke(uint64_t a1)
{
  v2 = (void *)os_transaction_create();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [WeakRetained[4] objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 pauseSampling];

    [WeakRetained[4] removeObjectForKey:*(void *)(a1 + 32)];
  }
}

void __42__SFAnalytics_removeMetricSamplerForName___block_invoke(uint64_t a1)
{
  v2 = (void *)os_transaction_create();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [WeakRetained[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 pauseSampling];

    [WeakRetained[3] removeObjectForKey:*(void *)(a1 + 32)];
  }
}

void __43__SFAnalytics_existingMultiSamplerForName___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = [WeakRetained[4] objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    WeakRetained = v6;
  }
}

void __44__SFAnalytics_existingMetricSamplerForName___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = [WeakRetained[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    WeakRetained = v6;
  }
}

void __61__SFAnalytics_AddMultiSamplerForName_withTimeInterval_block___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained[4] objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    secLogObjForScope("SecError");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "SFAnalytics: multisampler %@ already exists",  (uint8_t *)&v9,  0xCu);
    }
  }

  else
  {
    id v6 = -[SFAnalyticsMultiSampler initWithName:interval:block:clientClass:]( objc_alloc(&OBJC_CLASS___SFAnalyticsMultiSampler),  "initWithName:interval:block:clientClass:",  *(void *)(a1 + 32),  *(void *)(a1 + 48),  objc_opt_class(),  *(double *)(a1 + 72));
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [WeakRetained[4] setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

void __62__SFAnalytics_addMetricSamplerForName_withTimeInterval_block___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    secLogObjForScope("SecError");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v5;
      _os_log_impl( &dword_1804F4000,  v4,  OS_LOG_TYPE_DEFAULT,  "SFAnalytics: sampler %@ already exists",  (uint8_t *)&v9,  0xCu);
    }
  }

  else
  {
    id v6 = -[SFAnalyticsSampler initWithName:interval:block:clientClass:]( objc_alloc(&OBJC_CLASS___SFAnalyticsSampler),  "initWithName:interval:block:clientClass:",  *(void *)(a1 + 32),  *(void *)(a1 + 48),  objc_opt_class(),  *(double *)(a1 + 72));
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [WeakRetained[3] setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

void __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __62__SFAnalytics_logEventNamed_class_attributes_timestampBucket___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && (WeakRetained[40] & 1) == 0)
  {
    id v15 = WeakRetained;
    [WeakRetained database];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 begin];

    LODWORD(v4) = *(_DWORD *)(a1 + 72);
    [*(id *)(a1 + 32) eventDictForEventName:*(void *)(a1 + 40) withAttributes:*(void *)(a1 + 48) eventClass:*(void *)(a1 + 64) timestampBucket:(double)v4];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v15;
    switch(*(void *)(a1 + 64))
    {
      case 0LL:
        LOBYTE(v7) = *(_BYTE *)(a1 + 76);
        goto LABEL_15;
      case 1LL:
        int v8 = *(_DWORD *)(a1 + 76);
        if ((v8 & 1) == 0)
        {
          [v15 database];
          int v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v9 addEventDict:v5 toTable:@"hard_failures" timestampBucket:*(unsigned int *)(a1 + 72)];

          id v6 = v15;
          int v8 = *(_DWORD *)(a1 + 76);
        }

        if ((v8 & 2) != 0) {
          goto LABEL_20;
        }
        [v6 database];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 incrementHardFailureCountForEventType:*(void *)(a1 + 40)];
        break;
      case 2LL:
        int v11 = *(_DWORD *)(a1 + 76);
        if ((v11 & 1) == 0)
        {
          [v15 database];
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 addEventDict:v5 toTable:@"soft_failures" timestampBucket:*(unsigned int *)(a1 + 72)];

          id v6 = v15;
          int v11 = *(_DWORD *)(a1 + 76);
        }

        if ((v11 & 2) != 0) {
          goto LABEL_20;
        }
        [v6 database];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 incrementSoftFailureCountForEventType:*(void *)(a1 + 40)];
        break;
      case 3LL:
        int v7 = *(_DWORD *)(a1 + 76);
        if ((v7 & 1) == 0)
        {
          [v15 database];
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 addEventDict:v5 toTable:@"notes" timestampBucket:*(unsigned int *)(a1 + 72)];

          id v6 = v15;
          int v7 = *(_DWORD *)(a1 + 76);
        }

void __38__SFAnalytics_coreAnalyticsKeyFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [a2 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKeyedSubscript:v6];
}

void __27__SFAnalytics_dailyMetrics__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) copy];
  uint64_t v3 = *(void *)(a1[5] + 8LL);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 24) copy];
  uint64_t v6 = *(void *)(a1[6] + 8LL);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __27__SFAnalytics_dailyMetrics__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  int v4 = [v7 oncePerReport];
  uint64_t v5 = v7;
  if (v4)
  {
    [v7 sampleNow];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6) {
      [*(id *)(a1 + 32) addEntriesFromDictionary:v6];
    }

    uint64_t v5 = v7;
  }
}

void __27__SFAnalytics_dailyMetrics__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v5 oncePerReport])
  {
    [v5 sampleNow];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
}

void __35__SFAnalytics_setMetricsAccountID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained database];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setMetricsAccountID:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

void __31__SFAnalytics_metricsAccountID__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained database];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 metricsAccountID];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id WeakRetained = v7;
  }
}

void __34__SFAnalytics_dataPropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained database];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 propertyForKey:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id WeakRetained = v7;
  }
}

void __38__SFAnalytics_setDataProperty_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained database];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) base64EncodedStringWithOptions:0];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setProperty:v4 forKey:*(void *)(a1 + 40)];

    id WeakRetained = v5;
  }
}

void __36__SFAnalytics_numberPropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    [WeakRetained database];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 propertyForKey:*(void *)(a1 + 32)];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v4, "integerValue"));
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }

    id WeakRetained = v8;
  }
}

void __40__SFAnalytics_setNumberProperty_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained database];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) stringValue];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setProperty:v4 forKey:*(void *)(a1 + 40)];

    id WeakRetained = v5;
  }
}

void __46__SFAnalytics_incrementIntegerPropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    [WeakRetained database];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 propertyForKey:*(void *)(a1 + 32)];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 integerValue];

    [v8 database];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", v5 + 1);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setProperty:v7 forKey:*(void *)(a1 + 32)];

    id WeakRetained = v8;
  }
}

void __34__SFAnalytics_datePropertyForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained database];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 datePropertyForKey:*(void *)(a1 + 32)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id WeakRetained = v7;
  }
}

void __38__SFAnalytics_setDateProperty_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained database];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setDateProperty:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

void __40__SFAnalytics_removeStateAndUnlinkFile___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [WeakRetained database];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 close];

    if (*(_BYTE *)(a1 + 40))
    {
      [WeakRetained database];
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 remove];
    }

    id v4 = WeakRetained[1];
    WeakRetained[1] = 0LL;

    [WeakRetained[6] removeAllObjects];
  }
}

void __33__SFAnalytics_removeMetricsHook___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 40));
  [v3 removeObject:v2];
}

void __30__SFAnalytics_addMetricsHook___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = _Block_copy(*(const void **)(a1 + 40));
  [v3 addObject:v2];
}

+ (id)logger
{
  if ((id)objc_opt_class() == a1)
  {
    secLogObjForScope("SecError");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "attempt to instatiate abstract class SFAnalytics",  v8,  2u);
    }

    id v4 = 0LL;
  }

  else
  {
    id v3 = (objc_class *)a1;
    objc_sync_enter(v3);
    objc_getAssociatedObject(v3, "SFAnalyticsInstance");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      id v4 = objc_alloc_init(v3);
      objc_setAssociatedObject(v3, "SFAnalyticsInstance", v4, (void *)0x301);
    }

    objc_sync_exit(v3);

    id v5 = (id)[v4 database];
  }

  return v4;
}

+ (NSString)databasePath
{
  return 0LL;
}

+ (id)defaultAnalyticsDatabasePath:(id)a3
{
  id v3 = a3;
  WithPathInKeychainDirectory((uint64_t)@"Analytics", (uint64_t)&__block_literal_global_2147);
  [NSString stringWithFormat:@"Analytics/%@.db", v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  CFURLRef v5 = SecCopyURLForFileInBaseDirectory(@"Library/Keychains", (uint64_t)v4);
  -[__CFURL path](v5, "path");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)removeLegacyDefaultAnalyticsDatabasePath:(id)a3 usingDispatchToken:(int64_t *)a4
{
  id v5 = a3;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke;
  block[3] = &unk_189676638;
  id v11 = v5;
  int64_t v6 = *a4;
  id v7 = v5;
  id v9 = v7;
  if (v6 == -1)
  {
    id v8 = v7;
  }

  else
  {
    dispatch_once(a4, block);
    id v8 = v11;
  }
}

+ (id)defaultProtectedAnalyticsDatabasePath:(id)a3 uuid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x189607940] stringWithString:@"sfanalytics"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = SecCopyURLForFileInBaseDirectory(@"private/var/protected/", (uint64_t)v7);
  WithPathInDirectory(v8, (uint64_t)&__block_literal_global_94);
  if (v6)
  {
    [v7 appendString:@"/"];
    [v6 UUIDString];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 appendString:v9];

    uint64_t v10 = SecCopyURLForFileInBaseDirectory(@"private/var/protected/", (uint64_t)v7);
    WithPathInDirectory(v10, (uint64_t)&__block_literal_global_98);
  }

  [NSString stringWithFormat:@"%@/%@.db", v7, v5];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  CFURLRef v12 = SecCopyURLForFileInBaseDirectory(@"private/var/protected/", (uint64_t)v11);
  -[__CFURL path](v12, "path");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)defaultProtectedAnalyticsDatabasePath:(id)a3
{
  id v4 = a3;
  [a1 removeLegacyDefaultAnalyticsDatabasePath:v4 usingDispatchToken:&defaultProtectedAnalyticsDatabasePath__onceToken];
  +[SFAnalytics defaultProtectedAnalyticsDatabasePath:uuid:]( &OBJC_CLASS___SFAnalytics,  "defaultProtectedAnalyticsDatabasePath:uuid:",  v4,  0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)fuzzyDaysSinceDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:1483228800.0];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v3 compare:v4];

    if (v5 == -1)
    {
      int64_t v9 = 1000LL;
    }

    else
    {
      [MEMORY[0x189603F50] date];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 timeIntervalSinceDate:v3];
      double v8 = v7;

      if (v8 >= 86400.0)
      {
        if (v8 >= 604800.0)
        {
          if (v8 >= 2592000.0)
          {
            if (v8 >= 31536000.0) {
              int64_t v9 = 365LL;
            }
            else {
              int64_t v9 = 30LL;
            }
          }

          else
          {
            int64_t v9 = 7LL;
          }
        }

        else
        {
          int64_t v9 = 1LL;
        }
      }

      else
      {
        int64_t v9 = 0LL;
      }
    }
  }

  else
  {
    int64_t v9 = -1LL;
  }

  return v9;
}

+ (int64_t)fuzzyInteger:(int64_t)a3
{
  if (a3 >= 0) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = -a3;
  }
  if (!a3) {
    return 0LL;
  }
  int64_t v4 = (a3 >> 63) | 1;
  if (v3 <= 5) {
    return 5 * v4;
  }
  if (v3 % 5 >= 3) {
    unint64_t v6 = 5 * (v3 / 5) + 5;
  }
  else {
    unint64_t v6 = 5 * (v3 / 5);
  }
  return v6 * v4;
}

+ (id)fuzzyNumber:(id)a3
{
  return (id)objc_msgSend( MEMORY[0x189607968],  "numberWithInteger:",  objc_msgSend(a1, "fuzzyInteger:", objc_msgSend(a3, "integerValue")));
}

+ (id)hwModelID
{
  if (hwModelID_onceToken != -1) {
    dispatch_once(&hwModelID_onceToken, &__block_literal_global_109);
  }
  return (id)hwModelID_hwModel;
}

+ (void)addOSVersionToEvent:(id)a3
{
  id v4 = a3;
  block[1] = 3221225472LL;
  block[2] = __35__SFAnalytics_addOSVersionToEvent___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  id v5 = v4;
  block[0] = MEMORY[0x1895F87A8];
  if (addOSVersionToEvent__onceToken != -1)
  {
    dispatch_once(&addOSVersionToEvent__onceToken, block);
    id v4 = v5;
  }

  if (addOSVersionToEvent__build)
  {
    [v5 setObject:addOSVersionToEvent__build forKeyedSubscript:@"build"];
    id v4 = v5;
  }

  if (addOSVersionToEvent__product)
  {
    [v5 setObject:addOSVersionToEvent__product forKeyedSubscript:@"product"];
    id v4 = v5;
  }

  if (addOSVersionToEvent__modelID)
  {
    [v5 setObject:addOSVersionToEvent__modelID forKeyedSubscript:@"modelid"];
    id v4 = v5;
  }

  if (addOSVersionToEvent__internal)
  {
    [v5 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"internal"];
    id v4 = v5;
  }
}

+ (id)treeOfUnderlyingErrors:(id)a3 depth:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (a4 > 5) {
    goto LABEL_21;
  }
  int64_t v7 = a4 + 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = v6;
    [MEMORY[0x189603FC8] dictionary];
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      [v8 domain];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:v10 forKeyedSubscript:@"d"];

      objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v8, "code"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:v11 forKeyedSubscript:@"c"];
    }

    [v8 userInfo];
    CFURLRef v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 objectForKeyedSubscript:*MEMORY[0x189607798]];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 treeOfUnderlyingErrors:v13 depth:v7];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    [v9 setObject:v14 forKeyedSubscript:@"u"];
    [v8 userInfo];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 objectForKeyedSubscript:*MEMORY[0x189607658]];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 treeOfUnderlyingErrors:v16 depth:v7];
    double v17 = (void *)objc_claimAutoreleasedReturnValue();

    [v9 setObject:v17 forKeyedSubscript:@"m"];
    if ([v9 count]) {
      id v18 = v9;
    }
    else {
      id v18 = 0LL;
    }

    goto LABEL_26;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_21:
    id v18 = 0LL;
    goto LABEL_26;
  }

  id v19 = v6;
  [MEMORY[0x189603FA8] array];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      uint64_t v25 = 0LL;
      do
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v29 + 1) + 8 * v25);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "treeOfUnderlyingErrors:depth:", v26, v7, (void)v29);
          __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27) {
            [v20 addObject:v27];
          }
        }

        ++v25;
      }

      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v23);
  }

  if ([v20 count]) {
    id v18 = v20;
  }
  else {
    id v18 = 0LL;
  }

LABEL_26:
  return v18;
}

+ (id)underlyingErrors:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [(id)objc_opt_class() treeOfUnderlyingErrors:v3 depth:0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if ([MEMORY[0x1896078D8] isValidJSONObject:v4])
    {
      id v10 = 0LL;
      [MEMORY[0x1896078D8] dataWithJSONObject:v4 options:2 error:&v10];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      id v6 = (os_log_s *)v10;
      if (v5)
      {
        int64_t v7 = (void *)[objc_alloc(NSString) initWithData:v5 encoding:4];
      }

      else
      {
        secLogObjForScope("SecError");
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138543618;
          id v12 = v3;
          __int16 v13 = 2114;
          id v14 = v6;
          _os_log_impl( &dword_1804F4000,  v8,  OS_LOG_TYPE_DEFAULT,  "SFA: underlyingErrors failed to encode %{public}@ with failure: %{public}@",  buf,  0x16u);
        }

        int64_t v7 = 0LL;
      }
    }

    else
    {
      secLogObjForScope("SecError");
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        id v12 = v3;
        _os_log_impl( &dword_1804F4000,  v6,  OS_LOG_TYPE_DEFAULT,  "SFA: underlyingErrors encoded to not json %{public}@",  buf,  0xCu);
      }

      int64_t v7 = 0LL;
    }
  }

  else
  {
    int64_t v7 = 0LL;
  }

  return v7;
}

void __35__SFAnalytics_addOSVersionToEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    id v9 = v2;
    uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x189604B60]];
    id v4 = (void *)addOSVersionToEvent__build;
    addOSVersionToEvent__build = v3;

    uint64_t v5 = [v9 objectForKeyedSubscript:*MEMORY[0x189604B68]];
    id v6 = (void *)addOSVersionToEvent__product;
    addOSVersionToEvent__product = v5;

    addOSVersionToEvent__internal = os_variant_has_internal_diagnostics();
    uint64_t v7 = [*(id *)(a1 + 32) hwModelID];
    id v8 = (void *)addOSVersionToEvent__modelID;
    addOSVersionToEvent__modelID = v7;

    uint64_t v2 = v9;
  }
}

void __24__SFAnalytics_hwModelID__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  memset(&__b, 170, sizeof(__b));
  uname(&__b);
  uint64_t v0 = [NSString stringWithCString:__b.machine encoding:4];
  v1 = (void *)hwModelID_hwModel;
  hwModelID_hwModel = v0;
}

uint64_t __58__SFAnalytics_defaultProtectedAnalyticsDatabasePath_uuid___block_invoke_97(int a1, char *path)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int v3 = mkpath_np(path, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      secLogObjForScope("SecError");
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        id v8 = path;
        __int16 v9 = 2080;
        id v10 = strerror(v4);
        _os_log_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v7, 0x16u);
      }
    }
  }

  return chmod(path, 0x1FFu);
}

uint64_t __58__SFAnalytics_defaultProtectedAnalyticsDatabasePath_uuid___block_invoke(int a1, char *path)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int v3 = mkpath_np(path, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      secLogObjForScope("SecError");
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        id v8 = path;
        __int16 v9 = 2080;
        id v10 = strerror(v4);
        _os_log_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v7, 0x16u);
      }
    }
  }

  return chmod(path, 0x1FFu);
}

void __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  WithPathInKeychainDirectory((uint64_t)v2, (uint64_t)&__block_literal_global_82);
  [NSString stringWithFormat:@"Analytics/%@.db-shm", *(void *)(a1 + 32)];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();

  WithPathInKeychainDirectory((uint64_t)v3, (uint64_t)&__block_literal_global_85);
  [NSString stringWithFormat:@"Analytics/%@.db-wal", *(void *)(a1 + 32)];
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  WithPathInKeychainDirectory((uint64_t)v4, (uint64_t)&__block_literal_global_88);
  WithPathInKeychainDirectory((uint64_t)@"Analytics", (uint64_t)&__block_literal_global_89);
}

uint64_t __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_5( int a1,  char *a2)
{
  return remove(a2);
}

uint64_t __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_4( int a1,  char *a2)
{
  return remove(a2);
}

uint64_t __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_3( int a1,  char *a2)
{
  return remove(a2);
}

uint64_t __75__SFAnalytics_removeLegacyDefaultAnalyticsDatabasePath_usingDispatchToken___block_invoke_2( int a1,  char *a2)
{
  return remove(a2);
}

uint64_t __44__SFAnalytics_defaultAnalyticsDatabasePath___block_invoke(int a1, char *path)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int v3 = mkpath_np(path, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      secLogObjForScope("SecError");
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        id v8 = path;
        __int16 v9 = 2080;
        id v10 = strerror(v4);
        _os_log_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v7, 0x16u);
      }
    }
  }

  return chmod(path, 0x1FFu);
}

@end