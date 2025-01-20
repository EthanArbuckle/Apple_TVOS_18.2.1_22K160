@interface CNAppleAccountCreateSyncDataStoreActionHandler
- (BOOL)perform;
@end

@implementation CNAppleAccountCreateSyncDataStoreActionHandler

- (BOOL)perform
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler childAccounts](self, "childAccounts"));
  BOOL v5 = -[CNDataclassActionHandler createContactsAccountForACAccount:withChildren:]( self,  "createContactsAccountForACAccount:withChildren:",  v3,  v4);

  if (v5)
  {
    id v6 = objc_msgSend((id)objc_opt_class(self), "os_log");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accountType]);
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
      int v13 = 138412290;
      v14 = v10;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "Created a Contacts account for iCloud account %@ and now disabling the AB local source",  (uint8_t *)&v13,  0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
    -[CNDataclassActionHandler disableLocalSourceIfNeededAddingAccount:]( self,  "disableLocalSourceIfNeededAddingAccount:",  v11);
  }

  return v5;
}

@end