@interface IMDaemonChatRequestHandler
- (id)_chatDictionariesWithLastMessageRecordDateFromDictionaries:(id)a3;
- (id)_chatsWithIsBlackholed:(BOOL)a3 inChats:(id)a4;
- (void)_loadChat:(id)a3 completionHandler:(id)a4;
- (void)_loadChats:(id)a3 completionHandler:(id)a4;
- (void)_updateMessage:(id)a3;
- (void)chat:(id)a3 updateDisplayName:(id)a4 messageID:(id)a5;
- (void)chat:(id)a3 updateIsBlackholed:(BOOL)a4;
- (void)chat:(id)a3 updateIsDeletingIncomingMessages:(BOOL)a4;
- (void)chat:(id)a3 updateIsFiltered:(int64_t)a4;
- (void)chat:(id)a3 updateIsRecovered:(BOOL)a4;
- (void)chat:(id)a3 updateLastAddressHandle:(id)a4;
- (void)chat:(id)a3 updateLastAddressedSIMID:(id)a4;
- (void)chat:(id)a3 updateLastKnownHybridState:(BOOL)a4;
- (void)chat:(id)a3 updateProperties:(id)a4;
- (void)closeSessionChatID:(id)a3 identifier:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)declineInvitationToChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)dismissNotice:(id)a3;
- (void)fetchCollaborationNoticesForChatGUID:(id)a3 reply:(id)a4;
- (void)fetchCommonCapabilities:(id)a3 fromChatWithGUID:(id)a4 reply:(id)a5;
- (void)leaveChatID:(id)a3 style:(unsigned __int8)a4 account:(id)a5;
- (void)loadAllChats;
- (void)loadAnyChatsContainingHandleIDsIn:(id)a3 reply:(id)a4;
- (void)loadChatWithChatIdentifier:(id)a3;
- (void)loadChatWithGUID:(id)a3 queryID:(id)a4;
- (void)loadChatWithGUID:(id)a3 reply:(id)a4;
- (void)loadChatsFilteredUsingPredicate:(id)a3 lastMessageOlderThan:(id)a4 limit:(int64_t)a5 queryID:(id)a6;
- (void)loadChatsFilteredUsingPredicate:(id)a3 lastMessageOlderThan:(id)a4 limit:(int64_t)a5 reply:(id)a6;
- (void)loadChatsFilteredUsingPredicate:(id)a3 queryID:(id)a4;
- (void)loadChatsFilteredUsingPredicate:(id)a3 reply:(id)a4;
- (void)loadChatsWithGroupID:(id)a3 queryID:(id)a4;
- (void)loadChatsWithGroupID:(id)a3 reply:(id)a4;
- (void)loadChatsWithHandleIDs:(id)a3 groupID:(id)a4 displayName:(id)a5 style:(unsigned __int8)a6 queryID:(id)a7;
- (void)loadChatsWithHandleIDs:(id)a3 groupID:(id)a4 displayName:(id)a5 style:(unsigned __int8)a6 reply:(id)a7;
- (void)loadChatsWithIdentifier:(id)a3 queryID:(id)a4;
- (void)loadChatsWithIdentifier:(id)a3 reply:(id)a4;
- (void)loadChatsWithPinningIdentifier:(id)a3 reply:(id)a4;
- (void)markChatsAsReadFilteredUsingPredicate:(id)a3;
- (void)markMessageAsCorrupt:(id)a3 setCorrupt:(BOOL)a4;
- (void)markRepliedForMessageGUID:(id)a3;
- (void)recoverChatsFromJunkContainingMessageWithGUID:(id)a3;
- (void)removeChat:(id)a3;
- (void)removeChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)requestPendingMessages;
- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6;
- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 account:(id)a6;
- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 account:(id)a6 toChatID:(id)a7 identifier:(id)a8 style:(unsigned __int8)a9;
- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendStickerAtPath:(id)a3 toChatID:(id)a4 forNBubbleFromTheBottom:(int64_t)a5 atX:(id)a6 atY:(id)a7 scale:(id)a8 balloonWidth:(id)a9;
- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4;
- (void)setProperties:(id)a3 ofParticipant:(id)a4 inChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8;
- (void)storeItem:(id)a3 inChatGUID:(id)a4;
- (void)unblackholeAndLoadChatWithHandleIDs:(id)a3 reply:(id)a4;
- (void)unreadCountWithCompletion:(id)a3;
- (void)updateBalloonPayload:(id)a3 attachments:(id)a4 forMessageGUID:(id)a5;
- (void)updateMessage:(id)a3;
- (void)updateMessage:(id)a3 withIndexesOfDeletedItems:(id)a4 withIndexToRangeMapOfDeletedItems:(id)a5 deleteDate:(id)a6;
- (void)updateNotice:(id)a3;
@end

@implementation IMDaemonChatRequestHandler

- (void)storeItem:(id)a3 inChatGUID:(id)a4
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
      int v14 = 138412802;
      v15 = v11;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Request from %@ to store item: %@  inChatGUID: %@",  (uint8_t *)&v14,  0x20u);
    }
  }

  uint64_t v12 = IMSingleObjectArray(v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  sub_100019808(v13, v6, 0LL);
}

- (void)markMessageAsCorrupt:(id)a3 setCorrupt:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (__CFString *)a3;
  if (IMOSLoggingEnabled(v5, v6))
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 listenerID]);
      v11 = @"NO";
      *(_DWORD *)buf = 138412802;
      v31 = v10;
      __int16 v32 = 2112;
      if (v4) {
        v11 = @"YES";
      }
      v33 = v5;
      __int16 v34 = 2112;
      v35 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Request from %@ to mark message with IDs as corrupt: %@ setCorrupt: %@",  buf,  0x20u);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 messageWithGUID:v5 registerAttachments:0]);

  if (v13)
  {
    unint64_t v16 = (unint64_t)[v13 flags];
    id v17 = [v13 isCorrupt];
    if (v4)
    {
      if ((v17 & 1) == 0)
      {
        unint64_t v19 = v16 | 0x4000000;
LABEL_17:
        [v13 setFlags:v19];
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
        LOBYTE(v29) = 0;
        id v23 =  [v22 storeMessage:v13 forceReplace:1 modifyError:0 modifyFlags:1 flagMask:0 updateMessageCache:0 calculateUnreadCount:v29];

        goto LABEL_27;
      }
    }

    else if ((_DWORD)v17)
    {
      unint64_t v19 = v16 & 0xFFFFFFFFFBFFFFFFLL;
      goto LABEL_17;
    }

    if (IMOSLoggingEnabled(v17, v18))
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory("Warning");
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        unsigned int v26 = [v13 isCorrupt];
        v27 = @"NO";
        if (v26) {
          v28 = @"YES";
        }
        else {
          v28 = @"NO";
        }
        if (v4) {
          v27 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v31 = v28;
        __int16 v32 = 2112;
        v33 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Tried to mark a message as corrupt whose value already matched what we wanted to set it to {[messageItem isCor rupt]: %@ value to set isCorrupt %@",  buf,  0x16u);
      }
    }
  }

  else if (IMOSLoggingEnabled(v14, v15))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "We didn't have a message to mark as corrupt for guid %@ ",  buf,  0xCu);
    }
  }

- (void)removeChat:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 existingChatWithGUID:v3]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
  unsigned int v7 = [v6 isEqualToString:IMServiceNameSMS];

  if (v7) {
    uint64_t v8 = IMGreenTeaMessageDeleteLog();
  }
  uint64_t v10 = IMOSLoggingEnabled(v8, v9);
  if ((_DWORD)v10)
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory("Chat");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v3;
      __int16 v41 = 2112;
      v42 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Remove guid: %@  chat: %@", buf, 0x16u);
    }
  }

  int v14 = IMOSLoggingEnabled(v10, v11);
  if (v5)
  {
    if (v14)
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory("Chat");
      unint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v5;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Removing chat from registry: %@", buf, 0xCu);
      }
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
    unsigned int v18 = [v17 isEqualToString:IMServiceNameSMS];

    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
    uint64_t v20 = v19;
    v21 = &IMServiceNameiMessage;
    if (v18) {
      v21 = &IMServiceNameSMS;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:*v21]);

    v38[0] = v3;
    v37[0] = IMDCommandChatGUIDKey;
    v37[1] = IMDCommandChatGroupIDKey;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v5 groupID]);
    v38[1] = v23;
    v37[2] = IMDCommandChatParticipantsKey;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 participantHandles]);
    v38[2] = v24;
    v37[3] = IMDChatWasReportedAsJunkKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v5 wasReportedAsJunk]));
    v38[3] = v25;
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  4LL));

    __int16 v34 = v26;
    v35[0] = IMDPermanentDeleteCommandChatMetadataArrayKey;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
    v35[1] = IMDDeleteCommandIsPermanentDeleteKey;
    v36[0] = v27;
    v36[1] = &__kCFBooleanTrue;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  2LL));

    [v22 sendDeleteCommand:v28 forChatGUID:v3];
    [v22 willRemoveChat:v5];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    [v29 removeChat:v5];

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    v31 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v30,  "broadcasterForChatListenersUsingBlackholeRegistry:",  objc_msgSend(v5, "isBlackholed")));
    [v31 leftChat:v3];
  }

  else if (v14)
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory("Chat");
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v3;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "No chat found for GUID: %@", buf, 0xCu);
    }
  }
}

- (void)chat:(id)a3 updateDisplayName:(id)a4 messageID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 existingChatWithGUID:v7]);

  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Chat");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v22 = v7;
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Chat Identifier: %@  Chat: %@  Update display name: %@",  buf,  0x20u);
    }
  }

  if (v11)
  {
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 displayName]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 lastAddressedLocalHandle]);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceSession]);
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 guid]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v11 chatIdentifier]);
    objc_msgSend( v18,  "updateDisplayName:fromDisplayName:fromID:forChatID:identifier:style:messageID:",  v8,  v16,  v17,  v19,  v20,  objc_msgSend(v11, "style"),  v9);
  }
}

- (void)chat:(id)a3 updateIsFiltered:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 existingChatWithGUID:v5]);

  if (v7)
  {
    id v10 = [v7 unreadCount];
    if (IMOSLoggingEnabled(v10, v11))
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory("Chat");
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = @"YES";
        *(_DWORD *)unsigned int v18 = 67109890;
        *(_DWORD *)&v18[4] = a4;
        if (!v10) {
          uint64_t v14 = @"NO";
        }
        *(_WORD *)&v18[8] = 2112;
        *(void *)&v18[10] = v14;
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Updating isFiltered to %d (recalculate unread: %@) for chat: %@: %@",  v18,  0x26u);
      }
    }

    objc_msgSend(v7, "updateIsFiltered:", a4, *(void *)v18);
    if (v10)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
      [v15 updateStateForChat:v7 forcePost:1 shouldRebuildFailedMessageDate:0 shouldCalculateUnreadCount:1];
    }
  }

  else if (IMOSLoggingEnabled(v8, v9))
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory("Chat");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned int v18 = 138412290;
      *(void *)&v18[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "No chat found for GUID: %@", v18, 0xCu);
    }
  }
}

- (void)chat:(id)a3 updateIsBlackholed:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 existingChatWithGUID:v5]);

  int v10 = IMOSLoggingEnabled(v8, v9);
  if (v7)
  {
    if (v10)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("Chat");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = @"NO";
        *(_DWORD *)uint64_t v16 = 138412802;
        if (v4) {
          uint64_t v13 = @"YES";
        }
        *(void *)&v16[4] = v13;
        __int16 v17 = 2112;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Updating isBlackholed to %@ chat from for chat: %@: %@",  v16,  0x20u);
      }
    }

    objc_msgSend(v7, "updateIsBlackholed:", v4, *(void *)v16);
  }

  else if (v10)
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Chat");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v16 = 138412290;
      *(void *)&v16[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No chat found for GUID: %@", v16, 0xCu);
    }
  }
}

- (void)chat:(id)a3 updateIsRecovered:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 existingChatWithGUID:v5]);

  int v10 = IMOSLoggingEnabled(v8, v9);
  if (v7)
  {
    if (v10)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("Chat");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = @"NO";
        *(_DWORD *)uint64_t v16 = 138412802;
        if (v4) {
          uint64_t v13 = @"YES";
        }
        *(void *)&v16[4] = v13;
        __int16 v17 = 2112;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Updating isRecovered to %@ chat from for chat: %@: %@",  v16,  0x20u);
      }
    }

    objc_msgSend(v7, "updateIsRecovered:", v4, *(void *)v16);
  }

  else if (v10)
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Chat");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v16 = 138412290;
      *(void *)&v16[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No chat found for GUID: %@", v16, 0xCu);
    }
  }
}

- (void)chat:(id)a3 updateLastKnownHybridState:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 existingChatWithGUID:v5]);

  int v10 = IMOSLoggingEnabled(v8, v9);
  if (v7)
  {
    if (v10)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("Chat");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = @"NO";
        *(_DWORD *)uint64_t v16 = 136315650;
        *(void *)&v16[4] = "-[IMDaemonChatRequestHandler chat:updateLastKnownHybridState:]";
        *(_WORD *)&_BYTE v16[12] = 2112;
        *(void *)&v16[14] = v5;
        if (v4) {
          uint64_t v13 = @"YES";
        }
        *(_WORD *)&v16[22] = 2112;
        __int16 v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ %@", v16, 0x20u);
      }
    }

    objc_msgSend(v7, "updateLastKnownHybridStateAndRemergeIfAppropriate:", v4, *(_OWORD *)v16, *(void *)&v16[16]);
  }

  else if (v10)
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Chat");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v16 = 136315394;
      *(void *)&v16[4] = "-[IMDaemonChatRequestHandler chat:updateLastKnownHybridState:]";
      *(_WORD *)&_BYTE v16[12] = 2112;
      *(void *)&v16[14] = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s No chat found for GUID: %@", v16, 0x16u);
    }
  }
}

- (void)chat:(id)a3 updateIsDeletingIncomingMessages:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 existingChatWithGUID:v5]);

  int v10 = IMOSLoggingEnabled(v8, v9);
  if (v7)
  {
    if (v10)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory("Chat");
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = @"NO";
        *(_DWORD *)uint64_t v16 = 138412802;
        if (v4) {
          uint64_t v13 = @"YES";
        }
        *(void *)&v16[4] = v13;
        __int16 v17 = 2112;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Updating isDeletingIncomingMessages to %@ chat from for chat: %@: %@",  v16,  0x20u);
      }
    }

    objc_msgSend(v7, "updateIsDeletingIncomingMessages:", v4, *(void *)v16);
  }

  else if (v10)
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("Chat");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v16 = 138412290;
      *(void *)&v16[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No chat found for GUID: %@", v16, 0xCu);
    }
  }
}

- (void)chat:(id)a3 updateProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 existingChatWithGUID:v5]);

  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Chat");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412802;
      id v17 = v5;
      __int16 v18 = 2112;
      __int16 v19 = v8;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Chat Identifier: %@  Chat: %@  Update properties: %@",  (uint8_t *)&v16,  0x20u);
    }
  }

  if (v8 && [v6 count])
  {
    [v8 updateProperties:v6];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "broadcasterForChatListenersUsingBlackholeRegistry:",  objc_msgSend(v8, "isBlackholed")));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 properties]);
    [v14 chat:v5 propertiesUpdated:v15];
  }
}

- (void)chat:(id)a3 updateLastAddressHandle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 existingChatWithGUID:v5]);

  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Chat");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412802;
      id v16 = v5;
      __int16 v17 = 2112;
      __int16 v18 = v8;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Chat Identifier: %@  Chat: %@  Update last addressed handle: %@",  (uint8_t *)&v15,  0x20u);
    }
  }

  if (v8)
  {
    [v8 updateLastAddressedHandle:v6];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "broadcasterForChatListenersUsingBlackholeRegistry:",  objc_msgSend(v8, "isBlackholed")));
    [v14 chat:v5 lastAddressedHandleUpdated:v6];
  }
}

- (void)chat:(id)a3 updateLastAddressedSIMID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 existingChatWithGUID:v5]);

  if (IMOSLoggingEnabled(v9, v10))
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory("Chat");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412802;
      id v16 = v5;
      __int16 v17 = 2112;
      __int16 v18 = v8;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Chat Identifier: %@  Chat: %@  Update last addressed unique ID: %@",  (uint8_t *)&v15,  0x20u);
    }
  }

  if (v8)
  {
    [v8 updateLastAddressedSIMID:v6];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "broadcasterForChatListenersUsingBlackholeRegistry:",  objc_msgSend(v8, "isBlackholed")));
    [v14 chat:v5 lastAddressedSIMIDUpdated:v6];
  }
}

- (void)updateMessage:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled(v4, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("History");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 listenerID]);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Request from %@ to update messages: %@",  (uint8_t *)&v10,  0x16u);
    }
  }

  -[IMDaemonChatRequestHandler _updateMessage:](self, "_updateMessage:", v4);
}

- (void)_updateMessage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 guid]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 messageWithGUID:v5]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 guid]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 chatForMessageGUID:v8]);

  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceName]);
  LODWORD(v8) = [v10 isEqualToString:IMServiceNameSMS];

  if ((_DWORD)v8) {
    IMGreenTeaMessageDeleteLog();
  }
  if (v6)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    LOBYTE(v22) = 1;
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 storeMessage:v3 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:1638400 updateMessageCache:1 calculateUnreadCount:v22]);

    id v13 = [v12 isEqual:v3];
    int v14 = (int)v13;
    if (IMOSLoggingEnabled(v13, v15))
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory("History");
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = @"YES";
        if (v14) {
          __int16 v18 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v12;
        __int16 v25 = 2112;
        id v26 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "   updated message: %@   changed? %@",  buf,  0x16u);
      }
    }

    if ((v14 & 1) == 0)
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 broadcasterForChatListeners]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 accountID]);
      [v20 account:v21 chat:0 style:0 chatProperties:0 messageUpdated:v12];
    }
  }
}

- (void)updateMessage:(id)a3 withIndexesOfDeletedItems:(id)a4 withIndexToRangeMapOfDeletedItems:(id)a5 deleteDate:(id)a6
{
  uint64_t v9 = (__CFString *)a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 listenerID]);
      *(_DWORD *)buf = 138412546;
      id v57 = v17;
      __int16 v58 = 2112;
      v59 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Request from %@ to update messages: %@",  buf,  0x16u);
    }
  }

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString guid](v9, "guid"));
  id v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v18 messageWithGUID:v19]);

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString guid](v9, "guid"));
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v21 chatForMessageGUID:v22]);

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 serviceName]);
  LODWORD(v22) = [v24 isEqualToString:IMServiceNameSMS];

  if ((_DWORD)v22) {
    IMGreenTeaMessageDeleteLog();
  }
  if (v20)
  {
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    LOBYTE(v51) = 1;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( [v25 storeMessage:v9 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:1638400 updateMessageCache:1 calculateUnreadCount:v51]);

    id v27 = [v26 isEqual:v9];
    int v28 = (int)v27;
    if (IMOSLoggingEnabled(v27, v29))
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory("History");
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = @"YES";
        if (v28) {
          uint64_t v32 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        id v57 = v26;
        __int16 v58 = 2112;
        v59 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "   updated message: %@   hasChanged? %@",  buf,  0x16u);
      }
    }

    if ((v28 & 1) == 0)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
      __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 broadcasterForChatListeners]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v26 accountID]);
      [v34 account:v35 chat:0 style:0 chatProperties:0 messageUpdated:v26];

      if (v10)
      {
        id v36 = [v10 count];
        if (v36)
        {
          if (v12)
          {
            if (IMOSLoggingEnabled(v36, v37))
            {
              uint64_t v38 = OSLogHandleForIMFoundationCategory("Chat");
              v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v57 = v11;
                __int16 v58 = 2112;
                v59 = v20;
                _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "Recently Deleted | Recoverably deleting indexes %@ from message: %@",  buf,  0x16u);
              }
            }

            id v40 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString body](v20, "body"));
            v52[0] = _NSConcreteStackBlock;
            v52[1] = 3221225472LL;
            v52[2] = sub_100009C64;
            v52[3] = &unk_1000653A8;
            id v53 = v10;
            v54 = v20;
            id v55 = v12;
            objc_msgSend(v40, "__im_visitMessageParts:", v52);
          }

          if (IMOSLoggingEnabled(v36, v37))
          {
            uint64_t v41 = OSLogHandleForIMFoundationCategory("Chat");
            v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v57 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "Sending delete-parts command to other devices: %@",  buf,  0xCu);
            }
          }

          v43 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString guid](v9, "guid"));
          v44 = (void *)objc_claimAutoreleasedReturnValue( +[IMDDeletePartsHelper _makeDeletePartsDictFor:withIndexes:withIndexToRangeMap:deleteDate:]( &OBJC_CLASS___IMDDeletePartsHelper,  "_makeDeletePartsDictFor:withIndexes:withIndexToRangeMap:deleteDate:",  v43,  v10,  v11,  v12));

          v45 = (void *)objc_claimAutoreleasedReturnValue([v23 serviceName]);
          LODWORD(v43) = [v45 isEqualToString:IMServiceNameSMS];

          v46 = (void *)objc_claimAutoreleasedReturnValue(+[IMDAccountController sharedInstance](&OBJC_CLASS___IMDAccountController, "sharedInstance"));
          v47 = v46;
          v48 = &IMServiceNameiMessage;
          if ((_DWORD)v43) {
            v48 = &IMServiceNameSMS;
          }
          v49 = (void *)objc_claimAutoreleasedReturnValue([v46 anySessionForServiceName:*v48]);

          v50 = (void *)objc_claimAutoreleasedReturnValue([v23 guid]);
          [v49 sendDeleteCommand:v44 forChatGUID:v50];
        }
      }
    }
  }
}

- (void)markRepliedForMessageGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled(v3, v4))
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory("History");
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 listenerID]);
      *(_DWORD *)buf = 138412546;
      uint64_t v41 = v8;
      __int16 v42 = 2112;
      id v43 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Request from %@ to mark message as replied with GUID: %@",  buf,  0x16u);
    }
  }

  if ([v3 length])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 chatsForMessageGUID:v3]);

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v12)
    {
      uint64_t v14 = *(void *)v37;
      uint64_t v35 = IMChipListCharacterString;
      *(void *)&__int128 v13 = 138412802LL;
      __int128 v33 = v13;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "serviceName", v33));
          if (v17)
          {
            __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 chatIdentifier]);
            BOOL v19 = v18 == 0LL;

            if (!v19)
            {
              id v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 messageWithGUID:v3]);

              if (v21)
              {
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v21 body]);
                __int16 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 string]);
                id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "substringFromIndex:", (char *)objc_msgSend(v24, "length") - 1));
                unsigned int v27 = [v26 isEqualToString:v35];

                if (v27)
                {
                  id v28 = [v21 copyAsReplied];
                  -[IMDaemonChatRequestHandler updateMessage:](self, "updateMessage:", v28);
                }
              }

              else if (IMOSLoggingEnabled(v22, v23))
              {
                uint64_t v29 = OSLogHandleForIMFoundationCategory("Warning");
                uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  id v31 = (id)objc_claimAutoreleasedReturnValue([v16 chatIdentifier]);
                  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v16 serviceName]);
                  *(_DWORD *)buf = v33;
                  uint64_t v41 = v16;
                  __int16 v42 = 2112;
                  id v43 = v31;
                  __int16 v44 = 2112;
                  v45 = v32;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Empty ID or service for chat: %@ (ID: %@  Service: %@)",  buf,  0x20u);
                }
              }
            }
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }

      while (v12);
    }
  }
}

- (void)requestPendingMessages
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("History");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Request for pending messages no longer supported",  v4,  2u);
    }
  }

- (id)_chatsWithIsBlackholed:(BOOL)a3 inChats:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
      }

      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }

    while (v8);
  }

  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("ChatLoading");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [v7 count];
      id v17 = -[NSMutableArray count](v6, "count");
      __int16 v18 = @"NO";
      *(_DWORD *)buf = 134218498;
      id v25 = v16;
      if (v4) {
        __int16 v18 = @"YES";
      }
      __int16 v26 = 2048;
      id v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Filtered %llu chats to %llu with isBlackholed: %@",  buf,  0x20u);
    }
  }

  return v6;
}

- (void)_loadChat:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v10 = v6;
    id v8 = a4;
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    -[IMDaemonChatRequestHandler _loadChats:completionHandler:](self, "_loadChats:completionHandler:", v9, v8, v10);
  }

  else
  {
    id v9 = a4;
    -[IMDaemonChatRequestHandler _loadChats:completionHandler:]( self,  "_loadChats:completionHandler:",  &__NSArray0__struct,  v9);
  }
}

- (void)_loadChats:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  unint64_t v9 = (unint64_t)[v8 capabilities];
  int v10 = v9;
  uint64_t v11 = (v9 >> 26) & 1;

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[IMDaemonChatRequestHandler _chatsWithIsBlackholed:inChats:]( self,  "_chatsWithIsBlackholed:inChats:",  v11,  v6));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 _chatInfoForChats:v12]);

  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("ChatLoading");
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [v12 count];
      __int128 v20 = @"NO";
      if ((v10 & 0x4000000) != 0) {
        __int128 v20 = @"YES";
      }
      int v21 = 134218242;
      id v22 = v19;
      __int16 v23 = 2112;
      uint64_t v24 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Prepared %llu loaded chats (blackholed: %@)",  (uint8_t *)&v21,  0x16u);
    }
  }

  if (v7) {
    v7[2](v7, v14);
  }
}

- (void)loadChatWithChatIdentifier:(id)a3
{
  id v3 = a3;
  id v5 = (id)IMOSLoggingEnabled(v3, v4);
  if ((_DWORD)v5)
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory("ChatLoading");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Request to load chat with identifier %@",  buf,  0xCu);
    }
  }

  if (v3 && (id v5 = [v3 length]) != 0)
  {
    if (IMOSLoggingEnabled(v5, v6))
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory("ChatLoading");
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[IMDClientRequestContext currentContext]( &OBJC_CLASS___IMDClientRequestContext,  "currentContext"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 listenerID]);
        *(_DWORD *)buf = 138412290;
        id v33 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Request from listener %@", buf, 0xCu);
      }
    }

    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance", 0LL));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 chats]);

    id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 chatIdentifier]);
          if ([v20 isEqualToIgnoringCase:v3])
          {
            int v21 = (void *)objc_claimAutoreleasedReturnValue([v19 dictionaryRepresentationIncludingLastMessage]);
            if (v21) {
              BOOL v22 = v13 != 0LL;
            }
            else {
              BOOL v22 = 0;
            }
            if (v22) {
              CFArrayAppendValue((CFMutableArrayRef)v13, v21);
            }
          }
        }

        id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v16);
    }

    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 replyProxy]);
    [v24 chatLoadedWithChatIdentifier:v3 chats:v13];
  }

  else if (IMOSLoggingEnabled(v5, v6))
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory("ChatLoading");
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Invalid chat identifier. Bailing!", buf, 2u);
    }
  }
}

- (void)loadAllChats
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 _allChatInfo]);

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 broadcasterForChatListeners]);
  [v4 loadedChats:v5];
}

- (void)loadChatWithGUID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("ChatLoading");
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Request to load chat with guid: %@",  (uint8_t *)&v13,  0xCu);
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 existingChatWithGUID:v6]);

  -[IMDaemonChatRequestHandler _loadChat:completionHandler:](self, "_loadChat:completionHandler:", v12, v7);
}

- (void)loadChatWithGUID:(id)a3 queryID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyProxy]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000AC00;
  v12[3] = &unk_1000653D0;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  -[IMDaemonChatRequestHandler loadChatWithGUID:reply:](self, "loadChatWithGUID:reply:", v7, v12);
}

- (void)loadChatsFilteredUsingPredicate:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("ChatLoading");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = @"YES";
      if (!v6) {
        id v11 = @"NO";
      }
      int v14 = 138412290;
      uint64_t v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Request to load chats with predicate: %@",  (uint8_t *)&v14,  0xCu);
    }
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 existingChatsFilteredUsingPredicate:v6]);

  -[IMDaemonChatRequestHandler _loadChats:completionHandler:](self, "_loadChats:completionHandler:", v13, v7);
}

- (void)loadChatsFilteredUsingPredicate:(id)a3 queryID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyProxy]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000AE34;
  v12[3] = &unk_1000653D0;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  -[IMDaemonChatRequestHandler loadChatsFilteredUsingPredicate:reply:]( self,  "loadChatsFilteredUsingPredicate:reply:",  v7,  v12);
}

- (void)loadChatsFilteredUsingPredicate:(id)a3 lastMessageOlderThan:(id)a4 limit:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (IMOSLoggingEnabled(v12, v13))
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory("ChatLoading");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = @"YES";
      *(_DWORD *)buf = 138412802;
      if (!v10) {
        id v16 = @"NO";
      }
      __int16 v23 = v16;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2048;
      int64_t v27 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "Request to load chats with predicate: %@ older than: %@ limit: %llu",  buf,  0x20u);
    }
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 existingChatsFilteredUsingPredicate:v10 sortedUsingLastMessageDateAscending:0 olderThan:v11 limit:a5]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000B00C;
  v20[3] = &unk_1000653F8;
  v20[4] = self;
  id v21 = v12;
  id v19 = v12;
  -[IMDaemonChatRequestHandler _loadChats:completionHandler:](self, "_loadChats:completionHandler:", v18, v20);
}

- (id)_chatDictionariesWithLastMessageRecordDateFromDictionaries:(id)a3
{
  id v3 = a3;
  uint64_t v4 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v3 count]);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    uint64_t v8 = IMMessagePropertyDate;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v11 = [v10 mutableCopy];
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"guid"]);
        if ([v12 length])
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v8,  0LL));
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDDatabase synchronousDatabase](&OBJC_CLASS___IMDDatabase, "synchronousDatabase"));
          __int16 v24 = v13;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v24,  1LL));
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472LL;
          v18[2] = sub_10000B28C;
          v18[3] = &unk_100065420;
          id v19 = v11;
          [v14 fetchMessageRecordsForChatRecordWithGUID:v12 filteredUsingPredicate:0 sortedUsingDescriptors:v15 limit:1 completionHandler:v18];
        }

        -[NSMutableArray addObject:](v4, "addObject:", v11);
      }

      id v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v6);
  }

  return v4;
}

- (void)loadChatsFilteredUsingPredicate:(id)a3 lastMessageOlderThan:(id)a4 limit:(int64_t)a5 queryID:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 replyProxy]);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000B3EC;
  v17[3] = &unk_1000653D0;
  id v18 = v14;
  id v19 = v10;
  id v15 = v10;
  id v16 = v14;
  -[IMDaemonChatRequestHandler loadChatsFilteredUsingPredicate:lastMessageOlderThan:limit:reply:]( self,  "loadChatsFilteredUsingPredicate:lastMessageOlderThan:limit:reply:",  v12,  v11,  a5,  v17);
}

- (void)loadChatsWithIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("ChatLoading");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Request to load chats with identifier: %@",  (uint8_t *)&v13,  0xCu);
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allExistingChatsWithIdentifier:v6]);

  -[IMDaemonChatRequestHandler _loadChats:completionHandler:](self, "_loadChats:completionHandler:", v12, v7);
}

- (void)loadChatsWithIdentifier:(id)a3 queryID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyProxy]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000B608;
  v12[3] = &unk_1000653D0;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  -[IMDaemonChatRequestHandler loadChatsWithIdentifier:reply:](self, "loadChatsWithIdentifier:reply:", v7, v12);
}

- (void)loadChatsWithGroupID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled(v7, v8))
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory("ChatLoading");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Request to load chats with groupID: %@",  (uint8_t *)&v13,  0xCu);
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 existingChatsWithGroupID:v6]);

  -[IMDaemonChatRequestHandler _loadChats:completionHandler:](self, "_loadChats:completionHandler:", v12, v7);
}

- (void)loadChatsWithGroupID:(id)a3 queryID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 replyProxy]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000B824;
  v12[3] = &unk_1000653D0;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  -[IMDaemonChatRequestHandler loadChatsWithGroupID:reply:](self, "loadChatsWithGroupID:reply:", v7, v12);
}

- (void)loadChatsWithHandleIDs:(id)a3 groupID:(id)a4 displayName:(id)a5 style:(unsigned __int8)a6 reply:(id)a7
{
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("ChatLoading");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v21 = 138413058;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v14;
      __int16 v25 = 1024;
      int v26 = (char)v8;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Request to load chats with groupID: %@ displayName: %@ style: %c handles: %@",  (uint8_t *)&v21,  0x26u);
    }
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 existingChatsForIDs:v12 displayName:v14 groupID:v13 style:v8]);

  -[IMDaemonChatRequestHandler _loadChats:completionHandler:](self, "_loadChats:completionHandler:", v20, v15);
}

- (void)loadChatsWithHandleIDs:(id)a3 groupID:(id)a4 displayName:(id)a5 style:(unsigned __int8)a6 queryID:(id)a7
{
  uint64_t v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyProxy]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10000BAD4;
  v20[3] = &unk_1000653D0;
  id v21 = v17;
  id v22 = v12;
  id v18 = v12;
  id v19 = v17;
  -[IMDaemonChatRequestHandler loadChatsWithHandleIDs:groupID:displayName:style:reply:]( self,  "loadChatsWithHandleIDs:groupID:displayName:style:reply:",  v15,  v14,  v13,  v7,  v20);
}

- (void)unblackholeAndLoadChatWithHandleIDs:(id)a3 reply:(id)a4
{
  id v43 = a3;
  __int16 v42 = (void (**)(id, void *))a4;
  id v6 = (id)IMOSLoggingEnabled(v42, v5);
  if ((_DWORD)v6)
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("ChatLoading");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v43 count];
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 listenerID]);
      *(_DWORD *)buf = 138412802;
      id v55 = v43;
      __int16 v56 = 2048;
      id v57 = v10;
      __int16 v58 = 2112;
      v59 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Request to load chat with handleIDs array %@ of count %lu from %@",  buf,  0x20u);
    }
  }

  if (v43 && (id v6 = [v43 count]) != 0)
  {
    v45 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v43);
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
    id obj = (id)objc_claimAutoreleasedReturnValue([v13 blackholedChats]);

    id v14 = 0LL;
    id v15 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v15)
    {
      uint64_t v17 = *(void *)v49;
      *(void *)&__int128 v16 = 138412290LL;
      __int128 v41 = v16;
LABEL_9:
      uint64_t v18 = 0LL;
      while (1)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v48 + 1) + 8 * v18);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "participants", v41));
        id v21 = -[NSMutableSet initWithCapacity:]( [NSMutableSet alloc],  "initWithCapacity:",  [v20 count]);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_10000BFDC;
        v46[3] = &unk_100065448;
        id v22 = v21;
        v47 = v22;
        [v20 enumerateObjectsUsingBlock:v46];
        unsigned int v23 = -[NSMutableSet isEqualToSet:](v22, "isEqualToSet:", v45);
        char v24 = v23;
        if (v23)
        {
          uint64_t v25 = objc_claimAutoreleasedReturnValue([v19 dictionaryRepresentationIncludingLastMessage]);

          id v26 = [v19 updateIsBlackholed:0];
          if (IMOSLoggingEnabled(v26, v27))
          {
            uint64_t v28 = OSLogHandleForIMFoundationCategory("ChatLoading");
            __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v19 chatIdentifier]);
              *(_DWORD *)buf = v41;
              id v55 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "Concluded search. Found existing chat (%@) with target participant list.",  buf,  0xCu);
            }
          }

          id v31 = (void *)objc_claimAutoreleasedReturnValue([v19 participants]);
          BOOL v32 = [v31 count] == (id)1;

          id v33 = (void *)objc_claimAutoreleasedReturnValue(+[IMMetricsCollector sharedInstance](&OBJC_CLASS___IMMetricsCollector, "sharedInstance"));
          __int16 v34 = v33;
          if (v32) {
            uint64_t v35 = 22LL;
          }
          else {
            uint64_t v35 = 23LL;
          }
          [v33 trackSpamEvent:v35];

          id v14 = (void *)v25;
        }

        if ((v24 & 1) != 0) {
          break;
        }
        if (v15 == (id)++v18)
        {
          id v15 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
          if (v15) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[IMDBroadcastController sharedProvider](&OBJC_CLASS___IMDBroadcastController, "sharedProvider"));
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 broadcasterForChatListeners]);
    [v37 previouslyBlackholedChatLoadedWithHandleIDs:v43 chat:v14];

    if (v14)
    {
      v52 = v14;
      __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
      v42[2](v42, v38);
    }

    else
    {
      v42[2](v42, &__NSArray0__struct);
    }
  }

  else
  {
    if (IMOSLoggingEnabled(v6, v7))
    {
      uint64_t v39 = OSLogHandleForIMFoundationCategory("ChatLoading");
      id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Invalid handleIDs array. Bailing!", buf, 2u);
      }
    }

    v42[2](v42, &__NSArray0__struct);
  }
}

- (void)sendStickerAtPath:(id)a3 toChatID:(id)a4 forNBubbleFromTheBottom:(int64_t)a5 atX:(id)a6 atY:(id)a7 scale:(id)a8 balloonWidth:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v66 = a7;
  id v65 = a8;
  id v64 = a9;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  v60 = (void *)objc_claimAutoreleasedReturnValue([v17 anySessionForServiceName:IMServiceNameiMessage]);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  v62 = v15;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 existingChatWithGUID:v15]);

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  v59 = v19;
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 participants]);
  id v22 = [v21 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v68;
    do
    {
      uint64_t v25 = 0LL;
      do
      {
        if (*(void *)v68 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v67 + 1) + 8 * (void)v25) ID]);
        [v20 addObject:v26];

        uint64_t v25 = (char *)v25 + 1;
      }

      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }

    while (v23);
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
  uint64_t v75 = IMServiceNameiMessage;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v75, 1LL));
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v27 itemsWithHandles:v20 onServices:v28 messageGUID:0 limit:20]);

  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "__imArrayByFilteringWithBlock:", &stru_100065488));
  __int16 v58 = v30;
  else {
    uint64_t v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndex:", (char *)objc_msgSend(v30, "count") - a5));
  }
  BOOL v32 = (void *)v31;
  v63 = v14;
  id v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v14));
  __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v34 createNewOutgoingTransferWithLocalFileURL:v33]);

  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"));
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 transferForGUID:v35]);

  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v33 path]);
  uint64_t v39 = IMSharedHelperMD5HashOfFileAtPath();
  uint64_t v40 = objc_claimAutoreleasedReturnValue(v39);

  v54 = (void *)v40;
  v74[0] = v40;
  v73[0] = IMStickerUserInfoStickerHashKey;
  v73[1] = IMStickerUserInfoStickerGUIDKey;
  __int16 v56 = v33;
  __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v33 lastPathComponent]);
  v74[1] = v41;
  v74[2] = @"0";
  v73[2] = IMStickerUserInfoAssociatedLayoutIntentKey;
  v73[3] = IMStickerUserInfoLayoutIntentKey;
  v74[3] = @"0";
  v74[4] = v64;
  v73[4] = IMStickerUserInfoParentPreviewWidthKey;
  v73[5] = IMStickerUserInfoRotationKey;
  v74[5] = @"0.0";
  v74[6] = v65;
  v73[6] = IMStickerUserInfoScaleKey;
  v73[7] = IMStickerUserInfoXScalarKey;
  v73[8] = IMStickerUserInfoYScalarKey;
  v74[7] = v16;
  v74[8] = v66;
  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v74,  v73,  9LL));
  [v37 setStickerUserInfo:v42];

  id v55 = v37;
  [v37 setIsSticker:1];
  v72 = v35;
  id v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v72, 1LL));
  __int16 v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSAttributedString __im_attributedStringWithFileTransfers:]( &OBJC_CLASS___NSAttributedString,  "__im_attributedStringWithFileTransfers:",  v43));

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "__im_attributedStringByAssigningMessagePartNumbers"));
  id v46 = objc_alloc(&OBJC_CLASS___IMAssociatedMessageItem);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v61 = v16;
  if (v35)
  {
    v71 = v35;
    __int128 v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v71, 1LL));
  }

  else
  {
    __int128 v48 = 0LL;
  }

  __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  __int128 v50 = (void *)objc_claimAutoreleasedReturnValue([v32 guid]);
  id v57 = v32;
  __int128 v51 = (void *)objc_claimAutoreleasedReturnValue([v32 threadIdentifier]);
  id v52 = objc_msgSend( v46,  "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessage Type:associatedMessageRange:messageSummaryInfo:threadIdentifier:",  0,  v47,  v45,  0,  v48,  5,  0,  v49,  v50,  1000,  0,  0x7FFFFFFFFFFFFFFFLL,  0,  v51);

  if (v35) {
  id v53 = (void *)objc_claimAutoreleasedReturnValue([v59 chatIdentifier]);
  }
  objc_msgSend(v60, "sendMessage:toChatID:identifier:style:", v52, v62, v53, objc_msgSend(v59, "style"));
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
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
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 accountForAccountID:v13]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 service]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 internalName]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v20 anySessionForServiceName:v24]);

  if (v15)
  {
LABEL_7:
    [v15 sendReadReceiptForMessage:v10 toChatID:v11 identifier:v12 style:v29];
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

- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
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
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 accountForAccountID:v13]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 service]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 internalName]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v20 anySessionForServiceName:v24]);

  if (v15)
  {
LABEL_7:
    [v15 sendPlayedReceiptForMessage:v10 toChatID:v11 identifier:v12 style:v29];
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

- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
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
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 accountForAccountID:v13]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 service]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 internalName]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v20 anySessionForServiceName:v24]);

  if (v15)
  {
LABEL_7:
    [v15 sendSavedReceiptForMessage:v10 toChatID:v11 identifier:v12 style:v29];
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

- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 anySessionForServiceName:IMServiceNameiMessage]);

  [v8 sendSyndicationAction:v6 toChatsWithIdentifiers:v5];
}

- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v13 anySessionForServiceName:IMServiceNameiMessage]);

  [v14 sendBalloonPayload:v12 attachments:v11 withMessageGUID:v10 bundleID:v9];
}

- (void)updateBalloonPayload:(id)a3 attachments:(id)a4 forMessageGUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:IMServiceNameiMessage]);

  [v11 updateBalloonPayload:v9 attachments:v8 forMessageGUID:v7];
}

- (void)setProperties:(id)a3 ofParticipant:(id)a4 inChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  unsigned int v31 = a7;
  id v32 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sessionForAccount:v15]);

  if (v17) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v18, v19))
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory("Warning");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 accountForAccountID:v15]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 service]);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 internalName]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v22 anySessionForServiceName:v26]);

  if (v17)
  {
LABEL_7:
    [v17 setProperties:v32 ofParticipant:v12 inChatID:v13 identifier:v14 style:v31];
  }

  else if (IMOSLoggingEnabled(v27, v28))
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory("Warning");
    __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

- (void)leaveChatID:(id)a3 style:(unsigned __int8)a4 account:(id)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sessionForAccount:v8]);

  if (v10) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v11, v12))
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("Warning");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v24,  0xCu);
    }
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountForAccountID:v8]);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 service]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 internalName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v15 anySessionForServiceName:v19]);

  if (v10)
  {
LABEL_7:
    [v10 leaveChat:v7 style:v6];
  }

  else if (IMOSLoggingEnabled(v20, v21))
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory("Warning");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v24,  0xCu);
    }
  }
}

- (void)removeChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  uint64_t v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sessionForAccount:v11]);

  if (v13) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v14, v15))
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v27,  0xCu);
    }
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accountForAccountID:v11]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 service]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 internalName]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v18 anySessionForServiceName:v22]);

  if (v13)
  {
LABEL_7:
    [v13 removeChatID:v9 identifier:v10 style:v7];
  }

  else if (IMOSLoggingEnabled(v23, v24))
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v27,  0xCu);
    }
  }
}

- (void)declineInvitationToChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  uint64_t v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sessionForAccount:v11]);

  if (v13) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v14, v15))
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  (uint8_t *)&v27,  0xCu);
    }
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accountForAccountID:v11]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 service]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 internalName]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v18 anySessionForServiceName:v22]);

  if (v13)
  {
LABEL_7:
    [v13 declineInvitationToChatID:v9 identifier:v10 style:v7];
  }

  else if (IMOSLoggingEnabled(v23, v24))
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v27,  0xCu);
    }
  }
}

- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 account:(id)a6 toChatID:(id)a7 identifier:(id)a8 style:(unsigned __int8)a9
{
  id v33 = a3;
  id v34 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sessionForAccount:v15]);

  if (v19) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled(v20, v21))
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory("Warning");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@",  buf,  0xCu);
    }
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController",  v33));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 accountForAccountID:v15]);
  int v27 = (void *)objc_claimAutoreleasedReturnValue([v26 service]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 internalName]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v24 anySessionForServiceName:v28]);

  if (v19)
  {
LABEL_7:
    objc_msgSend( v19,  "sendCommand:withProperties:toPerson:toChatID:identifier:style:",  v33,  v34,  v14,  v16,  v17,  a9,  v33);
  }

  else if (IMOSLoggingEnabled(v29, v30))
  {
    uint64_t v31 = OSLogHandleForIMFoundationCategory("Warning");
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  buf,  0xCu);
    }
  }
}

- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
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
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountForAccountID:v12]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 service]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 internalName]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v19 anySessionForServiceName:v23]);

  if (v14)
  {
LABEL_7:
    [v14 sendCommand:v9 withProperties:v10 toPerson:v11];
  }

  else if (IMOSLoggingEnabled(v24, v25))
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory("Warning");
    int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "FIND_SESSION: No session ever found for account: %@",  (uint8_t *)&v28,  0xCu);
    }
  }
}

- (void)fetchCommonCapabilities:(id)a3 fromChatWithGUID:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 existingChatWithGUID:v9]);

  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 participants]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 arrayByApplyingSelector:"ID"]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 lastAddressedLocalHandle]);
    if ([v14 length])
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 arrayByAddingObject:v14]);

      uint64_t v13 = (void *)v15;
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 _URIsFromIDs]);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "__im_canonicalIDSIDsFromAddresses"));
    uint64_t v18 = IMServiceNameForCanonicalIDSAddresses();
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000DEF4;
    v20[3] = &unk_1000654B0;
    id v21 = v8;
    +[IMIDSUtilities findCommonCapabilitiesAcrossRecipients:serviceName:capsToCheck:completion:]( &OBJC_CLASS___IMIDSUtilities,  "findCommonCapabilitiesAcrossRecipients:serviceName:capsToCheck:completion:",  v16,  v19,  v7,  v20);
  }

  else
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0LL, 0LL);
  }
}

- (void)recoverChatsFromJunkContainingMessageWithGUID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  unint64_t v6 = v5;
  id v7 = self;
  _sSo26IMDaemonChatRequestHandlerC7imagentE37recoverChatsFromJunkContainingMessage8withGUIDySS_tF_0(v4, v6);

  swift_bridgeObjectRelease(v6, v8);
}

- (void)fetchCollaborationNoticesForChatGUID:(id)a3 reply:(id)a4
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  unint64_t v9 = v8;
  id v10 = self;
  _sSo26IMDaemonChatRequestHandlerC7imagentE25fetchCollaborationNotices03forB4GUID5replyySS_ySaySo21IMCollaborationNoticeCGctF_0( v7,  v9);
}

- (void)dismissNotice:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_100034A2C(v4, "Handling CollaborationNotice dismiss request for notice: %@");
}

- (void)updateNotice:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_100034A2C(v4, "Updating CollaborationNotice: %@");
}

- (void)loadChatsWithPinningIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  uint64_t v10 = v9;
  _Block_copy(v6);
  id v11 = self;
  sub_10003A540(v8, v10, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v10, v12);
}

- (void)loadAnyChatsContainingHandleIDsIn:(id)a3 reply:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  _Block_copy(v6);
  uint64_t v8 = self;
  sub_10003A6AC(v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v7, v9);
}

- (void)closeSessionChatID:(id)a3 identifier:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6 account:(id)a7
{
  int v8 = a6;
  BOOL v9 = a5;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  uint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v13);
  uint64_t v17 = v16;
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7, v16);
  unint64_t v20 = v19;
  id v21 = self;
  _sSo26IMDaemonChatRequestHandlerC7imagentE012closeSessionB2ID_10identifier21didDeleteConversation5style7accountySS_SSSbSo11IMChatStyleVSStF_0( v12,  v14,  v15,  v17,  v9,  v8,  v18,  v20);

  swift_bridgeObjectRelease(v14, v22);
  swift_bridgeObjectRelease(v17, v23);
  swift_bridgeObjectRelease(v20, v24);
}

- (void)unreadCountWithCompletion:(id)a3
{
  id v4 = (void (**)(void *, id))_Block_copy(a3);
  unint64_t v5 = (void *)objc_opt_self(&OBJC_CLASS___IMDMessageStore);
  int v8 = self;
  id v6 = [v5 sharedInstance];
  id v7 = [v6 unreadMessagesCount];

  v4[2](v4, v7);
  _Block_release(v4);
}

- (void)markChatsAsReadFilteredUsingPredicate:(id)a3
{
}

@end