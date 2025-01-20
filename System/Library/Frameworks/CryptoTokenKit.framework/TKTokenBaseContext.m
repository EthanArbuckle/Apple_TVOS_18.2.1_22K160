@interface TKTokenBaseContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation TKTokenBaseContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global);
  }
  return (id)_extensionAuxiliaryVendorProtocol_interface;
}

void __55__TKTokenBaseContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B02E8];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  _extensionAuxiliaryVendorProtocol_interface = v0;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_216);
  }
  return (id)_extensionAuxiliaryHostProtocol_interface;
}

void __53__TKTokenBaseContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B7600];
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;
}

@end