@interface CFICUCreateVariableNameForHeapPointer
@end

@implementation CFICUCreateVariableNameForHeapPointer

void _____CFICUCreateVariableNameForHeapPointer_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = ___CFICUCreateVariableNameLocked(*(char **)(a1 + 40));
  CFDictionarySetValue( (CFMutableDictionaryRef)variableNamesByHeapPointer,  *(const void **)(a1 + 48),  *(const void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
}

@end