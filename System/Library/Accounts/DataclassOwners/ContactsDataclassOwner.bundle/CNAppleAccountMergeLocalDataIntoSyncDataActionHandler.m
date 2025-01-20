@interface CNAppleAccountMergeLocalDataIntoSyncDataActionHandler
- (BOOL)perform;
@end

@implementation CNAppleAccountMergeLocalDataIntoSyncDataActionHandler

- (BOOL)perform
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler childAccounts](self, "childAccounts"));
  BOOL v5 = -[CNDataclassActionHandler createContactsAccountForACAccount:withChildren:]( self,  "createContactsAccountForACAccount:withChildren:",  v3,  v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler childAccounts](self, "childAccounts"));
    v8 = -[CNDataclassActionHandler copyDefaultAddressBookSourceForAccount:withChildren:createIfNecessary:]( self,  "copyDefaultAddressBookSourceForAccount:withChildren:createIfNecessary:",  v6,  v7,  1LL);

    if (v8)
    {
      -[CNDataclassActionHandler mergeContactsFromLocalSourceIntoSource:]( self,  "mergeContactsFromLocalSourceIntoSource:",  v8);
      id v9 = objc_msgSend((id)objc_opt_class(self), "os_log");
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountType]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 username]);
        int v19 = 138412546;
        v20 = v13;
        __int16 v21 = 2112;
        v22 = v15;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "Merged Contacts local container to the Contacts container for iCloud account %@ (%@) and now disabling the AB local source",  (uint8_t *)&v19,  0x16u);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
      -[CNDataclassActionHandler disableLocalSourceIfNeededAddingAccount:]( self,  "disableLocalSourceIfNeededAddingAccount:",  v16);
    }
  }

  else
  {
    id v17 = objc_msgSend((id)objc_opt_class(self), "os_log");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_9DE0();
    }
  }

  return v5;
}

@end