@interface NEExtensionTunnelProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)didSetReasserting:(BOOL)a3;
- (void)establishIPCWithCompletionHandler:(id)a3;
- (void)handleIPCDetached;
- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation NEExtensionTunnelProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2949 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2949, &__block_literal_global_2950);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2951;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2945 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2945, &__block_literal_global_62_2946);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_2947;
}

void __71__NEExtensionTunnelProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8C18];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_2947;
  _extensionAuxiliaryHostProtocol_protocol_2947 = v0;
}

void __73__NEExtensionTunnelProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8B58];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2951;
  _extensionAuxiliaryVendorProtocol_protocol_2951 = v0;
}

- (void)didSetReasserting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEFAULT, "%@: setting reasserting %d", (uint8_t *)&v8, 0x12u);
  }

  if (v3) {
    uint64_t v6 = 5LL;
  }
  else {
    uint64_t v6 = 4LL;
  }
  v7 = -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  [v7 extension:self didSetStatus:v6];
}

- (void)setTunnelConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v7 = a3;
  ne_log_obj();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    BOOL v11 = self;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_DEFAULT, "%@: setting tunnel configuration", (uint8_t *)&v10, 0xCu);
  }
  v9 = -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.isa);
  [v9 extension:self didSetTunnelConfiguration:v7 completionHandler:v6];
}

- (void)establishIPCWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 establishIPCWithCompletionHandler:v4];
}

- (void)handleIPCDetached
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 extensionDidDetachIPC:self];
}

@end