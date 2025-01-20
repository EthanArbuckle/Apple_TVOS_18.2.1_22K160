@interface NSSetFloatValueAndNotify
@end

@implementation NSSetFloatValueAndNotify

uint64_t ___NSSetFloatValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  return (uint64_t)MethodImplementation(*(id *)(a1 + 32), *(SEL *)(a1 + 48), *(float *)(a1 + 56));
}

@end