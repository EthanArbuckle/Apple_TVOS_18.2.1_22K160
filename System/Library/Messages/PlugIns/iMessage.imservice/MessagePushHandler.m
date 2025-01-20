@interface MessagePushHandler
+ (id)commandHandlerRegistry;
+ (id)localCommandHandlerRegistry;
+ (void)addLocalStandardCommandHandlersToRegistry:(id)a3;
+ (void)addStandardCommandHandlersToRegistry:(id)a3;
- (BOOL)_shouldImmediatelySendAckForMessage:(id)a3 command:(id)a4;
- (IDSAccount)account;
- (IDSService)service;
- (MessagePushHandler)initWithIDSAccount:(id)a3;
- (id)copyHandlersForEnumerating;
- (id)messageReplayObjectWithService:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6;
- (void)_service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7 isBeingReplayed:(BOOL)a8;
- (void)addListener:(id)a3;
- (void)dealloc;
- (void)removeListener:(id)a3;
- (void)replayMessage:(id)a3;
- (void)sendManualAckForMessageWithContext:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)service:(id)a3 didHintCheckingTransportLogWithReason:(int64_t)a4;
@end

@implementation MessagePushHandler

+ (id)commandHandlerRegistry
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_671F0;
  block[3] = &unk_D74D8;
  block[4] = a1;
  if (qword_E4530 != -1) {
    dispatch_once(&qword_E4530, block);
  }
  return (id)objc_claimAutoreleasedReturnValue([(id)qword_E4528 handlers]);
}

+ (void)addStandardCommandHandlersToRegistry:(id)a3
{
  id v3 = a3;
  uint64_t v4 = IMLogHandleForCategory("MessagePushHandler");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDErrorMessage";
    __int16 v36 = 2112;
    v37 = &off_DB5E8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7518 forCommand:&off_DB5E8];
  uint64_t v6 = IMLogHandleForCategory("MessagePushHandler");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDDeliveryReceipt";
    __int16 v36 = 2112;
    v37 = &off_DB600;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7538 forCommand:&off_DB600];
  uint64_t v8 = IMLogHandleForCategory("MessagePushHandler");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDReflectedDeliveryReceipt";
    __int16 v36 = 2112;
    v37 = &off_DB618;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7558 forCommand:&off_DB618];
  uint64_t v10 = IMLogHandleForCategory("MessagePushHandler");
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDReadReceipt";
    __int16 v36 = 2112;
    v37 = &off_DB630;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7578 forCommand:&off_DB630];
  uint64_t v12 = IMLogHandleForCategory("MessagePushHandler");
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDUpdateAttachmentsMessage";
    __int16 v36 = 2112;
    v37 = &off_DB648;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7598 forCommand:&off_DB648];
  uint64_t v14 = IMLogHandleForCategory("MessagePushHandler");
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDPlayedReceipt";
    __int16 v36 = 2112;
    v37 = &off_DB660;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D75B8 forCommand:&off_DB660];
  uint64_t v16 = IMLogHandleForCategory("MessagePushHandler");
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDSavedReceipt";
    __int16 v36 = 2112;
    v37 = &off_DB678;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D75D8 forCommand:&off_DB678];
  uint64_t v18 = IMLogHandleForCategory("MessagePushHandler");
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDTextMessage";
    __int16 v36 = 2112;
    v37 = &off_DB690;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D75F8 forCommand:&off_DB690];
  uint64_t v20 = IMLogHandleForCategory("MessagePushHandler");
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDLocationShareOfferCommand";
    __int16 v36 = 2112;
    v37 = &off_DB6A8;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7618 forCommand:&off_DB6A8];
  uint64_t v22 = IMLogHandleForCategory("MessagePushHandler");
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDGenericCommandMessage";
    __int16 v36 = 2112;
    v37 = &off_DB6C0;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7638 forCommand:&off_DB6C0];
  uint64_t v24 = IMLogHandleForCategory("MessagePushHandler");
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDNicknameInformationMessage";
    __int16 v36 = 2112;
    v37 = &off_DB6D8;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7658 forCommand:&off_DB6D8];
  uint64_t v26 = IMLogHandleForCategory("MessagePushHandler");
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDDeleteSyncMessage";
    __int16 v36 = 2112;
    v37 = &off_DB6F0;
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7678 forCommand:&off_DB6F0];
  uint64_t v28 = IMLogHandleForCategory("MessagePushHandler");
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDRecoverSyncMessage";
    __int16 v36 = 2112;
    v37 = &off_DB708;
    _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7698 forCommand:&off_DB708];
  uint64_t v30 = IMLogHandleForCategory("MessagePushHandler");
  v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDGenericGroupMessageCommand";
    __int16 v36 = 2112;
    v37 = &off_DB720;
    _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D76B8 forCommand:&off_DB720];
  uint64_t v32 = IMLogHandleForCategory("MessagePushHandler");
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    int v34 = 136315394;
    v35 = "FTCommandIDBalloonTransportCommand";
    __int16 v36 = 2112;
    v37 = &off_DB738;
    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v34, 0x16u);
  }

  [v3 setStandardHandler:&stru_D76D8 forCommand:&off_DB738];
}

+ (id)localCommandHandlerRegistry
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_6E580;
  block[3] = &unk_D74D8;
  block[4] = a1;
  if (qword_E32D0 != -1) {
    dispatch_once(&qword_E32D0, block);
  }
  return (id)objc_claimAutoreleasedReturnValue([(id)qword_E32C8 handlers]);
}

+ (void)addLocalStandardCommandHandlersToRegistry:(id)a3
{
  id v3 = a3;
  uint64_t v4 = IMLogHandleForCategory("MessagePushHandler");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    v13 = "IMDRelayLocalMessageTypeRemoteFileRequest";
    __int16 v14 = 2112;
    v15 = (const __CFString *)IMDRelayLocalMessageTypeRemoteFileRequest;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Adding Local Handler for command: %s (%@)", (uint8_t *)&v12, 0x16u);
  }

  [v3 setStandardHandler:&stru_D76F8 forCommand:IMDRelayLocalMessageTypeRemoteFileRequest];
  uint64_t v6 = IMLogHandleForCategory("MessagePushHandler");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    v13 = "IMDRelayLocalMessageTypeRemoteFileResponse";
    __int16 v14 = 2112;
    v15 = (const __CFString *)IMDRelayLocalMessageTypeRemoteFileResponse;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Adding Local Handler for command: %s (%@)", (uint8_t *)&v12, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7718 forCommand:IMDRelayLocalMessageTypeRemoteFileResponse];
  uint64_t v8 = IMLogHandleForCategory("MessagePushHandler");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    v13 = "kLocalMessagePayloadDataRequestKey";
    __int16 v14 = 2112;
    v15 = @"payload-data-request";
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Adding Local Handler for command: %s (%@)", (uint8_t *)&v12, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7738 forCommand:@"payload-data-request"];
  uint64_t v10 = IMLogHandleForCategory("MessagePushHandler");
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    v13 = "kLocalMessagePayloadDataResponseKey";
    __int16 v14 = 2112;
    v15 = @"payload-data-response";
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Adding Local Handler for command: %s (%@)", (uint8_t *)&v12, 0x16u);
  }

  [v3 setStandardHandler:&stru_D7758 forCommand:@"payload-data-response"];
}

- (MessagePushHandler)initWithIDSAccount:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MessagePushHandler;
  uint64_t v6 = -[MessagePushHandler init](&v25, "init");
  v7 = v6;
  if (v6)
  {
    p_account = (id *)&v6->_account;
    objc_storeStrong((id *)&v6->_account, a3);
    id v9 = [(id)objc_opt_class(v7) commandHandlerRegistry];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue([*p_account serviceName]);
    else {
      __int16 v14 = @"com.apple.madrid";
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
    unsigned int v16 = [v15 manuallyAckMessagesEnabled];

    v17 = objc_alloc(&OBJC_CLASS___IDSService);
    if (v16) {
      uint64_t v18 = -[IDSService initWithService:commands:manuallyAckMessages:]( v17,  "initWithService:commands:manuallyAckMessages:",  v14,  v12,  1LL);
    }
    else {
      uint64_t v18 = -[IDSService initWithService:commands:](v17, "initWithService:commands:", v14, v12);
    }
    idsService = v7->_idsService;
    v7->_idsService = v18;

    if (IMOSLoggingEnabled(v20, v21))
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory("MessagePushHandler");
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v12;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "supports commands: %@", buf, 0xCu);
      }
    }

    -[IDSService addDelegate:queue:](v7->_idsService, "addDelegate:queue:", v7, &_dispatch_main_q);
    *(_WORD *)&v7->_registeredForPush = 257;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MessagePushHandler;
  -[MessagePushHandler dealloc](&v3, "dealloc");
}

- (id)copyHandlersForEnumerating
{
  return -[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      id v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray nonRetainingArray](&OBJC_CLASS___NSMutableArray, "nonRetainingArray"));
      uint64_t v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }

    -[NSMutableArray addObject:](handlers, "addObject:", v7);
  }
}

- (void)removeListener:(id)a3
{
  if (!-[NSMutableArray count](self->_handlers, "count"))
  {
    handlers = self->_handlers;
    self->_handlers = 0LL;
  }

- (id)messageReplayObjectWithService:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 loginID]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueID]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceName]);

  id v14 = [[IDSTransactionLogDictionaryMessage alloc] initWithDictionary:v9 accountUniqueID:v12 fromID:v8 loginID:v11 serviceName:v13];
  return v14;
}

- (void)_service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7 isBeingReplayed:(BOOL)a8
{
  BOOL v51 = a8;
  id v54 = a3;
  id v52 = a4;
  id v13 = a5;
  id v55 = a6;
  id v56 = a7;
  id v14 = objc_autoreleasePoolPush();
  id v15 = [v13 _copyiMessageDictionaryForLogging];
  if (IMOSLoggingEnabled(v15, v16))
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory("MessagePushHandler");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v58 = v15;
      __int16 v59 = 2112;
      id v60 = v54;
      __int16 v61 = 2048;
      id v62 = v56;
      __int16 v63 = 2112;
      id v64 = v55;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_INFO,  "Received message %@ for service %@  context: %p, fromID: %@, ",  buf,  0x2Au);
    }
  }

  objc_autoreleasePoolPop(v14);
  id v53 = [[IMPowerAssertion alloc] initWithIdentifier:@"IncomingMessagePowerAssertion" timeout:10.0];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"IDSIncomingMessagePushPayload"]);
  uint64_t v20 = IDSOriginalCommandKey;
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:IDSOriginalCommandKey]);
  if (v21
    || (uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"c"])) != 0
    || (uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v20])) != 0)
  {
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v23 = sub_68284(v22, v13, @"mc");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    unsigned int v25 = [v24 BOOLValue];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"U"]);
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"U"]);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSData _IDSDataFromBase64String:](&OBJC_CLASS___NSData, "_IDSDataFromBase64String:", v28));
      uint64_t v30 = JWUUIDPushObjectToString(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    }

    else
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"U"]);
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSData);
      if ((objc_opt_isKindOfClass(v28, v32) & 1) != 0)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:@"U"]);
        uint64_t v34 = JWUUIDPushObjectToString(v33);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v34);
      }

      else
      {
        uint64_t v35 = JWUUIDPushObjectToString(0LL);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v35);
      }
    }

    if (v31) {
      unsigned int v36 = v25;
    }
    else {
      unsigned int v36 = 0;
    }
    if (v36 == 1)
    {
      id v37 = objc_msgSend((id)IMWeakLinkClass(@"IMMessagesToTrack", @"IMDaemonCore"), "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      [v38 addMessagesID:v31];
    }

    if ([v21 integerValue] == (char *)&stru_B8.size + 3)
    {
      if (IMOSLoggingEnabled(227LL, v39))
      {
        uint64_t v40 = OSLogHandleForIMFoundationCategory("MessagePushHandler");
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "Received IDS Nice message (Local Message) ", buf, 2u);
        }
      }

      v42 = (void (**)(void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue( [v13 objectForKey:@"IDSIncomingMessagePushPayload"]);
      v43 = v42;
      if (v42)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKey:IMDRelayLocalMessageDictionaryDictKey]);
        v45 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKey:IMDRelayLocalMessageDictionaryTypeKey]);
        id v46 = [(id)objc_opt_class(self) localCommandHandlerRegistry];
        v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        v48 = (void (**)(void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue( [v47 objectForKey:v45]);

        if (v48) {
          ((void (**)(void, MessagePushHandler *, void *, void *, id, id, BOOL))v48)[2]( v48,  self,  v44,  v19,  v56,  v55,  v51);
        }
      }
    }

    else
    {
      id v49 = [(id)objc_opt_class(self) commandHandlerRegistry];
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      v43 = (void (**)(void, void, void, void, void, void, void))objc_claimAutoreleasedReturnValue( [v50 objectForKey:v21]);

      if (v43) {
        ((void (**)(void, MessagePushHandler *, id, void *, id, id, BOOL))v43)[2]( v43,  self,  v13,  v19,  v56,  v55,  v51);
      }
    }
  }

  if (-[MessagePushHandler _shouldImmediatelySendAckForMessage:command:]( self,  "_shouldImmediatelySendAckForMessage:command:",  v13,  v21))
  {
    -[MessagePushHandler sendManualAckForMessageWithContext:](self, "sendManualAckForMessageWithContext:", v56);
  }
}

- (void)replayMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___IDSTransactionLogDictionaryMessage);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    if (v6)
    {
      id v8 = v6;
      id v9 = self->_idsService;
      id v10 = self->_account;
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 dictionaryValue]);
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v8 fromID]);
      int v14 = IMOSLoggingEnabled(v12, v13);
      if (v9 && v10 && v11 && v12)
      {
        if (v14)
        {
          uint64_t v15 = OSLogHandleForIMEventCategory("MessagePushHandlerReplay");
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            int v21 = 138412290;
            uint64_t v22 = (IDSService *)v8;
            _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "About to replay message dictionary after unlock %@",  (uint8_t *)&v21,  0xCu);
          }
        }

        -[MessagePushHandler _service:account:incomingTopLevelMessage:fromID:messageContext:isBeingReplayed:]( self,  "_service:account:incomingTopLevelMessage:fromID:messageContext:isBeingReplayed:",  v9,  v10,  v11,  v12,  0LL,  1LL);
      }

      else if (v14)
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory("Warning");
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v21 = 138413058;
          uint64_t v22 = v9;
          __int16 v23 = 2112;
          uint64_t v24 = v10;
          __int16 v25 = 2112;
          uint64_t v26 = v11;
          __int16 v27 = 2112;
          uint64_t v28 = v12;
          _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Got invalid input to replay message service: %@ account: %@ incomingTopLevelMessage: %@ fromID: %@ ",  (uint8_t *)&v21,  0x2Au);
        }
      }
    }

    else if (IMOSLoggingEnabled(0LL, v7))
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory("Warning");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Got passed in null replay message", (uint8_t *)&v21, 2u);
      }
    }
  }
}

- (BOOL)_shouldImmediatelySendAckForMessage:(id)a3 command:(id)a4
{
  id v5 = a3;
  if ([a4 integerValue] == &stru_20.flags)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"IDSIncomingMessageDecryptedData"]);
    char v7 = v6 == 0LL;
  }

  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)sendManualAckForMessageWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMFeatureFlags sharedFeatureFlags](&OBJC_CLASS___IMFeatureFlags, "sharedFeatureFlags"));
  unsigned int v6 = [v5 manuallyAckMessagesEnabled];

  if (v6)
  {
    if (IMOSLoggingEnabled(v7, v8))
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory("MessagePushHandler");
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Sending manual ack for messageContext %@", (uint8_t *)&v12, 0xCu);
      }
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessagePushHandler service](self, "service"));
    [v11 sendAckForMessageWithContext:v4];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v12 = a3;
  id v13 = (IDSAccount *)a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v18 = v16;
  if (self->_registeredForPush && self->_isListening && self->_account == v13)
  {
    -[MessagePushHandler _service:account:incomingTopLevelMessage:fromID:messageContext:isBeingReplayed:]( self,  "_service:account:incomingTopLevelMessage:fromID:messageContext:isBeingReplayed:",  v12,  v13,  v14,  v15,  v16,  0LL);
  }

  else if (IMOSLoggingEnabled(v16, v17))
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory("MessagePushHandler");
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = @"YES";
      if (self->_registeredForPush) {
        uint64_t v22 = @"YES";
      }
      else {
        uint64_t v22 = @"NO";
      }
      account = self->_account;
      if (!self->_isListening) {
        int v21 = @"NO";
      }
      int v24 = 138413058;
      __int16 v25 = v22;
      __int16 v26 = 2112;
      __int16 v27 = v21;
      __int16 v28 = 2112;
      v29 = v13;
      __int16 v30 = 2112;
      v31 = account;
      _os_log_impl( &dword_0,  v20,  OS_LOG_TYPE_INFO,  "Early return receiving message, registeredForPush %@ isListening %@  account: %@   _account: %@",  (uint8_t *)&v24,  0x2Au);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7
{
  id v11 = a3;
  id v12 = (IDSAccount *)a4;
  id v13 = (__CFString *)a6;
  id v14 = a7;
  id v16 = v14;
  if (self->_registeredForPush
    && self->_isListening
    && self->_account == v12
    && (id v14 = [v14 messageHadEncryptedData], (v14 & 1) != 0))
  {
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSAccount vettedAliases](v12, "vettedAliases", 0LL));
    id v18 = [v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v40;
      while (2)
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v17);
          }
          int v21 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString _stripFZIDPrefix](v13, "_stripFZIDPrefix"));
          LODWORD(v21) = [v21 isEqualToString:v22];

          if ((_DWORD)v21)
          {
            if (IMOSLoggingEnabled(v23, v24))
            {
              uint64_t v36 = OSLogHandleForIMFoundationCategory("MessagePushHandler");
              id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v45 = v13;
                _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_INFO,  "Early return message before first unlock, fromID %@ is from the same AppleID",  buf,  0xCu);
              }
            }

            goto LABEL_30;
          }
        }

        id v18 = [v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    if (IMOSLoggingEnabled(v25, v26))
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory("MessagePushHandler");
      __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Posting notification for iMessage before first unlock", buf, 2u);
      }
    }

    if (qword_E32E0 != -1) {
      dispatch_once(&qword_E32E0, &stru_D7778);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString _stripFZIDPrefix](v13, "_stripFZIDPrefix"));
    if ((objc_opt_respondsToSelector(v16, "originalGUID") & 1) != 0)
    {
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v16 performSelector:"originalGUID"]);
    }

    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([v38 UUIDString]);
    }

    off_E32D8(v30, v29);
  }

  else if (IMOSLoggingEnabled(v14, v15))
  {
    uint64_t v31 = OSLogHandleForIMFoundationCategory("MessagePushHandler");
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = @"YES";
      if (self->_registeredForPush) {
        uint64_t v34 = @"YES";
      }
      else {
        uint64_t v34 = @"NO";
      }
      account = self->_account;
      if (!self->_isListening) {
        v33 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      v45 = v34;
      __int16 v46 = 2112;
      v47 = v33;
      __int16 v48 = 2112;
      id v49 = v12;
      __int16 v50 = 2112;
      BOOL v51 = account;
      _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_INFO,  "Early return receiving message before first unlock, registeredForPush %@ isListening %@  account: %@   _account: %@",  buf,  0x2Au);
    }
  }

- (void)service:(id)a3 didHintCheckingTransportLogWithReason:(int64_t)a4
{
  if (!a4)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter", a3));
    [v4 postNotificationName:IMDMessageHistorySyncNotifyCKChatSyncControllerWantsSync object:0];
  }

- (IDSService)service
{
  return self->_idsService;
}

- (IDSAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

@end