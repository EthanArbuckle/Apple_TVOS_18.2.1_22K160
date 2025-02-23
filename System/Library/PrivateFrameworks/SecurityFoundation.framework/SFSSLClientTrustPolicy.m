@interface SFSSLClientTrustPolicy
+ (BOOL)supportsSecureCoding;
- (NSString)clientName;
- (SFSSLClientTrustPolicy)initWithClientName:(id)a3;
- (SFSSLClientTrustPolicy)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setClientName:(id)a3;
@end

@implementation SFSSLClientTrustPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSSLClientTrustPolicy)initWithClientName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SFSSLClientTrustPolicy;
  v5 = -[SFSSLClientTrustPolicy init](&v10, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sslClientTrustPolicyInternal = v5->_sslClientTrustPolicyInternal;
    v8 = (void *)sslClientTrustPolicyInternal[1];
    sslClientTrustPolicyInternal[1] = v6;
  }

  return v5;
}

- (SFSSLClientTrustPolicy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFSSLClientTrustPolicy;
  return -[SFSSLClientTrustPolicy init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SFSSLClientTrustPolicy;
  id v4 = -[SFTrustPolicy copyWithZone:](&v6, sel_copyWithZone_, a3);
  [v4 setClientName:*((void *)self->_sslClientTrustPolicyInternal + 1)];
  return v4;
}

- (NSString)clientName
{
  return (NSString *)(id)[*((id *)self->_sslClientTrustPolicyInternal + 1) copy];
}

- (void)setClientName:(id)a3
{
  uint64_t v4 = [a3 copy];
  sslClientTrustPolicyInternal = self->_sslClientTrustPolicyInternal;
  objc_super v6 = (void *)sslClientTrustPolicyInternal[1];
  sslClientTrustPolicyInternal[1] = v4;
}

- (void).cxx_destruct
{
}

@end