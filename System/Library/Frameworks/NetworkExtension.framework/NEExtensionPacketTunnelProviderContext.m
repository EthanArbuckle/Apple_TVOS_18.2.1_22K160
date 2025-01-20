@interface NEExtensionPacketTunnelProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (id)extensionPoint;
- (void)completeSession;
- (void)dispose;
- (void)fetchVirtualInterfaceTypeWithCompletionHandler:(id)a3;
- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7;
- (void)setAppUUIDMap:(id)a3;
- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setupVirtualInterface:(id)a3;
- (void)startWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3;
@end

@implementation NEExtensionPacketTunnelProviderContext

- (void)completeSession
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (!self || !has_internal_diagnostics || !self->_testDisconnectAndDisposeTimeout)
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___NEExtensionPacketTunnelProviderContext;
    -[NEExtensionProviderContext completeSession](&v4, sel_completeSession);
  }

- (void)dispose
{
  if (!self || !self->super.super._isDisposed)
  {
    v3 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
    [v3 packetFlow];
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEPacketTunnelFlow closeVirtualInterface](v4);

    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___NEExtensionPacketTunnelProviderContext;
    -[NEExtensionProviderContext dispose](&v5, sel_dispose);
  }

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEExtensionPacketTunnelProviderContext;
  -[NEExtensionProviderContext startWithOptions:completionHandler:]( &v13,  sel_startWithOptions_completionHandler_,  v6,  v7);

  ne_log_obj();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = self;
    __int16 v16 = 2048;
    id v17 = v6;
    _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Calling startTunnelWithOptions with options %p",  buf,  0x16u);
  }

  if (isa_nsdictionary(v6))
  {
    [v6 objectForKeyedSubscript:@"test-disconnect-dispose-timeout"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (isa_nsnumber(v10))
    {
      char v11 = [v10 BOOLValue];
      if (self) {
        self->_testDisconnectAndDisposeTimeout = v11;
      }
    }
  }

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __77__NEExtensionPacketTunnelProviderContext_startWithOptions_completionHandler___block_invoke;
  v12[3] = &unk_18A0907E8;
  v12[4] = self;
  [v8 startTunnelWithOptions:v6 completionHandler:v12];
}

- (void)stopWithReason:(int)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    char v11 = self;
    __int16 v12 = 2080;
    uint64_t v13 = ne_session_stop_reason_to_string();
    _os_log_impl(&dword_1876B1000, v6, OS_LOG_TYPE_DEFAULT, "%@: Calling stopTunnelWithReason because: %s", buf, 0x16u);
  }

  else {
    uint64_t v7 = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __57__NEExtensionPacketTunnelProviderContext_stopWithReason___block_invoke;
  v8[3] = &unk_18A08D3E8;
  v8[4] = self;
  int v9 = a3;
  [v5 stopTunnelWithReason:v7 completionHandler:v8];
}

- (void)setupVirtualInterface:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [v19 packetFlow];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v4;
  if (v5)
  {
    uint64_t v7 = v5;
    objc_sync_enter(v7);
    if (v7[11]) {
      -[NEPacketTunnelFlow closeVirtualInterface](v7);
    }
    if (dyld_get_program_sdk_version() < 0xF0000)
    {
      [v6 controlSocket];
      int v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setSocket:v9];
    }

    id v10 = objc_getProperty(v7, v8, 24LL, 1);
    v7[11] = [v6 createVirtualInterfaceWithQueue:v10 clientInfo:0];

    uint64_t v12 = v7[11];
    if (v12) {
      v7[10] = *(void *)(v12 + 256);
    }
    if (objc_getProperty(v7, v11, 96LL, 1))
    {
      id v14 = objc_getProperty(v7, v13, 96LL, 1);
      objc_setProperty_atomic_copy(v7, v15, 0LL, 96LL);
      [v7 readPacketsWithCompletionHandler:v14];
    }

    if (objc_getProperty(v7, v13, 32LL, 1))
    {
      id v17 = objc_getProperty(v7, v16, 32LL, 1);
      objc_setProperty_atomic_copy(v7, v18, 0LL, 32LL);
      [v7 readPacketObjectsWithCompletionHandler:v17];
    }

    objc_sync_exit(v7);
  }
}

- (void)fetchVirtualInterfaceTypeWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v8 packetFlow];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void *)(v5 + 80);
  }
  else {
    uint64_t v7 = 0LL;
  }
  v4[2](v4, v7);
}

- (void)requestSocket:(BOOL)a3 interface:(id)a4 local:(id)a5 remote:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a3;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  ne_log_obj();
  __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412546;
    v20 = self;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_debug_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_DEBUG,  "%@: Requesting IKE socket for interface %@",  (uint8_t *)&v19,  0x16u);
  }

  -[NEExtensionProviderContext hostContext](self, v17);
  SEL v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 requestSocket:v10 interface:v12 local:v15 remote:v14 completionHandler:v13];
}

- (void)setAppUUIDMap:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = self;
      _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_DEFAULT, "%@: Setting the app UUID map", buf, 0xCu);
    }

    v27 = v5;
    [v5 packetFlow];
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v28 = v4;
    id v8 = v4;
    int v9 = v8;
    if (v7)
    {
      selfa = v7;
      [v8 allKeys];
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
      id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      id obj = v10;
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:buf count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v31;
        do
        {
          for (uint64_t i = 0LL; i != v13; ++i)
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(obj);
            }
            __int16 v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            [v9 objectForKeyedSubscript:v16];
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            SEL v18 = objc_alloc(&OBJC_CLASS___NEFlowMetaData);
            id v19 = v16;
            id v20 = v17;
            if (v18)
            {
              v35.receiver = v18;
              v35.super_class = (Class)&OBJC_CLASS___NEFlowMetaData;
              __int16 v21 = -[NSExtensionContext init](&v35, sel_init);
              SEL v18 = (NEFlowMetaData *)v21;
              if (v21)
              {
                objc_storeStrong((id *)&v21->super.super._hostContext, v17);
                uint64_t v34 = [v19 hash];
                uint64_t v22 = [MEMORY[0x189603F48] dataWithBytes:&v34 length:8];
                sourceAppUniqueIdentifier = v18->_sourceAppUniqueIdentifier;
                v18->_sourceAppUniqueIdentifier = (NSData *)v22;
              }
            }

            [v11 setObject:v18 forKeyedSubscript:v19];
          }

          uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:buf count:16];
        }

        while (v13);
      }

      v24 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v11];
      uint64_t v7 = selfa;
      objc_setProperty_atomic(selfa, v25, v24, 72LL);
    }

    uint64_t v5 = v27;
    id v4 = v28;
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v37 = self;
    _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "%@: No provider when setting the app UUID map",  buf,  0xCu);
  }
}

- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __83__NEExtensionPacketTunnelProviderContext_setTunnelConfiguration_completionHandler___block_invoke;
  v10[3] = &unk_18A08BD00;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NEExtensionPacketTunnelProviderContext;
  -[NEExtensionTunnelProviderContext setTunnelConfiguration:completionHandler:]( &v9,  sel_setTunnelConfiguration_completionHandler_,  v6,  v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)extensionPoint
{
  return @"com.apple.networkextension.packet-tunnel";
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

void __83__NEExtensionPacketTunnelProviderContext_setTunnelConfiguration_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _principalObject];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = v5;
    if (v5)
    {
      [v5 packetFlow];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      id v8 = v7;
      if (v7)
      {
        objc_super v9 = v7;
        objc_sync_enter(v9);
        v9[8] = 0;
        objc_sync_exit(v9);
      }

      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }
}

id __57__NEExtensionPacketTunnelProviderContext_stopWithReason___block_invoke(uint64_t a1)
{
  id result = (id)os_variant_has_internal_diagnostics();
  uint64_t v3 = *(void *)(a1 + 32);
  if (!(_DWORD)result || !v3 || !*(_BYTE *)(v3 + 104))
  {
    uint64_t v4 = *(unsigned int *)(a1 + 40);
    v5.receiver = *(id *)(a1 + 32);
    v5.super_class = (Class)&OBJC_CLASS___NEExtensionPacketTunnelProviderContext;
    return objc_msgSendSuper2(&v5, sel_stopWithReason_, v4);
  }

  return result;
}

void __77__NEExtensionPacketTunnelProviderContext_startWithOptions_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) handleIPCDetached];
  }
  [*(id *)(a1 + 32) startedWithError:v3];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2296 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2296, &__block_literal_global_2297);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2298;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2293 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2293, &__block_literal_global_74);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_2294;
}

void __73__NEExtensionPacketTunnelProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EAAB8];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_2294;
  _extensionAuxiliaryHostProtocol_protocol_2294 = v0;
}

void __75__NEExtensionPacketTunnelProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EAA20];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2298;
  _extensionAuxiliaryVendorProtocol_protocol_2298 = v0;

  v2 = (void *)MEMORY[0x189604010];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_extensionAuxiliaryVendorProtocol_protocol_2298 setClasses:v5 forSelector:sel_setAppUUIDMap_ argumentIndex:0 ofReply:0];
}

@end