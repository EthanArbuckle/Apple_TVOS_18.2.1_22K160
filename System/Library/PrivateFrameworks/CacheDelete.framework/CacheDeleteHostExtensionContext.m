@interface CacheDeleteHostExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation CacheDeleteHostExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_7 != -1) {
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_8);
  }
  return (id)qword_18C4C4298;
}

void __66__CacheDeleteHostExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6DA578];
  v1 = (void *)qword_18C4C4298;
  qword_18C4C4298 = v0;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_18C4C42A0 != -1) {
    dispatch_once(&qword_18C4C42A0, &__block_literal_global_41);
  }
  return (id)qword_18C4C42A8;
}

void __68__CacheDeleteHostExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6DBF08];
  v1 = (void *)qword_18C4C42A8;
  qword_18C4C42A8 = v0;
}

@end