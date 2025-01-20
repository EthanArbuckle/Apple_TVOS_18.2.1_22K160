@interface MSDPushNotificationHandler
+ (id)sharedInstance;
- (APSConnection)apsConnection;
- (MSDPushNotificationHandler)init;
- (NSString)apsToken;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)enablePushNotifications;
- (void)setApsConnection:(id)a3;
- (void)setApsToken:(id)a3;
@end

@implementation MSDPushNotificationHandler

+ (id)sharedInstance
{
  if (qword_1001255D8 != -1) {
    dispatch_once(&qword_1001255D8, &stru_1000FAC78);
  }
  return (id)qword_1001255D0;
}

- (MSDPushNotificationHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDPushNotificationHandler;
  v2 = -[MSDPushNotificationHandler init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDPushNotificationHandler setApsConnection:](v2, "setApsConnection:", 0LL);
    -[MSDPushNotificationHandler setApsToken:](v3, "setApsToken:", 0LL);
    v4 = v3;
  }

  return v3;
}

- (void)enablePushNotifications
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPushNotificationHandler apsConnection](self, "apsConnection"));

  if (!v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___APSConnection);
    uint64_t v5 = APSEnvironmentProduction;
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](&OBJC_CLASS___MSDWorkQueueSet, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pollingQueue]);
    v8 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v4,  "initWithEnvironmentName:namedDelegatePort:queue:",  v5,  @"com.apple.aps.mobilestoredemoport",  v7);
    -[MSDPushNotificationHandler setApsConnection:](self, "setApsConnection:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPushNotificationHandler apsConnection](self, "apsConnection"));
    [v9 setDelegate:self];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPushNotificationHandler apsConnection](self, "apsConnection"));
    [v10 requestTokenForTopic:@"com.apple.ist.demounit.demodevicenotifications" identifier:&stru_1000FB848];

    id v12 = (id)objc_claimAutoreleasedReturnValue(-[MSDPushNotificationHandler apsConnection](self, "apsConnection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  @"com.apple.ist.demounit.demodevicenotifications"));
    [v12 setEnabledTopics:v11];
  }

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 topic]);
  if ([v5 isEqualToString:@"com.apple.ist.demounit.demodevicenotifications"])
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v7 = sub_10003A95C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000A0104((uint64_t)v6, v8, v9);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"action"]);
    unsigned int v11 = [v10 isEqualToString:@"ping_hub"];

    if (v11)
    {
      id v12 = sub_10003A95C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Received request to ping the hub.",  (uint8_t *)&v26,  2u);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](&OBJC_CLASS___MSDMailProcessor, "sharedInstance"));
      [v14 sendPushNotificationPing];
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"action"]);
      unsigned int v16 = [v15 isEqualToString:@"collect_logs"];

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"parameters"]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"url"]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"retryAttempts"]);
        id v19 = [v18 integerValue];

        v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:@"headers"]);
        id v21 = sub_10003A95C();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138543618;
          v27 = v14;
          __int16 v28 = 2048;
          id v29 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received request to collect MobileStoreDemo logs. Upload url: %{public}@, retry attempts: %ld",  (uint8_t *)&v26,  0x16u);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[MSDS3UploadHandler sharedInstance](&OBJC_CLASS___MSDS3UploadHandler, "sharedInstance"));
        [v23 uploadDemoLogsTo:v14 HttpHeaders:v20 andMaxAttempts:v19];
      }

      else
      {
        id v24 = sub_10003A95C();
        v14 = (void *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"action"]);
          int v26 = 138543362;
          v27 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "Received invalid command from DU. %{public}@",  (uint8_t *)&v26,  0xCu);
        }
      }
    }
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "hexStringRepresentation", a3));
  -[MSDPushNotificationHandler setApsToken:](self, "setApsToken:", v7);

  id v8 = sub_10003A95C();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000A0170(self, v9);
  }
}

- (NSString)apsToken
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setApsToken:(id)a3
{
}

- (APSConnection)apsConnection
{
  return (APSConnection *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setApsConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end