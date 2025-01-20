@interface TKTokenDriverContext
- (BOOL)startRequestWithError:(id *)a3;
- (NSXPCListenerEndpoint)configurationEndpoint;
- (TKTokenConfigurationConnection)configurationConnection;
- (TKTokenDriver)driver;
- (double)idleTimeout;
- (id)configurationForTokenID:(id)a3;
- (void)acquireTokenWithInstanceID:(id)a3 reply:(id)a4;
- (void)acquireTokenWithSlot:(id)a3 AID:(id)a4 reply:(id)a5;
- (void)auditAuthOperation:(id)a3 auditToken:(id *)a4 success:(BOOL)a5;
- (void)configureWithReply:(id)a3;
- (void)idleTimeout;
- (void)releaseTokenWithInstanceID:(id)a3 reply:(id)a4;
- (void)setConfigurationEndpoint:(id)a3 reply:(id)a4;
- (void)setup;
@end

@implementation TKTokenDriverContext

- (TKTokenConfigurationConnection)configurationConnection
{
  v3 = self;
  objc_sync_enter(v3);
  configurationConnection = v3->_configurationConnection;
  if (!configurationConnection)
  {
    v5 = -[TKTokenDriverContext configurationEndpoint](v3, "configurationEndpoint");
    if (!v5)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 handleFailureInMethod:a2 object:v3 file:@"TKToken.m" lineNumber:308 description:@"ctkd did not set configurationEndpoint"];
    }

    v6 = objc_alloc(&OBJC_CLASS___TKTokenConfigurationConnection);
    v7 = -[TKTokenDriverContext configurationEndpoint](v3, "configurationEndpoint");
    uint64_t v8 = -[TKTokenConfigurationConnection initWithEndpoint:](v6, "initWithEndpoint:", v7);
    v9 = v3->_configurationConnection;
    v3->_configurationConnection = (TKTokenConfigurationConnection *)v8;

    configurationConnection = v3->_configurationConnection;
  }

  v10 = configurationConnection;
  objc_sync_exit(v3);

  return v10;
}

- (id)configurationForTokenID:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___TKTokenConfiguration);
  v6 = -[TKTokenDriverContext configurationConnection](self, "configurationConnection");
  v7 = -[TKTokenConfiguration initWithTokenID:configurationConnection:]( v5,  "initWithTokenID:configurationConnection:",  v4,  v6);

  return v7;
}

- (void)auditAuthOperation:(id)a3 auditToken:(id *)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = -[NSExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_228];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v11 = *(_OWORD *)&a4->var0[4];
  v12[0] = *(_OWORD *)a4->var0;
  v12[1] = v11;
  [v10 auditAuthOperation:v8 auditToken:v12 success:v5];
}

void __62__TKTokenDriverContext_auditAuthOperation_auditToken_success___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  TK_LOG_token();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __62__TKTokenDriverContext_auditAuthOperation_auditToken_success___block_invoke_cold_1();
  }
}

- (double)idleTimeout
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 firstObject];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    [v3 userInfo];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKeyedSubscript:@"idleTimeout"];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    double v6 = 5.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v5 doubleValue];
      double v6 = v7;
      TK_LOG_token();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenDriverContext idleTimeout].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }

  else
  {
    double v6 = 5.0;
  }

  return v6;
}

- (void)setup
{
  v3 = (TKTokenDriver *)objc_claimAutoreleasedReturnValue();
  driver = self->_driver;
  self->_driver = v3;

  -[TKTokenDriver setContext:](self->_driver, "setContext:", self);
  BOOL v5 = objc_alloc(&OBJC_CLASS___TKSharedResourceSlot);
  -[TKTokenDriverContext driver](self, "driver");
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 classID];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[TKSharedResourceSlot initWithName:](v5, "initWithName:", v7);
  -[TKTokenDriver setKeepAliveResourceSlot:](self->_driver, "setKeepAliveResourceSlot:", v8);

  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __29__TKTokenDriverContext_setup__block_invoke;
  v25[3] = &unk_189F8A188;
  objc_copyWeak(&v26, &location);
  -[TKTokenDriver keepAliveResourceSlot]( self->_driver,  "keepAliveResourceSlot",  v25[0],  3221225472LL,  __29__TKTokenDriverContext_setup__block_invoke,  &unk_189F8A188);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setObjectDestroyedBlock:v25];

  -[TKTokenDriverContext idleTimeout](self, "idleTimeout");
  double v11 = v10;
  -[TKTokenDriver keepAliveResourceSlot](self->_driver, "keepAliveResourceSlot");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setIdleTimeout:v11];

  -[NSExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 _queue];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKTokenDriver keepAliveResourceSlot](self->_driver, "keepAliveResourceSlot");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 setIdleQueue:v14];
  v16 = -[TKTokenDriver keepAliveResourceSlot](self->_driver, "keepAliveResourceSlot");
  [v16 resourceWithError:0];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  id initialKeepAlive = self->_initialKeepAlive;
  self->_id initialKeepAlive = v17;
  v19 = -[NSExtensionContext inputItems](self, "inputItems");
  [v19 firstObject];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 userInfo];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 objectForKey:@"avoidInitialKeepAlive"];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  int v23 = [v22 BOOLValue];

  if (v23)
  {
    id v24 = self->_initialKeepAlive;
    self->_id initialKeepAlive = 0LL;
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __29__TKTokenDriverContext_setup__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    TK_LOG_token();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __29__TKTokenDriverContext_setup__block_invoke_cold_3(WeakRetained, v2);
    }

    [WeakRetained driver];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 terminate];

    TK_LOG_token();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __29__TKTokenDriverContext_setup__block_invoke_cold_2();
    }

    BOOL v5 = (void *)WeakRetained[5];
    WeakRetained[5] = 0LL;

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
    double v6 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained cancelRequestWithError:v6];

    TK_LOG_token();
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __29__TKTokenDriverContext_setup__block_invoke_cold_1();
    }
  }
}

- (void)setConfigurationEndpoint:(id)a3 reply:(id)a4
{
  BOOL v5 = (void (**)(void))a4;
  v5[2]();
}

- (BOOL)startRequestWithError:(id *)a3
{
  double v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    id initialKeepAlive = self->_initialKeepAlive;
    id v8 = initialKeepAlive;
    if (!initialKeepAlive)
    {
      -[TKTokenDriverContext driver](self, "driver");
      a3 = (id *)objc_claimAutoreleasedReturnValue();
      [a3 keepAliveResourceSlot];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 resourceWithError:0];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    -[TKTokenDriverContext driver](self, "driver");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setKeepAlive:v8];

    if (!initialKeepAlive)
    {
    }

    id v10 = self->_initialKeepAlive;
    self->_id initialKeepAlive = 0LL;
  }

  else
  {
    TK_LOG_token();
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[TKTokenDriverContext startRequestWithError:].cold.1();
    }

    if (a3)
    {
      [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:4099 userInfo:0];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6 != 0LL;
}

- (void)acquireTokenWithInstanceID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v17 = 0LL;
  BOOL v8 = -[TKTokenDriverContext startRequestWithError:](self, "startRequestWithError:", &v17);
  id v9 = v17;
  if (v8)
  {
    id v10 = _os_activity_create( &dword_186E58000,  "acquire token by instanceID",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &state);
    -[TKTokenDriverContext driver](self, "driver");
    double v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    _OWORD v12[2] = __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke;
    v12[3] = &unk_189F8A1B0;
    id v13 = v6;
    uint64_t v14 = self;
    id v15 = v7;
    [v11 acquireTokenWithInstanceID:v13 reply:v12];

    os_activity_scope_leave(&state);
  }

  else
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v9);
  }
}

void __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  id v6 = a2;
  TK_LOG_token();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke_cold_1( a1,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  [*(id *)(a1 + 40) driver];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setKeepAlive:0];
}

- (void)acquireTokenWithSlot:(id)a3 AID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v18 = 0LL;
  BOOL v11 = -[TKTokenDriverContext startRequestWithError:](self, "startRequestWithError:", &v18);
  id v12 = v18;
  if (v11)
  {
    uint64_t v13 = _os_activity_create(&dword_186E58000, "acquire token by slot", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v13, &state);
    -[TKTokenDriverContext driver](self, "driver");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke;
    v15[3] = &unk_189F8A1D8;
    v15[4] = self;
    id v16 = v10;
    [v14 acquireTokenWithSlot:v8 AID:v9 reply:v15];

    os_activity_scope_leave(&state);
  }

  else
  {
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0LL, 0LL, v12);
  }
}

void __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a2;
  TK_LOG_token();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) driver];
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setKeepAlive:0];
}

- (void)configureWithReply:(id)a3
{
  id v4 = a3;
  id v12 = 0LL;
  BOOL v5 = -[TKTokenDriverContext startRequestWithError:](self, "startRequestWithError:", &v12);
  id v6 = v12;
  if (v5)
  {
    id v7 = _os_activity_create(&dword_186E58000, "configure token class", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v7, &state);
    -[TKTokenDriverContext driver](self, "driver");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __43__TKTokenDriverContext_configureWithReply___block_invoke;
    v9[3] = &unk_189F8A200;
    v9[4] = self;
    id v10 = v4;
    [v8 configureWithReply:v9];

    os_activity_scope_leave(&state);
  }

  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0LL, v6);
  }
}

void __43__TKTokenDriverContext_configureWithReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  TK_LOG_token();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __43__TKTokenDriverContext_configureWithReply___block_invoke_cold_1(a1, v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) driver];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setKeepAlive:0];
}

- (void)releaseTokenWithInstanceID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v14 = 0LL;
  BOOL v8 = -[TKTokenDriverContext startRequestWithError:](self, "startRequestWithError:", &v14);
  id v9 = v14;
  if (v8)
  {
    id v10 = _os_activity_create(&dword_186E58000, "release token", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v10, &state);
    -[TKTokenDriverContext driver](self, "driver");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 releaseTokenWithInstanceID:v6];

    v7[2](v7);
    -[TKTokenDriverContext driver](self, "driver");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setKeepAlive:0];

    os_activity_scope_leave(&state);
  }

  else
  {
    v7[2](v7);
  }
}

- (TKTokenDriver)driver
{
  return self->_driver;
}

- (NSXPCListenerEndpoint)configurationEndpoint
{
  return self->_configurationEndpoint;
}

- (void).cxx_destruct
{
}

void __62__TKTokenDriverContext_auditAuthOperation_auditToken_success___block_invoke_cold_1()
{
}

- (void)idleTimeout
{
}

void __29__TKTokenDriverContext_setup__block_invoke_cold_1()
{
}

void __29__TKTokenDriverContext_setup__block_invoke_cold_2()
{
}

void __29__TKTokenDriverContext_setup__block_invoke_cold_3(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 driver];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6( &dword_186E58000,  a2,  v4,  "Idle time detected in extension (%{public}@), shutting down the context %{public}@",  v5);

  OUTLINED_FUNCTION_2();
}

- (void)startRequestWithError:.cold.1()
{
}

void __57__TKTokenDriverContext_acquireTokenWithInstanceID_reply___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __55__TKTokenDriverContext_acquireTokenWithSlot_AID_reply___block_invoke_cold_1()
{
}

void __43__TKTokenDriverContext_configureWithReply___block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) driver];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 classID];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_186E58000, a2, v5, "finished configuring class %{public}@", v6);

  OUTLINED_FUNCTION_2();
}

@end