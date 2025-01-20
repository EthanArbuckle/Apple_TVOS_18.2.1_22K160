@interface CFCopyServerVersionDictionary
@end

@implementation CFCopyServerVersionDictionary

void ___CFCopyServerVersionDictionary_block_invoke()
{
  Copy = CFStringCreateCopy( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  @"/System/Library/CoreServices/ServerVersion.plist");
  v1 = _CFCopyVersionDictionary(Copy);
  CFRelease(Copy);
  _CFCopyServerVersionDictionary_result = (uint64_t)v1;
}

@end