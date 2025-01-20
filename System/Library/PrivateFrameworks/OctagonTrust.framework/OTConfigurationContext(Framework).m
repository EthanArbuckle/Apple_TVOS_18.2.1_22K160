@interface OTConfigurationContext(Framework)
- (id)escrowAuth;
- (void)setEscrowAuth:()Framework;
@end

@implementation OTConfigurationContext(Framework)

- (void)setEscrowAuth:()Framework
{
}

- (id)escrowAuth
{
  return objc_getAssociatedObject(a1, @"kOTEscrowAuthKey");
}

@end