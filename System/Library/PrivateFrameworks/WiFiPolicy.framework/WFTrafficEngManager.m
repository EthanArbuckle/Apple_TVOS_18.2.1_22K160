@interface WFTrafficEngManager
- (BOOL)__configureRapportDiscoveryClient;
- (WFTrafficEngDelegate)trafficEngDelegate;
- (WFTrafficEngManager)initWithTrafficEngDelegate:(id)a3;
- (id)__collectCriticalAppInfo;
- (void)__activateDiscovery;
- (void)__configureRapportSessionClient:(id)a3;
- (void)__invalidateDiscovery;
- (void)__invalidateSession;
- (void)__registerCallbacksAndActivate;
- (void)__registerRequestHandler;
- (void)__requestCriticalAppInfo:(id)a3 completionBlock:(id)a4;
- (void)__sendEventToPeers;
- (void)__sendKeepAliveEvent:(id)a3 dictionary:(id)a4;
- (void)__sendPeriodicEvent:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)setTrafficEngDelegate:(id)a3;
@end

@implementation WFTrafficEngManager

- (WFTrafficEngManager)initWithTrafficEngDelegate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___WFTrafficEngManager;
  v5 = -[WFTrafficEngManager init](&v19, sel_init);
  objc_msgSend( NSString,  "stringWithFormat:",  @"Enter %s",  "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v7 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = v8;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  if (!v5)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s self alloc failed",  "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifi.trafficEngineering", 0LL);
  traffic_engr_queue = v5->_traffic_engr_queue;
  v5->_traffic_engr_queue = (OS_dispatch_queue *)v9;

  if (!v5->_traffic_engr_queue)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s Dispatch Queue Creation Failed",  "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WFTrafficEngManager setTrafficEngDelegate:](v5, "setTrafficEngDelegate:", v4);
    goto LABEL_13;
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"%s Invalid trafficEngDelegate",  "-[WFTrafficEngManager initWithTrafficEngDelegate:]");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
LABEL_11:
    v12 = (void *)NSString;
    id v11 = v11;
    id v13 = objc_msgSend(v12, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v11, "UTF8String"));
    uint64_t v14 = [v13 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v21 = v14;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager dealloc]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v4 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v4 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  traffic_engr_queue = self->_traffic_engr_queue;
  if (traffic_engr_queue)
  {
    self->_traffic_engr_queue = 0LL;
  }

  objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager dealloc]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v7 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = v8;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WFTrafficEngManager;
  -[WFTrafficEngManager dealloc](&v9, sel_dealloc);
}

- (BOOL)__configureRapportDiscoveryClient
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  self->_BOOL configured = 0;
  objc_initWeak(&location, self);
  objc_msgSend( NSString,  "stringWithFormat:",  @"Enter %s",  "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (os_log_s *)MEMORY[0x1895F8DA0];
  id v5 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    uint64_t v7 = [v6 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v37 = v7;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"%s Rapport discovery session Started",  "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v9 = (os_log_s *)MEMORY[0x1895F8DA0];
  id v10 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v11 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v8, "UTF8String"));
    uint64_t v12 = [v11 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v37 = v12;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

  if (objc_opt_class())
  {
    id v13 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x189611DA8]);
    discoveryClient = self->_discoveryClient;
    self->_discoveryClient = v13;
  }

  v15 = self->_discoveryClient;
  if (v15)
  {
    -[RPCompanionLinkClient setDispatchQueue:](v15, "setDispatchQueue:", self->_traffic_engr_queue);
    uint64_t v16 = MEMORY[0x1895F87A8];
    v33[0] = MEMORY[0x1895F87A8];
    v33[1] = 3221225472LL;
    v33[2] = __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke;
    v33[3] = &unk_18A16CE78;
    objc_copyWeak(&v34, &location);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_discoveryClient, "setInvalidationHandler:", v33);
    -[RPCompanionLinkClient setControlFlags:]( self->_discoveryClient,  "setControlFlags:",  -[RPCompanionLinkClient controlFlags](self->_discoveryClient, "controlFlags") | 0x801004);
    -[RPCompanionLinkClient setTargetUserSession:](self->_discoveryClient, "setTargetUserSession:", 1LL);
    v31[0] = v16;
    v31[1] = 3221225472LL;
    v31[2] = __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_32;
    v31[3] = &unk_18A16DCE8;
    objc_copyWeak(&v32, &location);
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_discoveryClient, "setDeviceFoundHandler:", v31);
    v29[0] = v16;
    v29[1] = 3221225472LL;
    v29[2] = __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_36;
    v29[3] = &unk_18A16DCE8;
    objc_copyWeak(&v30, &location);
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_discoveryClient, "setDeviceLostHandler:", v29);
    -[WFTrafficEngManager __activateDiscovery](self, "__activateDiscovery");
    objc_msgSend( NSString,  "stringWithFormat:",  @"%s Rapport discovery session Ended",  "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v19 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v17, "UTF8String"));
      uint64_t v21 = [v20 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v37 = v21;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

    self->_BOOL configured = 1;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"Leave %s",  "-[WFTrafficEngManager __configureRapportDiscoveryClient]");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (os_log_s *)MEMORY[0x1895F8DA0];
  id v24 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v25 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v22, "UTF8String"));
    uint64_t v26 = [v25 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v37 = v26;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  BOOL configured = self->_configured;
  objc_destroyWeak(&location);
  return configured;
}

void __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"%s Rapport discovery session invalidated",  "-[WFTrafficEngManager __configureRapportDiscoveryClient]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    id v3 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v6 = [v3 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__invalidateDiscovery");
}

void __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = (void *)NSString;
  id v4 = a2;
  [v3 stringWithFormat:@"%s Rapport discovery session found device:%@", "-[WFTrafficEngManager __configureRapportDiscoveryClient]_block_invoke", v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v5, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__configureRapportSessionClient:", v4);
}

void __56__WFTrafficEngManager___configureRapportDiscoveryClient__block_invoke_36(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [NSString stringWithFormat:@"%s Rapport discovery session lost device:%@", "-[WFTrafficEngManager __configureRapportDiscoveryClient]_block_invoke", a2];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    id v4 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v7 = [v4 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__tearDownRapportDataSession");
}

- (void)__activateDiscovery
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"Enter %s",  "-[WFTrafficEngManager __activateDiscovery]");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v4 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v4 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  -[WFTrafficEngManager __registerCallbacksAndActivate](self, "__registerCallbacksAndActivate");
  objc_msgSend( NSString,  "stringWithFormat:",  @"Leave %s",  "-[WFTrafficEngManager __activateDiscovery]");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v6 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v5, "UTF8String"));
    uint64_t v7 = [v6 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = v7;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

- (void)__registerCallbacksAndActivate
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"Enter %s",  "-[WFTrafficEngManager __registerCallbacksAndActivate]");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v4 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v4 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  traffic_engr_queue = (dispatch_queue_s *)self->_traffic_engr_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke;
  block[3] = &unk_18A16C770;
  block[4] = self;
  dispatch_async(traffic_engr_queue, block);
  objc_msgSend( NSString,  "stringWithFormat:",  @"Leave %s",  "-[WFTrafficEngManager __registerCallbacksAndActivate]");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v7 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = v8;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

uint64_t __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_2;
  v5[3] = &unk_18A16D930;
  v5[4] = v2;
  return [v3 activateWithCompletion:v5];
}

void __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    [NSString stringWithFormat:@"%s Activation of rapport disovery client failed, error: %@", "-[WFTrafficEngManager __registerCallbacksAndActivate]_block_invoke_2", a2];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v3 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v8 = [v3 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_43;
    v6[3] = &unk_18A16DD10;
    v6[4] = v4;
    [v5 registerEventID:@"com.apple.wifi.trafficeng.event" options:0 handler:v6];
  }

void __53__WFTrafficEngManager___registerCallbacksAndActivate__block_invoke_43(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(a1 + 32) trafficEngDelegate];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    [*(id *)(a1 + 32) trafficEngDelegate];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleCriticalAppEvent:v6];
  }
}

- (void)__registerRequestHandler
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"Enter %s",  "-[WFTrafficEngManager __registerRequestHandler]");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v4 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v4 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  discoveryClient = self->_discoveryClient;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __47__WFTrafficEngManager___registerRequestHandler__block_invoke;
  v9[3] = &unk_18A16DD38;
  v9[4] = self;
  -[RPCompanionLinkClient registerRequestID:options:handler:]( discoveryClient,  "registerRequestID:options:handler:",  @"com.apple.wifi.trafficEngineering",  0LL,  v9);
  objc_msgSend( NSString,  "stringWithFormat:",  @"Leave %s",  "-[WFTrafficEngManager __registerRequestHandler]");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v7 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = v8;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

void __47__WFTrafficEngManager___registerRequestHandler__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v9 = a4;
  [*(id *)(a1 + 32) trafficEngDelegate];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    [*(id *)(a1 + 32) trafficEngDelegate];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 retrieveCurrentLinkHealth];

    (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, v8, 0LL, 0LL);
  }
}

- (void)__invalidateDiscovery
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"Enter %s",  "-[WFTrafficEngManager __invalidateDiscovery]");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v4 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v4 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  -[WFTrafficEngManager __tearDownRapportDataSession](self, "__tearDownRapportDataSession");
  -[RPCompanionLinkClient invalidate](self->_discoveryClient, "invalidate");
  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = 0LL;

  self->_BOOL configured = 0;
  -[WFTrafficEngManager cleanup](self, "cleanup");
  objc_msgSend( NSString,  "stringWithFormat:",  @"Leave %s",  "-[WFTrafficEngManager __invalidateDiscovery]");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v7 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = v8;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

- (void)cleanup
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  objc_msgSend(NSString, "stringWithFormat:", @"Enter %s", "-[WFTrafficEngManager cleanup]");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v4 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v4 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  discoveryClient = self->_discoveryClient;
  self->_discoveryClient = 0LL;

  objc_msgSend(NSString, "stringWithFormat:", @"Leave %s", "-[WFTrafficEngManager cleanup]");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v7 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    uint64_t v8 = [v7 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = v8;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

- (void)__configureRapportSessionClient:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"Enter %s",  "-[WFTrafficEngManager __configureRapportSessionClient:]");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v4 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v4 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"Leave %s",  "-[WFTrafficEngManager __configureRapportSessionClient:]");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v6 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v5, "UTF8String"));
    uint64_t v7 = [v6 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = v7;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

- (void)__invalidateSession
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"Enter %s",  "-[WFTrafficEngManager __invalidateSession]");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v3 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v8 = [v3 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"Leave %s",  "-[WFTrafficEngManager __invalidateSession]");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v5 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v4, "UTF8String"));
    uint64_t v6 = [v5 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v8 = v6;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

- (void)__sendEventToPeers
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  -[WFTrafficEngManager trafficEngDelegate](self, "trafficEngDelegate");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFTrafficEngManager trafficEngDelegate](self, "trafficEngDelegate");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (void *)[v5 retrieveEventDetails];

    if (v6)
    {
      uint64_t v7 = (void *)NSString;
      id v8 = v6;
      [v7 stringWithFormat:@"[TrafficEngineering]: EventData %@", v8];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
      {
        id v10 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v9, "UTF8String"));
        *(_DWORD *)buf = 136446210;
        uint64_t v12 = [v10 UTF8String];
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
      }

      -[WFTrafficEngManager __sendPeriodicEvent:](self, "__sendPeriodicEvent:", v8);
    }
  }

- (void)__sendPeriodicEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];

  if (v6)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      uint64_t v11 = MEMORY[0x1895F87A8];
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
          traffic_engr_queue = (dispatch_queue_s *)self->_traffic_engr_queue;
          block[0] = v11;
          block[1] = 3221225472LL;
          block[2] = __43__WFTrafficEngManager___sendPeriodicEvent___block_invoke;
          block[3] = &unk_18A16D218;
          block[4] = self;
          void block[5] = v13;
          id v18 = v4;
          dispatch_async(traffic_engr_queue, block);

          ++v12;
        }

        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v9);
    }
  }

  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"No active clients, Returning");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)NSString;
      id v7 = v7;
      id v16 = objc_msgSend(v15, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v7, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v25 = [v16 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __43__WFTrafficEngManager___sendPeriodicEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__sendKeepAliveEvent:dictionary:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)__sendKeepAliveEvent:(id)a3 dictionary:(id)a4
{
}

void __55__WFTrafficEngManager___sendKeepAliveEvent_dictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    [NSString stringWithFormat:@"[TrafficEngineering]: Failed to send event %@", a2];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v3 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v5 = [v3 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

- (void)__requestCriticalAppInfo:(id)a3 completionBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  objc_msgSend( NSString,  "stringWithFormat:",  @"Enter %s",  "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v8 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v7, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v24 = [v8 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  if (objc_opt_class())
  {
    id v9 = objc_alloc_init(MEMORY[0x189611DA8]);
    id v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setControlFlags:", objc_msgSend(v9, "controlFlags") | 0x1004);
      [v10 setDestinationDevice:v5];
      uint64_t v11 = MEMORY[0x1895F87A8];
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke;
      v21[3] = &unk_18A16C770;
      id v22 = v5;
      [v10 setInvalidationHandler:v21];
      uint64_t v15 = v11;
      uint64_t v16 = 3221225472LL;
      uint64_t v17 = __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_55;
      id v18 = &unk_18A16DDA8;
      id v20 = v6;
      id v10 = v10;
      id v19 = v10;
      [v10 activateWithCompletion:&v15];
    }
  }

  else
  {
    id v10 = 0LL;
  }

  objc_msgSend( NSString,  "stringWithFormat:",  @"Leave %s",  "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]",  v15,  v16,  v17,  v18);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v13 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v12, "UTF8String"));
    uint64_t v14 = [v13 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v24 = v14;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }
}

void __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [NSString stringWithFormat:@"%s Session client with device %@ invalidated", "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]_block_invoke", *(void *)(a1 + 32)];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    id v2 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v1, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v4 = [v2 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
  }
}

void __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_55( uint64_t a1,  uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    [NSString stringWithFormat:@"%s Session client falied to activate, error: %@", "-[WFTrafficEngManager __requestCriticalAppInfo:completionBlock:]_block_invoke", a2];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      id v4 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v3, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v12 = [v4 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    uint64_t v9 = *MEMORY[0x189611DD8];
    uint64_t v10 = MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_59;
    v7[3] = &unk_18A16DD80;
    id v6 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v6 sendRequestID:@"com.apple.wifi.trafficEngineering" request:MEMORY[0x189604A60] options:v5 responseHandler:v7];
  }

uint64_t __64__WFTrafficEngManager___requestCriticalAppInfo_completionBlock___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)__collectCriticalAppInfo
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"Enter %s",  "-[WFTrafficEngManager __collectCriticalAppInfo]");
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    id v3 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v2, "UTF8String"));
    *(_DWORD *)buf = 136446210;
    uint64_t v62 = [v3 UTF8String];
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  id v47 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v57 = 0LL;
  v58 = &v57;
  uint64_t v59 = 0x2020000000LL;
  uint64_t v60 = 0LL;
  group = dispatch_group_create();
  id v4 = (void *)NSString;
  -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", @"Number of Peers %lu", objc_msgSend(v5, "count"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = (os_log_s *)MEMORY[0x1895F8DA0];
  id v8 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v6, "UTF8String"));
    uint64_t v10 = [v9 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v62 = v10;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = [v11 count] == 0;

  if (v12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"No active clients, Returning");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (os_log_s *)MEMORY[0x1895F8DA0];
    id v42 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      id v43 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v25, "UTF8String"));
      uint64_t v44 = [v43 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v62 = v44;
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
    }
  }

  else
  {
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v77 count:16];
    if (v14)
    {
      uint64_t v45 = 0LL;
      uint64_t v15 = *(void *)v54;
      do
      {
        uint64_t v16 = 0LL;
        v45 += v14;
        do
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v53 + 1) + 8 * v16);
          dispatch_group_enter(group);
          traffic_engr_queue = (dispatch_queue_s *)self->_traffic_engr_queue;
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke;
          block[3] = &unk_18A16DDF8;
          block[4] = self;
          void block[5] = v17;
          v52 = &v57;
          id v50 = v47;
          v51 = group;
          dispatch_async(traffic_engr_queue, block);

          ++v16;
        }

        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v77 count:16];
      }

      while (v14);
    }

    else
    {
      uint64_t v45 = 0LL;
    }

    dispatch_time_t v19 = dispatch_time(0LL, 60000000000LL);
    if (dispatch_group_wait(group, v19))
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"%d Sec timeout waiting for Critical App Info from peers",  60);
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v21 = (os_log_s *)MEMORY[0x1895F8DA0];
      id v22 = MEMORY[0x1895F8DA0];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v23 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v20, "UTF8String"));
        uint64_t v24 = [v23 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v62 = v24;
        _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
      }
    }

    uint64_t v25 = (void *)MEMORY[0x1895F8DA0];
    id v26 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_INFO))
    {
      [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/WiFiPolicy/frameworks/Sources/TrafficEngineering/WFTrafficEngManager.m"];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      id v28 = [v27 lastPathComponent];
      uint64_t v29 = [v28 UTF8String];
      -[RPCompanionLinkClient activeDevices](self->_discoveryClient, "activeDevices");
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = [v30 count];
      uint64_t v32 = v58[3];
      *(_DWORD *)buf = 141559810;
      uint64_t v62 = 1752392040LL;
      __int16 v63 = 2080;
      uint64_t v64 = v29;
      __int16 v65 = 2160;
      uint64_t v66 = 1752392040LL;
      __int16 v67 = 1024;
      int v68 = 384;
      __int16 v69 = 2048;
      uint64_t v70 = v31;
      __int16 v71 = 2048;
      uint64_t v72 = v45;
      __int16 v73 = 2048;
      uint64_t v74 = v32;
      __int16 v75 = 2112;
      id v76 = v47;
      _os_log_impl( &dword_187EBF000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "[TrafficEngineering] (%{mask.hash}s:%{mask.hash}d) active peers %lu, requested peers %lu,  responses %lu, diagnostics log %@",  buf,  0x4Eu);

      uint64_t v25 = (void *)MEMORY[0x1895F8DA0];
    }
  }

  v33 = self;
  objc_sync_enter(v33);
  id v34 = (void *)[v47 copy];
  objc_sync_exit(v33);

  objc_msgSend( NSString,  "stringWithFormat:",  @"Leave %s",  "-[WFTrafficEngManager __collectCriticalAppInfo]");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (os_log_s *)MEMORY[0x1895F8DA0];
  id v37 = MEMORY[0x1895F8DA0];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    id v38 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v35, "UTF8String"));
    uint64_t v39 = [v38 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v62 = v39;
    _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  _Block_object_dispose(&v57, 8);
  return v34;
}

void __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke_2;
  v7[3] = &unk_18A16DDD0;
  uint64_t v4 = *(void *)(a1 + 64);
  void v7[4] = v2;
  uint64_t v11 = v4;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  id v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "__requestCriticalAppInfo:completionBlock:", v3, v7);
}

void __47__WFTrafficEngManager___collectCriticalAppInfo__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v5 = [*(id *)(a1 + 40) count];
    objc_sync_exit(v4);

    uint64_t v6 = (void *)NSString;
    [*(id *)(a1 + 48) model];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringWithFormat:@"%s Response from peer %@: %@, total responses %lu", "-[WFTrafficEngManager __collectCriticalAppInfo]_block_invoke_2", v7, v3, v5];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      id v9 = objc_msgSend( NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v8, "UTF8String"));
      *(_DWORD *)buf = 136446210;
      uint64_t v11 = [v9 UTF8String];
      _os_log_impl(&dword_187EBF000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (WFTrafficEngDelegate)trafficEngDelegate
{
  return self->_trafficEngDelegate;
}

- (void)setTrafficEngDelegate:(id)a3
{
  self->_trafficEngDelegate = (WFTrafficEngDelegate *)a3;
}

- (void).cxx_destruct
{
}

@end