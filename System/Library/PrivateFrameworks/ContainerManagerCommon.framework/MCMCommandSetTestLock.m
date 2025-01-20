@interface MCMCommandSetTestLock
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)enable;
- (BOOL)preflightClientAllowed;
- (MCMCommandSetTestLock)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMXPCMessage)message;
- (unint64_t)requestedLocks;
- (void)execute;
@end

@implementation MCMCommandSetTestLock

- (MCMCommandSetTestLock)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCMCommandSetTestLock;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v12, sel_initWithMessage_context_reply_, v9, a4, a5);
  if (v10)
  {
    v10->_requestedLocks = [v9 requestedLocks];
    v10->_enable = [v9 enable];
    objc_storeStrong((id *)&v10->_message, a3);
  }

  return v10;
}

- (BOOL)preflightClientAllowed
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 clientIdentity];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isAllowedToTest];

  return v4;
}

- (void)execute
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  id v4 = containermanager_copy_global_configuration();
  int v5 = [v4 isInternalImage];

  if (!v5)
  {
    container_log_handle_for_category();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v28) = 0;
      _os_log_fault_impl(&dword_188846000, v15, OS_LOG_TYPE_FAULT, "Unsupported call to set lock!", (uint8_t *)&v28, 2u);
    }

    v10 = 0LL;
    goto LABEL_13;
  }

  id v6 = containermanager_copy_global_configuration();
  id v7 = containermanager_copy_global_configuration();
  if ([v7 runmode] == 3)
  {

LABEL_5:
    goto LABEL_6;
  }

  id v20 = containermanager_copy_global_configuration();
  int v21 = [v20 runmode];

  if (v21 != 4)
  {
    v10 = 0LL;
    goto LABEL_7;
  }

- (unint64_t)requestedLocks
{
  return self->_requestedLocks;
}

- (BOOL)enable
{
  return self->_enable;
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
  return 31LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end