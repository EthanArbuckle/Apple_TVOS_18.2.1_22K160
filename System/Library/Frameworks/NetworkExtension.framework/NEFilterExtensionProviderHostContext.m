@interface NEFilterExtensionProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (int)requiredEntitlement;
- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4;
@end

@implementation NEFilterExtensionProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_4656 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_4656, &__block_literal_global_4657);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_4658;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_4652 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_4652, &__block_literal_global_62_4653);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_4654;
}

void __71__NEFilterExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EB148];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_4654;
  _extensionAuxiliaryHostProtocol_protocol_4654 = v0;
}

void __73__NEFilterExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EB0E8];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_4658;
  _extensionAuxiliaryVendorProtocol_protocol_4658 = v0;
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 startFilterWithOptions:v7 completionHandler:v6];
}

- (int)requiredEntitlement
{
  return 4;
}

@end