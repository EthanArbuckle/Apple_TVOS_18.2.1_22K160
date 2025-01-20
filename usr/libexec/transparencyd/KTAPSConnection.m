@interface KTAPSConnection
- (APSConnection)apsConnection;
- (KTAPSConnection)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4;
- (NSMutableArray)receivers;
- (NSString)namedDelegatePort;
- (OS_dispatch_queue)deliveryQueue;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)registerPushReceiver:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setDeliveryQueue:(id)a3;
- (void)setLog:(id)a3;
- (void)setNamedDelegatePort:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivers:(id)a3;
@end

@implementation KTAPSConnection

- (KTAPSConnection)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___KTAPSConnection;
  v7 = -[KTAPSConnection init](&v26, "init");
  v8 = v7;
  if (v7)
  {
    -[KTAPSConnection setNamedDelegatePort:](v7, "setNamedDelegatePort:", v6);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("aps-queue", v10);
    -[KTAPSConnection setQueue:](v8, "setQueue:", v11);

    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("aps-delivery-queue", v13);
    -[KTAPSConnection setDeliveryQueue:](v8, "setDeliveryQueue:", v14);

    v15 = -[objc_class alloc](a4, "alloc");
    uint64_t v16 = APSEnvironmentProduction;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTAPSConnection queue](v8, "queue"));
    v18 = -[objc_class initWithEnvironmentName:namedDelegatePort:queue:]( v15,  "initWithEnvironmentName:namedDelegatePort:queue:",  v16,  v6,  v17);
    -[KTAPSConnection setApsConnection:](v8, "setApsConnection:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTAPSConnection apsConnection](v8, "apsConnection"));
    [v19 setDelegate:v8];

    os_log_t v20 = os_log_create("com.apple.Transparency", "KTAPSConnection");
    -[KTAPSConnection setLog:](v8, "setLog:", v20);

    v27 = @"com.apple.icloud-container.com.apple.transparencyd";
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTAPSConnection apsConnection](v8, "apsConnection"));
    [v22 _setEnabledTopics:v21];

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[KTAPSConnection setReceivers:](v8, "setReceivers:", v23);

    v24 = v8;
  }

  return v8;
}

- (void)registerPushReceiver:(id)a3
{
  id v4 = a3;
  id location = 0LL;
  objc_initWeak(&location, self);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTAPSConnection queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001A1FC8;
  v7[3] = &unk_100276C18;
  objc_copyWeak(&v10, &location);
  id v8 = v4;
  dispatch_queue_attr_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  id v7 = [v6 copy];

  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[KTAPSConnection log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 token]);
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "didReceiveIncomingMessage: %@: userInfo: %@",  buf,  0x16u);
  }

  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTAPSConnection queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A2220;
  block[3] = &unk_100279558;
  block[4] = self;
  id v14 = v5;
  id v15 = v7;
  id v11 = v7;
  id v12 = v5;
  dispatch_async(v10, block);
}

- (NSString)namedDelegatePort
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setNamedDelegatePort:(id)a3
{
}

- (APSConnection)apsConnection
{
  return (APSConnection *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setApsConnection:(id)a3
{
}

- (NSMutableArray)receivers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setReceivers:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)deliveryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDeliveryQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end