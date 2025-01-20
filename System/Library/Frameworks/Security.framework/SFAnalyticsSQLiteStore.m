@interface SFAnalyticsSQLiteStore
+ (SFAnalyticsSQLiteStore)storeWithPath:(id)a3 schema:(id)a4;
- (BOOL)tryToOpenDatabase;
- (NSArray)allEvents;
- (NSArray)hardFailures;
- (NSArray)rockwells;
- (NSArray)samples;
- (NSArray)softFailures;
- (NSDate)uploadDate;
- (NSString)metricsAccountID;
- (id)summaryCounts;
- (int64_t)hardFailureCountForEventType:(id)a3;
- (int64_t)softFailureCountForEventType:(id)a3;
- (int64_t)successCountForEventType:(id)a3;
- (void)addEventDict:(id)a3 toTable:(id)a4;
- (void)addEventDict:(id)a3 toTable:(id)a4 timestampBucket:(unsigned int)a5;
- (void)addRockwellDict:(id)a3 userinfo:(id)a4 toTable:(id)a5 timestampBucket:(unsigned int)a6;
- (void)addSample:(id)a3 forName:(id)a4;
- (void)clearAllData;
- (void)dealloc;
- (void)incrementHardFailureCountForEventType:(id)a3;
- (void)incrementSoftFailureCountForEventType:(id)a3;
- (void)incrementSuccessCountForEventType:(id)a3;
- (void)removeAllSamplesForName:(id)a3;
- (void)setMetricsAccountID:(id)a3;
- (void)setUploadDate:(id)a3;
@end

@implementation SFAnalyticsSQLiteStore

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SFAnalyticsSQLiteStore;
  -[SFSQLite dealloc](&v3, sel_dealloc);
}

- (BOOL)tryToOpenDatabase
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!-[SFSQLite isOpen](self, "isOpen"))
  {
    id v10 = 0LL;
    BOOL v3 = -[SFSQLite openWithError:](self, "openWithError:", &v10);
    id v4 = v10;
    if (v3)
    {
      secLogObjForScope("SFAnalytics");
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v6 = "successfully opened analytics db";
        v7 = v5;
        uint32_t v8 = 2;
LABEL_8:
        _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }

    else
    {
      secLogObjForScope("SecError");
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v4;
        v6 = "SFAnalytics: failed to open analytics db: %@";
        v7 = v5;
        uint32_t v8 = 12;
        goto LABEL_8;
      }
    }

    return v3;
  }

  return 1;
}

- (int64_t)successCountForEventType:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v13[0] = @"success_count";
    [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v4;
    [MEMORY[0x189603F18] arrayWithObjects:&v12 count:1];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SFSQLite select:from:where:bindings:]( self,  "select:from:where:bindings:",  v5,  @"success_count",  @"event_type = ?",  v6);
    [v7 firstObject];
    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 valueForKey:@"success_count"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v10 = [v9 integerValue];
  }

  else
  {
    int64_t v10 = 0LL;
  }

  return v10;
}

- (void)incrementSuccessCountForEventType:(id)a3
{
  v13[4] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    int64_t v5 = -[SFAnalyticsSQLiteStore successCountForEventType:](self, "successCountForEventType:", v4);
    int64_t v6 = -[SFAnalyticsSQLiteStore hardFailureCountForEventType:](self, "hardFailureCountForEventType:", v4);
    int64_t v7 = -[SFAnalyticsSQLiteStore softFailureCountForEventType:](self, "softFailureCountForEventType:", v4);
    v13[0] = v4;
    v12[0] = @"event_type";
    v12[1] = @"success_count";
    [MEMORY[0x189607968] numberWithInteger:v5 + 1];
    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    v12[2] = @"hard_failure_count";
    [MEMORY[0x189607968] numberWithInteger:v6];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    void v13[2] = v9;
    v12[3] = @"soft_failure_count";
    [MEMORY[0x189607968] numberWithInteger:v7];
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v10;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:4];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", @"success_count", v11);
  }
}

- (int64_t)hardFailureCountForEventType:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v13[0] = @"hard_failure_count";
    [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v4;
    [MEMORY[0x189603F18] arrayWithObjects:&v12 count:1];
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite select:from:where:bindings:]( self,  "select:from:where:bindings:",  v5,  @"success_count",  @"event_type = ?",  v6);
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 firstObject];
    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 valueForKey:@"hard_failure_count"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v10 = [v9 integerValue];
  }

  else
  {
    int64_t v10 = 0LL;
  }

  return v10;
}

- (int64_t)softFailureCountForEventType:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v13[0] = @"soft_failure_count";
    [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
    int64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v4;
    [MEMORY[0x189603F18] arrayWithObjects:&v12 count:1];
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite select:from:where:bindings:]( self,  "select:from:where:bindings:",  v5,  @"success_count",  @"event_type = ?",  v6);
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 firstObject];
    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 valueForKey:@"soft_failure_count"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v10 = [v9 integerValue];
  }

  else
  {
    int64_t v10 = 0LL;
  }

  return v10;
}

- (void)incrementHardFailureCountForEventType:(id)a3
{
  v13[4] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    int64_t v5 = -[SFAnalyticsSQLiteStore successCountForEventType:](self, "successCountForEventType:", v4);
    int64_t v6 = -[SFAnalyticsSQLiteStore hardFailureCountForEventType:](self, "hardFailureCountForEventType:", v4);
    int64_t v7 = -[SFAnalyticsSQLiteStore softFailureCountForEventType:](self, "softFailureCountForEventType:", v4);
    v13[0] = v4;
    v12[0] = @"event_type";
    v12[1] = @"success_count";
    [MEMORY[0x189607968] numberWithInteger:v5];
    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    v12[2] = @"hard_failure_count";
    [MEMORY[0x189607968] numberWithInteger:v6 + 1];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    void v13[2] = v9;
    v12[3] = @"soft_failure_count";
    [MEMORY[0x189607968] numberWithInteger:v7];
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v10;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:4];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", @"success_count", v11);
  }
}

- (void)incrementSoftFailureCountForEventType:(id)a3
{
  v13[4] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    int64_t v5 = -[SFAnalyticsSQLiteStore successCountForEventType:](self, "successCountForEventType:", v4);
    int64_t v6 = -[SFAnalyticsSQLiteStore hardFailureCountForEventType:](self, "hardFailureCountForEventType:", v4);
    int64_t v7 = -[SFAnalyticsSQLiteStore softFailureCountForEventType:](self, "softFailureCountForEventType:", v4);
    v13[0] = v4;
    v12[0] = @"event_type";
    v12[1] = @"success_count";
    [MEMORY[0x189607968] numberWithInteger:v5];
    uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v8;
    v12[2] = @"hard_failure_count";
    [MEMORY[0x189607968] numberWithInteger:v6];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    void v13[2] = v9;
    v12[3] = @"soft_failure_count";
    [MEMORY[0x189607968] numberWithInteger:v7 + 1];
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v10;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:4];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", @"success_count", v11);
  }
}

- (id)summaryCounts
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    [MEMORY[0x189603FC8] dictionary];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    -[SFSQLite selectAllFrom:where:bindings:](self, "selectAllFrom:where:bindings:", @"success_count", 0LL, 0LL);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v4; ++i)
        {
          if (*(void *)v18 != v5) {
            objc_enumerationMutation(obj);
          }
          int64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [v7 objectForKeyedSubscript:@"event_type"];
          uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v21[0] = @"success_count";
            objc_msgSend(v7, "objectForKeyedSubscript:");
            v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            v22[0] = v9;
            v21[1] = @"hard_failure_count";
            [v7 objectForKeyedSubscript:@"hard_failure_count"];
            int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
            v22[1] = v10;
            v21[2] = @"soft_failure_count";
            [v7 objectForKeyedSubscript:@"soft_failure_count"];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v22[2] = v11;
            [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:3];
            id v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v15 setObject:v12 forKeyedSubscript:v8];
          }

          else
          {
            secLogObjForScope("SFAnalytics");
            v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl( &dword_1804F4000,  v9,  OS_LOG_TYPE_DEBUG,  "ignoring entry in success counts table without an event name",  buf,  2u);
            }
          }
        }

        uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
      }

      while (v4);
    }
  }

  else
  {
    id v15 = (id)objc_opt_new();
  }

  return v15;
}

- (NSArray)rockwells
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (!-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase")) {
    return (NSArray *)(id)objc_opt_new();
  }
  v6[0] = @"data";
  [MEMORY[0x189603F18] arrayWithObjects:v6 count:1];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:]( self,  "select:from:mapEachRow:",  v3,  @"rockwell",  &__block_literal_global_4924);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)hardFailures
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (!-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase")) {
    return (NSArray *)(id)objc_opt_new();
  }
  v6[0] = @"data";
  [MEMORY[0x189603F18] arrayWithObjects:v6 count:1];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:]( self,  "select:from:mapEachRow:",  v3,  @"hard_failures",  &__block_literal_global_35_4923);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)softFailures
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (!-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase")) {
    return (NSArray *)(id)objc_opt_new();
  }
  v6[0] = @"data";
  [MEMORY[0x189603F18] arrayWithObjects:v6 count:1];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:]( self,  "select:from:mapEachRow:",  v3,  @"soft_failures",  &__block_literal_global_36);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)allEvents
{
  v20[2] = *MEMORY[0x1895F89C0];
  if (!-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase")) {
    return (NSArray *)(id)objc_opt_new();
  }
  -[SFSQLite begin](self, "begin");
  uint64_t v3 = (void *)objc_opt_new();
  v20[0] = @"timestamp";
  v20[1] = @"data";
  [MEMORY[0x189603F18] arrayWithObjects:v20 count:2];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:]( self,  "select:from:mapEachRow:",  v4,  @"rockwell",  &__block_literal_global_38);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v3 addObjectsFromArray:v5];
  v19[0] = @"timestamp";
  v19[1] = @"data";
  [MEMORY[0x189603F18] arrayWithObjects:v19 count:2];
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:mapEachRow:]( self,  "select:from:mapEachRow:",  v6,  @"hard_failures",  &__block_literal_global_38);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v3 addObjectsFromArray:v7];
  v18[0] = @"timestamp";
  v18[1] = @"data";
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:2];
  uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SFSQLite select:from:mapEachRow:]( self,  "select:from:mapEachRow:",  v8,  @"soft_failures",  &__block_literal_global_38);
  [v3 addObjectsFromArray:v9];
  v17[0] = @"timestamp";
  v17[1] = @"data";
  [MEMORY[0x189603F18] arrayWithObjects:v17 count:2];
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SFSQLite select:from:mapEachRow:](self, "select:from:mapEachRow:", v10, @"notes", &__block_literal_global_38);
  [v3 addObjectsFromArray:v11];
  -[SFSQLite end](self, "end");
  [MEMORY[0x189607A20] sortDescriptorWithKey:@"timestamp" ascending:1];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  [MEMORY[0x189603F18] arrayWithObjects:&v16 count:1];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 sortUsingDescriptors:v13];

  [v3 valueForKey:@"record"];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

- (NSArray)samples
{
  void v6[2] = *MEMORY[0x1895F89C0];
  if (!-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase")) {
    return (NSArray *)(id)objc_opt_new();
  }
  v6[0] = @"name";
  v6[1] = @"value";
  [MEMORY[0x189603F18] arrayWithObjects:v6 count:2];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSQLite select:from:](self, "select:from:", v3, @"samples");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)addEventDict:(id)a3 toTable:(id)a4 timestampBucket:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v22[2] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    [MEMORY[0x189603F50] date];
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 timeIntervalSince1970WithBucket:v5];
    double v12 = v11;

    id v18 = 0LL;
    [MEMORY[0x1896079E8] dataWithPropertyList:v8 format:200 options:0 error:&v18];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v18;
    id v15 = v14;
    if (v14 || !v13)
    {
      if (!v14 || v13) {
        goto LABEL_10;
      }
      secLogObjForScope("SecError");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int128 v20 = v15;
        _os_log_impl(&dword_1804F4000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't serialize failure record: %@", buf, 0xCu);
      }
    }

    else
    {
      v21[0] = @"timestamp";
      [MEMORY[0x189607968] numberWithDouble:v12];
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v21[1] = @"data";
      v22[0] = v16;
      v22[1] = v13;
      [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", v9, v17);
    }

LABEL_10:
  }
}

- (void)addRockwellDict:(id)a3 userinfo:(id)a4 toTable:(id)a5 timestampBucket:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  v25[3] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    [MEMORY[0x189603F50] date];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 timeIntervalSince1970WithBucket:v6];
    double v15 = v14;

    id v21 = 0LL;
    [MEMORY[0x1896079E8] dataWithPropertyList:v11 format:200 options:0 error:&v21];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = v21;
    id v18 = v17;
    if (v17 || !v16)
    {
      if (!v17 || v16) {
        goto LABEL_10;
      }
      secLogObjForScope("SecError");
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v18;
        _os_log_impl(&dword_1804F4000, v19, OS_LOG_TYPE_DEFAULT, "Couldn't serialize failure record: %@", buf, 0xCu);
      }
    }

    else
    {
      v25[0] = v10;
      v24[0] = @"event_type";
      v24[1] = @"timestamp";
      [MEMORY[0x189607968] numberWithDouble:v15];
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v24[2] = @"data";
      v25[1] = v19;
      v25[2] = v16;
      [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:v24 count:3];
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", v12, v20);
    }

LABEL_10:
  }
}

- (void)addEventDict:(id)a3 toTable:(id)a4
{
}

- (void)addSample:(id)a3 forName:(id)a4
{
  v13[3] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    v12[0] = @"timestamp";
    id v8 = (void *)MEMORY[0x189607968];
    [MEMORY[0x189603F50] date];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 timeIntervalSince1970];
    objc_msgSend(v8, "numberWithDouble:");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = v7;
    v12[1] = @"name";
    v12[2] = @"value";
    void v13[2] = v6;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:3];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite insertOrReplaceInto:values:](self, "insertOrReplaceInto:values:", @"samples", v11);
  }
}

- (void)removeAllSamplesForName:(id)a3
{
  id v5 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    [NSString stringWithFormat:@"name == '%@'", v5];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSQLite deleteFrom:where:bindings:](self, "deleteFrom:where:bindings:", @"samples", v4, 0LL);
  }
}

- (NSDate)uploadDate
{
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    -[SFSQLite datePropertyForKey:](self, "datePropertyForKey:", @"upload_date");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return (NSDate *)v3;
}

- (void)setUploadDate:(id)a3
{
  id v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase")) {
    -[SFSQLite setDateProperty:forKey:](self, "setDateProperty:forKey:", v4, @"upload_date");
  }
}

- (NSString)metricsAccountID
{
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    -[SFSQLite propertyForKey:](self, "propertyForKey:", @"account_id");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return (NSString *)v3;
}

- (void)setMetricsAccountID:(id)a3
{
  id v4 = a3;
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    if (v4) {
      -[SFSQLite setProperty:forKey:](self, "setProperty:forKey:", v4, @"account_id");
    }
    else {
      -[SFSQLite removePropertyForKey:](self, "removePropertyForKey:", @"account_id");
    }
  }
}

- (void)clearAllData
{
  if (-[SFAnalyticsSQLiteStore tryToOpenDatabase](self, "tryToOpenDatabase"))
  {
    -[SFSQLite deleteFrom:where:bindings:]( self,  "deleteFrom:where:bindings:",  @"success_count",  @"event_type like ?",  &unk_18969C030);
    -[SFSQLite deleteFrom:where:bindings:]( self,  "deleteFrom:where:bindings:",  @"hard_failures",  @"id >= 0",  0LL);
    -[SFSQLite deleteFrom:where:bindings:]( self,  "deleteFrom:where:bindings:",  @"soft_failures",  @"id >= 0",  0LL);
    -[SFSQLite deleteFrom:where:bindings:](self, "deleteFrom:where:bindings:", @"samples", @"id >= 0", 0LL);
    -[SFSQLite deleteFrom:where:bindings:]( self,  "deleteFrom:where:bindings:",  @"rockwell",  @"event_type like ?",  &unk_18969C048);
  }

id __35__SFAnalyticsSQLiteStore_allEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = -[SFAnalyticsEvent initFromRow:](objc_alloc(&OBJC_CLASS___SFAnalyticsEvent), "initFromRow:", v2);

  return v3;
}

id __38__SFAnalyticsSQLiteStore_softFailures__block_invoke(uint64_t a1, void *a2)
{
  return deserializedRecordFromRow(a2);
}

id __38__SFAnalyticsSQLiteStore_hardFailures__block_invoke(uint64_t a1, void *a2)
{
  return deserializedRecordFromRow(a2);
}

id __35__SFAnalyticsSQLiteStore_rockwells__block_invoke(uint64_t a1, void *a2)
{
  return deserializedRecordFromRow(a2);
}

+ (SFAnalyticsSQLiteStore)storeWithPath:(id)a3 schema:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    secLogObjForScope("SecCritical");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v14 = "Cannot init db with empty path";
LABEL_14:
      _os_log_impl(&dword_1804F4000, v8, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }

@end