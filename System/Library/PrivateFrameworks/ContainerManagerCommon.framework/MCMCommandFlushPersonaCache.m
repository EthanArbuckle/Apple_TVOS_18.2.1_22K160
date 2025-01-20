@interface MCMCommandFlushPersonaCache
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (void)execute;
@end

@implementation MCMCommandFlushPersonaCache

+ (unint64_t)command
{
  return 34LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToControlCaches];

  return v4;
}

- (void)execute
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  -[MCMCommand context](self, "context");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 userIdentityCache];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 flush];

  container_log_handle_for_category();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_188846000, v6, OS_LOG_TYPE_DEFAULT, "Flush persona cache; error = nil", v9, 2u);
  }

  v7 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", 0LL);
  v8 = -[MCMCommand resultPromise](self, "resultPromise");
  [v8 completeWithResult:v7];

  objc_autoreleasePoolPop(v3);
}

@end