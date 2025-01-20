@interface PBSUserProfile
- (UPProfileIdentity)identity;
- (void)setIdentity:(id)a3;
@end

@implementation PBSUserProfile

- (UPProfileIdentity)identity
{
  id AssociatedObject = objc_getAssociatedObject(self, off_10046B290);
  return (UPProfileIdentity *)(id)objc_claimAutoreleasedReturnValue(AssociatedObject);
}

- (void)setIdentity:(id)a3
{
}

@end