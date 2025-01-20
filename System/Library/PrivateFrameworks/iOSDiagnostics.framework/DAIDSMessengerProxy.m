@interface DAIDSMessengerProxy
+ (id)allowedDataClasses;
- (DAIDSMessageReceiver)receiver;
- (DAIDSMessengerProxy)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)messageReceiverQueue;
- (id)_createXPCConnection;
- (void)availableDestinationsWithCompletion:(id)a3;
- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7;
- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8;
- (void)setConnection:(id)a3;
- (void)setMessageReceiverQueue:(id)a3;
- (void)setReceiver:(id)a3;
@end

@implementation DAIDSMessengerProxy

- (DAIDSMessengerProxy)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DAIDSMessengerProxy;
  v2 = -[DAIDSMessengerProxy init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Diagnostics.deviceMessageReceiverQueue", 0LL);
    messageReceiverQueue = v2->_messageReceiverQueue;
    v2->_messageReceiverQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[DAIDSMessengerProxy _createXPCConnection](v2, "_createXPCConnection"));
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v5;
  }

  return v2;
}

- (void)availableDestinationsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSMessengerProxy connection](self, "connection"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:&stru_1000186D8]);

  [v6 availableDestinationsWithCompletion:v4];
}

- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DAIDSMessengerProxy connection](self, "connection"));
  id v19 = (id)objc_claimAutoreleasedReturnValue([v18 remoteObjectProxyWithErrorHandler:&stru_1000186F8]);

  [v19 sendMessage:v17 data:v16 toDestination:v15 forceLocalDelivery:v9 expectsResponse:v8 response:v14];
}

- (void)receiveMessage:(id)a3 data:(id)a4 fromDestination:(id)a5 expectsResponse:(BOOL)a6 response:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DAIDSMessengerProxy messageReceiverQueue](self, "messageReceiverQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000075B0;
  v21[3] = &unk_100018720;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  BOOL v26 = a6;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, v21);
}

- (id)_createXPCConnection
{
  dispatch_queue_t v3 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.iosdiagnosticsd",  4096LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DAIDSMessageSender));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[DAIDSMessengerProxy allowedDataClasses](&OBJC_CLASS___DAIDSMessengerProxy, "allowedDataClasses"));
  [v4 setClasses:v5 forSelector:"sendMessage:data:toDestination:forceLocalDelivery:expectsResponse:response:" argumentIndex:1 ofReply:0];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[DAIDSMessengerProxy allowedDataClasses](&OBJC_CLASS___DAIDSMessengerProxy, "allowedDataClasses"));
  [v4 setClasses:v6 forSelector:"sendMessage:data:toDestination:forceLocalDelivery:expectsResponse:response:" argumentIndex:2 ofReply:1];

  v17[0] = objc_opt_class(&OBJC_CLASS___NSSet);
  v17[1] = objc_opt_class(&OBJC_CLASS___DAIDSDestination);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 2LL));
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
  [v4 setClasses:v8 forSelector:"availableDestinationsWithCompletion:" argumentIndex:0 ofReply:1];

  -[NSXPCConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", v4);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DAIDSMessageReceiver));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DAIDSMessengerProxy allowedDataClasses](&OBJC_CLASS___DAIDSMessengerProxy, "allowedDataClasses"));
  [v9 setClasses:v10 forSelector:"receiveMessage:data:fromDestination:expectsResponse:response:" argumentIndex:1 ofReply:0];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DAIDSMessengerProxy allowedDataClasses](&OBJC_CLASS___DAIDSMessengerProxy, "allowedDataClasses"));
  [v9 setClasses:v11 forSelector:"receiveMessage:data:fromDestination:expectsResponse:response:" argumentIndex:1 ofReply:1];

  -[NSXPCConnection setExportedInterface:](v3, "setExportedInterface:", v9);
  -[NSXPCConnection setExportedObject:](v3, "setExportedObject:", self);
  -[NSXPCConnection setInterruptionHandler:](v3, "setInterruptionHandler:", &stru_100018740);
  -[NSXPCConnection setInvalidationHandler:](v3, "setInvalidationHandler:", &stru_100018760);
  -[NSXPCConnection resume](v3, "resume");
  uint64_t v12 = DiagnosticLogHandleForCategory(8LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Created connection: %@", (uint8_t *)&v15, 0xCu);
  }

  return v3;
}

+ (id)allowedDataClasses
{
  if (qword_100022588 != -1) {
    dispatch_once(&qword_100022588, &stru_100018780);
  }
  return (id)qword_100022580;
}

- (DAIDSMessageReceiver)receiver
{
  return (DAIDSMessageReceiver *)objc_loadWeakRetained((id *)&self->_receiver);
}

- (void)setReceiver:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)messageReceiverQueue
{
  return self->_messageReceiverQueue;
}

- (void)setMessageReceiverQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end