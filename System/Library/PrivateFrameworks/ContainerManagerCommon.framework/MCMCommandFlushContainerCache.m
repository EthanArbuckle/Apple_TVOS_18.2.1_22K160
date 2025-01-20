@interface MCMCommandFlushContainerCache
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (BOOL)transient;
- (MCMCommandFlushContainerCache)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerConfiguration)containerConfig;
- (MCMXPCMessage)message;
- (void)execute;
@end

@implementation MCMCommandFlushContainerCache

- (MCMCommandFlushContainerCache)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCMCommandFlushContainerCache;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v14, sel_initWithMessage_context_reply_, v9, a4, a5);
  if (v10)
  {
    uint64_t v11 = [v9 containerConfig];
    containerConfig = v10->_containerConfig;
    v10->_containerConfig = (MCMContainerConfiguration *)v11;

    v10->_transient = [v9 transient];
    objc_storeStrong((id *)&v10->_message, a3);
  }

  return v10;
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
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  -[MCMCommand context](self, "context");
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 containerCache];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMCommand context](self, "context");
  [v6 clientIdentity];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 userIdentity];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandFlushContainerCache containerConfig](self, "containerConfig");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v5,  "flushCacheForUserIdentity:containerClass:transient:",  v8,  objc_msgSend(v9, "containerClass"),  -[MCMCommandFlushContainerCache transient](self, "transient"));

  container_log_handle_for_category();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_188846000, v10, OS_LOG_TYPE_DEFAULT, "Cache flushed", v13, 2u);
  }

  uint64_t v11 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", 0LL);
  v12 = -[MCMCommand resultPromise](self, "resultPromise");
  [v12 completeWithResult:v11];

  objc_autoreleasePoolPop(v3);
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (BOOL)transient
{
  return self->_transient;
}

- (MCMXPCMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 33LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end