@interface _LSClientSettingsStore
+ (BOOL)supportsSecureCoding;
- (BOOL)resetUserElectionsWithError:(id *)a3;
- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5;
- (LSSettingsStoreConfiguration)configuration;
- (OS_dispatch_queue)internalQueue;
- (_LSClientSettingsStore)init;
- (id)__internalQueue_xpcConnectionWithError:(id *)a3;
- (unsigned)userElectionForExtensionKey:(id)a3;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)setInternalQueue:(id)a3;
@end

@implementation _LSClientSettingsStore

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LSClientSettingsStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____LSClientSettingsStore;
  v2 = -[LSSettingsStore _init](&v7, sel__init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.launchservices._LSSettingsInProcessStore", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____LSClientSettingsStore;
  -[_LSClientSettingsStore dealloc](&v3, sel_dealloc);
}

- (id)__internalQueue_xpcConnectionWithError:(id *)a3
{
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = __Block_byref_object_copy__23;
  v23 = __Block_byref_object_dispose__23;
  id v24 = 0LL;
  -[_LSClientSettingsStore internalQueue](self, "internalQueue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!self->_configuration)
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    v18[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
    v18[1] = (void (*)(void, void))3221225472LL;
    v18[2] = (void (*)(void, void))__65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke;
    v18[3] = (void (*)(void, void))&unk_189D72338;
    v18[4] = (void (*)(void, void))&v19;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDReadService, v18);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    v17[1] = 3221225472LL;
    v17[2] = __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_195;
    v17[3] = &unk_189D771D8;
    v17[4] = self;
    v17[5] = &v19;
    [v7 getSettingsStoreConfigurationWithCompletionHandler:v17];
  }

  p_xpcConnection = &self->_xpcConnection;
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    xpcConnection = self->_configuration;
    if (xpcConnection)
    {
      id v10 = objc_alloc(MEMORY[0x189607B30]);
      v11 = -[LSSettingsStoreConfiguration endpoint](self->_configuration, "endpoint");
      v12 = (void *)[v10 initWithListenerEndpoint:v11];

      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C693600];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setRemoteObjectInterface:v13];

      [v12 _setQueue:self->_internalQueue];
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __65___LSClientSettingsStore___internalQueue_xpcConnectionWithError___block_invoke_197;
      v16[3] = &unk_189D741C8;
      v16[4] = self;
      [v12 setInterruptionHandler:v16];
      objc_storeStrong((id *)&self->_xpcConnection, v12);
      [v12 resume];

      xpcConnection = *p_xpcConnection;
    }

    if (a3 && !xpcConnection)
    {
      *a3 = (id) v20[5];
      xpcConnection = *p_xpcConnection;
    }
  }

  id v14 = xpcConnection;
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (unsigned)userElectionForExtensionKey:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = __Block_byref_object_copy__23;
  v29 = __Block_byref_object_dispose__23;
  id v30 = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3032000000LL;
  v23[3] = __Block_byref_object_copy__23;
  v23[4] = __Block_byref_object_dispose__23;
  id v24 = 0LL;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  uint64_t v6 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke;
  block[3] = &unk_189D72658;
  block[4] = self;
  block[5] = &v25;
  block[6] = v23;
  dispatch_sync(internalQueue, block);
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  objc_super v7 = (void *)v26[5];
  if (v7)
  {
    v16[0] = v6;
    v16[1] = 3221225472LL;
    v16[2] = __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_2;
    v16[3] = &unk_189D72860;
    v8 = (os_log_s *)v4;
    v17 = v8;
    [v7 synchronousRemoteObjectProxyWithErrorHandler:v16];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472LL;
    v13[2] = __54___LSClientSettingsStore_userElectionForExtensionKey___block_invoke_198;
    v13[3] = &unk_189D77200;
    id v14 = v8;
    v15 = &v18;
    [v9 userElectionForExtensionKey:v14 reply:v13];

    id v10 = v17;
  }

  else
  {
    _LSExtensionsLog();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_LSClientSettingsStore userElectionForExtensionKey:].cold.1();
    }
  }

  unsigned __int8 v11 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(&v25, 8);
  return v11;
}

- (BOOL)setUserElection:(unsigned __int8)a3 forExtensionKey:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x3032000000LL;
  v45 = __Block_byref_object_copy__23;
  v46 = __Block_byref_object_dispose__23;
  id v47 = 0LL;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  v39 = __Block_byref_object_copy__23;
  v40 = __Block_byref_object_dispose__23;
  id v41 = 0LL;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  uint64_t v10 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke;
  block[3] = &unk_189D72658;
  block[4] = self;
  block[5] = &v42;
  block[6] = &v36;
  dispatch_sync(internalQueue, block);
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 1;
  unsigned __int8 v11 = (void *)v43[5];
  if (v11)
  {
    uint64_t v25 = 0LL;
    v26 = &v25;
    uint64_t v27 = 0x3032000000LL;
    v28 = __Block_byref_object_copy__23;
    v29 = __Block_byref_object_dispose__23;
    id v30 = 0LL;
    v21[0] = v10;
    v21[1] = 3221225472LL;
    v21[2] = __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_2;
    v21[3] = &unk_189D77228;
    id v12 = v8;
    id v22 = v12;
    v23 = &v25;
    id v24 = &v31;
    [v11 synchronousRemoteObjectProxyWithErrorHandler:v21];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v17[1] = 3221225472LL;
    v17[2] = __64___LSClientSettingsStore_setUserElection_forExtensionKey_error___block_invoke_200;
    v17[3] = &unk_189D77228;
    id v18 = v12;
    uint64_t v19 = &v25;
    uint64_t v20 = &v31;
    [v13 setUserElection:v6 forExtensionKey:v18 reply:v17];
    if (a5 && !*((_BYTE *)v32 + 24)) {
      *a5 = (id) v26[5];
    }

    _Block_object_dispose(&v25, 8);
  }

  else
  {
    char v34 = 0;
    _LSExtensionsLog();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_LSClientSettingsStore setUserElection:forExtensionKey:error:].cold.1();
    }

    if (a5) {
      *a5 = (id) v37[5];
    }
  }

  char v15 = *((_BYTE *)v32 + 24);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v15;
}

- (BOOL)resetUserElectionsWithError:(id *)a3
{
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = __Block_byref_object_copy__23;
  v32 = __Block_byref_object_dispose__23;
  id v33 = 0LL;
  uint64_t v25 = 0LL;
  v26[0] = &v25;
  v26[1] = 0x3032000000LL;
  v26[2] = __Block_byref_object_copy__23;
  v26[3] = __Block_byref_object_dispose__23;
  id v27 = 0LL;
  internalQueue = (dispatch_queue_s *)self->_internalQueue;
  uint64_t v5 = MEMORY[0x1895F87A8];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke;
  block[3] = &unk_189D72658;
  block[4] = self;
  block[5] = &v28;
  block[6] = &v25;
  dispatch_sync(internalQueue, block);
  uint64_t v20 = 0LL;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 1;
  uint64_t v6 = (void *)v29[5];
  if (v6)
  {
    uint64_t v14 = 0LL;
    char v15 = &v14;
    uint64_t v16 = 0x3032000000LL;
    v17 = __Block_byref_object_copy__23;
    id v18 = __Block_byref_object_dispose__23;
    id v19 = 0LL;
    v13[0] = v5;
    v13[1] = 3221225472LL;
    v13[2] = __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_2;
    v13[3] = &unk_189D77250;
    void v13[4] = &v14;
    v13[5] = &v20;
    [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = 3221225472LL;
    v12[2] = __54___LSClientSettingsStore_resetUserElectionsWithError___block_invoke_201;
    v12[3] = &unk_189D77250;
    v12[4] = &v14;
    v12[5] = &v20;
    [v7 resetUserElectionsWithReply:v12];
    if (a3 && !*((_BYTE *)v21 + 24)) {
      *a3 = (id) v15[5];
    }

    _Block_object_dispose(&v14, 8);
  }

  else
  {
    char v23 = 0;
    _LSExtensionsLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_LSClientSettingsStore resetUserElectionsWithError:].cold.1((uint64_t)v26, v8, v9);
    }

    if (a3) {
      *a3 = *(id *)(v26[0] + 40LL);
    }
  }

  char v10 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v28, 8);
  return v10;
}

- (LSSettingsStoreConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)userElectionForExtensionKey:.cold.1()
{
}

- (void)setUserElection:forExtensionKey:error:.cold.1()
{
}

- (void)resetUserElectionsWithError:(uint64_t)a3 .cold.1(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(*(void *)a1 + 40LL);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5( &dword_183E58000,  a2,  a3,  "Failed to reset user elections, failure creating connection: %@",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end