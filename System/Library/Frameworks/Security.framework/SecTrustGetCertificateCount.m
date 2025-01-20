@interface SecTrustGetCertificateCount
@end

@implementation SecTrustGetCertificateCount

CFArrayRef __SecTrustGetCertificateCount_block_invoke(uint64_t a1)
{
  result = *(const __CFArray **)(*(void *)(a1 + 40) + 72LL);
  if (result)
  {
    result = (const __CFArray *)CFArrayGetCount(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

@end