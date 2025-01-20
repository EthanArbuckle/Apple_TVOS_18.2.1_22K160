@interface LSDatabaseRebuildContext
+ (id)currentRebuildContextIfExists;
+ (void)withStatsGatherer:(void *)a3 runWithRebuildContext:;
- (LSDatabaseRebuildContext)initWithStatsGatherer:(id)a3;
- (id)finishAndArmSaveTimer;
- (void)noteRebuildError:(uint64_t)a1;
- (void)registerItems:(uint64_t)a1;
@end

@implementation LSDatabaseRebuildContext

- (LSDatabaseRebuildContext)initWithStatsGatherer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LSDatabaseRebuildContext;
  v6 = -[LSDatabaseRebuildContext init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statsGatherer, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    overriddenPlugins = v7->_overriddenPlugins;
    v7->_overriddenPlugins = v8;
  }

  return v7;
}

+ (id)currentRebuildContextIfExists
{
  id v0 = (id)currentContext;
  os_unfair_lock_unlock(&rebuildContextLock);
  return v0;
}

+ (void)withStatsGatherer:(void *)a3 runWithRebuildContext:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_self();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __68__LSDatabaseRebuildContext_withStatsGatherer_runWithRebuildContext___block_invoke;
  v9[3] = &unk_189D738D8;
  v12 = sel_withStatsGatherer_runWithRebuildContext_;
  uint64_t v13 = v6;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  _LSServer_ExecuteSyncWithQuiescedInstallationActivity(v9);
}

void __68__LSDatabaseRebuildContext_withStatsGatherer_runWithRebuildContext___block_invoke(void *a1)
{
  if (currentContext)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 handleFailureInMethod:a1[6] object:a1[7] file:@"LSApplicationWorkspace.m" lineNumber:5451 description:@"can't start rebuild context: one already exists!"];
  }

  id v5 = -[LSDatabaseRebuildContext initWithStatsGatherer:]( objc_alloc(&OBJC_CLASS___LSDatabaseRebuildContext),  "initWithStatsGatherer:",  a1[4]);
  objc_storeStrong((id *)&currentContext, v5);
  os_unfair_lock_unlock(&rebuildContextLock);
  (*(void (**)(void))(a1[5] + 16LL))();
  os_unfair_lock_lock(&rebuildContextLock);
  v2 = v5;
  if ((LSDatabaseRebuildContext *)currentContext != v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 handleFailureInMethod:a1[6] object:a1[7] file:@"LSApplicationWorkspace.m" lineNumber:5457 description:@"can't end rebuild context: current context is different!?"];

    v2 = (LSDatabaseRebuildContext *)currentContext;
  }

  currentContext = 0LL;

  os_unfair_lock_unlock(&rebuildContextLock);
}

- (void)registerItems:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id obj = a2;
  if (a1)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v27 = *(void *)v29;
      uint64_t v5 = *MEMORY[0x189604E00];
      do
      {
        uint64_t v6 = 0LL;
        do
        {
          if (*(void *)v29 != v27) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(a1 + 16);
          id v8 = *(id *)(*((void *)&v28 + 1) + 8 * v6);
          id v9 = v7;
          [v8 objectForKey:v5];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 objectForKey:@"ApplicationType"];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          _LSLogStepStart(13LL, 0LL, v10, @"begin inspect %@", v12, v13, v14, v15, (uint64_t)v11);
          _LSServer_DatabaseExecutionContext();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = MEMORY[0x1895F87A8];
          v32[1] = 3221225472LL;
          v32[2] = __registerSingleMIDict_block_invoke;
          v32[3] = &unk_189D736F0;
          id v33 = v8;
          id v34 = v11;
          id v35 = v9;
          id v36 = v10;
          id v17 = v8;
          id v18 = v11;
          id v19 = v9;
          id v20 = v10;
          -[LSDBExecutionContext syncWrite:]((uint64_t)v16, v32);

          _LSLogStepFinished(13LL, 1LL, v20, @"end inspect %@", v21, v22, v23, v24, (uint64_t)v18);
          [v17 objectForKey:@"ApplicationType"];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[LSRebuildStatisticsGatherer registeredBundleOfType:](*(void *)(a1 + 8), v25);

          ++v6;
        }

        while (v4 != v6);
        uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
      }

      while (v4);
    }
  }
}

- (void)noteRebuildError:(uint64_t)a1
{
  newValue = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 24), a2);
    -[LSRebuildStatisticsGatherer setRebuildError:](*(void **)(a1 + 8), newValue);
  }
}

- (id)finishAndArmSaveTimer
{
  if (a1)
  {
    v1 = a1;
    _LSServer_DatabaseExecutionContext();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext syncWrite:]((uint64_t)v2, &__block_literal_global_717);

    a1 = (id *)v1[3];
  }

  return a1;
}

void __49__LSDatabaseRebuildContext_finishAndArmSaveTimer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v9 = 0LL;
  id v10 = 0LL;
  int inited = _LSContextInitReturningError((uint64_t)&v10, (uint64_t)&v9);
  id v7 = v9;
  if (inited)
  {
  }

  else
  {
    _LSDefaultLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__LSDatabaseRebuildContext_finishAndArmSaveTimer__block_invoke_cold_1();
    }
  }
}

- (void).cxx_destruct
{
}

void __49__LSDatabaseRebuildContext_finishAndArmSaveTimer__block_invoke_cold_1()
{
}

@end