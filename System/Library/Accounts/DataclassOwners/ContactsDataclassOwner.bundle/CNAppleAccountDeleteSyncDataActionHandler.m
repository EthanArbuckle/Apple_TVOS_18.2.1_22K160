@interface CNAppleAccountDeleteSyncDataActionHandler
- (BOOL)perform;
@end

@implementation CNAppleAccountDeleteSyncDataActionHandler

- (BOOL)perform
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler childAccounts](self, "childAccounts"));
  BOOL v5 = -[CNDataclassActionHandler removeContactsAccountForACAccount:withChildren:]( self,  "removeContactsAccountForACAccount:withChildren:",  v3,  v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
  -[CNDataclassActionHandler enableLocalSourceIfNecessaryIgnoringAccount:]( self,  "enableLocalSourceIfNecessaryIgnoringAccount:",  v6);

  if (!v5)
  {
    id v7 = objc_msgSend((id)objc_opt_class(self), "os_log");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_9F60();
    }
  }

  return v5;
}

@end