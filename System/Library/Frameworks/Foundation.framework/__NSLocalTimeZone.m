@interface __NSLocalTimeZone
+ (BOOL)supportsSecureCoding;
- (Class)classForCoder;
- (__NSLocalTimeZone)initWithCoder:(id)a3;
@end

@implementation __NSLocalTimeZone

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__NSLocalTimeZone)initWithCoder:(id)a3
{
  char v4 = [a3 allowsKeyedCoding];

  if ((v4 & 1) == 0)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSTimeZone cannot be decoded by non-keyed archivers" userInfo:0]);
    JUMPOUT(0x18362D428LL);
  }

  return (__NSLocalTimeZone *)(id)[MEMORY[0x189604020] localTimeZone];
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

@end