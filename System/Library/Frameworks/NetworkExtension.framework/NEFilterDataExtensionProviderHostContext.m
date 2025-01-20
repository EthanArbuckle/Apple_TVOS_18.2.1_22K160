@interface NEFilterDataExtensionProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)applySettings:(id)a3 completionHandler:(id)a4;
- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4;
- (void)fetchProviderConnectionWithCompletionHandler:(id)a3;
- (void)getSourceAppInfo:(id)a3 completionHandler:(id)a4;
- (void)handleRulesChanged;
- (void)provideRemediationMap:(id)a3;
- (void)provideURLAppendStringMap:(id)a3;
- (void)providerControlSocketFileHandle:(id)a3;
- (void)report:(id)a3;
- (void)sendBrowserContentFilterServerRequest;
- (void)sendSocketContentFilterRequest;
@end

@implementation NEFilterDataExtensionProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_4019 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_4019, &__block_literal_global_4020);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_4021;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_4015 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_4015, &__block_literal_global_74_4016);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_4017;
}

void __75__NEFilterDataExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EB6A8];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_4017;
  _extensionAuxiliaryHostProtocol_protocol_4017 = v0;
}

void __77__NEFilterDataExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EB580];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_4021;
  _extensionAuxiliaryVendorProtocol_protocol_4021 = v0;
}

- (void)providerControlSocketFileHandle:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 providerControlSocketFileHandle:v4];
}

- (void)fetchProviderConnectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 fetchProviderConnectionWithCompletionHandler:v4];
}

- (void)handleRulesChanged
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 handleRulesChanged];
}

- (void)provideRemediationMap:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 provideRemediationMap:v4];
}

- (void)provideURLAppendStringMap:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 provideURLAppendStringMap:v4];
}

- (void)sendBrowserContentFilterServerRequest
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendBrowserContentFilterServerRequest];
}

- (void)sendSocketContentFilterRequest
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendSocketContentFilterRequest];
}

- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 fetchCurrentRulesForFlow:v7 completionHandler:v6];
}

- (void)report:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 report:v4];
}

- (void)getSourceAppInfo:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[NEAppInfoCache sharedAppInfoCache]();
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    int v8 = *((_DWORD *)v6 + 2);
    id v9 = *((id *)v6 + 2);
    v10 = (void *)*((void *)v6 + 3);
  }

  else
  {
    id v9 = 0LL;
    int v8 = 0;
    v10 = 0LL;
  }

  id v11 = v10;

  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __79__NEFilterDataExtensionProviderHostContext_getSourceAppInfo_completionHandler___block_invoke;
  v13[3] = &unk_18A08C260;
  id v14 = v5;
  id v12 = v5;
  -[NEAppInfoCache appInfoForPid:UUID:bundleID:completionHandler:](v7, v8, v9, v11, v13);
}

- (void)applySettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 applySettings:v7 completionHandler:v6];
}

uint64_t __79__NEFilterDataExtensionProviderHostContext_getSourceAppInfo_completionHandler___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end