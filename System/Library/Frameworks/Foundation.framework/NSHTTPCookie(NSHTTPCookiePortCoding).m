@interface NSHTTPCookie(NSHTTPCookiePortCoding)
- (id)replacementObjectForPortCoder:()NSHTTPCookiePortCoding;
@end

@implementation NSHTTPCookie(NSHTTPCookiePortCoding)

- (id)replacementObjectForPortCoder:()NSHTTPCookiePortCoding
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if ([a3 isByref])
  {
    v6.receiver = a1;
    v6.super_class = (Class)&off_18C68A200;
    return objc_msgSendSuper2(&v6, sel_replacementObjectForPortCoder_, a3);
  }

  return a1;
}

@end