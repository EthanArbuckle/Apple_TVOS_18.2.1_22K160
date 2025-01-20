@interface NEAgentTunnelExtension
- (id)driverInterface;
- (id)managerInterface;
- (void)attachIPCWithCompletionHandler:(id)a3;
- (void)connectWithParameters:(id)a3;
- (void)disconnectWithReason:(int)a3;
- (void)extension:(id)a3 didRequestSocket:(BOOL)a4 interface:(id)a5 local:(id)a6 remote:(id)a7 effectivePID:(int)a8 completionHandler:(id)a9;
- (void)extension:(id)a3 didSetStatus:(int64_t)a4;
- (void)extension:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5;
- (void)extension:(id)a3 didStartWithError:(id)a4;
- (void)extensionDidDetachIPC:(id)a3;
- (void)handleAppsUninstalled:(id)a3;
- (void)handleAppsUpdateBegins:(id)a3;
- (void)handleAppsUpdateEnding:(id)a3;
- (void)handleAppsUpdateEnds:(id)a3;
- (void)handleCancel;
- (void)handleExtensionStartedWithCompletionHandler:(id)a3;
- (void)sendExtensionFailed;
- (void)sendStatus:(void *)a3 withDisconnectError:;
@end

@implementation NEAgentTunnelExtension

- (void)handleCancel
{
  if (self) {
    self->_cancelCalled = 1;
  }
  -[NEAgentExtension sessionContext](self, "sessionContext");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 stopWithReason:42];
}

- (void)handleAppsUninstalled:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = -[NEAgentExtension pluginType](self, "pluginType");
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[NEAgentExtension pluginType](self, "pluginType");
    int v8 = [v4 containsObject:v7];

    if (v8)
    {
      ne_log_obj();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[NEAgentExtension pluginType](self, "pluginType");
        int v12 = 138412290;
        v13 = v10;
        _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEFAULT,  "App for plugin type %@ has been uninstalled, stopping",  (uint8_t *)&v12,  0xCu);
      }
      v11 = -[NEAgentExtension sessionContext](self, "sessionContext");
      [v11 stopWithReason:6];
    }
  }
}

- (void)handleAppsUpdateBegins:(id)a3
{
  id v4 = a3;
  -[NEAgentExtension queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __49__NEAgentTunnelExtension_handleAppsUpdateBegins___block_invoke;
  v7[3] = &unk_18A08F098;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleAppsUpdateEnding:(id)a3
{
  id v4 = a3;
  -[NEAgentExtension queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __49__NEAgentTunnelExtension_handleAppsUpdateEnding___block_invoke;
  v7[3] = &unk_18A08F098;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleAppsUpdateEnds:(id)a3
{
  id v4 = a3;
  -[NEAgentExtension queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__NEAgentTunnelExtension_handleAppsUpdateEnds___block_invoke;
  v7[3] = &unk_18A08F098;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)managerInterface
{
  if (managerInterface_onceToken != -1) {
    dispatch_once(&managerInterface_onceToken, &__block_literal_global_6845);
  }
  return (id)managerInterface_managerInterface;
}

- (id)driverInterface
{
  if (driverInterface_onceToken_6837 != -1) {
    dispatch_once(&driverInterface_onceToken_6837, &__block_literal_global_9);
  }
  return (id)driverInterface_driverInterface_6838;
}

- (void)connectWithParameters:(id)a3
{
  id v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 count]) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __48__NEAgentTunnelExtension_connectWithParameters___block_invoke;
  v7[3] = &unk_18A0907E8;
  v7[4] = self;
  [v5 startWithOptions:v6 completionHandler:v7];
}

- (void)disconnectWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 stopWithReason:v3];
}

- (void)attachIPCWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 establishIPCWithCompletionHandler:v4];
}

- (void)extension:(id)a3 didStartWithError:(id)a4
{
  if (a4)
  {
    uint64_t v4 = 0LL;
    id v5 = a4;
  }

  else
  {
    uint64_t v4 = 4LL;
    id v5 = 0LL;
  }

  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](self, v4, v5);
}

- (void)extension:(id)a3 didSetStatus:(int64_t)a4
{
}

- (void)extension:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = -[NEAgentExtension managerObjectFactory](self, "managerObjectFactory");
  [v9 managerObject];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke;
  v12[3] = &unk_18A090968;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 setTunnelNetworkSettings:v8 completionHandler:v12];
}

- (void)extensionDidDetachIPC:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 managerObject];
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [v4 handleIPCDetached];
}

- (void)extension:(id)a3 didRequestSocket:(BOOL)a4 interface:(id)a5 local:(id)a6 remote:(id)a7 effectivePID:(int)a8 completionHandler:(id)a9
{
  BOOL v12 = a4;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = (void (**)(id, void))a9;
  ne_log_obj();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v20)
    {
      int v27 = 138412290;
      v28 = self;
      _os_log_debug_impl(&dword_1876B1000, v19, OS_LOG_TYPE_DEBUG, "%@: Getting IKE Socket", (uint8_t *)&v27, 0xCu);
    }

    if (!v15 || !v16 || !v17)
    {
      ne_log_obj();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v27 = 138412290;
        v28 = self;
        v26 = "%@: Failed to get IKE Socket, null local/remote address or interface name";
        goto LABEL_21;
      }

- (void)handleExtensionStartedWithCompletionHandler:(id)a3
{
}

- (void)sendExtensionFailed
{
  id v3 = (id)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"NEAgentErrorDomain" code:1 userInfo:0];
  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](self, 0LL, v3);
}

- (void)sendStatus:(void *)a3 withDisconnectError:
{
  if (a1)
  {
    id v5 = a3;
    [a1 managerObjectFactory];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 managerObject];
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [v7 setStatus:a2 error:v5];
  }

void __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEFAULT, "%@: setTunnelNetworkSettings done", buf, 0xCu);
  }

  if (*(void *)(a1 + 40))
  {
    ne_log_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v7;
      _os_log_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEFAULT,  "%@: setTunnelNetworkSettings calling completionHandler",  buf,  0xCu);
    }

    [*(id *)(a1 + 32) queue];
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_34;
    v9[3] = &unk_18A0908C8;
    id v11 = *(id *)(a1 + 40);
    id v10 = v3;
    dispatch_async(v8, v9);
  }
}

uint64_t __80__NEAgentTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_34( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __48__NEAgentTunnelExtension_connectWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_2;
  v7[3] = &unk_18A08F098;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 domain];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v3 isEqualToString:@"NEAgentErrorDomain"])
    {
      uint64_t v4 = [*(id *)(a1 + 32) code];

      if (v4 == 3)
      {
        uint64_t v5 = *(void **)(a1 + 40);
        v7[0] = MEMORY[0x1895F87A8];
        v7[1] = 3221225472LL;
        v7[2] = __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_3;
        v7[3] = &unk_18A090390;
        void v7[4] = v5;
        [v5 handleDisposeWithCompletionHandler:v7];
        return;
      }
    }

    else
    {
    }
  }

  id v6 = *(_BYTE **)(a1 + 40);
  if (v6)
  {
    if ((v6[120] & 1) != 0) {
      [v6 handleDisposeWithCompletionHandler:0];
    }
    else {
      -[NEAgentTunnelExtension sendStatus:withDisconnectError:](v6, 0LL, *(void **)(a1 + 32));
    }
  }

void __48__NEAgentTunnelExtension_connectWithParameters___block_invoke_3(uint64_t a1)
{
}

void __41__NEAgentTunnelExtension_driverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EA4F8];
  v1 = (void *)driverInterface_driverInterface_6838;
  driverInterface_driverInterface_6838 = v0;

  id v2 = (void *)MEMORY[0x189604010];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(id)driverInterface_driverInterface_6838 setClasses:v5 forSelector:sel_setAppUUIDMap_ argumentIndex:0 ofReply:0];
}

void __42__NEAgentTunnelExtension_managerInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6FB4C0];
  v1 = (void *)managerInterface_managerInterface;
  managerInterface_managerInterface = v0;
}

void __47__NEAgentTunnelExtension_handleAppsUpdateEnds___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) appsUpdateEnding])
  {
    uint64_t v2 = [*(id *)(a1 + 32) extensionIdentifier];
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      uint64_t v4 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) extensionIdentifier];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = [v4 containsObject:v5];

      if ((_DWORD)v4)
      {
        [*(id *)(a1 + 32) setAppsUpdateStarted:0];
        [*(id *)(a1 + 32) setAppsUpdateEnding:0];
        ne_log_obj();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)(a1 + 32) extensionIdentifier];
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
          int v8 = 138412290;
          uint64_t v9 = v7;
          _os_log_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_DEFAULT,  "Extension %@ has been updated, setting status to disconnected",  (uint8_t *)&v8,  0xCu);
        }

        -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 0LL, 0LL);
      }
    }
  }

void __49__NEAgentTunnelExtension_handleAppsUpdateEnding___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) appsUpdateStarted])
  {
    if (([*(id *)(a1 + 32) appsUpdateEnding] & 1) == 0)
    {
      uint64_t v2 = [*(id *)(a1 + 32) extensionIdentifier];
      if (v2)
      {
        uint64_t v3 = (void *)v2;
        uint64_t v4 = *(void **)(a1 + 40);
        [*(id *)(a1 + 32) extensionIdentifier];
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v4) = [v4 containsObject:v5];

        if ((_DWORD)v4) {
          [*(id *)(a1 + 32) setAppsUpdateEnding:1];
        }
      }
    }
  }

void __49__NEAgentTunnelExtension_handleAppsUpdateBegins___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (([*(id *)(a1 + 32) appsUpdateStarted] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) pluginType];
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      uint64_t v4 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) pluginType];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = [v4 containsObject:v5];

      if ((_DWORD)v4)
      {
        [*(id *)(a1 + 32) setAppsUpdateStarted:1];
        [*(id *)(a1 + 32) sendFailedTimer];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          [*(id *)(a1 + 32) sendFailedTimer];
          uint64_t v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
          dispatch_source_cancel(v7);

          [*(id *)(a1 + 32) setSendFailedTimer:0];
        }

        ne_log_obj();
        int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)(a1 + 32) extensionIdentifier];
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          int v11 = 138412290;
          BOOL v12 = v9;
          _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "Extension %@ is being updated, stopping",  (uint8_t *)&v11,  0xCu);
        }

        -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 7LL, 0LL);
        [*(id *)(a1 + 32) sessionContext];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 stopWithReason:40];
      }
    }
  }

@end