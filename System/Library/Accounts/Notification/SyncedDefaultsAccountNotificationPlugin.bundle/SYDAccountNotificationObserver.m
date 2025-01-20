@interface SYDAccountNotificationObserver
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation SYDAccountNotificationObserver

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  v10 = v9;
  if (v8) {
    v11 = v8;
  }
  else {
    v11 = v9;
  }
  id v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 accountType]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
  if (![v14 isEqualToString:ACAccountTypeIdentifierAppleAccount])
  {

LABEL_24:
    goto LABEL_25;
  }

  if (objc_msgSend(v12, "aa_isAccountClass:", AAAccountClassPrimary))
  {

LABEL_9:
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    uint64_t v16 = SYDGetAccountsLog();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_3544((uint64_t)v13, a4, v17);
    }

    switch(a4)
    {
      case 1:
        uint64_t v18 = SYDGetAccountsLog();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 138412290;
        id v32 = v8;
        v20 = "User signed in to account %@";
        goto LABEL_19;
      case 2:
        uint64_t v21 = kAccountDataclassKeyValue;
        unsigned int v22 = [v10 isEnabledForDataclass:kAccountDataclassKeyValue];
        unsigned int v23 = [v8 isEnabledForDataclass:v21];
        if (v22 == v23) {
          goto LABEL_24;
        }
        unsigned int v24 = v23;
        uint64_t v25 = SYDGetAccountsLog();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          id v32 = v13;
          __int16 v33 = 1024;
          unsigned int v34 = v24;
          __int16 v35 = 1024;
          unsigned int v36 = v22;
          _os_log_debug_impl( &dword_0,  v19,  OS_LOG_TYPE_DEBUG,  "Enabled state for account %@ was modified, isEnabled=%d wasEnabled=%d",  buf,  0x18u);
        }

@end