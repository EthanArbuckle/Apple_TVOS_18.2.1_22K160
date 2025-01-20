@interface NEExtensionAppPushProviderContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)extensionPoint;
- (void)dealloc;
- (void)reportIncomingCall:(id)a3;
- (void)reportPushToTalkMessage:(id)a3;
- (void)sendTimerEvent;
- (void)setProviderConfiguration:(id)a3;
- (void)startConnectionWithProviderConfig:(id)a3 completionHandler:(id)a4;
- (void)stopWithReason:(int)a3 completionHandler:(id)a4;
@end

@implementation NEExtensionAppPushProviderContext

- (id)extensionPoint
{
  return @"com.apple.networkextension.app-push";
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_1876B1000, v3, OS_LOG_TYPE_DEBUG, "%@: dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEExtensionAppPushProviderContext;
  -[NEExtensionProviderContext dealloc](&v4, sel_dealloc);
}

- (void)startConnectionWithProviderConfig:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  v8 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v9 = v8;
  if (v6) {
    [v8 setProviderConfiguration:v6];
  }
  id v10 = v9;
  v11 = v10;
  if (self && (uint64_t v12 = [v10 superclass]) != 0)
  {
    v13 = (void *)v12;
    uint64_t v14 = [v11 methodForSelector:sel_start];
    BOOL v15 = v14 != [v13 instanceMethodForSelector:sel_start];
  }

  else
  {
    BOOL v15 = 0;
  }

  ne_log_obj();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_debug_impl(&dword_1876B1000, v16, OS_LOG_TYPE_DEBUG, "%@ the new start method is overridden", buf, 0xCu);
    }

    [v11 start];
    v7[2](v7, 0LL);
  }

  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_debug_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_DEBUG,  "%@ the new start method is not overridden",  buf,  0xCu);
    }

    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __89__NEExtensionAppPushProviderContext_startConnectionWithProviderConfig_completionHandler___block_invoke;
    v18[3] = &unk_18A090968;
    v18[4] = self;
    v19 = v7;
    [v11 startWithCompletionHandler:v18];
  }
}

- (void)stopWithReason:(int)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  ne_log_obj();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = self;
    _os_log_debug_impl(&dword_1876B1000, v7, OS_LOG_TYPE_DEBUG, "%@ stopWithReason called", buf, 0xCu);
  }
  v8 = -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  else {
    uint64_t v9 = 0LL;
  }
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __70__NEExtensionAppPushProviderContext_stopWithReason_completionHandler___block_invoke;
  v11[3] = &unk_18A0908C8;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 stopWithReason:v9 completionHandler:v11];
}

- (void)setProviderConfiguration:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setProviderConfiguration:v4];
}

- (void)reportIncomingCall:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderContext hostContext](self, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 reportIncomingCall:v4];
}

- (void)reportPushToTalkMessage:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderContext hostContext](self, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 reportPushToTalkMessage:v4];
}

- (void)sendTimerEvent
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_debug_impl(&dword_1876B1000, v3, OS_LOG_TYPE_DEBUG, "%@ sendTimerEvent called", (uint8_t *)&v5, 0xCu);
  }

  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleTimerEvent];
}

uint64_t __70__NEExtensionAppPushProviderContext_stopWithReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEBUG, "%@ provider stopped", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __89__NEExtensionAppPushProviderContext_startConnectionWithProviderConfig_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    ne_log_obj();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%@ startWithCompletionHandler failed, error: %@",  (uint8_t *)&v6,  0x16u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_22456 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_22456, &__block_literal_global_22457);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_22458;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_22452 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_22452, &__block_literal_global_71_22453);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_22454;
}

void __68__NEExtensionAppPushProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EBBD0];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_22454;
  _extensionAuxiliaryHostProtocol_protocol_22454 = v0;
}

void __70__NEExtensionAppPushProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EBB70];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_22458;
  _extensionAuxiliaryVendorProtocol_protocol_22458 = v0;
}

@end