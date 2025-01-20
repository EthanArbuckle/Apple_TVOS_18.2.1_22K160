@interface MCMCommandDiskUsageForContainer
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandDiskUsageForContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (void)execute;
@end

@implementation MCMCommandDiskUsageForContainer

- (MCMCommandDiskUsageForContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandDiskUsageForContainer;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  v2 = self;
  v3 = -[MCMCommand context](self, "context");
  [v3 clientIdentity];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMCommandDiskUsageForContainer concreteContainerIdentity](v2, "concreteContainerIdentity");
  LOBYTE(v2) = [v4 isAllowedToLookupContainerIdentity:v5];

  return (char)v2;
}

- (void)execute
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  uint64_t v47 = 1LL;
  char v4 = _os_feature_enabled_impl();
  v5 = -[MCMCommandDiskUsageForContainer concreteContainerIdentity](self, "concreteContainerIdentity");
  v6 = -[MCMCommand context](self, "context");
  [v6 containerCache];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v46 = 0LL;
  [v7 entryForContainerIdentity:v5 error:&v46];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v46;

  [v8 metadataMinimal];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    id v38 = v9;
    unint64_t v11 = [v5 containerClass];
    v12 = 0LL;
    if (v11 <= 0xE && ((1LL << v11) & 0x412A) != 0)
    {
      objc_super v13 = objc_alloc(&OBJC_CLASS___MCMCommandInfoValueForKey);
      -[MCMCommand context](self, "context");
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MCMCommandInfoValueForKey initWithKey:concreteContainerIdentity:context:resultPromise:]( v13,  "initWithKey:concreteContainerIdentity:context:resultPromise:",  @"StaticDiskUsage",  v5,  v14,  0LL);
      v12 = -[MCMCommandInfoValueForKey infoValueForKeyWithError:](v15, "infoValueForKeyWithError:", &v47);
      if (!v12 && v47 != 24)
      {
        container_log_handle_for_category();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v49 = v5;
          __int16 v50 = 2048;
          uint64_t v51 = v47;
          _os_log_error_impl( &dword_188846000,  v16,  OS_LOG_TYPE_ERROR,  "Error looking up info value for identity: %@: %llu",  buf,  0x16u);
        }
      }
    }

    objc_opt_class();
    id v17 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v18 = v17;
    }
    else {
      id v18 = 0LL;
    }
    v37 = v10;

    if (!v18)
    {
      v30 = v3;
      container_log_handle_for_category();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v35 = -[MCMCommand context](self, "context");
        [v35 clientIdentity];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        id v49 = v36;
        _os_log_debug_impl( &dword_188846000,  v31,  OS_LOG_TYPE_DEBUG,  "Reply to disk usage handed off to the slow workloop for client [%@]",  buf,  0xCu);
      }
      v32 = -[MCMCommand reply](self, "reply");
      v33 = -[MCMCommand context](self, "context");
      [v33 clientIdentity];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1895F87A8];
      v40[1] = 3221225472LL;
      v40[2] = __42__MCMCommandDiskUsageForContainer_execute__block_invoke;
      v40[3] = &unk_18A29D7E8;
      v41 = v37;
      char v45 = v4;
      id v42 = v5;
      v43 = self;
      id v44 = v8;
      [v32 handoffToSlowWorkloopforClientIdentity:v34 withBlock:v40];

      v21 = v41;
      v3 = v30;
      uint64_t v10 = v37;
      id v9 = v38;
      goto LABEL_23;
    }

    v39 = v5;
    uint64_t v22 = [v17 unsignedLongLongValue];
    v23 = objc_alloc(&OBJC_CLASS___MCMResultDiskUsageForContainer);
    [v8 containerIdentity];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 containerClass];
    v19 = v8;
    [v8 containerIdentity];
    v26 = v3;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 userIdentity];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MCMResultDiskUsageForContainer initWithDiskUsageBytes:descendants:containerClass:personaType:]( v23,  "initWithDiskUsageBytes:descendants:containerClass:personaType:",  v22,  0,  v25,  [v28 personaType]);

    v3 = v26;
    uint64_t v10 = v37;
    id v9 = v38;
    if (v21)
    {
LABEL_19:
      v29 = -[MCMCommand resultPromise](self, "resultPromise", v37);
      [v29 completeWithResult:v21];

      id v8 = v19;
      v5 = v39;
LABEL_23:

      goto LABEL_24;
    }
  }

  else
  {
    v39 = v5;
    v19 = v8;
    container_log_handle_for_category();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v49 = v9;
      __int16 v50 = 2112;
      uint64_t v51 = (uint64_t)v39;
      _os_log_error_impl( &dword_188846000,  v20,  OS_LOG_TYPE_ERROR,  "No Container with identity: error = %@, identity = %@",  buf,  0x16u);
    }

    v21 = -[MCMResultBase initWithError:]( objc_alloc(&OBJC_CLASS___MCMResultDiskUsageForContainer),  "initWithError:",  v9);
    id v17 = 0LL;
    if (v21) {
      goto LABEL_19;
    }
  }

  id v8 = v19;
  v5 = v39;
LABEL_24:

  objc_autoreleasePoolPop(v3);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void).cxx_destruct
{
}

void __42__MCMCommandDiskUsageForContainer_execute__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  v2 = +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
  [v2 waitOnLock:8];
  v3 = +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
  [v3 waitOnLock:2];

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) containerPath];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 containerRootURL];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v4 fastDiskUsageForURL:v6];
  uint64_t v9 = v8;

  if (!*(_BYTE *)(a1 + 64))
  {
    unint64_t v10 = [*(id *)(a1 + 40) containerClass];
    if (v10 <= 0xE && ((1LL << v10) & 0x412A) != 0)
    {
      uint64_t v32 = 0LL;
      v33 = &v32;
      uint64_t v34 = 0x3032000000LL;
      v35 = __Block_byref_object_copy__4731;
      v36 = __Block_byref_object_dispose__4732;
      id v37 = 0LL;
      [*(id *)(a1 + 48) reply];
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 3221225472LL;
      v26[2] = __42__MCMCommandDiskUsageForContainer_execute__block_invoke_8;
      v26[3] = &unk_18A29D7C0;
      uint64_t v30 = v7;
      uint64_t v31 = v9;
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      id v27 = v12;
      uint64_t v28 = v13;
      v29 = &v32;
      [v11 dispatchSyncToFastWorkloopWithBlock:v26];

      [(id)v33[5] result];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 error];
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        container_log_handle_for_category();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = *(void *)(a1 + 40);
          [v14 error];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          uint64_t v39 = v24;
          __int16 v40 = 2112;
          v41 = v25;
          _os_log_error_impl( &dword_188846000,  v16,  OS_LOG_TYPE_ERROR,  "Error setting info value for identity: %@: %@",  buf,  0x16u);
        }
      }

      _Block_object_dispose(&v32, 8);
    }
  }

  id v17 = objc_alloc(&OBJC_CLASS___MCMResultDiskUsageForContainer);
  [*(id *)(a1 + 56) containerIdentity];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 containerClass];
  [*(id *)(a1 + 56) containerIdentity];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 userIdentity];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = -[MCMResultDiskUsageForContainer initWithDiskUsageBytes:descendants:containerClass:personaType:]( v17,  "initWithDiskUsageBytes:descendants:containerClass:personaType:",  v7,  v9,  v19,  [v21 personaType]);

  [*(id *)(a1 + 48) resultPromise];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 completeWithResult:v22];
}

void __42__MCMCommandDiskUsageForContainer_execute__block_invoke_8(uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___MCMCommandSetInfoValue);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) context];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMCommandSetInfoValue initWithKey:value:containerIdentity:context:resultPromise:]( v2,  "initWithKey:value:containerIdentity:context:resultPromise:",  @"StaticDiskUsage",  v3,  v4,  v5,  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));

  -[MCMCommandSetInfoValue execute](v6, "execute");
}

+ (unint64_t)command
{
  return 23LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end