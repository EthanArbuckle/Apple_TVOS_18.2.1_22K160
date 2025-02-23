@interface NSHTTPAlternativeServicesStorage
@end

@implementation NSHTTPAlternativeServicesStorage

void __66___NSHTTPAlternativeServicesStorage_HTTPServiceEntriesWithFilter___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (-[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:]( *(void *)(a1 + 32),  1))
  {
    id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
    [*(id *)(a1 + 40) host];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
    }

    else if (![*(id *)(a1 + 40) port])
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v18 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v27) = 0;
        _os_log_debug_impl( &dword_18298D000,  v18,  OS_LOG_TYPE_DEBUG,  "Query with empty filter. Returning all entries from the database",  (uint8_t *)&v27,  2u);
      }

      uint64_t v19 = *(void *)(a1 + 32);
      if (!*(void *)(v19 + 64))
      {
        int v22 = sqlite3_prepare_v2( *(sqlite3 **)(v19 + 48),  "SELECT * from alt_services where expires_time > strftime('%s','now')",  -1,  (sqlite3_stmt **)(v19 + 64),  0LL);
        if (v22)
        {
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
          }
          v10 = (os_log_s *)(id)CFNLog::logger;
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          int v27 = 67109120;
          LODWORD(v28) = v22;
          v12 = "Failed to get all entries from the alt_services storage. Error = %d";
          v13 = v10;
          uint32_t v14 = 8;
          goto LABEL_34;
        }

        uint64_t v19 = *(void *)(a1 + 32);
      }

      v20 = (sqlite3_stmt **)(v19 + 64);
      goto LABEL_41;
    }

    uint64_t v4 = *(void *)(a1 + 32);
    v7 = *(sqlite3_stmt **)(v4 + 72);
    v5 = (sqlite3_stmt **)(v4 + 72);
    v6 = v7;
    if (!v7)
    {
      if (sqlite3_prepare_v2( *(sqlite3 **)(*(void *)(a1 + 32) + 48LL),  "SELECT * from alt_services WHERE host = ? AND partition = ? AND port = ? AND expires_time > strftime('%s','now')",  -1,  v5,  0LL))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        v10 = (os_log_s *)(id)CFNLog::logger;
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          goto LABEL_46;
        }
        LOWORD(v27) = 0;
        v12 = "Failed to init the selectEntriesStmt statement for alt_services";
        v13 = v10;
        uint32_t v14 = 2;
        goto LABEL_34;
      }

      v6 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 72LL);
    }

    id v8 = [*(id *)(a1 + 40) host];
    int v9 = sqlite3_bind_text(v6, 1, (const char *)[v8 UTF8String], -1, 0);

    if (v9)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v10 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 72LL);
      int v27 = 138412290;
      uint64_t v28 = v11;
      v12 = "Failed to bind host (%@) to the select statement";
      goto LABEL_33;
    }

    v15 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 72LL);
    id v16 = [*(id *)(a1 + 40) partition];
    LODWORD(v15) = sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, 0);

    if ((_DWORD)v15)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v10 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 72LL);
      int v27 = 138412290;
      uint64_t v28 = v17;
      v12 = "Failed to bind partition (%@) to the select statement";
      goto LABEL_33;
    }

    if (sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 3, [*(id *)(a1 + 40) port]))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      v10 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 72LL);
      int v27 = 138412290;
      uint64_t v28 = v21;
      v12 = "Failed to bind port name (%@) to the select statement";
LABEL_33:
      v13 = v10;
      uint32_t v14 = 12;
LABEL_34:
      _os_log_error_impl(&dword_18298D000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v27, v14);
LABEL_46:

      return;
    }

    v20 = (sqlite3_stmt **)(*(void *)(a1 + 32) + 72LL);
LABEL_41:
    v23 = *v20;
    if (*v20)
    {
      while (sqlite3_step(v23) == 100)
      {
        v24 = -[_NSHTTPAlternativeServicesStorage _onqueue_convertSqlRowToHTTPAlternativeServiceEntry:]( *(void *)(a1 + 32),  v23);
        [v2 addObject:v24];
      }

      sqlite3_reset(v23);
    }

    uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v26 = v2;
    v10 = *(os_log_s **)(v25 + 40);
    *(void *)(v25 + 40) = v26;
    goto LABEL_46;
  }

uint64_t __89___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesCreatedAfterDate___block_invoke( uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t result = -[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(void *)(a1 + 32), 1);
  if ((_DWORD)result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(_BYTE *)(v3 + 26))
    {
      __retainStorageAssertion(*(void **)(v3 + 16));
      uint64_t v3 = *(void *)(a1 + 32);
    }

    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    uint32_t v14 = __89___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesCreatedAfterDate___block_invoke_2;
    v15 = &unk_189C1A548;
    uint64_t v16 = v3;
    if (*(void *)(v3 + 96)
      || !sqlite3_prepare_v2( *(sqlite3 **)(v3 + 48),  "DELETE FROM alt_services WHERE creation_time > ?",  -1,  (sqlite3_stmt **)(v3 + 96),  0LL))
    {
      uint64_t v4 = *(void **)(a1 + 40);
      if (v4)
      {
        [v4 timeIntervalSince1970];
        sqlite3_int64 v6 = vcvtmd_u64_f64(v5);
      }

      else
      {
        sqlite3_int64 v6 = 0x8000000000000000LL;
      }

      if (!sqlite3_bind_int64(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96LL), 1, v6))
      {
        int v11 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96LL));
        sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96LL));
        if (v11 == 101) {
          return ((uint64_t (*)(void *))v14)(v13);
        }
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        id v7 = (id)CFNLog::logger;
        if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
        {
LABEL_24:

          return ((uint64_t (*)(void *))v14)(v13);
        }

        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v12;
        id v8 = "Failed to delete alt_service entries before date %@";
        int v9 = (os_log_s *)v7;
        uint32_t v10 = 12;
LABEL_19:
        _os_log_error_impl(&dword_18298D000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        goto LABEL_24;
      }

      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      id v7 = (id)CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      id v8 = "Failed to bind date to the delte statement";
    }

    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      id v7 = (id)CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      id v8 = "Failed to init the deleteStmt statement for alt_services";
    }

    int v9 = (os_log_s *)v7;
    uint32_t v10 = 2;
    goto LABEL_19;
  }

  return result;
}

void __89___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesCreatedAfterDate___block_invoke_2( double a1,  uint64_t a2)
{
  if (!*(_BYTE *)(*(void *)(a2 + 32) + 26LL)) {
    __releaseStorageAssertion(a1);
  }
}

uint64_t __75___NSHTTPAlternativeServicesStorage__onqueue_initializeDatabaseIfNotEmpty___block_invoke( uint64_t a1)
{
  return -[_NSHTTPAlternativeServicesStorage _onqueue_garbageCollect](*(void *)(a1 + 32));
}

void __60___NSHTTPAlternativeServicesStorage__onqueue_garbageCollect__block_invoke(double a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(void *)(a2 + 32) + 26LL)) {
    __releaseStorageAssertion(a1);
  }
}

void __60___NSHTTPAlternativeServicesStorage__createDBSchemaForPath___block_invoke(double a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(void *)(a2 + 32) + 26LL)) {
    __releaseStorageAssertion(a1);
  }
}

uint64_t __94___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithRegistrableDomain___block_invoke( uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t result = -[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(void *)(a1 + 32), 1);
  if ((_DWORD)result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(_BYTE *)(v3 + 26))
    {
      __retainStorageAssertion(*(void **)(v3 + 16));
      uint64_t v3 = *(void *)(a1 + 32);
    }

    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v15 = __94___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithRegistrableDomain___block_invoke_2;
    uint64_t v16 = &unk_189C1A548;
    uint64_t v17 = v3;
    uint64_t v4 = *(sqlite3_stmt **)(v3 + 112);
    if (!v4)
    {
      if (sqlite3_prepare_v2( *(sqlite3 **)(v3 + 48),  "DELETE FROM alt_services WHERE host LIKE ('%' || ?) OR partition LIKE ('%' || ?)",  -1,  (sqlite3_stmt **)(v3 + 112),  0LL))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        id v7 = (os_log_s *)(id)CFNLog::logger;
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_WORD *)buf = 0;
        int v9 = "Failed to init the deleteStmt statement for alt_services";
        goto LABEL_15;
      }

      uint64_t v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 112LL);
    }

    int v5 = sqlite3_bind_text( v4, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    BOOL v6 = v5 != 0;
    if (v5)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      id v7 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v8;
      __int16 v20 = 1024;
      BOOL v21 = v6;
      int v9 = "Failed to bind host (%@) to the delete statement. r = %d";
      uint32_t v10 = v7;
      uint32_t v11 = 18;
      goto LABEL_21;
    }

    if (sqlite3_bind_text( *(sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 2, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      id v7 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v12;
      int v9 = "Failed to bind the partition (%@) to the delete statement";
      uint32_t v10 = v7;
      uint32_t v11 = 12;
      goto LABEL_21;
    }

    int v13 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112LL));
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112LL));
    if (v13 == 101) {
      return ((uint64_t (*)(void *))v15)(v14);
    }
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    id v7 = (os_log_s *)(id)CFNLog::logger;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      return ((uint64_t (*)(void *))v15)(v14);
    }

    *(_WORD *)buf = 0;
    int v9 = "Failed to delete alt_service entries";
LABEL_15:
    uint32_t v10 = v7;
    uint32_t v11 = 2;
LABEL_21:
    _os_log_error_impl(&dword_18298D000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    goto LABEL_27;
  }

  return result;
}

void __94___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithRegistrableDomain___block_invoke_2( double a1,  uint64_t a2)
{
  if (!*(_BYTE *)(*(void *)(a2 + 32) + 26LL)) {
    __releaseStorageAssertion(a1);
  }
}

uint64_t __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  [v3 host];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v4 isEqualToString:*(void *)(a1 + 32)])
  {

    goto LABEL_5;
  }

  uint64_t v5 = [v3 port];
  uint64_t v6 = *(void *)(a1 + 40);

  if (v5 != v6)
  {
LABEL_5:
    uint64_t v7 = 1LL;
    goto LABEL_6;
  }

  uint64_t v7 = 0LL;
LABEL_6:

  return v7;
}

uint64_t __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke_2( uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t result = -[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(void *)(a1 + 32), 1);
  if ((_DWORD)result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!*(_BYTE *)(v3 + 26))
    {
      __retainStorageAssertion(*(void **)(v3 + 16));
      uint64_t v3 = *(void *)(a1 + 32);
    }

    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    uint64_t v17 = __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke_3;
    uint64_t v18 = &unk_189C1A548;
    uint64_t v19 = v3;
    uint64_t v4 = *(sqlite3_stmt **)(v3 + 104);
    if (!v4)
    {
      if (sqlite3_prepare_v2( *(sqlite3 **)(v3 + 48),  "DELETE FROM alt_services WHERE (host = ? AND port = ?)",  -1,  (sqlite3_stmt **)(v3 + 104),  0LL))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        uint64_t v7 = (os_log_s *)(id)CFNLog::logger;
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        *(_WORD *)buf = 0;
        int v9 = "Failed to init the deleteStmt statement for alt_services";
        goto LABEL_15;
      }

      uint64_t v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 104LL);
    }

    int v5 = sqlite3_bind_text( v4, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    BOOL v6 = v5 != 0;
    if (v5)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v7 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v8;
      __int16 v22 = 1024;
      BOOL v23 = v6;
      int v9 = "Failed to bind host (%@) to the delete statement. r = %d";
      goto LABEL_21;
    }

    int v12 = sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104LL), 2, *(_DWORD *)(a1 + 48));
    BOOL v13 = v12 != 0;
    if (v12)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v7 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218240;
      uint64_t v21 = v14;
      __int16 v22 = 1024;
      BOOL v23 = v13;
      int v9 = "Failed to bind port (%lu) to the delete statement. r = %d";
LABEL_21:
      uint32_t v10 = v7;
      uint32_t v11 = 18;
      goto LABEL_22;
    }

    int v15 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104LL));
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104LL));
    if (v15 == 101) {
      return ((uint64_t (*)(void *))v17)(v16);
    }
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
    }
    uint64_t v7 = (os_log_s *)(id)CFNLog::logger;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_28:

      return ((uint64_t (*)(void *))v17)(v16);
    }

    *(_WORD *)buf = 0;
    int v9 = "Failed to delete alt_service entries";
LABEL_15:
    uint32_t v10 = v7;
    uint32_t v11 = 2;
LABEL_22:
    _os_log_error_impl(&dword_18298D000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    goto LABEL_28;
  }

  return result;
}

void __86___NSHTTPAlternativeServicesStorage_removeHTTPAlternativeServiceEntriesWithHost_port___block_invoke_3( double a1,  uint64_t a2)
{
  if (!*(_BYTE *)(*(void *)(a2 + 32) + 26LL)) {
    __releaseStorageAssertion(a1);
  }
}

uint64_t __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (v3) {
    int v5 = (void *)v3[1];
  }
  else {
    int v5 = 0LL;
  }
  id v6 = v5;
  [*(id *)(a1 + 32) host];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v6 isEqualToString:v7])
  {

LABEL_9:
    uint64_t v10 = 1LL;
    goto LABEL_10;
  }

  if (v4) {
    uint64_t v8 = v4[2];
  }
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v9 = [*(id *)(a1 + 32) port];

  if (v8 != v9) {
    goto LABEL_9;
  }
  uint64_t v10 = 0LL;
LABEL_10:

  return v10;
}

uint64_t __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_2(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  -[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(void *)(a1 + 32), 0);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 26))
  {
    __retainStorageAssertion(*(void **)(v2 + 16));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  v31[0] = MEMORY[0x1895F87A8];
  v31[1] = 3221225472LL;
  v32 = __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_3;
  v33 = &unk_189C1A548;
  uint64_t v34 = v2;
  id v3 = *(id *)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = (sqlite3_stmt **)(v2 + 88);
    int v5 = *(sqlite3_stmt **)(v2 + 88);
    if (!v5)
    {
      if (sqlite3_prepare_v2( *(sqlite3 **)(v2 + 48),  "INSERT OR REPLACE INTO alt_services(partition, host, alternateHost, port, alternatePort, type, creation_tim e, expires_time, rowid) \t\tvalues (?, ?, ?, ?, ?, ?, ?, ?, (SELECT max(rowid) FROM alt_services)+1)",  -1,  (sqlite3_stmt **)(v2 + 88),  0LL))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        uint64_t v8 = (os_log_s *)(id)CFNLog::logger;
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_53;
        }
        *(_WORD *)buf = 0;
        uint64_t v10 = "Failed to init the insert statement for alt_services";
        uint32_t v11 = v8;
        uint32_t v12 = 2;
        goto LABEL_15;
      }

      int v5 = *v4;
    }

    id v6 = [v3 partition];
    int v7 = sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, 0);

    if (v7)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v8 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        [v3 partition];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = (uint64_t)v9;
        _os_log_error_impl( &dword_18298D000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to bind partition (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_53;
    }

    BOOL v13 = *v4;
    id v14 = [v3 host];
    LODWORD(v13) = sqlite3_bind_text(v13, 2, (const char *)[v14 UTF8String], -1, 0);

    if ((_DWORD)v13)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v8 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        [v3 host];
        int v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = (uint64_t)v15;
        _os_log_error_impl( &dword_18298D000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to bind host (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_53;
    }

    uint64_t v16 = *v4;
    id v17 = [v3 alternateHost];
    LODWORD(v16) = sqlite3_bind_text(v16, 3, (const char *)[v17 UTF8String], -1, 0);

    if ((_DWORD)v16)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v8 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        [v3 alternateHost];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = (uint64_t)v18;
        _os_log_error_impl( &dword_18298D000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to bind alternateHost (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_53;
    }

    if (sqlite3_bind_int(*v4, 4, [v3 port]))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v8 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_53;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = [v3 port];
      uint64_t v10 = "Failed to bind port (%lu) to the select statement";
      goto LABEL_42;
    }

    if (sqlite3_bind_int(*v4, 5, [v3 alternatePort]))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v8 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_53;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = [v3 alternatePort];
      uint64_t v10 = "Failed to bind alternatePort (%lu) to the select statement";
      goto LABEL_42;
    }

    if (sqlite3_bind_int(*v4, 6, [v3 serviceType]))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v8 = (os_log_s *)(id)CFNLog::logger;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_53;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v36 = [v3 serviceType];
      uint64_t v10 = "Failed to bind serviceType (%lu) to the select statement";
LABEL_42:
      uint32_t v11 = v8;
      uint32_t v12 = 12;
LABEL_15:
      _os_log_error_impl(&dword_18298D000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
LABEL_53:

      goto LABEL_54;
    }

    [MEMORY[0x189603F50] date];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 timeIntervalSince1970];
    sqlite3_int64 v21 = vcvtmd_u64_f64(v20);

    if (sqlite3_bind_int64(*v4, 7, v21))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v8 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        [MEMORY[0x189603F50] date];
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = (uint64_t)v22;
        _os_log_error_impl( &dword_18298D000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to bind creationDate (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_53;
    }

    [v3 expirationDate];
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 timeIntervalSince1970];
    sqlite3_int64 v25 = vcvtmd_u64_f64(v24);

    if (sqlite3_bind_int64(*v4, 8, v25))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      uint64_t v8 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        [v3 expirationDate];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = (uint64_t)v28;
        _os_log_error_impl( &dword_18298D000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to bind expiryDate (%@) to the select statement",  buf,  0xCu);
      }

      goto LABEL_53;
    }

    if (sqlite3_step(*v4) != 101)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      int v27 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        [v3 host];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = sqlite3_errmsg(*(sqlite3 **)(v2 + 48));
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = (uint64_t)v29;
        __int16 v37 = 2080;
        v38 = v30;
        _os_log_error_impl( &dword_18298D000,  v27,  OS_LOG_TYPE_ERROR,  "Failed to insert alt_service entry %@ into db. Error= %s",  buf,  0x16u);
      }
    }

    sqlite3_reset(*v4);
  }

uint64_t __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_4(uint64_t a1)
{
  uint64_t result = -[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:](*(void *)(a1 + 32), 1);
  if ((_DWORD)result) {
    return -[_NSHTTPAlternativeServicesStorage _onqueue_garbageCollect](*(void *)(a1 + 32));
  }
  return result;
}

void __59___NSHTTPAlternativeServicesStorage_storeHTTPServiceEntry___block_invoke_3(double a1, uint64_t a2)
{
  if (!*(_BYTE *)(*(void *)(a2 + 32) + 26LL)) {
    __releaseStorageAssertion(a1);
  }
}

void __44___NSHTTPAlternativeServicesStorage_entries__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(sqlite3_stmt **)(v2 + 56);
  if (v3)
  {
LABEL_11:
    while (sqlite3_step(v3) == 100)
    {
      int v5 = *(void **)(a1 + 40);
      -[_NSHTTPAlternativeServicesStorage _onqueue_convertSqlRowToHTTPAlternativeServiceEntry:]( *(void *)(a1 + 32),  *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56LL));
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 addObject:v6];

      id v3 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56LL);
    }

    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56LL));
    return;
  }

  if (!sqlite3_prepare_v2(*(sqlite3 **)(v2 + 48), "SELECT * from alt_services;", -1, (sqlite3_stmt **)(v2 + 56), 0LL))
  {
    id v3 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56LL);
    if (!v3) {
      return;
    }
    goto LABEL_11;
  }

  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  uint64_t v4 = (os_log_s *)(id)CFNLog::logger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v7 = 0;
    _os_log_error_impl( &dword_18298D000,  v4,  OS_LOG_TYPE_ERROR,  "Failed to init the selectAllEntriesStmt statement for alt_services",  v7,  2u);
  }
}

void __77___NSHTTPAlternativeServicesStorage_HTTPServiceEntriesWithRegistrableDomain___block_invoke( uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (-[_NSHTTPAlternativeServicesStorage _onqueue_initializeDatabaseIfNotEmpty:]( *(void *)(a1 + 32),  1))
  {
    id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v3 = *(void *)(a1 + 32);
    id v6 = *(sqlite3_stmt **)(v3 + 80);
    uint64_t v4 = (sqlite3_stmt **)(v3 + 80);
    int v5 = v6;
    if (!v6)
    {
      if (sqlite3_prepare_v2( *(sqlite3 **)(*(void *)(a1 + 32) + 48LL),  "SELECT * from alt_services WHERE host LIKE ('%' || ?) OR partition LIKE ('%' || ?)",  -1,  v4,  0LL))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
        }
        uint64_t v8 = (os_log_s *)(id)CFNLog::logger;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v14) = 0;
          _os_log_error_impl( &dword_18298D000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to init the selectEntriesStmt statement for alt_services",  (uint8_t *)&v14,  2u);
        }

        goto LABEL_24;
      }

      int v5 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 80LL);
    }

    if (sqlite3_bind_text( v5, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0))
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      int v7 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 80LL);
        int v14 = 138412290;
        uint64_t v15 = v12;
        _os_log_error_impl( &dword_18298D000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to bind host (%@) to the select statement",  (uint8_t *)&v14,  0xCu);
      }
    }

    else
    {
      if (!sqlite3_bind_text( *(sqlite3_stmt **)(*(void *)(a1 + 32) + 80), 2, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0))
      {
        while (1)
        {
          int v10 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80LL));
          uint64_t v11 = *(void *)(a1 + 32);
          if (v10 != 100) {
            break;
          }
          -[_NSHTTPAlternativeServicesStorage _onqueue_convertSqlRowToHTTPAlternativeServiceEntry:]( v11,  *(sqlite3_stmt **)(v11 + 80));
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v2 addObject:v9];
        }

        sqlite3_reset(*(sqlite3_stmt **)(v11 + 80));
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), v2);
        goto LABEL_24;
      }

      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
      }
      int v7 = (os_log_s *)(id)CFNLog::logger;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 80LL);
        int v14 = 138412290;
        uint64_t v15 = v13;
        _os_log_error_impl( &dword_18298D000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to bind partition (%@) to the select statement",  (uint8_t *)&v14,  0xCu);
      }
    }

LABEL_24:
  }

void __58___NSHTTPAlternativeServicesStorage_sharedPersistentStore__block_invoke()
{
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4717);
  }
  v0 = (os_log_s *)(id)CFNLog::logger;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( &dword_18298D000,  v0,  OS_LOG_TYPE_DEFAULT,  "Initializing AlternativeServices Storage singleton",  v3,  2u);
  }

  v1 = objc_alloc_init(&OBJC_CLASS____NSHTTPAlternativeServicesStorage);
  id v2 = (void *)sAltServiceSharedInstance;
  sAltServiceSharedInstance = (uint64_t)v1;
}

@end