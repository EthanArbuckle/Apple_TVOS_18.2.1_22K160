@interface IMDaemonVCACRequestHandler
- (void)cancelVCRequestWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 account:(id)a6;
- (void)cancelVCRequestWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 reason:(id)a6 account:(id)a7;
- (void)relay:(id)a3 sendCancel:(id)a4 toPerson:(id)a5 account:(id)a6;
- (void)relay:(id)a3 sendInitateRequest:(id)a4 toPerson:(id)a5 account:(id)a6;
- (void)relay:(id)a3 sendUpdate:(id)a4 toPerson:(id)a5 account:(id)a6;
- (void)requestVCWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 account:(id)a6;
- (void)respondToVCInvitationWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 account:(id)a6;
- (void)sendAVMessageToPerson:(id)a3 sessionID:(unsigned int)a4 type:(unsigned int)a5 userInfo:(id)a6 conference:(id)a7 account:(id)a8;
- (void)sendCounterProposalToPerson:(id)a3 properties:(id)a4 conference:(id)a5 account:(id)a6;
- (void)sendVCUpdate:(id)a3 toPerson:(id)a4 conference:(id)a5 account:(id)a6;
@end

@implementation IMDaemonVCACRequestHandler

- (void)relay:(id)a3 sendInitateRequest:(id)a4 toPerson:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionForAccount:v12]);

  if (v14) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v28,  0xCu);
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountForAccountID:v12]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 service]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 internalName]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:v23]);

  if (v14)
  {
LABEL_7:
    [v14 relay:v9 sendInitateRequest:v10 toPerson:v11];
  }

  else if (IMOSLoggingEnabled(v24, v25))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)relay:(id)a3 sendUpdate:(id)a4 toPerson:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionForAccount:v12]);

  if (v14) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v28,  0xCu);
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountForAccountID:v12]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 service]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 internalName]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:v23]);

  if (v14)
  {
LABEL_7:
    [v14 relay:v9 sendUpdate:v10 toPerson:v11];
  }

  else if (IMOSLoggingEnabled(v24, v25))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)relay:(id)a3 sendCancel:(id)a4 toPerson:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionForAccount:v12]);

  if (v14) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v28,  0xCu);
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountForAccountID:v12]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 service]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 internalName]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:v23]);

  if (v14)
  {
LABEL_7:
    [v14 relay:v9 sendCancel:v10 toPerson:v11];
  }

  else if (IMOSLoggingEnabled(v24, v25))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)requestVCWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionForAccount:v12]);

  if (v14) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v28,  0xCu);
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountForAccountID:v12]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 service]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 internalName]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:v23]);

  if (v14)
  {
LABEL_7:
    [v14 requestVCWithPerson:v9 properties:v10 conference:v11];
  }

  else if (IMOSLoggingEnabled(v24, v25))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)respondToVCInvitationWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionForAccount:v12]);

  if (v14) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v28,  0xCu);
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountForAccountID:v12]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 service]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 internalName]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:v23]);

  if (v14)
  {
LABEL_7:
    [v14 respondToVCInvitationWithPerson:v9 properties:v10 conference:v11];
  }

  else if (IMOSLoggingEnabled(v24, v25))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)cancelVCRequestWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 account:(id)a6
{
}

- (void)cancelVCRequestWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 reason:(id)a6 account:(id)a7
{
  id v30 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sessionForAccount:v14]);

  if (v16) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("Warning");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 accountForAccountID:v14]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 service]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 internalName]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v21 anySessionForServiceName:v25]);

  if (v16)
  {
LABEL_7:
    [v16 cancelVCRequestWithPerson:v30 properties:v11 conference:v12 reason:v13];
  }

  else if (IMOSLoggingEnabled(v26, v27))
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory("Warning");
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

- (void)sendCounterProposalToPerson:(id)a3 properties:(id)a4 conference:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionForAccount:v12]);

  if (v14) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v28,  0xCu);
    }
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountForAccountID:v12]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 service]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 internalName]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:v23]);

  if (v14)
  {
LABEL_7:
    [v14 sendCounterProposalToPerson:v9 properties:v10 conference:v11];
  }

  else if (IMOSLoggingEnabled(v24, v25))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)sendVCUpdate:(id)a3 toPerson:(id)a4 conference:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 sessionForAccount:v12]);

  if (v14) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v28,  0xCu);
    }
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountForAccountID:v12]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 service]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 internalName]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:v23]);

  if (v14)
  {
LABEL_7:
    [v14 sendVCUpdate:v9 toPerson:v10 conference:v11];
  }

  else if (IMOSLoggingEnabled(v24, v25))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)sendAVMessageToPerson:(id)a3 sessionID:(unsigned int)a4 type:(unsigned int)a5 userInfo:(id)a6 conference:(id)a7 account:(id)a8
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sessionForAccount:v14]);

  if (v16) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("Warning");
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 accountForAccountID:v14]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 service]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 internalName]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v21 anySessionForServiceName:v25]);

  if (v16)
  {
LABEL_7:
    [v16 sendAVMessageToPerson:v11 sessionID:a4 type:a5 userInfo:v12 conference:v13];
  }

  else if (IMOSLoggingEnabled(v26, v27))
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory("Warning");
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

@end