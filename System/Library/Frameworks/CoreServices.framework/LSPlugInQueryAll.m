@interface LSPlugInQueryAll
- (BOOL)_remoteResolutionIsExpensive;
- (id)resolveExpensiveQueryRemotelyUsingResolver:(id)a3 error:(id *)a4;
@end

@implementation LSPlugInQueryAll

- (BOOL)_remoteResolutionIsExpensive
{
  return 1;
}

- (id)resolveExpensiveQueryRemotelyUsingResolver:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v56 = a3;
  v4 = 0LL;
  id v5 = 0LL;
  int v6 = 0;
  unint64_t v7 = 0x18C66C000uLL;
  do
  {
    if (v5)
    {
      _LSDefaultLog();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v61 = v5;
        _os_log_error_impl( &dword_183E58000,  v8,  OS_LOG_TYPE_ERROR,  "failed batch fetch of all plugins, retrying: %@",  buf,  0xCu);
      }
    }

    v9 = (void *)MEMORY[0x189604010];
    v10 = (void *)[objc_alloc((Class)(v7 + 3848)) _init];
    [v9 setWithObject:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v59 = 0LL;
    [v56 _resolveQueries:v11 XPCConnection:0 error:&v59];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = v59;

    [v12 allValues];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 firstObject];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 firstObject];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    [v15 pluginUnits];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v15;
    uint64_t v17 = [v15 dbUUID];
    v57 = (void *)v17;
    if (v16) {
      BOOL v18 = v17 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (!v18)
    {
      v52 = v12;
      int v53 = v6;
      v54 = v4;
      id v19 = objc_alloc_init(MEMORY[0x189603FA8]);
      if ([v16 count])
      {
        uint64_t v20 = 0LL;
        unsigned int v21 = 50;
        while (1)
        {
          v22 = (void *)MEMORY[0x186E2A59C]();
          uint64_t v23 = [v16 count];
          uint64_t v24 = (unint64_t)(v23 - v20) >= 0x32 ? 50LL : v23 - v20;
          objc_msgSend(v16, "subarrayWithRange:", v20, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          id v58 = 0LL;
          v26 = (void *)MEMORY[0x189604010];
          id v27 = v56;
          id v28 = v25;
          id v29 = v57;
          v30 = -[LSPlugInQueryWithUnits initWithPlugInUnits:forDatabaseWithUUID:]( objc_alloc(&OBJC_CLASS___LSPlugInQueryWithUnits),  "initWithPlugInUnits:forDatabaseWithUUID:",  v28,  v29);

          [v26 setWithObject:v30];
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 _resolveQueries:v31 XPCConnection:0 error:&v58];
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            [v32 allValues];
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v34 = [v33 firstObject];
            v35 = (void *)v34;
            v36 = (void *)MEMORY[0x189604A58];
            if (v34) {
              v36 = (void *)v34;
            }
            id v37 = v36;
          }

          else
          {
            id v37 = 0LL;
          }

          id v38 = v58;
          if (!v37) {
            break;
          }
          [v19 addObjectsFromArray:v37];

          objc_autoreleasePoolPop(v22);
          uint64_t v20 = v21;
          BOOL v39 = [v16 count] > (unint64_t)v21;
          v21 += 50;
          id v5 = v38;
          if (!v39) {
            goto LABEL_24;
          }
        }

        objc_autoreleasePoolPop(v22);
        v4 = v54;
      }

      else
      {
        id v38 = v5;
LABEL_24:
        v4 = (void *)[v19 copy];
      }

      id v5 = v38;
      int v6 = v53;
      unint64_t v7 = 0x18C66C000LL;
      v12 = v52;
    }

    if (v4)
    {
      char v40 = 1;
    }

    else if (_LSNSErrorIsXPCConnectionInterrupted(v5))
    {
      char v40 = 0;
    }

    else
    {
      [v5 domain];
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      else {
        BOOL v42 = 0;
      }
      char v40 = !v42;
    }

    if ((v40 & 1) != 0) {
      break;
    }
    ++v6;
  }

  while (v6 != 10);
  if (!v4)
  {
    _LSDefaultLog();
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[LSPlugInQueryAll resolveExpensiveQueryRemotelyUsingResolver:error:].cold.1( (uint64_t)v5,  v43,  v44,  v45,  v46,  v47,  v48,  v49);
    }

    if (a4) {
      *a4 = v5;
    }
  }

  return v4;
}

- (void)resolveExpensiveQueryRemotelyUsingResolver:(uint64_t)a3 error:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end