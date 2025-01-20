@interface _LSLocalQueryResolver
- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5;
- (void)_enumerateResolvedResultsOfQuery:(id)a3 XPCConnection:(id)a4 withBlock:(id)a5;
@end

@implementation _LSLocalQueryResolver

- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v20 = a4;
  [MEMORY[0x189603FC8] dictionary];
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    _LSServer_DatabaseExecutionContext();
    v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext assertActiveForThisThread](v8);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v9)
  {
    id v16 = v7;
    id v19 = 0LL;
    uint64_t v10 = *(void *)v36;
LABEL_5:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v36 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * v11);
      uint64_t v29 = 0LL;
      v30 = &v29;
      uint64_t v31 = 0x3032000000LL;
      v32 = __Block_byref_object_copy__35;
      v33 = __Block_byref_object_dispose__35;
      objc_msgSend(MEMORY[0x189603FA8], "array", v16);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = 0LL;
      v24 = &v23;
      uint64_t v25 = 0x3032000000LL;
      v26 = __Block_byref_object_copy__35;
      v27 = __Block_byref_object_dispose__35;
      id v28 = 0LL;
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __61___LSLocalQueryResolver__resolveQueries_XPCConnection_error___block_invoke;
      v22[3] = &unk_189D78168;
      v22[4] = &v29;
      v22[5] = &v23;
      -[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:]( self,  "_enumerateResolvedResultsOfQuery:XPCConnection:withBlock:",  v12,  v20,  v22);
      uint64_t v13 = v30[5];
      if (v13)
      {
        [v21 setObject:v30[5] forKeyedSubscript:v12];
      }

      else
      {

        id v14 = (id)v24[5];
        id v21 = 0LL;
        id v19 = v14;
      }

      _Block_object_dispose(&v23, 8);

      _Block_object_dispose(&v29, 8);
      if (!v13) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v9) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  else
  {
    id v19 = 0LL;
  }

  if (a5 && !v21) {
    *a5 = v19;
  }

  return v21;
}

- (void)_enumerateResolvedResultsOfQuery:(id)a3 XPCConnection:(id)a4 withBlock:(id)a5
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure];
  int v11 = v10;
  if (v7) {
    int v12 = v10;
  }
  else {
    int v12 = 0;
  }
  if (v12 != 1) {
    goto LABEL_15;
  }
  uint64_t v13 = (void *)MEMORY[0x186E2A59C]();
  id v32 = 0LL;
  [MEMORY[0x1896078F8] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v32];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v32;
  if (!v14)
  {
    _LSDefaultLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:].cold.2((uint64_t)v15, v18, v19);
    }
    goto LABEL_13;
  }

  id v31 = v15;
  uint64_t v16 = objc_msgSend(MEMORY[0x189607908], "ls_unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, &v31);
  id v17 = v31;

  if (!v16)
  {
    _LSDefaultLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:].cold.3((uint64_t)v17, v18, v20);
    }
    id v7 = 0LL;
    id v15 = v17;
LABEL_13:

    goto LABEL_14;
  }

  id v15 = v17;
  id v7 = (id)v16;
LABEL_14:

  objc_autoreleasePoolPop(v13);
LABEL_15:
  if (v8)
  {
    [v8 _xpcConnection];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v22 = _LSXPCConnectionMayMapDatabase(v21) == 0;
  }

  else
  {
    BOOL v22 = 0;
  }

  if (((v22 | v11 ^ 1) & 1) == 0) {
    BOOL v22 = +[_LSQueryContext simulateLimitedMappingForXCTests]( &OBJC_CLASS____LSQueryContext,  "simulateLimitedMappingForXCTests");
  }
  if (!v22) {
    goto LABEL_27;
  }
  if ([v7 isLegacy])
  {
    _LSDefaultLog();
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [v8 processIdentifier];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v24;
      _os_log_impl( &dword_183E58000,  v23,  OS_LOG_TYPE_DEFAULT,  "Unentitled query %{public}@ issued from pid %i. Allowing due to legacy SPI.",  buf,  0x12u);
    }

LABEL_27:
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v36 = 0;
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __82___LSLocalQueryResolver__enumerateResolvedResultsOfQuery_XPCConnection_withBlock___block_invoke;
    v28[3] = &unk_189D78190;
    v30 = buf;
    id v29 = v9;
    [v7 _enumerateWithXPCConnection:v8 block:v28];
    uint64_t v25 = v29;
    goto LABEL_28;
  }

  _LSDefaultLog();
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:]( (uint64_t)v7,  v37,  [v8 processIdentifier],  v26);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v36 = 0;
  uint64_t v33 = *MEMORY[0x189607490];
  id v34 = @"Query not allowed";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -54LL,  (uint64_t)"-[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:]",  308LL,  v27);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, void, void *, uint64_t))v9 + 2))(v9, 0LL, v25, *(void *)&buf[8] + 24LL);
LABEL_28:

  _Block_object_dispose(buf, 8);
}

- (void)_enumerateResolvedResultsOfQuery:(int)a3 XPCConnection:(os_log_t)log withBlock:.cold.1( uint64_t a1,  uint8_t *buf,  int a3,  os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Unentitled query %{public}@ issued from pid %i. Disallowing and yielding an error.",  buf,  0x12u);
}

- (void)_enumerateResolvedResultsOfQuery:(uint64_t)a1 XPCConnection:(os_log_s *)a2 withBlock:(uint64_t)a3 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_5(&dword_183E58000, a2, a3, "Failed to encode query: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_enumerateResolvedResultsOfQuery:(uint64_t)a1 XPCConnection:(os_log_s *)a2 withBlock:(uint64_t)a3 .cold.3( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_5(&dword_183E58000, a2, a3, "Failed to decode query: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end