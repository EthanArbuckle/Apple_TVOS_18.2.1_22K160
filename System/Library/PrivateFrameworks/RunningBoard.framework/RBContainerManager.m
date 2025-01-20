@interface RBContainerManager
- (BOOL)containerRequiredForServiceDict:(id)a3;
- (OptionalUID)_fetchCacheUIDChoice:(id)a3;
- (RBContainerManager)initWithPersonaManager:(id)a3;
- (id)_allowedContainerOverrideIdentifiers;
- (id)_lookupContainerPathForIdentity:(id)a3 context:(id)a4 persona:(id)a5 containerIdentifier:(id)a6 retry:(BOOL)a7 error:(id *)a8;
- (id)_retryLookupAfterCacheMissForIdentity:(id)a3 context:(id)a4 persona:(id)a5 containerIdentifier:(id)a6;
- (id)_sandboxContainerURLForExtensionContext:(id)a3 containerOverrideIdentifier:(id)a4;
- (id)containerPathForIdentity:(id)a3 context:(id)a4 persona:(id)a5 error:(id *)a6;
- (id)sandboxContainerURLForExtensionContext:(id)a3 containerOverrideIdentifier:(id)a4;
- (void)_fetchCache:(id)a3;
- (void)_probeCache:(const void *)a3 withContainerIdentifier:(id)a4 persona:(id)a5 completionHandler:(id)a6;
- (void)_probeCacheSubqueryIterationEvaluate:(container_object_s *)a3 withAccummulatedState:(ProbeCacheSubqueryIterationAccumulatedState *)a4;
- (void)dealloc;
@end

@implementation RBContainerManager

- (RBContainerManager)initWithPersonaManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RBContainerManager;
  v6 = -[RBContainerManager init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_personaManager, a3);
  }

  return v7;
}

- (OptionalUID)_fetchCacheUIDChoice:(id)a3
{
  return (OptionalUID)0LL;
}

- (void)_fetchCache:(id)a3
{
  OptionalUID v4 = -[RBContainerManager _fetchCacheUIDChoice:](self, "_fetchCacheUIDChoice:", a3);
  unsigned int v5 = *(_DWORD *)&v4.set;
  unint64_t v6 = HIDWORD(*(unint64_t *)&v4);
  BOOL set = v4.set;
  BOOL v9 = self->_queryUID.set && set && self->_queryUID.uid != v4.uid;
  if (self->_queryUID.set != set || v9)
  {
    container_query_free();
    self->_queryForApps = 0LL;
    container_query_free();
    self->_queryForPlugins = 0LL;
    rbs_job_log();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_188634000, v11, OS_LOG_TYPE_DEFAULT, "Discarded container cache on UID change", v12, 2u);
    }
  }

  if (!self->_queryForApps)
  {
    self->_queryForApps = (container_query_s *)container_query_create();
    container_query_set_class();
    container_query_operation_set_flags();
    container_query_set_include_other_owners();
    if (set) {
      container_query_set_uid();
    }
    self->_queryUID.BOOL set = v5;
    *(&self->_queryUID.set + 3) = HIBYTE(v5);
    *(_WORD *)(&self->_queryUID.set + 1) = v5 >> 8;
    self->_queryUID.uid = v6;
  }

- (id)_retryLookupAfterCacheMissForIdentity:(id)a3 context:(id)a4 persona:(id)a5 containerIdentifier:(id)a6
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [a5 UTF8String];
  container_query_create();
  container_query_set_class();
  container_query_operation_set_flags();
  container_query_set_include_other_owners();
  id v14 = v12;
  xpc_object_t v15 = xpc_string_create((const char *)[v14 UTF8String]);
  container_query_set_identifiers();
  if (v13) {
    container_query_set_persona_unique_string();
  }
  [v10 platform];
  container_query_operation_set_platform();
  if (container_query_get_single_result() && (uint64_t path = container_get_path()) != 0)
  {
    uint64_t v17 = path;
    container_query_free();
    self->_queryForApps = 0LL;
    container_query_free();
    self->_queryForPlugins = 0LL;
    rbs_job_log();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl( &dword_188634000,  v18,  OS_LOG_TYPE_DEFAULT,  "Discarded container cache after retry",  (uint8_t *)&v23,  2u);
    }

    [NSString stringWithUTF8String:v17];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    rbs_job_log();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      [v11 bundleIdentifier];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v23 = 138543874;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v14;
      __int16 v27 = 2114;
      v28 = v21;
      _os_log_impl( &dword_188634000,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Container path could not be computed for identifier '%{public}@', will not be passed to launch of %{public}@",  (uint8_t *)&v23,  0x20u);
    }

    v19 = 0LL;
  }

  container_query_free();

  return v19;
}

- (void)_probeCacheSubqueryIterationEvaluate:(container_object_s *)a3 withAccummulatedState:(ProbeCacheSubqueryIterationAccumulatedState *)a4
{
  v29[1] = *MEMORY[0x1895F89C0];
  ++a4->var2;
  if (!a4->var0)
  {
    uint64_t path = (const char *)container_get_path();
    uint64_t v6 = container_copy_sandbox_token();
    v7 = (void *)v6;
    if (path && v6)
    {
      uint64_t v8 = sandbox_extension_consume();
      uint64_t v9 = *__error();
      free(v7);
      if ((v8 & 0x8000000000000000LL) == 0)
      {
        if (access(path, 0))
        {
          if (*__error() == 2 || a4->var1) {
            goto LABEL_19;
          }
          uint64_t v10 = *__error();
          [NSString stringWithFormat:@"access test failed while computing process container path"];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          _posixErrorWithCodeAndDescription(v10, v11);
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          id var1 = a4->var1;
          a4->id var1 = v12;
        }

        else
        {
          [MEMORY[0x1896078A8] defaultManager];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 stringWithFileSystemRepresentation:path length:strlen(path)];
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
          id var1 = a4->var0;
          a4->var0 = v27;
        }

LABEL_19:
        sandbox_extension_release();
        return;
      }

      if (!a4->var1)
      {
        objc_msgSend( NSString,  "stringWithFormat:",  @"Container token could not be consumed: errno %d",  v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x189607870];
        uint64_t v23 = *MEMORY[0x189607688];
        uint64_t v28 = *MEMORY[0x1896075E0];
        v29[0] = v21;
        [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:&v28 count:1];
        id v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 errorWithDomain:v23 code:22 userInfo:v24];
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();

        id v26 = a4->var1;
        a4->id var1 = v25;
      }
    }

    else
    {
      if (!a4->var1)
      {
        id v14 = "path";
        if (path) {
          id v14 = "token";
        }
        objc_msgSend(NSString, "stringWithFormat:", @"Container did not have a %s", v14);
        xpc_object_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x189607870];
        uint64_t v17 = *MEMORY[0x189607688];
        uint64_t v28 = *MEMORY[0x1896075E0];
        v29[0] = v15;
        [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:&v28 count:1];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 errorWithDomain:v17 code:22 userInfo:v18];
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        id v20 = a4->var1;
        a4->id var1 = v19;
      }

      free(v7);
    }
  }

- (void)_probeCache:(const void *)a3 withContainerIdentifier:(id)a4 persona:(id)a5 completionHandler:(id)a6
{
  v24[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(id, void, void *))a6;
  container_query_create();
  id v11 = v8;
  xpc_object_t v12 = xpc_string_create((const char *)[v11 UTF8String]);
  container_query_set_identifiers();
  id v13 = v9;
  if ([v13 UTF8String]) {
    container_query_set_persona_unique_string();
  }
  v22 = 0LL;
  if ((container_query_iterate_results_with_subquery_sync() & 1) == 0)
  {
    container_query_get_last_error();
    id v14 = (void *)container_error_copy_unlocalized_description();
    objc_msgSend( NSString,  "stringWithFormat:",  @"container_query_iterate_results_with_subquery_sync failed. Container Manager error = %s",  v14);
    xpc_object_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x189607870];
    uint64_t v23 = *MEMORY[0x1896075E0];
    v24[0] = v15;
    uint64_t v17 = (void *)MEMORY[0x189603F68];
    id v18 = v15;
    [v17 dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v16 errorWithDomain:*MEMORY[0x189607688] code:22 userInfo:v19];

    v22 = (void *)v20;
    free(v14);
  }

  container_query_free();
  if (v22)
  {

    v21 = v22;
  }

  else
  {
    v21 = 0LL;
  }

  v10[2](v10, 0LL, v21);
}

uint64_t __84__RBContainerManager__probeCache_withContainerIdentifier_persona_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  return 1LL;
}

- (id)_lookupContainerPathForIdentity:(id)a3 context:(id)a4 persona:(id)a5 containerIdentifier:(id)a6 retry:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v29 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v38 = 0LL;
  v39[0] = &v38;
  v39[1] = 0x3032000000LL;
  v39[2] = __Block_byref_object_copy__3;
  v39[3] = __Block_byref_object_dispose__3;
  id v40 = 0LL;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  id v37 = 0LL;
  queryForApps = self->_queryForApps;
  uint64_t v18 = MEMORY[0x1895F87A8];
  v31[0] = MEMORY[0x1895F87A8];
  v31[1] = 3221225472LL;
  v31[2] = __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke;
  v31[3] = &unk_18A256808;
  v31[4] = &v32;
  v31[5] = &v38;
  -[RBContainerManager _probeCache:withContainerIdentifier:persona:completionHandler:]( self,  "_probeCache:withContainerIdentifier:persona:completionHandler:",  queryForApps,  v16,  v15,  v31);
  uint64_t v19 = v39[0];
  if (!v33[5] && !*(void *)(v39[0] + 40LL) && self->_queryForPlugins)
  {
    rbs_job_log();
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v42 = v14;
      __int16 v43 = 2114;
      id v44 = v16;
      _os_log_impl( &dword_188634000,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Attempting lookup in plugin cache of container path for container identifier (%{public}@)",  buf,  0x16u);
    }

    queryForPlugins = self->_queryForPlugins;
    v30[0] = v18;
    v30[1] = 3221225472LL;
    v30[2] = __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke_12;
    v30[3] = &unk_18A256808;
    v30[4] = &v32;
    v30[5] = &v38;
    -[RBContainerManager _probeCache:withContainerIdentifier:persona:completionHandler:]( self,  "_probeCache:withContainerIdentifier:persona:completionHandler:",  queryForPlugins,  v16,  v15,  v30);
    uint64_t v19 = v39[0];
  }

  if (*(void *)(v19 + 40))
  {
    rbs_job_log();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[RBContainerManager _lookupContainerPathForIdentity:context:persona:containerIdentifier:retry:error:].cold.1( (uint64_t)v14,  (uint64_t)v39,  v22);
    }
    id v23 = 0LL;
LABEL_11:

    if (!a8) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  __int16 v27 = (void *)v33[5];
  if (v27)
  {
    id v23 = v27;
    rbs_job_log();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543618;
    id v42 = v14;
    __int16 v43 = 2114;
    id v44 = v23;
    uint64_t v28 = "%{public}@ Found container path (%{public}@)";
LABEL_21:
    _os_log_impl(&dword_188634000, v22, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
    goto LABEL_11;
  }

  if (v9)
  {
    -[RBContainerManager _retryLookupAfterCacheMissForIdentity:context:persona:containerIdentifier:]( self,  "_retryLookupAfterCacheMissForIdentity:context:persona:containerIdentifier:",  v14,  v29,  v15,  v16);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    rbs_job_log();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543618;
    id v42 = v14;
    __int16 v43 = 2114;
    id v44 = v23;
    uint64_t v28 = "%{public}@ Found container path on retry (%{public}@)";
    goto LABEL_21;
  }

  id v23 = 0LL;
  if (!a8) {
    goto LABEL_14;
  }
LABEL_12:
  id v24 = *(void **)(v39[0] + 40LL);
  if (v24) {
    *a8 = v24;
  }
LABEL_14:
  id v25 = v23;
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v25;
}

void __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __102__RBContainerManager__lookupContainerPathForIdentity_context_persona_containerIdentifier_retry_error___block_invoke_12( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)containerPathForIdentity:(id)a3 context:(id)a4 persona:(id)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v10 = (char *)a3;
  id v11 = a4;
  id v12 = a5;
  [v11 containerIdentifier];
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (v13 || ([v11 bundleIdentifier], (id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    rbs_job_log();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v25 = v10;
      __int16 v26 = 2114;
      double v27 = *(double *)&v12;
      __int16 v28 = 2114;
      id v29 = v13;
      _os_log_impl( &dword_188634000,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Looking up container path with persona %{public}@ using container identifier '%{public}@'",  buf,  0x20u);
    }

    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if (v12 && -[RBPersonaManager isConcretePersona:](self->_personaManager, "isConcretePersona:", v12)) {
        goto LABEL_13;
      }
      rbs_job_log();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v25 = v10;
        __int16 v26 = 2114;
        double v27 = *(double *)&v12;
        _os_log_impl( &dword_188634000,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Persona (%{public}@) for launch context is not a concrete persona - converting to Personal",  buf,  0x16u);
      }

      uint64_t v16 = -[RBPersonaManager personalPersonaUniqueString](self->_personaManager, "personalPersonaUniqueString");

      id v12 = (id)v16;
    }

    if (!v12)
    {
      id v17 = 0LL;
      uint64_t v18 = 0LL;
      if (-[RBPersonaManager personasAreSupported](self->_personaManager, "personasAreSupported"))
      {
LABEL_18:

        goto LABEL_19;
      }
    }

- (id)_sandboxContainerURLForExtensionContext:(id)a3 containerOverrideIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = (char)-[RBContainerManager _fetchCacheUIDChoice:](self, "_fetchCacheUIDChoice:", v6);
  container_query_create();
  if (v7)
  {
    id v9 = v7;
  }

  else
  {
    [v6 identity];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 xpcServiceIdentifier];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  [v6 identity];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 personaString];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    [v6 identity];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = [v13 personaString];
    [v14 UTF8String];
    container_query_set_persona_unique_string();
  }

  id v15 = v9;
  xpc_object_t v16 = xpc_string_create((const char *)[v15 UTF8String]);
  container_query_set_identifiers();

  container_query_set_class();
  container_query_set_include_other_owners();
  container_query_operation_set_flags();
  dyld_get_active_platform();
  container_query_operation_set_platform();
  if ((v8 & 1) != 0) {
    container_query_set_uid();
  }
  if (container_query_get_single_result())
  {
    id v17 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithFileSystemRepresentation:container_get_path() isDirectory:1 relativeToURL:0];
  }

  else
  {
    container_query_get_last_error();
    uint64_t v18 = (void *)container_error_copy_unlocalized_description();
    rbs_job_log();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[RBContainerManager _sandboxContainerURLForExtensionContext:containerOverrideIdentifier:].cold.1( (uint64_t)v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25);
    }

    free(v18);
    id v17 = 0LL;
  }

  container_query_free();

  return v17;
}

- (id)_allowedContainerOverrideIdentifiers
{
  if (_allowedContainerOverrideIdentifiers_onceToken != -1) {
    dispatch_once(&_allowedContainerOverrideIdentifiers_onceToken, &__block_literal_global_11);
  }
  return (id)_allowedContainerOverrideIdentifiers_allowed;
}

void __58__RBContainerManager__allowedContainerOverrideIdentifiers__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x189604010]) initWithArray:&unk_18A26F740];
  v1 = (void *)_allowedContainerOverrideIdentifiers_allowed;
  _allowedContainerOverrideIdentifiers_allowed = v0;
}

- (id)sandboxContainerURLForExtensionContext:(id)a3 containerOverrideIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && (-[RBContainerManager _allowedContainerOverrideIdentifiers](self, "_allowedContainerOverrideIdentifiers"),
        char v8 = (void *)objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 containsObject:v7],
        v8,
        (v9 & 1) == 0))
  {
    rbs_job_log();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[RBContainerManager sandboxContainerURLForExtensionContext:containerOverrideIdentifier:].cold.1( (uint64_t)v7,  v11,  v12,  v13,  v14,  v15,  v16,  v17);
    }

    uint64_t v10 = 0LL;
  }

  else
  {
    voucher_adopt();
    -[RBContainerManager _sandboxContainerURLForExtensionContext:containerOverrideIdentifier:]( self,  "_sandboxContainerURLForExtensionContext:containerOverrideIdentifier:",  v6,  v7);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)containerRequiredForServiceDict:(id)a3
{
  id v3 = a3;
  xpc_dictionary_get_value(v3, "_SandboxContainer");
  OptionalUID v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    BOOL v5 = 0;
  }

  else
  {
    xpc_dictionary_get_value(v3, "_MultipleInstances");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = v6 == 0LL;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBContainerManager;
  -[RBContainerManager dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (void)_lookupContainerPathForIdentity:(os_log_t)log context:persona:containerIdentifier:retry:error:.cold.1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(*(void *)a2 + 40LL);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl( &dword_188634000,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ Error during container manager lookup: %{public}@",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_sandboxContainerURLForExtensionContext:(uint64_t)a3 containerOverrideIdentifier:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_188634000, a2, a3, "Failed to get container path; error = %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)sandboxContainerURLForExtensionContext:(uint64_t)a3 containerOverrideIdentifier:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end