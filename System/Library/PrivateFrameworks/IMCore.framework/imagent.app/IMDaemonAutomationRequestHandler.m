@interface IMDaemonAutomationRequestHandler
- (void)_automation_markMessagesAsRead:(BOOL)a3 messageGUID:(id)a4 forChatGUID:(id)a5 fromMe:(BOOL)a6 queryID:(id)a7;
- (void)_automation_sendDictionary:(id)a3 options:(id)a4 toHandles:(id)a5;
- (void)beginRecordingMessagesToReplayDatabase:(id)a3;
- (void)debugUpdateGroupParticipantversion:(int64_t)a3 chatIdentifier:(id)a4;
- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4;
- (void)relayMessageGUID:(id)a3 completion:(id)a4;
- (void)relayMessageGUIDSent:(id)a3 onService:(id)a4 interworked:(BOOL)a5;
- (void)replayMessagesFromDatabasePath:(id)a3;
- (void)simulateAppDeletion;
- (void)simulateAppInstallation;
- (void)simulateDowngradeRequestFromID:(id)a3 fromService:(id)a4 toService:(id)a5 expirationDate:(id)a6;
- (void)simulateMessageReceive:(id)a3 serviceName:(id)a4 groupID:(id)a5 handles:(id)a6 sender:(id)a7;
- (void)simulateMessageReceive:(id)a3 serviceName:(id)a4 groupID:(id)a5 handles:(id)a6 sender:(id)a7 date:(id)a8 associatedMessageType:(int64_t)a9 associatedMessageGuid:(id)a10;
- (void)simulateMessages:(id)a3 completion:(id)a4;
- (void)simulateReceivedPendingSatelliteMessageForChatWithGUID:(id)a3;
- (void)stopRecordingMessagesReplayDatabase;
- (void)test_firstUnlockCompleted;
- (void)updateOffGridSummaryOnChatWithGUID:(id)a3 pendingMessageCount:(int64_t)a4;
@end

@implementation IMDaemonAutomationRequestHandler

- (void)simulateMessageReceive:(id)a3 serviceName:(id)a4 groupID:(id)a5 handles:(id)a6 sender:(id)a7
{
}

- (void)simulateMessageReceive:(id)a3 serviceName:(id)a4 groupID:(id)a5 handles:(id)a6 sender:(id)a7 date:(id)a8 associatedMessageType:(int64_t)a9 associatedMessageGuid:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  if (IMOSLoggingEnabled(v21, v22))
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory("ChatReceive");
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v27 = v15;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      __int16 v32 = 2112;
      id v33 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Received request to simulate receiving a message with content %@ service %@ groupID: %@ handles %@",  buf,  0x2Au);
    }
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  [v25 simulateMessageReceive:v15 serviceName:v16 groupID:v17 handles:v18 sender:v19 date:v20 associatedMessageType:a9 associatedMessageGuid:v21];
}

- (void)replayMessagesFromDatabasePath:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringGUID](&OBJC_CLASS___NSString, "stringGUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/tmp/%@-%@", v4, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  LODWORD(v5) = [v7 copyItemAtPath:v3 toPath:v6 error:0];

  if ((_DWORD)v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"-wal"]);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"-wal"]);
    [v8 copyItemAtPath:v9 toPath:v10 error:0];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingString:@"-shm"]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"-shm"]);
    [v11 copyItemAtPath:v12 toPath:v13 error:0];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDReplayController sharedInstance](&OBJC_CLASS___IMDReplayController, "sharedInstance"));
    [v14 overrideStorageControllerWithDatabaseFromPath:v6];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMDReplayController sharedInstance](&OBJC_CLASS___IMDReplayController, "sharedInstance"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000058A4;
    v16[3] = &unk_100065300;
    id v17 = v6;
    [v15 replayMessagesWithCompletion:v16];
  }
}

- (void)beginRecordingMessagesToReplayDatabase:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDReplayController sharedInstance](&OBJC_CLASS___IMDReplayController, "sharedInstance"));
  [v4 overrideStorageControllerWithDatabaseFromPath:v3];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[IMDReplayController sharedInstance](&OBJC_CLASS___IMDReplayController, "sharedInstance"));
  [v5 startRecordingReplayDatabase];
}

- (void)stopRecordingMessagesReplayDatabase
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMDReplayController sharedInstance](&OBJC_CLASS___IMDReplayController, "sharedInstance"));
  [v2 endRecordingReplayDatabase];

  id v3 = (id)objc_claimAutoreleasedReturnValue(+[IMDReplayController sharedInstance](&OBJC_CLASS___IMDReplayController, "sharedInstance"));
  [v3 restoreDefaultStoreControllerInstance];
}

- (void)_automation_sendDictionary:(id)a3 options:(id)a4 toHandles:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[IMDAccountController sharedAccountController]( &OBJC_CLASS___IMDAccountController,  "sharedAccountController"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 anySessionForServiceName:IMServiceNameiMessage]);

  objc_msgSend(v11, "_automation_sendDictionary:options:toHandles:", v9, v8, v7);
}

- (void)_automation_markMessagesAsRead:(BOOL)a3 messageGUID:(id)a4 forChatGUID:(id)a5 fromMe:(BOOL)a6 queryID:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 replyProxy]);

  if (IMOSLoggingEnabled(v16, v17))
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory("Automation");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMDClientRequestContext currentContext](&OBJC_CLASS___IMDClientRequestContext, "currentContext"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 listenerID]);
      uint64_t v22 = @"NO";
      *(_DWORD *)buf = 138413058;
      v36 = v21;
      if (v10) {
        uint64_t v22 = @"YES";
      }
      __int16 v37 = 2112;
      v38 = v22;
      __int16 v39 = 2112;
      id v40 = v11;
      __int16 v41 = 2112;
      id v42 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "AUTOMATION Request from %@ to mark as read: %@ messageGUID %@ chatGUID: %@",  buf,  0x2Au);
    }
  }

  if (v10)
  {
    buf[0] = 0;
    id v30 = 0LL;
    id v31 = 0LL;
    IMComponentsFromChatGUID(v12, &v31, &v30, buf);
    id v23 = v31;
    id v24 = v30;
    if (v8)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMDMessageStore sharedInstance](&OBJC_CLASS___IMDMessageStore, "sharedInstance"));
      id v32 = v12;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v32, 1LL));
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      id v28 = [v25 markMessagesAsReadWithChatGUIDs:v26 upToGUID:v11 readDate:v27 fromMe:1];
    }

    else
    {
      id v34 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v34, 1LL));
      uint64_t v29 = buf[0];
      id v33 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
      sub_10001B744(v25, v29, v26, 0LL, 0LL, 0LL);
    }
  }

  else
  {
    IMDMessageRecordMarkMessagesAsUnreadWithChatGUIDUpToGUIDFromMe(v12, v11, v8);
  }

  objc_msgSend(v15, "_automation_markAsReadQuery:finishedWithResult:", v13, 1);
}

- (void)logDumpAndSendMessageTo:(id)a3 forHours:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[IMDCKUtilities sharedInstance](&OBJC_CLASS___IMDCKUtilities, "sharedInstance"));
  [v6 logDumpAndSendMessageTo:v5 forHours:v4 reason:@"IMToolRequest"];
}

- (void)debugUpdateGroupParticipantversion:(int64_t)a3 chatIdentifier:(id)a4
{
  id v24 = a4;
  if (IMOSLoggingEnabled(v24, v5))
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory("Chat");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      *(_DWORD *)buf = 138412546;
      id v34 = v24;
      __int16 v35 = 2112;
      int64_t v36 = (int64_t)v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "debugUpdateGroupParticipantversion Request to update participant version of chat %@ to %@",  buf,  0x16u);
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance", v24));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v9 allExistingChatsWithIdentifier:v25 style:43]);

  if ([v26 count])
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id obj = v26;
    id v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
          id v15 = -[NSNumber initWithUnsignedInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithUnsignedInteger:", a3);
          if (IMOSLoggingEnabled(v15, v16))
          {
            uint64_t v17 = OSLogHandleForIMFoundationCategory("Group");
            uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 guid]);
              *(_DWORD *)buf = 138412546;
              id v34 = v19;
              __int16 v35 = 2048;
              int64_t v36 = a3;
              _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Setting participant version of chat %@ to %ld",  buf,  0x16u);
            }
          }

          Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          id v21 = Mutable;
          if (v15) {
            CFDictionarySetValue(Mutable, @"pv", v15);
          }
          [v14 updateProperties:v21];
        }

        id v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v11);
    }
  }

  else if (IMOSLoggingEnabled(0LL, v10))
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory("Chat");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "Did not find chat with guid %@ to update version",  buf,  0xCu);
    }
  }
}

- (void)test_firstUnlockCompleted
{
  if (IMOSLoggingEnabled(self, a2))
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory("ProtectionMerge");
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "imtool requested first unlock simulation",  v5,  2u);
    }
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMDChatRegistry sharedInstance](&OBJC_CLASS___IMDChatRegistry, "sharedInstance"));
  [v4 systemDidLeaveFirstDataProtectionLock];
}

- (void)simulateMessages:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  unint64_t v7 = sub_100038B98();
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  id v9 = self;
  sub_100038BD4(v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v8, v10);
}

- (void)updateOffGridSummaryOnChatWithGUID:(id)a3 pendingMessageCount:(int64_t)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  uint64_t v8 = v7;
  id v9 = self;
  _sSo32IMDaemonAutomationRequestHandlerC7imagentE26updateOffGridSummaryOnChat8withGUID19pendingMessageCountySS_SitF_0( v6,  v8,  a4);

  swift_bridgeObjectRelease(v8, v10);
}

- (void)simulateReceivedPendingSatelliteMessageForChatWithGUID:(id)a3
{
  uint64_t v5 = v4;
  uint64_t v6 = self;
  _sSo32IMDaemonAutomationRequestHandlerC7imagentE46simulateReceivedPendingSatelliteMessageForChat8withGUIDySS_tF_0();

  swift_bridgeObjectRelease(v5, v7);
}

- (void)simulateDowngradeRequestFromID:(id)a3 fromService:(id)a4 toService:(id)a5 expirationDate:(id)a6
{
  v26 = self;
  uint64_t v10 = type metadata accessor for Date(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v14);
  uint64_t v16 = v15;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v15);
  uint64_t v18 = v17;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5, v17);
  uint64_t v20 = v19;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a6);
  id v21 = v26;
  _sSo32IMDaemonAutomationRequestHandlerC7imagentE017simulateDowngradeC06fromID0H7Service02toJ014expirationDateySS_S2S10Foundation0M0VtF_0();

  swift_bridgeObjectRelease(v16, v22);
  swift_bridgeObjectRelease(v18, v23);
  swift_bridgeObjectRelease(v20, v24);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)relayMessageGUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  uint64_t v10 = v9;
  _Block_copy(v6);
  uint64_t v11 = self;
  sub_10003934C(v8, v10, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v10, v12);
}

- (void)relayMessageGUIDSent:(id)a3 onService:(id)a4 interworked:(BOOL)a5
{
  BOOL v5 = a5;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  uint64_t v9 = v8;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v8);
  uint64_t v11 = v10;
  uint64_t v12 = (void *)objc_opt_self(&OBJC_CLASS___IMDRelayServiceController);
  id v13 = self;
  id v14 = [v12 sharedInstance];
  if (v14)
  {
    uint64_t v15 = v14;
    NSString v16 = String._bridgeToObjectiveC()();
    id v19 = String._bridgeToObjectiveC()();
    [v15 messageSent:v16 onService:v19 compatibilityService:0 wasInterworked:v5];

    swift_bridgeObjectRelease(v9, v17);
    swift_bridgeObjectRelease(v11, v18);
  }

  else
  {
    __break(1u);
  }

- (void)simulateAppDeletion
{
  uint64_t v2 = self;
  id v3 = (id *)sub_100034C20();
  uint64_t v4 = *(void (**)(void))((swift_isaMask & *(void *)*v3) + 0xD0LL);
  id v5 = *v3;
  v4();
}

- (void)simulateAppInstallation
{
  uint64_t v2 = self;
  id v3 = (id *)sub_100034C20();
  uint64_t v4 = *(void (**)(void))((swift_isaMask & *(void *)*v3) + 0xC8LL);
  id v5 = *v3;
  v4();
}

@end