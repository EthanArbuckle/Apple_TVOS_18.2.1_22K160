@interface SDAutoUnlockPairingSession
- (BOOL)useAttestedProtocol;
- (NSString)deviceID;
- (NSUUID)sessionID;
- (OS_dispatch_queue)sessionQueue;
- (OS_dispatch_source)responseTimer;
- (SDAutoUnlockAKSSession)aksSession;
- (SDAutoUnlockPairingSession)init;
- (SDAutoUnlockPairingSession)initWithDevice:(id)a3 sessionID:(id)a4;
- (SDAutoUnlockSessionDelegate)delegate;
- (SDUnlockTransport)transport;
- (id)dataFromUUID:(id)a3;
- (id)wrapPayload:(id)a3 withType:(unsigned __int16)a4;
- (id)wrapPayload:(id)a3 withType:(unsigned __int16)a4 useProxy:(BOOL)a5 senderID:(id)a6;
- (int64_t)pairingAKSSession;
- (void)handleTimerFired;
- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5 deviceID:(id)a6;
- (void)invalidate;
- (void)invalidateResponseTimer;
- (void)restartResponseTimer:(unint64_t)a3;
- (void)setAksSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setPairingAKSSession:(int64_t)a3;
- (void)setResponseTimer:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionQueue:(id)a3;
@end

@implementation SDAutoUnlockPairingSession

- (SDAutoUnlockPairingSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAutoUnlockPairingSession;
  v2 = -[SDAutoUnlockPairingSession init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.sharingd.auto-unlock.pairing-session-queue", 0LL);
    sessionQueue = v2->_sessionQueue;
    v2->_sessionQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (SDAutoUnlockPairingSession)initWithDevice:(id)a3 sessionID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = -[SDAutoUnlockPairingSession init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceID, a3);
    objc_storeStrong((id *)&v10->_sessionID, a4);
    if (v10->_sessionID)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v10->_sessionID, "UUIDString"));
      [v11 addClient:v10 forIdentifer:v12];
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockIDSController sharedController](&OBJC_CLASS___SDUnlockIDSController, "sharedController"));
    [v13 addDelegate:v10];
  }

  return v10;
}

- (void)invalidate
{
  uint64_t v3 = auto_unlock_log(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = (objc_class *)objc_opt_class(self, v5);
    id v7 = NSStringFromClass(v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    int v14 = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating %@", (uint8_t *)&v14, 0xCu);
  }

  -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
    [v10 removeClientForIdentifier:v12];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockIDSController sharedController](&OBJC_CLASS___SDUnlockIDSController, "sharedController"));
  [v13 removeDelegate:self];
}

- (SDUnlockTransport)transport
{
  if (-[SDAutoUnlockPairingSession useAttestedProtocol](self, "useAttestedProtocol")) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockIDSController sharedController](&OBJC_CLASS___SDUnlockIDSController, "sharedController"));
  }
  else {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](&OBJC_CLASS___SDAutoUnlockTransport, "sharedTransport"));
  }
  return (SDUnlockTransport *)v2;
}

- (id)wrapPayload:(id)a3 withType:(unsigned __int16)a4
{
  return -[SDAutoUnlockPairingSession wrapPayload:withType:useProxy:senderID:]( self,  "wrapPayload:withType:useProxy:senderID:",  a3,  a4,  0LL,  0LL);
}

- (id)wrapPayload:(id)a3 withType:(unsigned __int16)a4 useProxy:(BOOL)a5 senderID:(id)a6
{
  BOOL v6 = a5;
  uint64_t v7 = a4;
  id v10 = a6;
  id v11 = a3;
  v12 = objc_opt_new(&OBJC_CLASS___SDAutoUnlockSessionWrapper);
  -[SDAutoUnlockSessionWrapper setVersion:](v12, "setVersion:", 1LL);
  -[SDAutoUnlockSessionWrapper setPayload:](v12, "setPayload:", v11);

  -[SDAutoUnlockSessionWrapper setMessageType:](v12, "setMessageType:", v7);
  if (v6) {
    -[SDAutoUnlockSessionWrapper setUseProxy:](v12, "setUseProxy:", 1LL);
  }
  if (v10)
  {
    v13 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v10);
    int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession dataFromUUID:](self, "dataFromUUID:", v13));
    -[SDAutoUnlockSessionWrapper setSenderID:](v12, "setSenderID:", v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession dataFromUUID:](self, "dataFromUUID:", v16));
    -[SDAutoUnlockSessionWrapper setSessionID:](v12, "setSessionID:", v17);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v12, "data"));

  return v18;
}

- (id)dataFromUUID:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    v5[0] = 0LL;
    v5[1] = 0LL;
    [a3 getUUIDBytes:v5];
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v5, 16LL));
  }

  return v3;
}

- (void)restartResponseTimer:(unint64_t)a3
{
  uint64_t v5 = auto_unlock_log(self);
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting response timer", buf, 2u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession responseTimer](self, "responseTimer"));
  if (!v7)
  {
    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, self);
    id v8 = &_dispatch_main_q;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000110D8;
    v13[3] = &unk_1005CB220;
    objc_copyWeak(&v14, (id *)buf);
    v9 = sub_100114598(0, &_dispatch_main_q, v13);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SDAutoUnlockPairingSession setResponseTimer:](self, "setResponseTimer:", v10);

    id v11 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession responseTimer](self, "responseTimer"));
    dispatch_resume(v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

  v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession responseTimer](self, "responseTimer"));
  sub_100114638(v12, a3);
}

- (void)invalidateResponseTimer
{
  uint64_t v3 = auto_unlock_log(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "invalidateResponseTimer", v7, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession responseTimer](self, "responseTimer"));
  if (v5)
  {
    BOOL v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession responseTimer](self, "responseTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockPairingSession setResponseTimer:](self, "setResponseTimer:", 0LL);
  }

- (void)handleTimerFired
{
  uint64_t v3 = auto_unlock_log(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Response timer fired", v8, 2u);
  }

  uint64_t v5 = SFAutoUnlockErrorDomain;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = @"Request failure";
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v5,  103LL,  v6));
  -[SDAutoUnlockPairingSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v7);
}

- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5 deviceID:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001138C;
  v14[3] = &unk_1005CB248;
  unsigned __int16 v18 = a5;
  id v15 = v10;
  id v16 = v9;
  v17 = self;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(v11, v14);
}

- (SDAutoUnlockSessionDelegate)delegate
{
  return (SDAutoUnlockSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (int64_t)pairingAKSSession
{
  return self->_pairingAKSSession;
}

- (void)setPairingAKSSession:(int64_t)a3
{
  self->_pairingAKSSession = a3;
}

- (BOOL)useAttestedProtocol
{
  return self->_useAttestedProtocol;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (void)setSessionQueue:(id)a3
{
}

- (SDAutoUnlockAKSSession)aksSession
{
  return self->_aksSession;
}

- (void)setAksSession:(id)a3
{
}

- (OS_dispatch_source)responseTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setResponseTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end