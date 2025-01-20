@interface LSMIResultUnregistrant
- (LSMIResultUnregistrant)initWithContext:(id)a3 operationUUID:(id)a4 bundleIdentifier:(id)a5 precondition:(id)a6 type:(unsigned int)a7;
- (void)runWithCompletion:(id)a3;
@end

@implementation LSMIResultUnregistrant

- (LSMIResultUnregistrant)initWithContext:(id)a3 operationUUID:(id)a4 bundleIdentifier:(id)a5 precondition:(id)a6 type:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___LSMIResultUnregistrant;
  v17 = -[LSMIResultUnregistrant init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_strategy, a3);
    objc_storeStrong((id *)&v18->_uuid, a4);
    uint64_t v19 = [v15 copy];
    bundleID = v18->_bundleID;
    v18->_bundleID = (NSString *)v19;

    if (v16)
    {
      v21 = (LSPrecondition *)v16;
    }

    else
    {
      +[LSPrecondition emptyPrecondition](&OBJC_CLASS___LSPrecondition, "emptyPrecondition");
      v21 = (LSPrecondition *)objc_claimAutoreleasedReturnValue();
    }

    precondition = v18->_precondition;
    v18->_precondition = v21;

    v18->_type = a7;
  }

  return v18;
}

- (void)runWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t))a3;
  v5 = -[LSMIResultRegistrantStrategy preUnregistrationContextForBundleIdentifier:]( self->_strategy,  "preUnregistrationContextForBundleIdentifier:",  self->_bundleID);
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = __Block_byref_object_copy__40;
  v29 = __Block_byref_object_dispose__40;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = __Block_byref_object_copy__40;
  v23 = __Block_byref_object_dispose__40;
  id v24 = 0LL;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x3032000000LL;
  v17[3] = __Block_byref_object_copy__118;
  v17[4] = __Block_byref_object_dispose__119;
  id v18 = 0LL;
  -[LSMIResultRegistrantStrategy beginModificationOperation](self->_strategy, "beginModificationOperation");
  strategy = self->_strategy;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __44__LSMIResultUnregistrant_runWithCompletion___block_invoke;
  v16[3] = &unk_189D78D78;
  v16[4] = self;
  v16[5] = &v25;
  v16[6] = v17;
  v16[7] = &v19;
  -[LSMIResultRegistrantStrategy runSyncBlockInWriteContext:](strategy, "runSyncBlockInWriteContext:", v16);
  registrationCleanupQueue();
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v7;
  uint64_t v11 = 3221225472LL;
  v12 = __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_2;
  id v13 = &unk_189D748F0;
  id v15 = v17;
  id v9 = v5;
  id v14 = v9;
  dispatch_async(v8, &v10);

  _LSLogStepFinished(6LL, v26[5] == 0, self->_bundleID, @"Unregister bundles - End", v10, v11, v12, v13);
  v4[2](v4, v20[5], v26[5]);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
}

void __44__LSMIResultUnregistrant_runWithCompletion___block_invoke(void *a1, void *a2)
{
  v36[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  _LSLogStepStart(6LL, 0LL, *(NSString **)(a1[4] + 24LL), @"Unregister bundles via unregistrant - Start");
  uint64_t v4 = *(void *)(a1[5] + 8LL);
  id obj = *(id *)(v4 + 40);
  [v3 databaseContextWithError:&obj];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1[5] + 8LL);
    id v9 = *(void **)(v6 + 40);
    uint64_t v7 = (id *)(v6 + 40);
    v8 = v9;
    id v10 = *(id *)(a1[4] + 32LL);
    if ([v10 isMet])
    {

      objc_storeStrong(v7, v8);
      uint64_t v11 = a1[4];
      uint64_t v12 = *(void *)(v11 + 24);
      uint64_t v13 = *(unsigned int *)(v11 + 40);
      uint64_t v14 = *(void *)(a1[5] + 8LL);
      id v33 = *(id *)(v14 + 40);
      uint64_t v15 = [v5 unregisterApplicationWithBundleIdentifier:v12 type:v13 error:&v33];
      objc_storeStrong((id *)(v14 + 40), v33);
      uint64_t v16 = *(void *)(a1[6] + 8LL);
      v17 = *(os_log_s **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }

    else
    {
      [NSString stringWithFormat:@"Precondition not met: %@", v10];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = *MEMORY[0x189607490];
      *(void *)buf = v18;
      [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:v36 count:1];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl(@"LSApplicationWorkspaceErrorDomain", 117LL, (uint64_t)"validatePrecondition", 324LL, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      id v21 = v20;

      objc_storeStrong(v7, v20);
      _LSInstallLog();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1[4] + 32LL);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v22;
        _os_log_impl(&dword_183E58000, v17, OS_LOG_TYPE_DEFAULT, "Unregistration precondition not met: %@", buf, 0xCu);
      }
    }

    [*(id *)(a1[4] + 8) endModificationOperation];
    uint64_t v23 = a1[4];
    if (*(void *)(*(void *)(a1[6] + 8LL) + 40LL))
    {
      id v24 = *(id *)(v23 + 24);
      uint64_t v25 = -[_LSDModificationPendingSaveToken initWithUUID:]( objc_alloc(&OBJC_CLASS____LSDModificationPendingSaveToken),  "initWithUUID:",  *(void *)(a1[4] + 16LL));
      uint64_t v26 = *(void *)(a1[7] + 8LL);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      v30[0] = MEMORY[0x1895F87A8];
      v30[1] = 3221225472LL;
      v30[2] = __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_122;
      v30[3] = &unk_189D78D50;
      id v28 = v24;
      uint64_t v29 = a1[7];
      id v31 = v28;
      uint64_t v32 = v29;
      [v3 armSaveTimerIfNecessary:v30];
    }

    else
    {
      [*(id *)(v23 + 8) flushModificationState];
    }
  }
}

void __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_122( uint64_t a1,  int a2,  uint64_t a3,  void *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  _LSInstallLog();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v12 = 138412802;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "Save after unregistration for %@ attempted: %d save error: %@",  (uint8_t *)&v12,  0x1Cu);
  }

  id v9 = v6;
  id v10 = v9;
  if ((a2 & 1) == 0)
  {
    uint64_t v11 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  89LL,  (uint64_t)"-[LSMIResultUnregistrant runWithCompletion:]_block_invoke",  354LL,  0LL);

    id v10 = (void *)v11;
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) saveDidHappen:v10 == 0 error:v10];
}

uint64_t __44__LSMIResultUnregistrant_runWithCompletion___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL);
  if (v1) {
    return (*(uint64_t (**)(void, void))(v1 + 16))( *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL),  *(void *)(result + 32));
  }
  return result;
}

- (void).cxx_destruct
{
}

@end