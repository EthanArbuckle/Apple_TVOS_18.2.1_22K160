@interface CNGenericAccountCreateSyncDataStoreActionHandler
- (BOOL)perform;
@end

@implementation CNGenericAccountCreateSyncDataStoreActionHandler

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
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 username]);
      int v15 = 138412546;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "Created a Contacts container for account %@ (%@) and now disabling the Contacts local container",  (uint8_t *)&v15,  0x16u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
    -[CNDataclassActionHandler disableLocalSourceIfNeededAddingAccount:]( self,  "disableLocalSourceIfNeededAddingAccount:",  v13);
  }

  return v5;
}

@end