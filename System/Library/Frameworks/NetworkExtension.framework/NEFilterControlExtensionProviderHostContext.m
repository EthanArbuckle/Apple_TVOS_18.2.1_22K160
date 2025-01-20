@interface NEFilterControlExtensionProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)handleNewFlow:(id)a3 completionHandler:(id)a4;
- (void)handleReport:(id)a3;
- (void)notifyRulesChanged;
- (void)provideRemediationMap:(id)a3;
- (void)provideURLAppendStringMap:(id)a3;
@end

@implementation NEFilterControlExtensionProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_3532 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_3532, &__block_literal_global_3533);
  }
  return (id)_extensionAuxiliaryVendorProtocol_protocol_3534;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_3528 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_3528, &__block_literal_global_68_3529);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_3530;
}

void __78__NEFilterControlExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EB290];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_3530;
  _extensionAuxiliaryHostProtocol_protocol_3530 = v0;
}

void __80__NEFilterControlExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6EB1E0];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_3534;
  _extensionAuxiliaryVendorProtocol_protocol_3534 = v0;
}

- (void)handleNewFlow:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 handleNewFlow:v7 completionHandler:v6];
}

- (void)handleReport:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
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
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 provideRemediationMap:v4];
}

- (void)provideURLAppendStringMap:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 provideURLAppendStringMap:v4];
}

@end