@interface NSData
+ (BOOL)isSensitiveDataInstance:(uint64_t)a1;
+ (CFDataRef)sensitiveDataWithBytes:(CFIndex)a3 length:;
+ (CFDataRef)sensitiveDataWithData:(uint64_t)a1;
@end

@implementation NSData

+ (BOOL)isSensitiveDataInstance:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  if (v2)
  {
    CFAllocatorRef v3 = CFGetAllocator(v2);
    BOOL v4 = v3 == (CFAllocatorRef)SecCFAllocatorZeroize();
  }

  else
  {
    BOOL v4 = 0LL;
  }

  return v4;
}

+ (CFDataRef)sensitiveDataWithData:(uint64_t)a1
{
  id v2 = a2;
  objc_opt_self();
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)SecCFAllocatorZeroize();
    CFDataRef Copy = CFDataCreateCopy(v3, v2);
  }

  else
  {
    CFDataRef Copy = 0LL;
  }

  return Copy;
}

+ (CFDataRef)sensitiveDataWithBytes:(CFIndex)a3 length:
{
  if (!a2) {
    return 0LL;
  }
  v5 = (const __CFAllocator *)SecCFAllocatorZeroize();
  return CFDataCreate(v5, a2, a3);
}

@end