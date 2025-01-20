@interface MessageGroupController
+ (MessageGroupController)sharedInstance;
+ (id)memberDisplayIDsFromParticipants:(id)a3 toIdentifier:(id)a4;
+ (void)addMembers:(id)a3 toHandleInfo:(id)a4;
- (BOOL)_canSendMessagesWithEngram;
- (BOOL)_checkForParticipantLeaveOnENGroup:(id)a3 groupMessagePayload:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 service:(id)a7;
- (BOOL)_hasValidSendParametersForMessage:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6;
- (BOOL)_participantsContainBizID:(id)a3;
- (BOOL)_serverAllowsMessageSend;
- (BOOL)_shouldDropMessageGroupID:(id)a3 participants:(id)a4 fromIdentifier:(id)a5 toIdentifier:(id)a6;
- (BOOL)_shouldRequestGroupPhoto:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationDate:(id)a5;
- (BOOL)_shouldSendEngramOnChat:(id)a3;
- (BOOL)shouldCompressGroupPayload:(id)a3;
- (BOOL)shouldDropDueToGroupSize:(id)a3;
- (IMDChatRegistry)chatRegistry;
- (MessageGroupController)initWithSession:(id)a3;
- (MessageServiceSession)session;
- (NSMutableDictionary)groupPhotoRequestsFromStorage;
- (NSMutableDictionary)groupPhotoRequestsInFlight;
- (NSMutableDictionary)mostRecentGroupPhotoRequestDates;
- (double)_groupPhotoRequestRateLimit;
- (id)IDSServerBagiMessageSharedInstance;
- (id)_findChatFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7;
- (id)_newSendContextForMessage:(id)a3 withChat:(id)a4;
- (id)chatForGroupMessagePayload:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5;
- (id)engramControllerSharedInstance;
- (id)findChatWithMessageData:(id)a3 account:(id)a4 session:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 timestamp:(id)a8;
- (id)lockDownManager;
- (id)newGroupMessagePayloadForChat:(id)a3 fromID:(id)a4;
- (int64_t)currentMessageSendServerVersion;
- (void)_addGroupPhotoRefreshDate:(id)a3 context:(id)a4;
- (void)_addOriginalTimestampIfNecessary:(id)a3 context:(id)a4;
- (void)_checkAndPerformLegacyAddRemove:(id)a3 participantsToAdd:(id)a4 participantsToRemove:(id)a5 service:(id)a6 fromIdentifier:(id)a7;
- (void)_handleGroupVisualIdentityRequest:(id)a3 fromParticipants:(id)a4 groupID:(id)a5 identifier:(id)a6 session:(id)a7 toIdentifier:(id)a8 fromToken:(id)a9 requestGUID:(id)a10;
- (void)_populateP2PDictionary:(id)a3 chat:(id)a4 fromID:(id)a5;
- (void)_populateP2PDictionary:(id)a3 chat:(id)a4 omitName:(BOOL)a5 fromID:(id)a6;
- (void)_requestGroupPhotoUpdate:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5 session:(id)a6;
- (void)_sendGroupPhoto:(id)a3 toIdentifier:(id)a4 fromIdentifier:(id)a5 toToken:(id)a6 session:(id)a7 requestGUID:(id)a8;
- (void)addParticipants:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 groupPhoto:(id)a9 completionBlock:(id)a10;
- (void)dealloc;
- (void)engroupForChat:(id)a3 service:(id)a4 completionBlock:(id)a5;
- (void)handleAddToNewGroup:(id)a3 groupID:(id)a4 groupPhotoTransferDict:(id)a5 identifier:(id)a6 session:(id)a7 toIdentifier:(id)a8 toName:(id)a9 toParticipants:(id)a10;
- (void)handler:(id)a3 account:(id)a4 groupMessagePayload:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 idsService:(id)a9 fromToken:(id)a10 timeStamp:(id)a11 storageContext:(id)a12;
- (void)leaveChat:(id)a3 fromID:(id)a4 fromAccount:(id)a5 session:(id)a6 service:(id)a7 completionBlock:(id)a8;
- (void)receiveGroupUpdate:(id)a3 chat:(id)a4 service:(id)a5;
- (void)receiveMessageData:(id)a3 account:(id)a4 session:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 incomingEngroup:(id)a8 service:(id)a9 timestamp:(id)a10 fromStorage:(BOOL)a11 completionBlock:(id)a12;
- (void)receiveMessageData:(id)a3 session:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timestamp:(id)a7 fromStorage:(BOOL)a8 completionBlock:(id)a9;
- (void)removeParticipants:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 completionBlock:(id)a9;
- (void)requestGroupPhotoIfNecessary:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationDate:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 messageIsFromStorage:(BOOL)a8 session:(id)a9;
- (void)requestGroupPhotosForMessagesFromStorage;
- (void)sendMessage:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 completionBlock:(id)a9;
- (void)setGroupPhoto:(id)a3 forChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 isPhotoRefresh:(BOOL)a8;
- (void)setName:(id)a3 fromName:(id)a4 forChat:(id)a5 fromID:(id)a6 fromAccount:(id)a7 messageID:(id)a8 session:(id)a9 completionBlock:(id)a10;
@end

@implementation MessageGroupController

- (id)IDSServerBagiMessageSharedInstance
{
  return +[IDSServerBag sharedInstanceForBagType:](&OBJC_CLASS___IDSServerBag, "sharedInstanceForBagType:", 1LL);
}

- (id)lockDownManager
{
  return +[IMLockdownManager sharedInstance](&OBJC_CLASS___IMLockdownManager, "sharedInstance");
}

- (id)engramControllerSharedInstance
{
  return +[MessageEngramGroupController sharedInstance](&OBJC_CLASS___MessageEngramGroupController, "sharedInstance");
}

+ (MessageGroupController)sharedInstance
{
  if (qword_E4538 != -1) {
    dispatch_once(&qword_E4538, &stru_D7798);
  }
  return (MessageGroupController *)qword_E4540;
}

- (IMDChatRegistry)chatRegistry
{
  return +[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance");
}

- (id)chatForGroupMessagePayload:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5
{
  id v9 = [a3 _stringForKey:off_E2F08[0]];
  return -[MessageServiceSession bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:]( -[MessageGroupController session](self, "session"),  "bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:",  a4,  a5,  v9,  [a3 _arrayForKey:@"p"],  objc_msgSend(a3, "_stringForKey:", off_E2F10[0]));
}

- (id)newGroupMessagePayloadForChat:(id)a3 fromID:(id)a4
{
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v8 = -[MessageServiceSession groupIDForChat:]( -[MessageGroupController session](self, "session"),  "groupIDForChat:",  a3);
  if (v8) {
    CFDictionarySetValue((CFMutableDictionaryRef)v7, off_E2EA0[0], v8);
  }
  id v9 = [a3 displayName];
  if (v9) {
    CFDictionarySetValue((CFMutableDictionaryRef)v7, off_E2F08[0], v9);
  }
  v10 = sub_71B44((NSMutableArray *)a3, a4);
  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)v7, @"p", v10);
  }
  return v7;
}

- (MessageGroupController)initWithSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MessageGroupController;
  v4 = -[MessageGroupController init](&v7, "init");
  if (v4)
  {
    v4->_groupPhotoRequestsFromStorage = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4->_groupPhotoRequestsInFlight = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v4->_mostRecentGroupPhotoRequestDates = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_storeWeak((id *)&v4->_session, a3);
    v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  v4,  "requestGroupPhotosForMessagesFromStorage",  IMMessageFromStorageTimerFiredNotification,  0LL);
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MessageGroupController;
  -[MessageGroupController dealloc](&v3, "dealloc");
}

- (int64_t)currentMessageSendServerVersion
{
  return 0LL;
}

- (BOOL)_canSendMessagesWithEngram
{
  unsigned int v3 = +[IMUserDefaults isEngramEnabled](&OBJC_CLASS___IMUserDefaults, "isEngramEnabled");
  if (v3) {
    LOBYTE(v3) = -[MessageGroupController _serverAllowsMessageSend](self, "_serverAllowsMessageSend");
  }
  return v3;
}

- (BOOL)_serverAllowsMessageSend
{
  id v3 = -[MessageGroupController IDSServerBagiMessageSharedInstance](self, "IDSServerBagiMessageSharedInstance");
  id v4 = [v3 objectForKey:off_E2F48];
  if (v4) {
    id v5 = [v4 integerValue];
  }
  else {
    id v5 = 0LL;
  }
  int64_t v6 = -[MessageGroupController currentMessageSendServerVersion](self, "currentMessageSendServerVersion");
  if (IMOSLoggingEnabled(v6, v7))
  {
    id v8 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      else {
        id v9 = @"YES";
      }
      int v11 = 138412802;
      v12 = v9;
      __int16 v13 = 2112;
      v14 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5);
      __int16 v15 = 2112;
      v16 = +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[MessageGroupController currentMessageSendServerVersion](self, "currentMessageSendServerVersion"));
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_INFO,  "Server is allowing us to send messages to engroups: %@ serverVersion: %@ localVersion: %@",  (uint8_t *)&v11,  0x20u);
    }
  }

  return (uint64_t)v5 <= v6;
}

- (void)_addOriginalTimestampIfNecessary:(id)a3 context:(id)a4
{
  id v7 = [a3 messageSummaryInfo];
  unsigned int v8 = objc_msgSend( objc_msgSend(v7, "objectForKey:", IMMessageSummaryInfoUpdatedDateWithServerTime),  "BOOLValue");
  if (-[MessageGroupController _shouldAdjustTimestampOfResentMessages](self, "_shouldAdjustTimestampOfResentMessages")
    && v8)
  {
    id v9 = [a3 time];
    if (IMOSLoggingEnabled(v9, v10))
    {
      int v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        id v14 = [a3 time];
        __int16 v15 = 2112;
        id v16 = [a3 guid];
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "Adding original timestamp %@ to message context with GUID %@",  (uint8_t *)&v13,  0x16u);
      }
    }

    v12 = +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  objc_msgSend(v9, "__im_nanosecondTimeIntervalSinceEpochTime"));
    if (v12) {
      CFDictionarySetValue((CFMutableDictionaryRef)a4, @"oe", v12);
    }
  }

- (void)_addGroupPhotoRefreshDate:(id)a3 context:(id)a4
{
  id v5 = [a3 groupPhotoGuid];
  id v6 = -[IMDFileTransferCenter transferForGUID:]( +[IMDFileTransferCenter sharedInstance](&OBJC_CLASS___IMDFileTransferCenter, "sharedInstance"),  "transferForGUID:",  v5);
  if (!v6)
  {
    id v6 = -[IMDAttachmentStore attachmentWithGUID:]( +[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"),  "attachmentWithGUID:",  v5);
    if (!v6)
    {
      int v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        return;
      }
      LOWORD(v15) = 0;
      id v14 = "File transfers from both IMDFileTransferCenter and IMDAttachmentStore are empty. Not updating the date";
LABEL_15:
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v15, 2u);
      return;
    }
  }

  id v8 = [v6 refreshDate];
  int v10 = IMOSLoggingEnabled(v8, v9);
  if (!v8)
  {
    if (!v10) {
      return;
    }
    int v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v15) = 0;
    id v14 = "Refresh Date is nil, not adding the date to the message context.";
    goto LABEL_15;
  }

  if (v10)
  {
    int v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v8;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "Adding group photo refresh date %@ to message context",  (uint8_t *)&v15,  0xCu);
    }
  }

  v12 = +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  objc_msgSend(v8, "__im_nanosecondTimeIntervalSinceEpochTime"));
  if (v12) {
    CFDictionarySetValue((CFMutableDictionaryRef)a4, @"gpru", v12);
  }
}

- (void)sendMessage:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 completionBlock:(id)a9
{
  uint64_t v16 = v36;
  BOOL v17 = -[MessageGroupController _hasValidSendParametersForMessage:toChat:fromID:fromAccount:]( self,  "_hasValidSendParametersForMessage:toChat:fromID:fromAccount:");
  if (v36 && !v17)
  {
    uint64_t v19 = *(void *)(v36 + 16);
    HIDWORD(v36) = 4;
    LOBYTE(v36) = 0;
    __asm { BR              X8 }
  }

  if (v36)
  {
    id v20 = -[MessageGroupController _newSendContextForMessage:withChat:]( self,  "_newSendContextForMessage:withChat:",  a3,  a4);
    -[MessageGroupController _addOriginalTimestampIfNecessary:context:]( self,  "_addOriginalTimestampIfNecessary:context:",  a3,  v20);
    -[MessageGroupController _addGroupPhotoRefreshDate:context:](self, "_addGroupPhotoRefreshDate:context:", a4, v20);
    id v21 = [a3 isTypingMessage];
    if ((v21 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v21, v22))
      {
        v23 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v32 = 138412546;
          uint64_t v33 = v36;
          __int16 v34 = 2112;
          id v35 = v20;
          _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_INFO,  "Group message success, calling completion block: %@  (Context: %@)",  (uint8_t *)&v32,  0x16u);
        }
      }
    }

    BOOL v24 = -[MessageGroupController _shouldSendEngramOnChat:](self, "_shouldSendEngramOnChat:", a4);
    BOOL v25 = v24;
    int v27 = IMOSLoggingEnabled(v24, v26);
    if (v25)
    {
      if (v27)
      {
        v28 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          LOWORD(v32) = 0;
          _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  "Engram enabled, so we will try to look up the group or create a group if we don't have one",  (uint8_t *)&v32,  2u);
        }
      }

      objc_msgSend( -[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"),  "sendMessageWithEngram:chat:service:fromID:fromAccount:session:context:groupController:completionBlock:",  a3,  a4,  a8,  a5,  a6,  a7,  v20,  self,  v16);
    }

    else
    {
      if (v27)
      {
        v30 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          LOWORD(v32) = 0;
          _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_INFO,  "Engram disabled, sending with legacy crypto",  (uint8_t *)&v32,  2u);
        }
      }

      LOBYTE(v31) = 1;
      (*(void (**)(uint64_t, MessageGroupController *, id, id, id, id, id, void, void))(v16 + 16))( v16,  self,  a4,  a3,  a5,  a6,  v20,  0LL,  v31);
    }
  }

  else if (IMOSLoggingEnabled(v17, v18))
  {
    v29 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      LOWORD(v32) = 0;
      _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_INFO,  "Group message success, no completion block specified",  (uint8_t *)&v32,  2u);
    }
  }

- (BOOL)_hasValidSendParametersForMessage:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6
{
  if (a3 && a4 && (self = (MessageGroupController *)[a5 length], a6) && self)
  {
    LOBYTE(v10) = 1;
  }

  else
  {
    int v10 = IMOSLoggingEnabled(self, a2);
    if (v10)
    {
      int v11 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      int v10 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v10)
      {
        int v13 = 138413058;
        id v14 = a3;
        __int16 v15 = 2112;
        id v16 = a4;
        __int16 v17 = 2112;
        id v18 = a5;
        __int16 v19 = 2112;
        id v20 = a6;
        _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_INFO,  "Invalid request to send message: %@ to chat: %@ from ID: %@ fromAccount: %@",  (uint8_t *)&v13,  0x2Au);
        LOBYTE(v10) = 0;
      }
    }
  }

  return v10;
}

- (BOOL)_shouldSendEngramOnChat:(id)a3
{
  unsigned int v4 = -[MessageGroupController _canSendMessagesWithEngram](self, "_canSendMessagesWithEngram");
  if (v4)
  {
    if ([a3 style] == 43) {
      LOBYTE(v4) = +[IMUserDefaults __im_isEngramEnabledForGroups]( &OBJC_CLASS___IMUserDefaults,  "__im_isEngramEnabledForGroups");
    }
    else {
      LOBYTE(v4) = 1;
    }
  }

  return v4;
}

- (id)_newSendContextForMessage:(id)a3 withChat:(id)a4
{
  id v6 = objc_msgSend(a4, "displayName", a3);
  id v7 = -[MessageServiceSession groupIDForChat:]( -[MessageGroupController session](self, "session"),  "groupIDForChat:",  a4);
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = [a4 properties];
  int v10 = (const void *)IMDChatGroupParticipantVersionKey;
  if ([v9 objectForKey:IMDChatGroupParticipantVersionKey])
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  setParticipantVersionForChat(a4, 0LL);
  if (v6) {
LABEL_3:
  }
    CFDictionarySetValue((CFMutableDictionaryRef)v8, off_E2F08[0], v6);
LABEL_4:
  if (v7) {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, off_E2F10[0], v7);
  }
  if (off_E2F20[0]) {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, off_E2F18[0], off_E2F20[0]);
  }
  int v11 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a4 groupParticipantVersion]);
  if (v11) {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, v10, v11);
  }
  return v8;
}

+ (id)memberDisplayIDsFromParticipants:(id)a3 toIdentifier:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_72954;
  v5[3] = &unk_D77C0;
  v5[4] = a4;
  return objc_msgSend(objc_msgSend(a3, "__imArrayByFilteringWithBlock:", v5), "_IDsFromURIs");
}

+ (void)addMembers:(id)a3 toHandleInfo:(id)a4
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = kFZChatParticipantStatusKey;
    uint64_t v9 = kFZPersonID;
    do
    {
      int v10 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend( a4,  "addObject:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( NSDictionary,  "dictionaryWithObjectsAndKeys:",  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2),  v8,  *(void *)(*((void *)&v12 + 1) + 8 * (void)v10),  v9,  0));
        int v10 = (char *)v10 + 1;
      }

      while (v6 != v10);
      id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

- (void)receiveMessageData:(id)a3 session:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timestamp:(id)a7 fromStorage:(BOOL)a8 completionBlock:(id)a9
{
  LOBYTE(v9) = a8;
  -[MessageGroupController receiveMessageData:account:session:toIdentifier:fromIdentifier:incomingEngroup:service:timestamp:fromStorage:completionBlock:]( self,  "receiveMessageData:account:session:toIdentifier:fromIdentifier:incomingEngroup:service:timestamp:fromStorage:completionBlock:",  a3,  [a4 account],  a4,  a5,  a6,  0,  0,  a7,  v9,  a9);
}

- (id)findChatWithMessageData:(id)a3 account:(id)a4 session:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 timestamp:(id)a8
{
  if (IMOSLoggingEnabled(self, a2))
  {
    __int128 v12 = (os_log_s *)OSLogHandleForIMEventCategory("MessageService");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Trying to find chat", (uint8_t *)&v28, 2u);
    }
  }

  __int128 v13 = (void *)JWDecodeDictionary([a3 _FTOptionallyDecompressData]);
  if ([v13 count])
  {
    id v14 = [v13 _stringForKey:off_E2F08[0]];
    id v15 = [v13 _stringForKey:off_E2F10[0]];
    id v16 = [v13 _arrayForKey:@"p"];
    id v17 = [v16 count];
    if ((unint64_t)v17 < 3)
    {
      __int16 v19 = 0LL;
    }

    else
    {
      id v17 = -[MessageGroupController _findChatFromIdentifier:toIdentifier:displayName:participants:groupID:]( self,  "_findChatFromIdentifier:toIdentifier:displayName:participants:groupID:",  a7,  a6,  v14,  v16,  v15);
      __int16 v19 = v17;
    }

    if (IMOSLoggingEnabled(v17, v18))
    {
      uint64_t v26 = (os_log_s *)OSLogHandleForIMEventCategory("MessageService");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412290;
        id v29 = v19;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Found chat in second attempt %@", (uint8_t *)&v28, 0xCu);
      }
    }
  }

  else
  {
    uint64_t v20 = JWDecodeDictionary(a3);
    uint64_t v22 = IMOSLoggingEnabled(v20, v21);
    if ((_DWORD)v22)
    {
      BOOL v24 = (os_log_s *)OSLogHandleForIMEventCategory("MessageService");
      uint64_t v22 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if ((_DWORD)v22)
      {
        LOWORD(v28) = 0;
        _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_INFO,  " ******* that failed, trying a simple decode now",  (uint8_t *)&v28,  2u);
      }
    }

    if (!v20)
    {
      if (IMOSLoggingEnabled(v22, v23))
      {
        BOOL v25 = (os_log_s *)OSLogHandleForIMEventCategory("MessageService");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          int v28 = 138412290;
          id v29 = a3;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, " ******* BAD DATA: %@", (uint8_t *)&v28, 0xCu);
        }
      }
    }

    return 0LL;
  }

  return v19;
}

- (void)receiveMessageData:(id)a3 account:(id)a4 session:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 incomingEngroup:(id)a8 service:(id)a9 timestamp:(id)a10 fromStorage:(BOOL)a11 completionBlock:(id)a12
{
  uint64_t v18 = v102;
  __int16 v19 = v100;
  id v20 = [a3 length];
  if (v102) {
    BOOL v22 = v20 == 0LL;
  }
  else {
    BOOL v22 = 0;
  }
  if (v22) {
    __asm { BR              X7 }
  }

  if (v102)
  {
    uint64_t v72 = v99;
    id v75 = a8;
    id v76 = a5;
    unsigned int v77 = log;
    uint64_t v23 = (void *)JWDecodeDictionary([a3 _FTOptionallyDecompressData]);
    if (![v23 count])
    {
      uint64_t v23 = (void *)JWDecodeDictionary(a3);
      uint64_t v25 = IMOSLoggingEnabled(v23, v24);
      if ((_DWORD)v25)
      {
        int v27 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageService");
        uint64_t v25 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
        if ((_DWORD)v25)
        {
          LOWORD(v81) = 0;
          _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  " ******* that failed, trying a simple decode now",  (uint8_t *)&v81,  2u);
        }
      }

      if (!v23)
      {
        if (IMOSLoggingEnabled(v25, v26))
        {
          int v28 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageService");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            int v81 = 138412290;
            id v82 = a3;
            _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, " ******* BAD DATA: %@", (uint8_t *)&v81, 0xCu);
          }
        }

        uint64_t v23 = 0LL;
      }
    }

    id v29 = [v23 _arrayForKey:@"p"];
    id v30 = [v29 count];
    if ((unint64_t)v30 < 3)
    {
      id v33 = 0LL;
      id v78 = 0LL;
    }

    else
    {
      if (IMOSLoggingEnabled(v30, v31))
      {
        int v32 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageService");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          LOWORD(v81) = 0;
          _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_INFO,  "This is a group chat. Looking for group name and groupID",  (uint8_t *)&v81,  2u);
        }
      }

      id v78 = [v23 _stringForKey:off_E2F08[0]];
      id v33 = [v23 _stringForKey:off_E2F10[0]];
      id v34 = [v23 _numberForKey:@"gpru"];
      if ([v34 unsignedLongLongValue]) {
        +[NSDate __im_iMessageDateFromTimeStamp:](&OBJC_CLASS___NSDate, "__im_iMessageDateFromTimeStamp:", v34);
      }
    }

    BOOL v36 = -[MessageGroupController _shouldDropMessageGroupID:participants:fromIdentifier:toIdentifier:]( self,  "_shouldDropMessageGroupID:participants:fromIdentifier:toIdentifier:",  v33,  v29,  a7,  a6);
    if (v36)
    {
      if (IMOSLoggingEnabled(v36, v37))
      {
        v38 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageService");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          int v81 = 138412546;
          id v82 = v33;
          __int16 v83 = 2112;
          id v84 = v29;
          _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_INFO,  "Dropping message from MessageGroupController. groupID: %@ participants: %@",  (uint8_t *)&v81,  0x16u);
        }
      }

      (*(void (**)(uint64_t, MessageGroupController *, void, void, void, void, void))(v18 + 16))( v18,  self,  0LL,  0LL,  0LL,  0LL,  0LL);
      return;
    }

    uint64_t v71 = IMDChatGroupParticipantVersionKey;
    id v74 = objc_msgSend(objc_msgSend(v23, "_numberForKey:"), "integerValue");
    if ((unint64_t)[v29 count] < 3)
    {
      v62 = 0LL;
    }

    else
    {
      v73 = -[MessageGroupController _findChatFromIdentifier:toIdentifier:displayName:participants:groupID:]( self,  "_findChatFromIdentifier:toIdentifier:displayName:participants:groupID:",  a7,  a6,  v78,  v29,  v33);
      if (!-[MessageGroupController _canSendMessagesWithEngram](self, "_canSendMessagesWithEngram"))
      {
        unsigned int v68 = objc_msgSend( -[NSMutableArray __imSetFromArray](sub_71B44(v73, a6), "__imSetFromArray"),  "isEqualToSet:",  objc_msgSend( objc_msgSend(v29, "__imArrayByApplyingBlock:", &stru_D7800),  "__imSetFromArray"));
        id v67 = -[NSMutableArray groupParticipantVersion](v73, "groupParticipantVersion");
        id v39 = -[NSMutableArray properties](v73, "properties");
        id v69 = [v39 objectForKey:off_E2F30[0]];
        uint64_t v40 = (uint64_t)[v19 longLongValue];
        id v41 = [v69 longLongValue];
        id v66 = [v23 _stringForKey:off_E2F18[0]];
        uint64_t v43 = IMOSLoggingEnabled(v66, v42);
        uint64_t v45 = v40 / 1000000000 - (void)v41;
        if ((_DWORD)v43)
        {
          v65 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
          uint64_t v43 = os_log_type_enabled(v65, OS_LOG_TYPE_INFO);
          if ((_DWORD)v43)
          {
            id v70 = [v69 longLongValue];
            uint64_t v46 = (uint64_t)[v19 longLongValue];
            v47 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v77);
            int v81 = 134220034;
            id v82 = v67;
            __int16 v83 = 2048;
            id v84 = v74;
            __int16 v85 = 2048;
            uint64_t v86 = v45;
            __int16 v87 = 2048;
            id v88 = v70;
            __int16 v89 = 2048;
            uint64_t v90 = v46 / 1000000000;
            v48 = @"NO";
            __int16 v91 = 2112;
            id v92 = v29;
            __int16 v93 = 2112;
            id v94 = v66;
            __int16 v95 = 2112;
            if (v68) {
              v48 = @"YES";
            }
            v96 = v48;
            __int16 v97 = 2112;
            v98 = v47;
            _os_log_impl( &dword_0,  v65,  OS_LOG_TYPE_INFO,  "receiveMessageData localVersion: %ld, versionReceived:%ld, timeDifference: %lld, lastUpdated:%lld, timesta mp:%lld, participants: %@, protocolVersion: %@, isIncomingParticipantSetSame %@, fromStorage %@",  (uint8_t *)&v81,  0x5Cu);
          }
        }

        int v49 = (v66 == 0LL) & ~v68;
        if (v45 > 10) {
          int v50 = v49;
        }
        else {
          int v50 = 0;
        }
        if (!v66)
        {
          uint64_t v43 = IMOSLoggingEnabled(v43, v44);
          if ((_DWORD)v43)
          {
            v51 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
            uint64_t v43 = os_log_type_enabled(v51, OS_LOG_TYPE_INFO);
            if ((_DWORD)v43)
            {
              LOWORD(v81) = 0;
              _os_log_impl( &dword_0,  v51,  OS_LOG_TYPE_INFO,  "Not converving participants. Message from legacy device",  (uint8_t *)&v81,  2u);
            }
          }

          int v50 = 0;
        }

        if (IMOSLoggingEnabled(v43, v44))
        {
          v52 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = @"NO";
            if (v50) {
              v53 = @"YES";
            }
            int v81 = 138412290;
            id v82 = (id)v53;
            _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "shouldConvergeParticipants: %@", (uint8_t *)&v81, 0xCu);
          }
        }

        if ([v33 length])
        {
          id v54 = [v29 count];
          if (a6)
          {
            if (a7 && (unint64_t)v54 >= 2)
            {
              int v55 = -[NSMutableArray style](v73, "style") == 45 ? 0 : v50;
              if (v55 == 1)
              {
                v80[0] = _NSConcreteStackBlock;
                v80[1] = 3221225472LL;
                v80[2] = sub_737BC;
                v80[3] = &unk_D7828;
                v80[4] = a6;
                v56 = (__CFString *)objc_msgSend( objc_msgSend(v29, "__imArrayByApplyingBlock:", v80),  "__imArrayByApplyingBlock:",  &stru_D7848);
                id v57 = [v23 _numberForKey:v71];
                BOOL v58 = v57 == 0LL;
                int v60 = IMOSLoggingEnabled(v57, v59);
                if (v58)
                {
                  if (v60)
                  {
                    v63 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                    {
                      LOWORD(v81) = 0;
                      _os_log_impl( &dword_0,  v63,  OS_LOG_TYPE_INFO,  "Incrementing participant version by 1 on message receive.",  (uint8_t *)&v81,  2u);
                    }
                  }

                  incrementParticipantVersionForChat(v73);
                }

                else
                {
                  if (v60)
                  {
                    v61 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                    {
                      int v81 = 134217984;
                      id v82 = v74;
                      _os_log_impl( &dword_0,  v61,  OS_LOG_TYPE_INFO,  "Setting participant version to version received :%ld",  (uint8_t *)&v81,  0xCu);
                    }
                  }

                  setParticipantVersionForChat(v73, (uint64_t)v74);
                }

                _ConvergeGroupParticipants( v76,  v73,  (uint64_t)v33,  v56,  a6,  a7,  (int)[a6 isEqualToIgnoringCase:a7],  0,  2,  a4);
              }
            }
          }
        }
      }

      if (!v75) {
        goto LABEL_76;
      }
      v62 = v73;
      if (v73)
      {
        if (-[MessageGroupController _canSendMessagesWithEngram](self, "_canSendMessagesWithEngram")) {
          -[MessageGroupController receiveGroupUpdate:chat:service:]( self,  "receiveGroupUpdate:chat:service:",  v75,  v73,  v72);
        }
LABEL_76:
        v62 = v73;
      }
    }

    v64 = v62;
    -[MessageGroupController requestGroupPhotoIfNecessary:incomingParticipantVersion:incomingGroupPhotoCreationDate:toIdentifier:fromIdentifier:messageIsFromStorage:session:]( self,  "requestGroupPhotoIfNecessary:incomingParticipantVersion:incomingGroupPhotoCreationDate:toIdentifier:fromIdentifier :messageIsFromStorage:session:",  v76);
    (*(void (**)(uint64_t, MessageGroupController *, NSMutableArray *, id, id, id, void *))(v18 + 16))( v18,  self,  v64,  v33,  v78,  v29,  v23);
    return;
  }

  if (IMOSLoggingEnabled(v20, v21))
  {
    id v35 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      LOWORD(v81) = 0;
      _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "Message received, no completion block specified",  (uint8_t *)&v81,  2u);
    }
  }

- (void)engroupForChat:(id)a3 service:(id)a4 completionBlock:(id)a5
{
  id v9 = +[IMUserDefaults isEngramEnabled](&OBJC_CLASS___IMUserDefaults, "isEngramEnabled");
  if ((_DWORD)v9)
  {
    id v11 = [a3 engramID];
    if (IMOSLoggingEnabled(v11, v12))
    {
      __int128 v13 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v11;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Going to look up the engroup for engramID: %@", buf, 0xCu);
      }
    }

    if ([v11 length])
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_73A58;
      v17[3] = &unk_D7358;
      v17[5] = self;
      v17[6] = a5;
      v17[4] = a3;
      objc_msgSend( -[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"),  "lookUpENGroupForChat:service:completion:",  a3,  a4,  v17);
      return;
    }

    if (IMOSLoggingEnabled(0LL, v14))
    {
      id v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = a3;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "No engramID for chat: %@ defaulting to legacy crypto", buf, 0xCu);
      }
    }
  }

  else if (IMOSLoggingEnabled(v9, v10))
  {
    id v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "Engram is disabled on this device, failed to lookup group",  buf,  2u);
    }
  }

  (*((void (**)(id, MessageGroupController *, id, void, void, void))a5 + 2))( a5,  self,  a3,  0LL,  0LL,  0LL);
}

- (void)receiveGroupUpdate:(id)a3 chat:(id)a4 service:(id)a5
{
  if (a3)
  {
    id v9 = objc_msgSend( objc_msgSend(objc_msgSend(objc_msgSend(a3, "groupID"), "stableGroupID"), "dataRepresentation"),  "__im_engramStringRepresentation");
    if ([v9 length])
    {
      id v11 = objc_msgSend(objc_msgSend(a4, "engramID"), "isEqualToString:", v9);
      char v12 = (char)v11;
      int v14 = IMOSLoggingEnabled(v11, v13);
      if ((v12 & 1) != 0)
      {
        if (v14)
        {
          id v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            LOWORD(v21) = 0;
            _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "Incoming engram id is same as this chat's engram id.",  (uint8_t *)&v21,  2u);
          }
        }

        if ([a4 style] == 43)
        {
          id v16 = objc_msgSend(objc_msgSend(a4, "participants"), "count");
          if ((unint64_t)v16 >= 3)
          {
            if (IMOSLoggingEnabled(v16, v17))
            {
              uint64_t v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                LOWORD(v21) = 0;
                _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "We have a group chat so going to take the incoming group's participants",  (uint8_t *)&v21,  2u);
              }
            }

            objc_msgSend( -[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"),  "convergeOnIncomingGroup:chat:service:",  a3,  a4,  a5);
          }
        }
      }

      else
      {
        if (v14)
        {
          id v20 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            int v21 = 138412546;
            id v22 = v9;
            __int16 v23 = 2112;
            id v24 = [a4 chatIdentifier];
            _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Storing engram id as %@ for chat with identifier: %@",  (uint8_t *)&v21,  0x16u);
          }
        }

        [a4 updateEngramID:v9];
      }
    }

    else if (IMOSLoggingEnabled(0LL, v10))
    {
      id v19 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_INFO,  "Didn't get an engramID to store from a groupID data representation",  (uint8_t *)&v21,  2u);
      }
    }
  }

- (void)addParticipants:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 groupPhoto:(id)a9 completionBlock:(id)a10
{
  id v16 = [a4 style];
  if ((_DWORD)v16 == 45)
  {
    if (IMOSLoggingEnabled(v16, v17))
    {
      uint64_t v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v59 = a4;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "No need to add participants, this is a 1-1 chat: %@", buf, 0xCu);
      }
    }

    if (a10) {
      (*((void (**)(id, MessageGroupController *, id, id, uint64_t, void))a10 + 2))( a10,  self,  a4,  a3,  1LL,  0LL);
    }
  }

  else
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MessageGroupController _populateP2PDictionary:chat:fromID:]( self,  "_populateP2PDictionary:chat:fromID:",  v19,  a4,  a5);
    if (off_E2ED0[0]) {
      CFDictionarySetValue((CFMutableDictionaryRef)v19, off_E2EC0[0], off_E2ED0[0]);
    }
    id v20 = [a4 displayName];
    if (v20) {
      CFDictionarySetValue((CFMutableDictionaryRef)v19, off_E2EA8[0], v20);
    }
    id v21 = -[NSMutableArray arrayByAddingObjectsFromArray:]( sub_71B44((NSMutableArray *)a4, a5),  "arrayByAddingObjectsFromArray:",  a3);
    if (v21) {
      CFDictionarySetValue((CFMutableDictionaryRef)v19, off_E2EB0[0], v21);
    }
    if (a9) {
      CFDictionarySetValue((CFMutableDictionaryRef)v19, off_E2EB8[0], a9);
    }
    incrementParticipantVersionForChat(a4);
    sub_74518(a4, 0LL);
    id v22 = [a4 properties];
    __int16 v23 = (const void *)IMDChatGroupParticipantVersionKey;
    id v24 = [v22 objectForKey:IMDChatGroupParticipantVersionKey];
    if (v24) {
      CFDictionarySetValue((CFMutableDictionaryRef)v19, v23, v24);
    }
    if (a10)
    {
      uint64_t v53 = 0LL;
      id v54 = &v53;
      uint64_t v55 = 0x2020000000LL;
      char v56 = 1;
      id v25 = (id)-[MessageGroupController _canSendMessagesWithEngram](self, "_canSendMessagesWithEngram");
      if ((_DWORD)v25)
      {
        if (IMOSLoggingEnabled(v25, v26))
        {
          int v27 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_INFO,  "engramEnabled and we are adding a participant to the engroup",  buf,  2u);
          }
        }

        int v28 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL);
        if (v28) {
          CFDictionarySetValue((CFMutableDictionaryRef)v19, off_E2F38[0], v28);
        }
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472LL;
        v52[2] = sub_746B8;
        v52[3] = &unk_D7870;
        v52[10] = a10;
        v52[11] = &v53;
        v52[4] = self;
        v52[5] = a4;
        v52[6] = a3;
        v52[7] = a7;
        v52[8] = v19;
        v52[9] = a5;
        id v25 = objc_msgSend( -[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance", v28),  "addParticipantsToENGroup:chat:service:fromID:completion:",  a3,  a4,  a8,  a5,  v52);
      }

      if (*((_BYTE *)v54 + 24))
      {
        if (IMOSLoggingEnabled(v25, v26))
        {
          id v29 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            unsigned int v30 = +[IMUserDefaults isEngramEnabled](&OBJC_CLASS___IMUserDefaults, "isEngramEnabled");
            uint64_t v31 = @"NO";
            if (v30) {
              uint64_t v31 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            id v59 = (id)v31;
            __int16 v60 = 2112;
            id v61 = a8;
            _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_INFO,  "Adding participants through legacy methods isEnabled: %@ idsService: %@",  buf,  0x16u);
          }
        }

        (*((void (**)(id, MessageGroupController *, id, id, uint64_t, void))a10 + 2))( a10,  self,  a4,  a3,  1LL,  0LL);
        if (a7)
        {
          id v32 = -[NSMutableArray arrayByAddingObjectsFromArray:]( sub_71B44((NSMutableArray *)a4, a5),  "arrayByAddingObjectsFromArray:",  a3);
          uint64_t v34 = IMOSLoggingEnabled(v32, v33);
          if ((_DWORD)v34)
          {
            BOOL v36 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
            uint64_t v34 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
            if ((_DWORD)v34)
            {
              id v37 = -[MessageServiceSession groupIDForChat:]( -[MessageGroupController session](self, "session"),  "groupIDForChat:",  a4);
              *(_DWORD *)buf = 138413058;
              id v59 = a3;
              __int16 v60 = 2112;
              id v61 = v37;
              __int16 v62 = 2112;
              id v63 = a4;
              __int16 v64 = 2112;
              v65 = v19;
              _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_INFO,  "* Adding participants: %@    groupID: %@   chat: %@   dictionary: %@",  buf,  0x2Au);
            }
          }

          if (IMOSLoggingEnabled(v34, v35))
          {
            v38 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v59 = v32;
              _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "target Participants :%@", buf, 0xCu);
            }
          }

          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          id v39 = [v32 countByEnumeratingWithState:&v48 objects:v57 count:16];
          id v42 = v39;
          if (v39)
          {
            uint64_t v43 = *(void *)v49;
            *(void *)&__int128 v41 = 138412290LL;
            __int128 v47 = v41;
            do
            {
              uint64_t v44 = 0LL;
              do
              {
                if (*(void *)v49 != v43) {
                  objc_enumerationMutation(v32);
                }
                uint64_t v45 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)v44);
                if (IMOSLoggingEnabled(v39, v40))
                {
                  uint64_t v46 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v47;
                    id v59 = v45;
                    _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "handle in target Participants :%@", buf, 0xCu);
                  }
                }

                id v39 = objc_msgSend(a7, "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:", v19, a5, v45, 0, v47);
                uint64_t v44 = (char *)v44 + 1;
              }

              while (v42 != v44);
              id v39 = [v32 countByEnumeratingWithState:&v48 objects:v57 count:16];
              id v42 = v39;
            }

            while (v39);
          }

          objc_msgSend( a7,  "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:",  v19,  a5,  objc_msgSend(a5, "_stripFZIDPrefix"),  0);
        }
      }

      _Block_object_dispose(&v53, 8);
    }
  }

- (void)removeParticipants:(id)a3 toChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 service:(id)a8 completionBlock:(id)a9
{
  id v15 = [a4 style];
  if ((_DWORD)v15 == 45)
  {
    if (IMOSLoggingEnabled(v15, v16))
    {
      uint64_t v17 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v50 = a4;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "No need to remove participants, this is a 1-1 chat: %@",  buf,  0xCu);
      }
    }

    if (a9) {
      (*((void (**)(id, MessageGroupController *, id, id, uint64_t, void))a9 + 2))( a9,  self,  a4,  a3,  1LL,  0LL);
    }
  }

  else
  {
    uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MessageGroupController _populateP2PDictionary:chat:fromID:]( self,  "_populateP2PDictionary:chat:fromID:",  v18,  a4,  a5);
    if (off_E2ED0[0]) {
      CFDictionarySetValue((CFMutableDictionaryRef)v18, off_E2EC0[0], off_E2ED0[0]);
    }
    id v19 = [a4 displayName];
    if (v19) {
      CFDictionarySetValue((CFMutableDictionaryRef)v18, off_E2EA8[0], v19);
    }
    id v20 = -[NSMutableArray arrayByExcludingObjectsInArray:]( sub_71B44((NSMutableArray *)a4, a5),  "arrayByExcludingObjectsInArray:",  a3);
    if (v20) {
      CFDictionarySetValue((CFMutableDictionaryRef)v18, off_E2EB0[0], v20);
    }
    incrementParticipantVersionForChat(a4);
    sub_74518(a4, 0LL);
    id v21 = [a4 properties];
    id v22 = (const void *)IMDChatGroupParticipantVersionKey;
    id v23 = [v21 objectForKey:IMDChatGroupParticipantVersionKey];
    if (v23) {
      CFDictionarySetValue((CFMutableDictionaryRef)v18, v22, v23);
    }
    if (a9)
    {
      uint64_t v44 = 0LL;
      uint64_t v45 = &v44;
      uint64_t v46 = 0x2020000000LL;
      char v47 = 1;
      id v24 = (id)-[MessageGroupController _canSendMessagesWithEngram](self, "_canSendMessagesWithEngram");
      if ((_DWORD)v24)
      {
        if (IMOSLoggingEnabled(v24, v25))
        {
          uint64_t v26 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_0,  v26,  OS_LOG_TYPE_INFO,  "engramEnabled and we are removing a participant from the engroup",  buf,  2u);
          }
        }

        int v27 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 1LL);
        if (v27) {
          CFDictionarySetValue((CFMutableDictionaryRef)v18, off_E2F38[0], v27);
        }
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_74E24;
        v43[3] = &unk_D7870;
        v43[10] = a9;
        v43[11] = &v44;
        v43[4] = self;
        v43[5] = a4;
        v43[6] = a3;
        v43[7] = a7;
        v43[8] = v18;
        v43[9] = a5;
        id v24 = objc_msgSend( -[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance", v27),  "removeParticipantsFromENGroup:chat:service:fromID:completion:",  a3,  a4,  a8,  a5,  v43);
      }

      if (*((_BYTE *)v45 + 24))
      {
        if (IMOSLoggingEnabled(v24, v25))
        {
          int v28 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            unsigned int v29 = +[IMUserDefaults isEngramEnabled](&OBJC_CLASS___IMUserDefaults, "isEngramEnabled");
            unsigned int v30 = @"NO";
            if (v29) {
              unsigned int v30 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            id v50 = (id)v30;
            __int16 v51 = 2112;
            id v52 = a8;
            _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_INFO,  "Removing participants with legacy methods isEngramEnabled: %@ idsService: %@",  buf,  0x16u);
          }
        }

        uint64_t v31 = (*((uint64_t (**)(id, MessageGroupController *, id, id, uint64_t, void))a9 + 2))( a9,  self,  a4,  a3,  1LL,  0LL);
        if (a7)
        {
          if (IMOSLoggingEnabled(v31, v32))
          {
            uint64_t v33 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              id v34 = -[MessageServiceSession groupIDForChat:]( -[MessageGroupController session](self, "session"),  "groupIDForChat:",  a4);
              *(_DWORD *)buf = 138413058;
              id v50 = a3;
              __int16 v51 = 2112;
              id v52 = v34;
              __int16 v53 = 2112;
              id v54 = a4;
              __int16 v55 = 2112;
              char v56 = v18;
              _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_INFO,  "* Removing participants: %@    groupID: %@   chat: %@   dictionary: %@",  buf,  0x2Au);
            }
          }

          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          id v35 = objc_msgSend(a4, "participants", 0);
          id v36 = [v35 countByEnumeratingWithState:&v39 objects:v48 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v40;
            do
            {
              for (i = 0LL; i != v36; i = (char *)i + 1)
              {
                if (*(void *)v40 != v37) {
                  objc_enumerationMutation(v35);
                }
                objc_msgSend( a7,  "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:",  v18,  a5,  objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * (void)i), "ID"),  0);
              }

              id v36 = [v35 countByEnumeratingWithState:&v39 objects:v48 count:16];
            }

            while (v36);
          }

          objc_msgSend( a7,  "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:",  v18,  a5,  objc_msgSend(a5, "_stripFZIDPrefix"),  0);
        }
      }

      _Block_object_dispose(&v44, 8);
    }
  }

- (void)leaveChat:(id)a3 fromID:(id)a4 fromAccount:(id)a5 session:(id)a6 service:(id)a7 completionBlock:(id)a8
{
  id v11 = a3;
  id v12 = [a3 style];
  if ((_DWORD)v12 == 45)
  {
    if (IMOSLoggingEnabled(v12, v13))
    {
      int v14 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v11;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "No need to leave chat, this is a 1-1 chat: %@", buf, 0xCu);
      }
    }

    if (a8) {
      (*((void (**)(id, MessageGroupController *, id, uint64_t, void))a8 + 2))(a8, self, v11, 1LL, 0LL);
    }
  }

  else if (a6)
  {
    id v44 = a8;
    id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MessageGroupController _populateP2PDictionary:chat:fromID:]( self,  "_populateP2PDictionary:chat:fromID:",  v15,  v11,  a4);
    if (off_E2ED0[0]) {
      CFDictionarySetValue((CFMutableDictionaryRef)v15, off_E2EC0[0], off_E2ED0[0]);
    }
    id v16 = [v11 displayName];
    if (v16) {
      CFDictionarySetValue((CFMutableDictionaryRef)v15, off_E2EA8[0], v16);
    }
    if (v11 && a4)
    {
      id v17 = [a4 _stripFZIDPrefix];
      uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      *(_OWORD *)id v52 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      uint64_t v43 = v11;
      id v19 = [v11 participants];
      id v20 = [v19 countByEnumeratingWithState:v52 objects:buf count:16];
      id v22 = v20;
      if (v20)
      {
        uint64_t v23 = *(void *)v53;
        do
        {
          id v24 = 0LL;
          do
          {
            if (*(void *)v53 != v23) {
              objc_enumerationMutation(v19);
            }
            uint64_t v25 = *(void **)(*(void *)&v52[8] + 8LL * (void)v24);
            if ((-[NSMutableArray containsObjectIdenticalTo:]( v18,  "containsObjectIdenticalTo:",  [v25 ID]) & 1) == 0 && !(objc_msgSend(v17, "isEqualToIgnoringCase:", objc_msgSend(v25, "ID")) & 1 | (v18 == 0))
              && [v25 ID])
            {
              CFArrayAppendValue((CFMutableArrayRef)v18, [v25 ID]);
            }

            id v24 = (char *)v24 + 1;
          }

          while (v22 != v24);
          id v20 = [v19 countByEnumeratingWithState:v52 objects:buf count:16];
          id v22 = v20;
        }

        while (v20);
      }

      if (IMOSLoggingEnabled(v20, v21))
      {
        uint64_t v26 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageService");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          id v27 = [v43 participants];
          *(_DWORD *)id v57 = 138412802;
          id v58 = v27;
          __int16 v59 = 2112;
          id v60 = a4;
          __int16 v61 = 2112;
          __int16 v62 = v18;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "chat participants %@, from %@, IDs %@", v57, 0x20u);
        }
      }

      int v28 = v18;
      id v11 = v43;
      if (v28)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)v15, off_E2EB0[0], v28);
        id v11 = v43;
      }
    }

    unsigned int v29 = v11;
    incrementParticipantVersionForChat(v11);
    sub_74518(v11, 0LL);
    id v30 = [v11 properties];
    uint64_t v31 = (const void *)IMDChatGroupParticipantVersionKey;
    id v32 = [v30 objectForKey:IMDChatGroupParticipantVersionKey];
    if (v32) {
      CFDictionarySetValue((CFMutableDictionaryRef)v15, v31, v32);
    }
    if (IMOSLoggingEnabled(v32, v33))
    {
      id v34 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = -[MessageServiceSession groupIDForChat:]( -[MessageGroupController session](self, "session"),  "groupIDForChat:",  v29);
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v35;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2112;
        __int16 v64 = v15;
        _os_log_impl( &dword_0,  v34,  OS_LOG_TYPE_INFO,  "Leaving group groupID: %@   chat: %@   dictionary: %@",  buf,  0x20u);
      }
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    LOBYTE(v64) = 1;
    id v36 = (id)-[MessageGroupController _canSendMessagesWithEngram](self, "_canSendMessagesWithEngram");
    if ((_DWORD)v36)
    {
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_75708;
      v51[3] = &unk_D7898;
      v51[10] = buf;
      v51[4] = v15;
      v51[5] = self;
      v51[6] = v29;
      v51[7] = a6;
      v51[8] = a4;
      v51[9] = v44;
      id v36 = objc_msgSend( -[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"),  "lookUpENGroupForChat:service:completion:",  v29,  a7,  v51);
    }

    if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
    {
      if (IMOSLoggingEnabled(v36, v37))
      {
        v38 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v52 = 0;
          _os_log_impl( &dword_0,  v38,  OS_LOG_TYPE_INFO,  "Engram not enabled so sending leave with legacy methods",  v52,  2u);
        }
      }

      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      id v39 = [v29 participants];
      id v40 = [v39 countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v48;
        do
        {
          for (i = 0LL; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v48 != v41) {
              objc_enumerationMutation(v39);
            }
            objc_msgSend( a6,  "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:",  v15,  a4,  objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * (void)i), "ID"),  0);
          }

          id v40 = [v39 countByEnumeratingWithState:&v47 objects:v56 count:16];
        }

        while (v40);
      }

      objc_msgSend( a6,  "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:",  v15,  a4,  objc_msgSend(a4, "_stripFZIDPrefix"),  0);
    }

    _Block_object_dispose(buf, 8);
  }

- (void)setName:(id)a3 fromName:(id)a4 forChat:(id)a5 fromID:(id)a6 fromAccount:(id)a7 messageID:(id)a8 session:(id)a9 completionBlock:(id)a10
{
  id v16 = [a5 style];
  if ((_DWORD)v16 == 45)
  {
    if (IMOSLoggingEnabled(v16, v17))
    {
      uint64_t v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = a5;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "No need to rename chat, this is a 1-1 chat: %@", buf, 0xCu);
      }
    }

    if (a10) {
      (*((void (**)(id, MessageGroupController *, id, id, uint64_t, void))a10 + 2))( a10,  self,  a5,  a3,  1LL,  0LL);
    }
  }

  else
  {
    if (a10) {
      (*((void (**)(id, MessageGroupController *, id, id, uint64_t, void))a10 + 2))( a10,  self,  a5,  a3,  1LL,  0LL);
    }
    if (a9)
    {
      id v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v20 = -[MessageGroupController _populateP2PDictionary:chat:omitName:fromID:]( self,  "_populateP2PDictionary:chat:omitName:fromID:",  v19,  a5,  1LL,  a6);
      if (off_E2EC8[0]) {
        CFDictionarySetValue((CFMutableDictionaryRef)v19, off_E2EC0[0], off_E2EC8[0]);
      }
      if (a3) {
        CFDictionarySetValue((CFMutableDictionaryRef)v19, off_E2EA8[0], a3);
      }
      if (a4) {
        CFDictionarySetValue((CFMutableDictionaryRef)v19, off_E2E98[0], a4);
      }
      if (off_E2F20[0]) {
        CFDictionarySetValue((CFMutableDictionaryRef)v19, off_E2F18[0], off_E2F20[0]);
      }
      if (IMOSLoggingEnabled(v20, v21))
      {
        id v22 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413314;
          id v33 = a4;
          __int16 v34 = 2112;
          id v35 = a3;
          __int16 v36 = 2112;
          id v37 = -[MessageServiceSession groupIDForChat:]( -[MessageGroupController session](self, "session"),  "groupIDForChat:",  a5);
          __int16 v38 = 2112;
          id v39 = a5;
          __int16 v40 = 2112;
          uint64_t v41 = v19;
          _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "Updating group name %@ => %@    groupID: %@   chat: %@   dictionary: %@",  buf,  0x34u);
        }
      }

      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      id v23 = objc_msgSend(a5, "participants", 0);
      id v24 = [v23 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v28 != v25) {
              objc_enumerationMutation(v23);
            }
            objc_msgSend( a9,  "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:toToken:messageID:",  v19,  a6,  objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)i), "ID"),  0,  0,  a8);
          }

          id v24 = [v23 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }

        while (v24);
      }

      objc_msgSend( a9,  "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:toToken:messageID:",  v19,  a6,  objc_msgSend(a6, "_stripFZIDPrefix"),  0,  0,  a8);
    }
  }

- (void)setGroupPhoto:(id)a3 forChat:(id)a4 fromID:(id)a5 fromAccount:(id)a6 session:(id)a7 isPhotoRefresh:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v14 = IMGetDomainBoolForKey(IMFeatureFlagDomain, @"FailGroupPhotoSend");
  if ((_DWORD)v14)
  {
    if (IMOSLoggingEnabled(v14, v15))
    {
      id v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "*** Not sending group photo because of FailGroupPhotoSend default",  (uint8_t *)&v31,  2u);
      }
    }

    return;
  }

  if (!a7) {
    return;
  }
  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[MessageGroupController _populateP2PDictionary:chat:fromID:]( self,  "_populateP2PDictionary:chat:fromID:",  v17,  a4,  a5);
  incrementParticipantVersionForChat(a4);
  if (off_E2ED8[0]) {
    CFDictionarySetValue((CFMutableDictionaryRef)v17, off_E2EC0[0], off_E2ED8[0]);
  }
  if (v8)
  {
    uint64_t v18 = off_E2F00[0];
    if (!off_E2F00[0]) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  uint64_t v18 = off_E2EF8[0];
  if (off_E2EF8[0]) {
LABEL_12:
  }
    CFDictionarySetValue((CFMutableDictionaryRef)v17, off_E2EF0[0], v18);
LABEL_13:
  if (a3) {
    CFDictionarySetValue((CFMutableDictionaryRef)v17, off_E2EB8[0], a3);
  }
  id v19 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a4 groupParticipantVersion]);
  if (v19) {
    CFDictionarySetValue((CFMutableDictionaryRef)v17, IMDChatGroupParticipantVersionKey, v19);
  }
  if (IMOSLoggingEnabled(v19, v20))
  {
    uint64_t v21 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v31 = 138412802;
      id v32 = -[MessageServiceSession groupIDForChat:]( -[MessageGroupController session](self, "session"),  "groupIDForChat:",  a4);
      __int16 v33 = 2112;
      id v34 = a4;
      __int16 v35 = 2112;
      __int16 v36 = v17;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_INFO,  "Updating group photo groupID: %@   chat: %@   dictionary: %@",  (uint8_t *)&v31,  0x20u);
    }
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v22 = objc_msgSend(a4, "participants", 0);
  id v23 = [v22 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend( a7,  "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:",  v17,  a5,  objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)i), "ID"),  0);
      }

      id v23 = [v22 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v23);
  }

  objc_msgSend( a7,  "_forwardP2PGroupCommand:fromPerson:toPerson:toGroup:",  v17,  a5,  objc_msgSend(a5, "_stripFZIDPrefix"),  0);
}

- (BOOL)_shouldRequestGroupPhoto:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationDate:(id)a5
{
  id v8 = [a3 groupPhotoGuid];
  uint64_t v9 = (uint64_t)[v8 length];
  if (!v9) {
    goto LABEL_11;
  }
  id v11 = -[IMDAttachmentStore attachmentWithGUID:]( +[IMDAttachmentStore sharedInstance](&OBJC_CLASS___IMDAttachmentStore, "sharedInstance"),  "attachmentWithGUID:",  v8);
  if (!v11 || (v13 = v11, id v11 = [v11 existsAtLocalPath], !(_DWORD)v11))
  {
    uint64_t v9 = IMOSLoggingEnabled(v11, v12);
    if ((_DWORD)v9)
    {
      uint64_t v20 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
      uint64_t v9 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
      if ((_DWORD)v9)
      {
        int v29 = 138412290;
        int64_t v30 = (int64_t)v8;
        _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Request group photo, we don't have a valid file transfer for group photo guid: %@",  (uint8_t *)&v29,  0xCu);
      }
    }

- (void)_populateP2PDictionary:(id)a3 chat:(id)a4 fromID:(id)a5
{
}

- (void)_populateP2PDictionary:(id)a3 chat:(id)a4 omitName:(BOOL)a5 fromID:(id)a6
{
  id v10 = -[MessageServiceSession groupIDForChat:]( -[MessageGroupController session](self, "session"),  "groupIDForChat:",  a4);
  if (v10) {
    CFDictionarySetValue((CFMutableDictionaryRef)a3, off_E2EA0[0], v10);
  }
  if (!a5)
  {
    id v11 = [a4 displayName];
    if (v11) {
      CFDictionarySetValue((CFMutableDictionaryRef)a3, off_E2F08[0], v11);
    }
  }

  uint64_t v12 = sub_71B44((NSMutableArray *)a4, a6);
  if (v12) {
    CFDictionarySetValue((CFMutableDictionaryRef)a3, off_E2E90[0], v12);
  }
  if (off_E2F20[0]) {
    CFDictionarySetValue((CFMutableDictionaryRef)a3, off_E2F18[0], off_E2F20[0]);
  }
}

- (void)_requestGroupPhotoUpdate:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5 session:(id)a6
{
  id v11 = -[NSMutableDictionary objectForKey:]( -[MessageGroupController mostRecentGroupPhotoRequestDates](self, "mostRecentGroupPhotoRequestDates"),  "objectForKey:",  [a3 guid]);
  -[NSDate timeIntervalSinceDate:](+[NSDate date](&OBJC_CLASS___NSDate, "date"), "timeIntervalSinceDate:", v11);
  double v13 = v12;
  id v14 = -[MessageGroupController _groupPhotoRequestRateLimit](self, "_groupPhotoRequestRateLimit");
  double v16 = v15;
  uint64_t v18 = IMOSLoggingEnabled(v14, v17);
  if (v13 >= v16)
  {
    if ((_DWORD)v18)
    {
      uint64_t v24 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
      uint64_t v18 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if ((_DWORD)v18)
      {
        *(_DWORD *)buf = 138412802;
        id v38 = [a3 guid];
        __int16 v39 = 2112;
        id v40 = a4;
        __int16 v41 = 2112;
        id v42 = a5;
        _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_INFO,  "Requesting group photo for chatGuid %@ from %@ to %@",  buf,  0x20u);
      }
    }

    if (IMOSLoggingEnabled(v18, v19))
    {
      uint32_t v25 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = a3;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
      }
    }

    if ([a4 length])
    {
      if ([a5 length])
      {
        if (objc_msgSend(objc_msgSend(a3, "guid"), "length"))
        {
          -[NSMutableDictionary setObject:forKey:]( -[MessageGroupController mostRecentGroupPhotoRequestDates](self, "mostRecentGroupPhotoRequestDates"),  "setObject:forKey:",  +[NSDate date](NSDate, "date"),  [a3 guid]);
          int v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          -[MessageGroupController _populateP2PDictionary:chat:fromID:]( self,  "_populateP2PDictionary:chat:fromID:",  v29,  a3,  a4);
          id v30 = +[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID");
          if (off_E2EE0[0]) {
            CFDictionarySetValue((CFMutableDictionaryRef)v29, off_E2EC0[0], off_E2EE0[0]);
          }
          if (v30) {
            CFDictionarySetValue((CFMutableDictionaryRef)v29, off_E2EE8[0], v30);
          }
          v35[0] = @"chat";
          v35[1] = @"fromIdentifier";
          v36[0] = a3;
          v36[1] = a4;
          v35[2] = @"toIdentifier";
          v35[3] = @"session";
          v36[2] = a5;
          v36[3] = a6;
          v35[4] = off_E2EE8[0];
          v36[4] = v30;
          -[NSMutableDictionary setObject:forKey:]( -[MessageGroupController groupPhotoRequestsInFlight](self, "groupPhotoRequestsInFlight"),  "setObject:forKey:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  5),  [a3 guid]);
          dispatch_time_t v31 = dispatch_time(0LL, 15000000000LL);
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472LL;
          v34[2] = sub_76850;
          v34[3] = &unk_D7150;
          v34[4] = self;
          v34[5] = a3;
          dispatch_after(v31, &_dispatch_main_q, v34);
          [a6 _forwardP2PGroupCommand:v29 fromPerson:a4 toPerson:a5 toGroup:0];
        }

        else if (IMOSLoggingEnabled(0LL, v28))
        {
          __int16 v33 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = a3;
            uint64_t v21 = "Cannot request chat, guid is nil: %@";
            id v22 = v33;
            uint32_t v23 = 12;
            goto LABEL_26;
          }
        }

        return;
      }

      id v32 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_WORD *)buf = 0;
      uint64_t v21 = "Cannot request chat, toIdentifier is nil";
    }

    else
    {
      id v32 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_WORD *)buf = 0;
      uint64_t v21 = "Cannot request chat, fromIdentifier is nil";
    }

    id v22 = v32;
    uint32_t v23 = 2;
    goto LABEL_26;
  }

  if ((_DWORD)v18)
  {
    uint64_t v20 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v11;
      __int16 v39 = 2112;
      id v40 = [a3 guid];
      uint64_t v21 = "We already requested a photo from this group at %@. not requesting again. chatGUID %@";
      id v22 = v20;
      uint32_t v23 = 22;
LABEL_26:
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, v21, buf, v23);
    }
  }

- (double)_groupPhotoRequestRateLimit
{
  uint64_t v2 = IMGetDomainIntForKey(IMFeatureFlagDomain, @"GroupPhotoRequestRateLimit");
  double result = (double)v2;
  if (v2 <= 0) {
    return 300.0;
  }
  return result;
}

- (void)requestGroupPhotoIfNecessary:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationDate:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 messageIsFromStorage:(BOOL)a8 session:(id)a9
{
  BOOL v9 = a8;
  uint64_t v16 = IMOSLoggingEnabled(self, a2);
  if ((_DWORD)v16)
  {
    uint64_t v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    uint64_t v16 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if ((_DWORD)v16)
    {
      id v19 = [a3 guid];
      uint64_t v20 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v39 = v19;
      __int16 v40 = 2048;
      if (v9) {
        uint64_t v20 = @"YES";
      }
      int64_t v41 = a4;
      __int16 v42 = 2112;
      id v43 = a5;
      __int16 v44 = 2112;
      id v45 = (id)v20;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "Requesting group photo if necessary. chatGuid %@ incomingParticipantVersion %ld incomingGroupPhotoCreationDate % @ fromStorage %@",  buf,  0x2Au);
    }
  }

  if (IMOSLoggingEnabled(v16, v17))
  {
    uint64_t v21 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = a3;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }

  BOOL v22 = -[MessageGroupController _shouldRequestGroupPhoto:incomingParticipantVersion:incomingGroupPhotoCreationDate:]( self,  "_shouldRequestGroupPhoto:incomingParticipantVersion:incomingGroupPhotoCreationDate:",  a3,  a4,  a5);
  if (!v22)
  {
    dispatch_time_t v31 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 138412290;
    id v39 = a3;
    id v32 = "Not requesting group photo for chat %@";
    __int16 v33 = v31;
    uint32_t v34 = 12;
LABEL_31:
    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, v32, buf, v34);
    return;
  }

  if (!v9)
  {
    -[MessageGroupController _requestGroupPhotoUpdate:fromIdentifier:toIdentifier:session:]( self,  "_requestGroupPhotoUpdate:fromIdentifier:toIdentifier:session:",  a3,  a7,  a6,  a9);
    return;
  }

  if (a3) {
    BOOL v24 = a7 == 0LL;
  }
  else {
    BOOL v24 = 1;
  }
  int v27 = !v24 && a6 != 0LL && a9 != 0LL;
  int v28 = IMOSLoggingEnabled(v22, v23);
  if (!v27)
  {
    if (!v28) {
      return;
    }
    __int16 v35 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 138413058;
    id v39 = a7;
    __int16 v40 = 2112;
    int64_t v41 = (int64_t)a6;
    __int16 v42 = 2112;
    id v43 = a9;
    __int16 v44 = 2112;
    id v45 = a3;
    id v32 = "Message is from storage, but an object is nil fromIdentifer: %@ toIdentifier: %@ session: %@ chat: %@";
    __int16 v33 = v35;
    uint32_t v34 = 42;
    goto LABEL_31;
  }

  if (v28)
  {
    int v29 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = [a3 guid];
      *(_DWORD *)buf = 138412802;
      id v39 = v30;
      __int16 v40 = 2112;
      int64_t v41 = (int64_t)a7;
      __int16 v42 = 2112;
      id v43 = a6;
      _os_log_impl( &dword_0,  v29,  OS_LOG_TYPE_INFO,  "Adding chat to pending group photo requests %@ fromIdentifier %@ toIdentifier %@",  buf,  0x20u);
    }
  }

  v36[0] = @"chat";
  v36[1] = @"fromIdentifier";
  v37[0] = a3;
  v37[1] = a7;
  v36[2] = @"toIdentifier";
  v36[3] = @"session";
  v37[2] = a6;
  v37[3] = a9;
  -[NSMutableDictionary setObject:forKey:]( -[MessageGroupController groupPhotoRequestsFromStorage](self, "groupPhotoRequestsFromStorage"),  "setObject:forKey:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  4),  [a3 guid]);
}

- (void)requestGroupPhotosForMessagesFromStorage
{
  if (IMOSLoggingEnabled(self, a2))
  {
    id v3 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v6 = -[NSMutableDictionary count]( -[MessageGroupController groupPhotoRequestsFromStorage](self, "groupPhotoRequestsFromStorage"),  "count");
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Requesting group photos for messages from storage %lu", buf, 0xCu);
    }
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_76DB4;
  v4[3] = &unk_D78C0;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( -[MessageGroupController groupPhotoRequestsFromStorage](self, "groupPhotoRequestsFromStorage"),  "enumerateKeysAndObjectsUsingBlock:",  v4);
  -[NSMutableDictionary removeAllObjects]( -[MessageGroupController groupPhotoRequestsFromStorage](self, "groupPhotoRequestsFromStorage"),  "removeAllObjects");
}

- (void)_sendGroupPhoto:(id)a3 toIdentifier:(id)a4 fromIdentifier:(id)a5 toToken:(id)a6 session:(id)a7 requestGUID:(id)a8
{
  uint64_t v13 = IMOSLoggingEnabled(self, a2);
  if ((_DWORD)v13)
  {
    double v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    uint64_t v13 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if ((_DWORD)v13)
    {
      *(_DWORD *)buf = 138412546;
      id v40 = a4;
      __int16 v41 = 2112;
      id v42 = [a3 guid];
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "Responding to group photo request from %@ for chatGuid %@",  buf,  0x16u);
    }
  }

  if (IMOSLoggingEnabled(v13, v14))
  {
    uint64_t v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = a3;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v17 = objc_msgSend(a3, "participants", a6);
  id v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
  id v20 = v18;
  if (v18)
  {
    uint64_t v21 = *(void *)v35;
    while (2)
    {
      BOOL v22 = 0LL;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v17);
        }
        if (objc_msgSend( objc_msgSend(a4, "_stripFZIDPrefix"),  "isEqualToString:",  objc_msgSend( objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * (void)v22), "ID"),  "_stripFZIDPrefix")))
        {
          int v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          -[MessageGroupController _populateP2PDictionary:chat:fromID:]( self,  "_populateP2PDictionary:chat:fromID:",  v28,  a3,  a5);
          if (off_E2ED8[0]) {
            CFDictionarySetValue((CFMutableDictionaryRef)v28, off_E2EC0[0], off_E2ED8[0]);
          }
          if (off_E2F00[0]) {
            CFDictionarySetValue((CFMutableDictionaryRef)v28, off_E2EF0[0], off_E2F00[0]);
          }
          int v29 = +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a3 groupParticipantVersion]);
          if (v29) {
            CFDictionarySetValue((CFMutableDictionaryRef)v28, IMDChatGroupParticipantVersionKey, v29);
          }
          id v30 = [a7 fileTransferDictionaryForChat:a3];
          if (v30) {
            CFDictionarySetValue((CFMutableDictionaryRef)v28, off_E2EB8[0], v30);
          }
          if (a8) {
            CFDictionarySetValue((CFMutableDictionaryRef)v28, off_E2EE8[0], a8);
          }
          [a7 _forwardP2PGroupCommand:v28 fromPerson:a5 toPerson:a4 toGroup:0 toToken:v32];

          return;
        }

        BOOL v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
      id v20 = v18;
      if (v18) {
        continue;
      }
      break;
    }
  }

  uint64_t v23 = IMOSLoggingEnabled(v18, v19);
  if ((_DWORD)v23)
  {
    uint32_t v25 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    uint64_t v23 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if ((_DWORD)v23)
    {
      id v26 = [a3 guid];
      *(_DWORD *)buf = 138412546;
      id v40 = a4;
      __int16 v41 = 2112;
      id v42 = v26;
      _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_INFO,  "Attempting to send group photo to someone who is not in the group. toIdentifier: %@ chatGuid: %@",  buf,  0x16u);
    }
  }

  if (IMOSLoggingEnabled(v23, v24))
  {
    int v27 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = a3;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }

- (id)_findChatFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7
{
  return -[MessageServiceSession bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:]( -[MessageGroupController session](self, "session"),  "bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:",  a3,  a4,  a5,  a6,  a7);
}

- (void)handleAddToNewGroup:(id)a3 groupID:(id)a4 groupPhotoTransferDict:(id)a5 identifier:(id)a6 session:(id)a7 toIdentifier:(id)a8 toName:(id)a9 toParticipants:(id)a10
{
  if (IMOSLoggingEnabled(self, a2))
  {
    double v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      id v35 = a4;
      __int16 v36 = 2112;
      id v37 = a6;
      __int16 v38 = 2112;
      id v39 = a8;
      __int16 v40 = 2112;
      id v41 = a9;
      __int16 v42 = 2112;
      id v43 = a10;
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "handleAddToNewGroup called. groupID %@ identifier %@ toIdentifier %@ toName %@ toParticipants %@",  buf,  0x34u);
    }
  }

  id v16 = [a7 _shouldBlackholeGroupChatFromSender:a6 toRecipient:a8 withOtherParticipants:a10 forAccount:a3];
  if ((_DWORD)v16)
  {
    if (IMOSLoggingEnabled(v16, v17))
    {
      id v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v19 = "should blackhole from participants. early returning";
LABEL_18:
        int v29 = v18;
        uint32_t v30 = 2;
LABEL_19:
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, v19, buf, v30);
      }
    }
  }

  else
  {
    id v20 = +[MessageGroupController memberDisplayIDsFromParticipants:toIdentifier:]( &OBJC_CLASS___MessageGroupController,  "memberDisplayIDsFromParticipants:toIdentifier:",  a10,  a8);
    id v21 = [v20 count];
    if ((unint64_t)v21 < 2)
    {
      if (IMOSLoggingEnabled(v21, v22))
      {
        id v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          uint64_t v19 = "added to a group chat with only one other person -- dropping this message";
          goto LABEL_18;
        }
      }
    }

    else
    {
      uint64_t v23 = +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v20 count]);
      +[MessageGroupController addMembers:toHandleInfo:]( &OBJC_CLASS___MessageGroupController,  "addMembers:toHandleInfo:",  v20,  v23);
      id v24 = -[IMDChatRegistry generateUnusedChatIdentifierForGroupChatWithAccount:]( -[MessageGroupController chatRegistry](self, "chatRegistry"),  "generateUnusedChatIdentifierForGroupChatWithAccount:",  a3);
      if (IMOSLoggingEnabled(v24, v25))
      {
        id v26 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v24;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Will create chat with identifier %@", buf, 0xCu);
        }
      }

      objc_msgSend( a7,  "didJoinChat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:",  v24,  43,  a9,  a4,  objc_msgSend(a8, "_stripFZIDPrefix"),  0,  v23);
      id v28 = -[IMDChatRegistry existingChatWithIdentifier:account:]( -[MessageGroupController chatRegistry](self, "chatRegistry"),  "existingChatWithIdentifier:account:",  v24,  a3);
      if (v28)
      {
        if (a5) {
          [a7 receivedGroupPhotoUpdate:a5 chat:v28 sender:a6 isHidden:1];
        }
      }

      else if (IMOSLoggingEnabled(0LL, v27))
      {
        dispatch_time_t v31 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v24;
          uint64_t v19 = "failed to create new chat with identifier %@";
          int v29 = v31;
          uint32_t v30 = 12;
          goto LABEL_19;
        }
      }
    }
  }

- (BOOL)shouldCompressGroupPayload:(id)a3
{
  return [a3 objectForKey:off_E2EB8[0]] == 0;
}

- (void)handler:(id)a3 account:(id)a4 groupMessagePayload:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 idsService:(id)a9 fromToken:(id)a10 timeStamp:(id)a11 storageContext:(id)a12
{
  id v15 = [a8 _stripFZIDPrefix];
  id v16 = [a7 _stripFZIDPrefix];
  id v17 = [v16 isEqualToIgnoringCase:v15];
  int v18 = (int)v17;
  if (IMOSLoggingEnabled(v17, v19))
  {
    id v20 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = @"NO";
      *(_DWORD *)buf = 138413314;
      *(void *)v148 = v15;
      if (v18) {
        id v21 = @"YES";
      }
      *(_WORD *)&v148[8] = 2112;
      id v149 = a5;
      *(_WORD *)v150 = 2112;
      *(void *)&v150[2] = v21;
      __int16 v151 = 2112;
      id v152 = v16;
      __int16 v153 = 2112;
      id v154 = a11;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Incoming group message payload from: %@   payload: %@  isReflection: %@  to: %@, timestamp: %@",  buf,  0x34u);
    }
  }

  int v141 = v18;
  id v22 = [a5 objectForKey:off_E2EC0[0]];
  id v145 = [a5 _arrayForKey:off_E2E90[0]];
  id v23 = [a5 _stringForKey:off_E2E98[0]];
  id v142 = [a5 _arrayForKey:off_E2EB0[0]];
  id v24 = [a5 _stringForKey:off_E2EA8[0]];
  id v25 = [a5 _stringForKey:off_E2EA0[0]];
  id v26 = [a5 _stringForKey:off_E2F08[0]];
  id v27 = [a5 objectForKey:off_E2F38[0]];
  if (v27) {
    BOOL v28 = (uint64_t)[v27 integerValue] < 2;
  }
  else {
    BOOL v28 = 0;
  }
  id v29 = -[IMGroupBlocklistManager isGroupInBlocklist:]( +[IMGroupBlocklistManager sharedInstance](&OBJC_CLASS___IMGroupBlocklistManager, "sharedInstance"),  "isGroupInBlocklist:",  v25);
  if (!(_DWORD)v29)
  {
    id v35 = [v22 isEqualToString:off_E2EC8[0]];
    if ((_DWORD)v35)
    {
      uint64_t v37 = IMOSLoggingEnabled(v35, v36);
      if ((_DWORD)v37)
      {
        id v39 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        uint64_t v37 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
        if ((_DWORD)v37)
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v148 = v23;
          *(_WORD *)&v148[8] = 2112;
          id v149 = v24;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Name update for %@ => %@", buf, 0x16u);
        }
      }

      uint64_t v40 = IMOSLoggingEnabled(v37, v38);
      if ((_DWORD)v40)
      {
        __int16 v42 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        uint64_t v40 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
        if ((_DWORD)v40)
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v148 = v25;
          _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "            Group ID: %@", buf, 0xCu);
        }
      }

      uint64_t v43 = IMOSLoggingEnabled(v40, v41);
      if ((_DWORD)v43)
      {
        id v45 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        uint64_t v43 = os_log_type_enabled(v45, OS_LOG_TYPE_INFO);
        if ((_DWORD)v43)
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v148 = v145;
          _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "   From participants: %@", buf, 0xCu);
        }
      }

      uint64_t v46 = IMOSLoggingEnabled(v43, v44);
      if ((_DWORD)v46)
      {
        __int128 v48 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        uint64_t v46 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
        if ((_DWORD)v46)
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v148 = v23;
          _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "           From name: %@", buf, 0xCu);
        }
      }

      if (IMOSLoggingEnabled(v46, v47))
      {
        __int128 v49 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v148 = v24;
          _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "             To name: %@", buf, 0xCu);
        }
      }

      id v50 = -[MessageGroupController _findChatFromIdentifier:toIdentifier:displayName:participants:groupID:]( self,  "_findChatFromIdentifier:toIdentifier:displayName:participants:groupID:",  v15,  v16,  v23,  v145,  v25);
      int v52 = IMOSLoggingEnabled(v50, v51);
      if (v50)
      {
        if (v52)
        {
          __int128 v53 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v148 = v24;
            _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "   Updating to display name: %@", buf, 0xCu);
          }
        }

        if (v141) {
          id v15 = 0LL;
        }
        objc_msgSend( a3,  "didReceiveDisplayNameChange:guid:fromID:toIdentifier:forChat:style:account:",  v24,  a6,  v15,  v16,  objc_msgSend(v50, "chatIdentifier"),  objc_msgSend(v50, "style"),  a4);
        return;
      }

      if (!v52) {
        return;
      }
      id v88 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (!os_log_type_enabled(v88, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_WORD *)buf = 0;
      uint64_t v32 = "   No group found";
LABEL_82:
      __int16 v33 = v88;
      uint32_t v34 = 2;
      goto LABEL_13;
    }

    if (![v22 isEqualToString:off_E2ED0[0]])
    {
      if ([v22 isEqualToString:off_E2ED8[0]])
      {
        id v76 = -[MessageGroupController _findChatFromIdentifier:toIdentifier:displayName:participants:groupID:]( self,  "_findChatFromIdentifier:toIdentifier:displayName:participants:groupID:",  v15,  v16,  v26,  v145,  v25);
        id v77 = [a5 _dictionaryForKey:off_E2EB8[0]];
        if (IMOSLoggingEnabled(v77, v78))
        {
          v79 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v148 = v76;
            _os_log_impl(&dword_0, v79, OS_LOG_TYPE_INFO, "Received group photo update for chat %@", buf, 0xCu);
          }
        }

        if (v76 && [v76 style] != 45)
        {
          id v80 = [a5 _numberForKey:IMDChatGroupParticipantVersionKey];
          id v81 = -[NSMutableDictionary objectForKey:]( -[MessageGroupController groupPhotoRequestsInFlight](self, "groupPhotoRequestsInFlight"),  "objectForKey:",  [v76 guid]);
          id v82 = [v81 _stringForKey:off_E2EE8[0]];
          if (IMOSLoggingEnabled(v82, v83))
          {
            id v84 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
            if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
            {
              id v85 = [a5 _stringForKey:off_E2EE8[0]];
              *(_DWORD *)buf = 138412546;
              *(void *)v148 = v82;
              *(_WORD *)&v148[8] = 2112;
              id v149 = v85;
              _os_log_impl( &dword_0,  v84,  OS_LOG_TYPE_INFO,  "Found an inflight request with GUID: %@, incoming GUID: %@",  buf,  0x16u);
            }
          }

          if (objc_msgSend(objc_msgSend(a5, "_stringForKey:", off_E2EE8[0]), "isEqualToString:", v82))
          {
            id v86 = [a5 _stringForKey:off_E2EF0[0]];
            unsigned int v87 = [v86 isEqualToString:off_E2F00[0]];
          }

          else
          {
            unsigned int v87 = 0;
          }

          if (objc_msgSend( objc_msgSend( objc_msgSend(v81, "_stringForKey:", @"toIdentifier"),  "_stripFZIDPrefix"),  "isEqualToString:",  objc_msgSend(v15, "_stripFZIDPrefix"))) {
            BOOL v116 = [a5 _stringForKey:off_E2EF0[0]] == 0;
          }
          else {
            BOOL v116 = 0;
          }
          id v117 = [a5 _stringForKey:off_E2EF0[0]];
          id v118 = [v117 isEqualToString:off_E2EF8[0]];
          int v119 = (int)v118;
          uint64_t v121 = v87 | v116;
          if (IMOSLoggingEnabled(v118, v120))
          {
            v122 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
            if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109888;
              *(_DWORD *)v148 = v87;
              *(_WORD *)&v148[4] = 1024;
              *(_DWORD *)&v148[6] = v116;
              LOWORD(v149) = 1024;
              *(_DWORD *)((char *)&v149 + 2) = v119;
              HIWORD(v149) = 1024;
              *(_DWORD *)v150 = (v121 | v119) ^ 1;
              _os_log_impl( &dword_0,  v122,  OS_LOG_TYPE_INFO,  "Group photo message parsed: isExplicitlyRequestedResponse: %d, isLegacyRequestedResponse: %d, isExplicit lyNewPhoto: %d, isAssumedLegacyNewPhoto: %d",  buf,  0x1Au);
            }
          }

          id v123 = [v76 groupParticipantVersion];
          if (IMOSLoggingEnabled(v123, v124))
          {
            v125 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
            if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218242;
              *(void *)v148 = v123;
              *(_WORD *)&v148[8] = 2112;
              id v149 = v80;
              _os_log_impl(&dword_0, v125, OS_LOG_TYPE_INFO, " => currentVersion %ld incomingVersion %@", buf, 0x16u);
            }
          }

          if ((uint64_t)v123 <= (int)[v80 intValue] || !v80)
          {
            if (v80)
            {
              setParticipantVersionForChat(v76, (uint64_t)[v80 integerValue]);
              sub_7177C(v76, (uint64_t)[v80 integerValue]);
              sub_74518(v76, a11);
            }

            [a3 receivedGroupPhotoUpdate:v77 chat:v76 sender:v15 isHidden:v121];
          }
        }
      }

      else
      {
        id v89 = [v22 isEqualToString:off_E2EE0[0]];
        if ((_DWORD)v89)
        {
          -[MessageGroupController _handleGroupVisualIdentityRequest:fromParticipants:groupID:identifier:session:toIdentifier:fromToken:requestGUID:]( self,  "_handleGroupVisualIdentityRequest:fromParticipants:groupID:identifier:session:toIdentifier:fromToken:requestGUID:",  v26,  v145,  v25,  v15,  a3,  v16,  a10,  [a5 _stringForKey:off_E2EE8[0]]);
        }

        else if (IMOSLoggingEnabled(v89, v90))
        {
          __int16 v91 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group ");
          if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v148 = v22;
            uint64_t v32 = "Unsupported group message command %@";
            __int16 v33 = v91;
            uint32_t v34 = 12;
            goto LABEL_13;
          }
        }
      }

      return;
    }

    if (!v23) {
      id v23 = v24;
    }
    id v140 = [a5 _dictionaryForKey:off_E2EB8[0]];
    uint64_t v55 = IMOSLoggingEnabled(v140, v54);
    if ((_DWORD)v55)
    {
      id v57 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      uint64_t v55 = os_log_type_enabled(v57, OS_LOG_TYPE_INFO);
      if ((_DWORD)v55)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v148 = v142;
        _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "Updating participants to: %@", buf, 0xCu);
      }
    }

    uint64_t v58 = IMOSLoggingEnabled(v55, v56);
    if ((_DWORD)v58)
    {
      id v60 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      uint64_t v58 = os_log_type_enabled(v60, OS_LOG_TYPE_INFO);
      if ((_DWORD)v58)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v148 = v25;
        _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "            Group ID: %@", buf, 0xCu);
      }
    }

    uint64_t v61 = IMOSLoggingEnabled(v58, v59);
    if ((_DWORD)v61)
    {
      id v63 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      uint64_t v61 = os_log_type_enabled(v63, OS_LOG_TYPE_INFO);
      if ((_DWORD)v61)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v148 = v145;
        _os_log_impl(&dword_0, v63, OS_LOG_TYPE_INFO, "   From participants: %@", buf, 0xCu);
      }
    }

    uint64_t v64 = IMOSLoggingEnabled(v61, v62);
    if ((_DWORD)v64)
    {
      id v66 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      uint64_t v64 = os_log_type_enabled(v66, OS_LOG_TYPE_INFO);
      if ((_DWORD)v64)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v148 = v23;
        _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, "           Group name: %@", buf, 0xCu);
      }
    }

    uint64_t v67 = IMOSLoggingEnabled(v64, v65);
    if ((_DWORD)v67)
    {
      id v69 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      uint64_t v67 = os_log_type_enabled(v69, OS_LOG_TYPE_INFO);
      if ((_DWORD)v67)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v148 = v142;
        _os_log_impl(&dword_0, v69, OS_LOG_TYPE_INFO, "     To participants: %@", buf, 0xCu);
      }
    }

    if (IMOSLoggingEnabled(v67, v68))
    {
      id v70 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        uint64_t v71 = @"NO";
        if (v28) {
          uint64_t v71 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)v148 = v71;
        _os_log_impl(&dword_0, v70, OS_LOG_TYPE_INFO, "    From engram device: %@", buf, 0xCu);
      }
    }

    uint64_t v72 = -[MessageGroupController _findChatFromIdentifier:toIdentifier:displayName:participants:groupID:]( self,  "_findChatFromIdentifier:toIdentifier:displayName:participants:groupID:",  v15,  v16,  v23,  v145,  v25);
    id v74 = v72;
    if (!v72) {
      goto LABEL_172;
    }
    if (objc_msgSend(-[NSMutableArray engramID](v72, "engramID"), "length")
      && -[MessageGroupController _checkForParticipantLeaveOnENGroup:groupMessagePayload:toIdentifier:fromIdentifier:service:]( self,  "_checkForParticipantLeaveOnENGroup:groupMessagePayload:toIdentifier:fromIdentifier:service:",  v74,  a5,  v16,  v15,  a9))
    {
      return;
    }

    uint64_t v72 = (NSMutableArray *)-[NSMutableArray style](v74, "style");
    if ((_DWORD)v72 == 45)
    {
LABEL_172:
      if (IMOSLoggingEnabled(v72, v73))
      {
        id v75 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v75, OS_LOG_TYPE_INFO, "   No group found", buf, 2u);
        }
      }

      -[MessageGroupController handleAddToNewGroup:groupID:groupPhotoTransferDict:identifier:session:toIdentifier:toName:toParticipants:]( self,  "handleAddToNewGroup:groupID:groupPhotoTransferDict:identifier:session:toIdentifier:toName:toParticipants:",  a4,  v25,  v140,  v15,  a3,  v16,  v24,  v142);
      return;
    }

    if (IMOSLoggingEnabled(v72, v73))
    {
      id v92 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v148 = v142;
        *(_WORD *)&v148[8] = 2112;
        id v149 = v16;
        _os_log_impl( &dword_0,  v92,  OS_LOG_TYPE_INFO,  "   Updating participants to be: %@   toIdentifier: %@",  buf,  0x16u);
      }
    }

    id v93 = [a5 _numberForKey:IMDChatGroupParticipantVersionKey];
    id v94 = -[NSMutableArray groupParticipantVersion](v74, "groupParticipantVersion");
    else {
      incrementParticipantVersionForChat(v74);
    }
    sub_74518(v74, a11);
    if (-[NSMutableArray state](v74, "state")) {
      goto LABEL_95;
    }
    id v104 = objc_msgSend(objc_msgSend(a5, "_stringForKey:", off_E2F18[0]), "length");
    if (!v104) {
      goto LABEL_95;
    }
    if (IMOSLoggingEnabled(v104, v105))
    {
      v106 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v148 = v74;
        _os_log_impl( &dword_0,  v106,  OS_LOG_TYPE_INFO,  "Incoming group participant update for unjoined chat %@",  buf,  0xCu);
      }
    }

    id v107 = [v142 containsObject:v16];
    if ((_DWORD)v107)
    {
      if (IMOSLoggingEnabled(v107, v108))
      {
        v109 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v109,  OS_LOG_TYPE_INFO,  "Looks like we are going to get added to this chat so let's take the incoming set of participants",  buf,  2u);
        }
      }

      v110 = sub_71B44(v74, 0LL);
      if (-[NSMutableArray count](v110, "count") && [v142 count])
      {
        v96 = (__CFString *)[v142 arrayByExcludingObjectsInArray:v110];
        if (IMOSLoggingEnabled(v96, v111))
        {
          v112 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
          if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v148 = v96;
            _os_log_impl(&dword_0, v112, OS_LOG_TYPE_INFO, "Adding participants %@", buf, 0xCu);
          }
        }

        _ConvergeGroupParticipants(a3, v74, (uint64_t)v25, v96, v16, v15, v141, 0, 0LL, a4);
        __int16 v95 = (__CFString *)-[NSMutableArray arrayByExcludingObjectsInArray:]( v110,  "arrayByExcludingObjectsInArray:",  v142);
        if (IMOSLoggingEnabled(v95, v113))
        {
          v114 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
          if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v148 = v95;
            _os_log_impl(&dword_0, v114, OS_LOG_TYPE_INFO, "Also remove participants we do not have now %@", buf, 0xCu);
          }
        }

        _ConvergeGroupParticipants(a3, v74, (uint64_t)v25, v95, v16, v15, v141, 0, 1LL, a4);
        char v115 = 1;
      }

      else
      {
        v96 = 0LL;
        __int16 v95 = 0LL;
        char v115 = 0;
      }

      id v133 = -[NSMutableArray style](v74, "style");
      BOOL v136 = (_DWORD)v133 != 45 && v140 != 0LL;
      int v137 = IMOSLoggingEnabled(v133, v134);
      if (v136)
      {
        if (v137)
        {
          v138 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
          if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v148 = v74;
            _os_log_impl(&dword_0, v138, OS_LOG_TYPE_INFO, "Got group photo for unjoined chat %@", buf, 0xCu);
          }
        }

        [a3 receivedGroupPhotoUpdate:v140 chat:v74 sender:v15 isHidden:1];
      }

      else if (v137)
      {
        v139 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v148 = v110;
          *(_WORD *)&v148[8] = 2112;
          id v149 = v142;
          _os_log_impl( &dword_0,  v139,  OS_LOG_TYPE_INFO,  "Empty currentParticipantsExcludingSelf %@ or toParicipants %@",  buf,  0x16u);
        }
      }

      if ((v115 & 1) != 0) {
        goto LABEL_147;
      }
    }

    else
    {
LABEL_95:
      __int16 v95 = 0LL;
      v96 = 0LL;
    }

    id v97 = [v145 count];
    if (v97 > [v142 count])
    {
      __int16 v95 = (__CFString *)[v145 arrayByExcludingObjectsInArray:v142];
      if (IMOSLoggingEnabled(v95, v98))
      {
        uint64_t v99 = (os_log_s *)OSLogHandleForIMFoundationCategory("GroupNew");
        if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v148 = v95;
          _os_log_impl(&dword_0, v99, OS_LOG_TYPE_INFO, "Participants to remove %@", buf, 0xCu);
        }
      }

      _ConvergeGroupParticipants(a3, v74, (uint64_t)v25, v95, v16, v15, v141, 1, 1LL, a4);
      goto LABEL_147;
    }

    id v100 = objc_msgSend(v142, "__imSetFromArray");
    id v101 = objc_msgSend(v145, "__imSetFromArray");
    if ([v100 isEqualToSet:v101])
    {
      id v102 = [a5 _stringForKey:off_E2F18[0]];
      if (v102)
      {
        id v88 = (os_log_s *)OSLogHandleForIMFoundationCategory("Warning");
        if (!os_log_type_enabled(v88, OS_LOG_TYPE_INFO)) {
          return;
        }
        *(_WORD *)buf = 0;
        uint64_t v32 = "GroupNew Incoming participant update has the same target and source pariticpants. Ignoring this message";
        goto LABEL_82;
      }
    }

    if ([v100 isEqualToSet:v101])
    {
      v96 = (__CFString *)objc_msgSend(v142, "arrayByExcludingObjectsInArray:", sub_71B44(v74, v16));
      v127 = (os_log_s *)OSLogHandleForIMFoundationCategory("GroupNew");
      if (!os_log_type_enabled(v127, OS_LOG_TYPE_INFO)) {
        goto LABEL_146;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v148 = v96;
      v128 = "Adding participants from Okemo Taos device, participantsToAdd:%@";
    }

    else
    {
      v96 = (__CFString *)[v142 arrayByExcludingObjectsInArray:v145];
      v127 = (os_log_s *)OSLogHandleForIMFoundationCategory("GroupNew");
      if (!os_log_type_enabled(v127, OS_LOG_TYPE_INFO)) {
        goto LABEL_146;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v148 = v96;
      v128 = "Adding participants from non Okemo Taos device, participantsToAdd:%@";
    }

    _os_log_impl(&dword_0, v127, OS_LOG_TYPE_INFO, v128, buf, 0xCu);
LABEL_146:
    _ConvergeGroupParticipants(a3, v74, (uint64_t)v25, v96, v16, v15, v141, 1, 0LL, a4);
LABEL_147:
    BOOL v130 = -[MessageGroupController _canSendMessagesWithEngram](self, "_canSendMessagesWithEngram");
    if (v130)
    {
      if (IMOSLoggingEnabled(v130, v131))
      {
        v132 = (os_log_s *)OSLogHandleForIMFoundationCategory("GroupNew");
        if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_0,  v132,  OS_LOG_TYPE_INFO,  "Engram enabled -- so going to check to see if we can perform a legacy add / remove",  buf,  2u);
        }
      }

      -[MessageGroupController _checkAndPerformLegacyAddRemove:participantsToAdd:participantsToRemove:service:fromIdentifier:]( self,  "_checkAndPerformLegacyAddRemove:participantsToAdd:participantsToRemove:service:fromIdentifier:",  v74,  v96,  v95,  a9,  v16);
    }

    return;
  }

  if (IMOSLoggingEnabled(v29, v30))
  {
    dispatch_time_t v31 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v148 = v25;
      *(_WORD *)&v148[8] = 2112;
      id v149 = a5;
      uint64_t v32 = "Ignoring group message payload because groupId(%@) is in the denylist. Payload: %@";
      __int16 v33 = v31;
      uint32_t v34 = 22;
LABEL_13:
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, v32, buf, v34);
    }
  }

- (void)_handleGroupVisualIdentityRequest:(id)a3 fromParticipants:(id)a4 groupID:(id)a5 identifier:(id)a6 session:(id)a7 toIdentifier:(id)a8 fromToken:(id)a9 requestGUID:(id)a10
{
  if (IMOSLoggingEnabled(self, a2))
  {
    id v17 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = a5;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_INFO,  "Incoming group photo request for groupID %@",  (uint8_t *)&v24,  0xCu);
    }
  }

  id v18 = -[MessageGroupController _findChatFromIdentifier:toIdentifier:displayName:participants:groupID:]( self,  "_findChatFromIdentifier:toIdentifier:displayName:participants:groupID:",  a6,  a8,  a3,  a4,  a5);
  id v19 = [v18 groupPhotoGuid];
  id v20 = [v19 length];
  if (v20 && (id v20 = objc_msgSend(objc_msgSend(a7, "fileTransferDictionaryForChat:", v18), "count")) != 0)
  {
    if (IMOSLoggingEnabled(v20, v21))
    {
      id v22 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        id v25 = v19;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Responding with group photo with guid %@", (uint8_t *)&v24, 0xCu);
      }
    }

    -[MessageGroupController _sendGroupPhoto:toIdentifier:fromIdentifier:toToken:session:requestGUID:]( self,  "_sendGroupPhoto:toIdentifier:fromIdentifier:toToken:session:requestGUID:",  v18,  a6,  a8,  a9,  a7,  a10);
  }

  else if (IMOSLoggingEnabled(v20, v21))
  {
    id v23 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group_GroupPhoto");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v18;
      _os_log_impl( &dword_0,  v23,  OS_LOG_TYPE_INFO,  "Dropping group photo request -- no group photo set or missing file transfer dictionary for chat %@",  (uint8_t *)&v24,  0xCu);
    }
  }

- (BOOL)_checkForParticipantLeaveOnENGroup:(id)a3 groupMessagePayload:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 service:(id)a7
{
  id v13 = [a4 objectForKey:off_E2F38[0]];
  id v14 = objc_msgSend(objc_msgSend(a4, "objectForKey:", off_E2F40[0]), "BOOLValue");
  if ((_DWORD)v14)
  {
    id v23 = a6;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_78FD0;
    v20[3] = &unk_D78E8;
    v20[4] = a5;
    id v14 = objc_msgSend( -[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"),  "removeParticipantsFromENGroup:chat:service:fromID:completion:",  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1),  a3,  a7,  a5,  v20);
  }

  id v16 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
  BOOL v17 = 1;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v18 = [a3 engramID];
    *(_DWORD *)buf = 138412290;
    id v22 = v18;
    _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "We received a participant update from an engramCompatibleDevice so we want to drop it if we have an engramID for this chat: %@",  buf,  0xCu);
  }

  return v17;
}

- (void)_checkAndPerformLegacyAddRemove:(id)a3 participantsToAdd:(id)a4 participantsToRemove:(id)a5 service:(id)a6 fromIdentifier:(id)a7
{
  if ([a4 count])
  {
    id v13 = objc_msgSend(objc_msgSend(a3, "engramID"), "length");
    if (v13)
    {
      if (IMOSLoggingEnabled(v13, v14))
      {
        uint64_t v15 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412546;
          id v21 = a4;
          __int16 v22 = 2112;
          id v23 = [a3 engramID];
          _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "Attempting to add participants from legacy device: %@ for engram group id: %@",  (uint8_t *)&v20,  0x16u);
        }
      }

      objc_msgSend( -[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"),  "addParticipantsToENGroup:chat:service:fromID:completion:",  a4,  a3,  a6,  a7,  &stru_D7928);
    }
  }

  if ([a5 count])
  {
    id v16 = objc_msgSend(objc_msgSend(a3, "engramID"), "length");
    if (v16)
    {
      if (IMOSLoggingEnabled(v16, v17))
      {
        id v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = [a3 engramID];
          int v20 = 138412546;
          id v21 = a5;
          __int16 v22 = 2112;
          id v23 = v19;
          _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "Attempting to remove participants from legacy device: %@ for engram group id: %@",  (uint8_t *)&v20,  0x16u);
        }
      }

      objc_msgSend( -[MessageGroupController engramControllerSharedInstance](self, "engramControllerSharedInstance"),  "removeParticipantsFromENGroup:chat:service:fromID:completion:",  a5,  a3,  a6,  a7,  &stru_D7948);
    }
  }

- (BOOL)_shouldDropMessageGroupID:(id)a3 participants:(id)a4 fromIdentifier:(id)a5 toIdentifier:(id)a6
{
  if ((IMSharedHelperAreObjectsLogicallySame(a5, a6) & 1) != 0) {
    return 0;
  }
  if ([a3 length])
  {
    id v10 = -[IMGroupBlocklistManager isGroupInBlocklist:]( +[IMGroupBlocklistManager sharedInstance](&OBJC_CLASS___IMGroupBlocklistManager, "sharedInstance"),  "isGroupInBlocklist:",  a3);
    if ((_DWORD)v10)
    {
      if (IMOSLoggingEnabled(v10, v11))
      {
        double v12 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageService");
        BOOL v9 = 1;
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
          return v9;
        }
        int v19 = 138412290;
        id v20 = a3;
        id v13 = "GroupID %@ was found in denylist, dropping message";
        uint64_t v14 = v12;
LABEL_15:
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v19, 0xCu);
        return v9;
      }

      return 1;
    }
  }

  if (-[MessageGroupController shouldDropDueToGroupSize:](self, "shouldDropDueToGroupSize:", a4)) {
    return 1;
  }
  BOOL v16 = -[MessageGroupController _participantsContainBizID:](self, "_participantsContainBizID:", a4);
  if (v16)
  {
    if (IMOSLoggingEnabled(v16, v17))
    {
      id v18 = (os_log_s *)OSLogHandleForIMFoundationCategory("MessageService");
      BOOL v9 = 1;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        return v9;
      }
      int v19 = 138412290;
      id v20 = a4;
      id v13 = "Dropping message because participant list contains biz id. participants: %@";
      uint64_t v14 = v18;
      goto LABEL_15;
    }

    return 1;
  }

  return 0;
}

- (BOOL)_participantsContainBizID:(id)a3
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v7);
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
          && ((IMStringIsBusinessID(v8) & 1) != 0
           || (objc_msgSend(objc_msgSend(v8, "lowercaseString"), "containsString:", @"urn:biz:") & 1) != 0))
        {
          LOBYTE(v4) = 1;
          return (char)v4;
        }

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v4 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }

  return (char)v4;
}

- (BOOL)shouldDropDueToGroupSize:(id)a3
{
  id v4 = objc_msgSend( -[MessageGroupController IDSServerBagiMessageSharedInstance](self, "IDSServerBagiMessageSharedInstance"),  "objectForKey:",  @"md-max-chat-participants-incoming");
  if (v4)
  {
    id v5 = [v4 unsignedIntegerValue];
    if (!v5) {
      return 0;
    }
    unint64_t v6 = (unint64_t)v5 + 1;
  }

  else
  {
    unint64_t v6 = 51LL;
  }

  id v7 = [a3 count];
  id v9 = v7;
  id v10 = (os_log_s *)OSLogHandleForIMFoundationCategory("Group");
  BOOL v11 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 134218240;
    id v14 = v9;
    __int16 v15 = 2048;
    unint64_t v16 = v6;
    _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_INFO,  "Incoming Group message has too many participants (%lu, max = %lu), should drop message",  (uint8_t *)&v13,  0x16u);
  }

  return v11;
}

- (MessageServiceSession)session
{
  return (MessageServiceSession *)objc_loadWeak((id *)&self->_session);
}

- (NSMutableDictionary)groupPhotoRequestsFromStorage
{
  return self->_groupPhotoRequestsFromStorage;
}

- (NSMutableDictionary)groupPhotoRequestsInFlight
{
  return self->_groupPhotoRequestsInFlight;
}

- (NSMutableDictionary)mostRecentGroupPhotoRequestDates
{
  return self->_mostRecentGroupPhotoRequestDates;
}

- (void).cxx_destruct
{
}

@end