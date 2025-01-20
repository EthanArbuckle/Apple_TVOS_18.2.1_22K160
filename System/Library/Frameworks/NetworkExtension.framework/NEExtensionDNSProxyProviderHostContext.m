@interface NEExtensionDNSProxyProviderHostContext
+ (id)_extensionAuxiliaryVendorProtocol;
- (int)requiredEntitlement;
- (void)setSystemDNSSettings:(id)a3;
@end

@implementation NEExtensionDNSProxyProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2142 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2142, &__block_literal_global_2143);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_2144;
}

void __75__NEExtensionDNSProxyProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EA978];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2144;
  _extensionAuxiliaryVendorProtocol_protocol_2144 = v0;

  v2 = (void *)MEMORY[0x189604010];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_extensionAuxiliaryVendorProtocol_protocol_2144 setClasses:v4 forSelector:sel_setSystemDNSSettings_ argumentIndex:0 ofReply:0];
}

- (void)setSystemDNSSettings:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setSystemDNSSettings:v4];
}

- (int)requiredEntitlement
{
  return 16;
}

@end