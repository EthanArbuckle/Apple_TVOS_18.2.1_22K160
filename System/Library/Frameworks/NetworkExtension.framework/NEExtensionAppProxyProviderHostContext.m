@interface NEExtensionAppProxyProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (int)requiredEntitlement;
- (void)openFlowDivertControlSocketWithCompletionHandler:(id)a3;
- (void)setDelegateInterface:(unsigned int)a3;
- (void)setInitialFlowDivertControlSocket:(id)a3;
@end

@implementation NEExtensionAppProxyProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_1890 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_1890, &__block_literal_global_1891);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_1892;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_1886 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_1886, &__block_literal_global_68_1887);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_1888;
}

void __73__NEExtensionAppProxyProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8D10];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_1888;
  _extensionAuxiliaryHostProtocol_protocol_1888 = v0;
}

void __75__NEExtensionAppProxyProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6E8C78];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_1892;
  _extensionAuxiliaryVendorProtocol_protocol_1892 = v0;
}

- (void)setInitialFlowDivertControlSocket:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setInitialFlowDivertControlSocket:v4];
}

- (void)setDelegateInterface:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setDelegateInterface:v3];
}

- (void)openFlowDivertControlSocketWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 extension:self didRequestFlowDivertControlSocketWithCompletionHandler:v4];
}

- (int)requiredEntitlement
{
  return 2;
}

@end