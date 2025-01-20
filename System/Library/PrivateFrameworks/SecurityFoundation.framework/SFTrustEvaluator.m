@interface SFTrustEvaluator
+ (BOOL)supportsSecureCoding;
- (BOOL)allowCertificateFetching;
- (BOOL)trustSystemAnchorCertificates;
- (NSArray)applicationAnchorCertificates;
- (SFRevocationPolicy)revocationPolicy;
- (SFTrustEvaluator)init;
- (SFTrustEvaluator)initWithCoder:(id)a3;
- (SFTrustEvaluator)initWithTrustPolicy:(id)a3;
- (SFTrustEvaluator)initWithTrustPolicy:(id)a3 revocationPolicy:(id)a4;
- (SFTrustEvaluator)initWithTrustPolicy:(id)a3 revocationPolicy:(id)a4 applicationAnchorCertificates:(id)a5 allowCertificateFetching:(BOOL)a6 trustSystemAnchorCertificates:(BOOL)a7;
- (SFTrustPolicy)trustPolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowCertificateFetching:(BOOL)a3;
- (void)setApplicationAnchorCertificates:(id)a3;
- (void)setRevocationPolicy:(id)a3;
- (void)setTrustPolicy:(id)a3;
- (void)setTrustSystemAnchorCertificates:(BOOL)a3;
@end

@implementation SFTrustEvaluator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFTrustEvaluator)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___SFX509TrustPolicy);
  v4 = -[SFTrustEvaluator initWithTrustPolicy:](self, "initWithTrustPolicy:", v3);

  return v4;
}

- (SFTrustEvaluator)initWithTrustPolicy:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___SFRevocationPolicy);
  v6 = -[SFTrustEvaluator initWithTrustPolicy:revocationPolicy:](self, "initWithTrustPolicy:revocationPolicy:", v4, v5);

  return v6;
}

- (SFTrustEvaluator)initWithTrustPolicy:(id)a3 revocationPolicy:(id)a4
{
  return -[SFTrustEvaluator initWithTrustPolicy:revocationPolicy:applicationAnchorCertificates:allowCertificateFetching:trustSystemAnchorCertificates:]( self,  "initWithTrustPolicy:revocationPolicy:applicationAnchorCertificates:allowCertificateFetching:trustSystemAnchorCertificates:",  a3,  a4,  MEMORY[0x189604A58],  1LL,  1LL);
}

- (SFTrustEvaluator)initWithTrustPolicy:(id)a3 revocationPolicy:(id)a4 applicationAnchorCertificates:(id)a5 allowCertificateFetching:(BOOL)a6 trustSystemAnchorCertificates:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SFTrustEvaluator;
  v16 = -[SFTrustEvaluator init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)v16->_trustEvaluatorInternal + 1, a3);
    objc_storeStrong((id *)v17->_trustEvaluatorInternal + 2, a4);
    objc_storeStrong((id *)v17->_trustEvaluatorInternal + 3, a5);
    *((_BYTE *)v17->_trustEvaluatorInternal + 32) = *((_BYTE *)v17->_trustEvaluatorInternal + 32) & 0xFE | a6;
    if (v7) {
      char v18 = 2;
    }
    else {
      char v18 = 0;
    }
    *((_BYTE *)v17->_trustEvaluatorInternal + 32) = *((_BYTE *)v17->_trustEvaluatorInternal + 32) & 0xFD | v18;
  }

  return v17;
}

- (SFTrustEvaluator)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFTrustEvaluator;
  return -[SFTrustEvaluator init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  trustEvaluatorInternal = self->_trustEvaluatorInternal;
  return (id)[v4 initWithTrustPolicy:trustEvaluatorInternal[1] revocationPolicy:trustEvaluatorInternal[2] applicationAnchorCertificates:trustEvaluatorInternal[3] allowCertificateFetching:trustEvaluatorInternal[4] & 1 trustSystemAn chorCertificates:(*((unsigned __int8 *)trustEvaluatorInternal + 32) >> 1) & 1];
}

- (SFTrustPolicy)trustPolicy
{
  return self->_trustPolicy;
}

- (void)setTrustPolicy:(id)a3
{
}

- (SFRevocationPolicy)revocationPolicy
{
  return self->_revocationPolicy;
}

- (void)setRevocationPolicy:(id)a3
{
}

- (NSArray)applicationAnchorCertificates
{
  return self->_applicationAnchorCertificates;
}

- (void)setApplicationAnchorCertificates:(id)a3
{
}

- (BOOL)allowCertificateFetching
{
  return self->_allowCertificateFetching;
}

- (void)setAllowCertificateFetching:(BOOL)a3
{
  self->_allowCertificateFetching = a3;
}

- (BOOL)trustSystemAnchorCertificates
{
  return self->_trustSystemAnchorCertificates;
}

- (void)setTrustSystemAnchorCertificates:(BOOL)a3
{
  self->_trustSystemAnchorCertificates = a3;
}

- (void).cxx_destruct
{
}

@end