@interface NSSetBoolValueAndNotify
@end

@implementation NSSetBoolValueAndNotify

uint64_t ___NSSetBoolValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  return (uint64_t)MethodImplementation(*(id *)(a1 + 32), *(SEL *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

@end