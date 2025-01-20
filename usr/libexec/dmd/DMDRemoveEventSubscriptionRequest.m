@interface DMDRemoveEventSubscriptionRequest
- (CEMEventSubscriptionDeclaration)subscriptionDeclaration;
- (NSString)organizationIdentifier;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setSubscriptionDeclaration:(id)a3;
@end

@implementation DMDRemoveEventSubscriptionRequest

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (CEMEventSubscriptionDeclaration)subscriptionDeclaration
{
  return self->_subscriptionDeclaration;
}

- (void)setSubscriptionDeclaration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end