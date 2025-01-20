@interface SDConnectionManager
+ (id)sharedManager;
- (NSMutableArray)companionStreams;
- (NSMutableArray)streamIdentifiers;
- (NSMutableArray)unlockSessions;
- (NSMutableDictionary)deviceStreamMap;
- (NSString)bundleID;
- (NSUUID)identifier;
- (NSXPCConnection)xpcConnection;
- (SDConnectionManager)initWithXPCConnection:(id)a3;
- (SDConnectionManagerDelegate)delegate;
- (SDServiceManager)serviceManager;
- (void)appleAccountSignedIn;
- (void)appleAccountSignedOut;
- (void)cleanUpConnections;
- (void)companionStreamClosedStreams:(id)a3;
- (void)createCompanionServiceManagerWithIdentifier:(id)a3 clientProxy:(id)a4 reply:(id)a5;
- (void)createStreamsForMessage:(id)a3 reply:(id)a4;
- (void)createUnlockManagerWithReply:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCompanionStreams:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceStreamMap:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setServiceManager:(id)a3;
- (void)setStreamIdentifiers:(id)a3;
- (void)setUnlockSessions:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)start;
- (void)unlockSessionDidFinish:(id)a3;
@end

@implementation SDConnectionManager

+ (id)sharedManager
{
  if (qword_100657000 != -1) {
    dispatch_once(&qword_100657000, &stru_1005CD520);
  }
  return (id)qword_100656FF8;
}

- (SDConnectionManager)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SDConnectionManager;
  v6 = -[SDConnectionManager init](&v23, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue([v5 _xpcConnection]);
    id v10 = sub_1001167C0(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    bundleID = v6->_bundleID;
    v6->_bundleID = (NSString *)v11;

    serviceManager = v6->_serviceManager;
    v6->_serviceManager = 0LL;

    v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    unlockSessions = v6->_unlockSessions;
    v6->_unlockSessions = v14;

    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    companionStreams = v6->_companionStreams;
    v6->_companionStreams = v16;

    v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    deviceStreamMap = v6->_deviceStreamMap;
    v6->_deviceStreamMap = v18;

    v20 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    streamIdentifiers = v6->_streamIdentifiers;
    v6->_streamIdentifiers = v20;
  }

  return v6;
}

- (void)start
{
  if (self->_xpcConnection)
  {
    +[SFCompanionXPCManager initialize](&OBJC_CLASS___SFCompanionXPCManager, "initialize");
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[SFCompanionXPCManager xpcManagerInterface]( &OBJC_CLASS___SFCompanionXPCManager,  "xpcManagerInterface"));
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v3);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    id location = 0LL;
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000A90F8;
    v10[3] = &unk_1005CB220;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v10);
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472LL;
    uint64_t v7 = sub_1000A9160;
    v8 = &unk_1005CB220;
    objc_copyWeak(&v9, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", &v5);
    v13 = @"SDConnectionManagerIdentifier";
    identifier = self->_identifier;
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &identifier,  &v13,  1LL,  v5,  v6,  v7,  v8));
    -[NSXPCConnection setUserInfo:](self->_xpcConnection, "setUserInfo:", v4);

    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

- (void)cleanUpConnections
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A92EC;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)createCompanionServiceManagerWithIdentifier:(id)a3 clientProxy:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v12 = (void (**)(void, void, void, void, void, void))v10;
  if (!v10)
  {
    uint64_t v19 = streams_log(0LL, v11);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000A9D98();
    }
    goto LABEL_17;
  }

  if (!v9)
  {
    uint64_t v21 = streams_log(v10, v11);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000A9DC4();
    }

    NSErrorDomain v23 = NSPOSIXErrorDomain;
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    v32 = @"Missing client proxy";
    v24 = &v32;
    v25 = &v31;
    goto LABEL_16;
  }

  if (!v8)
  {
    uint64_t v26 = streams_log(v10, v11);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1000A9DF0();
    }

    NSErrorDomain v23 = NSPOSIXErrorDomain;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    v30 = @"Missing identifier";
    v24 = &v30;
    v25 = &v29;
LABEL_16:
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v25,  1LL));
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  22LL,  v28));

    ((void (**)(void, void, void, void, void, os_log_s *))v12)[2](v12, 0LL, 0LL, 0LL, 0LL, v20);
LABEL_17:

    goto LABEL_20;
  }

  if (!self->_serviceManager)
  {
    v13 = -[SDServiceManager initWithClientProxy:withIdentifier:]( objc_alloc(&OBJC_CLASS___SDServiceManager),  "initWithClientProxy:withIdentifier:",  v9,  v8);
    serviceManager = self->_serviceManager;
    self->_serviceManager = v13;

    -[SDServiceManager setBundleID:](self->_serviceManager, "setBundleID:", self->_bundleID);
    -[SDServiceManager start](self->_serviceManager, "start");
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](&OBJC_CLASS___SDStatusMonitor, "sharedMonitor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 someComputerName]);

  v17 = (__CFString *)sub_100116914();
  else {
    v18 = 0LL;
  }
  ((void (**)(void, SDServiceManager *, void *, __CFString *, void *, void))v12)[2]( v12,  self->_serviceManager,  v16,  v17,  v18,  0LL);

LABEL_20:
}

- (void)createStreamsForMessage:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = streams_log(v7, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Streams are being requested from service = %@",  buf,  0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A98A8;
  block[3] = &unk_1005CB858;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)createUnlockManagerWithReply:(id)a3
{
  v4 = (void (**)(id, SDUnlockXPCSession *, void))a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SDUnlockXPCSession);
  -[SDUnlockXPCSession setDelegate:](v5, "setDelegate:", self);
  v4[2](v4, v5, 0LL);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000A9A98;
  v7[3] = &unk_1005CB480;
  v7[4] = self;
  uint64_t v8 = v5;
  id v6 = v5;
  sf_dispatch_on_main_queue(v7);
}

- (void)appleAccountSignedIn
{
  uint64_t v2 = SFMainQueue(self, a2);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_async(v3, &stru_1005CD540);
}

- (void)appleAccountSignedOut
{
  uint64_t v2 = SFMainQueue(self, a2);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_async(v3, &stru_1005CD560);
}

- (void)companionStreamClosedStreams:(id)a3
{
}

- (void)unlockSessionDidFinish:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000A9BF0;
  v4[3] = &unk_1005CB480;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  sf_dispatch_on_main_queue(v4);
}

- (SDConnectionManagerDelegate)delegate
{
  return (SDConnectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSMutableArray)companionStreams
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCompanionStreams:(id)a3
{
}

- (SDServiceManager)serviceManager
{
  return (SDServiceManager *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setServiceManager:(id)a3
{
}

- (NSMutableDictionary)deviceStreamMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDeviceStreamMap:(id)a3
{
}

- (NSMutableArray)unlockSessions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setUnlockSessions:(id)a3
{
}

- (NSMutableArray)streamIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setStreamIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end