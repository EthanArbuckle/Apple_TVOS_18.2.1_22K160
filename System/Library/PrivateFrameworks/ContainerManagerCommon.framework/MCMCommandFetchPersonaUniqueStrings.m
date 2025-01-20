@interface MCMCommandFetchPersonaUniqueStrings
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (void)execute;
@end

@implementation MCMCommandFetchPersonaUniqueStrings

+ (unint64_t)command
{
  return 32LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (BOOL)preflightClientAllowed
{
  return 1;
}

- (void)execute
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  v4 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithCapacity:1];
  v5 = -[MCMCommand context](self, "context");
  [v5 clientIdentity];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 userIdentity];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v7 isNoSpecificPersona])
  {
    v8 = -[MCMCommand context](self, "context");
    [v8 userIdentityCache];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __46__MCMCommandFetchPersonaUniqueStrings_execute__block_invoke;
    v14[3] = &unk_18A29C928;
    id v15 = v4;
    [v9 forEachAccessibleUserIdentitySynchronouslyExecuteBlock:v14];
  }

  else
  {
    [v7 personaUniqueString];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10) {
      [v4 addObject:v10];
    }
  }

  container_log_handle_for_category();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    __int16 v18 = 2112;
    uint64_t v19 = 0LL;
    _os_log_impl( &dword_188846000,  v11,  OS_LOG_TYPE_DEFAULT,  "Fetch persona unique strings result: %@; error = %@",
      buf,
      0x16u);
  }

  v12 = -[MCMResultFetchPersonaUniqueStrings initWithPersonaUniqueStrings:]( objc_alloc(&OBJC_CLASS___MCMResultFetchPersonaUniqueStrings),  "initWithPersonaUniqueStrings:",  v4);
  v13 = -[MCMCommand resultPromise](self, "resultPromise");
  [v13 completeWithResult:v12];

  objc_autoreleasePoolPop(v3);
}

void __46__MCMCommandFetchPersonaUniqueStrings_execute__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    v3 = v4;
  }
}

@end