@interface PPSSQLMetadataStore
+ (BOOL)performQuery:(id)a3 conn:(sqlite3 *)a4;
+ (id)performReadQuery:(id)a3 conn:(sqlite3 *)a4;
+ (id)queryMetadataForFKID:(int64_t)a3 conn:(sqlite3 *)a4;
+ (id)queryMetadataForFKID:(int64_t)a3 name:(id)a4 conn:(sqlite3 *)a5;
+ (id)queryMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5;
+ (id)queryMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6;
+ (id)querySubsystemsForFilepath:(id)a3;
+ (int64_t)queryIDForSubsystem:(id)a3 category:(id)a4 conn:(sqlite3 *)a5;
+ (sqlite3)openReadConnection:(id)a3;
@end

@implementation PPSSQLMetadataStore

+ (id)queryMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5 name:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = +[PPSSQLMetadataStore openReadConnection:](&OBJC_CLASS___PPSSQLMetadataStore, "openReadConnection:", a3);
  int64_t v13 = +[PPSSQLMetadataStore queryIDForSubsystem:category:conn:]( &OBJC_CLASS___PPSSQLMetadataStore,  "queryIDForSubsystem:category:conn:",  v11,  v10,  v12);
  v14 = +[PPSSQLMetadataStore queryMetadataForFKID:name:conn:]( &OBJC_CLASS___PPSSQLMetadataStore,  "queryMetadataForFKID:name:conn:",  v13,  v9,  v12);
  sqlite3_close(v12);
  return v14;
}

+ (id)querySubsystemsForFilepath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v4 = +[PPSSQLMetadataStore openReadConnection:](&OBJC_CLASS___PPSSQLMetadataStore, "openReadConnection:", a3);
  [a1 performReadQuery:@"SELECT DISTINCT subsystem FROM PLCoreStorage_Metadata;" conn:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_close(v4);
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * v11),  "objectForKeyedSubscript:",  @"subsystem",  (void)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12) {
          [v6 addObject:v12];
        }

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  return v6;
}

+ (id)queryMetadataHistoryForFilepath:(id)a3 subsystem:(id)a4 category:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = +[PPSSQLMetadataStore openReadConnection:](&OBJC_CLASS___PPSSQLMetadataStore, "openReadConnection:", a3);
  int64_t v10 = +[PPSSQLMetadataStore queryIDForSubsystem:category:conn:]( &OBJC_CLASS___PPSSQLMetadataStore,  "queryIDForSubsystem:category:conn:",  v8,  v7,  v9);

  +[PPSSQLMetadataStore queryMetadataForFKID:conn:]( &OBJC_CLASS___PPSSQLMetadataStore,  "queryMetadataForFKID:conn:",  v10,  v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_close(v9);
  return v11;
}

+ (int64_t)queryIDForSubsystem:(id)a3 category:(id)a4 conn:(sqlite3 *)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = v9;
  int64_t v11 = -1LL;
  if (v8 && v9 && a5)
  {
    [NSString stringWithFormat:@"SELECT ID FROM PLCoreStorage_Metadata WHERE subsystem='%@' AND category='%@'", v8, v9];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 performReadQuery:v12 conn:a5];
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v13 count] == 1)
    {
      [v13 firstObject];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 objectForKeyedSubscript:@"ID"];
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t v11 = [v15 longValue];
    }

    else
    {
      PPSSQLStoreLog();
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v8;
        __int16 v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_188807000, v16, OS_LOG_TYPE_INFO, "ID not found for subsystem: %@ category: %@", buf, 0x16u);
      }

      int64_t v11 = -1LL;
    }
  }

  return v11;
}

+ (id)queryMetadataForFKID:(int64_t)a3 name:(id)a4 conn:(sqlite3 *)a5
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = v8;
  int64_t v10 = 0LL;
  if ((a3 & 0x8000000000000000LL) == 0 && v8 && a5)
  {
    [NSString stringWithFormat:@"SELECT build, metadata FROM PLCoreStorage_Metadata_Dynamic WHERE FK_ID=%lu AND name='%@'", a3, v8];
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 performReadQuery:v11 conn:a5];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v12 count])
    {
      objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
      int64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        v25 = v12;
        v26 = v11;
        v27 = v9;
        uint64_t v16 = *(void *)v29;
        do
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            [v18 objectForKeyedSubscript:@"build"];
            id v19 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v20 = [v18 objectForKeyedSubscript:@"metadata"];
            v21 = (void *)v20;
            if (v19) {
              BOOL v22 = v20 == 0;
            }
            else {
              BOOL v22 = 1;
            }
            if (!v22)
            {
              v32 = v19;
              uint64_t v33 = v20;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              [v10 addObject:v23];
            }
          }

          uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }

        while (v15);
        int64_t v11 = v26;
        id v9 = v27;
        v12 = v25;
      }
    }

    else
    {
      PPSSQLStoreLog();
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        int64_t v36 = a3;
        __int16 v37 = 2112;
        v38 = v9;
        _os_log_impl( &dword_188807000,  (os_log_t)v13,  OS_LOG_TYPE_INFO,  "Metadata not found for FKID: %lu name: %@",  buf,  0x16u);
      }

      int64_t v10 = 0LL;
    }
  }

  return v10;
}

+ (id)queryMetadataForFKID:(int64_t)a3 conn:(sqlite3 *)a4
{
  v4 = 0LL;
  uint64_t v47 = *MEMORY[0x1895F89C0];
  if ((a3 & 0x8000000000000000LL) == 0 && a4)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"SELECT name, build, metadata FROM PLCoreStorage_Metadata_Dynamic WHERE FK_ID=%lu",  a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 performReadQuery:v8 conn:a4];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v9 count])
    {
      v4 = (void *)objc_opt_new();
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      obj = v9;
      uint64_t v10 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v44,  16LL);
      if (v10)
      {
        uint64_t v11 = v10;
        v34 = v8;
        v35 = v4;
        uint64_t v33 = v9;
        uint64_t v12 = *(void *)v39;
        id v13 = @"name";
        uint64_t v14 = @"build";
        uint64_t v15 = obj;
        do
        {
          uint64_t v16 = 0LL;
          uint64_t v37 = v11;
          do
          {
            if (*(void *)v39 != v12) {
              objc_enumerationMutation(v15);
            }
            __int128 v17 = *(void **)(*((void *)&v38 + 1) + 8 * v16);
            [v17 objectForKeyedSubscript:v13];
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            [v17 objectForKeyedSubscript:v14];
            id v19 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v20 = [v17 objectForKeyedSubscript:@"metadata"];
            v21 = (void *)v20;
            if (v18) {
              BOOL v22 = v19 == 0LL;
            }
            else {
              BOOL v22 = 1;
            }
            if (!v22 && v20 != 0)
            {
              uint64_t v24 = v12;
              v25 = v14;
              v26 = v13;
              [v35 objectForKeyedSubscript:v18];
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v27)
              {
                objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[os_log_s count](v15, "count"));
                __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
                [v35 setObject:v28 forKeyedSubscript:v18];
              }

              [v35 objectForKeyedSubscript:v18];
              __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = v19;
              v43 = v21;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
              __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
              [v29 addObject:v30];

              uint64_t v15 = obj;
              id v13 = v26;
              uint64_t v14 = v25;
              uint64_t v12 = v24;
              uint64_t v11 = v37;
            }

            ++v16;
          }

          while (v11 != v16);
          uint64_t v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v38,  v44,  16LL);
        }

        while (v11);
        id v9 = v33;
        id v8 = v34;
        v4 = v35;
      }
    }

    else
    {
      PPSSQLStoreLog();
      __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      obj = v31;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v46 = a3;
        _os_log_impl(&dword_188807000, v31, OS_LOG_TYPE_INFO, "Metadata not found for FKID: %lu", buf, 0xCu);
      }

      v4 = 0LL;
    }
  }

  return v4;
}

+ (sqlite3)openReadConnection:(id)a3
{
  id v4 = a3;
  if (sqlite3_open_v2((const char *)[v4 UTF8String], &ppDb, 3145729, 0))
  {
    PPSSQLStoreLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSSQLMetadataStore openReadConnection:].cold.2((uint64_t)v4, &ppDb, v5);
    }
LABEL_8:

    sqlite3_close(ppDb);
    v6 = 0LL;
    goto LABEL_9;
  }

  if (([a1 performQuery:@"PRAGMA cache_size=50" conn:ppDb] & 1) == 0)
  {
    PPSSQLStoreLog();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PPSSQLMetadataStore openReadConnection:].cold.1(v5, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_8;
  }

  v6 = ppDb;
LABEL_9:

  return v6;
}

+ (BOOL)performQuery:(id)a3 conn:(sqlite3 *)a4
{
  errmsg = 0LL;
  id v5 = a3;
  int v6 = sqlite3_exec(a4, (const char *)[v5 UTF8String], 0, 0, &errmsg);
  if (v6)
  {
    PPSSQLStoreLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PPSSQLMetadataStore performQuery:conn:].cold.1((uint64_t)v5, (uint64_t *)&errmsg, v7);
    }

    sqlite3_free(errmsg);
  }

  return v6 == 0;
}

+ (id)performReadQuery:(id)a3 conn:(sqlite3 *)a4
{
  ppStmt = 0LL;
  id v5 = a3;
  if (sqlite3_prepare_v2(a4, (const char *)[v5 UTF8String], -1, &ppStmt, 0))
  {
    PPSSQLStoreLog();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[PPSSQLMetadataStore performReadQuery:conn:].cold.1((uint64_t)v5, v6);
    }
  }

  performStatement(ppStmt);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_finalize(ppStmt);

  return v7;
}

+ (void)openReadConnection:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)openReadConnection:(os_log_s *)a3 .cold.2(uint64_t a1, sqlite3 **a2, os_log_s *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = sqlite3_errmsg(*a2);
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  uint64_t v10 = v5;
  OUTLINED_FUNCTION_1_0(&dword_188807000, a3, v6, "Failed to create connection to db %@ - %s", (uint8_t *)&v7);
}

+ (void)performQuery:(os_log_s *)a3 conn:.cold.1(uint64_t a1, uint64_t *a2, os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_1_0(&dword_188807000, a3, (uint64_t)a3, "Failed to execute query %@ - %s", (uint8_t *)&v4);
}

+ (void)performReadQuery:(uint64_t)a1 conn:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_188807000,  a2,  OS_LOG_TYPE_ERROR,  "Failed to prepare statement for query: %@",  (uint8_t *)&v2,  0xCu);
}

@end