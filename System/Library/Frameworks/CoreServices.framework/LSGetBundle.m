@interface LSGetBundle
@end

@implementation LSGetBundle

void ___LSGetBundle_block_invoke()
{
  CFURLRef v0 = CFURLCreateWithFileSystemPath( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"/System/Library/Frameworks/CoreServices.framework",  kCFURLPOSIXPathStyle,  1u);
  if (v0)
  {
    CFURLRef v1 = v0;
    _LSGetBundle::gBundleRef = _CFBundleCreateUnique();
    CFRelease(v1);
  }

@end