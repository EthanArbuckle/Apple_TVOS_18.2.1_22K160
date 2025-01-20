@interface SFX509TrustPolicy
+ (BOOL)supportsSecureCoding;
- (SFX509TrustPolicy)init;
- (SFX509TrustPolicy)initWithCoder:(id)a3;
@end

@implementation SFX509TrustPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFX509TrustPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SFX509TrustPolicy;
  return -[SFX509TrustPolicy init](&v3, sel_init);
}

- (SFX509TrustPolicy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFX509TrustPolicy;
  return -[SFX509TrustPolicy init](&v4, sel_init, a3);
}

- (void).cxx_destruct
{
}

@end