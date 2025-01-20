@interface SFMessageAuthenticationCodeOperation
+ (BOOL)supportsSecureCoding;
+ (id)_defaultMacOperation;
- (SFMessageAuthenticationCodeOperation)init;
- (SFMessageAuthenticationCodeOperation)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5;
@end

@implementation SFMessageAuthenticationCodeOperation

+ (id)_defaultMacOperation
{
  return objc_alloc_init((Class)a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMessageAuthenticationCodeOperation)init
{
  return 0LL;
}

- (SFMessageAuthenticationCodeOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFMessageAuthenticationCodeOperation;
  return -[SFMessageAuthenticationCodeOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (void).cxx_destruct
{
}

@end