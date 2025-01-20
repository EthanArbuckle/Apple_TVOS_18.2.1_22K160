@interface AKSecurityUpgradeEligibilityRequestProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
@end

@implementation AKSecurityUpgradeEligibilityRequestProvider

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_msgSend(v6, "ak_addPRKRequestHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKURLRequestProviderImpl concreteAuthenticationContext](self, "concreteAuthenticationContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 securityUpgradeContext]);
  [v6 setValue:v8 forHTTPHeaderField:AKAuthenticationSecurityUpgradeContextHeaderFieldKey];

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AKSecurityUpgradeEligibilityRequestProvider;
  LOBYTE(a4) = -[AKGrandSlamRequestProvider signRequest:error:](&v10, "signRequest:error:", v6, a4);

  return (char)a4;
}

@end