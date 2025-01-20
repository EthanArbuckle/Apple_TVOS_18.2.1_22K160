@interface TKExtensionClientToken
+ (id)builtinTokenIDs;
- (BOOL)ensureConnectionWithError:(id *)a3;
- (NSXPCConnection)serverConnection;
- (NSXPCConnection)tokenConnection;
- (TKExtensionClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5;
- (id)SEPKeyEndpoint;
- (id)configurationEndpoint;
- (id)endpoint;
- (id)watcherEndpoint;
- (id)withError:(id *)a3 getServerEndpoint:(id)a4;
- (id)withError:(id *)a3 invoke:(id)a4;
- (void)dealloc;
- (void)serverConnection;
@end

@implementation TKExtensionClientToken

+ (id)builtinTokenIDs
{
  return (id)MEMORY[0x189604A58];
}

- (TKExtensionClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TKExtensionClientToken;
  v11 = -[TKClientToken _initWithTokenID:](&v14, sel__initWithTokenID_, a3);
  v12 = (TKExtensionClientToken *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 7, a4);
    objc_storeStrong((id *)&v12->_targetUID, a5);
  }

  return v12;
}

- (NSXPCConnection)serverConnection
{
  serverConnection = self->_serverConnection;
  if (serverConnection) {
    return serverConnection;
  }
  serverEndpoint = self->_serverEndpoint;
  if (serverEndpoint)
  {
    v5 = serverEndpoint;
  }

  else
  {
    provideEndpoint(2LL);
    v5 = (NSXPCListenerEndpoint *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (self->_targetUID)
      {
        TK_LOG_client_1();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          -[TKExtensionClientToken serverConnection].cold.1((id *)&self->_targetUID, v12);
        }
      }

      self->_namedConnection = 1;
      v13 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.ctkd.token-client" options:0];
      objc_super v14 = self->_serverConnection;
      self->_serverConnection = v13;

      v5 = 0LL;
      goto LABEL_8;
    }
  }

  TK_LOG_client_1();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[TKExtensionClientToken serverConnection].cold.2(&self->_serverEndpoint, (uint64_t)self, v6);
  }

  v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithListenerEndpoint:v5];
  v8 = self->_serverConnection;
  self->_serverConnection = v7;

LABEL_8:
  targetUID = self->_targetUID;
  if (targetUID) {
    -[NSXPCConnection _setTargetUserIdentifier:]( self->_serverConnection,  "_setTargetUserIdentifier:",  -[NSNumber integerValue](targetUID, "integerValue"));
  }
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B7840];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_serverConnection, "setRemoteObjectInterface:", v10);

  -[NSXPCConnection resume](self->_serverConnection, "resume");
  serverConnection = self->_serverConnection;
  return serverConnection;
}

- (id)withError:(id *)a3 getServerEndpoint:(id)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  v7 = (void (**)(id, void *, id *))a4;
  int v23 = 0;
  uint64_t v22 = *MEMORY[0x189607460];
  *(void *)&__int128 v8 = 67109120LL;
  __int128 v21 = v8;
  do
  {
    uint64_t v26 = 0LL;
    v27[0] = &v26;
    v27[1] = 0x3032000000LL;
    v27[2] = __Block_byref_object_copy__6;
    v27[3] = __Block_byref_object_dispose__6;
    id v28 = 0LL;
    -[TKExtensionClientToken serverConnection](self, "serverConnection", v21);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __54__TKExtensionClientToken_withError_getServerEndpoint___block_invoke;
    v25[3] = &unk_189F8B908;
    v25[4] = &v26;
    [v9 synchronousRemoteObjectProxyWithErrorHandler:v25];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    id v24 = 0LL;
    v7[2](v7, v10, &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v24;
    v13 = *(void **)(v27[0] + 40LL);
    if (v13)
    {
      if ([v13 code] == 4097
        && (([*(id *)(v27[0] + 40) domain],
             objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(),
             int v15 = [v14 isEqualToString:v22],
             v23 < 8)
          ? (int v16 = v15)
          : (int v16 = 0),
            v14,
            v16))
      {
        TK_LOG_client_1();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v21;
          int v32 = v23;
          _os_log_debug_impl( &dword_186E58000,  v17,  OS_LOG_TYPE_DEBUG,  "detected interruption on token-client connection, retrying %d",  buf,  8u);
        }

        [MEMORY[0x189607A40] sleepForTimeInterval:(double)v23++ * 0.1];
        char v18 = 1;
      }

      else
      {
        if (a3) {
          *a3 = *(id *)(v27[0] + 40LL);
        }
        TK_LOG_client_1();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[TKExtensionClientToken withError:getServerEndpoint:].cold.1(v29, (uint64_t)v27, &v30, v19);
        }

        char v18 = 0;
        id v4 = 0LL;
      }
    }

    else
    {
      if (a3 && !v11) {
        *a3 = v12;
      }
      id v4 = v11;
      char v18 = 0;
    }

    _Block_object_dispose(&v26, 8);
  }

  while ((v18 & 1) != 0);

  return v4;
}

void __54__TKExtensionClientToken_withError_getServerEndpoint___block_invoke(uint64_t a1, void *a2)
{
}

- (id)endpoint
{
  return -[TKExtensionClientToken withError:getServerEndpoint:]( self,  "withError:getServerEndpoint:",  0LL,  &__block_literal_global_16);
}

id __34__TKExtensionClientToken_endpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __34__TKExtensionClientToken_endpoint__block_invoke_2;
  v5[3] = &unk_189F8B970;
  v5[4] = &v6;
  [v2 getEndpoint:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__TKExtensionClientToken_endpoint__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)configurationEndpoint
{
  return -[TKExtensionClientToken withError:getServerEndpoint:]( self,  "withError:getServerEndpoint:",  0LL,  &__block_literal_global_64);
}

id __47__TKExtensionClientToken_configurationEndpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __47__TKExtensionClientToken_configurationEndpoint__block_invoke_2;
  v5[3] = &unk_189F8B970;
  v5[4] = &v6;
  [v2 getConfigurationEndpoint:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__TKExtensionClientToken_configurationEndpoint__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)watcherEndpoint
{
  return -[TKExtensionClientToken withError:getServerEndpoint:]( self,  "withError:getServerEndpoint:",  0LL,  &__block_literal_global_65);
}

id __41__TKExtensionClientToken_watcherEndpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __41__TKExtensionClientToken_watcherEndpoint__block_invoke_2;
  v5[3] = &unk_189F8B970;
  v5[4] = &v6;
  [v2 getWatcherEndpoint:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__TKExtensionClientToken_watcherEndpoint__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)SEPKeyEndpoint
{
  return -[TKExtensionClientToken withError:getServerEndpoint:]( self,  "withError:getServerEndpoint:",  0LL,  &__block_literal_global_66);
}

id __40__TKExtensionClientToken_SEPKeyEndpoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __40__TKExtensionClientToken_SEPKeyEndpoint__block_invoke_2;
  v5[3] = &unk_189F8B970;
  v5[4] = &v6;
  [v2 getSEPKeyEndpoint:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__TKExtensionClientToken_SEPKeyEndpoint__block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)ensureConnectionWithError:(id *)a3
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  if (self->_tokenConnection)
  {
    char v3 = 1;
    return v3 & 1;
  }

  int v6 = 0;
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x3032000000LL;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v46 = __Block_byref_object_copy__6;
  v47 = __Block_byref_object_dispose__6;
  id v48 = 0LL;
  uint64_t v27 = *MEMORY[0x189607460];
  *(void *)&__int128 v4 = 67109120LL;
  __int128 v26 = v4;
  while (v6 <= 7)
  {
    uint64_t v37 = 0LL;
    v38 = &v37;
    uint64_t v39 = 0x3032000000LL;
    v40 = __Block_byref_object_copy__6;
    v41 = __Block_byref_object_dispose__6;
    id v42 = 0LL;
    uint64_t v33 = 0LL;
    v34 = &v33;
    uint64_t v35 = 0x2020000000LL;
    char v36 = 0;
    -[TKExtensionClientToken serverConnection](self, "serverConnection");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v7;
    v32[1] = 3221225472LL;
    v32[2] = __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke;
    v32[3] = &unk_189F8B9F8;
    v32[4] = self;
    v32[5] = &v37;
    v32[6] = &v33;
    [v8 synchronousRemoteObjectProxyWithErrorHandler:v32];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKClientToken tokenID](self, "tokenID");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v7;
    v31[1] = 3221225472LL;
    v31[2] = __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_67;
    v31[3] = &unk_189F8BA20;
    v31[4] = &v43;
    v31[5] = &v37;
    [v9 getTokenEndpointForTokenID:v10 reply:v31];

    if (v44[5])
    {
      id v11 = objc_alloc(MEMORY[0x189607B30]);
      id v12 = (NSXPCConnection *)[v11 initWithListenerEndpoint:v44[5]];
      tokenConnection = self->_tokenConnection;
      self->_tokenConnection = v12;

      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B55E0];
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](self->_tokenConnection, "setRemoteObjectInterface:", v14);

      ++self->_connectionIdentifier;
      -[NSXPCConnection resume](self->_tokenConnection, "resume");
      char v15 = 0;
      char v3 = 1;
    }

    else
    {
      if ([(id)v38[5] code] == 4097
        && ([(id)v38[5] domain],
            int v16 = (void *)objc_claimAutoreleasedReturnValue(),
            int v17 = [v16 isEqualToString:v27],
            v16,
            v17))
      {
        TK_LOG_client_1();
        char v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v26;
          int v50 = v6;
          _os_log_debug_impl( &dword_186E58000,  v18,  OS_LOG_TYPE_DEBUG,  "reconnecting ctkd after interrupt, try %d",  buf,  8u);
        }
      }

      else
      {
        if (objc_msgSend((id)v38[5], "code", v26) != 4099) {
          goto LABEL_21;
        }
        [(id)v38[5] domain];
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        int v20 = [v19 isEqualToString:v27];

        if (!v20) {
          goto LABEL_21;
        }
        if (*((_BYTE *)v34 + 24) && self->_namedConnection
          || -[TKClientToken _testing_noAutomaticReconnect](self, "_testing_noAutomaticReconnect"))
        {
          TK_LOG_client_1();
          __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[TKExtensionClientToken ensureConnectionWithError:].cold.2(&v29, v30, v21);
          }

LABEL_21:
          char v15 = 0;
          char v3 = 0;
          if (a3) {
            *a3 = (id) v38[5];
          }
          goto LABEL_23;
        }

        TK_LOG_client_1();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v26;
          int v50 = v6;
          _os_log_debug_impl( &dword_186E58000,  v22,  OS_LOG_TYPE_DEBUG,  "reconnecting ctkd after invalidate, try %d",  buf,  8u);
        }

        -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");
        serverConnection = self->_serverConnection;
        self->_serverConnection = 0LL;

        [MEMORY[0x189607A40] sleepForTimeInterval:(double)v6++ * 0.1];
      }

      char v15 = 1;
    }

void __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  TK_LOG_client_1();
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
}

void __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_67( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)withError:(id *)a3 invoke:(id)a4
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  uint64_t v7 = (void (**)(id, void *, void, id *))a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  int v9 = 0;
  uint64_t v34 = *MEMORY[0x189607460];
  double v10 = 0.0;
  *(void *)&__int128 v11 = 138543618LL;
  __int128 v33 = v11;
  while (-[TKExtensionClientToken ensureConnectionWithError:](v8, "ensureConnectionWithError:", a3, v33))
  {
    uint64_t v43 = 0LL;
    v44 = &v43;
    uint64_t v45 = 0x3032000000LL;
    v46 = __Block_byref_object_copy__6;
    v47 = __Block_byref_object_dispose__6;
    id v48 = 0LL;
    -[TKExtensionClientToken tokenConnection](v8, "tokenConnection");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1895F87A8];
    v38[1] = 3221225472LL;
    v38[2] = __43__TKExtensionClientToken_withError_invoke___block_invoke;
    v38[3] = &unk_189F8B908;
    v38[4] = &v43;
    [v12 synchronousRemoteObjectProxyWithErrorHandler:v38];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    int64_t connectionIdentifier = v8->_connectionIdentifier;
    id v37 = 0LL;
    v7[2](v7, v13, connectionIdentifier, &v37);
    char v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = v37;
    int v17 = (void *)v44[5];
    if (!v17)
    {
      if (a3 && !v15)
      {
        if (!v16)
        {
          TK_LOG_client_1();
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
            -[TKExtensionClientToken withError:invoke:].cold.2(&v35, v36, v22);
          }

          [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:0];
          id v16 = (id)objc_claimAutoreleasedReturnValue();
        }

        id v16 = v16;
        *a3 = v16;
      }

void __43__TKExtensionClientToken_withError_invoke___block_invoke(uint64_t a1, void *a2)
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKExtensionClientToken;
  -[TKExtensionClientToken dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)tokenConnection
{
  return self->_tokenConnection;
}

- (void).cxx_destruct
{
}

- (void)serverConnection
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (*a1) {
    id v5 = "external";
  }
  else {
    id v5 = "EP-provided";
  }
  uint64_t v6 = *(void *)(a2 + 80);
  if (v6)
  {
    id v3 = objc_msgSend( NSString,  "stringWithFormat:",  @" (targetUID=%d)",  objc_msgSend(*(id *)(a2 + 80), "integerValue"));
    uint64_t v7 = (const char *)[v3 UTF8String];
  }

  else
  {
    uint64_t v7 = "";
  }

  *(_DWORD *)buf = 136446466;
  int v9 = v5;
  __int16 v10 = 2082;
  __int128 v11 = v7;
  _os_log_debug_impl( &dword_186E58000,  log,  OS_LOG_TYPE_DEBUG,  "creating connection to %{public}s endpoint%{public}s",  buf,  0x16u);
  if (v6) {
}
  }

- (void)withError:(void *)a3 getServerEndpoint:(os_log_t)log .cold.1( uint8_t *buf,  uint64_t a2,  void *a3,  os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)a2 + 40LL);
  *(_DWORD *)buf = 138543362;
  *a3 = v4;
  _os_log_error_impl( &dword_186E58000,  log,  OS_LOG_TYPE_ERROR,  "get*Endpoint on token-client connection failed with connection error %{public}@",  buf,  0xCu);
}

- (void)ensureConnectionWithError:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 80);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_fault_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_FAULT,  "Unable to connect to tokenServer even after retries. (ep=%{public}@, uid=%@)",  (uint8_t *)&v4,  0x16u);
}

- (void)ensureConnectionWithError:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl( &dword_186E58000,  log,  OS_LOG_TYPE_DEBUG,  "failed to connect to named ctkd port, aborting (probably system shutdown in progress)",  buf,  2u);
}

void __52__TKExtensionClientToken_ensureConnectionWithError___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) tokenID];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl( &dword_186E58000,  a3,  OS_LOG_TYPE_ERROR,  "Failed to get connection for tokenID=%{public}@ (error %{public}@)",  (uint8_t *)&v6,  0x16u);
}

- (void)withError:(os_log_s *)a3 invoke:.cold.1(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3( &dword_186E58000,  a3,  (uint64_t)a3,  "Unable to connect to %{public}@ even after retries.",  (uint8_t *)a2);
}

- (void)withError:(os_log_t)log invoke:.cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl( &dword_186E58000,  log,  OS_LOG_TYPE_FAULT,  "TKClientToken operation failed but did not fill any error, substituting TKErrorCodeCommunicationError",  buf,  2u);
}

@end