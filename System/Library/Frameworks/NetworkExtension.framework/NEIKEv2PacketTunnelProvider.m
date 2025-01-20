@interface NEIKEv2PacketTunnelProvider
- (BOOL)NEIKEv2ProviderAuthenticate:(_BYTE *)a1;
- (BOOL)tryAlternateServerAddresses;
- (NEIKEv2PacketTunnelProvider)init;
- (_BYTE)stopObserving;
- (id)description;
- (uint64_t)invokeStartTunnelCompletionHandler:(uint64_t)a1;
- (uint64_t)tunnelBringup;
- (void)configureProxyPathIfNeeded;
- (void)dealloc;
- (void)handleCompanionProxyDatapathFailure:(void *)a1;
- (void)handleInterfaceChange:(uint64_t)a1;
- (void)handleInterfaceDown;
- (void)invalidateCompanionProxyDatapath;
- (void)invokeCancelTunnel:(_BYTE *)a1;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)observerHelperHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reset:(uint64_t)a1;
- (void)resolveServerAddressIfNeeded:(void *)a1;
- (void)setInterfaceAvailability;
- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4;
- (void)startIKEv2TunnelWithOptions:(uint64_t)a1;
- (void)startRekeyTimer:(void *)a1;
- (void)startTunnelWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopIKEv2TunnelWithReason:(void *)a3 completionHandler:;
- (void)stopTunnelWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)wake;
- (void)watchIKESocketChange;
@end

@implementation NEIKEv2PacketTunnelProvider

- (id)description
{
  id v3 = objc_alloc(NSString);
  if (self)
  {
    int64_t tunnelKind = self->_tunnelKind;
    v5 = &stru_18A0915E8;
    if (tunnelKind == 2) {
      v5 = @"Fallback Tunnel";
    }
    if (tunnelKind == 1) {
      v6 = @"Primary Tunnel";
    }
    else {
      v6 = (__CFString *)v5;
    }
    v7 = v6;
    unint64_t ifIndex = self->_ifIndex;
  }

  else
  {
    v7 = 0LL;
    unint64_t ifIndex = 0LL;
  }

  v9 = (void *)[v3 initWithFormat:@"<NEIKEv2Provider: %@ (ifIndex %lu)>: ", v7, ifIndex];

  return v9;
}

- (NEIKEv2PacketTunnelProvider)init
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v2 = -[NEPacketTunnelProvider initWithVirtualInterfaceType:](self, "initWithVirtualInterfaceType:", 2LL);
  ne_log_obj();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(v7.__sigaction_u.__sa_handler) = 138412290;
    *(void (__cdecl **)(int, __siginfo *, void *))((char *)&v7.__sigaction_u.__sa_sigaction + 4) = (void (__cdecl *)(int, __siginfo *, void *))v2;
    _os_log_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_INFO,  "%@: Init with IPSec virtual interface type",  (uint8_t *)&v7,  0xCu);
  }

  if (NEIKEv2PacketTunnelProviderCopyQueue_onceToken != -1) {
    dispatch_once(&NEIKEv2PacketTunnelProviderCopyQueue_onceToken, &__block_literal_global_270);
  }
  objc_storeStrong((id *)&v2->_queue, (id)NEIKEv2PacketTunnelProviderCopyQueue_queue);
  -[NEIKEv2PacketTunnelProvider addObserver:forKeyPath:options:context:]( v2,  "addObserver:forKeyPath:options:context:",  v2,  @"protocolConfiguration",  5LL,  0LL);
  -[NEIKEv2PacketTunnelProvider addObserver:forKeyPath:options:context:]( v2,  "addObserver:forKeyPath:options:context:",  v2,  @"defaultPath",  5LL,  0LL);
  *(&v2->_isObserving + 1) = 1;
  v4 = -[NEProvider defaultPath](v2, "defaultPath");
  objc_setProperty_atomic(v2, v5, v4, 208LL);

  v2->_randomLocalPortFallbackRetryCount = 0LL;
  v7.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(void *)&v7.sa_mask = 0LL;
  sigaction(13, &v7, 0LL);
  return v2;
}

- (void)dealloc
{
  server = self->_server;
  self->_server = 0LL;

  queue = self->_queue;
  self->_queue = 0LL;

  id startTunnelCompletionHandler = self->_startTunnelCompletionHandler;
  self->_id startTunnelCompletionHandler = 0LL;

  id stopTunnelCompletionHandler = self->_stopTunnelCompletionHandler;
  self->_id stopTunnelCompletionHandler = 0LL;

  -[NEPacketTunnelProvider packetFlow](self, "packetFlow");
  sigaction v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPacketTunnelFlow closeVirtualInterface](v7);

  exit(0);
}

- (void)startTunnelWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  ne_log_obj();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEFAULT, "%@: startTunnelWithOptions Invoked", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __72__NEIKEv2PacketTunnelProvider_startTunnelWithOptions_completionHandler___block_invoke;
  block[3] = &unk_18A08FB50;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)stopTunnelWithReason:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  ne_log_obj();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = self;
    _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_DEFAULT, "%@: stopTunnelWithReason Invoked", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke;
  block[3] = &unk_18A08FCA0;
  id v11 = v6;
  int64_t v12 = a3;
  block[4] = self;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)wake
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = self;
    _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "%@: wake Invoked", buf, 0xCu);
  }

  queue = (dispatch_queue_s *)self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__NEIKEv2PacketTunnelProvider_wake__block_invoke;
  block[3] = &unk_18A090390;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)observerHelperHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEIKEv2PacketTunnelProvider;
  -[NEProvider observerHelperHandler:ofObject:change:context:]( &v15,  sel_observerHelperHandler_ofObject_change_context_,  a3,  v10,  a5,  a6);
  if (self) {
    id Property = objc_getProperty(self, v11, 136LL, 1);
  }
  else {
    id Property = 0LL;
  }
  if (Property == v10)
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __77__NEIKEv2PacketTunnelProvider_observerHelperHandler_ofObject_change_context___block_invoke;
    block[3] = &unk_18A090390;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = (NEIKEv2PacketTunnelProvider *)a4;
  id v12 = a5;
  if (v10 == self)
  {
    if ([v9 isEqualToString:@"protocolConfiguration"])
    {
      queue = (dispatch_queue_s *)v10->_queue;
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v20[3] = &unk_18A090390;
      v20[4] = v10;
      v16 = v20;
      goto LABEL_12;
    }

    if ([v9 isEqualToString:@"defaultPath"])
    {
      queue = (dispatch_queue_s *)v10->_queue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      block[3] = &unk_18A090390;
      block[4] = v10;
      v16 = block;
      goto LABEL_12;
    }
  }

  if (self) {
    id Property = objc_getProperty(self, v11, 272LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v14 = (NEIKEv2PacketTunnelProvider *)Property;
  if (v14 == v10)
  {
    int v17 = [v9 isEqualToString:@"path"];

    if (!v17) {
      goto LABEL_13;
    }
    queue = (dispatch_queue_s *)self->_queue;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
    v18[3] = &unk_18A090390;
    v18[4] = self;
    v16 = v18;
LABEL_12:
    dispatch_async(queue, v16);
    goto LABEL_13;
  }

LABEL_13:
}

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  ne_log_obj();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      id v9 = "(Set)";
    }
    else {
      id v9 = "(Clear)";
    }
    -[NEProvider defaultPath](self, "defaultPath");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 scopedInterface];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEProvider defaultPath](self, "defaultPath");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v12;
    if (v11) {
      [v12 scopedInterface];
    }
    else {
      [v12 interface];
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 interfaceName];
    objc_super v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v25 = v15;
    _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Performing setTunnelNetworkSettings %s (%@)",  buf,  0x20u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v25 = __Block_byref_object_copy__11387;
  v26 = __Block_byref_object_dispose__11388;
  v16 = self;
  v27 = v16;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __74__NEIKEv2PacketTunnelProvider_setTunnelNetworkSettings_completionHandler___block_invoke;
  v20[3] = &unk_18A08D598;
  v23 = buf;
  id v17 = v6;
  id v21 = v17;
  id v18 = v7;
  id v22 = v18;
  v19.receiver = v16;
  v19.super_class = (Class)&OBJC_CLASS___NEIKEv2PacketTunnelProvider;
  -[NEPacketTunnelProvider setTunnelNetworkSettings:completionHandler:]( &v19,  sel_setTunnelNetworkSettings_completionHandler_,  v17,  v20);

  _Block_object_dispose(buf, 8);
}

- (void).cxx_destruct
{
}

void __74__NEIKEv2PacketTunnelProvider_setTunnelNetworkSettings_completionHandler___block_invoke( void *a1,  void *a2)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  SEL v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    uint64_t v7 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
    if (a1[4]) {
      uint64_t v8 = "(Set)";
    }
    else {
      uint64_t v8 = "(Clear)";
    }
    if (v7) {
      id Property = objc_getProperty(*(id *)(*(void *)(a1[6] + 8LL) + 40LL), v6, 208LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property scopedInterface];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = *(id *)(*(void *)(a1[6] + 8LL) + 40LL);
    if (v11)
    {
      if (v12) {
        id v12 = objc_getProperty(v12, v10, 208LL, 1);
      }
      id v13 = v12;
      [v13 scopedInterface];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (v12) {
        id v12 = objc_getProperty(v12, v10, 208LL, 1);
      }
      id v13 = v12;
      [v13 interface];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    id v22 = v14;
    [v14 interfaceName];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    int v26 = 138413058;
    uint64_t v27 = v7;
    __int16 v28 = 2080;
    v29 = v8;
    __int16 v30 = 2112;
    v31 = v23;
    __int16 v32 = 2112;
    id v33 = v3;
    _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "%@: setTunnelNetworkSettings %s failed (%@): %@",  (uint8_t *)&v26,  0x2Au);
  }

  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    uint64_t v16 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
    if (a1[4]) {
      id v17 = "(Set)";
    }
    else {
      id v17 = "(Clear)";
    }
    if (v16) {
      id v18 = objc_getProperty(*(id *)(*(void *)(a1[6] + 8LL) + 40LL), v15, 208LL, 1);
    }
    else {
      id v18 = 0LL;
    }
    [v18 scopedInterface];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = *(id *)(*(void *)(a1[6] + 8LL) + 40LL);
    if (v11)
    {
      if (v20) {
        id v20 = objc_getProperty(v20, v19, 208LL, 1);
      }
      id v13 = v20;
      [v13 scopedInterface];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (v20) {
        id v20 = objc_getProperty(v20, v19, 208LL, 1);
      }
      id v13 = v20;
      [v13 interface];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
    }

    id v22 = v21;
    [v21 interfaceName];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    int v26 = 138412802;
    uint64_t v27 = v16;
    __int16 v28 = 2080;
    v29 = v17;
    __int16 v30 = 2112;
    v31 = v23;
    _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEFAULT,  "%@: setTunnelNetworkSettings %s completed (%@)",  (uint8_t *)&v26,  0x20u);
  }

LABEL_27:
  if (a1[5])
  {
    ne_log_obj();
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(*(void *)(a1[6] + 8LL) + 40LL);
      int v26 = 138412290;
      uint64_t v27 = v25;
      _os_log_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_DEFAULT,  "%@: setTunnelNetworkSettings calling completionHandler",  (uint8_t *)&v26,  0xCu);
    }

    (*(void (**)(void))(a1[5] + 16LL))();
  }
}

void __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke( uint64_t a1)
{
  v35[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && (*(_BYTE *)(v1 + 77) & 1) == 0)
  {
    uint64_t v2 = *(void *)(v1 + 248);
    char v3 = *(_BYTE *)(v1 + 73);
    ne_log_obj();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v1;
      _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_INFO, "%@: handleConfigChange", (uint8_t *)&buf, 0xCu);
    }

    if (objc_getProperty((id)v1, v5, 240LL, 1))
    {
      if ((*(_BYTE *)(v1 + 78) & 1) != 0)
      {
        *(_BYTE *)(v1 + 77) = 1;
        objc_initWeak((id *)&v28, (id)v1);
        ne_log_obj();
        uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v1;
          _os_log_impl( &dword_1876B1000,  v27,  OS_LOG_TYPE_DEFAULT,  "%@: Stopping tunnel due to config change",  (uint8_t *)&buf,  0xCu);
        }

        *(void *)&__int128 buf = MEMORY[0x1895F87A8];
        *((void *)&buf + 1) = 3221225472LL;
        id v33 = __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke;
        uint64_t v34 = &unk_18A08FAC8;
        objc_copyWeak(v35, (id *)&v28);
        -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:]((_BYTE *)v1, 0LL, &buf);
        objc_destroyWeak(v35);
        objc_destroyWeak((id *)&v28);
      }

      else
      {
        ne_log_obj();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v1;
          _os_log_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: Stopping tunnel due to Config Change",  (uint8_t *)&buf,  0xCu);
        }

        -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:]((_BYTE *)v1, 0LL, 0LL);
        uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NEIKEv2Server);
        objc_setProperty_atomic((id)v1, v8, v7, 128LL);

        [(id)v1 protocolConfiguration];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 serverAddress];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        id Property = objc_getProperty((id)v1, v11, 128LL, 1);
        if (Property) {
          objc_setProperty_atomic(Property, v13, v10, 16LL);
        }

        *(void *)(v1 + 248) = v2;
        *(_BYTE *)(v1 + 73) = v3;
        id v14 = objc_alloc(&OBJC_CLASS___NEIKEv2MOBIKE);
        id v16 = objc_getProperty((id)v1, v15, 264LL, 1);
        id v17 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v14->super.isa, v16, (void *)v1);
        objc_setProperty_atomic((id)v1, v18, v17, 168LL);

        id v20 = objc_getProperty((id)v1, v19, 128LL, 1);
        if (v20) {
          objc_setProperty_atomic(v20, v21, 0LL, 24LL);
        }
        *(void *)&__int128 buf = MEMORY[0x1895F87A8];
        *((void *)&buf + 1) = 3221225472LL;
        id v33 = __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke_142;
        uint64_t v34 = &unk_18A08D468;
        v35[0] = (id)v1;
        -[NEIKEv2PacketTunnelProvider resolveServerAddressIfNeeded:]((void *)v1, &buf);
        [(id)v1 setReasserting:(~*(_DWORD *)(v1 + 84) & 0xF) == 0];
        *(_DWORD *)(v1 + 84) &= 0xFFFFFFF0;
        id v22 = *(void **)(v1 + 88);
        *(void *)(v1 + 88) = 0LL;

        v23 = *(void **)(v1 + 96);
        *(void *)(v1 + 96) = 0LL;

        v24 = *(void **)(v1 + 104);
        *(void *)(v1 + 104) = 0LL;

        ne_log_obj();
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138412546;
          uint64_t v29 = v1;
          __int16 v30 = 2080;
          v31 = "-[NEIKEv2PacketTunnelProvider handleConfigChange]";
          _os_log_impl(&dword_1876B1000, v25, OS_LOG_TYPE_DEFAULT, "%@: %s: bringing up tunnel", (uint8_t *)&v28, 0x16u);
        }
      }
    }

    else
    {
      ne_log_obj();
      int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v1;
        _os_log_debug_impl( &dword_1876B1000,  v26,  OS_LOG_TYPE_DEBUG,  "%@: No tunnel, ignore config change",  (uint8_t *)&buf,  0xCu);
      }
    }
  }

void __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2( uint64_t a1)
{
  uint64_t v113 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1 || (*(_BYTE *)(v1 + 77) & 1) != 0) {
    return;
  }
  ne_log_obj();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    [(id)v1 defaultPath];
    char v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 scopedInterface];
    [(id)v1 defaultPath];
    SEL v5 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v5;
    if (v4) {
      [v5 scopedInterface];
    }
    else {
      [v5 interface];
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 interfaceName];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [(id)v1 defaultPath];
    SEL v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 scopedInterface];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [(id)v1 defaultPath];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    SEL v11 = v10;
    v102 = (void *)v4;
    v104 = v3;
    if (v9) {
      [v10 scopedInterface];
    }
    else {
      [v10 interface];
    }
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 interfaceIndex];
    [(id)v1 defaultPath];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138413058;
    uint64_t v107 = v1;
    __int16 v108 = 2112;
    *(void *)v109 = v7;
    *(_WORD *)&v109[8] = 2048;
    uint64_t v110 = v13;
    __int16 v111 = 1024;
    LODWORD(v112) = [v14 status] == 1;
    _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEFAULT,  "%@: New scoped interface %@ (%lu) (SATISFIED: %d)",  buf,  0x26u);
  }

  [(id)v1 defaultPath];
  SEL v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 scopedInterface];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)v1 defaultPath];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  SEL v18 = v17;
  if (v16) {
    [v17 scopedInterface];
  }
  else {
    [v17 interface];
  }
  SEL v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v19 interfaceIndex];
  id Property = objc_getProperty((id)v1, v21, 240LL, 1);
  if (v20 == -[NEIKEv2Session interfaceIndex]((uint64_t)Property))
  {
    id v24 = objc_getProperty((id)v1, v23, 240LL, 1);
    int v25 = -[NEIKEv2Session interfaceIndex]((uint64_t)v24);

    if (v25)
    {
      ne_log_obj();
      int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = *(void *)(v1 + 248);
        [(id)v1 defaultPath];
        int v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 scopedInterface];
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)v1 defaultPath];
        __int16 v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v29) {
          [v30 scopedInterface];
        }
        else {
          [v30 interface];
        }
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v74 = [v73 interfaceIndex];
        *(_DWORD *)__int128 buf = 138412802;
        uint64_t v107 = v1;
        __int16 v108 = 2048;
        *(void *)v109 = v27;
        *(_WORD *)&v109[8] = 2048;
        uint64_t v110 = v74;
        _os_log_impl( &dword_1876B1000,  v26,  OS_LOG_TYPE_INFO,  "%@: Ignoring interface change to: %lu --> %lu\n",  buf,  0x20u);
      }

void __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_3( uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(_BYTE **)(a1 + 32);
  if (v1 && (v1[77] & 1) == 0)
  {
    ne_log_obj();
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(objc_getProperty(v1, v3, 272, 1), "path");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = [v4 scopedInterface];
      id v7 = objc_getProperty(v1, v6, 272LL, 1);
      [v7 path];
      SEL v8 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v32 = (void *)v5;
      SEL v33 = v4;
      __int16 v30 = v8;
      if (v5) {
        [v8 scopedInterface];
      }
      else {
        [v8 interface];
      }
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 interfaceName];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(objc_getProperty(v1, v11, 272, 1), "path");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 scopedInterface];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v15 = objc_getProperty(v1, v14, 272LL, 1);
      [v15 path];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = v16;
      v31 = v7;
      uint64_t v29 = v9;
      if (v13) {
        [v16 scopedInterface];
      }
      else {
        [v16 interface];
      }
      SEL v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 interfaceIndex];
      objc_msgSend(objc_getProperty(v1, v20, 272, 1), "path");
      SEL v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138413058;
      uint64_t v35 = v1;
      __int16 v36 = 2112;
      v37 = v10;
      __int16 v38 = 2048;
      uint64_t v39 = v19;
      __int16 v40 = 1024;
      BOOL v41 = [v21 status] == 1;
      _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEFAULT,  "%@: Scoped path changed %@ (%lu) (SATISFIED: %d)",  buf,  0x26u);
    }

    objc_msgSend(objc_getProperty(v1, v22, 272, 1), "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v23 status];

    if (v24 != 1)
    {
      ne_log_obj();
      int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v35 = v1;
        _os_log_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_INFO,  "%@: Scoped path went UNSATISFIED, flap tunnel",  buf,  0xCu);
      }

      if (objc_getProperty(v1, v26, 272LL, 1))
      {
        objc_msgSend(objc_getProperty(v1, v27, 272, 1), "removeObserver:forKeyPath:", v1, @"path");
        objc_setProperty_atomic(v1, v28, 0LL, 272LL);
      }

      -[NEIKEv2PacketTunnelProvider handleInterfaceChange:]((uint64_t)v1, (const char *)1);
    }
  }

- (void)handleInterfaceChange:(uint64_t)a1
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  int v2 = (int)a2;
  -[NEIKEv2PacketTunnelProvider configureProxyPathIfNeeded]((void *)a1, a2);
  id v5 = objc_getProperty((id)a1, v4, 240LL, 1);
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v2 == 0;
  }
  if (v7)
  {
  }

  else if ((*(_BYTE *)(a1 + 78) & 1) == 0)
  {
    ne_log_obj();
    SEL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 248);
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v46 = a1;
      __int16 v47 = 2048;
      uint64_t v48 = v9;
      _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Starting tunnel on scoped interface UP (%lu)",  buf,  0x16u);
    }

    if (*(void *)(a1 + 256) == 1LL)
    {
      uint64_t v10 = [(id)a1 protocolConfiguration];
      if (v10)
      {
        SEL v11 = (void *)v10;
        [(id)a1 protocolConfiguration];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 serverAddress];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          ne_log_obj();
          SEL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = *(void *)(a1 + 248);
            *(_DWORD *)__int128 buf = 138412546;
            uint64_t v46 = a1;
            __int16 v47 = 2048;
            uint64_t v48 = v15;
            _os_log_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_INFO,  "%@: Calling startIKEv2TunnelWithOptions on scoped interface UP (%lu)",  buf,  0x16u);
          }

          -[NEIKEv2PacketTunnelProvider reset:](a1, 1);
          id Property = objc_getProperty((id)a1, v16, 112LL, 1);
          -[NEIKEv2PacketTunnelProvider startIKEv2TunnelWithOptions:](a1, Property);
        }
      }
    }

    return;
  }

  if ((*(_BYTE *)(a1 + 79) & 1) != 0)
  {
    id v23 = objc_getProperty((id)a1, v6, 128LL, 1);
    id v25 = objc_getProperty((id)a1, v24, 208LL, 1);
    -[NEIKEv2Server getViableServerAddressForPath:](v23, v25);
    id v43 = (id)objc_claimAutoreleasedReturnValue();

    id v27 = objc_getProperty((id)a1, v26, 168LL, 1);
    if (v27) {
      objc_setProperty_atomic(v27, v28, 0LL, 16LL);
    }
    uint64_t v29 = objc_getProperty((id)a1, v28, 128LL, 1);
    if (v29 && (v29[8] & 1) != 0)
    {
      if ((*(_BYTE *)(a1 + 75) & 1) != 0)
      {
        id v33 = objc_getProperty((id)a1, v30, 128LL, 1);
        if (v33) {
          id v33 = objc_getProperty(v33, v34, 56LL, 1);
        }
        id v31 = v33;
        [v31 port];
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        id v37 = objc_getProperty((id)a1, v36, 168LL, 1);
        if (v37) {
          objc_setProperty_atomic(v37, v38, v35, 16LL);
        }
      }

      else
      {
        id v31 = v43;
        id v43 = 0LL;
      }
    }

    id v39 = objc_getProperty((id)a1, v30, 168LL, 1);
    __int16 v40 = *(void **)(a1 + 248);
    id v41 = v39;
    [(id)a1 defaultPath];
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEIKEv2MOBIKE initiateMOBIKE:pathStatus:serverAddress:earlyDisconnect:]( (uint64_t)v41,  v40,  [v42 status],  v43,  0);
  }

  else if (v2)
  {
    if ((*(_BYTE *)(a1 + 78) & 1) != 0) {
      goto LABEL_32;
    }
    if (*(void *)(a1 + 256) != 1LL) {
      goto LABEL_32;
    }
    uint64_t v18 = [(id)a1 protocolConfiguration];
    if (!v18) {
      goto LABEL_32;
    }
    uint64_t v19 = (void *)v18;
    [(id)a1 protocolConfiguration];
    SEL v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 serverAddress];
    SEL v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      ne_log_obj();
      SEL v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v46 = a1;
        _os_log_impl( &dword_1876B1000,  v22,  OS_LOG_TYPE_DEFAULT,  "%@: Stopping tunnel before reattempting on new path",  buf,  0xCu);
      }

      v44[0] = MEMORY[0x1895F87A8];
      v44[1] = 3221225472LL;
      v44[2] = __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke;
      v44[3] = &unk_18A090390;
      v44[4] = a1;
      -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:]((_BYTE *)a1, 0LL, v44);
    }

    else
    {
LABEL_32:
      ne_log_obj();
      __int16 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v46 = a1;
        _os_log_impl( &dword_1876B1000,  v32,  OS_LOG_TYPE_DEFAULT,  "%@: Disconnect tunnel: scoped interface changed / status not satisfied",  buf,  0xCu);
      }

      -[NEIKEv2PacketTunnelProvider handleInterfaceDown]((void *)a1);
    }
  }

- (void)configureProxyPathIfNeeded
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  objc_msgSend(objc_getProperty(a1, a2, 208, 1), "interface");
  char v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 subtype] != 5001)
  {

    goto LABEL_20;
  }

  objc_msgSend(objc_getProperty(a1, v4, 208, 1), "proxySettings");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_20:
    -[NEIKEv2PacketTunnelProvider invalidateCompanionProxyDatapath](a1, v6);
    id Property = objc_getProperty(a1, v23, 128LL, 1);
    -[NEIKEv2Server resetPathProxyState](Property, v25);
    return;
  }

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  self = a1;
  objc_msgSend(objc_getProperty(a1, v6, 208, 1), "proxySettings");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v34)
  {
    uint64_t v8 = *(void *)v43;
    uint64_t v9 = *MEMORY[0x18960C948];
    uint64_t v10 = *MEMORY[0x18960C950];
    id v37 = v7;
    uint64_t v33 = *(void *)v43;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v7);
        }
        uint64_t v35 = v11;
        id v12 = *(void **)(*((void *)&v42 + 1) + 8 * v11);
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v39;
          while (2)
          {
            for (uint64_t i = 0LL; i != v15; ++i)
            {
              if (*(void *)v39 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              [v18 objectForKeyedSubscript:v9];
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 objectForKeyedSubscript:v10];
              SEL v20 = (void *)objc_claimAutoreleasedReturnValue();
              [v18 objectForKeyedSubscript:@"kCFStreamPropertySOCKSVersion"];
              SEL v21 = (void *)objc_claimAutoreleasedReturnValue();
              if ([v21 isEqualToString:@"shoes"])
              {
                SEL v26 = objc_getProperty(self, v22, 128LL, 1);
                if (v26) {
                  v26[8] = 1;
                }
                id v27 = (void *)MEMORY[0x189608DF8];
                [v19 stringValue];
                SEL v28 = (void *)objc_claimAutoreleasedReturnValue();
                [v27 endpointWithHostname:v20 port:v28];
                uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
                id v31 = objc_getProperty(self, v30, 128LL, 1);
                if (v31) {
                  objc_setProperty_atomic(v31, v32, v29, 56LL);
                }

                BOOL v7 = v37;
                goto LABEL_26;
              }
            }

            uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        uint64_t v11 = v35 + 1;
        BOOL v7 = v37;
        uint64_t v8 = v33;
      }

      while (v35 + 1 != v34);
      uint64_t v34 = [v37 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }

    while (v34);
  }

- (void)reset:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    ne_log_obj();
    SEL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      uint64_t v24 = a1;
      _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_INFO, "%@: Reset", (uint8_t *)&v23, 0xCu);
    }

    if (a2 && objc_getProperty((id)a1, v5, 240LL, 1)) {
      objc_setProperty_atomic((id)a1, v6, 0LL, 240LL);
    }
    BOOL v7 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0LL;

    uint64_t v8 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0LL;

    uint64_t v9 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = 0LL;

    *(_DWORD *)(a1 + 84) = 0;
    *(void *)(a1 + 120) = 0LL;
    *(_BYTE *)(a1 + 76) = 0;
    uint64_t v10 = *(void **)(a1 + 192);
    *(void *)(a1 + 192) = 0LL;

    uint64_t v11 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = 0LL;

    id v12 = *(void **)(a1 + 168);
    *(void *)(a1 + 168) = 0LL;

    *(_BYTE *)(a1 + 79) = 0;
    *(_BYTE *)(a1 + 80) = 0;
    uint64_t v14 = *(void **)(a1 + 152);
    if (v14)
    {
      -[NEIKEv2Rekey invalidateTimers](v14, v13);
      uint64_t v15 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = 0LL;
    }

    uint64_t v16 = *(void **)(a1 + 136);
    if (v16)
    {
      [(id)a1 context];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 removeObserver:v17 forKeyPath:@"resolvedEndpoints"];

      uint64_t v18 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = 0LL;
    }

    uint64_t v19 = *(dispatch_source_s **)(a1 + 144);
    if (v19)
    {
      dispatch_source_cancel(v19);
      SEL v20 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = 0LL;
    }

    if (objc_getProperty((id)a1, v13, 272LL, 1))
    {
      objc_msgSend(objc_getProperty((id)a1, v21, 272, 1), "removeObserver:forKeyPath:", a1, @"path");
      objc_setProperty_atomic((id)a1, v22, 0LL, 272LL);
    }
  }

- (void)startIKEv2TunnelWithOptions:(uint64_t)a1
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 77) & 1) != 0)
    {
      ne_log_obj();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v59 = a1;
        _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_INFO,  "%@: Start IKEv2 Tunnel Skipped, provider disposed",  buf,  0xCu);
      }

      goto LABEL_9;
    }

    if (objc_getProperty((id)a1, v3, 240LL, 1))
    {
      ne_log_obj();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v59 = a1;
        _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_INFO,  "%@: Start IKEv2 Tunnel Skipped, has active ike session",  buf,  0xCu);
      }

void __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(dispatch_queue_s **)(a1 + 32);
  if (Property)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(Property, a2, 264LL, 1);
    uint64_t v4 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke_2;
  block[3] = &unk_18A090390;
  block[4] = v4;
  dispatch_async(Property, block);
}

- (void)stopIKEv2TunnelWithReason:(void *)a3 completionHandler:
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (a1)
  {
    ne_log_obj();
    SEL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      _os_log_impl(&dword_1876B1000, v6, OS_LOG_TYPE_INFO, "%@: Stopping IKEv2 Tunnel with reason %ld", buf, 0x16u);
    }

    id Property = objc_getProperty(a1, v7, 128LL, 1);
    if (Property) {
      objc_setProperty_atomic(Property, v9, 0LL, 64LL);
    }
    if (objc_getProperty(a1, v9, 240LL, 1))
    {
      -[NEIKEv2PacketTunnelProvider reset:]((uint64_t)a1, 0);
      if (objc_getProperty(a1, v11, 240LL, 1))
      {
        if ((a1[42] & 1) != 0)
        {
          ne_log_obj();
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = a1;
            _os_log_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_DEFAULT,  "%@: tunnelTeardown (graceful) - Clearing tunnel configuration",  buf,  0xCu);
          }

          [a1 setTunnelNetworkSettings:0 completionHandler:0];
          ne_log_obj();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = a1;
            _os_log_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_DEFAULT,  "%@: tunnelTeardown (graceful) - Invalidating session",  buf,  0xCu);
          }

          id v19 = objc_getProperty(a1, v18, 240LL, 1);
          *(void *)__int128 buf = MEMORY[0x1895F87A8];
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = __45__NEIKEv2PacketTunnelProvider_tunnelTeardown__block_invoke;
          uint64_t v25 = &unk_18A090390;
          SEL v26 = a1;
          [v19 invalidateWithCompletionHandler:1 completionHandler:buf];
        }

        else
        {
          objc_msgSend(objc_getProperty(a1, v12, 240, 1), "invalidate");
          ne_log_obj();
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = objc_getProperty(a1, v14, 240LL, 1);
            *(_DWORD *)__int128 buf = 138412546;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v15;
            _os_log_impl(&dword_1876B1000, v13, OS_LOG_TYPE_DEFAULT, "%@: Invalidated session (%@)", buf, 0x16u);
          }
        }
      }

      if ((a1[42] & 1) != 0)
      {
        v22[0] = MEMORY[0x1895F87A8];
        v22[1] = 3221225472LL;
        v22[2] = __75__NEIKEv2PacketTunnelProvider_stopIKEv2TunnelWithReason_completionHandler___block_invoke;
        v22[3] = &unk_18A0908C8;
        v22[4] = a1;
        int v23 = v5;
        SEL v20 = _Block_copy(v22);
        objc_setProperty_atomic_copy(a1, v21, v20, 184LL);

        goto LABEL_22;
      }

      objc_setProperty_atomic(a1, v12, 0LL, 240LL);
    }

    -[NEIKEv2PacketTunnelProvider invalidateCompanionProxyDatapath](a1, v10);
    if (v5) {
      v5[2](v5);
    }
  }

- (void)handleInterfaceDown
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v4[0] = 0LL;
  v4[1] = v4;
  v4[2] = 0x3032000000LL;
  v4[3] = __Block_byref_object_copy__11387;
  v4[4] = __Block_byref_object_dispose__11388;
  uint64_t v1 = a1;
  id v5 = v1;
  v1[77] = 1;
  ne_log_obj();
  int v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    SEL v7 = v1;
    _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel since interface is down", buf, 0xCu);
  }

  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke;
  v3[3] = &unk_18A08D508;
  v3[4] = v4;
  [v1 setTunnelNetworkSettings:0 completionHandler:v3];
  _Block_object_dispose(v4, 8);
}

void __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id Property = *(dispatch_queue_s **)(*(void *)(v3 + 8) + 40LL);
  if (Property)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(Property, a2, 264LL, 1);
    uint64_t v3 = *(void *)(a1 + 32);
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_2;
  block[3] = &unk_18A08D4E0;
  block[4] = v3;
  dispatch_async(Property, block);
}

void __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_BYTE **)(*(void *)(v1 + 8) + 40LL);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_3;
  v3[3] = &unk_18A08D4E0;
  v3[4] = v1;
  -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v2, 3LL, v3);
}

void __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_3(uint64_t a1)
{
}

- (void)invokeCancelTunnel:(_BYTE *)a1
{
  v12[2] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    int v2 = (int)a2;
    a1[77] = 1;
    objc_setProperty_atomic(a1, a2, 0LL, 216LL);
    -[NEIKEv2PacketTunnelProvider stopObserving](a1);
    NEResourcesCopyLocalizedNSString(@"VPN_HEADER", @"VPN_HEADER");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = 0LL;
    SEL v6 = 0LL;
    switch(v2)
    {
      case 4:
        SEL v7 = @"VPN Error 5";
        goto LABEL_14;
      case 5:
      case 6:
      case 8:
      case 9:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 19:
      case 21:
      case 22:
        break;
      case 7:
      case 18:
      case 28:
        SEL v7 = @"VPN Error 1";
        goto LABEL_14;
      case 10:
        SEL v7 = @"VPN Error 6";
        goto LABEL_14;
      case 17:
        SEL v7 = @"VPN Error 4";
        goto LABEL_14;
      case 20:
        SEL v7 = @"VPN Error 8";
        goto LABEL_14;
      case 23:
        SEL v7 = @"VPN Error 14";
        goto LABEL_14;
      case 24:
      case 25:
        SEL v7 = @"VPN Error 3";
        goto LABEL_14;
      case 26:
        SEL v7 = @"VPN Error 20";
        goto LABEL_14;
      case 27:
        SEL v7 = @"VPN Error 21";
        goto LABEL_14;
      case 29:
        SEL v7 = @"VPN Error 22";
        goto LABEL_14;
      case 30:
        SEL v7 = @"VPN Error 23";
LABEL_14:
        uint64_t v8 = NEResourcesCopyLocalizedNSString(v7, v7);
        id v5 = (void *)v8;
        SEL v6 = 0LL;
        if (v4 && v8)
        {
          uint64_t v9 = *MEMORY[0x1896075E0];
          v11[0] = @"LocalizedHeader";
          v11[1] = v9;
          v12[0] = v4;
          v12[1] = v8;
          [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
          SEL v6 = (void *)objc_claimAutoreleasedReturnValue();
        }

        break;
      default:
        SEL v6 = 0LL;
        break;
    }

    [MEMORY[0x189607870] errorWithDomain:@"IKEv2ProviderDisconnectionErrorDomain" code:v2 userInfo:v6];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

- (_BYTE)stopObserving
{
  if (result)
  {
    uint64_t v1 = result;
    if ((result[81] & 1) != 0)
    {
      [result removeObserver:result forKeyPath:@"protocolConfiguration"];
      result = (_BYTE *)[v1 removeObserver:v1 forKeyPath:@"defaultPath"];
      v1[81] = 0;
    }
  }

  return result;
}

- (uint64_t)invokeStartTunnelCompletionHandler:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (a1)
  {
    if (objc_getProperty((id)a1, v3, 176LL, 1))
    {
      id Property = (void (**)(id, id))objc_getProperty((id)a1, v5, 176LL, 1);
      Property[2](Property, v4);
      objc_setProperty_atomic_copy((id)a1, v7, 0LL, 176LL);
      ne_log_obj();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        uint64_t v11 = a1;
        __int16 v12 = 2080;
        id v13 = "-[NEIKEv2PacketTunnelProvider invokeStartTunnelCompletionHandler:]";
        _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: %s: Invoked start tunnel completion handler",  (uint8_t *)&v10,  0x16u);
      }

      a1 = 1LL;
    }

    else
    {
      a1 = 0LL;
    }
  }

  return a1;
}

uint64_t __75__NEIKEv2PacketTunnelProvider_stopIKEv2TunnelWithReason_completionHandler___block_invoke( uint64_t a1,  const char *a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)invalidateCompanionProxyDatapath
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (a1 && objc_getProperty(a1, a2, 232LL, 1))
  {
    id Property = (os_unfair_lock_s *)objc_getProperty(a1, v3, 232LL, 1);
    if (Property)
    {
      uint64_t v6 = (uint64_t)Property;
      SEL v7 = Property + 3;
      os_unfair_lock_lock(Property + 3);
      objc_storeWeak((id *)(v6 + 88), 0LL);
      if (*(_BYTE *)(v6 + 9) != 3)
      {
        ne_log_obj();
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412290;
          uint64_t v10 = v6;
          _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEFAULT, "%@: cancel", (uint8_t *)&v9, 0xCu);
        }

        -[NEIKEv2CompanionDatapath cancelLocked](v6);
      }

      os_unfair_lock_unlock(v7);
    }

    objc_setProperty_atomic(a1, v5, 0LL, 232LL);
  }

void __45__NEIKEv2PacketTunnelProvider_tunnelTeardown__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3 && objc_getProperty(v3, a2, 184LL, 1))
  {
    id Property = *(void (***)(void))(a1 + 32);
    if (Property) {
      id Property = (void (**)(void))objc_getProperty(Property, v4, 184LL, 1);
    }
    Property[2]();
    SEL v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_setProperty_atomic_copy(v7, v6, 0LL, 184LL);
    }
  }

  ne_log_obj();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      id v11 = objc_getProperty(*(id *)(a1 + 32), v9, 240LL, 1);
    }
    else {
      id v11 = 0LL;
    }
    int v14 = 138412546;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: tunnelTeardown (graceful) - Invalidated session (%@)",  (uint8_t *)&v14,  0x16u);
  }

  id v13 = *(void **)(a1 + 32);
  if (v13) {
    objc_setProperty_atomic(v13, v12, 0LL, 240LL);
  }
}

void __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v3 = objc_alloc(&OBJC_CLASS___NEIKEv2MOBIKE);
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id Property = objc_getProperty(v4, v2, 264LL, 1);
    uint64_t v6 = *(void **)(a1 + 32);
  }

  else
  {
    uint64_t v6 = 0LL;
    id Property = 0LL;
  }

  uint64_t v8 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v3->super.isa, Property, v6);
  int v9 = *(void **)(a1 + 32);
  if (v9) {
    objc_setProperty_atomic(v9, v7, v8, 168LL);
  }

  uint64_t v10 = -[NEIKEv2PacketTunnelProvider tunnelBringup](*(void *)(a1 + 32));
  if ((_DWORD)v10)
  {
    id v11 = (const char *)v10;
    ne_log_obj();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2080;
      id v17 = "-[NEIKEv2PacketTunnelProvider handleInterfaceChange:]_block_invoke_2";
      _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "%@: %s: Failed tunnel bringup on new path",  (uint8_t *)&v14,  0x16u);
    }

    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), v11);
  }

- (uint64_t)tunnelBringup
{
  v260[12] = *(id *)MEMORY[0x1895F89C0];
  if (a1)
  {
    [(id)a1 packetFlow];
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1) {
      uint64_t v2 = v1[11];
    }
    else {
      uint64_t v2 = 0LL;
    }
    *(void *)(a1 + 120) = v2;

    if (!*(void *)(a1 + 120))
    {
      ne_log_obj();
      oslog = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_error_impl( &dword_1876B1000,  oslog,  OS_LOG_TYPE_ERROR,  "%@: null virtualInterface, skip tunnel bringup",  buf,  0xCu);
      }

      uint64_t v22 = 10LL;
      goto LABEL_254;
    }

    -[NEIKEv2PacketTunnelProvider configureProxyPathIfNeeded]((void *)a1, v3);
    [(id)a1 protocolConfiguration];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id Property = objc_getProperty((id)a1, v5, 208LL, 1);
    uint64_t v7 = *(void *)(a1 + 248);
    id v8 = Property;
    id v10 = objc_getProperty((id)a1, v9, 112LL, 1);
    id v12 = objc_getProperty((id)a1, v11, 128LL, 1);
    id v13 = v4;
    v228 = (id *)v8;
    id v14 = v10;
    id v15 = v12;
    objc_opt_self();
    if (NEInitCFTypes_onceToken != -1) {
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
    }
    if (v13)
    {
      __int16 v16 = objc_alloc_init(&OBJC_CLASS___NEIKEv2IKESAConfiguration);
      if ((_DWORD)v7 && if_indextoname(v7, buf))
      {
        [NSString stringWithUTF8String:buf];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2IKESAConfiguration setOutgoingInterfaceName:](v16, "setOutgoingInterfaceName:", v17);
      }

      if ([v13 tunnelKind] == 2) {
        -[NEIKEv2IKESAConfiguration setRandomizeLocalPort:](v16, "setRandomizeLocalPort:", 1LL);
      }
      id v19 = v15;
      if (v15)
      {
        if (objc_getProperty(v15, v18, 56LL, 1))
        {
          objc_msgSend(objc_getProperty(v15, v20, 56, 1), "port");
          SEL v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v21, "intValue"));
          v227 = (id *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v227 = 0LL;
        }

        id v19 = v15;
      }

      else
      {
        v227 = 0LL;
      }

      int v23 = (const __CFString *)-[NEIKEv2Server getViableServerAddressForPath:](v19, v228);
      uint64_t v24 = NECreateAddressStructFromString(v23, (uint64_t)v227, 0LL);
      if (v24)
      {
        uint64_t v25 = v24;
        [MEMORY[0x189608DE8] endpointWithAddress:v24];
        SEL v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2IKESAConfiguration setRemoteEndpoint:](v16, "setRemoteEndpoint:", v26);

        free(v25);
        if (([v13 disableRedirect] & 1) == 0)
        {
          if (v15 && objc_getProperty(v15, v27, 32LL, 1))
          {
            BOOL v29 = (const __CFString *)objc_getProperty(v15, v28, 32LL, 1);
            SEL v30 = NECreateAddressStructFromString(v29, 0LL, 0LL);
            if (v30)
            {
              BOOL v31 = v30;
              [MEMORY[0x189608DE8] endpointWithAddress:v30];
              __int16 v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[NEIKEv2IKESAConfiguration setRedirectedFromServer:](v16, "setRedirectedFromServer:", v32);

              free(v31);
            }
          }

          else
          {
            -[NEIKEv2IKESAConfiguration setAllowRedirect:](v16, "setAllowRedirect:", 1LL);
          }
        }

        *(_DWORD *)v251 = 0;
        id v34 = objc_alloc_init(MEMORY[0x189603FA8]);
        [v13 IKESecurityAssociationParametersArray];
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v36 = [v35 count] == 0;

        if (v36)
        {
          [v13 IKESecurityAssociationParameters];
          __int128 v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[NEIKEv2Helper createIKESAProposalFromProtocol:saParameters:options:nonceSize:]( (uint64_t)&OBJC_CLASS___NEIKEv2Helper,  v13,  v42,  v14,  (unsigned int *)v251);
          id v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37) {
            [v34 addObject:v37];
          }
        }

        else
        {
          __int128 v238 = 0u;
          __int128 v239 = 0u;
          __int128 v236 = 0u;
          __int128 v237 = 0u;
          [v13 IKESecurityAssociationParametersArray];
          id v37 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v38 = [v37 countByEnumeratingWithState:&v236 objects:buf count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v237;
            do
            {
              for (uint64_t i = 0LL; i != v38; ++i)
              {
                if (*(void *)v237 != v39) {
                  objc_enumerationMutation(v37);
                }
                +[NEIKEv2Helper createIKESAProposalFromProtocol:saParameters:options:nonceSize:]( (uint64_t)&OBJC_CLASS___NEIKEv2Helper,  v13,  *(void **)(*((void *)&v236 + 1) + 8 * i),  v14,  (unsigned int *)v251);
                SEL v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (v41) {
                  [v34 addObject:v41];
                }
              }

              uint64_t v38 = [v37 countByEnumeratingWithState:&v236 objects:buf count:16];
            }

            while (v38);
          }
        }

        if ([v34 count])
        {
          -[NEIKEv2IKESAConfiguration setNonceSize:](v16, "setNonceSize:", *(unsigned int *)v251);
          -[NEIKEv2IKESAConfiguration setStrictNonceSizeChecks:](v16, "setStrictNonceSizeChecks:", 1LL);
          -[NEIKEv2IKESAConfiguration setProposals:](v16, "setProposals:", v34);
          [v13 ppkConfiguration];
          __int128 v43 = (void *)objc_claimAutoreleasedReturnValue();
          id v45 = v43;
          if (v43) {
            id v46 = objc_getProperty(v43, v44, 32LL, 1);
          }
          else {
            id v46 = 0LL;
          }
          id v47 = v46;
          [v47 persistentReference];
          uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v49 = v48 == 0LL;

          if (!v49) {
            -[NEIKEv2IKESAConfiguration setRequestPPK:](v16, "setRequestPPK:", 1LL);
          }
          objc_opt_self();
          oslog = v16;
        }

        else
        {
          ne_log_obj();
          id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v246 = 0;
            _os_log_error_impl(&dword_1876B1000, v50, OS_LOG_TYPE_ERROR, "empty ike proposals array", v246, 2u);
          }

          oslog = 0LL;
        }
      }

      else
      {
        ne_log_obj();
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v228;
          _os_log_error_impl( &dword_1876B1000,  v33,  OS_LOG_TYPE_ERROR,  "no viable server address found for path %@",  buf,  0xCu);
        }

        oslog = 0LL;
      }
    }

    else
    {
      ne_log_obj();
      __int16 v16 = (NEIKEv2IKESAConfiguration *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl( &dword_1876B1000,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "createIKESAConfigFromProtocol: null protocol",  buf,  2u);
      }

      oslog = 0LL;
    }

    if (!oslog)
    {
      ne_log_obj();
      v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_error_impl(&dword_1876B1000, v73, OS_LOG_TYPE_ERROR, "%@: failed to create ikeConfig", buf, 0xCu);
      }

      uint64_t v22 = 10LL;
      goto LABEL_253;
    }

    if (*(void *)(a1 + 224))
    {
      ne_log_obj();
      v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[NEIKEv2PacketTunnelProvider tunnelBringup]";
        _os_log_impl( &dword_1876B1000,  v51,  OS_LOG_TYPE_DEFAULT,  "%@: %s: Fallback to use random local port",  buf,  0x16u);
      }

      -[os_log_s setRandomizeLocalPort:](oslog, "setRandomizeLocalPort:", 1LL);
    }

    ne_log_large_obj();
    SEL v52 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = oslog;
      _os_log_debug_impl(&dword_1876B1000, v52, OS_LOG_TYPE_DEBUG, "%@: ikeConfig %@", buf, 0x16u);
    }

    [(id)a1 protocolConfiguration];
    id v53 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    if (NEInitCFTypes_onceToken == -1)
    {
      if (v53)
      {
LABEL_67:
        v54 = objc_alloc_init(&OBJC_CLASS___NEIKEv2ChildSAConfiguration);
        -[NEIKEv2ChildSAConfiguration setMode:](v54, "setMode:", 2LL);
        id v229 = objc_alloc_init(MEMORY[0x189603FA8]);
        v55 = objc_alloc_init(&OBJC_CLASS___NEIKEv2TrafficSelector);
        uint64_t v56 = NECreateAddressStructFromString(@"0.0.0.0", 0LL, 0LL);
        id v57 = NECreateAddressStructFromString(@"255.255.255.255", 0LL, 0LL);
        [MEMORY[0x189608DE8] endpointWithAddress:v56];
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2TrafficSelector setStartAddress:](v55, "setStartAddress:", v58);

        [MEMORY[0x189608DE8] endpointWithAddress:v57];
        uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2TrafficSelector setEndAddress:](v55, "setEndAddress:", v59);

        -[NEIKEv2TrafficSelector setStartPort:](v55, "setStartPort:", 0LL);
        -[NEIKEv2TrafficSelector setEndPort:](v55, "setEndPort:", 0xFFFFLL);
        -[NEIKEv2TrafficSelector setIpProtocol:](v55, "setIpProtocol:", 0LL);
        [v229 addObject:v55];
        free(v56);
        free(v57);
        __int16 v60 = objc_alloc_init(&OBJC_CLASS___NEIKEv2TrafficSelector);

        uint64_t v61 = NECreateAddressStructFromString(@"::", 0LL, 0LL);
        __int16 v62 = NECreateAddressStructFromString(@"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", 0LL, 0LL);
        [MEMORY[0x189608DE8] endpointWithAddress:v61];
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2TrafficSelector setStartAddress:](v60, "setStartAddress:", v63);

        [MEMORY[0x189608DE8] endpointWithAddress:v62];
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2TrafficSelector setEndAddress:](v60, "setEndAddress:", v64);

        -[NEIKEv2TrafficSelector setStartPort:](v60, "setStartPort:", 0LL);
        -[NEIKEv2TrafficSelector setEndPort:](v60, "setEndPort:", 0xFFFFLL);
        -[NEIKEv2TrafficSelector setIpProtocol:](v60, "setIpProtocol:", 0LL);
        [v229 addObject:v60];
        free(v61);
        free(v62);
        -[NEIKEv2ChildSAConfiguration setLocalTrafficSelectors:](v54, "setLocalTrafficSelectors:", v229);
        -[NEIKEv2ChildSAConfiguration setRemoteTrafficSelectors:](v54, "setRemoteTrafficSelectors:", v229);
        id v65 = objc_alloc_init(MEMORY[0x189603FA8]);
        [v53 childSecurityAssociationParametersArray];
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v67 = [v66 count] == 0;

        if (v67)
        {
          [v53 childSecurityAssociationParameters];
          uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = +[NEIKEv2Helper createIKEv2ChildSAProposalFromProtocol:saParameters:]( (uint64_t)&OBJC_CLASS___NEIKEv2Helper,  v53,  v74);
          if (v68) {
            [v65 addObject:v68];
          }
        }

        else
        {
          __int128 v238 = 0u;
          __int128 v239 = 0u;
          __int128 v236 = 0u;
          __int128 v237 = 0u;
          [v53 childSecurityAssociationParametersArray];
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v69 = [v68 countByEnumeratingWithState:&v236 objects:buf count:16];
          if (v69)
          {
            uint64_t v70 = *(void *)v237;
            do
            {
              for (uint64_t j = 0LL; j != v69; ++j)
              {
                if (*(void *)v237 != v70) {
                  objc_enumerationMutation(v68);
                }
                +[NEIKEv2Helper createIKEv2ChildSAProposalFromProtocol:saParameters:]( (uint64_t)&OBJC_CLASS___NEIKEv2Helper,  v53,  *(void **)(*((void *)&v236 + 1) + 8 * j));
                uint32_t v72 = (void *)objc_claimAutoreleasedReturnValue();
                if (v72) {
                  [v65 addObject:v72];
                }
              }

              uint64_t v69 = [v68 countByEnumeratingWithState:&v236 objects:buf count:16];
            }

            while (v69);
          }
        }

        if ([v65 count])
        {
          -[NEIKEv2ChildSAConfiguration setProposals:](v54, "setProposals:", v65);
          -[NEIKEv2ChildSAConfiguration setOpportunisticPFS:]( v54,  "setOpportunisticPFS:",  [v53 opportunisticPFS]);
          v73 = v54;
        }

        else
        {
          ne_log_obj();
          v75 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v251 = 0;
            _os_log_error_impl(&dword_1876B1000, v75, OS_LOG_TYPE_ERROR, "empty child proposals array", v251, 2u);
          }

          v73 = 0LL;
        }

        goto LABEL_93;
      }
    }

    else
    {
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
      if (v53) {
        goto LABEL_67;
      }
    }

    ne_log_obj();
    v54 = (NEIKEv2ChildSAConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_1876B1000,  (os_log_t)v54,  OS_LOG_TYPE_ERROR,  "createIKEv2ChildSAConfigFromProtocol: null protocol",  buf,  2u);
    }

    v73 = 0LL;
LABEL_93:

    if (!v73)
    {
      ne_log_obj();
      v84 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_error_impl(&dword_1876B1000, v84, OS_LOG_TYPE_ERROR, "%@: failed to create childConfig", buf, 0xCu);
      }

      uint64_t v22 = 10LL;
      goto LABEL_252;
    }

    ne_log_large_obj();
    v76 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v73;
      _os_log_debug_impl(&dword_1876B1000, v76, OS_LOG_TYPE_DEBUG, "%@: childConfig %@", buf, 0x16u);
    }

    [(id)a1 protocolConfiguration];
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    id v79 = objc_getProperty((id)a1, v78, 112LL, 1);
    char v230 = *(_BYTE *)(a1 + 41);
    id v80 = v77;
    id v81 = v79;
    objc_opt_self();
    if (NEInitCFTypes_onceToken == -1)
    {
      if (v80) {
        goto LABEL_98;
      }
    }

    else
    {
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22164);
      if (v80)
      {
LABEL_98:
        v82 = objc_alloc_init(&OBJC_CLASS___NEIKEv2SessionConfiguration);
        if ([v80 minimumTLSVersion] == 1)
        {
          int v83 = @"1.0";
        }

        else if ([v80 minimumTLSVersion] == 2)
        {
          int v83 = @"1.1";
        }

        else
        {
          if ([v80 minimumTLSVersion] != 3) {
            goto LABEL_108;
          }
          int v83 = @"1.2";
        }

        -[NEIKEv2SessionConfiguration setTlsMinimumVersion:](v82, "setTlsMinimumVersion:", v83);
LABEL_108:
        if ([v80 maximumTLSVersion] == 1)
        {
          SEL v85 = @"1.0";
        }

        else if ([v80 maximumTLSVersion] == 2)
        {
          SEL v85 = @"1.1";
        }

        else
        {
          if ([v80 maximumTLSVersion] != 3) {
            goto LABEL_115;
          }
          SEL v85 = @"1.2";
        }

        -[NEIKEv2SessionConfiguration setTlsMaximumVersion:](v82, "setTlsMaximumVersion:", v85);
LABEL_115:
        -[NEIKEv2SessionConfiguration setBlackholeDetectionEnabled:](v82, "setBlackholeDetectionEnabled:", v230 & 1);
        [v80 localIdentifier];
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v86) {
          goto LABEL_126;
        }
        [v80 localIdentifier];
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v88 = +[NEIKEv2Helper getIdentifierType:]((uint64_t)&OBJC_CLASS___NEIKEv2Helper, v87);

        if (v88 == 5)
        {
          [v80 localIdentifier];
          v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
          id v90 = (char *)NECreateAddressStructFromString(v92, 0LL, 0LL);

          if (v90)
          {
            uint64_t v91 = [MEMORY[0x189603F48] dataWithBytes:v90 + 8 length:16];
            goto LABEL_122;
          }
        }

        else
        {
          if (v88 != 1)
          {
            [v80 localIdentifier];
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            [v94 dataUsingEncoding:4];
            uint64_t v93 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_125;
          }

          [v80 localIdentifier];
          v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
          id v90 = (char *)NECreateAddressStructFromString(v89, 0LL, 0LL);

          if (v90)
          {
            uint64_t v91 = [MEMORY[0x189603F48] dataWithBytes:v90 + 4 length:4];
LABEL_122:
            uint64_t v93 = (void *)v91;
            free(v90);
LABEL_125:
            id v95 = +[NEIKEv2Identifier createIdentifierWithType:data:]( &OBJC_CLASS___NEIKEv2Identifier,  "createIdentifierWithType:data:",  v88,  v93);
            -[NEIKEv2SessionConfiguration setLocalIdentifier:](v82, "setLocalIdentifier:", v95);

LABEL_126:
            [v80 remoteIdentifier];
            v96 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v96) {
              goto LABEL_137;
            }
            [v80 remoteIdentifier];
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v98 = +[NEIKEv2Helper getIdentifierType:]((uint64_t)&OBJC_CLASS___NEIKEv2Helper, v97);

            if (v98 == 5)
            {
              [v80 remoteIdentifier];
              v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v100 = (char *)NECreateAddressStructFromString(v102, 0LL, 0LL);

              if (v100)
              {
                uint64_t v101 = [MEMORY[0x189603F48] dataWithBytes:v100 + 8 length:16];
                goto LABEL_133;
              }
            }

            else
            {
              if (v98 != 1)
              {
                [v80 remoteIdentifier];
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                [v104 dataUsingEncoding:4];
                char v103 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_136;
              }

              [v80 remoteIdentifier];
              v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v100 = (char *)NECreateAddressStructFromString(v99, 0LL, 0LL);

              if (v100)
              {
                uint64_t v101 = [MEMORY[0x189603F48] dataWithBytes:v100 + 4 length:4];
LABEL_133:
                char v103 = (void *)v101;
                free(v100);
LABEL_136:
                id v105 = +[NEIKEv2Identifier createIdentifierWithType:data:]( &OBJC_CLASS___NEIKEv2Identifier,  "createIdentifierWithType:data:",  v98,  v103);
                -[NEIKEv2SessionConfiguration setRemoteIdentifier:](v82, "setRemoteIdentifier:", v105);

LABEL_137:
                uint64_t v106 = [v80 authenticationMethod];
                if (v106 == 2)
                {
                  uint64_t v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithMethod:",  2LL);
                }

                else if (v106 == 1)
                {
                  switch([v80 certificateType])
                  {
                    case 2LL:
                      uint64_t v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithMethod:",  9LL);
                      break;
                    case 3LL:
                      uint64_t v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithMethod:",  10LL);
                      break;
                    case 4LL:
                      uint64_t v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithMethod:",  11LL);
                      break;
                    case 5LL:
                      uint64_t v107 = -[NEIKEv2AuthenticationProtocol initWithDigitalSignature:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithDigitalSignature:",  3LL);
                      break;
                    case 6LL:
                      uint64_t v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithMethod:",  245LL);
                      break;
                    case 7LL:
                      uint64_t v107 = -[NEIKEv2AuthenticationProtocol initWithDigitalSignature:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithDigitalSignature:",  4LL);
                      break;
                    default:
                      uint64_t v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithMethod:",  1LL);
                      break;
                  }
                }

                else
                {
                  uint64_t v107 = -[NEIKEv2AuthenticationProtocol initWithMethod:]( objc_alloc(&OBJC_CLASS___NEIKEv2AuthenticationProtocol),  "initWithMethod:",  0LL);
                }

                __int16 v108 = v107;
                -[NEIKEv2SessionConfiguration setAuthenticationProtocol:](v82, "setAuthenticationProtocol:", v107);
                v109 = -[NEIKEv2SessionConfiguration authenticationProtocol](v82, "authenticationProtocol");
                uint64_t v110 = (void *)[v109 copy];
                -[NEIKEv2SessionConfiguration setRemoteAuthentication:](v82, "setRemoteAuthentication:", v110);

                [v80 sharedSecretKeychainItem];
                __int16 v111 = (void *)objc_claimAutoreleasedReturnValue();
                [v111 persistentReference];
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                BOOL v113 = v112 == 0LL;

                if (!v113)
                {
                  [v80 sharedSecretKeychainItem];
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  [v114 persistentReference];
                  v115 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NEIKEv2SessionConfiguration setSharedSecretReference:](v82, "setSharedSecretReference:", v115);
                }

                [v80 identityReferenceInternal];
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                BOOL v117 = v116 == 0LL;

                if (!v117)
                {
                  [v80 identityReferenceInternal];
                  v119 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NEIKEv2SessionConfiguration setLocalCertificateReference:]( v82,  "setLocalCertificateReference:",  v119);
                }

                id v120 = objc_getProperty(v80, v118, 96LL, 1);
                [v120 keyPersistentReference];
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                BOOL v122 = v121 == 0LL;

                if (!v122)
                {
                  id v124 = objc_getProperty(v80, v123, 96LL, 1);
                  [v124 keyPersistentReference];
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NEIKEv2SessionConfiguration setLocalCertificateKeyReference:]( v82,  "setLocalCertificateKeyReference:",  v125);
                }

                id v126 = objc_getProperty(v80, v123, 96LL, 1);
                -[NEIKEv2SessionConfiguration setLocalCertificateIsModernSystem:]( v82,  "setLocalCertificateIsModernSystem:",  [v126 isModernSystem]);

                if ([v80 natKeepAliveOffloadEnable] == 2)
                {
                  -[NEIKEv2SessionConfiguration setNatTraversalKeepaliveOffloadEnabled:]( v82,  "setNatTraversalKeepaliveOffloadEnabled:",  1LL);
                  if ([v80 natKeepAliveOffloadInterval]) {
                    -[NEIKEv2SessionConfiguration setNatTraversalKeepaliveOffloadInterval:]( v82,  "setNatTraversalKeepaliveOffloadInterval:",  (int)[v80 natKeepAliveOffloadInterval]);
                  }
                }

                if ([v80 deadPeerDetectionRate])
                {
                  uint64_t v127 = [v80 deadPeerDetectionRate];
                  objc_opt_self();
                  uint64_t v128 = v127 - 1;
                  if ((unint64_t)(v127 - 1) <= 2)
                  {
                    uint64_t v129 = qword_187872EC8[v128];
                    uint64_t v130 = dword_187872EE0[v128];
                    -[NEIKEv2SessionConfiguration setDeadPeerDetectionEnabled:]( v82,  "setDeadPeerDetectionEnabled:",  1LL);
                    -[NEIKEv2SessionConfiguration setDeadPeerDetectionMaxRetryCount:]( v82,  "setDeadPeerDetectionMaxRetryCount:",  v130);
                    -[NEIKEv2SessionConfiguration setDeadPeerDetectionRetryIntervalMilliseconds:]( v82,  "setDeadPeerDetectionRetryIntervalMilliseconds:",  1000LL);
                    -[NEIKEv2SessionConfiguration setDeadPeerDetectionInterval:]( v82,  "setDeadPeerDetectionInterval:",  v129);
                  }
                }

                if ([v80 disconnectOnIdle]
                  && [v80 disconnectOnIdleTimeout])
                {
                  -[NEIKEv2SessionConfiguration setIdleTimeoutEnabled:](v82, "setIdleTimeoutEnabled:", 1LL);
                  uint64_t v131 = (int)[v80 disconnectOnIdleTimeout];
                }

                else
                {
                  if ((v230 & 1) == 0 && [v80 tunnelKind] != 2)
                  {
LABEL_164:
                    if (([v80 disableMOBIKE] & 1) == 0) {
                      -[NEIKEv2SessionConfiguration setNegotiateMOBIKE:](v82, "setNegotiateMOBIKE:", 1LL);
                    }
                    if ([v80 enableRevocationCheck])
                    {
                      -[NEIKEv2SessionConfiguration setEnableCertificateRevocationCheck:]( v82,  "setEnableCertificateRevocationCheck:",  1LL);
                      if ([v80 strictRevocationCheck]) {
                        -[NEIKEv2SessionConfiguration setStrictCertificateRevocationCheck:]( v82,  "setStrictCertificateRevocationCheck:",  1LL);
                      }
                    }

                    [v81 objectForKeyedSubscript:@"AccountName"];
                    v133 = (void *)objc_claimAutoreleasedReturnValue();
                    BOOL v134 = v133 == 0LL;

                    if (v134)
                    {
                      [v80 username];
                      v136 = (void *)objc_claimAutoreleasedReturnValue();
                      BOOL v137 = v136 == 0LL;

                      if (v137) {
                        goto LABEL_174;
                      }
                      uint64_t v135 = [v80 username];
                    }

                    else
                    {
                      uint64_t v135 = [v81 objectForKeyedSubscript:@"AccountName"];
                    }

                    v138 = (void *)v135;
                    -[NEIKEv2SessionConfiguration setUsername:](v82, "setUsername:", v135);

LABEL_174:
                    [v81 objectForKeyedSubscript:@"Password"];
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    BOOL v140 = v139 == 0LL;

                    if (v140)
                    {
                      [v80 passwordKeychainItem];
                      v182 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v182) {
                        goto LABEL_177;
                      }
                      [v80 passwordKeychainItem];
                      v183 = (void *)objc_claimAutoreleasedReturnValue();
                      [v183 persistentReference];
                      v184 = (void *)objc_claimAutoreleasedReturnValue();
                      BOOL v185 = v184 == 0LL;

                      if (v185) {
                        goto LABEL_177;
                      }
                      [v80 passwordKeychainItem];
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      [v141 persistentReference];
                      v186 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setPasswordReference:](v82, "setPasswordReference:", v186);
                    }

                    else
                    {
                      [v81 objectForKeyedSubscript:@"Password"];
                      v141 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setPassword:](v82, "setPassword:", v141);
                    }

LABEL_177:
                    [v80 serverCertificateCommonName];
                    v142 = (void *)objc_claimAutoreleasedReturnValue();
                    BOOL v143 = v142 == 0LL;

                    if (!v143)
                    {
                      [v80 serverCertificateCommonName];
                      v144 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setRemoteCertificateHostname:]( v82,  "setRemoteCertificateHostname:",  v144);
                    }

                    [v80 serverCertificateIssuerCommonName];
                    v145 = (void *)objc_claimAutoreleasedReturnValue();
                    BOOL v146 = v145 == 0LL;

                    if (!v146)
                    {
                      [v80 serverCertificateIssuerCommonName];
                      v147 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setRemoteCertificateAuthorityName:]( v82,  "setRemoteCertificateAuthorityName:",  v147);
                    }

                    id v148 = objc_alloc_init(MEMORY[0x189603FA8]);
                    id v149 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]( objc_alloc(&OBJC_CLASS___NEIKEv2IPv4AddressAttribute),  "initEmptyRequest");
                    [v148 addObject:v149];

                    if ([v80 useConfigurationAttributeInternalIPSubnet])
                    {
                      id v150 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]( objc_alloc(&OBJC_CLASS___NEIKEv2IPv4SubnetAttribute),  "initEmptyRequest");
                      [v148 addObject:v150];
                    }

                    id v151 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]( objc_alloc(&OBJC_CLASS___NEIKEv2IPv4NetmaskAttribute),  "initEmptyRequest");
                    [v148 addObject:v151];

                    id v152 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]( objc_alloc(&OBJC_CLASS___NEIKEv2IPv4DHCPAttribute),  "initEmptyRequest");
                    [v148 addObject:v152];

                    id v153 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]( objc_alloc(&OBJC_CLASS___NEIKEv2IPv4DNSAttribute),  "initEmptyRequest");
                    [v148 addObject:v153];

                    id v154 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]( objc_alloc(&OBJC_CLASS___NEIKEv2IPv6AddressAttribute),  "initEmptyRequest");
                    [v148 addObject:v154];

                    if ([v80 useConfigurationAttributeInternalIPSubnet])
                    {
                      v155 = objc_alloc(&OBJC_CLASS___NEIKEv2IPv6SubnetAttribute);
                      [MEMORY[0x189608DE8] endpointWithHostname:@"::" port:@"0"];
                      v156 = (void *)objc_claimAutoreleasedReturnValue();
                      v157 = -[NEIKEv2SubnetAttribute initWithAddress:ipv4SubnetMask:]( v155,  "initWithAddress:ipv4SubnetMask:",  v156,  0LL);
                      [v148 addObject:v157];
                    }

                    id v158 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]( objc_alloc(&OBJC_CLASS___NEIKEv2IPv6DHCPAttribute),  "initEmptyRequest");
                    [v148 addObject:v158];

                    id v159 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]( objc_alloc(&OBJC_CLASS___NEIKEv2IPv6DNSAttribute),  "initEmptyRequest");
                    [v148 addObject:v159];

                    id v160 = -[NEIKEv2ConfigurationAttribute initEmptyRequest]( objc_alloc(&OBJC_CLASS___NEIKEv2DNSDomainAttribute),  "initEmptyRequest");
                    [v148 addObject:v160];

                    v161 = objc_alloc_init(&OBJC_CLASS___NEIKEv2ConfigurationMessage);
                    v163 = v161;
                    if (v161)
                    {
                      v161->_configurationType = 1LL;
                      objc_setProperty_atomic(v161, v162, v148, 16LL);
                    }

                    -[NEIKEv2SessionConfiguration setConfigurationRequest:](v82, "setConfigurationRequest:", v163);
                    [v80 ppkConfiguration];
                    v164 = (void *)objc_claimAutoreleasedReturnValue();
                    v166 = v164;
                    if (v164) {
                      id v167 = objc_getProperty(v164, v165, 32LL, 1);
                    }
                    else {
                      id v167 = 0LL;
                    }
                    id v168 = v167;
                    [v168 persistentReference];
                    v169 = (void *)objc_claimAutoreleasedReturnValue();
                    BOOL v170 = v169 == 0LL;

                    if (!v170)
                    {
                      [v80 ppkConfiguration];
                      v171 = (void *)objc_claimAutoreleasedReturnValue();
                      v173 = v171;
                      if (v171) {
                        id v174 = objc_getProperty(v171, v172, 32LL, 1);
                      }
                      else {
                        id v174 = 0LL;
                      }
                      id v175 = v174;
                      [v175 persistentReference];
                      v176 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setPpkReference:](v82, "setPpkReference:", v176);

                      [v80 ppkConfiguration];
                      v177 = (void *)objc_claimAutoreleasedReturnValue();
                      [v177 identifier];
                      v178 = (void *)objc_claimAutoreleasedReturnValue();
                      [v178 dataUsingEncoding:4];
                      v179 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setPpkID:](v82, "setPpkID:", v179);

                      -[NEIKEv2SessionConfiguration setPpkIDType:](v82, "setPpkIDType:", 2LL);
                      [v80 ppkConfiguration];
                      v180 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NEIKEv2SessionConfiguration setPpkMandatory:]( v82,  "setPpkMandatory:",  [v180 isMandatory]);
                    }

                    objc_opt_self();
                    v181 = v82;

                    v84 = v181;
                    goto LABEL_209;
                  }

                  ne_log_obj();
                  v132 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)__int128 buf = 0;
                    _os_log_impl(&dword_1876B1000, v132, OS_LOG_TYPE_INFO, "setting idle timeout", buf, 2u);
                  }

                  -[NEIKEv2SessionConfiguration setIdleTimeoutEnabled:](v82, "setIdleTimeoutEnabled:", 1LL);
                  uint64_t v131 = 120LL;
                }

                -[NEIKEv2SessionConfiguration setIdleTimeoutSeconds:](v82, "setIdleTimeoutSeconds:", v131);
                goto LABEL_164;
              }
            }

            char v103 = 0LL;
            goto LABEL_136;
          }
        }

        uint64_t v93 = 0LL;
        goto LABEL_125;
      }
    }

    ne_log_obj();
    v181 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v181,  OS_LOG_TYPE_ERROR,  "createIKEv2SessionConfigFromProtocol: null protocol",  buf,  2u);
    }

    v84 = 0LL;
LABEL_209:

    if (v84)
    {
      ne_log_large_obj();
      v187 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v187, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v84;
        _os_log_debug_impl(&dword_1876B1000, v187, OS_LOG_TYPE_DEBUG, "%@: sessionConfig %@", buf, 0x16u);
      }

      uint64_t Socket = NEIKEv2PacketTunnelProviderGetSocket((void *)a1, 0LL, 0LL, 0LL, 0LL);
      if ((Socket & 0x80000000) == 0)
      {
        v189 = -[NEIPSecSAKernelSession initWithName:delegate:pfkeySocket:]( objc_alloc(&OBJC_CLASS___NEIPSecSAKernelSession),  "initWithName:delegate:pfkeySocket:",  @"IKEv2 Session Database",  0LL,  Socket);
        if (v189)
        {
          objc_initWeak(&location, (id)a1);
          v190 = objc_alloc(&OBJC_CLASS___NEIKEv2Session);
          uint64_t v191 = *(void *)(a1 + 264);
          uint64_t v192 = *(void *)(a1 + 120);
          uint64_t v193 = MEMORY[0x1895F87A8];
          v233[0] = MEMORY[0x1895F87A8];
          v233[1] = 3221225472LL;
          v233[2] = __44__NEIKEv2PacketTunnelProvider_tunnelBringup__block_invoke;
          v233[3] = &unk_18A08D4B8;
          objc_copyWeak(&v234, &location);
          v194 = -[NEIKEv2Session initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSession:packetDelegate:]( v190,  "initWithIKEConfig:firstChildConfig:sessionConfig:queue:ipsecInterface:ikeSocketHandler:saSession:packetDelegate:",  oslog,  v73,  v84,  v191,  v192,  v233,  v189,  0LL);
          objc_setProperty_atomic((id)a1, v195, v194, 240LL);

          if (!objc_getProperty((id)a1, v196, 240LL, 1))
          {
            ne_log_obj();
            v223 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__int128 buf = 138412290;
              *(void *)&uint8_t buf[4] = a1;
              _os_log_error_impl(&dword_1876B1000, v223, OS_LOG_TYPE_ERROR, "%@: Could not create session", buf, 0xCu);
            }

            uint64_t v22 = 10LL;
            goto LABEL_250;
          }

          ne_log_obj();
          v197 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v197, OS_LOG_TYPE_INFO))
          {
            id v199 = objc_getProperty((id)a1, v198, 240LL, 1);
            *(_DWORD *)__int128 buf = 138412546;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v199;
            _os_log_impl(&dword_1876B1000, v197, OS_LOG_TYPE_INFO, "%@: Created session (%@)", buf, 0x16u);
          }

          id v201 = objc_getProperty((id)a1, v200, 240LL, 1);
          [v201 setClientCallbackInfo:a1];

          uint64_t v202 = *(void *)(a1 + 264);
          id v204 = objc_getProperty((id)a1, v203, 240LL, 1);
          [v204 setClientQueue:v202];

          objc_initWeak(&from, (id)a1);
          *(void *)__int128 buf = v193;
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke;
          v258 = &unk_18A08D490;
          objc_copyWeak(v260, &from);
          uint64_t v259 = a1;
          [*(id *)(a1 + 240) setStateUpdateBlock:buf];
          *(void *)&__int128 v236 = v193;
          *((void *)&v236 + 1) = 3221225472LL;
          *(void *)&__int128 v237 = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_108;
          *((void *)&v237 + 1) = &unk_18A08E1F0;
          objc_copyWeak((id *)&v238, &from);
          [*(id *)(a1 + 240) setChildStateUpdateBlock:&v236];
          *(void *)v251 = v193;
          uint64_t v252 = 3221225472LL;
          v253 = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_111;
          v254 = &unk_18A08E218;
          objc_copyWeak(&v255, &from);
          [*(id *)(a1 + 240) setConfigurationUpdateBlock:v251];
          *(void *)v246 = v193;
          uint64_t v247 = 3221225472LL;
          v248 = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_113;
          v249 = &unk_18A08E240;
          objc_copyWeak(v250, &from);
          [*(id *)(a1 + 240) setTrafficSelectorUpdateBlock:v246];
          v244[0] = v193;
          v244[1] = 3221225472LL;
          v244[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_115;
          v244[3] = &unk_18A08FD30;
          objc_copyWeak(&v245, &from);
          [*(id *)(a1 + 240) setAdditionalAddressesUpdateBlock:v244];
          v242[0] = v193;
          v242[1] = 3221225472LL;
          v242[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_117;
          v242[3] = &unk_18A08FAC8;
          objc_copyWeak(&v243, &from);
          [*(id *)(a1 + 240) setShortDPDEventBlock:v242];
          v240[0] = v193;
          v240[1] = 3221225472LL;
          v240[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_118;
          v240[3] = &unk_18A08E268;
          objc_copyWeak(&v241, &from);
          [*(id *)(a1 + 240) setRedirectEventBlock:v240];
          objc_destroyWeak(&v241);
          objc_destroyWeak(&v243);
          objc_destroyWeak(&v245);
          objc_destroyWeak(v250);
          objc_destroyWeak(&v255);
          objc_destroyWeak((id *)&v238);
          objc_destroyWeak(v260);
          objc_destroyWeak(&from);
          id v206 = objc_getProperty((id)a1, v205, 240LL, 1);
          [v206 connect];

          id v208 = objc_getProperty((id)a1, v207, 240LL, 1);
          -[NEIKEv2Session firstChildSA](v208, v209);
          v210 = (_DWORD *)objc_claimAutoreleasedReturnValue();
          if (v210)
          {
            BOOL v211 = v210[4] == 0;

            if (!v211)
            {
              ne_log_obj();
              v212 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v212, OS_LOG_TYPE_INFO))
              {
                id v214 = objc_getProperty((id)a1, v213, 240LL, 1);
                uint64_t v216 = -[NEIKEv2Session firstChildSA](v214, v215);
                v217 = (void *)v216;
                if (v216) {
                  int v218 = *(_DWORD *)(v216 + 16);
                }
                else {
                  int v218 = 0;
                }
                *(_DWORD *)__int128 buf = 138412546;
                *(void *)&uint8_t buf[4] = a1;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v218;
                _os_log_impl(&dword_1876B1000, v212, OS_LOG_TYPE_INFO, "%@: Started Child Connection %X", buf, 0x12u);
              }

              [(id)a1 protocolConfiguration];
              v219 = (void *)objc_claimAutoreleasedReturnValue();
              char v220 = [v219 disableRedirect];

              if ((v220 & 1) == 0)
              {
                v222 = objc_getProperty((id)a1, v221, 128LL, 1);
                -[NEIKEv2Server startRedirectTimer](v222);
              }

              ne_log_obj();
              v223 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int128 buf = 138412290;
                *(void *)&uint8_t buf[4] = a1;
                _os_log_impl(&dword_1876B1000, v223, OS_LOG_TYPE_DEFAULT, "%@ tunnel bringup requested", buf, 0xCu);
              }

              uint64_t v22 = 0LL;
LABEL_250:

              objc_destroyWeak(&v234);
              objc_destroyWeak(&location);
              goto LABEL_251;
            }
          }

          else
          {
          }

          ne_log_obj();
          v223 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int128 buf = 138412290;
            *(void *)&uint8_t buf[4] = a1;
            _os_log_error_impl(&dword_1876B1000, v223, OS_LOG_TYPE_ERROR, "%@: Could not start child", buf, 0xCu);
          }

          uint64_t v22 = 7LL;
          goto LABEL_250;
        }

        ne_log_obj();
        v225 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v225, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)__int128 buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = Socket;
          _os_log_fault_impl( &dword_1876B1000,  v225,  OS_LOG_TYPE_FAULT,  "[NEIPSecSAKernelSession init pfkeySocket=%d] failed",  buf,  8u);
        }

        v189 = 0LL;
LABEL_236:
        uint64_t v22 = 10LL;
LABEL_251:

LABEL_252:
LABEL_253:

LABEL_254:
        return v22;
      }

      ne_log_obj();
      v189 = (NEIPSecSAKernelSession *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v189, OS_LOG_TYPE_ERROR)) {
        goto LABEL_236;
      }
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = a1;
      v224 = "%@ failed to get pfkey socket";
    }

    else
    {
      ne_log_obj();
      v189 = (NEIPSecSAKernelSession *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v189, OS_LOG_TYPE_ERROR)) {
        goto LABEL_236;
      }
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = a1;
      v224 = "%@: failed to create sessionConfig";
    }

    _os_log_error_impl(&dword_1876B1000, (os_log_t)v189, OS_LOG_TYPE_ERROR, v224, buf, 0xCu);
    goto LABEL_236;
  }

  return 0LL;
}

uint64_t __44__NEIKEv2PacketTunnelProvider_tunnelBringup__block_invoke( uint64_t a1,  uint64_t a2,  unsigned __int8 *a3,  unsigned __int8 *a4,  void *a5)
{
  uint64_t v100 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3)
    {
      [MEMORY[0x189608DE8] endpointWithAddress:a3];
      uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4) {
        goto LABEL_4;
      }
    }

    else
    {
      uint64_t v88 = 0LL;
      if (a4)
      {
LABEL_4:
        [MEMORY[0x189608DE8] endpointWithAddress:a4];
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (a5)
        {
LABEL_5:
          [NSString stringWithUTF8String:a5];
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  ne_log_obj();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (WeakRetained)
  {
    if (v8)
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = WeakRetained;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = objc_getProperty(WeakRetained, v9, 240LL, 1);
      _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_INFO, "%@: stateUpdateBlock callback: session (%X)", buf, 0x12u);
    }

    if (a2 == 2)
    {
      -[NEIKEv2PacketTunnelProvider setInterfaceAvailability]((uint64_t)WeakRetained);
      -[NEIKEv2PacketTunnelProvider watchIKESocketChange]((uint64_t)WeakRetained, v23);
      if ((*((_DWORD *)WeakRetained + 21) & 1) == 0)
      {
        ne_log_obj();
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = WeakRetained;
          _os_log_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_INFO,  "%@: stateUpdateBlock callback: got IKE Connected",  buf,  0xCu);
        }

        *((_DWORD *)WeakRetained + 21) |= 1u;
        -[NEIKEv2PacketTunnelProvider startRekeyTimer:](WeakRetained, 1);
        NEIKEv2PacketTunnelHandleConnected(WeakRetained);
      }
    }

    else
    {
      if (a2 != 3) {
        goto LABEL_46;
      }
      ne_log_obj();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = WeakRetained;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v5;
        _os_log_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_INFO,  "%@: stateUpdateBlock callback: got IKE Disconnected (%@)",  buf,  0x16u);
      }

      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = MEMORY[0x1895F87A8];
      id v13 = (void *)&unk_187871000;
      SEL v14 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
      if (v11 && (*(_BYTE *)(v11 + 78) & 1) != 0) {
        goto LABEL_43;
      }
      [v5 code];
      uint64_t v15 = [v5 code];
      __int16 v16 = (__CFString *)objc_alloc_init(NSString);
      objc_msgSend(objc_getProperty(WeakRetained, v17, 208, 1), "scopedInterface");
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v19 = [v18 type];

      if (v19 <= 4)
      {
        SEL v20 = off_18A08D690[v19];

        __int16 v16 = v20;
      }

      id v21 = objc_alloc_init(NSString);
      id v13 = &unk_187871000;
      uint64_t v22 = (unint64_t)(v15 - 3) > 0xA ? @"PluginFailed" : off_18A08D6B8[v15 - 3];
      SEL v14 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;

      *(void *)__int128 buf = v12;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = __64__NEIKEv2PacketTunnelProvider_sendAnalyticsWithDisconnectError___block_invoke;
      SEL v44 = &unk_18A08D5E8;
      id v45 = WeakRetained;
      id v46 = v16;
      id v47 = v22;
      uint64_t v25 = v16;
      AnalyticsSendEventLazy();

      uint64_t v27 = *(void *)(a1 + 32);
      if (v27)
      {
        if ((*(_BYTE *)(v27 + 78) & 1) != 0) {
          goto LABEL_43;
        }
      }

      if ((WeakRetained[77] & 1) != 0) {
        goto LABEL_43;
      }
      if (-[NEIKEv2PacketTunnelProvider tryAlternateServerAddresses](WeakRetained, v26)) {
        goto LABEL_46;
      }
      id v28 = v5;
      BOOL v29 = v28;
      if (*((void *)WeakRetained + 28))
      {
        ne_log_obj();
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = WeakRetained;
          _os_log_impl( &dword_1876B1000,  v30,  OS_LOG_TYPE_DEFAULT,  "%@: Random Port Fallback counter exceeded max retry count",  buf,  0xCu);
        }

        goto LABEL_42;
      }

      if ((WeakRetained[78] & 1) != 0 || [v28 code] != 3)
      {
LABEL_42:

LABEL_43:
        WeakRetained[v14[805]] = 1;
        ne_log_obj();
        dispatch_time_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)&uint8_t buf[4] = WeakRetained;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = 14LL;
          _os_log_impl( &dword_1876B1000,  v39,  OS_LOG_TYPE_DEFAULT,  "%@: stopping tunnel since IKE disconnected %ld",  buf,  0x16u);
        }

        v40[0] = v12;
        v40[1] = v13[187];
        v40[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_106;
        v40[3] = &unk_18A08F098;
        SEL v41 = WeakRetained;
        id v42 = v5;
        -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v41, 14LL, v40);

        goto LABEL_46;
      }

      ne_log_obj();
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = WeakRetained;
        _os_log_impl( &dword_1876B1000,  v31,  OS_LOG_TYPE_DEFAULT,  "%@: Random Port Fallback is enabled, bringing up tunnel with random local port",  buf,  0xCu);
      }

      ++*((void *)WeakRetained + 28);
      id Property = objc_getProperty(WeakRetained, v32, 128LL, 1);
      if (Property)
      {
        uint64_t v35 = objc_getProperty(Property, v34, 24LL, 1);
        if (v35)
        {
          v35[3] = 0LL;
          v35[4] = 0LL;
        }
      }

      else
      {
        uint64_t v35 = 0LL;
      }

      uint64_t v36 = -[NEIKEv2PacketTunnelProvider tunnelBringup](WeakRetained);
      if ((_DWORD)v36)
      {
        id v37 = (const char *)v36;
        ne_log_obj();
        uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412546;
          *(void *)&uint8_t buf[4] = WeakRetained;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = (_DWORD)v37;
          _os_log_error_impl( &dword_1876B1000,  v38,  OS_LOG_TYPE_ERROR,  "%@: Random Port Fallback failed to bringup tunnel, error %d",  buf,  0x12u);
        }

        -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](WeakRetained, v37);
      }
    }
  }

  else
  {
    if (v8)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_INFO, "stateUpdateBlock callback: provider is nil", buf, 2u);
    }
  }

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_108( uint64_t a1,  int a2,  uint64_t a3,  void *a4)
{
  *(void *)&v36[5] = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    if (a2
      && ((id v11 = objc_getProperty(WeakRetained, v9, 240LL, 1),
           -[NEIKEv2Session firstChildSA](v11, v12),
           (id v13 = (_DWORD *)objc_claimAutoreleasedReturnValue()) == 0LL)
        ? (int v14 = 0)
        : (int v14 = v13[4]),
          v13,
          v14 != a2))
    {
      ne_log_obj();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id Property = objc_getProperty((id)v10, v22, 240LL, 1);
        uint64_t v25 = -[NEIKEv2Session firstChildSA](Property, v24);
        unint64_t v26 = (void *)v25;
        if (v25) {
          int v27 = *(_DWORD *)(v25 + 16);
        }
        else {
          int v27 = 0;
        }
        *(_DWORD *)__int128 buf = 138412802;
        uint64_t v34 = v10;
        __int16 v35 = 1024;
        *(_DWORD *)uint64_t v36 = a2;
        v36[2] = 1024;
        *(_DWORD *)&v36[3] = v27;
        _os_log_impl( &dword_1876B1000,  v21,  OS_LOG_TYPE_INFO,  "%@: childStateUpdateBlock callback: childID (%X) mismatched provider childID (%X)",  buf,  0x18u);
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412546;
        uint64_t v34 = v10;
        __int16 v35 = 1024;
        *(_DWORD *)uint64_t v36 = a2;
        _os_log_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_INFO,  "%@: childStateUpdateBlock callback: childID (%X)",  buf,  0x12u);
      }

      if (a3 == 2)
      {
        -[NEIKEv2PacketTunnelProvider setInterfaceAvailability](v10);
        -[NEIKEv2PacketTunnelProvider watchIKESocketChange](v10, v28);
        ne_log_obj();
        BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412290;
          uint64_t v34 = v10;
          _os_log_impl( &dword_1876B1000,  v29,  OS_LOG_TYPE_INFO,  "%@: childStateUpdateBlock callback: got Child Connected",  buf,  0xCu);
        }

        *(_DWORD *)(v10 + 84) |= 2u;
        -[NEIKEv2PacketTunnelProvider startRekeyTimer:]((void *)v10, 0);
        NEIKEv2PacketTunnelHandleConnected((void *)v10);
        *(_BYTE *)(v10 + 78) = 1;
      }

      else if (a3 == 3)
      {
        ne_log_obj();
        __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int128 buf = 138412546;
          uint64_t v34 = v10;
          __int16 v35 = 2112;
          *(void *)uint64_t v36 = v7;
          _os_log_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_INFO,  "%@: childStateUpdateBlock callback: got Child Disconnected (%@)",  buf,  0x16u);
        }

        if ((~*(_DWORD *)(v10 + 84) & 0xF) == 0
          || !-[NEIKEv2PacketTunnelProvider tryAlternateServerAddresses]((_BYTE *)v10, v17))
        {
          *(_BYTE *)(v10 + 77) = 1;
          ne_log_obj();
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412546;
            uint64_t v34 = v10;
            __int16 v35 = 2112;
            *(void *)uint64_t v36 = v7;
            _os_log_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_DEFAULT,  "%@: stopping tunnel since Child disconnected %@",  buf,  0x16u);
          }

          uint64_t v19 = [v7 code];
          else {
            signed int v20 = dword_187872E68[v19 - 3];
          }
          v30[0] = MEMORY[0x1895F87A8];
          v30[1] = 3221225472LL;
          v30[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_109;
          v30[3] = &unk_18A08D3E8;
          id v31 = (id)v10;
          signed int v32 = v20;
          -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v31, v20, v30);
        }
      }
    }
  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_111(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = WeakRetained;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_INFO,  "%@: configurationUpdateBlock callback: %@",  (uint8_t *)&v10,  0x16u);
    }

    WeakRetained[21] |= 4u;
    if (v3) {
      id Property = objc_getProperty(v3, v6, 16LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v8 = Property;
    objc_setProperty_atomic(WeakRetained, v9, v8, 88LL);
  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_113( uint64_t a1,  int a2,  void *a3,  void *a4)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    if (a2
      && ((id v12 = objc_getProperty(WeakRetained, v10, 240LL, 1),
           -[NEIKEv2Session firstChildSA](v12, v13),
           (uint64_t v14 = (_DWORD *)objc_claimAutoreleasedReturnValue()) == 0LL)
        ? (int v15 = 0)
        : (int v15 = v14[4]),
          v14,
          v15 != a2))
    {
      ne_log_obj();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id Property = objc_getProperty(v11, v20, 240LL, 1);
        uint64_t v23 = -[NEIKEv2Session firstChildSA](Property, v22);
        uint64_t v24 = (void *)v23;
        if (v23) {
          int v25 = *(_DWORD *)(v23 + 16);
        }
        else {
          int v25 = 0;
        }
        int v26 = 138412802;
        int v27 = v11;
        __int16 v28 = 1024;
        int v29 = a2;
        __int16 v30 = 1024;
        LODWORD(v31) = v25;
        _os_log_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_INFO,  "%@: trafficSelectorUpdateBlock callback: childID (%X) mismatched provider childID (%X)",  (uint8_t *)&v26,  0x18u);
      }
    }

    else
    {
      ne_log_obj();
      __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v26 = 138413058;
        int v27 = v11;
        __int16 v28 = 1024;
        int v29 = a2;
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2112;
        id v33 = v8;
        _os_log_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_INFO,  "%@: trafficSelectorUpdateBlock callback: childID (%X) - localTrafficSelectors %@ remoteTrafficSelectors %@",  (uint8_t *)&v26,  0x26u);
      }

      v11[21] |= 8u;
      objc_setProperty_atomic(v11, v17, v7, 96LL);
      objc_setProperty_atomic(v11, v18, v8, 104LL);
    }
  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_115(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v32 = WeakRetained;
      __int16 v33 = 2112;
      uint64_t v34 = v3;
      _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_INFO,  "%@: additionalAddressesUpdateBlock callback: %@",  buf,  0x16u);
    }

    uint64_t v6 = v3;
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
      id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      SEL v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:buf count:16];
      if (!v10) {
        goto LABEL_17;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      while (1)
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v14, "addressFamily", (void)v27) == 2)
          {
            [v14 hostname];
            int v15 = (void *)objc_claimAutoreleasedReturnValue();
            __int16 v16 = v7;
          }

          else
          {
            if ([v14 addressFamily] != 30) {
              continue;
            }
            [v14 hostname];
            int v15 = (void *)objc_claimAutoreleasedReturnValue();
            __int16 v16 = v8;
          }

          [v16 addObject:v15];
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:buf count:16];
        if (!v11)
        {
LABEL_17:

          uint64_t v17 = [v7 count];
          id Property = objc_getProperty(WeakRetained, v18, 128LL, 1);
          if (Property)
          {
            if (v17) {
              id v21 = v7;
            }
            else {
              id v21 = 0LL;
            }
            objc_setProperty_atomic(Property, v20, v21, 40LL);
          }

          uint64_t v22 = objc_msgSend(v8, "count", (void)v27);
          id v24 = objc_getProperty(WeakRetained, v23, 128LL, 1);
          if (v24)
          {
            if (v22) {
              int v26 = v8;
            }
            else {
              int v26 = 0LL;
            }
            objc_setProperty_atomic(v24, v25, v26, 48LL);
          }

          goto LABEL_30;
        }
      }
    }

    ne_log_obj();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v32 = WeakRetained;
      __int16 v33 = 2080;
      uint64_t v34 = "-[NEIKEv2PacketTunnelProvider handleAdditionalServerAddressesNotification:]";
      _os_log_impl(&dword_1876B1000, (os_log_t)v7, OS_LOG_TYPE_INFO, "%@: %s: Empty address array", buf, 0x16u);
    }

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_117(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ne_log_obj();
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_INFO, "%@: shortDPDEventBlock callback:", (uint8_t *)&v3, 0xCu);
    }
  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_118(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    ne_log_obj();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)SEL v54 = 138412546;
      *(void *)&v54[4] = WeakRetained;
      *(_WORD *)&v54[12] = 2112;
      *(void *)&v54[14] = v3;
      _os_log_impl(&dword_1876B1000, v5, OS_LOG_TYPE_INFO, "%@: redirectEventBlock callback: %@", v54, 0x16u);
    }

    uint64_t v6 = [WeakRetained protocolConfiguration];
    if (v6)
    {
      id v7 = (void *)v6;
      [WeakRetained protocolConfiguration];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v9 = [v8 disableRedirect];

      if (v9)
      {
        ne_log_obj();
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)SEL v54 = 138412290;
          *(void *)&v54[4] = WeakRetained;
          _os_log_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_INFO,  "%@: redirectEventBlock callback: received redirect but redirect is disabled",  v54,  0xCu);
        }

        goto LABEL_42;
      }
    }

    uint64_t v10 = (os_log_s *)v3;
    if (!v10)
    {
      ne_log_obj();
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412546;
        uint64_t v58 = WeakRetained;
        __int16 v59 = 2080;
        SEL v60 = "-[NEIKEv2PacketTunnelProvider handleRedirectNotification:]";
        _os_log_impl(&dword_1876B1000, v15, OS_LOG_TYPE_INFO, "%@: %s: No redirectServer received", buf, 0x16u);
      }

      goto LABEL_41;
    }

    id Property = objc_getProperty(WeakRetained, v11, 128LL, 1);
    if (!Property)
    {
LABEL_42:

      -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](WeakRetained, (const char *)7);
      goto LABEL_43;
    }

    unsigned int v14 = Property[3] + 1;
    Property[3] = v14;
    if (v14 >= 6)
    {
      ne_log_obj();
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_ERROR,  "Exceeded max redirects in a specific time period",  buf,  2u);
      }

void __58__NEIKEv2PacketTunnelProvider_handleRedirectNotification___block_invoke(uint64_t a1, char a2)
{
  id v3 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    id v4 = (const char *)-[NEIKEv2PacketTunnelProvider tunnelBringup](v3);
    if ((_DWORD)v4) {
      -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), v4);
    }
  }

  else
  {
    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v3, (const char *)0x11);
  }

- (void)resolveServerAddressIfNeeded:(void *)a1
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  -[NEIKEv2PacketTunnelProvider configureProxyPathIfNeeded](a1, v4);
  id Property = objc_getProperty(a1, v5, 128LL, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v7, 56LL, 1);
  }
  id v8 = Property;

  if (v8)
  {
    ne_log_obj();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = objc_getProperty(a1, v11, 128LL, 1);
      if (v12) {
        id v12 = objc_getProperty(v12, v13, 16LL, 1);
      }
      id v14 = v12;
      id v16 = objc_getProperty(a1, v15, 128LL, 1);
      if (v16) {
        id v16 = objc_getProperty(v16, v17, 56LL, 1);
      }
      id v18 = v16;
      int v67 = 138412802;
      uint64_t v68 = a1;
      __int16 v69 = 2112;
      id v70 = v14;
      __int16 v71 = 2112;
      id v72 = v18;
      _os_log_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_INFO,  "%@: skipping resolution as server %@ uses proxy %@",  (uint8_t *)&v67,  0x20u);
    }

LABEL_19:
    v3[2](v3, 1LL);
    goto LABEL_20;
  }

  id v19 = objc_getProperty(a1, v9, 128LL, 1);
  if (v19) {
    id v19 = objc_getProperty(v19, v20, 16LL, 1);
  }
  id v21 = v19;
  char v22 = +[NEIKEv2Helper getIdentifierType:]((uint64_t)&OBJC_CLASS___NEIKEv2Helper, v21);

  if ((v22 & 3) == 1LL)
  {
    ne_log_obj();
    SEL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v67 = 138412290;
      uint64_t v68 = a1;
      _os_log_impl( &dword_1876B1000,  v23,  OS_LOG_TYPE_INFO,  "%@: serverAddress IP address available",  (uint8_t *)&v67,  0xCu);
    }

    id v25 = objc_getProperty(a1, v24, 128LL, 1);
    id v27 = objc_getProperty(a1, v26, 128LL, 1);
    if (v27) {
      id v27 = objc_getProperty(v27, v28, 16LL, 1);
    }
    id v29 = v27;
    id v31 = objc_getProperty(a1, v30, 208LL, 1);
    -[NEIKEv2Server setServerResolvedAddress:path:](v25, v29, v31);

    goto LABEL_19;
  }

  id v32 = _Block_copy(v3);
  __int16 v33 = (void *)a1[24];
  a1[24] = v32;

  SEL v34 = (void *)MEMORY[0x189608DF8];
  id v36 = objc_getProperty(a1, v35, 128LL, 1);
  if (v36) {
    id v36 = objc_getProperty(v36, v37, 16LL, 1);
  }
  id v38 = v36;
  [v34 endpointWithHostname:v38 port:@"500"];
  dispatch_time_t v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(objc_getProperty(a1, v40, 208, 1), "scopedInterface");
    SEL v41 = (void *)objc_claimAutoreleasedReturnValue();
    id v43 = objc_getProperty(a1, v42, 208LL, 1);
    if (v41) {
      [v43 scopedInterface];
    }
    else {
      [v43 interface];
    }
    SEL v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 interfaceName];
    id v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      id v48 = objc_alloc_init(MEMORY[0x189608E10]);
      id v49 = objc_alloc(MEMORY[0x189608E00]);
      objc_msgSend(objc_getProperty(a1, v50, 208, 1), "scopedInterface");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      id v53 = objc_getProperty(a1, v52, 208LL, 1);
      SEL v54 = v53;
      if (v51) {
        [v53 scopedInterface];
      }
      else {
        [v53 interface];
      }
      id v55 = (void *)objc_claimAutoreleasedReturnValue();
      [v55 interfaceName];
      SEL v56 = (void *)objc_claimAutoreleasedReturnValue();
      id v57 = (void *)[v49 initWithInterfaceName:v56];
      [v48 setRequiredInterface:v57];
    }

    else
    {
      id v48 = 0LL;
    }

    [v48 setIgnoreResolverStats:1];
    ne_log_obj();
    uint64_t v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      int v67 = 138412802;
      uint64_t v68 = a1;
      __int16 v69 = 2112;
      id v70 = v39;
      __int16 v71 = 2112;
      id v72 = v48;
      _os_log_impl(&dword_1876B1000, v58, OS_LOG_TYPE_DEFAULT, "%@: Resolving %@ (%@)", (uint8_t *)&v67, 0x20u);
    }

    uint64_t v59 = [objc_alloc(MEMORY[0x189608E28]) initWithEndpoint:v39 parameters:v48];
    SEL v60 = (void *)a1[17];
    a1[17] = v59;

    uint64_t v61 = (void *)a1[17];
    if (v61)
    {
      [a1 context];
      SEL v62 = (void *)objc_claimAutoreleasedReturnValue();
      [v61 addObserver:v62 forKeyPath:@"resolvedEndpoints" options:5 context:0];
    }

    else
    {
      ne_log_obj();
      uint64_t v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        int v67 = 138412290;
        uint64_t v68 = a1;
        _os_log_error_impl( &dword_1876B1000,  v63,  OS_LOG_TYPE_ERROR,  "%@: Failed to create NWResolver",  (uint8_t *)&v67,  0xCu);
      }

      v3[2](v3, 0LL);
    }
  }

  else
  {
    ne_log_obj();
    SEL v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v64 = objc_getProperty(a1, v45, 128LL, 1);
      if (v64) {
        id v64 = objc_getProperty(v64, v65, 16LL, 1);
      }
      id v66 = v64;
      int v67 = 138412546;
      uint64_t v68 = a1;
      __int16 v69 = 2112;
      id v70 = v66;
      _os_log_error_impl( &dword_1876B1000,  v44,  OS_LOG_TYPE_ERROR,  "%@: Failed to create endpoint for resolution, serverAddress %@",  (uint8_t *)&v67,  0x16u);
    }

    v3[2](v3, 0LL);
  }

LABEL_20:
}

- (BOOL)tryAlternateServerAddresses
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = objc_getProperty(a1, a2, 128LL, 1);
  id Property = objc_getProperty(a1, v4, 208LL, 1);
  -[NEIKEv2Server getNextViableServerAddressForPath:](v3, Property);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    ne_log_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 138412802;
      id v12 = a1;
      __int16 v13 = 2080;
      id v14 = "-[NEIKEv2PacketTunnelProvider tryAlternateServerAddresses]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_INFO,  "%@: %s: Alternate server address available (%@), connect again",  buf,  0x20u);
    }

    ne_log_obj();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v12 = a1;
      _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "%@: Stopping tunnel before attempting alternate server address",  buf,  0xCu);
    }

    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke;
    v10[3] = &unk_18A090390;
    v10[4] = a1;
    -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](a1, 0LL, v10);
  }

  return v6 != 0LL;
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_109(uint64_t a1)
{
}

- (void)setInterfaceAvailability
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 120))
  {
    int v2 = socket(30, 2, 0);
    if ((v2 & 0x80000000) == 0)
    {
      int v3 = v2;
      uint64_t v4 = *(void *)(a1 + 120);
      if (v4) {
        SEL v5 = (__CFString *)CFStringCreateWithCString( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const char *)(v4 + 265),  0x600u);
      }
      else {
        SEL v5 = 0LL;
      }
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      uint64_t v6 = v5;
      -[__CFString UTF8String](v6, "UTF8String");
      __strlcpy_chk();
      LOBYTE(v17) = 4;
      BYTE3(v17) = 0;
      int v7 = ioctl(v3, 0xC02069A9uLL, &v16);
      ne_log_obj();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      int v9 = v8;
      if (v7 < 0)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138412546;
          uint64_t v11 = a1;
          __int16 v12 = 2112;
          __int16 v13 = v6;
          _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "%@: Failed to set interface availability for %@",  buf,  0x16u);
        }
      }

      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412802;
        uint64_t v11 = a1;
        __int16 v12 = 2112;
        __int16 v13 = v6;
        __int16 v14 = 1024;
        int v15 = 0;
        _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: Set interface availability on interface %@ to %u (0 implies 'available')",  buf,  0x1Cu);
      }

      close(v3);
    }
  }

- (void)watchIKESocketChange
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id Property = objc_getProperty((id)a1, a2, 240LL, 1);
  if (Property)
  {
    id v5 = objc_getProperty(Property, v4, 336LL, 1);
    int v7 = v5;
    if (v5) {
      id v5 = objc_getProperty(v5, v6, 64LL, 1);
    }
  }

  else
  {
    int v7 = 0LL;
    id v5 = 0LL;
  }

  id v8 = v5;

  id v10 = objc_getProperty((id)a1, v9, 240LL, 1);
  if (v10)
  {
    id v12 = objc_getProperty(v10, v11, 336LL, 1);
    __int16 v14 = v12;
    if (v12) {
      id v12 = objc_getProperty(v12, v13, 72LL, 1);
    }
  }

  else
  {
    __int16 v14 = 0LL;
    id v12 = 0LL;
  }

  id v15 = v12;

  if (objc_getProperty((id)a1, v16, 272LL, 1))
  {
    objc_msgSend(objc_getProperty((id)a1, v17, 272, 1), "removeObserver:forKeyPath:", a1, @"path");
    objc_setProperty_atomic((id)a1, v18, 0LL, 272LL);
  }

  if (*(void *)(a1 + 248))
  {
    if (v8)
    {
      if (v15)
      {
        if ((*(_BYTE *)(a1 + 74) & 1) == 0
          || (id v19 = (os_unfair_lock_s *)objc_getProperty((id)a1, v17, 232LL, 1),
              (-[NEIKEv2CompanionDatapath connected](v19) & 1) == 0))
        {
          ne_log_obj();
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(objc_getProperty((id)a1, v21, 208, 1), "scopedInterface");
            id v27 = (void *)objc_claimAutoreleasedReturnValue();
            id v29 = objc_getProperty((id)a1, v28, 208LL, 1);
            SEL v30 = v29;
            if (v27) {
              [v29 scopedInterface];
            }
            else {
              [v29 interface];
            }
            id v31 = (void *)objc_claimAutoreleasedReturnValue();
            int v32 = 136315906;
            __int16 v33 = "-[NEIKEv2PacketTunnelProvider watchIKESocketChange]";
            __int16 v34 = 2048;
            uint64_t v35 = [v31 interfaceIndex];
            __int16 v36 = 2112;
            id v37 = v8;
            __int16 v38 = 2112;
            id v39 = v15;
            _os_log_debug_impl( &dword_1876B1000,  v20,  OS_LOG_TYPE_DEBUG,  "%s: IKE is scoped on ifIndex %ld (local address %@, remote address %@)\n",  (uint8_t *)&v32,  0x2Au);
          }

          id v22 = objc_alloc_init(MEMORY[0x189608E10]);
          SEL v23 = (void *)[objc_alloc(MEMORY[0x189608E00]) initWithInterfaceIndex:*(void *)(a1 + 248)];
          [v22 setRequiredInterface:v23];

          [v22 setLocalAddress:v8];
          SEL v24 = (void *)[objc_alloc(MEMORY[0x189608E20]) initWithEndpoint:v15 parameters:v22];
          objc_setProperty_atomic((id)a1, v25, v24, 272LL);

          objc_msgSend( objc_getProperty((id)a1, v26, 272, 1),  "addObserver:forKeyPath:options:context:",  a1,  @"path",  5,  0);
        }
      }
    }
  }
}

- (void)startRekeyTimer:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  [a1 protocolConfiguration];
  uint64_t v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    char v5 = v4[247];

    if ((v5 & 1) != 0)
    {
      ne_log_obj();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = "CHILD";
        if (a2) {
          int v7 = "IKE";
        }
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_1876B1000, v6, OS_LOG_TYPE_INFO, "%@: startRekeyTimer (%s)", buf, 0x16u);
      }

      id v8 = (_DWORD *)a1[19];
      if (!v8)
      {
        SEL v9 = objc_alloc(&OBJC_CLASS___NEIKEv2Rekey);
        [a1 description];
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          *(void *)__int128 buf = v9;
          *(void *)&buf[8] = &OBJC_CLASS___NEIKEv2Rekey;
          id v11 = objc_msgSendSuper2((objc_super *)buf, sel_init);
          if (v11)
          {
            id v12 = v11;
            __int16 v13 = (void *)[v10 copy];
            objc_setProperty_atomic(v12, v14, v13, 32LL);
          }

          else
          {
            ne_log_obj();
            __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)SEL v23 = 0;
              _os_log_fault_impl(&dword_1876B1000, (os_log_t)v13, OS_LOG_TYPE_FAULT, "[super init] failed", v23, 2u);
            }

            id v12 = 0LL;
          }
        }

        else
        {
          id v12 = 0LL;
        }

        id v15 = (void *)a1[19];
        a1[19] = v12;

        id v8 = (_DWORD *)a1[19];
      }

      [a1 protocolConfiguration];
      SEL v16 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v17 = v16;
      if (a2)
      {
        [v16 IKESecurityAssociationParameters];
        SEL v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v19 = [v18 lifetimeMinutes];
        v22[0] = MEMORY[0x1895F87A8];
        v22[1] = 3221225472LL;
        v22[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke;
        v22[3] = &unk_18A090390;
        v22[4] = a1;
        -[NEIKEv2Rekey startIKETimer:timeoutHandler:](v8, v19, v22);
      }

      else
      {
        [v16 childSecurityAssociationParameters];
        SEL v18 = (void *)objc_claimAutoreleasedReturnValue();
        int v20 = [v18 lifetimeMinutes];
        v21[0] = MEMORY[0x1895F87A8];
        v21[1] = 3221225472LL;
        v21[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_149;
        v21[3] = &unk_18A090390;
        v21[4] = a1;
        -[NEIKEv2Rekey startChildTimer:timeoutHandler:](v8, v20, v21);
      }
    }
  }

  else
  {
  }

void __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(dispatch_queue_s **)(a1 + 32);
  if (Property)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(Property, a2, 264LL, 1);
    uint64_t v4 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2;
  block[3] = &unk_18A090390;
  block[4] = v4;
  dispatch_async(Property, block);
}

void __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_149(uint64_t a1, const char *a2)
{
  id Property = *(dispatch_queue_s **)(a1 + 32);
  if (Property)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(Property, a2, 264LL, 1);
    uint64_t v4 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2_150;
  block[3] = &unk_18A090390;
  block[4] = v4;
  dispatch_async(Property, block);
}

void __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2_150(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (*(_BYTE *)(v2 + 77) & 1) == 0)
  {
    ne_log_obj();
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v20 = 138412290;
      uint64_t v21 = v4;
      _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "%@: REKEYING CHILD", (uint8_t *)&v20, 0xCu);
    }

    uint64_t v6 = *(void **)(a1 + 32);
    if (v6)
    {
      id v7 = objc_getProperty(v6, v5, 240LL, 1);
      if (v7)
      {
        id v9 = v7;
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v8, 240LL, 1);
        }
        -[NEIKEv2Session firstChildSA](Property, v8);
        id v11 = (_DWORD *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          int v12 = v11[4];

          if (!v12) {
            return;
          }
          id v14 = *(id *)(a1 + 32);
          if (v14) {
            id v14 = objc_getProperty(v14, v13, 240LL, 1);
          }
          id v9 = v14;
          id v16 = *(id *)(a1 + 32);
          if (v16) {
            id v16 = objc_getProperty(v16, v15, 240LL, 1);
          }
          uint64_t v17 = -[NEIKEv2Session firstChildSA](v16, v15);
          SEL v18 = (void *)v17;
          if (v17) {
            uint64_t v19 = *(unsigned int *)(v17 + 16);
          }
          else {
            uint64_t v19 = 0LL;
          }
          [v9 forceRekeyChild:v19];
        }

        else
        {
          SEL v18 = 0LL;
        }
      }
    }
  }

void *__47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2(void *result)
{
  uint64_t v1 = result;
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v2 = result[4];
  if (!v2 || (*(_BYTE *)(v2 + 77) & 1) == 0)
  {
    ne_log_obj();
    int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = v1[4];
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "%@: REKEYING IKE", (uint8_t *)&v8, 0xCu);
    }

    uint64_t result = (void *)v1[4];
    if (result)
    {
      uint64_t result = objc_getProperty(result, v5, 240LL, 1);
      if (result)
      {
        id Property = (id)v1[4];
        if (Property) {
          id Property = objc_getProperty(Property, v6, 240LL, 1);
        }
        return (void *)[Property forceRekeyIKE];
      }
    }
  }

  return result;
}

void __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(dispatch_queue_s **)(a1 + 32);
  if (Property)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(Property, a2, 264LL, 1);
    uint64_t v4 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke_2;
  block[3] = &unk_18A090390;
  block[4] = v4;
  dispatch_async(Property, block);
}

void __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v16 = 138412290;
    uint64_t v17 = v3;
    _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEFAULT,  "%@: Bringing up tunnel with alternate server address",  (uint8_t *)&v16,  0xCu);
  }

  char v5 = objc_alloc(&OBJC_CLASS___NEIKEv2MOBIKE);
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id Property = objc_getProperty(v6, v4, 264LL, 1);
    int v8 = *(void **)(a1 + 32);
  }

  else
  {
    int v8 = 0LL;
    id Property = 0LL;
  }

  uint64_t v10 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v5->super.isa, Property, v8);
  id v11 = *(void **)(a1 + 32);
  if (v11) {
    objc_setProperty_atomic(v11, v9, v10, 168LL);
  }

  uint64_t v12 = -[NEIKEv2PacketTunnelProvider tunnelBringup](*(void *)(a1 + 32));
  if ((_DWORD)v12)
  {
    __int16 v13 = (const char *)v12;
    ne_log_obj();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138412546;
      uint64_t v17 = v15;
      __int16 v18 = 2080;
      uint64_t v19 = "-[NEIKEv2PacketTunnelProvider tryAlternateServerAddresses]_block_invoke";
      _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "%@: %s: Failed tunnel Bringup with alternate server address",  (uint8_t *)&v16,  0x16u);
    }

    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), v13);
  }

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_106(uint64_t a1)
{
  uint64_t v1 = *(_BYTE **)(a1 + 32);
  unint64_t v2 = [*(id *)(a1 + 40) code] - 3;
  if (v2 > 0xC) {
    uint64_t v3 = 3LL;
  }
  else {
    uint64_t v3 = dword_187872E68[v2];
  }
  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v1, (const char *)v3);
}

id __64__NEIKEv2PacketTunnelProvider_sendAnalyticsWithDisconnectError___block_invoke(void *a1)
{
  v15[4] = *MEMORY[0x1895F89C0];
  v14[0] = @"tunnelType";
  unint64_t v2 = (__CFString *)a1[4];
  if (v2)
  {
    uint64_t info = v2[6].info;
    uint64_t v4 = &stru_18A0915E8;
    if (info == 2) {
      uint64_t v4 = @"Fallback Tunnel";
    }
    if (info == 1) {
      unint64_t v2 = @"Primary Tunnel";
    }
    else {
      unint64_t v2 = (__CFString *)v4;
    }
  }

  uint64_t v6 = v2;
  v15[0] = v6;
  v14[1] = @"serverAddress";
  id Property = (id)a1[4];
  if (Property)
  {
    id Property = objc_getProperty(Property, v5, 128LL, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v8, 16LL, 1);
    }
  }

  id v9 = Property;
  uint64_t v10 = a1[5];
  uint64_t v11 = a1[6];
  v15[1] = v9;
  v15[2] = v10;
  v14[2] = @"interface";
  v14[3] = @"failReason";
  v15[3] = v11;
  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:4];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)handleCompanionProxyDatapathFailure:(void *)a1
{
  id Property = (dispatch_queue_s *)objc_getProperty(a1, a2, 264LL, 1);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __67__NEIKEv2PacketTunnelProvider_handleCompanionProxyDatapathFailure___block_invoke;
  v5[3] = &unk_18A08D530;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_async(Property, v5);
}

void __67__NEIKEv2PacketTunnelProvider_handleCompanionProxyDatapathFailure___block_invoke( uint64_t a1,  const char *a2)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3 || !objc_getProperty(v3, a2, 232LL, 1))
  {
    ne_log_obj();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int128 buf = 0;
      __int16 v13 = "no companion proxy path present, ignoring";
      goto LABEL_14;
    }

void __67__NEIKEv2PacketTunnelProvider_handleCompanionProxyDatapathFailure___block_invoke_133(uint64_t a1)
{
}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (a2)
  {
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v5, 264LL, 1);
    }
    else {
      id Property = 0LL;
    }
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_2;
    block[3] = &unk_18A08FAC8;
    uint64_t v8 = (dispatch_queue_s *)Property;
    objc_copyWeak(&v11, v3);
    dispatch_async(v8, block);

    objc_destroyWeak(&v11);
  }

  else
  {
    [WeakRetained setReasserting:0];
    -[NEIKEv2PacketTunnelProvider invokeStartTunnelCompletionHandler:]((uint64_t)v6, 0LL);
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      __int16 v13 = v6;
      _os_log_impl(&dword_1876B1000, v9, OS_LOG_TYPE_DEFAULT, "%@: Tunnel Status: UP", buf, 0xCu);
    }
  }
}

- (BOOL)NEIKEv2ProviderAuthenticate:(_BYTE *)a1
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = v3;
  BOOL v5 = 1LL;
  if ((a1[80] & 1) == 0)
  {
    a1[80] = 1;
    if ((isa_nsdictionary(v3) & 1) != 0)
    {
      NEResourcesCopyLocalizedNSString(@"VPN_HEADER", @"VPN_HEADER");
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
      NEResourcesCopyLocalizedNSString(@"PROMPT_REQUEST_AUTH", @"PROMPT_REQUEST_AUTH");
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x189605688]];

      NEResourcesCopyLocalizedNSString(@"PASSWORD", @"PASSWORD");
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = v9;
      [MEMORY[0x189603F18] arrayWithObjects:&v22 count:1];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1896056B0]];

      [v7 setObject:&unk_18A0CFD48 forKeyedSubscript:*MEMORY[0x1896056B8]];
      [v7 setObject:&unk_18A0CFD60 forKeyedSubscript:@"SBUserNotificationTextAutocapitalizationType"];
      [v7 setObject:&unk_18A0CFD78 forKeyedSubscript:@"SBUserNotificationTextAutocorrectionType"];
      objc_msgSend(objc_getProperty(a1, v11, 216, 1), "cancel");
      uint64_t v12 = objc_alloc(&OBJC_CLASS___NEUserNotification);
      id Property = objc_getProperty(a1, v13, 264LL, 1);
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __59__NEIKEv2PacketTunnelProvider_NEIKEv2ProviderAuthenticate___block_invoke;
      v19[3] = &unk_18A08D5C0;
      id v20 = v4;
      uint64_t v21 = a1;
      id v15 = -[NEUserNotification initAndShowAuthenticationWithHeader:options:flags:callbackQueue:callbackHandler:]( v12,  "initAndShowAuthenticationWithHeader:options:flags:callbackQueue:callbackHandler:",  v6,  v7,  0x10000LL,  Property,  v19);
      objc_setProperty_atomic(a1, v16, v15, 216LL);

      BOOL v5 = objc_getProperty(a1, v17, 216LL, 1) != 0LL;
    }

    else
    {
      ne_log_obj();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v24 = a1;
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "%@: Calling NEIKEv2ProviderAuthenticate with non-nsdictionary tunnelOptions",  buf,  0xCu);
      }

      BOOL v5 = 0LL;
    }
  }

  return v5;
}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_93(uint64_t a1, char a2)
{
  id v3 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    uint64_t v4 = (const char *)-[NEIKEv2PacketTunnelProvider tunnelBringup]((uint64_t)v3);
    if ((_DWORD)v4) {
      -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), v4);
    }
  }

  else
  {
    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v3, (const char *)0xA);
  }

void __59__NEIKEv2PacketTunnelProvider_NEIKEv2ProviderAuthenticate___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc(NSString);
    [v4 objectAtIndexedSubscript:0];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = (void *)[v5 initWithString:v6];

    [*(id *)(a1 + 32) setValue:v7 forKey:@"Password"];
    -[NEIKEv2PacketTunnelProvider startIKEv2TunnelWithOptions:](*(void *)(a1 + 40), *(void *)(a1 + 32));
  }

  else
  {
    ne_log_obj();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "%@: Cancel IKEv2 tunnel, no password entered",  (uint8_t *)&v11,  0xCu);
    }

    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 40), (const char *)0x17);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    *(_BYTE *)(v9 + 80) = 0;
  }
}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ne_log_obj();
  unint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v7 = WeakRetained;
    _os_log_error_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_ERROR,  "%@: Stopping tunnel due to set tunnel network settings failed",  buf,  0xCu);
  }

  if (WeakRetained) {
    WeakRetained[77] = 1;
  }
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_87;
  v4[3] = &unk_18A090390;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v3, 9LL, v4);
}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_87(uint64_t a1)
{
}

void __54__NEIKEv2PacketTunnelProvider_handleDefaultPathChange__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    ne_log_obj();
    unint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_INFO, "received keepalive response", v3, 2u);
    }
  }

void __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unint64_t v2 = WeakRetained;
    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](WeakRetained, 0LL);
    id WeakRetained = v2;
  }
}

void __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke_142(uint64_t a1, char a2)
{
  id v3 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    id v4 = (const char *)-[NEIKEv2PacketTunnelProvider tunnelBringup]((uint64_t)v3);
    if ((_DWORD)v4) {
      -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(a1 + 32), v4);
    }
  }

  else
  {
    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v3, (const char *)0x11);
  }

void __77__NEIKEv2PacketTunnelProvider_observerHelperHandler_ofObject_change_context___block_invoke( uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && (*(_BYTE *)(v1 + 77) & 1) == 0 && *(void *)(v1 + 136))
  {
    ne_log_obj();
    unint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(v1 + 136) resolvedEndpoints];
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = [v3 count];
      uint64_t v5 = [*(id *)(v1 + 136) status];
      uint64_t v6 = "In progress";
      *(_DWORD *)__int128 buf = 138412802;
      uint64_t v69 = v1;
      if (v5 == 2) {
        uint64_t v6 = "Complete";
      }
      __int16 v70 = 2048;
      uint64_t v71 = v4;
      __int16 v72 = 2080;
      uint64_t v73 = v6;
      _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEFAULT,  "%@: handleDNSResolution (resolvedEndpoints count %lu) (query status %s)",  buf,  0x20u);
    }

    [*(id *)(v1 + 136) resolvedEndpoints];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v10 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
      id Property = objc_getProperty((id)v1, v9, 128LL, 1);
      if (Property) {
        id Property = objc_getProperty(Property, v12, 16LL, 1);
      }
      id v55 = Property;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      [*(id *)(v1 + 136) resolvedEndpoints];
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:buf count:16];
      if (v13)
      {
        uint64_t v15 = v13;
        char v16 = 0;
        uint64_t v17 = *(void *)v60;
        *(void *)&__int128 v14 = 138413314LL;
        __int128 v54 = v14;
        __int16 v18 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
        do
        {
          uint64_t v19 = 0LL;
          uint64_t v57 = v15;
          do
          {
            if (*(void *)v60 != v17) {
              objc_enumerationMutation(obj);
            }
            id v20 = *(void **)(*((void *)&v59 + 1) + 8 * v19);
            ne_log_obj();
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              uint64_t v22 = v17;
              SEL v23 = v10;
              if ([v20 addressFamily] == 2) {
                id v24 = "IPv4";
              }
              else {
                id v24 = "IPv6";
              }
              objc_msgSend(v20, "hostname", v54);
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
              [v20 port];
              SEL v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)uint64_t v63 = v54;
              *(void *)&v63[4] = v1;
              *(_WORD *)&v63[12] = 2112;
              *(void *)&v63[14] = v55;
              *(_WORD *)&v63[22] = 2080;
              id v64 = v24;
              uint64_t v10 = v23;
              uint64_t v17 = v22;
              uint64_t v15 = v57;
              *(_WORD *)id v65 = 2112;
              *(void *)&v65[2] = v25;
              __int16 v66 = 2112;
              int v67 = v26;
              _os_log_impl(&dword_1876B1000, v21, OS_LOG_TYPE_INFO, "%@: Resolved %@: %s address %@:%@", v63, 0x34u);

              __int16 v18 = &OBJC_IVAR___NEConfigurationManager__hasVPNAPIEntitlement;
            }

            int v27 = *(void **)(v1 + v10[796]);
            [v20 hostname];
            SEL v28 = (void *)objc_claimAutoreleasedReturnValue();
            id v30 = objc_getProperty((id)v1, v29, v18[808], 1);
            -[NEIKEv2Server setServerResolvedAddress:path:](v27, v28, v30);

            v16 |= [v20 addressFamily] == 30;
            ++v19;
          }

          while (v15 != v19);
          uint64_t v15 = [obj countByEnumeratingWithState:&v59 objects:buf count:16];
        }

        while (v15);
      }

      else
      {
        char v16 = 0;
      }

      if (objc_getProperty((id)v1, v37, 192LL, 1))
      {
        if ((v16 & 1) != 0 || [*(id *)(v1 + 136) status] == 2)
        {
          if (objc_getProperty((id)v1, v38, 144LL, 1))
          {
            uint64_t v40 = (dispatch_source_s *)objc_getProperty((id)v1, v39, 144LL, 1);
            dispatch_source_cancel(v40);
            objc_setProperty_atomic((id)v1, v41, 0LL, 144LL);
          }

          __int16 v42 = (void (**)(id, uint64_t))objc_getProperty((id)v1, v39, 192LL, 1);
          v42[2](v42, 1LL);
          objc_setProperty_atomic_copy((id)v1, v43, 0LL, 192LL);
        }

        else if (!objc_getProperty((id)v1, v38, 144LL, 1))
        {
          id v48 = (dispatch_queue_s *)objc_getProperty((id)v1, v47, 264LL, 1);
          *(void *)uint64_t v63 = MEMORY[0x1895F87A8];
          *(void *)&v63[8] = 3221225472LL;
          *(void *)&v63[16] = __50__NEIKEv2PacketTunnelProvider_handleDNSResolution__block_invoke;
          id v64 = (const char *)&unk_18A090390;
          *(void *)id v65 = v1;
          NECreateTimerSource(v48, 1LL, v63);
          id v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic((id)v1, v50, v49, 144LL);
        }
      }

      if (objc_msgSend(*(id *)(v1 + 136), "status", v54) == 2)
      {
        uint64_t v44 = *(void **)(v1 + 136);
        [(id)v1 context];
        SEL v45 = (void *)objc_claimAutoreleasedReturnValue();
        [v44 removeObserver:v45 forKeyPath:@"resolvedEndpoints"];

        SEL v46 = *(void **)(v1 + 136);
        *(void *)(v1 + 136) = 0LL;
      }
    }

    else if ([*(id *)(v1 + 136) status] == 2)
    {
      ne_log_obj();
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v51 = objc_getProperty((id)v1, v32, 128LL, 1);
        if (v51) {
          id v51 = objc_getProperty(v51, v52, 16LL, 1);
        }
        id v53 = v51;
        *(_DWORD *)__int128 buf = 138412546;
        uint64_t v69 = v1;
        __int16 v70 = 2112;
        uint64_t v71 = (uint64_t)v53;
        _os_log_error_impl(&dword_1876B1000, v31, OS_LOG_TYPE_ERROR, "%@: Failed to resolve %@", buf, 0x16u);
      }

      __int16 v33 = *(void **)(v1 + 136);
      [(id)v1 context];
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v33 removeObserver:v34 forKeyPath:@"resolvedEndpoints"];

      id v35 = *(void **)(v1 + 136);
      *(void *)(v1 + 136) = 0LL;

      uint64_t v36 = *(void *)(v1 + 192);
      if (v36)
      {
        (*(void (**)(uint64_t, void))(v36 + 16))(v36, 0LL);
        SEL v56 = *(void **)(v1 + 192);
        *(void *)(v1 + 192) = 0LL;
      }
    }
  }

void __50__NEIKEv2PacketTunnelProvider_handleDNSResolution__block_invoke(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (!v3) {
    return;
  }
  if (!objc_getProperty(v3, a2, 144LL, 1)) {
    goto LABEL_7;
  }
  id Property = *(dispatch_source_s **)(a1 + 32);
  if (Property) {
    id Property = (dispatch_source_s *)objc_getProperty(Property, v4, 144LL, 1);
  }
  dispatch_source_cancel(Property);
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_setProperty_atomic(v7, v6, 0LL, 144LL);
LABEL_7:
    uint64_t v8 = *(void **)(a1 + 32);
    if (v8 && objc_getProperty(v8, v4, 192LL, 1))
    {
      id v10 = *(id *)(a1 + 32);
      if (v10) {
        id v10 = objc_getProperty(v10, v9, 192LL, 1);
      }
      (*((void (**)(id, uint64_t))v10 + 2))(v10, 1LL);
      uint64_t v12 = *(void **)(a1 + 32);
      if (v12) {
        objc_setProperty_atomic_copy(v12, v11, 0LL, 192LL);
      }
    }
  }

void __35__NEIKEv2PacketTunnelProvider_wake__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(_BYTE *)(v2 + 77) & 1) == 0)
  {
    if (!objc_getProperty(*(id *)(a1 + 32), a2, 240LL, 1))
    {
      ne_log_obj();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(void *)((char *)&v29 + 4) = v2;
        _os_log_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_INFO,  "%@: Wake_up: Session down, ignore WakeUp",  (uint8_t *)&v29,  0xCu);
      }

      goto LABEL_29;
    }

    id v4 = objc_getProperty((id)v2, v3, 128LL, 1);
    id Property = objc_getProperty((id)v2, v5, 208LL, 1);
    -[NEIKEv2Server getViableServerAddressForPath:](v4, Property);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if ((*(_BYTE *)(v2 + 79) & 1) != 0)
    {
      [(id)v2 protocolConfiguration];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      char v16 = [v15 disableMOBIKERetryOnWake] != 0;

      id v18 = objc_getProperty((id)v2, v17, 168LL, 1);
      uint64_t v19 = *(void **)(v2 + 248);
      id v20 = v18;
      uint64_t v22 = objc_msgSend(objc_getProperty((id)v2, v21, 208, 1), "status");
      -[NEIKEv2MOBIKE initiateMOBIKE:pathStatus:serverAddress:earlyDisconnect:]((uint64_t)v20, v19, v22, v7, v16);

      ne_log_obj();
      SEL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(void *)((char *)&v29 + 4) = v2;
        id v24 = "%@: Waking, kick off MOBIKE";
LABEL_18:
        _os_log_impl(&dword_1876B1000, v23, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v29, 0xCu);
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(void *)((char *)&v29 + 4) = v2;
        _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_INFO, "%@: Waking, kick off DPD", (uint8_t *)&v29, 0xCu);
      }

      [(id)v2 protocolConfiguration];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      unint64_t v10 = [v9 deadPeerDetectionRate];
      char v11 = *(_BYTE *)(v2 + 76);
      objc_opt_self();
      if (v10 < 2)
      {
        uint64_t v13 = 5LL;
        uint64_t v25 = 1000LL;
LABEL_28:

        id v27 = objc_getProperty((id)v2, v26, 240LL, 1);
        uint64_t v28 = *(void *)(v2 + 264);
        *(void *)&__int128 v29 = MEMORY[0x1895F87A8];
        *((void *)&v29 + 1) = 3221225472LL;
        id v30 = __40__NEIKEv2PacketTunnelProvider_wakeIKEv2__block_invoke;
        uint64_t v31 = &unk_18A08D468;
        uint64_t v32 = v2;
        [v27 sendKeepaliveWithRetries:v13 retryIntervalInMilliseconds:v25 callbackQueue:v28 callback:&v29];
        goto LABEL_29;
      }

      if (v10 == 3)
      {
        BOOL v12 = (v11 & 1) == 0;
        if ((v11 & 1) != 0) {
          uint64_t v13 = 1LL;
        }
        else {
          uint64_t v13 = 3LL;
        }
        uint64_t v14 = 3000LL;
        goto LABEL_25;
      }

      if (v10 == 2)
      {
        BOOL v12 = (v11 & 1) == 0;
        if ((v11 & 1) != 0) {
          uint64_t v13 = 1LL;
        }
        else {
          uint64_t v13 = 5LL;
        }
        uint64_t v14 = 5000LL;
LABEL_25:
        if (v12) {
          uint64_t v25 = 1000LL;
        }
        else {
          uint64_t v25 = v14;
        }
        goto LABEL_28;
      }

      ne_log_obj();
      SEL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(void *)((char *)&v29 + 4) = v2;
        id v24 = "%@: Wake_up: failed to get DPD attributes";
        goto LABEL_18;
      }
    }

LABEL_29:
  }

void __40__NEIKEv2PacketTunnelProvider_wakeIKEv2__block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        uint64_t v7 = *(void *)(v6 + 248);
      }
      else {
        uint64_t v7 = 0LL;
      }
      int v11 = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      uint64_t v8 = "%@: Wake_up: [%lu] WakeUP: DPD succeeded";
LABEL_10:
      _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v11, 0x16u);
    }
  }

  else if (v5)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v10 = *(void *)(v9 + 248);
    }
    else {
      uint64_t v10 = 0LL;
    }
    int v11 = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2048;
    uint64_t v14 = v10;
    uint64_t v8 = "%@: Wake_up: [%lu] WakeUP: DPD failed";
    goto LABEL_10;
  }
}

void __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    *(_BYTE *)(v1 + 77) = 1;
    uint64_t v2 = *(_BYTE **)(a1 + 32);
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke_2;
  v4[3] = &unk_18A0908C8;
  void v4[4] = v2;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v2, v3, v4);
}

uint64_t __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __72__NEIKEv2PacketTunnelProvider_startTunnelWithOptions_completionHandler___block_invoke( uint64_t a1,  const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    *(_BYTE *)(v3 + 77) = 0;
    id v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_setProperty_atomic_copy(v4, a2, *(id *)(a1 + 48), 176LL);
      id v4 = *(void **)(a1 + 32);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  -[NEIKEv2PacketTunnelProvider startIKEv2TunnelWithOptions:]((uint64_t)v4, *(void **)(a1 + 40));
}

@end