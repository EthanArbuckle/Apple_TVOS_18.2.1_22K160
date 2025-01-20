@interface SFSSLServerTrustPolicy
+ (BOOL)supportsSecureCoding;
- (NSString)serverName;
- (SFSSLServerTrustPolicy)initWithCoder:(id)a3;
- (SFSSLServerTrustPolicy)initWithServerName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setServerName:(id)a3;
@end

@implementation SFSSLServerTrustPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSSLServerTrustPolicy)initWithServerName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SFSSLServerTrustPolicy;
  v5 = -[SFSSLServerTrustPolicy init](&v10, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sslServerTrustPolicyInternal = v5->_sslServerTrustPolicyInternal;
    v8 = (void *)sslServerTrustPolicyInternal[1];
    sslServerTrustPolicyInternal[1] = v6;
  }

  return v5;
}

- (SFSSLServerTrustPolicy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFSSLServerTrustPolicy;
  return -[SFSSLServerTrustPolicy init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SFSSLServerTrustPolicy;
  id v4 = -[SFTrustPolicy copyWithZone:](&v6, sel_copyWithZone_, a3);
  [v4 setServerName:*((void *)self->_sslServerTrustPolicyInternal + 1)];
  return v4;
}

- (NSString)serverName
{
  return (NSString *)(id)[*((id *)self->_sslServerTrustPolicyInternal + 1) copy];
}

- (void)setServerName:(id)a3
{
  uint64_t v4 = [a3 copy];
  sslServerTrustPolicyInternal = self->_sslServerTrustPolicyInternal;
  objc_super v6 = (void *)sslServerTrustPolicyInternal[1];
  sslServerTrustPolicyInternal[1] = v4;
}

- (void).cxx_destruct
{
}

@end