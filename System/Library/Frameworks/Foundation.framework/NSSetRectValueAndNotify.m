@interface NSSetRectValueAndNotify
@end

@implementation NSSetRectValueAndNotify

uint64_t ___NSSetRectValueAndNotify_block_invoke(uint64_t a1)
{
  IMP MethodImplementation = class_getMethodImplementation(**(Class **)(a1 + 40), *(SEL *)(a1 + 48));
  return (uint64_t)MethodImplementation( *(id *)(a1 + 32),  *(SEL *)(a1 + 48),  *(double *)(a1 + 56),  *(double *)(a1 + 64),  *(double *)(a1 + 72),  *(double *)(a1 + 80));
}

@end