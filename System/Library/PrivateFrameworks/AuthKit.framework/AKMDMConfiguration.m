@interface AKMDMConfiguration
+ (id)getOrganizationToken;
+ (unint64_t)getManagementState;
@end

@implementation AKMDMConfiguration

+ (unint64_t)getManagementState
{
  return 0LL;
}

+ (id)getOrganizationToken
{
  return 0LL;
}

@end