@interface NEExtensionAppProxyProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (id)extensionPoint;
- (void)cancelWithError:(id)a3;
- (void)openFlowDivertControlSocketWithCompletionHandler:(id)a3;
- (void)setDelegateInterface:(unsigned int)a3;
- (void)setInitialFlowDivertControlSocket:(id)a3;
- (void)startWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3;
@end

@implementation NEExtensionAppProxyProviderContext

- (void)setInitialFlowDivertControlSocket:(id)a3
{
  v22[1] = *(id *)MEMORY[0x1895F89C0];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 48LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  [v7 appVPN];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v16 = v5;
  if (self)
  {
    objc_initWeak(&location, self);
    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v16;
      _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_INFO,  "%@: Setting initial flow divert control socket to %p",  buf,  0x16u);
    }

    dup([v16 fileDescriptor]);
    dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v11 = dispatch_queue_create("NEFlow queue", v10);
    objc_setProperty_atomic(self, v12, v11, 112LL);

    id v14 = objc_getProperty(self, v13, 112LL, 1);
    self->_director = (_NEFlowDirector *)NEFlowDirectorCreate();

    if (self->_director)
    {
      if (self->_delegateInterfaceIndex) {
        NEFlowDirectorSetDelegateInterface();
      }
      v15 = (void *)MEMORY[0x1895F87A8];
      *(void *)buf = MEMORY[0x1895F87A8];
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = __88__NEExtensionAppProxyProviderContext_setInitialFlowDivertControlSocket_extraValidation___block_invoke;
      v21 = &unk_18A08FAC8;
      objc_copyWeak(v22, &location);
      NEFlowDirectorSetOpenControlSocketCallback();
      if (v8)
      {
        v17[1] = v15;
        v17[2] = (id)3221225472LL;
        v17[3] = __88__NEExtensionAppProxyProviderContext_setInitialFlowDivertControlSocket_extraValidation___block_invoke_2;
        v17[4] = &unk_18A08C5C0;
        objc_copyWeak(&v18, &location);
        NEFlowDirectorSetMatchRulesCallback();
        objc_destroyWeak(&v18);
      }

      objc_copyWeak(v17, &location);
      NEFlowDirectorSetNewFlowCallback();
      objc_destroyWeak(v17);
      objc_destroyWeak(v22);
    }

    objc_destroyWeak(&location);
  }
}

- (void)setDelegateInterface:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 1024;
    unsigned int v9 = a3;
    _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_INFO,  "%@: Setting flow divert delegate interface to %u",  (uint8_t *)&v6,  0x12u);
  }

  if (self)
  {
    self->_delegateInterfaceIndex = a3;
    if (self->_director) {
      NEFlowDirectorSetDelegateInterface();
    }
  }

- (void)openFlowDivertControlSocketWithCompletionHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NEExtensionProviderContext hostContext](self, v5);
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    unsigned int v9 = self;
    _os_log_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_INFO,  "%@: Opening new flow divert control socket",  (uint8_t *)&v8,  0xCu);
  }

  [v6 openFlowDivertControlSocketWithCompletionHandler:v4];
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NEExtensionAppProxyProviderContext;
  -[NEExtensionProviderContext startWithOptions:completionHandler:]( &v13,  sel_startWithOptions_completionHandler_,  v6,  v7);

  if (self && self->_director)
  {
    ne_log_obj();
    unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v15 = self;
      __int16 v16 = 2048;
      id v17 = v6;
      _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Calling startProxyWithOptions with options %p",  buf,  0x16u);
    }

    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __73__NEExtensionAppProxyProviderContext_startWithOptions_completionHandler___block_invoke;
    v12[3] = &unk_18A0907E8;
    v12[4] = self;
    [v8 startProxyWithOptions:v6 completionHandler:v12];
  }

  else
  {
    ne_log_obj();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "%@: Cannot start the proxy because the flow director is nil",  buf,  0xCu);
    }

    dispatch_queue_t v11 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"NEAppProxyFlowErrorDomain" code:8 userInfo:0];
    -[NEExtensionProviderContext startedWithError:](self, "startedWithError:", v11);
  }
}

- (void)stopWithReason:(int)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    dispatch_queue_t v11 = self;
    __int16 v12 = 2080;
    uint64_t v13 = ne_session_stop_reason_to_string();
    _os_log_impl(&dword_1876B1000, v6, OS_LOG_TYPE_DEFAULT, "%@: Calling stopProxyWithReason because: %s", buf, 0x16u);
  }

  else {
    uint64_t v7 = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __53__NEExtensionAppProxyProviderContext_stopWithReason___block_invoke;
  v8[3] = &unk_18A08D3E8;
  int v9 = a3;
  v8[4] = self;
  [v5 stopProxyWithReason:v7 completionHandler:v8];
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self && self->_director)
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    uint64_t v8 = 3221225472LL;
    int v9 = __54__NEExtensionAppProxyProviderContext_cancelWithError___block_invoke;
    uint64_t v10 = &unk_18A08F098;
    dispatch_queue_t v11 = self;
    id v12 = v4;
    NEFlowDirectorDestroy();
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NEExtensionAppProxyProviderContext;
    -[NEExtensionTunnelProviderContext cancelWithError:](&v6, sel_cancelWithError_, v4);
  }
}

- (id)extensionPoint
{
  return @"com.apple.networkextension.app-proxy";
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

id __54__NEExtensionAppProxyProviderContext_cancelWithError___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v1[15] = 0LL;
    v1 = *(void **)(a1 + 32);
  }

  uint64_t v2 = *(void *)(a1 + 40);
  v4.receiver = v1;
  v4.super_class = (Class)&OBJC_CLASS___NEExtensionAppProxyProviderContext;
  return objc_msgSendSuper2(&v4, sel_cancelWithError_, v2);
}

id __53__NEExtensionAppProxyProviderContext_stopWithReason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_CLASS___NEExtensionAppProxyProviderContext;
  return objc_msgSendSuper2(&v3, sel_stopWithReason_, v1);
}

void __73__NEExtensionAppProxyProviderContext_startWithOptions_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = a2;
    [v3 handleIPCDetached];
  }

  else
  {
    NEFlowDirectorStart();
  }

  [*(id *)(a1 + 32) startedWithError:a2];
}

void __88__NEExtensionAppProxyProviderContext_setInitialFlowDivertControlSocket_extraValidation___block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3[1] = 3221225472LL;
    v3[2] = __65__NEExtensionAppProxyProviderContext_flowDivertOpenControlSocket__block_invoke;
    v3[3] = &unk_18A08F290;
    v3[4] = WeakRetained;
    id v2 = WeakRetained;
    v3[0] = MEMORY[0x1895F87A8];
    [WeakRetained openFlowDivertControlSocketWithCompletionHandler:v3];
    id WeakRetained = v2;
  }
}

void __88__NEExtensionAppProxyProviderContext_setInitialFlowDivertControlSocket_extraValidation___block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  self = objc_loadWeakRetained((id *)(a1 + 32));
  if (self)
  {
    v28 = a3;
    id v6 = a4;
    int v7 = [v6 hasPrefix:@"com.apple.webapp"];
    ne_log_obj();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v35 = self;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_INFO, "%@: Verifying app with signing identifier %@", buf, 0x16u);
    }

    id v10 = objc_getProperty(self, v9, 48LL, 1);
    [v10 appVPN];
    dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 appRules];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:buf count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      int v17 = v7 ^ 1;
LABEL_6:
      uint64_t v18 = 0LL;
      while (1)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v30 + 1) + 8 * v18);
        [v19 matchSigningIdentifier];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        int v21 = [v20 isEqualToString:v6];
        if (((v21 | v17) & 1) != 0)
        {
          char v22 = v21;

          if ((v22 & 1) != 0) {
            goto LABEL_16;
          }
        }

        else
        {
          [v19 matchSigningIdentifier];
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          char v24 = [v23 isEqualToString:@"com.apple.webapp"];

          if ((v24 & 1) != 0)
          {
LABEL_16:
            id v26 = v19;
            id v25 = v28;

            if (!v26) {
              goto LABEL_18;
            }
            [v26 matchSigningIdentifier];
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            NEFlowDirectorHandleMatchRulesResult();

            goto LABEL_19;
          }
        }

        if (v15 == ++v18)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:buf count:16];
          if (v15) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    id v25 = 0LL;
LABEL_18:
    NEFlowDirectorHandleMatchRulesResult();
    id v26 = 0LL;
LABEL_19:
  }
}

void __88__NEExtensionAppProxyProviderContext_setInitialFlowDivertControlSocket_extraValidation___block_invoke_3( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  self = objc_loadWeakRetained(v4);
  id v6 = (void (**)(id, uint64_t))v5;
  if (self)
  {
    uint64_t FlowType = NEFlowGetFlowType();
    [self _principalObject];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (FlowType == 2)
    {
      uint64_t v16 = objc_alloc(&OBJC_CLASS___NEAppProxyUDPFlow);
      dispatch_queue_t v11 = -[NEAppProxyUDPFlow initWithNEFlow:queue:]( v16,  "initWithNEFlow:queue:",  a2,  objc_getProperty(self, v17, 112LL, 1));
      host_with_numeric_port = (NEAppProxyUDPFlow *)+[NEAppProxyFlow copyRemoteEndpointFromFlow:]();
      if (!host_with_numeric_port) {
        host_with_numeric_port = (NEAppProxyUDPFlow *)nw_endpoint_create_host_with_numeric_port();
      }
      ne_log_obj();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = (uint64_t)self;
        __int16 v27 = 2112;
        v28 = (const char *)v11;
        __int16 v29 = 2112;
        __int128 v30 = host_with_numeric_port;
        _os_log_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_DEFAULT,  "%@: Calling handleNewUDPFlow with %@, remoteEndpoint = %@",  buf,  0x20u);
      }

      uint64_t v20 = [v8 handleNewUDPFlow:v11 initialRemoteFlowEndpoint:host_with_numeric_port];
      ne_log_obj();
      int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        char v22 = "rejected";
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = (uint64_t)self;
        if ((_DWORD)v20) {
          char v22 = "accepted";
        }
        __int16 v27 = 2080;
        v28 = v22;
        __int16 v29 = 2112;
        __int128 v30 = v11;
        _os_log_impl(&dword_1876B1000, v21, OS_LOG_TYPE_DEFAULT, "%@: provider %s new flow %@", buf, 0x20u);
      }

      v6[2](v6, v20);
    }

    else
    {
      if (FlowType != 1)
      {
        ne_log_obj();
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v26 = FlowType;
          _os_log_fault_impl(&dword_1876B1000, v23, OS_LOG_TYPE_FAULT, "Unknown flow type %ld", buf, 0xCu);
        }

        v6[2](v6, 0LL);
        goto LABEL_24;
      }

      SEL v9 = objc_alloc(&OBJC_CLASS___NEAppProxyTCPFlow);
      dispatch_queue_t v11 = -[NEAppProxyTCPFlow initWithNEFlow:queue:]( v9,  "initWithNEFlow:queue:",  a2,  objc_getProperty(self, v10, 112LL, 1));
      ne_log_obj();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = (uint64_t)self;
        __int16 v27 = 2112;
        v28 = (const char *)v11;
        _os_log_impl(&dword_1876B1000, v12, OS_LOG_TYPE_DEFAULT, "%@: Calling handleNewFlow with %@", buf, 0x16u);
      }

      uint64_t v13 = [v8 handleNewFlow:v11];
      ne_log_obj();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = "rejected";
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = (uint64_t)self;
        if ((_DWORD)v13) {
          uint64_t v15 = "accepted";
        }
        __int16 v27 = 2080;
        v28 = v15;
        __int16 v29 = 2112;
        __int128 v30 = v11;
        _os_log_impl(&dword_1876B1000, v14, OS_LOG_TYPE_DEFAULT, "%@: provider %s new flow %@", buf, 0x20u);
      }

      v6[2](v6, v13);
    }

LABEL_24:
  }
}

void __65__NEExtensionAppProxyProviderContext_flowDivertOpenControlSocket__block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    int v5 = dup([v3 fileDescriptor]);
  }
  else {
    int v5 = -1;
  }
  ne_log_obj();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_INFO,  "%@: Received new flow divert control socket %d",  (uint8_t *)&v9,  0x12u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8 && *(void *)(v8 + 120)) {
    NEFlowDirectorHandleNewControlSocket();
  }
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit, &__block_literal_global_1700);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit, &__block_literal_global_68);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol;
}

void __69__NEExtensionAppProxyProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8D10];
  uint64_t v1 = (void *)_extensionAuxiliaryHostProtocol_protocol;
  _extensionAuxiliaryHostProtocol_protocol = v0;
}

void __71__NEExtensionAppProxyProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8C78];
  uint64_t v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol;
  _extensionAuxiliaryVendorProtocol_protocol = v0;
}

uint64_t __75__NEExtensionAppProxyProviderContext_fetchFlowStatesWithCompletionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end