@interface MSDTestInterface
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)xpcConnection;
- (NSXPCInterface)xpcInterface;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)testQueue;
- (id)getTimeStamp;
- (id)sanitizeTestLog:(id)a3;
- (unint64_t)defaultLogLevel;
- (void)pushTestEvent:(id)a3 ofType:(id)a4;
- (void)pushTestLog:(id)a3;
- (void)sendCommandsToDemod:(id)a3 replyFromDemod:(id)a4;
- (void)sendTestEvents:(id)a3;
- (void)setDefaultLogLevel:(unint64_t)a3;
- (void)setTestQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcInterface:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)start;
@end

@implementation MSDTestInterface

+ (id)sharedInstance
{
  if (qword_100125278 != -1) {
    dispatch_once(&qword_100125278, &stru_1000F94B8);
  }
  return (id)qword_100125270;
}

- (void)start
{
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.msdTestQueue", 0LL);
    -[MSDTestInterface setTestQueue:](self, "setTestQueue:", v3);

    -[MSDTestInterface setDefaultLogLevel:](self, "setDefaultLogLevel:", 1LL);
  }

  v4 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.msdtest.service");
  -[MSDTestInterface setXpcListener:](self, "setXpcListener:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestInterface xpcListener](self, "xpcListener"));
  [v5 setDelegate:self];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDTestInterface xpcListener](self, "xpcListener"));
  [v6 resume];
}

- (id)getTimeStamp
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return v3;
}

- (void)pushTestEvent:(id)a3 ofType:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v6,  v5,  0LL));

  [v8 postNotificationName:@"TestNotification" object:0 userInfo:v7];
}

- (void)sendTestEvents:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestInterface xpcConnection](self, "xpcConnection"));

  if (v5)
  {
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDTestInterface testQueue](self, "testQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100013B18;
    v7[3] = &unk_1000F94E0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = sub_10003A95C();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v5;
    __int16 v17 = 1024;
    unsigned int v18 = [v5 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received new connection.:%{public}@ procID:%d",  (uint8_t *)&v15,  0x12u);
  }

  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.private.mobilestoredemo.testInterface"]);
    v9 = v8;
    if (v8 && [v8 BOOLValue])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MSDSendTestCommand));
      [v5 setExportedInterface:v10];

      [v5 setExportedObject:self];
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MSDPushTestLog));
      [v5 setRemoteObjectInterface:v11];
      -[MSDTestInterface setXpcConnection:](self, "setXpcConnection:", v5);
      [v5 resume];
      BOOL v12 = 1;
    }

    else
    {
      id v13 = sub_10003A95C();
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "client does not have entitlement.:%{public}@",  (uint8_t *)&v15,  0xCu);
      }

      BOOL v12 = 0;
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)sendCommandsToDemod:(id)a3 replyFromDemod:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, const __CFString *))a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"getNotifications"]);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"getNotifications"]);
    unsigned int v11 = [v10 BOOLValue];

    if (v11)
    {
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      id v13 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100013EA8;
      v19[3] = &unk_1000F9508;
      v19[4] = self;
      id v14 = [v12 addObserverForName:@"TestNotification" object:0 queue:v13 usingBlock:v19];
    }
  }

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"totalDownloadThreads"]);

  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 operationQueue]);
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"totalDownloadThreads"]);
    objc_msgSend(v17, "setMaxConcurrentOperationCount:", objc_msgSend(v18, "integerValue"));
  }

  v7[2](v7, @"commands accepted");
}

- (void)pushTestLog:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDTestInterface sanitizeTestLog:](self, "sanitizeTestLog:", a3));
  if (v6)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDTestInterface xpcConnection](self, "xpcConnection"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObjectProxy]);
    [v5 pushTestLog:v6];
  }
}

- (id)sanitizeTestLog:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"testLogLevel"]);
  id v7 = [v6 integerValue];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"testLogLevel"]);
  if (v8
    && (unint64_t v9 = -[MSDTestInterface defaultLogLevel](self, "defaultLogLevel"), v8, (unint64_t)v7 <= v9))
  {
    id v10 = 0LL;
  }

  else
  {
    id v10 = v5;
  }

  return v10;
}

- (NSXPCListener)xpcListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setXpcListener:(id)a3
{
}

- (OS_dispatch_queue)testQueue
{
  return self->_testQueue;
}

- (void)setTestQueue:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCInterface)xpcInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setXpcInterface:(id)a3
{
}

- (unint64_t)defaultLogLevel
{
  return self->_defaultLogLevel;
}

- (void)setDefaultLogLevel:(unint64_t)a3
{
  self->_defaultLogLevel = a3;
}

- (void).cxx_destruct
{
}

@end