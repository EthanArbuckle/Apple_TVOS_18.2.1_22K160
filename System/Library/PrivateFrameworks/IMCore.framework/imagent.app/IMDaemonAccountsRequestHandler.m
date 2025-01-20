@interface IMDaemonAccountsRequestHandler
- (void)activateAccounts:(id)a3;
- (void)addAccount:(id)a3 defaults:(id)a4 service:(id)a5;
- (void)addAliases:(id)a3 account:(id)a4;
- (void)authenticateAccount:(id)a3;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
- (void)deactivateAccounts:(id)a3;
- (void)enrollDeviceForSMSRelay:(id)a3 account:(id)a4;
- (void)enrollSelfDeviceForSMSRelay:(id)a3;
- (void)passwordUpdatedAccount:(id)a3;
- (void)registerAccount:(id)a3;
- (void)removeAccount:(id)a3;
- (void)removeAliases:(id)a3 account:(id)a4;
- (void)setAllowList:(id)a3 account:(id)a4;
- (void)setBlockIdleStatus:(BOOL)a3 account:(id)a4;
- (void)setBlockList:(id)a3 account:(id)a4;
- (void)setBlockingMode:(unsigned int)a3 account:(id)a4;
- (void)unEnrollDeviceForSMSRelay:(id)a3 account:(id)a4;
- (void)unregisterAccount:(id)a3;
- (void)unvalidateAliases:(id)a3 account:(id)a4;
- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4 account:(id)a5;
- (void)validateAliases:(id)a3 account:(id)a4;
- (void)validateProfileAccount:(id)a3;
- (void)writeAccount:(id)a3 defaults:(id)a4;
@end

@implementation IMDaemonAccountsRequestHandler

- (void)addAccount:(id)a3 defaults:(id)a4 service:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDServiceController sharedController](&OBJC_CLASS___IMDServiceController, "sharedController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceWithName:v8]);

  if (v10)
  {
    id v11 = [v10 newAccountWithAccountDefaults:v7 accountID:v13];
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
      [v12 addAccount:v11];
    }
  }
}

- (void)removeAccount:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("Daemon");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Removing account: %@", (uint8_t *)&v10, 0xCu);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accountForAccountID:v3]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
    [v9 removeAccount:v8];
  }
}

- (void)activateAccounts:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("Daemon");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Activating accounts: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  [v7 activateAccounts:v3];
}

- (void)deactivateAccounts:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("Daemon");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Deactivating accounts: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  [v7 deactivateAccounts:v3];
}

- (void)writeAccount:(id)a3 defaults:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 accountForAccountID:v6]);

  [v7 writeAccountDefaults:v5];
}

- (void)authenticateAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 authenticateAccount:v3];
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

- (void)registerAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 registerAccount:v3];
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

- (void)unregisterAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 unregisterAccount:v3];
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

- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sessionForAccount:v9]);

  if (v11) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      id v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v25,  0xCu);
    }
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 accountForAccountID:v9]);
  int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 service]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 internalName]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v16 anySessionForServiceName:v20]);

  if (v11)
  {
LABEL_7:
    [v11 updateAuthorizationCredentials:v7 token:v8 account:v9];
  }

  else if (IMOSLoggingEnabled(v21, v22))
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory("Warning");
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      id v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v25,  0xCu);
    }
  }
}

- (void)setBlockingMode:(unsigned int)a3 account:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionForAccount:v5]);

  if (v7) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v8, v9))
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory("Warning");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v21,  0xCu);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountForAccountID:v5]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 internalName]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 anySessionForServiceName:v16]);

  if (v7)
  {
LABEL_7:
    [v7 setBlockingMode:v4];
  }

  else if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("Warning");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v21,  0xCu);
    }
  }
}

- (void)setAllowList:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 setAllowList:v5];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)setBlockList:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 setBlockList:v5];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)setBlockIdleStatus:(BOOL)a3 account:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sessionForAccount:v5]);

  if (v7) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v8, v9))
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v21,  0xCu);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountForAccountID:v5]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 service]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 internalName]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 anySessionForServiceName:v16]);

  if (v7)
  {
LABEL_7:
    [v7 setBlockIdleStatus:v4];
  }

  else if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v21,  0xCu);
    }
  }
}

- (void)passwordUpdatedAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 passwordUpdatedWithAccount:v3];
  }

  else if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)addAliases:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 addAliases:v5 account:v6];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)removeAliases:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 removeAliases:v5 account:v6];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)validateAliases:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 validateAliases:v5 account:v6];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)unvalidateAliases:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 unvalidateAliases:v5 account:v6];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)validateProfileAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 validateProfileWithAccount:v3];
  }

  else if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)enrollDeviceForSMSRelay:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 enrollDeviceInSMSRelay:v5];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)unEnrollDeviceForSMSRelay:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 unEnrollDeviceInSMSRelay:v5];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)enrollSelfDeviceForSMSRelay:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionForAccount:v3]);

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v19,  0xCu);
    }
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountForAccountID:v3]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 internalName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:v14]);

  if (v5)
  {
LABEL_7:
    [v5 enrollSelfDeviceInSMSRelay];
  }

  else if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain(a4);
  uint64_t v7 = self;
  IMDaemonAccountsRequestHandler.calculateReachability(with:responseHandler:)(v6, a4);

  swift_unknownObjectRelease(a4);
}

@end