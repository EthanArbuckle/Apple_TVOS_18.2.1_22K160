@interface TKTokenDriver
+ (id)createDriver;
+ (void)createDriver;
- (NSArray)tokenSessions;
- (NSDictionary)extensionAttributes;
- (NSMutableDictionary)tokenConnections;
- (NSString)classID;
- (TKSharedResourceSlot)keepAliveResourceSlot;
- (TKTokenDriver)init;
- (TKTokenDriverContext)context;
- (id)createTokenWithSlot:(id)a3 AID:(id)a4 error:(id *)a5;
- (id)delegate;
- (id)endpointForToken:(id)a3;
- (id)keepAlive;
- (void)acquireTokenWithInstanceID:(id)a3 reply:(id)a4;
- (void)acquireTokenWithSlot:(id)a3 AID:(id)a4 reply:(id)a5;
- (void)auditAuthOperation:(id)a3 auditToken:(id *)a4 success:(BOOL)a5;
- (void)configureWithReply:(id)a3;
- (void)dealloc;
- (void)getTokenWithAttributes:(id)a3 reply:(id)a4;
- (void)releaseTokenWithInstanceID:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setExtensionAttributes:(id)a3;
- (void)setKeepAlive:(id)a3;
- (void)setKeepAliveResourceSlot:(id)a3;
- (void)terminate;
@end

@implementation TKTokenDriver

+ (id)createDriver
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!objc_opt_class()) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A58] format:@"Token plugins are not supported without PlugInKit"];
  }
  [MEMORY[0x189611CC0] defaultService];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 solePersonality];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 plugInDictionary];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKey:@"NSExtensionAttributes"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 objectForKeyedSubscript:@"com.apple.ctk.driver-class"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  TK_LOG_token();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[TKTokenDriver createDriver].cold.2(v5, (uint64_t)v8, v9);
  }

  id v10 = v8;
  v11 = -[objc_class init]( -[objc_class alloc](objc_getClass((const char *)[v10 UTF8String]), "alloc"),  "init");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    TK_LOG_token();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      [v5 identifier];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v15;
      __int16 v20 = 2114;
      id v21 = v10;
      __int16 v22 = 2048;
      v23 = v11;
      _os_log_fault_impl( &dword_186E58000,  v12,  OS_LOG_TYPE_FAULT,  "extension %{public}@: cannot instantiate TKTokenDriver-based class '%{public}@' (%p)",  buf,  0x20u);
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 identifier];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, a1, @"TKToken.m", 99, @"extension %@: cannot instantiate TKTokenDriver-based class '%@' (%p)", v17, v10, v11 object file lineNumber description];
  }

  -[objc_class setExtensionAttributes:](v11, "setExtensionAttributes:", v7);
  TK_LOG_token();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[TKTokenDriver createDriver].cold.1();
  }

  return v11;
}

- (void)dealloc
{
}

- (TKTokenDriver)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TKTokenDriver;
  uint64_t v2 = -[TKTokenDriver init](&v7, sel_init);
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [MEMORY[0x189603FC8] dictionary];
    tokenConnections = v3->_tokenConnections;
    v3->_tokenConnections = (NSMutableDictionary *)v4;
  }

  return v3;
}

- (NSString)classID
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"com.apple.ctk.class-id"];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)keepAlive
{
  id keepAlive = self->_keepAlive;
  if (keepAlive) {
    return keepAlive;
  }
  -[TKSharedResourceSlot resourceWithError:](self->_keepAliveResourceSlot, "resourceWithError:", 0LL);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setKeepAlive:(id)a3
{
}

- (id)endpointForToken:(id)a3
{
  id v4 = a3;
  [v4 tokenID];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 instanceID];
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  v8 = -[TKTokenDriver tokenConnections](self, "tokenConnections");
  [v8 objectForKeyedSubscript:v6];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    TK_LOG_token();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenDriver endpointForToken:].cold.1();
    }

    [v9 invalidate];
  }

  v11 = -[TKTokenConnection initWithToken:](objc_alloc(&OBJC_CLASS___TKTokenConnection), "initWithToken:", v4);
  v12 = -[TKTokenDriver tokenConnections](self, "tokenConnections");
  [v12 setObject:v11 forKeyedSubscript:v6];
  v13 = -[TKTokenConnection listener](v11, "listener");
  [v13 endpoint];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  return v14;
}

- (void)acquireTokenWithInstanceID:(id)a3 reply:(id)a4
{
  v29[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  objc_super v7 = (void (**)(id, void *, void))a4;
  v8 = objc_alloc(&OBJC_CLASS___TKTokenID);
  v9 = -[TKTokenDriver classID](self, "classID");
  id v10 = -[TKTokenID initWithClassID:instanceID:](v8, "initWithClassID:instanceID:", v9, v6);
  v11 = -[TKTokenDriver delegate](self, "delegate");
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_alloc(&OBJC_CLASS___TKTokenConfiguration);
    v14 = -[TKTokenDriver context](self, "context");
    [v14 configurationConnection];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TKTokenConfiguration initWithTokenID:configurationConnection:]( v13,  "initWithTokenID:configurationConnection:",  v10,  v15);
    v17 = -[TKTokenConfiguration beginTransaction](v16, "beginTransaction");
    v18 = -[TKTokenDriver delegate](self, "delegate");
    id v27 = 0LL;
    [v18 tokenDriver:self tokenForConfiguration:v16 error:&v27];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = v27;

    if (v19)
    {
      [v17 commit];
      -[TKTokenDriver endpointForToken:](self, "endpointForToken:", v19);
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v21, 0LL);
    }

    else
    {
      TK_LOG_token();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenDriver acquireTokenWithInstanceID:reply:].cold.1();
      }

      [v17 commit];
      ((void (**)(id, void *, id))v7)[2](v7, 0LL, v20);
    }
  }

  else
  {
    uint64_t v28 = *MEMORY[0x18960BAB8];
    -[TKTokenID stringRepresentation](v10, "stringRepresentation");
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __50__TKTokenDriver_acquireTokenWithInstanceID_reply___block_invoke;
    v25[3] = &unk_189F8A0C0;
    v25[4] = self;
    v26 = v7;
    -[TKTokenDriver getTokenWithAttributes:reply:](self, "getTokenWithAttributes:reply:", v23, v25);

    id v20 = v26;
  }
}

void __50__TKTokenDriver_acquireTokenWithInstanceID_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    [*(id *)(a1 + 32) endpointForToken:a2];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, 0LL);
  }

  else
  {
    (*(void (**)(void))(v2 + 16))(*(void *)(a1 + 40));
  }

- (void)acquireTokenWithSlot:(id)a3 AID:(id)a4 reply:(id)a5
{
  id v15 = 0LL;
  v8 = (void (**)(id, uint64_t, void *, void))a5;
  v9 = -[TKTokenDriver createTokenWithSlot:AID:error:](self, "createTokenWithSlot:AID:error:", a3, a4, &v15);
  id v10 = v15;
  if (v9)
  {
    uint64_t v11 = -[TKTokenDriver endpointForToken:](self, "endpointForToken:", v9);
    [v9 tokenID];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 instanceID];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v11, v13, 0LL);

    v8 = (void (**)(id, uint64_t, void *, void))v11;
  }

  else
  {
    TK_LOG_token();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenDriver acquireTokenWithSlot:AID:reply:].cold.1();
    }

    ((void (**)(id, uint64_t, void *, id))v8)[2](v8, 0LL, 0LL, v10);
  }
}

- (void)releaseTokenWithInstanceID:(id)a3
{
  id v4 = a3;
  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:v4];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = -[TKTokenDriver tokenConnections](self, "tokenConnections");
    [v8 objectForKeyedSubscript:v4];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 invalidate];

    -[TKTokenDriver tokenConnections](self, "tokenConnections");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 removeObjectForKey:v4];
  }

  else
  {
    TK_LOG_token();
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      -[TKTokenDriver releaseTokenWithInstanceID:].cold.1();
    }
  }

  objc_sync_exit(v5);
}

- (void)configureWithReply:(id)a3
{
  char v12 = (void (**)(id, uint64_t, void))a3;
  -[TKTokenDriver delegate](self, "delegate");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    id v6 = objc_alloc(&OBJC_CLASS___TKTokenDriverConfiguration);
    -[TKTokenDriver classID](self, "classID");
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TKTokenDriver context](self, "context");
    [v8 configurationConnection];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = -[TKTokenDriverConfiguration initWithClassID:configurationConnection:]( v6,  "initWithClassID:configurationConnection:",  v7,  v9);

    -[TKTokenDriver delegate](self, "delegate");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 tokenDriver:self configure:v10];
  }

  v12[2](v12, 1LL, 0LL);
}

- (id)createTokenWithSlot:(id)a3 AID:(id)a4 error:(id *)a5
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (a5)
  {
    id v6 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x1896075E0];
    v10[0] = @"token driver does not implement any way to create new slot-based token instances";
    [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:v7];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (void)getTokenWithAttributes:(id)a3 reply:(id)a4
{
  v11[1] = *MEMORY[0x1895F89C0];
  char v5 = (void *)MEMORY[0x189607870];
  uint64_t v10 = *MEMORY[0x1896075E0];
  v11[0] = @"token driver does not implement any way to create new token instances";
  id v6 = (void *)MEMORY[0x189603F68];
  id v7 = a4;
  [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, void *))a4 + 2))(v7, 0LL, v9);
}

- (void)terminate
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  -[TKTokenDriver tokenConnections](self, "tokenConnections", 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 allValues];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) invalidate];
      }

      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 removeAllObjects];

  objc_sync_exit(v3);
}

- (void)auditAuthOperation:(id)a3 auditToken:(id *)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  -[TKTokenDriver context](self, "context");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v10 = *(_OWORD *)&a4->var0[4];
  v11[0] = *(_OWORD *)a4->var0;
  v11[1] = v10;
  [v9 auditAuthOperation:v8 auditToken:v11 success:v5];
}

- (NSArray)tokenSessions
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  id v3 = (void *)[MEMORY[0x189604A58] mutableCopy];
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  -[TKTokenDriver tokenConnections](self, "tokenConnections");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 allValues];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v19 = v5;
    uint64_t v20 = *(void *)v26;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v19);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        [v8 sessions];
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v22;
          do
          {
            uint64_t v12 = 0LL;
            do
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
              [v8 sessions];
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              [v14 objectForKey:v13];
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
              [v3 addObject:v15];

              ++v12;
            }

            while (v10 != v12);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }

          while (v10);
        }

        ++v7;
      }

      while (v7 != v6);
      BOOL v5 = v19;
      uint64_t v6 = [v19 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }

    while (v6);
  }

  v16 = (void *)[v3 copy];
  objc_sync_exit(obj);

  return (NSArray *)v16;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (TKTokenDriverContext)context
{
  return (TKTokenDriverContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
}

- (NSMutableDictionary)tokenConnections
{
  return self->_tokenConnections;
}

- (TKSharedResourceSlot)keepAliveResourceSlot
{
  return self->_keepAliveResourceSlot;
}

- (void)setKeepAliveResourceSlot:(id)a3
{
}

- (NSDictionary)extensionAttributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setExtensionAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)createDriver
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a1 identifier];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_186E58000, a3, v5, "extension %{public}@ instantiating driver class %{public}@", v6);

  OUTLINED_FUNCTION_2();
}

- (void)endpointForToken:.cold.1()
{
}

- (void)acquireTokenWithInstanceID:reply:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_6( &dword_186E58000,  v1,  (uint64_t)v1,  "failed to instantiate token with instanceID %@, error: %@",  v2);
  OUTLINED_FUNCTION_4();
}

- (void)acquireTokenWithSlot:AID:reply:.cold.1()
{
}

- (void)releaseTokenWithInstanceID:.cold.1()
{
  OUTLINED_FUNCTION_7( &dword_186E58000,  v0,  v1,  "An attempt to release nonexistent token with instanceID=%{public}@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_4();
}

@end