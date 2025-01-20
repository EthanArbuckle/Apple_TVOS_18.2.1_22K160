@interface NSFileSecurity
+ (BOOL)supportsSecureCoding;
+ (NSFileSecurity)allocWithZone:(_NSZone *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_cfTypeID;
@end

@implementation NSFileSecurity

- (unint64_t)_cfTypeID
{
  return 64LL;
}

+ (NSFileSecurity)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSFileSecurity == a1) {
    return (NSFileSecurity *)+[__NSPlaceholderFileSecurity immutablePlaceholder]( &OBJC_CLASS_____NSPlaceholderFileSecurity,  "immutablePlaceholder",  a3);
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSFileSecurity;
  return (NSFileSecurity *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end