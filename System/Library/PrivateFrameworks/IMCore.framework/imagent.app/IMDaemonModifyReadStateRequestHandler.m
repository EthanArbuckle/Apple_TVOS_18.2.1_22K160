@interface IMDaemonModifyReadStateRequestHandler
- (void)silenceChat:(id)a3 untilDate:(id)a4;
@end

@implementation IMDaemonModifyReadStateRequestHandler

- (void)silenceChat:(id)a3 untilDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 existingChatWithGUID:v5]);

  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Chat");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412802;
      id v20 = v5;
      __int16 v21 = 2112;
      v22 = v8;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Chat Identifier: %@  Chat: %@  Update silence date: %@",  (uint8_t *)&v19,  0x20u);
    }
  }

  if (v8)
  {
    if (v6)
    {
      [v6 timeIntervalSince1970];
      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    }

    else
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }

    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v13,  @"CKChatUnmuteTime"));

    [v8 updateProperties:v15];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "broadcasterForChatListenersUsingBlackholeRegistry:",  objc_msgSend(v8, "isBlackholed")));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 properties]);
    [v17 chat:v5 propertiesUpdated:v18];
  }
}

@end