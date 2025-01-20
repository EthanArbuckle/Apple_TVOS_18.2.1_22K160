@interface NEExtensionTunnelProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)cancelWithError:(id)a3;
- (void)didSetReasserting:(BOOL)a3;
- (void)establishIPCWithCompletionHandler:(id)a3;
- (void)handleIPCDetached;
- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4;
- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation NEExtensionTunnelProviderContext

- (void)didSetReasserting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEFAULT, "%@: reasserting set to %d", (uint8_t *)&v8, 0x12u);
  }
  v7 = -[NEExtensionProviderContext hostContext](self, v6);
  [v7 didSetReasserting:v3];
}

- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  int is_debug_logging_enabled = nelog_is_debug_logging_enabled();
  ne_log_large_obj();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  __int16 v10 = v9;
  if (is_debug_logging_enabled)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [v6 descriptionWithIndent:0 options:2];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = 138412546;
      v15 = self;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_DEFAULT,  "%@: provider set tunnel configuration to %@",  (uint8_t *)&v14,  0x16u);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_debug_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_DEBUG,  "%@: provider set tunnel configuration to %@",  (uint8_t *)&v14,  0x16u);
  }
  v13 = -[NEExtensionProviderContext hostContext](self, v12);
  [v13 setTunnelConfiguration:v6 completionHandler:v7];
}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NEExtensionTunnelProviderContext;
  -[NEExtensionProviderContext setConfiguration:extensionIdentifier:]( &v26,  sel_setConfiguration_extensionIdentifier_,  v6,  a4);
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  id v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    ne_log_obj();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    v28 = self;
    uint64_t v18 = "%@: no provider found";
LABEL_19:
    _os_log_error_impl(&dword_1876B1000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
    goto LABEL_20;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    v28 = self;
    uint64_t v18 = "%@: not setting configuration because provider is not an NETunnelProvider";
    goto LABEL_19;
  }

  [v6 alwaysOnVPN];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      [v6 alwaysOnVPN];
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 activeInterfaceProtocolKey];
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = self;
      __int16 v29 = 2112;
      v30 = v11;
      _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_INFO,  "%@: AlwaysOn VPN configuration: activeInterfaceProtocolKey %@",  buf,  0x16u);
    }

    [v6 alwaysOnVPN];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 interfaceProtocolMapping];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 alwaysOnVPN];
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 activeInterfaceProtocolKey];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 objectForKeyedSubscript:v15];
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setProtocolConfiguration:v16];

    v7[42] = 1;
  }

  else
  {
    [v6 VPN];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 || ([v6 appVPN], (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7[41] = [v19 isOnDemandEnabled];
      [v19 protocol];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setProtocolConfiguration:v20];

      [v6 appVPN];
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        [v6 appVPN];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 appRules];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 setAppRules:v23];
      }

      [v19 protocol];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 type];
    }
  }

  [v7 protocolConfiguration];
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    ne_log_obj();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      uint64_t v18 = "%@: configuration has no VPN configuration";
      goto LABEL_19;
    }

- (void)handleIPCDetached
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 88LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v5 = Property;
  -[NEIPC stop](v5);

  if (v2)
  {
    objc_setProperty_atomic(v2, v6, 0LL, 88LL);
    if (objc_getProperty(v2, v7, 96LL, 1))
    {
      v9 = (dispatch_source_s *)objc_getProperty(v2, v8, 96LL, 1);
      dispatch_source_cancel(v9);
      objc_setProperty_atomic(v2, v10, 0LL, 96LL);
    }
  }

  ne_log_obj();
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v2;
    _os_log_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEFAULT, "%@: IPC detached", (uint8_t *)&v14, 0xCu);
  }
  v13 = -[NEExtensionProviderContext hostContext](v2, v12);
  [v13 handleIPCDetached];

  objc_sync_exit(v2);
}

- (void)establishIPCWithCompletionHandler:(id)a3
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v5 = (void (**)(id, void))a3;
  if (self && objc_getProperty(self, v4, 88LL, 1))
  {
    id Property = objc_getProperty(self, v6, 88LL, 1);
    if (Property
      && (id v9 = Property,
          objc_sync_enter(v9),
          id v11 = objc_getProperty(v9, v10, 16LL, 1),
          objc_sync_exit(v9),
          v9,
          v11))
    {
      ne_log_obj();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(handler) = 138412290;
        *(void *)((char *)&handler + 4) = self;
        _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "%@: IPC is already established",  (uint8_t *)&handler,  0xCu);
      }

      v5[2](v5, 0LL);
    }

    else
    {
      id v13 = objc_getProperty(self, v8, 88LL, 1);
      -[NEIPC stop](v13);
      objc_setProperty_atomic(self, v14, 0LL, 88LL);
    }
  }

  v15 = objc_alloc_init(&OBJC_CLASS___NEIPC);
  objc_initWeak(&location, self);
  id v16 = MEMORY[0x1895F8AE0];
  uint64_t v17 = MEMORY[0x1895F87A8];
  uint64_t v36 = MEMORY[0x1895F87A8];
  uint64_t v37 = 3221225472LL;
  v38 = __70__NEExtensionTunnelProviderContext_establishIPCWithCompletionHandler___block_invoke;
  v39 = &unk_18A08FB78;
  objc_copyWeak(&v40, &location);
  id v18 = MEMORY[0x1895F8AE0];
  v19 = &v36;
  if (v15)
  {
    v20 = v15;
    objc_sync_enter(v20);
    objc_setProperty_atomic_copy(v20, v21, v19, 8LL);
    v22 = (void *)MEMORY[0x1895F8AE0];
    xpc_connection_t v23 = xpc_connection_create(0LL, MEMORY[0x1895F8AE0]);
    objc_setProperty_atomic(v20, v24, v23, 24LL);

    objc_super v26 = (_xpc_connection_s *)objc_getProperty(v20, v25, 24LL, 1);
    *(void *)&__int128 handler = v17;
    *((void *)&handler + 1) = 3221225472LL;
    v43 = __51__NEIPC_startInListenModeWithQueue_messageHandler___block_invoke;
    v44 = &unk_18A08DC38;
    v45 = v20;
    id v27 = v22;
    id v46 = v22;
    xpc_connection_set_event_handler(v26, &handler);

    __int16 v29 = (_xpc_connection_s *)objc_getProperty(v20, v28, 24LL, 1);
    xpc_connection_resume(v29);

    uint64_t v31 = (_xpc_connection_s *)objc_getProperty(v20, v30, 24LL, 1);
    xpc_endpoint_t v32 = xpc_endpoint_create(v31);

    objc_sync_exit(v20);
  }

  else
  {
    xpc_endpoint_t v32 = 0LL;
  }

  if (!v32)
  {
    id v34 = 0LL;
    if (!self) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  id v34 = objc_alloc_init(MEMORY[0x189607B58]);
  objc_msgSend(v34, "_setEndpoint:", v32, v36, v37, v38, v39);
  if (self) {
LABEL_15:
  }
    objc_setProperty_atomic(self, v33, v15, 88LL);
LABEL_16:
  ne_log_obj();
  v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    LODWORD(handler) = 138412290;
    *(void *)((char *)&handler + 4) = self;
    _os_log_impl(&dword_1876B1000, v35, OS_LOG_TYPE_INFO, "%@: created IPC listener", (uint8_t *)&handler, 0xCu);
  }

  ((void (**)(id, id))v5)[2](v5, v34);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  -[NEExtensionTunnelProviderContext handleIPCDetached](self, "handleIPCDetached");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEExtensionTunnelProviderContext;
  -[NEExtensionProviderContext cancelWithError:](&v5, sel_cancelWithError_, v4);
}

- (void).cxx_destruct
{
}

void __70__NEExtensionTunnelProviderContext_establishIPCWithCompletionHandler___block_invoke( uint64_t a1,  int a2,  uint64_t a3,  void *a4,  void *a5)
{
  id v20 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SEL v10 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      [WeakRetained handleIPCDetached];
    }

    else if (v20)
    {
      [WeakRetained _principalObject];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = v10;
      objc_sync_enter(v12);
      if (objc_getProperty(v12, v13, 96LL, 1))
      {
        id Property = (dispatch_source_s *)objc_getProperty(v12, v14, 96LL, 1);
        dispatch_source_cancel(Property);
      }

      id v16 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
      id v17 = MEMORY[0x1895F8AE0];
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __53__NEExtensionTunnelProviderContext_resetIPCIdleTimer__block_invoke;
      v21[3] = &unk_18A090390;
      v21[4] = v12;
      NECreateTimerSource(v16, 60LL, v21);
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(v12, v19, v18, 96LL);

      objc_sync_exit(v12);
      [v11 handleAppMessage:v20 completionHandler:v8];
    }
  }
}

void __53__NEExtensionTunnelProviderContext_resetIPCIdleTimer__block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) handleIPCDetached];
  objc_sync_exit(obj);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2859 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2859, &__block_literal_global_2860);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2861;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2856 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2856, &__block_literal_global_62);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_2857;
}

void __67__NEExtensionTunnelProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8C18];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_2857;
  _extensionAuxiliaryHostProtocol_protocol_2857 = v0;
}

void __69__NEExtensionTunnelProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8B58];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2861;
  _extensionAuxiliaryVendorProtocol_protocol_2861 = v0;
}

@end