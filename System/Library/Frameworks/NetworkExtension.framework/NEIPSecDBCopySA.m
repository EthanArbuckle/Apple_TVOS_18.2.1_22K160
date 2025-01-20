@interface NEIPSecDBCopySA
@end

@implementation NEIPSecDBCopySA

CFDictionaryRef __NEIPSecDBCopySA_block_invoke(uint64_t a1)
{
  result = *(const __CFDictionary **)(*(void *)(a1 + 48) + 80LL);
  if (result)
  {
    v3 = NEGetValueFromIntKeyedDictionary(result, *(_DWORD *)(a1 + 56));
    if (v3) {
      v3 = CFRetain(v3);
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3;
    result = (const __CFDictionary *)NEIPSecDBCreateQueuedRequest(*(void *)(a1 + 48), 5, *(_DWORD *)(a1 + 56));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  }

  return result;
}

@end