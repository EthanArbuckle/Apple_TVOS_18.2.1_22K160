@interface NSExtensionClass
@end

@implementation NSExtensionClass

uint64_t ___NSExtensionClass_block_invoke()
{
  if (softLinkEXGetExtensionClass) {
    uint64_t result = softLinkEXGetExtensionClass();
  }
  else {
    uint64_t result = 0LL;
  }
  _MergedGlobals_119 = result;
  return result;
}

@end