@interface CNGenericAccountCreateSyncDataStoreDeleteLocalDataActionHandler
- (BOOL)perform;
@end

@implementation CNGenericAccountCreateSyncDataStoreDeleteLocalDataActionHandler

- (BOOL)perform
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler implementation](self, "implementation"));
  unsigned int v4 = [v3 emptyLocalContainer];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler childAccounts](self, "childAccounts"));
  unsigned int v7 = v4 & -[CNDataclassActionHandler createContactsAccountForACAccount:withChildren:]( self,  "createContactsAccountForACAccount:withChildren:",  v5,  v6);

  if (v7 == 1)
  {
    id v8 = objc_msgSend((id)objc_opt_class(self), "os_log");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountType]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 description]);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 username]);
      int v17 = 138412546;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v14;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Created a Contacts container for account %@ (%@) and now disabling the Contacts local container.",  (uint8_t *)&v17,  0x16u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
    -[CNDataclassActionHandler disableLocalSourceIfNeededAddingAccount:]( self,  "disableLocalSourceIfNeededAddingAccount:",  v15);
  }

  return v7;
}

@end