@interface CFCopyLogicalKeysMappedToProcessedValues
@end

@implementation CFCopyLogicalKeysMappedToProcessedValues

void ___CFCopyLogicalKeysMappedToProcessedValues_block_invoke(CFDictionaryRef *a1, const void *a2)
{
  Value = CFDictionaryGetValue(a1[4], a2);
  if (Value)
  {
    v5 = CFDictionaryGetValue(a1[5], Value);
    if (v5) {
      CFDictionarySetValue(a1[6], a2, v5);
    }
  }

@end