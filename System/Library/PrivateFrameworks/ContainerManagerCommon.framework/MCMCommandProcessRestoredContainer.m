@interface MCMCommandProcessRestoredContainer
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandProcessRestoredContainer)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5;
- (MCMCommandProcessRestoredContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMConcreteContainerIdentity)concreteContainerIdentity;
- (void)execute;
@end

@implementation MCMCommandProcessRestoredContainer

- (MCMCommandProcessRestoredContainer)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandProcessRestoredContainer;
  v10 = -[MCMCommand initWithContext:resultPromise:](&v13, sel_initWithContext_resultPromise_, a4, a5);
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_concreteContainerIdentity, a3);
  }

  return v11;
}

- (MCMCommandProcessRestoredContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MCMCommandProcessRestoredContainer;
  id v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
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
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToRestoreContainer];

  return v4;
}

- (void)execute
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  char v4 = objc_alloc(&OBJC_CLASS___MCMCommandRecreateContainerStructure);
  v5 = -[MCMCommandProcessRestoredContainer concreteContainerIdentity](self, "concreteContainerIdentity");
  v6 = -[MCMCommand context](self, "context");
  v7 = -[MCMCommand resultPromise](self, "resultPromise");
  id v8 = -[MCMCommandRecreateContainerStructure initWithConcreteContainerIdentity:context:resultPromise:]( v4,  "initWithConcreteContainerIdentity:context:resultPromise:",  v5,  v6,  v7);

  -[MCMCommandRecreateContainerStructure execute](v8, "execute");
  container_log_handle_for_category();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMCommand resultPromise](self, "resultPromise");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 result];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 error];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = 138412290;
    uint64_t v14 = v12;
    _os_log_impl( &dword_188846000,  v9,  OS_LOG_TYPE_DEFAULT,  "Process restored container result; error = %@",
      (uint8_t *)&v13,
      0xCu);
  }

  objc_autoreleasePoolPop(v3);
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
  return 22LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end