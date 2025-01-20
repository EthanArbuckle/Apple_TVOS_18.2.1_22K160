@interface CNGenericAccountCreateSyncDataStoreKeepLocalDataActionHandler
- (BOOL)perform;
@end

@implementation CNGenericAccountCreateSyncDataStoreKeepLocalDataActionHandler

- (BOOL)perform
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler childAccounts](v2, "childAccounts"));
  LOBYTE(v2) = -[CNDataclassActionHandler createContactsAccountForACAccount:withChildren:]( v2,  "createContactsAccountForACAccount:withChildren:",  v3,  v4);

  return (char)v2;
}

@end