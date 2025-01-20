@interface NEFilterControlExtensionProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (id)extensionPoint;
- (void)dealloc;
- (void)dispose;
- (void)handleNewFlow:(id)a3 completionHandler:(id)a4;
- (void)handleReport:(id)a3;
- (void)notifyRulesChanged;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)provideRemediationMap:(id)a3;
- (void)provideURLAppendStringMap:(id)a3;
- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopObserving;
@end

@implementation NEFilterControlExtensionProviderContext

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  objc_initWeak(&location, v8);

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___NEFilterControlExtensionProviderContext;
  -[NEFilterExtensionProviderContext startFilterWithOptions:completionHandler:]( &v15,  sel_startFilterWithOptions_completionHandler_,  v6,  v7);
  objc_initWeak(&from, self);
  ne_log_obj();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl(&dword_1876B1000, v9, OS_LOG_TYPE_DEFAULT, "%@: Calling startFilterWithCompletionHandler", buf, 0xCu);
  }

  id v10 = objc_loadWeakRetained(&location);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __84__NEFilterControlExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke;
  v11[3] = &unk_18A08BF50;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  [v10 startFilterWithCompletionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)dispose
{
  if (!self || !self->super.super._isDisposed)
  {
    -[NEFilterControlExtensionProviderContext stopObserving](self);
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___NEFilterControlExtensionProviderContext;
    -[NEExtensionProviderContext dispose](&v3, sel_dispose);
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEFilterControlExtensionProviderContext;
  -[NEExtensionProviderContext dealloc](&v3, sel_dealloc);
}

- (id)extensionPoint
{
  return @"com.apple.networkextension.filter-control";
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v14 isEqualToString:@"remediationMap"])
  {
    [v7 remediationMap];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 count];

    if (v9)
    {
      [v7 remediationMap];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEFilterControlExtensionProviderContext provideRemediationMap:](self, "provideRemediationMap:", v10);
    }
  }

  if ([v14 isEqualToString:@"URLAppendStringMap"])
  {
    [v7 URLAppendStringMap];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 count];

    if (v12)
    {
      [v7 URLAppendStringMap];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEFilterControlExtensionProviderContext provideURLAppendStringMap:](self, "provideURLAppendStringMap:", v13);
    }
  }
}

- (void)handleNewFlow:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  id v9 = v8;
  if (v7 && (v7[10] & 1) != 0) {
    [v8 handleRemediationForFlow:v7 completionHandler:v6];
  }
  else {
    [v8 handleNewFlow:v7 completionHandler:v6];
  }
}

- (void)handleReport:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleReport:v4];
}

- (void)notifyRulesChanged
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 notifyRulesChanged];
}

- (void)provideRemediationMap:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderContext hostContext](self, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 provideRemediationMap:v4];
}

- (void)provideURLAppendStringMap:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderContext hostContext](self, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 provideURLAppendStringMap:v4];
}

- (void)stopObserving
{
  if (a1)
  {
    if ((a1[104] & 1) != 0)
    {
      [a1 _principalObject];
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      [v2 removeObserver:a1 forKeyPath:@"remediationMap"];
      [v2 removeObserver:a1 forKeyPath:@"URLAppendStringMap"];
      a1[104] = 0;
    }
  }

void __84__NEFilterControlExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = v5;
  if (WeakRetained && v5)
  {
    if (v5[41])
    {
      ne_log_obj();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "The completion handler for startFilterWithOptions: was executed twice",  v8,  2u);
      }
    }

    else
    {
      v5[41] = 1;
      if (!v3)
      {
        [WeakRetained addObserver:v5 forKeyPath:@"remediationMap" options:5 context:0];
        [WeakRetained addObserver:v6 forKeyPath:@"URLAppendStringMap" options:5 context:0];
        v6[104] = 1;
      }

      [v6 startedWithError:v3];
    }
  }
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_3453 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_3453, &__block_literal_global_3454);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_3455;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_3449 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_3449, &__block_literal_global_68_3450);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_3451;
}

void __74__NEFilterControlExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EB290];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_3451;
  _extensionAuxiliaryHostProtocol_protocol_3451 = v0;
}

void __76__NEFilterControlExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EB1E0];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_3455;
  _extensionAuxiliaryVendorProtocol_protocol_3455 = v0;
}

@end