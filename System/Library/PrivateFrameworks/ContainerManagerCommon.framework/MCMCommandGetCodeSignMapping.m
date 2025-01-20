@interface MCMCommandGetCodeSignMapping
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandGetCodeSignMapping)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (NSString)identifier;
- (void)execute;
@end

@implementation MCMCommandGetCodeSignMapping

- (MCMCommandGetCodeSignMapping)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandGetCodeSignMapping;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    uint64_t v10 = [v8 identifier];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;
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
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  char v4 = (void *)gCodeSigningMapping;
  v5 = -[MCMCommandGetCodeSignMapping identifier](self, "identifier");
  [v4 getCodeSigningInfoForIdentifier:v5];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    id v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v7;
    }
    else {
      id v6 = 0LL;
    }

    if (v6)
    {
      v11 = 0LL;
      goto LABEL_10;
    }

    id v8 = objc_alloc(&OBJC_CLASS___MCMError);
    uint64_t v9 = 93LL;
    uint64_t v10 = 5LL;
  }

  else
  {
    id v8 = objc_alloc(&OBJC_CLASS___MCMError);
    uint64_t v9 = 21LL;
    uint64_t v10 = 3LL;
  }

  v11 = -[MCMError initWithErrorType:category:](v8, "initWithErrorType:category:", v9, v10);
LABEL_10:
  container_log_handle_for_category();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v11;
    _os_log_impl(&dword_188846000, v12, OS_LOG_TYPE_DEFAULT, "Get codesign info; error = %@", (uint8_t *)&v17, 0xCu);
  }

  objc_super v13 = objc_alloc(&OBJC_CLASS___MCMResultGetCodeSignMapping);
  if (v6) {
    uint64_t v14 = -[MCMResultGetCodeSignMapping initWithInfo:](v13, "initWithInfo:", v6);
  }
  else {
    uint64_t v14 = -[MCMResultBase initWithError:](v13, "initWithError:", v11);
  }
  v15 = (void *)v14;
  v16 = -[MCMCommand resultPromise](self, "resultPromise");
  [v16 completeWithResult:v15];

  objc_autoreleasePoolPop(v3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 19LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end