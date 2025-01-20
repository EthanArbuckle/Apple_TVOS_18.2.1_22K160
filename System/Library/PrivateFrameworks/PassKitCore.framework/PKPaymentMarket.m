@interface PKPaymentMarket
- (id)closedLoopExpressCredentialTypes;
- (id)openLoopExpressCredentialTypes;
@end

@implementation PKPaymentMarket

- (id)openLoopExpressCredentialTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentMarket expressCredentialTypes](self, "expressCredentialTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectsPassingTest:&stru_100654F78]);

  return v3;
}

- (id)closedLoopExpressCredentialTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PKPaymentMarket expressCredentialTypes](self, "expressCredentialTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectsPassingTest:&stru_100654F98]);

  return v3;
}

@end