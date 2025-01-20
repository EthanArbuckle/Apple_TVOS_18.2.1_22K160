@interface DIShadowChain
+ (BOOL)supportsSecureCoding;
- (BOOL)addShadowNodes:(id)a3 error:(id *)a4;
- (BOOL)addShadowURLs:(id)a3 error:(id *)a4;
- (BOOL)hasBaseImageCache;
- (BOOL)isEmpty;
- (BOOL)shouldValidate;
- (BOOL)verifyNodes:(id)a3 error:(id *)a4;
- (DIShadowChain)init;
- (DIShadowChain)initWithCoder:(id)a3;
- (NSArray)mountPoints;
- (NSArray)nonCacheNodes;
- (NSArray)shadowStats;
- (NSMutableArray)nodes;
- (NSURL)activeShadowURL;
- (id)description;
- (id)statWithError:(id *)a3;
- (int64_t)topDiskImageNumBlocks;
- (void)encodeWithCoder:(id)a3;
- (void)openWritable:(BOOL)a3 createNonExisting:(BOOL)a4;
- (void)setShouldValidate:(BOOL)a3;
@end

@implementation DIShadowChain

- (DIShadowChain)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DIShadowChain;
  v2 = -[DIShadowChain init](&v8, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189603FA8] array];
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x189603F18] array];
    shadowStats = v2->_shadowStats;
    v2->_shadowStats = (NSArray *)v5;

    v2->_shouldValidate = 1;
  }

  return v2;
}

- (BOOL)addShadowURLs:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        v13 = objc_alloc(&OBJC_CLASS___DIShadowNode);
        v14 = -[DIShadowNode initWithURL:isCache:](v13, "initWithURL:isCache:", v12, 0LL, (void)v17);
        [v7 addObject:v14];

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }

  BOOL v15 = -[DIShadowChain addShadowNodes:error:](self, "addShadowNodes:error:", v7, a4);
  return v15;
}

- (BOOL)verifyNodes:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7)
  {
    BOOL v15 = 1;
    goto LABEL_15;
  }

  uint64_t v8 = *(void *)v20;
  while (2)
  {
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      [v10 URL];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      char v12 = [v11 isFileURL];

      if ((v12 & 1) == 0)
      {
        [NSString stringWithFormat:@"Shadow path %@ is not a valid file", v10];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v16,  a4);
LABEL_14:
        BOOL v15 = v17;

        goto LABEL_15;
      }
      v13 = -[DIShadowChain nodes](self, "nodes");
      int v14 = [v13 containsObject:v10];

      if (v14)
      {
        [NSString stringWithFormat:@"Duplicate shadow values for: %@", v10];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v17 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v16,  a4);
        goto LABEL_14;
      }
    }

    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    BOOL v15 = 1;
    if (v7) {
      continue;
    }
    break;
  }

- (BOOL)addShadowNodes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = -[DIShadowChain verifyNodes:error:](self, "verifyNodes:error:", v6, a4);
  if (v7)
  {
    -[DIShadowChain nodes](self, "nodes");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 addObjectsFromArray:v6];
  }

  return v7;
}

- (void)openWritable:(BOOL)a3 createNonExisting:(BOOL)a4
{
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __48__DIShadowChain_openWritable_createNonExisting___block_invoke;
  v8[3] = &unk_18A1CA5F8;
  BOOL v9 = a3;
  BOOL v10 = a4;
  v8[4] = self;
  [v7 enumerateObjectsUsingBlock:v8];
}

void __48__DIShadowChain_openWritable_createNonExisting___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = v5;
  uint64_t v7 = 514LL;
  if (*(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 41)) {
      uint64_t v7 = 514LL;
    }
    else {
      uint64_t v7 = 2562LL;
    }
  }

  if ([v5 isCache])
  {
    [v6 createBackendWithFlags:v7];
    int v8 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      [v6 URL];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 path];
      *(_DWORD *)buf = 68158211;
      int v29 = 61;
      __int16 v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      __int16 v32 = 2113;
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v11);
        free(v11);
      }
    }

    else
    {
      getDIOSLog();
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        [v6 URL];
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 path];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158211;
        int v29 = 61;
        __int16 v30 = 2080;
        v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
        __int16 v32 = 2113;
        id v33 = v16;
        _os_log_impl( &dword_188046000,  v14,  OS_LOG_TYPE_DEFAULT,  "%.*s: Cache file %{private}@ opened with RW access",  buf,  0x1Cu);
      }
    }

    goto LABEL_33;
  }

  if (*(_BYTE *)(a1 + 40))
  {
    [*(id *)(a1 + 32) nodes];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v12 count] - 1 == a3) {
      uint64_t v13 = v7;
    }
    else {
      uint64_t v13 = 0LL;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  [v6 createBackendWithFlags:v13];
  if ((v13 & 3) != 0)
  {
    int v8 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      [v6 URL];
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 path];
      *(_DWORD *)buf = 68158211;
      int v29 = 61;
      __int16 v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      __int16 v32 = 2113;
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      __int128 v19 = (char *)_os_log_send_and_compose_impl();

      if (!v19) {
        goto LABEL_33;
      }
      goto LABEL_25;
    }

    getDIOSLog();
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      [v6 URL];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 path];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158211;
      int v29 = 61;
      __int16 v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      __int16 v32 = 2113;
      id v33 = v24;
      _os_log_impl( &dword_188046000,  v22,  OS_LOG_TYPE_DEFAULT,  "%.*s: Shadow file %{private}@ opened with RW access",  buf,  0x1Cu);
    }
  }

  else
  {
    int v8 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      [v6 URL];
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 path];
      *(_DWORD *)buf = 68158211;
      int v29 = 61;
      __int16 v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      __int16 v32 = 2113;
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      __int128 v19 = (char *)_os_log_send_and_compose_impl();

      if (!v19) {
        goto LABEL_33;
      }
LABEL_25:
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v19);
      free(v19);
      goto LABEL_33;
    }

    getDIOSLog();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      [v6 URL];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 path];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158211;
      int v29 = 61;
      __int16 v30 = 2080;
      v31 = "-[DIShadowChain openWritable:createNonExisting:]_block_invoke";
      __int16 v32 = 2113;
      id v33 = v27;
      _os_log_impl( &dword_188046000,  v25,  OS_LOG_TYPE_DEFAULT,  "%.*s: Using an existing shadow file: %{private}@",  buf,  0x1Cu);
    }
  }

- (id)statWithError:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  shadowStats = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  -[DIShadowChain nodes](self, "nodes");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v31 != v7) {
        objc_enumerationMutation(v5);
      }
      BOOL v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
      [v9 fileBackend];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v11 = v10 == 0LL;

      if (v11) {
        break;
      }
      [v9 fileBackend];
      char v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v12;
      if (v12)
      {
        [v12 backend];
      }

      else
      {
        uint64_t v26 = 0LL;
        v27 = 0LL;
      }

      get_sink_backend((uint64_t)&v26, &v28);
      uint64_t fd_from_backend = get_fd_from_backend((uint64_t)&v28);
      BOOL v15 = v29;
      if (v29)
      {
        p_shared_owners = (unint64_t *)&v29->__shared_owners_;
        do
          unint64_t v17 = __ldaxr(p_shared_owners);
        while (__stlxr(v17 - 1, p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }

      __int128 v18 = v27;
      if (v27)
      {
        __int128 v19 = (unint64_t *)&v27->__shared_owners_;
        do
          unint64_t v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }

      if ((fd_from_backend & 0x80000000) != 0)
      {
        +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  150LL,  @"Unexpected backend type for shadow file",  a3);
        goto LABEL_28;
      }

      __int128 v21 = -[DIStatFS initWithFileDescriptor:error:]( objc_alloc(&OBJC_CLASS___DIStatFS),  "initWithFileDescriptor:error:",  fd_from_backend,  a3);
      __int128 v22 = v21;
      if (!v21)
      {
        +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  150LL,  @"Could not stat shadow file",  a3);
        goto LABEL_28;
      }

      -[DIStatFS logWithHeader:](v21, "logWithHeader:", @"Shadow underlying FS");
      [shadowStats addObject:v22];

      if (++v8 == v6)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_24;
      }
    }

    +[DIError failWithEnumValue:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:verboseInfo:error:",  150LL,  @"Bakcend not initialized for file",  a3);
LABEL_28:

    v23 = 0LL;
    goto LABEL_29;
  }

- (NSArray)mountPoints
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v4 = -[DIShadowChain shadowStats](self, "shadowStats", 0LL);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7) mountedOnURL];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v3 addObject:v8];

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  return (NSArray *)v3;
}

- (BOOL)isEmpty
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (NSURL)activeShadowURL
{
  if (-[DIShadowChain isEmpty](self, "isEmpty")
    || (-[DIShadowChain nodes](self, "nodes"),
        BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(),
        [v3 lastObject],
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isCache],
        v4,
        v3,
        (v5 & 1) != 0))
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    -[DIShadowChain nodes](self, "nodes");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 lastObject];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 URL];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v6;
}

- (BOOL)hasBaseImageCache
{
  if (-[DIShadowChain isEmpty](self, "isEmpty")) {
    return 0;
  }
  v4 = -[DIShadowChain nodes](self, "nodes");
  [v4 firstObject];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v5 isCache];

  return v3;
}

- (NSArray)nonCacheNodes
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DIShadowChain nodes](self, "nodes");
  [v4 filteredArrayUsingPredicate:v3];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

uint64_t __30__DIShadowChain_nonCacheNodes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCache] ^ 1;
}

- (int64_t)topDiskImageNumBlocks
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (-[DIShadowChain isEmpty](self, "isEmpty"))
  {
    int v3 = *__error();
    if (DIForwardLogs())
    {
      *(void *)uint64_t v24 = 0LL;
      getDIOSLog();
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&uint8_t buf[4] = 38;
      *(_WORD *)uint64_t v28 = 2080;
      *(void *)&v28[2] = "-[DIShadowChain topDiskImageNumBlocks]";
      char v5 = (char *)_os_log_send_and_compose_impl();

      if (v5)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v5);
        free(v5);
      }
    }

    else
    {
      getDIOSLog();
      __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        *(_DWORD *)&uint8_t buf[4] = 38;
        *(_WORD *)uint64_t v28 = 2080;
        *(void *)&v28[2] = "-[DIShadowChain topDiskImageNumBlocks]";
        _os_log_impl( &dword_188046000,  v12,  OS_LOG_TYPE_ERROR,  "%.*s: numBlocks queried for an empty shadowChain.",  buf,  0x12u);
      }
    }

    *__error() = v3;
    return -22LL;
  }

  else
  {
    -[DIShadowChain nodes](self, "nodes");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 lastObject];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v7 fileBackend];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v9 = v8;
    if (v8)
    {
      [v8 backend];
      uint64_t v11 = *(void *)buf;
      __int128 v10 = *(std::__shared_weak_count **)v28;
    }

    else
    {
      __int128 v10 = 0LL;
      uint64_t v11 = 0LL;
    }

    *(void *)buf = 0LL;
    *(void *)uint64_t v28 = 0LL;

    int v14 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 176LL))(v11);
    int v15 = dup(v14);
    diskimage_uio::diskimage_open_params::create(v15, 0, 0, (uint64_t)buf);
    if (v28[8]
      && (v16.n128_f64[0] = diskimage_uio::diskimage_open_params::get_nr_blocks( (const std::error_category **)buf,  (__n128 *)v24),  BYTE6(v26)))
    {
      int64_t v13 = *(void *)v24;
    }

    else
    {
      int v17 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)uint64_t v24 = 68157954;
        *(_DWORD *)&v24[4] = 38;
        __int16 v25 = 2080;
        uint64_t v26 = "-[DIShadowChain topDiskImageNumBlocks]";
        __int128 v19 = (char *)_os_log_send_and_compose_impl();

        if (v19)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v19);
          free(v19);
        }
      }

      else
      {
        getDIOSLog();
        unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v24 = 68157954;
          *(_DWORD *)&v24[4] = 38;
          __int16 v25 = 2080;
          uint64_t v26 = "-[DIShadowChain topDiskImageNumBlocks]";
          _os_log_impl( &dword_188046000,  v20,  OS_LOG_TYPE_DEFAULT,  "%.*s: Failed to open top disk image node.",  v24,  0x12u);
        }
      }

      *__error() = v17;
      int64_t v13 = -22LL;
    }

    if (v28[8]) {
      diskimage_uio::diskimage_open_params::~diskimage_open_params((diskimage_uio::diskimage_open_params *)buf);
    }
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        unint64_t v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v10->__on_zero_shared)(v10, v16);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIShadowChain)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DIShadowChain;
  char v5 = -[DIShadowChain init](&v17, sel_init);
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"nodes"];
    nodes = v5->_nodes;
    v5->_nodes = (NSMutableArray *)v9;

    uint64_t v11 = (void *)MEMORY[0x189604010];
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"shadowStats"];
    shadowStats = v5->_shadowStats;
    v5->_shadowStats = (NSArray *)v14;

    v5->_shouldValidate = [v4 decodeBoolForKey:@"shouldValidate"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  -[DIShadowChain nodes](self, "nodes");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v4 forKey:@"nodes"];

  -[DIShadowChain shadowStats](self, "shadowStats");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v5 forKey:@"shadowStats"];

  objc_msgSend( v6,  "encodeBool:forKey:",  -[DIShadowChain shouldValidate](self, "shouldValidate"),  @"shouldValidate");
}

- (id)description
{
  v2 = (void *)NSString;
  -[DIShadowChain nodes](self, "nodes");
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 stringWithFormat:@"ShadowChain: %@", v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableArray)nodes
{
  return self->_nodes;
}

- (NSArray)shadowStats
{
  return self->_shadowStats;
}

- (BOOL)shouldValidate
{
  return self->_shouldValidate;
}

- (void)setShouldValidate:(BOOL)a3
{
  self->_shouldValidate = a3;
}

- (void).cxx_destruct
{
}

@end