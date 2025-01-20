@interface NEAgentAppProxyExtension
- (id)driverInterface;
- (id)managerInterface;
- (void)connectWithParameters:(id)a3;
- (void)extension:(id)a3 didRequestFlowDivertControlSocketWithCompletionHandler:(id)a4;
- (void)setDelegateInterface:(unsigned int)a3;
@end

@implementation NEAgentAppProxyExtension

- (id)managerInterface
{
  if (managerInterface_onceToken_19408 != -1) {
    dispatch_once(&managerInterface_onceToken_19408, &__block_literal_global_19409);
  }
  return (id)managerInterface_managerInterface_19410;
}

- (id)driverInterface
{
  if (driverInterface_onceToken_19404 != -1) {
    dispatch_once(&driverInterface_onceToken_19404, &__block_literal_global_13_19405);
  }
  return (id)driverInterface_driverInterface_19406;
}

- (void)connectWithParameters:(id)a3
{
  id v4 = a3;
  v5 = -[NEAgentExtension managerObjectFactory](self, "managerObjectFactory");
  uint64_t v6 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke;
  v11[3] = &unk_18A0907E8;
  v11[4] = self;
  [v5 managerObjectWithErrorHandler:v11];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  v9[1] = 3221225472LL;
  v9[2] = __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_35;
  v9[3] = &unk_18A08F7E8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 createFlowDivertControlSocketWithCompletionHandler:v9];
}

- (void)setDelegateInterface:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setDelegateInterface:v3];
}

- (void)extension:(id)a3 didRequestFlowDivertControlSocketWithCompletionHandler:(id)a4
{
  id v5 = a4;
  -[NEAgentExtension managerObjectFactory](self, "managerObjectFactory");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke;
  v12[3] = &unk_18A0907E8;
  v12[4] = self;
  [v6 managerObjectWithErrorHandler:v12];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v7;
  v10[1] = 3221225472LL;
  v10[2] = __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke_37;
  v10[3] = &unk_18A08F810;
  id v11 = v5;
  id v9 = v5;
  [v8 createFlowDivertControlSocketWithCompletionHandler:v10];
}

void __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Got an error on the XPC connection while creating a flow divert control socket: %@",  (uint8_t *)&v5,  0xCu);
  }

  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 0LL, 0LL);
}

uint64_t __93__NEAgentAppProxyExtension_extension_didRequestFlowDivertControlSocketWithCompletionHandler___block_invoke_37( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Got an error on the XPC connection while creating a flow divert control socket: %@",  (uint8_t *)&v5,  0xCu);
  }

  -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 32), 0LL, 0LL);
}

void __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_2;
  block[3] = &unk_18A08F7C0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __50__NEAgentAppProxyExtension_connectWithParameters___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) sessionContext];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setInitialFlowDivertControlSocket:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(a1 + 48);
    v6.receiver = *(id *)(a1 + 40);
    v6.super_class = (Class)&OBJC_CLASS___NEAgentAppProxyExtension;
    objc_msgSendSuper2(&v6, sel_connectWithParameters_, v3);
  }

  else
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_error_impl(&dword_1876B1000, v4, OS_LOG_TYPE_ERROR, "Failed to get a flow divert control socket", v5, 2u);
    }

    -[NEAgentTunnelExtension sendStatus:withDisconnectError:](*(void **)(a1 + 40), 0LL, 0LL);
  }

void __43__NEAgentAppProxyExtension_driverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EA600];
  v1 = (void *)driverInterface_driverInterface_19406;
  driverInterface_driverInterface_19406 = v0;
}

void __44__NEAgentAppProxyExtension_managerInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6FDBC0];
  v1 = (void *)managerInterface_managerInterface_19410;
  managerInterface_managerInterface_19410 = v0;
}

@end