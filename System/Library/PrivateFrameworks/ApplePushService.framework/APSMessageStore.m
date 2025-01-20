@interface APSMessageStore
+ (id)sharedInstance;
- (APSMessageStore)init;
- (id)_onQueueIncomingMessagesFromRecords:(__CFArray *)a3;
- (id)_onQueueSubscribedChannelsForRecord:(_APSChannelRecordStruct *)a3;
- (id)_onQueueSubscribedChannelsForRecords:(__CFArray *)a3;
- (id)allRegisteredChannels;
- (id)allRegisteredChannelsForEnvironment:(id)a3 userName:(id)a4;
- (id)allRegisteredChannelsForTopic:(id)a3 environment:(id)a4 userName:(id)a5;
- (id)incomingHighPriorityMessagesForEnvironment:(id)a3 pushTokens:(id)a4;
- (id)incomingMessagesForTopic:(id)a3 priority:(int64_t)a4 environment:(id)a5 pushTokens:(id)a6;
- (id)lookupChannelWithChannelID:(id)a3 andPushTopic:(id)a4 environment:(id)a5 userName:(id)a6;
- (id)pendingLowPriorityIncomingMessageTopicsForEnvironment:(id)a3 pushTokens:(id)a4;
- (id)storeOutgoingMessage:(id)a3 environment:(id)a4;
- (void)__closeDatabase;
- (void)_clearDatabaseCloseTimer;
- (void)_onQueueDeleteLowPriorityIncomingMessagesForTopic:(id)a3 environment:(id)a4 pushTokens:(id)a5;
- (void)_setDatabaseCloseTimer;
- (void)closeDatabase;
- (void)deleteChannelID:(id)a3 forTopic:(id)a4 environment:(id)a5 userName:(id)a6;
- (void)deleteIncomingMessageWithGUID:(id)a3;
- (void)deleteLowPriorityIncomingMessagesForTopic:(id)a3 environment:(id)a4 pushTokens:(id)a5;
- (void)deleteOutgoingMessageWithGUID:(id)a3;
- (void)deleteStaleIncomingLowPriorityMessagesForEnvironment:(id)a3;
- (void)markAllOutgoingMessagesAsUnsent;
- (void)markMessageWithGUID:(id)a3 asSent:(BOOL)a4;
- (void)openDatabase;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 afterDelay:(double)a4;
- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4;
- (void)storeChannel:(id)a3;
- (void)storeIncomingMessage:(id)a3 environment:(id)a4 completionBlock:(id)a5;
- (void)updateChannel:(id)a3;
@end

@implementation APSMessageStore

+ (id)sharedInstance
{
  if (qword_10014E948 != -1) {
    dispatch_once(&qword_10014E948, &stru_10011FE00);
  }
  return (id)qword_10014E950;
}

- (APSMessageStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___APSMessageStore;
  v2 = -[APSMessageStore init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[APSMessageStore performBlock:](v2, "performBlock:", &stru_10011FE20);
  }
  return v3;
}

- (void)__closeDatabase
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100086AD0;
  v2[3] = &unk_10011E4F0;
  v2[4] = self;
  sub_10009D8E8(v2, 1LL);
}

- (void)_clearDatabaseCloseTimer
{
  if (self->_pendingDatabaseClose)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "__closeDatabase",  0LL);
    self->_pendingDatabaseClose = 0;
  }

- (void)_setDatabaseCloseTimer
{
  if (self->_pendingDatabaseClose) {
    -[APSMessageStore _clearDatabaseCloseTimer](self, "_clearDatabaseCloseTimer");
  }
  self->_pendingDatabaseClose = 1;
  -[APSMessageStore performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "__closeDatabase",  0LL,  600.0);
}

- (void)closeDatabase
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100086C78;
  block[3] = &unk_10011E4F0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)openDatabase
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100086CEC;
  block[3] = &unk_10011E4F0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100086D94;
    v6[3] = &unk_10011FCD8;
    v6[4] = self;
    id v7 = v4;
    sub_10009D8E8(v6, 0LL);
  }
}

- (void)performBlock:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100086EA0;
    v8[3] = &unk_10011FCD8;
    v8[4] = self;
    id v9 = v6;
    sub_10009D948(v8, a4);
  }
}

- (void)performBlock:(id)a3 waitUntilDone:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100086FAC;
    v8[3] = &unk_10011FCD8;
    v8[4] = self;
    id v9 = v6;
    sub_10009D8E8(v8, v4);
  }
}

- (void)storeIncomingMessage:(id)a3 environment:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, id))a5;
  v11 = sub_1000896D8();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    v26 = v12;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to store incoming message %@ with guid %@ environment %@",  buf,  0x2Au);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000871B8;
  v16[3] = &unk_10011F668;
  id v17 = v8;
  v18 = self;
  id v19 = v9;
  id v20 = v12;
  id v13 = v12;
  id v14 = v9;
  id v15 = v8;
  -[APSMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v16, 1LL);
  v10[2](v10, v13);
}

- (void)deleteIncomingMessageWithGUID:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100087438;
    v6[3] = &unk_10011E4F0;
    id v7 = v4;
    -[APSMessageStore performBlock:](self, "performBlock:", v6);
  }
}

- (void)_onQueueDeleteLowPriorityIncomingMessagesForTopic:(id)a3 environment:(id)a4 pushTokens:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    *(_DWORD *)buf = 138412802;
    __int16 v23 = self;
    __int16 v24 = 2112;
    __int16 v25 = v8;
    __int16 v26 = 2112;
    __int16 v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ deleting older low-priority incoming messages for topic %@ environment %@ if needed to maintain queue of one",  buf,  0x20u);
  }

  sub_10009D8AC();
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        sub_1000A1E34( v8,  1,  (const __CFString *)objc_msgSend(v9, "name", (void)v17),  *(void *)(*((void *)&v17 + 1) + 8 * (void)v16));
        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v14);
  }
}

- (void)deleteLowPriorityIncomingMessagesForTopic:(id)a3 environment:(id)a4 pushTokens:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000876B8;
    v11[3] = &unk_10011F668;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    -[APSMessageStore performBlock:](self, "performBlock:", v11);
  }
}

- (void)deleteStaleIncomingLowPriorityMessagesForEnvironment:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100087740;
  v5[3] = &unk_10011E4F0;
  id v6 = a3;
  id v4 = v6;
  -[APSMessageStore performBlock:](self, "performBlock:", v5);
}

- (id)pendingLowPriorityIncomingMessageTopicsForEnvironment:(id)a3 pushTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  __int128 v17 = sub_1000878BC;
  __int128 v18 = sub_1000878CC;
  __int128 v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000878D4;
    v10[3] = &unk_10011FE68;
    id v11 = v7;
    id v12 = v6;
    id v13 = &v14;
    -[APSMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v10, 1LL);
  }

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (id)_onQueueIncomingMessagesFromRecords:(__CFArray *)a3
{
  if (a3 && (CFIndex Count = CFArrayGetCount(a3)) != 0)
  {
    uint64_t v5 = Count;
    id v6 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  CFArrayGetCount(a3));
    if (v5 >= 1)
    {
      for (CFIndex i = 0LL; i != v5; ++i)
      {
        id v8 = objc_autoreleasePoolPush();
        ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
        sub_1000A29BC( (uint64_t)ValueAtIndex,  0LL,  (uint64_t)&v30,  (uint64_t)&cf,  (uint64_t)&v29,  0LL,  (uint64_t)&v28,  (uint64_t)&v25,  (uint64_t)&v24,  (uint64_t)&v23,  (uint64_t)&v21,  (uint64_t)&v20,  (uint64_t)&v19,  (uint64_t)&v22,  (uint64_t)&v26,  (uint64_t)&v18,  (uint64_t)&v17);
        uint64_t v10 = APSDecodeDictionary(v25);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        if (v11 && v29)
        {
          id v12 = objc_alloc(&OBJC_CLASS___APSIncomingMessage);
          id v13 = -[APSIncomingMessage initWithTopic:userInfo:](v12, "initWithTopic:userInfo:", v29, v11);
          -[APSIncomingMessage setToken:](v13, "setToken:", cf);
          -[APSIncomingMessage setCorrelationIdentifier:](v13, "setCorrelationIdentifier:", v28);
          -[APSIncomingMessage setFromStorage:](v13, "setFromStorage:", v24);
          -[APSIncomingMessage setLastMessageFromStorage:](v13, "setLastMessageFromStorage:", v23);
          -[APSIncomingMessage setIdentifier:](v13, "setIdentifier:", v21);
          -[APSIncomingMessage setPriority:](v13, "setPriority:", v20);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)v19));
          -[APSIncomingMessage setTimestamp:](v13, "setTimestamp:", v14);

          -[APSIncomingMessage setTracingEnabled:](v13, "setTracingEnabled:", v22);
          -[APSIncomingMessage setTracingUUID:](v13, "setTracingUUID:", v26);
          -[APSIncomingMessage setPushType:](v13, "setPushType:", v18);
          -[APSIncomingMessage setPushFlags:](v13, "setPushFlags:", v17);
          if (v30) {
            -[APSIncomingMessage setGuid:](v13, "setGuid:");
          }
          -[NSMutableArray addObject:](v6, "addObject:", v13);
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v32 = self;
          __int16 v33 = 2112;
          v34 = v11;
          __int16 v35 = 2112;
          CFTypeRef v36 = v29;
          __int16 v37 = 2112;
          CFTypeRef v38 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ could not create userInfo %@ or topic %@ from payload %@",  buf,  0x2Au);
        }

        if (v30) {
          CFRelease(v30);
        }
        if (v29) {
          CFRelease(v29);
        }
        if (cf) {
          CFRelease(cf);
        }
        if (v25) {
          CFRelease(v25);
        }
        if (v26) {
          CFRelease(v26);
        }

        objc_autoreleasePoolPop(v8);
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (id)incomingMessagesForTopic:(id)a3 priority:(int64_t)a4 environment:(id)a5 pushTokens:(id)a6
{
  id v21 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v32 = 0LL;
  __int16 v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  __int16 v35 = sub_1000878BC;
  CFTypeRef v36 = sub_1000878CC;
  id v37 = 0LL;
  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v10)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100087F60;
    v26[3] = &unk_10011FE90;
    int64_t v31 = a4;
    id v27 = v21;
    CFTypeRef v29 = self;
    CFTypeRef v30 = &v32;
    id v28 = v10;
    -[APSMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v26, 1LL);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v13 = (id)v33[5];
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v16);
        if (!v11
          || (uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v22 + 1)
                                                                                 + 8LL * (void)v16), "token")),
              unsigned int v19 = [v11 containsObject:v18],
              v18,
              v19))
        {
          -[NSMutableArray addObject:](v12, "addObject:", v17);
        }

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v22 objects:v38 count:16];
    }

    while (v14);
  }

  _Block_object_dispose(&v32, 8);
  return v12;
}

- (id)incomingHighPriorityMessagesForEnvironment:(id)a3 pushTokens:(id)a4
{
  return -[APSMessageStore incomingMessagesForTopic:priority:environment:pushTokens:]( self,  "incomingMessagesForTopic:priority:environment:pushTokens:",  0LL,  10LL,  a3,  a4);
}

- (id)storeOutgoingMessage:(id)a3 environment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000896D8();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    __int128 v25 = v9;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to store outgoing message %@ with guid %@ environment %@",  buf,  0x2Au);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100088168;
  v16[3] = &unk_10011DAB8;
  id v17 = v6;
  id v10 = v9;
  id v18 = v10;
  id v19 = v7;
  id v11 = v7;
  id v12 = v6;
  -[APSMessageStore performBlock:](self, "performBlock:", v16);
  id v13 = v19;
  id v14 = v10;

  return v14;
}

- (void)deleteOutgoingMessageWithGUID:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Removing outgoing message with guid %@",  buf,  0x16u);
  }

  if ([v4 length])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100088454;
    v5[3] = &unk_10011E4F0;
    id v6 = v4;
    -[APSMessageStore performBlock:](self, "performBlock:", v5);
  }
}

- (void)markMessageWithGUID:(id)a3 asSent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v12 = self;
    __int16 v13 = 2112;
    if (v4) {
      id v7 = @"YES";
    }
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ markMessageWithGUID: %@ asSent: %@",  buf,  0x20u);
  }

  if ([v6 length])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100088594;
    v8[3] = &unk_10011FCB0;
    id v9 = v6;
    BOOL v10 = v4;
    -[APSMessageStore performBlock:](self, "performBlock:", v8);
  }
}

- (void)markAllOutgoingMessagesAsUnsent
{
}

- (void)storeChannel:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to store global channel %@",  buf,  0x16u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10008871C;
  v6[3] = &unk_10011E4F0;
  id v7 = v4;
  id v5 = v4;
  -[APSMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v6, 1LL);
}

- (void)deleteChannelID:(id)a3 forTopic:(id)a4 environment:(id)a5 userName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    __int16 v24 = self;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2112;
    id v32 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Removing channelID %@ channelTopic %@ environment %@ tokenName %@",  buf,  0x34u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000889DC;
  v18[3] = &unk_10011F668;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  -[APSMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v18, 1LL);
}

- (void)updateChannel:(id)a3
{
  if (a3)
  {
    id v8 = a3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 channelID]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v8 channelTopic]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 environment]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 tokenName]);
    -[APSMessageStore deleteChannelID:forTopic:environment:userName:]( self,  "deleteChannelID:forTopic:environment:userName:",  v4,  v5,  v6,  v7);

    -[APSMessageStore storeChannel:](self, "storeChannel:", v8);
  }

- (id)lookupChannelWithChannelID:(id)a3 andPushTopic:(id)a4 environment:(id)a5 userName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    __int16 v35 = self;
    __int16 v36 = 2112;
    id v37 = v10;
    __int16 v38 = 2112;
    id v39 = v11;
    __int16 v40 = 2112;
    id v41 = v12;
    __int16 v42 = 2112;
    id v43 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Looking for a channel subscription with channelID %@ push topic %@ environment %@ userName %@",  buf,  0x34u);
  }

  uint64_t v28 = 0LL;
  __int16 v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  __int16 v31 = sub_1000878BC;
  id v32 = sub_1000878CC;
  id v33 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100088D40;
  v21[3] = &unk_10011FED8;
  id v14 = v10;
  id v22 = v14;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  id v17 = v13;
  id v26 = self;
  __int16 v27 = &v28;
  id v25 = v17;
  -[APSMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v21, 1LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (void *)v29[5];
    *(_DWORD *)buf = 138413570;
    __int16 v35 = self;
    __int16 v36 = 2112;
    id v37 = v18;
    __int16 v38 = 2112;
    id v39 = v14;
    __int16 v40 = 2112;
    id v41 = v15;
    __int16 v42 = 2112;
    id v43 = v16;
    __int16 v44 = 2112;
    id v45 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Found channel %@ for chanelID %@ push topic %@ environment %@ userName %@",  buf,  0x3Eu);
  }

  id v19 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v19;
}

- (id)allRegisteredChannelsForTopic:(id)a3 environment:(id)a4 userName:(id)a5
{
  id v8 = a3;
  id v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v30 = v9;
    LOWORD(v31) = 2112;
    *(void *)((char *)&v31 + 2) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Getting channels for topic %@ environment %@ userName %@",  buf,  0x2Au);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  uint64_t v30 = sub_1000878BC;
  *(void *)&__int128 v31 = sub_1000878CC;
  *((void *)&v31 + 1) = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100088FF4;
  v17[3] = &unk_10011FF00;
  id v11 = v8;
  id v18 = v11;
  id v12 = v9;
  id v19 = v12;
  id v13 = v10;
  id v21 = self;
  id v22 = buf;
  id v20 = v13;
  -[APSMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v17, 1LL);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(*(void *)&buf[8] + 40LL);
    *(_DWORD *)id v23 = 138412802;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2112;
    uint64_t v28 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Found channels for topic %@: %@",  v23,  0x20u);
  }

  id v15 = *(id *)(*(void *)&buf[8] + 40LL);

  _Block_object_dispose(buf, 8);
  return v15;
}

- (id)allRegisteredChannelsForEnvironment:(id)a3 userName:(id)a4
{
  id v6 = a3;
  id v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Getting all pubsub subscriptions for environment %@ userName %@",  buf,  0x20u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  id v18 = sub_1000878BC;
  id v19 = sub_1000878CC;
  id v20 = 0LL;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100089208;
  v12[3] = &unk_10011FF28;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v15 = self;
  id v16 = buf;
  uint64_t v14 = v9;
  -[APSMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v12, 1LL);
  id v10 = *(id *)(*(void *)&buf[8] + 40LL);

  _Block_object_dispose(buf, 8);
  return v10;
}

- (id)allRegisteredChannels
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Getting all pubsub subscriptions",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_1000878BC;
  id v9 = sub_1000878CC;
  id v10 = 0LL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000893BC;
  v5[3] = &unk_10011FF50;
  void v5[4] = self;
  v5[5] = &buf;
  -[APSMessageStore performBlock:waitUntilDone:](self, "performBlock:waitUntilDone:", v5, 1LL);
  id v3 = *(id *)(*((void *)&buf + 1) + 40LL);
  _Block_object_dispose(&buf, 8);

  return v3;
}

- (id)_onQueueSubscribedChannelsForRecord:(_APSChannelRecordStruct *)a3
{
  if (a3)
  {
    Default = CFAllocatorGetDefault();
    Mutable = CFArrayCreateMutable(Default, 0LL, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, a3);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[APSMessageStore _onQueueSubscribedChannelsForRecords:]( self,  "_onQueueSubscribedChannelsForRecords:",  Mutable));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)_onQueueSubscribedChannelsForRecords:(__CFArray *)a3
{
  if (a3 && (CFIndex Count = CFArrayGetCount(a3)) != 0)
  {
    uint64_t v5 = Count;
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", Count));
    if (v5 >= 1)
    {
      for (CFIndex i = 0LL; i != v5; ++i)
      {
        uint64_t v7 = objc_autoreleasePoolPush();
        ValueAtIndex = CFArrayGetValueAtIndex(a3, i);
        sub_100009800((uint64_t)ValueAtIndex, (uint64_t)&cf, (uint64_t)&v28, (uint64_t)&v26, (uint64_t)&v25, (uint64_t)&v24);
        id v9 = (void *)cf;
        id v10 = (void *)v28;
        if (v28) {
          BOOL v11 = cf == 0LL;
        }
        else {
          BOOL v11 = 1;
        }
        if (v11 || v24 == 0LL)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 138412290;
            uint64_t v30 = self;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ could not create PKGlobalChannel from mesage store",  buf,  0xCu);
          }
        }

        else
        {
          id v13 = (void *)v25;
          uint64_t v14 = (void *)v26;
          id v15 = (id)v24;
          id v16 = v13;
          id v17 = v14;
          id v18 = v10;
          id v19 = v9;
          id v20 = objc_msgSend( objc_alloc((Class)CUTWeakLinkClass(@"PKPublicChannel", @"PushKit")),  "initWithChannelID:channelTopic:environment:tokenName:checkpoint:",  v19,  v18,  v17,  v16,  objc_msgSend(v15, "unsignedLongLongValue"));

          [v23 addObject:v20];
        }

        if (cf) {
          CFRelease(cf);
        }
        if (v28) {
          CFRelease(v28);
        }
        if (v26) {
          CFRelease(v26);
        }
        if (v25) {
          CFRelease(v25);
        }
        if (v24) {
          CFRelease(v24);
        }
        objc_autoreleasePoolPop(v7);
      }
    }
  }

  else
  {
    id v23 = 0LL;
  }

  return v23;
}

@end