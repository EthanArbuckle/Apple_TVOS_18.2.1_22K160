@interface NEFilterPacketExtensionProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
- (void)createPacketChannelWithCompletionHandler:(id)a3;
@end

@implementation NEFilterPacketExtensionProviderHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_21078 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_21078, &__block_literal_global_21079);
  }
  return (id)_extensionAuxiliaryHostProtocol_protocol_21080;
}

void __77__NEFilterPacketExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6F75D8];
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_21080;
  _extensionAuxiliaryHostProtocol_protocol_21080 = v0;
}

- (void)createPacketChannelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 createPacketChannelForExtension:self completionHandler:v4];
}

@end