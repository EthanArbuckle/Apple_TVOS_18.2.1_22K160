@interface NEAgentFilterExtension
+ (BOOL)authenticateFlowWithState:(cfil_crypto_state *)a3 crypto_key:(id)a4 flow:(id)a5 salt:(unsigned int)a6 isKernelSocket:(BOOL)a7;
- (NEAgentFilterExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginEndpoint:(id)a5 pluginProcessIdentity:(id)a6 queue:(id)a7 factory:(id)a8;
- (NEAgentFilterExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7;
- (NSArray)uuids;
- (NSXPCInterface)driverInterface;
- (NSXPCInterface)managerInterface;
- (os_log_s)generateClientKey:(int)a3 salt:;
- (uint64_t)copyProcessIdentities;
- (unsigned)sanitizeFilterFlow:(unsigned int *)a1;
- (void)applySettings:(id)a3 completionHandler:(id)a4;
- (void)cleanupControlExtensionWithRequestIdentifier:(void *)a1;
- (void)cleanupDataExtensionWithRequestIdentifier:(void *)a1;
- (void)cleanupOnStartFailure;
- (void)createPacketChannelForExtension:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)extension:(id)a3 didFailWithError:(id)a4;
- (void)extension:(id)a3 didStartWithError:(id)a4;
- (void)extensionDidStop:(id)a3;
- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4;
- (void)getFilterClientConnectionWithCompletionHandler:(int)a3 completionHandler:(id)a4;
- (void)handleAppsUninstalled:(id)a3;
- (void)handleAppsUpdateBegins:(id)a3;
- (void)handleAppsUpdateEnding:(id)a3;
- (void)handleAppsUpdateEnds:(id)a3;
- (void)handleCancel;
- (void)handleDisposeWithCompletionHandler:(id)a3;
- (void)handleExtensionExit:(void *)a1;
- (void)handleInitWithCompletionHandler:(id)a3;
- (void)handleStopCompleteWithError:(uint64_t)a1;
- (void)notifyRulesChanged;
- (void)provideRemediationMap:(id)a3;
- (void)provideURLAppendStringMap:(id)a3;
- (void)report:(id)a3;
- (void)sendBrowserContentFilterServerRequest;
- (void)sendFilterStatus:(uint64_t)a3 withError:;
- (void)sendSocketContentFilterRequest;
- (void)sleepWithCompletionHandler:(id)a3;
- (void)startFilter;
- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)stopFilterExtensionWithReason:(_BYTE *)a1;
- (void)updateConfiguration:(id)a3;
- (void)wakeup;
@end

@implementation NEAgentFilterExtension

- (NEAgentFilterExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___NEAgentFilterExtension;
  v17 = -[NEAgentFilterExtension init](&v40, sel_init);
  v18 = v17;
  if (!v17) {
    goto LABEL_11;
  }
  objc_storeWeak((id *)&v17->_managerObjectFactory, v16);
  objc_storeStrong((id *)&v18->_queue, a6);
  *(_WORD *)&v18->_dataExtensionInitialized = 0;
  objc_storeStrong((id *)&v18->_pluginType, a3);
  [v14 objectForKeyedSubscript:@"extension-identifier"];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  id v20 = objc_alloc_init(MEMORY[0x189603FA8]);
  v21 = +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:]( &OBJC_CLASS___NELaunchServices,  "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:",  v19,  v13,  a4,  0LL);
  v22 = v21;
  if (v21)
  {
    [v21 machOUUIDs];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 addObjectsFromArray:v23];

    uint64_t v24 = [v22 pluginIdentifier];
    dataExtensionIdentifier = v18->_dataExtensionIdentifier;
    v18->_dataExtensionIdentifier = (NSString *)v24;
  }
  v26 = +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:]( &OBJC_CLASS___NELaunchServices,  "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:",  0LL,  v13,  4LL,  @"com.apple.networkextension.filter-control");
  v27 = v26;
  if (v26)
  {
    [v26 machOUUIDs];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 addObjectsFromArray:v28];

    uint64_t v29 = [v27 pluginIdentifier];
    controlExtensionIdentifier = v18->_controlExtensionIdentifier;
    v18->_controlExtensionIdentifier = (NSString *)v29;
  }

  if (!v18->_dataExtensionIdentifier)
  {
    ne_log_obj();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      v34 = 0LL;
      goto LABEL_16;
    }

    *(_DWORD *)buf = 138412546;
    v42 = @"com.apple.networkextension.filter-data";
    __int16 v43 = 2112;
    id v44 = v13;
    v36 = "Failed to find a %@ extension inside of app %@";
    v37 = (os_log_s *)v35;
    uint32_t v38 = 22;
LABEL_18:
    _os_log_error_impl(&dword_1876B1000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
    goto LABEL_15;
  }

  if ([v20 count])
  {
    uint64_t v31 = [objc_alloc(MEMORY[0x189603F18]) initWithArray:v20];
    extensionUUIDs = v18->_extensionUUIDs;
    v18->_extensionUUIDs = (NSArray *)v31;
  }

  uint64_t inited = ne_filter_crypto_init_master();
  v18->_crypto_state = (cfil_crypto_state *)inited;
  if (!inited)
  {
    ne_log_obj();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v36 = "Failed to initialize NE filter crypto";
    v37 = (os_log_s *)v35;
    uint32_t v38 = 2;
    goto LABEL_18;
  }

  arc4random_buf(&v18->_crypto_kernel_salt, 4uLL);

LABEL_11:
  v34 = v18;
LABEL_16:

  return v34;
}

- (NEAgentFilterExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginEndpoint:(id)a5 pluginProcessIdentity:(id)a6 queue:(id)a7 factory:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___NEAgentFilterExtension;
  id v20 = -[NEAgentFilterExtension init](&v34, sel_init);
  v21 = v20;
  if (!v20) {
    goto LABEL_9;
  }
  objc_storeWeak((id *)&v20->_managerObjectFactory, v19);
  objc_storeStrong((id *)&v21->_queue, a7);
  id v22 = objc_alloc(MEMORY[0x189603F18]);
  [v17 uuid];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = objc_msgSend(v22, "initWithObjects:", v23, 0);
  extensionUUIDs = v21->_extensionUUIDs;
  v21->_extensionUUIDs = (NSArray *)v24;

  objc_storeStrong((id *)&v21->_pluginType, a3);
  if (a4 == 6)
  {
    v27 = &OBJC_CLASS___NEFilterPacketExtensionProviderHostContext;
LABEL_6:
    v28 = -[NEExtensionProviderHostContext initWithVendorEndpoint:processIdentity:delegate:]( (id *)objc_alloc(v27),  v16,  v17,  v21);
    dataSessionContext = v21->_dataSessionContext;
    v21->_dataSessionContext = (NEFilterExtensionProviderHostContext *)v28;

    if (v21->_dataSessionContext)
    {
      objc_storeStrong((id *)&v21->_dataExtensionIdentifier, a3);
      uint64_t inited = ne_filter_crypto_init_master();
      v21->_crypto_state = (cfil_crypto_state *)inited;
      if (inited)
      {
        arc4random_buf(&v21->_crypto_kernel_salt, 4uLL);
LABEL_9:
        v26 = v21;
        goto LABEL_14;
      }

      ne_log_obj();
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1876B1000, v31, OS_LOG_TYPE_ERROR, "Failed to initialize NE filter crypto", buf, 2u);
      }
    }

    v26 = 0LL;
    goto LABEL_14;
  }

  v26 = 0LL;
  if (a4 == 4)
  {
    v27 = &OBJC_CLASS___NEFilterDataExtensionProviderHostContext;
    goto LABEL_6;
  }

- (void)dealloc
{
  crypto_state = self->_crypto_state;
  if (crypto_state)
  {
    free(crypto_state);
    self->_crypto_state = 0LL;
  }

  if (objc_getProperty(self, a2, 128LL, 1))
  {
    Property = (dispatch_source_s *)objc_getProperty(self, v4, 128LL, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(self, v6, 0LL, 128LL);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NEAgentFilterExtension;
  -[NEAgentFilterExtension dealloc](&v7, sel_dealloc);
}

- (void)handleInitWithCompletionHandler:(id)a3
{
  v24[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke;
  v15[3] = &unk_18A08F070;
  v15[4] = self;
  id v16 = v4;
  id v6 = v4;
  objc_super v7 = v15;
  if (self)
  {
    objc_initWeak(&location, self);
    v23[0] = *MEMORY[0x1896074B0];
    id v9 = objc_getProperty(self, v8, 88LL, 1);
    v23[1] = *MEMORY[0x1896074B8];
    v24[0] = v9;
    v24[1] = @"com.apple.networkextension.filter-data";
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    ne_log_obj();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id Property = objc_getProperty(self, v12, 88LL, 1);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = Property;
      _os_log_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEFAULT,  "Looking for a data extension with identifier %@",  (uint8_t *)&buf,  0xCu);
    }

    id v14 = (void *)MEMORY[0x189607880];
    *(void *)&__int128 buf = v5;
    *((void *)&buf + 1) = 3221225472LL;
    id v19 = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke;
    id v20 = &unk_18A08F178;
    objc_copyWeak(v22, &location);
    v21 = v7;
    [v14 extensionsWithMatchingAttributes:v10 completion:&buf];

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
}

- (void)handleDisposeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v4, 80LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __61__NEAgentFilterExtension_handleDisposeWithCompletionHandler___block_invoke;
  v8[3] = &unk_18A0908C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

- (void)handleCancel
{
}

- (void)handleAppsUninstalled:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if ([a3 containsObject:self->_pluginType])
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      pluginType = self->_pluginType;
      int v6 = 138412290;
      id v7 = pluginType;
      _os_log_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEFAULT,  "App for plugin type %@ has been uninstalled, stopping",  (uint8_t *)&v6,  0xCu);
    }

    -[NEAgentFilterExtension stopFilterExtensionWithReason:](self, 6LL);
  }

- (void)handleAppsUpdateBegins:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v4, 80LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __49__NEAgentFilterExtension_handleAppsUpdateBegins___block_invoke;
  v8[3] = &unk_18A08F098;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

- (void)handleAppsUpdateEnding:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v4, 80LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __49__NEAgentFilterExtension_handleAppsUpdateEnding___block_invoke;
  v8[3] = &unk_18A08F098;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

- (void)handleAppsUpdateEnds:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v4, 80LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __47__NEAgentFilterExtension_handleAppsUpdateEnds___block_invoke;
  v8[3] = &unk_18A08F098;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

- (NSArray)uuids
{
  return self->_extensionUUIDs;
}

- (NSXPCInterface)managerInterface
{
  if (managerInterface_onceToken_18191 != -1) {
    dispatch_once(&managerInterface_onceToken_18191, &__block_literal_global_18192);
  }
  return (NSXPCInterface *)(id)managerInterface_managerInterface_18193;
}

- (NSXPCInterface)driverInterface
{
  if (driverInterface_onceToken_18188 != -1) {
    dispatch_once(&driverInterface_onceToken_18188, &__block_literal_global_26);
  }
  return (NSXPCInterface *)(id)driverInterface_driverInterface_18189;
}

- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke;
  v15[3] = &unk_18A08F1F0;
  id v16 = v6;
  id v17 = v7;
  v15[4] = self;
  id v9 = v6;
  id v10 = v7;
  id v11 = v9;
  id v13 = v15;
  if (self)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v12, 80LL, 1);
    block[0] = v8;
    block[1] = 3221225472LL;
    block[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke;
    block[3] = &unk_18A08FB50;
    block[4] = self;
    id v20 = v13;
    id v19 = v11;
    dispatch_async(Property, block);
  }
}

- (void)startFilter
{
  v2 = self;
  if (self) {
    self = (NEAgentFilterExtension *)objc_getProperty(self, a2, 80LL, 1);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__NEAgentFilterExtension_startFilter__block_invoke;
  block[3] = &unk_18A090390;
  block[4] = v2;
  dispatch_async((dispatch_queue_t)self, block);
}

- (void)sleepWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self && self->_dataExtensionInitialized)
  {
    id Property = objc_getProperty(self, v5, 48LL, 1);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke;
    v8[3] = &unk_18A0908C8;
    v8[4] = self;
    id v9 = v6;
    [Property sleepWithCompletionHandler:v8];
  }

  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

- (void)wakeup
{
  if (self)
  {
    if (self->_dataExtensionInitialized)
    {
      objc_msgSend(objc_getProperty(self, a2, 48, 1), "wake");
      id v4 = objc_getProperty(self, v3, 40LL, 1);
      if (v4)
      {
        BOOL controlExtensionInitialized = self->_controlExtensionInitialized;

        if (controlExtensionInitialized) {
          objc_msgSend(objc_getProperty(self, v6, 56, 1), "wake");
        }
      }
    }
  }

- (void)updateConfiguration:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = (dispatch_queue_s *)objc_getProperty(self, v4, 80LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __46__NEAgentFilterExtension_updateConfiguration___block_invoke;
  v8[3] = &unk_18A08F098;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

- (void)extension:(id)a3 didStartWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = v7;
  if (self)
  {
    if (objc_getProperty(self, v8, 48LL, 1) == v6)
    {
      if (v9)
      {
LABEL_10:
        id v13 = self;
        uint64_t v14 = 0LL;
        uint64_t v15 = 1LL;
LABEL_13:
        -[NEAgentFilterExtension sendFilterStatus:withError:]((uint64_t)v13, v14, v15);
        goto LABEL_14;
      }

      if (self->_controlExtensionInitialized)
      {
        objc_initWeak(&location, self);
        id v17 = objc_getProperty(self, v16, 56LL, 1);
        id v19 = objc_getProperty(self, v18, 112LL, 1);
        v20[0] = MEMORY[0x1895F87A8];
        v20[1] = 3221225472LL;
        v20[2] = __54__NEAgentFilterExtension_extension_didStartWithError___block_invoke;
        v20[3] = &unk_18A08F268;
        objc_copyWeak(&v21, &location);
        [v17 startFilterWithOptions:v19 completionHandler:v20];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
        goto LABEL_14;
      }

- (void)extension:(id)a3 didFailWithError:(id)a4
{
  _cmd = (char *)a3;
  id v7 = a4;
  if (!self) {
    goto LABEL_5;
  }
  if (objc_getProperty(self, v6, 48LL, 1) == _cmd)
  {
    ptrdiff_t v9 = 64LL;
    id v8 = objc_getProperty(self, _cmd, 64LL, 1);
    ptrdiff_t v11 = 48LL;
LABEL_10:
    objc_setProperty_atomic(self, v10, 0LL, v11);
    objc_setProperty_atomic(self, v13, 0LL, v9);
    goto LABEL_11;
  }

  if (objc_getProperty(self, _cmd, 56LL, 1) == _cmd)
  {
    ptrdiff_t v9 = 72LL;
    id v8 = objc_getProperty(self, _cmd, 72LL, 1);
LABEL_9:
    ptrdiff_t v11 = 56LL;
    goto LABEL_10;
  }

  if (!_cmd)
  {
    objc_setProperty_atomic(self, 0LL, 0LL, 48LL);
    objc_setProperty_atomic(self, v12, 0LL, 64LL);
    id v8 = 0LL;
    ptrdiff_t v9 = 72LL;
    goto LABEL_9;
  }

- (void)extensionDidStop:(id)a3
{
  id v4 = (char *)a3;
  if (self)
  {
    ptrdiff_t v5 = 48LL;
    _cmd = v4;
    id Property = (const char *)objc_getProperty(self, v4, 48LL, 1);
    id v7 = _cmd;
    if (Property == _cmd
      || (v5 = 56LL, v8 = (const char *)objc_getProperty(self, _cmd, 56LL, 1), id v7 = _cmd, v8 == _cmd))
    {
      objc_setProperty_atomic(self, v7, 0LL, v5);
    }

    id v9 = objc_getProperty(self, v7, 48LL, 1);
    if (v9)
    {

LABEL_7:
      id v4 = (char *)_cmd;
      goto LABEL_9;
    }

    id v11 = objc_getProperty(self, v10, 56LL, 1);
    id v4 = (char *)_cmd;
    if (!v11)
    {
      id v12 = objc_getProperty(self, _cmd, 144LL, 1);
      id v4 = (char *)_cmd;
      if (v12)
      {
        SEL v13 = (void (**)(void))objc_getProperty(self, _cmd, 144LL, 1);
        v13[2]();
        objc_setProperty_atomic_copy(self, v14, 0LL, 144LL);
        goto LABEL_7;
      }
    }
  }

- (void)sendBrowserContentFilterServerRequest
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_managerObjectFactory);
  }
  else {
    id WeakRetained = 0LL;
  }
  [WeakRetained managerObject];
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  [v3 acceptAgentClients];
}

- (void)sendSocketContentFilterRequest
{
  v2 = self;
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (self) {
    self = (NEAgentFilterExtension *)objc_getProperty(self, a2, 48LL, 1);
  }
  id v3 = self;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (v2) {
      id WeakRetained = objc_loadWeakRetained((id *)&v2->_managerObjectFactory);
    }
    else {
      id WeakRetained = 0LL;
    }
    uint64_t v6 = MEMORY[0x1895F87A8];
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke;
    v13[3] = &unk_18A0907E8;
    v13[4] = v2;
    [WeakRetained managerObjectWithErrorHandler:v13];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v6;
    v12[1] = 3221225472LL;
    v12[2] = __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_62;
    v12[3] = &unk_18A08F290;
    v12[4] = v2;
    [v7 createContentFilterSocketWithCompletionHandler:v12];
  }

  else
  {
    ne_log_obj();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v2) {
        objc_getProperty(v2, v9, 48LL, 1);
      }
      id v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v15 = v11;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "sendSocketContentFilterRequest called, but dataSessionContext is not a flow data provider: %@",  buf,  0xCu);
    }
  }

- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4
{
  id v10 = (void (**)(id, NEFilterControlVerdict *))a4;
  -[NEAgentFilterExtension sanitizeFilterFlow:]((unsigned int *)self, a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property handleNewFlow:v7 completionHandler:v10];
  }

  else
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___NEFilterControlVerdict);
    v10[2](v10, v9);
  }
}

- (void)report:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ptrdiff_t v5 = v4;
  if (!self)
  {
LABEL_18:

LABEL_19:
    _cmd = 0LL;
    goto LABEL_20;
  }

  if (!v4)
  {
    ne_log_obj();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      uint64_t v15 = "-[NEAgentFilterExtension sanitizeReport:]";
      _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "%s called with null report", buf, 0xCu);
    }

    goto LABEL_18;
  }

  [v4 flow];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEAgentFilterExtension sanitizeFilterFlow:]((unsigned int *)self, v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v5 action];
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = [v5 event];
  else {
    uint64_t v11 = v10;
  }
  _cmd = 0LL;
  if (v7 && v9 && v11)
  {
    _cmd = (char *)-[NEFilterReport initWithFlow:action:event:](objc_alloc(&OBJC_CLASS___NEFilterReport), v7, v9, v11);
    objc_msgSend(_cmd, "setBytesInboundCount:", objc_msgSend(v7, "inBytes"));
    objc_msgSend(_cmd, "setBytesOutboundCount:", objc_msgSend(v7, "outBytes"));
  }

  if (!_cmd) {
    goto LABEL_19;
  }
  objc_msgSend(objc_getProperty(self, _cmd, 56, 1), "handleReport:", _cmd);
LABEL_20:
}

- (void)getFilterClientConnectionWithCompletionHandler:(int)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  if (self) {
    id Property = objc_getProperty(self, v6, 48LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v9 = Property;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NEAgentFilterExtension generateClientKey:salt:]((uint64_t)self, a3, 0);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      ne_log_obj();
      SEL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 67109120;
        LODWORD(v24) = a3;
        _os_log_error_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_ERROR,  "getFilterClientConnection called, but failed to create client crypto key for pid %d",  buf,  8u);
      }

      (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    }

    if (self) {
      SEL v14 = (dispatch_queue_s *)objc_getProperty(self, v11, 80LL, 1);
    }
    else {
      SEL v14 = 0LL;
    }
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke;
    block[3] = &unk_18A08FB50;
    block[4] = self;
    id v21 = v12;
    id v22 = v7;
    id v15 = v12;
    dispatch_async(v14, block);
  }

  else
  {
    ne_log_obj();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (self) {
        objc_getProperty(self, v17, 48LL, 1);
      }
      SEL v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v24 = v19;
      _os_log_error_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_ERROR,  "getFilterClientConnection called, but dataSessionContext is not a flow data provider: %@",  buf,  0xCu);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }
}

- (void)notifyRulesChanged
{
  v2 = self;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (self) {
    self = (NEAgentFilterExtension *)objc_getProperty(self, a2, 48LL, 1);
  }
  id v3 = self;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v5, 48LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property handleRulesChanged];
  }

  else
  {
    ne_log_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (v2) {
        objc_getProperty(v2, v8, 48LL, 1);
      }
      id v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = 138412290;
      id v12 = v10;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "notifyRulesChanged called, but dataSessionContext is not a flow data provider: %@",  (uint8_t *)&v11,  0xCu);
    }
  }

- (void)provideRemediationMap:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 48LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 48LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    [v10 provideRemediationMap:v5];
  }

  else
  {
    ne_log_obj();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (self) {
        objc_getProperty(self, v12, 48LL, 1);
      }
      uint64_t v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
      int v15 = 138412290;
      uint64_t v16 = v14;
      _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "provideRemediationMap called, but dataSessionContext is not a flow data provider: %@",  (uint8_t *)&v15,  0xCu);
    }
  }
}

- (void)provideURLAppendStringMap:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 48LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 48LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    [v10 provideURLAppendStringMap:v5];
  }

  else
  {
    ne_log_obj();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (self) {
        objc_getProperty(self, v12, 48LL, 1);
      }
      uint64_t v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
      int v15 = 138412290;
      uint64_t v16 = v14;
      _os_log_error_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_ERROR,  "provideURLAppendStringMap called, but dataSessionContext is not a flow data provider: %@",  (uint8_t *)&v15,  0xCu);
    }
  }
}

- (void)createPacketChannelForExtension:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_managerObjectFactory);
  }
  else {
    id WeakRetained = 0LL;
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __76__NEAgentFilterExtension_createPacketChannelForExtension_completionHandler___block_invoke;
  v8[3] = &unk_18A0907E8;
  v8[4] = self;
  [WeakRetained managerObjectWithErrorHandler:v8];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 createPacketChannelWithCompletionHandler:v5];
}

- (void)applySettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_managerObjectFactory);
  }
  else {
    id WeakRetained = 0LL;
  }
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __58__NEAgentFilterExtension_applySettings_completionHandler___block_invoke;
  v10[3] = &unk_18A0907E8;
  v10[4] = self;
  [WeakRetained managerObjectWithErrorHandler:v10];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 applySettings:v6 completionHandler:v7];
}

- (void).cxx_destruct
{
}

void __58__NEAgentFilterExtension_applySettings_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Got an XPC error while applying filter settings: %@",  (uint8_t *)&v5,  0xCu);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 0LL, 1LL);
}

- (void)sendFilterStatus:(uint64_t)a3 withError:
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained managerObject];
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"NEFilterErrorDomain" code:a3 userInfo:0];
    [v7 setStatus:a2 error:v6];
  }

void __76__NEAgentFilterExtension_createPacketChannelForExtension_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Got an XPC error while creating a packet filter channel: %@",  (uint8_t *)&v5,  0xCu);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 0LL, 1LL);
}

- (os_log_s)generateClientKey:(int)a3 salt:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return (os_log_s *)0LL;
  }
  if (!pid) {
    goto LABEL_5;
  }
  uint64_t v16 = 0LL;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 buffer = 0u;
  if (proc_pidinfo(pid, 17, 1uLL, &buffer, 56) != 56)
  {
    ne_log_obj();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109120;
      int v12 = pid;
      _os_log_error_impl(&dword_1876B1000, v8, OS_LOG_TYPE_ERROR, "failed to get upid for pid %d", (uint8_t *)&v11, 8u);
    }

    return (os_log_s *)0LL;
  }

  a3 = v14;
LABEL_5:
  __int128 buffer = 0u;
  __int128 v14 = 0u;
  if ((ne_filter_crypto_generate_client_key() & 1) == 0)
  {
    ne_log_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109120;
      int v12 = a3;
      _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "failed to generate client crypto key for salt %u",  (uint8_t *)&v11,  8u);
    }

    goto LABEL_17;
  }

  int v5 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:&buffer length:32];
  if (!v5)
  {
    ne_log_obj();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109120;
      int v12 = a3;
      _os_log_error_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_ERROR,  "failed to create NSData for client crypto key for salt %u",  (uint8_t *)&v11,  8u);
    }

    id v6 = 0LL;
LABEL_17:
    uint64_t v7 = 0LL;
    goto LABEL_18;
  }

  id v6 = v5;
  uint64_t v7 = v6;
LABEL_18:

  return v7;
}

void __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke( uint64_t a1,  const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (!v3) {
    goto LABEL_9;
  }
  if (!objc_getProperty(v3, a2, 104LL, 1))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    if (v8)
    {
      id Property = objc_getProperty(v8, v4, 48LL, 1);
      uint64_t v10 = *(void *)(a1 + 32);
LABEL_8:
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_2;
      v11[3] = &unk_18A08F2E0;
      v11[4] = v10;
      id v13 = *(id *)(a1 + 48);
      id v12 = *(id *)(a1 + 40);
      [Property fetchProviderConnectionWithCompletionHandler:v11];

      return;
    }

void __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(v5, v3, 80LL, 1);
    uint64_t v7 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v7 = 0LL;
    id Property = 0LL;
  }

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_3;
  v9[3] = &unk_18A08F2B8;
  v9[4] = v7;
  id v10 = v4;
  id v12 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  id v8 = v4;
  dispatch_async(Property, v9);
}

uint64_t __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_3( uint64_t a1,  const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, *(id *)(a1 + 40), 104LL);
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    if (v5) {
      id Property = objc_getProperty(v5, v4, 104LL, 1);
    }
    else {
      id Property = 0LL;
    }
  }

  else
  {
    id Property = 0LL;
    uint64_t v6 = *(void *)(a1 + 56);
  }

  return (*(uint64_t (**)(uint64_t, id, void))(v6 + 16))(v6, Property, *(void *)(a1 + 48));
}

- (unsigned)sanitizeFilterFlow:(unsigned int *)a1
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = v4;
    if (!v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        *(void *)uint64_t v31 = "-[NEAgentFilterExtension sanitizeFilterFlow:]";
        _os_log_fault_impl(&dword_1876B1000, v5, OS_LOG_TYPE_FAULT, "%s called with null flow", buf, 0xCu);
      }

      goto LABEL_18;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)uint64_t v31 = v3;
      _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "Sanitizing flow before: %@", buf, 0xCu);
    }

    uint64_t v5 = (os_log_s *)v3;
    id v7 = objc_getProperty(v5, v6, 128LL, 1);

    if (v7)
    {
      -[NEAgentFilterExtension generateClientKey:salt:]((uint64_t)a1, -[os_log_s pid](v5, "pid"), 0);
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = -[os_log_s pid](v5, "pid");
      if (!v8) {
        goto LABEL_15;
      }
    }

    else
    {
      -[NEAgentFilterExtension generateClientKey:salt:]((uint64_t)a1, 0, a1[3]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = a1[3];
      if (!v8)
      {
LABEL_15:
        ne_log_obj();
        __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 67109120;
          *(_DWORD *)uint64_t v31 = v9;
          _os_log_error_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_ERROR,  "Signature validation failed to generate client crypto key for salt %d",  buf,  8u);
        }

LABEL_18:
        a1 = 0LL;
LABEL_19:

        goto LABEL_20;
      }
    }

    id v10 = v8;
    if (![v10 bytes] || objc_msgSend(v10, "length") != 32) {
      goto LABEL_15;
    }
    BOOL v11 = +[NEAgentFilterExtension authenticateFlowWithState:crypto_key:flow:salt:isKernelSocket:]( &OBJC_CLASS___NEAgentFilterExtension,  "authenticateFlowWithState:crypto_key:flow:salt:isKernelSocket:",  *((void *)a1 + 17),  v10,  v5,  v9,  v7 == 0LL);

    if (!v11)
    {
      a1 = 0LL;
      goto LABEL_20;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v12 = v5;
      a1 = (unsigned int *)-[os_log_s copy](v12, "copy");
      objc_msgSend(a1, "setCrypto_signature:", 0);
      [a1 setPid:0];
      [a1 setEpid:0];
      [a1 setUuid:0];
      [a1 setEuuid:0];
      ne_log_obj();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        else {
          uint64_t v24 = @"socket";
        }
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)uint64_t v31 = v24;
        *(_WORD *)&v31[8] = 2112;
        *(void *)&v31[10] = a1;
        _os_log_debug_impl(&dword_1876B1000, v13, OS_LOG_TYPE_DEBUG, "Sanitized %@ socket flow: %@", buf, 0x16u);
      }

      -[os_log_s euuid](v12, "euuid");
      __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        ne_log_obj();
        SEL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v26 = (void *)objc_opt_class();
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)uint64_t v31 = v26;
          id v27 = v26;
          _os_log_error_impl(&dword_1876B1000, v18, OS_LOG_TYPE_ERROR, "Unknown flow class %@", buf, 0xCu);
        }

        a1 = 0LL;
        __int128 v14 = 0LL;
        goto LABEL_33;
      }

      a1 = (unsigned int *)-[os_log_s copy](v5, "copy");
      objc_msgSend(a1, "setCrypto_signature:", 0);
      [a1 setPid:0];
      [a1 setEpid:0];
      [a1 setRequest:0];
      [a1 setResponse:0];
      [a1 setParentURL:0];
      ne_log_obj();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)uint64_t v31 = a1;
        _os_log_debug_impl(&dword_1876B1000, v12, OS_LOG_TYPE_DEBUG, "Sanitized browser flow: %@", buf, 0xCu);
      }

      __int128 v14 = 0LL;
    }

    if (!a1)
    {
LABEL_34:
      uint64_t v5 = v14;
      ne_log_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)uint64_t v31 = a1;
        _os_log_debug_impl(&dword_1876B1000, v23, OS_LOG_TYPE_DEBUG, "Sanitizing flow after: %@", buf, 0xCu);
      }

      goto LABEL_19;
    }

    [a1 URL];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    trimURL(v17);
    SEL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    [a1 setURL:v18];
    [a1 sourceAppIdentifier];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v25 = -[os_log_s pid](v5, "pid");
      *(_DWORD *)__int128 buf = 67109634;
      *(_DWORD *)uint64_t v31 = v25;
      *(_WORD *)&v31[4] = 2112;
      *(void *)&v31[6] = v14;
      *(_WORD *)&v31[14] = 2112;
      *(void *)&v31[16] = v19;
      _os_log_debug_impl( &dword_1876B1000,  v20,  OS_LOG_TYPE_DEBUG,  "LOOKUP: Sanitization (2) looking up pid %d, euuid %@, bundle id: %@",  buf,  0x1Cu);
    }

    +[NEAppInfoCache sharedAppInfoCache]();
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    int v22 = -[os_log_s pid](v5, "pid");
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __45__NEAgentFilterExtension_sanitizeFilterFlow___block_invoke;
    v28[3] = &unk_18A08F310;
    a1 = a1;
    uint64_t v29 = a1;
    -[NEAppInfoCache appInfoForPid:UUID:bundleID:completionHandler:](v21, v22, v14, v19, v28);

LABEL_33:
    goto LABEL_34;
  }

void __45__NEAgentFilterExtension_sanitizeFilterFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3[3];
    [*(id *)(a1 + 32) setSourceAppIdentifier:v5];

    id v6 = v4[4];
    [*(id *)(a1 + 32) setSourceAppVersion:v6];

    id v7 = (os_log_s *)v4[5];
    [*(id *)(a1 + 32) setSourceAppUniqueIdentifier:v7];
  }

  else
  {
    ne_log_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_error_impl(&dword_1876B1000, v7, OS_LOG_TYPE_ERROR, "Could not find app info for flow", v9, 2u);
    }
  }

  [*(id *)(a1 + 32) sourceAppVersion];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8) {
    [*(id *)(a1 + 32) setSourceAppVersion:&stru_18A0915E8];
  }
}

void __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "Got an XPC error while creating a content filter socket: %@",  (uint8_t *)&v5,  0xCu);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 0LL, 1LL);
}

void __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_62(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(v5, v3, 80LL, 1);
    uint64_t v7 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v7 = 0LL;
    id Property = 0LL;
  }

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_2;
  v9[3] = &unk_18A08F098;
  id v10 = v4;
  uint64_t v11 = v7;
  id v8 = v4;
  dispatch_async(Property, v9);
}

void __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    ne_log_obj();
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl(&dword_1876B1000, v15, OS_LOG_TYPE_ERROR, "Failed to create a content filter socket", buf, 2u);
    }

    -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 40), 0LL, 1LL);
    return;
  }

  int v3 = [v2 fileDescriptor];
  uint64_t v4 = *(void *)(a1 + 40);
  if (!v4
    || (-[NEAgentFilterExtension generateClientKey:salt:](v4, 0, *(_DWORD *)(v4 + 12)),
        (int v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    ne_log_obj();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "sendSocketContentFilterRequest called, but failed to create client crypto key for kernel",  buf,  2u);
    }

    uint64_t v17 = 0LL;
    goto LABEL_23;
  }

  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = v5;
  id v8 = v7;
  if (!v6) {
    goto LABEL_19;
  }
  if (v3 < 0 || -[os_log_s length](v7, "length") != 32)
  {
    ne_log_obj();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)__int128 buf = 0;
    id v21 = "No control socket or invalid crypto key for sending crypto key";
    int v22 = buf;
    v23 = v16;
    uint32_t v24 = 2;
LABEL_32:
    _os_log_error_impl(&dword_1876B1000, v23, OS_LOG_TYPE_ERROR, v21, v22, v24);
    goto LABEL_18;
  }

  *(_OWORD *)__int128 buf = xmmword_187873280;
  uint64_t v27 = 0LL;
  uint64_t v9 = (__int128 *)-[os_log_s bytes](v8, "bytes");
  unint64_t v10 = 0LL;
  __int128 v11 = v9[1];
  __int128 v28 = *v9;
  __int128 v29 = v11;
  while (1)
  {
    ssize_t v12 = write(v3, &buf[v10], 56 - v10);
    id v13 = __error();
    if (v12 < 1) {
      break;
    }
    v10 += v12;
LABEL_12:
    if (v10 >= 0x38) {
      goto LABEL_19;
    }
  }

  if (!v12) {
    goto LABEL_12;
  }
  int v14 = *v13;
  if (*v13 == 35) {
    goto LABEL_12;
  }
  ne_log_obj();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v20;
  if (v14 != 2)
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LODWORD(v25) = 136315138;
    *(void *)((char *)&v25 + 4) = strerror(v14);
    id v21 = "Write operation on the control socket failed while sending the crypto key: (%s)";
    int v22 = (uint8_t *)&v25;
    v23 = v16;
    uint32_t v24 = 12;
    goto LABEL_32;
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_debug_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_DEBUG,  "Failed to send crypto key to kernel",  (uint8_t *)&v25,  2u);
  }

- (void)handleExtensionExit:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(a1, v3, 80LL, 1);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __46__NEAgentFilterExtension_handleExtensionExit___block_invoke;
    v6[3] = &unk_18A08F098;
    v6[4] = a1;
    id v7 = v4;
    dispatch_async(Property, v6);
  }
}

void __46__NEAgentFilterExtension_handleExtensionExit___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  int v3 = *(_BYTE **)(a1 + 32);
  if (!v3)
  {
LABEL_4:
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v18 = v5;
      _os_log_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_DEFAULT,  "Scheduing timer for Filter extension failure/exit for %@",  buf,  0xCu);
    }

    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      id Property = (dispatch_queue_s *)objc_getProperty(v7, v6, 80LL, 1);
      uint64_t v9 = *(void *)(a1 + 32);
    }

    else
    {
      uint64_t v9 = 0LL;
      id Property = 0LL;
    }

    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __46__NEAgentFilterExtension_handleExtensionExit___block_invoke_41;
    v15[3] = &unk_18A08F098;
    v15[4] = v9;
    id v16 = *(id *)(a1 + 40);
    NECreateTimerSource(Property, 5LL, v15);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    ssize_t v12 = *(void **)(a1 + 32);
    if (v12) {
      objc_setProperty_atomic(v12, v10, v11, 128LL);
    }

    return;
  }

  if ((v3[10] & 1) == 0)
  {
    if (objc_getProperty(v3, a2, 128LL, 1)) {
      return;
    }
    goto LABEL_4;
  }

  ne_log_obj();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v18 = v14;
    _os_log_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_DEFAULT,  "Filter App updating - ignore extension failure/exit for %@",  buf,  0xCu);
  }
}

void __46__NEAgentFilterExtension_handleExtensionExit___block_invoke_41(uint64_t a1, const char *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  int v3 = *(void **)(a1 + 32);
  if (!v3) {
    goto LABEL_9;
  }
  if (objc_getProperty(v3, a2, 128LL, 1))
  {
    id Property = *(dispatch_source_s **)(a1 + 32);
    if (Property) {
      id Property = (dispatch_source_s *)objc_getProperty(Property, v4, 128LL, 1);
    }
    dispatch_source_cancel(Property);
    id v7 = *(void **)(a1 + 32);
    if (!v7) {
      goto LABEL_9;
    }
    objc_setProperty_atomic(v7, v6, 0LL, 128LL);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (!v8 || (*(_BYTE *)(v8 + 10) & 1) == 0)
  {
LABEL_9:
    ne_log_obj();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "Handle Filter extension failure/exit for %@ - disconnect session",  (uint8_t *)&v14,  0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      -[NEAgentFilterExtension sendFilterStatus:withError:](v10, 0LL, 1LL);
    }
    return;
  }

  ne_log_obj();
  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    int v14 = 138412290;
    uint64_t v15 = v12;
    _os_log_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEFAULT,  "Filter App updating - ignore extension failure/exit for %@",  (uint8_t *)&v14,  0xCu);
  }
}

void __54__NEAgentFilterExtension_extension_didStartWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  -[NEAgentFilterExtension handleStopCompleteWithError:]((uint64_t)WeakRetained, v3);
}

- (void)handleStopCompleteWithError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = v3 != 0LL;
    id v12 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 domain];
      if (v5
        && (uint64_t v6 = (void *)v5,
            [v12 domain],
            id v7 = (void *)objc_claimAutoreleasedReturnValue(),
            int v8 = [v7 isEqualToString:@"NEAgentErrorDomain"],
            v7,
            v6,
            v8))
      {
        if ([v12 code] == 3)
        {
          uint64_t v9 = 0LL;
          uint64_t v10 = 4LL;
        }

        else
        {
          uint64_t v11 = [v12 code];
          uint64_t v10 = 0LL;
          if (v11 == 2) {
            uint64_t v9 = 2LL;
          }
          else {
            uint64_t v9 = v4;
          }
        }
      }

      else
      {
        uint64_t v10 = 0LL;
        uint64_t v9 = 1LL;
      }
    }

    else
    {
      uint64_t v10 = 0LL;
      uint64_t v9 = 0LL;
    }

    -[NEAgentFilterExtension sendFilterStatus:withError:](a1, v10, v9);
    id v3 = v12;
  }
}

void __46__NEAgentFilterExtension_updateConfiguration___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 provider];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {
    objc_setProperty_atomic(v5, v3, v4, 112LL);
  }

  uint64_t v6 = *(_BYTE **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  if (v6)
  {
    if ((v6[8] & 1) != 0)
    {
      id v8 = objc_getProperty(v6, v7, 48LL, 1);
      objc_msgSend(v8, "setConfiguration:extensionIdentifier:", v12, objc_getProperty(v6, v9, 88, 1));
    }

    if ((v6[9] & 1) != 0)
    {
      id v10 = objc_getProperty(v6, v7, 56LL, 1);
      objc_msgSend(v10, "setConfiguration:extensionIdentifier:", v12, objc_getProperty(v6, v11, 96, 1));
    }
  }
}

void __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)__int128 buf = 138412290;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_INFO, "%@: Data Extension sleep event complete", buf, 0xCu);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  if (!v5) {
    goto LABEL_7;
  }
  id v6 = objc_getProperty(v5, v4, 40LL, 1);
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (!v7)
  {

    goto LABEL_7;
  }

  char v8 = *(_BYTE *)(v7 + 9);

  if ((v8 & 1) == 0)
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    return;
  }

  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    id Property = objc_getProperty(v10, v9, 56LL, 1);
    uint64_t v12 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v12 = 0LL;
    id Property = 0LL;
  }

  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke_61;
  v13[3] = &unk_18A0908C8;
  v13[4] = v12;
  id v14 = *(id *)(a1 + 40);
  [Property sleepWithCompletionHandler:v13];
}

uint64_t __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke_61(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_INFO,  "%@: Control Extension sleep event complete.",  (uint8_t *)&v5,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __37__NEAgentFilterExtension_startFilter__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(_BYTE **)(a1 + 32);
  if (!v3 || (v3[8] & 1) == 0) {
    goto LABEL_6;
  }
  id v4 = objc_getProperty(v3, a2, 40LL, 1);
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (!v6)
    {

      goto LABEL_6;
    }

    char v7 = *(_BYTE *)(v6 + 9);

    if ((v7 & 1) == 0)
    {
LABEL_6:
      ne_log_obj();
      char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17[0]) = 0;
        _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "Data or Control Extension not initialized.",  (uint8_t *)v17,  2u);
      }

      -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 0LL, 1LL);
      return;
    }
  }

  SEL v9 = *(_BYTE **)(a1 + 32);
  if (v9)
  {
    char v10 = v9[9];
    id Property = objc_getProperty(v9, v5, 112LL, 1);
    if (Property) {
      Property[11] = v10 & 1;
    }
    uint64_t v12 = *(void **)(a1 + 32);
    if (v12)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      id v14 = objc_getProperty(v12, v13, 48LL, 1);
      id v16 = objc_getProperty(v12, v15, 112LL, 1);
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __46__NEAgentFilterExtension_startFilterExtension__block_invoke;
      v17[3] = &unk_18A08F268;
      objc_copyWeak(&v18, &location);
      [v14 startFilterWithOptions:v16 completionHandler:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }

void __46__NEAgentFilterExtension_startFilterExtension__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  -[NEAgentFilterExtension handleStopCompleteWithError:]((uint64_t)WeakRetained, v3);
}

void __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke( uint64_t a1,  const char *a2)
{
  id v3 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (v3 && objc_getProperty(v3, a2, 40LL, 1))
    {
      int v5 = *(void **)(a1 + 32);
      id v4 = *(void **)(a1 + 40);
      uint64_t v6 = MEMORY[0x1895F87A8];
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke_60;
      v14[3] = &unk_18A08F070;
      v14[4] = v5;
      id v15 = *(id *)(a1 + 48);
      id v7 = v4;
      SEL v9 = v14;
      if (v5)
      {
        id Property = (dispatch_queue_s *)objc_getProperty(v5, v8, 80LL, 1);
        block[0] = v6;
        block[1] = 3221225472LL;
        block[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke;
        block[3] = &unk_18A08FB50;
        block[4] = v5;
        id v18 = v9;
        id v17 = v7;
        dispatch_async(Property, block);
      }
    }

    else
    {
      ne_log_obj();
      SEL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(block[0]) = 0;
        _os_log_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEFAULT, "Control Extension not present", (uint8_t *)block, 2u);
      }

      uint64_t v12 = *(void *)(a1 + 48);
      SEL v13 = (void *)-[NEAgentFilterExtension copyProcessIdentities](*(void **)(a1 + 32));
      (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, 1LL, v13);
    }
  }

  else
  {
    -[NEAgentFilterExtension cleanupOnStartFailure](v3, a2);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke( id *a1,  const char *a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v3 = a1[4];
  if (!v3) {
    goto LABEL_16;
  }
  id Property = objc_getProperty(v3, a2, 48LL, 1);
  uint64_t v6 = a1[4];
  if (Property)
  {
    if (v6)
    {
      uint64_t v6 = objc_getProperty(a1[4], v5, 48LL, 1);
      id v7 = a1[4];
    }

    else
    {
      id v7 = 0LL;
    }

    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    id v22[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2;
    v22[3] = &unk_18A08F1F0;
    v22[4] = v7;
    id v24 = a1[6];
    id v23 = a1[5];
    [v6 createWithCompletionHandler:v22];

    return;
  }

  if (v6)
  {
    objc_setProperty_atomic(a1[4], v5, 0LL, 104LL);
    v6[4] = 0;
    id v8 = a1[4];
  }

  else
  {
LABEL_16:
    id v8 = 0LL;
  }

  objc_initWeak(&location, v8);
  ne_log_obj();
  SEL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = a1[4];
    if (v11) {
      id v11 = objc_getProperty(v11, v10, 32LL, 1);
    }
    id v12 = v11;
    [v12 identifier];
    SEL v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412290;
    v26 = v13;
    _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEFAULT,  "Beginning data extension request with extension %@",  buf,  0xCu);
  }

  id v15 = a1[4];
  if (v15) {
    id v15 = objc_getProperty(v15, v14, 32LL, 1);
  }
  id v16 = v15;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_53;
  v17[3] = &unk_18A08F240;
  objc_copyWeak(&v20, &location);
  id v19 = a1[6];
  id v18 = a1[5];
  [v16 beginExtensionRequestWithInputItems:0 completion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2( uint64_t a1,  const char *a2)
{
  char v2 = (char)a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id Property = (dispatch_queue_s *)objc_getProperty(v4, a2, 80LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_3;
  v9[3] = &unk_18A08F1C8;
  char v12 = v2;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v11 = v6;
  void v9[4] = v7;
  id v10 = v8;
  dispatch_async(Property, v9);
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_53( id *a1,  void *a2,  void *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  ne_log_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v9)
    {
      objc_msgSend(objc_getProperty(WeakRetained, v10, 32, 1), "identifier");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412546;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "Extension request with data extension %@ started with identifier %@",  buf,  0x16u);
    }

    id Property = (dispatch_queue_s *)objc_getProperty(WeakRetained, v12, 80LL, 1);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_54;
    block[3] = &unk_18A08F218;
    id v15 = v6;
    id v16 = WeakRetained;
    id v19 = a1[5];
    id v17 = v5;
    id v18 = a1[4];
    dispatch_async(Property, block);
  }

  else
  {
    if (v9)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "strongself is nil after data extension request started",  buf,  2u);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_54( uint64_t a1,  const char *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    ne_log_obj();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id Property = *(id *)(a1 + 40);
      if (Property) {
        id Property = objc_getProperty(Property, v4, 88LL, 1);
      }
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)__int128 buf = 138412546;
      id v25 = Property;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "Failed to start the data extension %@: %@",  buf,  0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    id v5 = *(id *)(a1 + 40);
    if (v5) {
      id v5 = objc_getProperty(v5, a2, 32LL, 1);
    }
    -[NSExtension extensionHostContextForUUID:](v5, *(void *)(a1 + 48));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      id v8 = *(void **)(a1 + 40);
      if (v8)
      {
        objc_setProperty_atomic(v8, v6, *(id *)(a1 + 48), 64LL);
        id v10 = *(void **)(a1 + 40);
        if (v10)
        {
          objc_setProperty_atomic(v10, v9, v7, 48LL);
          SEL v12 = *(void **)(a1 + 40);
          if (v12)
          {
            SEL v13 = (id *)objc_getProperty(*(id *)(a1 + 40), v11, 48LL, 1);
            if (v13) {
              objc_storeWeak(v13 + 7, v12);
            }
          }
        }
      }

      id v14 = *(_BYTE **)(a1 + 40);
      if (v14)
      {
        v14[8] = 1;
        id v14 = *(_BYTE **)(a1 + 40);
      }

      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_55;
      v20[3] = &unk_18A08F1A0;
      id v21 = v14;
      id v22 = *(id *)(a1 + 56);
      id v23 = *(id *)(a1 + 64);
      [v7 validateWithCompletionHandler:v20];
    }

    else
    {
      ne_log_obj();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v19 = *(id *)(a1 + 40);
        if (v19) {
          id v19 = objc_getProperty(v19, v16, 88LL, 1);
        }
        *(_DWORD *)__int128 buf = 138412290;
        id v25 = v19;
        _os_log_error_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_ERROR,  "Failed to get the host context for data extension %@",  buf,  0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    }
  }

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_55( uint64_t a1,  void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(v5, v3, 80LL, 1);
    uint64_t v7 = *(void **)(a1 + 32);
  }

  else
  {
    uint64_t v7 = 0LL;
    id Property = 0LL;
  }

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2_56;
  v9[3] = &unk_18A08F2B8;
  id v10 = v4;
  id v11 = v7;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v8 = v4;
  dispatch_async(Property, v9);
}

uint64_t __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2_56( void *a1,  const char *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1[4])
  {
    ne_log_obj();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = a1[4];
      int v16 = 138412290;
      uint64_t v17 = v15;
      _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "Filter Data provider validation failed with error: %@",  (uint8_t *)&v16,  0xCu);
    }

    return (*(uint64_t (**)(void))(a1[7] + 16LL))();
  }

  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, a2, 48LL, 1);
    }
    id v7 = Property;
    id v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    if (v8) {
      id v10 = objc_getProperty(v8, v6, 88LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    [v7 setConfiguration:v9 extensionIdentifier:v10];

    [(id)a1[6] contentFilter];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 provider];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = (void *)a1[5];
    if (v14) {
      objc_setProperty_atomic(v14, v12, v13, 112LL);
    }

    return (*(uint64_t (**)(void, uint64_t))(a1[7] + 16LL))(a1[7], 1LL);
  }

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_3( uint64_t a1,  const char *a2)
{
  if (*(_BYTE *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      *(_BYTE *)(v3 + 8) = 1;
      id v4 = *(void **)(a1 + 32);
      if (v4)
      {
        id Property = objc_getProperty(v4, a2, 48LL, 1);
        uint64_t v3 = *(void *)(a1 + 32);
LABEL_5:
        v6[0] = MEMORY[0x1895F87A8];
        v6[1] = 3221225472LL;
        v6[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_4;
        v6[3] = &unk_18A08F1A0;
        v6[4] = v3;
        id v7 = *(id *)(a1 + 40);
        id v8 = *(id *)(a1 + 48);
        [Property validateWithCompletionHandler:v6];

        return;
      }

      uint64_t v3 = 0LL;
    }

    id Property = 0LL;
    goto LABEL_5;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_4( uint64_t a1,  void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(v5, v3, 80LL, 1);
    uint64_t v7 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v7 = 0LL;
    id Property = 0LL;
  }

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_5;
  v9[3] = &unk_18A08F2B8;
  id v10 = v4;
  uint64_t v11 = v7;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v8 = v4;
  dispatch_async(Property, v9);
}

uint64_t __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_5( void *a1,  const char *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1[4])
  {
    ne_log_obj();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = a1[4];
      int v16 = 138412290;
      uint64_t v17 = v15;
      _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "Filter provider validation failed: %@",  (uint8_t *)&v16,  0xCu);
    }

    return (*(uint64_t (**)(void))(a1[7] + 16LL))();
  }

  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, a2, 48LL, 1);
    }
    id v7 = Property;
    id v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    if (v8) {
      id v10 = objc_getProperty(v8, v6, 88LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    [v7 setConfiguration:v9 extensionIdentifier:v10];

    [(id)a1[6] contentFilter];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 provider];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = (void *)a1[5];
    if (v14) {
      objc_setProperty_atomic(v14, v12, v13, 112LL);
    }

    return (*(uint64_t (**)(void, uint64_t))(a1[7] + 16LL))(a1[7], 1LL);
  }

- (void)cleanupOnStartFailure
{
  if (a1)
  {
    if (objc_getProperty(a1, a2, 64LL, 1))
    {
      id v4 = objc_getProperty(a1, v3, 32LL, 1);
      objc_msgSend(v4, "cancelExtensionRequestWithIdentifier:", objc_getProperty(a1, v5, 64, 1));
    }

    if (objc_getProperty(a1, v3, 72LL, 1))
    {
      id v7 = objc_getProperty(a1, v6, 40LL, 1);
      objc_msgSend(v7, "cancelExtensionRequestWithIdentifier:", objc_getProperty(a1, v8, 72, 1));
    }

    objc_setProperty_atomic(a1, v6, 0LL, 48LL);
    objc_setProperty_atomic(a1, v9, 0LL, 64LL);
    a1[8] = 0;
    objc_setProperty_atomic(a1, v10, 0LL, 56LL);
    objc_setProperty_atomic(a1, v11, 0LL, 72LL);
    a1[9] = 0;
  }

- (uint64_t)copyProcessIdentities
{
  if (!a1) {
    return 0LL;
  }
  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (objc_getProperty(a1, v3, 56LL, 1))
  {
    id Property = objc_getProperty(a1, v4, 56LL, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v6, 64LL, 1);
    }
    id v7 = Property;
  }

  else
  {
    id v7 = 0LL;
  }

  if (!objc_getProperty(a1, v4, 48LL, 1))
  {
    id v11 = 0LL;
    if (v7) {
      goto LABEL_11;
    }
LABEL_14:
    ne_log_obj();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_DEFAULT,  "No control extension process identity is available",  buf,  2u);
    }

    if (v11) {
      goto LABEL_12;
    }
LABEL_17:
    ne_log_obj();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v16 = 0;
      _os_log_error_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_ERROR,  "No data extension process identity is available",  v16,  2u);
    }

    goto LABEL_20;
  }

  id v9 = objc_getProperty(a1, v8, 48LL, 1);
  if (v9) {
    id v9 = objc_getProperty(v9, v10, 64LL, 1);
  }
  id v11 = v9;
  if (!v7) {
    goto LABEL_14;
  }
LABEL_11:
  [v2 addObject:v7];
  if (!v11) {
    goto LABEL_17;
  }
LABEL_12:
  [v2 addObject:v11];
LABEL_20:
  uint64_t v14 = [objc_alloc(MEMORY[0x189603F18]) initWithArray:v2];

  return v14;
}

void __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke_60( uint64_t a1,  const char *a2)
{
  if ((a2 & 1) != 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = (id)-[NEAgentFilterExtension copyProcessIdentities](*(void **)(a1 + 32));
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, 1LL, v4);
  }

  else
  {
    -[NEAgentFilterExtension cleanupOnStartFailure](*(_BYTE **)(a1 + 32), a2);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke( id *a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  objc_initWeak(&location, a1[4]);
  ne_log_obj();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id Property = a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 40LL, 1);
    }
    id v5 = Property;
    [v5 identifier];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)__int128 buf = 138412290;
    int v16 = v6;
    _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Beginning control extension request with extension %@",  buf,  0xCu);
  }

  id v8 = a1[4];
  if (v8) {
    id v8 = objc_getProperty(v8, v7, 40LL, 1);
  }
  id v9 = v8;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_57;
  v10[3] = &unk_18A08F240;
  objc_copyWeak(&v13, &location);
  id v12 = a1[6];
  id v11 = a1[5];
  [v9 beginExtensionRequestWithInputItems:0 completion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_57( id *a1,  void *a2,  void *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  ne_log_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v9)
    {
      objc_msgSend(objc_getProperty(WeakRetained, v10, 40, 1), "identifier");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)__int128 buf = 138412546;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "Extension request with control extension %@ started with identifier %@",  buf,  0x16u);
    }

    id Property = (dispatch_queue_s *)objc_getProperty(WeakRetained, v12, 80LL, 1);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_58;
    block[3] = &unk_18A08F218;
    id v15 = v6;
    id v16 = WeakRetained;
    id v19 = a1[5];
    id v17 = v5;
    id v18 = a1[4];
    dispatch_async(Property, block);
  }

  else
  {
    if (v9)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "strongself is nil after control extension request started",  buf,  2u);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
}

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_58( uint64_t a1,  const char *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    ne_log_obj();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id Property = *(id *)(a1 + 40);
      if (Property) {
        id Property = objc_getProperty(Property, v4, 96LL, 1);
      }
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)__int128 buf = 138412546;
      id v25 = Property;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      _os_log_error_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_ERROR,  "Failed to start control extension %@: %@",  buf,  0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  else
  {
    id v5 = *(id *)(a1 + 40);
    if (v5) {
      id v5 = objc_getProperty(v5, a2, 40LL, 1);
    }
    -[NSExtension extensionHostContextForUUID:](v5, *(void *)(a1 + 48));
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      id v8 = *(void **)(a1 + 40);
      if (v8)
      {
        objc_setProperty_atomic(v8, v6, *(id *)(a1 + 48), 72LL);
        SEL v10 = *(void **)(a1 + 40);
        if (v10)
        {
          objc_setProperty_atomic(v10, v9, v7, 56LL);
          SEL v12 = *(void **)(a1 + 40);
          if (v12)
          {
            id v13 = (id *)objc_getProperty(*(id *)(a1 + 40), v11, 56LL, 1);
            if (v13) {
              objc_storeWeak(v13 + 7, v12);
            }
          }
        }
      }

      uint64_t v14 = *(_BYTE **)(a1 + 40);
      if (v14)
      {
        v14[9] = 1;
        uint64_t v14 = *(_BYTE **)(a1 + 40);
      }

      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_59;
      v20[3] = &unk_18A08F1A0;
      id v21 = v14;
      id v22 = *(id *)(a1 + 56);
      id v23 = *(id *)(a1 + 64);
      [v7 validateWithCompletionHandler:v20];
    }

    else
    {
      ne_log_obj();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v19 = *(id *)(a1 + 40);
        if (v19) {
          id v19 = objc_getProperty(v19, v16, 96LL, 1);
        }
        *(_DWORD *)__int128 buf = 138412290;
        id v25 = v19;
        _os_log_error_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_ERROR,  "Failed to get the host context for control extension %@",  buf,  0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    }
  }

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_59( void *a1,  void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  if (v4)
  {
    ne_log_obj();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_error_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_ERROR,  "Filter Control validation failed with error: %@",  (uint8_t *)&v13,  0xCu);
    }

    id v6 = *(void (**)(void))(a1[6] + 16LL);
  }

  else
  {
    id Property = (id)a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 56LL, 1);
    }
    id v9 = Property;
    SEL v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    if (v10) {
      id v12 = objc_getProperty(v10, v8, 96LL, 1);
    }
    else {
      id v12 = 0LL;
    }
    [v9 setConfiguration:v11 extensionIdentifier:v12];

    id v6 = *(void (**)(void))(a1[6] + 16LL);
  }

  v6();
}

void __41__NEAgentFilterExtension_driverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6F4920];
  v1 = (void *)driverInterface_driverInterface_18189;
  driverInterface_driverInterface_18189 = v0;
}

void __42__NEAgentFilterExtension_managerInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6FDB60];
  v1 = (void *)managerInterface_managerInterface_18193;
  managerInterface_managerInterface_18193 = v0;
}

void __47__NEAgentFilterExtension_handleAppsUpdateEnds___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v4 = *(_BYTE **)(a1 + 32);
  if (!v4 || (v4[11] & 1) == 0) {
    return;
  }
  id v6 = objc_getProperty(v4, a2, 88LL, 1);
  if (!v6) {
    goto LABEL_8;
  }
  id Property = *(id *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v5, 88LL, 1);
  }
  id v2 = Property;
  if (![v8 containsObject:v2])
  {
LABEL_8:
    id v9 = *(void **)(a1 + 32);
    if (v9 && (id v10 = objc_getProperty(v9, v5, 96LL, 1)) != 0LL)
    {
      id v12 = v10;
      int v13 = *(void **)(a1 + 32);
      id v14 = *(void **)(a1 + 40);
      if (v13) {
        id v15 = objc_getProperty(v13, v11, 96LL, 1);
      }
      else {
        id v15 = 0LL;
      }
      int v16 = [v14 containsObject:v15];

      if (v6)
      {
LABEL_13:

        if ((v16 & 1) == 0) {
          return;
        }
        goto LABEL_17;
      }
    }

    else
    {
      int v16 = 0;
      if (v6) {
        goto LABEL_13;
      }
    }

    if (!v16) {
      return;
    }
    goto LABEL_17;
  }

LABEL_17:
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17)
  {
    *(_BYTE *)(v17 + 10) = 0;
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      *(_BYTE *)(v18 + 11) = 0;
    }
  }

  ne_log_obj();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = *(id *)(a1 + 32);
    if (v21)
    {
      id v23 = objc_getProperty(v21, v20, 88LL, 1);
      id v21 = *(id *)(a1 + 32);
      if (v21) {
        id v21 = objc_getProperty(v21, v22, 96LL, 1);
      }
    }

    else
    {
      id v23 = 0LL;
    }

    int v24 = 138412546;
    id v25 = v23;
    __int16 v26 = 2112;
    id v27 = v21;
    _os_log_impl( &dword_1876B1000,  v19,  OS_LOG_TYPE_DEFAULT,  "Extensions %@ and %@ have been updated, idling",  (uint8_t *)&v24,  0x16u);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 0LL, 0LL);
}

void __49__NEAgentFilterExtension_handleAppsUpdateEnding___block_invoke(uint64_t a1, const char *a2)
{
  id v4 = *(_BYTE **)(a1 + 32);
  if (v4 && (v4[10] & 1) != 0 && (v4[11] & 1) == 0)
  {
    id v6 = objc_getProperty(v4, a2, 88LL, 1);
    if (v6)
    {
      id Property = *(id *)(a1 + 32);
      id v8 = *(void **)(a1 + 40);
      if (Property) {
        id Property = objc_getProperty(Property, v5, 88LL, 1);
      }
      id v2 = Property;
      if ([v8 containsObject:v2])
      {

LABEL_18:
        uint64_t v17 = *(void *)(a1 + 32);
        if (v17) {
          *(_BYTE *)(v17 + 11) = 1;
        }
        return;
      }
    }

    id v9 = *(void **)(a1 + 32);
    if (v9 && (id v10 = objc_getProperty(v9, v5, 96LL, 1)) != 0LL)
    {
      id v12 = v10;
      int v13 = *(void **)(a1 + 32);
      id v14 = *(void **)(a1 + 40);
      if (v13) {
        id v15 = objc_getProperty(v13, v11, 96LL, 1);
      }
      else {
        id v15 = 0LL;
      }
      int v16 = [v14 containsObject:v15];

      if (v6)
      {
LABEL_14:

        if ((v16 & 1) == 0) {
          return;
        }
        goto LABEL_18;
      }
    }

    else
    {
      int v16 = 0;
      if (v6) {
        goto LABEL_14;
      }
    }

    if (!v16) {
      return;
    }
    goto LABEL_18;
  }

void __49__NEAgentFilterExtension_handleAppsUpdateBegins___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if ((*(_BYTE *)(v2 + 10) & 1) != 0) {
      return;
    }
    uint64_t v3 = *(void *)(v2 + 24);
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  if ([*(id *)(a1 + 40) containsObject:v3])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      *(_BYTE *)(v5 + 10) = 1;
      id v6 = *(void **)(a1 + 32);
      if (v6)
      {
        if (objc_getProperty(v6, v4, 128LL, 1))
        {
          id Property = *(dispatch_source_s **)(a1 + 32);
          if (Property) {
            id Property = (dispatch_source_s *)objc_getProperty(Property, v7, 128LL, 1);
          }
          dispatch_source_cancel(Property);
          id v10 = *(void **)(a1 + 32);
          if (v10) {
            objc_setProperty_atomic(v10, v9, 0LL, 128LL);
          }
        }
      }
    }

    ne_log_obj();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *(id *)(a1 + 32);
      if (v13)
      {
        id v15 = objc_getProperty(v13, v12, 88LL, 1);
        id v13 = *(id *)(a1 + 32);
        if (v13) {
          id v13 = objc_getProperty(v13, v14, 96LL, 1);
        }
      }

      else
      {
        id v15 = 0LL;
      }

      int v16 = 138412546;
      id v17 = v15;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEFAULT,  "Extensions %@ and %@ are being updated, stopping",  (uint8_t *)&v16,  0x16u);
    }

    -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 4LL, 0LL);
    -[NEAgentFilterExtension stopFilterExtensionWithReason:](*(_BYTE **)(a1 + 32), 40LL);
  }

- (void)stopFilterExtensionWithReason:(_BYTE *)a1
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = ne_session_stop_reason_to_string();
      _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEFAULT, "Stopping filter with reason %s", (uint8_t *)&v6, 0xCu);
    }

    if ((a1[8] & 1) != 0) {
      objc_msgSend(objc_getProperty(a1, v5, 48, 1), "stopWithReason:", a2);
    }
    if ((a1[9] & 1) != 0) {
      objc_msgSend(objc_getProperty(a1, v5, 56, 1), "stopWithReason:", a2);
    }
    objc_setProperty_atomic(a1, v5, 0LL, 104LL);
    *((_WORD *)a1 + 4) = 0;
  }

uint64_t __61__NEAgentFilterExtension_handleDisposeWithCompletionHandler___block_invoke( uint64_t a1,  const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = objc_getProperty(v3, a2, 48LL, 1);
    if (v4)
    {

      goto LABEL_6;
    }

    uint64_t v7 = *(void **)(a1 + 32);
    if (v7 && objc_getProperty(v7, v5, 56LL, 1))
    {
LABEL_6:
      uint64_t v8 = *(void **)(a1 + 32);
      if (v8)
      {
        objc_setProperty_atomic_copy(v8, v6, *(id *)(a1 + 40), 144LL);
        uint64_t v8 = *(void **)(a1 + 32);
      }

      return [v8 handleCancel];
    }
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke(uint64_t a1, const char *a2)
{
  char v2 = (char)a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id Property = (dispatch_queue_s *)objc_getProperty(v4, a2, 80LL, 1);
  }
  else {
    id Property = 0LL;
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_2;
  block[3] = &unk_18A08F048;
  char v9 = v2;
  id v6 = *(id *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v6;
  dispatch_async(Property, block);
}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  ne_log_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v5 count];
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v9, 88LL, 1);
    }
    else {
      id Property = 0LL;
    }
    *(_DWORD *)__int128 buf = 134218242;
    uint64_t v31 = (const __CFString *)v10;
    __int16 v32 = 2112;
    id v33 = Property;
    _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "Found %lu data extension(s) with identifier %@",  buf,  0x16u);
  }

  if (v5 && !v6 && [v5 count] && WeakRetained)
  {
    objc_initWeak((id *)buf, WeakRetained);
    [v5 objectAtIndexedSubscript:0];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(WeakRetained, v13, v12, 32LL);

    uint64_t v14 = MEMORY[0x1895F87A8];
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_44;
    v28[3] = &unk_18A08F100;
    objc_copyWeak(&v29, (id *)buf);
    id v16 = objc_getProperty(WeakRetained, v15, 32LL, 1);
    [v16 setRequestInterruptionBlock:v28];

    v26[0] = v14;
    v26[1] = 3221225472LL;
    v26[2] = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_46;
    v26[3] = &unk_18A08F128;
    objc_copyWeak(&v27, (id *)buf);
    id v18 = objc_getProperty(WeakRetained, v17, 32LL, 1);
    [v18 setRequestCompletionBlock:v26];

    v24[0] = v14;
    v24[1] = 3221225472LL;
    v24[2] = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_2;
    void v24[3] = &unk_18A08F150;
    objc_copyWeak(&v25, (id *)buf);
    id v20 = objc_getProperty(WeakRetained, v19, 32LL, 1);
    [v20 setRequestCancellationBlock:v24];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    ne_log_obj();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      if (WeakRetained) {
        id v23 = objc_getProperty(WeakRetained, v22, 88LL, 1);
      }
      else {
        id v23 = 0LL;
      }
      *(_DWORD *)__int128 buf = 138412802;
      uint64_t v31 = @"com.apple.networkextension.filter-data";
      __int16 v32 = 2112;
      id v33 = v23;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_error_impl( &dword_1876B1000,  v21,  OS_LOG_TYPE_ERROR,  "Failed to create a %@ extension with identifier %@: %@",  buf,  0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_44( uint64_t a1,  void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v6, 88LL, 1);
    }
    else {
      id Property = 0LL;
    }
    int v10 = 138412290;
    id v11 = Property;
    _os_log_error_impl(&dword_1876B1000, v5, OS_LOG_TYPE_ERROR, "Extension %@ died unexpectedly", (uint8_t *)&v10, 0xCu);
  }

  if (WeakRetained) {
    id v8 = objc_getProperty(WeakRetained, v7, 64LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  if ([v3 isEqual:v8])
  {
    -[NEAgentFilterExtension handleExtensionExit:](WeakRetained, v3);
    -[NEAgentFilterExtension cleanupDataExtensionWithRequestIdentifier:](WeakRetained, v3);
  }
}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_46( uint64_t a1,  void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    id Property = objc_getProperty(WeakRetained, v4, 64LL, 1);
  }
  else {
    id Property = 0LL;
  }
}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    id Property = objc_getProperty(WeakRetained, v4, 64LL, 1);
  }
  else {
    id Property = 0LL;
  }
}

- (void)cleanupDataExtensionWithRequestIdentifier:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(a1, v3, 80LL, 1);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __68__NEAgentFilterExtension_cleanupDataExtensionWithRequestIdentifier___block_invoke;
    v6[3] = &unk_18A08F098;
    v6[4] = a1;
    id v7 = v4;
    dispatch_async(Property, v6);
  }
}

uint64_t __68__NEAgentFilterExtension_cleanupDataExtensionWithRequestIdentifier___block_invoke( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    objc_setProperty_atomic(Property, a2, 0LL, 64LL);
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 32LL, 1);
    }
  }

  [Property setRequestInterruptionBlock:0];
  id v6 = *(id *)(a1 + 32);
  if (v6) {
    id v6 = objc_getProperty(v6, v5, 32LL, 1);
  }
  [v6 setRequestCancellationBlock:0];
  id v8 = *(id *)(a1 + 32);
  if (v8) {
    id v8 = objc_getProperty(v8, v7, 32LL, 1);
  }
  [v8 setRequestCompletionBlock:0];
  id v10 = *(id *)(a1 + 32);
  if (v10) {
    id v10 = objc_getProperty(v10, v9, 32LL, 1);
  }
  [v10 cancelExtensionRequestWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12) {
    id v13 = objc_getProperty(v12, v11, 48LL, 1);
  }
  else {
    id v13 = 0LL;
  }
  return [v12 extensionDidStop:v13];
}

void __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v27[2] = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 48))
  {
    uint64_t v1 = MEMORY[0x1895F87A8];
    uint64_t v15 = MEMORY[0x1895F87A8];
    uint64_t v16 = 3221225472LL;
    SEL v17 = __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_3;
    id v18 = &unk_18A08F020;
    char v2 = *(void **)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    id v4 = &v15;
    if (v2)
    {
      id Property = objc_getProperty(v2, v3, 96LL, 1);
      if (objc_msgSend(Property, "length", v15, v16))
      {
        objc_initWeak(&location, v2);
        v26[0] = *MEMORY[0x1896074B0];
        id v7 = objc_getProperty(v2, v6, 96LL, 1);
        v26[1] = *MEMORY[0x1896074B8];
        v27[0] = v7;
        v27[1] = @"com.apple.networkextension.filter-control";
        [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:v26 count:2];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();

        ne_log_obj();
        char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = objc_getProperty(v2, v10, 96LL, 1);
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v11;
          _os_log_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEFAULT,  "Looking for a control extension with identifier %@",  (uint8_t *)&buf,  0xCu);
        }

        uint64_t v12 = (void *)MEMORY[0x189607880];
        *(void *)&__int128 buf = v1;
        *((void *)&buf + 1) = 3221225472LL;
        id v22 = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke;
        id v23 = &unk_18A08F178;
        objc_copyWeak(v25, &location);
        int v24 = v4;
        [v12 extensionsWithMatchingAttributes:v8 completion:&buf];

        objc_destroyWeak(v25);
        objc_destroyWeak(&location);
      }

      else
      {
        ne_log_obj();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_ERROR,  "Control Extension not found",  (uint8_t *)&buf,  2u);
        }

        objc_setProperty_atomic(v2, v14, 0LL, 40LL);
        ((void (*)(uint64_t *, uint64_t))v17)(v4, 1LL);
      }
    }
  }

  else
  {
    (*(void (**)(void, void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), 0LL);
  }

uint64_t __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  ne_log_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v5 count];
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v9, 96LL, 1);
    }
    else {
      id Property = 0LL;
    }
    *(_DWORD *)__int128 buf = 134218242;
    __int16 v34 = (const __CFString *)v10;
    __int16 v35 = 2112;
    id v36 = Property;
    _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEFAULT,  "Found %lu control extension(s) with identifier %@",  buf,  0x16u);
  }

  if (v5 && !v6 && [v5 count])
  {
    objc_initWeak((id *)buf, WeakRetained);
    [v5 objectAtIndexedSubscript:0];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained) {
      objc_setProperty_atomic(WeakRetained, v12, v13, 40LL);
    }

    uint64_t v14 = MEMORY[0x1895F87A8];
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_50;
    v31[3] = &unk_18A08F100;
    objc_copyWeak(&v32, (id *)buf);
    if (WeakRetained) {
      id v16 = objc_getProperty(WeakRetained, v15, 40LL, 1);
    }
    else {
      id v16 = 0LL;
    }
    id v17 = v16;
    [v17 setRequestInterruptionBlock:v31];

    v29[0] = v14;
    v29[1] = 3221225472LL;
    v29[2] = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_51;
    v29[3] = &unk_18A08F128;
    objc_copyWeak(&v30, (id *)buf);
    if (WeakRetained) {
      id v19 = objc_getProperty(WeakRetained, v18, 40LL, 1);
    }
    else {
      id v19 = 0LL;
    }
    id v20 = v19;
    [v20 setRequestCompletionBlock:v29];

    v27[0] = v14;
    v27[1] = 3221225472LL;
    v27[2] = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_2;
    void v27[3] = &unk_18A08F150;
    objc_copyWeak(&v28, (id *)buf);
    if (WeakRetained) {
      id v22 = objc_getProperty(WeakRetained, v21, 40LL, 1);
    }
    else {
      id v22 = 0LL;
    }
    id v23 = v22;
    [v23 setRequestCancellationBlock:v27];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    ne_log_obj();
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      if (WeakRetained) {
        id v26 = objc_getProperty(WeakRetained, v25, 96LL, 1);
      }
      else {
        id v26 = 0LL;
      }
      *(_DWORD *)__int128 buf = 138412802;
      __int16 v34 = @"com.apple.networkextension.filter-control";
      __int16 v35 = 2112;
      id v36 = v26;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_error_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_ERROR,  "Failed to create a %@ extension with identifier %@: %@",  buf,  0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_50( uint64_t a1,  void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v6, 96LL, 1);
    }
    else {
      id Property = 0LL;
    }
    int v10 = 138412290;
    id v11 = Property;
    _os_log_error_impl(&dword_1876B1000, v5, OS_LOG_TYPE_ERROR, "Extension %@ died unexpectedly", (uint8_t *)&v10, 0xCu);
  }

  if (WeakRetained) {
    id v8 = objc_getProperty(WeakRetained, v7, 72LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  if ([v3 isEqual:v8])
  {
    -[NEAgentFilterExtension handleExtensionExit:](WeakRetained, v3);
    -[NEAgentFilterExtension cleanupControlExtensionWithRequestIdentifier:](WeakRetained, v3);
  }
}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_51( uint64_t a1,  void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    id Property = objc_getProperty(WeakRetained, v4, 72LL, 1);
  }
  else {
    id Property = 0LL;
  }
}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_2( uint64_t a1,  void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    id Property = objc_getProperty(WeakRetained, v4, 72LL, 1);
  }
  else {
    id Property = 0LL;
  }
}

- (void)cleanupControlExtensionWithRequestIdentifier:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    id Property = (dispatch_queue_s *)objc_getProperty(a1, v3, 80LL, 1);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __71__NEAgentFilterExtension_cleanupControlExtensionWithRequestIdentifier___block_invoke;
    v6[3] = &unk_18A08F098;
    v6[4] = a1;
    id v7 = v4;
    dispatch_async(Property, v6);
  }
}

uint64_t __71__NEAgentFilterExtension_cleanupControlExtensionWithRequestIdentifier___block_invoke( uint64_t a1,  const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    objc_setProperty_atomic(Property, a2, 0LL, 72LL);
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 40LL, 1);
    }
  }

  [Property setRequestInterruptionBlock:0];
  id v6 = *(id *)(a1 + 32);
  if (v6) {
    id v6 = objc_getProperty(v6, v5, 40LL, 1);
  }
  [v6 setRequestCancellationBlock:0];
  id v8 = *(id *)(a1 + 32);
  if (v8) {
    id v8 = objc_getProperty(v8, v7, 40LL, 1);
  }
  [v8 setRequestCompletionBlock:0];
  id v10 = *(id *)(a1 + 32);
  if (v10) {
    id v10 = objc_getProperty(v10, v9, 40LL, 1);
  }
  [v10 cancelExtensionRequestWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12) {
    id v13 = objc_getProperty(v12, v11, 56LL, 1);
  }
  else {
    id v13 = 0LL;
  }
  return [v12 extensionDidStop:v13];
}

+ (BOOL)authenticateFlowWithState:(cfil_crypto_state *)a3 crypto_key:(id)a4 flow:(id)a5 salt:(unsigned int)a6 isKernelSocket:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v118 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    id v12 = v10;
    if ([v12 bytes])
    {
      if ([v12 length] == 32)
      {
        uint64_t v13 = objc_msgSend(v11, "crypto_signature");
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          objc_msgSend(v11, "crypto_signature");
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = [v15 length];

          if (v16)
          {
            uint64_t v117 = 0LL;
            __int128 v115 = 0u;
            __int128 v116 = 0u;
            __int128 v113 = 0u;
            __int128 v114 = 0u;
            *(_OWORD *)__int128 buf = 0u;
            memset(v112, 0, sizeof(v112));
            if (v11) {
              id Property = objc_getProperty(v11, v17, 128LL, 1);
            }
            else {
              id Property = 0LL;
            }
            id v19 = Property;

            if (v19)
            {
              if (v11) {
                id v21 = objc_getProperty(v11, v20, 128LL, 1);
              }
              else {
                id v21 = 0LL;
              }
              id v22 = v21;
              [v22 getUUIDBytes:buf];
            }

            DWORD2(v112[0]) = [v11 direction] != 1;
            DWORD2(v112[4]) = [v11 pid];
            else {
              int v23 = [v11 pid];
            }
            HIDWORD(v112[4]) = v23;
            LODWORD(v113) = [v11 rpid];
            *((void *)&v116 + 1) = [v11 inBytes];
            uint64_t v117 = [v11 outBytes];
            if ([v11 inBytes]) {
              BOOL v27 = 1;
            }
            else {
              BOOL v27 = [v11 outBytes] != 0;
            }
            BOOL v88 = v27;
            if (v11)
            {
              if ((v11[13] & 1) != 0)
              {
                [v11 sourceAppIdentifier];
                id v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28)
                {
                  id v29 = [v11 sourceAppIdentifier];
                  [v29 UTF8String];

                  [v11 sourceAppIdentifier];
                  id v30 = (void *)objc_claimAutoreleasedReturnValue();
                  [v30 length];
                }
              }
            }

            unsigned int v85 = a6;
            [v11 URL];
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              [v11 URL];
              id v32 = (void *)objc_claimAutoreleasedReturnValue();
              id v33 = [v32 absoluteString];
              [v33 UTF8String];

              [v11 URL];
              __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
              [v34 absoluteString];
              __int16 v35 = (void *)objc_claimAutoreleasedReturnValue();
              [v35 length];
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              int v40 = 0;
              v87 = "";
              v86 = "Browser";
              goto LABEL_60;
            }

            id v36 = v11;
            id v38 = v36;
            if (v11)
            {
              id v39 = objc_getProperty(v36, v37, 128LL, 1);
              if (v39)
              {

LABEL_36:
                [v38 remoteFlowEndpoint];
                v42 = (void *)objc_claimAutoreleasedReturnValue();

                if (v42)
                {
                  [v38 remoteFlowEndpoint];
                  __int16 v43 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
                  address = nw_endpoint_get_address(v43);

                  if (address)
                  {
                    int sa_family = address->sa_family;
                    if (sa_family == 30)
                    {
                      sockaddr v46 = *address;
                      *(sockaddr *)((char *)&v112[1] + 8) = *(sockaddr *)&address->sa_data[10];
                      goto LABEL_42;
                    }

                    if (sa_family == 2)
                    {
                      sockaddr v46 = *address;
LABEL_42:
                      *(sockaddr *)((char *)v112 + 12) = v46;
                    }
                  }
                }

                [v38 localFlowEndpoint];
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v47) {
                  goto LABEL_50;
                }
                [v38 localFlowEndpoint];
                v48 = (nw_endpoint *)objc_claimAutoreleasedReturnValue();
                v49 = nw_endpoint_get_address(v48);

                if (!v49) {
                  goto LABEL_50;
                }
                int v50 = v49->sa_family;
                if (v50 == 30)
                {
                  sockaddr v51 = *v49;
                  *(sockaddr *)((char *)&v112[3] + 4) = *(sockaddr *)&v49->sa_data[10];
                }

                else
                {
                  if (v50 != 2) {
                    goto LABEL_50;
                  }
                  sockaddr v51 = *v49;
                }

                *(sockaddr *)((char *)&v112[2] + 8) = v51;
LABEL_50:
                uint64_t v52 = [v38 remoteHostname];
                if (v52
                  && (v53 = (void *)v52,
                      [v38 remoteHostname],
                      v54 = (void *)objc_claimAutoreleasedReturnValue(),
                      uint64_t v55 = [v54 length],
                      v54,
                      v53,
                      v55))
                {
                  id v56 = [v38 remoteHostname];
                  v57 = (const char *)[v56 UTF8String];

                  int v84 = strlen(v57);
                }

                else
                {
                  int v84 = 0;
                }

                DWORD1(v112[4]) = [v38 socketProtocol];
                [v38 uuid];
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                [v58 getUUIDBytes:(char *)&v113 + 4];

                [v38 euuid];
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                [v59 getUUIDBytes:(char *)&v114 + 4];

                [v38 ruuid];
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                [v60 getUUIDBytes:(char *)&v115 + 4];

                int v61 = [v38 socketProtocol];
                int v62 = [v38 socketFamily];

                if (v62 == 2) {
                  v63 = "v4";
                }
                else {
                  v63 = "v6";
                }
                v64 = "UDP";
                if (v61 == 6) {
                  v64 = "TCP";
                }
                v86 = v64;
                v87 = v63;
                int v40 = v84;
LABEL_60:
                [v12 bytes];
                id v65 = objc_msgSend(v11, "crypto_signature");
                uint64_t v66 = [v65 bytes];
                objc_msgSend(v11, "crypto_signature");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v83) = [v67 length];
                LODWORD(v82) = v40;
                char v25 = ne_filter_crypto_validate_data();

                ne_log_obj();
                v68 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                v69 = v68;
                if ((v25 & 1) != 0)
                {
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                  {
                    if (v7) {
                      v70 = "Kernel ";
                    }
                    else {
                      v70 = "";
                    }
                    v71 = "New";
                    if (v88) {
                      v71 = "Closed";
                    }
                    v89 = v71;
                    if (objc_msgSend(v11, "direction", v82, v66, v83) == 1)
                    {
                      v72 = "IN";
                    }

                    else if ([v11 direction] == 2)
                    {
                      v72 = "OUT";
                    }

                    else
                    {
                      v72 = "ANY";
                    }

                    objc_msgSend(v11, "crypto_signature");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    uint64_t v77 = [v11 inBytes];
                    uint64_t v78 = [v11 outBytes];
                    [v11 sourceAppIdentifier];
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v91 = 136317442;
                    v92 = v70;
                    __int16 v93 = 2080;
                    v94 = v89;
                    __int16 v95 = 2080;
                    v96 = v86;
                    __int16 v97 = 2080;
                    v98 = v87;
                    __int16 v99 = 2080;
                    v100 = v72;
                    __int16 v101 = 1024;
                    unsigned int v102 = v85;
                    __int16 v103 = 2112;
                    v104 = v76;
                    __int16 v105 = 2048;
                    uint64_t v106 = v77;
                    __int16 v107 = 2048;
                    uint64_t v108 = v78;
                    __int16 v109 = 2112;
                    v110 = v79;
                    _os_log_debug_impl( &dword_1876B1000,  v69,  OS_LOG_TYPE_DEBUG,  "Signature validation (%s%s - %s %s %s) succeeded for salt %d with signature %@ (inBytes %llu outBy tes %llu) (app %@)",  v91,  0x62u);
LABEL_86:
                  }
                }

                else if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  if (v7) {
                    v73 = "Kernel ";
                  }
                  else {
                    v73 = "";
                  }
                  v74 = "New";
                  if (v88) {
                    v74 = "Closed";
                  }
                  v90 = v74;
                  if (objc_msgSend(v11, "direction", v82, v66, v83) == 1)
                  {
                    v75 = "IN";
                  }

                  else if ([v11 direction] == 2)
                  {
                    v75 = "OUT";
                  }

                  else
                  {
                    v75 = "ANY";
                  }

                  objc_msgSend(v11, "crypto_signature");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  uint64_t v80 = [v11 inBytes];
                  uint64_t v81 = [v11 outBytes];
                  [v11 sourceAppIdentifier];
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v91 = 136317442;
                  v92 = v73;
                  __int16 v93 = 2080;
                  v94 = v90;
                  __int16 v95 = 2080;
                  v96 = v86;
                  __int16 v97 = 2080;
                  v98 = v87;
                  __int16 v99 = 2080;
                  v100 = v75;
                  __int16 v101 = 1024;
                  unsigned int v102 = v85;
                  __int16 v103 = 2112;
                  v104 = v76;
                  __int16 v105 = 2048;
                  uint64_t v106 = v80;
                  __int16 v107 = 2048;
                  uint64_t v108 = v81;
                  __int16 v109 = 2112;
                  v110 = v79;
                  _os_log_error_impl( &dword_1876B1000,  v69,  OS_LOG_TYPE_ERROR,  "Signature validation (%s%s - %s %s %s) failed for salt %d with signature %@ (inBytes %llu outBytes %llu) (app %@)",  v91,  0x62u);
                  goto LABEL_86;
                }

                goto LABEL_18;
              }

              uint64_t v41 = v38[25];
              if (v41 == -1) {
                goto LABEL_36;
              }
            }

            else
            {
              uint64_t v41 = 0LL;
            }

            *(void *)&v112[0] = v41;
            goto LABEL_36;
          }
        }

        ne_log_obj();
        int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_error_impl( &dword_1876B1000,  v24,  OS_LOG_TYPE_ERROR,  "Signature validation: flow has no signature",  buf,  2u);
        }
      }
    }
  }

  char v25 = 0;
LABEL_18:

  return v25;
}

@end