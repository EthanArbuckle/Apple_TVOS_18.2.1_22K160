@interface NSExtensionContextInternalClass
@end

@implementation NSExtensionContextInternalClass

uint64_t ___NSExtensionContextInternalClass_block_invoke()
{
  if (softLinkEXGetExtensionContextInternalClass) {
    uint64_t result = softLinkEXGetExtensionContextInternalClass();
  }
  else {
    uint64_t result = 0LL;
  }
  qword_18C496790 = result;
  return result;
}

@end