@interface CNAppleAccountMergeSyncDataIntoLocalDataActionHandler
- (BOOL)perform;
@end

@implementation CNAppleAccountMergeSyncDataIntoLocalDataActionHandler

- (BOOL)perform
{
  id v3 = objc_msgSend((id)objc_opt_class(self), "os_log");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountType]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 username]);
    int v17 = 138412546;
    v18 = v7;
    __int16 v19 = 2112;
    v20 = v9;
    _os_log_impl( &dword_0,  v4,  OS_LOG_TYPE_DEFAULT,  "Will merge from the Contacts container for iCloud account %@ (%@) to the Contacts local container, so first enable the Contacts local container",  (uint8_t *)&v17,  0x16u);
  }

  -[CNDataclassActionHandler setLocalSourceEnabled:](self, "setLocalSourceEnabled:", 1LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler account](self, "account"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CNDataclassActionHandler childAccounts](self, "childAccounts"));
  id v12 = -[CNDataclassActionHandler copyABAccountForACAccount:withChildren:]( self,  "copyABAccountForACAccount:withChildren:",  v10,  v11);

  if (!v12) {
    goto LABEL_9;
  }
  if (!-[CNDataclassActionHandler mergeContactsIntoLocalSourceFromABAccount:]( self,  "mergeContactsIntoLocalSourceFromABAccount:",  v12))
  {
    id v14 = objc_msgSend((id)objc_opt_class(self), "os_log");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_9EA0();
    }

LABEL_9:
    BOOL v13 = 0;
    goto LABEL_10;
  }

  -[CNDataclassActionHandler removeContactsAccount:](self, "removeContactsAccount:", v12);
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

@end