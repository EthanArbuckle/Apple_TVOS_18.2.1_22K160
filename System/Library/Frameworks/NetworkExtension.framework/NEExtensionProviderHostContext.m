@interface NEExtensionProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (NSString)description;
- (id)delegate;
- (id)initWithVendorEndpoint:(void *)a3 processIdentity:(void *)a4 delegate:;
- (id)vendorContext;
- (int)requiredEntitlement;
- (void)createWithCompletionHandler:(id)a3;
- (void)displayMessage:(id)a3 message:(id)a4 completionHandler:(id)a5;
- (void)dispose;
- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4;
- (void)sleepWithCompletionHandler:(id)a3;
- (void)startWithOptions:(id)a3 completionHandler:(id)a4;
- (void)startedWithError:(id)a3;
- (void)stopWithReason:(int)a3;
- (void)validateWithCompletionHandler:(id)a3;
- (void)wake;
@end

@implementation NEExtensionProviderHostContext

- (NSString)description
{
  return self->_description;
}

- (void)setConfiguration:(id)a3 extensionIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v6 = (void *)NSString;
  id v7 = a4;
  id v8 = a3;
  [v6 stringWithFormat:@"[Host %@]", v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (self) {
    objc_storeStrong((id *)&self->_description, v9);
  }

  ne_log_obj();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_debug_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEBUG, "%@: Set Configuration", buf, 0xCu);
  }
  v12 = -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  [v12 setConfiguration:v8 extensionIdentifier:v7];
}

- (void)sleepWithCompletionHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "%@: Sleeping", (uint8_t *)&v7, 0xCu);
  }
  v6 = -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  [v6 sleepWithCompletionHandler:v4];
}

- (void)wake
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_1876B1000, v3, OS_LOG_TYPE_DEBUG, "%@: Waking", (uint8_t *)&v5, 0xCu);
  }

  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 wake];
}

- (void)createWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 createWithCompletionHandler:v4];
}

- (void)dispose
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_1876B1000, v3, OS_LOG_TYPE_DEBUG, "%@: disposing", (uint8_t *)&v5, 0xCu);
  }

  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 dispose];
}

- (void)startedWithError:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ne_log_obj();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "%@: started with error %@", (uint8_t *)&v7, 0x16u);
  }
  v6 = -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.isa);
  [v6 extension:self didStartWithError:v4];
}

- (void)displayMessage:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc(&OBJC_CLASS___NEUserNotification);
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __75__NEExtensionProviderHostContext_displayMessage_message_completionHandler___block_invoke;
  v15[3] = &unk_18A08BE08;
  id v16 = v8;
  id v12 = v8;
  v13 = -[NEUserNotification initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem:callbackQueue:callbackHandler:]( v11,  "initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem: callbackQueue:callbackHandler:",  v10,  v9,  0LL,  0LL,  0LL,  0LL,  0LL,  MEMORY[0x1895F8AE0],  v15);

  notification = self->_notification;
  self->_notification = v13;
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  ne_log_obj();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2048;
    id v13 = v6;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting with options %p", (uint8_t *)&v10, 0x16u);
  }

  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 startWithOptions:v6 completionHandler:v7];
}

- (void)stopWithReason:(int)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (!self->_stopped)
  {
    uint64_t v3 = *(void *)&a3;
    self->_stopped = 1;
    ne_log_obj();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412546;
      id v8 = self;
      __int16 v9 = 2048;
      uint64_t v10 = (int)v3;
      _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "%@: Stopping with reason %ld", (uint8_t *)&v7, 0x16u);
    }

    -[NEUserNotification cancel](self->_notification, "cancel");
    -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stopWithReason:v3];
  }

- (void)validateWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = (void (**)(id, void *))a3;
  ne_log_obj();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412290;
    id v16 = self;
    _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "%@: Validating", (uint8_t *)&v15, 0xCu);
  }

  id v6 = @"com.apple.developer.networking.networkextension";
  if (self)
  {
    int v7 = self->_vendorConnection;
    if (v7
      || (-[NSExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection"),
          (int v7 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue()) != 0LL))
    {
      -[NSXPCConnection _xpcConnection](v7, "_xpcConnection");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[NSXPCConnection _xpcConnection](v7, "_xpcConnection");
        __int16 v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = @"com.apple.developer.networking.networkextension";
        [@"com.apple.developer.networking.networkextension" UTF8String];
        id v8 = (void *)xpc_connection_copy_entitlement_value();
      }
    }

    else
    {
      id v8 = 0LL;
    }
  }

  else
  {
    id v8 = 0LL;
  }

  int v11 = NEGetEntitlement(v8);
  if ((-[NEExtensionProviderHostContext requiredEntitlement](self, "requiredEntitlement") & v11) != 0)
  {
    -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.isa);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 validateWithCompletionHandler:v4];
  }

  else
  {
    ne_log_obj();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = -[NEExtensionProviderHostContext requiredEntitlement](self, "requiredEntitlement");
      int v15 = 67109120;
      LODWORD(v16) = v14;
      _os_log_error_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_ERROR,  "Provider is missing the required NetworkExtension entitlement (%x)",  (uint8_t *)&v15,  8u);
    }

    __int16 v12 = (void *)[objc_alloc(MEMORY[0x189607870]) initWithDomain:@"NEFilterErrorDomain" code:1 userInfo:0];
    v4[2](v4, v12);
  }
}

- (int)requiredEntitlement
{
  return 0;
}

- (void).cxx_destruct
{
}

- (id)vendorContext
{
  if (val)
  {
    v1 = val;
    id v2 = val[3];
    if (!v2)
    {
      objc_initWeak(&location, val);
      id v3 = v1[9];
      if (!v3)
      {
        [v1 _auxiliaryConnection];
        id v3 = (id)objc_claimAutoreleasedReturnValue();
      }

      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = __47__NEExtensionProviderHostContext_vendorContext__block_invoke;
      v9[3] = &unk_18A08F268;
      objc_copyWeak(&v10, &location);
      uint64_t v4 = [v3 remoteObjectProxyWithErrorHandler:v9];
      id v5 = v1[3];
      v1[3] = (id)v4;

      if (!v1[3])
      {
        ne_log_obj();
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v8[0] = 0;
          _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "Vendor context object is nil, cannot talk to extension",  (uint8_t *)v8,  2u);
        }
      }

      objc_destroyWeak(&v10);

      objc_destroyWeak(&location);
      id v2 = v1[3];
    }

    val = (id *)v2;
  }

  return val;
}

void __47__NEExtensionProviderHostContext_vendorContext__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  ne_log_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1876B1000, v5, OS_LOG_TYPE_INFO, "Error while calling extension: %@", (uint8_t *)&v9, 0xCu);
  }

  if (WeakRetained)
  {
    id v6 = (os_log_s *)objc_loadWeakRetained(WeakRetained + 7);
    if (v6)
    {
      int v7 = v6;
      -[os_log_s extension:didFailWithError:](v6, "extension:didFailWithError:", WeakRetained, v3);
    }

    else
    {
      ne_log_obj();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "Host context delegate is nil, cannot notify of extension failure",  (uint8_t *)&v9,  2u);
      }

      int v7 = 0LL;
    }
  }

  else
  {
    ne_log_obj();
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "Host context is nil, cannot notify of extension failure",  (uint8_t *)&v9,  2u);
    }
  }
}

uint64_t __75__NEExtensionProviderHostContext_displayMessage_message_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)delegate
{
  if (WeakRetained) {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 7);
  }
  return WeakRetained;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2740 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2740, &__block_literal_global_2741);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2742;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2737 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2737, &__block_literal_global_61);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_2738;
}

void __65__NEExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8AD0];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_2738;
  _extensionAuxiliaryHostProtocol_protocol_2738 = v0;
}

void __67__NEExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8A28];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2742;
  _extensionAuxiliaryVendorProtocol_protocol_2742 = v0;
}

- (id)initWithVendorEndpoint:(void *)a3 processIdentity:(void *)a4 delegate:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)&OBJC_CLASS___NEExtensionProviderHostContext;
    id v10 = (id *)objc_msgSendSuper2(&v22, sel_initWithInputItems_, 0);
    a1 = v10;
    if (v10)
    {
      objc_storeWeak(v10 + 7, v9);
      *((_BYTE *)a1 + 49) = 1;
      uint64_t v11 = [objc_alloc(MEMORY[0x189607B30]) initWithListenerEndpoint:v7];
      id v12 = a1[9];
      a1[9] = (id)v11;

      [(id)objc_opt_class() _extensionAuxiliaryHostProtocol];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [a1[9] setExportedInterface:v13];

      [a1[9] setExportedObject:a1];
      [(id)objc_opt_class() _extensionAuxiliaryVendorProtocol];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      [a1[9] setRemoteObjectInterface:v14];

      objc_initWeak(&location, a1);
      uint64_t v15 = MEMORY[0x1895F87A8];
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke;
      v19[3] = &unk_18A08FAC8;
      objc_copyWeak(&v20, &location);
      [a1[9] setInterruptionHandler:v19];
      v17[0] = v15;
      v17[1] = 3221225472LL;
      v17[2] = __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke_2;
      v17[3] = &unk_18A08FAC8;
      objc_copyWeak(&v18, &location);
      [a1[9] setInvalidationHandler:v17];
      [a1[9] resume];
      objc_storeStrong(a1 + 8, a3);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }

  return a1;
}

void __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke( uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 7);
    [v3 extension:v6 didFailWithError:0];

    id v2 = v6;
    id v4 = v6[9];
    if (v4)
    {
      [v4 invalidate];
      id v5 = v6[9];
      v6[9] = 0LL;

      id v2 = v6;
    }
  }
}

void __82__NEExtensionProviderHostContext_initWithVendorEndpoint_processIdentity_delegate___block_invoke_2( uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 7);
    [v3 extensionDidStop:v6];

    id v2 = v6;
    id v4 = v6[9];
    if (v4)
    {
      [v4 invalidate];
      id v5 = v6[9];
      v6[9] = 0LL;

      id v2 = v6;
    }
  }
}

@end