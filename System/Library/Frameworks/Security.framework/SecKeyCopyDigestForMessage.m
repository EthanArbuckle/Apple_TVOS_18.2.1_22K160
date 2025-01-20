@interface SecKeyCopyDigestForMessage
@end

@implementation SecKeyCopyDigestForMessage

__CFData *__SecKeyCopyDigestForMessage_block_invoke(uint64_t a1, uint64_t a2, const __CFData *a3)
{
  result = SecKeyRunAlgorithmAndCopyResult( *(uint64_t **)(a1 + 56),  a3,  *(const __CFData **)(a1 + 64),  *(__CFString ***)(a1 + 72));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

@end