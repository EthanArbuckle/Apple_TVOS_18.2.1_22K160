@interface MCMCommandAcquireSandboxExtensionWithUUID
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandAcquireSandboxExtensionWithUUID)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (void)execute;
@end

@implementation MCMCommandAcquireSandboxExtensionWithUUID

- (MCMCommandAcquireSandboxExtensionWithUUID)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandAcquireSandboxExtensionWithUUID;
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
  v5 = -[MCMCommandAcquireSandboxExtensionWithUUID concreteContainerIdentity](v2, "concreteContainerIdentity");
  LOBYTE(v2) = [v4 isAllowedToLookupContainerIdentity:v5];

  return (char)v2;
}

- (void)execute
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895CE3A8](self, a2);
  uint64_t v3 = -[MCMCommandAcquireSandboxExtensionWithUUID concreteContainerIdentity](self, "concreteContainerIdentity");
  __s = 0LL;
  v4 = -[MCMCommand context](self, "context");
  [v4 containerCache];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v30 = 0LL;
  v27 = (void *)v3;
  [v5 entryForContainerIdentity:v3 error:&v30];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (MCMError *)v30;

  v26 = v6;
  if (v6)
  {
    [v6 metadataMinimal];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MCMCommand context](self, "context");
    [v9 clientIdentity];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 containerIdentity];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 containerPath];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v7;
    char v13 = 1;
    uint64_t v14 = (void *)[v10 issueSandboxExtensionWithIdentity:v11 containerPath:v12 legacyExtensionPolicy:0 extensionsUseProxiedClient:1 ext ensionsPolicyUsesProxiedClient:1 error:&v29];
    v15 = v29;

    __s = v14;
    if (v14)
    {
LABEL_5:
      v7 = v15;
      goto LABEL_8;
    }

    if (v15)
    {
      uint64_t v14 = 0LL;
      char v13 = 0;
      goto LABEL_5;
    }

    v7 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  72LL,  3LL);
    uint64_t v14 = 0LL;
  }

  else
  {
    uint64_t v14 = 0LL;
    id v8 = 0LL;
  }

  char v13 = 0;
LABEL_8:
  container_log_handle_for_category();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v33 = v14 != 0LL;
    __int16 v34 = 2112;
    v35 = v7;
    _os_log_impl( &dword_188846000,  v16,  OS_LOG_TYPE_DEFAULT,  "Acquire sandbox extension result: %d, error = %@",  buf,  0x12u);
  }

  v17 = objc_alloc(&OBJC_CLASS___MCMResultAcquireSandboxExtensionWithUUID);
  v18 = v17;
  if ((v13 & 1) != 0)
  {
    [v8 userIdentity];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 personaUniqueString];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 containerPath];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 containerDataURL];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MCMResultAcquireSandboxExtensionWithUUID initWithSandboxToken:personaUniqueString:url:]( v18,  "initWithSandboxToken:personaUniqueString:url:",  v14,  v20,  v22);
  }

  else
  {
    v23 = -[MCMResultBase initWithError:](v17, "initWithError:", v7);
  }

  v24 = v26;
  if (v14)
  {
    free(v14);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  v25 = -[MCMCommand resultPromise](self, "resultPromise", v26);
  [v25 completeWithResult:v23];

  objc_autoreleasePoolPop(context);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 35LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end