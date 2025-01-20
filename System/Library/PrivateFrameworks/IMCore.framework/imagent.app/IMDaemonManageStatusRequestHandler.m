@interface IMDaemonManageStatusRequestHandler
- (void)autoLoginAccount:(id)a3;
- (void)autoLoginActiveAccountsIfNecessary;
- (void)autoReconnectAccount:(id)a3;
- (void)loginAccount:(id)a3;
- (void)loginAllAccounts;
- (void)logoutAccount:(id)a3;
- (void)logoutAllAccounts;
@end

@implementation IMDaemonManageStatusRequestHandler

- (void)autoLoginActiveAccountsIfNecessary
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("Daemon");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Request to auto log in all accounts", v6, 2u);
    }
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeSessions]);
  [v5 makeObjectsPerformSelector:"autoLogin"];
}

- (void)loginAllAccounts
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("Daemon");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Request to log in all accounts", v6, 2u);
    }
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeSessions]);
  [v5 makeObjectsPerformSelector:"login"];
}

- (void)logoutAllAccounts
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("Daemon");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Request to log out all accounts", v6, 2u);
    }
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeSessions]);
  [v5 makeObjectsPerformSelector:"logout"];
}

- (void)autoLoginAccount:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 autoLogin];
  }

  else if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)autoReconnectAccount:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 autoReconnect];
  }

  else if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)loginAccount:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 login];
  }

  else if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)logoutAccount:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 logout];
  }

  else if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

@end