@interface MCMCommandInvalidateCodeSigningCache
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (void)execute;
@end

@implementation MCMCommandInvalidateCodeSigningCache

+ (unint64_t)command
{
  return 20LL;
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
  char v4 = [v3 isAllowedToAccessCodesignMapping];

  return v4;
}

- (void)execute
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  uint64_t v4 = [(id)gCodeSigningMapping invalidateCodeSigningInfoForAppsWithoutDataContainer];
  if (v4 == 1) {
    v5 = 0LL;
  }
  else {
    v5 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", v4);
  }
  container_log_handle_for_category();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl( &dword_188846000,  v6,  OS_LOG_TYPE_DEFAULT,  "Invalidate codesign cache; error = %@",
      (uint8_t *)&v9,
      0xCu);
  }

  v7 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v5);
  v8 = -[MCMCommand resultPromise](self, "resultPromise");
  [v8 completeWithResult:v7];

  objc_autoreleasePoolPop(v3);
}

@end