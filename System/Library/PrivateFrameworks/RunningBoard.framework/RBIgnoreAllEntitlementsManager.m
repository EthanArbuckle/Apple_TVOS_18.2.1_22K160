@interface RBIgnoreAllEntitlementsManager
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)hasEntitlementDomain:(unint64_t)a3;
- (id)allEntitlements;
@end

@implementation RBIgnoreAllEntitlementsManager

- (id)allEntitlements
{
  return +[RBEntitlementManager _hardCodedEntitlements]();
}

- (BOOL)hasEntitlement:(id)a3
{
  return 1;
}

- (BOOL)hasEntitlementDomain:(unint64_t)a3
{
  return 1;
}

@end