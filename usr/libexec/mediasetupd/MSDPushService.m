@interface MSDPushService
+ (MSDPushService)sharedService;
- (APSConnection)connection;
- (MSDPushService)init;
- (NSArray)consumers;
- (NSData)pushToken;
- (NSString)connectionEnvironment;
- (OS_dispatch_queue)connectionQueue;
- (id)_determinePushEnvironment;
- (void)_statConnectionWithEnvironment:(id)a3;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setConnectionEnvironment:(id)a3;
- (void)setConsumers:(id)a3;
- (void)setPushToken:(id)a3;
@end

@implementation MSDPushService

- (MSDPushService)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MSDPushService;
  v2 = -[MSDPushService init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MSDPushService", 0LL);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MSDCloudManager);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    consumers = v2->_consumers;
    v2->_consumers = (NSArray *)v5;

    -[MSDPushService _statConnectionWithEnvironment:](v2, "_statConnectionWithEnvironment:", 0LL);
  }

  return v2;
}

+ (MSDPushService)sharedService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030864;
  block[3] = &unk_100060A90;
  block[4] = a1;
  if (qword_1000707F8 != -1) {
    dispatch_once(&qword_1000707F8, block);
  }
  return (MSDPushService *)(id)qword_1000707F0;
}

- (void)dealloc
{
  connection = self->_connection;
  self->_connection = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSDPushService;
  -[MSDPushService dealloc](&v4, "dealloc");
}

- (void)_statConnectionWithEnvironment:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  connectionQueue = (dispatch_queue_s *)self->_connectionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100030994;
  v7[3] = &unk_100062588;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)_determinePushEnvironment
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
  id v17 = 0LL;
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 serverPreferredPushEnvironmentWithError:&v17]);
  id v4 = v17;

  if (v3) {
    BOOL v5 = v4 == 0LL;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v3;
  if (!v5)
  {
    id v7 = sub_10003E9DC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000311C0((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
    }

    id v6 = (void *)APSEnvironmentProduction;
    if (v3) {
      id v6 = v3;
    }
  }

  id v15 = v6;

  return v15;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = a4;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 base64EncodedStringWithOptions:0]);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Did receive public token %@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = sub_10003E9DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Did receive push notification %@", buf, 0xCu);
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 topic]);
  unsigned int v9 = [v8 isEqualToString:kAPSTopic];

  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    id v11 = sub_10003E9DC();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Receive push notification with info %@",  buf,  0xCu);
    }
  }

  else
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPushService consumers](self, "consumers", 0LL));
    id v13 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * (void)v16) handlePushNotification:v5];
          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v14);
    }
  }
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = sub_10003E9DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 1024;
    BOOL v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Connection status changed %@ %d",  (uint8_t *)&v8,  0x12u);
  }
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)connectionEnvironment
{
  return self->_connectionEnvironment;
}

- (void)setConnectionEnvironment:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (NSArray)consumers
{
  return self->_consumers;
}

- (void)setConsumers:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end