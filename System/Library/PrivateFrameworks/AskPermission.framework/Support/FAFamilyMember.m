@interface FAFamilyMember
- (BOOL)isTeenAccount;
@end

@implementation FAFamilyMember

- (BOOL)isTeenAccount
{
  return -[FAFamilyMember memberType](self, "memberType") == (id)1;
}

@end