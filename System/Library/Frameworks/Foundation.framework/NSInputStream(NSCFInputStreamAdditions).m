@interface NSInputStream(NSCFInputStreamAdditions)
- (CFIndex)_cfStreamError;
@end

@implementation NSInputStream(NSCFInputStreamAdditions)

- (CFIndex)_cfStreamError
{
  if (object_getClass(a1) == (Class)&OBJC_CLASS___NSCFInputStream) {
    return CFReadStreamGetError(a1).domain;
  }
  else {
    return -1LL;
  }
}

@end