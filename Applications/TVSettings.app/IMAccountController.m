@interface IMAccountController
- (NSArray)tvs_faceTimeAccounts;
@end

@implementation IMAccountController

- (NSArray)tvs_faceTimeAccounts
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMServiceImpl tvs_faceTimeService](&OBJC_CLASS___IMServiceImpl, "tvs_faceTimeService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMAccountController accountsForService:](self, "accountsForService:", v3));
  id v5 = [v4 copy];

  return (NSArray *)v5;
}

@end