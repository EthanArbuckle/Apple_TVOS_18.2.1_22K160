@interface MCMCommandInfoValueForKey
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandInfoValueForKey)infoValueForKeyWithError:(unint64_t *)a3;
- (MCMCommandInfoValueForKey)initWithKey:(id)a3 concreteContainerIdentity:(id)a4 context:(id)a5 resultPromise:(id)a6;
- (MCMCommandInfoValueForKey)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (NSString)key;
- (void)execute;
@end

@implementation MCMCommandInfoValueForKey

- (MCMCommandInfoValueForKey)initWithKey:(id)a3 concreteContainerIdentity:(id)a4 context:(id)a5 resultPromise:(id)a6
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMCommandInfoValueForKey;
  v13 = -[MCMCommand initWithContext:resultPromise:](&v16, sel_initWithContext_resultPromise_, a5, a6);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_key, a3);
    objc_storeStrong((id *)&v14->_concreteContainerIdentity, a4);
  }

  return v14;
}

- (MCMCommandInfoValueForKey)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MCMCommandInfoValueForKey;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v15, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    uint64_t v10 = [v8 concreteContainerIdentity];
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;

    uint64_t v12 = [v8 key];
    key = v9->_key;
    v9->_key = (NSString *)v12;
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = [v3 isAllowedToAccessInfoMetadata];
  return (char)v2;
}

- (void)execute
{
  v9[1] = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  v9[0] = 1LL;
  v4 = -[MCMCommandInfoValueForKey infoValueForKeyWithError:](self, "infoValueForKeyWithError:", v9);
  if (v9[0] == 1LL)
  {
    v5 = -[MCMResultInfoValueForKey initWithValue:]( objc_alloc(&OBJC_CLASS___MCMResultInfoValueForKey),  "initWithValue:",  v4);
  }

  else
  {
    v6 = objc_alloc(&OBJC_CLASS___MCMError);
    v7 = -[MCMError initWithErrorType:](v6, "initWithErrorType:", v9[0]);
    v5 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultInfoValueForKey), "initWithError:", v7);
  }

  -[MCMCommand resultPromise](self, "resultPromise");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 completeWithResult:v5];

  objc_autoreleasePoolPop(v3);
}

- (MCMCommandInfoValueForKey)infoValueForKeyWithError:(unint64_t *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v22 = -[MCMCommandInfoValueForKey concreteContainerIdentity](self, "concreteContainerIdentity");
  v4 = -[MCMCommandInfoValueForKey key](self, "key");
  objc_opt_class();
  id v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }

  if (!v6)
  {
    objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 38LL);
    container_log_handle_for_category();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_error_impl(&dword_188846000, v16, OS_LOG_TYPE_ERROR, "Can't get nil or non-NSString key: %@", buf, 0xCu);
    }

    id v11 = 0LL;
    v9 = 0LL;
    goto LABEL_17;
  }
  v7 = -[MCMCommand context](self, "context");
  [v7 containerCache];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = 0LL;
  [v8 entryForContainerIdentity:v22 error:&v24];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v24;

  id v23 = v10;
  [v9 metadataWithError:&v23];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (MCMError *)v23;

  if (!v11)
  {
    objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 21LL);

    container_log_handle_for_category();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v22;
      _os_log_error_impl(&dword_188846000, v17, OS_LOG_TYPE_ERROR, "No Container with identity: %@", buf, 0xCu);
    }

    id v11 = 0LL;
    goto LABEL_17;
  }

  [v11 info];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectForKeyedSubscript:v5];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_super v15 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 24LL);

    container_log_handle_for_category();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_error_impl(&dword_188846000, v18, OS_LOG_TYPE_ERROR, "Didn't find info value for key: %@", buf, 0xCu);
    }

LABEL_17:
    v14 = 0LL;
    goto LABEL_18;
  }

  objc_super v15 = v12;
LABEL_18:
  if (a3 && v15) {
    *a3 = -[MCMError type](v15, "type");
  }
  v19 = v14;

  return v19;
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 6LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end