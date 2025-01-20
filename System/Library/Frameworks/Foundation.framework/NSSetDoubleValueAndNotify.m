@interface NSSetDoubleValueAndNotify
@end

@implementation NSSetDoubleValueAndNotify

uint64_t ___NSSetDoubleValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  return (uint64_t)MethodImplementation(*(id *)(a1 + 32), *(SEL *)(a1 + 48), *(double *)(a1 + 56));
}

@end