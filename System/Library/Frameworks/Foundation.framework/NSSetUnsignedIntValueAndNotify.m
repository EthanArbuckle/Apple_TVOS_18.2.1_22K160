@interface NSSetUnsignedIntValueAndNotify
@end

@implementation NSSetUnsignedIntValueAndNotify

uint64_t ___NSSetUnsignedIntValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  return (uint64_t)MethodImplementation(*(id *)(a1 + 32), *(SEL *)(a1 + 48), *(unsigned int *)(a1 + 56));
}

@end