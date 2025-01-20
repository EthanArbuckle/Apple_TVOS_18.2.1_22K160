@interface IMDaemonBuddyListRequestHandler
- (void)acceptSubscriptionRequest:(BOOL)a3 from:(id)a4 account:(id)a5;
- (void)changeGroup:(id)a3 changes:(id)a4 account:(id)a5;
- (void)changeGroups:(id)a3 account:(id)a4;
- (void)renameGroup:(id)a3 to:(id)a4 account:(id)a5;
- (void)requestSubscriptionTo:(id)a3 account:(id)a4;
@end

@implementation IMDaemonBuddyListRequestHandler

- (void)changeGroups:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Warning");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 changeGroups:v5];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

- (void)changeGroup:(id)a3 changes:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sessionForAccount:v9]);

  if (v11) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Warning");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      id v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v25,  0xCu);
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 accountForAccountID:v9]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 service]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 internalName]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v16 anySessionForServiceName:v20]);

  if (v11)
  {
LABEL_7:
    [v11 changeGroup:v7 changes:v8];
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

- (void)renameGroup:(id)a3 to:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sessionForAccount:v9]);

  if (v11) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Warning");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      id v26 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v25,  0xCu);
    }
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 accountForAccountID:v9]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 service]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 internalName]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v16 anySessionForServiceName:v20]);

  if (v11)
  {
LABEL_7:
    [v11 renameGroup:v7 to:v8];
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

- (void)acceptSubscriptionRequest:(BOOL)a3 from:(id)a4 account:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionForAccount:v8]);

  if (v10) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v11, v12))
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v24,  0xCu);
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountForAccountID:v8]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 service]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 internalName]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v15 anySessionForServiceName:v19]);

  if (v10)
  {
LABEL_7:
    [v10 acceptSubscriptionRequest:v6 from:v7];
  }

  else if (IMOSLoggingEnabled(v20, v21))
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v24,  0xCu);
    }
  }
}

- (void)requestSubscriptionTo:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sessionForAccount:v6]);

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
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 requestSubscriptionTo:v5];
  }

  else if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v22,  0xCu);
    }
  }
}

@end