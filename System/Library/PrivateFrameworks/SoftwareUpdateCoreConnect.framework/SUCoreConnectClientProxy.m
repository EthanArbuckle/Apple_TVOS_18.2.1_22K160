@interface SUCoreConnectClientProxy
+ (BOOL)supportsSecureCoding;
- (NSString)clientID;
- (NSString)clientIDRaw;
- (NSString)description;
- (OS_dispatch_queue)completionQueue;
- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 genericBlock:(id)a5;
- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 genericBlock:(id)a5 progressBlock:(id)a6;
- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 progressBlock:(id)a5;
- (SUCoreConnectClientProxy)initWithCoder:(id)a3;
- (id)genericBlock;
- (id)progressBlock;
- (id)summary;
- (int)clientProcessIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)executeGenericBlock:(id)a3;
- (void)executeGenericBlock:(id)a3 disableVerboseLogging:(BOOL)a4;
- (void)executeProgressBlock:(id)a3;
- (void)executeProgressBlock:(id)a3 disableVerboseLogging:(BOOL)a4;
@end

@implementation SUCoreConnectClientProxy

- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 genericBlock:(id)a5
{
  return -[SUCoreConnectClientProxy initWithClientID:completionQueue:genericBlock:progressBlock:]( self,  "initWithClientID:completionQueue:genericBlock:progressBlock:",  a3,  a4,  a5,  0LL);
}

- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 progressBlock:(id)a5
{
  return -[SUCoreConnectClientProxy initWithClientID:completionQueue:genericBlock:progressBlock:]( self,  "initWithClientID:completionQueue:genericBlock:progressBlock:",  a3,  a4,  0LL,  a5);
}

- (SUCoreConnectClientProxy)initWithClientID:(id)a3 completionQueue:(id)a4 genericBlock:(id)a5 progressBlock:(id)a6
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___SUCoreConnectClientProxy;
  v15 = -[SUCoreConnectClientProxy init](&v33, sel_init);
  if (v15)
  {
    v16 = (void *)NSString;
    [MEMORY[0x1896079D8] processInfo];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v16 stringWithFormat:@"%@.<%d>", v11, objc_msgSend(v17, "processIdentifier")];
    clientID = v15->_clientID;
    v15->_clientID = (NSString *)v18;

    objc_storeStrong((id *)&v15->_clientIDRaw, a3);
    [MEMORY[0x1896079D8] processInfo];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_clientProcessIdentifier = [v20 processIdentifier];

    p_completionQueue = (void **)&v15->_completionQueue;
    objc_storeStrong((id *)&v15->_completionQueue, a4);
    uint64_t v22 = MEMORY[0x1895A2EF8](v13);
    id genericBlock = v15->_genericBlock;
    v15->_id genericBlock = (id)v22;

    uint64_t v24 = MEMORY[0x1895A2EF8](v14);
    id progressBlock = v15->_progressBlock;
    v15->_id progressBlock = (id)v24;

    if (!v15->_completionQueue)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 oslog];
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = -[SUCoreConnectClientProxy summary](v15, "summary");
        *(_DWORD *)buf = 138543362;
        v35 = v28;
        _os_log_impl( &dword_18733E000,  v27,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] No completion queue was provided on initialization, creating new completion queue",  buf,  0xCu);
      }

      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v29 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v30 = dispatch_queue_create("com.apple.SUCoreConnect.ClientProxyCompletionQueue", v29);
      v31 = *p_completionQueue;
      *p_completionQueue = v30;
    }
  }

  return v15;
}

- (void)executeGenericBlock:(id)a3
{
}

- (void)executeGenericBlock:(id)a3 disableVerboseLogging:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = -[SUCoreConnectClientProxy genericBlock](self, "genericBlock");
  if (v7)
  {
    if (!a4)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 oslog];
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[SUCoreConnectClientProxy summary](self, "summary");
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v10;
        __int16 v19 = 2114;
        id v20 = (id)objc_opt_class();
        id v11 = v20;
        _os_log_impl( &dword_18733E000,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Calling genericBlock on completion queue with object: %{public}@",  buf,  0x16u);
      }
    }

    -[SUCoreConnectClientProxy completionQueue](self, "completionQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __70__SUCoreConnectClientProxy_executeGenericBlock_disableVerboseLogging___block_invoke;
    v15[3] = &unk_18A02A800;
    v15[4] = self;
    id v16 = v6;
    dispatch_async(v12, v15);
  }

  else if (!a4)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectClientProxy executeGenericBlock:disableVerboseLogging:].cold.1(self);
    }
  }
}

void __70__SUCoreConnectClientProxy_executeGenericBlock_disableVerboseLogging___block_invoke(uint64_t a1)
{
  v2 = (void (**)(id, void))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)executeProgressBlock:(id)a3
{
}

- (void)executeProgressBlock:(id)a3 disableVerboseLogging:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = -[SUCoreConnectClientProxy progressBlock](self, "progressBlock");
  if (v7)
  {
    if (!a4)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 oslog];
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[SUCoreConnectClientProxy summary](self, "summary");
        [v6 summary];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        uint64_t v18 = v10;
        __int16 v19 = 2114;
        id v20 = v11;
        _os_log_impl( &dword_18733E000,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Calling progressBlock on completion queue with progress: %{public}@",  buf,  0x16u);
      }
    }

    -[SUCoreConnectClientProxy completionQueue](self, "completionQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __71__SUCoreConnectClientProxy_executeProgressBlock_disableVerboseLogging___block_invoke;
    v15[3] = &unk_18A02A800;
    v15[4] = self;
    id v16 = v6;
    dispatch_async(v12, v15);
  }

  else if (!a4)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConnectClientProxy executeProgressBlock:disableVerboseLogging:].cold.1(self, v6);
    }
  }
}

void __71__SUCoreConnectClientProxy_executeProgressBlock_disableVerboseLogging___block_invoke(uint64_t a1)
{
  v2 = (void (**)(id, void))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(void *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[SUCoreConnectClientProxy clientID](self, "clientID");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"SUCoreConnectClientProxyClientID"];
}

- (SUCoreConnectClientProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SUCoreConnectClientProxy;
  id v5 = -[SUCoreConnectClientProxy init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SUCoreConnectClientProxyClientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;
  }

  return v5;
}

- (id)summary
{
  v2 = (void *)NSString;
  v3 = -[SUCoreConnectClientProxy clientID](self, "clientID");
  [v2 stringWithFormat:@"SUCoreConnectClientProxy(%@)", v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  v3 = (void *)NSString;
  -[SUCoreConnectClientProxy clientID](self, "clientID");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConnectClientProxy completionQueue](self, "completionQueue");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  v7 = -[SUCoreConnectClientProxy genericBlock](self, "genericBlock");
  if (v7) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  -[SUCoreConnectClientProxy progressBlock](self, "progressBlock");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v3 stringWithFormat:@"SUCoreConnectClientProxy(clientID:%@|completionQueue:%@|genericBlock:%@|progressBlock:%@)", v4, v6, v8, v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)clientIDRaw
{
  return self->_clientIDRaw;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (id)genericBlock
{
  return self->_genericBlock;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)executeGenericBlock:(void *)a1 disableVerboseLogging:.cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  id v3 = v2;
  OUTLINED_FUNCTION_0( &dword_18733E000,  v4,  v5,  "[%{public}@] Unable to execute a nil generic block with object: %{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_1();
}

- (void)executeProgressBlock:(void *)a1 disableVerboseLogging:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [a2 summary];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0( &dword_18733E000,  v5,  v6,  "[%{public}@] Unable to execute a nil progress block with progress: %{public}@",  v7,  v8,  v9,  v10,  v11);

  OUTLINED_FUNCTION_1();
}

@end