@interface NEAppProxyProviderContainer
- (NEAppProxyProvider)provider;
- (NEAppProxyProviderContainer)initWithDelegate:(id)a3 providerClass:(Class)a4;
- (void)handleAppMessage:(id)a3 completionHandler:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegateInterface:(unsigned int)a3;
- (void)setInitialFlowDivertControlSocket:(id)a3;
- (void)sleepWithCompletionHandler:(id)a3;
- (void)startWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stop;
- (void)wake;
@end

@implementation NEAppProxyProviderContainer

- (NEAppProxyProviderContainer)initWithDelegate:(id)a3 providerClass:(Class)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEAppProxyProviderContainer;
  v8 = -[NEAppProxyProviderContainer init](&v15, sel_init);
  if (!v8) {
    goto LABEL_7;
  }
  Class Superclass = class_getSuperclass(a4);
  if (Superclass == (Class)objc_opt_class())
  {
    objc_storeStrong((id *)&v8->_delegate, a3);
    v12 = (NEAppProxyProvider *)objc_alloc_init(a4);
    provider = v8->_provider;
    v8->_provider = v12;

    -[NEProvider setdefaultPathObserver:](v8->_provider, "setdefaultPathObserver:", v8);
LABEL_7:
    v11 = v8;
    goto LABEL_8;
  }

  ne_log_obj();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_INFO,  "%@: failed to init, providerClass is not subclass of NEAppProxyProvider",  buf,  0xCu);
  }

  v11 = 0LL;
LABEL_8:

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
}

- (void)sleepWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEAppProxyProviderContainer provider](self, "provider");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 sleepWithCompletionHandler:v4];
}

- (void)wake
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 wake];
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  ne_log_obj();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v13 = self;
    __int16 v14 = 2048;
    id v15 = v6;
    _os_log_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_INFO,  "%@: Calling startProxyWithOptions with options %p",  buf,  0x16u);
  }

  if (self) {
    objc_setProperty_atomic_copy(self, v9, v7, 48LL);
  }
  v10 = -[NEAppProxyProviderContainer provider](self, "provider");
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __66__NEAppProxyProviderContainer_startWithOptions_completionHandler___block_invoke;
  v11[3] = &unk_18A0907E8;
  v11[4] = self;
  [v10 startProxyWithOptions:v6 completionHandler:v11];
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = self;
    _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "%@: Calling stopProxyWithReason", buf, 0xCu);
  }

  -[NEAppProxyProviderContainer provider](self, "provider");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __35__NEAppProxyProviderContainer_stop__block_invoke;
  v5[3] = &unk_18A090390;
  v5[4] = self;
  [v4 stopProxyWithReason:0 completionHandler:v5];
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

- (void)setInitialFlowDivertControlSocket:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_initWeak(&location, self);
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = self;
    __int16 v20 = 2048;
    id v21 = v4;
    _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_INFO,  "%@: Setting initial flow divert control socket to %p",  buf,  0x16u);
  }

  dup([v4 fileDescriptor]);
  dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
  int v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v7 = dispatch_queue_create("NEFlow queue", v6);
  dispatch_queue_t v9 = v7;
  if (self)
  {
    objc_setProperty_atomic(self, v8, v7, 32LL);

    id Property = objc_getProperty(self, v10, 32LL, 1);
  }

  else
  {

    id Property = 0LL;
  }

  id v12 = Property;
  v13 = (_NEFlowDirector *)NEFlowDirectorCreate();
  if (self)
  {
    self->_director = v13;

    if (self->_director)
    {
      if (self->_delegateInterfaceIndex) {
        NEFlowDirectorSetDelegateInterface();
      }
      __int16 v14 = (void *)MEMORY[0x1895F87A8];
      v15[6] = (id)MEMORY[0x1895F87A8];
      v15[7] = (id)3221225472LL;
      v15[8] = __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke;
      v15[9] = &unk_18A08FAC8;
      objc_copyWeak(&v16, &location);
      NEFlowDirectorSetOpenControlSocketCallback();
      v15[1] = v14;
      v15[2] = (id)3221225472LL;
      v15[3] = __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke_2;
      v15[4] = &unk_18A08B170;
      v15[5] = self;
      NEFlowDirectorSetMatchRulesCallback();
      objc_copyWeak(v15, &location);
      NEFlowDirectorSetNewFlowCallback();
      objc_destroyWeak(v15);
      objc_destroyWeak(&v16);
    }
  }

  else
  {
  }

  objc_destroyWeak(&location);
}

- (void)handleAppMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEAppProxyProviderContainer provider](self, "provider");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 handleAppMessage:v7 completionHandler:v6];
}

- (NEAppProxyProvider)provider
{
  return (NEAppProxyProvider *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

void __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke(uint64_t a1)
{
  self = objc_loadWeakRetained((id *)(a1 + 32));
  if (self) {
    objc_msgSend( objc_getProperty(self, v1, 24, 1),  "container:didRequestFlowDivertControlSocketWithCompletionHandler:");
  }
}

uint64_t __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = a4;
    _os_log_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_INFO,  "%@: Verifying app with signing identifier %@",  (uint8_t *)&v9,  0x16u);
  }

  return NEFlowDirectorHandleMatchRulesResult();
}

void __65__NEAppProxyProviderContainer_setInitialFlowDivertControlSocket___block_invoke_7( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  self = objc_loadWeakRetained(v4);
  id v6 = (void (**)(id, uint64_t))v5;
  if (self)
  {
    uint64_t FlowType = NEFlowGetFlowType();
    if (FlowType == 1)
    {
      int v9 = off_18A087750;
    }

    else
    {
      uint64_t v8 = FlowType;
      if (FlowType != 2)
      {
        ne_log_obj();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v17 = v8;
          _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "Unknown flow type %ld", buf, 0xCu);
        }

        goto LABEL_11;
      }

      int v9 = off_18A087758;
    }

    id v10 = objc_alloc(*v9);
    uint64_t v12 = (os_log_s *)objc_msgSend(v10, "initWithNEFlow:queue:", a2, objc_getProperty(self, v11, 32, 1));
    ne_log_obj();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = (uint64_t)self;
      __int16 v18 = 2112;
      v19 = v12;
      _os_log_debug_impl(&dword_1876B1000, v13, OS_LOG_TYPE_DEBUG, "%@: Calling handleNewFlow with %@", buf, 0x16u);
    }

    [self provider];
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, [v14 handleNewFlow:v12]);

LABEL_11:
  }
}

void __58__NEAppProxyProviderContainer_flowDivertOpenControlSocket__block_invoke(uint64_t a1, void *a2)
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
  if (v8 && *(void *)(v8 + 40)) {
    NEFlowDirectorHandleNewControlSocket();
  }
}

void __35__NEAppProxyProviderContainer_stop__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    if (v3[5])
    {
      NEFlowDirectorDestroy();
    }

    else if (objc_getProperty(v3, a2, 48LL, 1))
    {
      ne_log_obj();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v5;
        _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_INFO, "%@: Calling stop completion handler", buf, 0xCu);
      }

      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 48LL, 1);
      }
      (*((void (**)(id, void))Property + 2))(Property, 0LL);
      int v9 = *(void **)(a1 + 32);
      if (v9) {
        objc_setProperty_atomic_copy(v9, v8, 0LL, 48LL);
      }
    }
  }

void __35__NEAppProxyProviderContainer_stop__block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    *(void *)(v2 + 40) = 0LL;
    id v4 = *(void **)(a1 + 32);
    if (v4)
    {
      if (objc_getProperty(v4, a2, 48LL, 1))
      {
        ne_log_obj();
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          uint64_t v6 = *(void *)(a1 + 32);
          int v11 = 138412290;
          uint64_t v12 = v6;
          _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_INFO,  "%@: Calling stop completion handler",  (uint8_t *)&v11,  0xCu);
        }

        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v7, 48LL, 1);
        }
        (*((void (**)(id, void))Property + 2))(Property, 0LL);
        uint64_t v10 = *(void **)(a1 + 32);
        if (v10) {
          objc_setProperty_atomic_copy(v10, v9, 0LL, 48LL);
        }
      }
    }
  }

void __66__NEAppProxyProviderContainer_startWithOptions_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v6 = a2;
  if (!v6) {
    NEFlowDirectorStart();
  }
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, v3, 24LL, 1);
    uint64_t v5 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  [Property container:v5 didStartWithError:v6];
}

@end