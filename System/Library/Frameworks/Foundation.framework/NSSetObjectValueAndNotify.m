@interface NSSetObjectValueAndNotify
@end

@implementation NSSetObjectValueAndNotify

uint64_t ___NSSetObjectValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 48), *(SEL *)(a1 + 56));
  return (uint64_t)MethodImplementation(*(id *)(a1 + 32), *(SEL *)(a1 + 56), *(void *)(a1 + 40));
}

@end