@interface CopyIsDirectoryKeyArray
@end

@implementation CopyIsDirectoryKeyArray

CFArrayRef ___CopyIsDirectoryKeyArray_block_invoke(uint64_t a1)
{
  CFArrayRef result = CFArrayCreate(0LL, (const void **)&kCFURLIsDirectoryKey, 1LL, &kCFTypeArrayCallBacks);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

@end