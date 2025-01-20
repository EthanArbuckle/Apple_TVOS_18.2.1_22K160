@interface MCMCommandSetCodeSignMapping
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandSetCodeSignMapping)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (NSString)identifier;
- (id)info;
- (id)options;
- (void)execute;
@end

@implementation MCMCommandSetCodeSignMapping

- (MCMCommandSetCodeSignMapping)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCMCommandSetCodeSignMapping;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v17, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    uint64_t v10 = [v8 identifier];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    uint64_t v12 = [v8 options];
    id options = v9->_options;
    v9->_id options = (id)v12;

    uint64_t v14 = [v8 info];
    id info = v9->_info;
    v9->_id info = (id)v14;
  }

  return v9;
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
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  char v4 = (void *)gCodeSigningMapping;
  v5 = -[MCMCommandSetCodeSignMapping info](self, "info");
  v6 = -[MCMCommandSetCodeSignMapping identifier](self, "identifier");
  v7 = -[MCMCommandSetCodeSignMapping options](self, "options");
  id v20 = 0LL;
  [v4 processCodeSigningInfo:v5 identifier:v6 options:v7 error:&v20];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v20;

  if ([v8 count])
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
    [v8 allObjects];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](self, "context");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:]( &OBJC_CLASS___MCMCommandOperationDelete,  "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:",  v11,  0LL,  v12,  v10);
    [v13 execute];
    -[MCMResultPromise result](v10, "result");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 error];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      container_log_handle_for_category();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v15;
        _os_log_error_impl( &dword_188846000,  v16,  OS_LOG_TYPE_ERROR,  "Failed to destroy container(s) during setCodeSigningMapping; error = %@",
          buf,
          0xCu);
      }
    }
  }

  container_log_handle_for_category();
  objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v9;
    _os_log_impl(&dword_188846000, v17, OS_LOG_TYPE_DEFAULT, "Set code sign mapping; error = %@", buf, 0xCu);
  }

  uint64_t v18 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v9);
  v19 = -[MCMCommand resultPromise](self, "resultPromise");
  [v19 completeWithResult:v18];

  objc_autoreleasePoolPop(v3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)info
{
  return self->_info;
}

- (id)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 18LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end