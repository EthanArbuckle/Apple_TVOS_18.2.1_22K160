@interface NSURLStorageURLCacheDB
- (_BYTE)getEntryIDandReceiverDataForRequestKey:(sqlite3_stmt *)a1;
- (const)createCachedResponseForKey:(uint64_t)a1 cacheDataPath:(void *)a2 cacheDataFile:(void *)a3 caller:(void *)a4;
- (uint64_t)execSQLStatement:(os_unfair_lock_s *)a1 onConnection:(char *)sql toCompletionWithRetry:(sqlite3 *)a3 writeLockHeld:(int)a4;
- (uint64_t)openAndPrepareWriteCacheDB_NoLock;
- (uint64_t)stepSQLStatement:(void *)a1 toCompletionWithRetry:(sqlite3_stmt *)a2;
@end

@implementation NSURLStorageURLCacheDB

- (const)createCachedResponseForKey:(uint64_t)a1 cacheDataPath:(void *)a2 cacheDataFile:(void *)a3 caller:(void *)a4
{
  id v7 = a2;
  BOOL v42 = 0;
  if ((*(_BYTE *)(a1 + 153) & 1) == 0
    || !*(void *)(a1 + 80) && !-[NSURLStorageURLCacheDB _prepareDBSelectStatements](a1))
  {
    v8 = 0LL;
    goto LABEL_36;
  }

  v9 = (const __CFString *)v7;
  v10 = (__CFString *)v9;
  if (!*(void *)(a1 + 80))
  {
    v13 = 0LL;
    v8 = 0LL;
    goto LABEL_34;
  }

  v11 = _ExtractCStringfromCFStringRef(v9, &v42);
  if (!v11)
  {
    v8 = 0LL;
    goto LABEL_35;
  }

  v12 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 80), 1, v11, -1, 0LL))
  {
    v8 = 0LL;
    v13 = 0LL;
    goto LABEL_32;
  }

  v37 = a4;
  v38 = a3;
  v34 = v11;
  v35 = v10;
  id v36 = v7;
  v39 = 0LL;
  v8 = 0LL;
  while (1)
  {
    int v14 = sqlite3_step(*(sqlite3_stmt **)(a1 + 80));
    int v15 = v14;
    if (v14 > 22) {
      break;
    }
    if (v14) {
      goto LABEL_29;
    }
LABEL_16:
    sqlite3_column_int(*(sqlite3_stmt **)(a1 + 80), 0);
    int v41 = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 80), 1);
    v40 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 2);
    v16 = (UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 3);
    int v17 = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 80), 4);
    v18 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 5);
    v19 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 6);
    v20 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 80), 7);
    v21 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 80), 8);
    int v22 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 5);
    if (v21)
    {
      uint64_t v23 = [NSString stringWithUTF8String:v21];

      v39 = (__CFString *)v23;
    }

    if (v17 && v18)
    {
      id v24 = objc_alloc(NSString);
      id v26 = objc_getProperty((id)a1, v25, 160LL, 1);
      void *v38 = (id)[v24 initWithString:v26];

      void *v37 = (id)[objc_alloc(NSString) initWithCString:v18 encoding:4];
LABEL_22:
      int v27 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 2);
      int v28 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 3);
      int v29 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 6);
      int v30 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 80), 7);
      uint64_t CachedResponseFromParts = __createCachedResponseFromParts(v41, v40, v27, v16, v28, v18, v22, v19, v29, v20, v30);
      v8 = (const void *)CachedResponseFromParts;
      if (CachedResponseFromParts)
      {
        uint64_t v32 = *(void *)(CachedResponseFromParts + 16);
        if (v32) {
          *(_BYTE *)(v32 + 24) = 1;
        }
      }

      goto LABEL_26;
    }

    if (v18) {
      goto LABEL_22;
    }
    CFLog();
LABEL_26:
    if (v15 != 100) {
      goto LABEL_31;
    }
  }

  if (v14 == 100) {
    goto LABEL_16;
  }
  if (v14 == 101) {
    goto LABEL_31;
  }
LABEL_29:
  if (v8)
  {
    CFRelease(v8);
    v8 = 0LL;
  }

- (uint64_t)openAndPrepareWriteCacheDB_NoLock
{
  if (*((void *)self + 2)) {
    return 1LL;
  }
  uint64_t v4 = *((void *)self + 22);
  if (v4 < 5242880)
  {
    if (v4 >= 1)
    {
      objc_getProperty(self, a2, 160LL, 1);
      CFLog();
    }

    return 0LL;
  }

  else
  {
    uint64_t result = -[NSURLStorageURLCacheDB _openDBWriteConnections]((sqlite3 **)self, a2);
    if ((_DWORD)result)
    {
      if (*((void *)self + 2))
      {
        if (!*((void *)self + 5))
        {
          v5 = sqlite3_mprintf( "INSERT into cfurl_cache_response (version, hash_value, storage_policy, \t\t\t\t\t\t\t\t\t request_key, partition) VALUES (%q, %q, %q, %q, %q);",
                 "?",
                 "?",
                 "?",
                 "?",
                 "?");
          int v6 = strlen(v5);
          if (sqlite3_prepare_v2(*((sqlite3 **)self + 2), v5, v6, (sqlite3_stmt **)self + 5, 0LL))
          {
            objc_getProperty(self, v7, 168LL, 1);
            CFLog();
          }

          sqlite3_free(v5);
        }

        if (!*((void *)self + 6))
        {
          v8 = sqlite3_mprintf( "INSERT into cfurl_cache_blob_data (entry_ID, response_object, request_object,\t\t\t\t\t\t\t\t\t proto_p rops, user_info) \t\t\t\t\t\t\t\t\t VALUES (%q, %q, %q, %q, %q);",
                 "?",
                 "?",
                 "?",
                 "?",
                 "?");
          int v9 = strlen(v8);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v8, v9, (sqlite3_stmt **)self + 6, 0LL);
          sqlite3_free(v8);
        }

        if (!*((void *)self + 7))
        {
          v10 = sqlite3_mprintf( "INSERT into cfurl_cache_receiver_data (entry_ID, isDataOnFS, receiver_data) \t\t\t\t\t\t\t\t\t VALUES (%q, %q, %q);",
                  "?",
                  "?",
                  "?");
          int v11 = strlen(v10);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v10, v11, (sqlite3_stmt **)self + 7, 0LL);
          sqlite3_free(v10);
        }

        if (!*((void *)self + 8))
        {
          v12 = sqlite3_mprintf( "UPDATE cfurl_cache_response SET version=%q, hash_value=%q, storage_policy=%q, partition=%q\t\t\t\t\t\t \t\t\t WHERE entry_ID=%q;",
                  "?",
                  "?",
                  "?",
                  "?",
                  "?");
          int v13 = strlen(v12);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v12, v13, (sqlite3_stmt **)self + 8, 0LL);
          sqlite3_free(v12);
        }

        if (!*((void *)self + 9))
        {
          int v14 = sqlite3_mprintf( "UPDATE cfurl_cache_blob_data SET response_object=%q, request_object=%q,\t\t\t\t\t\t\t\t\t proto_props= %q, user_info=%q WHERE entry_ID=%q;",
                  "?",
                  "?",
                  "?",
                  "?",
                  "?");
          int v15 = strlen(v14);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v14, v15, (sqlite3_stmt **)self + 9, 0LL);
          sqlite3_free(v14);
        }

        if (!*((void *)self + 4))
        {
          v16 = sqlite3_mprintf( "UPDATE cfurl_cache_receiver_data SET receiver_data=%q, isDataOnFS=%q WHERE entry_ID=%q;",
                  "?",
                  "?",
                  "?");
          int v17 = strlen(v16);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v16, v17, (sqlite3_stmt **)self + 4, 0LL);
          sqlite3_free(v16);
        }

        if (!*((void *)self + 11))
        {
          v18 = sqlite3_mprintf( "SELECT r.entry_ID, d.receiver_data, d.isDataOnFS FROM cfurl_cache_response r, cfurl_cache_receiver_dat a d WHERE r.request_key=%q AND d.entry_ID=r.entry_ID",  "?");
          int v19 = strlen(v18);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v18, v19, (sqlite3_stmt **)self + 11, 0LL);
          sqlite3_free(v18);
        }

        if (!*((void *)self + 12))
        {
          v20 = sqlite3_mprintf("SELECT isDataOnFS,receiver_data FROM cfurl_cache_receiver_data WHERE entry_ID=%q", "?");
          int v21 = strlen(v20);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v20, v21, (sqlite3_stmt **)self + 12, 0LL);
          sqlite3_free(v20);
        }

        if (!*((void *)self + 13))
        {
          int v22 = sqlite3_mprintf( "SELECT receiver_data from %s WHERE isDataOnFS > 0 AND entry_ID in \t\t\t\t\t\t\t\t\t (SELECT entry_ID from cfurl_cache_response WHERE entry_ID > 0 ORDER BY time_stamp ASC LIMIT %q)",  "cfurl_cache_receiver_data",  "?");
          int v23 = strlen(v22);
          sqlite3_prepare_v2(*((sqlite3 **)self + 2), v22, v23, (sqlite3_stmt **)self + 13, 0LL);
          sqlite3_free(v22);
        }

        if (*((void *)self + 2))
        {
          if (!*((void *)self + 14))
          {
            id v24 = sqlite3_mprintf("DELETE from cfurl_cache_response WHERE entry_ID=%s;", "?");
            int v25 = strlen(v24);
            sqlite3_prepare_v2(*((sqlite3 **)self + 2), v24, v25, (sqlite3_stmt **)self + 14, 0LL);
            sqlite3_free(v24);
          }

          if (!*((void *)self + 15))
          {
            id v26 = sqlite3_mprintf("DELETE from cfurl_cache_blob_data WHERE entry_ID=%s;", "?");
            int v27 = strlen(v26);
            sqlite3_prepare_v2(*((sqlite3 **)self + 2), v26, v27, (sqlite3_stmt **)self + 15, 0LL);
            sqlite3_free(v26);
          }

          if (!*((void *)self + 16))
          {
            int v28 = sqlite3_mprintf("DELETE from cfurl_cache_receiver_data WHERE entry_ID=%s;", "?");
            int v29 = strlen(v28);
            sqlite3_prepare_v2(*((sqlite3 **)self + 2), v28, v29, (sqlite3_stmt **)self + 16, 0LL);
            sqlite3_free(v28);
          }
        }
      }

      return 1LL;
    }
  }

  return result;
}

- (uint64_t)execSQLStatement:(os_unfair_lock_s *)a1 onConnection:(char *)sql toCompletionWithRetry:(sqlite3 *)a3 writeLockHeld:(int)a4
{
  errmsg = 0LL;
  uint64_t v4 = 1LL;
  if (sql && a3)
  {
    unint64_t v9 = 0LL;
    v10 = a1 + 7;
    while (1)
    {
      uint64_t v11 = sqlite3_exec(a3, sql, 0LL, 0LL, &errmsg);
      uint64_t v4 = v11;
      char v12 = 1;
      if ((int)v11 > 18)
      {
        if ((_DWORD)v11 == 19) {
          goto LABEL_22;
        }
      }

      else if ((_DWORD)v11 == 11)
      {
        if (a4) {
          os_unfair_lock_unlock(v10);
        }
        int v15 = 141;
        uint64_t v4 = sqlite3_file_control(a3, 0LL, 101, &v15);
        -[NSURLStorageURLCacheDB updateToCurrentSchema](a1);
        if (a4) {
          os_unfair_lock_lock(v10);
        }
        char v12 = 0;
      }

      else if (!(_DWORD)v11)
      {
LABEL_20:
        uint64_t v4 = 0LL;
        goto LABEL_22;
      }

      if (errmsg) {
        break;
      }
      if (v9++ >= 9) {
        char v12 = 0;
      }
      if ((v12 & 1) == 0) {
        return v4;
      }
    }

    CFLog();
LABEL_22:
    if (errmsg) {
      sqlite3_free(errmsg);
    }
  }

  return v4;
}

- (uint64_t)stepSQLStatement:(void *)a1 toCompletionWithRetry:(sqlite3_stmt *)a2
{
  if (a2)
  {
    uint64_t v4 = sqlite3_step(a2);
    uint64_t result = 0LL;
    if ((v4 - 100) >= 2 && (_DWORD)v4)
    {
      if ((_DWORD)v4 == 19)
      {
        return 19LL;
      }

      else
      {
        objc_getProperty(a1, v3, 168LL, 1);
        CFLog();
        return v4;
      }
    }
  }

  else
  {
    CFLog();
    return 1LL;
  }

  return result;
}

- (_BYTE)getEntryIDandReceiverDataForRequestKey:(sqlite3_stmt *)a1
{
  int v4 = sqlite3_bind_text(a1[11], 1, a2, -1, 0LL);
  v5 = 0LL;
  if (!v4)
  {
    int v6 = sqlite3_step(a1[11]);
    if (v6 == 100 || v6 == 0)
    {
      int v8 = sqlite3_column_count(a1[11]);
      int v9 = v8 - 1;
      if (v8 >= 1)
      {
        int v10 = v8;
        uint64_t v11 = malloc(0x18uLL);
        v5 = v11;
        if (!v11) {
          goto LABEL_20;
        }
        void *v11 = 0LL;
        v11[1] = 0LL;
        *(void *)((char *)v11 + 13) = 0LL;
        if (sqlite3_column_type(a1[11], v10 - 3) == 1) {
          *(void *)v5 = sqlite3_column_int64(a1[11], v10 - 3);
        }
        if (sqlite3_column_type(a1[11], v9) != 1) {
          goto LABEL_20;
        }
        v5[20] = 1;
        int v12 = v10 - 2;
        int v13 = sqlite3_column_text(a1[11], v10 - 2);
        int v14 = sqlite3_column_bytes(a1[11], v12);
        int v15 = (char *)malloc(v14 + 1);
        *((void *)v5 + 1) = v15;
        if (v15)
        {
          *((_DWORD *)v5 + 4) = v14;
          strncpy(v15, (const char *)v13, v14)[v14] = 0;
LABEL_20:
          sqlite3_reset(a1[11]);
          return v5;
        }

        CFLog();
        free(v5);
      }
    }

    v5 = 0LL;
    goto LABEL_20;
  }

  return v5;
}

@end