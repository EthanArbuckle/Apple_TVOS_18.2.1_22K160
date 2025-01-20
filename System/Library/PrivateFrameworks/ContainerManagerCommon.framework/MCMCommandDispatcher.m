@interface MCMCommandDispatcher
- (Class)_commandClassFromXPCMessage:(id)a3 context:(id)a4 error:(id *)a5;
- (MCMCommandDispatcher)init;
- (NSMutableDictionary)messageToCommandClassMap;
- (id)_commandFromCommandClass:(Class)a3 message:(id)a4 context:(id)a5 reply:(id)a6 error:(id *)a7;
- (id)_ifNeededRelayMessage:(id)a3 context:(id)a4;
- (id)_messageFromCommandClass:(Class)a3 xpcMessage:(id)a4 context:(id)a5 error:(id *)a6;
- (void)dispatchMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (void)registerCommandClass:(Class)a3;
@end

@implementation MCMCommandDispatcher

- (MCMCommandDispatcher)init
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCMCommandDispatcher;
  v2 = -[MCMCommandDispatcher init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189603FC8] dictionary];
    messageToCommandClassMap = v2->_messageToCommandClassMap;
    v2->_messageToCommandClassMap = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (void)registerCommandClass:(Class)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[objc_class command](a3, "command"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setObject:a3 forKeyedSubscript:v4];
}

- (void)dispatchMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  v23[1] = *(id *)MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 resultPromise];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0LL;
  v12 = -[MCMCommandDispatcher _commandClassFromXPCMessage:context:error:]( self,  "_commandClassFromXPCMessage:context:error:",  v8,  v9,  v23);
  v13 = (MCMError *)v23[0];
  v14 = v13;
  if (v12)
  {
    v22 = v13;
    -[MCMCommandDispatcher _messageFromCommandClass:xpcMessage:context:error:]( self,  "_messageFromCommandClass:xpcMessage:context:error:",  v12,  v8,  v9,  &v22);
    v15 = (MCMResultBase *)objc_claimAutoreleasedReturnValue();
    v16 = v22;

    if (v15)
    {
      uint64_t v17 = -[MCMCommandDispatcher _ifNeededRelayMessage:context:](self, "_ifNeededRelayMessage:context:", v15, v9);
      if (!v17)
      {
        v21 = v16;
        -[MCMCommandDispatcher _commandFromCommandClass:message:context:reply:error:]( self,  "_commandFromCommandClass:message:context:reply:error:",  v12,  v15,  v9,  v10,  &v21);
        v19 = (MCMResultBase *)objc_claimAutoreleasedReturnValue();
        v14 = v21;

        if (v19)
        {
          if ((-[MCMResultBase preflightClientAllowed](v19, "preflightClientAllowed") & 1) == 0)
          {
            v16 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  55LL,  3LL);

            v20 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v16);
            [v11 completeWithResult:v20];

            goto LABEL_7;
          }

          -[MCMResultBase execute](v19, "execute");
        }

        else
        {
          v19 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v14);
          [v11 completeWithResult:v19];
        }

        goto LABEL_8;
      }

      v18 = (void *)v17;
      [v11 completeWithResult:v17];
    }

    else
    {
      v15 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v16);
      [v11 completeWithResult:v15];
    }

- (Class)_commandClassFromXPCMessage:(id)a3 context:(id)a4 error:(id *)a5
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "Command");
  -[MCMCommandDispatcher messageToCommandClassMap](self, "messageToCommandClassMap");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithUnsignedLongLong:uint64];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (void *)[v8 objectForKeyedSubscript:v9];

  if (a5 && !v10) {
    *a5 =  -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  72LL,  3LL);
  }
  return (Class)v10;
}

- (id)_messageFromCommandClass:(Class)a3 xpcMessage:(id)a4 context:(id)a5 error:(id *)a6
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v9 = a4;
  id v10 = a5;
  v19[0] = 1LL;
  v11 = (void *)-[objc_class incomingMessageClass](a3, "incomingMessageClass");
  if (v11)
  {
    uint64_t v12 = [v11 xpcMessageFromXPCObject:v9 context:v10 error:v19];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = 0LL;
      goto LABEL_9;
    }

    v15 = objc_alloc(&OBJC_CLASS___MCMError);
    uint64_t v16 = v19[0];
    uint64_t v17 = 3LL;
  }

  else
  {
    v15 = objc_alloc(&OBJC_CLASS___MCMError);
    uint64_t v16 = 40LL;
    uint64_t v17 = 4LL;
  }

  v14 = -[MCMError initWithErrorType:category:](v15, "initWithErrorType:category:", v16, v17);
  if (a6)
  {
    v14 = v14;
    v13 = 0LL;
    *a6 = v14;
  }

  else
  {
    v13 = 0LL;
  }

- (id)_commandFromCommandClass:(Class)a3 message:(id)a4 context:(id)a5 reply:(id)a6 error:(id *)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = (void *)[[a3 alloc] initWithMessage:v13 context:v12 reply:v11];

  if (a7 && !v14) {
    *a7 =  -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  38LL,  3LL);
  }
  return v14;
}

- (id)_ifNeededRelayMessage:(id)a3 context:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 disposition];
  if (v7 == 2)
  {
    container_log_handle_for_category();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      uint64_t v17 = [v5 command];
      _os_log_impl(&dword_188846000, v12, OS_LOG_TYPE_DEFAULT, "Relaying [%llu] to daemon.", (uint8_t *)&v16, 0xCu);
    }

    +[MCMCommand relayToPrivilegedDaemonMessage:context:]( &OBJC_CLASS___MCMCommand,  "relayToPrivilegedDaemonMessage:context:",  v5,  v6);
    id v13 = (MCMResultBase *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (v7 == 1)
    {
      id v8 = containermanager_copy_global_configuration();
      int v9 = [v8 runmode];

      if (v9 != 3)
      {
        id v13 = 0LL;
        goto LABEL_11;
      }

      id v10 = objc_alloc(&OBJC_CLASS___MCMError);
      uint64_t v11 = 100LL;
    }

    else
    {
      id v10 = objc_alloc(&OBJC_CLASS___MCMError);
      uint64_t v11 = 72LL;
    }

    v14 = -[MCMError initWithErrorType:category:](v10, "initWithErrorType:category:", v11, 3LL);
    id v13 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v14);
  }

- (NSMutableDictionary)messageToCommandClassMap
{
  return self->_messageToCommandClassMap;
}

- (void).cxx_destruct
{
}

@end