@interface NEAgentExtension
- (BOOL)appsUpdateEnding;
- (BOOL)appsUpdateStarted;
- (NEAgentExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginEndpoint:(id)a5 pluginProcessIdentity:(id)a6 queue:(id)a7 factory:(id)a8;
- (NEAgentExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7;
- (NEExtensionProviderHostContext)sessionContext;
- (NEPluginManagerObjectFactory)managerObjectFactory;
- (NSArray)uuids;
- (NSString)extensionIdentifier;
- (NSString)pluginType;
- (NSXPCInterface)driverInterface;
- (NSXPCInterface)driverProtocol;
- (NSXPCInterface)managerInterface;
- (NSXPCInterface)managerProtocol;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)sendFailedTimer;
- (id)copyProcessIdentities;
- (void)cleanupExtensionWithRequestIdentifier:(void *)a1;
- (void)dealloc;
- (void)extension:(id)a3 didFailWithError:(id)a4;
- (void)extensionDidStop:(id)a3;
- (void)handleDisposeWithCompletionHandler:(id)a3;
- (void)handleExtensionExit:(void *)a1;
- (void)handleExtensionStartedWithCompletionHandler:(id)a3;
- (void)handleInitWithCompletionHandler:(id)a3;
- (void)setAppsUpdateEnding:(BOOL)a3;
- (void)setAppsUpdateStarted:(BOOL)a3;
- (void)setExtension:(uint64_t)a1;
- (void)setQueue:(id)a3;
- (void)setSendFailedTimer:(id)a3;
- (void)setSessionContext:(id)a3;
- (void)setSessionRequestIdentifier:(uint64_t)a1;
- (void)sleepWithCompletionHandler:(id)a3;
- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)updateConfiguration:(id)a3;
- (void)wakeup;
@end

@implementation NEAgentExtension

- (NEAgentExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___NEAgentExtension;
  v17 = -[NEAgentExtension init](&v28, sel_init);
  if (v17)
  {
    [v14 objectForKeyedSubscript:@"extension-identifier"];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:]( &OBJC_CLASS___NELaunchServices,  "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:",  v18,  v13,  a4,  0LL);
    if (!v19)
    {
      v26 = 0LL;
      goto LABEL_6;
    }

    objc_storeWeak((id *)&v17->_managerObjectFactory, v16);
    objc_storeStrong((id *)&v17->_queue, a6);
    uint64_t v20 = [v19 pluginIdentifier];
    extensionIdentifier = v17->_extensionIdentifier;
    v17->_extensionIdentifier = (NSString *)v20;

    uint64_t v22 = [v19 machOUUIDs];
    extensionUUIDs = v17->_extensionUUIDs;
    v17->_extensionUUIDs = (NSArray *)v22;

    objc_storeStrong((id *)&v17->_pluginType, a3);
    uint64_t v24 = +[NELaunchServices pluginClassToExtensionPoint:](&OBJC_CLASS___NELaunchServices, "pluginClassToExtensionPoint:", a4);
    extensionPointIdentifier = v17->_extensionPointIdentifier;
    v17->_extensionPointIdentifier = (NSString *)v24;
  }

  v26 = v17;
LABEL_6:

  return v26;
}

- (NEAgentExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginEndpoint:(id)a5 pluginProcessIdentity:(id)a6 queue:(id)a7 factory:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___NEAgentExtension;
  uint64_t v20 = -[NEAgentExtension init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_managerObjectFactory, v19);
    objc_storeStrong((id *)&v21->_queue, a7);
    id v22 = objc_alloc(MEMORY[0x189603F18]);
    [v17 uuid];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = objc_msgSend(v22, "initWithObjects:", v23, 0);
    extensionUUIDs = v21->_extensionUUIDs;
    v21->_extensionUUIDs = (NSArray *)v24;

    objc_storeStrong((id *)&v21->_pluginType, a3);
    objc_storeStrong((id *)&v21->_extensionIdentifier, a3);
    v26 = 0LL;
    switch(a4)
    {
      case 2LL:
        v27 = &OBJC_CLASS___NEExtensionAppProxyProviderHostContext;
        goto LABEL_7;
      case 3LL:
        v27 = &OBJC_CLASS___NEExtensionDNSProxyProviderHostContext;
        goto LABEL_7;
      case 5LL:
        v27 = &OBJC_CLASS___NEExtensionPacketTunnelProviderHostContext;
        goto LABEL_7;
      case 7LL:
        v27 = &OBJC_CLASS___NEExtensionAppPushProviderHostContext;
LABEL_7:
        objc_super v28 = -[NEExtensionProviderHostContext initWithVendorEndpoint:processIdentity:delegate:]( (id *)objc_alloc(v27),  v16,  v17,  v21);
        sessionContext = v21->_sessionContext;
        v21->_sessionContext = (NEExtensionProviderHostContext *)v28;

        if (v21->_sessionContext) {
          goto LABEL_8;
        }
        v26 = 0LL;
        break;
      default:
        break;
    }
  }

  else
  {
LABEL_8:
    v26 = v21;
  }

  return v26;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NEAgentExtension sendFailedTimer](self, "sendFailedTimer");
    v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[NEAgentExtension setSendFailedTimer:](self, "setSendFailedTimer:", 0LL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEAgentExtension;
  -[NEAgentExtension dealloc](&v5, sel_dealloc);
}

- (void)handleInitWithCompletionHandler:(id)a3
{
  v23[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[NEAgentExtension extensionIdentifier](self, "extensionIdentifier");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v22[0] = *MEMORY[0x1896074B0];
    v6 = -[NEAgentExtension extensionIdentifier](self, "extensionIdentifier");
    v23[0] = v6;
    v22[1] = *MEMORY[0x1896074B8];
    if (self) {
      extensionPointIdentifier = self->_extensionPointIdentifier;
    }
    else {
      extensionPointIdentifier = 0LL;
    }
    v23[1] = extensionPointIdentifier;
    v8 = (void *)MEMORY[0x189603F68];
    v9 = extensionPointIdentifier;
    [v8 dictionaryWithObjects:v23 forKeys:v22 count:2];
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  ne_log_obj();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = -[NEAgentExtension extensionIdentifier](self, "extensionIdentifier");
    v12 = (void *)v11;
    if (self) {
      id v13 = self->_extensionPointIdentifier;
    }
    else {
      id v13 = 0LL;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    v21 = v13;
    _os_log_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_DEFAULT,  "Looking for an extension with identifier %@ and extension point %@",  buf,  0x16u);
  }

  id v14 = (void *)MEMORY[0x189607880];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke;
  v16[3] = &unk_18A0908F0;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [v14 extensionsWithMatchingAttributes:v5 completion:v16];
}

- (void)handleDisposeWithCompletionHandler:(id)a3
{
  newValue = (void (**)(void))a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (self) {
      objc_setProperty_atomic_copy(self, v5, newValue, 112LL);
    }
    v6 = -[NEAgentExtension sessionContext](self, "sessionContext");
    [v6 dispose];

    goto LABEL_7;
  }

  v7 = newValue;
  if (newValue)
  {
    newValue[2](newValue);
LABEL_7:
    v7 = newValue;
  }
}

- (NSArray)uuids
{
  return self->_extensionUUIDs;
}

- (NSXPCInterface)managerInterface
{
  return 0LL;
}

- (NSXPCInterface)driverInterface
{
  if (driverInterface_onceToken_15143 != -1) {
    dispatch_once(&driverInterface_onceToken_15143, &__block_literal_global_15144);
  }
  return (NSXPCInterface *)(id)driverInterface_driverInterface_15145;
}

- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = -[NEAgentExtension sessionContext](self, "sessionContext");
  if (v8)
  {
    v9 = -[NEAgentExtension sessionContext](self, "sessionContext");
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke;
    v24[3] = &unk_18A08F1F0;
    v10 = &v26;
    id v25 = v6;
    id v26 = v7;
    uint64_t v11 = &v25;
    v24[4] = self;
    id v12 = v6;
    id v13 = v7;
    [v9 createWithCompletionHandler:v24];
  }

  else
  {
    ne_log_obj();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        extension = self->_extension;
      }
      else {
        extension = 0LL;
      }
      id v16 = extension;
      -[NSExtension identifier](v16, "identifier");
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      objc_super v28 = v17;
      _os_log_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_DEFAULT,  "Beginning extension request with extension %@",  buf,  0xCu);
    }

    if (self) {
      id v18 = self->_extension;
    }
    else {
      id v18 = 0LL;
    }
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_33;
    v21[3] = &unk_18A08E500;
    v10 = &v23;
    id v22 = v6;
    id v23 = v7;
    uint64_t v11 = &v22;
    v21[4] = self;
    id v19 = v6;
    id v20 = v7;
    -[NSExtension beginExtensionRequestWithInputItems:completion:]( v18,  "beginExtensionRequestWithInputItems:completion:",  0LL,  v21);
  }
}

- (void)updateConfiguration:(id)a3
{
  id v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setConfiguration:v4 extensionIdentifier:self->_extensionIdentifier];
}

- (void)sleepWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 sleepWithCompletionHandler:v4];
}

- (void)wakeup
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 wake];
}

- (void)extension:(id)a3 didFailWithError:(id)a4
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__NEAgentExtension_extension_didFailWithError___block_invoke;
  block[3] = &unk_18A090390;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)extensionDidStop:(id)a3
{
  if (self)
  {
    if (objc_getProperty(self, v4, 112LL, 1))
    {
      Property = (void (**)(void))objc_getProperty(self, v5, 112LL, 1);
      Property[2]();
      objc_setProperty_atomic_copy(self, v7, 0LL, 112LL);
    }
  }

- (void)handleExtensionStartedWithCompletionHandler:(id)a3
{
}

- (NEPluginManagerObjectFactory)managerObjectFactory
{
  return (NEPluginManagerObjectFactory *)objc_loadWeakRetained((id *)&self->_managerObjectFactory);
}

- (NEExtensionProviderHostContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSString)pluginType
{
  return self->_pluginType;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSXPCInterface)managerProtocol
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSXPCInterface)driverProtocol
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 64LL, 1);
}

- (BOOL)appsUpdateStarted
{
  return self->_appsUpdateStarted;
}

- (void)setAppsUpdateStarted:(BOOL)a3
{
  self->_appsUpdateStarted = a3;
}

- (BOOL)appsUpdateEnding
{
  return self->_appsUpdateEnding;
}

- (void)setAppsUpdateEnding:(BOOL)a3
{
  self->_appsUpdateEnding = a3;
}

- (OS_dispatch_source)sendFailedTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSendFailedTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

void __47__NEAgentExtension_extension_didFailWithError___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    v3 = (void *)v2[10];
  }
  else {
    v3 = 0LL;
  }
  id v4 = v3;
  [v2 setSessionContext:0];
  -[NEAgentExtension setSessionRequestIdentifier:](*(void *)(a1 + 32), 0LL);
  -[NEAgentExtension handleExtensionExit:](*(void **)(a1 + 32), v4);
}

- (void)setSessionRequestIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)handleExtensionExit:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    [a1 queue];
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __40__NEAgentExtension_handleExtensionExit___block_invoke;
    v5[3] = &unk_18A08F098;
    v5[4] = a1;
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

void __40__NEAgentExtension_handleExtensionExit___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) appsUpdateStarted])
  {
    ne_log_obj();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v3;
      _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEFAULT,  "App updating - ignore extension failure/exit for %@",  buf,  0xCu);
    }
  }

  else
  {
    [*(id *)(a1 + 32) sendFailedTimer];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      ne_log_obj();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v6;
        _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEFAULT,  "Scheduing timer for extension failure/exit for %@",  buf,  0xCu);
      }

      [*(id *)(a1 + 32) queue];
      SEL v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = MEMORY[0x1895F87A8];
      uint64_t v11 = 3221225472LL;
      id v12 = __40__NEAgentExtension_handleExtensionExit___block_invoke_8;
      id v13 = &unk_18A08F098;
      v8 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = v8;
      NECreateTimerSource(v7, 5LL, &v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSendFailedTimer:", v9, v10, v11, v12, v13, v14);
    }
  }

void __40__NEAgentExtension_handleExtensionExit___block_invoke_8(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) sendFailedTimer];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [*(id *)(a1 + 32) sendFailedTimer];
    uint64_t v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    [*(id *)(a1 + 32) setSendFailedTimer:0];
  }

  int v4 = [*(id *)(a1 + 32) appsUpdateStarted];
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEFAULT,  "App updating - ignore extension failure/exit for %@",  (uint8_t *)&v9,  0xCu);
    }
  }

  else
  {
    if (v6)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_DEFAULT,  "Handle extension failure/exit for %@ - disconnect session",  (uint8_t *)&v9,  0xCu);
    }

    [*(id *)(a1 + 32) sendExtensionFailed];
  }

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke(uint64_t a1, char a2)
{
  int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2;
  v8[3] = &unk_18A08F1C8;
  char v11 = a2;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v10 = v5;
  v8[4] = v6;
  id v9 = v7;
  dispatch_async(v4, v8);
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_33( id *a1,  void *a2,  void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  ne_log_obj();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    if (v8) {
      uint64_t v8 = (void *)v8[12];
    }
    id v9 = v8;
    [v9 identifier];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_DEFAULT,  "Extension request with extension %@ started with identifier %@",  buf,  0x16u);
  }

  [a1[4] queue];
  char v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_34;
  block[3] = &unk_18A08F218;
  id v12 = a1[4];
  id v16 = v6;
  id v17 = v12;
  id v20 = a1[6];
  id v18 = v5;
  id v19 = a1[5];
  id v13 = v5;
  id v14 = v6;
  dispatch_async(v11, block);
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_34(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    ne_log_obj();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void **)(a1 + 40);
      if (v8) {
        uint64_t v8 = (void *)v8[12];
      }
      id v9 = v8;
      [v9 identifier];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_error_impl(&dword_1876B1000, v2, OS_LOG_TYPE_ERROR, "Failed to start extension %@: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3) {
      uint64_t v3 = (void *)v3[12];
    }
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = v3;
    -[NSExtension extensionHostContextForUUID:](v5, v4);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_35;
      v15[3] = &unk_18A08FE20;
      v15[4] = *(void *)(a1 + 40);
      id v19 = *(id *)(a1 + 64);
      id v16 = *(id *)(a1 + 48);
      id v17 = v6;
      id v18 = *(id *)(a1 + 56);
      [v17 validateWithCompletionHandler:v15];
    }

    else
    {
      ne_log_obj();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v12 = *(void **)(a1 + 40);
        if (v12) {
          id v12 = (void *)v12[12];
        }
        id v13 = v12;
        [v13 identifier];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to get the host context for extension %@",  buf,  0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    }
  }

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_35(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] queue];
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2_36;
  v7[3] = &unk_18A08E4D8;
  id v5 = a1[4];
  id v8 = v3;
  id v9 = v5;
  id v13 = a1[8];
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = a1[7];
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2_36(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    ne_log_obj();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 40) pluginType];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_1876B1000, v2, OS_LOG_TYPE_ERROR, "Provider %@ validation failed: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16LL))();
  }

  else
  {
    -[NEAgentExtension setSessionRequestIdentifier:](*(void *)(a1 + 40), *(void **)(a1 + 48));
    [*(id *)(a1 + 40) setSessionContext:*(void *)(a1 + 56)];
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [v3 sessionContext];
    id v5 = (void *)v4;
    if (v4) {
      objc_storeWeak((id *)(v4 + 56), v3);
    }

    [*(id *)(a1 + 40) updateConfiguration:*(void *)(a1 + 64)];
    id v6 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_37;
    v9[3] = &unk_18A08F070;
    v9[4] = v6;
    id v10 = *(id *)(a1 + 72);
    [v6 handleExtensionStartedWithCompletionHandler:v9];
  }

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_37( uint64_t a1,  uint64_t a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      uint64_t v5 = *(void *)(v4 + 80);
      if (v5)
      {
        id v6 = *(id *)(v4 + 96);
        [v6 cancelExtensionRequestWithIdentifier:v5];
      }
    }
  }

  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = -[NEAgentExtension copyProcessIdentities](*(id *)(a1 + 32));
  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
}

- (id)copyProcessIdentities
{
  if (result)
  {
    v1 = result;
    [result sessionContext];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2) {
      goto LABEL_7;
    }
    [v1 sessionContext];
    Property = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = Property;
    if (Property) {
      Property = objc_getProperty(Property, v4, 64LL, 1);
    }
    id v6 = Property;

    if (v6)
    {
      uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x189603F18]), "initWithObjects:", v6, 0);

      return (id)v7;
    }

    else
    {
LABEL_7:
      ne_log_obj();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "No extension process identity is available",  buf,  2u);
      }

      return objc_alloc_init(MEMORY[0x189603F18]);
    }
  }

  return result;
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
  {
    [*(id *)(a1 + 32) sessionContext];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_3;
    v3[3] = &unk_18A08F1A0;
    v3[4] = *(void *)(a1 + 32);
    id v5 = *(id *)(a1 + 48);
    id v4 = *(id *)(a1 + 40);
    [v2 validateWithCompletionHandler:v3];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] queue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_4;
  v7[3] = &unk_18A08F2B8;
  id v5 = a1[4];
  id v8 = v3;
  id v9 = v5;
  id v11 = a1[6];
  id v10 = a1[5];
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    ne_log_obj();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 40) pluginType];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_error_impl(&dword_1876B1000, v2, OS_LOG_TYPE_ERROR, "Provider %@ validation failed: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  else
  {
    [*(id *)(a1 + 40) updateConfiguration:*(void *)(a1 + 48)];
    id v3 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_30;
    v7[3] = &unk_18A08F070;
    id v4 = *(id *)(a1 + 56);
    void v7[4] = *(void *)(a1 + 40);
    id v8 = v4;
    [v3 handleExtensionStartedWithCompletionHandler:v7];
  }

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_30( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = -[NEAgentExtension copyProcessIdentities](*(id *)(a1 + 32));
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

void __35__NEAgentExtension_driverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EA318];
  v1 = (void *)driverInterface_driverInterface_15145;
  driverInterface_driverInterface_15145 = v0;
}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) queue];
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_18A08F2B8;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = [*(id *)(a1 + 40) extensionIdentifier];
    id v5 = (void *)v4;
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      uint64_t v6 = *(void *)(v6 + 88);
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v3;
    __int16 v29 = 2112;
    uint64_t v30 = v4;
    __int16 v31 = 2112;
    uint64_t v32 = v6;
    _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Found %lu extension(s) with identifier %@ and extension point %@",  buf,  0x20u);
  }

  if (!*(void *)(a1 + 48) && (uint64_t v8 = *(void **)(a1 + 32)) != 0 && [v8 count])
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEAgentExtension setExtension:](*(void *)(a1 + 40), v9);

    uint64_t v10 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_12;
    v25[3] = &unk_18A08F100;
    objc_copyWeak(&v26, (id *)buf);
    id v11 = *(void **)(a1 + 40);
    if (v11) {
      id v11 = (void *)v11[12];
    }
    uint64_t v12 = v11;
    [v12 setRequestInterruptionBlock:v25];

    v23[0] = v10;
    v23[1] = 3221225472LL;
    v23[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_14;
    void v23[3] = &unk_18A08F128;
    objc_copyWeak(&v24, (id *)buf);
    id v13 = *(void **)(a1 + 40);
    if (v13) {
      id v13 = (void *)v13[12];
    }
    uint64_t v14 = v13;
    [v14 setRequestCompletionBlock:v23];

    v21[0] = v10;
    v21[1] = 3221225472LL;
    v21[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2_16;
    v21[3] = &unk_18A08F150;
    objc_copyWeak(&v22, (id *)buf);
    id v15 = *(void **)(a1 + 40);
    if (v15) {
      id v15 = (void *)v15[12];
    }
    id v16 = v15;
    [v16 setRequestCancellationBlock:v21];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    ne_log_obj();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [*(id *)(a1 + 40) extensionIdentifier];
      id v18 = (void *)v17;
      uint64_t v19 = *(void *)(a1 + 40);
      if (v19) {
        uint64_t v19 = *(void *)(v19 + 88);
      }
      uint64_t v20 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      uint64_t v32 = v20;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to find an app extension with identifier %@ and extension point %@: %@",  buf,  0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

- (void)setExtension:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (WeakRetained) {
      uint64_t v7 = (void *)WeakRetained[12];
    }
    else {
      uint64_t v7 = 0LL;
    }
    id v8 = v7;
    [v8 identifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = 138412290;
    id v11 = v9;
    _os_log_error_impl(&dword_1876B1000, v5, OS_LOG_TYPE_ERROR, "Extension %@ died unexpectedly", (uint8_t *)&v10, 0xCu);
  }

  if (WeakRetained) {
    uint64_t v6 = WeakRetained[10];
  }
  else {
    uint64_t v6 = 0LL;
  }
  if ([v3 isEqual:v6])
  {
    -[NEAgentExtension handleExtensionExit:](WeakRetained, v3);
    -[NEAgentExtension cleanupExtensionWithRequestIdentifier:](WeakRetained, v3);
  }
}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = WeakRetained[10];
  }
  else {
    uint64_t v5 = 0LL;
  }
}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2_16(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = WeakRetained[10];
  }
  else {
    uint64_t v5 = 0LL;
  }
}

- (void)cleanupExtensionWithRequestIdentifier:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    [a1 queue];
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __58__NEAgentExtension_cleanupExtensionWithRequestIdentifier___block_invoke;
    v5[3] = &unk_18A08F098;
    v5[4] = a1;
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

void __58__NEAgentExtension_cleanupExtensionWithRequestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 96);
  }
  else {
    id v3 = 0LL;
  }
  [v3 setRequestInterruptionBlock:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 96);
  }
  else {
    uint64_t v5 = 0LL;
  }
  [v5 setRequestCancellationBlock:0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 96);
  }
  else {
    uint64_t v7 = 0LL;
  }
  [v7 setRequestCompletionBlock:0];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    id v9 = *(void **)(v8 + 96);
  }
  else {
    id v9 = 0LL;
  }
  [v9 cancelExtensionRequestWithIdentifier:*(void *)(a1 + 40)];
  -[NEAgentExtension setExtension:](*(void *)(a1 + 32), 0LL);
  int v10 = *(void **)(a1 + 32);
  [v10 sessionContext];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v10 extensionDidStop:v11];
}

@end