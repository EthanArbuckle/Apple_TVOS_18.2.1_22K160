@interface MCMCommand
+ (Class)incomingMessageClass;
+ (id)relayToPrivilegedDaemonMessage:(id)a3 context:(id)a4;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommand)initWithContext:(id)a3 resultPromise:(id)a4;
- (MCMCommand)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMCommandContext)context;
- (MCMReply)reply;
- (MCMResultPromise)resultPromise;
- (void)execute;
@end

@implementation MCMCommand

- (MCMCommand)initWithContext:(id)a3 resultPromise:(id)a4
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCMCommand;
  v9 = -[MCMCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_resultPromise, a4);
  }

  return v10;
}

- (MCMCommand)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [v8 resultPromise];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MCMCommand initWithContext:resultPromise:](self, "initWithContext:resultPromise:", v9, v10);

  if (v11) {
    objc_storeStrong((id *)&v11->_reply, a5);
  }

  return v11;
}

- (BOOL)preflightClientAllowed
{
  return 0;
}

- (void)execute
{
  v2 = (void *)MEMORY[0x189603F70];
  uint64_t v3 = *MEMORY[0x189603A58];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 raise:v3, @"%@ was called on the base class %@", v4, v6 format];

  __break(1u);
}

- (MCMCommandContext)context
{
  return self->_context;
}

- (MCMResultPromise)resultPromise
{
  return self->_resultPromise;
}

- (MCMReply)reply
{
  return self->_reply;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  v2 = (void *)MEMORY[0x189603F70];
  uint64_t v3 = *MEMORY[0x189603A58];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 raise:v3, @"%@ was called on the base class %@", v4, v6 format];

  __break(1u);
  return result;
}

+ (Class)incomingMessageClass
{
  v2 = (void *)MEMORY[0x189603F70];
  uint64_t v3 = *MEMORY[0x189603A58];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 raise:v3, @"%@ was called on the base class %@", v4, v6 format];

  __break(1u);
  return result;
}

+ (id)relayToPrivilegedDaemonMessage:(id)a3 context:(id)a4
{
  buf[3] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  container_xpc_set_use_shared_connection();
  [v6 clientIdentity];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 createLibsystemClient];
  id v8 = (void *)container_client_copy_encoded_xpc_object();
  if (v8)
  {
    [v5 xpcObject];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v9, "ProxyForClient", v8);

    buf[0] = 0LL;
    [v5 xpcObject];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (MCMError *)container_xpc_send_sync_message();

    if (v11)
    {
      objc_super v12 = -[MCMResultRelay initWithXPCReplyFromRelay:]( objc_alloc(&OBJC_CLASS___MCMResultRelay),  "initWithXPCReplyFromRelay:",  v11);
    }

    else
    {
      v14 = -[MCMError initWithLibsystemError:](objc_alloc(&OBJC_CLASS___MCMError), "initWithLibsystemError:", buf[0]);
      objc_super v12 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultRelay), "initWithError:", v14);
    }

    container_error_free();
  }

  else
  {
    v11 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  1LL,  2LL);
    objc_super v12 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v11);
    container_log_handle_for_category();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 134217984;
      *(void *)((char *)buf + 4) = 1LL;
      _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "Could not serialize client for proxy; error = %llu",
        (uint8_t *)buf,
        0xCu);
    }
  }

  container_free_client();
  return v12;
}

@end