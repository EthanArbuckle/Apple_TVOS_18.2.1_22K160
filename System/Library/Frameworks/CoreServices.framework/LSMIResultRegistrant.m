@interface LSMIResultRegistrant
- (LSMIResultRegistrant)initWithContext:(id)a3 operationUUID:(id)a4 itemInfoDict:(id)a5 personas:(id)a6;
- (void)_replyWithError:(id)a3 onQueue:(id)a4 block:(id)a5;
- (void)runPostProcessingForBundleID:(id)a3 success:(BOOL)a4 isSystemApp:(BOOL)a5 isPlaceholder:(BOOL)a6 registeredBothFullAppAndPlaceholder:(BOOL)a7 notificationJournaller:(id)a8;
- (void)runWithCompletion:(id)a3;
@end

@implementation LSMIResultRegistrant

- (LSMIResultRegistrant)initWithContext:(id)a3 operationUUID:(id)a4 itemInfoDict:(id)a5 personas:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___LSMIResultRegistrant;
  v15 = -[LSMIResultRegistrant init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_strategy, a3);
    objc_storeStrong((id *)&v16->_uuid, a4);
    uint64_t v17 = [v13 copy];
    miDict = v16->_miDict;
    v16->_miDict = (NSDictionary *)v17;

    uint64_t v19 = [v14 copy];
    personas = v16->_personas;
    v16->_personas = (NSSet *)v19;
  }

  return v16;
}

- (void)_replyWithError:(id)a3 onQueue:(id)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __54__LSMIResultRegistrant__replyWithError_onQueue_block___block_invoke;
  v11[3] = &unk_189D78CB0;
  id v12 = v7;
  id v13 = v8;
  id v9 = v7;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)a4, v11);
}

uint64_t __54__LSMIResultRegistrant__replyWithError_onQueue_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

- (void)runPostProcessingForBundleID:(id)a3 success:(BOOL)a4 isSystemApp:(BOOL)a5 isPlaceholder:(BOOL)a6 registeredBothFullAppAndPlaceholder:(BOOL)a7 notificationJournaller:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  v21[1] = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a8;
  if (v12)
  {
    if (v11)
    {
      v15 = +[LSApplicationRestrictionsManager sharedInstance]();
      char v16 = -[LSApplicationRestrictionsManager setApplication:removed:]((uint64_t)v15, v13, 0);

      if ((v16 & 1) != 0) {
        _LSNoteSystemAppInstallOrUninstall((uint64_t)v13, 1u);
      }
    }

    if (v10) {
      unsigned int v17 = 1;
    }
    else {
      unsigned int v17 = 7;
    }
    if (v9) {
      uint64_t v18 = 15LL;
    }
    else {
      uint64_t v18 = v17;
    }
    if (!v10)
    {
      +[_LSInstallProgressService sharedInstance](&OBJC_CLASS____LSInstallProgressService, "sharedInstance");
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 installationEndedForApplication:v13 withState:5];
    }
  }

  else
  {
    uint64_t v18 = 11LL;
  }

  v21[0] = v13;
  [MEMORY[0x189603F18] arrayWithObjects:v21 count:1];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 sendNotification:v18 forApps:v20 withPlugins:0];

  [v14 writeFinalJournal];
  [v14 removeJournalAfterNotificationFence];
}

- (void)runWithCompletion:(id)a3
{
  v50[1] = *MEMORY[0x1895F89C0];
  id v32 = a3;
  v4 = self->_miDict;
  v5 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", *MEMORY[0x189604E00]);
  uint64_t v6 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"Path");
  v31 = (void *)v6;
  v33 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"ParallelPlaceholderPath");
  v30 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"ApplicationType");
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = @"No bundle identifier provided. ";
    if (v5) {
      id v8 = &stru_189D7B4C8;
    }
    BOOL v9 = v8;
    BOOL v10 = v9;
    if (v6) {
      BOOL v11 = &stru_189D7B4C8;
    }
    else {
      BOOL v11 = @"No path provided.";
    }
    uint64_t v12 = -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", v11);

    uint64_t v49 = *MEMORY[0x189607490];
    v50[0] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v50 forKeys:&v49 count:1];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v12;
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[LSMIResultRegistrant runWithCompletion:]",  182LL,  v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void, void, void *))v32 + 2))(v32, 0LL, 0LL, v14);
  }

  else
  {
    v15 = -[NSDictionary objectForKey:](v4, "objectForKey:", @"ParallelPlaceholderPath");
    BOOL v16 = v15 != 0LL;

    if (v15)
    {
      uint64_t v17 = 1LL;
    }

    else
    {
      -[NSDictionary objectForKey:](v4, "objectForKey:", @"IsPlaceholder");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v18 BOOLValue];
    }
    v29 = -[LSMIResultRegistrantStrategy notificationJournallerForBundleIdentifier:registeringPlaceholder:]( self->_strategy,  "notificationJournallerForBundleIdentifier:registeringPlaceholder:",  v5,  v17);
    id v14 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v6 isDirectory:1];
    if (v33) {
      v28 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v33];
    }
    else {
      v28 = 0LL;
    }
    id v48 = 0LL;
    v27 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v14,  0LL,  &v48);
    BOOL v19 = v16;
    id v20 = v48;
    if (v28)
    {
      id v47 = v20;
      v21 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v28,  0LL,  &v47);
      id v22 = v47;

      id v20 = v22;
    }

    else
    {
      v21 = 0LL;
    }

    if (v27 && (!v33 || v21))
    {
      if (v21) {
        v23 = v21;
      }
      else {
        v23 = v27;
      }
      v24 = v23;
      -[LSMIResultRegistrantStrategy beginModificationOperation](self->_strategy, "beginModificationOperation");
      strategy = self->_strategy;
      v34[0] = MEMORY[0x1895F87A8];
      v34[1] = 3221225472LL;
      v34[2] = __42__LSMIResultRegistrant_runWithCompletion___block_invoke;
      v34[3] = &unk_189D78D28;
      id v35 = v5;
      v36 = v4;
      char v45 = v17;
      BOOL v46 = v19;
      v37 = v27;
      v38 = self;
      id v39 = v33;
      v25 = v24;
      v40 = v25;
      id v41 = v20;
      id v42 = v30;
      id v43 = v29;
      id v44 = v32;
      -[LSMIResultRegistrantStrategy runSyncBlockInWriteContext:](strategy, "runSyncBlockInWriteContext:", v34);
    }

    else
    {
      -[LSMIResultRegistrant runPostProcessingForBundleID:success:isSystemApp:isPlaceholder:registeredBothFullAppAndPlaceholder:notificationJournaller:]( self,  "runPostProcessingForBundleID:success:isSystemApp:isPlaceholder:registeredBothFullAppAndPlaceholder:notificationJournaller:",  v5,  0,  [v30 isEqualToString:@"System"],  v17,  0,  v29);
      (*((void (**)(id, void, void, id))v32 + 2))(v32, 0LL, 0LL, v20);
    }
  }
}

void __42__LSMIResultRegistrant_runWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  _LSLogStepStart(4LL, 0LL, *(NSString **)(a1 + 32), @"Registering bundles via registrant - start");
  id v54 = 0LL;
  v51 = 0LL;
  id v52 = 0LL;
  char v53 = 0;
  v4 = (void *)[*(id *)(a1 + 40) mutableCopy];
  id v50 = 0LL;
  [v3 databaseContextWithError:&v50];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v50;
  if (!v5)
  {
    BOOL v8 = 0;
    LODWORD(v9) = 0;
    BOOL v10 = 0LL;
    goto LABEL_32;
  }

  if (!*(_BYTE *)(a1 + 112)) {
    goto LABEL_23;
  }
  if (*(_BYTE *)(a1 + 113))
  {
    if ([v5 fullBundleExistsForIdentifier:*(void *)(a1 + 32) matchingNode:*(void *)(a1 + 48)])
    {
      unsigned int v7 = 0;
    }

    else
    {
      _LSInstallLog();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v56 = v15;
        _os_log_impl( &dword_183E58000,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ registration is for parallel placeholder but full app is not registered; registering it",
          buf,
          0xCu);
      }

      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 32LL);
      id v49 = v6;
      unsigned int v7 = [v5 findOrRegisterContainerizedNodeReinitializingContext:v16 installDictionary:v17 personasWithAttributes:v18 error:&v49];
      id v19 = v49;

      if (v7)
      {
        _LSInstallLog();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v56 = v21;
          __int16 v57 = 2048;
          uint64_t v58 = v7;
          _os_log_impl( &dword_183E58000,  v20,  OS_LOG_TYPE_DEFAULT,  "Successfully registered full app for %@: %llx",  buf,  0x16u);
        }

        unsigned int v7 = 1;
      }

      id v6 = v19;
    }

    [v4 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"Path"];
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"IsPlaceholder"];
    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"IsParallelPlaceholder"];
    goto LABEL_24;
  }

  [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"IsPlaceholder"];
  if ([v5 fullBundleExistsForIdentifier:*(void *)(a1 + 32) matchingNode:0]) {
    goto LABEL_20;
  }
  [*(id *)(a1 + 40) objectForKeyedSubscript:@"LSInstallType"];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v12 = [v11 integerValue];
  int v13 = v12;
  if (v12 >= 7)
  {
    if (v12 - 7 >= 4)
    {
      _LSDefaultLog();
      id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        __42__LSMIResultRegistrant_runWithCompletion___block_invoke_cold_1(v13, v35);
      }

      goto LABEL_9;
    }

LABEL_20:
    _LSInstallLog();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_183E58000,  v22,  OS_LOG_TYPE_DEFAULT,  "while registering placeholder, found existing full bundle but not registering a parallel placeholder; noting pla"
        "ceholder registration is a downgrade",
        buf,
        2u);
    }

    [v4 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"LSAppDowngrade"];
    goto LABEL_23;
  }

void __42__LSMIResultRegistrant_runWithCompletion___block_invoke_94( uint64_t a1,  int a2,  uint64_t a3,  void *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  _LSInstallLog();
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(unsigned int *)(a1 + 40);
    int v12 = 134218498;
    uint64_t v13 = v8;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "Save after registration for unit %llx attempted: %d save error: %@",  (uint8_t *)&v12,  0x1Cu);
  }

  id v9 = v6;
  BOOL v10 = v9;
  if ((a2 & 1) == 0)
  {
    uint64_t v11 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  89LL,  (uint64_t)"-[LSMIResultRegistrant runWithCompletion:]_block_invoke",  270LL,  0LL);

    BOOL v10 = (void *)v11;
  }

  [*(id *)(a1 + 32) saveDidHappen:v10 == 0 error:v10];
}

uint64_t __42__LSMIResultRegistrant_runWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "runPostProcessingForBundleID:success:isSystemApp:isPlaceholder:registeredBothFullAppAndPlaceholder:notificationJournaller:",  *(void *)(a1 + 40),  *(void *)(a1 + 48) == 0,  objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", @"System"),  *(unsigned __int8 *)(a1 + 72),  *(unsigned __int8 *)(a1 + 73),  *(void *)(a1 + 64));
}

- (void).cxx_destruct
{
}

void __42__LSMIResultRegistrant_runWithCompletion___block_invoke_cold_1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_183E58000, a2, OS_LOG_TYPE_FAULT, "install type %d not handled", (uint8_t *)v2, 8u);
}

@end