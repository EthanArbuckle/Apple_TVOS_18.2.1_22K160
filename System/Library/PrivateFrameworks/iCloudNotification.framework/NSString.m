@interface NSString
- (id)in_URLEncodedString;
@end

@implementation NSString

- (id)in_URLEncodedString
{
  return (id)objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault,  (CFStringRef)self,  0LL,  @"!*'();:@&=+$,/?%#[]",
                                               0x8000100u));
}

@end