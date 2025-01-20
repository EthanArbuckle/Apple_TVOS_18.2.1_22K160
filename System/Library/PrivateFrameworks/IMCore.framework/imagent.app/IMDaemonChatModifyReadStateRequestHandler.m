@interface IMDaemonChatModifyReadStateRequestHandler
- (void)markHasHadSuccessfulQueryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5;
- (void)markPlayedExpressiveSendForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6;
- (void)markReadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 messages:(id)a6 clientUnreadCount:(int64_t)a7;
- (void)markReadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 messages:(id)a6 clientUnreadCount:(int64_t)a7 setUnreadCountToZero:(BOOL)a8;
- (void)markSavedForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6;
- (void)markSavedForMessageGUID:(id)a3;
- (void)sendNotifyRecipientCommandForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6;
@end

@implementation IMDaemonChatModifyReadStateRequestHandler

- (void)markReadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 messages:(id)a6 clientUnreadCount:(int64_t)a7
{
}

- (void)markReadForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 messages:(id)a6 clientUnreadCount:(int64_t)a7 setUnreadCountToZero:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v12 = a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("History");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 listenerID]);
      int v21 = 138413058;
      v22 = v20;
      __int16 v23 = 2112;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v14;
      __int16 v27 = 2048;
      int64_t v28 = a7;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Request from %@ to mark messages as read with IDs: %@  services: %@ clientUnreadCount: %lu",  (uint8_t *)&v21,  0x2Au);
    }
  }

  sub_10001B744(v13, v12, v14, v15, (void *)a7, v8);
}

- (void)markPlayedExpressiveSendForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  if (IMOSLoggingEnabled(v10, v11))
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory("History");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 listenerID]);
      int v36 = 138412802;
      id v37 = v15;
      __int16 v38 = 2112;
      id v39 = v8;
      __int16 v40 = 2112;
      id v41 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Request from %@ to mark message as played expressive send with IDs: %@  services: %@",  (uint8_t *)&v36,  0x20u);
    }
  }

  if ([v8 count] && objc_msgSend(v9, "count"))
  {
    id v16 = [v8 count];
    id v17 = [v9 count];
    if (v16 == v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v10 guid]);
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v19 messageWithGUID:v20]);

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        [v21 setTimeExpressiveSendPlayed:v22];

        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        id v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 storeMessage:v21 forceReplace:1 modifyError:0 modifyFlags:0 flagMask:0]);
      }

      else
      {
        id v24 = 0LL;
      }

      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
      int64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v24 guid]);
      id v10 = (id)objc_claimAutoreleasedReturnValue([v27 messageWithGUID:v28]);

      v29 = (void *)objc_claimAutoreleasedReturnValue([v10 accountID]);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 broadcasterForChatListeners]);

      if (IMOSLoggingEnabled(v32, v33))
      {
        uint64_t v34 = OSLogHandleForIMFoundationCategory("History");
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          int v36 = 138412290;
          id v37 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Notifying about message: %@",  (uint8_t *)&v36,  0xCu);
        }
      }

      [v31 account:v29 chat:0 style:0 chatProperties:0 messageUpdated:v10];
    }

    else if (IMOSLoggingEnabled(v17, v18))
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory("Warning");
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v36 = 138412546;
        id v37 = v8;
        __int16 v38 = 2112;
        id v39 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Mismatched IDs and serviceNames array to mark as played expressive send (IDs: %@   Service names: %@)",  (uint8_t *)&v36,  0x16u);
      }
    }
  }
}

- (void)markHasHadSuccessfulQueryForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (IMOSLoggingEnabled(v8, v9))
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 listenerID]);
      *(_DWORD *)buf = 138412802;
      id v37 = v13;
      __int16 v38 = 2112;
      id v39 = v7;
      __int16 v40 = 2112;
      id v41 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Request from %@ to mark chat as had successful ID query for IDs: %@  services: %@",  buf,  0x20u);
    }
  }

  if ([v7 count] && objc_msgSend(v8, "count"))
  {
    id v14 = [v7 count];
    id v15 = [v8 count];
    if (v14 == v15)
    {
      id v17 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      if ([v7 count])
      {
        unint64_t v18 = 0LL;
        do
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v18]);
          v20 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:v18]);
          int v21 = (void *)IMCopyGUIDForChat(v19, v20, v6);

          -[NSMutableSet addObject:](v17, "addObject:", v21);
          ++v18;
        }

        while (v18 < (unint64_t)[v7 count]);
      }

      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      v22 = v17;
      id v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
      if (v23)
      {
        uint64_t v24 = *(void *)v32;
        do
        {
          uint64_t v25 = 0LL;
          do
          {
            if (*(void *)v32 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)v25);
            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[IMDChatRegistry sharedInstance]( &OBJC_CLASS___IMDChatRegistry,  "sharedInstance",  (void)v31));
            int64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 existingChatWithGUID:v26]);

            [v28 updateHasHadSuccessfulQuery:1];
            uint64_t v25 = (char *)v25 + 1;
          }

          while (v23 != v25);
          id v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v31,  v35,  16LL);
        }

        while (v23);
      }
    }

    else if (IMOSLoggingEnabled(v15, v16))
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory("Warning");
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v37 = v7;
        __int16 v38 = 2112;
        id v39 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Mismatched IDs and serviceNames array to mark chat as had successful ID query (IDs: %@   Service names: %@)",  buf,  0x16u);
      }
    }
  }
}

- (void)sendNotifyRecipientCommandForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6
{
  uint64_t v8 = a4;
  id v74 = a3;
  id v73 = a5;
  id v71 = a6;
  if (IMOSLoggingEnabled(v71, v9))
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 listenerID]);
      *(_DWORD *)buf = 138412802;
      id v82 = v13;
      __int16 v83 = 2112;
      id v84 = v74;
      __int16 v85 = 2112;
      id v86 = v73;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Request from %@ to send notify recipient command with IDs: %@  services: %@",  buf,  0x20u);
    }
  }

  if ([v74 count] && objc_msgSend(v73, "count"))
  {
    id v14 = [v74 count];
    id v15 = [v73 count];
    if (v14 == v15)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
      unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v71 guid]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v17 messageWithGUID:v18]);

      if (v19)
      {
        objc_msgSend(v19, "setFlags:", (unint64_t)objc_msgSend(v19, "flags") | 0x800000000);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        id v71 = (id)objc_claimAutoreleasedReturnValue( [v22 storeMessage:v19 forceReplace:0 modifyError:0 modifyFlags:1 flagMask:0x800000000]);
      }

      else
      {
        id v71 = 0LL;
      }

      if (IMOSLoggingEnabled(v20, v21))
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory("History");
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v82 = v71;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Found message to mark as notified recipient: %@",  buf,  0xCu);
        }
      }

      v72 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      if ([v74 count])
      {
        unint64_t v27 = 0LL;
        do
        {
          int64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v74 objectAtIndex:v27]);
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v73 objectAtIndex:v27]);
          v30 = (void *)IMCopyGUIDForChat(v28, v29, v8);

          -[NSMutableSet addObject:](v72, "addObject:", v30);
          ++v27;
        }

        while (v27 < (unint64_t)[v74 count]);
      }

      if (v71)
      {
        __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        v75 = (void *)objc_claimAutoreleasedReturnValue([v31 chatForMessage:v71]);

        BOOL v32 = [v75 style] == 45;
        id v33 = [v74 count];
        if (v32)
        {
          if (v33)
          {
            unint64_t v34 = 0LL;
            do
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue([v74 objectAtIndex:v34]);
              int v36 = (void *)objc_claimAutoreleasedReturnValue([v73 objectAtIndex:v34]);
              id v37 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
              __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 chatsWithHandle:v35 onService:v36]);

              id v39 = (void *)objc_claimAutoreleasedReturnValue([v38 arrayByApplyingSelector:"guid"]);
              -[NSMutableSet addObjectsFromArray:](v72, "addObjectsFromArray:", v39);

              ++v34;
            }

            while (v34 < (unint64_t)[v74 count]);
          }
        }

        else if (v33)
        {
          unint64_t v40 = 0LL;
          do
          {
            id v41 = (void *)objc_claimAutoreleasedReturnValue([v74 objectAtIndex:v40]);
            v42 = (void *)objc_claimAutoreleasedReturnValue([v73 objectAtIndex:v40]);
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
            v44 = (void *)objc_claimAutoreleasedReturnValue([v43 chatsWithRoomname:v41 onService:v42]);

            v45 = (void *)objc_claimAutoreleasedReturnValue([v44 arrayByApplyingSelector:"guid"]);
            -[NSMutableSet addObjectsFromArray:](v72, "addObjectsFromArray:", v45);

            ++v40;
          }

          while (v40 < (unint64_t)[v74 count]);
        }

        v46 = (void *)objc_claimAutoreleasedReturnValue([v71 guid]);
        __int128 v78 = 0u;
        __int128 v79 = 0u;
        __int128 v76 = 0u;
        __int128 v77 = 0u;
        v47 = v72;
        id v48 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v76,  v80,  16LL);
        if (v48)
        {
          uint64_t v49 = *(void *)v77;
          do
          {
            v50 = 0LL;
            do
            {
              if (*(void *)v77 != v49) {
                objc_enumerationMutation(v47);
              }
              uint64_t v51 = *(void *)(*((void *)&v76 + 1) + 8LL * (void)v50);
              v52 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
              v53 = (void *)objc_claimAutoreleasedReturnValue([v52 existingChatWithGUID:v51]);

              v54 = (void *)objc_claimAutoreleasedReturnValue([v53 lastMessage]);
              v55 = (void *)objc_claimAutoreleasedReturnValue([v54 guid]);
              LODWORD(v52) = [v55 isEqualToString:v46];

              if ((_DWORD)v52)
              {
                v56 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
                [v56 updateStateForChat:v75 hintMessage:0 shouldRebuildFailedMessageDate:0];
              }

              v50 = (char *)v50 + 1;
            }

            while (v48 != v50);
            id v48 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v76,  v80,  16LL);
          }

          while (v48);
        }

        v57 = (void *)objc_claimAutoreleasedReturnValue([v71 accountID]);
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
        v59 = (void *)objc_claimAutoreleasedReturnValue([v58 sessionForAccount:v57]);

        if (IMOSLoggingEnabled(v60, v61))
        {
          uint64_t v62 = OSLogHandleForIMFoundationCategory("History");
          v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v82 = v71;
            _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_INFO,  "Sending notifiy recipient command for: %@",  buf,  0xCu);
          }
        }

        v64 = (void *)objc_claimAutoreleasedReturnValue([v75 chatIdentifier]);
        objc_msgSend( v59,  "sendNotifyRecipientCommandForMessage:toChatGuid:identifier:style:",  v71,  0,  v64,  objc_msgSend(v75, "style"));

        v65 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
        v66 = (void *)objc_claimAutoreleasedReturnValue([v65 broadcasterForChatListeners]);

        if (IMOSLoggingEnabled(v67, v68))
        {
          uint64_t v69 = OSLogHandleForIMFoundationCategory("History");
          v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v82 = v71;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "Notifying about message: %@", buf, 0xCu);
          }
        }

        [v66 account:v57 chat:0 style:0 chatProperties:0 messageUpdated:v71];
      }
    }

    else if (IMOSLoggingEnabled(v15, v16))
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v82 = v74;
        __int16 v83 = 2112;
        id v84 = v73;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Mismatched IDs and serviceNames array to notify recipient (IDs: %@   Service names: %@)",  buf,  0x16u);
      }
    }
  }
}

- (void)markSavedForMessageGUID:(id)a3
{
  id v30 = a3;
  if (IMOSLoggingEnabled(v30, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 listenerID]);
      *(_DWORD *)buf = 138412546;
      int v36 = v8;
      __int16 v37 = 2112;
      id v38 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Request from %@ to mark message as saved with GUID: %@",  buf,  0x16u);
    }
  }

  if ([v30 length])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 chatsForMessageGUID:v30]);

    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v12)
    {
      uint64_t v14 = *(void *)v32;
      *(void *)&__int128 v13 = 138412802LL;
      __int128 v29 = v13;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
          id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "chatIdentifier", v29));
          uint64_t v18 = IMSingleObjectArray();
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceName]);
          uint64_t v21 = IMSingleObjectArray();
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

          id v23 = [v22 count];
          if (v23 && (id v23 = [v19 count]) != 0)
          {
            uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
            uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 messageWithGUID:v30]);

            -[IMDaemonChatModifyReadStateRequestHandler markSavedForIDs:style:onServices:message:]( self,  "markSavedForIDs:style:onServices:message:",  v19,  [v16 style],  v22,  v26);
          }

          else if (IMOSLoggingEnabled(v23, v24))
          {
            uint64_t v27 = OSLogHandleForIMFoundationCategory("Warning");
            int64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v29;
              int v36 = v16;
              __int16 v37 = 2112;
              id v38 = v19;
              __int16 v39 = 2112;
              unint64_t v40 = v22;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "Empty IDs or services for chat: %@ (IDs: %@  Services: %@)",  buf,  0x20u);
            }
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }

      while (v12);
    }
  }
}

- (void)markSavedForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6
{
  uint64_t v8 = a4;
  id v82 = a3;
  id v81 = a5;
  id v78 = a6;
  if (IMOSLoggingEnabled(v78, v9))
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory("History");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 listenerID]);
      *(_DWORD *)buf = 138412802;
      uint64_t v90 = (uint64_t)v13;
      __int16 v91 = 2112;
      id v92 = v82;
      __int16 v93 = 2112;
      id v94 = v81;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Request from %@ to mark message as saved with IDs: %@  services: %@",  buf,  0x20u);
    }
  }

  if (objc_msgSend(v82, "count", v78) && objc_msgSend(v81, "count"))
  {
    id v14 = [v82 count];
    id v15 = [v81 count];
    if (v14 == v15)
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v79 guid]);
      if ([v17 length])
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 messageWithGUID:v17]);

        if (v19)
        {
          [v19 setExpireState:3];
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
          uint64_t v80 = objc_claimAutoreleasedReturnValue( [v22 storeMessage:v19 forceReplace:0 modifyError:1 modifyFlags:0 flagMask:0]);

          if (IMOSLoggingEnabled(v23, v24))
          {
            uint64_t v25 = OSLogHandleForIMFoundationCategory("History");
            uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = v80;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "Found message to mark as saved: %@",  buf,  0xCu);
            }
          }

          uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          if ([v82 count])
          {
            unint64_t v28 = 0LL;
            do
            {
              __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectAtIndex:", v28, v80));
              id v30 = (void *)objc_claimAutoreleasedReturnValue([v81 objectAtIndex:v28]);
              __int128 v31 = (void *)IMCopyGUIDForChat(v29, v30, v8);

              -[NSMutableSet addObject:](v27, "addObject:", v31);
              ++v28;
            }

            while (v28 < (unint64_t)[v82 count]);
          }

          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance", v80));
          __int16 v83 = (void *)objc_claimAutoreleasedReturnValue([v32 chatForMessage:v79]);

          BOOL v33 = [v83 style] == 45;
          id v34 = [v82 count];
          if (v33)
          {
            if (v34)
            {
              unint64_t v35 = 0LL;
              do
              {
                int v36 = (void *)objc_claimAutoreleasedReturnValue([v82 objectAtIndex:v35]);
                __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v81 objectAtIndex:v35]);
                id v38 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
                __int16 v39 = (void *)objc_claimAutoreleasedReturnValue([v38 chatsWithHandle:v36 onService:v37]);

                unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue([v39 arrayByApplyingSelector:"guid"]);
                -[NSMutableSet addObjectsFromArray:](v27, "addObjectsFromArray:", v40);

                ++v35;
              }

              while (v35 < (unint64_t)[v82 count]);
            }
          }

          else if (v34)
          {
            unint64_t v47 = 0LL;
            do
            {
              id v48 = (void *)objc_claimAutoreleasedReturnValue([v82 objectAtIndex:v47]);
              uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v81 objectAtIndex:v47]);
              v50 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatStore sharedInstance](&OBJC_CLASS___IMDChatStore, "sharedInstance"));
              uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v50 chatsWithRoomname:v48 onService:v49]);

              v52 = (void *)objc_claimAutoreleasedReturnValue([v51 arrayByApplyingSelector:"guid"]);
              -[NSMutableSet addObjectsFromArray:](v27, "addObjectsFromArray:", v52);

              ++v47;
            }

            while (v47 < (unint64_t)[v82 count]);
          }

          __int128 v86 = 0u;
          __int128 v87 = 0u;
          __int128 v84 = 0u;
          __int128 v85 = 0u;
          v53 = v27;
          id v54 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v84,  v88,  16LL);
          if (v54)
          {
            uint64_t v55 = *(void *)v85;
            do
            {
              v56 = 0LL;
              do
              {
                if (*(void *)v85 != v55) {
                  objc_enumerationMutation(v53);
                }
                uint64_t v57 = *(void *)(*((void *)&v84 + 1) + 8LL * (void)v56);
                v58 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
                v59 = (void *)objc_claimAutoreleasedReturnValue([v58 existingChatWithGUID:v57]);

                uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v59 lastMessage]);
                uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue([v60 guid]);
                unsigned int v62 = [v61 isEqualToString:v17];

                if (v62)
                {
                  v63 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
                  [v63 updateStateForChat:v83 hintMessage:0 shouldRebuildFailedMessageDate:0];
                }

                v56 = (char *)v56 + 1;
              }

              while (v54 != v56);
              id v54 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v53,  "countByEnumeratingWithState:objects:count:",  &v84,  v88,  16LL);
            }

            while (v54);
          }

          v64 = (void *)objc_claimAutoreleasedReturnValue([v79 accountID]);
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
          v66 = (void *)objc_claimAutoreleasedReturnValue([v65 sessionForAccount:v64]);

          if (IMOSLoggingEnabled(v67, v68))
          {
            uint64_t v69 = OSLogHandleForIMFoundationCategory("History");
            v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = (uint64_t)v79;
              _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_INFO,  "Sending saved receipt for: %@",  buf,  0xCu);
            }
          }

          id v71 = (void *)objc_claimAutoreleasedReturnValue([v83 chatIdentifier]);
          objc_msgSend( v66,  "sendSavedReceiptForMessage:toChatID:identifier:style:",  v79,  0,  v71,  objc_msgSend(v83, "style"));

          v72 = (void *)objc_claimAutoreleasedReturnValue( +[IMDBroadcastController sharedProvider]( &OBJC_CLASS___IMDBroadcastController,  "sharedProvider"));
          id v73 = (void *)objc_claimAutoreleasedReturnValue([v72 broadcasterForChatListeners]);

          if (IMOSLoggingEnabled(v74, v75))
          {
            uint64_t v76 = OSLogHandleForIMFoundationCategory("History");
            __int128 v77 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = (uint64_t)v79;
              _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Notifying about message: %@", buf, 0xCu);
            }
          }

          [v73 account:v64 chat:0 style:0 chatProperties:0 messageUpdated:v79];
        }

        else
        {
          if (IMOSLoggingEnabled(v20, v21))
          {
            uint64_t v45 = OSLogHandleForIMFoundationCategory("History");
            v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = (uint64_t)v17;
              _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_INFO,  "No message found for message guid: %@",  buf,  0xCu);
            }
          }

          __int128 v79 = 0LL;
        }
      }

      else
      {
        uint64_t v43 = IMLogHandleForCategory("History");
        v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_100042414((uint64_t)v79, v44);
        }
      }
    }

    else if (IMOSLoggingEnabled(v15, v16))
    {
      uint64_t v41 = OSLogHandleForIMFoundationCategory("Warning");
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v90 = (uint64_t)v82;
        __int16 v91 = 2112;
        id v92 = v81;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "Mismatched IDs and serviceNames array to mark as saved (IDs: %@   Service names: %@)",  buf,  0x16u);
      }
    }
  }
}

@end