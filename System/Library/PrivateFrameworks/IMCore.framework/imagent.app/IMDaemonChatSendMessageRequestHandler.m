@interface IMDaemonChatSendMessageRequestHandler
- (void)_requestGroupPhotoResendForChatGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5;
- (void)cancelScheduledMessageWithGUID:(id)a3;
- (void)cancelScheduledMessageWithGUID:(id)a3 destination:(id)a4;
- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5;
- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8;
- (void)joinChatID:(id)a3 handleInfo:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 joinProperties:(id)a10 account:(id)a11;
- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10;
- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9;
- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 retractingPartIndexes:(id)a5 toChatIdentifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8;
- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendJunkReportMessage:(id)a3 account:(id)a4;
- (void)sendLazuliSpamReport:(id)a3 isBot:(BOOL)a4 spamType:(unint64_t)a5 account:(id)a6;
- (void)sendMappingPacket:(id)a3 toHandle:(id)a4 account:(id)a5;
- (void)sendMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6;
@end

@implementation IMDaemonChatSendMessageRequestHandler

- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  unsigned int v31 = a7;
  id v32 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sessionForAccount:v15]);

  if (v17) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 accountForAccountID:v15]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 service]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 internalName]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v22 anySessionForServiceName:v26]);

  if (v17)
  {
LABEL_7:
    [v17 invitePersonInfo:v32 withMessage:v12 toChatID:v13 identifier:v14 style:v31];
  }

  else if (IMOSLoggingEnabled(v27, v28))
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory("Warning");
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  unsigned int v29 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionForAccount:v13]);

  if (v15) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v16, v17))
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 accountForAccountID:v13]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 service]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 internalName]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v20 anySessionForServiceName:v24]);

  if (v15)
  {
LABEL_7:
    [v15 sendGroupPhotoUpdate:v10 toChatID:v11 identifier:v12 style:v29 account:v13];
  }

  else if (IMOSLoggingEnabled(v25, v26))
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

- (void)_requestGroupPhotoResendForChatGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5
{
  id v40 = a3;
  id v41 = a4;
  id v42 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDServiceController sharedController](&OBJC_CLASS___IMDServiceController, "sharedController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceWithName:IMServiceNameiMessage]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accountsForService:v8]);

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v44;
LABEL_3:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v44 != v13) {
        objc_enumerationMutation(v11);
      }
      id v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
      if (v12 == (id)++v14)
      {
        id v12 = [v11 countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v18 = v15;

    if (!v18) {
      goto LABEL_18;
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 accountID]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 sessionForAccount:v20]);

    if (v21) {
      goto LABEL_17;
    }
    if (IMOSLoggingEnabled(v22, v23))
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v18 accountID]);
        *(_DWORD *)buf = 138412290;
        v48 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
      }
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v18 accountID]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v28 accountForAccountID:v29]);
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 service]);
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 internalName]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v27 anySessionForServiceName:v32]);

    if (v21)
    {
LABEL_17:
      [v21 _requestGroupPhotoResendForChatGUID:v40 fromIdentifier:v41 toIdentifier:v42];
    }

    else
    {
      if (IMOSLoggingEnabled(v33, v34))
      {
        uint64_t v37 = OSLogHandleForIMFoundationCategory("Warning");
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v18 accountID]);
          *(_DWORD *)buf = 138412290;
          v48 = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
        }
      }
    }
  }

  else
  {
LABEL_9:

LABEL_18:
    if (IMOSLoggingEnabled(v16, v17))
    {
      uint64_t v35 = OSLogHandleForIMFoundationCategory("Warning");
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "Couldn't find an account to send _requestGroupPhotoResendForChatGUID message.",  buf,  2u);
      }
    }
  }
}

- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  unsigned int v29 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionForAccount:v13]);

  if (v15) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v16, v17))
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 accountForAccountID:v13]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 service]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 internalName]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v20 anySessionForServiceName:v24]);

  if (v15)
  {
LABEL_7:
    [v15 retryGroupPhotoUpload:v10 toChatID:v11 identifier:v12 style:v29 account:v13 isPhotoRefresh:0];
  }

  else if (IMOSLoggingEnabled(v25, v26))
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  unsigned int v29 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionForAccount:v13]);

  if (v15) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v16, v17))
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 accountForAccountID:v13]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 service]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 internalName]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v20 anySessionForServiceName:v24]);

  if (v15)
  {
LABEL_7:
    [v15 removePersonInfo:v10 chatID:v11 identifier:v12 style:v29];
  }

  else if (IMOSLoggingEnabled(v25, v26))
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

- (void)joinChatID:(id)a3 handleInfo:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 joinProperties:(id)a10 account:(id)a11
{
  unsigned int v34 = a6;
  id v35 = a3;
  id v36 = a4;
  id v37 = a5;
  id v38 = a7;
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  id v18 = a11;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 sessionForAccount:v18]);

  if (v20) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v21, v22))
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 accountForAccountID:v18]);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 service]);
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 internalName]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v25 anySessionForServiceName:v29]);

  if (v20)
  {
LABEL_7:
    [v20 joinChatID:v35 handleInfo:v36 identifier:v37 style:v34 groupID:v38 lastAddressedHandle:v15 lastAddressedSIMID:v16 joinProperties:v17];
  }

  else if (IMOSLoggingEnabled(v30, v31))
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

- (void)sendMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  unsigned int v30 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionForAccount:v13]);

  if (v15) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v16, v17))
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 accountForAccountID:v13]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 service]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 internalName]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v20 anySessionForServiceName:v24]);

  if (v15)
  {
LABEL_7:
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKSyncController sharedInstance](&OBJC_CLASS___IMDCKSyncController, "sharedInstance"));
    [v27 recordMetricIsCloudKitEnabled];

    [v15 sendMessage:v10 toChatID:v11 identifier:v12 style:v30];
  }

  else if (IMOSLoggingEnabled(v25, v26))
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory("Warning");
    unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

- (void)sendJunkReportMessage:(id)a3 account:(id)a4
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
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v22,  0xCu);
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountForAccountID:v6]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 service]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalName]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:v17]);

  if (v8)
  {
LABEL_7:
    [v8 sendJunkReportMessage:v5];
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

- (void)sendLazuliSpamReport:(id)a3 isBot:(BOOL)a4 spamType:(unint64_t)a5 account:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sessionForAccount:v10]);

  if (v12) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v13, v14))
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v26 = 138412290;
      id v27 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v26,  0xCu);
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 accountForAccountID:v10]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 service]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 internalName]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v17 anySessionForServiceName:v21]);

  if (v12)
  {
LABEL_7:
    [v12 sendLazuliSpamReport:v9 isBot:v8 spamType:a5];
  }

  else if (IMOSLoggingEnabled(v22, v23))
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      int v26 = 138412290;
      id v27 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v26,  0xCu);
    }
  }
}

- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10
{
  unsigned int v36 = a8;
  id v37 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a9;
  id v15 = a10;
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("IMDaemon");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Received sendEditedMessage request", buf, 2u);
    }
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 sessionForAccount:v14]);

  if (v20) {
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled(v21, v22))
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  int v26 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 accountForAccountID:v14]);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 service]);
  unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 internalName]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v25 anySessionForServiceName:v29]);

  if (v20)
  {
LABEL_11:
    [v20 sendEditedMessage:v37 previousMessage:v12 partIndex:a5 editType:a6 toChatIdentifier:v13 style:v36 account:v14 backwardCompatabilityText:v15];
  }

  else if (IMOSLoggingEnabled(v30, v31))
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled(v11, v12))
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("IMDaemon");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Received sendRepositionStickerMessage request",  (uint8_t *)&v30,  2u);
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sessionForAccount:v11]);

  if (v16) {
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled(v17, v18))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v30 = 138412290;
      id v31 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v30,  0xCu);
    }
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 accountForAccountID:v11]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 service]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 internalName]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v21 anySessionForServiceName:v25]);

  if (v16)
  {
LABEL_11:
    [v16 sendRepositionStickerMessage:v9 chatIdentifier:v10 accountID:v11 style:v6];
  }

  else if (IMOSLoggingEnabled(v26, v27))
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory("Warning");
    unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      int v30 = 138412290;
      id v31 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v30,  0xCu);
    }
  }
}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Daemon");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Forwarding mapping packet", v14, 2u);
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDLocationSharingController sharedInstance]( &OBJC_CLASS___IMDLocationSharingController,  "sharedInstance"));
  [v13 _forwardMappingPacket:v7 toID:v8 account:v9];
}

- (void)cancelScheduledMessageWithGUID:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDServiceController sharedController](&OBJC_CLASS___IMDServiceController, "sharedController"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceWithName:IMServiceNameiMessage]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountsForService:v5]);

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v38;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v38 != v10) {
        objc_enumerationMutation(v8);
      }
      uint64_t v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
      if (v9 == (id)++v11)
      {
        id v9 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v13 = v12;

    if (!v13) {
      goto LABEL_18;
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 accountID]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 sessionForAccount:v15]);

    if (v16) {
      goto LABEL_17;
    }
    if (IMOSLoggingEnabled(v17, v18))
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 accountID]);
        *(_DWORD *)buf = 138412290;
        __int128 v44 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
      }
    }

    unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 accountID]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 accountForAccountID:v23]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 service]);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 internalName]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v36 anySessionForServiceName:v26]);

    if (v16)
    {
LABEL_17:
      [v16 cancelScheduledMessageWithGUID:v3];
    }

    else if (IMOSLoggingEnabled(v27, v28))
    {
      uint64_t v33 = OSLogHandleForIMFoundationCategory("Warning");
      unsigned int v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = (void *)objc_claimAutoreleasedReturnValue([v13 accountID]);
        *(_DWORD *)buf = 138412290;
        __int128 v44 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
      }
    }
  }

  else
  {
LABEL_9:

LABEL_18:
    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    id v13 = (id)objc_claimAutoreleasedReturnValue([v29 messageWithGUID:v3]);

    if (!v13 || [v13 scheduleType] != (id)2)
    {
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      id v42 = @"Failed to find an active iMessage account while trying to cancel scheduled for a given messageGUID";
      int v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
      id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IMSafetyMonitorErrorDomain,  1LL,  v30));

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[IMSafetyMonitorCoordinator sharedCoordinator]( &OBJC_CLASS___IMSafetyMonitorCoordinator,  "sharedCoordinator"));
      [v32 informOfCancelledScheduledMessageSendWithMessageGUID:v3 sentSuccessfully:0 error:v31];
    }
  }
}

- (void)cancelScheduledMessageWithGUID:(id)a3 destination:(id)a4
{
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a4));
  -[IMDaemonChatSendMessageRequestHandler cancelScheduledMessageWithGUID:destinations:cancelType:]( self,  "cancelScheduledMessageWithGUID:destinations:cancelType:",  v6,  v7,  0LL);
}

- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5
{
  id v6 = a3;
  id v41 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDServiceController sharedController](&OBJC_CLASS___IMDServiceController, "sharedController"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceWithName:IMServiceNameiMessage]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accountsForService:v8]);

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v43;
LABEL_3:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v43 != v13) {
        objc_enumerationMutation(v11);
      }
      id v15 = *(void **)(*((void *)&v42 + 1) + 8 * v14);
      if (v12 == (id)++v14)
      {
        id v12 = [v11 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    id v16 = v15;

    if (!v16) {
      goto LABEL_18;
    }
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 accountID]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 sessionForAccount:v18]);

    if (v19) {
      goto LABEL_17;
    }
    if (IMOSLoggingEnabled(v20, v21))
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v16 accountID]);
        *(_DWORD *)buf = 138412290;
        v49 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
      }
    }

    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v16 accountID]);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v25 accountForAccountID:v26]);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 service]);
    unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 internalName]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v39 anySessionForServiceName:v29]);

    if (v19)
    {
LABEL_17:
      [v19 cancelScheduledMessageWithGUID:v6 destinations:v41 cancelType:a5];
    }

    else if (IMOSLoggingEnabled(v30, v31))
    {
      uint64_t v36 = OSLogHandleForIMFoundationCategory("Warning");
      __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v16 accountID]);
        *(_DWORD *)buf = 138412290;
        v49 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
      }
    }
  }

  else
  {
LABEL_9:

LABEL_18:
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    id v16 = (id)objc_claimAutoreleasedReturnValue([v32 messageWithGUID:v6]);

    if (!v16 || [v16 scheduleType] != (id)2)
    {
      NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
      v47 = @"Failed to find an active iMessage account while trying to cancel scheduled for a given messageGUID";
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
      unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IMSafetyMonitorErrorDomain,  1LL,  v33));

      id v35 = (void *)objc_claimAutoreleasedReturnValue( +[IMSafetyMonitorCoordinator sharedCoordinator]( &OBJC_CLASS___IMSafetyMonitorCoordinator,  "sharedCoordinator"));
      [v35 informOfCancelledScheduledMessageSendWithMessageGUID:v6 sentSuccessfully:0 error:v34];
    }
  }
}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9
{
  unsigned int v35 = a8;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a9;
  if (IMOSLoggingEnabled(v14, v15))
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory("IMDaemon");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Received sendEditedScheduledMessage request",  buf,  2u);
    }
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionForAccount:v14]);

  if (v19) {
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled(v20, v21))
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 accountForAccountID:v14]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 internalName]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v24 anySessionForServiceName:v28]);

  if (v19)
  {
LABEL_11:
    [v19 sendEditedScheduledMessage:v11 previousMessage:v12 partIndex:a5 editType:a6 toChatIdentifier:v13 style:v35 account:v14];
  }

  else if (IMOSLoggingEnabled(v29, v30))
  {
    uint64_t v31 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 retractingPartIndexes:(id)a5 toChatIdentifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  unsigned int v34 = a7;
  id v35 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("IMDaemon");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Received sendEditedScheduledMessage:retractingPartIndexes: request",  buf,  2u);
    }
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 sessionForAccount:v15]);

  if (v20) {
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled(v21, v22))
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 accountForAccountID:v15]);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 service]);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 internalName]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v25 anySessionForServiceName:v29]);

  if (v20)
  {
LABEL_11:
    [v20 sendEditedScheduledMessage:v35 previousMessage:v12 retractingPartIndexes:v13 toChatIdentifier:v14 style:v34 account:v15];
  }

  else if (IMOSLoggingEnabled(v30, v31))
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

@end