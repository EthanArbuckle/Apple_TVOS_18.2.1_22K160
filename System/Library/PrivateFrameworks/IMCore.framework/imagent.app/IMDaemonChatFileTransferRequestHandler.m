@interface IMDaemonChatFileTransferRequestHandler
- (void)loadIsDownloadingPurgedAttachmentsForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7;
- (void)loadIsDownloadingPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7;
@end

@implementation IMDaemonChatFileTransferRequestHandler

- (void)loadIsDownloadingPurgedAttachmentsForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void (**)(id, void))a7;
  if (IMOSLoggingEnabled(v13, v14))
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory("History");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 listenerID]);
      int v27 = 138412802;
      id v28 = v18;
      __int16 v29 = 2112;
      id v30 = v11;
      __int16 v31 = 2112;
      id v32 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Request from %@ to check if downloading purged assets with chat ID: %@  service: %@",  (uint8_t *)&v27,  0x20u);
    }
  }

  id v19 = [v11 count];
  if (!v19 || (id v19 = [v12 count]) == 0)
  {
    if (IMOSLoggingEnabled(v19, v20))
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory("History");
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v27 = 138412546;
        id v28 = v11;
        __int16 v29 = 2112;
        id v30 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  " No IDs: %@ or serviceNames: %@, empty results being returned",  (uint8_t *)&v27,  0x16u);
      }
    }

    v13[2](v13, 0LL);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue( +[IMDChatUtilities _stringForChatIDs:onServices:]( &OBJC_CLASS___IMDChatUtilities,  "_stringForChatIDs:onServices:",  v11,  v12));
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatUtilities sharedUtilities](&OBJC_CLASS___IMDChatUtilities, "sharedUtilities"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 currentlyDownloadingSet]);
    id v26 = [v25 containsObject:v23];
  }

  else
  {
    id v26 = 0LL;
  }

  ((void (**)(id, id))v13)[2](v13, v26);
}

- (void)loadIsDownloadingPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7
{
  uint64_t v9 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyProxy]);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10001D39C;
  v22[3] = &unk_100065648;
  id v23 = v17;
  id v24 = v14;
  id v25 = v13;
  id v26 = v12;
  id v18 = v12;
  id v19 = v13;
  id v20 = v14;
  id v21 = v17;
  -[IMDaemonChatFileTransferRequestHandler loadIsDownloadingPurgedAttachmentsForChatWithGUID:chatIdentifiers:style:services:reply:]( self,  "loadIsDownloadingPurgedAttachmentsForChatWithGUID:chatIdentifiers:style:services:reply:",  v19,  v15,  v9,  v18,  v22);
}

@end