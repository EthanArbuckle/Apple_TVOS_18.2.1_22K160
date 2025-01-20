@interface SOSMessage
- (BOOL)SOSTransportMessageCleanupAfterPeerMessages:(id)a3 peers:(__CFDictionary *)a4 err:(__CFError *)a5;
- (BOOL)SOSTransportMessageFlushChanges:(id)a3 err:(__CFError *)a4;
- (BOOL)SOSTransportMessageHandlePeerMessage:(id)a3 id:(__CFString *)a4 cm:(__CFData *)a5 err:(__CFError *)a6;
- (BOOL)SOSTransportMessageSendMessage:(id)a3 id:(__CFString *)a4 messageToSend:(__CFData *)a5 err:(__CFError *)a6;
- (BOOL)SOSTransportMessageSendMessageIfNeeded:(id)a3 circleName:(__CFString *)a4 pID:(__CFString *)a5 err:(__CFError *)a6;
- (BOOL)SOSTransportMessageSendMessages:(id)a3 pm:(__CFDictionary *)a4 err:(__CFError *)a5;
- (BOOL)SOSTransportMessageSyncWithPeers:(id)a3 p:(__CFSet *)a4 err:(__CFError *)a5;
- (NSString)circleName;
- (SOSAccount)account;
- (SOSMessage)initWithAccount:(id)a3 andName:(id)a4;
- (__CFDictionary)SOSTransportMessageHandlePeerMessageReturnsHandledCopy:(id)a3 peerMessages:(__CFDictionary *)a4 err:(__CFError *)a5;
- (__CFString)SOSTransportMessageGetCircleName;
- (__OpaqueSOSEngine)engine;
- (int64_t)SOSTransportMessageGetTransportType;
- (void)SOSTransportMessageCalculateNextTimer:(id)a3 rtt:(int)a4 peerid:(id)a5;
- (void)SOSTransportMessageGetEngine;
- (void)SOSTransportMessageUpdateLastMessageSentTimetstamp:(id)a3 peer:(__OpaqueSOSPeer *)a4;
- (void)SOSTransportMessageUpdateRTTs:(id)a3;
- (void)dealloc;
- (void)setAccount:(id)a3;
- (void)setCircleName:(id)a3;
- (void)setEngine:(__OpaqueSOSEngine *)a3;
@end

@implementation SOSMessage

- (SOSMessage)initWithAccount:(id)a3 andName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SOSMessage;
  v9 = -[SOSMessage init](&v16, "init");
  if (v9)
  {
    v10 = (uint64_t (**)(id, id, void))[v7 factory];
    if (v10 && (uint64_t v11 = v10[1](v10, v8, 0LL)) != 0)
    {
      v12 = *(__OpaqueSOSEngine **)v11;
      (*(void (**)(uint64_t, void))(v11 + 72))(v11, 0LL);
      if (v12) {
        CFRetain(v12);
      }
    }

    else
    {
      v12 = 0LL;
    }

    v9->_engine = v12;
    objc_storeStrong((id *)&v9->_account, a3);
    v13 = -[NSString initWithString:](objc_alloc(&OBJC_CLASS___NSString), "initWithString:", v8);
    circleName = v9->_circleName;
    v9->_circleName = v13;
  }

  return v9;
}

- (void)dealloc
{
  engine = self->_engine;
  if (engine)
  {
    self->_engine = 0LL;
    CFRelease(engine);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SOSMessage;
  -[SOSMessage dealloc](&v4, "dealloc");
}

- (void)SOSTransportMessageGetEngine
{
  if (!-[SOSMessage engine](self, "engine"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage account](self, "account"));
    objc_super v4 = (uint64_t (**)(id, void *, void))[v3 factory];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage circleName](self, "circleName"));
    if (v4 && (uint64_t v6 = v4[1](v4, v5, 0LL)) != 0)
    {
      id v7 = *(const void **)v6;
      (*(void (**)(uint64_t, void))(v6 + 72))(v6, 0LL);

      if (v7) {
        CFRetain(v7);
      }
    }

    else
    {

      id v7 = 0LL;
    }

    -[SOSMessage setEngine:](self, "setEngine:", v7);
  }

  return -[SOSMessage engine](self, "engine");
}

- (__CFString)SOSTransportMessageGetCircleName
{
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SOSMessage circleName](self, "circleName"));

  return v2;
}

- (int64_t)SOSTransportMessageGetTransportType
{
  return 0LL;
}

- (BOOL)SOSTransportMessageSendMessages:(id)a3 pm:(__CFDictionary *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)SOSTransportMessageFlushChanges:(id)a3 err:(__CFError *)a4
{
  return 1;
}

- (BOOL)SOSTransportMessageSyncWithPeers:(id)a3 p:(__CFSet *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)SOSTransportMessageCleanupAfterPeerMessages:(id)a3 peers:(__CFDictionary *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)SOSTransportMessageSendMessage:(id)a3 id:(__CFString *)a4 messageToSend:(__CFData *)a5 err:(__CFError *)a6
{
  id v10 = a3;
  CFDictionaryRef v18 = sub_100107FA8(kCFAllocatorDefault, v11, v12, v13, v14, v15, v16, v17, (uint64_t)a4, (uint64_t)a5);
  BOOL v19 = -[SOSMessage SOSTransportMessageSendMessages:pm:err:]( self,  "SOSTransportMessageSendMessages:pm:err:",  v10,  v18,  a6);

  if (v18) {
    CFRelease(v18);
  }
  return v19;
}

- (__CFDictionary)SOSTransportMessageHandlePeerMessageReturnsHandledCopy:(id)a3 peerMessages:(__CFDictionary *)a4 err:(__CFError *)a5
{
  return CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
}

- (void)SOSTransportMessageCalculateNextTimer:(id)a3 rtt:(int)a4 peerid:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = sub_10018DFDC(v7, (uint64_t)@"PeerNegotiationTimeouts");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  int v11 = 2 * a4;
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v8]);
  int v13 = v12;
  if (!v12 || (signed int v14 = [v12 intValue], a4 > 1800) || v14 < v11)
  {
    if (v11 <= 60) {
      unsigned int v15 = 60;
    }
    else {
      unsigned int v15 = 2 * a4;
    }
    if (v15 >= 0xE10) {
      uint64_t v16 = 3600LL;
    }
    else {
      uint64_t v16 = v15;
    }
    int v17 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", v16);
    [v10 setObject:v17 forKey:v8];
    CFDictionaryRef v18 = sub_10001267C("otrtimer");
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v8;
      __int16 v22 = 1024;
      int v23 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "peerID: %@ New OTR RTT: %d",  (uint8_t *)&v20,  0x12u);
    }

    sub_1001A93D0(v7, (uint64_t)@"PeerNegotiationTimeouts", (uint64_t)v10, 0LL);
  }
}

- (void)SOSTransportMessageUpdateRTTs:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage SOSTransportMessageGetAccount](self, "SOSTransportMessageGetAccount"));
  id v6 = sub_10018DFDC(v5, (uint64_t)@"kSOSAccountPeerLastSentTimestamp");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);
    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v10 timeIntervalSinceDate:v9];
      double v12 = v11;
      int v13 = sub_10001267C("otrtimer");
      signed int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v22 = v4;
        __int16 v23 = 2112;
        v24 = v10;
        __int16 v25 = 2112;
        v26 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "peerID: %@ current date: %@, stored date: %@",  buf,  0x20u);
      }

      unsigned int v15 = sub_10001267C("otrtimer");
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = (int)v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "rtt: %d", buf, 8u);
      }

      -[SOSMessage SOSTransportMessageCalculateNextTimer:rtt:peerid:]( self,  "SOSTransportMessageCalculateNextTimer:rtt:peerid:",  v5,  (int)v12,  v4);
      int v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  (int)v12,  SecCoreAnalyticsValue));
      int v20 = v17;
      CFDictionaryRef v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
      +[SecCoreAnalytics sendEvent:event:]( &OBJC_CLASS___SecCoreAnalytics,  "sendEvent:event:",  @"com.apple.security.sos.messagertt",  v18);

      [v8 removeObjectForKey:v4];
      sub_1001A93D0(v5, (uint64_t)@"kSOSAccountPeerLastSentTimestamp", (uint64_t)v8, 0LL);
    }
  }
}

- (BOOL)SOSTransportMessageHandlePeerMessage:(id)a3 id:(__CFString *)a4 cm:(__CFData *)a5 err:(__CFError *)a6
{
  id v10 = a3;
  -[SOSMessage SOSTransportMessageUpdateRTTs:](self, "SOSTransportMessageUpdateRTTs:", a4);
  id v11 = [v10 engine];
  sub_100019570(v11 != 0LL, (CFTypeRef *)a6, @"Missing engine");
  if (v11)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 SOSTransportMessageGetAccount]);
    id v13 = [v10 engine];
    id v14 = v12;
    unsigned int v15 = v14;
    uint64_t v41 = 0LL;
    v42 = &v41;
    uint64_t v43 = 0x2020000000LL;
    char v44 = 1;
    uint64_t v37 = 0LL;
    v38 = &v37;
    uint64_t v39 = 0x2020000000LL;
    char v40 = 0;
    if (v14 && [v14 accountIsChanging])
    {
      uint64_t v16 = sub_10001267C("engine");
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29[0]) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "SOSEngineHandleCodedMessage called before signing in to new account",  (uint8_t *)v29,  2u);
      }

      BOOL v18 = 1;
    }

    else
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1001BF154;
      v29[3] = &unk_100293038;
      v33 = a4;
      v34 = a5;
      v35 = a6;
      v30 = v15;
      v31 = &v41;
      id v36 = v13;
      v32 = &v37;
      int v19 = sub_1000CCE88((uint64_t)v13, (uint64_t)a4, (uint64_t)a6, v29);
      if (*((_BYTE *)v42 + 24)) {
        int v27 = v19;
      }
      else {
        int v27 = 0;
      }
      *((_BYTE *)v42 + 24) = v27;
      if (*((_BYTE *)v38 + 24))
      {
        sub_10010C930();
        int v27 = *((unsigned __int8 *)v42 + 24);
      }

      if (v27)
      {
        sub_1001CE868((uint64_t)a4, v20, v21, v22, v23, v24, v25, v26);
        BOOL v18 = *((_BYTE *)v42 + 24) != 0;
      }

      else
      {
        BOOL v18 = 0;
      }

      int v17 = v30;
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
  }

  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)SOSTransportMessageUpdateLastMessageSentTimetstamp:(id)a3 peer:(__OpaqueSOSPeer *)a4
{
  id v9 = a3;
  id v5 = sub_10018DFDC(v9, (uint64_t)@"kSOSAccountPeerLastSentTimestamp");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:*((void *)a4 + 2)]);

  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v6 setObject:v8 forKey:*((void *)a4 + 2)];

    sub_1001A93D0(v9, (uint64_t)@"kSOSAccountPeerLastSentTimestamp", (uint64_t)v6, 0LL);
  }
}

- (BOOL)SOSTransportMessageSendMessageIfNeeded:(id)a3 circleName:(__CFString *)a4 pID:(__CFString *)a5 err:(__CFError *)a6
{
  id v8 = a3;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 1;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 account]);
  BOOL v10 = sub_1001A19D8(v9, 2LL);
  id v11 = [v8 engine];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001BDFD0;
  v17[3] = &unk_100293060;
  uint64_t v20 = &v24;
  id v12 = v8;
  id v18 = v12;
  uint64_t v21 = a5;
  uint64_t v22 = a6;
  BOOL v23 = v10;
  id v13 = v9;
  id v19 = v13;
  char v14 = sub_1000CCE88((uint64_t)v11, (uint64_t)a5, (uint64_t)a6, v17);
  if (*((_BYTE *)v25 + 24)) {
    BOOL v15 = v14;
  }
  else {
    BOOL v15 = 0;
  }
  *((_BYTE *)v25 + 24) = v15;

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (__OpaqueSOSEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(__OpaqueSOSEngine *)a3
{
  self->_engine = a3;
}

- (SOSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)circleName
{
  return self->_circleName;
}

- (void)setCircleName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end