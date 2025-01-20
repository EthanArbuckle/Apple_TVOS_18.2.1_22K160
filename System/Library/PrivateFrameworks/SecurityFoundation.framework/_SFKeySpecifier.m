@interface _SFKeySpecifier
+ (BOOL)supportsSecureCoding;
+ (Class)keyClass;
- (_SFKeySpecifier)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _SFKeySpecifier

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFKeySpecifier)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFKeySpecifier;
  return -[_SFKeySpecifier init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (void).cxx_destruct
{
}

@end