@interface NSOutputStream(NSCFOutputStreamAdditions)
- (CFIndex)_cfStreamError;
@end

@implementation NSOutputStream(NSCFOutputStreamAdditions)

- (CFIndex)_cfStreamError
{
  if (object_getClass(a1) == (Class)&OBJC_CLASS___NSCFOutputStream) {
    return CFWriteStreamGetError(a1).domain;
  }
  else {
    return -1LL;
  }
}

@end