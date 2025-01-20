@interface SABinaryLocator
+ (id)sharedBinaryLocator;
- (SABinaryLocator)init;
- (_BYTE)addURLForSymbolOwner:(_BYTE *)a1;
- (id)mappings;
- (id)urlForUUID:(_BYTE *)a1;
- (uint64_t)addURL:(void *)a3 ForUUID:;
- (uint64_t)removeURLForUUID:(_BYTE *)a1;
- (void)_saveMappings;
- (void)done;
@end

@implementation SABinaryLocator

- (SABinaryLocator)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (SABinaryLocator *)+[SABinaryLocator sharedBinaryLocator](v3, v4);
}

+ (id)sharedBinaryLocator
{
  if (qword_18C4B1708 != -1) {
    dispatch_once(&qword_18C4B1708, &__block_literal_global_14);
  }
  id v2 = (id)qword_18C4B1700;
  objc_sync_enter(v2);
  ++_MergedGlobals_10;
  objc_sync_exit(v2);

  return (id)qword_18C4B1700;
}

void __38__SABinaryLocator_sharedBinaryLocator__block_invoke()
{
  v0 = objc_alloc(&OBJC_CLASS___SABinaryLocator);
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)&OBJC_CLASS___SABinaryLocator;
    v0 = (SABinaryLocator *)objc_msgSendSuper2(&v2, sel_init);
    if (v0) {
      v0->_enabled = 1;
    }
  }

  v1 = (void *)qword_18C4B1700;
  qword_18C4B1700 = (uint64_t)v0;
}

- (void)done
{
  obj = self;
  objc_sync_enter(obj);
  if (!--_MergedGlobals_10)
  {
    if (obj->_enabled) {
      -[SABinaryLocator _saveMappings](obj);
    }
    mappings = obj->_mappings;
    obj->_mappings = 0LL;
  }

  objc_sync_exit(obj);
}

- (void)_saveMappings
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (!*((_BYTE *)v1 + 24) || geteuid()) {
      goto LABEL_29;
    }
    if (v1[1])
    {
      objc_super v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v1[1], "count") + 1);
      id v3 = v1[1];
      v29[0] = MEMORY[0x1895F87A8];
      v29[1] = 3221225472LL;
      v29[2] = __32__SABinaryLocator__saveMappings__block_invoke;
      v29[3] = &unk_189F648A8;
      id v4 = v2;
      id v30 = v4;
      [v3 enumerateKeysAndObjectsUsingBlock:v29];
      [v4 setObject:v1[2] forKeyedSubscript:@"build_number"];
      if (stat("/var/db/spindump", &v28))
      {
        if (*__error() != 2)
        {
          int v7 = *__error();
          _sa_logt();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v20 = *__error();
            v21 = __error();
            v22 = strerror(*v21);
            *(_DWORD *)buf = 136315650;
            v32 = "/var/db/spindump";
            __int16 v33 = 1024;
            int v34 = v20;
            __int16 v35 = 2080;
            v36 = v22;
            _os_log_error_impl(&dword_186C92000, v15, OS_LOG_TYPE_ERROR, "Unable to stat %s: %d %s", buf, 0x1Cu);
          }

          v9 = __error();
          goto LABEL_19;
        }

        int v5 = *__error();
        _sa_logt();
        v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v32 = "/var/db/spindump";
          _os_log_debug_impl(&dword_186C92000, v6, OS_LOG_TYPE_DEBUG, "Creating nugget directory %s", buf, 0xCu);
        }

        *__error() = v5;
        if (mkdir("/var/db/spindump", 0x1EDu))
        {
          int v7 = *__error();
          _sa_logt();
          v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            int v23 = *__error();
            v24 = __error();
            v25 = strerror(*v24);
            *(_DWORD *)buf = 136315650;
            v32 = "/var/db/spindump";
            __int16 v33 = 1024;
            int v34 = v23;
            __int16 v35 = 2080;
            v36 = v25;
            _os_log_error_impl(&dword_186C92000, v8, OS_LOG_TYPE_ERROR, "Unable to create %s: %d %s", buf, 0x1Cu);
          }

          v9 = __error();
LABEL_19:
          int *v9 = v7;

LABEL_29:
          objc_sync_exit(v1);

          return;
        }
      }

      v10 = (void *)[objc_alloc(MEMORY[0x189603FF8]) initToFileAtPath:@"/var/db/spindump/UUIDToBinaryLocations" append:0];
      v11 = v10;
      if (v10)
      {
        [v10 open];
        id v27 = 0LL;
        uint64_t v12 = [MEMORY[0x1896079E8] writePropertyList:v4 toStream:v11 format:200 options:0 error:&v27];
        id v13 = v27;
        [v11 close];
        if (v12)
        {
          int v14 = 0;
        }

        else
        {
          int v18 = *__error();
          _sa_logt();
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            [v13 debugDescription];
            v26 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v32 = v26;
            _os_log_error_impl(&dword_186C92000, v19, OS_LOG_TYPE_ERROR, "Unable to save mappings: %@", buf, 0xCu);
          }

          *__error() = v18;
          int v14 = 1;
        }
      }

      else
      {
        int v16 = *__error();
        _sa_logt();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_ERROR,  "Unable to create stream for binary locator path",  buf,  2u);
        }

        *__error() = v16;
        int v14 = 1;
      }

      if (v14) {
        goto LABEL_29;
      }
    }

    *((_BYTE *)v1 + 24) = 0;
    goto LABEL_29;
  }

- (id)mappings
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  v1 = a1;
  objc_sync_enter(v1);
  id v2 = v1[1];
  if (v2 || !*((_BYTE *)v1 + 25))
  {
LABEL_2:
    id v3 = v2;
    goto LABEL_3;
  }

  int v5 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:@"/var/db/spindump/UUIDToBinaryLocations"];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v7 = v1[1];
  v1[1] = (id)v6;

  if (!v1[2])
  {
    v8 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
    v9 = v8;
    if (!v8)
    {
      int v19 = *__error();
      _sa_logt();
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_186C92000, v20, OS_LOG_TYPE_FAULT, "No system version", buf, 2u);
      }

      *__error() = v19;
      if (v5) {
        goto LABEL_13;
      }
      goto LABEL_25;
    }

    uint64_t v10 = CFDictionaryGetValue(v8, (const void *)*MEMORY[0x189604B60]);
    id v11 = v1[2];
    v1[2] = (id)v10;

    if (!v1[2])
    {
      int v12 = *__error();
      _sa_logt();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_186C92000, v13, OS_LOG_TYPE_FAULT, "No build number", buf, 2u);
      }

      *__error() = v12;
    }

    CFRelease(v9);
  }

  if (!v5)
  {
LABEL_25:
    int v21 = *__error();
    _sa_logt();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_186C92000,  v22,  OS_LOG_TYPE_DEFAULT,  "WARNING: Unable to open binary locator database",  buf,  2u);
    }

    *__error() = v21;
    id v2 = v1[1];
    goto LABEL_2;
  }

void __27__SABinaryLocator_mappings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([v8 isEqualToString:@"build_number"] & 1) == 0)
  {
    [MEMORY[0x189604030] fileURLWithPath:v5 isDirectory:0];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    uuidForString(v8);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7) {
      [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKey:v7];
    }
  }
}

void __32__SABinaryLocator__saveMappings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [MEMORY[0x189603FE8] null];
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v6)
    {
      [v6 path];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = *(void **)(a1 + 32);
        [v5 UUIDString];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 setObject:v8 forKey:v10];
      }

      else
      {
        int v11 = *__error();
        _sa_logt();
        int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315138;
          uint64_t v14 = [v6 fileSystemRepresentation];
          _os_log_impl( &dword_186C92000,  v12,  OS_LOG_TYPE_DEFAULT,  "WARNING: Unable to get path for %s",  (uint8_t *)&v13,  0xCu);
        }

        *__error() = v11;
      }
    }
  }
}

- (id)urlForUUID:(_BYTE *)a1
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1 && a1[25])
  {
    -[SABinaryLocator mappings](a1);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKey:v3];
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [MEMORY[0x189603FE8] null];
      id v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v5 == v6)
      {
        int v12 = 0LL;
        goto LABEL_23;
      }

      uint64_t v7 = [v5 path];
      if (v7)
      {
        id v8 = (void *)v7;
        [MEMORY[0x1896078A8] defaultManager];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 path];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        int v11 = [v9 fileExistsAtPath:v10];

        if (v11)
        {
          id v5 = v5;
          int v12 = v5;
LABEL_23:

          goto LABEL_24;
        }
      }

      int v13 = *__error();
      _sa_logt();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        [v3 UUIDString];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 path];
        int v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v15;
        __int16 v30 = 2112;
        v31[0] = v16;
        _os_log_impl( &dword_186C92000,  v14,  OS_LOG_TYPE_INFO,  "Found stale entry for UUID %@, mapping to non-existent path %@. This will be ignored and evicted from the cache.",  buf,  0x16u);
      }

      *__error() = v13;
      a1[24] = 1;
      -[SABinaryLocator mappings](a1);
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 removeObjectForKey:v3];
    }

    [v3 getUUIDBytes:v32];
    OSLogLookupPathWithUUID();
    SAFilepathForCString(0LL);
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v18 isAbsolutePath])
    {
      int v19 = *__error();
      _sa_logt();
      int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v29 = v18;
        __int16 v30 = 1040;
        LODWORD(v31[0]) = 16;
        WORD2(v31[0]) = 2096;
        *(void *)((char *)v31 + 6) = v32;
        _os_log_debug_impl( &dword_186C92000,  v20,  OS_LOG_TYPE_DEBUG,  "Got %@ for %{uuid_t}.16P from libtrace",  buf,  0x1Cu);
      }

      *__error() = v19;
      [MEMORY[0x1896078A8] defaultManager];
      int v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v22 = [v21 fileExistsAtPath:v18];

      if (v22)
      {
        int v23 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v18 isDirectory:0];

        -[SABinaryLocator addURL:ForUUID:](a1, v23, v3);
        id v5 = v23;
        int v12 = v5;
      }

      else
      {
        int v24 = *__error();
        _sa_logt();
        int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          [v3 UUIDString];
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v29 = v26;
          __int16 v30 = 2080;
          v31[0] = 0LL;
          _os_log_impl( &dword_186C92000,  v25,  OS_LOG_TYPE_INFO,  "OSLogLookupPathWithUUID returned stale entry for UUID %@; path %s doesn't exist. This will be ignored.",
            buf,
            0x16u);
        }

        int v12 = 0LL;
        *__error() = v24;
      }
    }

    else
    {
      int v12 = 0LL;
    }

    goto LABEL_23;
  }

  int v12 = 0LL;
LABEL_24:

  return v12;
}

- (uint64_t)addURL:(void *)a3 ForUUID:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a1 || !a1[25]) {
    goto LABEL_17;
  }
  uint64_t v8 = 0LL;
  if (!v5 || !v6) {
    goto LABEL_18;
  }
  id v9 = v5;
  uint64_t v10 = (const char *)[v9 fileSystemRepresentation];
  if (!v10)
  {
LABEL_15:
    int v16 = a1;
    objc_sync_enter(v16);
    -[SABinaryLocator mappings](v16);
    int v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 objectForKey:v7];
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v16[24] = 1;
      [v17 setObject:v9 forKey:v7];

      objc_sync_exit(v16);
      uint64_t v8 = 1LL;
      goto LABEL_18;
    }

    objc_sync_exit(v16);
    goto LABEL_17;
  }

  int v11 = v10;
  if (stat(v10, &v21))
  {
LABEL_17:
    uint64_t v8 = 0LL;
    goto LABEL_18;
  }

  if (statfs(v11, &v26))
  {
    int v12 = *__error();
    _sa_logt();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v20 = *__error();
      *(_DWORD *)buf = 136315394;
      int v23 = v11;
      __int16 v24 = 1024;
      int v25 = v20;
      _os_log_debug_impl(&dword_186C92000, v13, OS_LOG_TYPE_DEBUG, "Unable to statfs %s: %{errno}d", buf, 0x12u);
    }

    *__error() = v12;
    goto LABEL_15;
  }

  if (v26.f_type != 22) {
    goto LABEL_15;
  }
  int v14 = *__error();
  _sa_logt();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v23 = v11;
    _os_log_debug_impl(&dword_186C92000, v15, OS_LOG_TYPE_DEBUG, "Not caching translocated path %s", buf, 0xCu);
  }

  uint64_t v8 = 0LL;
  *__error() = v14;
LABEL_18:

  return v8;
}

- (_BYTE)addURLForSymbolOwner:(_BYTE *)a1
{
  v1 = a1;
  if (a1)
  {
    if (a1[25])
    {
      uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
      Path = (_BYTE *)CSSymbolOwnerGetPath();
      SAFilepathForCString(Path);
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
      id v5 = v4;
      if (CFUUIDBytes && [v4 isAbsolutePath])
      {
        uuidForBytes(CFUUIDBytes);
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SABinaryLocator urlForUUID:](v1, v6);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v1 = 0LL;
        }

        else
        {
          uint64_t v8 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v5 isDirectory:0];
          v1 = (_BYTE *)-[SABinaryLocator addURL:ForUUID:](v1, v8, v6);
        }
      }

      else
      {
        v1 = 0LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v1;
}

- (uint64_t)removeURLForUUID:(_BYTE *)a1
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = 0LL;
  if (a1)
  {
    if (v3)
    {
      if (a1[25])
      {
        uint64_t v5 = -[SABinaryLocator urlForUUID:](a1, v3);
        if (v5)
        {
          int v6 = *__error();
          _sa_logt();
          uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            [v4 UUIDString];
            uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            int v12 = v10;
            __int16 v13 = 2080;
            uint64_t v14 = [(id) v5 fileSystemRepresentation];
            _os_log_debug_impl(&dword_186C92000, v7, OS_LOG_TYPE_DEBUG, "Deleted %@ -> %s", buf, 0x16u);
          }

          *__error() = v6;
          a1[24] = 1;
          [v4 getUUIDBytes:buf];
          OSLogLookupPathWithUUID();
          -[SABinaryLocator mappings](a1);
          uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 removeObjectForKey:v4];

          uint64_t v5 = 1LL;
        }
      }
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end