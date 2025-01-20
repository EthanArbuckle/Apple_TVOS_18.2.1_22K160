@interface NEExtensionProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (NEExtensionProviderContext)initWithProvider:(id)a3;
- (NSString)description;
- (NSString)extensionPoint;
- (id)_principalObject;
- (void)cancelWithError:(id)a3;
- (void)completeSession;
- (void)createWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)displayMessage:(id)a3 message:(id)a4 completionHandler:(id)a5;
- (void)dispose;
- (void)dropProvider;
- (void)hostContext;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4;
- (void)setDescription:(uint64_t)a1;
- (void)sleepWithCompletionHandler:(id)a3;
- (void)startWithOptions:(id)a3 completionHandler:(id)a4;
- (void)startedWithError:(id)a3;
- (void)stopWithReason:(int)a3;
- (void)validateWithCompletionHandler:(id)a3;
- (void)wake;
@end

@implementation NEExtensionProviderContext

- (NEExtensionProviderContext)initWithProvider:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NEExtensionProviderContext;
  v6 = -[NSExtensionContext init](&v8, sel_init);
  if (v6)
  {
    [v5 beginRequestWithExtensionContext:v6];
    objc_storeStrong((id *)&v6->_provider, a3);
  }

  return v6;
}

- (void)dropProvider
{
  provider = self->_provider;
  self->_provider = 0LL;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_DEFAULT, "%@: Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEExtensionProviderContext;
  -[NSExtensionContext dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  description = self->_description;
  if (description) {
    return description;
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEExtensionProviderContext;
  -[NSExtensionContext description](&v4, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_principalObject
{
  if (self && self->_isDisposed) {
    return 0LL;
  }
  provider = self->_provider;
  if (provider) {
    return provider;
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEExtensionProviderContext;
  -[NSExtensionContext _principalObject](&v4, sel__principalObject);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)completeSession
{
  if (self && objc_getProperty(self, a2, 64LL, 1))
  {
    objc_msgSend(objc_getProperty(self, v3, 64, 1), "invalidate");
    hostConnection = self->_hostConnection;
    self->_hostConnection = 0LL;

    provider = self->_provider;
    self->_provider = 0LL;

    transaction = self->_transaction;
    self->_transaction = 0LL;

    +[NEProviderServer sharedServer](&OBJC_CLASS___NEProviderServer, "sharedServer");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 removeProviderContext:self];
  }

  else
  {
    ne_log_obj();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_INFO, "Calling completeRequest", buf, 2u);
    }

    -[NSExtensionContext completeRequestReturningItems:completionHandler:]( self,  "completeRequestReturningItems:completionHandler:",  0LL,  0LL);
  }

- (void)sleepWithCompletionHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_INFO,  "%@: Calling sleepWithCompletionHandler:",  (uint8_t *)&v7,  0xCu);
  }
  v6 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  [v6 sleepWithCompletionHandler:v4];
}

- (void)wake
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "%@: Calling wake", (uint8_t *)&v5, 0xCu);
  }

  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 wake];
}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (nelog_is_info_logging_enabled())
  {
    [NSString stringWithFormat:@"[Extension %@]", v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEExtensionProviderContext setDescription:]((uint64_t)self, v8);
  }

  if (nelog_is_debug_logging_enabled())
  {
    ne_log_large_obj();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_debug_impl(&dword_1876B1000, v9, OS_LOG_TYPE_DEBUG, "%@: Setting configuration to %@", buf, 0x16u);
    }
  }

  else
  {
    ne_log_obj();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = self;
      _os_log_impl(&dword_1876B1000, v9, OS_LOG_TYPE_INFO, "%@: Setting configuration", buf, 0xCu);
    }
  }

  if (self) {
    objc_setProperty_atomic(self, v10, v6, 48LL);
  }
  v11 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  [v6 applicationName];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setAppName:v12];
}

- (void)cancelWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (self && objc_getProperty(self, v4, 56LL, 1))
  {
    ne_log_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      v11 = self;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_INFO,  "%@: Calling stop completion handler with error %@",  (uint8_t *)&v10,  0x16u);
    }

    Property = (void (**)(id, id))objc_getProperty(self, v7, 56LL, 1);
    Property[2](Property, v5);
    objc_setProperty_atomic_copy(self, v9, 0LL, 56LL);
  }
}

- (void)startedWithError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (v5)
  {
    ne_log_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [v5 localizedDescription];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = 138412546;
      id v13 = self;
      __int16 v14 = 2112;
      __int16 v15 = v11;
      _os_log_error_impl(&dword_1876B1000, v6, OS_LOG_TYPE_ERROR, "%@: Started with error %@", (uint8_t *)&v12, 0x16u);
    }

    -[NEExtensionProviderContext hostContext](self, v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 startedWithError:v5];

    if (self) {
      objc_setProperty_atomic_copy(self, v9, 0LL, 56LL);
    }
  }

  else
  {
    -[NEExtensionProviderContext hostContext](self, v4);
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 startedWithError:0];
  }
}

- (void)displayMessage:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  ne_log_obj();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412290;
    __int16 v15 = self;
    _os_log_debug_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEBUG, "%@: display message", (uint8_t *)&v14, 0xCu);
  }

  -[NEExtensionProviderContext hostContext](self, v12);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 displayMessage:v10 message:v9 completionHandler:v8];
}

- (void)createWithCompletionHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v4 = (void (**)(id, void))a3;
  [MEMORY[0x1896077F8] mainBundle];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForInfoDictionaryKey:@"NetworkExtension"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isa_nsdictionary(v6) & 1) == 0)
  {
    ne_log_obj();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v19 = "NetworkExtension dictionary is missing from Info.plist";
LABEL_26:
    _os_log_error_impl(&dword_1876B1000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_11;
  }

  -[NEExtensionProviderContext extensionPoint](self, "extensionPoint");
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v6 objectForKeyedSubscript:@"NEProviderClasses"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isa_nsdictionary(v8) & 1) == 0)
    {
      ne_log_obj();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = @"NEProviderClasses";
        _os_log_error_impl( &dword_1876B1000,  v20,  OS_LOG_TYPE_ERROR,  "%@ dictionary is missing from Info.plist",  buf,  0xCu);
      }

      v4[2](v4, 0LL);
      goto LABEL_20;
    }

    -[NEExtensionProviderContext extensionPoint](self, "extensionPoint");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:v9];
    id v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSString length](v10, "length"))
    {
      v11 = NSClassFromString(v10);
      if (v11)
      {
        int v12 = (NEProvider *)objc_alloc_init(v11);
        -[NEProvider beginRequestWithExtensionContext:](v12, "beginRequestWithExtensionContext:", self);
        provider = self->_provider;
        self->_provider = v12;
        int v14 = v12;

        __int16 v15 = (void *)[objc_alloc(NSString) initWithFormat:@"com.apple.networkextension.providerContext.%@", v10];
        [v15 UTF8String];
        uint64_t v16 = (OS_os_transaction *)os_transaction_create();
        transaction = self->_transaction;
        self->_transaction = v16;

        v4[2](v4, 1LL);
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }

      ne_log_obj();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = (const __CFString *)v10;
        _os_log_error_impl(&dword_1876B1000, v22, OS_LOG_TYPE_ERROR, "No such class: %@", buf, 0xCu);
      }
    }

    else
    {
      ne_log_obj();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[NEExtensionProviderContext extensionPoint](self, "extensionPoint");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v23;
        _os_log_error_impl( &dword_1876B1000,  v21,  OS_LOG_TYPE_ERROR,  "NetworkExtension Info.plist dictionary does not contain a NEProvider class for extension point %@",  buf,  0xCu);
      }
    }

    v4[2](v4, 0LL);
    goto LABEL_19;
  }

  ne_log_obj();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v19 = "Extension point is nil";
    goto LABEL_26;
  }

- (void)dispose
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (!self || !self->_isDisposed)
  {
    ne_log_obj();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = self;
      _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "%@: disposing", (uint8_t *)&v4, 0xCu);
    }

    if (self) {
      self->_isDisposed = 1;
    }
    -[NEExtensionProviderContext completeSession](self, "completeSession");
  }

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, a4, 56LL);
  }
}

- (void)stopWithReason:(int)a3
{
  if (a3 == 40)
  {
    uint64_t v4 = 3LL;
  }

  else
  {
    if (a3 != 6)
    {
      uint64_t v5 = 0LL;
      goto LABEL_7;
    }

    uint64_t v4 = 2LL;
  }

  uint64_t v5 = [objc_alloc(MEMORY[0x189607870]) initWithDomain:@"NEAgentErrorDomain" code:v4 userInfo:0];
LABEL_7:
  id v6 = (id)v5;
  -[NEExtensionProviderContext cancelWithError:](self, "cancelWithError:", v5);
}

- (void)validateWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, void *))a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEExtensionProviderContext requiredProviderSuperClass](self, "requiredProviderSuperClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = 0LL;
  }

  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"NEFilterErrorDomain" code:4 userInfo:0];
    ne_log_obj();
    SEL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(-[NEExtensionProviderContext requiredProviderSuperClass](self, "requiredProviderSuperClass"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v9 = 138412290;
      id v10 = v8;
      _os_log_error_impl(&dword_1876B1000, v7, OS_LOG_TYPE_ERROR, "Provider is not a %@", (uint8_t *)&v9, 0xCu);
    }
  }

  v4[2](v4, v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 observerHelperHandler:v12 ofObject:v11 change:v10 context:a6];
}

- (NSString)extensionPoint
{
  return 0LL;
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

- (void)hostContext
{
  if (self)
  {
    v2 = self;
    v3 = (void *)self[3];
    if (!v3)
    {
      id v4 = objc_getProperty(self, a2, 64LL, 1);
      if (!v4)
      {
        [v2 _auxiliaryConnection];
        id v4 = (id)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_75];
      id v6 = (void *)v2[3];
      v2[3] = v5;

      if (!v2[3])
      {
        ne_log_obj();
        SEL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)int v9 = 0;
          _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "Host context object is nil, cannot talk to host",  v9,  2u);
        }
      }

      v3 = (void *)v2[3];
    }

    self = v3;
  }

  return self;
}

void __41__NEExtensionProviderContext_hostContext__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_INFO, "Error while calling host: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setDescription:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2600 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2600, &__block_literal_global_2601);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2602;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2597 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2597, &__block_literal_global_65);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_2598;
}

void __61__NEExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8AD0];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_2598;
  _extensionAuxiliaryHostProtocol_protocol_2598 = v0;
}

void __63__NEExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8A28];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2602;
  _extensionAuxiliaryVendorProtocol_protocol_2602 = v0;
}

void __49__NEExtensionProviderContext_initWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEFAULT, "%@: Session manager connection was invalidated", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5 && objc_getProperty(v5, v4, 56LL, 1))
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    newValue[0] = MEMORY[0x1895F87A8];
    newValue[1] = 3221225472LL;
    newValue[2] = __49__NEExtensionProviderContext_initWithConnection___block_invoke_1;
    newValue[3] = &unk_18A08F268;
    objc_copyWeak(&v9, (id *)buf);
    SEL v7 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_setProperty_atomic_copy(v7, v6, newValue, 56LL);
      SEL v7 = *(void **)(a1 + 32);
    }

    [v7 stopWithReason:1];
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }

void __49__NEExtensionProviderContext_initWithConnection___block_invoke_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dispose];
}

@end