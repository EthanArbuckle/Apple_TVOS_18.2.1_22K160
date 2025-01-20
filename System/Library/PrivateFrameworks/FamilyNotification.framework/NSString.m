@interface NSString
+ (id)uniqueIdentifier;
@end

@implementation NSString

+ (id)uniqueIdentifier
{
  v2 = CFUUIDCreate(0LL);
  if (v2)
  {
    v3 = v2;
    v4 = (__CFString *)CFUUIDCreateString(0LL, v2);
    CFRelease(v3);
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

@end