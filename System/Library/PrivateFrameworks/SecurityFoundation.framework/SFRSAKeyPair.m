@interface SFRSAKeyPair
- (id)initRandomKeyPairWithSpecifier:(id)a3;
- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4;
@end

@implementation SFRSAKeyPair

- (id)initRandomKeyPairWithSpecifier:(id)a3
{
  return -[SFRSAKeyPair initRandomKeyPairWithSpecifier:privateKeyDomain:]( self,  "initRandomKeyPairWithSpecifier:privateKeyDomain:",  a3,  @"SFKeyDomainCPU");
}

- (id)initRandomKeyPairWithSpecifier:(id)a3 privateKeyDomain:(id)a4
{
  id v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = -[_SFKeyPair initWithData:specifier:error:](self, "initWithData:specifier:error:", v6, v5, 0LL);

  return v7;
}

- (void).cxx_destruct
{
}

@end