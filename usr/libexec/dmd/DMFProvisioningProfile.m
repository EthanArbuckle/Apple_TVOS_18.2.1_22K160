@interface DMFProvisioningProfile
- (id)initWithProfileRef:(void *)a3;
@end

@implementation DMFProvisioningProfile

- (id)initWithProfileRef:(void *)a3
{
  uint64_t UUID = MISProvisioningProfileGetUUID(a3, a2);
  uint64_t Name = MISProvisioningProfileGetName(a3);
  uint64_t ExpirationDate = MISProvisioningProfileGetExpirationDate(a3);
  return -[DMFProvisioningProfile initWithUUID:name:expirationDate:]( self,  "initWithUUID:name:expirationDate:",  UUID,  Name,  ExpirationDate);
}

@end