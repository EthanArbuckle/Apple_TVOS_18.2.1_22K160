@interface IMDaemonChatMessageHistoryRequestHandler
- (id)_serializedFileTransfersForItems:(id)a3;
- (void)_populateParentMessagesIfNeeded:(id)a3;
- (void)_updateLastMessageTimeStampForChat:(id)a3;
- (void)cleanupAttachments;
- (void)clearHistoryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 beforeGUID:(id)a6 afterGUID:(id)a7 chatID:(id)a8 queryID:(id)a9;
- (void)deleteMessageWithGUIDs:(id)a3 queryID:(id)a4;
- (void)fetchEarliestMessageDateForChatsWithGUIDs:(id)a3 completion:(id)a4;
- (void)fetchIncomingPendingMessagesOverSatelliteForChatsWithIDs:(id)a3 services:(id)a4;
- (void)fetchMessageHistorySummaryForDateInterval:(id)a3 chatIdentifiers:(id)a4 chatStyle:(unsigned __int8)a5 services:(id)a6 reply:(id)a7;
- (void)fetchOldestMessageDateForChatIdentifiers:(id)a3 chatStyle:(unsigned __int8)a4 services:(id)a5 reply:(id)a6;
- (void)loadAttachmentsForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7;
- (void)loadAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7;
- (void)loadFrequentRepliesForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 reply:(id)a8;
- (void)loadFrequentRepliesForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 chatID:(id)a7 queryID:(id)a8;
- (void)loadHistoryForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 beforeGUID:(id)a8 afterGUID:(id)a9 threadIdentifier:(id)a10 reply:(id)a11;
- (void)loadHistoryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 beforeGUID:(id)a7 afterGUID:(id)a8 threadIdentifier:(id)a9 chatID:(id)a10 queryID:(id)a11;
- (void)loadItemWithGUID:(id)a3 queryID:(id)a4;
- (void)loadMessageItemWithGUID:(id)a3 queryID:(id)a4;
- (void)loadMessageWithGUID:(id)a3 queryID:(id)a4;
- (void)loadPagedHistoryAroundMessageWithGUID:(id)a3 chatGUID:(id)a4 chatIdentifiers:(id)a5 style:(unsigned __int8)a6 services:(id)a7 numberOfMessagesBefore:(int64_t)a8 numberOfMessagesAfter:(int64_t)a9 threadIdentifier:(id)a10 reply:(id)a11;
- (void)loadPagedHistoryForGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 onServices:(id)a6 numberOfMessagesBefore:(int64_t)a7 numberOfMessagesAfter:(int64_t)a8 threadIdentifier:(id)a9 chatID:(id)a10 queryID:(id)a11;
- (void)loadRecoverableMessagesMetadataWithQueryID:(id)a3;
- (void)loadUncachedAttachmentCountForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7;
- (void)loadUncachedAttachmentCountForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7;
- (void)loadUnreadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 fallbackGUID:(id)a7 chatId:(id)a8 queryID:(id)a9;
- (void)loadUnreadHistoryForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 fallbackMessageGUID:(id)a8 reply:(id)a9;
- (void)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8;
- (void)markChatAsSpamWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 isAutoReport:(BOOL)a7 isJunkReportedToCarrier:(BOOL)a8 reply:(id)a9;
- (void)markChatAsSpamWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 isAutoReport:(BOOL)a7 isJunkReportedToCarrier:(BOOL)a8 reportReason:(unint64_t)a9 reply:(id)a10;
- (void)moveMessagesInChatsWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 queryID:(id)a5;
- (void)moveMessagesWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 queryID:(id)a5;
- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 queryID:(id)a4;
- (void)purgeAttachmentsForChatGUID:(id)a3;
- (void)recoverMessagesWithChatGUIDs:(id)a3 queryID:(id)a4;
- (void)retractNotificationsForReadMessagesWithGUIDs:(id)a3;
- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3;
- (void)updatePluginMessageWithGUID:(id)a3 newPayloadData:(id)a4 completion:(id)a5;
- (void)updateUnformattedID:(id)a3 forBuddyID:(id)a4 onService:(id)a5;
- (void)upgradeCompleteMyMomentLinkToStackWithMessageGUID:(id)a3 chatGUID:(id)a4;
@end

@implementation IMDaemonChatMessageHistoryRequestHandler

- (void)loadMessageWithGUID:(id)a3 queryID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("History");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 listenerID]);
      int v29 = 138412546;
      v30 = v11;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Request from %@ to load message with guid: %@",  (uint8_t *)&v29,  0x16u);
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 messageWithGUID:v5]);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 chatForMessageGUID:v5]);

  uint64_t v18 = IMOSLoggingEnabled(v16, v17);
  if ((_DWORD)v18)
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("History");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412290;
      v30 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "   Resulting message: %@",  (uint8_t *)&v29,  0xCu);
    }
  }

  if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory("History");
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412290;
      v30 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "      Resulting chat: %@",  (uint8_t *)&v29,  0xCu);
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 replyProxy]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v15 guid]);
  uint64_t v27 = IMSingleObjectArray(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v25 messageQuery:v6 finishedWithResult:v13 chatGUIDs:v28];
}

- (void)loadMessageItemWithGUID:(id)a3 queryID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("History");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 listenerID]);
      int v29 = 138412546;
      v30 = v11;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Request from %@ to load message item with guid: %@",  (uint8_t *)&v29,  0x16u);
    }
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 messageWithGUID:v5]);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 chatForMessageGUID:v5]);

  uint64_t v18 = IMOSLoggingEnabled(v16, v17);
  if ((_DWORD)v18)
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("History");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412290;
      v30 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "   Resulting message: %@",  (uint8_t *)&v29,  0xCu);
    }
  }

  if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory("History");
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412290;
      v30 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "      Resulting chat: %@",  (uint8_t *)&v29,  0xCu);
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 replyProxy]);

  v26 = (void *)objc_claimAutoreleasedReturnValue([v15 guid]);
  uint64_t v27 = IMSingleObjectArray(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v25 messageItemQuery:v6 finishedWithResult:v13 chatGUIDs:v28];
}

- (void)loadHistoryForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 beforeGUID:(id)a8 afterGUID:(id)a9 threadIdentifier:(id)a10 reply:(id)a11
{
  int v14 = a5;
  id v56 = a3;
  id v16 = a4;
  id v17 = a6;
  id v58 = a8;
  id v57 = a9;
  id v59 = a10;
  uint64_t v18 = (void (**)(id, void *, void *))a11;
  if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("History");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 listenerID]);
      *(_DWORD *)buf = 138413826;
      *(void *)v66 = v23;
      *(_WORD *)&v66[8] = 2112;
      *(void *)&v66[10] = v16;
      __int16 v67 = 2112;
      int64_t v68 = (int64_t)v17;
      __int16 v69 = 1024;
      int v70 = a7;
      __int16 v71 = 2112;
      id v72 = v58;
      __int16 v73 = 2112;
      id v74 = v57;
      __int16 v75 = 2112;
      id v76 = v59;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Request from %@ to load messages with chat ID: %@  service: %@  limit: %d  beforeGUID: %@ aferGUID: %@ threadIdentifier: %@",  buf,  0x44u);
    }
  }

  id v24 = [v16 count];
  if (v24 && (id v24 = [v17 count]) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    uint64_t v27 = v26;
    if (v14 == 45) {
      uint64_t v28 = objc_claimAutoreleasedReturnValue( [v26 itemsWithHandles:v16 onServices:v17 messageGUID:v58 threadIdentifier:v59 limit:a7]);
    }
    else {
      uint64_t v28 = objc_claimAutoreleasedReturnValue( [v26 itemsWithRoomNames:v16 onServices:v17 messageGUID:v58 threadIdentifier:v59 limit:a7]);
    }
    __int16 v31 = (void *)v28;

    id v32 = [v31 count];
    if (v32 == (id)a7)
    {
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      id v34 = v31;
      uint64_t v35 = 0LL;
      id v36 = [v34 countByEnumeratingWithState:&v60 objects:v64 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v61;
        do
        {
          for (i = 0LL; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v61 != v37) {
              objc_enumerationMutation(v34);
            }
            v35 += [*(id *)(*((void *)&v60 + 1) + 8 * (void)i) isAssociatedMessageItem] ^ 1;
          }

          id v36 = [v34 countByEnumeratingWithState:&v60 objects:v64 count:16];
        }

        while (v36);
      }

      if (a7 >= 0) {
        int64_t v39 = a7;
      }
      else {
        int64_t v39 = a7 + 1;
      }
      if (v35 >= v39 >> 1)
      {
        __int16 v31 = v34;
      }

      else
      {
        BOOL v40 = v14 == 45;
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        v42 = v41;
        if (v40) {
          uint64_t v43 = objc_claimAutoreleasedReturnValue( [v41 itemsWithHandles:v16 onServices:v17 messageGUID:v58 threadIdentifier:v59 limit:2 * a7]);
        }
        else {
          uint64_t v43 = objc_claimAutoreleasedReturnValue( [v41 itemsWithRoomNames:v16 onServices:v17 messageGUID:v58 threadIdentifier:v59 limit:2 * a7]);
        }
        __int16 v31 = (void *)v43;

        id v32 = (id)IMOSLoggingEnabled(v44, v45);
        if ((_DWORD)v32)
        {
          uint64_t v46 = OSLogHandleForIMFoundationCategory("History");
          v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            *(void *)v66 = 2 * a7;
            *(_WORD *)&v66[8] = 2048;
            *(void *)&v66[10] = v35;
            __int16 v67 = 2048;
            int64_t v68 = a7;
            _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_INFO,  "   Requeried for %ld messages since we only loaded %ld of %ld top level messages",  buf,  0x20u);
          }
        }
      }
    }

    if (IMOSLoggingEnabled(v32, v33))
    {
      uint64_t v48 = OSLogHandleForIMFoundationCategory("History");
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        unsigned int v50 = [v31 count];
        v51 = (void *)objc_claimAutoreleasedReturnValue([v31 arrayByApplyingSelector:"guid"]);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v66 = v50;
        *(_WORD *)&v66[4] = 2112;
        *(void *)&v66[6] = v51;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "   Resulting messages (%d): %@", buf, 0x12u);
      }
    }

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    [v52 loadConsumedSessionPayloadsForItems:v31];

    v53 = (void *)IMCreateSerializedItemsFromArray(v31);
    v54 = (void *)objc_claimAutoreleasedReturnValue( -[IMDaemonChatMessageHistoryRequestHandler _serializedFileTransfersForItems:]( self,  "_serializedFileTransfersForItems:",  v31));
    v18[2](v18, v53, v54);
  }

  else
  {
    if (IMOSLoggingEnabled(v24, v25))
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory("History");
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Request to load history with empty IDs and Services",  buf,  2u);
      }
    }

    v18[2](v18, &__NSArray0__struct, &__NSArray0__struct);
  }
}

- (void)loadHistoryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 beforeGUID:(id)a7 afterGUID:(id)a8 threadIdentifier:(id)a9 chatID:(id)a10 queryID:(id)a11
{
  unsigned int v35 = a4;
  id v36 = a3;
  id v15 = a5;
  id v37 = a7;
  id v38 = a8;
  id v16 = a9;
  id v17 = a10;
  id v18 = a11;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 replyProxy]);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 listenerID]);

  if (IMOSLoggingEnabled(v23, v24))
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory("History");
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 listenerID]);
      *(_DWORD *)buf = 138414082;
      v47 = v28;
      __int16 v48 = 2112;
      id v49 = v36;
      __int16 v50 = 2112;
      id v51 = v15;
      __int16 v52 = 1024;
      int v53 = a6;
      __int16 v54 = 2112;
      id v55 = v37;
      __int16 v56 = 2112;
      id v57 = v38;
      __int16 v58 = 2112;
      id v59 = v16;
      __int16 v60 = 2112;
      id v61 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Legacy request from %@ to load messages with chat ID: %@  service: %@  limit: %d  beforeGUID: %@ aferGUID: %@ th readIdentifier: %@ queryID: %@",  buf,  0x4Eu);
    }
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1000276A4;
  v39[3] = &unk_100065A70;
  id v40 = v20;
  id v41 = v18;
  id v42 = v17;
  id v43 = v15;
  id v44 = v22;
  int64_t v45 = a6;
  id v29 = v22;
  id v30 = v15;
  id v31 = v17;
  id v32 = v18;
  id v33 = v20;
  -[IMDaemonChatMessageHistoryRequestHandler loadHistoryForChatWithGUID:chatIdentifiers:style:services:limit:beforeGUID:afterGUID:threadIdentifier:reply:]( self,  "loadHistoryForChatWithGUID:chatIdentifiers:style:services:limit:beforeGUID:afterGUID:threadIdentifier:reply:",  v31,  v36,  v35,  v30,  a6,  v37,  v38,  v16,  v39);
}

- (void)loadPagedHistoryAroundMessageWithGUID:(id)a3 chatGUID:(id)a4 chatIdentifiers:(id)a5 style:(unsigned __int8)a6 services:(id)a7 numberOfMessagesBefore:(int64_t)a8 numberOfMessagesAfter:(int64_t)a9 threadIdentifier:(id)a10 reply:(id)a11
{
  id v15 = a3;
  id v31 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a10;
  id v19 = a11;
  if (IMOSLoggingEnabled(v19, v20))
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 listenerID]);
      *(_DWORD *)buf = 138413570;
      id v34 = v24;
      __int16 v35 = 2112;
      id v36 = v16;
      __int16 v37 = 2112;
      id v38 = v15;
      __int16 v39 = 2112;
      id v40 = v17;
      __int16 v41 = 1024;
      int v42 = a8;
      __int16 v43 = 1024;
      int v44 = a9;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Request from %@ to load paged history with chat ID: %@  for messageGUID: %@ service: %@  numberOfMessagesBefore: %d numberOfMessagesAfter: %d",  buf,  0x36u);
    }
  }

  if ([v16 count] && objc_msgSend(v17, "count"))
  {
    buf[0] = 1;
    unsigned __int8 v32 = 1;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 itemsWithHandles:v16 onServices:v17 messageGUID:v15 numberOfMessagesBefore:a8 numberOfMessagesAfter:a9 threadIdentif ier:v18 hasMessagesBefore:buf hasMessagesAfter:&v32]);

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    [v27 loadConsumedSessionPayloadsForItems:v26];

    uint64_t v28 = (void *)IMCreateSerializedItemsFromArray(v26);
    id v29 = (void *)objc_claimAutoreleasedReturnValue( -[IMDaemonChatMessageHistoryRequestHandler _serializedFileTransfersForItems:]( self,  "_serializedFileTransfersForItems:",  v26));
    (*((void (**)(id, void *, void *, void, void))v19 + 2))(v19, v28, v29, buf[0], v32);
  }

  else
  {
    (*((void (**)(id, void *, void *, void, void))v19 + 2))( v19,  &__NSArray0__struct,  &__NSArray0__struct,  0LL,  0LL);
  }
}

- (void)loadPagedHistoryForGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 onServices:(id)a6 numberOfMessagesBefore:(int64_t)a7 numberOfMessagesAfter:(int64_t)a8 threadIdentifier:(id)a9 chatID:(id)a10 queryID:(id)a11
{
  unsigned int v32 = a5;
  id v33 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a9;
  id v18 = a10;
  id v19 = a11;
  if (IMOSLoggingEnabled(v19, v20))
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 listenerID]);
      *(_DWORD *)buf = 138413570;
      int v42 = v24;
      __int16 v43 = 2112;
      id v44 = v15;
      __int16 v45 = 2112;
      id v46 = v33;
      __int16 v47 = 2112;
      id v48 = v16;
      __int16 v49 = 1024;
      int v50 = a7;
      __int16 v51 = 1024;
      int v52 = a8;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Legacy request from %@ to load paged history with chat ID: %@  for messageGUID: %@ service: %@  numberOfMessages Before: %d numberOfMessagesAfter: %d",  buf,  0x36u);
    }
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 replyProxy]);

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100027CE0;
  v34[3] = &unk_100065A98;
  id v35 = v26;
  id v36 = v19;
  id v37 = v18;
  id v38 = v16;
  int64_t v39 = a7;
  int64_t v40 = a8;
  id v27 = v16;
  id v28 = v18;
  id v29 = v19;
  id v30 = v26;
  -[IMDaemonChatMessageHistoryRequestHandler loadPagedHistoryAroundMessageWithGUID:chatGUID:chatIdentifiers:style:services:numberOfMessagesBefore:numberOfMessagesAfter:threadIdentifier:reply:]( self,  "loadPagedHistoryAroundMessageWithGUID:chatGUID:chatIdentifiers:style:services:numberOfMessagesBefore:numberOfMessage sAfter:threadIdentifier:reply:",  v33,  v28,  v15,  v32,  v27,  a7,  a8,  v17,  v34);
}

- (void)fetchMessageHistorySummaryForDateInterval:(id)a3 chatIdentifiers:(id)a4 chatStyle:(unsigned __int8)a5 services:(id)a6 reply:(id)a7
{
  uint64_t v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  int v14 = (void (**)(id, void *))a7;
  if (IMOSLoggingEnabled(v14, v15))
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory("History");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 listenerID]);
      int v22 = 138413058;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Request from %@ to fetch message history with chatIDs: %@ services: %@ dateInterval: %@",  (uint8_t *)&v22,  0x2Au);
    }
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( [v20 messageHistorySummaryForDateInterval:v11 chatIdentifiers:v12 chatStyle:v9 services:v13]);
  v14[2](v14, v21);
}

- (void)fetchOldestMessageDateForChatIdentifiers:(id)a3 chatStyle:(unsigned __int8)a4 services:(id)a5 reply:(id)a6
{
  uint64_t v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  if (IMOSLoggingEnabled(v11, v12))
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("History");
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 listenerID]);
      int v19 = 138412802;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Request from %@ to fetch oldest message date with chatIDs: %@ services: %@",  (uint8_t *)&v19,  0x20u);
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 oldestMessageDateForChatIdentifiers:v9 chatStyle:v8 services:v10]);
  v11[2](v11, v18);
}

- (void)loadAttachmentsForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7
{
  int v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  int v14 = (void (**)(id, void *))a7;
  if (IMOSLoggingEnabled(v14, v15))
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory("History");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 listenerID]);
      int v33 = 138412802;
      id v34 = v19;
      __int16 v35 = 2112;
      id v36 = v12;
      __int16 v37 = 2112;
      id v38 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Request from %@ to load media attachment filenames with chat ID: %@  service: %@",  (uint8_t *)&v33,  0x20u);
    }
  }

  id v20 = [v12 count];
  if (v20 && (id v20 = [v13 count]) != 0)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    __int16 v23 = v22;
    if (v9 == 45) {
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 attachmentsWithHandles:v12 onServices:v13]);
    }
    else {
      uint64_t v24 = objc_claimAutoreleasedReturnValue([v22 attachmentsWithRoomNames:v12 onServices:v13]);
    }
    id v27 = (void *)v24;

    if (IMOSLoggingEnabled(v28, v29))
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory("History");
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        unsigned int v32 = [v27 count];
        int v33 = 67109120;
        LODWORD(v34) = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "   Resulting attachments (%d)",  (uint8_t *)&v33,  8u);
      }
    }

    v14[2](v14, v27);
  }

  else
  {
    if (IMOSLoggingEnabled(v20, v21))
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory("History");
      __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v33 = 138412546;
        id v34 = v12;
        __int16 v35 = 2112;
        id v36 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  " No IDs: %@ or serviceNames: %@, empty results being returned",  (uint8_t *)&v33,  0x16u);
      }
    }

    v14[2](v14, &__NSArray0__struct);
  }
}

- (void)loadAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7
{
  uint64_t v9 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyProxy]);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10002856C;
  v22[3] = &unk_100065AC0;
  id v23 = v17;
  id v24 = v14;
  id v25 = v13;
  id v26 = v12;
  id v18 = v12;
  id v19 = v13;
  id v20 = v14;
  id v21 = v17;
  -[IMDaemonChatMessageHistoryRequestHandler loadAttachmentsForChatWithGUID:chatIdentifiers:style:services:reply:]( self,  "loadAttachmentsForChatWithGUID:chatIdentifiers:style:services:reply:",  v19,  v15,  v9,  v18,  v22);
}

- (id)_serializedFileTransfersForItems:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v9);
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDFileTransferCenter sharedInstance]( &OBJC_CLASS___IMDFileTransferCenter,  "sharedInstance",  (void)v15));
        id v12 = [v10 copyFileTransferDictionaryRepresentationsFromCenter:v11];

        -[NSMutableArray addObjectsFromArray:](v4, "addObjectsFromArray:", v12);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  id v13 = -[NSMutableArray copy](v4, "copy");
  return v13;
}

- (void)deleteMessageWithGUIDs:(id)a3 queryID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 listenerID]);
      *(_DWORD *)buf = 138412546;
      __int16 v35 = v11;
      __int16 v36 = 2112;
      id v37 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Request from %@ to delete messages with guids: %@",  buf,  0x16u);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 chatForMessageGUID:v13]);

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 serviceName]);
  LODWORD(v13) = [v15 isEqualToString:IMServiceNameSMS];

  if ((_DWORD)v13) {
    IMGreenTeaMessageDeleteLog();
  }
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deleteMessageGUIDs:v5]);

  if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("History");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v35 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "   deleted messages: %@", buf, 0xCu);
    }
  }

  if ([v17 count])
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v14 serviceName]);
    unsigned int v23 = [v22 isEqualToString:IMServiceNameSMS];

    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
    id v25 = v24;
    id v26 = &IMServiceNameiMessage;
    if (v23) {
      id v26 = &IMServiceNameSMS;
    }
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v24 anySessionForServiceName:*v26]);

    unsigned int v32 = @"message";
    id v33 = v5;
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v14 guid]);
    [v27 sendDeleteCommand:v28 forChatGUID:v29];

    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v30,  "broadcasterForChatListenersUsingBlackholeRegistry:",  objc_msgSend(v14, "isBlackholed")));
    [v31 historicalMessageGUIDsDeleted:v17 chatGUIDs:0 queryID:v6];
  }
}

- (void)clearHistoryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 beforeGUID:(id)a6 afterGUID:(id)a7 chatID:(id)a8 queryID:(id)a9
{
  uint64_t v13 = a4;
  id v14 = a3;
  id v65 = a5;
  id v60 = a6;
  id v61 = a7;
  id v64 = a8;
  id v62 = a9;
  if (IMOSLoggingEnabled(v62, v15))
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory("History");
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 listenerID]);
      *(_DWORD *)buf = 138412802;
      v83 = v19;
      __int16 v84 = 2112;
      id v85 = v14;
      __int16 v86 = 2112;
      id v87 = v65;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Request from %@ to delete messages with destination IDs: %@  service: %@",  buf,  0x20u);
    }
  }

  if ([v14 count] && objc_msgSend(v65, "count"))
  {
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    id v20 = v65;
    id v21 = [v20 countByEnumeratingWithState:&v67 objects:v81 count:16];
    if (v21)
    {
      int v22 = 0;
      uint64_t v23 = *(void *)v68;
      do
      {
        for (i = 0LL; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v68 != v23) {
            objc_enumerationMutation(v20);
          }
          v22 |= [*(id *)(*((void *)&v67 + 1) + 8 * (void)i) isEqualToString:IMServiceNameSMS];
        }

        id v21 = [v20 countByEnumeratingWithState:&v67 objects:v81 count:16];
      }

      while (v21);

      if ((v22 & 1) != 0) {
        IMGreenTeaMessageDeleteLog();
      }
    }

    else
    {
    }

    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    __int128 v63 = (void *)objc_claimAutoreleasedReturnValue([v25 existingChatWithGUID:v64]);

    if (v63)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v63 serviceName]);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v26 anySessionForServiceName:v27]);

      [v28 willRemoveChat:v63];
    }

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    __int16 v58 = (void *)objc_claimAutoreleasedReturnValue([v29 deleteMessagesWithChatIdentifiers:v14 style:v13 onServices:v20]);

    if (IMOSLoggingEnabled(v30, v31))
    {
      uint64_t v32 = OSLogHandleForIMFoundationCategory("History");
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v83 = v58;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "   deleted messages: %@", buf, 0xCu);
      }
    }

    if (objc_msgSend(v58, "count", v58, v60, v61))
    {
      v66 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int16 v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      if ([v14 count])
      {
        unint64_t v36 = 0LL;
        do
        {
          id v37 = (void *)objc_claimAutoreleasedReturnValue([v20 objectAtIndex:v36]);
          id v38 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndex:v36]);
          int64_t v39 = (void *)IMCopyGUIDForChat(v38, v37, v13);

          if ([v39 length]
            && (unsigned __int8 v40 = [v37 isEqualToString:IMServiceNameSMS], v41 = v66,
                                                                                                (v40 & 1) != 0)
            || (v42 = [v39 length], __int16 v41 = v34, v42))
          {
            -[NSMutableArray addObject:](v41, "addObject:", v39);
            -[NSMutableArray addObject:](v35, "addObject:", v39);
          }

          ++v36;
        }

        while (v36 < (unint64_t)[v14 count]);
      }

      if (v63)
      {
        if (-[NSMutableArray count](v34, "count"))
        {
          __int16 v43 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
          id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 anySessionForServiceName:IMServiceNameiMessage]);

          v79 = @"chat-clear";
          v76[1] = @"groupID";
          v77[0] = v34;
          v76[0] = @"guids";
          __int16 v45 = (void *)objc_claimAutoreleasedReturnValue([v63 groupID]);
          v77[1] = v45;
          id v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v77,  v76,  2LL));
          v78 = v46;
          __int16 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v78,  1LL));
          v80 = v47;
          id v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v80,  &v79,  1LL));
          [v44 sendDeleteCommand:v48 forChatGUID:v64];
        }

        if (-[NSMutableArray count](v66, "count"))
        {
          __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
          int v50 = (void *)objc_claimAutoreleasedReturnValue([v49 anySessionForServiceName:IMServiceNameSMS]);

          id v74 = @"chat-clear";
          v72[0] = v66;
          v71[0] = @"guids";
          v71[1] = @"groupID";
          __int16 v51 = (void *)objc_claimAutoreleasedReturnValue([v63 groupID]);
          v72[1] = v51;
          v71[2] = @"ptcpts";
          int v52 = (void *)objc_claimAutoreleasedReturnValue([v63 participantHandles]);
          v72[2] = v52;
          int v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v72,  v71,  3LL));
          __int16 v73 = v53;
          __int16 v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v73,  1LL));
          __int16 v75 = v54;
          id v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v75,  &v74,  1LL));
          [v50 sendDeleteCommand:v55 forChatGUID:v64];
        }
      }

      __int16 v56 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
      id v57 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v56,  "broadcasterForChatListenersUsingBlackholeRegistry:",  objc_msgSend(v63, "isBlackholed")));
      [v57 historicalMessageGUIDsDeleted:v59 chatGUIDs:v35 queryID:v62];
    }
  }
}

- (void)markChatAsSpamWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 isAutoReport:(BOOL)a7 isJunkReportedToCarrier:(BOOL)a8 reportReason:(unint64_t)a9 reply:(id)a10
{
  BOOL v11 = a7;
  uint64_t v13 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  uint64_t v18 = (void (**)(id, id))a10;
  if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Chat");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 listenerID]);
      id v24 = @"NO";
      *(_DWORD *)buf = 138413314;
      uint64_t v29 = v23;
      if (v11) {
        id v24 = @"YES";
      }
      __int16 v30 = 2112;
      id v31 = v16;
      __int16 v32 = 2112;
      id v33 = v17;
      __int16 v34 = 2112;
      __int16 v35 = v24;
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Request from %@ to mark IDs as spam: %@  service: %@ autoReport %@ chatGUID %@",  buf,  0x34u);
    }
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  LOBYTE(v27) = a8;
  id v26 = [v25 markAsSpamForIDs:v16 style:v13 onServices:v17 chatID:v15 queryID:0 autoReport:v11 isJunkReportedToCarrier:v27 reportReason:a9];

  v18[2](v18, v26);
}

- (void)markChatAsSpamWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 isAutoReport:(BOOL)a7 isJunkReportedToCarrier:(BOOL)a8 reply:(id)a9
{
}

- (void)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v11 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a3;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 replyProxy]);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100029484;
  v24[3] = &unk_100065AE8;
  BOOL v29 = v8;
  id v25 = v16;
  id v26 = v19;
  id v27 = v15;
  id v28 = v14;
  id v20 = v14;
  id v21 = v15;
  id v22 = v19;
  id v23 = v16;
  -[IMDaemonChatMessageHistoryRequestHandler markChatAsSpamWithGUID:chatIdentifiers:style:services:isAutoReport:isJunkReportedToCarrier:reportReason:reply:]( self,  "markChatAsSpamWithGUID:chatIdentifiers:style:services:isAutoReport:isJunkReportedToCarrier:reportReason:reply:",  v21,  v17,  v11,  v20,  v8,  0LL,  0LL,  v24);
}

- (void)retractNotificationsForReadMessagesWithGUIDs:(id)a3
{
}

- (void)cleanupAttachments
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("Attachments");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 listenerID]);
      int v7 = 138412290;
      BOOL v8 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Request from %@ to clean up attachments",  (uint8_t *)&v7,  0xCu);
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  [v6 cleanseAttachments];
}

- (void)loadFrequentRepliesForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 reply:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, void *))a8;
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("FrequentReplies");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 listenerID]);
      int v29 = 138413058;
      *(void *)__int16 v30 = v20;
      *(_WORD *)&v30[8] = 2112;
      *(void *)&v30[10] = v13;
      __int16 v31 = 2112;
      id v32 = v14;
      __int16 v33 = 1024;
      int v34 = a7;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Request from %@ to find frequent replies with chat ID: %@  service: %@  limit: %d",  (uint8_t *)&v29,  0x26u);
    }
  }

  if ([v13 count] && objc_msgSend(v14, "count"))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 frequentRepliesForForChatIdentifiers:v13 onServices:v14 limit:a7]);

    if (IMOSLoggingEnabled(v23, v24))
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory("FrequentReplies");
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        unsigned int v27 = [v22 count];
        int v29 = 67109378;
        *(_DWORD *)__int16 v30 = v27;
        *(_WORD *)&v30[4] = 2112;
        *(void *)&v30[6] = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "   Resulting frequent replies (%d): %@",  (uint8_t *)&v29,  0x12u);
      }
    }

    if (v22) {
      id v28 = v22;
    }
    else {
      id v28 = &__NSArray0__struct;
    }
    v15[2](v15, v28);
  }
}

- (void)loadFrequentRepliesForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 chatID:(id)a7 queryID:(id)a8
{
  uint64_t v11 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a3;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 replyProxy]);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000299E8;
  v24[3] = &unk_100065B10;
  id v25 = v19;
  id v26 = v16;
  id v27 = v15;
  id v28 = v14;
  int64_t v29 = a6;
  id v20 = v14;
  id v21 = v15;
  id v22 = v16;
  id v23 = v19;
  -[IMDaemonChatMessageHistoryRequestHandler loadFrequentRepliesForChatWithGUID:chatIdentifiers:style:services:limit:reply:]( self,  "loadFrequentRepliesForChatWithGUID:chatIdentifiers:style:services:limit:reply:",  v21,  v17,  v11,  v20,  a6,  v24);
}

- (void)loadUnreadHistoryForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 limit:(int64_t)a7 fallbackMessageGUID:(id)a8 reply:(id)a9
{
  int v12 = a5;
  id v42 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  uint64_t v18 = (void (**)(id, void *, void *))a9;
  if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("History");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 listenerID]);
      *(_DWORD *)buf = 138413058;
      id v44 = v23;
      __int16 v45 = 2112;
      id v46 = v15;
      __int16 v47 = 2112;
      id v48 = v16;
      __int16 v49 = 1024;
      int v50 = a7;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Request from %@ to load latest unread messages with chat ID: %@  services: %@  limit: %d",  buf,  0x26u);
    }
  }

  if ([v15 count] && objc_msgSend(v16, "count"))
  {
    BOOL v24 = v12 == 45;
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    id v26 = v25;
    if (v24) {
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 unreadMessagesWithHandles:v15 onServices:v16 limit:a7 fallbackGUID:v17]);
    }
    else {
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v25 unreadMessagesWithRoomNames:v15 onServices:v16 limit:a7 fallbackGUID:v17]);
    }
    id v28 = v27;
    id v29 = [v27 mutableCopy];

    if (IMOSLoggingEnabled(v30, v31))
    {
      uint64_t v32 = OSLogHandleForIMFoundationCategory("History");
      __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        unsigned int v34 = [v29 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v44) = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_INFO,  "  Unread query Resulting messages (%d)",  buf,  8u);
      }
    }

    id v35 = -[IMDaemonChatMessageHistoryRequestHandler _populateParentMessagesIfNeeded:]( self,  "_populateParentMessagesIfNeeded:",  v29);
    if (IMOSLoggingEnabled(v35, v36))
    {
      uint64_t v37 = OSLogHandleForIMFoundationCategory("History");
      id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        unsigned int v39 = [v29 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v44) = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "   Resulting messages (%d)", buf, 8u);
      }
    }

    unsigned __int8 v40 = (void *)IMCreateSerializedItemsFromArray(v29);
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue( -[IMDaemonChatMessageHistoryRequestHandler _serializedFileTransfersForItems:]( self,  "_serializedFileTransfersForItems:",  v29));
    v18[2](v18, v40, v41);
  }

  else
  {
    v18[2](v18, &__NSArray0__struct, &__NSArray0__struct);
  }
}

- (void)loadUnreadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 limit:(int64_t)a6 fallbackGUID:(id)a7 chatId:(id)a8 queryID:(id)a9
{
  uint64_t v12 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a9;
  id v18 = a7;
  id v19 = a3;
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 replyProxy]);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100029EE0;
  v26[3] = &unk_100065B38;
  id v27 = v21;
  id v28 = v17;
  id v29 = v16;
  id v30 = v15;
  int64_t v31 = a6;
  id v22 = v15;
  id v23 = v16;
  id v24 = v17;
  id v25 = v21;
  -[IMDaemonChatMessageHistoryRequestHandler loadUnreadHistoryForChatWithGUID:chatIdentifiers:style:services:limit:fallbackMessageGUID:reply:]( self,  "loadUnreadHistoryForChatWithGUID:chatIdentifiers:style:services:limit:fallbackMessageGUID:reply:",  v23,  v19,  v12,  v22,  a6,  v18,  v26);
}

- (void)_populateParentMessagesIfNeeded:(id)a3
{
  id v3 = a3;
  v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "__imArrayByApplyingBlock:", &stru_100065B78));
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("History");
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v59 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "allUnreadGUIDs %@", buf, 0xCu);
    }
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &stru_100065BB8));
  id v9 = [v8 count];
  if (v9 && IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v8 arrayByApplyingSelector:"guid"]);
      *(_DWORD *)buf = 138412290;
      id v59 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Resulting ack or ack sticker guids %@",  buf,  0xCu);
    }
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id v15 = v8;
  id v16 = [v15 countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v16)
  {
    uint64_t v18 = *(void *)v54;
    *(void *)&__int128 v17 = 138412546LL;
    __int128 v48 = v17;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v54 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "associatedMessageGUID", v48));
        uint64_t v22 = IMAssociatedMessageDecodeGUID();
        id v23 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(v22);

        if (v23)
        {
          id v26 = -[NSMutableSet containsObject:](v4, "containsObject:", v23);
          int v27 = (int)v26;
          int v29 = IMOSLoggingEnabled(v26, v28);
          if (v27)
          {
            if (!v29) {
              goto LABEL_30;
            }
            uint64_t v30 = OSLogHandleForIMFoundationCategory("History");
            int64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v20 guid]);
              *(_DWORD *)buf = v48;
              id v59 = v23;
              __int16 v60 = 2112;
              id v61 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "associateMessageGUID %@ for message guid %@ is already in unread list. Not adding again",  buf,  0x16u);
            }

            goto LABEL_20;
          }

          if (v29)
          {
            uint64_t v35 = OSLogHandleForIMFoundationCategory("History");
            uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v59 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "Adding associateMessageGUID %@",  buf,  0xCu);
            }
          }

          -[NSMutableSet addObject:](v14, "addObject:", v23);
        }

        else if (IMOSLoggingEnabled(v24, v25))
        {
          uint64_t v33 = OSLogHandleForIMFoundationCategory("Warning");
          int64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            unsigned int v34 = (NSMutableSet *)objc_claimAutoreleasedReturnValue([v20 associatedMessageGUID]);
            *(_DWORD *)buf = 138412290;
            id v59 = v34;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "History [item associatedMessageGUID] is nil %@ ",  buf,  0xCu);
          }

- (void)loadUncachedAttachmentCountForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 services:(id)a6 reply:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void (**)(id, void))a7;
  if (IMOSLoggingEnabled(v13, v14))
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory("History");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 listenerID]);
      int v30 = 138412802;
      id v31 = v18;
      __int16 v32 = 2112;
      id v33 = v11;
      __int16 v34 = 2112;
      id v35 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Request from %@ to load uncached media attachment count with chat ID: %@  service: %@",  (uint8_t *)&v30,  0x20u);
    }
  }

  id v19 = [v11 count];
  if (!v19 || (id v19 = [v12 count]) == 0)
  {
    if (IMOSLoggingEnabled(v19, v20))
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory("History");
      int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        int v30 = 138412546;
        id v31 = v11;
        __int16 v32 = 2112;
        id v33 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  " No IDs: %@ or serviceNames: %@, empty results being returned",  (uint8_t *)&v30,  0x16u);
      }
    }

    goto LABEL_18;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  unsigned int v22 = [v21 cloudKitSyncingEnabled];

  if (!v22)
  {
    if (IMOSLoggingEnabled(v23, v24))
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory("History");
      int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  " Service does not support a database OR MIC disabled, empty results being returned",  (uint8_t *)&v30,  2u);
      }
    }

- (void)loadUncachedAttachmentCountForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7
{
  uint64_t v9 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyProxy]);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10002A908;
  v22[3] = &unk_100065BE0;
  id v23 = v17;
  id v24 = v14;
  id v25 = v13;
  id v26 = v12;
  id v18 = v12;
  id v19 = v13;
  id v20 = v14;
  id v21 = v17;
  -[IMDaemonChatMessageHistoryRequestHandler loadUncachedAttachmentCountForChatWithGUID:chatIdentifiers:style:services:reply:]( self,  "loadUncachedAttachmentCountForChatWithGUID:chatIdentifiers:style:services:reply:",  v19,  v15,  v9,  v18,  v22);
}

- (void)purgeAttachmentsForChatGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("Chat");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Purging attachments for chat: %@",  (uint8_t *)&v7,  0xCu);
    }
  }

  IMDChatRecordPurgeAttachments(v3);
}

- (void)updateUnformattedID:(id)a3 forBuddyID:(id)a4 onService:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 hasPrefix:@"+"];
  if ((v10 & 1) != 0 || (id v10 = [v8 hasPrefix:@"P:"], (_DWORD)v10))
  {
    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory("History");
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412802;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Ignoring request from client to update unformatted ID %@->%@  on service: %@",  (uint8_t *)&v17,  0x20u);
      }
    }
  }

  else
  {
    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory("History");
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412802;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v8;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Request from client to update unformatted ID %@->%@  on service: %@",  (uint8_t *)&v17,  0x20u);
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    [v16 updateUnformattedID:v7 forBuddyID:v8 onService:v9];
  }
}

- (void)moveMessagesWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 queryID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v37 = a5;
  if (IMOSLoggingEnabled(v37, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("IMDaemon");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Recently Deleted | Will move messages to recently deleted: %@",  buf,  0xCu);
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 chatForMessageGUID:v14]);

  if (+[IMGenerativeModelsAvailabilityProvider messageSummarizationEnabled]( &OBJC_CLASS___IMGenerativeModelsAvailabilityProvider,  "messageSummarizationEnabled"))
  {
    uint64_t v40 = IMChatPropertyChatSummaryDictionary;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    __int16 v41 = v16;
    int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
    [v15 updateProperties:v17];
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  [v18 moveMessagesWithGUIDsToRecentlyDeleted:v8 deleteDate:v9];

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  [v19 updateStamp];

  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMINInteractionUtilities sharedInstance](&OBJC_CLASS___IMINInteractionUtilities, "sharedInstance"));
  [v20 deleteInteractionsWithMessageGUIDs:v8];

  -[IMDaemonChatMessageHistoryRequestHandler _updateLastMessageTimeStampForChat:]( self,  "_updateLastMessageTimeStampForChat:",  v15);
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue([v15 serviceName]);
  unsigned int v22 = [v21 isEqualToString:IMServiceNameSMS];
  id v23 = (id *)&IMServiceNameiMessage;
  if (v22) {
    id v23 = (id *)&IMServiceNameSMS;
  }
  id v24 = *v23;

  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 anySessionForServiceName:v24]);

  v38[0] = IMDDeleteCommandMessageGUIDArrayKey;
  v38[1] = IMDDeleteCommandIsPermanentDeleteKey;
  v39[0] = v8;
  v39[1] = &__kCFBooleanFalse;
  v38[2] = IMDDeleteCommandRecoverableDeleteDateKey;
  v39[2] = v9;
  int v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  3LL));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v15 guid]);
  [v26 sendDeleteCommand:v27 forChatGUID:v28];

  int v29 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 replyProxy]);

  [v30 movedMessagesToRecentlyDeletedWithQueryID:v37];
  id v31 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  [v31 retractPostedNotificationsForMessageGUIDs:v8];

  __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  [v32 updateStateForChat:v15 hintMessage:0 shouldRebuildFailedMessageDate:1 shouldCalculateUnreadCount:1];

  if (IMOSLoggingEnabled(v33, v34))
  {
    uint64_t v35 = OSLogHandleForIMFoundationCategory("IMDaemon");
    uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_INFO,  "Recently Deleted | Finished moving messages to recently deleted: %@",  buf,  0xCu);
    }
  }
}

- (void)moveMessagesInChatsWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 queryID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled(v10, v11))
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory("IMDaemon");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Recently Deleted | Will move messages to recently deleted for chatGUIDs: %@",  buf,  0xCu);
    }
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  [v14 moveMessagesInChatsWithGUIDsToRecentlyDeleted:v8 deleteDate:v9];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  [v15 updateStamp];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMINInteractionUtilities sharedInstance](&OBJC_CLASS___IMINInteractionUtilities, "sharedInstance"));
  [v16 deleteInteractionsWithChatGUIDs:v8];

  int v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 anySessionForServiceName:IMServiceNameSMS]);

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:IMServiceNameiMessage]);

  id v31 = _NSConcreteStackBlock;
  uint64_t v32 = 3221225472LL;
  uint64_t v33 = sub_10002B34C;
  uint64_t v34 = &unk_100065C08;
  uint64_t v35 = self;
  id v21 = v18;
  id v36 = v21;
  id v22 = v20;
  id v37 = v22;
  id v23 = v9;
  id v38 = v23;
  [v8 enumerateObjectsUsingBlock:&v31];
  id v24 = (void *)objc_claimAutoreleasedReturnValue( +[IMDBroadcastController sharedProvider]( &OBJC_CLASS___IMDBroadcastController,  "sharedProvider",  v31,  v32,  v33,  v34,  v35));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 broadcasterForChatListeners]);

  [v25 movedMessagesToRecentlyDeletedForChatsWithGUIDs:v8 queryID:v10 deletionDate:v23];
  id v26 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  [v26 retractPostedNotificationsForMessagesMatchingChatGUIDs:v8];

  if (IMOSLoggingEnabled(v27, v28))
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory("IMDaemon");
    int v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Recently Deleted | Finished moving messages to recently deleted for chatGUIDs: %@",  buf,  0xCu);
    }
  }
}

- (void)recoverMessagesWithChatGUIDs:(id)a3 queryID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("IMDaemon");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Recently Deleted | Will recover messages for chatGUIDs: %@",  buf,  0xCu);
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  [v11 recoverMessagesWithChatGUIDs:v6];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  [v12 updateStamp];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:IMServiceNameSMS]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 anySessionForServiceName:IMServiceNameiMessage]);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10002BB6C;
  v25[3] = &unk_100065C30;
  v25[4] = self;
  id v17 = v14;
  id v26 = v17;
  id v18 = v16;
  id v27 = v18;
  [v6 enumerateObjectsUsingBlock:v25];
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 broadcasterForChatListeners]);

  id v21 = [v20 recoveredMessagesWithChatGUIDs:v6 queryID:v7];
  if (IMOSLoggingEnabled(v21, v22))
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory("IMDaemon");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Recently Deleted | Finished recovering messages for chatGUIDs: %@",  buf,  0xCu);
    }
  }
}

- (void)loadRecoverableMessagesMetadataWithQueryID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("IMDaemon");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Recently Deleted | Will retrieve recoverable message count",  buf,  2u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recoverableMessagesMetadata]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 replyProxy]);

  id v11 = [v10 loadedRecoverableMessagesMetadata:v8 queryID:v3];
  if (IMOSLoggingEnabled(v11, v12))
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("IMDaemon");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Recently Deleted | Finished retrieving recoverable message count",  v15,  2u);
    }
  }
}

- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 queryID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled(v6, v7))
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("IMDaemon");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Recently Deleted | Will permanently delete recently deleted messages for chatGUIDS: %@",  buf,  0xCu);
    }
  }

  [v5 enumerateObjectsUsingBlock:&stru_100065C70];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002C4B8;
  v12[3] = &unk_100065420;
  id v13 = v6;
  id v11 = v6;
  [v10 permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:v5 completionHandler:v12];
}

- (void)_updateLastMessageTimeStampForChat:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastMessageForChatWithRowID:", objc_msgSend(v3, "rowID")));
  [v3 setLastMessage:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 lastMessage]);
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 lastMessage]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 time]);
    [v8 timeIntervalSinceReferenceDate];
    [v3 setLastMessageTimeStampOnLoad:(uint64_t)v9];
  }

  else
  {
    [v3 setLastMessageTimeStampOnLoad:0];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
  unsigned int v11 = [v10 isAVLessSharePlayEnabled];

  if (v11)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastTUConversationItemForChat:v3]);

    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 time]);

      if (v16)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 time]);
        [v3 setLastTUConversationCreatedDate:v17];
      }

      else
      {
        uint64_t v18 = IMLogHandleForCategory("Recently Deleted");
        __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10004266C((uint64_t)v15, v19);
        }
      }
    }

    else
    {
      [v3 setLastTUConversationCreatedDate:0];
    }
  }

  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Recently Deleted");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v3 guid]);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v3 lastMessage]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 time]);
      [v24 timeIntervalSinceReferenceDate];
      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v3 lastTUConversationCreatedDate]);
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v3 lastScheduledMessageCreatedDate]);
      int v31 = 138413058;
      uint64_t v32 = v22;
      __int16 v33 = 2112;
      uint64_t v34 = v25;
      __int16 v35 = 2112;
      id v36 = v26;
      __int16 v37 = 2112;
      id v38 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Recently Deleted | IMChat: %@, updating last message timestamp on load: %@ lastTUConversationCreatedDate %@ last ScheduledMessageCreatedDate: %@",  (uint8_t *)&v31,  0x2Au);
    }
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 broadcasterForChatListeners]);

  int v30 = (void *)objc_claimAutoreleasedReturnValue([v3 guid]);
  objc_msgSend( v29,  "chat:lastMessageTimeStampOnLoadUpdated:",  v30,  (double)(uint64_t)objc_msgSend(v3, "lastMessageTimeStampOnLoad"));
}

- (void)loadItemWithGUID:(id)a3 queryID:(id)a4
{
}

- (void)fetchEarliestMessageDateForChatsWithGUIDs:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  _Block_copy(v6);
  uint64_t v8 = self;
  sub_100040778(v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v7, v9);
}

- (void)upgradeCompleteMyMomentLinkToStackWithMessageGUID:(id)a3 chatGUID:(id)a4
{
}

- (void)updatePluginMessageWithGUID:(id)a3 newPayloadData:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  unint64_t v12 = v11;
  id v13 = a4;
  uint64_t v14 = self;
  uint64_t v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v17 = v16;

  _Block_copy(v8);
  sub_100040DA4(v10, v12, v15, v17, (char *)v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_10004230C(v15, v17);

  swift_bridgeObjectRelease(v12, v18);
}

- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3
{
  uint64_t v5 = sub_100032148(0LL, &qword_100070EC8, &OBJC_CLASS___NSAttributedString_ptr);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  v5,  &protocol witness table for String);
  uint64_t v7 = (void *)objc_opt_self(&OBJC_CLASS___IMDChatRegistry);
  uint64_t v8 = self;
  id v9 = [v7 sharedInstance];
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  [v9 updateChatsUsingMessageGUIDsAndSummaries:isa];

  swift_bridgeObjectRelease(v6, v10);
}

- (void)fetchIncomingPendingMessagesOverSatelliteForChatsWithIDs:(id)a3 services:(id)a4
{
  uint64_t v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  uint64_t v8 = self;
  _sSo40IMDaemonChatMessageHistoryRequestHandlerC7imagentE49fetchIncomingPendingMessagesOverSatelliteForChats7withIDs8servicesySaySSG_AGtF_0( v6,  v7);

  swift_bridgeObjectRelease(v6, v9);
  swift_bridgeObjectRelease(v7, v10);
}

@end