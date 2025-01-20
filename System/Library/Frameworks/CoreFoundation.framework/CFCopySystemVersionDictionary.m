@interface CFCopySystemVersionDictionary
@end

@implementation CFCopySystemVersionDictionary

void ___CFCopySystemVersionDictionary_block_invoke()
{
  Copy = CFStringCreateCopy( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  @"/System/Library/CoreServices/SystemVersion.plist");
  v1 = _CFCopyVersionDictionary(Copy);
  CFRelease(Copy);
  _CFCopySystemVersionDictionary_result = (uint64_t)v1;
}

@end