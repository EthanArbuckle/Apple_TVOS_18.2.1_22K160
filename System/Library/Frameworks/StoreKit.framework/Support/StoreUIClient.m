@interface StoreUIClient
- (StoreUIClient)init;
- (void)dealloc;
- (void)presentAuthenticateRequest:(id)a3 withResultHandler:(id)a4;
- (void)presentDialogRequest:(id)a3 withResultHandler:(id)a4;
- (void)presentEngagementRequest:(id)a3 withResultHandler:(id)a4;
@end

@implementation StoreUIClient

- (StoreUIClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___StoreUIClient;
  v2 = -[StoreUIClient init](&v7, "init");
  if (v2)
  {
    v3 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.AppStoreDaemon.StoreUIService");
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___StoreUIServiceProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &stru_1002E8E00);
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &stru_1002E8E20);
    -[NSXPCConnection resume](v2->_connection, "resume");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StoreUIClient;
  -[StoreUIClient dealloc](&v3, "dealloc");
}

- (void)presentAuthenticateRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E640 != -1) {
    dispatch_once(&qword_10032E640, &stru_1002E8E90);
  }
  v8 = (void *)qword_10032E5F8;
  if (os_log_type_enabled((os_log_t)qword_10032E5F8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
    *(_DWORD *)buf = 138543618;
    v24 = v10;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Requesting UI service present authentication: %@",  buf,  0x16u);
  }

  connection = self->_connection;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000447EC;
  v20[3] = &unk_1002E7310;
  id v12 = v6;
  id v21 = v12;
  id v13 = v7;
  id v22 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connection,  "remoteObjectProxyWithErrorHandler:",  v20));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100044884;
  v17[3] = &unk_1002E8E48;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  [v14 presentAuthenticateRequest:v16 withResultHandler:v17];
}

- (void)presentDialogRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E640 != -1) {
    dispatch_once(&qword_10032E640, &stru_1002E8E90);
  }
  v8 = (void *)qword_10032E5F8;
  if (os_log_type_enabled((os_log_t)qword_10032E5F8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
    *(_DWORD *)buf = 138543618;
    v24 = v10;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Requesting UI service present dialog: %@",  buf,  0x16u);
  }

  connection = self->_connection;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100044BA8;
  v20[3] = &unk_1002E7310;
  id v12 = v6;
  id v21 = v12;
  id v13 = v7;
  id v22 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connection,  "remoteObjectProxyWithErrorHandler:",  v20));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100044C40;
  v17[3] = &unk_1002E7360;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  [v14 presentDialogRequest:v16 withResultHandler:v17];
}

- (void)presentEngagementRequest:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E640 != -1) {
    dispatch_once(&qword_10032E640, &stru_1002E8E90);
  }
  v8 = (void *)qword_10032E5F8;
  if (os_log_type_enabled((os_log_t)qword_10032E5F8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
    *(_DWORD *)buf = 138543618;
    v24 = v10;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Requesting UI service present engagement: %@",  buf,  0x16u);
  }

  connection = self->_connection;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100044F64;
  v20[3] = &unk_1002E7310;
  id v12 = v6;
  id v21 = v12;
  id v13 = v7;
  id v22 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connection,  "remoteObjectProxyWithErrorHandler:",  v20));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100044FFC;
  v17[3] = &unk_1002E8E70;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  [v14 presentEngagementRequest:v16 withResultHandler:v17];
}

- (void).cxx_destruct
{
}

@end