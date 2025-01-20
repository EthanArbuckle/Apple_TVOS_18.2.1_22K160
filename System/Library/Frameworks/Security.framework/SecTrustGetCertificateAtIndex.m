@interface SecTrustGetCertificateAtIndex
@end

@implementation SecTrustGetCertificateAtIndex

CFArrayRef __SecTrustGetCertificateAtIndex_block_invoke_2(void *a1)
{
  result = *(const __CFArray **)(a1[5] + 72LL);
  if (result)
  {
    result = (const __CFArray *)CFArrayGetValueAtIndex(result, a1[6]);
    *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  }

  return result;
}

@end